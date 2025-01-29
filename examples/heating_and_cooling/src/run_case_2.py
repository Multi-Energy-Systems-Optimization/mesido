import logging
import os
import sys
from pathlib import Path
from typing import Dict

import casadi as ca

from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.goals.minimize_tco_goal import MinimizeTCO
from mesido.util import run_esdl_mesido_optimization
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day,
)

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

root_folder = os.path.join(str(Path(__file__).resolve().parent.parent.parent.parent), "tests")
sys.path.insert(1, root_folder)
from utils_tests import (
    demand_matching_test,
    energy_conservation_test,
    heat_to_discharge_test,
)

logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)


def _mip_gap_settings(mip_gap_name: str, problem) -> Dict[str, float]:
    """Creating the same MIP gap settings for all solvers."""

    options = {}
    # options[mip_gap_name] = 0.005
    options[mip_gap_name] = 0.02

    return options


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
        self.function_range = (-2.0 * max(target.values), 2.0 * max(target.values))
        self.function_nominal = (
            np.median(target.values) if np.median(target.values) else max(abs(target.values)) / 2.0
        )

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

    priority = 2

    order = 1

    def __init__(self, source: str):
        """
        The constructor of the goal.

        Parameters
        ----------
        source : string of the source name that is going to be minimized
        """
        self.source = source

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

        for demand in self.energy_system_components.get("cold_demand", []):
            target = self.get_timeseries(f"{demand}.target_cold_demand")
            state = f"{demand}.Cold_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals


class HeatingCoolingProblem(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    Heat and cold producers combined with low temp ates (represents borehole) connected to heating
    and cooling demands

    This problem class is applied to an esdl where there is no dedicated supply or return line. For this test case we just match heating demand (_GoalsAndOptions) and minimize the energy production to have a representative result.

    TCO minimization to be added
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        # variables for solver settings
        self._qpsol = None

        self.heat_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS
        self.heat_network_settings["minimum_velocity"] = 0.0

        self._number_of_years = 30.0

        self.__indx_max_peak = None
        self.__day_steps = 5

    def energy_system_options(self):
        options = super().energy_system_options()
        options["heat_loss_disconnected_pipe"] = False
        options["neglect_pipe_heat_losses"] = False
        return options

    def parameters(self, ensemble_member):
        parameters = super().parameters(ensemble_member)
        parameters["peak_day_index"] = self.__indx_max_peak
        parameters["time_step_days"] = self.__day_steps
        parameters["number_of_years"] = self._number_of_years
        return parameters

    def read(self):
        super().read()

        # Manually normalize the profile and set peak value
        heat_demand_peaks_watt = {
            "HeatingDemand_A": 170.0e3,
            "HeatingDemand_B": 440.0e2,
            "HeatingDemand_C": 60.0e2,
            "HeatingDemand_D": 60.0e2,
            "HeatingDemand_E": 40.0e2,
            "HeatingDemand_F": 140.0e2,
            "HeatingDemand_G": 70.0e2,
            "HeatingDemand_H": 340.0e2,

        }
        cold_demand_peaks_watt = {
            "CoolingDemand_A": 600.0e3,
            "CoolingDemand_C": 60.0e3,
            "CoolingDemand_E": 140.0e3,
            "CoolingDemand_F": 900.0e3,
            "CoolingDemand_G": 240.0e3,
            "CoolingDemand_H": 1200.0e3,
        }

        for d in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{d}.target_heat_demand")
            max_heat_demand_scaling = max(target.values)
            for ii in range(len(target.values)):
                target.values[ii] = (
                    target.values[ii] / max_heat_demand_scaling * heat_demand_peaks_watt[d]
                )
                # Manaully prevent very small values
                # if target.values[ii] < 4.0e3:
                #     target.values[ii] = 4.0e3

            self.io.set_timeseries(
                f"{d}.target_heat_demand",
                self.io._DataStore__timeseries_datetimes,
                target.values,
                0,
            )
        # Cold demand specified profile is not normalized
        # Cold demand value is reduced to get the correct balance between the heat and cold
        # demand such that the seasonal storage is utilized
        for d in self.energy_system_components["cold_demand"]:
            target = self.get_timeseries(f"{d}.target_cold_demand")
            max_cool_demand_scaling = max(target.values)
            for ii in range(len(target.values)):
                target.values[ii] = (
                    target.values[ii] / max_cool_demand_scaling * cold_demand_peaks_watt[d]
                )
                # Manaully prevent very small values
                # if target.values[ii] < 6.0e3:
                #     target.values[ii] = 6.0e3

            self.io.set_timeseries(
                f"{d}.target_cold_demand",
                self.io._DataStore__timeseries_datetimes,
                target.values,
                0,
            )

        # (
        #     self.__indx_max_peak,
        #     self.__heat_demand_nominal,
        #     self.__cold_demand_nominal,
        # ) = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(
        #     self,
        #     self.__day_steps,
        # )
        temp_variable_for_debugging = 0.0

    def path_goals(self):
        """
        This function adds the minimization goal for minimizing the milp production.

        Returns
        -------
        The appended list of goals
        """
        goals = super().path_goals().copy()

        # To be replaced by TCO
        # for s in self.energy_system_components["heat_source"]:
        #     goals.append(MinimizeSourcesHeatGoal(s))

        return goals

    def solver_options(self):
        """
        This function does not add anything at the moment but during debugging we use this.

        Returns
        -------
        solver options dict
        """
        options = super().solver_options()
        # Manually select solver below
        # HIGHS solver
        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options.update(_mip_gap_settings("mip_rel_gap", self))

        # CPLEX solver - not tested yet
        # options["casadi_solver"] = self._qpsol
        # options["solver"] = "cplex"
        # cplex_options = options["cplex"] = {}
        # cplex_options.update(_mip_gap_settings("CPX_PARAM_EPGAP", self))

        return options

    def goals(self):
        goals = super().goals().copy()

        # When this is used then the minimization of the heat source should be commented out
        # goals.append(MinimizeTCO(priority=2, number_of_years=self._number_of_years))

        return goals

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        # TODO: confirm if volume or heat balance is required over year. This will
        # determine if cyclic contraint below is for stored_heat or stored_volume
        # Add stored_heat cyclic constraint, this will also ensure that the total heat
        # change in the wko is 0 over the timeline
        # Note:
        #   - WKO in cooling mode: Hot well is being charged with heat and the cold well is
        # being discharged
        #   - WKO in heating mode: Cold well is being charged and the hot well is being
        #     discharged.
        # for a in self.energy_system_components.get("low_temperature_ates", []):
        #     stored_heat = self.state_vector(f"{a}.Stored_heat")
        #     constraints.append(((stored_heat[-1] - stored_heat[0]), 0.0, 0.0))
        # This code below might be needed
        # Add stored_heat cyclic constraint, this will also ensure that the volume
        # into the lower temp & out of the higher temp is the same as the volume
        # out of the lower temp & into the higher temp over the timeline.
        # Note:
        #   - Volume increase: Hot well is being charged and the cold well is being
        #     discharged. -> WKO in cooling mode
        #   - Volume decrease: Cold well is being charged and the hot well is being
        #     discharged. -> WKO in heating mode

        for ates_id in self.energy_system_components.get("low_temperature_ates", []):
            stored_volume = self.state_vector(f"{ates_id}.Stored_volume")
            volume_usage = 0.0
            volume_usage = stored_volume[0] - stored_volume[-1]
            constraints.append((volume_usage, 0.0, 0.0))

        return constraints


if __name__ == "__main__":

    base_folder = Path(__file__).resolve().parent.parent

    heat_problem = run_esdl_mesido_optimization(
        HeatingCoolingProblem,
        base_folder=base_folder,
        # esdl_file_name="Heating and cooling network with return network.esdl",
        esdl_file_name="Supply_only_1_return_network_efvc_.esdl",
        # esdl_file_name="Small_Supply_only_1_return_network_efvc_.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        # input_timeseries_file="timeseries_4.csv",
        input_timeseries_file="timeseries_5.csv",
    )
    results = heat_problem.extract_results()

    # checks to make sure the run was valid
    demand_matching_test(heat_problem, results)
    energy_conservation_test(heat_problem, results)

    temp_variable_debugging = 0.0
