import base64
import copy
import dataclasses
import logging
import os
import sys
from datetime import timedelta
from pathlib import Path
from typing import Any, Dict, List, Optional, Tuple

import esdl.esdl_handler

from mesido.component_type_mixin import (
    ModelicaComponentTypeMixin,
)
from mesido.esdl.asset_to_component_base import _AssetToComponentBase
from mesido.esdl.common import Asset
from mesido.esdl.edr_pipe_class import EDRGasPipeClass, EDRPipeClass
from mesido.esdl.esdl_heat_model import ESDLHeatModel
from mesido.esdl.esdl_model_base import _ESDLModelBase
from mesido.esdl.esdl_parser import ESDLStringParser
from mesido.esdl.esdl_qth_model import ESDLQTHModel
from mesido.esdl.profile_parser import BaseProfileReader, InfluxDBProfileReader
from mesido.physics_mixin import PhysicsMixin
from mesido.pipe_class import GasPipeClass, PipeClass
from mesido.pycml.pycml_mixin import PyCMLMixin
from mesido.qth_not_maintained.qth_mixin import QTHMixin

import numpy as np

from pyecore.valuecontainer import EOrderedSet

import rtctools.data.pi as pi
from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.io_mixin import IOMixin

from strenum import StrEnum

logger = logging.getLogger("mesido")


ns = {"fews": "http://www.wldelft.nl/fews", "pi": "http://www.wldelft.nl/fews/PI"}
DEFAULT_START_TIMESTAMP = "2017-01-01T00:00:00+00:00"
DEFAULT_END_TIMESTAMP = "2018-01-01T00:00:00+00:00"


class DBAccesType(StrEnum):
    """
    Enumeration for database access types
    """

    READ = "read"
    WRITE = "write"
    READ_WRITE = "read_write"


class _ESDLInputException(Exception):
    pass


class ESDLMixin(
    ModelicaComponentTypeMixin,
    IOMixin,
    PyCMLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    This class is used to be able to parse an ESDL file and utilize the definition of the energy
    system in that file. Furthermore, it contains functionality to extract profiles specified like
    for example demand profiles.
    """

    esdl_run_info_path: Path = None

    esdl_pi_validate_timeseries: bool = False

    __max_supply_temperature: Optional[float] = None

    # TODO: remove this once ESDL allows specifying a minimum pipe size for an optional pipe.
    __minimum_pipe_size_name: str = "DN150"

    def __init__(self, *args, **kwargs) -> None:
        """
        In this __init__ function we do the parsing of the esdl file based on either a string which
        is provided or read it in from a provided file name.

        We put the assets, profiles and carriers in attributes of the class to later instantiate
        the PyCML objects and write the desired time-series.

        We set file locations for the input files and for the diagnostic file.

        We create a dict with all possible pipe classes for the optional pipes to later add them
        to the optimization problem. Additionally, we change the investment cost figures if an
        asset pipe template is provided. This is done in this Mixin as we here use the information
        of the EDR database which is linked to ESDL and the Mapeditor.

        Parameters
        ----------
        args : none
        kwargs : esdl_string or esdl_file_name must be provided
        """

        self.esdl_parser_class: type = kwargs.get("esdl_parser", ESDLStringParser)
        esdl_string = kwargs.get("esdl_string", None)
        model_folder = kwargs.get("model_folder")
        esdl_file_name = kwargs.get("esdl_file_name", None)
        esdl_path = None
        if esdl_file_name is not None:
            esdl_path = Path(model_folder) / esdl_file_name

        # TODO: discuss if this is correctly located here and why the reading of profiles is then
        #  in the read function?
        esdl_parser = self.esdl_parser_class(esdl_string=esdl_string, esdl_path=esdl_path)
        esdl_parser.read_esdl()
        self._esdl_assets: Dict[str, Asset] = esdl_parser.get_assets()
        self._esdl_carriers: Dict[str, Dict[str, Any]] = esdl_parser.get_carrier_properties()
        self.__energy_system_handler: esdl.esdl_handler.EnergySystemHandler = esdl_parser.get_esh()
        self._esdl_measures: Dict[str, Asset] = esdl_parser.get_measures()
        self._database_credentials: Optional[Dict[str, Tuple[str, str]]] = {
            DBAccesType.READ: [],
            DBAccesType.WRITE: [],
        }

        profile_reader_class = kwargs.get("profile_reader", InfluxDBProfileReader)
        input_file_name = kwargs.get("input_timeseries_file", None)
        input_folder = kwargs.get("input_folder")
        input_file_path = None

        # Setup credentials for database connections
        database_connection_info = kwargs.get("database_connections", {})
        read_only_dbase_credentials: Dict[str, Tuple[str, str]] = {}  # for profile reader
        for dbconnection in database_connection_info:
            if dbconnection["access_type"] != DBAccesType.WRITE:
                database_host_port = "{}:{}".format(
                    dbconnection["influxdb_host"],
                    dbconnection["influxdb_port"],
                )
                read_only_dbase_credentials[database_host_port] = (
                    dbconnection["influxdb_username"],
                    dbconnection["influxdb_password"],
                )
            if dbconnection["access_type"] != DBAccesType.READ_WRITE:
                self._database_credentials[dbconnection["access_type"]].append(
                    {
                        "influxdb_host": dbconnection["influxdb_host"],
                        "influxdb_port": dbconnection["influxdb_port"],
                        "influxdb_username": dbconnection["influxdb_username"],
                        "influxdb_password": dbconnection["influxdb_password"],
                        "influxdb_ssl": dbconnection["influxdb_ssl"],
                        "influxdb_verify_ssl": dbconnection["influxdb_verify_ssl"],
                    }
                )
            elif dbconnection["access_type"] == DBAccesType.READ_WRITE:
                both_read_and_write = [DBAccesType.READ, DBAccesType.WRITE]
                for rw in both_read_and_write:
                    self._database_credentials[rw].append(
                        {
                            "influxdb_host": dbconnection["influxdb_host"],
                            "influxdb_port": dbconnection["influxdb_port"],
                            "influxdb_username": dbconnection["influxdb_username"],
                            "influxdb_password": dbconnection["influxdb_password"],
                            "influxdb_ssl": dbconnection["influxdb_ssl"],
                            "influxdb_verify_ssl": dbconnection["influxdb_verify_ssl"],
                        }
                    )
            else:
                logger.error(
                    f"Database access type {dbconnection['access_type']} is not recognized. "
                    f"Please use DBAccesType.READ, DBAccesType.WRITE or DBAccesType.READ_WRITE."
                )
                sys.exit(1)

        if input_file_name is not None:
            input_file_path = Path(input_folder) / input_file_name

        if read_only_dbase_credentials:  # read from database
            self.__profile_reader: BaseProfileReader = profile_reader_class(
                energy_system=self.__energy_system_handler.energy_system,
                file_path=input_file_path,
                database_credentials=read_only_dbase_credentials,
            )
        else:  # read from a file, no database credentials needed
            self.__profile_reader: BaseProfileReader = profile_reader_class(
                energy_system=self.__energy_system_handler.energy_system,
                file_path=input_file_path,
            )

        # This way we allow users to adjust the parsed ESDL assets
        assets = self.esdl_assets

        # Although we work with the names, the FEWS import data uses the component IDs
        self.__timeseries_id_map = {a.id: a.name for a in assets.values()}
        name_to_id_map = {a.name: a.id for a in assets.values()}

        if isinstance(self, PhysicsMixin):
            self.__model = ESDLHeatModel(assets, name_to_id_map, **self.esdl_heat_model_options())
        else:
            assert isinstance(self, QTHMixin)

            # Maximum supply temperature is very network dependent, so it is
            # hard to choose a default. Therefore, we look at the global
            # properties instead and add 10 degrees on top.
            global_supply_temperatures = [
                c["temperature"]
                for a in assets.values()
                for c in a.global_properties["carriers"].values()
            ]
            max_global_supply = max(x for x in global_supply_temperatures if np.isfinite(x))

            attribute_temperatures = [
                a.attributes.get("maxTemperature", -np.inf) for a in assets.values()
            ]
            max_attribute = max(x for x in attribute_temperatures if np.isfinite(x))

            self.__max_supply_temperature = max(max_global_supply, max_attribute) + 10.0

            self.__model = ESDLQTHModel(assets, **self.esdl_qth_model_options())

        self._override_pipe_classes = dict()
        self.override_pipe_classes()
        self._override_gas_pipe_classes = dict()
        self.override_gas_pipe_classes()

        self.name_to_esdl_id_map = dict()

        self.__hot_cold_pipe_relations = dict()
        self.__unrelated_pipes = list()

        super().__init__(*args, **kwargs)

    @property
    def esdl_bytes_string(self) -> bytes:
        """
        Returns a bytes string representation of the ESDL model used.
        """
        return base64.b64encode(self.__energy_system_handler.to_string().encode("utf-8"))

    def pre(self) -> None:
        """
        In this pre method we create a dict with a mapping between the esdl id and the name. We
        also check that every asset has an unique name, which is needed for us to create unique
        variable names.

        Returns
        -------
        None
        """
        super().pre()
        for esdl_id, esdl_asset in self.esdl_assets.items():
            if esdl_asset.name in self.name_to_esdl_id_map:
                raise RuntimeWarning(
                    f"Found multiple ESDL assets with name {esdl_asset.name} in the "
                    f"input ESDL. This is not supported in the optimization."
                )
            self.name_to_esdl_id_map[esdl_asset.name] = esdl_id

    def __override_pipe_classes_dicts(
        self,
        asset: Asset,
        pipe_classes: List[EDRPipeClass],
        no_pipe_class: PipeClass,
        override_classes: dict,
    ) -> None:
        """
        Overrides the pipe class dictionaries based on the minimum pipe sizes that are required.
        """

        p = asset.name

        if asset.attributes["state"].name == "OPTIONAL":
            c = override_classes[p] = []
            c.append(no_pipe_class)

            min_size = self.__minimum_pipe_size_name
            min_size_idx = [idx for idx, pipe in enumerate(pipe_classes) if pipe.name == min_size]
            assert len(min_size_idx) == 1
            min_size_idx = min_size_idx[0]

            max_size = asset.attributes["diameter"].name

            max_size_idx = [idx for idx, pipe in enumerate(pipe_classes) if pipe.name == max_size]
            assert len(max_size_idx) == 1
            max_size_idx = max_size_idx[0]

            if max_size_idx < min_size_idx:
                logger.warning(
                    f"{p} has an upper DN size smaller than the used minimum size "
                    f"of {self.__minimum_pipe_size_name}, choose at least "
                    f"{self.__minimum_pipe_size_name}"
                )
            elif min_size_idx == max_size_idx:
                c.append(pipe_classes[min_size_idx])
            else:
                c.extend(pipe_classes[min_size_idx : max_size_idx + 1])
        elif asset.attributes["state"].name == "DISABLED":
            c = override_classes[p] = []
            c.append(no_pipe_class)

    def override_pipe_classes(self) -> None:
        """
        In this method we populate the _override_pipe_classes dict, which gives a list of possible
        pipe classes for every pipe. We do this only when a pipe has the state OPTIONAL. We use the
        EDR pipe classes. We assume that it is possible to remove a pipe PipeClass None, but also
        that there is a minimum layed pipe size of DN150 to limit the search space. This seems
        reasonable as we focus upon regional and primary networks.

        Returns
        -------
        None
        """
        maximum_velocity = self.heat_network_settings["maximum_velocity"]

        no_pipe_class = PipeClass("None", 0.0, 0.0, (0.0, 0.0), 0.0)
        pipe_classes = [
            EDRPipeClass.from_edr_class(name, edr_class_name, maximum_velocity)
            for name, edr_class_name in _AssetToComponentBase.STEEL_S1_PIPE_EDR_ASSETS.items()
        ]

        override_classes = self._override_pipe_classes

        # Update the pipe costs if a measure model in the ESDL was used. This is updated only if
        # the pipe catalog is available as a measure
        if self._esdl_measures:
            filter_type = "Pipe"
            pipe_measures = self.filter_asset_measures(
                asset_measures=self._esdl_measures, filter_type=filter_type
            )
            if len(pipe_measures.items()) > 0:
                pipe_diameter_cost_map = {
                    str(pipe.diameter): pipe.costInformation.investmentCosts.value
                    for pipe in pipe_measures.values()
                }

                for i, pipe_class in enumerate(pipe_classes):
                    if pipe_class.name in pipe_diameter_cost_map.keys():
                        pipe_classes[i] = dataclasses.replace(
                            pipe_classes[i],
                            investment_costs=pipe_diameter_cost_map[pipe_class.name],
                        )
                    else:
                        del pipe_classes[i]

        # We assert the pipe classes are monotonically increasing in size
        assert np.all(np.diff([pc.inner_diameter for pc in pipe_classes]) > 0)

        for asset in self.esdl_assets.values():
            if asset.asset_type == "Pipe" and isinstance(
                asset.in_ports[0].carrier, esdl.HeatCommodity
            ):
                self.__override_pipe_classes_dicts(
                    asset, pipe_classes, no_pipe_class, override_classes
                )

    def override_gas_pipe_classes(self) -> None:
        """
        In this method we populate the _override_gas_pipe_classes dict, which gives a list of
        possible pipe classes for every pipe. We do this only when a pipe has the state OPTIONAL.
        We use the EDR pipe classes. We assume that it is possible to remove a pipe PipeClass None,
        but also that there is a minimum layed pipe size of DN150 to limit the search space. This
        seems reasonable as we focus upon regional and primary networks.

        Returns
        -------
        None
        """
        maximum_velocity = self.gas_network_settings["maximum_velocity"]

        no_pipe_class = GasPipeClass("None", 0.0, 0.0, 0.0)
        pipe_classes = [
            EDRGasPipeClass.from_edr_class(name, edr_class_name, maximum_velocity)
            for name, edr_class_name in _AssetToComponentBase.STEEL_S1_PIPE_EDR_ASSETS.items()
        ]

        # We assert the pipe classes are monotonically increasing in size
        assert np.all(np.diff([pc.inner_diameter for pc in pipe_classes]) > 0)

        override_classes = self._override_gas_pipe_classes

        for asset in self.esdl_assets.values():
            if asset.asset_type == "Pipe" and isinstance(
                asset.in_ports[0].carrier, esdl.GasCommodity
            ):
                self.__override_pipe_classes_dicts(
                    asset, pipe_classes, no_pipe_class, override_classes
                )

    @property
    def esdl_assets(self) -> Dict[str, Asset]:
        """
        property method to retrieve the esdl assets which are a private attribute of the class.

        Returns
        -------
        A dict of the esdl assets with their properties
        """
        return self._esdl_assets

    @property
    def esdl_carriers(self, type=None) -> Dict[str, Dict[str, Any]]:
        """
        property method to retrieve the esdl carriers which are a private attribute of the class.

        Returns
        -------
        A dict with the id of the carrier and the attributes in the value
        """

        return self._esdl_carriers

    def esdl_carriers_typed(self, type=None) -> Dict[str, Dict[str, Any]]:
        """
        property method to retrieve the esdl carriers which are a private attribute of the class.

        Returns
        -------
        A dict with the id of the carrier and the attributes in the value
        """
        if type is None:
            return self._esdl_carriers
        else:
            carriers = {}
            for id, attr in self._esdl_carriers.items():
                if attr["type"] in type:
                    carriers[id] = attr
        return carriers

    def get_energy_system_copy(self) -> esdl.esdl.EnergySystem:
        """
        Method to get a copy of the energy system loaded that can be edited without touching the
        original

        Returns
        -------
        A copy of the energy system loaded
        """
        return copy.deepcopy(self.__energy_system_handler.energy_system)

    @staticmethod
    def convert_energy_system_to_string(energy_system: esdl.esdl.EnergySystem) -> str:
        """
        Method to convert a given energy system into a string using a copy of the energy system
        handler that is available within this class

        Returns
        -------
        An XML string representing the energy system
        """

        uri = esdl.esdl_handler.StringURI("to_string.esdl")
        energy_system.eResource.save(uri)
        return uri.getvalue()

    @staticmethod
    def save_energy_system_to_file(energy_system: esdl.esdl.EnergySystem, file_path: Path) -> None:
        """
        Method to save a given energy system to file (using the standard ESDL XML schema, using the
        energy system handler available within this class

        Returns
        -------
        None
        """
        esh = esdl.esdl_handler.EnergySystemHandler(energy_system=energy_system)
        esh.save(filename=str(file_path))

    @property
    def esdl_asset_id_to_name_map(self) -> Dict:
        """
        A map between the id and the name of an asset. Very bad naming of the attribute...

        Returns
        -------
        A dict with the id to name map.
        """
        return self.__timeseries_id_map.copy()

    @property
    def esdl_asset_name_to_id_map(self) -> Dict:
        """
        A map between the name and the id of an asset. Very bad naming of the attribute...

        Returns
        -------
        A dict with the name to id map.
        """
        return dict(zip(self.__timeseries_id_map.values(), self.__timeseries_id_map.keys()))

    def get_asset_from_asset_name(self, asset_name: str) -> esdl.Asset:
        """
        This function returns the esdl asset with its properties based on the name you provide

        Parameters
        ----------
        asset_name : string with the asset name of the esdl asset.

        Returns
        -------
        The esdl asset with its attributes and global properties
        """

        asset_id = self.esdl_asset_name_to_id_map[asset_name]
        return self.esdl_assets[asset_id]

    def esdl_heat_model_options(self) -> Dict:
        """
        function to spedifically return the needed PhysicsMixin options needed for the conversion
        from ESDL to pycml. This case velocities used to set nominals and caps on the milp.

        Returns
        -------
        dict with estimated and maximum velocity, and error type check setting for asset converters
        """
        energy_system_options = self.energy_system_options()
        v_nominal = energy_system_options["estimated_velocity"]
        v_max = self.heat_network_settings["maximum_velocity"]
        v_max_gas = self.gas_network_settings["maximum_velocity"]
        min_fraction_tank_volume = energy_system_options.get("min_fraction_tank_volume", 0.05)

        # Pass error type check setting to asset converter
        error_type_check = getattr(self, "_error_type_check", None)

        return dict(
            v_nominal=v_nominal,
            v_max=v_max,
            v_max_gas=v_max_gas,
            error_type_check=error_type_check,
            min_fraction_tank_volume=min_fraction_tank_volume,
        )

    def esdl_qth_model_options(self) -> Dict:
        """
        function to spedifically return the needed HeatMixin options needed for the conversion
        from ESDL to pycml. This case velocities used to set nominals and caps on the milp.

        Returns
        -------
        dict with estimated and maximum velocity
        """
        heat_network_options = self.energy_system_options()
        kwargs = {}
        kwargs["v_nominal"] = heat_network_options["estimated_velocity"]
        kwargs["v_max"] = self.heat_network_settings["maximum_velocity"]
        if self.__max_supply_temperature is not None:
            kwargs["maximum_temperature"] = self.__max_supply_temperature
        return dict(**kwargs)

    def is_hot_pipe(self, pipe: str) -> bool:
        """
        To check if a pipe is part of the "supply" network.

        Parameters
        ----------
        pipe : string with name of the pipe

        Returns
        -------
        Returns true if the pipe is in the supply network thus not ends with "_ret"
        """
        return pipe in self.hot_to_cold_pipe_map.keys()

    def is_cold_pipe(self, pipe: str) -> bool:
        """
        To check if a pipe is part of the "return" network. Note we only assign to the return
        network if it has a dedicated hot pipe.

        Parameters
        ----------
        pipe : string with name of the pipe

        Returns
        -------
        Returns true if the pipe is in the return network thus ends with "_ret"
        """
        return pipe in self.hot_to_cold_pipe_map.values()

    def hot_to_cold_pipe(self, pipe: str) -> str:
        """
        To get the name of the respective cold pipe. Note hot pipes do not automatically have a
        dedicated return pipe in case of different supply and return topologies and/or temperature
        cascading. This function should only be called if the cold pipe exists.

        Parameters
        ----------
        pipe : string with hot pipe name.

        Returns
        -------
        string with the associated return pipe name.
        """
        return self.hot_to_cold_pipe_map.get(pipe, None)

    def cold_to_hot_pipe(self, pipe: str) -> str:
        """
        To get the name of the respective hot pipe. Note hot pipes do not automatically have a
        dedicated return pipe in case of different supply and return topologies and/or temperature
        cascading.

        Parameters
        ----------
        pipe : string with cold pipe name.

        Returns
        -------
        string with the associated hot pipe name.
        """
        return self.cold_to_hot_pipe_map.get(pipe, None)

    def hot_cold_pipe_relations(self):
        # Backward compatability: ESDL version before v2110 don't have the related attribute
        esdl_version = self.__energy_system_handler.energy_system.esdlVersion
        if esdl_version is not None and esdl_version >= "v2110":
            for asset in self._esdl_assets.values():
                if asset.asset_type == "Pipe":
                    related = False
                    related_asset = asset.attributes.get("related", False)
                    if related_asset:
                        assert (
                            len(related_asset) == 1
                        ), "Pipes can only have related supply/return pipe"
                        related = True
                        if asset.attributes["port"][0].carrier.supplyTemperature:  # hot_pipe
                            if asset.name not in self.__hot_cold_pipe_relations.keys():
                                self.__hot_cold_pipe_relations[asset.name] = related_asset[0].name
                        elif asset.attributes["port"][0].carrier.returnTemperature:  # cold_pipe
                            if related_asset[0].name not in self.__hot_cold_pipe_relations.keys():
                                self.__hot_cold_pipe_relations[related_asset[0].name] = asset.name
                    if not related and asset.name not in self.__unrelated_pipes:
                        self.__unrelated_pipes.append(asset.name)
        else:
            pipes = self.energy_system_components.get("heat_pipe", [])
            for pipe in pipes:
                related = False
                # test if hot_pipe
                if not pipe.endswith("_ret"):
                    cold_pipe = f"{pipe}_ret"
                    if cold_pipe in pipes:
                        related = True
                        if pipe not in self.__hot_cold_pipe_relations.keys():
                            self.__hot_cold_pipe_relations[pipe] = cold_pipe
                elif pipe.endswith("_ret"):
                    hot_pipe = pipe[:-4]
                    if hot_pipe in pipes:
                        related = True
                        if hot_pipe not in self.__hot_cold_pipe_relations.keys():
                            self.__hot_cold_pipe_relations[hot_pipe] = pipe
                if not related and pipe not in self.__unrelated_pipes:
                    self.__unrelated_pipes.append(pipe)

    @property
    def hot_to_cold_pipe_map(self) -> Dict:
        """
        This function return a dictionary of hot pipe names mapped to cold pipe names.
        """
        return self.__hot_cold_pipe_relations

    @property
    def cold_to_hot_pipe_map(self) -> Dict:
        """
        This function return a dictionary of cold pipe names mapped to hot pipe names.
        """
        return dict(
            zip(self.__hot_cold_pipe_relations.values(), self.__hot_cold_pipe_relations.keys())
        )

    @property
    def unrelated_pipes(self) -> List[str]:
        """This function return a list of pipe names of all the pipes that don't have a related
        cold/hot pipe."""
        return self.__unrelated_pipes

    def pycml_model(self) -> _ESDLModelBase:
        """
        Function to get the model description.

        Returns
        -------
        Returns the pycml model object.
        """
        return self.__model

    def read(self) -> None:
        """
        In this read function we read the relevant time-series and write them to the io object for
        later use. We read and write the demand and production profiles. These profiles can either
        be specified in the esdl file referring to an InfluxDB profile, or be specified in a csv
        file in this case we rely on the user to give the csv file in the runinfo.xml.

        Returns
        -------
        None
        """
        super().read()
        ensemble_size = 1
        self.__ensemble = None
        if self.csv_ensemble_mode:
            self.__ensemble = np.genfromtxt(
                os.path.join(self._input_folder, "ensemble.csv"),
                delimiter=",",
                deletechars="",
                dtype=None,
                names=True,
                encoding=None,
            )
            ensemble_size = len(self.__ensemble)

        energy_system_components = self.energy_system_components
        esdl_carriers = self.esdl_carriers
        self.hot_cold_pipe_relations()
        io = self.io
        self.__profile_reader.read_profiles(
            energy_system_components=energy_system_components,
            io=io,
            esdl_asset_id_to_name_map=self.esdl_asset_id_to_name_map,
            esdl_assets=self.esdl_assets,
            carrier_properties=esdl_carriers,
            ensemble_size=ensemble_size,
            ensemble=self.__ensemble,
        )

    def write(self) -> None:
        """
        This function comes from legacy with CF in the WarmingUP time. It was used to write out a
        xml file with in that the timeseries output of some specified types of assets. This method
        works but is no longer maintained.

        Returns
        -------
        None
        """
        super().write()

        if getattr(self, "__output_timeseries_file", None) is None:
            return

        output_timeseries_file = Path(self.__output_timeseries_file)
        assert output_timeseries_file.is_absolute()
        assert output_timeseries_file.suffix == ".xml"

        timeseries_export_basename = output_timeseries_file.stem
        output_folder = output_timeseries_file.parent

        try:
            self.__timeseries_export = pi.Timeseries(
                self.esdl_pi_output_data_config(self.__timeseries_id_map),
                output_folder,
                timeseries_export_basename,
                binary=False,
                pi_validate_times=self.esdl_pi_validate_timeseries,
            )
        except IOError:
            raise Exception(
                "ESDLMixin: {}.xml not found in {}.".format(
                    timeseries_export_basename, output_folder
                )
            )

        # Get time stamps
        times = self.times()
        if len(set(times[1:] - times[:-1])) == 1:
            dt = timedelta(seconds=times[1] - times[0])
        else:
            dt = None

        output_keys = [k for k, v in self.__timeseries_export.items()]

        # Start of write output
        # Write the time range for the export file.
        self.__timeseries_export.times = [
            self.__timeseries_import.times[self.__timeseries_import.forecast_index]
            + timedelta(seconds=s)
            for s in times
        ]

        # Write other time settings
        self.__timeseries_export.forecast_datetime = self.__timeseries_import.forecast_datetime
        self.__timeseries_export.dt = dt
        self.__timeseries_export.timezone = self.__timeseries_import.timezone

        # Write the ensemble properties for the export file.
        if self.ensemble_size > 1:
            self.__timeseries_export.contains_ensemble = True
        self.__timeseries_export.ensemble_size = self.ensemble_size
        self.__timeseries_export.contains_ensemble = self.ensemble_size > 1

        # Start looping over the ensembles for extraction of the output values.
        for ensemble_member in range(self.ensemble_size):
            results = self.extract_results(ensemble_member)

            # For all variables that are output variables the values are
            # extracted from the results.
            for variable in output_keys:
                try:
                    values = results[variable]
                    if len(values) != len(times):
                        values = self.interpolate(
                            times,
                            self.times(variable),
                            values,
                            self.interpolation_method(variable),
                        )
                except KeyError:
                    try:
                        ts = self.get_timeseries(variable, ensemble_member)
                        if len(ts.times) != len(times):
                            values = self.interpolate(times, ts.times, ts.values)
                        else:
                            values = ts.values
                    except KeyError:
                        logger.warning(
                            "ESDLMixin: Output requested for non-existent variable {}. "
                            "Will not be in output file.".format(variable)
                        )
                        continue

                self.__timeseries_export.set(variable, values, ensemble_member=ensemble_member)

        # Write output file to disk
        self.__timeseries_export.write()

    @classmethod
    def filter_asset_measures(
        cls, asset_measures: Dict[str, Asset], filter_type: str
    ) -> Dict[str, Asset]:
        filtered_assets = dict()
        for asset_id, asset in asset_measures.items():

            if isinstance(asset.attributes["asset"], EOrderedSet):
                if len(asset.attributes["asset"]) > 1:
                    logger.warning(
                        f"Multiple assets types have been linked to asset measure {asset.name}."
                        f"Only the first asset type {filter_type} is currently used."
                    )
                for asset_type in asset.attributes["asset"]:
                    if isinstance(asset_type, getattr(esdl, filter_type)):
                        break
            else:
                asset_type = asset.attributes["asset"]
            if isinstance(asset_type, getattr(esdl, filter_type)):
                filtered_assets[asset_id] = asset_type

        return filtered_assets

    def ensemble_member_probability(self, ensemble_member):
        if self.csv_ensemble_mode:
            return self.__ensemble["probability"][ensemble_member]
        else:
            return 1.0
