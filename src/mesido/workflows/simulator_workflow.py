import locale
import logging

import esdl

from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day,
)
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


# -------------------------------------------------------------------------------------------------
# Step 1:
# Match the target milp demand specified
class TargetDemandGoal(Goal):
    def __init__(self, state, target, priority=1, order=2):
        self.state = state

        self.target_min = target
        self.target_max = target
        self.function_range = (-2.0 * max(target.values), 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)
        self.priority = priority
        self.order = order

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


# -------------------------------------------------------------------------------------------------
# TODO: create a variable such that this can be used as an option. Currently this is not used
# Step 2:
# Minimize the total milp produced
class MinimizeSourcesHeatGoal(Goal):
    def __init__(self, source, nominal=1e7, func_range_bound=1.0e8, priority=2, order=1):
        self.target_max = 0.0
        self.function_range = (0.0, func_range_bound)
        self.priority = priority
        self.order = order
        self.nominal = nominal
        self.source = source

    def function(self, optimization_problem, ensemble_member):
        obj = optimization_problem.state(f"{self.source}.Heat_source")

        return obj


# -------------------------------------------------------------------------------------------------
# Step 3:
# After an optim has been done with all availabe milp source (optional, default excluded), then use
# the merit order of milp source (something like [3, 1, 2]), which is the order of priority per
# milp source available for use. Minimize then milp source use with lowest priority 3, then milp
# source with prioity 2 etc
class MinimizeSourcesHeatGoalMerit(Goal):
    """
    Apply constraints to enforce esdl specified milp producer merit order usage
    """

    def __init__(self, source, prod_priority, func_range_bound, nominal, order=1):
        self.target_max = 0.0
        self.function_range = (0.0, func_range_bound)
        self.source = source
        self.function_nominal = nominal
        self.priority = prod_priority
        self.order = order

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Heat_source")
        # TODO: add other producer assets like ATES
        # if (prod_asset == 'source'):
        #     return optimization_problem.state(f"{self.source}.Heat_source")
        # elif (prod_asset == 'ates"):
        #     return optimization_problem.state(f"{self.source}.Heat_ates")
        # else:
        #     raise Exception("Source merit specification does not cater for asset type: "
        #                     f"{prod_asset} yet")


# -------------------------------------------------------------------------------------------------
class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        if False:
            for source in self.energy_system_components.get("heat_source", []):
                goals.append(
                    MinimizeSourcesHeatGoal(
                        source,
                        nominal=self.variable_nominal(f"{source}.Heat_source"),
                        func_range_bound=self.bounds()[f"{source}.Heat_source"][1],
                    )
                )

        return goals


# -------------------------------------------------------------------------------------------------
class NetworkSimulator(
    ScenarioOutput,
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    Goal priorities are:
    1. Match target demand specified
    2. Optional (default = excluded): minimize total milp produced by all producers
    3. Minimize producer usage based on merit order specified. First use producer with order 1, then
       use producer with order 2 etc.

    Notes:
    - Currently only yearly milp demand profiles (hourly) can be used, which is then converted to
      dialy averages
    - Currently the ATES does not have a merit order assigned.
    - The ATES has a time horizon cyclic contraints specified, and it is not allowed to deliver milp
      in the 1st time step
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._qpsol = None

    def pre(self):
        self._qpsol = CachingQPSol()

        super().pre()

    @property
    def esdl_assets(self):
        assets = super().esdl_assets

        for asset in assets.values():
            # Overwrite all assets marked as optional to be used
            if asset.attributes["state"].name in ["OPTIONAL"]:
                asset.attributes["state"] = esdl.AssetStateEnum.ENABLED
                logger.warning(
                    "The following asset has been specified as OPTIONAL but it has been changed "
                    f"to be included in the simulation, asset type: {asset.asset_type }, asset "
                    f"name: {asset.name}"
                )

        return assets

    def path_goals(self):
        goals = super().path_goals().copy()
        # TODO: add other producer assets
        # assets_to_include = ["heat_source", "ates"] # TODO: add other assets in the future
        assets_to_include = ["heat_source"]

        number_of_source_producers = 0
        for prod_asset in assets_to_include:
            number_of_source_producers = number_of_source_producers + len(
                self.energy_system_components[prod_asset]
            )

        producer_merit = self.producer_merit_controls()
        for prod_asset in assets_to_include:
            # Priority 1 & 2 reserved for target demand goal & minimize milp source (without merit
            # order)
            index_start_of_priority = 3
            for src in self.energy_system_components[prod_asset]:
                index_s = producer_merit["producer_name"].index(f"{src}")
                producer_priority = (
                    index_start_of_priority
                    + number_of_source_producers
                    - producer_merit["merit_order"][index_s]
                )
                goals.append(
                    MinimizeSourcesHeatGoalMerit(
                        src,
                        producer_priority,
                        self.bounds()[f"{src}.Heat_source"][1],
                        self.variable_nominal(f"{src}.Heat_source"),
                    )
                )

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()

        self.heat_network_settings["head_loss_option"] = (
            HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
        )
        self.heat_network_settings["minimize_head_losses"] = True

        return options

    def constraints(self, ensemble_member):
        """
        Add equality constraints to enforce a cyclic energy balance [J] between the end and the
        start of the time horizon used as well an inequality constraint to enforce no milp supply
        [W] to the netwok in the 1st time step
        """
        constraints = super().constraints(ensemble_member)

        for ates in self.energy_system_components.get("ates", []):
            stored_heat_joules = self.__state_vector_scaled(f"{ates}.Stored_heat", ensemble_member)
            heat_ates_watts = self.__state_vector_scaled(f"{ates}.Heat_ates", ensemble_member)
            constraints.append(
                (
                    (stored_heat_joules[-1] - stored_heat_joules[0])
                    / self.variable_nominal(f"{ates}.Stored_heat"),
                    0.0,
                    0.0,
                )
            )
            constraints.append(
                (heat_ates_watts[0] / self.variable_nominal(f"{ates}.Heat_ates"), -np.inf, 0.0)
            )

        return constraints

    def producer_merit_controls(self):
        attributes = {
            "producer_name": [],
            "merit_order": [],
        }
        assets = self.esdl_assets
        for a in assets.values():
            if (
                a.asset_type == "HeatProducer"
                or a.asset_type == "GenericProducer"
                or a.asset_type == "ResidualHeatSource"
                or a.asset_type == "GasHeater"
                or a.asset_type == "GeothermalSource"
            ):
                attributes["producer_name"].append(a.name)
                try:
                    attributes["merit_order"].append(
                        a.attributes["costInformation"].marginalCosts.value
                    )
                except AttributeError:
                    raise Exception(f"Producer: {a.name} does not have a merit order specified")

                last_merit_order = attributes["merit_order"][-1]
                if attributes["merit_order"][-1] % 1.0 != 0.0:
                    raise Exception(
                        "The specified producer usage merit order must be an "
                        f"integer value, producer name:{a.name}, current specified "
                        f"merit value: {last_merit_order}"
                    )
                elif attributes["merit_order"][-1] <= 0.0:
                    raise Exception(
                        "The specified producer usage merit order must be a "
                        f"positve integer value, producer name:{a.name}, current "
                        f"specified merit value: {last_merit_order}"
                    )

        return attributes

    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol

        return options

    def __state_vector_scaled(self, variable, ensemble_member):
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )


# -------------------------------------------------------------------------------------------------
class NetworkSimulatorHIGHS(NetworkSimulator):
    def post(self):
        super().post()
        self._write_updated_esdl(
            self._ESDLMixin__energy_system_handler.energy_system,
            optimizer_sim=True,
        )

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"

        return options


class NetworkSimulatorHIGHSTestCase(NetworkSimulatorHIGHS):
    def times(self, variable=None) -> np.ndarray:
        return super().times(variable)[:5]

    def energy_system_options(self):
        options = super().energy_system_options()

        options["heat_loss_disconnected_pipe"] = False

        return options


class NetworkSimulatorHIGHSWeeklyTimeStep(NetworkSimulatorHIGHS):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.__indx_max_peak = None
        self.__day_steps = 5

    def parameters(self, ensemble_member):
        parameters = super().parameters(ensemble_member)
        parameters["peak_day_index"] = self.__indx_max_peak
        parameters["time_step_days"] = self.__day_steps
        return parameters

    def read(self):
        """
        Reads the yearly profile with hourly time steps and adapt to a daily averaged profile
        except for the day with the peak demand.
        """
        super().read()

        self.__indx_max_peak, _, _ = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(
            self, self.__day_steps
        )
        logger.info("HeatProblem read")


# -------------------------------------------------------------------------------------------------
@main_decorator
def main(runinfo_path, log_level):
    logger.info("Run Network Simulator")

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
        NetworkSimulatorHIGHSWeeklyTimeStep,
        esdl_run_info_path=runinfo_path,
        log_level=log_level,
        **kwargs,
    )


if __name__ == "__main__":
    main()
