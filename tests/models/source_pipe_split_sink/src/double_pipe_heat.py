from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.techno_economic_mixin import TechnoEconomicMixin

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

    def __init__(self, state, target):
        self.state = state

        self.target_min = target
        self.target_max = target
        self.function_range = (0.0, 2e5)
        self.function_nominal = 1e5

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class MinimizeProduction(Goal):
    priority = 2

    order = 1

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state("source.Heat_source")


class SourcePipeSink(
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def path_goals(self):
        goals = super().path_goals().copy()

        for c in self.energy_system_components.get("heat_demand", []):
            target = self.get_timeseries(f"{c}.target_heat_demand")
            state = f"{c}.Heat_demand"
            goals.append(TargetDemandGoal(state, target))

        return goals

    def post(self):
        super().post()


if __name__ == "__main__":
    heat_problem = run_optimization_problem(SourcePipeSink)
