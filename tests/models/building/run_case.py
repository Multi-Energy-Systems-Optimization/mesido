import logging
from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing

logger = logging.getLogger("mesido")
logger.setLevel(logging.INFO)


if __name__ == "__main__":
    import time
    from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing
    # from mesido.workflows.utils.error_types import NetworkError

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent

    solution = run_end_scenario_sizing(
        EndScenarioSizingStaged,
        base_folder=base_folder,
        esdl_file_name="source buildingsink with multiple demand profiles.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        # error_type_check=NetworkErrors.HEAT_AND_COOL_NETWORK_ERRORS,
    )
    results = solution.extract_results()

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))