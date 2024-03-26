from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.physics_mixin import PhysicsMixin
from mesido.workflows.io.write_output import ScenarioOutput

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
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


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        options["heat_loss_disconnected_pipe"] = False

        return options

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"

        return options


class MinimizeSourcesHeatGoal(Goal):
    priority = 2

    order = 1

    def __init__(self, sources):
        self.target_max = 0.0
        self.function_range = (0.0, 10e6)
        self.sources = sources
        self.function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        sum_heat_prod = 0
        for source in self.sources:
            sum_heat_prod += optimization_problem.state(f"{source}.Heat_source")
        return sum_heat_prod


class MinimizeElectricityGoal(Goal):
    priority = 2

    order = 1

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 10e6)
        self.source = source
        self.function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Power_elec")


class HeatProblem(
    ScenarioOutput,
    _GoalsAndOptions,
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        s = self.energy_system_components["heat_source"]
        goals.append(MinimizeSourcesHeatGoal(s))

        # for s in self.energy_system_components["heat_pump"]:
        #     goals.append(MinimizeElectricityGoal(s))

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.001
        options["heat_loss_disconnected_pipe"] = True

        return options


class HeatProblemTvar(HeatProblem):
    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options["mip_rel_gap"] = 0.01
        return options

    def temperature_carriers(self):
        return self.esdl_carriers  # geeft terug de carriers met multiple temperature options

    def temperature_regimes(self, carrier):
        temperatures = []
        if carrier == 7212673879469902607010:
            # supply
            temperatures = [85.0, 90.0]

        return temperatures


if __name__ == "__main__":
    solution = run_optimization_problem(
        HeatProblemTvar,
        esdl_file_name="heat_pump.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.xml",
    )
    results = solution.extract_results()
