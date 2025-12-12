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
        self.function_range = (0.0, 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)

    def function(
        self, optimization_problem: CollocatedIntegratedOptimizationProblem, ensemble_member: int
    ):
        return optimization_problem.state(self.state)


class _GoalsAndOptions:
    def path_goals(self):
        """
        Add goal to meet the specified power demands in the electricity network.

        Returns
        -------
        Extended goals list.
        """
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["electricity_demand"]:
            target = self.get_timeseries(f"{demand}.target_electricity_demand")
            state = f"{demand}.Electricity_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        options["include_electric_cable_power_loss"] = False

        return options


class ElectricityProblem(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    Problem to check the behaviour of a simple source, cable, demand network and a battery.
    """

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        for bat in self.energy_system_components.get("electricity_storage", []):
            stored_elec = self.state_vector(f"{bat}.Stored_electricity")
            constraints.append((stored_elec[0], 0.0, 0.0))

        return constraints

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        return options

    pass


if __name__ == "__main__":
    elect = run_optimization_problem(
        ElectricityProblem,
        esdl_file_name="source_sink_storage.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries.csv",
    )
    r = elect.extract_results()
