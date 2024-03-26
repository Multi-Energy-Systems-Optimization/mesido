from mesido.component_type_mixin import ModelicaComponentTypeMixin
from mesido.qth_not_maintained.bounds_to_pipe_flow_directions_mixin import (
    BoundsToPipeFlowDirectionsMixin,
)
from mesido.qth_not_maintained.qth_mixin import QTHMixin

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.csv_mixin import CSVMixin
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.homotopy_mixin import HomotopyMixin
from rtctools.optimization.modelica_mixin import ModelicaMixin
from rtctools.util import run_optimization_problem


class TargetDemandGoal(Goal):
    priority = 1

    order = 1

    def __init__(self, optimization_problem):
        self.target_min = optimization_problem.get_timeseries("Heat_demand")
        self.target_max = optimization_problem.get_timeseries("Heat_demand")
        self.function_range = (0.0, 2e6)
        self.function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state("demand.Heat_demand")


class MinimizeProduction(Goal):
    priority = 2
    order = 1
    function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state("Heat_source")


class PipeQTHBase(
    BoundsToPipeFlowDirectionsMixin,
    QTHMixin,
    ModelicaComponentTypeMixin,
    HomotopyMixin,
    GoalProgrammingMixin,
    CSVMixin,
    ModelicaMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()
        goals.append(TargetDemandGoal(self))
        return goals

    def homotopy_options(self):
        options = super().homotopy_options()
        options["delta_theta_min"] = 2.0
        return options


class SinglePipeQTH(PipeQTHBase):
    # Note that for a single pipe, there would be no freedom left if we were
    # to minimize production, and the solver will fail
    pass


class DoublePipeBase(PipeQTHBase):
    def path_goals(self):
        goals = super().path_goals().copy()
        goals.append(MinimizeProduction())
        return goals


class DoublePipeEqualQTH(DoublePipeBase):
    pass


class DoublePipeUnequalQTH(DoublePipeBase):
    pass


class DoublePipeUnequalWithValveQTH(DoublePipeBase):
    pass


if __name__ == "__main__":
    single_pipe = run_optimization_problem(SinglePipeQTH)
    double_pipe_equal = run_optimization_problem(DoublePipeEqualQTH)
    double_pipe_unequal = run_optimization_problem(DoublePipeUnequalQTH)
    double_pipe_unequal_valve = run_optimization_problem(DoublePipeUnequalWithValveQTH)
