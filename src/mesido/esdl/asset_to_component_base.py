import json
import logging
import math
import os
from pathlib import Path
from typing import Any, Dict, Tuple, Type, Union

import CoolProp as cP

import esdl
from esdl import TimeUnitEnum, UnitEnum

from mesido.esdl._exceptions import _RetryLaterException
from mesido.esdl.common import Asset
from mesido.network_common import NetworkSettings
from mesido.potential_errors import MesidoAssetIssueType, get_potential_errors
from mesido.pycml import Model as _Model


logger = logging.getLogger("mesido")

MODIFIERS = Dict[str, Union[str, int, float]]

HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS = 4200 * 988
WATTHOUR_TO_JOULE = 3600

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


def get_internal_energy(asset_name, carrier):
    # The default of 20°C is also used in the head_loss_class. Thus, when updating ensure it
    # is also updated in the head_loss_class.
    temperature = 20.0

    if isinstance(carrier, esdl.HeatCommodity):
        internal_energy = cP.CoolProp.PropsSI(
            "U",
            "T",
            273.15 + temperature,
            "P",
            1.0 * 1.0e5,  # TODO: defualt 1 bar pressure should be set for the carrier
            "WATER",
        )
    elif NetworkSettings.NETWORK_TYPE_GAS in carrier.name:
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
            f"Neither gas/hydrogen/heat was used in the carrier " f"name of pipe {asset_name}."
        )
        # TODO: resolve heating value (default value below) vs internal energy values (above)
        internal_energy = 46.0e6  # natural gas at about 1 bar [J/kg] heating value
    return internal_energy  # [J/kg]


def get_energy_content(asset_name, carrier) -> float:
    # Return the heating value
    energy_content_j_kg = 0.0  # [J/kg]
    density_kg_m3 = (
        get_density(asset_name, carrier, temperature_degrees_celsius=20.0, pressure_pa=1.0e5)
        / 1000.0
    )
    if str(NetworkSettings.NETWORK_TYPE_GAS).upper() in str(carrier.name).upper():
        # Groningen gas: 31,68 MJ/m3 LCV
        energy_content_j_kg = 31.68 * 10.0**6 / density_kg_m3  # LCV / lower heating value
    elif str(NetworkSettings.NETWORK_TYPE_HYDROGEN).upper() in str(carrier.name).upper():
        # This value can be lower / higher heating value depending on the case
        # Currently the lower heating value is used below (120.0 MJ/kg)
        energy_content_j_kg = 120.0 * 10.0**6 / density_kg_m3
    else:
        raise logger.error(
            f"Neither gas/hydrogen was used in the carrier " f"name of pipe {asset_name}."
        )
    return energy_content_j_kg


def get_density(asset_name, carrier, temperature_degrees_celsius=20.0, pressure_pa=None):
    # TODO: gas carrier temperature still needs to be resolved.
    # The default for temperature_degrees_celsius=20.0, this should be the same as the value (20°C)
    # used in the head_loss_class for the calculation of the friction factor
    # (linked to _kinematic_viscosity). Thus, when updating the default value of
    # temperature_degrees_celsius ensure it is also updated in the head_loss_class.
    if pressure_pa is None:
        if isinstance(carrier, esdl.HeatCommodity):
            pressure_pa = 16.0e5  # 16bar is expected to be the upper limit in networks
        else:
            pressure_pa = carrier.pressure * 1.0e5  # convert bar to Pa
    elif pressure_pa < 0.0:
        raise logger.error("The pressure should be > 0.0 to calculate density")

    if isinstance(carrier, esdl.HeatCommodity):
        density = cP.CoolProp.PropsSI(
            "D",
            "T",
            273.15 + temperature_degrees_celsius,
            "P",
            pressure_pa,
            "INCOMP::Water",
        )
        return density  # kg/m3
    elif NetworkSettings.NETWORK_TYPE_GAS in carrier.name:
        density = cP.CoolProp.PropsSI(
            "D",
            "T",
            273.15 + temperature_degrees_celsius,
            "P",
            pressure_pa,
            NetworkSettings.NETWORK_COMPOSITION_GAS,
        )
    elif NetworkSettings.NETWORK_TYPE_HYDROGEN in carrier.name:
        density = cP.CoolProp.PropsSI(
            "D",
            "T",
            273.15 + temperature_degrees_celsius,
            "P",
            pressure_pa,
            str(NetworkSettings.NETWORK_TYPE_HYDROGEN).upper(),
        )
    else:
        logger.warning(
            f"Neither gas/hydrogen/heat was used in the carrier " f"name of pipe {asset_name}"
        )
        density = 6.2  # natural gas at about 8 bar
    return density * 1.0e3  # to convert from kg/m3 to g/m3


class _AssetToComponentBase:
    # A map of pipe class name to edr asset in _edr_pipes.json
    STEEL_S1_PIPE_EDR_ASSETS = {
        "DN20": "Steel-S1-DN-20",
        "DN25": "Steel-S1-DN-25",
        "DN32": "Steel-S1-DN-32",
        "DN40": "Steel-S1-DN-40",
        "DN50": "Steel-S1-DN-50",
        "DN65": "Steel-S1-DN-65",
        "DN80": "Steel-S1-DN-80",
        "DN100": "Steel-S1-DN-100",
        "DN125": "Steel-S1-DN-125",
        "DN150": "Steel-S1-DN-150",
        "DN200": "Steel-S1-DN-200",
        "DN250": "Steel-S1-DN-250",
        "DN300": "Steel-S1-DN-300",
        "DN350": "Steel-S1-DN-350",
        "DN400": "Steel-S1-DN-400",
        "DN450": "Steel-S1-DN-450",
        "DN500": "Steel-S1-DN-500",
        "DN600": "Steel-S1-DN-600",
        "DN700": "Steel-S1-DN-700",
        "DN800": "Steel-S1-DN-800",
        "DN900": "Steel-S1-DN-900",
        "DN1000": "Steel-S1-DN-1000",
        "DN1100": "Steel-S1-DN-1100",
        "DN1200": "Steel-S1-DN-1200",
    }
    # A map of the esdl assets to the asset types in pycml
    component_map = {
        "Airco": "airco",
        "ATES": "ates",
        "Battery": "electricity_storage",
        "Bus": "electricity_node",
        "ElectricBoiler": "elec_boiler",
        "ElectricityCable": "electricity_cable",
        "ElectricityDemand": "electricity_demand",
        "ElectricityProducer": "electricity_source",
        "Electrolyzer": "electrolyzer",
        "Export": "export",
        "Compressor": "compressor",
        "GenericConsumer": "heat_demand",
        "CoolingDemand": "cold_demand",
        "HeatExchange": "heat_exchanger",
        "HeatingDemand": "heat_demand",
        "HeatPump": "heat_pump",
        "GasHeater": "gas_boiler",
        "GasProducer": "gas_source",
        "GasDemand": "gas_demand",
        "GasConversion": "gas_substation",
        "GasStorage": "gas_tank_storage",
        "GenericProducer": "heat_source",
        "GeothermalSource": "heat_source",
        "Losses": "heat_demand",
        "HeatProducer": "heat_source",
        "Import": "import",
        "ResidualHeatSource": "heat_source",
        "GenericConversion": "generic_conversion",
        "Joint": "node",
        "Pipe": "pipe",
        "Pump": "pump",
        "PressureReducingValve": "gas_substation",
        "PVInstallation": "electricity_source",
        "HeatStorage": "heat_buffer",
        "Sensor": "skip",
        "Valve": "control_valve",
        "WindPark": "electricity_source",
        "WindTurbine": "electricity_source",
        "Transformer": "transformer",
        "CheckValve": "check_valve",
    }

    primary_port_name_convention = "primary"
    secondary_port_name_convention = "secondary"

    __power_keys = ["power", "maxDischargeRate", "maxChargeRate", "capacity"]

    def __init__(self, **kwargs):
        """
        In this init we initialize some dicts and we load the edr pipes.
        """
        self._port_to_q_nominal = {}
        self._port_to_q_max = {}
        self._port_to_i_nominal = {}
        self._port_to_i_max = {}
        self._port_to_esdl_component_type = {}
        self._edr_pipes = json.load(
            open(os.path.join(Path(__file__).parent, "_edr_pipes.json"), "r")
        )
        # The default gas pipe database is based on the ASA pipe catalogue schedule standard (std).
        self._gas_pipes = json.load(
            open(os.path.join(Path(__file__).parent, "_gas_pipe_database.json"), "r")
        )

    def convert(self, asset: Asset) -> Tuple[Type[_Model], MODIFIERS]:
        """
        Converts an asset to a PyCML Heat component type and its modifiers.

        With more descriptive variable names the return type would be:
            Tuple[pycml_heat_component_type, Dict[component_attribute, new_attribute_value]]
        """

        dispatch_method_name = f"convert_{self.component_map[asset.asset_type]}"
        return getattr(self, dispatch_method_name)(asset)

    def port_asset_type_connections(self, asset):
        """
        Here we populate a map between ports and asset types that we need before we can convert
        the individual assets. This is because for the parsing of some assets we need to know if
        they are connected to a certain type of asset, like a is disconnectable depending on which
        asset type it is connected.

        Parameters
        ----------
        asset : Asset pipe object with it's properties from ESDL

        Returns
        -------
        None
        """
        ports = []
        if asset.in_ports is not None:
            ports.extend(asset.in_ports)
        if asset.out_ports is not None:
            ports.extend(asset.out_ports)
        assert len(ports) > 0

        for port in ports:
            self._port_to_esdl_component_type[port] = asset.asset_type

    def _pipe_get_diameter_and_insulation(self, asset: Asset) -> Tuple[float, list, list]:
        """
        There are multiple ways to specify pipe properties like inner-diameter and
        pipe/insulation material and thickness.  The user specified nominal diameter (DN size)
        takes precedence over potential user specified innerDiameter and material (while logging
        warnings when either of these two variables are specified in combination with the pipe DN)
        Parameters
        ----------
        asset : Asset pipe object with it's properties from ESDL

        Returns
        -------
        pipe inner diameter, thickness and conductivity of each insulation layer
        """

        full_name = f"{asset.asset_type} '{asset.name}'"
        if asset.attributes["innerDiameter"] and asset.attributes["diameter"].value > 0:
            logger.warning(
                f"{full_name}' has both 'innerDiameter' and 'diameter' specified. "
                f"Diameter of {asset.attributes['diameter'].name} will be used."
            )
        if asset.attributes["material"] and asset.attributes["diameter"].value > 0:
            logger.warning(
                f"{full_name}' has both 'material' and 'diameter' specified. "
                f"Insulation properties of {asset.attributes['diameter'].name} will be used."
            )
        if asset.attributes["material"] and (
            asset.attributes["diameter"].value == 0 and not asset.attributes["innerDiameter"]
        ):
            logger.warning(
                f"{full_name}' has only 'material' specified, but no information on diameter. "
                f"Diameter and insulation properties of DN200 will be used."
            )
        if asset.attributes["diameter"].value == 0 and not asset.attributes["innerDiameter"]:
            if asset.attributes["material"]:
                logger.warning(
                    f"{full_name}' has only 'material' specified, but no information on diameter. "
                    f"Diameter and insulation properties of DN200 will be used."
                )
            else:
                logger.warning(
                    f"{full_name}' has no DN size or innerDiameter specified. "
                    f"Diameter and insulation properties of DN200 will be used. "
                )

        edr_dn_size = None
        if asset.attributes["diameter"].value > 0:
            edr_dn_size = str(asset.attributes["diameter"].name)
        elif not asset.attributes["innerDiameter"]:
            edr_dn_size = "DN200"

        # NaN means the default values will be used
        insulation_thicknesses = math.nan
        conductivies_insulation = math.nan

        if edr_dn_size:
            # Get insulation and diameter properties from EDR asset with this size.
            edr_asset = self._edr_pipes[self.STEEL_S1_PIPE_EDR_ASSETS[edr_dn_size]]
            inner_diameter = edr_asset["inner_diameter"]
            insulation_thicknesses = edr_asset["insulation_thicknesses"]
            conductivies_insulation = edr_asset["conductivies_insulation"]
        else:
            assert asset.attributes["innerDiameter"]
            inner_diameter = asset.attributes["innerDiameter"]

            # Insulation properties
            material = asset.attributes["material"]

            if material is not None:
                if isinstance(material, esdl.esdl.MatterReference):
                    material = material.reference

                assert isinstance(material, esdl.esdl.CompoundMatter)
                components = material.component.items
                if components:
                    insulation_thicknesses = [x.layerWidth for x in components]
                    conductivies_insulation = [x.matter.thermalConductivity for x in components]

        return inner_diameter, insulation_thicknesses, conductivies_insulation

    def _gas_pipe_get_diameter_and_roughness(self, asset: Asset) -> Tuple[float, float]:
        """
        There are multiple ways to specify pipe properties like inner-diameter and
        pipe material and thickness.  The user specified nominal diameter (DN size)
        takes precedence over potential user specified innerDiameter (while logging
        warnings when either of these are specified in combination with the pipe DN).
        Similarly, for the wall roughness, the order of preference is; based on the
        DN size from the default database in this repo, the wall_roughness attribute
        from the ESDL asset or the default value.
        Parameters
        ----------
        asset : Asset pipe object with itss properties from ESDL

        Returns
        -------
        pipe inner diameter [m], wall roughness [m]
        """

        full_name = f"{asset.asset_type} '{asset.name}'"
        if asset.attributes["innerDiameter"] and asset.attributes["diameter"].value > 0:
            logger.warning(
                f"{full_name}' has both 'innerDiameter' and 'diameter' specified. "
                f"Diameter of {asset.attributes['diameter'].name} will be used."
            )

        edr_dn_size = None
        if asset.attributes["diameter"].value > 0:
            edr_dn_size = str(asset.attributes["diameter"].name)
        elif not asset.attributes["innerDiameter"]:
            logger.error(
                f"{full_name}' has no DN size or innerDiameter specified, default is set to DN200. "
            )
            edr_dn_size = "DN200"
            # TODO: ideally no default diameter size is set, test cases have to be updated for this
            #  to be removed.

        # NaN means the default values will be used
        wall_roughness = math.nan

        if edr_dn_size:
            # Get insulation and diameter properties from EDR asset with this size.
            edr_asset = self._gas_pipes[edr_dn_size]
            inner_diameter = float(edr_asset["inner_diameter"])
            wall_roughness = float(edr_asset["roughness"])
        else:
            assert asset.attributes["innerDiameter"]
            inner_diameter = asset.attributes["innerDiameter"]
            if asset.attributes["roughness"] > 0.0:
                wall_roughness = float(asset.attributes["roughness"])
            else:
                wall_roughness = 1.0e-4

        return inner_diameter, wall_roughness

    def _cable_get_resistance(self, asset: Asset) -> Tuple:
        """
        Determines the resistance in ohm/m defined by the inverse of the electrical conductivity
        in the cable's material properties. If no material is defined a default resistance of
        1e-6 ohm/m is used.

        Parameters
        ----------
        asset : Asset cable object with it's properties from ESDL

        Returns
        -------
        resistance [ohm/m]
        """

        default_res = 1e-6
        material = asset.attributes["material"]
        el_conductivity = None
        if material:
            el_conductivity = material.electricalConductivity
        if not el_conductivity:
            logger.warning(
                f"Cable {asset.name} does not have a material with conductivity assigned,"
                f" using default resistance of {default_res} ohm/m"
            )
        res_ohm_per_m = 1 / el_conductivity if el_conductivity else default_res

        return res_ohm_per_m

    def _is_disconnectable_pipe(self, asset: Asset) -> bool:
        """
        This function checks if the pipe is connected to specific assets (e.g. source) and if so
        returns true. The true here means that we will later make a is_disconnected variable
        allowing for optionally disconnecting a pipe from the optimization meaning it will not have
        any flow, but also avoiding the need to compensate the milp losses for that pipe.

        Parameters
        ----------
        asset : The asset object of an pipe

        Returns
        -------
        A bool that specifies whether we should have a disconnectable variable for this
        pipe.
        """
        # TODO: this functionality combined with heat_loss_disconnected_pipe is not functioning as
        # intended anymore. When heat_loss_disconnected_pipe = True, then a pipe should be able to
        # be disconnected but still include head losses for a pipe (with v=0m/s in the pipe).
        # Currently if heat_loss_disconnected_pipe = True then a pipe cannot be disconnected
        # anymore. This was checked with PoC tutorial example while trying to use this
        # functionality on a pipe connected to a heating demand.
        assert asset.asset_type == "Pipe"
        if len(asset.in_ports) == 1 and len(asset.out_ports) == 1:
            connected_type_in = self._port_to_esdl_component_type.get(
                asset.in_ports[0].connectedTo[0], None
            )
            connected_type_out = self._port_to_esdl_component_type.get(
                asset.out_ports[0].connectedTo[0], None
            )
        else:
            raise RuntimeError("Pipe does not have 1 in port and 1 out port")
        # TODO: add other components which can be disabled and thus of which the pipes are allowed
        #  to be disabled: , "heat_exchanger", "heat_pump", "ates"
        types = {
            k
            for k, v in self.component_map.items()
            if v
            in {
                "heat_source",
                "heat_buffer",
                "ates",
                "heat_exchanger",
                "heat_pump",
                "cold_demand",
            }
        }

        if types.intersection({connected_type_in, connected_type_out}):
            return True
        elif connected_type_in is None or connected_type_out is None:
            raise _RetryLaterException(
                f"Could not determine if {asset.asset_type} '{asset.name}' "
                f"is a source or buffer pipe"
            )
        else:
            return False

    def _set_q_nominal(self, asset: Asset, q_nominal: float) -> None:
        """
        This function populates a dict with the nominal volumetric flow in m3/s for the ports of all
        pipes.

        Parameters
        ----------
        asset :
        q_nominal : float of the nominal flow through that pipe

        Returns
        -------
        None
        """
        try:
            self._port_to_q_nominal[asset.in_ports[0]] = q_nominal
        except TypeError:
            pass
        try:
            self._port_to_q_nominal[asset.out_ports[0]] = q_nominal
        except TypeError:
            pass

    def _set_q_max(self, asset: Asset, q_max: float) -> None:
        """
        This function populates a dict with the max volumetric flow in m3/s for the ports of all
        pipes.

        Parameters
        ----------
        asset :
        q_max : float of the max flow through that pipe

        Returns
        -------
        None
        """
        try:
            self._port_to_q_max[asset.in_ports[0]] = q_max
        except TypeError:
            pass
        try:
            self._port_to_q_max[asset.out_ports[0]] = q_max
        except TypeError:
            pass

    def _set_electricity_current_nominal_and_max(
        self, asset: Asset, i_nominal: float, i_max: float
    ) -> None:
        """
        This function populates a dict with the electricity current nominals [A] for the ports of
        all electricity cables.

        Parameters
        ----------
        asset :
        q_max : float of the electricity current nominal

        Returns
        -------
        None
        """
        try:
            self._port_to_i_nominal[asset.in_ports[0]] = i_nominal
            self._port_to_i_max[asset.in_ports[0]] = i_max
        except TypeError:
            pass
        try:
            self._port_to_i_nominal[asset.out_ports[0]] = i_nominal
            self._port_to_i_max[asset.out_ports[0]] = i_max
        except TypeError:
            pass

    def _get_connected_q_max(self, asset: Asset) -> float:
        if asset.in_ports is not None and asset.asset_type != "Electrolyzer":
            for port in asset.in_ports:
                convert_density_units = 1.0
                energy_reference_j_kg = 1.0
                if not isinstance(port.carrier, esdl.HeatCommodity):
                    convert_density_units = 1.0e3  # convert g/m3 to kg/m3 if needed
                    energy_reference_j_kg = get_energy_content(asset.name, port.carrier)
                else:
                    # heat_value / rho * minimum_dT => [J/m3K] / [kg/m3] * 1.0 [K] => [J/kg]
                    energy_reference_j_kg = HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS / 988.0

                connected_port = port.connectedTo[0]
                q_max = (
                    self._port_to_q_max.get(connected_port, None)
                    if self._port_to_q_max.get(connected_port, False)
                    else max([asset.attributes.get(key, -1) for key in self.__power_keys])
                    / (
                        # note rho -> gas/hydrogen g/m3, heat kg/m3
                        get_density(asset.name, port.carrier)
                        * energy_reference_j_kg
                        / convert_density_units
                    )
                )
                if q_max is not None:
                    self._set_q_max(asset, q_max)
                    return q_max
                else:
                    logger.error(
                        f"Tried to get the maximum flow for {asset.name}, however this was never "
                        f"set"
                    )
        elif asset.out_ports is not None:
            for port in asset.out_ports:
                convert_density_units = 1.0
                energy_reference_j_kg = 1.0
                if not isinstance(port.carrier, esdl.HeatCommodity):
                    convert_density_units = 1.0e3  # convert g/m3 to kg/m3 if needed
                    energy_reference_j_kg = get_energy_content(asset.name, port.carrier)
                else:
                    # heat_value / rho * minimum_dT => [J/m3K] / [kg/m3] * 1.0 [K] => [J/kg]
                    energy_reference_j_kg = HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS / 988.0

                connected_port = port.connectedTo[0]
                q_max = (
                    self._port_to_q_max.get(connected_port, None)
                    if self._port_to_q_max.get(connected_port, False)
                    else max([asset.attributes.get(key, -1) for key in self.__power_keys])
                    / (
                        # note rho -> gas/hydrogen g/m3, heat kg/m3
                        get_density(asset.name, port.carrier)
                        * energy_reference_j_kg
                        / convert_density_units
                    )
                )
                if q_max is not None:
                    self._set_q_max(asset, q_max)
                    return q_max
                else:
                    logger.error(
                        f"Tried to get the maximum flow for {asset.name}, however this was never "
                        f"set"
                    )
        else:
            logger.error(
                f"Tried to get the maximum flow for {asset.name}, however this was never set"
            )

    def _get_connected_i_nominal_and_max(self, asset: Asset) -> Tuple[float, float]:

        if (
            asset.in_ports is not None
            and asset.out_ports is not None
            and len(asset.in_ports) == 1
            and len(asset.out_ports) == 1
            and isinstance(asset.in_ports[0].carrier, esdl.ElectricityCommodity)
            and isinstance(asset.out_ports[0].carrier, esdl.ElectricityCommodity)
        ):  # Transformer
            connected_port = asset.out_ports[0].connectedTo[0]
            i_max_out = (
                self._port_to_i_max.get(connected_port, None)
                if self._port_to_i_max.get(connected_port, False)
                else max(
                    [
                        asset.attributes.get(key, -1) / connected_port.carrier.voltage
                        for key in self.__power_keys
                    ]
                )
            )
            i_nom_out = (
                self._port_to_i_nominal.get(connected_port, None)
                if self._port_to_i_nominal.get(connected_port, False)
                else max(
                    [
                        asset.attributes.get(key, -1) / connected_port.carrier.voltage / 2.0
                        for key in self.__power_keys
                    ]
                )
            )
            connected_port = asset.in_ports[0].connectedTo[0]
            i_max_in = (
                self._port_to_i_max.get(connected_port, None)
                if self._port_to_i_max.get(connected_port, False)
                else max(
                    [
                        asset.attributes.get(key, -1) / connected_port.carrier.voltage
                        for key in self.__power_keys
                    ]
                )
            )
            i_nom_in = (
                self._port_to_i_nominal.get(connected_port, None)
                if self._port_to_i_nominal.get(connected_port, False)
                else max(
                    [
                        asset.attributes.get(key, -1) / connected_port.carrier.voltage / 2.0
                        for key in self.__power_keys
                    ]
                )
            )
            if i_nom_in > 0.0 and i_nom_out > 0.0:
                self._port_to_i_nominal[asset.in_ports[0]] = i_nom_in
                self._port_to_i_max[asset.in_ports[0]] = i_max_in
                self._port_to_i_nominal[asset.out_ports[0]] = i_nom_out
                self._port_to_i_max[asset.out_ports[0]] = i_max_out
                return i_max_in, i_nom_in, i_max_out, i_nom_out
            else:
                raise logger.error(
                    f"Could not determine max and nominal current for {asset.asset_type}"
                    " '{asset.name}'"
                )

        elif asset.in_ports is None:
            connected_port = asset.out_ports[0].connectedTo[0]
            i_max = (
                self._port_to_i_max.get(connected_port, None)
                if self._port_to_i_max.get(connected_port, False)
                else max(
                    [
                        asset.attributes.get(key, -1) / connected_port.carrier.voltage
                        for key in self.__power_keys
                    ]
                )
            )
            i_nom = (
                self._port_to_i_nominal.get(connected_port, None)
                if self._port_to_i_nominal.get(connected_port, False)
                else max(
                    [
                        asset.attributes.get(key, -1) / connected_port.carrier.voltage / 2.0
                        for key in self.__power_keys
                    ]
                )
            )
            if i_max > 0.0:
                self._set_electricity_current_nominal_and_max(asset, i_max, i_nom)
                return i_max, i_nom
            else:
                raise logger.error(
                    f"Could not determine max and nominal current for {asset.asset_type}"
                    " '{asset.name}'"
                )
        elif (
            asset.out_ports is None
            or asset.asset_type == "Electrolyzer"
            or asset.asset_type == "ElectricBoiler"
            or asset.asset_type == "HeatPump"
        ):
            for port in asset.in_ports:
                if isinstance(port.carrier, esdl.ElectricityCommodity):
                    connected_port = port.connectedTo[0]
                    i_max = (
                        self._port_to_i_max.get(connected_port, None)
                        if self._port_to_i_max.get(connected_port, False)
                        else max(
                            [
                                asset.attributes.get(key, -1) / connected_port.carrier.voltage
                                for key in self.__power_keys
                            ]
                        )
                    )
                    i_nom = (
                        self._port_to_i_nominal.get(connected_port, None)
                        if self._port_to_i_nominal.get(connected_port, False)
                        else max(
                            [
                                asset.attributes.get(key, -1) / connected_port.carrier.voltage / 2.0
                                for key in self.__power_keys
                            ]
                        )
                    )
                    if i_max > 0.0:
                        self._set_electricity_current_nominal_and_max(asset, i_max, i_nom)
                        return i_max, i_nom
                    else:
                        raise logger.error(
                            f"Could not determine max and nominal current for {asset.asset_type}"
                            f" '{asset.name}'"
                        )

    def _get_connected_q_nominal(self, asset: Asset) -> Union[float, Dict]:
        """
        This function returns the nominal volumetric flow in m3/s for an asset by checking the dict
        that has all q_nominal for the ports of all pipes. Since all ports must have at least one
        pipe connected to them, this allows us to find all needed nominals. Assets can either be
        connected to one or two hydraulic systems.

        Parameters
        ----------
        asset : Asset object used to check to which ports the asset is connected

        Returns
        -------
        Either the connected nominal flow [m3/s] if it is only connected to one hydraulic system,
        otherwise a dict with the flow nominals of both the primary and secondary side.
        """

        if (
            asset.in_ports is not None
            and asset.out_ports is not None
            and len(asset.in_ports) == 1
            and len(asset.out_ports) == 1
            and asset.in_ports[0].carrier.id != asset.out_ports[0].carrier.id
            and isinstance(asset.in_ports[0].carrier, esdl.GasCommodity)
            and isinstance(asset.out_ports[0].carrier, esdl.GasCommodity)
        ):  # Cater for gas substation
            connected_port = asset.in_ports[0].connectedTo[0]
            q_nominal_in = (
                self._port_to_q_nominal.get(connected_port, None)
                if self._port_to_q_nominal.get(connected_port, False)
                else 0.0
            )
            connected_port = asset.out_ports[0].connectedTo[0]
            q_nominal_out = (
                self._port_to_q_nominal.get(connected_port, None)
                if self._port_to_q_nominal.get(connected_port, False)
                else 0.0
            )

            if q_nominal_in > 0.0 and q_nominal_out > 0.0:
                self._port_to_q_nominal[asset.in_ports[0]] = q_nominal_in
                self._port_to_q_nominal[asset.out_ports[0]] = q_nominal_out
                return q_nominal_in, q_nominal_out
        elif (
            asset.in_ports is not None
            and asset.out_ports is not None
            and len(asset.in_ports) == 1
            and len(asset.out_ports) == 1
        ):
            for port in [*asset.in_ports, *asset.out_ports]:
                if isinstance(port.carrier, esdl.GasCommodity) or isinstance(
                    port.carrier, esdl.HeatCommodity
                ):
                    convert_density_units = 1.0
                    energy_reference_j_kg = 1.0
                    if not isinstance(port.carrier, esdl.HeatCommodity):
                        convert_density_units = 1.0e3  # convert g/m3 to kg/m3 if needed
                        energy_reference_j_kg = get_energy_content(asset.name, port.carrier)
                    else:
                        # heat_value / rho * minimum_dT => [J/m3K] / [kg/m3] * 1.0 [K] => [J/kg]
                        energy_reference_j_kg = HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS / 988.0

                    connected_port = port.connectedTo[0]
                    q_nominal = (
                        self._port_to_q_nominal.get(connected_port, None)
                        if self._port_to_q_nominal.get(connected_port, False)
                        else max([asset.attributes.get(key, -1) for key in self.__power_keys])
                        / (
                            # note rho -> gas/hydrogen g/m3, heat kg/m3
                            get_density(asset.name, port.carrier)
                            * energy_reference_j_kg
                            / convert_density_units
                        )
                    )
                    if q_nominal is not None:
                        self._set_q_nominal(asset, q_nominal)
                        return q_nominal
        elif asset.in_ports is not None and asset.out_ports is None and len(asset.in_ports) == 1:
            for port in asset.in_ports:
                if isinstance(port.carrier, esdl.GasCommodity) or isinstance(
                    port.carrier, esdl.HeatCommodity
                ):
                    convert_density_units = 1.0
                    energy_reference_j_kg = 1.0
                    if not isinstance(port.carrier, esdl.HeatCommodity):
                        convert_density_units = 1.0e3  # convert g/m3 to kg/m3 if needed
                        energy_reference_j_kg = get_energy_content(asset.name, port.carrier)
                    else:
                        # heat_value / rho * minimum_dT => [J/m3K] / [kg/m3] * 1.0 [K] => [J/kg]
                        energy_reference_j_kg = HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS / 988.0

                    connected_port = port.connectedTo[0]
                    q_nominal = (
                        self._port_to_q_nominal.get(connected_port, None)
                        if self._port_to_q_nominal.get(connected_port, False)
                        else max([asset.attributes.get(key, -1) for key in self.__power_keys])
                        / (
                            # note rho -> gas/hydrogen g/m3, heat kg/m3
                            get_density(asset.name, port.carrier)
                            * energy_reference_j_kg
                            / convert_density_units
                        )
                    )
                    if q_nominal is not None:
                        self._set_q_nominal(asset, q_nominal)
                        return q_nominal
        elif asset.out_ports is not None and asset.in_ports is None and len(asset.out_ports) == 1:
            for port in asset.out_ports:
                if isinstance(port.carrier, esdl.GasCommodity) or isinstance(
                    port.carrier, esdl.HeatCommodity
                ):
                    convert_density_units = 1.0
                    energy_reference_j_kg = 1.0
                    if not isinstance(port.carrier, esdl.HeatCommodity):
                        convert_density_units = 1.0e3  # convert g/m3 to kg/m3 if needed
                        energy_reference_j_kg = get_energy_content(asset.name, port.carrier)
                    else:
                        # heat_value / rho * minimum_dT => [J/m3K] / [kg/m3] * 1.0 [K] => [J/kg]
                        energy_reference_j_kg = HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS / 988.0

                    connected_port = port.connectedTo[0]
                    q_nominal = (
                        self._port_to_q_nominal.get(connected_port, None)
                        if self._port_to_q_nominal.get(connected_port, False)
                        else max([asset.attributes.get(key, -1) for key in self.__power_keys])
                        / (
                            # note rho -> gas/hydrogen g/m3, heat kg/m3
                            get_density(asset.name, port.carrier)
                            * energy_reference_j_kg
                            / convert_density_units
                        )
                    )
                    if q_nominal is not None:
                        self._set_q_nominal(asset, q_nominal)
                        return q_nominal
        elif len(asset.in_ports) == 2 and len(asset.out_ports) == 1:  # for gas_boiler or e_boiler
            q_nominals = {}
            try:
                for port in asset.in_ports:
                    connected_port = port.connectedTo[0]
                    if isinstance(port.carrier, esdl.GasCommodity) or isinstance(
                        port.carrier, esdl.HeatCommodity
                    ):
                        nominal_string = "Q_nominal"
                        convert_density_units = 1.0
                        energy_reference_j_kg = 1.0
                        if isinstance(port.carrier, esdl.GasCommodity):
                            nominal_string += "_gas"
                            convert_density_units = 1.0e3  # convert g/m3 to kg/m3 if needed
                            energy_reference_j_kg = get_energy_content(asset.name, port.carrier)
                        elif isinstance(port.carrier, esdl.HeatCommodity):
                            # heat_value / rho * minimum_dT => [J/m3K] / [kg/m3] * 1.0 [K] => [J/kg]
                            energy_reference_j_kg = HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS / 988.0

                        if isinstance(connected_port.energyasset, esdl.Joint):
                            q_nominal = (
                                self._port_to_q_nominal.get(connected_port, None)
                                if self._port_to_q_nominal.get(connected_port, False)
                                else max(
                                    [asset.attributes.get(key, -1) for key in self.__power_keys]
                                )
                                / (
                                    # note rho -> gas/hydrogen g/m3, heat kg/m3
                                    get_density(asset.name, port.carrier)
                                    * energy_reference_j_kg
                                    / convert_density_units
                                )
                            )
                            if q_nominal is not None:
                                q_nominals[nominal_string] = q_nominal
                                self._port_to_q_nominal[port] = q_nominals[nominal_string]
                        else:
                            q_nominals[nominal_string] = self._port_to_q_nominal[connected_port]
                            self._port_to_q_nominal[port] = q_nominals[nominal_string]
                if q_nominals is None:
                    logger.error(
                        f"{asset.name} should have at least gas or heat specified on "
                        f"one of the in ports"
                    )
                    exit(1)
            except KeyError:
                if isinstance(asset.out_ports[0].carrier, esdl.GasCommodity):
                    connected_port = asset.out_ports[0].connectedTo[0]
                    q_nominals["Q_nominal"] = (
                        self._port_to_q_nominal.get(connected_port, None)
                        if self._port_to_q_max.get(connected_port, False)
                        else max([asset.attributes.get(key, -1) for key in self.__power_keys])
                        / (
                            # note rho -> gas/hydrogen g/m3, heat kg/m3
                            get_density(asset.name, port.carrier)
                            * get_energy_content(asset.name, port.carrier)
                            / 1.0e3
                        )
                    )
                else:
                    logger.error(f"{asset.name} should have a heat carrier on out port")

            if q_nominals["Q_nominal"] is not None:
                self._port_to_q_nominal[asset.out_ports[0]] = q_nominals["Q_nominal"]
                return q_nominals
        elif len(asset.in_ports) >= 2 and len(asset.out_ports) == 2:
            q_nominals = {}
            for p in asset.in_ports:
                if isinstance(p.carrier, esdl.HeatCommodity):
                    out_port = None
                    for p2 in asset.out_ports:
                        if p2.carrier.name.replace("_ret", "") == p.carrier.name.replace(
                            "_ret", ""
                        ):
                            out_port = p2
                    try:
                        connected_port = p.connectedTo[0]
                        q_nominal = self._port_to_q_nominal[connected_port]
                    except KeyError:
                        connected_port = out_port.connectedTo[0]
                        q_nominal = (
                            self._port_to_q_nominal.get(connected_port, None)
                            if self._port_to_q_max.get(connected_port, False)
                            else max([asset.attributes.get(key, -1) for key in self.__power_keys])
                            / (
                                # note rho -> gas/hydrogen g/m3, heat kg/m3
                                get_density(asset.name, p.carrier)
                                * (HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS / 988.0)
                            )
                        )
                    if q_nominal is not None:
                        self._port_to_q_nominal[p] = q_nominal
                        self._port_to_q_nominal[out_port] = q_nominal
                        if "sec" in p.name.lower():
                            q_nominals["Secondary"] = {"Q_nominal": q_nominal}
                        else:
                            q_nominals["Primary"] = {"Q_nominal": q_nominal}

            return q_nominals

    def _get_cost_figure_modifiers(self, asset: Asset) -> Dict:
        """
        This function takes in an asset and creates a dict with the relevant cost information of
        that asset which is used in the optimization. At this moment we have a four element cost
        structure with:
        InvestmentCost: Scales with asset size
        InstallationCost: Scales with the _aggregation count integer (cost for placement),
                            independent of the size of the individual aggregation counts
        FixedOperationalCost: Yearly operational cost that scales with asset size.
        VariableOperationalCost: Yearly operational cost that scales with asset use.

        Parameters
        ----------
        asset : Asset object to retrieve cost information from.

        Returns
        -------
        Dict with the mentioned cost elements
        """
        modifiers = {}

        if asset.attributes["costInformation"] is None:
            RuntimeWarning(f"{asset.name} has no cost information specified")
            return modifiers

        if asset.asset_type == "HeatStorage":
            modifiers["variable_operational_cost_coefficient"] = self.get_variable_opex_costs(asset)
            modifiers["fixed_operational_cost_coefficient"] = self.get_fixed_opex_costs(asset)
            modifiers["investment_cost_coefficient"] = self.get_investment_costs(
                asset, per_unit=UnitEnum.JOULE
            )
            modifiers["installation_cost"] = self.get_installation_costs(asset)
        elif asset.asset_type == "Pipe":
            modifiers["investment_cost_coefficient"] = self.get_investment_costs(
                asset, per_unit=UnitEnum.METRE
            )
            modifiers["installation_cost"] = self.get_installation_costs(asset)
        elif asset.asset_type == "HeatingDemand":
            modifiers["investment_cost_coefficient"] = self.get_investment_costs(
                asset, per_unit=UnitEnum.WATT
            )
            modifiers["installation_cost"] = self.get_installation_costs(asset)
        elif asset.asset_type == "GasDemand":
            modifiers["variable_operational_cost_coefficient"] = self.get_variable_opex_costs(asset)
        elif asset.asset_type == "GasProducer":
            modifiers["variable_operational_cost_coefficient"] = self.get_variable_opex_costs(asset)
        elif asset.asset_type == "Electrolyzer":
            modifiers["variable_operational_cost_coefficient"] = self.get_variable_opex_costs(asset)
            modifiers["fixed_operational_cost_coefficient"] = self.get_fixed_opex_costs(asset)
            modifiers["investment_cost_coefficient"] = self.get_investment_costs(asset)
        elif asset.asset_type == "GasStorage":
            modifiers["variable_operational_cost_coefficient"] = self.get_variable_opex_costs(asset)
            modifiers["fixed_operational_cost_coefficient"] = self.get_fixed_opex_costs(asset)
        else:
            modifiers["variable_operational_cost_coefficient"] = self.get_variable_opex_costs(asset)
            modifiers["fixed_operational_cost_coefficient"] = self.get_fixed_opex_costs(asset)
            modifiers["investment_cost_coefficient"] = self.get_investment_costs(
                asset, per_unit=UnitEnum.WATT
            )
            modifiers["installation_cost"] = self.get_installation_costs(asset)

        return modifiers

    @staticmethod
    def _get_supply_return_temperatures(asset: Asset) -> Tuple[float, float]:
        """
        This function returns the supply and return temperature for an asset that is connected to
        one hydraulic system.

        Parameters
        ----------
        asset : The asset object to retrieve port and carrier information from

        Returns
        -------
        Tuple with the supply and return temperature.
        """

        assert len(asset.in_ports) <= 2 and len(asset.out_ports) == 1

        for port in asset.in_ports:
            if isinstance(port.carrier, esdl.HeatCommodity):
                in_carrier = asset.global_properties["carriers"][port.carrier.id]
        out_carrier = asset.global_properties["carriers"][asset.out_ports[0].carrier.id]

        if in_carrier["id"] == out_carrier["id"]:
            # these are the pipes, nodes, valves, pumps
            modifiers = {
                "temperature": in_carrier["temperature"],
                "carrier_id": in_carrier["id_number_mapping"],
            }
        else:
            # These are the sources, storages and consumers
            supply_temperature = (
                in_carrier["temperature"]
                if in_carrier["temperature"] > out_carrier["temperature"]
                else out_carrier["temperature"]
            )
            return_temperature = (
                in_carrier["temperature"]
                if in_carrier["temperature"] < out_carrier["temperature"]
                else out_carrier["temperature"]
            )
            temperature_supply_id = (
                in_carrier["id_number_mapping"]
                if in_carrier["temperature"] > out_carrier["temperature"]
                else out_carrier["id_number_mapping"]
            )
            temperature_return_id = (
                in_carrier["id_number_mapping"]
                if in_carrier["temperature"] < out_carrier["temperature"]
                else out_carrier["id_number_mapping"]
            )

            modifiers = {
                "T_supply": supply_temperature,
                "T_return": return_temperature,
                "T_supply_id": temperature_supply_id,
                "T_return_id": temperature_return_id,
            }
        return modifiers

    def _supply_return_temperature_modifiers(self, asset: Asset) -> MODIFIERS:
        """
        This function returns a dict containing all relevant temperatures associated with the asset
        needed for the optimization. These are the temperatures of the carrier at the inport and
        outport.

        Parameters
        ----------
        asset : Asset object to retrieve carrier temperatures from.

        Returns
        -------
        dict with all the temperatures.
        """

        if len(asset.in_ports) <= 2 and len(asset.out_ports) == 1:
            modifiers = self._get_supply_return_temperatures(asset)
            return modifiers
        elif len(asset.in_ports) >= 2 and len(asset.out_ports) == 2:
            prim_return_temperature = None
            sec_return_temperature = None
            for p in asset.in_ports:
                if isinstance(p.carrier, esdl.HeatCommodity):
                    carrier = asset.global_properties["carriers"][p.carrier.id]
                    if self.secondary_port_name_convention in p.name.lower():
                        sec_return_temperature_id = carrier["id_number_mapping"]
                        sec_return_temperature = carrier["temperature"]
                    else:
                        prim_supply_temperature = carrier["temperature"]
                        prim_supply_temperature_id = carrier["id_number_mapping"]
            for p in asset.out_ports:
                if isinstance(p.carrier, esdl.HeatCommodity):
                    carrier = asset.global_properties["carriers"][p.carrier.id]
                    if self.primary_port_name_convention in p.name.lower():
                        prim_return_temperature_id = carrier["id_number_mapping"]
                        prim_return_temperature = carrier["temperature"]
                    else:
                        sec_supply_temperature_id = carrier["id_number_mapping"]
                        sec_supply_temperature = carrier["temperature"]
            if not prim_return_temperature or not sec_return_temperature:
                raise RuntimeError(
                    f"{asset.name} ports are not specified correctly there should be dedicated "
                    f"primary and secondary ports ('prim' and 'sec') for the hydraulically "
                    f"decoupled networks"
                )
            assert sec_supply_temperature >= sec_return_temperature
            assert sec_return_temperature > 0.0
            assert prim_supply_temperature >= prim_return_temperature
            assert prim_return_temperature > 0.0

            if (
                sec_supply_temperature == sec_return_temperature
                or prim_return_temperature == prim_supply_temperature
            ):
                asset_id = asset.id
                get_potential_errors().add_potential_issue(
                    MesidoAssetIssueType.HEAT_EXCHANGER_TEMPERATURES,
                    asset_id,
                    f"Asset named {asset.name}: The temperature on the primary side "
                    f"supply side is {prim_supply_temperature} and on the return side is "
                    f"{prim_return_temperature} and on the secondary side the supply temperature "
                    f"is {sec_supply_temperature} and return temperature is "
                    f"{sec_return_temperature}. This would result in a bypass of the "
                    f"heatexchanger.",
                )

            temperatures = {
                "Primary": {
                    "T_supply": prim_supply_temperature,
                    "T_return": prim_return_temperature,
                    "T_supply_id": prim_supply_temperature_id,
                    "T_return_id": prim_return_temperature_id,
                },
                "Secondary": {
                    "T_supply": sec_supply_temperature,
                    "T_return": sec_return_temperature,
                    "T_supply_id": sec_supply_temperature_id,
                    "T_return_id": sec_return_temperature_id,
                },
            }
            return temperatures
        else:
            # unknown model type
            return {}

    @staticmethod
    def get_state(asset: Asset) -> float:
        """
        This function returns a float value, which represents the state (Enabled/disabled/optional)
        of an asset, so that it can be stored in the parameters.

        Parameters
        ----------
        asset : The asset object for retrieving the state

        Returns
        -------
        float value representing the asset's state
        """

        if asset.attributes["state"].name == "DISABLED":
            value = 0.0
        elif asset.attributes["state"].name == "OPTIONAL":
            value = 2.0
        else:
            value = 1.0
        return value

    def get_variable_opex_costs(self, asset: Asset) -> float:
        """
        Returns the variable opex costs coefficient of an asset in Euros per Wh.

        Parameters
        ----------
        asset : Asset object to get the cost information from

        Returns
        -------
        float for the variable operational cost coefficient.
        """

        cost_infos = dict()
        cost_infos["variableOperationalAndMaintenanceCosts"] = asset.attributes[
            "costInformation"
        ].variableOperationalAndMaintenanceCosts
        cost_infos["variableOperationalCosts"] = asset.attributes[
            "costInformation"
        ].variableOperationalCosts
        cost_infos["variableMaintenanceCosts"] = asset.attributes[
            "costInformation"
        ].variableMaintenanceCosts

        if all(cost_info is None for cost_info in cost_infos.values()):
            logger.warning(f"No variable OPEX cost information specified for asset {asset.name}")

        value = 0.0
        for cost_info in cost_infos.values():
            if cost_info is None:
                continue
            cost_value, unit, per_unit, per_time = self.get_cost_value_and_unit(cost_info)
            if unit != UnitEnum.EURO:
                logger.warning(f"Expected cost information {cost_info} to provide a cost in euros.")
                continue
            if per_time != TimeUnitEnum.NONE:
                logger.warning(
                    f"Specified OPEX for asset {asset.name} include a "
                    f"component per time, which we cannot handle."
                )
                continue
            if per_unit != UnitEnum.WATTHOUR and asset.asset_type not in [
                "GasDemand",
                "GasProducer",
                "GasStorage",
                "Electrolyzer",
            ]:
                logger.warning(
                    f"Expected the specified OPEX for asset "
                    f"{asset.name} to be per Wh, but they are provided "
                    f"in {per_unit} instead."
                )
                continue
            if (
                asset.asset_type in ["GasDemand", "GasProducer", "GasStorage", "Electrolyzer"]
                and per_unit != UnitEnum.GRAM
            ):
                logger.warning(
                    f"Expected the specified OPEX for asset "
                    f"{asset.name} to be per g/s, but they are provided "
                    f"in {per_unit}/{per_time} instead."
                )
                continue

            value += cost_value

        return value

    def get_fixed_opex_costs(self, asset: Asset) -> float:
        """
        Returns the fixed opex cost coefficient of an asset in Euros per W.

        Parameters
        ----------
        asset : Asset object to retrieve cost information from

        Returns
        -------
        fixed operational cost coefficient.
        """
        cost_infos = dict()
        cost_infos["fixedOperationalAndMaintenanceCosts"] = asset.attributes[
            "costInformation"
        ].fixedOperationalAndMaintenanceCosts
        cost_infos["fixedOperationalCosts"] = asset.attributes[
            "costInformation"
        ].fixedOperationalCosts
        cost_infos["fixedMaintenanceCosts"] = asset.attributes[
            "costInformation"
        ].fixedMaintenanceCosts

        if all(cost_info is None for cost_info in cost_infos.values()):
            logger.warning(f"No fixed OPEX cost information specified for asset {asset.name}")
            value = 0.0
        else:
            value = 0.0
            for cost_info in cost_infos.values():
                if cost_info is None:
                    continue
                cost_value, unit, per_unit, per_time = self.get_cost_value_and_unit(cost_info)
                if unit != UnitEnum.EURO:
                    RuntimeWarning(
                        f"Expected cost information {cost_info} to " f"provide a cost in euros."
                    )
                    continue
                if per_unit == UnitEnum.CUBIC_METRE and asset.asset_type != "GasStorage":
                    # index is 0 because buffers only have one in out port
                    supply_temp = asset.global_properties["carriers"][asset.in_ports[0].carrier.id][
                        "temperature"
                    ]
                    return_temp = asset.global_properties["carriers"][
                        asset.out_ports[0].carrier.id
                    ]["temperature"]
                    delta_temp = supply_temp - return_temp
                    m3_to_joule_factor = delta_temp * HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS
                    cost_value = cost_value / m3_to_joule_factor
                elif per_unit == UnitEnum.NONE:
                    if asset.asset_type == "HeatStorage":
                        size = asset.attributes["capacity"]
                        if size == 0.0:
                            # index is 0 because buffers only have one in out port
                            supply_temp = asset.global_properties["carriers"][
                                asset.in_ports[0].carrier.id
                            ]["temperature"]
                            return_temp = asset.global_properties["carriers"][
                                asset.out_ports[0].carrier.id
                            ]["temperature"]
                            delta_temp = supply_temp - return_temp
                            m3_to_joule_factor = (
                                delta_temp * HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS
                            )
                            size = asset.attributes["volume"] * m3_to_joule_factor
                            if size == 0.0:
                                RuntimeWarning(f"{asset.name} has not capacity or volume set")
                                return 0.0
                    elif asset.asset_type == "ATES":
                        size = asset.attributes["maxChargeRate"]
                        if size == 0.0:
                            size = asset.attributes["capacity"] / (
                                365 * 24 * 3600 / 2
                            )  # only half a year it can load
                            if size == 0.0:
                                RuntimeWarning(
                                    f"{asset.name} has not capacity or maximum charge rate set"
                                )
                                return 0.0
                    else:
                        try:
                            size = asset.attributes["power"]
                            if size == 0.0:
                                continue
                        except KeyError:
                            return 0.0
                    cost_value = cost_value / size
                elif per_unit != UnitEnum.WATT and asset.asset_type != "GasStorage":
                    RuntimeWarning(
                        f"Expected the specified OPEX for asset "
                        f"{asset.name} to be per W or m3, but they are provided "
                        f"in {per_unit} instead."
                    )
                    continue
                # still to decide if the cost is per kg or per m3
                elif per_unit != UnitEnum.GRAM and asset.asset_type == "GasStorage":
                    RuntimeWarning(
                        f"Expected the specified OPEX for asset "
                        f"{asset.name} to be per GRAM, but they are provided "
                        f"in {per_unit} instead."
                    )
                    continue

                value += cost_value
        return value

    @staticmethod
    def get_cost_value_and_unit(cost_info: esdl.SingleValue) -> Tuple[float, Any, Any, Any]:
        """
        This function returns the cost coefficient with unit information thereof.

        Parameters
        ----------
        cost_info : The single value object with the float and unit info.

        Returns
        -------
        The value with the unit decomposed.
        """

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

    def get_installation_costs(self, asset: Asset) -> float:
        """
        This function return the installation cost coefficient in EUR for a single aggregation
        count.

        Parameters
        ----------
        asset : The asset object for retrieving the cost information from.

        Returns
        -------
        A float with the installation cost coefficient.
        """

        cost_info = asset.attributes["costInformation"].installationCosts
        if cost_info is None:
            logger.warning(f"No installation cost info provided for asset " f"{asset.name}.")
            return 0.0
        cost_value, unit, per_unit, per_time = self.get_cost_value_and_unit(cost_info)
        if unit != UnitEnum.EURO:
            logger.warning(f"Expect cost information {cost_info} to " f"provide a cost in euros")
            return 0.0
        if not per_time == TimeUnitEnum.NONE:
            logger.warning(
                f"Specified installation costs of asset {asset.name}"
                f" include a component per time, which we "
                f"cannot handle."
            )
            return 0.0
        if not per_unit == UnitEnum.NONE:
            logger.warning(
                f"Specified installation costs of asset {asset.name}"
                f" include a component per unit {per_unit}, which we "
                f"cannot handle."
            )
            return 0.0
        return cost_value

    def get_investment_costs(self, asset: Asset, per_unit: UnitEnum = UnitEnum.WATT) -> float:
        """
        Returns the investment cost coefficient of an asset in Euros per size unit (mostly W).

        Parameters
        ----------
        asset : The asset object to retrieve the cost information from.
        per_unit : The per unit needed in the optimization, as this may differ for some assets
        like the buffer where it scales with volume instead of power.

        Returns
        -------
        float for the investment cost coefficient.
        """

        cost_info = asset.attributes["costInformation"].investmentCosts
        if cost_info is None:
            RuntimeWarning(f"No investment costs provided for asset " f"{asset.name}.")
            return 0.0
        (
            cost_value,
            unit_provided,
            per_unit_provided,
            per_time_provided,
        ) = self.get_cost_value_and_unit(cost_info)
        if unit_provided != UnitEnum.EURO:
            logger.warning(f"Expect cost information {cost_info} to " f"provide a cost in euros")
            return 0.0
        if not per_time_provided == TimeUnitEnum.NONE:
            logger.warning(
                f"Specified investment costs for asset {asset.name}"
                f" include a component per time, which we "
                f"cannot handle."
            )
            return 0.0
        if per_unit == UnitEnum.WATT:
            if not per_unit_provided == UnitEnum.WATT:
                logger.warning(
                    f"Expected the specified investment costs "
                    f"of asset {asset.name} to be per W, but they "
                    f"are provided in {per_unit_provided} "
                    f"instead."
                )
            return cost_value
        elif per_unit == UnitEnum.WATTHOUR:
            if not per_unit_provided == UnitEnum.WATTHOUR:
                logger.warning(
                    f"Expected the specified investment costs "
                    f"of asset {asset.name} to be per Wh, but they "
                    f"are provided in {per_unit_provided} "
                    f"instead."
                )
                return 0.0
            return cost_value
        elif per_unit == UnitEnum.METRE:
            if not per_unit_provided == UnitEnum.METRE:
                logger.warning(
                    f"Expected the specified investment costs "
                    f"of asset {asset.name} to be per meter, but they "
                    f"are provided in {per_unit_provided} "
                    f"instead."
                )
                return 0.0
            return cost_value
        elif per_unit == UnitEnum.JOULE:
            if per_unit_provided == UnitEnum.WATTHOUR:
                return cost_value / WATTHOUR_TO_JOULE
            elif per_unit_provided == UnitEnum.CUBIC_METRE:
                # index is 0 because buffers only have one in out port
                supply_temp = asset.global_properties["carriers"][asset.in_ports[0].carrier.id][
                    "temperature"
                ]
                return_temp = asset.global_properties["carriers"][asset.out_ports[0].carrier.id][
                    "temperature"
                ]
                delta_temp = supply_temp - return_temp
                m3_to_joule_factor = delta_temp * HEAT_STORAGE_M3_WATER_PER_DEGREE_CELCIUS
                return cost_value / m3_to_joule_factor
            else:
                logger.warning(
                    f"Expected the specified investment costs "
                    f"of asset {asset.name} to be per Wh or m3, but "
                    f"they are provided in {per_unit_provided} "
                    f"instead."
                )
                return 0.0
        else:
            logger.warning(
                f"Cannot provide investment costs for asset " f"{asset.name} per {per_unit}"
            )
            return 0.0
