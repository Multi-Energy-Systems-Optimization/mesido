import locale
import logging
import os
import sys
import time
from typing import Dict

from mesido.esdl.esdl_additional_vars_mixin import ESDLAdditionalVarsMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.head_loss_class import HeadLossOption
from mesido.potential_errors import reset_potential_errors
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.goals.minimize_tco_goal import MinimizeTCO
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day,
)
from mesido.workflows.utils.error_types import HEAT_NETWORK_ERRORS, potential_error_to_error
from mesido.workflows.utils.helpers import main_decorator, run_optimization_problem_solver

import numpy as np

from rtctools._internal.alias_tools import AliasDict
from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin_base import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import (
    CachingQPSol,
    SinglePassGoalProgrammingMixin,
)


DB_HOST = "172.17.0.2"
DB_PORT = 8086
DB_NAME = "Warmtenetten"
DB_USER = "admin"
DB_PASSWORD = "admin"

logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)

locale.setlocale(locale.LC_ALL, "")

ns = {"fews": "http://www.wldelft.nl/fews", "pi": "http://www.wldelft.nl/fews/PI"}

WATT_TO_MEGA_WATT = 1.0e6
WATT_TO_KILO_WATT = 1.0e3


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


def _mip_gap_settings(mip_gap_name: str, problem) -> Dict[str, float]:
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


def estimate_and_update_progress_status(self, priority):
    """Estimate the progress of the optimization workflow. Currently the tasks completed in this
    workflow is used to estimate the progress (ratio between 0 and 1). The task completed ratio is
    the number of tasks completed divided by the total number of tasks. The total number of tasks
    is estimated based on the stage number and the priority of the task. The progress is then
    passed to the workflow progress status function (OMOTES back end)."""
    # TODO: the estimates below needs to be improved in the future instead of using task numbers

    if self._workflow_progress_status is None:
        logger.error("The workflow progress status function is not set. Cannot estimate progress.")
        exit(1)

    if self._total_stages == 1:
        denominator = 2.0
        if priority == 1:  # match heat demand
            numerator = 1.0
        elif priority == 2:  # minimize TCO
            numerator = 2.0
        else:
            sys.exit(
                f"The function does not cater for stage number:{self._stage} & priority:{priority}"
            )
    elif self._total_stages == 2:
        denominator = 4.0 + 2.0 * self.heat_network_settings["minimize_head_losses"]
        if priority == 1 and self._stage == 1:  # match heat demand
            numerator = 1.0
        elif priority == 2 and self._stage == 1:  # minimize TCO
            numerator = 2.0
        elif priority == 1 and self._stage == 2:  # match heat demand
            numerator = 3.0
        elif priority == 2 and self._stage == 2:  # minimize TCO
            numerator = 4.0
        elif priority == (2**31 - 2) and self._stage == 2:  # head loss optimization
            numerator = 5.0
        elif priority == (2**31 - 1) and self._stage == 2:  # hydraulic power optimization
            numerator = 6.0
        else:
            sys.exit(
                f"The function does not cater for stage number:{self._stage} & priority:{priority}"
            )
    else:
        sys.exit(
            f"The stage number: {self._stage} is higher then the total stages"
            f" expected: {self._total_stages}. Assuming the stage numbering starts at 1."
        )

    # This kwarg only exists when the code is used in OMOTES backend
    task_quantity_perc_completed = numerator / denominator
    self._workflow_progress_status(
        task_quantity_perc_completed,
        f"Optimization task {numerator} out of {denominator} has completed",
    )  # In the future this ratio might differ from the step being completed


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


class SolverGurobi:
    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "gurobi"
        gurobi_options = options["gurobi"] = {}
        gurobi_options.update(_mip_gap_settings("MIPgap", self))
        gurobi_options["threads"] = 4
        gurobi_options["LPWarmStart"] = 2

        options["highs"] = None

        return options


class SolverCPLEX:
    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "cplex"
        cplex_options = options["cplex"] = {}
        cplex_options.update(_mip_gap_settings("CPX_PARAM_EPGAP", self))

        options["highs"] = None

        return options


class EndScenarioSizing(
    SolverHIGHS,
    ScenarioOutput,
    ESDLAdditionalVarsMixin,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    This class is the base class to run all the other EndScenarioSizing classes from.

    HIGHS is now the standard solver and gurobi only to be used when called specifically.

    Goal priorities are:
    1. Demand matching (e.g. minimize (heat demand - heat consumed))
    2. minimize TCO = Capex + Opex*lifetime
    """

    def __init__(self, *args, **kwargs):
        reset_potential_errors()  # This needed to clear the Singleton which is persistent

        super().__init__(*args, **kwargs)

        # default setting to cater for ~ 10kW heat, DN800 pipe at dT = 40 degrees Celcuis
        self.heat_network_settings["minimum_velocity"] = 1.0e-4

        self.heat_network_settings["maximum_velocity"] = 3.0
        self.heat_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS

        self._override_hn_options = {}

        self._number_of_years = 30.0

        self.__indx_max_peak = None
        self.__day_steps = 5

        # self._override_pipe_classes = {}

        # variables for solver settings
        self._qpsol = None

        self._hot_start = False

        # Store (time taken, success, objective values, solver stats) per priority
        self._priorities_output = []
        self.__priority = None
        self.__priority_timer = None

        self.__heat_demand_bounds = dict()
        self.__heat_demand_nominal = dict()

        self._save_json = False

        self._workflow_progress_status = kwargs.get("update_progress_function", None)

    def parameters(self, ensemble_member):
        parameters = super().parameters(ensemble_member)
        parameters["peak_day_index"] = self.__indx_max_peak
        parameters["time_step_days"] = self.__day_steps
        parameters["number_of_years"] = self._number_of_years
        return parameters

    def pre(self):
        self._qpsol = CachingQPSol()

        super().pre()

    def read(self):
        """
        Reads the yearly profile with hourly time steps and adapt to a daily averaged profile
        except for the day with the peak demand.
        """
        super().read()

        potential_error_to_error(HEAT_NETWORK_ERRORS)

        (
            self.__indx_max_peak,
            self.__heat_demand_nominal,
            _,
        ) = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(self, self.__day_steps)

        logger.info("HeatProblem read")

    def bounds(self):
        bounds = super().bounds()
        bounds.update(self.__heat_demand_bounds)
        return bounds

    def variable_nominal(self, variable):
        try:
            return self.__heat_demand_nominal[variable]
        except KeyError:
            return super().variable_nominal(variable)

    def energy_system_options(self):
        # TODO: make empty placeholder in HeatProblem we don't know yet how to put the global
        #  constraints in the ESDL e.g. min max pressure
        options = super().energy_system_options()
        options["maximum_temperature_der"] = np.inf
        options["heat_loss_disconnected_pipe"] = True
        return options

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
        # We do a minization of TCO consisting of CAPEX and OPEX over 25 years
        # CAPEX is based upon the boolean placement variables and the optimized maximum sizes
        # Note that CAPEX for geothermal and ATES is also dependent on the amount of doublets
        # In practice this means that the CAPEX is mainly driven by the peak day problem
        # The OPEX is based on the Source strategy which is computed on the __daily_avg variables
        # The OPEX thus is based on an avg strategy and discrepancies due to fluctuations intra-day
        # are possible.
        # The idea behind the two timelines is that the optimizer can make the OPEX vs CAPEX
        # trade-offs

        goals.append(MinimizeTCO(priority=2, number_of_years=self._number_of_years))

        return goals

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        for a in self.energy_system_components.get("ates", []):
            stored_heat = self.state_vector(f"{a}.Stored_heat")
            constraints.append(((stored_heat[-1] - stored_heat[0]), 0.0, np.inf))
            ates_temperature = self.state_vector(f"{a}.Temperature_ates")
            constraints.append(((ates_temperature[-1] - ates_temperature[0]), 0.0, np.inf))

        for b in self.energy_system_components.get("heat_buffer", {}):
            vars = self.state_vector(f"{b}.Heat_buffer")
            symbol_stored_heat = self.state_vector(f"{b}.Stored_heat")
            constraints.append((symbol_stored_heat[self.__indx_max_peak], 0.0, 0.0))
            for i in range(len(self.times())):
                if i < self.__indx_max_peak or i > (self.__indx_max_peak + 23):
                    constraints.append((vars[i], 0.0, 0.0))

        return constraints

    def history(self, ensemble_member):
        return AliasDict(self.alias_relation)

    def __state_vector_scaled(self, variable, ensemble_member):
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )

    def solver_options(self):
        options = super().solver_options()
        if options["solver"] == "highs":
            highs_options = options["highs"]
            if self.__priority == 1:
                highs_options["time_limit"] = 600
            else:
                highs_options["time_limit"] = 100000
        return options

    def solver_success(self, solver_stats, log_solver_failure_as_error):
        success, log_level = super().solver_success(solver_stats, log_solver_failure_as_error)

        # Allow time-outs for CPLEX and CBC
        if (
            solver_stats["return_status"] == "time limit exceeded"
            or solver_stats["return_status"] == "stopped - on maxnodes, maxsols, maxtime"
        ):
            if self.objective_value > 1e10:
                # Quick check on the objective value. If no solution was
                # found, this is typically something like 1E50.
                return success, log_level

            return True, logging.INFO
        else:
            return success, log_level

    def priority_started(self, priority):
        goals_print = set()
        for goal in [*self.path_goals(), *self.goals()]:
            if goal.priority == priority:
                goals_print.update([str(type(goal))])
        logger.info(f"{goals_print}")
        self.__priority = priority
        self.__priority_timer = time.time()

        super().priority_started(priority)

    def priority_completed(self, priority):
        super().priority_completed(priority)

        self._hot_start = True

        time_taken = time.time() - self.__priority_timer
        self._priorities_output.append(
            (
                priority,
                time_taken,
                True,
                self.objective_value,
                self.solver_stats,
            )
        )
        if priority == 1 and self.objective_value > 1e-6:
            raise RuntimeError("The heating demand is not matched")

        if self._workflow_progress_status is not None:
            estimate_and_update_progress_status(self, priority)

    def post(self):
        # In case the solver fails, we do not get in priority_completed(). We
        # append this last priority's statistics here in post().
        # TODO: check if we still need this small part of code below
        success, _ = self.solver_success(self.solver_stats, False)
        if not success:
            time_taken = time.time() - self.__priority_timer
            self._priorities_output.append(
                (
                    self.__priority,
                    time_taken,
                    False,
                    self.objective_value,
                    self.solver_stats,
                )
            )

        super().post()
        results = self.extract_results()
        parameters = self.parameters(0)
        # bounds = self.bounds()
        # Optimized ESDL
        # Assume there are either no stages (write updated ESDL) or a maximum of 2 stages
        # (only write final results when the stage number is the final stage)
        # TODO: once database testing has been added, check that the results have only been written
        # once.
        try:
            if self._stage == 0:
                logger.error(
                    f"The stage number is: {self._stage} and it is excpected that the"
                    " stage numbering starts at 1 instead"
                )
                sys.exit(1)
            if self._total_stages == self._stage:  # When staging does exists
                self._write_updated_esdl(self._ESDLMixin__energy_system_handler.energy_system)
            elif self._total_stages < self._stage:
                logger.error(
                    f"The stage number: {self._stage} is higher then the total stages"
                    " expected: {self._total_stages}. Assuming the stage numbering starts at 1"
                )
                sys.exit(1)

        except AttributeError:
            # Staging does not exist
            self._write_updated_esdl(self._ESDLMixin__energy_system_handler.energy_system)
        except Exception:
            logger.error("Unkown error occured when evaluating self._stage for _write_updated_esdl")
            sys.exit(1)

        for d in self.energy_system_components.get("heat_demand", []):
            realized_demand = results[f"{d}.Heat_demand"]
            target = self.get_timeseries(f"{d}.target_heat_demand").values
            timesteps = np.diff(self.get_timeseries(f"{d}.target_heat_demand").times)
            parameters[f"{d}.target_heat_demand"] = target.tolist()
            delta_energy = np.sum((realized_demand - target)[1:] * timesteps / 1.0e9)
            if delta_energy >= 1.0:
                logger.warning(f"For demand {d} the target is not matched by {delta_energy} GJ")

        if os.path.exists(self.output_folder) and self._save_json:
            bounds = self.bounds()
            aliases = self.alias_relation._canonical_variables_map
            solver_stats = self.solver_stats
            self._write_json_output(results, parameters, bounds, aliases, solver_stats)


class EndScenarioSizingHIGHS(EndScenarioSizing):
    """
    HIGHS is now the standard solver and gurobi only to be used when called specifically.
    Currently, the classes in HIGHS are maintained such that the same 'old' function calling can be
    used for the code running in NWN.
    """

    pass


class EndScenarioSizingDiscounted(EndScenarioSizing):
    """
    The Discounted Annualized Cost is used as the objective function.
    Changing the objective function is done by setting the 'discounted_annualized_cost' option
    to True

    Goal priorities are:
    1. Match heat demand with target
    2. Minimize annualized TCO = discounted annualized CAPEX (function of technical lifetime
    of each asset) + annual OPEX.
    """

    def energy_system_options(self):
        options = super().energy_system_options()

        options["discounted_annualized_cost"] = True

        return options


class EndScenarioSizingHeadLoss(EndScenarioSizing):
    """
    EndScenarioSizing optimisation including the linearised inequality DarcyWeisbach Head loss
    relations

    The minimize_head_losses setting can be set to False as the pumping costs can be included in
    the TCO, it does require a price profile to be added to the electricity carrier, else it should
     be set to True.
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.heat_network_settings["head_loss_option"] = (
            HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
        )
        self.heat_network_settings["minimize_head_losses"] = True


class EndScenarioSizingHeadLossDiscounted(EndScenarioSizingHeadLoss, EndScenarioSizingDiscounted):
    pass


class SettingsStaged:
    """
    Additional settings to be used when a staged approach should be implemented.
    Staged approach currently entails 2 stages:
    1. optimisation without heat losses and thus a much smaller MIPgap (in solver options) is used
    to ensure the bounds set for the second stage are not limiting the optimal solution
    2. optimisation including heat losses with updated boolean bounds (smaller range) of asset
    sizes and flow directions.
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
            self.heat_network_settings["minimum_velocity"] = 0.0
            self.heat_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS
            self.heat_network_settings["minimize_head_losses"] = False

        if self._stage == 2 and priorities_output:
            self._priorities_output = priorities_output

    def energy_system_options(self):
        options = super().energy_system_options()
        if self._stage == 1:
            options["neglect_pipe_heat_losses"] = True
            self.heat_network_settings["minimum_velocity"] = 0.0

        return options

    def bounds(self):
        bounds = super().bounds()

        if self._stage == 2:
            bounds.update(self.__boolean_bounds)

        return bounds


class EndScenarioSizingStaged(SettingsStaged, EndScenarioSizing):
    pass


class EndScenarioSizingDiscountedStaged(SettingsStaged, EndScenarioSizingDiscounted):
    pass


class EndScenarioSizingHeadLossStaged(SettingsStaged, EndScenarioSizingHeadLoss):
    pass


class EndScenarioSizingHeadLossDiscountedStaged(
    SettingsStaged, EndScenarioSizingHeadLossDiscounted
):
    pass


def run_end_scenario_sizing_no_heat_losses(
    end_scenario_problem_class,
    solver_class=SolverHIGHS,
    **kwargs,
):
    """
    This function is used to run end_scenario_sizing problem without milp losses. This is a
    simplification from the fully staged approach allowing users to more quickly iterate over
    results.

    Parameters
    ----------
    end_scenario_problem_class : The end scenario problem class.
    solver_class: The solver and its settings to be used to solve the problem.
    staged_pipe_optimization : Boolean to toggle between the staged or non-staged approach

    Returns
    -------

    """
    import time

    assert issubclass(
        end_scenario_problem_class, SettingsStaged
    ), "A staged problem class is required as input for the sizing without heat_losses"

    start_time = time.time()
    solution = run_optimization_problem_solver(
        end_scenario_problem_class,
        solver_class=solver_class,
        stage=1,
        total_stages=1,
        **kwargs,
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))

    return solution


def run_end_scenario_sizing(
    end_scenario_problem_class,
    solver_class=None,
    staged_pipe_optimization=True,
    **kwargs,
):
    """
    This function is used to run end_scenario_sizing problem. There are a few variations of the
    same basic class. The main functionality this function adds is the staged approach, where
    we first solve without heat_losses, to then solve the same problem with milp losses but
    constraining the problem to only allow for the earlier found pipe classes and one size up.

    This staged approach is done to speed up the problem, as the problem without milp losses is
    much faster as it avoids inequality big_m constraints for the milp to discharge on pipes. The
    one size up possibility is to avoid infeasibilities in compensating for the milp losses.

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

        t = solution.times()
        from rtctools.optimization.timeseries import Timeseries

        for p in solution.energy_system_components.get("heat_pipe", []):
            if p in solution.hot_pipes and parameters[f"{p}.area"] > 0.0:
                lb = []
                ub = []
                bounds_pipe = bounds[f"{p}__flow_direct_var"]
                for i in range(len(t)):
                    r = results[f"{p}__flow_direct_var"][i]
                    # bound to roughly represent 4km of milp losses in pipes
                    lb.append(
                        r
                        if abs(results[f"{p}.Q"][i] / parameters[f"{p}.area"]) > 2.5e-2
                        else bounds_pipe[0]
                    )
                    ub.append(
                        r
                        if abs(results[f"{p}.Q"][i] / parameters[f"{p}.area"]) > 2.5e-2
                        else bounds_pipe[1]
                    )

                boolean_bounds[f"{p}__flow_direct_var"] = (Timeseries(t, lb), Timeseries(t, ub))
                try:
                    r = results[f"{p}__is_disconnected"]
                    boolean_bounds[f"{p}__is_disconnected"] = (Timeseries(t, r), Timeseries(t, r))
                except KeyError:
                    pass

        priorities_output = solution._priorities_output

    solution = run_optimization_problem_solver(
        end_scenario_problem_class,
        solver_class=solver_class,
        stage=2,
        total_stages=2,
        boolean_bounds=boolean_bounds,
        priorities_output=priorities_output,
        **kwargs,
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))

    return solution


@main_decorator
def main(runinfo_path, log_level):
    logger.info("Run Scenario Sizing")

    kwargs = {
        "write_result_db_profiles": False,
        "influxdb_host": "localhost",
        "influxdb_port": 8086,
        "influxdb_username": None,
        "influxdb_password": None,
        "influxdb_ssl": False,
        "influxdb_verify_ssl": False,
    }
    # Temp comment for now
    # omotes-poc-test.hesi.energy
    # port 8086
    # user write-user
    # password nwn_write_test

    _ = run_optimization_problem_solver(
        EndScenarioSizing,
        solver_class=SolverHIGHS,
        esdl_run_info_path=runinfo_path,
        log_level=log_level,
        **kwargs,
    )


if __name__ == "__main__":
    main()
