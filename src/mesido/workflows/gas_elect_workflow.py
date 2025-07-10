import logging
import os

from mesido.esdl.esdl_additional_vars_mixin import ESDLAdditionalVarsMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.goals.minimize_tco_goal import MinimizeTCO
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.utils.helpers import main_decorator, run_optimization_problem_solver
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day,
    adapt_hourly_profile_averages_timestep_size,
    adapt_hourly_profile_averages_timestep_size_gas
)
from mesido.workflows.utils.error_types import HEAT_NETWORK_ERRORS, potential_error_to_error

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import (
    CachingQPSol,
    SinglePassGoalProgrammingMixin,
)
from rtctools.util import run_optimization_problem

logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)


class TargetHeatGoal(Goal):
    priority = 1

    order = 2

    def __init__(self, state, target):
        self.state = state

        self.target_min = target
        self.target_max = target
        try:
            self.function_range = (-1.0e6, max(2.0 * max(target.values), 1.0e6))
            self.function_nominal = max(np.median(target.values), 1.0e6)
        except Exception:
            self.function_range = (-1.0e6, max(2.0 * target, 1.0e6))
            self.function_nominal = max(target, 1.0e6)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


def _mip_gap_settings(mip_gap_name: str, problem):
    """Creating the same MIP gap settings for all solvers."""

    options = {}
    if hasattr(problem, "_stage"):
        if problem._stage == 1:
            options[mip_gap_name] = 0.005
        else:
            options[mip_gap_name] = 0.02
    else:
        options[mip_gap_name] = 0.02

    return options


class SolverHIGHS:
    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options.update(_mip_gap_settings("mip_rel_gap", self))

        options["gurobi"] = None
        options["cplex"] = None

        return options


class SolverCPLEX:
    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "cplex"
        cplex_options = options["cplex"] = {}
        cplex_options.update(_mip_gap_settings("CPX_PARAM_EPGAP", self)) # cplex_options["CPX_PARAM_EPGAP"] = 0.00001

        options["highs"] = None

        return options


class GasElectProblem(
    SolverHIGHS,
    ScenarioOutput,
    ESDLAdditionalVarsMixin,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self._number_of_years = 30.0

        self._save_json = True

        self.__indx_max_peak = None
        self.__day_steps = 10 # 5
        self.__hour_steps = 240
        self.__number_of_hours_around_peak = 2

        self.__heat_demand_nominal = dict()

        self.__priority = None

    def energy_system_options(self):
        options = super().energy_system_options()
        options["neglect_pipe_heat_losses"] = True
        options["include_electric_cable_power_loss"] = False
        # TODO: determine why no heat pump (case with heat pumps & boilers) is used when pwer
        # losses are included
        # options["include_electric_cable_power_loss"] = True

        # Setting when started with head loss inclusions
        self.gas_network_settings["minimum_velocity"] = 0.0
        self.gas_network_settings["maximum_velocity"] = 15.0

        # TODO: resolve scaling and potential other issues preventing HIGHS to optimize the system
        # when LINEARIZED_N_LINES_EQUALITY head loss setting is used
        # self.gas_network_settings["n_linearization_lines"] = 3
        # self.gas_network_settings["minimize_head_losses"] = False
        # self.gas_network_settings["head_loss_option"] = HeadLossOption.LINEARIZED_N_LINES_EQUALITY

        self.gas_network_settings["minimize_head_losses"] = True
        self.gas_network_settings["head_loss_option"] = HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY

        return options

    def solver_options(self):
        options = super().solver_options()
        # options["casadi_solver"] = self._qpsol
        # options["solver"] = "highs"
        # highs_options = options["highs"] = {}
        # highs_options["mip_abs_gap"] = 1.0e-6

        if options["solver"] == "highs":
            highs_options = options["highs"]
            if self.__priority == 1:
                highs_options["time_limit"] = 600
            else:
                highs_options["time_limit"] = 100000

        return options

    def read(self):

        super().read()

        # 1 - Convert gas demand Nm3/h (data in timeseries source file) to heat demand in watts:
        #     - Assumumption:
        #         - gas heating value (LCV value) = 31.68 * 10^6 (J/m3) at 1bar, 273.15K
        #         - gas boiler efficiency 80%
        # 2 - Profile adapting:
        #     - Read the yearly profile with hourly time steps
        #     - Adapt to a daily averaged profile per self.__day_steps except for the day with the peak day
        # TODO: setup a standard way for gas usage and automate the link to heating value & boiler efficiency (if needed)
        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")

            # Manually set heating demand values
            boiler_efficiency = 0.8
            gas_heating_value_joule_m3 = 31.68 * 10**6
            for ii in range(len(target.values)):
                target.values[ii] *= gas_heating_value_joule_m3 * boiler_efficiency

            self.io.set_timeseries(
                f"{demand}.target_heat_demand",
                self.io._DataStore__timeseries_datetimes,
                target.values,
                0,
            )

        potential_error_to_error(HEAT_NETWORK_ERRORS)

        # (
        #     self.__indx_max_peak,
        #     self.__heat_demand_nominal,
        #     _,
        # ) = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(self, self.__day_steps)

        adapt_hourly_profile_averages_timestep_size_gas(self, self.__hour_steps, self.__number_of_hours_around_peak)


        logger.info("HeatProblem read")

    def pre(self):
        super().pre()

        # variables for solver settings
        self._qpsol = CachingQPSol()

    def parameters(self, ensemble_member):
        parameters = super().parameters(ensemble_member)
        parameters["number_of_years"] = self._number_of_years
        return parameters

    def path_goals(self):
        goals = super().path_goals().copy()
        bounds = self.bounds()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            if bounds[f"{demand}.HeatIn.Heat"][1] < max(target.values):
                logger.warning(
                    f"{demand} has a flow limit, {bounds[f'{demand}.HeatIn.Heat'][1]}, "
                    f"lower that wat is required for the maximum demand {max(target.values)}"
                )
            # TODO: update this caclulation to bounds[f"{demand}.HeatIn.Heat"][1]/ dT * Tsup & move
            # to potential_errors variable
            state = f"{demand}.Heat_demand"

            goals.append(TargetHeatGoal(state, target))

        return goals

    def goals(self):
        goals = super().goals().copy()
        goals.append(MinimizeTCO(priority=2, number_of_years=self._number_of_years))

        return goals

    # Do not delete. Temporary code to deactivate the heat pumps. Use for manual test/checking
    # def path_constraints(self, ensemble_member):
    #     constraints = super().path_constraints(ensemble_member)

    #     for eb in self.energy_system_components.get("air_water_heat_pump_elec", []):
    #         power_consumed = self.state(f"{eb}.Power_consumed")
    #         constraints.append((power_consumed, 0.0, 0.0))

    #     return constraints

    def post(self):
        super().post()
        results = self.extract_results()
        parameters = self.parameters(0)
        if os.path.exists(self.output_folder) and self._save_json:
            bounds = self.bounds()
            aliases = self.alias_relation._canonical_variables_map
            solver_stats = self.solver_stats
            self._write_json_output(results, parameters, bounds, aliases, solver_stats)

        # if os.path.exists(self.output_folder) and self._save_json:
        #     self._write_json_output()


class SettingsStaged:
    """
    Additional settings to be used when a staged approach should be implemented.
    Staged approach currently entails 2 stages:
    1. optimisation is performed with line headloss linearization
    2. optimization is performed with 3 lines headloss linearization
    """

    _stage = 0  # current stage that is being used
    _total_stages = 0  # total number of stages to be used

    def __init__(
        self,
        stage=None,
        total_stages=None,
        boolean_bounds: list = None,
        priorities_output: list = None,
        *args,
        **kwargs,
    ):
        super().__init__(*args, **kwargs)

        self._stage = stage
        self._total_stages = total_stages
        self.__boolean_bounds = boolean_bounds

        if self._stage == 1:
            self.gas_network_settings["minimize_head_losses"] = True
            self.gas_network_settings["head_loss_option"] = HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY

        if self._stage == 2: # and priorities_output:
            # self._priorities_output = priorities_output
            self.gas_network_settings["n_linearization_lines"] = 3
            self.gas_network_settings["minimize_head_losses"] = False
            self.gas_network_settings["head_loss_option"] = HeadLossOption.LINEARIZED_N_LINES_EQUALITY

    def bounds(self):
        bounds = super().bounds()

        if self._stage == 2:
            bounds.update(self.__boolean_bounds)

        return bounds


class GasElectProblemStaged(SettingsStaged, GasElectProblem):
    pass


def run_end_scenario_sizing_for_gas_elect(
    end_scenario_problem_class,
    solver_class=None,
    staged_pipe_optimization=True,
    **kwargs,
):

    """
    This function is used to run end_scenario_sizing problem. There are a few variations of the
    same basic class. The main functionality this function adds is the staged approach, where ...


    Parameters
    ----------
    end_scenario_problem_class : The end scenario problem class.
    solver_class: The solver and its settings to be used to solve the problem.
    staged_pipe_optimization : Boolean to toggle between the staged or non-staged approach

    Returns
    -------
    """
    import time

    boolean_bounds = {}
    priorities_output = []

    start_time = time.time()

    if staged_pipe_optimization == False:
        solution = run_optimization_problem_solver(
            end_scenario_problem_class,
            solver_class=solver_class,
            stage=1,
            total_stages=1,
            **kwargs,
        )
    if staged_pipe_optimization and issubclass(end_scenario_problem_class, SettingsStaged):
        solution = run_optimization_problem_solver(
            end_scenario_problem_class,
            solver_class=solver_class,
            stage=1,
            total_stages=2,
            **kwargs,
        )
        # Error checking
        solver_success, _ = solution.solver_success(solution.solver_stats, False)
        if not solver_success:
            if (
                solution.solver_stats["return_status"] == "Time limit reached"
                and solution.objective_value > 1e-6
                and solution._stage == 1
            ):
                logger.error("Optimization maximum allowed time limit reached for stage_1, goal_1")
                exit(1)
            else:
                logger.error("Unsuccessful: unexpected error for stage_1, goal_1")
                exit(1)

        results = solution.extract_results()
        parameters = solution.parameters(0)
        bounds = solution.bounds()

        # We give bounds for stage 2 by allowing one DN sizes larger than what was found in the
        # stage 1 optimization. But if the pipe is not to be used class DN none should be used and
        # all the following pipe clasess should have bounds (0, 0)
        # Assumptions:
        # - The fist pipe class in the list of pipe_classes is pipe DN none
        pc_map = solution.get_pipe_class_map()  # if disconnectable and not connected to source
        for pipe_classes in pc_map.values():
            v_prev = 0.0
            first_pipe_class = True
            use_pipe_dn_none = False
            for var_name in pipe_classes.values():
                v = round(abs(results[var_name][0]))
                if first_pipe_class and v == 1.0:
                    boolean_bounds[var_name] = (v, v)
                    use_pipe_dn_none = True
                elif v == 1.0:
                    boolean_bounds[var_name] = (0.0, v)
                elif not use_pipe_dn_none and v_prev == 1.0:  # This allows one DN larger
                    boolean_bounds[var_name] = (0.0, 1.0)
                else:
                    boolean_bounds[var_name] = (v, v)
                v_prev = v
                first_pipe_class = False

        for asset in [
            *solution.energy_system_components.get("heat_source", []),
            *solution.energy_system_components.get("gas_source", []),
            *solution.energy_system_components.get("heat_buffer", []),
        ]:
            var_name = f"{asset}_aggregation_count"
            round_lb = round(results[var_name][0])
            ub = solution.bounds()[var_name][1]
            if round_lb >= 1 and (round_lb <= ub):
                boolean_bounds[var_name] = (round_lb, ub)
            elif round_lb > ub:
                logger.error(
                    f"{var_name}: The lower bound value {round_lb} > the upper bound {ub} value"
                )
                exit(1)
            a=1

        # priorities_output = solution._priorities_output

    # solution = run_optimization_problem_solver(
    #     end_scenario_problem_class,
    #     solver_class=solver_class,
    #     stage=2,
    #     total_stages=2,
    #     boolean_bounds=boolean_bounds,
    #     priorities_output=priorities_output,
    #     **kwargs,
    # )
    solution = run_optimization_problem_solver(
        end_scenario_problem_class,
        solver_class=solver_class,
        stage=2,
        total_stages=2,
        boolean_bounds=boolean_bounds,
        **kwargs,
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))

    return solution


@main_decorator
def main(runinfo_path, log_level):
    logger.info("Gas and electricity workflow")

    kwargs = {
        "write_result_db_profiles": False,
        "influxdb_host": "localhost",
        "influxdb_port": 8086,
        "influxdb_username": None,
        "influxdb_password": None,
        "influxdb_ssl": False,
        "influxdb_verify_ssl": False,
    }

    _ = run_optimization_problem(
        GasElectProblem,
        esdl_run_info_path=runinfo_path,
        log_level=log_level,
        **kwargs,
    )
