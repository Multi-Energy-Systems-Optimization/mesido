import casadi as ca

from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin_base import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import SinglePassGoalProgrammingMixin
from rtctools.optimization.timeseries import Timeseries
from rtctools.util import run_optimization_problem


class TargetDemandGoal(Goal):
    """
    Goal class for matching a timeseries of values, we use it to match the time series of a demand
    profile. We use order 2 to match the profile at every time-step. We set the target in the
    constructor and function() method will return the state which should match the target.
    """

    priority = 1

    order = 2

    def __init__(self, state: str, target: Timeseries):
        """
        The constructor for the class where we pass the name of the state that should be matched to
        the target.

        Parameters
        ----------
        state : string for the name of the state.
        target : Timeseries to match with the state.
        """
        self.state = state

        self.target_min = target
        self.target_max = target
        self.function_range = (0.0, 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)

    def function(
        self, optimization_problem: CollocatedIntegratedOptimizationProblem, ensemble_member: int
    ) -> ca.MX:
        """
        This function returns the state to which will be tried to match to the target.

        Parameters
        ----------
        optimization_problem : The optimization class containing the variables'
        ensemble_member : the ensemble member

        Returns
        -------
        The optimization problem state, the Heat_demand, which should be matched to the time-series
        """
        return optimization_problem.state(self.state)


class MinimizeSourcesHeatGoal(Goal):
    """
    A minimization goal for source milp production. We use order 1 here as we want to minimize milp
    over the full horizon and not per time-step.
    """

    priority = 3

    order = 1

    def __init__(self, source: str):
        """
        The constructor of the goal.

        Parameters
        ----------
        source : string of the source name that is going to be minimized
        """
        self.target_max = 0.0
        self.function_range = (0.0, 10e6)
        self.source = source
        self.function_nominal = 1e6

    def function(
        self, optimization_problem: CollocatedIntegratedOptimizationProblem, ensemble_member: int
    ) -> ca.MX:
        """
        This function returns the state variable to which should to be matched to the target
        specified in the __init__.

        Parameters
        ----------
        optimization_problem : The optimization class containing the variables'.
        ensemble_member : the ensemble member.

        Returns
        -------
        The Heat_source state of the optimization problem.
        """
        return optimization_problem.state(f"{self.source}.Heat_source")


class _GoalsAndOptions:
    """
    A goals class that we often use if we specify multiple problem classes.
    """

    def path_goals(self):
        """
        In this method we add the goals for matching the demand.

        Returns
        -------
        The appended goals list of goals
        """
        goals = super().path_goals().copy()

        for demand in self.energy_system_components.get("heat_demand", []):
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals


class HeatProblem(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    This problem class is for the absolute milp tests. Meaning that this problem class
    is applied to an esdl where there is no dedicated supply or return line. For this test case
    we just match heating demand (_GoalsAndOptions) and minimize the energy production to have a
    representative result.
    """

    def path_goals(self):
        """
        This function adds the minimization goal for minimizing the milp production.

        Returns
        -------
        The appended list of goals
        """
        goals = super().path_goals().copy()

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesHeatGoal(s))

        return goals

    def solver_options(self):
        """
        This function does not add anything at the moment but during debugging we use this.

        Returns
        -------
        solver options dict
        """
        options = super().solver_options()
        options["solver"] = "highs"
        return options

    def energy_system_options(self):
        """
        This function does not add anything at the moment but during debugging we use this.

        Returns
        -------
        Options dict for the physics modelling
        """
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.0
        options["heat_loss_disconnected_pipe"] = False
        options["neglect_pipe_heat_losses"] = False
        return options


if __name__ == "__main__":
    elect = run_optimization_problem(
        HeatProblem,
        esdl_file_name="absolute_heat.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries.csv",
    )
    results = elect.extract_results()
    a = 1
