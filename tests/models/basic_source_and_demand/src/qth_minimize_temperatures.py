from mesido.component_type_mixin import ModelicaComponentTypeMixin
from mesido.pycml.pycml_mixin import PyCMLMixin
from mesido.qth_not_maintained.bounds_to_pipe_flow_directions_mixin import (
    BoundsToPipeFlowDirectionsMixin,
)
from mesido.qth_not_maintained.qth_mixin import DemandTemperatureOption, QTHMixin

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.csv_mixin import CSVMixin
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.homotopy_mixin import HomotopyMixin
from rtctools.optimization.single_pass_goal_programming_mixin import SinglePassGoalProgrammingMixin
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


class MinimizeSourceTemperature(Goal):
    priority = 2

    order = 1

    function_nominal = 1e2

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state("source.QTHOut.T")


class _QTHBase(
    BoundsToPipeFlowDirectionsMixin,
    QTHMixin,
    ModelicaComponentTypeMixin,
    HomotopyMixin,
    SinglePassGoalProgrammingMixin,
    CSVMixin,
    PyCMLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def __init__(self, *args, **kwargs):
        self.__model = Model()
        super().__init__(*args, **kwargs)

    def path_goals(self):
        goals = super().path_goals().copy()
        goals.append(TargetDemandGoal(self))
        goals.append(MinimizeSourceTemperature())
        return goals

    def priority_completed(self, priority):
        super().priority_completed(priority)

        if not hasattr(self, "_objective_values"):
            self._objective_values = []
        self._objective_values.append(self.objective_value)

    def pycml_model(self):
        return self.__model


class QTHFixedDeltaTemperature(_QTHBase):
    def energy_system_options(self):
        options = super().energy_system_options()
        assert options["demand_temperature_option"] == DemandTemperatureOption.FIXED_DT
        return options


class QTHMinReturnMaxDeltaT(_QTHBase):
    def energy_system_options(self):
        options = super().energy_system_options()
        options["demand_temperature_option"] = DemandTemperatureOption.MIN_RETURN_MAX_DT
        return options


if __name__ == "__main__":
    fixed_dt = run_optimization_problem(QTHFixedDeltaTemperature)
    min_return_max_dt = run_optimization_problem(QTHMinReturnMaxDeltaT)
