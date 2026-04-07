from pyecore.ecore import EEnum

import esdl
from esdl import DatabaseConfiguration
from esdl.profiles.datatableprofilemanager import DataTableProfileManager, Credentials
from esdl.support_functions import deepcopy
from esdl.units.conversion import POWER_IN_kW, POWER_IN_MW, POWER_IN_W, convert_to_unit, equals
from esdl.units.parser import qau_to_string

esdl.profiles.data_configurations.postgresql.DEBUG_SQL = True # does not work

if __name__ == '__main__':

    # create a new datatable profile with data from e.g. excel or csv
    dtp = esdl.DataTableProfile(name="test profile", id="test")
    dtp.configuration = esdl.FileConfiguration(uri="test_profile.csv", type=esdl.FileTypeEnum.CSV)
    dtpman = DataTableProfileManager.load(dtp)

    x =5
    print(dtpman.profile_header)
    print(dtpman.profile_data_list)
    columnName = "column2"
    print(dtpman.get_esdl_timeseries_profile(columnName).values)


    # add QaU
    dtp.columnName = columnName
    dtp.profileQuantityAndUnit = deepcopy(POWER_IN_kW)
    # store this in Postgres by creating a new configuration
    dtp.configuration = esdl.DatabaseConfiguration(type=esdl.DatabaseTypeEnum.POSTGRESQL,
                                                    id="my_database",
                                                    database="datatableprofile2",
                                                    host="localhost")
    cred = Credentials.create_dict("my_database", "postgres", "password")


    # save data in database configured in dtp.configuration
    dtpman.save(cred)


    # load data from postgres
    dtp2 = esdl.DataTableProfile(name="test profile", id="test",
                                 columnName=columnName,
                                 tableName="test_profile",
                                 schema="public")
    dtp2.configuration = esdl.DatabaseConfiguration(type=esdl.DatabaseTypeEnum.POSTGRESQL,
                                                   id="my_database",
                                                   database="datatableprofile2",
                                                   host="localhost")
    dtpm2 = DataTableProfileManager(dtp2)
    dtpm2.add_credential(Credentials.create_dict("my_database", "postgres", "password"))
    dtpm2.load_database_configuration()
    print([ value[1] for value in dtpm2.profile_data_list ])



    # load data from CSV into postgres from an ESDL DataTable profile definition
    dtp = esdl.DataTableProfile(name="test profile", id="test", tableName="csv_data_table")
    dtp.profileQuantityAndUnit = POWER_IN_kW.deepcopy()
    dtp.configuration = esdl.FileConfiguration(uri="test_profile.csv", type=esdl.FileTypeEnum.CSV)
    dtpman = DataTableProfileManager.load(dtp)
    print(dtpman.profile_header)
    nw_table_config = DatabaseConfiguration(name="nw_table", id="postgres_db", database="datatableprofile",
                                            type=esdl.DatabaseTypeEnum.POSTGRESQL,
                                            host="localhost")
    dtp.configuration = nw_table_config
    dtp.schema = "essim_run_20250804"
    dtpman.add_credential(Credentials.create_dict("postgres_db", "postgres", "password"))
    dtpman.save()


    print("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++")
    # load the same data from postgres and check the unit
    # setting the unit manually should not be needed.
    my_dtp = esdl.DataTableProfile(name="my profile", id="test", tableName="csv_data_table",
                                   columnName="column1", schema="essim_run_20250804")
    my_dtp.configuration = esdl.DatabaseConfiguration(type=esdl.DatabaseTypeEnum.POSTGRESQL, name="test configuration",
                                                   id="postgres_db", host="localhost", database="datatableprofile")
    dtpmanager = DataTableProfileManager.load(my_dtp, Credentials.create_dict(my_dtp.configuration.id, "postgres", "password"))
    print(qau_to_string(dtp.profileQuantityAndUnit))
    assert(equals(POWER_IN_kW, dtp.profileQuantityAndUnit))

    print("----------------------- get scaled profile data from Postgres -----------------------")

    tableName = "PG-Test-02-HeatProfiles"
    # columnName = "SpaceHeat&HotWater_PowerProfile_2000_2010"
    columnName = None
    multiplier = 10.0

    # get profile data with multiplier method from Postgres
    dtp3 = esdl.DataTableProfile(id="test",
                                 tableName=tableName,
                                 columnName=columnName,
                                 multiplier=multiplier
                                 )
    dtp3.configuration = esdl.DatabaseConfiguration(type=esdl.DatabaseTypeEnum.POSTGRESQL,
                                                   id="my_database",
                                                   database="energy_profiles",
                                                   host="localhost",
                                                   port=5432)
    dtpm3 = DataTableProfileManager(dtp3)
    dtpm3.add_credential(Credentials.create_dict("my_database", "postgres", "password"))
    dtpm3.load_database_configuration()

    return_column = True
    profile_values = dtpm3.get_profile_with_multiplier(column_based=return_column)

    if return_column:
        print(profile_values[0][:10])
        print(profile_values[1][:10])
    else:
        print(profile_values[:10])


    print("----------------------- load data with custom (downsampled) query -----------------------")

    # load data with custom (downsampled) query
    import datetime

    tableName = "PG-Test-02-HeatProfiles"
    columnName = "SpaceHeat&HotWater_PowerProfile_2000_2010"

    dtp4 = esdl.DataTableProfile(id="test", tableName=tableName)
    dtp4.configuration = esdl.DatabaseConfiguration(type=esdl.DatabaseTypeEnum.POSTGRESQL,
                                                   id="my_database",
                                                   database="energy_profiles",
                                                   host="localhost",
                                                   port=5432)
    cred_dict = Credentials.create_dict("my_database", "postgres", "password")

    return_column = True
    schema = None
    # downsample_bucket_sec = 86400
    downsample_bucket_sec = None
    start_date = None
    # start_date = datetime.datetime(2019, 1, 5)
    # additional_filters = {"datetime": '2019-01-22 00:00:00.000'}
    additional_filters = None
    multiplier = 5.0

    profile_values, header, metadata = DataTableProfileManager.query(data_table_profile=dtp4,
                                                                    credentials_dict=cred_dict,
                                                                    table_name=tableName,
                                                                    column_name=columnName,
                                                                    schema=schema,
                                                                    datetime_column_name=None,
                                                                    start_date=start_date,
                                                                    additional_filters=additional_filters,
                                                                    multiplier=multiplier,
                                                                    downsample_bucket_sec=downsample_bucket_sec,
                                                                    column_based=return_column,
                                                                    )
    if return_column:
        print(profile_values[0][:10])
        print(profile_values[1][:10])
    else:
        print(profile_values[:10])
    print(header)
    print(metadata)