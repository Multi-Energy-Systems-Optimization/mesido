from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows import EndScenarioSizingStagedHIGHS, run_end_scenario_sizing
from mesido.workflows.grow_workflow import EndScenarioSizingHeadLossStagedGurobi, \
    EndScenarioSizingStagedGurobi, EndScenarioSizingHeadLossStaged

if __name__ == "__main__":
    import time

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent.parent

    solution = run_end_scenario_sizing(
        EndScenarioSizingHeadLossStagedGurobi,
        base_folder=base_folder,
        esdl_file_name="GROW_withATES_Prod_install.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="demand_profiles.csv",
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
