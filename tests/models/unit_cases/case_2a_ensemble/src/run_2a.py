from rtctools.optimization.control_tree_mixin import ControlTreeMixin
from rtctools.optimization.csv_mixin import CSVMixin

from mesido.asset_sizing_mixin import AssetSizingMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.physics_mixin import PhysicsMixin
from mesido.qth_not_maintained.qth_mixin import QTHMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.homotopy_mixin import HomotopyMixin
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

        self.targets = target
        self.target_min = target[0]
        self.target_max = target[0]
        self.function_range = (0.0, 2.0 * max(target[0].values))
        self.function_nominal = np.median(target[0].values)

    def function(self, optimization_problem, ensemble_member):
        """Note that for path goals, the ensemble member index is not passed to the call
        to :func:`OptimizationProblem.state`.  This call returns a time-independent symbol
        that is also independent of the active ensemble member.  Path goals are
        applied to all times and all ensemble members simultaneously."""
        self.target_min = self.targets[ensemble_member]
        self.target_max = self.targets[ensemble_member]
        return optimization_problem.state(self.state)


class MinimizeSourcesHeatGoal(Goal):
    priority = 2

    order = 2

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 2e6)
        self.source = source
        self.function_nominal = 1e5

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Heat_source")

class MinimizeSourcesSizeGoal(Goal):
    priority = 2

    order = 2

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 2e6)
        self.source = source
        self.function_nominal = 1e5

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.extra_variable(f"{self.source}__max_size", ensemble_member)


class MinimizeSourcesQTHGoal(Goal):
    priority = 2

    order = 2

    def __init__(self, source):
        self.source = source
        self.function_nominal = 1e5

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Heat_source")


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = [self.get_timeseries(f"{demand}.target_heat_demand",
                                         ensemble_member=ensemble_member) for ensemble_member in
                      range(self.ensemble_size)]
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals


class HeatProblem(
    _GoalsAndOptions,
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    # def path_goals(self):
    #     goals = super().path_goals().copy()
    #
    #     for s in self.energy_system_components["heat_source"]:
    #         goals.append(MinimizeSourcesHeatGoal(s))
    #
    #     return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        options["heat_loss_disconnected_pipe"] = True
        self.heat_network_settings["minimum_velocity"] = 0.0001

        return options

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        return options


class HeatProblemEnsemble(AssetSizingMixin,
                            HeatProblem,
                          # CSVMixin,
                          ControlTreeMixin):
    csv_ensemble_mode = True

    def pre(self):
        super().pre()

        # Empty dict for intermediate ensemble results
        self.intermediate_results = {ensemble_member: [] for ensemble_member in range(
            self.ensemble_size)}

    def goals(self):
        goals = super().goals().copy()
        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesSizeGoal(s))
        return goals

    def bounds(self):
        bounds = super().bounds()
        print('a')
        return bounds

    def parameters(self, ensemble_member):
        parameters = super().parameters(ensemble_member)
        if ensemble_member == 1:
            parameters['GeothermalSource_fafd.Max_heat']=1e5
        return parameters

    def __fixed_max_size(self):
        constraints=[]
        for heat_source in self.energy_system_components["heat_source"]:
            max_size_prev = self.extra_variable(f"{heat_source}__max_size", ensemble_member=0)
            for e_m in range(self.ensemble_size-1):
                max_size = self.extra_variable(f"{heat_source}__max_size", ensemble_member=e_m+1)
                constraints.append((max_size - max_size_prev, 0.0, 0.0))
                max_size_prev = max_size
        return constraints

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member).copy()
        constraints.extend(self.__fixed_max_size())
        return constraints



class QTHProblem(
    _GoalsAndOptions,
    QTHMixin,
    HomotopyMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesQTHGoal(s))

        return goals


if __name__ == "__main__":
    run_optimization_problem(
        HeatProblem,
        esdl_file_name="2a.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.xml",
    )
    # run_heat_network_optimization(HeatProblem, QTHProblem)
