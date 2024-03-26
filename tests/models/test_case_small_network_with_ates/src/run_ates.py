import datetime

import esdl

from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.data.storage import DataStore
from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import (
    CachingQPSol,
    SinglePassGoalProgrammingMixin,
)
from rtctools.util import run_optimization_problem


class TargetDemandGoal(Goal):
    priority = 1

    order = 2

    def __init__(self, state, target):
        self.state = state

        self.target_min = target
        self.target_max = target
        self.function_range = (-1.0, 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class MinimizeSourcesHeatGoal(Goal):
    priority = 2

    order = 2

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 10e8)
        self.source = source
        self.function_nominal = 1e7

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Heat_source")


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesHeatGoal(s))

        return goals

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        return options


class HeatProblem(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    This problem is used to test the logic of networks including an ATES.
    """

    def __init__(self, *args, **kwargs):
        """
        We instantiate some attributes.
        """
        super().__init__(*args, **kwargs)

        # variables for solver settings
        self._qpsol = None

    def pre(self):
        """
        We use the CachingQPSol to speed up the solver.

        Returns
        -------
        None
        """
        super().pre()
        self._qpsol = CachingQPSol()

    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.0001
        return options

    def solver_options(self):
        """
        Setting the option to catch the Jacobian to speed up the transcribing.

        Returns
        -------
        Dict of solver options
        """
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        return options

    def constraints(self, ensemble_member: int):
        """
        We add constraints for cyclic behaviour of the ATES.

        Parameters
        ----------
        ensemble_member : int of the esemble member

        Returns
        -------
        Extended constraints
        """
        constraints = super().constraints(ensemble_member)

        for a in self.energy_system_components.get("ates", []):
            stored_heat = self.state_vector(f"{a}.Stored_heat")
            heat_ates = self.state_vector(f"{a}.Heat_ates")
            constraints.append((stored_heat[0] - stored_heat[-1], 0.0, 0.0))
            constraints.append((heat_ates[0], 0.0, 0.0))

        return constraints

    def read(self):
        """
        Reads the yearly profile with hourly time steps and adapt to a daily averaged profile.
        """
        super().read()

        demands = self.energy_system_components.get("heat_demand", [])
        new_datastore = DataStore(self)
        new_datastore.reference_datetime = self.io.datetimes[0]

        for ensemble_member in range(self.ensemble_size):
            total_demand = sum(
                self.get_timeseries(f"{demand}.target_heat_demand", ensemble_member).values
                for demand in demands
            )

            # TODO: the approach of picking one peak day was introduced for a network with a tree
            #  layout and all big sources situated at the root of the tree. It is not guaranteed
            #  that an optimal solution is reached in different network topologies.
            nr_of_days = len(total_demand) // (24 * 5)
            new_date_times = list()
            for day in range(nr_of_days):
                new_date_times.append(self.io.datetimes[day * 24])
            new_date_times = np.asarray(new_date_times)

            for demand in demands:
                var_name = f"{demand}.target_heat_demand"
                data = self.get_timeseries(
                    variable=var_name, ensemble_member=ensemble_member
                ).values
                new_data = list()
                for day in range(nr_of_days):
                    data_for_day = data[day * 24 : (day + 1) * 24]
                    new_data.append(np.mean(data_for_day))
                new_datastore.set_timeseries(
                    variable=var_name,
                    datetimes=new_date_times,
                    values=np.asarray(new_data),
                    ensemble_member=ensemble_member,
                    check_duplicates=True,
                )

            self.io = new_datastore


class HeatProblemPlacingOverTime(HeatProblem):
    """
    This problem is defined to test the asset_is_realized variable with constraints. This is
    achieved by having an upper limit on the investment per time-step.
    """

    def energy_system_options(self):
        """
        In this problem we are optimizing when the assets are realized over time, hence we set the
        inclusion of asset_is_realized variables and constraints to true.

        Returns
        -------
        dict with the adapted network options
        """
        options = super().energy_system_options()
        options["include_asset_is_realized"] = True

        return options

    @property
    def esdl_assets(self):
        """
        In this problem we want the milp producers to be optional so that the asset_is_realized
        variables are generated for them, thus we adapt the esdl assets here to avoid the need
        of an extra esdl file.

        Returns
        -------

        The adapted assets.
        """
        assets = super().esdl_assets

        asset = next(a for a in assets.values() if a.name == "HeatProducer_1")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "HeatProducer_2")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset.attributes["power"] = 20.0e6

        return assets

    def constraints(self, ensemble_member):
        """
        Here we add constraints to limit the investment that one can have per timestep. This is to
        prevent that infinite investments can be done immediately and hence avoid that all assets
        can be realized at t=0.

        Parameters
        ----------
        ensemble_member : integer with the esemble member

        Returns
        -------
        The extended constraints
        """
        constraints = super().constraints(ensemble_member)

        # Constraints for investment speed, please note that we need to enforce index 0 to be 0.
        for s in self.energy_system_components.get("heat_source", []):
            inv_made = self.state_vector(f"{s}__cumulative_investments_made_in_eur")
            nominal = self.variable_nominal(f"{s}__cumulative_investments_made_in_eur")
            inv_cap = 2.5e5
            constraints.append((inv_made[0], 0.0, 0.0))
            for i in range(1, len(self.times())):
                constraints.append(
                    (((inv_made[i] - inv_made[i - 1]) * nominal - inv_cap) / nominal, -np.inf, 0.0)
                )

        # to avoid ates in short problem
        for a in self.energy_system_components.get("ates", []):
            heat_ates = self.state_vector(f"{a}.Heat_ates")
            constraints.append((heat_ates, 0.0, 0.0))

        return constraints

    def times(self, variable=None):
        """
        For the purposes of this test we take only 25 timesteps to speed up the test.

        Parameters
        ----------
        variable : name of the variable.

        Returns
        -------
        The shortened times.
        """
        return super().times(variable)[:25]


class HeatProblemSetPoints(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.0
        return options

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options["mip_rel_gap"] = 0.02
        highs_options["mip_abs_gap"] = 0.01

        return options

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        for a in self.energy_system_components.get("ates", []):
            stored_heat = self.state_vector(f"{a}.Stored_heat")
            constraints.append((stored_heat[0] - stored_heat[-1], 0.0, 0.0))

        return constraints

    # TODO: place this and the _set_data_with_averages_and_peak_day function in an appropriate place
    #  in the rtctools-milp-network package. Should have a unit test.
    def read(self):
        """
        Reads the yearly profile with hourly time steps and adapt to a daily averaged profile
        except for the day with the peak demand.
        """
        super().read()

        demands = self.energy_system_components.get("heat_demand", [])
        new_datastore = DataStore(self)
        new_datastore.reference_datetime = self.io.datetimes[0]

        for ensemble_member in range(self.ensemble_size):
            parameters = self.parameters(ensemble_member)

            total_demand = None
            for demand in demands:
                try:
                    demand_values = self.get_timeseries(
                        f"{demand}.target_heat_demand", ensemble_member
                    ).values
                except KeyError:
                    continue
                if total_demand is None:
                    total_demand = demand_values
                else:
                    total_demand += demand_values

            # TODO: the approach of picking one peak day was introduced for a network with a tree
            #  layout and all big sources situated at the root of the tree. It is not guaranteed
            #  that an optimal solution is reached in different network topologies.
            idx_max = int(np.argmax(total_demand))
            max_day = idx_max // 24
            nr_of_days = len(total_demand) // 24
            new_date_times = list()
            day_steps = 5

            self.__indx_max_peak = max_day // day_steps
            if max_day % day_steps > 0:
                self.__indx_max_peak += 1.0

            for day in range(0, nr_of_days, day_steps):
                if day == max_day // day_steps * day_steps:
                    if max_day > day:
                        new_date_times.append(self.io.datetimes[day * 24])
                    new_date_times.extend(self.io.datetimes[max_day * 24 : max_day * 24 + 24])
                    if (day + day_steps - 1) > max_day:
                        new_date_times.append(self.io.datetimes[max_day * 24 + 24])
                    # if day == nr_of_days - day_steps:
                    #     new_date_times.append(self.io.datetimes[-1] + datetime.timedelta(hours=1))
                else:
                    new_date_times.append(self.io.datetimes[day * 24])
                    # if day == nr_of_days - day_steps:
            new_date_times.append(self.io.datetimes[-1] + datetime.timedelta(hours=1))

            new_date_times = np.asarray(new_date_times)
            parameters["times"] = [x.timestamp() for x in new_date_times]

            for demand in demands:
                var_name = f"{demand}.target_heat_demand"
                self._set_data_with_averages_and_peak_day(
                    datastore=new_datastore,
                    variable_name=var_name,
                    ensemble_member=ensemble_member,
                    new_date_times=new_date_times,
                )

            # TODO: this has not been tested but is required if a production profile is included
            #  in the data
            for source in self.energy_system_components.get("heat_source", []):
                try:
                    self.get_timeseries(f"{source}.target_heat_source_year", ensemble_member)
                except KeyError:
                    continue
                var_name = f"{source}.target_heat_source_year"
                self._set_data_with_averages_and_peak_day(
                    datastore=new_datastore,
                    variable_name=var_name,
                    ensemble_member=ensemble_member,
                    new_date_times=new_date_times,
                )

        self.io = new_datastore

    def _set_data_with_averages_and_peak_day(
        self,
        datastore: DataStore,
        variable_name: str,
        ensemble_member: int,
        new_date_times: np.array,
    ):
        try:
            data = self.get_timeseries(variable=variable_name, ensemble_member=ensemble_member)
        except KeyError:
            datastore.set_timeseries(
                variable=variable_name,
                datetimes=new_date_times,
                values=np.asarray([0.0] * len(new_date_times)),
                ensemble_member=ensemble_member,
                check_duplicates=True,
            )
            return

        new_data = list()
        data_timestamps = data.times
        data_datetimes = [
            self.io.datetimes[0] + datetime.timedelta(seconds=s) for s in data_timestamps
        ]
        assert new_date_times[0] == data_datetimes[0]
        data_values = data.values

        values_for_mean = [0.0]
        for dt, val in zip(data_datetimes, data_values):
            if dt in new_date_times:
                new_data.append(np.mean(values_for_mean))
                values_for_mean = [val]
            else:
                values_for_mean.append(val)

        # last datetime is not in input data, so we need to take the mean of the last bit
        new_data.append(np.mean(values_for_mean))

        datastore.set_timeseries(
            variable=variable_name,
            datetimes=new_date_times,
            values=np.asarray(new_data),
            ensemble_member=ensemble_member,
            check_duplicates=True,
        )


if __name__ == "__main__":
    sol = run_optimization_problem(
        HeatProblemPlacingOverTime,
        esdl_file_name="test_case_small_network_with_ates.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="Warmte_test.csv",
    )
    results = sol.extract_results()
