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

from rtctools.optimization.timeseries import Timeseries

DB_HOST = "172.17.0.2"
DB_PORT = 8086
DB_NAME = "Warmtenetten"
DB_USER = "admin"
DB_PASSWORD = "admin"

logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)

locale.setlocale(locale.LC_ALL, "")

WATT_TO_MEGA_WATT = 1.0e6
WATT_TO_KILO_WATT = 1.0e3


# -------------------------------------------------------------------------------------------------
# Step 1:
# Match the target demand specified
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
# Step 2:
# Match the maximum producer profiles
class TargetProducerGoal(Goal):
    def __init__(self, state, target, priority=2, order=2):
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
# Step 3:
# After an optim has been done with all availabe milp source (optional, default excluded), then use
# the merit order of milp source (something like [3, 1, 2]), which is the order of priority per
# milp source available for use. Minimize then milp source use with lowest priority 3, then milp
# source with prioity 2 etc
class MinimizeSourcesGoalMerit(Goal):
    """
    Apply constraints to enforce esdl specified milp producer merit order usage
    """

    def __init__(self, source_variable, prod_priority, func_range_bound, nominal, order=1):
        self.target_max = func_range_bound[0]
        self.function_range = func_range_bound
        self.source_variable = source_variable
        self.function_nominal = nominal
        self.priority = prod_priority
        self.order = order

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source_variable}")


class MaximizeDemandGoalMerit(Goal):
    """
    Apply constraints to enforce esdl specified milp producer merit order usage
    """

    def __init__(self, demand_variable, prod_priority, func_range_bound, nominal, order=1):
        self.target_min = func_range_bound[1]
        self.function_range = func_range_bound
        self.demand_variable = demand_variable
        self.function_nominal = nominal
        self.priority = prod_priority
        self.order = order

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.demand_variable}")


# -------------------------------------------------------------------------------------------------
class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        # Demand matching
        map_demand = {
            "electricity_demand": {
                "target": "target_electricity_demand",
                "state": "Electricity_demand",
            },
            "gas_demand": {"target": "target_gas_demand", "state": "Gas_demand"},
        }
        map_prod = {
            "electricity_source": {
                "target": "maximum_electricity_source",
                "state": "Electricity_source",
            },
            "gas_source": {"target": "maximum_gas_source", "state": "Gas_source"},
        }
        for type, type_values in [*map_demand.items(), *map_prod.items()]:
            for asset in self.energy_system_components.get(type, []):
                timeseries_name = f"{asset}.{type_values['target']}"
                if timeseries_name in self.io.get_timeseries_names():
                    target = self.get_timeseries(timeseries_name)
                    state = f"{asset}.{type_values['state']}"
                    if type in map_demand.keys():
                        goals.append(TargetDemandGoal(state, target))
                    else:
                        goals.append(TargetProducerGoal(state, target))

        # Producer profile matching
        # for producer in self.energy_system_components.get("electricity_source", []):
        #     bound = self.bounds()[f"{producer}.Electricity_source"][1]
        #     if isinstance(bound, Timeseries):  #tobe replaced by: producer in self.__set_point_map.keys():
        #         target = self.get_timeseries(f"{producer}.maximum_electricity_source")
        #         state = f"{producer}.Electricity_source"
        #
        #         goals.append(TargetProducerGoal(state, target))

        return goals


# -------------------------------------------------------------------------------------------------
class MultiCommoditySimulator(
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

    def __create_asset_list_controls(self, asset_types_to_include, assets_without_control):
        type_variable_map = {
            "electricity_demand": "Electricity_demand",
            "electricity_source": "Electricity_source",
            "gas_demand": "Gas_demand",
            "gas_source": "Gas_source",
            "gas_tank_storage": "Gas_tank_flow",
            "electrolyzer": "Gas_mass_flow_out",
        }
        # TODO: check if conversion priority needs to be set for production or consumption, currently it assumes production

        assets_to_include = {}
        asset_variable_map = {}
        available_timeseries = [t.split(".")[0] for t in self.io.get_timeseries_names()]
        for group, asset_types in asset_types_to_include.items():
            for asset_type in asset_types:
                for asset in self.energy_system_components.get(asset_type, []):
                    if asset not in available_timeseries:
                        if group in assets_to_include.keys():
                            assets_to_include[group].append(asset)
                        else:
                            assets_to_include[group] = [asset]
                    asset_variable_map[asset] = type_variable_map[asset_type]

        assets_list = [asset for a_type in assets_to_include.values() for asset in a_type]
        unused_asset = [
            asset.asset_type
            for asset in self.esdl_assets.values()
            if asset.asset_type not in assets_without_control
            if asset.name not in assets_list
            if asset.name not in available_timeseries
        ]
        assert (
            len(unused_asset) == 0
        ), f"Asset types: {unused_asset} are not included in controls of the simulator"

        asset_info = {
            "assets_to_include": assets_to_include,
            "assets_to_include_list": assets_list,
            "asset_variable_map": asset_variable_map,
        }
        return asset_info

    def __create_merit_path_goals(self, asset_info, max_value_merit, index_start_of_priority):
        goals = []
        assets_to_include = asset_info["assets_to_include"]
        assets_list = asset_info["assets_to_include_list"]
        asset_merit = asset_info["asset_merit"]
        asset_variable_map = asset_info["asset_variable_map"]
        for asset in assets_list:
            index_s = asset_merit["asset_name"].index(f"{asset}")
            marginal_priority = (
                index_start_of_priority + max_value_merit - asset_merit["merit_order"][index_s]
            )
            assert (
                marginal_priority >= index_start_of_priority
            ), "Priorities assigned must be smaller than the total number of producers"
            variable_name = f"{asset}.{asset_variable_map[asset]}"

            # if asset not in self.energy_system_components.get("electricity_demand", []):
            if asset in [
                *assets_to_include.get("source", []),
                *assets_to_include.get("conversion", []),
            ]:
                goals.append(
                    MinimizeSourcesGoalMerit(
                        variable_name,
                        marginal_priority,
                        self.bounds()[variable_name],
                        self.variable_nominal(variable_name),
                    )
                )
            elif asset in assets_to_include.get("demand", []):
                goals.append(
                    MaximizeDemandGoalMerit(
                        variable_name,
                        marginal_priority,
                        self.bounds()[variable_name],
                        self.variable_nominal(variable_name),
                    )
                )
            elif asset in assets_to_include.get("storage", []):
                # charging acts as consumer
                # Marginal costs for discharging > marginal cost for charging
                goals.append(
                    MaximizeDemandGoalMerit(
                        variable_name,
                        marginal_priority,
                        self.bounds()[variable_name],
                        self.variable_nominal(variable_name),
                    )
                )

                # discharging acts as producer
                # Marginal costs for discharging > marginal cost for charging
                index_s = asset_merit["asset_name"].index(f"{asset}_discharge")
                marginal_priority = (
                    index_start_of_priority + max_value_merit - asset_merit["merit_order"][index_s]
                )
                assert (
                    marginal_priority >= index_start_of_priority
                ), "Priorities assigned must be smaller than the total number of producers"
                variable_name = f"{asset}.{asset_variable_map[asset]}"

                goals.append(
                    MinimizeSourcesGoalMerit(
                        variable_name,
                        marginal_priority,
                        self.bounds()[variable_name],
                        self.variable_nominal(variable_name),
                    )
                )
            else:
                raise Exception(
                    f"No goal was set for {asset}, while a priority was provided. This asset group still has to be added to the goals."
                )
        return goals

    def __merit_path_goals(self):
        # TODO: improve the asset_types_to_include and esdl_assets_to_include
        asset_types_to_include = {
            "source": ["electricity_source", "gas_source"],
            "demand": ["electricity_demand", "gas_demand"],
            "conversion": ["electrolyzer"],
            "storage": ["gas_tank_storage"],
        }

        assets_without_control = ["Pipe", "ElectricityCable", "Joint", "Bus"]

        # TODO also include other assets than producers, e.g. storage, conversion and possible demand for the ones without a profile
        # TODO exclude producers from merit order if they have a profile, even if a marginal cost is set

        # Storage: charge priority (1) higher than discharge priority (2)
        #
        asset_info = self.__create_asset_list_controls(
            asset_types_to_include, assets_without_control
        )

        asset_info["asset_merit"] = self.__merit_controls(asset_info["assets_to_include_list"])
        max_value_merit = max(asset_info["asset_merit"]["merit_order"])

        # Priority 1 & 2 reserved for target demand goal & additional goal like matching
        # producer profile (without merit order)
        index_start_of_priority = 3

        goals = self.__create_merit_path_goals(asset_info, max_value_merit, index_start_of_priority)

        return goals

    def path_goals(self):
        goals = super().path_goals().copy()

        goals.extend(self.__merit_path_goals())

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

        # TODO: cyclic constraints

        return constraints

    def __merit_controls(self, assets_list):
        attributes = {
            "asset_name": [],
            "merit_order": [],
        }

        assets = self.esdl_assets
        for a in assets.values():
            if a.name in assets_list:
                # if a.asset_type != "ElectricityDemand" or f"{a.name}.target_electricity_demand" not in self.io.get_timeseries_names():
                attributes["asset_name"].append(a.name)
                try:
                    attributes["merit_order"].append(
                        a.attributes["costInformation"].marginalCosts.value
                    )
                except AttributeError:
                    try:
                        attributes["merit_order"].append(
                            a.attributes["costInformation"].marginalChargeCosts.value
                        )
                        attributes["merit_order"].append(
                            a.attributes["costInformation"].marginalDischargeCosts.value
                        )
                        attributes["asset_name"].append(f"{a.name}_discharge")
                    except AttributeError:
                        raise Exception(f"Asset: {a.name} does not have a merit order specified")

                last_merit_order = attributes["merit_order"][-1]

                if attributes["merit_order"][-1] <= 0.0:
                    raise Exception(
                        "The specified producer usage merit order must be a "
                        f"positve integer value, producer name:{a.name}, current "
                        f"specified merit value: {last_merit_order}"
                    )

        # update merit order to be integers and have maximumally one step in priority
        set_merit = set(attributes["merit_order"])
        order_prio = list(set_merit)
        order_prio.sort()
        map_prio = dict(zip(order_prio, list(range(1, len(set_merit) + 1))))
        a = [map_prio[v] for v in attributes["merit_order"]]
        attributes["merit_order"] = a
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
class MultiCommoditySimulatorHIGHS(MultiCommoditySimulator):
    def post(self):
        super().post()
        self._write_updated_esdl(self.get_energy_system_copy(), optimizer_sim=True)

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"

        return options


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
        MultiCommoditySimulatorHIGHS,
        esdl_run_info_path=runinfo_path,
        log_level=log_level,
        **kwargs,
    )


if __name__ == "__main__":
    main()
