from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing


if __name__ == "__main__":
    import time

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent.parent

    # Please specify the database credentials locally to read profiles from the database used in
    # the esdl file
    kwargs = {
        "database_connections": [
            {
                "access_type": "read",  # read or write or read_write
                "influxdb_host": "required_user_input",
                "influxdb_port": 1234,
                "influxdb_username": "required_user_input",
                "influxdb_password": "required_user_input",
                "influxdb_ssl": False,
                "influxdb_verify_ssl": False,
            },
        ],
    }

    solution = run_end_scenario_sizing(
        EndScenarioSizingStaged,
        base_folder=base_folder,
        esdl_file_name="GROW_withATES_Prod_install.esdl",
        esdl_parser=ESDLFileParser,
        **kwargs,
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
