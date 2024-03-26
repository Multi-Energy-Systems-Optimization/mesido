from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.physics_mixin import PhysicsMixin
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
        options["include_electric_cable_power_loss"] = True

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
    Problem to check the behaviour of a simple source, cable, demand network.
    """

    pass


class ElectricityProblemMaxCurr(
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    Problem to check the behaviour of a simple source, cable, demand network with increased demand
    to push current to max.
    """

    def read(self):
        super().read()

        for d in self.energy_system_components["electricity_demand"]:
            new_timeseries = self.get_timeseries(f"{d}.target_electricity_demand").values * 50
            self.set_timeseries(f"{d}.target_electricity_demand", new_timeseries)

    def path_goals(self):
        """
        Modified targets for the demand matching goal to push up the current in the system.

        Returns
        -------
        list with goals.
        """
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["electricity_demand"]:
            target = self.get_timeseries(f"{demand}.target_electricity_demand")
            state = f"{demand}.Electricity_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals

    def bounds(self):
        """
        Setting bounds to get things to its max, this might be incorrect here.

        Returns
        -------
        Dict with the bounds.
        """
        bounds = super().bounds()
        bounds["ElectricityProducer_b95d.Electricity_source"] = (0.0, 100000.0)
        bounds["ElectricityCable_238f.ElectricityIn.Power"] = (0.0, 100000.0)
        bounds["ElectricityCable_238f.ElectricityOut.Power"] = (0.0, 100000.0)
        return bounds


if __name__ == "__main__":
    elect = run_optimization_problem(
        ElectricityProblem,
        esdl_file_name="case1_elec.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries.csv",
    )
    r = elect.extract_results()
    print(r["ElectricityDemand_2af6.Electricity_demand"])
    print(r["ElectricityDemand_2af6.ElectricityIn.Power"])
    print(r["ElectricityDemand_2af6.ElectricityIn.V"])
    print(r["ElectricityDemand_2af6.ElectricityIn.I"])
