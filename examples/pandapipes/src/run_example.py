from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.io.write_output import ScenarioOutput


from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import SinglePassGoalProgrammingMixin
from rtctools.util import run_optimization_problem


class TargetDemandGoal(Goal):
    priority = 1

    order = 2

    def __init__(self, optimization_problem):
        self.target_min = optimization_problem.get_timeseries("demand_1.target_heat_demand")
        self.target_max = optimization_problem.get_timeseries("demand_1.target_heat_demand")
        self.function_range = (0.0, 60e6)
        self.function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state("demand_1.Heat_demand")


class MinimizeProduction(Goal):
    priority = 2

    order = 1

    def __init__(self):
        self.function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        sum = 0
        for source in optimization_problem.energy_system_components.get("heat_source", []):
            sum = optimization_problem.state(f"{source}.Heat_source")
        return sum


class SourcePipeSink(
    ScenarioOutput,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def path_goals(self):
        g = super().path_goals().copy()
        g.append(TargetDemandGoal(self))
        g.append(MinimizeProduction())
        return g

    def post(self):
        super().post()


class HeatProblemHydraulic(SourcePipeSink):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.heat_network_settings["head_loss_option"] = (
            HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
        )
        self.heat_network_settings["n_linearization_lines"] = 3
        self.heat_network_settings["minimize_head_losses"] = True

    def energy_system_options(self):
        options = super().energy_system_options()

        return options

    def solver_options(self):
        options = super().solver_options()
        # options["solver"] = "gurobi"

        return options


if __name__ == "__main__":
    solution = run_optimization_problem(
        HeatProblemHydraulic,
        esdl_file_name="Test_Tree_S1C1.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_constant.csv",
    )
    results = solution.extract_results()

    # mdata_points = 10
    # print("dP, bar")
    # print(-results[f"Pipe1.dH"] * 988.0 * 9.81 / 100e3)  # pressure in bar
    # print(-results[f"Pipe1_ret.dH"] * 988.0 * 9.81 / 100e3)  # pressure in bar

    # print("dP, kPa")
    # print(-results[f"Pipe1.dH"] * 988.0 * 9.81 / 1e3)  # kPa
    # print(-results[f"Pipe1_ret.dH"] * 988.0 * 9.81 / 1e3)  # kPa

    # print("dH, m")
    # print(-results[f"Pipe1.dH"])  # m
    # print(-results[f"Pipe1_ret.dH"])  # m

    # print("mass flow, kg/s")
    # print(results[f"Pipe1.Q"][0:mdata_points] * 988.0)

    # print("v, m/s")
    # print(results[f"Pipe1.Q"][0:mdata_points] / solution.parameters(0)[f"Pipe1.area"])
    # print(results[f"Pipe1_ret.Q"][0:mdata_points] / solution.parameters(0)[f"Pipe1_ret.area"])

    # print("dHP, W")
    # print(results["Pipe1_ret.Hydraulic_power"][0:mdata_points])

    # a = 1
