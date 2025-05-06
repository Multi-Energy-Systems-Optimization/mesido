from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing
from mesido.workflows.utils.error_types import HEAT_NETWORK_ERRORS, NO_POTENTIAL_ERRORS_CHECK


if __name__ == "__main__":
    import time

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent.parent

    # This test should pass, and the execution should stop after preprocess from EndScenarioSizing is completed.
    solution = run_end_scenario_sizing(
        EndScenarioSizingStaged,
        base_folder=base_folder,
        esdl_file_name="graph_HDemands_incl_demand_4.esdl",
        esdl_parser=ESDLFileParser,
        error_type_check=HEAT_NETWORK_ERRORS
    )


    # This test should fail, and the execution should stop after preprocess from EndScenarioSizing is completed.
    solution = run_end_scenario_sizing(
        EndScenarioSizingStaged,
        base_folder=base_folder,
        esdl_file_name="graph_HDemands_incl_demand_4_missing.esdl",
        esdl_parser=ESDLFileParser,
        error_type_check=NO_POTENTIAL_ERRORS_CHECK
    )


    # This test should pass, and the execution should stop after preprocess from EndScenarioSizing is completed.
    solution = run_end_scenario_sizing(
        EndScenarioSizingStaged,
        base_folder=base_folder,
        esdl_file_name="graph_HDemands_incl_demand_4_incorrect.esdl",
        esdl_parser=ESDLFileParser,
        error_type_check=NO_POTENTIAL_ERRORS_CHECK
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
