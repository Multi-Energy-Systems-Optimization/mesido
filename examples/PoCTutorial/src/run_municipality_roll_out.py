from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import run_end_scenario_sizing
from mesido.workflows.rollout_workflow import RollOutProblem # not yet added to init of workflows
# as this is still work in progress, and shouldn't be used yet.

if __name__ == "__main__":
    import time

    start_time = time.time()
    base_folder = Path(__file__).resolve().parent.parent

    solution = run_end_scenario_sizing(
        RollOutProblem,
        base_folder=base_folder,
        esdl_file_name="PoC Tutorial_2ndsource.esdl", #"GROW_withATES_Prod_install.esdl",
        esdl_parser=ESDLFileParser,
    )