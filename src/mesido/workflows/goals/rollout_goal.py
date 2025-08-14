import casadi as ca

import logging

import numpy as np
from esdl import esdl
from esdl.esdl import UnitEnum, TimeUnitEnum
from rtctools.optimization.single_pass_goal_programming_mixin import Goal
from mesido.esdl.common import Asset

logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)


STANDARD_ASSET_LIFETIME = 30.0


MULTI_ENUM_NAME_TO_FACTOR = {
    esdl.MultiplierEnum.ATTO: 1e-18,
    esdl.MultiplierEnum.FEMTO: 1e-15,
    esdl.MultiplierEnum.PICO: 1e-12,
    esdl.MultiplierEnum.NANO: 1e-9,
    esdl.MultiplierEnum.MICRO: 1e-6,
    esdl.MultiplierEnum.MILLI: 1e-3,
    esdl.MultiplierEnum.CENTI: 1e-2,
    esdl.MultiplierEnum.DECI: 1e-1,
    esdl.MultiplierEnum.NONE: 1e0,
    esdl.MultiplierEnum.DEKA: 1e1,
    esdl.MultiplierEnum.HECTO: 1e2,
    esdl.MultiplierEnum.KILO: 1e3,
    esdl.MultiplierEnum.MEGA: 1e6,
    esdl.MultiplierEnum.GIGA: 1e9,
    esdl.MultiplierEnum.TERA: 1e12,
    esdl.MultiplierEnum.TERRA: 1e12,
    esdl.MultiplierEnum.PETA: 1e15,
    esdl.MultiplierEnum.EXA: 1e18,
}


def get_cost_value_and_unit(cost_info: esdl.SingleValue):
    cost_value = cost_info.value
    unit_info = cost_info.profileQuantityAndUnit
    unit = unit_info.unit
    per_time_uni = unit_info.perTimeUnit
    per_unit = unit_info.perUnit
    multiplier = unit_info.multiplier
    per_multiplier = unit_info.perMultiplier

    cost_value *= MULTI_ENUM_NAME_TO_FACTOR[multiplier]
    cost_value /= MULTI_ENUM_NAME_TO_FACTOR[per_multiplier]

    return cost_value, unit, per_unit, per_time_uni


class MinimizeVariableOPEX(Goal):
    order = 1

    def __init__(self, year_step_size=10, priority=1):
        self.priority = priority
        self.year_step_size = year_step_size

    def function(self, optimization_problem, ensemble_member):
        obj = 0
        parameters = optimization_problem.parameters(ensemble_member)

        asset_varopex_map = optimization_problem._asset_variable_operational_cost_map

        for asset in [
            *optimization_problem.energy_system_components.get("heat_source", []),
            *optimization_problem.energy_system_components.get("ates", []),
        ]:

            extra_var = optimization_problem.extra_variable(asset_varopex_map.get(asset, 0.0))
            obj += extra_var * self.year_step_size

        return obj / 1.0e6


class MaximizeRevenueCosts(Goal):
    # TODO: minimize opex can in the def goals, instead of pathgoals as we can add the opex
    # variable from financial mixin for each asset

    order = 1

    def __init__(self, market_price=50e-6, year_step_size=10, priority=None):
        self.market_price = market_price  # [€/Wh]
        self.priority = priority
        self.year_step_size = year_step_size

    def function(self, optimization_problem, ensemble_member: int) -> ca.MX:
        obj = 0.0
        obj -= self.year_step_size * self.revenue_heat_delivered(
            optimization_problem, ensemble_member
        )

        return obj / 1.0e6

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

    def __init__(self, fraction_is_placed_vars, priority=None):
        self.fraction_is_placed_vars = fraction_is_placed_vars
        self.priority = priority

    def function(self, optimization_problem, ensemble_member):
        obj = 0.0
        obj += self.capex_asset(optimization_problem, ensemble_member)
        return optimization_problem._horizon / optimization_problem._years * obj / 1.0e6

    def capex_asset(self, optimization_problem, ensemble_member):
        obj = 0.0
        parameters = optimization_problem.parameters(ensemble_member)
        for var_name in self.fraction_is_placed_vars:
            asset_name = var_name.split("__")[0]
            if "_doublet" in asset_name:
                asset_name = asset_name.split("_doublet")[0]
            asset = optimization_problem.get_asset_from_asset_name(asset_name=asset_name)
            # use the technical lifetime of the asset, if specified, otherwise fixed to 30
            if asset.attributes["technicalLifetime"] == 0:
                tech_lifetime = STANDARD_ASSET_LIFETIME
            else:
                tech_lifetime = asset.attributes["technicalLifetime"]  # in years

            if asset.asset_type == "Pipe":
                obj += self.capex_pipes(optimization_problem, asset, var_name) / (tech_lifetime)
            else:
                investment_costs = asset.attributes["costInformation"].investmentCosts
                installation_costs = asset.attributes["costInformation"].installationCosts
                inst_costs = 0.0
                inv_costs = 0.0
                if investment_costs is None:
                    logger.info(f"Investment costs are not specified for {asset_name}")
                    inv_costs = 0.0
                elif investment_costs is not None:
                    inv_costs = investment_costs.value
                    if not (investment_costs.profileQuantityAndUnit.unit == UnitEnum.EURO):
                        raise RuntimeError(
                            f"Specified investment and/or installation costs for {asset.name} are not in euro"
                        )
                if installation_costs is None:
                    logger.info(f"Installation costs are not specified for {asset_name}")
                    inst_costs = 0.0
                elif installation_costs is not None:
                    inst_costs = installation_costs.value
                    if not (installation_costs.profileQuantityAndUnit.unit == UnitEnum.EURO):
                        raise RuntimeError(
                            f"Specified investment and/or installation costs for {asset.name} are not in euro"
                        )

                    # ensures that cost per doublet are considered.
                # Yearly depreciation for all other assets based on total investment + installation
                # symbols = optimization_problem.state_vector(var_name)
                # for i in range(optimization_problem._years):
                #     obj += symbols[i * 365] * (inv_costs + inst_costs) / tech_lifetime

                # if asset.asset_type == "ATES":
                #     ates_N_doublets = parameters[f"{asset_name}.nr_of_doublets"]
                #     inst_costs = inst_costs / ates_N_doublets
                #     inv_costs = inv_costs / ates_N_doublets
                #     symbols = optimization_problem.get_asset_fraction__placed_symbols(
                #         f"{asset_name}_doublet_{1}"
                #     )
                #     for i in range(1, ates_N_doublets):
                #         symbols += optimization_problem.get_asset_fraction__placed_symbols(
                #             f"{asset_name}_doublet_{1+i}"
                #         )
                # else:
                symbols = optimization_problem.get_asset_fraction__placed_symbols(asset_name)
                for i in range(optimization_problem._years):
                    obj += symbols[i] * (inv_costs + inst_costs) / tech_lifetime
                # obj += optimization_problem.state(var_name) * (inv_costs + inst_costs) / (tech_lifetime * 365)

        return obj

    def capex_pipes(self, optimization_problem, asset: Asset, var_name: str) -> ca.MX:
        length = asset.attributes["length"]
        investment_costs = asset.attributes["costInformation"].investmentCosts
        if not (
            investment_costs.profileQuantityAndUnit.unit == UnitEnum.EURO
            and investment_costs.profileQuantityAndUnit.perUnit == UnitEnum.METRE
        ):
            raise RuntimeError(f"Specified costs for pipe {asset.name} are not in euro's/meter")
        obj = 0.0
        # symbols = optimization_problem.state_vector(var_name)
        # for i in range(optimization_problem._years):
        #      obj += symbols[i*365] * length * investment_costs.value
        symbols = optimization_problem.get_asset_fraction__placed_symbols(asset.name)
        for i in range(optimization_problem._years):
            obj += symbols[i] * length * investment_costs.value

        return obj


class MinimizeRolloutFixedOperationalCosts(Goal):

    order = 1

    def __init__(self, is_placed_vars, hourly_steps=24, years=25, priority=1):
        self.is_placed_vars = is_placed_vars
        self.priority = priority
        self.year_steps = years
        self.hourly_steps = hourly_steps

    def function(self, optimization_problem, ensemble_member: int) -> ca.MX:
        obj = 0.0
        obj += (
            optimization_problem._horizon
            / optimization_problem._years
            * self.fixed_operational_costs(optimization_problem, ensemble_member)
        )

        return obj / 1.0e6

    def fixed_operational_costs(self, optimization_problem, ensemble_member: int) -> ca.MX:
        obj = 0.0

        for source in optimization_problem.energy_system_components.get("heat_source", []):
            obj += self.fixed_opex_of_asset(optimization_problem, source)

        for ates in optimization_problem.energy_system_components.get("ates", []):
            # TODO: this must be changed if the optimization uses placement of individual doublets
            #  of the assset.
            # obj += self.fixed_opex_of_asset(optimization_problem, ates)
            pass

        return obj

    def get_fixed_opex_costs(self, asset: Asset):
        """
        Returns the fixed opex costs of an asset in Euros per W
        """
        cost_infos = {}
        if asset.attributes["costInformation"].fixedOperationalAndMaintenanceCosts is None:
            logger.info(
                f"No combined operational and maintenance costs provided for {asset}, "
                f"using the separately specified costs instead"
            )
            cost_infos["fixedOperationalCosts"] = asset.attributes[
                "costInformation"
            ].fixedOperationalCosts
            cost_infos["fixedMaintenanceCosts"] = asset.attributes[
                "costInformation"
            ].fixedMaintenanceCosts
        else:
            cost_infos["fixedOperationalAndMaintenanceCosts"] = asset.attributes[
                "costInformation"
            ].fixedOperationalAndMaintenanceCosts

        value = 0.0
        for key, cost_info in cost_infos.items():
            if cost_info is None:
                logger.info(f"No {key} provided for asset {asset.name}")
                continue
            cost_value, unit, per_unit, per_time = get_cost_value_and_unit(cost_info)
            value += cost_value
            if unit != UnitEnum.EURO:
                raise RuntimeError(
                    f"Expected cost information {cost_info} to provide a cost in euros."
                )
            if per_time != TimeUnitEnum.NONE:
                raise RuntimeError(
                    f"Specified OPEX for asset {asset.name} include a "
                    f"component per time, which we cannot handle."
                )
            if per_unit != UnitEnum.WATT:
                raise RuntimeError(
                    f"Expected the specified OPEX for asset "
                    f"{asset.name} to be per W, but they are provided "
                    f"in {per_unit} instead."
                )
        return value

    def fixed_opex_of_asset(self, optimization_problem, asset_name):
        obj = 0
        asset = optimization_problem.get_asset_from_asset_name(asset_name)

        is_placed = optimization_problem.get_asset_is__realized_symbols(asset.name)
        fixed_operational_cost = self.get_fixed_opex_costs(asset)
        max_power = (
            asset.attributes["power"]
            if (asset_name not in optimization_problem.energy_system_components.get("ates", []))
            else (asset.attributes["maxChargeRate"])
        )
        if max_power == 0:
            raise RuntimeError(f"Could not determine the max power of asset {asset}")
        for i in range(optimization_problem._years):
            obj += is_placed[i] * fixed_operational_cost * max_power
        return obj
