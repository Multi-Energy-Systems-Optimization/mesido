import logging
import math
from typing import Dict, Tuple, Type, Union

import CoolProp as cP

import esdl

from mesido.esdl.asset_to_component_base import MODIFIERS, _AssetToComponentBase
from mesido.esdl.common import Asset
from mesido.esdl.esdl_model_base import _ESDLModelBase
from mesido.network_common import NetworkSettings
from mesido.pycml.component_library.milp import (
    ATES,
    AirWaterHeatPump,
    AirWaterHeatPumpElec,
    Airco,
    CheckValve,
    ColdDemand,
    Compressor,
    ControlValve,
    ElecBoiler,
    ElectricityCable,
    ElectricityDemand,
    ElectricityNode,
    ElectricitySource,
    ElectricityStorage,
    Electrolyzer,
    GasBoiler,
    GasDemand,
    GasNode,
    GasPipe,
    GasSource,
    GasSubstation,
    GasTankStorage,
    GeothermalSource,
    HeatBuffer,
    HeatDemand,
    HeatExchanger,
    HeatPipe,
    HeatPump,
    HeatPumpElec,
    HeatSource,
    LowTemperatureATES,
    Node,
    Pump,
    SolarPV,
    Transformer,
    WindPark,
)

from scipy.optimize import fsolve

logger = logging.getLogger("mesido")


class _ESDLInputException(Exception):
    pass


class AssetToHeatComponent(_AssetToComponentBase):
    """
    This class is used for the converting logic from the esdl assets with their properties to pycml
    objects and set their respective properties.
    """

    def __init__(
        self,
        *args,
        v_nominal=1.0,
        v_max=5.0,
        rho=988.0,
        cp=4200.0,
        min_fraction_tank_volume=0.05,
        v_max_gas=15.0,
        **kwargs,
    ):
        super().__init__(*args, **kwargs)

        self.v_nominal = v_nominal
        self.v_max = v_max
        self.rho = rho
        self.cp = cp
        self.v_max_gas = v_max_gas
        self.min_fraction_tank_volume = min_fraction_tank_volume
        if "primary_port_name_convention" in kwargs.keys():
            self.primary_port_name_convention = kwargs["primary_port_name_convention"]
        if "secondary_port_name_convention" in kwargs.keys():
            self.secondary_port_name_convention = kwargs["secondary_port_name_convention"]

    @property
    def _rho_cp_modifiers(self) -> Dict:
        """
        For giving the density, rho, in kg/m3 and specic milp, cp, in J/(K*kg)

        Returns
        -------
        rho and cp
        """
        return dict(rho=self.rho, cp=self.cp)

    def get_internal_energy(self, asset_name, carrier):
        # The default of 20°C is also used in the head_loss_class. Thus, when updating ensure it
        # is also updated in the head_loss_class.
        temperature = 20.0

        if NetworkSettings.NETWORK_TYPE_GAS in carrier.name:
            internal_energy = cP.CoolProp.PropsSI(
                "U",
                "T",
                273.15 + temperature,
                "P",
                carrier.pressure * 1.0e5,
                NetworkSettings.NETWORK_COMPOSITION_GAS,
            )
        elif NetworkSettings.NETWORK_TYPE_HYDROGEN in carrier.name:
            internal_energy = cP.CoolProp.PropsSI(
                "U",
                "T",
                273.15 + temperature,
                "P",
                carrier.pressure * 1.0e5,
                str(NetworkSettings.NETWORK_TYPE_HYDROGEN).upper(),
            )
        else:
            logger.warning(
                f"Neither gas or hydrogen was used in the carrier " f"name of pipe {asset_name}"
            )
            internal_energy = 46.0e6  # natural gas at about 8 bar
        return internal_energy  # we use gram per second and coolprop gives results in kJ per kg

    def get_density(self, asset_name, carrier):
        # TODO: gas carrier temperature still needs to be resolved.
        # The default of 20°C is also used in the head_loss_class. Thus, when updating ensure it
        # is also updated in the head_loss_class.
        temperature = 20.0

        if NetworkSettings.NETWORK_TYPE_GAS in carrier.name:
            density = cP.CoolProp.PropsSI(
                "D",
                "T",
                273.15 + temperature,
                "P",
                carrier.pressure * 1.0e5,
                NetworkSettings.NETWORK_COMPOSITION_GAS,
            )
        elif NetworkSettings.NETWORK_TYPE_HYDROGEN in carrier.name:
            density = cP.CoolProp.PropsSI(
                "D",
                "T",
                273.15 + temperature,
                "P",
                carrier.pressure * 1.0e5,
                str(NetworkSettings.NETWORK_TYPE_HYDROGEN).upper(),
            )
        else:
            logger.warning(
                f"Neither gas or hydrogen was used in the carrier " f"name of pipe {asset_name}"
            )
            density = 6.2  # natural gas at about 8 bar
        return density * 1.0e3  # to convert from kg/m3 to g/m3

    def get_asset_attribute_value(
        self,
        asset: Asset,
        attribute_name: str,
        default_value: float,
        min_value: float,
        max_value: float,
    ) -> float:
        """
        Get the value of the specified attribute for the given asset.
        Args:
            asset: The asset to retrieve the attribute value for.
            attribute_name: The name of the attribute to retrieve.
            default_value: The default value to use if the attribute is not present.
            min_value: The minimum value for the attribute.
            max_value: The maximum value for the attribute.
        Returns:
            The value of the specified attribute for the given asset.
        Raises:
            ValueError: If the attribute value is not within the specified range.
        """
        if attribute_name == "discountRate":
            attribute_value = (
                asset.attributes["costInformation"].discountRate.value
                if asset.attributes["costInformation"]
                and asset.attributes["costInformation"].discountRate is not None
                and asset.attributes["costInformation"].discountRate.value is not None
                else default_value
            )
        else:
            attribute_value = (
                asset.attributes[attribute_name]
                if asset.attributes[attribute_name] and asset.attributes[attribute_name] != 0
                else default_value
            )
        self.validate_attribute_input(
            # NOTE: this validation happens after assigning default values
            # discountRate and technicalLife need to be included in input files of tests
            # before this input validation can be relocated earlier in this function
            asset.name,
            attribute_name,
            attribute_value,
            min_value,
            max_value,
        )
        return attribute_value

    def validate_attribute_input(
        self,
        asset_name: str,
        attribute_name: str,
        input_value: float,
        min_value: float,
        max_value: float,
    ) -> None:
        """
        Validates if the input value is within the specified range.
        Args:
            asset_name (str): The name of the asset.
            attribute_name (str): The name of the attribute.
            input_value (float): The value to be validated.
            min_value (float): The minimum value of the range.
            max_value (float): The maximum value of the range.
        Raises:
            ValueError: If the input value is not within the specified range.
        """
        if input_value < min_value or input_value > max_value:
            warning_msg = (
                f"Input value {input_value} of attribute {attribute_name} "
                f"is not within range ({min_value}, {max_value}) for asset {asset_name}."
            )
            logger.warning(warning_msg)

    def convert_heat_buffer(self, asset: Asset) -> Tuple[Type[HeatBuffer], MODIFIERS]:
        """
        This function converts the buffer object in esdl to a set of modifiers that can be used in
        a pycml object. Most important:

        - Setting the dimensions of the buffer needed for milp loss computation. Currently, assume
        cylinder with height equal to radius.
        - setting a minimum fill level and minimum asscociated milp
        - Setting a maximum stored energy based on the size.
        - Setting a cap on the thermal power.
        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        Buffer class with modifiers
        """
        assert asset.asset_type == "HeatStorage"

        temperature_modifiers = self._supply_return_temperature_modifiers(asset)

        supply_temperature = temperature_modifiers["T_supply"]
        return_temperature = temperature_modifiers["T_return"]

        # Assume that:
        # - the capacity is the relative milp that can be stored in the buffer;
        # - the tanks are always at least `min_fraction_tank_volume` full;
        # - same height as radius to compute dimensions.
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

        assert capacity > 0.0
        min_fraction_tank_volume = self.min_fraction_tank_volume
        if self.get_state(asset) == 0 or self.get_state(asset) == 2:
            min_fraction_tank_volume = 0.0
        # We assume that the height equals the radius of the buffer.
        r = (
            capacity
            * (1 + min_fraction_tank_volume)
            / (self.rho * self.cp * (supply_temperature - return_temperature) * math.pi)
        ) ** (1.0 / 3.0)

        min_heat = capacity * min_fraction_tank_volume
        max_heat = capacity * (1 + min_fraction_tank_volume)
        assert max_heat > 0.0
        # default is set to 10MW

        hfr_charge_max = (
            asset.attributes.get("maxChargeRate")
            if asset.attributes.get("maxChargeRate")
            else 10.0e6
        )
        hfr_discharge_max = (
            asset.attributes.get("maxDischargeRate")
            if asset.attributes.get("maxDischargeRate")
            else 10.0e6
        )

        q_nominal = self._get_connected_q_nominal(asset)

        modifiers = dict(
            Q_nominal=q_nominal,
            height=r,
            radius=r,
            heat_transfer_coeff=1.0,
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            state=self.get_state(asset),
            min_fraction_tank_volume=min_fraction_tank_volume,
            Stored_heat=dict(min=min_heat, max=max_heat),
            Heat_buffer=dict(min=-hfr_discharge_max, max=hfr_charge_max),
            Heat_flow=dict(min=-hfr_discharge_max, max=hfr_charge_max, nominal=hfr_charge_max),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            init_Heat=min_heat,
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
            **self._get_cost_figure_modifiers(asset),
        )

        return HeatBuffer, modifiers

    def convert_heat_demand(self, asset: Asset) -> Tuple[Type[HeatDemand], MODIFIERS]:
        """
        This function converts the demand object in esdl to a set of modifiers that can be used in
        a pycml object. Most important:

        - Setting a cap on the thermal power.
        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        Demand class with modifiers
        """
        assert asset.asset_type in {"GenericConsumer", "HeatingDemand", "Losses"}

        max_demand = asset.attributes["power"] if asset.attributes["power"] else math.inf

        q_nominal = self._get_connected_q_nominal(asset)

        modifiers = dict(
            Q_nominal=q_nominal,
            Heat_demand=dict(max=max_demand, nominal=max_demand / 2.0),
            Heat_flow=dict(max=max_demand, nominal=max_demand / 2.0),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            state=self.get_state(asset),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
            **self._get_cost_figure_modifiers(asset),
        )

        return HeatDemand, modifiers

    def convert_airco(self, asset: Asset) -> Tuple[Type[Airco], MODIFIERS]:
        """
        This function converts the airco object in esdl to a set of modifiers that can be used in
        a pycml object. Most important:

        - Setting a cap on the thermal power.
        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        Demand class with modifiers
        """
        assert asset.asset_type in {"Airco"}

        max_ = asset.attributes["power"] if asset.attributes["power"] else math.inf

        q_nominal = self._get_connected_q_nominal(asset)

        modifiers = dict(
            Q_nominal=q_nominal,
            Heat_airco=dict(max=max_, nominal=max_ / 2.0),
            Heat_flow=dict(max=max_, nominal=max_ / 2.0),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            state=self.get_state(asset),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
            **self._get_cost_figure_modifiers(asset),
        )

        return Airco, modifiers

    def convert_cold_demand(self, asset: Asset) -> Tuple[Type[ColdDemand], MODIFIERS]:
        """
        This function converts the demand object in esdl to a set of modifiers that can be used in
        a pycml object. Most important:
        - Setting a cap on the thermal power.
        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.
        Parameters
        ----------
        asset : The asset object with its properties.
        Returns
        -------
        Demand class with modifiers
        """
        assert asset.asset_type in {"CoolingDemand"}

        max_demand = asset.attributes["power"] if asset.attributes["power"] else math.inf

        q_nominal = self._get_connected_q_nominal(asset)

        modifiers = dict(
            Q_nominal=q_nominal,
            Cold_demand=dict(min=0.0, max=max_demand, nominal=max_demand / 2.0),
            Heat_flow=dict(min=0.0, max=max_demand, nominal=max_demand / 2.0),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            state=self.get_state(asset),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
            **self._get_cost_figure_modifiers(asset),
        )

        return ColdDemand, modifiers

    def convert_node(self, asset: Asset) -> Tuple[Type[Node], MODIFIERS]:
        """
        This function converts the node object in esdl to a set of modifiers that can be used in
        a pycml object. Most important:

        - Setting the amount of connections

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        Node class with modifiers
        """
        assert asset.asset_type == "Joint"

        sum_in = 0
        sum_out = 0

        node_carrier = None
        for x in asset.attributes["port"].items:
            if node_carrier is None:
                node_carrier = x.carrier.name
            else:
                if node_carrier != x.carrier.name:
                    raise _ESDLInputException(
                        f"{asset.name} has multiple carriers mixing which is not allowed. "
                        f"Only one carrier (carrier couple) allowed in hydraulicly "
                        f"coupled system"
                    )
            if isinstance(x, esdl.esdl.InPort):
                sum_in += len(x.connectedTo)
            if isinstance(x, esdl.esdl.OutPort):
                sum_out += len(x.connectedTo)

        modifiers = dict(
            n=sum_in + sum_out,
            state=self.get_state(asset),
        )

        if isinstance(asset.in_ports[0].carrier, esdl.esdl.GasCommodity) or isinstance(
            asset.out_ports[0].carrier, esdl.esdl.GasCommodity
        ):
            modifiers = dict(
                n=sum_in + sum_out,
            )
            return GasNode, modifiers

        return Node, modifiers

    def convert_heat_pipe(
        self, asset: Asset
    ) -> Tuple[Union[Type[HeatPipe], Type[GasPipe]], MODIFIERS]:
        """
        This function converts the pipe object in esdl to a set of modifiers that can be used in
        a pycml object. Most important:

        - Setting the dimensions of the pipe needed for milp loss computation. Currently, assume
        cylinder with height equal to radius.
        - setting if a pipe is disconnecteable for the optimization.
        - Setting the isolative properties of the pipe.
        - Setting a cap on the thermal power.
        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        Pipe class with modifiers
        """
        assert asset.asset_type == "Pipe"

        length = asset.attributes["length"]
        if length < 25.0:
            length = 25.0

        (
            diameter,
            insulation_thicknesses,
            conductivies_insulation,
        ) = self._pipe_get_diameter_and_insulation(asset)

        if isinstance(asset.in_ports[0].carrier, esdl.esdl.GasCommodity):
            q_nominal = math.pi * diameter**2 / 4.0 * self.v_max_gas / 2.0
            self._set_q_nominal(asset, q_nominal)
            q_max = math.pi * diameter**2 / 4.0 * self.v_max_gas
            self._set_q_max(asset, q_max)
            pressure = asset.in_ports[0].carrier.pressure * 1.0e5
            density = self.get_density(asset.name, asset.in_ports[0].carrier)
            bounds_nominals = dict(
                Q=dict(min=-q_max, max=q_max, nominal=q_nominal),
                mass_flow=dict(
                    min=-q_max * density, max=q_max * density, nominal=q_nominal * density
                ),
                Hydraulic_power=dict(nominal=q_nominal * pressure),
            )
            modifiers = dict(
                length=length,
                density=density,
                diameter=diameter,
                pressure=pressure,
                # disconnectable=self._is_disconnectable_pipe(asset),  # still to be added
                GasIn=bounds_nominals,
                GasOut=bounds_nominals,
                state=self.get_state(asset),
                **self._get_cost_figure_modifiers(asset),
            )

            return GasPipe, modifiers

        temperature_modifiers = self._supply_return_temperature_modifiers(asset)

        temperature = temperature_modifiers["temperature"]

        # Compute the maximum milp flow based on an assumed maximum velocity
        area = math.pi * diameter**2 / 4.0
        q_max = area * self.v_max
        q_nominal = area * self.v_nominal

        self._set_q_nominal(asset, q_nominal)

        # TODO: This might be an underestimation. We need to add the total
        #  milp losses in the system to get a proper upper bound. Maybe move
        #  calculation of Heat bounds to the HeatMixin?
        hfr_max = 2.0 * (
            self.rho * self.cp * q_max * temperature
        )  # TODO: are there any physical implications of using this bound

        assert hfr_max > 0.0

        modifiers = dict(
            Q_nominal=q_nominal,
            length=length,
            diameter=diameter,
            disconnectable=self._is_disconnectable_pipe(asset),
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            HeatIn=dict(
                Heat=dict(min=-hfr_max, max=hfr_max),
                Q=dict(min=-q_max, max=q_max),
                Hydraulic_power=dict(nominal=q_nominal * 16.0e5),
            ),
            HeatOut=dict(
                Heat=dict(min=-hfr_max, max=hfr_max),
                Q=dict(min=-q_max, max=q_max),
                Hydraulic_power=dict(nominal=q_nominal * 16.0e5),
            ),
            Heat_flow=dict(min=-hfr_max, max=hfr_max, nominal=hfr_max),
            insulation_thickness=insulation_thicknesses,
            conductivity_insulation=conductivies_insulation,
            state=self.get_state(asset),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
            **self._get_cost_figure_modifiers(asset),
        )
        if "T_ground" in asset.attributes.keys():
            modifiers["T_ground"] = asset.attributes["T_ground"]

        return HeatPipe, modifiers

    def convert_pump(self, asset: Asset) -> Tuple[Type[Pump], MODIFIERS]:
        """
        This function converts the pump object in esdl to a set of modifiers that can be used in
        a pycml object. Most important:

        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        Pump class with modifiers
        """
        assert asset.asset_type == "Pump"

        q_nominal = self._get_connected_q_nominal(asset)

        modifiers = dict(
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            Q_nominal=self._get_connected_q_nominal(asset),
            state=self.get_state(asset),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
        )

        return Pump, modifiers

    def convert_heat_exchanger(self, asset: Asset) -> Tuple[Type[HeatExchanger], MODIFIERS]:
        """
        This function converts the Heat Exchanger object in esdl to a set of modifiers that can be
        used in a pycml object. Most important:

        - Setting the thermal power transfer efficiency.
        - Setting a caps on the thermal power on both the primary and secondary side.
        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures (also checked for making sense physically).
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        HeatExchanger class with modifiers
        """
        assert asset.asset_type in {
            "GenericConversion",
            "HeatExchange",
        }

        params_t = self._supply_return_temperature_modifiers(asset)
        params_q = self._get_connected_q_nominal(asset)
        params = {}

        if params_t["Primary"]["T_supply"] < params_t["Secondary"]["T_supply"]:
            logger.error(
                f"{asset.name} has a primary side supply temperature, "
                f"{params_t['Primary']['T_supply']}, that is higher than the secondary supply , "
                f"{params_t['Secondary']['T_supply']}. This is not possible as the HEX can only "
                "transfer milp from primary to secondary."
            )
            assert params_t["Primary"]["T_supply"] >= params_t["Secondary"]["T_supply"]
        if params_t["Primary"]["T_return"] < params_t["Secondary"]["T_return"]:
            logger.error(
                f"{asset.name} has a primary side return temperature that is lower than the "
                f"secondary return temperature. This is not possible as the HEX can only transfer "
                f"milp from primary to secondary."
            )
            assert params_t["Primary"]["T_return"] >= params_t["Secondary"]["T_return"]

        if asset.asset_type == "GenericConversion":
            max_power = asset.attributes["power"] if asset.attributes["power"] else math.inf
        else:
            # TODO: Current max_power estimation is not very accurate, a more physics based
            # estimation should be implemented, maybe using other ESDL attributs.
            max_power = (
                asset.attributes["heatTransferCoefficient"]
                * (params_t["Primary"]["T_supply"] - params_t["Secondary"]["T_return"])
                / 2.0
            )

        max_heat_transport = (
            params_t["Primary"]["T_supply"]
            * max_power
            / (params_t["Primary"]["T_supply"] - params_t["Primary"]["T_return"])
        )

        prim_heat = dict(
            HeatIn=dict(
                Heat=dict(min=-max_heat_transport, max=max_heat_transport, nominal=max_power / 2.0),
                Hydraulic_power=dict(nominal=params_q["Primary"]["Q_nominal"] * 16.0e5),
            ),
            HeatOut=dict(
                Heat=dict(min=-max_heat_transport, max=max_heat_transport, nominal=max_power / 2.0),
                Hydraulic_power=dict(nominal=params_q["Primary"]["Q_nominal"] * 16.0e5),
            ),
            Q_nominal=max_power
            / (
                2
                * self.rho
                * self.cp
                * (params_t["Primary"]["T_supply"] - params_t["Primary"]["T_return"])
            ),
        )
        sec_heat = dict(
            HeatIn=dict(
                Heat=dict(min=-max_heat_transport, max=max_heat_transport, nominal=max_power / 2.0),
                Hydraulic_power=dict(nominal=params_q["Secondary"]["Q_nominal"] * 16.0e5),
            ),
            HeatOut=dict(
                Heat=dict(min=-max_heat_transport, max=max_heat_transport, nominal=max_power / 2.0),
                Hydraulic_power=dict(nominal=params_q["Secondary"]["Q_nominal"] * 16.0e5),
            ),
            Q_nominal=max_power
            / (
                2
                * self.cp
                * self.rho
                * (params_t["Secondary"]["T_supply"] - params_t["Secondary"]["T_return"])
            ),
        )
        params["Primary"] = {**params_t["Primary"], **params_q["Primary"], **prim_heat}
        params["Secondary"] = {
            **params_t["Secondary"],
            **params_q["Secondary"],
            **sec_heat,
        }

        if not asset.attributes["efficiency"]:
            efficiency = 1.0
        else:
            efficiency = asset.attributes["efficiency"]

        modifiers = dict(
            efficiency=efficiency,
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            nominal=max_power / 2.0,
            Primary_heat=dict(min=0.0, max=max_power, nominal=max_power / 2.0),
            Secondary_heat=dict(min=0.0, max=max_power, nominal=max_power / 2.0),
            Heat_flow=dict(min=0.0, max=max_power, nominal=max_power / 2.0),
            state=self.get_state(asset),
            **self._get_cost_figure_modifiers(asset),
            **params,
        )
        return HeatExchanger, modifiers

    def convert_heat_pump(
        self, asset: Asset
    ) -> Tuple[Union[Type[HeatPump], Type[HeatSource], Type[AirWaterHeatPumpElec]], MODIFIERS]:
        """
        This function converts the HeatPump object in esdl to a set of modifiers that can be used in
        a pycml object. Most important:

        - Setting the COP of the heatpump
        - Setting the cap on the electrical power.
        - Setting a caps on the thermal power on both the primary and secondary side.
        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        HeatPump class with modifiers
        """
        assert asset.asset_type in {
            "HeatPump",
        }

        # In this case we only have the secondary side ports, here we assume a air-water HP
        if len(asset.in_ports) == 1 and len(asset.out_ports) == 1:
            _, modifiers = self.convert_heat_source(asset)
            return AirWaterHeatPump, modifiers
        # In this case we only have the secondary side ports, here we assume a air-water HP elec
        if len(asset.in_ports) == 2 and len(asset.out_ports) == 1:
            _, modifiers = self.convert_air_water_heat_pump_elec(asset)
            return AirWaterHeatPumpElec, modifiers

        if not asset.attributes["power"]:
            raise _ESDLInputException(f"{asset.name} has no power specified")
        else:
            power_electrical = asset.attributes["power"]

        if not asset.attributes["COP"]:
            raise _ESDLInputException(
                f"{asset.name} has not COP specified, this is required for the model"
            )
        else:
            cop = asset.attributes["COP"]

        params_t = self._supply_return_temperature_modifiers(asset)
        params_q = self._get_connected_q_nominal(asset)
        prim_heat = dict(
            HeatIn=dict(Hydraulic_power=dict(nominal=params_q["Primary"]["Q_nominal"] * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=params_q["Primary"]["Q_nominal"] * 16.0e5)),
        )
        sec_heat = dict(
            HeatIn=dict(Hydraulic_power=dict(nominal=params_q["Secondary"]["Q_nominal"] * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=params_q["Secondary"]["Q_nominal"] * 16.0e5)),
        )
        params = {}
        params["Primary"] = {**params_t["Primary"], **params_q["Primary"], **prim_heat}
        params["Secondary"] = {**params_t["Secondary"], **params_q["Secondary"], **sec_heat}

        max_power = power_electrical * (1.0 + cop)  # TODO: dit kan zijn power_electrical*cop

        modifiers = dict(
            COP=cop,
            efficiency=asset.attributes["efficiency"] if asset.attributes["efficiency"] else 0.5,
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            Power_elec=dict(min=0.0, max=power_electrical, nominal=power_electrical / 2.0),
            Primary_heat=dict(min=0.0, max=max_power, nominal=max_power / 2.0),
            Secondary_heat=dict(min=0.0, max=max_power, nominal=max_power / 2.0),
            Heat_flow=dict(min=0.0, max=max_power, nominal=max_power / 2.0),
            state=self.get_state(asset),
            **self._get_cost_figure_modifiers(asset),
            **params,
        )
        if len(asset.in_ports) == 2:
            return HeatPump, modifiers
        elif len(asset.in_ports) == 3:
            return HeatPumpElec, modifiers

    def convert_heat_source(self, asset: Asset) -> Tuple[Type[HeatSource], MODIFIERS]:
        """
        This function converts the Source object in esdl to a set of modifiers that can be used in
        a pycml object. Most important:

        - Setting the CO2 emission coefficient in case this is specified as an KPI
        - Setting a caps on the thermal power.
        - In case of a GeothermalSource object we read the _aggregation count to model the number
        of doublets, we then assume that the power specified was also for one doublet and thus
        increase the thermal power caps.
        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        Source class with modifiers
        """
        assert asset.asset_type in {
            "GasHeater",
            "GenericProducer",
            "HeatProducer",
            "GeothermalSource",
            "ResidualHeatSource",
            "HeatPump",
        }

        max_supply = asset.attributes["power"]

        if not max_supply:
            logger.error(f"{asset.asset_type} '{asset.name}' has no max power specified. ")
        assert max_supply > 0.0

        # get price per unit of energy,
        # assume cost of 1. if nothing is given (effectively milp loss minimization)
        # TODO: Use an attribute or use and KPI for CO2 coefficient of a source

        q_nominal = self._get_connected_q_nominal(asset)

        modifiers = dict(
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            Q_nominal=q_nominal,
            state=self.get_state(asset),
            Heat_source=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            Heat_flow=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
            **self._get_cost_figure_modifiers(asset),
        )

        if asset.asset_type == "GeothermalSource":
            modifiers["nr_of_doublets"] = asset.attributes["aggregationCount"]
            modifiers["Heat_source"] = dict(
                min=0.0,
                max=max_supply * asset.attributes["aggregationCount"],
                nominal=max_supply / 2.0,
            )
            modifiers["Heat_flow"] = dict(
                min=0.0,
                max=max_supply * asset.attributes["aggregationCount"],
                nominal=max_supply / 2.0,
            )
            try:
                modifiers["single_doublet_power"] = asset.attributes["single_doublet_power"]
            except KeyError:
                modifiers["single_doublet_power"] = max_supply
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
            return HeatSource, modifiers

    def convert_ates(self, asset: Asset) -> Tuple[Type[ATES], MODIFIERS]:
        """
        This function converts the ATES object in esdl to a set of modifiers that can be used in
        a pycml object. Most important:

        - Setting the milp loss coefficient based upon the efficiency. Here we assume that this
        efficiency is realized in 100 days.
        - Setting a caps on the thermal power.
        - Similar as for the geothermal source we use the aggregation count to model the amount
        of doublets.
        - Setting caps on the maximum stored energy where we assume that at maximum you can charge
        for 180 days at full power.
        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        ATES class with modifiers
        """
        assert asset.asset_type in {
            "ATES",
        }

        hfr_charge_max = asset.attributes.get("maxChargeRate", math.inf)
        hfr_discharge_max = asset.attributes.get("maxDischargeRate", math.inf)
        single_doublet_power = hfr_discharge_max

        # We assume the efficiency is realized over a period of 100 days
        efficiency = asset.attributes["dischargeEfficiency"]
        if not efficiency:
            efficiency = 0.7

        # TODO: temporary value for standard dT on which capacity is based, Q in m3/s
        temperatures = self._supply_return_temperature_modifiers(asset)
        dt = temperatures["T_supply"] - temperatures["T_return"]
        rho = self.rho
        cp = self.cp
        q_max_ates = hfr_discharge_max / (cp * rho * dt)

        q_nominal = min(
            self._get_connected_q_nominal(asset), q_max_ates * asset.attributes["aggregationCount"]
        )

        modifiers = dict(
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            Q_nominal=q_nominal,
            Q=dict(
                min=-q_max_ates * asset.attributes["aggregationCount"],
                max=q_max_ates * asset.attributes["aggregationCount"],
                nominal=q_nominal,
            ),
            single_doublet_power=single_doublet_power,
            heat_loss_coeff=(1.0 - efficiency ** (1.0 / 100.0)) / (3600.0 * 24.0),
            state=self.get_state(asset),
            nr_of_doublets=asset.attributes["aggregationCount"],
            Stored_heat=dict(
                min=0.0,
                max=hfr_charge_max * asset.attributes["aggregationCount"] * 180.0 * 24 * 3600.0,
                nominal=hfr_charge_max * asset.attributes["aggregationCount"] * 30.0 * 24 * 3600.0,
            ),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
            **self._get_cost_figure_modifiers(asset),
        )

        # if no maxStorageTemperature is specified we assume a "regular" HT ATES model
        if (
            asset.attributes["maxStorageTemperature"]
            and asset.attributes["maxStorageTemperature"] <= 30.0
        ):
            modifiers.update(
                dict(
                    Heat_low_temperature_ates=dict(
                        min=-hfr_charge_max * asset.attributes["aggregationCount"],
                        max=hfr_discharge_max * asset.attributes["aggregationCount"],
                        nominal=hfr_discharge_max / 2.0,
                    )
                )
            )
            return LowTemperatureATES, modifiers
        else:
            modifiers.update(
                dict(
                    Heat_ates=dict(
                        min=-hfr_charge_max * asset.attributes["aggregationCount"],
                        max=hfr_discharge_max * asset.attributes["aggregationCount"],
                        nominal=hfr_discharge_max / 2.0,
                    ),
                    T_amb=asset.attributes["aquiferMidTemperature"],
                    Temperature_ates=dict(
                        min=temperatures["T_return"],  # or potentially 0
                        max=temperatures["T_supply"],
                        nominal=temperatures["T_return"],
                    ),
                )
            )
            return ATES, modifiers

    def convert_control_valve(self, asset: Asset) -> Tuple[Type[ControlValve], MODIFIERS]:
        """
        This function converts the ControlValve object in esdl to a set of modifiers that can be
        used in a pycml object. Most important:

        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        ControlValve class with modifiers
        """
        assert asset.asset_type == "Valve"

        q_nominal = self._get_connected_q_nominal(asset)

        modifiers = dict(
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            Q_nominal=q_nominal,
            state=self.get_state(asset),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
        )

        return ControlValve, modifiers

    def convert_check_valve(self, asset: Asset) -> Tuple[Type[CheckValve], MODIFIERS]:
        """
        This function converts the CheckValve object in esdl to a set of modifiers that can be
        used in a pycml object. Most important:

        - Setting the state (enabled, disabled, optional)
        - Setting the relevant temperatures.
        - Setting the relevant cost figures.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        CheckValve class with modifiers
        """
        assert asset.asset_type == "CheckValve"

        q_nominal = self._get_connected_q_nominal(asset)

        modifiers = dict(
            Q_nominal=q_nominal,
            state=self.get_state(asset),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal * 16.0e5)),
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
        )

        return CheckValve, modifiers

    def convert_electricity_demand(self, asset: Asset) -> Tuple[Type[ElectricityDemand], MODIFIERS]:
        """
        This function converts the ElectricityDemand object in esdl to a set of modifiers that can
        be used in a pycml object. Most important:

        - Setting the electrical power caps

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        ElectricityDemand class with modifiers
        """
        assert asset.asset_type in {"ElectricityDemand"}

        max_demand = asset.attributes.get("power", math.inf)
        min_voltage = asset.in_ports[0].carrier.voltage
        i_max, i_nom = self._get_connected_i_nominal_and_max(asset)

        id_mapping = asset.global_properties["carriers"][asset.in_ports[0].carrier.id][
            "id_number_mapping"
        ]

        modifiers = dict(
            min_voltage=min_voltage,
            id_mapping_carrier=id_mapping,
            elec_power_nominal=max_demand / 2.0,
            Electricity_demand=dict(max=max_demand, nominal=max_demand / 2.0),
            ElectricityIn=dict(
                Power=dict(min=0.0, max=max_demand, nominal=max_demand / 2.0),
                I=dict(min=0.0, max=i_max, nominal=i_nom),
                V=dict(min=min_voltage, nominal=min_voltage),
            ),
            **self._get_cost_figure_modifiers(asset),
        )

        return ElectricityDemand, modifiers

    def convert_electricity_source(self, asset: Asset) -> Tuple[Type[ElectricitySource], MODIFIERS]:
        """
        This function converts the ElectricitySource object in esdl to a set of modifiers that can
        be used in a pycml object. Most important:

        - Setting the electrical power caps

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        ElectricitySource class with modifiers
        """
        assert asset.asset_type in {"ElectricityProducer", "WindPark", "PVInstallation"}

        max_supply = asset.attributes.get(
            "power", math.inf
        )  # I think it would break with math.inf as input
        i_max, i_nom = self._get_connected_i_nominal_and_max(asset)
        v_min = asset.out_ports[0].carrier.voltage

        modifiers = dict(
            power_nominal=max_supply / 2.0,
            Electricity_source=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            ElectricityOut=dict(
                V=dict(min=v_min, nominal=v_min),
                I=dict(min=0.0, max=i_max, nominal=i_nom),
                Power=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            ),
            **self._get_cost_figure_modifiers(asset),
        )

        if asset.asset_type == "ElectricityProducer":
            return ElectricitySource, modifiers
        if asset.asset_type == "WindPark":
            return WindPark, modifiers
        if asset.asset_type == "PVInstallation":
            return SolarPV, modifiers

    def convert_electricity_storage(
        self, asset: Asset
    ) -> Tuple[Type[ElectricityStorage], MODIFIERS]:
        """
        This function converts the ElectricityStorage object in esdl to a set of modifiers that can
        be used in a pycml object. Most important:

        - Setting the electrical power caps

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        ElectricityStorage class with modifiers
        """
        assert asset.asset_type in {"Battery"}

        max_capacity = asset.attributes.get("capacity")
        i_max, i_nom = self._get_connected_i_nominal_and_max(asset)
        v_min = asset.in_ports[0].carrier.voltage
        max_charge = asset.attributes.get("maxChargeRate", max_capacity / 3600)
        max_discharge = asset.attributes.get("maxDischargeRate", max_capacity / 3600)
        discharge_efficiency = asset.attributes.get("dischargeEfficiency", 1)
        charge_efficiency = asset.attributes.get("chargeEfficiency", 1)

        modifiers = dict(
            charge_efficiency=charge_efficiency,
            discharge_efficiency=discharge_efficiency,
            min_voltage=v_min,
            max_capacity=max_capacity,
            Stored_electricity=dict(min=0.0, max=max_capacity),
            ElectricityIn=dict(
                V=dict(min=v_min, nominal=v_min),
                I=dict(min=-i_max, max=i_max, nominal=i_nom),
                Power=dict(min=-max_discharge, max=max_charge, nominal=max_charge / 2.0),
            ),
            **self._get_cost_figure_modifiers(asset),
        )

        return ElectricityStorage, modifiers

    def convert_electricity_node(self, asset: Asset) -> Tuple[Type[ElectricityNode], MODIFIERS]:
        """
        This function converts the ElectricityNode object in esdl to a set of modifiers that can be
        used in a pycml object. Most important:

        - Setting the number of connections

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        ElectricityNode class with modifiers
        """
        assert asset.asset_type in {"Bus"}

        sum_in = 0
        sum_out = 0

        node_carrier = None
        for x in asset.attributes["port"].items:
            if node_carrier is None:
                node_carrier = x.carrier.name
                nominal_voltage = x.carrier.voltage
            else:
                if node_carrier != x.carrier.name:
                    raise _ESDLInputException(
                        f"{asset.name} has multiple carriers mixing which is not allowed. "
                    )
            if isinstance(x, esdl.esdl.InPort):
                sum_in += len(x.connectedTo)
            if isinstance(x, esdl.esdl.OutPort):
                sum_out += len(x.connectedTo)

        modifiers = dict(voltage_nominal=nominal_voltage, n=sum_in + sum_out)

        return ElectricityNode, modifiers

    def convert_electricity_cable(self, asset: Asset) -> Tuple[Type[ElectricityCable], MODIFIERS]:
        """
        This function converts the ElectricityCable object in esdl to a set of modifiers that can be
        used in a pycml object. Most important:

        - Setting the length of the cable used for power loss computation.
        - setting the min and max current.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        ElectricityCable class with modifiers
        """
        assert asset.asset_type in {"ElectricityCable"}

        max_power = asset.attributes["capacity"]
        min_voltage = asset.in_ports[0].carrier.voltage
        max_current = max_power / min_voltage
        self._set_electricity_current_nominal_and_max(asset, max_current / 2.0, max_current)

        modifiers = dict(
            max_current=max_current,
            min_voltage=min_voltage,
            nominal_current=max_current / 2.0,
            nominal_voltage=min_voltage,
            length=asset.attributes["length"],
            ElectricityOut=dict(
                V=dict(min=min_voltage, nominal=min_voltage),
                I=dict(min=-max_current, max=max_current, nominal=max_current / 2.0),
                Power=dict(min=-max_power, max=max_power, nominal=max_power / 2.0),
            ),
            ElectricityIn=dict(
                V=dict(min=min_voltage, nominal=min_voltage),
                I=dict(min=-max_current, max=max_current, nominal=max_current / 2.0),
                Power=dict(min=-max_power, max=max_power, nominal=max_power / 2.0),
            ),
            **self._get_cost_figure_modifiers(asset),
        )
        return ElectricityCable, modifiers

    def convert_transformer(self, asset: Asset) -> Tuple[Type[Transformer], MODIFIERS]:
        """
        This function converts the Transformer object in esdl to a set of modifiers that can be
        used in a pycml object. Most important:

        - Setting the length of the cable used for power loss computation.
        - setting the min and max current.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        ElectricityCable class with modifiers
        """
        assert asset.asset_type in {"Transformer"}
        self._get_connected_i_nominal_and_max(asset)
        i_max_in, i_nom_in, i_max_out, i_nom_out = self._get_connected_i_nominal_and_max(asset)
        min_voltage_in = asset.in_ports[0].carrier.voltage
        min_voltage_out = asset.out_ports[0].carrier.voltage
        max_power = min_voltage_in * i_max_in

        modifiers = dict(
            power_nominal=max_power / 2.0,
            min_voltage=min_voltage_in,
            ElectricityIn=dict(
                V=dict(min=min_voltage_in, nominal=min_voltage_in),
                I=dict(min=0.0, max=i_max_in, nominal=i_nom_in),
                Power=dict(min=0.0, max=max_power, nominal=max_power / 2.0),
            ),
            ElectricityOut=dict(
                V=dict(nominal=min_voltage_out),
                I=dict(min=0.0, max=i_max_out, nominal=i_nom_out),
                Power=dict(min=0.0, max=max_power, nominal=max_power / 2.0),
            ),
            **self._get_cost_figure_modifiers(asset),
        )
        return Transformer, modifiers

    def convert_gas_demand(self, asset: Asset) -> Tuple[Type[GasDemand], MODIFIERS]:
        """
        This function converts the GasDemand object in esdl to a set of modifiers that can be
        used in a pycml object. Most important:

        - ...

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        GasDemand class with modifiers
        """
        assert asset.asset_type in {"GasDemand"}

        id_mapping = asset.global_properties["carriers"][asset.in_ports[0].carrier.id][
            "id_number_mapping"
        ]
        # DO not remove due usage in future
        # hydrogen_specfic_energy = 20.0 / 1.0e6
        density = self.get_density(asset.name, asset.in_ports[0].carrier)
        pressure = asset.in_ports[0].carrier.pressure * 1.0e5
        q_nominal = self._get_connected_q_nominal(asset)

        modifiers = dict(
            Q_nominal=q_nominal,
            id_mapping_carrier=id_mapping,
            # Gas_demand_mass_flow=dict(min=0., max=asset.attributes["power"]
            # *hydrogen_specfic_energy),
            density=density,
            GasIn=dict(
                Q=dict(
                    min=0.0,
                    max=self._get_connected_q_max(asset),
                    nominal=self._get_connected_q_nominal(asset),
                ),
                mass_flow=dict(nominal=density * q_nominal),
                Hydraulic_power=dict(min=0.0, max=0.0, nominal=q_nominal * pressure),
            ),
            **self._get_cost_figure_modifiers(asset),
        )

        return GasDemand, modifiers

    def convert_gas_source(self, asset: Asset) -> Tuple[Type[GasSource], MODIFIERS]:
        """
        This function converts the GasDemand object in esdl to a set of modifiers that can be
        used in a pycml object. Most important:

        - ...

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        GasDemand class with modifiers
        """
        assert asset.asset_type in {"GasProducer"}

        q_nominal = self._get_connected_q_nominal(asset)
        density_value = self.get_density(asset.name, asset.out_ports[0].carrier)
        pressure = asset.out_ports[0].carrier.pressure * 1.0e5

        bounds_nominals_mass_flow = dict(
            min=0.0,
            max=self._get_connected_q_max(asset) * density_value,
            nominal=q_nominal * density_value,
        )

        modifiers = dict(
            Q_nominal=q_nominal,
            density=density_value,
            Gas_source_mass_flow=bounds_nominals_mass_flow,
            GasOut=dict(
                Q=dict(nominal=q_nominal),
                mass_flow=bounds_nominals_mass_flow,
                Hydraulic_power=dict(nominal=q_nominal * pressure),
            ),
            **self._get_cost_figure_modifiers(asset),
        )

        return GasSource, modifiers

    def convert_electrolyzer(self, asset: Asset) -> Tuple[Type[Electrolyzer], MODIFIERS]:
        """
        This function converts the Electrolyzer object in esdl to a set of modifiers that can be
        used in a pycml object.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        Electrolyzer class with modifiers
        """
        assert asset.asset_type in {"Electrolyzer"}

        i_max, i_nom = self._get_connected_i_nominal_and_max(asset)
        v_min = asset.in_ports[0].carrier.voltage
        max_power = asset.attributes.get("power", math.inf)
        min_load = float(asset.attributes["minLoad"])
        max_load = float(asset.attributes["maxLoad"])
        eff_min_load = asset.attributes["effMinLoad"]  # Wh/g
        eff_max_load = asset.attributes["effMaxLoad"]  # Wh/g
        eff_max = asset.attributes["efficiency"]  # Wh/g

        def equations(x):
            a, b, c = x
            eq1 = a / min_load + b * min_load + c - eff_min_load
            eq2 = a / max_load + b * max_load + c - eff_max_load
            eq3 = a / (min_load * 2.5) + b * (min_load * 2.5) + c - eff_max
            return [eq1, eq2, eq3]

        # Here we approximate the efficiency curve of the electrolyzer with the function:
        # 1/eff = a/P_e + b*P_e + c. We find the coefficients with a simple solve function.
        # At the moment we abbuse the efficiency attribute of esdl to quantify the maximum
        # operational efficiency.
        a, b, c = fsolve(equations, (0, 0, 0))

        q_nominal = self._get_connected_q_nominal(asset)
        density = self.get_density(asset.name, asset.out_ports[0].carrier)

        modifiers = dict(
            min_voltage=v_min,
            a_eff_coefficient=a,
            b_eff_coefficient=b,
            c_eff_coefficient=c,
            minimum_load=min_load,
            nominal_power_consumed=max_power / 2.0,
            Q_nominal=q_nominal,
            density=density,
            GasOut=dict(
                Q=dict(
                    min=0.0,
                    max=self._get_connected_q_max(asset),
                    nominal=q_nominal,
                ),
                mass_flow=dict(nominal=q_nominal * density),
            ),
            ElectricityIn=dict(
                Power=dict(min=0.0, max=max_power, nominal=max_power / 2.0),
                I=dict(min=0.0, max=i_max, nominal=i_nom),
                V=dict(min=v_min, nominal=v_min),
            ),
            **self._get_cost_figure_modifiers(asset),
        )

        return Electrolyzer, modifiers

    def convert_gas_tank_storage(self, asset: Asset) -> Tuple[Type[GasTankStorage], MODIFIERS]:
        """
        This function converts the GasTankStorage object in esdl to a set of modifiers that can be
        used in a pycml object.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        GasTankStorage class with modifiers
        """
        assert asset.asset_type in {"GasStorage"}

        # DO not remove due usage in future
        # hydrogen_specific_energy = 20.0 / 1.0e6  # kg/Wh
        q_nominal = self._get_connected_q_nominal(asset)
        density = self.get_density(asset.name, asset.in_ports[0].carrier)
        pressure = asset.in_ports[0].carrier.pressure * 1.0e5

        modifiers = dict(
            Q_nominal=q_nominal,
            density=density,
            volume=asset.attributes["workingVolume"],
            # Gas_tank_flow=dict(min=-hydrogen_specific_energy*asset.attributes["maxDischargeRate"],
            # max=hydrogen_specific_energy*asset.attributes["maxChargeRate"]),
            # TODO: Fix -> Gas network is currenlty non-limiting, mass flow is decoupled from the
            # volumetric flow
            # Gas_tank_flow=dict(
            #     min=-self._get_connected_q_max(asset), max=self._get_connected_q_max(asset),
            #     nominal=self._get_connected_q_nominal(asset),
            # )
            GasIn=dict(
                Q=dict(nominal=q_nominal),
                mass_flow=dict(nominal=q_nominal * density),
                Hydraulic_power=dict(nominal=q_nominal * pressure),
            ),
            **self._get_cost_figure_modifiers(asset),
        )

        return GasTankStorage, modifiers

    def convert_gas_substation(self, asset: Asset) -> Tuple[Type[GasSubstation], MODIFIERS]:
        """
        This function converts the PressureReducingValve object in esdl to a set of modifiers that
        can be used in a pycml object.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        GasTankStorage class with modifiers
        """
        assert asset.asset_type in {"GasConversion", "PressureReducingValve"}

        q_nom_in, q_nom_out = self._get_connected_q_nominal(asset)
        density_in = self.get_density(asset.name, asset.in_ports[0].carrier)
        density_out = self.get_density(asset.name, asset.out_ports[0].carrier)
        pressure_in = asset.in_ports[0].carrier.pressure * 1.0e5
        pressure_out = asset.out_ports[0].carrier.pressure * 1.0e5

        assert density_in >= density_out

        modifiers = dict(
            Q_nominal_in=q_nom_in,
            Q_nominal_out=q_nom_out,
            density_in=density_in,
            density_out=density_out,
            GasIn=dict(
                Q=dict(nominal=q_nom_in),
                mass_flow=dict(nominal=q_nom_in * density_in),
                Hydraulic_power=dict(nominal=q_nom_in * pressure_in),
            ),
            GasOut=dict(
                Q=dict(nominal=q_nom_out),
                mass_flow=dict(nominal=q_nom_out * density_out),
                Hydraulic_power=dict(nominal=q_nom_out * pressure_out),
            ),
            **self._get_cost_figure_modifiers(asset),
        )

        return GasSubstation, modifiers

    def convert_compressor(self, asset: Asset) -> Tuple[Type[Compressor], MODIFIERS]:
        """
        This function converts the Compressor object in esdl to a set of modifiers that can be
        used in a pycml object.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        Compressor class with modifiers
        """
        assert asset.asset_type in {"Compressor"}

        q_nom_in, q_nom_out = self._get_connected_q_nominal(asset)
        density_in = self.get_density(asset.name, asset.in_ports[0].carrier)
        density_out = self.get_density(asset.name, asset.out_ports[0].carrier)
        pressure_in = asset.in_ports[0].carrier.pressure * 1.0e5
        pressure_out = asset.out_ports[0].carrier.pressure * 1.0e5

        assert density_out >= density_in

        modifiers = dict(
            Q_nominal_in=q_nom_in,
            Q_nominal_out=q_nom_out,
            density_in=density_in,
            density_out=density_out,
            GasIn=dict(
                Q=dict(nominal=q_nom_in),
                mass_flow=dict(nominal=q_nom_in * density_in),
                Hydraulic_power=dict(nominal=q_nom_in * pressure_in),
            ),
            GasOut=dict(
                Q=dict(nominal=q_nom_out),
                mass_flow=dict(nominal=q_nom_out * density_out),
                Hydraulic_power=dict(nominal=q_nom_out * pressure_out),
            ),
            **self._get_cost_figure_modifiers(asset),
        )

        return Compressor, modifiers

    def convert_gas_boiler(self, asset: Asset) -> Tuple[GasBoiler, MODIFIERS]:
        """
        This function converts the GasHeater object in esdl to a set of modifiers that can be
        used in a pycml object.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        GasBoiler class with modifiers
        """
        assert asset.asset_type in {"GasHeater"}

        max_supply = asset.attributes["power"]

        if not max_supply:
            logger.error(f"{asset.asset_type} '{asset.name}' has no max power specified. ")
        assert max_supply > 0.0

        if len(asset.in_ports) == 1:
            heat_source_object, modifiers = self.convert_heat_source(asset)
            return heat_source_object, modifiers

        id_mapping = asset.global_properties["carriers"][asset.in_ports[0].carrier.id][
            "id_number_mapping"
        ]

        for port in asset.in_ports:
            if isinstance(port.carrier, esdl.GasCommodity):
                density = self.get_density(asset.name, port.carrier)
                internal_energy = self.get_internal_energy(asset.name, port.carrier)

        # TODO: CO2 coefficient

        q_nominals = self._get_connected_q_nominal(asset)

        modifiers = dict(
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            state=self.get_state(asset),
            Heat_source=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            Heat_flow=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominals["Q_nominal"] * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominals["Q_nominal"] * 16.0e5)),
            id_mapping_carrier=id_mapping,
            density=density,
            internal_energy=internal_energy,
            GasIn=dict(Q=dict(min=0.0, nominal=q_nominals["Q_nominal_gas"])),
            **q_nominals,
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
            **self._get_cost_figure_modifiers(asset),
        )

        return GasBoiler, modifiers

    def convert_elec_boiler(self, asset: Asset) -> Tuple[ElecBoiler, MODIFIERS]:
        """
        This function converts the ElectricBoiler object in esdl to a set of modifiers that can be
        used in a pycml object.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        GasBoiler class with modifiers
        """
        assert asset.asset_type in {"ElectricBoiler"}

        max_supply = asset.attributes["power"]

        if not max_supply:
            logger.error(f"{asset.asset_type} '{asset.name}' has no max power specified. ")
        assert max_supply > 0.0

        if len(asset.in_ports) == 1:
            heat_source_object, modifiers = self.convert_heat_source(asset)
            return heat_source_object, modifiers

        id_mapping = asset.global_properties["carriers"][asset.in_ports[0].carrier.id][
            "id_number_mapping"
        ]

        # TODO: CO2 coefficient

        q_nominal = self._get_connected_q_nominal(asset)
        for port in asset.in_ports:
            if isinstance(port.carrier, esdl.ElectricityCommodity):
                min_voltage = port.carrier.voltage
        i_max, i_nom = self._get_connected_i_nominal_and_max(asset)
        eff = asset.attributes["efficiency"] if asset.attributes["efficiency"] else 1.0

        modifiers = dict(
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            state=self.get_state(asset),
            Heat_source=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            Heat_flow=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal["Q_nominal"] * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal["Q_nominal"] * 16.0e5)),
            id_mapping_carrier=id_mapping,
            ElectricityIn=dict(
                Power=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
                I=dict(min=0.0, max=i_max, nominal=i_nom),
                V=dict(min=min_voltage, nominal=min_voltage),
            ),
            min_voltage=min_voltage,
            elec_power_nominal=max_supply,
            efficiency=eff,
            **q_nominal,
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
            **self._get_cost_figure_modifiers(asset),
        )

        return ElecBoiler, modifiers

    def convert_air_water_heat_pump_elec(
        self, asset: Asset
    ) -> Tuple[AirWaterHeatPumpElec, MODIFIERS]:
        """
        This function converts the ElectricBoiler object in esdl to a set of modifiers that can be
        used in a pycml object.

        Parameters
        ----------
        asset : The asset object with its properties.

        Returns
        -------
        AirWaterHeatPumpElec class with modifiers
        """
        assert asset.asset_type in {"HeatPump"}

        max_supply = asset.attributes["power"]

        if not max_supply:
            logger.error(f"{asset.asset_type} '{asset.name}' has no max power specified. ")
        assert max_supply > 0.0

        id_mapping = asset.global_properties["carriers"][asset.in_ports[0].carrier.id][
            "id_number_mapping"
        ]

        # TODO: CO2 coefficient

        q_nominal = self._get_connected_q_nominal(asset)
        for port in asset.in_ports:
            if isinstance(port.carrier, esdl.ElectricityCommodity):
                min_voltage = port.carrier.voltage
        i_max, i_nom = self._get_connected_i_nominal_and_max(asset)
        cop = asset.attributes["COP"] if asset.attributes["COP"] else 1.0

        modifiers = dict(
            technical_life=self.get_asset_attribute_value(
                asset,
                "technicalLifetime",
                default_value=30.0,
                min_value=1.0,
                max_value=50.0,
            ),
            discount_rate=self.get_asset_attribute_value(
                asset, "discountRate", default_value=0.0, min_value=0.0, max_value=100.0
            ),
            state=self.get_state(asset),
            Heat_source=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            Heat_flow=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
            HeatIn=dict(Hydraulic_power=dict(nominal=q_nominal["Q_nominal"] * 16.0e5)),
            HeatOut=dict(Hydraulic_power=dict(nominal=q_nominal["Q_nominal"] * 16.0e5)),
            id_mapping_carrier=id_mapping,
            ElectricityIn=dict(
                Power=dict(min=0.0, max=max_supply, nominal=max_supply / 2.0),
                I=dict(min=0.0, max=i_max, nominal=i_nom),
                V=dict(min=min_voltage, nominal=min_voltage),
            ),
            min_voltage=min_voltage,
            elec_power_nominal=max_supply,
            cop=cop,
            **q_nominal,
            **self._supply_return_temperature_modifiers(asset),
            **self._rho_cp_modifiers,
            **self._get_cost_figure_modifiers(asset),
        )

        return AirWaterHeatPumpElec, modifiers


class ESDLHeatModel(_ESDLModelBase):
    """
    This class is used to convert the esdl Assets to PyCML assets this class only exists to specify
    the specific objects used in the conversion step. Note there is no __init__ in the base class.
    This probably could be standardized in that case this class would become obsolete.
    """

    def __init__(self, assets: Dict[str, Asset], converter_class=AssetToHeatComponent, **kwargs):
        super().__init__(None)

        converter = converter_class(
            **{
                **kwargs,
                **{
                    "primary_port_name_convention": self.primary_port_name_convention,
                    "secondary_port_name_convention": self.secondary_port_name_convention,
                },
            }
        )

        self._esdl_convert(converter, assets, "Heat")
