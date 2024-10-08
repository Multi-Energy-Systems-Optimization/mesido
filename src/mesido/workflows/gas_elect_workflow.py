import logging
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.goals.minimize_tco_goal import MinimizeTCO
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.utils.helpers import main_decorator

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import SinglePassGoalProgrammingMixin
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


class GasElectProblem(
    # SolverHIGHS,
    ScenarioOutput,
    # ESDLAdditionalVarsMixin,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self._number_of_years = 30.0

    def times(self, variable=None) -> np.ndarray:
        return super().times(variable)[:5]

    def pre(self):
        super().pre()

        # Convert gas demand m3/h to heat demand in watts
        # gas demand (Nm3/s) * 31.68* 10^6 (J/m3) = xxx (J/s), nominal values at 1bar, 273.15K
        # Assume operating pressure at 5bar T=10degr, so ratio is 3.62 / 0.8331kg/m3 to get actual
        # values
        # Actual gas demand = xxx * ratio_nominal_to_operating = yyy (J/s)
        ratio_nominal_to_operating = 0.8331 / 3.62
        # An efficiency of 80% is assumed for the gas boiler
        # Heat demand = yyy * 0.8 (Watt or J/s)
        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")

            # Manually set Demand
            for ii in range(len(target.values)):
                target.values[ii] *= 31.68 * 10**6 * ratio_nominal_to_operating * 0.8

            self.io.set_timeseries(
                f"{demand}.target_heat_demand",
                self.io._DataStore__timeseries_datetimes,
                target.values,
                0,
            )

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
