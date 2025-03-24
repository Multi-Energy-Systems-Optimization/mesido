import locale
import logging
import os
import time
from pathlib import Path
from typing import Dict

import esdl

from mesido.electricity_physics_mixin import ElectrolyzerOption
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.network_common import NetworkSettings
from mesido.physics_mixin import PhysicsMixin
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.utils.helpers import main_decorator, run_optimization_problem_solver

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
from rtctools.optimization.timeseries import Timeseries
from rtctools.util import run_optimization_problem

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


def _extract_values_timeseries(v, type_r=None):
    if isinstance(v, Timeseries):
        v = v.values
        if type_r == "min":
            v = min(v)
        elif type_r == "max":
            v = max(v)
    return v


class OptimisationOverview:
    """
    This class is used to combine the optimisation results, bounds, parameters and aliases
    needed for post-processing and visualisation.
    """

    def __init__(self, total_results, bounds, parameters, aliases, demand_mismatch):
        self.results = total_results
        self.bounds = bounds
        self.parameters = parameters
        self.aliases = aliases
        self.demand_mismatch = demand_mismatch


class SolverHIGHS:
    """
    Class setting the solver options to use highs in the multicommodity_simulator, which can be
    inherited by a class describing the optimization problem.
    Presolve is turned off as in some cases in resulted in an infeasible problem and the relative
    MIP gap is set to 0.01%
    """

    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options["mip_rel_gap"] = 0.0001
        highs_options["presolve"] = "off"

        options["gurobi"] = None
        options["cplex"] = None

        return options


class SolverGurobi:
    """
    Class setting the solver options to use Gurobi in the multicommodity_simulator, which can be
    inherited by a class describing the optimization problem.
    The relative MIP gap is set to 0.01% and 4 threads are used to sole the problem.
    """
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._priority = None

    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "gurobi"
        gurobi_options = options["gurobi"] = {}
        gurobi_options["MIPgap"] = 0.0001
        gurobi_options["threads"] = 6
        gurobi_options["LPWarmStart"] = 2
        gurobi_options["TimeLimit"] = 500
        if self._priority:
            if self._priority>4:
                gurobi_options["MIPgap"] = 0.005
            if self._priority>1e4:
                gurobi_options["MIPgap"] = 0.05

        options["highs"] = None
        options["cplex"] = None

        return options


class SolverCPLEX:
    """
    Class setting the solver options to use CPLEX in the multicommodity_simulator, which can be
    inherited by a class describing the optimization problem.
    The relative MIP gap is set to 0.01%.
    """
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._priority = None

    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "cplex"
        cplex_options = options["cplex"] = {}
        cplex_options["CPXPARAM_Threads"] = 4
        cplex_options["CPX_PARAM_EPGAP"] = 0.00001
        cplex_options["CPXPARAM_TimeLimit"] = 1000
        cplex_options["CPXPARAM_Tune_Display"] = 3
        if self._priority:
            if self._priority>1e4:
                cplex_options["CPX_PARAM_EPGAP"] = 0.01

        options["highs"] = None
        options["gurobi"] = None

        return options


# -------------------------------------------------------------------------------------------------
# Step 1:
# Match the target demand specified
class TargetDemandGoal(Goal):
    def __init__(self, state, target, priority=1, order=2):
        self.state = state

        self.target_min = target
        self.target_max = target
        self.function_range = (-2.0 * max(target.values), 2.0 * max(target.values)) if max(target.values)!=0.0 else (-1.0,1.0)
        self.function_nominal = np.median(target.values) if np.median(target.values)!=0.0 else 1.0
        self.priority = priority
        self.order = order

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)

class TargetDemandGoalMinimization(Goal):
    def __init__(self, state, target, priority=2, order=1):
        self.state = state

        # self.function_range = (-2.0 * max(target.values), 2.0 * max(target.values)) if max(target.values)!=0.0 else (-1.0,1.0)
        self.function_nominal = np.median(target.values) if np.median(target.values)!=0.0 else 1.0
        self.priority = priority
        self.order = order

    def function(self, optimization_problem, ensemble_member):
        return -optimization_problem.state(self.state)


# -------------------------------------------------------------------------------------------------
# Step 2:
# Match the maximum producer profiles
class TargetProducerGoal(Goal):
    def __init__(self, state, target, priority=20, order=2):
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
# The merit order of the sources and consumers (something like [3, 1, 2]), determine the priority
# in which the source is available for use and the consumer to consume.
# The priorities are determined based on the marginal costs provided in ESDL. For producer, the
# lower the marginal costs, the more the producer should be used (e.g. cheap to use). For consumers
# the opposite is true, the higher the marginal costs (e.g. more revenue), the more energy should
# be delivered to that consumer.
# Minimize the source use with lowest priority 3 (highest marginal costs), then the source with
# priority 2 etc, while the consumers are maximised starting with the highest marginal costs.
class MinimizeSourcesGoalMerit(Goal):
    """
    Apply constraints to enforce esdl specified milp producer merit order usage
    """

    def __init__(self, source_variable, prod_priority, func_range_bound, nominal, order=2):
        self.target_max = 0.0  # func_range_bound[0]
        self.function_range = func_range_bound
        self.source_variable = source_variable
        self.function_nominal = nominal
        self.priority = prod_priority
        self.order = order

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source_variable}")


class MaximizeDemandGoalMerit(Goal):
    """
    Apply constraints to enforce maximisation of consumption, priority is based on the marginal
    costs
    """

    def __init__(self, demand_variable, prod_priority, func_range_bound, nominal, order=2):

        self.demand_variable = demand_variable
        self.function_nominal = nominal
        self.priority = prod_priority
        self.order = 1

    def function(self, optimization_problem, ensemble_member):
        return -optimization_problem.state(f"{self.demand_variable}")


class MinimizeStorageGoalMerit(Goal):
    """
    Apply constraints to enforce minimisation of charging of storage, priority is based on the
    marginal costs
    """

    def __init__(self, source_variable, prod_priority, func_range_bound, nominal, order=2):
        self.target_max = 0.0
        self.function_range = func_range_bound
        self.source_variable = source_variable
        self.function_nominal = nominal
        self.priority = prod_priority
        self.order = order

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source_variable}")


class MaximizeStorageGoalMerit(Goal):
    """
    Apply constraints to enforce maximisation of discharging of storage, priority is based on the
    marginal costs
    """

    def __init__(self, demand_variable, prod_priority, func_range_bound, nominal, order=2):
        self.target_min = func_range_bound[1]
        self.function_range = func_range_bound
        self.demand_variable = demand_variable
        self.function_nominal = nominal
        self.priority = prod_priority
        self.order = order

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.demand_variable}")


class MinimizeCosts(Goal):
    def __init__(self, asset_cost_map: Dict[str, float], priority: int= 4, order: int = 1):
        self.asset_cost_map = asset_cost_map
        self.priority = priority
        self.order = order
        self.function_nominal = 1e9


    def function(self, optimization_problem, ensemble_member):

        obj = 0.0
        #TODO: think about difference magnitude of value between electricity and gas --> will cause small magnitude differences, which will result in changes within the MIPGAP
        for var_name, marg_cost in self.asset_cost_map.items():
            try:
                variable = optimization_problem.state(var_name)
            except KeyError:
                variable = optimization_problem.extra_variable(var_name)
            obj += variable * marg_cost

        return obj



# -------------------------------------------------------------------------------------------------
class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        # Demand and producer matching
        map_demand = {
            "electricity_demand": {
                "target": "target_electricity_demand",
                "state": "Electricity_demand",
            },
            "gas_demand": {"target": "target_gas_demand", "state": "Gas_demand_mass_flow"},
        }
        map_prod = {
            "electricity_source": {
                "target": "maximum_electricity_source",
                "state": "Electricity_source",
            },
            "gas_source": {"target": "maximum_gas_source", "state": "Gas_source_mass_flow"},
        }
        for type, type_values in [*map_demand.items(), *map_prod.items()]:
            for asset in self.energy_system_components.get(type, []):
                timeseries_name = f"{asset}.{type_values['target']}"
                if timeseries_name in self.io.get_timeseries_names():
                    target = self.get_timeseries(timeseries_name)
                    state = f"{asset}.{type_values['state']}"
                    if type in map_demand.keys():
                        goals.append(TargetDemandGoal(state, target))
                    elif type == "gas_source":
                        priority =2
                        # goals.append(TargetDemandGoal(state, target, priority=2))
                        goals.append(TargetDemandGoalMinimization(state, target, priority=2))
                    else:
                        priority = 2# 2 * len(self._esdl_assets)
                        # goals.append(TargetProducerGoal(state, target, priority=3))

        # Constant massflows at the landing points (EEM and DEN)
        goals.append(TargetDemandGoalMinimization(state='gasconversion_EEM.GasIn.mass_flow',
                                      target=Timeseries(target.times, np.array([48908.36056553137]*len(target.times))),
                                      priority=3))
        goals.append(TargetDemandGoalMinimization(state='gasconversion_DEN.GasIn.mass_flow',
                                      target=Timeseries(target.times, np.array([38428.82106194027]*len(target.times))),
                                      priority=3))
        return goals


    def energy_system_options(self):
        options = super().energy_system_options()

        self.gas_network_settings["head_loss_option"] = HeadLossOption.LINEARIZED_N_LINES_EQUALITY
        self.gas_network_settings["network_type"] = NetworkSettings.NETWORK_TYPE_HYDROGEN
        self.gas_network_settings["minimize_head_losses"] = False
        self.gas_network_settings["maximum_velocity"] = self._maximum_velocity#60.0 #100
        self.gas_network_settings["n_linearization_lines"] = self._number_linearisation_lines#8 #12
        options["include_asset_is_switched_on"] = True
        options["estimated_velocity"] = 20
        options["electrolyzer_efficiency"] = (
            ElectrolyzerOption.LINEARIZED_THREE_LINES_EQUALITY
        )

        options["gas_storage_discharge_variables"] = False
        options["electricity_storage_discharge_variables"] = True
        options["wall_roughness"] = 1.5e-5

        return options


class _CaseConstraints:

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.__gas_source_upper_bounds = {}
        self.__gas_conversion_upper_bounds = {}

    def pre(self):
        super().pre()

        self.__update_gas_source_upper_bounds()
        self.__update_conversion_input_upper_bounds()

    def bounds(self):
        bounds = super().bounds()

        bounds.update(self.__gas_source_upper_bounds)
        bounds.update(self.__gas_conversion_upper_bounds)
        return bounds

    def __constraint_fix_pressure(self, ensemble_member):
        constraints = []
        # head_in = self.state("Aqua_Ductus_Import.GasOut.H")
        head_in = self.state("Joint_19.GasConn[1].H")
        # head_in = self.state("joint_DEN.GasConn[1].H")
        density = self.parameters(ensemble_member)["Pipe_Joint_Joint_31_Joint_19.density"]
            # self.state("Pipe_GDF SUEZ E&P Nederland B_V__6.GasIn.H"))
        # density = self.parameters(ensemble_member)["Pipe_GDF SUEZ E&P Nederland B_V__6.density"]
        # head_in = self.state("Pipe_HyOne_Main_9.GasIn.H")
        # density = self.parameters(ensemble_member)["Pipe_HyOne_Main_9.density"]
        pressure = self._pressure_location #100e5
        #self.parameters(0)["Pipe_NoGaT_to_Newbuilt_2.pressure"] #80bar #50bar
        constraints.append(((head_in*density/1e3*9.81 -pressure)/(pressure/2), 0.0, 0.0))


        standard = False
        if standard:
            conv_DEN_1 = self.state("gasconversion_e209.GasOut.mass_flow")
            conv_DEN_2 = self.state("gasconversion_6cbe.GasOut.mass_flow")

            conv_EEM_1 = self.state("gasconversion_bad0.GasOut.mass_flow")
            conv_EEM_2 = self.state("gasconversion_fc69.GasOut.mass_flow")
            conv_EEM_3 = self.state("gasconversion_2abd.GasOut.mass_flow")
            nominal = self.bounds()["gasconversion_2abd.GasIn.mass_flow"][1]
            constraints.append(((1.5*(conv_DEN_1+conv_DEN_2)-(conv_EEM_1+conv_EEM_2+conv_EEM_3))/nominal,0.0, 0.0))

            # match head:
            conv_DEN_1 = self.state("gasconversion_e209.GasIn.H")
            conv_DEN_2 = self.state("gasconversion_6cbe.GasIn.H")
            nominal = 1e5
            constraints.append(((conv_DEN_1-conv_DEN_2)/nominal, 0.0, 0.0))

            conv_EEM_1 = self.state("gasconversion_bad0.GasIn.H")
            conv_EEM_2 = self.state("gasconversion_fc69.GasIn.H")
            conv_EEM_3 = self.state("gasconversion_2abd.GasIn.H")
            nominal = 1e5
            constraints.append(((conv_EEM_1 - conv_EEM_3) / nominal, 0.0, 0.0))
            constraints.append(((conv_EEM_2 - conv_EEM_3) / nominal, 0.0, 0.0))
        else:

            nominal = 1e4#self.bounds()["gasconversion_2abd.GasIn.mass_flow"][1]
            # constraints.append(((56/44 * conv_DEN_2 - conv_EEM_3) / nominal, 0.0, 0.0))
            # try:
            #     #TODO: for EEMShaven when re-use, the flow to EEM cannot be equal as to DEN
            #     # because of the much smaller diameter.
            #     conv_IJM = self.state("gasconversion_IJM.GasOut.mass_flow")
            #     conv_EEM = self.state("gasconversion_EEM.GasOut.mass_flow")
            #     conv_DEN = self.state("gasconversion_DEN.GasOut.mass_flow")
            #     p_EEM = self.state("joint_EEM.GasConn[1].H")
            #     p_DEN = self.state("joint_DEN.GasConn[1].H")
            #     nominal_head = pressure / (density/1e3*9.81) /2
            #     # constraints.append(((conv_DEN - conv_EEM) / nominal, 0.0, 0.0))
            #     constraints.append(((conv_DEN - conv_IJM) / nominal, 0.0, 0.0))
            #     constraints.append(((p_EEM - p_DEN)/ nominal_head, 0.0, 0.0))
            # except:
            # conv_DEN_2 = self.state("H2-import_DEN.GasOut.mass_flow")
            # conv_EEM_3 = self.state("H2-import_EEM.GasOut.mass_flow")
            conv_DEN_2 = self.state("gasconversion_DEN.GasOut.mass_flow")
            conv_EEM_3 = self.state("gasconversion_EEM.GasOut.mass_flow")
            den = self.get_timeseries("H2_Demand_DEN.target_gas_demand")
            eem = self.get_timeseries("H2_Demand_EEM.target_gas_demand")
            multipliers = eem.values / den.values
            multi = 1.2727 #multi = multipliers[0]
            constraints.append(((multi * conv_DEN_2 - conv_EEM_3) / nominal, 0.0, 0.0))

        return constraints

    def __electrolyzer_minimum_operational_constraint(self, ensemble_member):
        parameters = self.parameters(ensemble_member)
        constraints = []
        for el in self.energy_system_components.get("electrolyzer", []):
            max_power = parameters[f"{el}.max_power"]
            minimum_load = max(parameters[f"{el}.minimum_load"], 0.01 * max_power)
            el_power = self.state(f"{el}.ElectricityIn.Power")
            constraints.append(((el_power - minimum_load) / max_power, 0.0, np.inf))

        return constraints


    def __update_gas_source_upper_bounds(self):
        t = self.times()

        for gas_source in self.energy_system_components.get("gas_source", []):
            if f"{gas_source}.maximum_gas_source" in self.io.get_timeseries_names():
                lb = Timeseries(t, np.zeros(len(t)))
                ub = self.get_timeseries(f"{gas_source}.maximum_gas_source")
                start_indx = np.where(ub.times == t[0])[0][0]
                end_indx = np.where(ub.times == t[-1])[0][0] + 1
                ub = Timeseries(t, (np.asarray(ub.values)[start_indx:end_indx]).tolist())
                # lb = ub
                self.__gas_source_upper_bounds[f"{gas_source}.GasOut.mass_flow"] = (lb, ub)

    def __update_conversion_input_upper_bounds(self):
        t = self.times()

        for gas_conversion in self.energy_system_components.get("gas_substation", []):
            if 'EEM' in gas_conversion:
                ub_value = 48908.3556554999
            elif 'DEN' in gas_conversion:
                ub_value = 38428.817203975734

            lb = Timeseries(t, np.zeros(len(t)))
            ub = Timeseries(t, np.array([ub_value]*len(t)))
            # lb = ub
            self.__gas_conversion_upper_bounds[f"{gas_conversion}.GasIn.mass_flow"] = (lb, ub)


    def path_constraints(self, ensemble_member):
        """
        Constraints to limit producer production in case timeseries for the production exist,
        relevant when the first goals is not to match profile.
        """
        constraints = super().path_constraints(ensemble_member)
        constraints.extend(self.__constraint_fix_pressure(ensemble_member))

        constraints.extend(self.__electrolyzer_minimum_operational_constraint(ensemble_member))

        return constraints

    def constraints(self, ensemble_member):
        """
        Add equality constraints to enforce a cyclic energy balance [J] between the end and the
        start of the time horizon used as well an inequality constraint to enforce no milp supply
        [W] to the netwok in the 1st time step
        """
        constraints = super().constraints(ensemble_member)

        # TODO: cyclic constraints

        return constraints
# -------------------------------------------------------------------------------------------------

class MultiCommoditySimulator(
    ScenarioOutput,
    _GoalsAndOptions,
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    This workflow allows for the simulation of (combined) hydrogen and electricity networks,
    containing consumers, producers and conversion assets.
    The priority of the consumers, producers and conversion assets is set using the marginal costs
    in the ESDL file, allowing for flexible customised operation. Producers with the lowest marginal
    costs are maximised in operation before other consumers are used, while consumers with the
    highest marginal costs are maximised before other consumers are satisfied. In case both profiles
    and marginal costs are provided for producers or consumers, then the marginal costs are ignored
    and the profiles will be matched. always are preferred over the
    To obtain this workflow the objective functions are setup according to the scheme described
    below.

    Goal priorities are:
    1. Match target demand specified
    2. Producers with highest marginal costs are minimised and Consumers with highest marginal
    costs are maximised first, working back towards the lower marginal costs.
    3. Producers with a production profile will be matched at end. This goal should be obsolete, as
     the bound is set towards the production profile and other producers are first minimised.

    Notes:
    - Currently all demand profiles can be used, however the length of the simulation is based on
    the length and timestep of these profiles. Too long timehorizons might results in too big
    problems for the solver.
    - No cyclic constraints are yet applied to storages as this workflow solely functions as a
    simulator.
    - TODO: When the number of assets become larger, the simulator might be applied in stages with
    consecutive parts of the time horizon.
    """

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self._qpsol = None
        self._priorities_output = []
        self._save_json = kwargs.get("_save_json", False)

    def pre(self):
        self._qpsol = CachingQPSol()

        # self.gas_network_settings["pipe_maximum_pressure"] = 8.0e3  # [bar]
        # self.gas_network_settings["pipe_minimum_pressure"] = 1.0  # [bar]

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
        """
        This function creates the lists and dictionaries of assets to include in the optimization
        based on the marginal costs, e.g. priorities. It excludes the assets who already have
        assigned timeseries for demand or production.
        Furthermore, it creates a map of the variables that are required for every asset.
        :param asset_types_to_include:
        :param assets_without_control:
        :return:
        """
        type_variable_map = {
            "electricity_demand": "Electricity_demand",
            "electricity_source": "Electricity_source",
            "gas_demand": "Gas_demand_mass_flow",
            "gas_source": "Gas_source_mass_flow",
            "gas_tank_storage": {"charge": "Gas_tank_flow", "discharge": "__Q_discharge"},
            "electricity_storage": {
                "charge": "Effective_power_charging",
                "discharge": "__effective_power_discharging",
            },
            "electrolyzer": "Power_consumed",
        }

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
        """
        This method creates the goals for every asset that is based on the marginal cost and the
        relevant variable for that asset. Depending on the type of asset, the goal is a minimisation
        or maximisation.
        :param asset_info:
        :param max_value_merit:
        :param index_start_of_priority:
        :return:
        """
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

            if asset in [
                *assets_to_include.get("source", []),
            ]:
                variable_name = f"{asset}.{asset_variable_map[asset]}"


                func_range = self.bounds()[variable_name]
                v1 = _extract_values_timeseries(func_range[0])
                v2 = _extract_values_timeseries(func_range[1])
                func_range = (v1,v2)

                add_goal = True
                if isinstance(v1, np.ndarray) and isinstance(v2, np.ndarray):
                    if (v1 == v2).all():
                        add_goal = False
                if "h2-import" in asset.lower():
                    add_goal = False
                if add_goal:
                    if "import" in asset.lower():
                        # if 'gas' not in asset_variable_map[asset].lower():
                        goals.append(
                            MinimizeSourcesGoalMerit(
                                variable_name,
                                marginal_priority,
                                func_range,
                                self.variable_nominal(variable_name),
                                order=2
                            )
                        )
                    else:
                        goals.append(
                            MinimizeSourcesGoalMerit(
                                variable_name,
                                marginal_priority,
                                func_range,
                                self.variable_nominal(variable_name),
                            )
                        )
            elif asset in assets_to_include.get("conversion", []):
                variable_name = f"{asset}.{asset_variable_map[asset]}"
                index_s = asset_merit["asset_name"].index(f"{asset}_prod")
                marginal_priority_source = (
                    index_start_of_priority + max_value_merit - asset_merit["merit_order"][index_s]
                )
                # if asset!="EL_DDW-West" and asset!="EL_TNW":#asset=="EL_WA6_1" or asset=="EL_WA6_2":
                if self.energy_system_options()["electrolyzer_efficiency"]!= ElectrolyzerOption.LINEARIZED_THREE_LINES_EQUALITY:
                    func_range = self.bounds()[variable_name]
                    v1 = _extract_values_timeseries(func_range[0])
                    v2 = _extract_values_timeseries(func_range[1])
                    func_range = (v1, v2)
                    add_goal = True

                    if isinstance(v1, np.ndarray) and isinstance(v2, np.ndarray):
                        if (v1 == v2).all():
                            add_goal = False
                        v2[v2==0.0e0] = 1e8
                    if add_goal:
                        goals.append(
                            MinimizeSourcesGoalMerit(
                                variable_name,
                                marginal_priority_source,
                                func_range,
                                self.variable_nominal(variable_name),
                                order=1
                            )
                        )
                variable_name = f"{asset}.Gas_mass_flow_out"

                func_range = self.bounds()[variable_name]
                v1 = _extract_values_timeseries(func_range[0])
                v2 = _extract_values_timeseries(func_range[1])
                func_range = (v1, v2)

                add_goal = True
                if isinstance(v1, np.ndarray) and isinstance(v2, np.ndarray):
                    if (v1 == v2).all():
                        add_goal = False
                if add_goal:
                    goals.append(
                        MaximizeDemandGoalMerit(
                            variable_name,
                            marginal_priority,
                            func_range,
                            self.variable_nominal(variable_name),
                        )
                    )
            elif asset in assets_to_include.get("demand", []):
                variable_name = f"{asset}.{asset_variable_map[asset]}"
                if "export" not in asset: #marginal_priority != 6 and marginal_priority != 7 :
                    goals.append(
                        MaximizeDemandGoalMerit(
                            variable_name,
                            marginal_priority,
                            self.bounds()[variable_name],
                            self.variable_nominal(variable_name),
                            order=2,
                        )
                    )
            elif asset in assets_to_include.get("storage", []):
                # TODO: should use separate variable for charging and discharging

                # charging acts as consumer
                # Marginal costs for discharging > marginal cost for charging
                variable_name = f"{asset}.{asset_variable_map[asset]['charge']}"

                func_range = self.bounds()[variable_name]
                v1 = _extract_values_timeseries(func_range[0], "min")
                v2 = _extract_values_timeseries(func_range[1], "max")
                func_range = (v1, v2)

                goals.append(
                    MaximizeStorageGoalMerit(
                        variable_name,
                        marginal_priority,
                        func_range,
                        self.variable_nominal(variable_name),
                    )
                )

                # discharging acts as producer
                # Marginal costs for discharging should be larger than marginal cost for charging
                # TODO: add check on the marginal costs for charging/discharging
                index_s = asset_merit["asset_name"].index(f"{asset}_discharge")
                marginal_priority = (
                    index_start_of_priority + max_value_merit - asset_merit["merit_order"][index_s]
                )
                assert (
                    marginal_priority >= index_start_of_priority
                ), "Priorities assigned must be smaller than the total number of producers"

                variable_name = f"{asset}.{asset_variable_map[asset]['discharge']}"

                func_range = self.bounds()[variable_name]
                v1 = _extract_values_timeseries(func_range[0], "min")
                v2 = _extract_values_timeseries(func_range[1], "max")
                func_range = (v1, v2)

                goals.append(
                    MinimizeStorageGoalMerit(
                        variable_name,
                        marginal_priority,
                        func_range,
                        self.variable_nominal(variable_name),
                    )
                )
            else:
                raise Exception(
                    f"No goal was set for {asset}, while a priority was provided. This asset group "
                    f"still has to be added to the goals."
                )
        return goals

    def __merit_path_goals(self):
        """
        This method organizes the goals and assigns their priorities
        The first two priorities are reserved for matching of demand. Thereby the priorities of the
         other goals to maximize specific producers and minimize demand, start at priority 3.
        :return:
        """

        # TODO: improve the asset_types_to_include and esdl_assets_to_include
        asset_types_to_include = {
            "source": ["electricity_source", "gas_source"],
            "demand": ["electricity_demand", "gas_demand"],
            "conversion": ["electrolyzer"],
            "storage": ["gas_tank_storage", "electricity_storage"],
        }

        assets_without_control = ["Pipe", "ElectricityCable", "Joint", "Bus", "GenericConversion", "GasConversion"]

        # TODO also include other assets than producers, e.g. storage, conversion and possible
        #  demand for the ones without a profile
        # TODO exclude producers from merit order if they have a profile, even if a marginal cost
        #  is set

        # Storage: charge priority should be higher than discharge priority
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

    def seed(self, ensemble_member):
        seed = super().seed(ensemble_member)
        parameters = self.parameters(0)
        # electrolyzers = self.energy_system_components.get("electrolyzer")
        wind_farms = self.energy_system_components.get("wind_park")
        for windfarm in wind_farms:
            variable = f"{windfarm}.maximum_electricity_source"
            electrolyzer = "EL"+windfarm.lstrip("WF")
            variable_el = f"{electrolyzer}.Power_consumed"
            el_power_time = Timeseries(
                *self.io.get_timeseries_sec(variable, ensemble_member)
            )
            variable_seed = f"{windfarm}.Electricity_source"
            try:
                el_min_load = parameters[f"{electrolyzer}.minimum_load"]
                el_max_load = parameters[f"{electrolyzer}.max_power"]
                el_power_time.values[el_power_time.values < el_min_load] = 0.0
                seed[variable_seed] = el_power_time
                el_power_time.values[el_power_time.values > el_max_load] = el_max_load
                seed[variable_el] = el_power_time
            except KeyError:
                seed[variable_seed] = el_power_time

        return seed





    def __merit_controls(self, assets_list):
        attributes = {
            "asset_name": [],
            "merit_order": [],
        }

        assets = self.esdl_assets
        for a in assets.values():
            if a.name in assets_list:
                attributes["asset_name"].append(a.name)
                try:
                    attributes["merit_order"].append(
                        a.attributes["costInformation"].marginalCosts.value
                    )
                    if (
                        a.asset_type == "Electrolyzer"
                    ):  # electrolyzer would require minimisation of electricity right after
                        # maximisation gas, therefore a merit_order with a very small adjusted
                        # value is used (e.g. 1e-6) to ensure these goals are right after each
                        # other and no other goals are in between.
                        attributes["asset_name"].append(f"{a.name}_prod")
                        attributes["merit_order"].append(
                            a.attributes["costInformation"].marginalCosts.value - 1e-6
                        )

                except AttributeError:
                    try:
                        attributes["merit_order"].append(
                            a.attributes["controlStrategy"].marginalChargeCosts.value
                        )
                        attributes["merit_order"].append(
                            a.attributes["controlStrategy"].marginalDischargeCosts.value
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

        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options["presolve"] = "off"

        return options

    def priority_started(self, priority):
        goals_print = set()
        for goal in [*self.path_goals(), *self.goals()]:
            if goal.priority == priority:
                goals_print.update([str(type(goal))])
        logger.info(f"{goals_print}")
        self._priority = priority
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
        logger.info(f"Goal with priority {priority} has been completed")
        if priority == 1 and self.objective_value > 1e-6:
            raise RuntimeError("The heating demand is not matched")

    def solver_success(self, solver_stats, log_solver_failure_as_error):
        success, log_level = super().solver_success(solver_stats, log_solver_failure_as_error)

        # Allow time-outs for GUROBI, CPLEX and CBC
        if (
            solver_stats["return_status"] == "TIME_LIMIT"
            or solver_stats["return_status"] == "time limit exceeded"
            or solver_stats["return_status"] == "stopped - on maxnodes, maxsols, maxtime"
        ):
            if self.objective_value > 1e10:
                # Quick check on the objective value. If no solution was
                # found, this is typically something like 1E50.
                return success, log_level

            return True, logging.INFO
        else:
            return success, log_level

    def __state_vector_scaled(self, variable, ensemble_member):
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )

    # TODO: post will be created later
    # def post(self):
    #     super().post()
    #     self._write_updated_esdl(self.get_energy_system_copy(), optimizer_sim=True)


class MultiCommoditySimulatorNSE(
    _CaseConstraints,
    MultiCommoditySimulator,
):
    pass
# -------------------------------------------------------------------------------------------------
class MultiCommoditySimulatorMarginal(
    ScenarioOutput,
    _GoalsAndOptions,
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    This workflow allows for the simulation of (combined) hydrogen and electricity networks,
    containing consumers, producers and conversion assets.
    The priority of the consumers, producers and conversion assets is set using the marginal costs
    in the ESDL file, allowing for flexible customised operation. Producers with the lowest marginal
    costs are maximised in operation before other consumers are used, while consumers with the
    highest marginal costs are maximised before other consumers are satisfied. In case both profiles
    and marginal costs are provided for producers or consumers, then the marginal costs are ignored
    and the profiles will be matched. always are preferred over the
    To obtain this workflow the objective functions are setup according to the scheme described
    below.

    Goal priorities are:
    1. Match target demand specified
    2. Producers with highest marginal costs are minimised and Consumers with highest marginal
    costs are maximised first, working back towards the lower marginal costs.
    3. Producers with a production profile will be matched at end. This goal should be obsolete, as
     the bound is set towards the production profile and other producers are first minimised.

    Notes:
    - Currently all demand profiles can be used, however the length of the simulation is based on
    the length and timestep of these profiles. Too long timehorizons might results in too big
    problems for the solver.
    - No cyclic constraints are yet applied to storages as this workflow solely functions as a
    simulator.
    - TODO: When the number of assets become larger, the simulator might be applied in stages with
    consecutive parts of the time horizon.
    """

    def __init__(self, *args, **kwargs):
        self._maximum_velocity = kwargs.get("v_max_gas", 40)
        self._number_linearisation_lines = kwargs.get("_number_linearisation_lines", 6)
        self._pressure_location = kwargs.get("_pressure_location", 50e5)

        super().__init__(*args, **kwargs)

        self._qpsol = None
        self._priorities_output = []
        self._save_json = kwargs.get("_save_json", False)
        self._demand_matched = True

    def pre(self):
        self._qpsol = CachingQPSol()

        # self.gas_network_settings["pipe_maximum_pressure"] = 8.0e3  # [bar]
        # self.gas_network_settings["pipe_minimum_pressure"] = 1.0  # [bar]

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

    def __create_asset_cost_map(self, asset_types_to_include, assets_without_control):
        """
        This function creates the lists and dictionaries of assets to include in the optimization
        based on the marginal costs, e.g. priorities. It excludes the assets who already have
        assigned timeseries for demand or production.
        Furthermore, it creates a map of the variables that are required for every asset.
        :param asset_types_to_include:
        :param assets_without_control:
        :return:
        """
        type_variable_map = {
            "electricity_demand": "Electricity_demand",
            "electricity_source": "Electricity_source",
            "gas_demand": "Gas_demand_mass_flow",
            "gas_source": "Gas_source_mass_flow",
            # "gas_tank_storage": "Gas_tank_flow",
            # "electricity_storage": {
            #     "charge": "Effective_power_charging",
            #     "discharge": "__effective_power_discharging",
            # },
            "electrolyzer": "Power_consumed",
            "transformer": "ElectricityIn.Power"
        }

        multiplier = {"source": 1.0,
                      "demand": -1.0,
                      "conversion": -1.0,
                      "storage": -1.0,
                      "charge": -1.0,
                      "discharge": 1.0,}

        assets_to_include = {}
        asset_variable_map = {}
        asset_cost_map = {}
        available_timeseries = [t.split(".")[0] for t in self.io.get_timeseries_names()]
        for group, asset_types in asset_types_to_include.items():
            for asset_type in asset_types:
                for asset in self.energy_system_components.get(asset_type, []):
                    if group !="demand" or asset not in available_timeseries:
                        if group in assets_to_include.keys():
                            assets_to_include[group].append(asset)
                        else:
                            assets_to_include[group] = [asset]
                    asset_var_name = type_variable_map[asset_type]
                    # asset_var_name = f"{asset}.{type_variable_map[asset_type]}" if isinstance(type_variable_map[asset_type], str) else
                    asset_variable_map[asset] = asset_var_name

                    esdl_asset = self.esdl_assets[self.esdl_asset_name_to_id_map[asset]]
                    lhv = 1e6#120e6 #J/kg LHV hydrogen
                    multiplier_gas = 1 if "gas" not in asset_type else lhv
                    if isinstance(asset_var_name, str):
                        marg_cost = self.__get_marginal_cost(esdl_asset) * multiplier[group]
                        var_name = f"{asset}.{asset_var_name}"
                        asset_cost_map[var_name] = marg_cost * multiplier_gas
                    else:
                        for k,v in asset_var_name.items():
                            marg_cost = self.__get_marginal_cost(esdl_asset, marg_type=k)* multiplier[k]
                            var_name = f"{asset}.{v}"
                            asset_cost_map[var_name] = marg_cost * multiplier_gas
                    # asset_cost_map[asset] = {"var_name": var_name,
                    #                          "marginal_cost": marg_cost}

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
            "asset_cost_map": asset_cost_map,
        }
        return asset_info

    def __create_merit_path_goals(self, asset_info, max_value_merit, index_start_of_priority):
        """
        This method creates the goals for every asset that is based on the marginal cost and the
        relevant variable for that asset. Depending on the type of asset, the goal is a minimisation
        or maximisation.
        :param asset_info:
        :param max_value_merit:
        :param index_start_of_priority:
        :return:
        """
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

            if asset in [
                *assets_to_include.get("source", []),
            ]:
                variable_name = f"{asset}.{asset_variable_map[asset]}"


                func_range = self.bounds()[variable_name]
                v1 = _extract_values_timeseries(func_range[0])
                v2 = _extract_values_timeseries(func_range[1])
                func_range = (v1,v2)

                add_goal = True
                if isinstance(v1, np.ndarray) and isinstance(v2, np.ndarray):
                    if (v1 == v2).all():
                        add_goal = False
                if "h2-import" in asset.lower():
                    add_goal = False
                if add_goal:
                    if "import" in asset.lower():
                        # if 'gas' not in asset_variable_map[asset].lower():
                        goals.append(
                            MinimizeSourcesGoalMerit(
                                variable_name,
                                marginal_priority,
                                func_range,
                                self.variable_nominal(variable_name),
                                order=2
                            )
                        )
                    else:
                        goals.append(
                            MinimizeSourcesGoalMerit(
                                variable_name,
                                marginal_priority,
                                func_range,
                                self.variable_nominal(variable_name),
                            )
                        )
            elif asset in assets_to_include.get("conversion", []):
                variable_name = f"{asset}.{asset_variable_map[asset]}"
                index_s = asset_merit["asset_name"].index(f"{asset}_prod")
                marginal_priority_source = (
                    index_start_of_priority + max_value_merit - asset_merit["merit_order"][index_s]
                )
                # if asset!="EL_DDW-West" and asset!="EL_TNW":#asset=="EL_WA6_1" or asset=="EL_WA6_2":
                if self.energy_system_options()["electrolyzer_efficiency"]!= ElectrolyzerOption.LINEARIZED_THREE_LINES_EQUALITY:
                    func_range = self.bounds()[variable_name]
                    v1 = _extract_values_timeseries(func_range[0])
                    v2 = _extract_values_timeseries(func_range[1])
                    func_range = (v1, v2)
                    add_goal = True

                    if isinstance(v1, np.ndarray) and isinstance(v2, np.ndarray):
                        if (v1 == v2).all():
                            add_goal = False
                        v2[v2==0.0e0] = 1e8
                    if add_goal:
                        goals.append(
                            MinimizeSourcesGoalMerit(
                                variable_name,
                                marginal_priority_source,
                                func_range,
                                self.variable_nominal(variable_name),
                                order=1
                            )
                        )
                variable_name = f"{asset}.Gas_mass_flow_out"

                func_range = self.bounds()[variable_name]
                v1 = _extract_values_timeseries(func_range[0])
                v2 = _extract_values_timeseries(func_range[1])
                func_range = (v1, v2)

                add_goal = True
                if isinstance(v1, np.ndarray) and isinstance(v2, np.ndarray):
                    if (v1 == v2).all():
                        add_goal = False
                if add_goal:
                    goals.append(
                        MaximizeDemandGoalMerit(
                            variable_name,
                            marginal_priority,
                            func_range,
                            self.variable_nominal(variable_name),
                        )
                    )
            elif asset in assets_to_include.get("demand", []):
                variable_name = f"{asset}.{asset_variable_map[asset]}"
                if "export" not in asset: #marginal_priority != 6 and marginal_priority != 7 :
                    goals.append(
                        MaximizeDemandGoalMerit(
                            variable_name,
                            marginal_priority,
                            self.bounds()[variable_name],
                            self.variable_nominal(variable_name),
                            order=2,
                        )
                    )
            elif asset in assets_to_include.get("storage", []):
                # TODO: should use separate variable for charging and discharging

                # charging acts as consumer
                # Marginal costs for discharging > marginal cost for charging
                variable_name = f"{asset}.{asset_variable_map[asset]['charge']}"

                func_range = self.bounds()[variable_name]
                v1 = _extract_values_timeseries(func_range[0], "min")
                v2 = _extract_values_timeseries(func_range[1], "max")
                func_range = (v1, v2)

                goals.append(
                    MaximizeStorageGoalMerit(
                        variable_name,
                        marginal_priority,
                        func_range,
                        self.variable_nominal(variable_name),
                    )
                )

                # discharging acts as producer
                # Marginal costs for discharging should be larger than marginal cost for charging
                # TODO: add check on the marginal costs for charging/discharging
                index_s = asset_merit["asset_name"].index(f"{asset}_discharge")
                marginal_priority = (
                    index_start_of_priority + max_value_merit - asset_merit["merit_order"][index_s]
                )
                assert (
                    marginal_priority >= index_start_of_priority
                ), "Priorities assigned must be smaller than the total number of producers"

                variable_name = f"{asset}.{asset_variable_map[asset]['discharge']}"

                func_range = self.bounds()[variable_name]
                v1 = _extract_values_timeseries(func_range[0], "min")
                v2 = _extract_values_timeseries(func_range[1], "max")
                func_range = (v1, v2)

                goals.append(
                    MinimizeStorageGoalMerit(
                        variable_name,
                        marginal_priority,
                        func_range,
                        self.variable_nominal(variable_name),
                    )
                )
            else:
                raise Exception(
                    f"No goal was set for {asset}, while a priority was provided. This asset group "
                    f"still has to be added to the goals."
                )
        return goals

    def __merit_path_goals(self):
        """
        This method organizes the goals and assigns their priorities
        The first two priorities are reserved for matching of demand. Thereby the priorities of the
         other goals to maximize specific producers and minimize demand, start at priority 3.
        :return:
        """

        # TODO: improve the asset_types_to_include and esdl_assets_to_include
        asset_types_to_include = {
            "source": ["electricity_source", "gas_source"],
            "demand": ["electricity_demand", "gas_demand"],
            "conversion": ["electrolyzer", "transformer"],
            # "storage": ["gas_tank_storage", "electricity_storage"],
        }

        assets_without_control = ["Pipe", "ElectricityCable", "Joint", "Bus", "GenericConversion", "GasConversion",
                                  "GasStorage"]

        # TODO also include other assets than producers, e.g. storage, conversion and possible
        #  demand for the ones without a profile
        # TODO exclude producers from merit order if they have a profile, even if a marginal cost
        #  is set

        # Storage: charge priority should be higher than discharge priority
        asset_info = self.__create_asset_cost_map(
            asset_types_to_include, assets_without_control
        )

        # asset_info["asset_merit"] = self.__marginal_cost(asset_info["assets_to_include_list"])
        # max_value_merit = max(asset_info["asset_merit"]["merit_order"])

        # Priority 1 & 2 reserved for target demand goal & additional goal like matching
        # producer profile (without merit order)
        # index_start_of_priority = 3

        # goals = self.__create_merit_path_goals(asset_info, max_value_merit, index_start_of_priority)
        goals = [MinimizeCosts(asset_info["asset_cost_map"])]

        return goals

    def path_goals(self):
        goals = super().path_goals().copy()

        goals.extend(self.__merit_path_goals())

        return goals

    def seed(self, ensemble_member):
        seed = super().seed(ensemble_member)
        parameters = self.parameters(0)
        electrolyzers = self.energy_system_components.get("electrolyzer")
        wind_farms = self.energy_system_components.get("wind_park")
        gas_demands = self.energy_system_components.get("gas_demand", [])
        el_demands = self.energy_system_components.get("electricity_demand", [])
        for dem in [*gas_demands, *el_demands]:
            if dem in el_demands:
                variable = f"{dem}.Electricity_demand"
                variable_timeseries = f"{dem}.target_electricity_demand"
            elif dem in gas_demands:
                variable = f"{dem}.Gas_demand_mass_flow"
                variable_timeseries = f"{dem}.target_gas_demand"
            if variable_timeseries in self.io.get_timeseries_names():
                timeseries_values = Timeseries(
                    *self.io.get_timeseries_sec(variable_timeseries, ensemble_member)
                )
                seed[variable] = timeseries_values


        for windfarm in wind_farms:
            variable = f"{windfarm}.maximum_electricity_source"
            electrolyzer = "EL"+windfarm.lstrip("WF")
            variable_el = f"{electrolyzer}.Power_consumed"
            el_power_time = Timeseries(
                *self.io.get_timeseries_sec(variable, ensemble_member)
            )
            variable_seed = f"{windfarm}.Electricity_source"
            seed[variable_seed] = el_power_time
            try:
                for el in electrolyzers:
                    if electrolyzer in el:
                        el_min_load = parameters[f"{electrolyzer}.minimum_load"]
                        el_max_load = parameters[f"{electrolyzer}.max_power"]
                        el_power_time.values[el_power_time.values*2 < el_min_load] = el_min_load
                        el_power_time.values[el_power_time.values*2 < el_max_load / 2] = (
                                el_power_time.values[el_power_time.values*2 < el_max_load /2]*2)
                        el_power_time.values[el_power_time.values*2 > el_max_load / 2] = (
                            el_max_load) /2
                        el_power_time.values[el_power_time.values * 2 > el_max_load] = ((
                                el_power_time.values[el_power_time.values * 2 > el_max_load])
                                                                                        -
                                                                                        el_max_load)
                        seed[variable_el] = el_power_time
            except KeyError:
                pass
                seed[variable_seed] = el_power_time

        return seed

    def __get_marginal_cost(self, asset, marg_type=None):
        try:
            if not marg_type:
                marg_cost = asset.attributes["costInformation"].marginalCosts.value
            elif marg_type=="charge":
                marg_cost = asset.attributes["controlStrategy"].marginalChargeCosts.value
            elif marg_type=="discharge":
                marg_cost = asset.attributes["controlStrategy"].marginalDischargeCosts.value
            else:
                raise Exception(f"Marginal cost type of {marg_type} is not one of the options")
        except AttributeError:
            raise Exception(f"Asset: {asset.name} does not have a marginal cost specified")

        # if marg_cost <= 0.0:
        #     raise Exception(
        #         "The specified producer usage marginal cost must be a "
        #         f"positve integer value, producer name:{asset.name}, current "
        #         f"specified marginal cost: {marg_cost[-1]}"
        #     )

        return marg_cost

    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol

        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options["presolve"] = "off"

        return options

    def priority_started(self, priority):
        goals_print = set()
        for goal in [*self.path_goals(), *self.goals()]:
            if goal.priority == priority:
                goals_print.update([str(type(goal))])
        logger.info(f"{goals_print}")
        self._priority = priority
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
        print(f"Goal with priority {priority} has been completed  with objective value {self.objective_value}")
        # logger.info(f"Goal with priority {priority} has been completed  with objective value {self.objective_value}")
        if priority == 1 and self.objective_value > 1e-6:
            self._demand_matched = False
            # raise RuntimeError("The demand is not matched")
        if priority == 2and self.objective_value > 1e-6:
            self._demand_matched = False
            logger.warning("Production is not met")

        if priority == 3 and self.objective_value > 1e-6:
            logger.warning("Target landing massflow is not met")


    def solver_success(self, solver_stats, log_solver_failure_as_error):
        if not solver_stats['success']:
            solver_stats['success'] = True
        success, log_level = super().solver_success(solver_stats, log_solver_failure_as_error)

        # Allow time-outs for GUROBI, CPLEX and CBC
        if (
            solver_stats["return_status"] == "TIME_LIMIT"
            or solver_stats["return_status"] == "time limit exceeded"
            or solver_stats["return_status"] == "stopped - on maxnodes, maxsols, maxtime"
        ):
            if self.objective_value > 1e10:
                # Quick check on the objective value. If no solution was
                # found, this is typically something like 1E50.
                return success, log_level

            return True, logging.INFO
        else:
            return success, log_level

    def __state_vector_scaled(self, variable, ensemble_member):
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )

    # TODO: post will be created later
    # def post(self):
    #     super().post()
    #     self._write_updated_esdl(self.get_energy_system_copy(), optimizer_sim=True)


class MultiCommoditySimulatorMarginalNSE(
    _CaseConstraints,
    MultiCommoditySimulatorMarginal,
):
    pass

# -------------------------------------------------------------------------------------------------
class MultiCommoditySimulatorHIGHS(SolverHIGHS, MultiCommoditySimulator):
    pass


class MultiCommoditySimulatorNoLosses(MultiCommoditySimulator):
    def energy_system_options(self):
        options = super().energy_system_options()

        self.gas_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS
        self.gas_network_settings["minimize_head_losses"] = False
        options["include_electric_cable_power_loss"] = False

        return options

class MultiCommoditySimulatorMarginalNoLosses(MultiCommoditySimulatorMarginal):
    def energy_system_options(self):
        options = super().energy_system_options()

        self.gas_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS
        self.gas_network_settings["minimize_head_losses"] = False
        options["include_electric_cable_power_loss"] = False

        return options


def staged_approach(
    end_time,
    simulated_window,
    simulation_window_size,
    storage_initial_state_bounds,
    end_time_confirmed,
    total_results,
    constrained_assets,
    multicommodity_sequential_simulator_class,
    solver_class,
    **kwargs,
):
    """
    This function is the actual execution of a stage in a sequantial staged approach.
    :param end_time: The end simulation time of the staged approach
    :param simulated_window: The start index of the simulated window
    :param simulation_window_size: The size of the simulated stage
    :param storage_initial_state_bounds: The inital state (at start time of this window) bounds
    for storages
    :param end_time_confirmed: Boolean if the end time is already properly set.
    :param total_results: Dict in which the results of all stages are saved and added to.
    :param constrained_assets: Assets which have some intial state boundary that needs to be
    implemented at every stage.
    :param multicommodity_sequential_simulator_class: The class that describes the optimization
    problem
    :param solver_class: The class describing the solver settings.
    :param kwargs:
    :return:
    """
    sub_end_time = min(end_time, simulated_window + simulation_window_size)

    # max operation for start_index to avoid the overlap function in the first stage
    solution = run_optimization_problem_solver(
        multicommodity_sequential_simulator_class,
        solver_class,
        start_index=max(simulated_window - 1, 0),
        end_index=sub_end_time,
        storage_initial_state_bounds=storage_initial_state_bounds,
        **kwargs,
    )

    demand_matched = solution._demand_matched

    aliases, bounds, parameters = [None] * 3
    if demand_matched:
        if not end_time_confirmed:
            end_time = len(solution._full_time_series)
            end_time_confirmed = True
        results = solution.extract_results()

        aliases, bounds, parameters = [None] * 3

        # TODO: check if we now capture all relevant variables.
        if total_results is None:
            total_results = results
            aliases = solution.alias_relation._canonical_variables_map
            bounds = solution.bounds()
            parameters = solution.parameters(0)
        else:
            for key, data in results.items():
                try:
                    if len(total_results[key]) > 1:
                        total_results[key] = np.concatenate((total_results[key], data[1:]))
                except KeyError:
                    try:
                        print(f"{key} got an error thus saved separately in time {sub_end_time}")
                        total_results[key] = data[1:]
                    except:
                        print(key)
                        continue


        if sub_end_time < end_time:
            for asset_type, variables in constrained_assets.items():
                for asset in solution.energy_system_components.get(asset_type, []):
                    sub_time_series = solution._full_time_series[
                        simulated_window
                        - 1
                        + simulation_window_size : min(
                            end_time, simulated_window + 2 * simulation_window_size
                        )
                    ]
                    for variable in variables:
                        lb_value = _extract_values_timeseries(
                            solution.bounds()[f"{asset}.{variable}"][0], "min"
                        )
                        ub_value = _extract_values_timeseries(
                            solution.bounds()[f"{asset}.{variable}"][1], "max"
                        )
                        lb_values = [lb_value] * len(sub_time_series)
                        ub_values = [ub_value] * len(sub_time_series)
                        lb_values[0] = ub_values[0] = results[f"{asset}.{variable}"][-1]
                        lb = Timeseries(sub_time_series, lb_values)
                        ub = Timeseries(sub_time_series, ub_values)
                        storage_initial_state_bounds[f"{asset}.{variable}"] = (lb, ub)

    return (
        solution,
        end_time,
        simulated_window,
        simulation_window_size,
        storage_initial_state_bounds,
        end_time_confirmed,
        total_results,
        aliases,
        bounds,
        parameters,
        demand_matched,
    )


def staged_approach_extended(
    end_time,
    simulated_window,
    simulation_window_size,
    storage_initial_state_bounds,
    end_time_confirmed,
    total_results,
    constrained_assets,
    multicommodity_sequential_simulator_class,
    solver_class,
    **kwargs,
):
    """
    This function is the actual execution of a stage in a sequantial staged approach.
    :param end_time: The end simulation time of the staged approach
    :param simulated_window: The start index of the simulated window
    :param simulation_window_size: The size of the simulated stage
    :param storage_initial_state_bounds: The inital state (at start time of this window) bounds
    for storages
    :param end_time_confirmed: Boolean if the end time is already properly set.
    :param total_results: Dict in which the results of all stages are saved and added to.
    :param constrained_assets: Assets which have some intial state boundary that needs to be
    implemented at every stage.
    :param multicommodity_sequential_simulator_class: The class that describes the optimization
    problem
    :param solver_class: The class describing the solver settings.
    :param kwargs:
    :return:
    """
    sub_end_time = min(end_time, simulated_window + simulation_window_size)


    class MCSimulatorTimeSequentialNoHeadloss(multicommodity_sequential_simulator_class):
        """
        This Problem class is used to run the MultiCommoditySimulator class in a sequantial manner
        to reduce computational time. This class enables this by allowing to run a part of the
        timeseries and setting bounds on the (initial-)state variables.
        """

        def energy_system_options(self):
            options = super().energy_system_options()

            self.gas_network_settings[
                "head_loss_option"] = HeadLossOption.NO_HEADLOSS
            self.gas_network_settings["minimize_head_losses"] = False
            return options


    # max operation for start_index to avoid the overlap function in the first stage
    solution = run_optimization_problem_solver(
        MCSimulatorTimeSequentialNoHeadloss,
        solver_class,
        start_index=max(simulated_window - 1, 0),
        end_index=sub_end_time,
        storage_initial_state_bounds=storage_initial_state_bounds,
        **kwargs,
    )

    results = solution.extract_results()
    #TODO: change constrained assets
    prod_bounds = {}

    constrained_assets_prod = {
        "wind_park": ["Electricity_source"],
        "electrolyzer": ["Gas_mass_flow_out"],# ["Power_consumed", "Gas_mass_flow_out"],
    }

    for asset_type, variables in constrained_assets_prod.items():
        for asset in solution.energy_system_components.get(asset_type, []):
            sub_time_series = solution._full_time_series[
                              simulated_window
                              : min(
                                  end_time, simulated_window + 1 * simulation_window_size
                              )
                              ]
            for variable in variables:
                lb_values = results[f"{asset}.{variable}"]
                ub_values = results[f"{asset}.{variable}"]
                lb = Timeseries(sub_time_series, lb_values)
                ub = Timeseries(sub_time_series, ub_values)
                prod_bounds[f"{asset}.{variable}"] = (lb, ub)

    class MCSimulatorTimeSequentialHeadloss(multicommodity_sequential_simulator_class):
        """
        This Problem class is used to run the MultiCommoditySimulator class in a sequantial manner
        to reduce computational time. This class enables this by allowing to run a part of the
        timeseries and setting bounds on the (initial-)state variables.
        """

        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)

            self.__prod_bounds = kwargs.get("prod_bounds", {})

        def bounds(self):
            """
            Here we set bounds on the initial state to ensure that the sequantial simulation is a
            physcially valid.
            """
            bounds = super().bounds()
            bounds.update(self.__prod_bounds)
            return bounds

    solution = run_optimization_problem_solver(
        MCSimulatorTimeSequentialHeadloss,
        solver_class,
        start_index=max(simulated_window - 1, 0),
        end_index=sub_end_time,
        storage_initial_state_bounds=storage_initial_state_bounds,
        prod_bounds=prod_bounds,
        **kwargs,
    )

    if not end_time_confirmed:
        end_time = len(solution._full_time_series)
        end_time_confirmed = True
    results = solution.extract_results()

    aliases, bounds, parameters = [None] * 3

    # TODO: check if we now capture all relevant variables.
    if total_results is None:
        total_results = results
        aliases = solution.alias_relation._canonical_variables_map
        bounds = solution.bounds()
        parameters = solution.parameters(0)
    else:
        for key, data in results.items():
            if len(total_results[key]) > 1:
                total_results[key] = np.concatenate((total_results[key], data[1:]))

    if sub_end_time < end_time:
        for asset_type, variables in constrained_assets.items():
            for asset in solution.energy_system_components.get(asset_type, []):
                sub_time_series = solution._full_time_series[
                    simulated_window
                    - 1
                    + simulation_window_size : min(
                        end_time, simulated_window + 2 * simulation_window_size
                    )
                ]
                for variable in variables:
                    lb_value = _extract_values_timeseries(
                        solution.bounds()[f"{asset}.{variable}"][0], "min"
                    )
                    ub_value = _extract_values_timeseries(
                        solution.bounds()[f"{asset}.{variable}"][1], "max"
                    )
                    lb_values = [lb_value] * len(sub_time_series)
                    ub_values = [ub_value] * len(sub_time_series)
                    lb_values[0] = ub_values[0] = results[f"{asset}.{variable}"][-1]
                    lb = Timeseries(sub_time_series, lb_values)
                    ub = Timeseries(sub_time_series, ub_values)
                    storage_initial_state_bounds[f"{asset}.{variable}"] = (lb, ub)

    return (
        solution,
        end_time,
        simulated_window,
        simulation_window_size,
        storage_initial_state_bounds,
        end_time_confirmed,
        total_results,
        aliases,
        bounds,
        parameters,
    )


def run_sequatially_staged_simulation(
    multi_commodity_simulator_class,
    simulation_window_size=2,
    solver_class=SolverHIGHS,
    *args,
    **kwargs,
):
    """
    This function is to run the MultiCommoditySimulator class in a staged manner where the stages
    are sequantial parts of the time horizon. This is done to make the problem smaller and allow
    for quicker run of the optimization/simulation. To ensure a physically sound result the
    variables that affect the outcome of the next stage are constrained by setting bounds, e.g. the
    amount of stored energy in a storage.

    Parameters
    ----------
    multi_commodity_simulator_class : The problem class to run
    simulation_window_size : The amount of indices to run in a single stage

    Returns
    -------
    The results dict where all the time results are concatenated.
    """

    class MultiCommoditySimulatorTimeSequential(multi_commodity_simulator_class):
        """
        This Problem class is used to run the MultiCommoditySimulator class in a sequantial manner
        to reduce computational time. This class enables this by allowing to run a part of the
        timeseries and setting bounds on the (initial-)state variables.
        """

        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)

            self.__start_time_index = kwargs.get("start_index", None)
            self.__end_time_index = kwargs.get("end_index", None)
            self._full_time_series = None

            self.__storage_initial_state_bounds = kwargs.get("storage_initial_state_bounds", {})

            logger.warning(
                f"Optimising timestep {self.__start_time_index} to {self.__end_time_index}"
            )

        def pre(self):
            super().pre()
            self.__initial_bounds()
        def times(self, variable=None) -> np.ndarray:
            """
            In this function the part of the time-horizon is enforced. Note that the full
            time-horizon is also set to an internal member for enabling setting bounds to the next
            sequantial optimization.
            """
            if self._full_time_series is None:
                self._full_time_series = super().times(variable)

            if self.__start_time_index is not None and self.__end_time_index is not None:
                return super().times(variable)[self.__start_time_index : self.__end_time_index]
            elif self.__start_time_index is not None:
                return super().times(variable)[self.__start_time_index :]
            elif self.__end_time_index is not None:
                return super().times(variable)[: self.__end_time_index]
            else:
                return super().times(variable)

        def __initial_bounds(self):
            bounds = super().bounds()
            if self.__start_time_index == 0:
                sub_time_series = self._full_time_series[self.__start_time_index:self.__end_time_index]
                for asset in self.energy_system_components.get("gas_tank_storage", []):
                    for variable in ["Stored_gas_mass"]:
                        lb_value = bounds[f"{asset}.{variable}"][0]
                        ub_value = bounds[f"{asset}.{variable}"][1]
                        lb_values = [lb_value] * len(sub_time_series)
                        ub_values = [ub_value] * len(sub_time_series)
                        # lb_values[0] = ub_values[0] = lb_value
                        lb_values[0] = ub_values[0] = 100316.67001085529e6 #g
                        lb = Timeseries(sub_time_series, lb_values)
                        ub = Timeseries(sub_time_series, ub_values)
                        storage_initial_state_bounds[f"{asset}.{variable}"] = (lb, ub)
                self.__storage_initial_state_bounds = storage_initial_state_bounds
        def bounds(self):
            """
            Here we set bounds on the initial state to ensure that the sequantial simulation is a
            physcially valid.
            """
            bounds = super().bounds()
            bounds.update(self.__storage_initial_state_bounds)
            return bounds

    # Note that the window size should be larger than 1 otherwise this function is has no
    # benefit and the writing of the results dict will fail.
    assert simulation_window_size >= 2

    total_results = None
    # This is an initial value for end_time, will be corrected after the first stage
    end_time = 2 * simulation_window_size
    end_time_confirmed = False
    # TODO: fix bounds for Stored_gas_mass at timestep 0
    storage_initial_state_bounds = {}

    # TODO: make this dict complete for all relevant assets and their associated variables.
    constrained_assets = {
        "electricity_storage": ["Stored_electricity", "Effective_power_charging"],
        "gas_tank_storage": ["Stored_gas_mass", "Gas_tank_flow"],
    }

    demand_mismatch_timesteps = []

    (
        solution,
        end_time,
        simulated_window,
        simulation_window_size,
        storage_initial_state_bounds,
        end_time_confirmed,
        total_results,
        aliases,
        bounds,
        parameters,
        _,
    ) = staged_approach(
        end_time,
        0,
        simulation_window_size,
        storage_initial_state_bounds,
        end_time_confirmed,
        total_results,
        constrained_assets,
        MultiCommoditySimulatorTimeSequential,
        solver_class,
        **kwargs,
    )

    tic = time.time()
    demand_matched = True
    for simulated_window in range(simulation_window_size, end_time, simulation_window_size): #end_time
        #end_time #300
        # Note that the end time is not necessarily a multiple of simulation_window_size
        (
            solution,
            end_time,
            simulated_window,
            simulation_window_size,
            storage_initial_state_bounds,
            end_time_confirmed,
            total_results,
            _,
            _,
            _,
            demand_matched
        ) = staged_approach(
            end_time,
            simulated_window,
            simulation_window_size,
            storage_initial_state_bounds,
            end_time_confirmed,
            total_results,
            constrained_assets,
            MultiCommoditySimulatorTimeSequential,
            solver_class,
            **kwargs,
        )
        if not demand_matched:
            demand_mismatch_timesteps.append([simulated_window-1, simulated_window+simulation_window_size])
            (
                solution,
                end_time,
                simulated_window,
                simulation_window_size,
                storage_initial_state_bounds,
                end_time_confirmed,
                total_results,
                _,
                _,
                _,
                demand_matched
            ) = staged_approach(
                end_time,
                simulated_window,
                simulation_window_size,
                storage_initial_state_bounds,
                end_time_confirmed,
                total_results,
                constrained_assets,
                MultiCommoditySimulatorTimeSequential,
                solver_class,
                **kwargs,
            )


    print(time.time() - tic)

    if os.path.exists(solution.output_folder) and solution._save_json:
        solution._write_json_output(total_results, parameters, bounds, aliases,
                                    demand_mismatch=demand_mismatch_timesteps)

    return OptimisationOverview(total_results, bounds, parameters, aliases, demand_mismatch_timesteps)


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

    _ = run_optimization_problem_solver(
        MultiCommoditySimulator,
        SolverHIGHS,
        esdl_run_info_path=runinfo_path,
        log_level=log_level,
        **kwargs,
    )


if __name__ == "__main__":
    # main()
    import tests.models.emerge.src.example as example

    base_folder = Path(example.__file__).resolve().parent.parent
    solution = run_optimization_problem(
        MultiCommoditySimulatorNoLosses,
        base_folder=base_folder,
        esdl_file_name="emerge_priorities_withoutstorage.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries.csv",
    )
