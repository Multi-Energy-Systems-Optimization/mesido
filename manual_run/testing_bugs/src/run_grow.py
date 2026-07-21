from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing
from mesido.esdl.esdl_mixin import DBAccessType, ESDLOutputProfilesType

if __name__ == "__main__":
    import time

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent.parent

    kwargs = {
        "esdl_output_profiles_type": ESDLOutputProfilesType.INFLUXDB,
        # None (default) or ESDLOutputProfilesType.POSTGRESQL or
        # ESDLOutputProfilesType.TIME_SERIES_PROFILE or ESDLOutputProfilesType.DATE_TIME_PROFILE
        "database_connections": [
            {
                "access_type": DBAccessType.READ,  # or DBAccessType.WRITE or DBAccessType.READ_WRITE
                "host": "required_user_input",
                "port": 1234,
                "username": "required_user_input",
                "password": "required_user_input",
                "ssl": False,
                "verify_ssl": False,
            },
            {
                "access_type": DBAccessType.READ_WRITE,
                "host": "localhost",
                "port": 8086,
                "username": "root",
                "password": "9012",
                "ssl": False,
                "verify_ssl": False,
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
