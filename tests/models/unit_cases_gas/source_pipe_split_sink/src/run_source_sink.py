from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import GoalProgrammingMixin
from rtctools.optimization.goal_programming_mixin_base import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.timeseries import Timeseries
from rtctools.util import run_optimization_problem


class TargetDemandGoal(Goal):
    priority = 1

    order = 2

    def __init__(self, state: str, target: Timeseries):
        self.state = state

        self.target_min = target
        self.target_max = target
        self.function_range = (0.0, 2.0 * max(target.values) * 10.0)
        self.function_nominal = np.median(target.values)

    def function(
        self, optimization_problem: CollocatedIntegratedOptimizationProblem, ensemble_member: int
    ):
        return optimization_problem.state(self.state)


class _GoalsAndOptions:
    def path_goals(self):
        """
        Add a goal to meet the specified gas demand.

        Returns
        -------
        List of the goals
        """
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["gas_demand"]:
            target = self.get_timeseries(f"{demand}.target_gas_demand")
            state = f"{demand}.Gas_demand_mass_flow"

            goals.append(TargetDemandGoal(state, target))

        return goals


class GasProblem(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    Problem to check optimization behaviour for a producer, pipe, sink network.
    """

    def times(self, variable=None) -> np.ndarray:
        """
        Shorten the timeseries to speed up the test

        Parameters
        ----------
        variable : string with name of the variable

        Returns
        -------
        The timeseries
        """
        return super().times(variable)[:10]


if __name__ == "__main__":
    elect = run_optimization_problem(
        GasProblem,
        esdl_file_name="source_sink.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries.csv",
    )
    r = elect.extract_results()
    a = 1
