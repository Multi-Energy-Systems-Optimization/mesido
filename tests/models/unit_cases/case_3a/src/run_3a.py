from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.physics_mixin import PhysicsMixin
from mesido.qth_not_maintained.qth_mixin import QTHMixin
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.homotopy_mixin import HomotopyMixin
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import SinglePassGoalProgrammingMixin


class TargetDemandGoal(Goal):
    priority = 1

    order = 2

    def __init__(self, state, target):
        self.state = state

        self.target_min = target
        self.target_max = target
        self.function_range = (0.0, 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class ConstantGeothermalSource(Goal):
    priority = 2

    order = 2

    def __init__(self, optimization_problem, source, target, lower_fac=0.9, upper_fac=1.1):
        self.target_min = lower_fac * target
        self.target_max = upper_fac * target
        self.function_range = (0.0, 2.0 * target)
        self.state = f"{source}.Q"
        self.function_nominal = optimization_problem.variable_nominal(self.state)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class MinimizeSourcesHeatGoal(Goal):
    priority = 3

    order = 1

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 10e6)
        self.source = source
        self.function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Heat_source")


class MinimizeSourcesFlowGoal(Goal):
    priority = 4

    order = 2

    def __init__(self, source, nominal=1.0):
        self.target_max = 0.0
        self.function_range = (0.0, 1.0e3)
        self.source = source
        self.function_nominal = nominal

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Q") * 1.0e3


class MinimizeSourcesQTHGoal(Goal):
    priority = 3

    order = 2

    def __init__(self, source):
        self.source = source
        self.function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Heat_source")


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        # for s in self.energy_system_components["heat_source"]:
        #     try:
        #         target_flow_rate = parameters[f"{s}.target_flow_rate"]
        #         goals.append(ConstantGeothermalSource(self, s, target_flow_rate))
        #     except KeyError:
        #         pass

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.0001
        # options["heat_loss_disconnected_pipe"] = False
        # options["neglect_pipe_heat_losses"] = False
        return options


class HeatProblem(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesHeatGoal(s))

        return goals

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options["mip_rel_gap"] = 0.005
        # options["gurobi"] = gurobi_options = {}
        # gurobi_options["MIPgap"] = 0.0001
        return options

    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.0001
        # options["heat_loss_disconnected_pipe"] = False
        options["neglect_pipe_heat_losses"] = True
        return options


class HeatProblemSetPointConstraints(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesHeatGoal(s))

        return goals

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        return options


class HeatProblemTvarsup(
    _GoalsAndOptions,
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesHeatGoal(s))

        return goals

    def temperature_carriers(self):
        return self.esdl_carriers  # geeft terug de carriers met multiple temperature options

    def temperature_regimes(self, carrier):
        temperatures = []
        if carrier == 4195016129475469474608:
            # supply
            temperatures = [80.0, 120.0]

        return temperatures

    def times(self, variable=None):
        times = super().times(variable)
        return times[:2]

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)
        # These constraints are added to allow for a quicker solve
        for _carrier, temperatures in self.temperature_carriers().items():
            carrier_id_number_mapping = str(temperatures["id_number_mapping"])
            temperature_regimes = self.temperature_regimes(int(carrier_id_number_mapping))
            if len(temperature_regimes) > 0:
                for temperature in temperature_regimes:
                    selected_temp_vec = self.state_vector(
                        f"{int(carrier_id_number_mapping)}_{temperature}"
                    )
                    for i in range(1, len(self.times())):
                        constraints.append(
                            (selected_temp_vec[i] - selected_temp_vec[i - 1], 0.0, 0.0)
                        )

        return constraints


class HeatProblemTvarret(
    _GoalsAndOptions,
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesFlowGoal(s))

        return goals

    def temperature_carriers(self):
        return self.esdl_carriers  # geeft terug de carriers met multiple temperature options

    def temperature_regimes(self, carrier):
        temperatures = []
        if carrier == 4195016129475469474608000:
            # return
            temperatures = [30.0, 40.0]

        return temperatures

    def times(self, variable=None):
        times = super().times(variable)
        return times[:2]

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)
        # These constraints are added to allow for a quicker solve
        for carrier, temperatures in self.temperature_carriers().items():
            if "id_number_mapping" in temperatures.keys():
                carrier_id_number_mapping = str(temperatures["id_number_mapping"])
            else:
                number_list = [int(s) for s in carrier if s.isdigit()]
                number = ""
                for nr in number_list:
                    number = number + str(nr)
                carrier_type = temperatures["__rtc_type"]
                if carrier_type == "return":
                    number = number + "000"
                carrier_id_number_mapping = number
            temperature_regimes = self.temperature_regimes(int(carrier_id_number_mapping))
            if len(temperature_regimes) > 0:
                for temperature in temperature_regimes:
                    selected_temp_vec = self.state_vector(
                        f"{int(carrier_id_number_mapping)}_{temperature}"
                    )
                    for i in range(1, len(self.times())):
                        constraints.append(
                            (selected_temp_vec[i] - selected_temp_vec[i - 1], 0.0, 0.0)
                        )

        return constraints


class HeatProblemProdProfile(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def read(self):
        super().read()

        for s in self.energy_system_components["heat_source"]:
            demand_timeseries = self.get_timeseries("HeatingDemand_a3b8.target_heat_demand")
            new_timeseries = np.ones(len(demand_timeseries.values)) * 1
            ind_hlf = int(len(demand_timeseries.values) / 2)
            new_timeseries[ind_hlf : ind_hlf + 4] = np.ones(4) * 0.10
            self.set_timeseries(f"{s}.maximum_heat_source", new_timeseries)

    def energy_system_options(self):
        options = super().energy_system_options()
        options["heat_loss_disconnected_pipe"] = True

        return options

    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesHeatGoal(s))

        return goals


class QTHProblem(
    QTHMixin,
    HomotopyMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesQTHGoal(s))

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        from mesido.head_loss_class import HeadLossOption

        self.heat_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS
        return options


if __name__ == "__main__":
    from rtctools.util import run_optimization_problem

    sol = run_optimization_problem(
        HeatProblem,
        esdl_file_name="3a.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.xml",
    )
    # sol = run_optimization_problem(
    #     HeatProblemSetPointConstraints, **{"timed_setpoints": {"GeothermalSource_b702": (45, 0)}}
    # )
    results = sol.extract_results()
    # import matplotlib.pyplot as plt
    #
    # plt.figure()
    # plt.plot(results["HeatStorage_4b0c.Heat_buffer"])
    # plt.figure()
    # plt.plot(results["HeatStorage_4b0c.Stored_heat"])
    # plt.show()
    a = 1
    # run_heat_network_optimization(HeatProblem, QTHProblem)
