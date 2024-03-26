import logging
import math
from typing import Dict, Tuple, Type

import esdl

from mesido.esdl.asset_to_component_base import MODIFIERS, _AssetToComponentBase
from mesido.esdl.common import Asset
from mesido.esdl.esdl_model_base import _ESDLModelBase
from mesido.pycml import SymbolicParameter
from mesido.pycml.component_library.qth import (
    Buffer,
    CheckValve,
    ControlValve,
    Demand,
    GeothermalSource,
    Node,
    Pipe,
    Pump,
    Source,
)

logger = logging.getLogger("mesido")


class AssetToQTHComponent(_AssetToComponentBase):
    def __init__(
        self,
        theta,
        *args,
        v_nominal=1.0,
        v_max=5.0,
        minimum_temperature=10.0,
        maximum_temperature=110.0,
        rho=988.0,
        cp=4200.0,
        min_fraction_tank_volume=0.05,
        **kwargs,
    ):
        super().__init__(*args, **kwargs)

        self.theta = theta
        self.v_nominal = v_nominal
        self.v_max = v_max
        self.minimum_temperature = minimum_temperature
        self.maximum_temperature = maximum_temperature
        self.rho = rho
        self.cp = cp
        self.min_fraction_tank_volume = min_fraction_tank_volume

    @property
    def _rho_cp_modifiers(self):
        return dict(rho=self.rho, cp=self.cp)

    def convert_buffer(self, asset: Asset) -> Tuple[Type[Buffer], MODIFIERS]:
        assert asset.asset_type == "HeatStorage"

        (
            supply_temperature,
            return_temperature,
            supply_temperature_id,
            return_temperature_id,
        ) = self._get_supply_return_temperatures(asset).values()

        heat_to_discharge_fac = 1 / (self.rho * self.cp * (supply_temperature - return_temperature))

        # Assume that:
        # - the capacity is the relative milp that can be stored in the buffer;
        # - the tanks are always at least `min_fraction_tank_volume` full;
        # - same height as radius to compute dimensions.
        min_fraction_tank_volume = self.min_fraction_tank_volume

        if asset.attributes["capacity"] and asset.attributes["volume"]:
            logger.warning(
                f"{asset.asset_type} '{asset.name}' has both capacity and volume specified. "
                f"Volume with value of {asset.attributes['volume']} m3 will be used."
            )

        capacity = 0.0
        if asset.attributes["volume"]:
            capacity = (
                asset.attributes["volume"]
                * self.rho
                * self.cp
                * (supply_temperature - return_temperature)
            )
        elif asset.attributes["capacity"]:
            capacity = asset.attributes["capacity"]
        else:
            logger.error(
                f"{asset.asset_type} '{asset.name}' has both not capacity and volume specified. "
                f"Please specify one of the two"
            )

        r = (capacity * (1 + min_fraction_tank_volume) * heat_to_discharge_fac / math.pi) ** (
            1.0 / 3.0
        )

        # Note that these flow constraints are estimations based on the
        # carrier temperatures, same way as CHESS handles them.
        hfr_charge_max = asset.attributes.get("maxChargeRate", math.inf) or math.inf
        hfr_discharge_max = asset.attributes.get("maxDischargeRate", math.inf) or math.inf
        q_charge_max = hfr_charge_max * heat_to_discharge_fac
        q_discharge_max = hfr_discharge_max * heat_to_discharge_fac

        modifiers = dict(
            Q_nominal=self._get_connected_q_nominal(asset),
            height=r,
            radius=r,
            heat_transfer_coeff=1.0,
            min_fraction_tank_volume=min_fraction_tank_volume,
            init_T_hot_tank=supply_temperature,
            init_T_cold_tank=return_temperature,
            Q_hot_pipe=dict(min=-q_discharge_max, max=q_charge_max),
            Q_cold_pipe=dict(min=-q_discharge_max, max=q_charge_max),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
        )

        return Buffer, modifiers

    def convert_demand(self, asset: Asset) -> Tuple[Type[Demand], MODIFIERS]:
        assert asset.asset_type in {"GenericConsumer", "HeatingDemand"}

        # TODO: Why is the default zero for both, that's just weird. What if I
        # actually want a minimum of 0.0 (instead of treating it as a
        # NaN/None/not specified)
        # TODO: Are these even the correct values to use? It does not
        # say anything about whether this is the min/max on the feed or return line?
        # currently assuming they are the min/max of the _feed_ line.

        minimum_temperature = asset.attributes["minTemperature"]
        if minimum_temperature == 0.0:
            logger.warning(
                f"{asset.asset_type} '{asset.name}' has an unspecified minimum temperature. "
                f"Using default value of {self.minimum_temperature}."
            )
            minimum_temperature = self.minimum_temperature

        maximum_temperature = asset.attributes["maxTemperature"]
        if maximum_temperature == 0.0:
            logger.warning(
                f"{asset.asset_type} '{asset.name}' has an unspecified maximum temperature. "
                f"Using default value of {self.maximum_temperature}."
            )
            maximum_temperature = self.maximum_temperature

        (
            supply_temperature,
            return_temperature,
            supply_temperature_id,
            return_temperature_id,
        ) = self._get_supply_return_temperatures(asset)
        max_demand = asset.attributes["power"] if asset.attributes["power"] else math.inf

        modifiers = dict(
            theta=self.theta,
            Q_nominal=self._get_connected_q_nominal(asset),
            QTHIn=dict(T=dict(min=minimum_temperature, max=maximum_temperature)),
            Heat_demand=dict(min=0.0, max=max_demand),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
        )

        return Demand, modifiers

    def convert_node(self, asset: Asset) -> Tuple[Type[Node], MODIFIERS]:
        assert asset.asset_type == "Joint"  # TODO: temperature?

        sum_in = 0
        sum_out = 0

        for x in asset.attributes["port"].items:
            if isinstance(x, esdl.esdl.InPort):
                sum_in += len(x.connectedTo)
            if isinstance(x, esdl.esdl.OutPort):
                sum_out += len(x.connectedTo)

        # TODO: what do we want if no carrier is specified.
        # carrier = asset.global_properties["carriers"][asset.in_ports[0].carrier.id]
        # if carrier["__rtc_type"] == "supply":
        #     temp = carrier["supplyTemperature"]
        # elif carrier["__rtc_type"] == "return":
        #     temp = carrier["returnTemperature"]
        # else:
        #     temp = 50.0

        temp = self._get_supply_return_temperatures(asset)["temperature"]
        modifiers = dict(
            n=sum_in + sum_out,
            temperature=temp,
        )

        return Node, modifiers

    def convert_pipe(self, asset: Asset) -> Tuple[Type[Pipe], MODIFIERS]:
        assert asset.asset_type == "Pipe"

        temperature = self._get_supply_return_temperatures(asset)["temperature"]

        # NaN means the default values will be used
        insulation_thicknesses = math.nan
        conductivies_insulation = math.nan

        # if "_ret" in asset.attributes["name"]:
        #     temperature = return_temperature
        # else:
        #     temperature = supply_temperature

        (
            diameter,
            insulation_thicknesses,
            conductivies_insulation,
        ) = self._pipe_get_diameter_and_insulation(asset)

        area = math.pi * diameter**2 / 4.0
        q_nominal = self.v_nominal * area
        q_max = self.v_max * area

        self._set_q_nominal(asset, q_nominal)

        if "_ret" in asset.in_ports[0].carrier.id:
            temperature_modifiers = {
                "T_return": temperature,
                "T_supply": asset.global_properties["carriers"][asset.in_ports[0].carrier.id[:-4]][
                    "temperature"
                ],
            }
        else:
            temperature_modifiers = {
                "T_supply": temperature,
                "T_return": asset.global_properties["carriers"][
                    asset.in_ports[0].carrier.id + "_ret"
                ]["temperature"],
            }

        # TODO: We can do better with the temperature bounds.
        # Maybe global ones (temperature_supply_max / min, and temperature_return_max / min?)
        modifiers = dict(
            length=asset.attributes["length"],
            diameter=diameter,
            temperature=temperature,
            disconnectable=self._is_disconnectable_pipe(asset),
            Q=dict(min=-q_max, max=q_max, nominal=q_nominal),
            QTHIn=dict(T=dict(min=self.minimum_temperature, max=self.maximum_temperature)),
            QTHOut=dict(T=dict(min=self.minimum_temperature, max=self.maximum_temperature)),
            insulation_thickness=insulation_thicknesses,
            conductivity_insulation=conductivies_insulation,
            **temperature_modifiers,
            **self._rho_cp_modifiers,
        )

        return Pipe, modifiers

    def convert_pump(self, asset: Asset) -> Tuple[Type[Pump], MODIFIERS]:
        assert asset.asset_type == "Pump"

        # TODO: Maximum pump head should come from ESDL component
        # specification. Alpha-2 CHESS release only checks for capacity, head
        # is always assumed to be realizable.
        modifiers = dict(
            Q=dict(
                min=0.0,
                max=asset.attributes["pumpCapacity"] / 3600.0,
                nominal=asset.attributes["pumpCapacity"] / 7200.0,
            ),
            dH=dict(min=0.0),
        )

        return Pump, modifiers

    def convert_source(self, asset: Asset) -> Tuple[Type[Source], MODIFIERS]:
        assert asset.asset_type in {
            "GasHeater",
            "GenericProducer",
            "GeothermalSource",
            "ResidualHeatSource",
        }

        (
            supply_temperature,
            return_temperature,
            supply_temperature_id,
            return_temperature_id,
        ) = self._get_supply_return_temperatures(asset).values()

        # TODO: Why is the default zero for both, that's just weird. What if I
        # actually want a minimum of 0.0 (instead of treating it as a
        # NaN/None/not specified)
        # TODO: Are these even the correct values to use? It does not
        # say anything about whether this is the min/max on the feed or return line?
        # currently assuming they are the min/max of the _feed_ line.
        if asset.asset_type == "GenericProducer":
            minimum_temperature = supply_temperature
            maximum_temperature = supply_temperature
        else:
            minimum_temperature = asset.attributes["minTemperature"]
            if minimum_temperature == 0.0:
                logger.warning(
                    f"{asset.asset_type} '{asset.name}' has an unspecified minimum temperature. "
                    f"Using default value of {self.minimum_temperature}."
                )
                minimum_temperature = self.minimum_temperature

            maximum_temperature = asset.attributes["maxTemperature"]
            if maximum_temperature == 0.0:
                logger.warning(
                    f"{asset.asset_type} '{asset.name}' has an unspecified maximum temperature. "
                    f"Using default value of {self.maximum_temperature}."
                )
                maximum_temperature = self.maximum_temperature

        # get price per unit of energy,
        # assume cost of 1. if nothing is given (effectively milp loss minimization)
        price = 1.0
        if "costInformation" in asset.attributes.keys():
            if hasattr(asset.attributes["costInformation"], "variableOperationalCosts"):
                if hasattr(asset.attributes["costInformation"].variableOperationalCosts, "value"):
                    price = asset.attributes["costInformation"].variableOperationalCosts.value

        max_supply = asset.attributes["power"]
        if not max_supply:
            logger.error(f"{asset.asset_type} '{asset.name}' has no max power specified. ")
        assert max_supply > 0.0

        modifiers = dict(
            theta=self.theta,
            Q_nominal=self._get_connected_q_nominal(asset),
            QTHOut=dict(T=dict(min=minimum_temperature, max=maximum_temperature)),
            price=price,
            Heat_source=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
        )

        if asset.asset_type == "GeothermalSource":
            # Note that the ESDL target flow rate is in kg/s, but we want m3/s
            try:
                modifiers["target_flow_rate"] = asset.attributes["flowRate"] / self.rho
            except KeyError:
                logger.warning(
                    f"{asset.asset_type} '{asset.name}' has no desired flow rate specified. "
                    f"'{asset.name}' will not be actuated in a constant manner"
                )
            return GeothermalSource, modifiers
        else:
            return Source, modifiers

    def convert_control_valve(self, asset: Asset) -> Tuple[Type[ControlValve], MODIFIERS]:
        assert asset.asset_type == "Valve"

        return ControlValve, {}

    def convert_check_valve(self, asset: Asset) -> Tuple[Type[CheckValve], MODIFIERS]:
        assert asset.asset_type == "CheckValve"

        return CheckValve, {}


class ESDLQTHModel(_ESDLModelBase):
    _converter_class: _AssetToComponentBase = None

    def __init__(self, assets: Dict[str, Asset], converter_class=AssetToQTHComponent, **kwargs):
        super().__init__(None)

        self.add_variable(SymbolicParameter, "theta")

        converter = converter_class(theta=self.theta, **kwargs)

        self._esdl_convert(converter, assets, "QTH")
