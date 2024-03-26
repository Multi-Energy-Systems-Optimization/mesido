from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.heat_mixin import HeatMixin
from mesido.qth_mixin import QTHMixin
from mesido.util import run_heat_network_optimization

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.homotopy_mixin import HomotopyMixin
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)


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


class MinimizeSourceTemperature(Goal):
    priority = 2

    order = 1

    def __init__(self, source):
        self.state = f"{source}.QTHOut.T"

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state) / optimization_problem.variable_nominal(
            self.state
        )


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals


class HeatProblem(
    _GoalsAndOptions,
    HeatMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    pass


class _QTHBase(
    _GoalsAndOptions,
    QTHMixin,
    HomotopyMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourceTemperature(s))

        return goals


class QTHEqualTempSources(_QTHBase):
    def heat_network_options(self):
        options = super().heat_network_options()
        options["sources_equal_output_temp"] = True
        return options


if __name__ == "__main__":
    equal_temp = run_heat_network_optimization(HeatProblem, QTHEqualTempSources)
