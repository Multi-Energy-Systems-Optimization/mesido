from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.pipe_class import PipeClass
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import (
    Goal,
)
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
        self.function_range = (0.0, 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class MinimizeLDGoal(Goal):
    priority = 2

    order = 1

    def function(self, optimization_problem, ensemble_member):
        obj = 0.0
        parameters = optimization_problem.parameters(ensemble_member)
        nominal = 0.0

        for p in optimization_problem.hot_pipes:
            length = parameters[f"{p}.length"]
            var_name = optimization_problem.pipe_diameter_symbol_name(p)

            nominal += length * optimization_problem.variable_nominal(var_name)

            obj += optimization_problem.extra_variable(var_name, ensemble_member) * length

        return obj / nominal


class PipeDiameterSizingProblem(
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.001
        options["heat_loss_disconnected_pipe"] = True
        options["maximum_temperature_der"] = np.inf
        self.heat_network_settings["minimize_head_losses"] = True
        return options

    def pipe_classes(self, pipe):
        return [
            PipeClass("None", 0.0, 0.0, (0.0, 0.0), 0.0),
            PipeClass("DN40", 0.0431, 1.5, (0.179091, 0.005049), 1.0),
            PipeClass("DN50", 0.0545, 1.7, (0.201377, 0.006086), 2.0),
            PipeClass("DN65", 0.0703, 1.9, (0.227114, 0.007300), 3.0),
            PipeClass("DN80", 0.0825, 2.2, (0.238244, 0.007611), 4.0),
            PipeClass("DN100", 0.1071, 2.4, (0.247804, 0.007386), 5.0),
            PipeClass("DN125", 0.1325, 2.6, (0.287779, 0.009431), 6.0),
            PipeClass("DN150", 0.1603, 2.8, (0.328592, 0.011567), 7.0),
            PipeClass("DN200", 0.2101, 3.0, (0.346285, 0.011215), 8.0),
            PipeClass("DN250", 0.263, 3.0, (0.334606, 0.009037), 9.0),
            PipeClass("DN300", 0.3127, 3.0, (0.384640, 0.011141), 10.0),
            PipeClass("DN350", 0.3444, 3.0, (0.368061, 0.009447), 11.0),
            PipeClass("DN400", 0.3938, 3.0, (0.381603, 0.009349), 12.0),
            PipeClass("DN450", 0.4444, 3.0, (0.380070, 0.008506), 13.0),
            PipeClass("DN500", 0.4954, 3.0, (0.369282, 0.007349), 14.0),
            PipeClass("DN600", 0.5954, 3.0, (0.431023, 0.009155), 15.0),
        ]

    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals

    def goals(self):
        goals = super().goals().copy()
        goals.append(MinimizeLDGoal())
        return goals

    def priority_completed(self, priority):
        super().priority_completed(priority)

    def solver_options(self):
        options = super().solver_options()
        self._qpsol = CachingQPSol()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "highs"
        return options


class PipeDiameterSizingProblemTvar(PipeDiameterSizingProblem):
    def temperature_carriers(self):
        return self.esdl_carriers  # geeft terug de carriers met multiple temperature options

    def solver_options(self):
        options = super().solver_options()
        options["hot_start"] = getattr(self, "_hot_start", True)
        return options

    def temperature_regimes(self, carrier):
        temperatures = []
        if carrier == 761602374459208051248:
            # supply
            temperatures = [70.0, 90.0]

        if carrier == 761602374459208051248000:
            # return
            temperatures = [30.0, 40.0]

        return temperatures

    # def constraints(self, ensemble_member):
    #     constraints = super().constraints(ensemble_member)
    #     # These constraints are added to allow for a quicker solve
    #     for carrier, temperatures in self.temperature_carriers().items():
    #         number_list = [int(s) for s in carrier if s.isdigit()]
    #         number = ""
    #         for nr in number_list:
    #             number = number + str(nr)
    #         carrier_type = temperatures["__rtc_type"]
    #         if carrier_type == "return":
    #             number = number + "000"
    #         carrier_id_number_mapping = number
    #         temperature_regimes = self.temperature_regimes(int(carrier_id_number_mapping))
    #         if len(temperature_regimes) > 0:
    #             for temperature in temperature_regimes:
    #                 selected_temp_vec = self.state_vector(
    #                     f"{int(carrier_id_number_mapping)}__{carrier_type}_{temperature}"
    #                 )
    #                 for i in range(1, len(self.times())):
    #                     constraints.append(
    #                         (selected_temp_vec[i] - selected_temp_vec[i - 1], 0.0, 0.0)
    #                     )
    #
    #     return constraints


if __name__ == "__main__":
    import time

    start_time = time.time()

    heat_problem = run_optimization_problem(
        PipeDiameterSizingProblem,
        esdl_file_name="2a.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.xml",
    )
    results = heat_problem.extract_results()
    print("Q: ", results["Pipe_2927_ret.HeatIn.Q"])
    print("Heat: ", results["Pipe_2927_ret.HeatIn.Heat"])

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
