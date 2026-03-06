import os
import sys

import logging
from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing
from mesido.workflows.utils.error_types import NetworkErrors

logger = logging.getLogger("mesido")
logger.setLevel(logging.INFO)


if __name__ == "__main__":

    root_folder = os.path.join(Path(__file__).resolve().parent.parent.parent.parent, "tests")
    sys.path.insert(1, root_folder)

    base_folder = Path(__file__).resolve().parent.parent

    solution = run_end_scenario_sizing(
        EndScenarioSizingStaged,
        base_folder=base_folder,
        esdl_file_name=("Heating and cooling and elec network with return network with costs.esdl"),
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_4_elect_cost_modified.csv",
        error_type_check=NetworkErrors.HEAT_AND_COOL_NETWORK_ERRORS,
    )

    results = solution.extract_results()
