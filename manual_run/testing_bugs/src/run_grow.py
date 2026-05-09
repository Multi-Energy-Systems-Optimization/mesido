from pathlib import Path

import esdl
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing
from mesido.esdl.esdl_mixin import DBAccessType

if __name__ == "__main__":
    import time

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent.parent

    kwargs = {
        "use_esdl_ranged_constraint": True,  # default value in the code is set to False
        "write_result_db_profiles": True,  # default value in the code is set to False
        "db_type_output_profiles": esdl.DatabaseTypeEnum.POSTGRESQL,
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
                "access_type": DBAccessType.READ,  # or DBAccessType.WRITE or DBAccessType.READ_WRITE
                "host": "localhost",
                "port": 8086,
                "username": None,
                "password": None,
                "ssl": False,
                "verify_ssl": False,
            },
            {
                "access_type": DBAccessType.READ,  # or DBAccessType.WRITE or DBAccessType.READ_WRITE
                "host": "omotes_influxdb",
                "port": 8096,
                "username": "root",
                "password": "9012",
                "ssl": False,
                "verify_ssl": False,
            },
            {
                "access_type": DBAccessType.READ_WRITE,  # or DBAccessType.WRITE or DBAccessType.READ_WRITE
                "host": "postgres",
                "port": 5432,
                "username": "postgres",
                "password": "password",
                "ssl": False,
                "verify_ssl": False,
            },
        ],
    }

    solution = run_end_scenario_sizing(
        EndScenarioSizingStaged,
        base_folder=base_folder,
        esdl_file_name="Delft_T_auth.esdl",
        esdl_parser=ESDLFileParser,
        **kwargs,  # Example of usage if needed/used
    )

    with open("grow_optim.esdl", "w", encoding="utf-8") as f:
        f.write(solution.optimized_esdl_string)

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
