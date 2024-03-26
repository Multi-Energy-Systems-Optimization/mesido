from mesido.component_type_mixin import ModelicaComponentTypeMixin
from mesido.physics_mixin import PhysicsMixin
from mesido.pycml.pycml_mixin import PyCMLMixin

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.csv_mixin import CSVMixin
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.util import run_optimization_problem

if __name__ == "__main__":
    from model import Model
else:
    from .model import Model


class TargetDemandGoal(Goal):
    priority = 1

    order = 1

    def __init__(self, optimization_problem):
        self.target_min = optimization_problem.get_timeseries("Heat_demand")
        self.target_max = optimization_problem.get_timeseries("Heat_demand")
        self.function_range = (0.0, 2e5)
        self.function_nominal = 1e5

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state("demand.Heat_demand")


class MinimizeProduction(Goal):
    priority = 2

    order = 1

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state("source.Heat_source")


class DoublePipeEqualHeat(
    PhysicsMixin,
    ModelicaComponentTypeMixin,
    GoalProgrammingMixin,
    CSVMixin,
    PyCMLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def __init__(self, *args, **kwargs):
        self.__model = Model()
        super().__init__(*args, **kwargs)

    def path_goals(self):
        return [TargetDemandGoal(self), MinimizeProduction()]

    def post(self):
        super().post()

    def pycml_model(self):
        return self.__model


if __name__ == "__main__":
    heat_problem = run_optimization_problem(DoublePipeEqualHeat)
