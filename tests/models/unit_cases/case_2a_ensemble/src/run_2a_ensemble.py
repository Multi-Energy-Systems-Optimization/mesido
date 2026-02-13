from mesido.asset_sizing_mixin import AssetSizingMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.physics_mixin import PhysicsMixin

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

    order = 1

    def __init__(self, state, target, index):
        self.state = state
        self.index = index

        self.targets = target
        self.function_nominal = np.median(target[0].values[index])

    def function(self, optimization_problem, ensemble_member):
        """Note that for path goals, the ensemble member index is not passed to the call
        to :func:`OptimizationProblem.state`.  This call returns a time-independent symbol
        that is also independent of the active ensemble member.  Path goals are
        applied to all times and all ensemble members simultaneously."""
        nom = optimization_problem.variable_nominal(self.state)
        vector_state = (
            nom * optimization_problem.state_vector(self.state, ensemble_member)[self.index]
        )

        return self.targets[ensemble_member].values[self.index] - vector_state


class TargetDemandPathGoal(Goal):
    priority = 1

    order = 2

    def __init__(self, state, target):
        self.state = state

        self.target_min = target
        self.target_max = target
        self.function_range = (0.0, 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)

    def function(self, optimization_problem, ensemble_member):
        """Path goals are applied to all timeseries and ensemble members simultaneously,
        therefore the goals ensemble independent and only one target for all the ensembles can be
        applied."""

        return optimization_problem.state(self.state)


class MinimizeSourcesSizeGoal(Goal):
    priority = 2

    order = 2

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 10e6)
        self.source = source
        self.function_nominal = 1e5

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.extra_variable(f"{self.source}__max_size", ensemble_member)


class _GoalsAndOptions:
    def goals(self):
        goals = super().goals().copy()

        for i in range(len(self.times())):
            for demand in self.energy_system_components["heat_demand"]:
                target = [
                    self.get_timeseries(
                        f"{demand}.target_heat_demand", ensemble_member=ensemble_member
                    )
                    for ensemble_member in range(self.ensemble_size)
                ]
                state = f"{demand}.Heat_demand"

                goals.append(TargetDemandGoal(state, target, i))

        return goals


class HeatProblem(
    _GoalsAndOptions,
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):

    def energy_system_options(self):
        options = super().energy_system_options()
        options["heat_loss_disconnected_pipe"] = True
        self.heat_network_settings["minimum_velocity"] = 0.0001

        return options

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        return options


class HeatProblemEnsemble(
    # ControlTreeMixin,
    AssetSizingMixin,
    HeatProblem,
):
    csv_ensemble_mode = True

    def goals(self):
        goals = super().goals().copy()
        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesSizeGoal(s))

        return goals

    # TODO: still to figure out how to use control tree mixin, when specific variables are set as
    # controls.
    # def control_tree_options(self) -> Dict[str, Union[List[str], List[float], int]]:
    #     options = super().control_tree_options()
    #     options["branching_times"] = self.times()[1:]
    #     return options

    def __fixed_max_size(self):
        constraints = []
        for heat_source in self.energy_system_components["heat_source"]:
            max_size_prev = self.extra_variable(f"{heat_source}__max_size", ensemble_member=0)
            for e_m in range(self.ensemble_size - 1):
                max_size = self.extra_variable(f"{heat_source}__max_size", ensemble_member=e_m + 1)
                constraints.append((max_size - max_size_prev, 0.0, 0.0))
                max_size_prev = max_size
        return constraints

    def __update_target_demand_constraint(self, ensemble_member):
        """
        This constraint method adds upper limits to the demand heat production based on the
        target of a specific ensemble. This requires the first ensemble to always have the
        timeseries with the largest values.
        """
        constraints = []
        for demand in self.energy_system_components["heat_demand"]:
            var = self.state_vector(f"{demand}.Heat_demand", ensemble_member=ensemble_member)
            nom = self.variable_nominal(f"{demand}.Heat_demand")
            target = np.asarray(
                self.get_timeseries(f"{demand}.target_heat_demand", ensemble_member).values
            )

            constraints.append((var * nom / nom, 0.0, target / nom))
        return constraints

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member).copy()
        constraints.extend(self.__fixed_max_size())
        constraints.extend(self.__update_target_demand_constraint(ensemble_member))
        return constraints

    def path_constraints(self, ensemble_member):
        constraints = super().path_constraints(ensemble_member).copy()

        return constraints


if __name__ == "__main__":
    run_optimization_problem(
        HeatProblem,
        esdl_file_name="2a.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.xml",
    )
