import base64
from pathlib import Path
from typing import Dict, Optional

import esdl.esdl_handler

from mesido.esdl.common import Asset


class _ESDLInputException(Exception):
    pass


class BaseESDLParser:
    def __init__(self):
        self._global_properties: Dict[str, Dict] = {
            "carriers": dict(),
        }
        self._assets: Dict[str, Asset] = dict()
        self._energy_system_handler: esdl.esdl_handler.EnergySystemHandler = (
            esdl.esdl_handler.EnergySystemHandler()
        )
        self._energy_system: Optional[esdl.EnergySystem] = None
        self._esdl_string: Optional[str] = None
        self._esdl_path: Optional[Path] = None

    def _load_esdl_model(self) -> None:
        """
        This function should be implemented by the child. The function doesn't return anything but
        should set the _esdl_model property.
        """
        raise NotImplementedError

    def read_esdl(self) -> None:
        self._load_esdl_model()
        id_to_idnumber_map = {}

        for x in self._energy_system.energySystemInformation.carriers.carrier.items:
            if isinstance(x, esdl.esdl.HeatCommodity):
                if x.id not in id_to_idnumber_map:
                    number_list = [int(s) for s in x.id if s.isdigit()]
                    number = ""
                    for nr in number_list:
                        number = number + str(nr)
                    # note this fix is to create a unique number for the map for when the pipe
                    # duplicator service is used and an additional _ret is added to the id.
                    if "_ret" in x.id:
                        number = number + "000"
                    id_to_idnumber_map[x.id] = int(number)

                temperature = x.supplyTemperature if x.supplyTemperature else x.returnTemperature
                assert temperature > 0.0

                self._global_properties["carriers"][x.id] = dict(
                    name=x.name,
                    id=x.id,
                    id_number_mapping=id_to_idnumber_map[x.id],
                    temperature=temperature,
                    type="milp",
                )
            elif isinstance(x, esdl.esdl.ElectricityCommodity):
                if x.id not in id_to_idnumber_map:
                    number_list = [int(s) for s in x.id if s.isdigit()]
                    number = ""
                    for nr in number_list:
                        number = number + str(nr)
                    id_to_idnumber_map[x.id] = int(number)
                self._global_properties["carriers"][x.id] = dict(
                    name=x.name,
                    voltage=x.voltage,
                    id=x.id,
                    type="electricity",
                    id_number_mapping=id_to_idnumber_map[x.id],
                )
            elif isinstance(x, esdl.esdl.GasCommodity):
                if x.id not in id_to_idnumber_map:
                    number_list = [int(s) for s in x.id if s.isdigit()]
                    number = ""
                    for nr in number_list:
                        number = number + str(nr)
                    id_to_idnumber_map[x.id] = int(number)
                self._global_properties["carriers"][x.id] = dict(
                    name=x.name,
                    pressure=x.pressure,
                    id=x.id,
                    type="gas",
                    id_number_mapping=id_to_idnumber_map[x.id],
                )

        # Component ids are unique, but we require component names to be unique as well.
        component_names = set()

        # loop through assets
        for el in self._energy_system.eAllContents():
            if isinstance(el, esdl.Asset):
                if hasattr(el, "name") and el.name:
                    el_name = el.name
                else:
                    el_name = el.id

                if "." in el_name:
                    # Dots indicate hierarchy, so would be very confusing
                    raise ValueError(f"Dots in component names not supported: '{el_name}'")

                if el_name in component_names:
                    raise Exception(f"Asset names have to be unique: '{el_name}' already exists")
                else:
                    component_names.add(el_name)

                # For some reason `esdl_element.assetType` is `None`, so use the class name
                asset_type = el.__class__.__name__

                # Every asset should at least have a port to be connected to another asset
                assert len(el.port) >= 1

                in_ports = None
                out_ports = None
                for port in el.port:
                    if isinstance(port, esdl.InPort):
                        if in_ports is None:
                            in_ports = [port]
                        else:
                            in_ports.append(port)
                    elif isinstance(port, esdl.OutPort):
                        if out_ports is None:
                            out_ports = [port]
                        else:
                            out_ports.append(port)
                    else:
                        _ESDLInputException(f"The port for {el_name} is neither an IN or OUT port")

                # Note that e.g. el.__dict__['length'] does not work to get the length of a pipe.
                # We therefore built this dict ourselves using 'dir' and 'getattr'
                attributes = {k: getattr(el, k) for k in dir(el)}
                self._assets[el.id] = Asset(
                    asset_type,
                    el.id,
                    el_name,
                    in_ports,
                    out_ports,
                    attributes,
                    self._global_properties,
                )

    def get_assets(self) -> Dict[str, Asset]:
        return self._assets

    def get_carrier_properties(self) -> Dict:
        return self._global_properties["carriers"]

    def get_esh(self) -> esdl.esdl_handler.EnergySystemHandler:
        return self._energy_system_handler


class ESDLStringParser(BaseESDLParser):
    def __init__(self, **kwargs):
        super().__init__()
        try:
            esdl_string = kwargs.get("esdl_string")
        except KeyError:
            raise _ESDLInputException(
                "Expected an ESDL string when parsing the system from a "
                "string, but none provided"
            )
        if isinstance(esdl_string, bytes):
            self._esdl_string = base64.b64decode(esdl_string).decode("utf-8")
        else:
            self._esdl_string = esdl_string

    def _load_esdl_model(self) -> None:
        self._energy_system = self._energy_system_handler.load_from_string(self._esdl_string)


class ESDLFileParser(BaseESDLParser):
    def __init__(self, **kwargs):
        super().__init__()
        try:
            esdl_path = kwargs.get("esdl_path")
        except KeyError:
            raise _ESDLInputException(
                "Expected an ESDL path when parsing the system from a file but none provided"
            )
        self._esdl_path = esdl_path

    def _load_esdl_model(self) -> None:
        self._energy_system = self._energy_system_handler.load_file(str(self._esdl_path))
