import logging
import os
import sys
import time

import casadi as ca

from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.goals.rollout_goal import (
    MaximizeRevenueCosts,
    MinimizeCAPEXAssetsCosts,
    MinimizeRolloutFixedOperationalCosts,
    MinimizeVariableOPEX,
)
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_profile_averages_timestep_size,
    adapt_profile_for_initial_hour_timestep_size,
    adapt_profile_to_copy_for_number_of_years,
)

import numpy as np

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

#  from mesido.workflows.io.rollout_post import rollout_post

logger = logging.getLogger("mesido")
logger.setLevel(logging.INFO)


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
        cplex_options["CPX_PARAM_EPGAP"] = 0.001
        options["highs"] = None

        return options


class RollOutProblem(
    # SolverCPLEX,
    SolverHIGHS,
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
        # with peak day is used, however one needs to check where self._timesteps_per_year and
        # self._timestep_size is currently affecting the code
        self._timestep_size = kwargs.get("_timestep_size", 30 * 24)
        self._timesteps_per_year = int(365 / (self._timestep_size / 24)) + 1
        self._timesteps_per_year = (
            self._timesteps_per_year + 1
        )  # + 1 because of inserting an 1-hour timestep at the beginning of the year,
        # see adapt_profile_for_initial_hour_timestep_size()

        # TODO: get yearly max capex from input
        self._yearly_max_capex = (
            6.0e6 if "yearly_max_capex" not in kwargs else kwargs["yearly_max_capex"]
        )
        self._years_timestep_max_capex = self._yearly_max_capex * self._horizon / self._years

        # Fraction of how much heat of the total maximum the geo source can produce it should
        # produce in every year that it is placed
        self._min_geo_utilization = 0.7

        self._save_json = True

        self.heat_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS
        self.heat_network_settings["minimum_velocity"] = 0.0  # important otherwise heatdemands
        # cannot be turned off for specific timesteps

        # TODO: remove this once  these variables are created in HeatPhysicsMixin
        # (is under development in another PR)
        self._ates_is_charging_map = {}
        self.__ates_is_charging_var = {}
        self.__ates_is_charging_var_bounds = {}

        self._asset_fraction_placed_map = {}
        self.__asset_fraction_placed_var = {}
        self.__asset_fraction_placed_var_bounds = {}

        # TODO: placeholder for when assets with doublet (integer counts) become available
        self._asset_doublet_is_placed_map = {}
        self.__asset_doublet_is_placed_var = {}
        self.__asset_doublet_is_placed_var_bounds = {}

        self.__ates_state_heat_var_map = {}
        self.__ates_state_heat_var = {}
        self.__ates_state_heat_var_bounds = {}
        self.__ates_state_heat_var_nominals = {}

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
        for pipe in [*self.hot_pipes, *self.cold_pipes]:
            parameters[f"{pipe}.disconnectable"] = True
        return parameters

    def read(self):
        super().read()

        # Create yearly profile with desired coarser time-step size by
        # averaging over the hourly data
        adapt_hourly_profile_averages_timestep_size(self, self._timestep_size)

        # A small, (1 hour) timestep is inserted as first time step. This is used in the
        # rollout workflow to allow a yearly change in the storage of the ATES system.
        # The first time step is used to accommodate the (yearly) initial storage
        # level of the ATES.
        adapt_profile_for_initial_hour_timestep_size(self)

        # Adapt the profiles to copy for the number of years
        adapt_profile_to_copy_for_number_of_years(self, self._years)

    def pre(self):
        self._qpsol = CachingQPSol()

        super().pre()

        logger.warning(
            "Note: The rollout workflow is still under development and not fully tested yet."
        )

        asset_types = ["low_temperature_ates", "heat_buffer", "geothermal_source", "heat_pump"]
        for asset_type in asset_types:
            if len(self.energy_system_components.get(asset_type, [])) > 0:
                logger.error(
                    f"The asset type {asset_type} is not supported in the rollout workflow."
                )
                sys.exit(1)

        # TODO: The asset_fraction_placed is not yet fully functional, eg. not in objective.
        for asset in [
            *self.energy_system_components.get("ates", []),
            *self.energy_system_components.get("heat_demand", []),
            *self.energy_system_components.get("heat_source", []),
            *self.energy_system_components.get("heat_pipe", []),
        ]:
            self._asset_fraction_placed_map[asset] = []
            for year in range(self._years):
                asset_fraction_placed_var = f"{asset}__fraction_placed_{year}"
                self._asset_fraction_placed_map[asset].append(asset_fraction_placed_var)
                self.__asset_fraction_placed_var[asset_fraction_placed_var] = ca.MX.sym(
                    asset_fraction_placed_var
                )
                self.__asset_fraction_placed_var_bounds[asset_fraction_placed_var] = (
                    0.0,
                    1.0,
                )

        # TODO still needs to be checked if this is also properly added to financial mixing for
        # asset_is_realized for the doublets, then there is no need to do the asset fraction.

        # for asset in [*self.energy_system_components.get("ates", [])]:
        #     for year in range(self._years):
        #         N_doublets = self.parameters(0)[f"{asset}.nr_of_doublets"]
        #         # for i in range(1, N_doublets + 1):
        #         #     asset_is_placed_var = f"{asset}_doublet_{i}__is_placed_{year}"
        #         #     self._asset_doublet_is_placed_map[
        #         #         f"{asset}_doublet_{i}"] = asset_is_placed_var  # might be unnecessary
        #         #     self._asset_is_placed_map[f"{asset}_doublet_{i}"] = asset_is_placed_var
        #         #     self.__asset_doublet_is_placed_var[asset_is_placed_var] = c
        #         #         a.MX.sym(asset_is_placed_var)
        #         #     self.__asset_doublet_is_placed_var_bounds[asset_is_placed_var] = (0.0, 1.0)
        #         #     # self.__asset_is_placed_var[asset_is_placed_var] =
        #         #            ca.MX.sym(asset_is_placed_var)
        #         #     # self.__asset_is_placed_var_bounds[asset_is_placed_var] = (0.0, 1.0)
        #         #
        #         #     asset_fraction_placed_var = f"{asset}_doublet_{i}__fraction_placed_{year}"
        #         #     self._asset_fraction_placed_map[f"{asset}_doublet_{i}"] =
        #         #     asset_fraction_placed_var
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
            self._yearly_capex_var_bounds[var_name] = (
                0,
                self._years_timestep_max_capex,
            )
            self._yearly_capex_var_nominals[var_name] = self._years_timestep_max_capex / 2.0

    def energy_system_options(self):
        options = super().energy_system_options()
        options["heat_loss_disconnected_pipe"] = False
        options["neglect_pipe_heat_losses"] = True
        options["include_asset_is_realized"] = True
        options["include_ates_yearly_change_option"] = True
        options["yearly_investments"] = True
        return options

    def path_goals(self):
        goals = super().goals().copy()

        goals.append(
            MaximizeRevenueCosts(
                market_price=125e-6,
                year_step_size=self._year_step_size,
                priority=1,
            )
        )

        # goals.append(MinimizeATESState(priority=2))

        return goals

    def goals(self):
        goals = super().goals().copy()

        goals.append(MinimizeCAPEXAssetsCosts(priority=1))

        goals.append(MinimizeVariableOPEX(year_step_size=self._year_step_size, priority=1))

        goals.append(MinimizeRolloutFixedOperationalCosts(priority=1))

        return goals

    # TODO: This function might be used for the doublet in later development
    # def __ates_doublet_sums(self, s):
    #     ates_N_doublets = self.parameters(0)[f"{s}.nr_of_doublets"]
    #     ates_doublet_sums = self.get_asset_is__realized_symbols(f"{s}_doublet_{1}")
    #     ates_doublet_fraction_sums = self.get_asset_fraction__placed_symbols(f"{s}_doublet_{1}")
    #     for N in range(1, ates_N_doublets):
    #         ates_doublet_sums += self.get_asset_is__realized_symbols(f"{s}_doublet_{N + 1}")
    #         ates_doublet_fraction_sums += self.get_asset_fraction__placed_symbols(
    #             f"{s}_doublet_{N + 1}"
    #         )

    #     return ates_doublet_sums, ates_doublet_fraction_sums

    def __ates_initial_constraints(self, ensemble_member):
        """
        Initialize ates for first timestep of the simulation.

        """
        constraints = []

        bounds = self.bounds()
        for s in self.energy_system_components.get("ates", []):
            ates_state = self.__state_vector_scaled(f"{s}.Stored_heat", ensemble_member)
            ates_state_big_m = 2.0 * bounds[f"{s}.Stored_heat"][1]

            # For setting the initial state to 0 in the first year the ATES is placed
            constraints.append(((ates_state[0]) / ates_state_big_m, 0.0, 0.0))

            ates_state_big_m = 2.0 * bounds[f"{s}.Heat_ates"][1]
            ates_state = self.__state_vector_scaled(f"{s}.Heat_ates", ensemble_member)
            constraints.append(((ates_state[0]) / ates_state_big_m, 0.0, 0.0))

        return constraints

    def __yearly_asset_is_placed_constraints(self, ensemble_member):
        constraints = []

        for asset, _asset_is_placed_var in self._asset_is_realized_map.items():
            asset_is_placed_vector = self.get_asset_is__realized_symbols(asset)

            constraints.append(
                (
                    (asset_is_placed_vector[1:] - asset_is_placed_vector[:-1]),
                    0.0,
                    np.inf,
                )
            )

        for asset, _asset_fraction_placed_var in self._asset_fraction_placed_map.items():
            asset_fraction_placed_vector = self.get_asset_fraction__placed_symbols(asset)
            constraints.append(
                (
                    (asset_fraction_placed_vector[1:] - asset_fraction_placed_vector[:-1]),
                    0.0,
                    np.inf,
                )
            )

        for (
            asset,
            _asset_fraction_placed_name,
        ) in self._asset_fraction_placed_map.items():
            asset_fraction_placed = self.get_asset_fraction__placed_symbols(asset)
            asset_is_placed_name = self.get_asset_is__realized_symbols(asset)
            constraints.append((asset_is_placed_name - asset_fraction_placed, -np.inf, 0.0))

        return constraints

    def __demand_matching_constraints(self, ensemble_member):
        constraints = []

        # Constraint to enforce matching demands if is_placed
        for d in self.energy_system_components.get("heat_demand", []):
            target = self.get_timeseries(f"{d}.target_heat_demand")

            for year in range(self._years):
                time_start = year * 3600 * 8760
                time_end = (year + 1) * 3600 * 8760
                start_index = np.where(target.times == time_start)[0][0]
                end_index = np.where(target.times == time_end)[0][0]
                demand_states = self.states_in(f"{d}.Heat_demand", time_start, time_end)
                if year == self._years - 1:
                    end_index += 1
                else:
                    demand_states = demand_states[:-1]
                asset_is_realized = self.extra_variable(f"{d}__asset_is_realized_{year}")
                # demand matching
                constraints.append(
                    (
                        (demand_states - asset_is_realized * target.values[start_index:end_index])
                        / target.values[start_index:end_index],
                        0.0,
                        0.0,
                    )
                )

        return constraints

    def __all_demands_placed_constraints(self, ensemble_member):
        """
        Constraint to ensure all heating demands are placed at the end of the optimization

        """
        constraints = []

        for d in self.energy_system_components.get("heat_demand", []):
            asset_realized_vector = self.get_asset_is__realized_symbols(d)

            # ensure asset is placed at end of optimization
            constraints.append((asset_realized_vector[-1], 1.0, 1.0))

        return constraints

    def __yearly_investment_constraints(self, ensemble_member):
        """
        Constraints to set the yearly maximum CAPEX. The CAPEX here is the cumulative investments
        of the assets placed.

        """

        constraints = []

        bounds = self.bounds()

        # Constraint to set yearly maximum CAPEX
        # TODO: CAPEX constraint sources and demands now total capex not yet possible to use
        #  fraction placed variables.
        cumulative_capex_prev_year = 0
        for y in range(self._years):
            cumulative_capex = 0

            # pipes
            # for p in self.hot_pipes:
            for p in self.energy_system_components.get("heat_pipe", []):
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
                # ates_N_doublets = self.parameters(0)[f"{a}.nr_of_doublets"]
                ates_capex = 0.0  # TODO: add proper costs ates
                ates_capex = self.extra_variable(
                    f"{a}__cumulative_investments_made_in_eur_year_{y}"
                )
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

    def __yearly_pipe_length_constraints(self, ensemble_member):
        """
        Constraints to set the yearly maximum pipe length that can be placed.
        """
        constraints = []

        bounds = self.bounds()
        parameters = self.parameters(ensemble_member)

        # Constraint to set yearly maximum CAPEX
        # TODO: CAPEX constraint sources and demands now total capex not yet possible to use
        #  fraction placed variables.
        cumulative_pipe_length_prev_year = 0
        for y in range(self._years):
            cumulative_pipe_length = 0

            # pipes
            # for p in self.hot_pipes:
            for p in self.energy_system_components.get("heat_pipe", []):
                pipe_placement = self.extra_variable(
                    self._asset_is_realized_map[p][y]
                    # f"{p}__asset_is_realized_{y}"
                )
                pipe_length = parameters[f"{p}.length"]
                # print(p, pipe_length, bounds[self._asset_is_realized_map[p][y]])
                cumulative_pipe_length += pipe_placement * pipe_length

            # TODO: should be set by kwargs
            year_pipe_length = 1.0e3  # m per year

            # if y == 0:
            #     constraints.append(((year_pipe_length*self._horizon/self._years - cumulative_pipe_length) /
            #                         year_pipe_length,
            #                         0.0, np.inf))
            # else:
            # constraints.append(
            #     (
            #         (year_pipe_length*self._horizon/self._years - (cumulative_pipe_length - cumulative_pipe_length_prev_year))
            #         / year_pipe_length,
            #         0.0,
            #         np.inf,
            #     )
            # )
            if y > -1.0:
                constraints.append(
                    (
                        (
                            year_pipe_length * self._horizon / self._years * (y + 1)
                            - cumulative_pipe_length
                        )
                        / year_pipe_length,
                        0.0,
                        np.inf,
                    )
                )
            # cumulative_pipe_length_prev_year = cumulative_pipe_length

        return constraints

    def __minimum_operational_constraints(self, ensemble_member):
        """
        Constraints to ensure that the geothermal source produces at least a minimum amount of heat
        when it is placed. The minimum amount of heat is defined as a fraction of the maximum
        heat that the geothermal source can produce in a year.

        """

        constraints = []

        bounds = self.bounds()
        for asset, _asset_is_placed_var in self._asset_is_realized_map.items():
            if asset not in self.energy_system_components.get("geothermal_source", []):
                continue

            logger.warning(
                f"The function {self.__minimum_operational_constraints.__name__} is not tested yet."
            )

            geo_is_placed = self.get_asset_is__realized_symbols(asset)
            heat_produced = self.__state_vector_scaled(f"{asset}.Heat_source", ensemble_member)
            max_heat = bounds[f"{asset}.Heat_source"][1]
            max_heat_year = max_heat * 8760  # 8760 hours in a year

            for year in range(self._years):
                total_heat_year = 0
                dt = np.diff(self.io.times_sec / 3600)
                for i in range(self._timesteps_per_year):
                    total_heat_year += (
                        heat_produced[year * self._timesteps_per_year + i]
                        * dt[year * self._timesteps_per_year + i]
                    )
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
        """
        Constraints to set the initial state of an ATES at the first timestep of each year.
        The storage_yearly_change variable is set to zero at all days except the first timestep
        of each year. This variable allow the ATES to have a different initial heat storage levels
        at the beginning of each year.

        """

        constraints = []

        for s in self.energy_system_components.get("ates", []):
            ates_state = self.__state_vector_scaled(f"{s}.Storage_yearly_change", ensemble_member)
            nominal = self.variable_nominal(f"{s}.Heat_ates")
            for i in range(len(self.times())):
                if i % self._timesteps_per_year != 0:
                    # set the storage_yearly_change to zero at all days except first timestep
                    # of each year
                    constraints.append(((ates_state[i]) / nominal, 0.0, 0.0))
        return constraints

    def __ates_yearly_periodic_constraints(self, ensemble_member):
        """
        Constraints to set a yearly periodic condition for an ATES so that the stored
        heat at the end of the year equals that of the beginning of the year.

        """

        constraints = []

        for s in self.energy_system_components.get("ates", []):
            ates_state = self.__state_vector_scaled(f"{s}.Stored_heat", ensemble_member)
            nominal = self.variable_nominal(f"{s}.Stored_heat")
            for i in range(len(self.times()) - 1):
                if i % self._timesteps_per_year == 0:
                    # set the storage first timestep equal to last of each year
                    constraints.append(
                        (
                            (ates_state[i] - ates_state[i + self._timesteps_per_year - 1])
                            / nominal,
                            0.0,
                            0.0,
                        )
                    )
        return constraints

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        constraints.extend(self.__ates_initial_constraints(ensemble_member))
        constraints.extend(self.__demand_matching_constraints(ensemble_member))

        constraints.extend(self.__yearly_asset_is_placed_constraints(ensemble_member))
        constraints.extend(self.__ates_yearly_initial_constraints(ensemble_member))
        constraints.extend(self.__ates_yearly_periodic_constraints(ensemble_member))

        constraints.extend(self.__all_demands_placed_constraints(ensemble_member))
        constraints.extend(self.__yearly_investment_constraints(ensemble_member))
        constraints.extend(self.__yearly_pipe_length_constraints(ensemble_member))

        constraints.extend(self.__minimum_operational_constraints(ensemble_member))

        return constraints

    def path_constraints(self, ensemble_member):
        constraints = super().path_constraints(ensemble_member)

        return constraints

    def get_asset_is__realized_symbols(self, asset_name):
        symbols = [f"{asset_name}__asset_is_realized_{year}" for year in range(self._years)]

        return self.extra_variable_vector(symbols, 0)

    def get_asset_fraction__placed_symbols(self, asset_name):
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
        return extra_var_vector

    def history(self, ensemble_member):
        return AliasDict(self.alias_relation)

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
            # variable in self.__ates_is_charging_var or
            variable
            in self.__asset_doublet_is_placed_var
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
                    self._priority,
                    time_taken,
                    False,
                    self.objective_value,
                    self.solver_stats,
                )
            )

        # Calculate some additional results required/wanted by the CF

        results = self.extract_results()
        parameters = self.parameters(0)

        super().post()

        if os.path.exists(self.output_folder) and self._save_json:
            bounds = self.bounds()
            aliases = self.alias_relation._canonical_variables_map
            solver_stats = self.solver_stats
            self._write_json_output(results, parameters, bounds, aliases, solver_stats)

        # rollout_post(self, results)
