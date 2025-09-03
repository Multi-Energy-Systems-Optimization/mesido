import logging

import casadi as ca

from mesido.workflows.utils.helpers import get_cost_value_and_unit

import numpy as np

from rtctools.optimization.single_pass_goal_programming_mixin import Goal

logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)


STANDARD_ASSET_LIFETIME = 30.0


class TargetHeatPlacedGoal(Goal):
    priority = 1

    order = 1

    def __init__(self, asset, _years):
        self.asset = asset
        self._years = _years

    def function(self, optimization_problem, ensemble_member):
        obj = 0.0
        state_vector = optimization_problem.state(f"{self.asset}.Heat_demand")
        self.function_nominal = optimization_problem.variable_nominal(f"{self.asset}.Heat_demand")
        target = optimization_problem.get_timeseries(f"{self.asset}.target_heat_demand")
        asset_is_realized_vector = []
        # for year in range(self._years):
        #     asset_is_realized_vector.append(self.extra_variable(
        #             f"{d}__asset_is_realized_{year}"
        #         ))
        asset_is_realized_vector = optimization_problem.get_asset_is__realized_symbols(self.asset)

        for year in range(self._years):
            time_start = year * 3600 * 8760
            time_end = (year + 1) * 3600 * 8760
            start_index = np.where(target.times == time_start)[0][0]
            end_index = np.where(target.times == time_end)[0][0]
            demand_states = optimization_problem.states_in(f"{self.asset}.Heat_demand", time_start,
                                                           time_end)
            if year == self._years - 1:
                end_index += 1
            else:
                demand_states = demand_states[:-1]
            asset_is_realized = asset_is_realized_vector[year]
            # asset_is_realized = self.extra_variable(
            #     f"{d}__asset_is_realized_{year}"
            # )
            # demand matching
            for i in range(start_index-start_index, end_index-start_index):
                obj += (asset_is_realized * target.values[start_index:end_index][i] -
                        demand_states[i])

        return obj

class MinimizeVariableOPEX(Goal):
    order = 1

    def __init__(self, year_step_size=10, priority=1):
        self.priority = priority
        self.year_step_size = year_step_size
        self.function_nominal = 1.0e9

    def function(self, optimization_problem, ensemble_member):
        obj = 0
        asset_varopex_map = optimization_problem._asset_variable_operational_cost_map

        for asset in [
            *optimization_problem.energy_system_components.get("heat_source", []),
            *optimization_problem.energy_system_components.get("ates", []),
        ]:

            extra_var = optimization_problem.extra_variable(asset_varopex_map.get(asset, 0.0))
            obj += extra_var * self.year_step_size

        return obj


class MaximizeRevenueCosts(Goal):

    order = 1

    def __init__(self, market_price=50e-6, year_step_size=10, priority=None):
        self.market_price = market_price  # [€/Wh]
        self.priority = priority
        self.year_step_size = year_step_size
        self.function_nominal = 1.0e9

    def function(self, optimization_problem, ensemble_member: int) -> ca.MX:
        obj = 0.0
        obj -= self.year_step_size * self.revenue_heat_delivered(
            optimization_problem, ensemble_member
        )

        return obj

    def revenue_heat_delivered(self, optimization_problem, ensemble_member: int) -> ca.MX:
        obj = 0
        timesteps = np.diff(optimization_problem.times()) / 3600.0
        for demand in optimization_problem.energy_system_components.get("heat_demand", []):
            obj += (
                optimization_problem.state(f"{demand}.Heat_demand") * timesteps * self.market_price
            )
        return obj


class MinimizeATESState(Goal):

    order = 1

    def __init__(self, priority=2):
        self.priority = priority

    def function(self, optimization_problem, ensemble_member):
        obj = 0.0
        for a in optimization_problem.energy_system_components.get("ates", []):
            obj += optimization_problem.state(f"{a}.Heat_loss")

        return obj / 1.0e6


class MinimizeCAPEXAssetsCosts(Goal):

    order = 1

    def __init__(self, priority=None):
        self.priority = priority
        self.function_nominal = 1.0e9

    def function(self, optimization_problem, ensemble_member):
        obj = self.capex_assets(optimization_problem, ensemble_member)
        return obj

    def capex_assets(self, optimization_problem, ensemble_member):
        # TODO: Check if cumulative capex costs can be used here.
        obj = 0.0
        parameters = optimization_problem.parameters(ensemble_member)
        bounds = optimization_problem.bounds()
        for asset_name in [
            *optimization_problem.energy_system_components.get("ates", []),
            *optimization_problem.energy_system_components.get("heat_demand", []),
            *optimization_problem.energy_system_components.get("heat_pipe", []),
            *optimization_problem.energy_system_components.get("heat_source", []),
        ]:
            asset = optimization_problem.get_asset_from_asset_name(asset_name=asset_name)
            tech_lifetime = parameters[f"{asset_name}.technical_life"]
            # FIXME: temporary as long as generic esdl_heat_model_modifiers are not added everywhere
            if not tech_lifetime > 0.0:
                tech_lifetime = STANDARD_ASSET_LIFETIME

            if asset.asset_type == "Pipe":
                is_placed = optimization_problem.get_asset_is__realized_symbols(asset_name)
                # investment_cost_coeff = optimization_problem.get_pipe_investment_cost_coefficient(
                #     asset_name, ensemble_member
                # )
                investment_cost_coeff = parameters[f"{asset_name}.investment_cost_coefficient"]
                length = parameters[f"{asset_name}.length"]

                costs = investment_cost_coeff * length
            else:
                # Yearly depreciation for all assets based on total investment + installation
                is_placed = optimization_problem.get_asset_fraction__placed_symbols(asset_name)
                investment_cost_coeff = parameters[f"{asset_name}.investment_cost_coefficient"]
                installation_cost = parameters[f"{asset_name}.installation_cost"]
                size = bounds[optimization_problem._asset_max_size_map[asset_name]][1]
                if size == 0:
                    raise RuntimeError(f"Could not determine the max power of asset {asset_name}")
                inv_costs = investment_cost_coeff * size
                inst_costs = installation_cost

                costs = inv_costs + inst_costs

            for i in range(optimization_problem._years):
                obj += is_placed[i] * costs / tech_lifetime

        return obj * optimization_problem._year_step_size


class MinimizeRolloutFixedOperationalCosts(Goal):

    order = 1

    def __init__(self, years=25, priority=1):
        self.priority = priority
        self.year_steps = years
        self.function_nominal = 1.0e9

    def function(self, optimization_problem, ensemble_member: int) -> ca.MX:
        obj = 0.0
        obj += (
            optimization_problem._horizon
            / optimization_problem._years
            * self.fixed_operational_costs(optimization_problem, ensemble_member)
        )

        return obj

    def fixed_operational_costs(self, optimization_problem, ensemble_member: int) -> ca.MX:
        obj = 0.0

        bounds = optimization_problem.bounds()
        parameters = optimization_problem.parameters(ensemble_member)
        for source in optimization_problem.energy_system_components.get("heat_source", []):
            obj += self.fixed_opex_of_asset(optimization_problem, source, bounds, parameters)

        for _ in optimization_problem.energy_system_components.get("ates", []):
            # TODO: this must be changed if the optimization uses placement of individual doublets
            #  of the assset.
            # obj += self.fixed_opex_of_asset(optimization_problem, ates)
            pass

        return obj

    def fixed_opex_of_asset(self, optimization_problem, asset_name, bounds, parameters):
        obj = 0

        is_placed = optimization_problem.get_asset_is__realized_symbols(asset_name)
        fixed_operational_cost_coeff = parameters[
            f"{asset_name}.fixed_operational_cost_coefficient"
        ]
        # fixed_operational_cost = optimization_problem._asset_fixed_operational_cost_map.get(
        #     asset_name)
        max_power = bounds[optimization_problem._asset_max_size_map[asset_name]][1]
        if max_power == 0:
            raise RuntimeError(f"Could not determine the max power of asset {asset_name}")
        # TODO: this can later be replaced by creating a new variable
        # {asset}_fix_operational_cost_{year} set equal to is_placed[i] *
        # _asset_fixed_operational_cost_map_var using bigm constraints.
        for i in range(optimization_problem._years):
            obj += is_placed[i] * fixed_operational_cost_coeff * max_power

        return obj
