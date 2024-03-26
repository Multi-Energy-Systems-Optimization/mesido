from mesido.component_type_mixin import ModelicaComponentTypeMixin
from mesido.pycml.pycml_mixin import PyCMLMixin
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.csv_mixin import CSVMixin
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.timeseries import Timeseries
from rtctools.util import run_optimization_problem

if __name__ == "__main__":
    from model import Model
else:
    from .model import Model


class TargetDemandGoal(Goal):
    priority = 1

    order = 1

    def __init__(self, optimization_problem: CollocatedIntegratedOptimizationProblem):
        self.target_min = optimization_problem.get_timeseries("Heat_demand")
        self.target_max = optimization_problem.get_timeseries("Heat_demand")
        self.function_range = (0.0, 2e6)
        self.function_nominal = 1e6

    def function(
        self, optimization_problem: CollocatedIntegratedOptimizationProblem, ensemble_member: int
    ):
        return optimization_problem.state("demand.Heat_demand")


class MinimizeSourceGoal(Goal):
    priority = 2

    order = 1

    def __init__(self, optimization_problem):
        self.target_min = np.nan
        self.target_max = 0.0
        self.function_range = (0.0, 2e6)
        self.function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state("source.Heat_source")


class HeatBuffer(
    TechnoEconomicMixin,
    ModelicaComponentTypeMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    CSVMixin,
    PyCMLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    This problem is used to test the buffer asset logic.
    """

    def __init__(self, *args, **kwargs):
        """
        This is only here to instantiate the model, this comes out of the old days, should be
        replaced with an ESDL file.
        """
        self.__model = Model()
        super().__init__(*args, **kwargs)

    def path_goals(self):
        """
        Basic goals to meet heating demand and minimize use of sources.

        Returns
        -------
        list of goals.
        """
        return [TargetDemandGoal(self), MinimizeSourceGoal(self)]

    def pycml_model(self):
        """
        Should become obsolete when we have an esdl file.

        Returns
        -------
        The pycml model definition
        """
        return self.__model


class HeatBufferNoHistory(HeatBuffer):
    pass


class HeatBufferHistory(HeatBuffer):
    """
    Problem in which we force a certain amount of artificial milp to be stored at t0 at the buffer
    to check correct optimization logic functioning.
    """

    def history(self, ensemble_member: int):
        """
        Forcing an amount of "artificial" milp to be extracted from the buffer at t=0.

        Parameters
        ----------
        ensemble_member : int with the ensemble member

        Returns
        -------
        The history dict
        """
        history = {}

        initial_time = np.array([self.initial_time])
        history["buffer.Heat_buffer"] = Timeseries(initial_time, [-12000.0])

        return history


class HeatBufferHistoryStoredHeat(HeatBuffer):
    """
    Problem where we allow a certian amount of artificial energy to be used and check whether this
    is indeed being done. The amount should equal that of the HeatBufferHistory class.
    """

    def history(self, ensemble_member: int):
        """
        Here we create an amount of artificial energy to be stored at t=0.

        Parameters
        ----------
        ensemble_member : int with the ensemble member

        Returns
        -------
        The history dict
        """
        history = {}

        initial_time = self.initial_time
        stored_heat_lb = self._HeatPhysicsMixin__buffer_t0_bounds["buffer.Stored_heat"][0].values[0]
        history["buffer.Stored_heat"] = Timeseries(
            np.array([initial_time - 1, initial_time]),
            np.array([stored_heat_lb + 12000.0, stored_heat_lb]),
        )

        return history


if __name__ == "__main__":
    buffer_nohistory = run_optimization_problem(HeatBufferNoHistory)
    buffer_history = run_optimization_problem(HeatBufferHistory)
    buffer_historystoredheat = run_optimization_problem(HeatBufferHistoryStoredHeat)
