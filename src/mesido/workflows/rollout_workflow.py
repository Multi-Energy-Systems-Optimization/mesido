import logging
import os
import time

import casadi as ca
import esdl
import numpy as np
from mesido.physics_mixin import PhysicsMixin
from mesido.techno_economic_mixin import TechnoEconomicMixin

# from mesido.workflows.grow_workflow import SolverCPLEX
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_profile_averages_timestep_size,
    adapt_profile_to_copy_for_number_of_years,
    adapt_profile_for_initial_hour_timestep_size,
)

from rtctools._internal.alias_tools import AliasDict
from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import (
    CachingQPSol,
    SinglePassGoalProgrammingMixin,
)

from mesido.esdl.esdl_mixin import ESDLMixin

from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.goals.rollout_goal import (
    MinimizeRolloutFixedOperationalCosts,
    MaximizeRevenueCosts,
    MinimizeCAPEXAssetsCosts,
    MinimizeATESState,
    MinimizeVariableOPEX,
)
from mesido.workflows.io.rollout_post import rollout_post

logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)


WATT_TO_MEGA_WATT = 1.0e6
WATT_TO_KILO_WATT = 1.0e3


class SolverHIGHS:
    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options["mip_rel_gap"] = 0.01

        options["gurobi"] = None
        options["cplex"] = None

        return options


class SolverCPLEX:
    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = self._qpsol
        options["solver"] = "cplex"
        cplex_options = options["cplex"] = {}
        # cplex_options.update(_mip_gap_settings("CPX_PARAM_EPGAP", self))
        cplex_options["CPX_PARAM_EPGAP"] = 0.01
        options["highs"] = None

        return options


class RollOutProblem(
    SolverCPLEX,
    # SolverHIGHS,
    ScenarioOutput,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self._years = 3  # 10
        self._horizon = 30
        self._year_step_size = int(self._horizon / self._years)
        # TODO: timestep_size and _days can be removed eventually, particularly when averaging
        # with peak day is used, however one needs to check where self._days and
        # self._timestep_size is currently affecting the code
        self._timestep_size = 20 * 24
        self._days = int(365 / (self._timestep_size / 24)) + 1 
        self._days = self._days + 1 # + 1 because of inserting an 1-hour timestep at the beginning of the year,
        # see the adapt_profile_for_initial_hour_timestep_size

        # TODO: get yearly max capex from input
        self._yearly_max_capex = 6.0e6 * self._horizon / self._years  # 20.e6 * self._horizon /
        # self._years

        # Fraction of how much heat of the total maximum the geo source can produce it should
        # procude in every year that it is placed
        self._min_geo_utilization = 0.7

        self._save_json = True

        self.heat_network_settings["minimum_velocity"] = 0.0  # important otherwise heatdemands
        # cannot be turned off for specific timesteps

        self._ates_is_charging_map = {}
        self.__ates_is_charging_var = {}
        self.__ates_is_charging_var_bounds = {}

        self._ates_charge_amount_map = {}
        self.__ates_charge_amount_var = {}
        self.__ates_charge_amount_var_bounds = {}
        self.__ates_charge_amount_var_nominals = {}

        self._ates_discharge_amount_map = {}
        self.__ates_discharge_amount_var = {}
        self.__ates_discharge_amount_var_bounds = {}
        self.__ates_discharge_amount_var_nominals = {}

        self._ates_state_heat_map = {}
        self.__ates_state_heat_var = {}
        self.__ates_state_heat_var_bounds = {}
        self.__ates_state_heat_var_nominals = {}

        self._asset_fraction_placed_map = {}
        self.__asset_fraction_placed_var = {}
        self.__asset_fraction_placed_var_bounds = {}

        self._asset_doublet_is_placed_map = {}
        self.__asset_doublet_is_placed_var = {}
        self.__asset_doublet_is_placed_var_bounds = {}

        self._yearly_capex_var = {}
        self._yearly_capex_var_bounds = {}
        self._yearly_capex_var_nominals = {}

        self._qpsol = None

        self._hot_start = False

        # Store (time taken, success, objective values, solver stats) per priority
        self._priorities_output = []
        self._priority = 0
        self.__priority_timer = None

    def parameters(self, ensemble_member):
        parameters = super().parameters(ensemble_member)
        for pipe in self.hot_pipes:
            parameters[f"{pipe}.disconnectable"] = True
        for pipe in self.cold_pipes:
            parameters[f"{pipe}.disconnectable"] = True
        return parameters

    def read(self):
        super().read()

        # adapt yearly profile to repeating year profile with desired time-step
        # day timestep, averaged demand

        adapt_hourly_profile_averages_timestep_size(self, self._timestep_size)
        adapt_profile_for_initial_hour_timestep_size(self)
        adapt_profile_to_copy_for_number_of_years(self, self._years)

    def pre(self):
        self._qpsol = CachingQPSol()

        super().pre()

        # TODO: requires clean_up, but runs now, _asset_is_placed in MESIDO already exists as
        # _asset_is_realized. However the asset_fraction_placed does not yet exist.
        for asset in [
            *self.energy_system_components.get("heat_demand", []),
            *self.energy_system_components.get("heat_source", []),
            *self.hot_pipes,
        ]:
            for year in range(self._years):
                asset_fraction_placed_var = f"{asset}__fraction_placed_{year}"
                self._asset_fraction_placed_map[asset] = asset_fraction_placed_var
                self.__asset_fraction_placed_var[asset_fraction_placed_var] = ca.MX.sym(
                    asset_fraction_placed_var
                )
                self.__asset_fraction_placed_var_bounds[asset_fraction_placed_var] = (0.0, 1.0)

        # TODO still needs to be checked if this is also properly added to financial mixing for
        # asset_is_realized for the doublets.
        # for asset in [*self.energy_system_components.get("ates", [])]:
        #     for year in range(self._years):
        #         N_doublets = self.parameters(0)[f"{asset}.nr_of_doublets"]
        #         # for i in range(1, N_doublets + 1):
        #         #     asset_is_placed_var = f"{asset}_doublet_{i}__is_placed_{year}"
        #         #     self._asset_doublet_is_placed_map[
        #         #         f"{asset}_doublet_{i}"] = asset_is_placed_var  # might be unnecessary
        #         #     self._asset_is_placed_map[f"{asset}_doublet_{i}"] = asset_is_placed_var
        #         #     self.__asset_doublet_is_placed_var[asset_is_placed_var] = ca.MX.sym(asset_is_placed_var)
        #         #     self.__asset_doublet_is_placed_var_bounds[asset_is_placed_var] = (0.0, 1.0)
        #         #     # self.__asset_is_placed_var[asset_is_placed_var] = ca.MX.sym(asset_is_placed_var)
        #         #     # self.__asset_is_placed_var_bounds[asset_is_placed_var] = (0.0, 1.0)
        #         #
        #         #     asset_fraction_placed_var = f"{asset}_doublet_{i}__fraction_placed_{year}"
        #         #     self._asset_fraction_placed_map[f"{asset}_doublet_{i}"] = asset_fraction_placed_var
        #         #     self.__asset_fraction_placed_var[asset_fraction_placed_var] = \
        #         #         ca.MX.sym(asset_fraction_placed_var)
        #         #     self.__asset_fraction_placed_var_bounds[asset_fraction_placed_var] = (
        #         #     0.0, 1.0)
        #
        #         asset_is_placed_var = f"{asset}__is_placed_{year}"
        #         self._asset_is_placed_map[asset] = asset_is_placed_var
        #         self.__asset_is_placed_var[asset_is_placed_var] = ca.MX.sym(asset_is_placed_var)
        #         self.__asset_is_placed_var_bounds[asset_is_placed_var] = (0.0, 1.0)

        for i in range(self._years):
            var_name = f"yearly_capex_{i}"
            self._yearly_capex_var[var_name] = ca.MX.sym(var_name)
            self._yearly_capex_var_bounds[var_name] = (0, self._yearly_max_capex)
            self._yearly_capex_var_nominals[var_name] = self._yearly_max_capex / 2.0


    def path_goals(self):
        goals = super().goals().copy()

        goals.append(
            MaximizeRevenueCosts(
                is_placed_vars=self._asset_is_realized_map.values(),
                year_step_size=self._year_step_size,
                priority=1,
            )
        )

        # goals.append(MinimizeATESState(priority=2))

        return goals

    def goals(self):
        goals = super().goals().copy()

        goals.append(
            MinimizeCAPEXAssetsCosts(
                fraction_is_placed_vars=self._asset_fraction_placed_map.values(), priority=1
            )
        )

        goals.append(MinimizeVariableOPEX(year_step_size=self._year_step_size, priority=1))

        goals.append(
            MinimizeRolloutFixedOperationalCosts(
                is_placed_vars=self._asset_is_realized_map.values(), priority=1
            )
        )

        return goals

    def __ates_doublet_sums(self, s):
        ates_N_doublets = self.parameters(0)[f"{s}.nr_of_doublets"]
        ates_doublet_sums = self.get_asset_is__realized_symbols(f"{s}_doublet_{1}")
        ates_doublet_fraction_sums = self.get_asset_fraction__placed_symbols(f"{s}_doublet_{1}")
        for N in range(1, ates_N_doublets):
            ates_doublet_sums += self.get_asset_is__realized_symbols(f"{s}_doublet_{N + 1}")
            ates_doublet_fraction_sums += self.get_asset_fraction__placed_symbols(
                f"{s}_doublet_{N + 1}"
            )

        return ates_doublet_sums, ates_doublet_fraction_sums

    def __ates_placed_balance_constraints(self, ensemble_member):
        constraints = []

        bounds = self.bounds()
        # TODO: modify this to get constraints on the yearly ATES heat balance
        # We add the ATES to the summed source symbol, the ATES can also consume, naming could be
        # better
        # All the supply for each day
        # summed_source_symbols = [0.0] * self._days
        for s in self.energy_system_components.get("ates", []):
            ates_daily_heat = self.__state_vector_scaled(f"{s}.Heat_ates", ensemble_member)
            big_m = 2.0 * max(abs(x) for x in bounds[f"{s}.Heat_ates"])

            # enforces ATES to only charge or discharge when placed
            ates_is_placed = self.get_asset_is__realized_symbols(s)
            # for year in range(self._years):
            #     constraints.append(
            #         ((ates_daily_heat[year*self._days:year*self._days+self._days] - big_m * ates_is_placed[year]) / (big_m), -np.inf, 0.0))
            #     constraints.append(
            #         ((ates_daily_heat[year*self._days:year*self._days+self._days] + big_m * ates_is_placed[year]) / (big_m), 0.0, np.inf))

            ates_state = self.__state_vector_scaled(f"{s}.Stored_heat", ensemble_member)
            ates_state_big_m = 2.0 * bounds[f"{s}.Stored_heat"][1]

            ates_N_doublets = self.parameters(0)[f"{s}.nr_of_doublets"]
            # ates_doublet_sums = self.__ates_doublet_sums(s)[0]
            # ates_doublet_sums = self.get_asset_is__realized_symbols(f"{s}_doublet_{1}")

            # TODO: still add ates cyclic constraint

            ates_is_placed_doublet = []
            # for N in range(0, ates_N_doublets):
            #     ates_is_placed_doublet.append(
            #         self.get_asset_is__realized_symbols(f"{s}_doublet_{N + 1}"))
            # for year in range(self._years):
            #     ates_states_year= self.states_in(f"{s}.Stored_heat", t0=year * self._days*24*3600,
            #                             tf=(year + 1) * self._days*24*3600)
            #     constraints.append((
            #         (ates_states_year - ates_doublet_sums[year] * bounds[f"{s}.Stored_heat"][1] / ates_N_doublets) / ates_state_big_m,
            #         -np.inf, 0.0
            #     ))
            #     # constraints.append((
            #     #     (ates_state[year * self._days:(year + 1) * self._days] - ates_doublet_sums[
            #     #         year] * bounds[f"{s}.Stored_heat"][1] / ates_N_doublets) / ates_state_big_m,
            #     #     -np.inf, 0.0
            #     # ))
            #     constraints.append((
            #         (ates_is_placed[year] - ates_doublet_sums[year], -np.inf, 0.0)
            #     ))
            #     for N in range(0, ates_N_doublets):
            #         constraints.append(
            #             (ates_is_placed[year] - ates_is_placed_doublet[N][year], 0.0, np.inf))
            #     constraints.append(((ates_daily_heat[year * self._days:(
            #                                                                        year + 1) * self._days] - big_m / 2. / ates_N_doublets *
            #                          ates_doublet_sums[year]) / (big_m), -np.inf, 0.0))
            #     constraints.append(((ates_daily_heat[year * self._days:(
            #                                                                        year + 1) * self._days] + big_m / 2. / ates_N_doublets *
            #                          ates_doublet_sums[year]) / (big_m), 0.0, np.inf))

            # For setting the initial state to 0 in the first year the ATES is placed
            constraints.append(((ates_state[0]) / ates_state_big_m, 0.0, 0.0))

            # for i in range(1, self._years):
            #     constraints.append((
            #         (ates_state[i * self._days+(self._days-1)] - ates_state[(i-1) * self._days+(self._days-1)] - (2. -
            #                     (ates_is_placed[i * self._days] + ates_is_placed[(i - 1) * self._days])) *
            #          (big_m * self._days)) / (big_m * self._days), -np.inf, 0.0)
            #     )
            #     constraints.append((
            #         (ates_state[i * self._days] - ates_state[(i-1) * self._days] + (2. -
            #                     (ates_is_placed[i * self._days] + ates_is_placed[(i - 1) * self._days])) *
            #          (big_m * self._days)) / (big_m * self._days), 0.0, np.inf)
            #     )
            # for i in range(1, self._years):
            #     constraints.append((
            #         (ates_state[i * self._days+(self._days-1)] - ates_state[(i-1) * self._days+(self._days-1)] - (2. -
            #                     (ates_is_placed[i] + ates_is_placed[(i - 1)])) *
            #          (big_m * self._days)) / (big_m * self._days), -np.inf, 0.0)
            #     )
            #     constraints.append((
            #         (ates_state[i * self._days] - ates_state[(i-1) * self._days] + (2. -
            #                     (ates_is_placed[i] + ates_is_placed[(i - 1)])) *
            #          (big_m * self._days)) / (big_m * self._days), 0.0, np.inf)
            #     )

        return constraints

    def __yearly_asset_is_placed_constraints(self, ensemble_member):
        constraints = []

        for asset, asset_is_placed_var in self._asset_is_realized_map.items():
            # asset_is_placed_vector = self.state_vector(asset_is_placed_var, ensemble_member)
            asset_is_placed_vector = self.get_asset_is__realized_symbols(asset)

            constraints.append(
                ((asset_is_placed_vector[1:] - asset_is_placed_vector[:-1]), 0.0, np.inf)
            )

        for asset, asset_fraction_placed_var in self._asset_fraction_placed_map.items():
            asset_fraction_placed_vector = self.get_asset_fraction__placed_symbols(asset)
            constraints.append(
                (
                    (asset_fraction_placed_vector[1:] - asset_fraction_placed_vector[:-1]),
                    0.0,
                    np.inf,
                )
            )

        for asset, asset_fraction_placed_name in self._asset_fraction_placed_map.items():
            asset_fraction_placed = self.get_asset_fraction__placed_symbols(asset)
            asset_is_placed_name = self.get_asset_is__realized_symbols(asset)
            constraints.append((asset_is_placed_name - asset_fraction_placed, -np.inf, 0.0))

        return constraints

    def __demand_matching_constraints(self, ensemble_member):
        constraints = []

        # Constraint to enforce matching demands if is_placed
        for d in self.energy_system_components.get("heat_demand", []):
            heat_demand = self.__state_vector_scaled(f"{d}.Heat_demand", ensemble_member)
            target = self.get_timeseries(f"{d}.target_heat_demand")

            big_m = 2.0 * np.max(target.values)
            for year in range(self._years):
                time_start = year * 3600 * 8760
                time_end = (year + 1) * 3600 * 8760                
                start_index = np.where(target.times == time_start)[0][0]
                end_index = np.where(target.times == time_end)[0][0]
                demand_states = self.states_in(f"{d}.Heat_demand", time_start, time_end)
                if year == self._years -1:
                    end_index += 1
                else:
                    demand_states = demand_states[:-1]
                asset_is_realized = self.extra_variable(f"{d}__asset_is_realized_{year}")
                # demand matching
                constraints.append(
                    (
                        (
                            demand_states
                            - asset_is_realized * target.values[start_index:end_index]
                        )
                        / target.values[start_index:end_index],
                        0.0,
                        0.0,
                    )
                )

        return constraints

    def __yearly_investment_constraints(self, ensemble_member):
        constraints = []

        bounds = self.bounds()

        # Constraint to set yearly maximum CAPEX
        # TODO: CAPEX constraint sources and demands now total capex not yet possible to use
        #  fraction placed variables. See __yearly_investment_constraints_old for that
        for y in range(self._years):
            cumulative_capex = 0

            # pipes
            for p in self.hot_pipes:
                # cumulative_investements_made does not yet cather for fraction_placed
                cumulative_inv_pipe = self.extra_variable(
                    f"{p}__cumulative_investments_made_in_eur_year_{y}"
                )
                cumulative_capex += cumulative_inv_pipe

            # sources
            for s in self.energy_system_components.get("heat_source", []):
                cumulative_inv_source = self.extra_variable(
                    f"{s}__cumulative_investments_made_in_eur_year_{y}"
                )
                cumulative_capex += cumulative_inv_source

            # consumers
            for d in self.energy_system_components.get("heat_demand", []):
                cumulative_inv_demand = self.extra_variable(
                    f"{d}__cumulative_investments_made_in_eur_year_{y}"
                )
                cumulative_capex += cumulative_inv_demand

            # ates
            for a in self.energy_system_components.get("ates", []):
                ates_N_doublets = self.parameters(0)[f"{a}.nr_of_doublets"]
                ates_capex = 0.0  # TODO: add proper costs ates
                # a_capex = self._ates_capex_dict[a]
                # ates_doublet_sums_fraction = self.__ates_doublet_sums(a)[1]
                # if y == 0:
                #     ates_capex = a_capex / ates_N_doublets * ates_doublet_sums_fraction[y]
                # else:
                #     ates_capex = a_capex / ates_N_doublets * (ates_doublet_sums_fraction[y] -
                #                                               ates_doublet_sums_fraction[y - 1])
                cumulative_capex += ates_capex

            year_nominal = bounds[f"yearly_capex_{y}"][1]
            yearly_capex_var = self.extra_variable(f"yearly_capex_{y}", ensemble_member)
            if y == 0:
                constraints.append(((yearly_capex_var - cumulative_capex) / year_nominal, 0.0, 0.0))
            else:
                constraints.append(
                    (
                        (yearly_capex_var - (cumulative_capex - cumulative_capex_prev_year))
                        / year_nominal,
                        0.0,
                        0.0,
                    )
                )
            cumulative_capex_prev_year = cumulative_capex

        return constraints

    def __minimum_operational_constraints(self, ensemble_member):
        constraints = []

        bounds = self.bounds()
        for asset, asset_is_placed_var in self._asset_is_realized_map.items():
            if asset not in self.energy_system_components.get("geothermal_source", []):
                continue
            geo_is_placed = self.get_asset_is__realized_symbols(asset)
            heat_produced = self.__state_vector_scaled(f"{asset}.Heat_source", ensemble_member)
            max_heat = bounds[f"{asset}.Heat_source"][1]
            max_heat_year = max_heat * self._days

            for year in range(self._years):
                total_heat_year = 0
                for i in range(self._days):
                    total_heat_year += heat_produced[year * self._days + i]
                constraints.append(
                    (
                        total_heat_year / max_heat_year
                        - geo_is_placed[year] * self._min_geo_utilization,
                        0.0,
                        np.inf,
                    )
                )
        return constraints

    def __ates_yearly_initial_constraints(self, ensemble_member):
        constraints = []

        for s in self.energy_system_components.get("ates", []):
            ates_state = self.__state_vector_scaled(f"{s}.Storage_yearly_change", ensemble_member)
            nominal = self.variable_nominal(f"{s}.Heat_ates")
            for i in range(len(self.times())):
                if i % self._days != 0:
                    # set the storage_yearly_change to zero at all days except first timestep of each year
                    constraints.append(((ates_state[i]) / nominal, 0.0, 0.0))
        return constraints

    def __ates_yearly_periodic_constraints(self, ensemble_member):
        constraints = []

        for s in self.energy_system_components.get("ates", []):
            ates_state = self.__state_vector_scaled(f"{s}.Stored_heat", ensemble_member)
            nominal = self.variable_nominal(f"{s}.Storage_yearly_change")
            times = self.times() / 3600 / 24
            for i in range(len(times) - 1):
                if i % self._days == 0:
                    print(i, times[i], i + self._days - 1, times[i + self._days - 1])
                    # set the storage first timestep equal to last of each year
                    constraints.append(
                        ((ates_state[i] - ates_state[i + self._days - 1]) / nominal, 0.0, 0.0)
                    )
        return constraints

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        # constraints.extend(self.__demand_matching_constraints(ensemble_member))

        # TODO: This ensures __asset_is_realized_ and __is_placed_ variables are set equal,
        # thereby __is_placed can be removed for heat_source, heat_demand and hot_pipes

        constraints.extend(self.__ates_placed_balance_constraints(ensemble_member))
        constraints.extend(self.__demand_matching_constraints(ensemble_member))

        constraints.extend(self.__yearly_asset_is_placed_constraints(ensemble_member))
        constraints.extend(self.__ates_yearly_initial_constraints(ensemble_member))
        constraints.extend(self.__ates_yearly_periodic_constraints(ensemble_member))

        # # asset cost constraints need to be implemented before yearly investment constraints,
        # # due to dictionaries to be filled with the variable sums.
        constraints.extend(self.__yearly_investment_constraints(ensemble_member))
        # constraints.extend(self.__yearly_investment_constraints_old(ensemble_member))

        constraints.extend(self.__minimum_operational_constraints(ensemble_member))

        return constraints

    def path_constraints(self, ensemble_member):
        constraints = super().path_constraints(ensemble_member)

        return constraints

    def get_asset_is__realized_symbols(self, asset_name):
        symbols = [f"{asset_name}__asset_is_realized_{year}" for year in range(self._years)]

        return self.extra_variable_vector(symbols, 0)

    def get_asset_fraction__placed_symbols(self, asset_name):
        # symbols = [self.extra_variable(f"{asset_name}__fraction_placed_{year}", 0) for year in range(self._years)]
        symbols = [f"{asset_name}__fraction_placed_{year}" for year in range(self._years)]
        return self.extra_variable_vector(symbols, 0)

    def extra_variable_vector(self, symbols, ensemble_member):
        states = []
        for symbol in symbols:
            canonical, sign = self.alias_relation.canonical_signed(symbol)
            nominal = self.variable_nominal(canonical)
            state = nominal * self.state_vector(canonical, ensemble_member)
            states.append(state)
        extra_var_vector = ca.vertcat(*states)
        # return np.array([self.extra_variable(symbol, ensemble_member) for symbol in symbols])
        return extra_var_vector

    def history(self, ensemble_member):
        return AliasDict(self.alias_relation)

    def energy_system_options(self):
        options = super().energy_system_options()
        options["heat_loss_disconnected_pipe"] = False
        options["include_asset_is_realized"] = True
        options["include_ates_yearly_change_option"] = True
        return options

    @property
    def extra_variables(self):
        variables = super().extra_variables.copy()
        variables.extend(self._yearly_capex_var.values())
        variables.extend(self.__asset_doublet_is_placed_var.values())
        variables.extend(self.__asset_fraction_placed_var.values())
        return variables

    @property
    def path_variables(self):
        variables = super().path_variables.copy()
        variables.extend(self.__ates_state_heat_var.values())
        return variables

    def variable_is_discrete(self, variable):
        if (
            # variable in self.__ates_is_charging_var or \
            variable in self.__asset_doublet_is_placed_var
        ):
            return True
        else:
            return super().variable_is_discrete(variable)

    def variable_nominal(self, variable):
        if variable in self._yearly_capex_var_nominals:
            return self._yearly_capex_var_nominals[variable]
        elif variable in self.__ates_state_heat_var_nominals:
            return self.__ates_state_heat_var_nominals[variable]
        else:
            return super().variable_nominal(variable)

    def bounds(self):
        bounds = super().bounds()
        bounds.update(self.__asset_doublet_is_placed_var_bounds)
        bounds.update(self.__ates_state_heat_var_bounds)
        bounds.update(self._yearly_capex_var_bounds)
        bounds.update(self.__asset_fraction_placed_var_bounds)
        return bounds

    def __state_vector_scaled(self, variable, ensemble_member):
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )

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
        self._priority = priority
        self.__priority_timer = time.time()

        super().priority_started(priority)

    def priority_completed(self, priority):
        super().priority_completed(priority)
        self._priority = priority
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

    def post(self):
        # In case the solver fails, we do not get in priority_completed(). We
        # append this last priority's statistics here in post().
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

        # Calculate some additional results required/wanted by the CF
        times = self.times()

        results = self.extract_results()
        parameters = self.parameters(0)

        super().post()

        # try:
        #     self._write_updated_esdl(self._ESDLMixin__energy_system_handler.energy_system)
        # except AttributeError:
        #     # Staging does not exist
        #     self._write_updated_esdl(self._ESDLMixin__energy_system_handler.energy_system)
        # except Exception:
        #     logger.error("Unkown error occured when evaluating self._stage for _write_updated_esdl")
        #     sys.exit(1)

        if os.path.exists(self.output_folder) and self._save_json:
            bounds = self.bounds()
            aliases = self.alias_relation._canonical_variables_map
            solver_stats = self.solver_stats
            self._write_json_output(results, parameters, bounds, aliases, solver_stats)

        # rollout_post(self, results)
