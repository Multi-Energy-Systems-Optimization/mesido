from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStagedHIGHS, run_end_scenario_sizing
from mesido.workflows.grow_workflow import EndScenarioSizingStagedGurobi

if __name__ == "__main__":
    import time

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent.parent

    solution = run_end_scenario_sizing(
        EndScenarioSizingStagedHIGHS,
        base_folder=base_folder,
        esdl_file_name="Base Netwerk Delft.esdl",
        esdl_parser=ESDLFileParser,
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
