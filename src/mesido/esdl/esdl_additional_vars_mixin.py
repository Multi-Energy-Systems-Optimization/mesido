import logging

import esdl

from mesido.network_common import NetworkSettings

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)

logger = logging.getLogger("mesido")


class ESDLAdditionalVarsMixin(CollocatedIntegratedOptimizationProblem):
    __temperature_options = {}

    def read(self):
        super().read()

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

    def pipe_classes(self, p):
        return self._override_pipe_classes.get(p, [])

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
