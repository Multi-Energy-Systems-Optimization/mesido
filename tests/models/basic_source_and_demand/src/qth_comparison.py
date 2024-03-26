from mesido.component_type_mixin import ModelicaComponentTypeMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.pycml.pycml_mixin import PyCMLMixin
from mesido.qth_not_maintained.bounds_to_pipe_flow_directions_mixin import (
    BoundsToPipeFlowDirectionsMixin,
)
from mesido.qth_not_maintained.qth_mixin import QTHMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.csv_mixin import CSVMixin
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.homotopy_mixin import HomotopyMixin
from rtctools.optimization.modelica_mixin import ModelicaMixin
from rtctools.optimization.timeseries import Timeseries
from rtctools.util import run_optimization_problem

if __name__ == "__main__":
    from model_qth import Model
else:
    from .model_qth import Model


class TargetDemandGoal(Goal):
    priority = 1

    order = 1

    def __init__(self, optimization_problem):
        self.target_min = optimization_problem.get_timeseries("demand.target_heat_demand")
        self.target_max = optimization_problem.get_timeseries("demand.target_heat_demand")
        self.function_range = (0.0, 2e5)
        self.function_nominal = 1e5

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state("demand.Heat_demand")


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()
        goals.append(TargetDemandGoal(self))
        return goals

    def priority_completed(self, priority):
        super().priority_completed(priority)

        if not hasattr(self, "_objective_values"):
            self._objective_values = []
        self._objective_values.append(self.objective_value)


class QTHModelica(
    _GoalsAndOptions,
    BoundsToPipeFlowDirectionsMixin,
    QTHMixin,
    ModelicaComponentTypeMixin,
    HomotopyMixin,
    GoalProgrammingMixin,
    CSVMixin,
    ModelicaMixin,
    CollocatedIntegratedOptimizationProblem,
):
    pass


class QTHPython(
    _GoalsAndOptions,
    BoundsToPipeFlowDirectionsMixin,
    QTHMixin,
    ModelicaComponentTypeMixin,
    HomotopyMixin,
    GoalProgrammingMixin,
    CSVMixin,
    PyCMLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def __init__(self, *args, **kwargs):
        self.__model = Model()
        super().__init__(*args, **kwargs)

    def pycml_model(self):
        return self.__model


class QTHESDL(
    _GoalsAndOptions,
    QTHMixin,
    HomotopyMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    @property
    def heat_network_flow_directions(self):
        pipes = self.energy_system_components["heat_pipe"]
        return {p: "__fixed_positive_flow" for p in pipes}

    def constant_inputs(self, ensemble_member):
        inputs = super().constant_inputs(ensemble_member)
        inputs["__fixed_positive_flow"] = Timeseries([-np.inf, np.inf], [1.0, 1.0])
        return inputs

    def bounds(self):
        bounds = super().bounds()
        bounds["source.Heat_source"] = (75_000.0, 125_000.0)
        bounds["source.QTHOut.T"] = (65.0, 85.0)
        return bounds


if __name__ == "__main__":
    a = run_optimization_problem(QTHModelica)
    b = run_optimization_problem(QTHPython)
    c = run_optimization_problem(QTHESDL)
