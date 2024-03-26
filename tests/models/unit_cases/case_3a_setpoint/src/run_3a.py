from mesido.esdl.esdl_additional_vars_mixin import ESDLAdditionalVarsMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
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


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        # highs_options = options["highs"] = {}
        # highs_options["mip_rel_gap"] = 0.0025
        # options["gurobi"] = gurobi_options = {}
        # gurobi_options["MIPgap"] = 0.001
        return options

    def heat_network_options(self):
        options = super().heat_network_options()
        options["minimum_velocity"] = 0.0001
        # options["heat_loss_disconnected_pipe"] = False
        # options["neglect_pipe_heat_losses"] = False
        return options


class HeatProblem(
    _GoalsAndOptions,
    ESDLAdditionalVarsMixin,
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
        # highs_options = options["highs"] = {}
        # highs_options["mip_rel_gap"] = 0.0025
        # options["gurobi"] = gurobi_options = {}
        # gurobi_options["MIPgap"] = 0.0001
        return options


if __name__ == "__main__":
    from rtctools.util import run_optimization_problem

    sol = run_optimization_problem(HeatProblem)

    results = sol.extract_results()
    print(results["GeothermalSource_b702.Heat_source"])

    a = 1
