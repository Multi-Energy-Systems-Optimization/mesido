import logging

from mesido.esdl.esdl_additional_vars_mixin import ESDLAdditionalVarsMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.goals.minimize_tco_goal import MinimizeTCO
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.network_common import NetworkSettings
from mesido.workflows.utils.helpers import main_decorator

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


class SolverCPLEX:
    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "cplex"
        cplex_options = options["cplex"] = {}
        cplex_options["CPX_PARAM_EPGAP"] = 0.005  # 0.00001

        options["highs"] = None

        return options


class GasElectProblem(
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

        self._number_of_years = 1  # 30.0

        self._save_json = False

    def energy_system_options(self):
        options = super().energy_system_options()
        options["neglect_pipe_heat_losses"] = True
        options["include_electric_cable_power_loss"] = False
        # TODO: determine why no heat pump (case with heat pumps & boilers) is used when pwer
        # losses are included
        # options["include_electric_cable_power_loss"] = True

        # Setting for gas type
        self.gas_network_settings["network_type"] = (
            NetworkSettings.NETWORK_TYPE_HYDROGEN
        )  # For natural gas use NetworkSettings.NETWORK_TYPE_GAS

        # Setting when started with head loss inclusions
        self.gas_network_settings["minimum_velocity"] = 0.0
        self.gas_network_settings["maximum_velocity"] = 15.0

        # TODO: resolve scaling and potential other issues preventing HIGHS to optimize the system
        # when LINEARIZED_N_LINES_EQUALITY head loss setting is used
        self.gas_network_settings["n_linearization_lines"] = 3
        self.gas_network_settings["minimize_head_losses"] = False
        self.gas_network_settings["head_loss_option"] = HeadLossOption.LINEARIZED_N_LINES_EQUALITY

        # self.gas_network_settings["minimize_head_losses"] = False
        # self.gas_network_settings["head_loss_option"] = (
        #     HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
        # )

        return options

    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options["mip_abs_gap"] = 1.0e-6

        return options

    def read(self):
        super().read()

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
    #         power_elec = self.state(f"{eb}.Power_elec")
    #         constraints.append((power_elec, 0.0, 0.0))

    #     return constraints

    def post(self):
        super().post()
        # self._write_updated_esdl(self._ESDLMixin__energy_system_handler.energy_system)


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
