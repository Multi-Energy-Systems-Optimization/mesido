from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing
from mesido.esdl.esdl_mixin import DBAccesType

if __name__ == "__main__":
    import time

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent.parent

    kwargs = {
        "database_connections": [
            {
                "access_type": DBAccesType.READ,  # or DBAccesType.WRITE or DBAccesType.READ_WRITE
                "influxdb_host": "required_user_input",
                "influxdb_port": 1234,
                "influxdb_username": "required_user_input",
                "influxdb_password": "required_user_input",
                "influxdb_ssl": False,
                "influxdb_verify_ssl": False,
            },
            {
                "access_type": DBAccesType.WRITE,  # or DBAccesType.WRITE or DBAccesType.READ_WRITE
                "influxdb_host": "localhost",
                "influxdb_port": 8086,
                "influxdb_username": None,
                "influxdb_password": None,
                "influxdb_ssl": False,
                "influxdb_verify_ssl": False,
            },
            
        ],
    }

    solution = run_end_scenario_sizing(
        EndScenarioSizingStaged,
        base_folder=base_folder,
        esdl_file_name="Base Netwerk Delft.esdl",
        esdl_parser=ESDLFileParser,
        # **kwargs,  # Example of usage if needed/used
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
