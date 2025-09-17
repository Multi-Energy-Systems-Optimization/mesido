import esdl
import numpy as np
from rtctools.optimization.collocated_integrated_optimization_problem import \
    CollocatedIntegratedOptimizationProblem
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import \
    LinearizedOrderGoalProgrammingMixin
from rtctools.optimization.single_pass_goal_programming_mixin import (
    CachingQPSol, SinglePassGoalProgrammingMixin)
from rtctools.util import run_optimization_problem

from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_profile_averages_timestep_size,
    adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day)


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

        adapt_hourly_profile_averages_timestep_size(self, 5 * 24)


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
        options["neglect_pipe_heat_losses"] = True

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
            inv_made = self.__state_vector_scaled(
                f"{s}__cumulative_investments_made_in_eur", ensemble_member
            )
            nominal = self.variable_nominal(f"{s}__cumulative_investments_made_in_eur")
            inv_cap = 2.5e5
            constraints.append((inv_made[0] / nominal, 0.0, 200000.0))
            for i in range(1, len(self.times())):
                constraints.append(
                    (((inv_made[i] - inv_made[i - 1]) * nominal - inv_cap) / nominal, -np.inf, 0.0)
                )

        # to avoid ates in short problem
        for a in self.energy_system_components.get("ates", []):
            heat_ates = self.state_vector(f"{a}.Heat_ates")
            constraints.append((heat_ates, 0.0, 0.0))

        return constraints

    def __state_vector_scaled(self, variable, ensemble_member):
        """
        This functions returns the casadi symbols scaled with their nominal for the entire time
        horizon.
        """
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )

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

        return options

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        for a in self.energy_system_components.get("ates", []):
            stored_heat = self.state_vector(f"{a}.Stored_heat")
            constraints.append((stored_heat[0] - stored_heat[-1], 0.0, 0.0))

        return constraints

    def read(self):
        """
        Reads the yearly profile with hourly time steps and adapt to a daily averaged profile
        except for the day with the peak demand.
        """
        super().read()

        (
            self.__indx_max_peak,
            self.__heat_demand_nominal,
            self.__cold_demand_nominal,
        ) = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(
            self,
            10,
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
