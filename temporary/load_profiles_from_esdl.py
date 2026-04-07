from pathlib import Path
from typing import Any

import esdl
from esdl.esdl_handler import EnergySystemHandler
from esdl.profiles.datatableprofilemanager import DataTableProfileManager, Credentials

dtp_managers: dict[str, DataTableProfileManager] = {}
profile_data_cache: dict[str, tuple[Any, list[Any]]] = {}


def _create_profile_cache_key(config_id: str, table_name: str, column_name: str) -> str:
    """
    Create a profile cache key from configuration id, table name, and column name.

    Parameters
    ----------
    config_id : str
        The configuration id.
    table_name : str
        The table name.
    column_name : str
        The column name.

    Returns
    -------
    str
        A unique profile cache key.
    """
    return f"{config_id}:{table_name}:{column_name}"


def get_credentials(config: Any, database_credentials: list[dict[str, Any]]) -> dict[str, Any] | None:
    """
    Retrieve database credentials matching on host, and optionally on port and database if present in config.

    Parameters
    ----------
    config : Any
        The database configuration object with host, (port), (database), user, password attributes.
    database_credentials : list[dict[str, Any]]
        List of credential dictionaries.

    Returns
    -------
    dict[str, Any] | None
        The matching credential dictionary or None.
    """
    for cred in database_credentials:
        if cred['host'] == config.host:
            if hasattr(config, 'port') and str(config.port) != cred['port']:
                continue
            if hasattr(config, 'database') and config.database != cred['database']:
                continue
            return cred
    return None


def get_dtp_manager(dtp: esdl.DataTableProfile, database_credentials: list[dict[str, Any]]) -> DataTableProfileManager:
    """
    Get DataTableProfileManager, uses caching to avoid recreating managers for the same configuration.

    Parameters
    ----------
    dtp : esdl.DataTableProfile
        The data table profile.
    database_credentials : list[dict[str, Any]]
        List of database credentials.

    Returns
    -------
    DataTableProfileManager
        The manager instance.
    """
    config_id = dtp.configuration.id
    if config_id not in dtp_managers:
        manager = DataTableProfileManager(dtp)
        creds = get_credentials(dtp.configuration, database_credentials)
        if creds:
            manager.add_credential(
                Credentials.create_dict(config_id, creds['username'], creds['password'])
            )
        dtp_managers[config_id] = manager
    return dtp_managers[config_id]


def clone_qau(qau: Any) -> Any:
    """Return a deep clone of qau."""
    if not qau:
        return None

    if isinstance(qau, esdl.QuantityAndUnitReference):
        qau = qau.reference
    return qau.deepcopy()


def influxdbprofile_to_datatableprofile(
    profile: esdl.InfluxDBProfile,
) -> esdl.DataTableProfile:
    """Translate InfluxDBProfile into DataTableProfile."""

    dtp = esdl.DataTableProfile(
        id=profile.id,
        name=profile.name,
        tableName=profile.measurement,
        columnName=profile.field,
        filter=profile.filters,
        multiplier=profile.multiplier,
        startDate=profile.startDate,
        endDate=profile.endDate,
        profileType=profile.profileType,
        profileQuantityAndUnit=clone_qau(profile.profileQuantityAndUnit),
    )

    dtp.configuration = esdl.DatabaseConfiguration(
        database=profile.database,
        type=esdl.DatabaseTypeEnum.INFLUXDB,
        host=profile.host,
        port=profile.port,
        tls=False,
    )

    return dtp

def get_profile_header_and_raw_data(
        profile: esdl.GenericProfile,
        database_credentials: list[dict[str, Any]] | None = None,
        enable_cache: bool = False,
    ) -> tuple[Any | None, list[Any] | None]:
    """
    Retrieve the profile header and data list for a given profile.

    Converts InfluxDBProfile to DataTableProfile if necessary, then loads data for PostgreSQL profiles.
    Profile data can be cached to avoid requerying the same table/column combinations.

    Parameters
    ----------
    profile : esdl.GenericProfile
        The profile to process.
    database_credentials : list[dict[str, Any]] | None
        optional list of database credentials, by default None.
    enable_cache : bool, optional
        Whether to cache profile data, by default True.

    Returns
    -------
    tuple[Any | None, list[Any] | None]
        The profile header and data list, or (None, None).
    """
    if isinstance(profile, esdl.DataTableProfile):
        dtp = profile
    elif isinstance(profile, esdl.InfluxDBProfile):
        dtp = influxdbprofile_to_datatableprofile(profile)
    else:
        raise NotImplementedError(
            f"Unsupported profile (id={profile.id}) class: {type(profile).__name__}"
        )

    dtp_manager = get_dtp_manager(dtp, database_credentials)
    
    if dtp.configuration.type == esdl.DatabaseTypeEnum.POSTGRESQL:
        dtp_manager.data_table_profile.tableName = profile.tableName
        dtp_manager.data_table_profile.columnName = profile.columnName
        if enable_cache:
            cache_key = _create_profile_cache_key(
                dtp.configuration.id,
                profile.tableName,
                profile.columnName
            )
            if cache_key in profile_data_cache:  # return cached profile
                return profile_data_cache[cache_key]
        
        # load from database
        dtp_manager.load_database_configuration()
        header = dtp_manager.profile_header
        data_list = dtp_manager.profile_data_list
        
        if enable_cache:  # store in cache
            profile_data_cache[cache_key] = (header, data_list)
        
        return header, data_list
    else:
        return None, None


if __name__ == "__main__":
    database_credentials: list[dict[str, Any]] = [
        {
            "host": "localhost",
            "port": "5432",
            "username": "postgres",
            "password": "password",
            "database": "energy_profiles",
            "ssl_enabled": False
        }
    ]

    esdl_path = Path("Delft_T_proftest.esdl")
    esh = EnergySystemHandler()
    es = esh.load_file(str(esdl_path))
    
    # Print all profiles
    for el in es.eAllContents():
        if isinstance(el, esdl.Asset) and hasattr(el, "port") and el.port is not None:
            for port in el.port:
                if hasattr(port, "profile") and port.profile is not None:
                    for profile in port.profile:
                        print(profile)
                        profile_header, profile_raw_data = get_profile_header_and_raw_data(profile, database_credentials, True)

                        if profile_header is not None:
                            print(profile_header)
                            for data in profile_raw_data[:10]:
                                print(data)
