import glob
import os

from esdl.profiles.excelprofilemanager import ExcelProfileManager
from esdl.profiles.influxdbprofilemanager import ConnectionSettings
from esdl.profiles.influxdbprofilemanager import InfluxDBProfileManager

"""
Place raw excel files in fodler: raw_data_files_folder
Database definition:

Database name: input esdl id
Measurement: asset name
Fields: Variables per asset
Tags/fiters: {tag: "output_esdl_id, value: id}
"""

# Settings for the reading excel files and creating a influxDB
# raw_data_files_folder = "C:\\Projects_gitlab\\database_files_test\\"
# input_energy_system_id = "15174819-d1af-4ba6-9f1d-2cd07991f14a"
# output_energy_system_id = "a33fe8db-8bdb-45a0-b1e7-69c348001672"
# influxdb_conn_settings = ConnectionSettings(
#     host="localhost",
#     port=8086,
#     username=None,
#     password=None,
#     database=input_energy_system_id,
#     ssl=False,
#     verify_ssl=False,
# )
# optim_simulation_tag = {"output_esdl_id": output_energy_system_id}

# Temp code below for electrolyzer
# Settings for the reading excel files and creating a influxDB
# raw_data_files_folder = (
#     "C:\\Projects_gitlab\\NWN_dev\\rtc-tools-milp-network\\tests\\models\\unit_cases_electricity\\"
#     "electrolyzer\\input\\Dummy_values\\"
# )
raw_data_files_folder = (
    "C:\\Projects_gitlab\\NWN_dev\\rtc-tools-milp-network\\tests\\models\\unit_cases_electricity\\"
    "electrolyzer\\input\\Profiles\\"
)
# input_energy_system_id = "15174819-d1af-4ba6-9f1d-2cd07991f14a"
# output_energy_system_id = "a33fe8db-8bdb-45a0-b1e7-69c348001672"
influxdb_conn_settings = ConnectionSettings(
    host="omotes-poc-test.hesi.energy",
    port=8086,
    username="write-user",
    password="nwn_write_test",
    database="multicommodity_test",
    ssl=False,
    verify_ssl=False,
)
optim_simulation_tag = {"output_esdl_id": "1"}
# optim_simulation_tag = {"output_esdl_id": output_energy_system_id}

excel_files = glob.glob(os.path.join(raw_data_files_folder, "*.xlsx"))


for file in excel_files:
    print("Read data from Excel")
    excel_prof_read = ExcelProfileManager()
    excel_prof_read.load_excel(file)

    print("Create database")
    influxdb_profile_manager_create_new = InfluxDBProfileManager(
        influxdb_conn_settings, excel_prof_read
    )
    asset_name = file.split("\\")[-1].replace(".xlsx", "")
    _ = influxdb_profile_manager_create_new.save_influxdb(
        measurement=asset_name,
        field_names=influxdb_profile_manager_create_new.profile_header[1:],
        tags=optim_simulation_tag,
    )
