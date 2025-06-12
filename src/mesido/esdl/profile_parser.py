import datetime
import logging
import sys
from collections import defaultdict
from pathlib import Path
from typing import Dict, Optional, Set

import esdl
from esdl.profiles.influxdbprofilemanager import ConnectionSettings
from esdl.profiles.influxdbprofilemanager import InfluxDBProfileManager
from esdl.units.conversion import ENERGY_IN_J, POWER_IN_W, convert_to_unit

from mesido.esdl.common import Asset
from mesido.potential_errors import MesidoAssetIssueType, get_potential_errors

import numpy as np

import pandas as pd

import rtctools.data.pi
from rtctools.data.storage import DataStore


logger = logging.getLogger()

influx_cred_map = {"wu-profiles.esdl-beta.hesi.energy:443": ("warmingup", "warmingup")}


class _ProfileParserException(Exception):
    pass


class BaseProfileReader:
    component_type_to_var_name_map: dict = {
        "cold_demand": ".target_cold_demand",
        "heat_demand": ".target_heat_demand",
        "heat_source": ".maximum_heat_source",
        "electricity_demand": ".target_electricity_demand",
        "electricity_source": ".maximum_electricity_source",
        "gas_demand": ".target_gas_demand",
        "gas_source": ".maximum_gas_source",
    }

    carrier_profile_var_name: str = ".price_profile"

    def __init__(self, energy_system: esdl.EnergySystem, file_path: Optional[Path]):
        self._profiles: Dict[int, Dict[str, np.ndarray]] = defaultdict(dict)
        self._energy_system: esdl.EnergySystem = energy_system
        self._file_path: Optional[Path] = file_path
        self._reference_datetimes: Optional[pd.DatetimeIndex] = None

    def read_profiles(
        self,
        io: DataStore,
        energy_system_components: Dict[str, Set[str]],
        esdl_asset_id_to_name_map: Dict[str, str],
        esdl_assets: Dict[str, Asset],
        carrier_properties: Dict[str, Dict],
        ensemble_size: int,
    ) -> None:
        """
        This function takes a datastore and a dictionary of milp network components and loads a
        profile for each demand and source in the provided milp network components into the
        datastore. If no profile is available the following happens:
        - for sources, no target profile is set
        - for demands a default profile is loaded equal to the power of the demand asset
        Note that at least one profile must be provided to determine the start and end times of the
        optimization horizon.

        Parameters
        ----------
        io : Datastore in which the profiles will be saved
        energy_system_components :   Dictionary of the components of the network, should
                                    contain at least every component for which a profile
                                    needs to be loaded
        esdl_asset_id_to_name_map : Dictionary that maps asset ids to asset names,
                                    this is required when reading from an XML
        esdl_assets : Dictionary mapping asset IDs to loaded ESDL assets
        esdl_carriers: Dictionary mapping carrier IDs to its properties
        ensemble_size :     Integer denoting the size of the set of scenarios to
                            optimize. Currently only XML inputs support loading a
                            different profile for different ensemble members

        Returns
        -------
        None
        """
        self._load_profiles_from_source(
            energy_system_components=energy_system_components,
            esdl_asset_id_to_name_map=esdl_asset_id_to_name_map,
            carrier_properties=carrier_properties,
            ensemble_size=ensemble_size,
        )

        try:
            io.reference_datetime = self._reference_datetimes[0]
        except AttributeError:
            raise RuntimeError(
                "No profiles were provided so no timeframe for the profiles could be deduced"
            )

        esdl_asset_names_to_ids = dict(
            zip(esdl_asset_id_to_name_map.values(), esdl_asset_id_to_name_map.keys())
        )

        for ensemble_member in range(ensemble_size):
            for component_type, var_name in self.component_type_to_var_name_map.items():
                for component in energy_system_components.get(component_type, []):
                    profile = self._profiles[ensemble_member].get(component + var_name, None)
                    asset_power = esdl_assets[esdl_asset_names_to_ids[component]].attributes[
                        "power"
                    ]
                    if profile is not None:
                        values = profile
                    else:
                        if "heat_demand" not in component_type:
                            # We don't set a default profile for source targets
                            continue
                        logger.warning(
                            f"No profile provided for {component=} and "
                            f"{ensemble_member=}, using the assets power value instead"
                        )
                        values = np.array([asset_power] * len(self._reference_datetimes))

                    io.set_timeseries(
                        variable=component + var_name,
                        datetimes=self._reference_datetimes,
                        values=values,
                        ensemble_member=ensemble_member,
                    )
                    # Check if that the installed heat/cool demand capacity is sufficient
                    if component_type in ["heat_demand", "cold_demand"]:
                        max_profile_value = max(values)
                        if asset_power < max_profile_value and asset_power != 0.0:
                            asset_id = esdl_asset_names_to_ids[component]
                            get_potential_errors().add_potential_issue(
                                (
                                    MesidoAssetIssueType.HEAT_DEMAND_POWER
                                    if component_type == "heat_demand"
                                    else MesidoAssetIssueType.COLD_DEMAND_POWER
                                ),
                                asset_id,
                                f"Asset named {component}: The installed capacity of"
                                f" {round(asset_power / 1.0e6, 3)}MW should be larger than the"
                                " maximum of the heat demand profile "
                                f"{round(max_profile_value / 1.0e6, 3)}MW",
                            )
                    elif component_type in ["heat_source"]:
                        max_profile_value = max(values)
                        if asset_power < max_profile_value:
                            asset_id = esdl_asset_names_to_ids[component]
                            get_potential_errors().add_potential_issue(
                                MesidoAssetIssueType.HEAT_PRODUCER_POWER,
                                asset_id,
                                f"Asset named {component}: The installed capacity of"
                                f" {round(asset_power / 1.0e6, 3)}MW should be equal or larger than"
                                " the maximum of the heat producer maximum profile constraint"
                                f" {round(max_profile_value / 1.0e6, 3)}MW",
                            )

            for properties in carrier_properties.values():
                carrier_name = properties["name"]
                profile = self._profiles[ensemble_member].get(
                    carrier_name + self.carrier_profile_var_name, None
                )
                if profile is not None:
                    logger.debug(
                        f"Setting price profile for carrier named {carrier_name} " f"to {profile}"
                    )
                    io.set_timeseries(
                        variable=carrier_name + self.carrier_profile_var_name,
                        datetimes=self._reference_datetimes,
                        values=profile,
                        ensemble_member=ensemble_member,
                    )

    def _load_profiles_from_source(
        self,
        energy_system_components: Dict[str, Set[str]],
        esdl_asset_id_to_name_map: Dict[str, str],
        carrier_properties: Dict[str, Dict],
        ensemble_size: int,
    ) -> None:
        """
        This function must be implemented by the child. It must load the available
        profiles for demands and sources from the correct source and saves them in the _profiles
        attribute. It must also set the _reference_datetime_index attribute to the correct
        index to be used in the DataStore when loading the profiles

        Parameters
        ----------
        energy_system_components :   Dictionary of the components of the network, should
                                    contain at least every component for which a profile
                                    needs to be loaded
        esdl_asset_id_to_name_map : Dictionary that maps asset ids to asset names,
                                    this is required when reading from an XML
        ensemble_size :     Integer denoting the size of the set of scenarios to
                            optimize. Currently only XML inputs support loading a
                            different profile for different ensemble members

        Returns
        -------
        None
        """
        raise NotImplementedError


class InfluxDBProfileReader(BaseProfileReader):
    asset_type_to_variable_name_conversion = {
        esdl.esdl.HeatingDemand: ".target_heat_demand",
        esdl.esdl.GenericConsumer: ".target_heat_demand",
        esdl.esdl.HeatProducer: ".maximum_heat_source",
        esdl.esdl.ElectricityDemand: ".target_electricity_demand",
        esdl.esdl.ElectricityProducer: ".maximum_electricity_source",
        esdl.esdl.GasDemand: ".target_gas_demand",
        esdl.esdl.GasProducer: ".maximum_gas_source",
    }

    def __init__(self, energy_system: esdl.EnergySystem, file_path: Optional[Path]):
        super().__init__(energy_system=energy_system, file_path=file_path)
        self._df = pd.DataFrame()

    def _load_profiles_from_source(
        self,
        energy_system_components: Dict[str, Set[str]],
        esdl_asset_id_to_name_map: Dict[str, str],
        carrier_properties: Dict[str, Dict],
        ensemble_size: int,
    ) -> None:
        profiles: Dict[str, np.ndarray] = dict()
        logger.info("Reading profiles from InfluxDB")
        self._reference_datetimes = None

        # Get list of unique profiles and associated series based on specific profile attributes
        unique_profiles = []
        unique_profiles_attributes = []  # a list containning lists of attributes
        unique_series = []
        for profile in [
            x for x in self._energy_system.eAllContents() if isinstance(x, esdl.InfluxDBProfile)
        ]:
            if [
                profile.database,
                profile.field,
                profile.host,
                profile.startDate,
                profile.endDate,
                profile.measurement,
                profile.port,
            ] not in unique_profiles_attributes:
                unique_profiles_attributes.append(
                    [
                        profile.database,
                        profile.field,
                        profile.host,
                        profile.startDate,
                        profile.endDate,
                        profile.measurement,
                        profile.port,
                    ]
                )
                unique_profiles.append(profile)

                unique_series.append(
                    self._load_profile_timeseries_from_database(profile=unique_profiles[-1])
                )
                self._check_profile_time_series(
                    profile_time_series=unique_series[-1], profile=unique_profiles[-1]
                )
                if self._reference_datetimes is None:
                    # TODO: since the previous function ensures it's a date time index, I'm not sure
                    #  how to get rid of this type checking warning
                    self._reference_datetimes = unique_series[-1].index
                else:
                    if not all(unique_series[-1].index == self._reference_datetimes):
                        raise RuntimeError(
                            f"Obtained a profile for asset {profile.field} with a "
                            f"timeseries index that doesn't match the timeseries of "
                            f"other assets. Please ensure that the profile that is "
                            f"specified to be loaded for each asset covers exactly the "
                            f"same timeseries. "
                        )
        # Loop trough all the requried profiles in the energy system and assign the profile data:
        # - series: use the unique series data, without reading from the database again
        # - other profile info: get it from the specific profile
        for profile in [
            x for x in self._energy_system.eAllContents() if isinstance(x, esdl.InfluxDBProfile)
        ]:
            index_of_unique_profile = unique_profiles_attributes.index(
                [
                    profile.database,
                    profile.field,
                    profile.host,
                    profile.startDate,
                    profile.endDate,
                    profile.measurement,
                    profile.port,
                ]
            )
            series = unique_series[index_of_unique_profile]
            self._check_profile_time_series(profile_time_series=series, profile=profile)
            converted_dataframe = self._convert_profile_to_correct_unit(
                profile_time_series=series, profile=profile
            )

            container = profile.eContainer()
            if isinstance(container, esdl.ProfileConstraint):
                asset = container.eContainer()
                variable_suffix = self.asset_type_to_variable_name_conversion[type(asset)]
                var_base_name = asset.name
                if variable_suffix in [
                    self.asset_type_to_variable_name_conversion[esdl.esdl.GasProducer],
                    self.asset_type_to_variable_name_conversion[esdl.esdl.ElectricityProducer],
                ]:
                    logger.error(
                        f"Profiles for {var_base_name} from esdl has not been tested yet but only"
                        " for heat sources"
                    )
                    sys.exit(1)

            elif isinstance(container, esdl.Commodity):
                variable_suffix = self.carrier_profile_var_name
                var_base_name = container.name
            elif isinstance(container, esdl.Port):
                asset = container.energyasset
                var_base_name = asset.name
                if var_base_name in [
                    self.asset_type_to_variable_name_conversion[esdl.esdl.GasProducer],
                    self.asset_type_to_variable_name_conversion[esdl.esdl.ElectricityProducer],
                ]:
                    logger.error(f"Profiles for {var_base_name} from esdl has not been tested yet")
                    sys.exit(1)
                try:
                    variable_suffix = self.asset_type_to_variable_name_conversion[type(asset)]
                    # For multicommidity work profiles need to be assigned to GenericConsumer, but
                    # not for heat network (this asset_potential_errors is used in grow_workflow)
                    if type(asset) is esdl.GenericConsumer:
                        get_potential_errors().add_potential_issue(
                            MesidoAssetIssueType.HEAT_DEMAND_TYPE,
                            asset.id,
                            f"Asset named {asset.name}: This asset is currently a GenericConsumer"
                            " please change it to a HeatingDemand",
                        )
                except KeyError:
                    get_potential_errors().add_potential_issue(
                        MesidoAssetIssueType.ASSET_PROFILE_CAPABILITY,
                        asset.id,
                        f"Asset named {asset.name}: The assigment of profile field {profile.field}"
                        f" is not possible for this asset type {type(asset)}",
                    )
            else:
                raise RuntimeError(
                    f"Got a profile for a {container}. Currently only profiles "
                    f"for assets and commodities are supported"
                )
            profiles[var_base_name + variable_suffix] = converted_dataframe * profile.multiplier

        for idx in range(ensemble_size):
            self._profiles[idx] = profiles.copy()

    # @staticmethod
    def _load_profile_timeseries_from_database(self, profile: esdl.InfluxDBProfile) -> pd.Series:
        """
        Function to load the profiles from an InfluxDB. Returns a timeseries with the data for
        the asset.

        Parameters
        ----------
        profile : Input InfluxDBProfile for the asset in the ESDL for which a profile should be read

        Returns
        -------
        A pandas Series of the profile for the asset.
        """
        if profile.id in self._df:
            return self._df[profile.id]

        profile_host = profile.host

        ssl_setting = False
        if "https" in profile_host:
            profile_host = profile_host[8:]
            ssl_setting = True
        elif "http" in profile_host:
            profile_host = profile_host[7:]
        if profile.port == 443:
            ssl_setting = True
        influx_host = "{}:{}".format(profile_host, profile.port)

        # TODO: remove hard-coded database credentials, should probably be read from a settings file
        if influx_host in influx_cred_map:
            (username, password) = influx_cred_map[influx_host]
        else:
            username = None
            password = None

        conn_settings = ConnectionSettings(
            host=profile.host,
            port=profile.port,
            username=username,
            password=password,
            database=profile.database,
            ssl=ssl_setting,
            verify_ssl=ssl_setting,
        )
        time_series_data = InfluxDBProfileManager(conn_settings)

        time_series_data.load_influxdb(
            profile.measurement,
            [profile.field],
            profile.startDate,
            profile.endDate,
        )

        for x in time_series_data.profile_data_list:
            if len(x) != 2:
                raise RuntimeError(
                    "InfluxDB profile currently only supports parsing exactly one "
                    "profile for each asset"
                )

        if not time_series_data.profile_data_list[0][0].tzinfo:
            index = pd.DatetimeIndex(
                data=[x[0] for x in time_series_data.profile_data_list],
                tz=datetime.timezone.utc,
            )
            logger.warning("No timezone specified for the input profile: default UTC has been used")
        else:
            index = pd.DatetimeIndex(data=[x[0] for x in time_series_data.profile_data_list])

        data = [x[1] for x in time_series_data.profile_data_list]
        series = pd.Series(data=data, index=index)
        self._df[profile.id] = series

        return series

    @staticmethod
    def _check_profile_time_series(
        profile_time_series: pd.Series, profile: esdl.InfluxDBProfile
    ) -> None:
        """
        Function that checks if the loaded profile matches what was expected

        Parameters
        ----------
        profile_time_series : the pandas Series of the profile obtained for the profile.
        profile : the InfluxDBProfile used to obtain the time series

        Returns
        -------
        None
        """
        if profile_time_series.index[0] != profile.startDate:
            raise RuntimeError(
                f"The user input profile start datetime: {profile.startDate} does not match the"
                f" start date in the database: {profile_time_series.index[0]} for asset: "
                f"{profile.field}"
            )
        if profile_time_series.index[-1] != profile.endDate:
            raise RuntimeError(
                f"The user input profile end datetime: {profile.endDate} does not match the end"
                f" datetime in the database: {profile_time_series.index[-1]} for asset: "
                f"{profile.field}"
            )

        # Error check: ensure that the profile data has a time resolution of 3600s (1hour) as
        # expected
        for d1, d2 in zip(profile_time_series.index, profile_time_series.index[1:]):
            if d2 - d1 != pd.Timedelta(hours=1):
                raise RuntimeError(
                    f"The timestep for variable {profile.field} between {d1} and {d2} isn't "
                    f"exactly 1 hour"
                )
        # Check if any NaN values exist
        if profile_time_series.isnull().any().any():
            raise Exception(
                f"Nan value was encountered in the profile data for variable {profile.field}"
            )

    def _convert_profile_to_correct_unit(
        self, profile_time_series: pd.Series, profile: esdl.InfluxDBProfile
    ) -> pd.Series:
        """
        Conversion function to change the values in the provided series to the correct unit

        Parameters
        ----------
        profile_time_series: the time series obtained for the provided profile.
        profile: the profile which was used to obtain the series.

        Returns
        -------
        A pandas Series with the same index as the provided profile_time_series and with all values
        converted to either Watt or Joules, depending on the quantity used in the profile.
        """
        profile_quantity_and_unit = self._get_profile_quantity_and_unit(profile=profile)
        if (
            profile_quantity_and_unit.physicalQuantity == esdl.PhysicalQuantityEnum.POWER
            or profile_quantity_and_unit.physicalQuantity == esdl.PhysicalQuantityEnum.COEFFICIENT
        ):
            if profile_quantity_and_unit.unit == esdl.UnitEnum.WATT:
                target_unit = POWER_IN_W
            elif profile_quantity_and_unit.unit == esdl.UnitEnum.PERCENT:  # values 0-100%
                # TODO: in the future change to ratios if needed
                return profile_time_series  # These profiles are scaled in asset sizing
            elif profile_quantity_and_unit.unit == esdl.UnitEnum.NONE:  # ratio 0-1
                return profile_time_series
            else:
                raise RuntimeError(
                    f"Power profiles currently only support units"
                    f"specified in Watts or Percentage,"
                    f"{profile} doesn't follow this convention."
                )
        elif profile_quantity_and_unit.physicalQuantity == esdl.PhysicalQuantityEnum.ENERGY:
            target_unit = ENERGY_IN_J
        elif profile_quantity_and_unit.physicalQuantity == esdl.PhysicalQuantityEnum.COST:
            if not (
                profile_quantity_and_unit.unit == esdl.UnitEnum.EURO
                and profile_quantity_and_unit.perUnit == esdl.UnitEnum.WATTHOUR
            ):
                raise RuntimeError(
                    f"For price profiles currently only profiles "
                    f"specified in euros per watt-hour are accepted,"
                    f"{profile} doesn't follow this convention."
                )
            return profile_time_series
        else:
            raise RuntimeError(
                f"The user input profile currently only supports loading profiles containing "
                f"either power, energy values or euros per Wh, not "
                f"{profile_quantity_and_unit.physicalQuantity}."
            )
        # The vectorized method below is used instead of profile_time_series.apply(), due to a
        # computational cost reduction (order of 2000 times faster for a profile with 8760
        # timesteps)
        return profile_time_series * convert_to_unit(
            value=1.0, source_unit=profile_quantity_and_unit, target_unit=target_unit
        )

    @staticmethod
    def _get_profile_quantity_and_unit(profile: esdl.InfluxDBProfile):
        try:
            return profile.profileQuantityAndUnit.reference
        except AttributeError:
            return profile.profileQuantityAndUnit


class ProfileReaderFromFile(BaseProfileReader):
    def __init__(self, energy_system: esdl.EnergySystem, file_path: Path):
        super().__init__(energy_system=energy_system, file_path=file_path)

    def _load_profiles_from_source(
        self,
        energy_system_components: Dict[str, Set[str]],
        esdl_asset_id_to_name_map: Dict[str, str],
        carrier_properties: Dict[str, Dict],
        ensemble_size: int,
    ) -> None:
        if self._file_path.suffix == ".xml":
            logger.warning(
                "XML type loading currently does not support loading " "price profiles for carriers"
            )
            self._load_xml(
                energy_system_components=energy_system_components,
                esdl_asset_id_to_name_map=esdl_asset_id_to_name_map,
            )
        elif self._file_path.suffix == ".csv":
            self._load_csv(
                energy_system_components=energy_system_components,
                carrier_properties=carrier_properties,
                ensemble_size=ensemble_size,
            )
        else:
            raise _ProfileParserException(
                f"Unsupported profile file extension " f"{self._file_path.suffix}"
            )

    def _load_csv(
        self,
        energy_system_components: Dict[str, Set[str]],
        carrier_properties: Dict[str, Dict],
        ensemble_size: int,
    ) -> None:
        data = pd.read_csv(self._file_path)

        if len(data.filter(like="Unnamed").columns) > 0:
            raise Exception(
                f"An unnamed column has been found in profile source file: {self._file_path}"
            )

        try:
            timeseries_import_times = [
                datetime.datetime.strptime(entry.replace("Z", ""), "%Y-%m-%d %H:%M:%S").replace(
                    tzinfo=datetime.timezone.utc
                )
                for entry in data["DateTime"].to_numpy()
            ]
        except ValueError:
            try:
                timeseries_import_times = [
                    datetime.datetime.strptime(entry.replace("Z", ""), "%Y-%m-%dT%H:%M:%S").replace(
                        tzinfo=datetime.timezone.utc
                    )
                    for entry in data["DateTime"].to_numpy()
                ]
            except ValueError:
                try:
                    timeseries_import_times = [
                        datetime.datetime.strptime(
                            entry.replace("Z", ""), "%d-%m-%Y %H:%M"
                        ).replace(tzinfo=datetime.timezone.utc)
                        for entry in data["DateTime"].to_numpy()
                    ]
                except ValueError:
                    raise _ProfileParserException("Date time string is not in a supported format")

        logger.warning("Timezone specification not supported yet: default UTC has been used")

        self._reference_datetimes = timeseries_import_times

        for ensemble_member in range(ensemble_size):
            for component_type, var_name in self.component_type_to_var_name_map.items():
                for component_name in energy_system_components.get(component_type, []):
                    try:
                        column_name = f"{component_name.replace(' ', '')}"
                        values = data[column_name].to_numpy()
                        if np.isnan(values).any():
                            raise Exception(
                                f"Column name: {column_name}, NaN exists in the profile source"
                                f" file {self._file_path}."
                                f" Detials: {data[data[column_name].isnull()]}"
                            )
                    except KeyError:
                        pass
                    else:
                        self._profiles[ensemble_member][component_name + var_name] = values
            for properties in carrier_properties.values():
                carrier_name = properties.get("name")
                try:
                    values = data[carrier_name].to_numpy()
                    if np.isnan(values).any():
                        raise Exception(
                            f"Carrier name: {carrier_name}, NaN exists in the profile source file"
                            f" {self._file_path}. Details: {data[data[carrier_name].isnull()]}"
                        )
                except KeyError:
                    pass
                else:
                    self._profiles[ensemble_member][
                        carrier_name + self.carrier_profile_var_name
                    ] = values

    def _load_xml(self, energy_system_components, esdl_asset_id_to_name_map):
        timeseries_import_basename = self._file_path.stem
        input_folder = self._file_path.parent

        try:
            data = rtctools.data.pi.Timeseries(
                _ESDLInputDataConfig(esdl_asset_id_to_name_map, energy_system_components),
                input_folder,
                timeseries_import_basename,
                binary=False,
                pi_validate_times=False,
            )
        except IOError:
            raise Exception(
                "ESDLMixin: {}.xml not found in {}.".format(
                    timeseries_import_basename, input_folder
                )
            )

        # Convert timeseries timestamps to seconds since t0 for internal use
        if not data.times[0].tzinfo:
            for ii in range(len(data.times)):
                data.times[ii] = data.times[ii].replace(tzinfo=datetime.timezone.utc)
            logger.warning("No timezone specified for the input profile: default UTC has been used")

        self._reference_datetimes = data.times

        # Offer input timeseries to IOMixin
        for ensemble_member in range(data.ensemble_size):
            for variable, values in data.items(ensemble_member):
                self._profiles[ensemble_member][variable] = values


class _ESDLInputDataConfig:
    ns: dict = {"fews": "http://www.wldelft.nl/fews", "pi": "http://www.wldelft.nl/fews/PI"}

    def __init__(self, id_map: Dict[str, str], energy_system_components: Dict[str, Set[str]]):
        # TODO: change naming source and demand to heat_source and heat_demand throughout code
        self.__id_map: Dict[str, str] = id_map
        self._sources: Set = set(energy_system_components.get("heat_source", []))
        self._demands: Set = set(energy_system_components.get("heat_demand", []))
        self._electricity_sources: Set = set(energy_system_components.get("electricity_source", []))
        self._electricity_demands: Set = set(energy_system_components.get("electricity_demand", []))
        self._gas_sources: Set = set(energy_system_components.get("gas_source", []))
        self._gas_demands: Set = set(energy_system_components.get("gas_demand", []))

    def variable(self, pi_header):
        location_id = pi_header.find("pi:locationId", self.ns).text

        try:
            component_name = self.__id_map[location_id]
        except KeyError:
            parameter_id = pi_header.find("pi:parameterId", self.ns).text
            qualifiers = pi_header.findall("pi:qualifierId", self.ns)
            qualifier_ids = ":".join(q.text for q in qualifiers)
            return f"{location_id}:{parameter_id}:{qualifier_ids}"

        if component_name in self._demands:
            suffix = ".target_heat_demand"
        elif component_name in self._sources:
            suffix = ".maximum_heat_source"
        elif component_name in self._electricity_demands:
            suffix = ".target_electricity_demand"
        elif component_name in self._electricity_sources:
            suffix = ".maximum_electricity_source"
        elif component_name in self._gas_demands:
            suffix = ".target_gas_demand"
        elif component_name in self._gas_sources:
            suffix = ".maximum_gas_source"
        else:
            logger.warning(
                f"Could not identify '{component_name}' as either source or demand. "
                f"Using neutral suffix '.target_heat' for its milp timeseries."
            )
            suffix = ".target_heat"

        # Note that the qualifier id (if any specified) refers to the profile
        # element of the respective ESDL asset->in_port. For now we just
        # assume that only milp demand timeseries are set in the XML file.
        return f"{component_name}{suffix}"
