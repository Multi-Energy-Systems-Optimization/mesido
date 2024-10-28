from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.io.write_output import ScenarioOutput

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
    GoalProgrammingMixin,
)
from rtctools.util import run_optimization_problem

ns = {"fews": "http://www.wldelft.nl/fews", "pi": "http://www.wldelft.nl/fews/PI"}

WATT_TO_MEGA_WATT = 1.0e6
WATT_TO_KILO_WATT = 1.0e3


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


class MinimizeCostHeatGoal(Goal):
    priority = 2

    order = 1

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 1.0e4)
        self.source = source
        self.function_nominal = 1e0

    def function(self, optimization_problem, ensemble_member):
        try:
            state = optimization_problem.state(f"{self.source}.Heat_source")
        except KeyError:
            state = optimization_problem.state(
                f"{self.source}.Power_elec"
            )  # heatpumps are not yet in the variable_operational_costs in financial_mixin
        var_costs = optimization_problem.parameters(0)[
            f"{self.source}.variable_operational_cost_coefficient"
        ]
        return state * var_costs


class MinimizeATESStoredHeat(Goal):
    priority = 3

    order = 1

    def __init__(self, ates):
        self.target_max = 0.0
        self.function_range = (0.0, 1e2)
        self.ates = ates
        # self.function_nominal = 1e0

    def function(self, optimization_problem, ensemble_member):
        # return optimization_problem.state(f"{self.ates}.Stored_heat")/
        # optimization_problem.variable_nominal(f"{self.ates}.Stored_heat")
        return optimization_problem.extra_variable(
            f"{self.ates}__max_stored_heat"
        ) / optimization_problem.variable_nominal(f"{self.ates}__max_stored_heat")


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components.get("heat_demand"):
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        for s in [
            *self.energy_system_components.get("heat_source"),
            *self.energy_system_components.get("heat_pump"),
        ]:
            goals.append(MinimizeCostHeatGoal(s))

        # for ates in self.energy_system_components.get("ates", []):
        #     goals.append(MinimizeATESStored_heat(ates))

        return goals

    def goals(self):
        goals = super().goals().copy()

        # for ates in self.energy_system_components.get("ates", []):
        #     goals.append(MinimizeATESStored_heat(ates))

        return goals

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options["mip_rel_gap"] = 0.01
        # options["solver"] = "gurobi"
        # gurobi_options = options["gurobi"] = {}
        # gurobi_options["MIPgap"] = 0.01
        # gurobi_options["OptimalityTol"] = 1.e-3

        return options


class HeatProblem(
    ScenarioOutput,
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def path_goals(self):
        goals = super().path_goals().copy()

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.0001
        options["heat_loss_disconnected_pipe"] = (
            False  # required since we want to disconnect HP & HEX
        )
        self.heat_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS
        options["neglect_pipe_heat_losses"] = True
        options["include_ates_temperature_options"] = True
        return options

    def temperature_carriers(self):
        return self.esdl_carriers

    def temperature_regimes(self, carrier):
        temperatures = []
        if carrier == 41770304791669983859190:
            # supply
            # temperatures = np.linspace(50, 70, 9).tolist()[::-1]
            # temperatures = np.linspace(52.5, 65, 6).tolist()[::-1]
            # temperatures.extend(np.linspace(45, 50, 6).tolist()[::-1])

            temperatures = np.linspace(40, 70, 7).tolist()[::-1]

        return temperatures

    def path_constraints(self, ensemble_member):
        constraints = super().path_constraints(ensemble_member)

        # To prevent heat being consumer by hex to upgrade it (add heat) by heatpump to match
        # demand without loading/unloading ates.
        sum_disabled_vars = 0
        for asset in [
            *self.energy_system_components.get("heat_pump"),
            *self.energy_system_components.get("heat_exchanger"),
        ]:
            disabled_var = self.state(f"{asset}__disabled")
            sum_disabled_vars += disabled_var

        constraints.append((sum_disabled_vars, 1.0, 2.0))

        # when using compound asset instead of separate assets, one could still use this constraint
        # but potentially add the constraint that if hex is enabled, ates is loading and if hp is
        # enabled ates is unloading (dis_hex-ates_charging, 0.0, 0.0)

        return constraints

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        for a in self.energy_system_components.get("ates", []):
            stored_heat = self.state_vector(f"{a}.Stored_heat")
            heat_ates = self.state_vector(f"{a}.Heat_ates")
            constraints.append((stored_heat[0] - stored_heat[-1], 0.0, 0.0))
            # stored_volume only to be used if temperature loss ates is also dependent on
            # stored_volume instead of stored_heat
            constraints.append((heat_ates[0], 0.0, 0.0))
            ates_temperature_disc = self.__state_vector_scaled(
                f"{a}__temperature_ates_disc", ensemble_member
            )
            constraints.append(((ates_temperature_disc[-1] - ates_temperature_disc[0]), 0.0, 0.0))

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

    def read(self):
        """
        Reads the yearly profile with hourly time steps and adapt to a 5 day averaged profile.
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

            # TODO: check if ordering is possible for ates temperature over time
            day_step = 28

            nr_of_days = len(total_demand) // (24 * day_step)
            new_date_times = list()
            for day in range(0, nr_of_days):
                new_date_times.append(self.io.datetimes[day * 24 * day_step])
            new_date_times = np.asarray(new_date_times)

            for demand in demands:
                var_name = f"{demand}.target_heat_demand"
                data = self.get_timeseries(
                    variable=var_name, ensemble_member=ensemble_member
                ).values
                new_data = list()
                for day in range(0, nr_of_days):
                    data_for_day = data[day * 24 * day_step : (day + 1) * 24 * day_step]
                    new_data.append(np.mean(data_for_day))
                new_datastore.set_timeseries(
                    variable=var_name,
                    datetimes=new_date_times,
                    values=np.asarray(new_data) * 2.0,
                    ensemble_member=ensemble_member,
                    check_duplicates=True,
                )

            self.io = new_datastore

    # def _get_runinfo_path_root(self):
    #     runinfo_path = Path(self.esdl_run_info_path).resolve()
    #     tree = ET.parse(runinfo_path)
    #     return tree.getroot()

    # def post(self):
    #    root = self._get_runinfo_path_root()
    #    workdir = os.path.join(os.path.dirname(os.getcwd()), 'output')
    #    super().post()
    #    results = self.extract_results()
    #    parameters = self.parameters(0)
    #    bounds = self.bounds()
    #    parameters_dict = dict()
    #
    #    parameter_path = os.path.join(workdir, "parameters.json")
    #    for key, value in parameters.items():
    #        new_value = value  # [x for x in value]
    #        parameters_dict[key] = new_value
    #    if parameter_path is None:
    #        workdir = root.findtext("pi:workDir", namespaces=ns)
    #        parameter_path = os.path.join(workdir, "parameters.json")
    #        if not Path(workdir).is_absolute():
    #            parameter_path = Path(workdir).resolve().parent
    #            parameter_path = os.path.join(parameter_path.__str__() + "parameters.json")
    #    with open(parameter_path, "w") as file:
    #        json.dump(parameters_dict, fp=file)
    #
    #    root = self._get_runinfo_path_root()
    #    bounds_dict = dict()
    #    bounds_path = root.findtext("pi:outputResultsFile", namespaces=ns)
    #    bounds_path = os.path.join(workdir, "bounds.json")
    #    for key, value in bounds.items():
    #        if "Stored_heat" not in key:
    #            new_value = value  # [x for x in value]
    #            # if len(new_value) == 1:
    #            #     new_value = new_value[0]
    #            bounds_dict[key] = new_value
    #    if bounds_path is None:
    #        workdir = root.findtext("pi:workDir", namespaces=ns)
    #        bounds_path = os.path.join(workdir, "bounds.json")
    #        if not Path(workdir).is_absolute():
    #            bounds_path = Path(workdir).resolve().parent
    #            bounds_path = os.path.join(bounds_path.__str__() + "bounds.json")
    #    with open(bounds_path, "w") as file:
    #        json.dump(bounds_dict, fp=file)
    #
    #    root = self._get_runinfo_path_root()
    #    results_path = root.findtext("pi:outputResultsFile", namespaces=ns)
    #    results_dict = dict()
    #
    #    for key, values in results.items():
    #        new_value = values.tolist()
    #        if len(new_value) == 1:
    #            new_value = new_value[0]
    #        results_dict[key] = new_value
    #
    #    results_path = os.path.join(workdir, "results.json")
    #    if results_path is None:
    #        workdir = root.findtext("pi:workDir", namespaces=ns)
    #        results_path = os.path.join(workdir, "results.json")
    #        if not Path(workdir).is_absolute():
    #            results_path = Path(workdir).resolve().parent
    #            results_path = os.path.join(results_path.__str__() + "results.json")
    #    with open(results_path, "w") as file:
    #        json.dump(results_dict, fp=file)


class HeatProblemMaxFlow(HeatProblem):
    def read(self):
        super().read()

        demand_timeseries = self.get_timeseries("HeatingDemand_1.target_heat_demand")
        demand_timeseries.values[2] = demand_timeseries.values[2] * 2
        self.set_timeseries("HeatingDemand_1.target_heat_demand", demand_timeseries)


if __name__ == "__main__":
    import time

    t0 = time.time()

    sol = run_optimization_problem(
        HeatProblem,
        esdl_file_name="HP_ATES with return network.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="Warmte_test_3.csv",
    )
    # sol._write_updated_esdl()
    results = sol.extract_results()
    print(f"time: {time.time() - t0}")
    a = 1
