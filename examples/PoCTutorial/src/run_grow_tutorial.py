from pathlib import Path

from mesido.esdl.esdl_mixin import ESDLOutputProfilesType, DBAccessType
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing


class EndScenarioSizingStagedHighs(EndScenarioSizingStaged):
    pass


if __name__ == "__main__":
    import time

    kwargs = {
        "esdl_profiles_output_type": ESDLOutputProfilesType.POSTGRESQL,
        "database_connections": [
            {
                "access_type": DBAccessType.WRITE,  # DBAccessType.READ or DBAccessType.READ_WRITE
                "host": "localhost",
                "port": 8086,
                "username": None,
                "password": None,
                "ssl": False,
                "verify_ssl": False,
            },
        ],
    }

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent.parent
    solution = run_end_scenario_sizing(
        EndScenarioSizingStagedHighs,
        base_folder=base_folder,
        esdl_file_name="PoC Tutorial.esdl",
        esdl_parser=ESDLFileParser,
        # **kwargs,
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
