"""Small electricity producer and battery sizing model shared by sizing regressions."""

from mesido.esdl.esdl_additional_vars_mixin import ESDLAdditionalVarsMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.goal_programming_mixin_base import Goal as GoalBase
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.timeseries import Timeseries
from rtctools.util import run_optimization_problem


class TargetDemandGoal(GoalBase):
    """Match the electricity-demand profile at the highest goal priority."""

    priority = 1
    order = 2

    def __init__(self, state: str, target: Timeseries):
        self.state = state
        self.target_min = target
        self.target_max = target
        self.function_range = (0.0, 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class MinimizeAssetCosts(Goal):
    """Minimize the financial costs for sources and batteries after demand is met."""

    priority = 2
    order = 1

    def __init__(self):
        self.target_max = 0.0
        self.function_range = (0.0, 1.0e6)
        self.function_nominal = 1.0e3

    def function(self, optimization_problem, ensemble_member):
        assets = [
            *optimization_problem.energy_system_components.get("electricity_source", []),
            *optimization_problem.energy_system_components.get("electricity_storage", []),
        ]
        return sum(
            optimization_problem.extra_variable(cost_map[asset], ensemble_member)
            for asset in assets
            for cost_map in (
                optimization_problem._asset_investment_cost_map,
                optimization_problem._asset_installation_cost_map,
                optimization_problem._asset_fixed_operational_cost_map,
                optimization_problem._asset_variable_operational_cost_map,
            )
        )


class _DemandAndCostGoals:
    def path_goals(self):
        goals = super().path_goals().copy()
        for demand in self.energy_system_components.get("electricity_demand", []):
            target = self.get_timeseries(f"{demand}.target_electricity_demand")
            goals.append(TargetDemandGoal(f"{demand}.Electricity_demand", target))
        return goals

    def goals(self):
        goals = super().goals().copy()
        goals.append(MinimizeAssetCosts())
        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        options["include_electric_cable_power_loss"] = False
        return options


class ElectricityAssetSizingProblem(
    _DemandAndCostGoals,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """Model optional electricity producers and storage with fixed charge/discharge rates."""

    _number_of_years = 1.0

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        return options

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)
        for battery in self.energy_system_components.get("electricity_storage", []):
            stored_energy = self.state_vector(f"{battery}.Stored_electricity")
            constraints.extend(
                [
                    (stored_energy[0], 0.0, 0.0),
                    (stored_energy[-1], 0.0, 0.0),
                    (self.state_vector(f"{battery}.Power_charging")[0], 0.0, 0.0),
                    (self.state_vector(f"{battery}.Power_discharging")[0], 0.0, 0.0),
                ]
            )
        return constraints


class ElectricityAssetSizingPriceProblem(ESDLAdditionalVarsMixin, ElectricityAssetSizingProblem):
    """Sizing problem variant that loads the electricity carrier price from the input CSV."""


if __name__ == "__main__":
    run_optimization_problem(
        ElectricityAssetSizingProblem,
        esdl_file_name="asset_sizing_cables.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries.csv",
    )
