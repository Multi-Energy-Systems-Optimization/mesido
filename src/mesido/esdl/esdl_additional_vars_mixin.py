import logging
from typing import List

import esdl

from mesido.network_common import NetworkSettings
from mesido.pipe_class import PipeClass

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)

logger = logging.getLogger("mesido")


class ESDLAdditionalVarsMixin(CollocatedIntegratedOptimizationProblem):
    __temperature_options = {}

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def read(self):
        super().read()
        parameters = self.parameters(0)
        bounds = self.bounds()

        # ------------------------------------------------------------------------------------------
        # Limit available pipe classes
        # TODO: cater for varying temperature when limiting pipe classes below
        # Here we do a check between the available pipe classes and the demand profiles. This is to
        # ensure that we don't have unneeded large amount of available pipe classes for pipes
        # connected to smaller demands.
        # TODO: add the same for electricity ones we have proper support for that in the ESDLMixin
        if len(self.temperature_carriers().items()) == 0:
            for asset, (
                connected_asset,
                _orientation,
            ) in self.energy_system_topology.demands.items():
                # TODO: add test case for gas once optional gas pipes are used
                if asset in self.energy_system_components.get("gas_demand", []):
                    try:
                        max_demand_g_s = min(
                            max(self.get_timeseries(f"{asset}.target_gas_demand").values),
                            bounds[f"{asset}.Gas_demand_mass_flow"][1],
                        )
                    except KeyError:
                        max_demand_g_s = bounds[f"{asset}.Gas_demand_mass_flow"][1]
                    is_there_always_mass_flow = False
                    try:
                        if min(self.get_timeseries(f"{asset}.target_gas_demand").values) > 0.0:
                            is_there_always_mass_flow = True
                    except KeyError:
                        is_there_always_mass_flow = False

                    new_pcs = []
                    found_pc_large_enough = False
                    for pc in self.gas_pipe_classes(connected_asset):
                        if not found_pc_large_enough:
                            new_pcs.append(pc)
                            if (
                                new_pcs[-1].maximum_discharge
                                * self.parameters(0)[f"{connected_asset}.rho"]
                                >= max_demand_g_s
                            ):  # m3/s * g/m3 = g/s
                                found_pc_large_enough = True

                    self.remove_dn0(new_pcs, is_there_always_mass_flow)
                    self._override_gas_pipe_classes[connected_asset] = new_pcs

                if asset in self.energy_system_components.get("heat_demand", []):
                    try:
                        max_demand = min(
                            max(self.get_timeseries(f"{asset}.target_heat_demand").values),
                            bounds[f"{asset}.Heat_demand"][1],
                        )
                    except KeyError:
                        max_demand = bounds[f"{asset}.Heat_demand"][1]
                    is_there_always_mass_flow = False
                    try:
                        if min(self.get_timeseries(f"{asset}.target_heat_demand").values) > 0.0:
                            is_there_always_mass_flow = True
                    except KeyError:
                        is_there_always_mass_flow = False

                    max_demand *= 1.3  # 30% added for expected worst case heat losses

                    new_pcs = []
                    found_pc_large_enough = False
                    for pc in self.pipe_classes(connected_asset):
                        if not found_pc_large_enough:
                            new_pcs.append(pc)
                        if (
                            new_pcs[-1].maximum_discharge
                            * parameters[f"{asset}.cp"]
                            * parameters[f"{asset}.rho"]
                            * (parameters[f"{asset}.T_supply"] - parameters[f"{asset}.T_return"])
                        ) >= max_demand:
                            found_pc_large_enough = True

                    self.remove_dn0(new_pcs, is_there_always_mass_flow)
                    self._override_pipe_classes[connected_asset] = new_pcs

                    if not self.is_hot_pipe(self.hot_to_cold_pipe(connected_asset)):
                        self._override_pipe_classes[self.hot_to_cold_pipe(connected_asset)] = (
                            new_pcs
                        )

            # Here we do the same for sources as for the sources.
            for asset, (
                connected_asset,
                _orientation,
            ) in self.energy_system_topology.sources.items():
                if asset in self.energy_system_components.get("gas_source", []):
                    try:
                        max_prod_g_s = min(
                            max(self.get_timeseries(f"{asset}.maximum_gas_source").values),
                            bounds[f"{asset}.Gas_source_mass_flow"][1],
                        )
                    except KeyError:
                        max_prod_g_s = bounds[f"{asset}.Gas_source_mass_flow"][1]
                    new_pcs = []
                    found_pc_large_enough = False
                    for pc in self.gas_pipe_classes(connected_asset):
                        if not found_pc_large_enough:
                            new_pcs.append(pc)
                            if (
                                new_pcs[-1].maximum_discharge
                                * self.parameters(0)[f"{connected_asset}.rho"]
                                >= max_prod_g_s
                            ):
                                found_pc_large_enough = True
                    self._override_gas_pipe_classes[connected_asset] = new_pcs
                if asset in self.energy_system_components.get("heat_source", []):
                    try:
                        max_prod = min(
                            max(self.get_timeseries(f"{asset}.maximum_heat_source").values),
                            bounds[f"{asset}.Heat_source"][1],
                        )
                    except KeyError:
                        max_prod = bounds[f"{asset}.Heat_source"][1]
                    new_pcs = []
                    found_pc_large_enough = False
                    for pc in self.pipe_classes(connected_asset):
                        if not found_pc_large_enough:
                            new_pcs.append(pc)
                        if (
                            new_pcs[-1].maximum_discharge
                            * parameters[f"{asset}.cp"]
                            * parameters[f"{asset}.rho"]
                            * (parameters[f"{asset}.T_supply"] - parameters[f"{asset}.T_return"])
                        ) >= max_prod:
                            found_pc_large_enough = True
                    self._override_pipe_classes[connected_asset] = new_pcs
                    if not self.is_hot_pipe(self.hot_to_cold_pipe(connected_asset)):
                        self._override_pipe_classes[self.hot_to_cold_pipe(connected_asset)] = (
                            new_pcs
                        )
        else:
            logger.warning("Limiting pipe classes do not cater for varying temperature yet")
        # ------------------------------------------------------------------------------------------

        for asset in [
            *self.energy_system_components.get("heat_source", []),
            *self.energy_system_components.get("ates", []),
            *self.energy_system_components.get("heat_buffer", []),
            *self.energy_system_components.get("heat_pump", []),
        ]:
            esdl_asset = self.esdl_assets[self.esdl_asset_name_to_id_map[asset]]
            for constraint in esdl_asset.attributes.get("constraint", []):
                if constraint.name == "setpointconstraint":
                    time_unit = constraint.range.profileQuantityAndUnit.perTimeUnit
                    if time_unit == esdl.TimeUnitEnum.HOUR:
                        time_hours = 1
                    elif time_unit == esdl.TimeUnitEnum.DAY:
                        time_hours = 24
                    elif time_unit == esdl.TimeUnitEnum.WEEK:
                        time_hours = 24 * 7
                    elif time_unit == esdl.TimeUnitEnum.MOTH:
                        time_hours = 24 * 7 * 30
                    elif time_unit == esdl.TimeUnitEnum.DAY:
                        time_hours = 365 * 24
                    else:
                        logger.error(
                            f"{asset} has a setpoint constaint specified with unknown"
                            f"per time unit"
                        )

                    asset_setpoints = {asset: (time_hours, constraint.range.maxValue)}

                    self._timed_setpoints.update(asset_setpoints)

    def remove_dn0(self, new_pcs: List[PipeClass], is_there_always_mass_flow: bool) -> None:
        """Remove pipe DN0 from the available pipe list, if there is always flow required"""
        # TODO: Bug to be resolved. Currently the solution is infeasible when only
        # 1 pipe class is available, but it should be able to working.
        # Then remove the need for having 2 pipes classes available in new_pcs.
        if is_there_always_mass_flow and len(new_pcs) > 2 and new_pcs[0].maximum_discharge == 0.0:
            new_pcs.remove(new_pcs[0])

    def pipe_classes(self, p):
        return self._override_pipe_classes.get(p, [])

    def gas_pipe_classes(self, p):
        return self._override_gas_pipe_classes.get(p, [])

    def esdl_heat_model_options(self):
        """Overwrites the fraction of the minimum tank volume"""
        options = super().esdl_heat_model_options()
        options["min_fraction_tank_volume"] = 0.0
        return options

    def temperature_carriers(self):
        return self.esdl_carriers_typed(type=[str(NetworkSettings.NETWORK_TYPE_HEAT).lower()])

    def electricity_carriers(self):
        return self.esdl_carriers_typed(
            type=[str(NetworkSettings.NETWORK_TYPE_ELECTRICITY).lower()]
        )

    def gas_carriers(self):
        return self.esdl_carriers_typed(
            type=[
                str(NetworkSettings.NETWORK_TYPE_GAS).lower(),
                str(NetworkSettings.NETWORK_TYPE_HYDROGEN).lower(),
            ]
        )

    def temperature_regimes(self, carrier):
        temperature_options = []
        temperature_step = 2.5

        try:
            temperature_options = self.__temperature_options[carrier]
        except KeyError:
            for asset in [
                *self.energy_system_components.get("heat_source", []),
                *self.energy_system_components.get("ates", []),
                *self.energy_system_components.get("heat_buffer", []),
                *self.energy_system_components.get("heat_pump", []),
                *self.energy_system_components.get("heat_exchanger", []),
                *self.energy_system_components.get("heat_demand", []),
            ]:
                esdl_asset = self.esdl_assets[self.esdl_asset_name_to_id_map[asset]]
                parameters = self.parameters(0)
                for i in range(len(esdl_asset.attributes["constraint"].items)):
                    constraint = esdl_asset.attributes["constraint"].items[i]
                    if (
                        constraint.name == "supply_temperature"
                        and carrier == parameters[f"{asset}.T_supply_id"]
                    ) or (
                        constraint.name == "return_temperature"
                        and carrier == parameters[f"{asset}.T_return_id"]
                    ):
                        try:
                            lb = self.__temperature_options[carrier][0]
                            ub = self.__temperature_options[carrier][-1]
                            lb = constraint.range.minValue if constraint.range.minValue > lb else lb
                            ub = constraint.range.maxValue if constraint.range.maxValue < ub else ub
                        except KeyError:
                            lb = constraint.range.minValue
                            ub = constraint.range.maxValue
                        n_options = round((ub - lb) / temperature_step)
                        temperature_options = np.linspace(lb, ub, n_options + 1)
                        if (
                            constraint.range.profileQuantityAndUnit.unit
                            != esdl.UnitEnum.DEGREES_CELSIUS
                        ):
                            RuntimeError(
                                f"{asset} has a temperature constraint with wrong unit "
                                f"{constraint.range.profileQuantityAndUnit.unit}, should "
                                f"always be in degrees celcius."
                            )
                        self.__temperature_options[carrier] = temperature_options

        return temperature_options
