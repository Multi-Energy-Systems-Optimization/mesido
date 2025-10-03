import os
import sys
from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.gas_elect_workflow import GasElectProblem
from mesido.workflows.utils.helpers import run_optimization_problem_solver


root_folder = os.path.join(str(Path(__file__).resolve().parent.parent.parent.parent), "tests")
sys.path.insert(1, root_folder)

if __name__ == "__main__":
    import time

    start_time = time.time()

    solution = run_optimization_problem_solver(
        GasElectProblem,
        esdl_parser=ESDLFileParser,
        esdl_file_name="gas_elect_loop_tree.esdl",
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="HeatingDemand_W_manual.csv",
    )

    results = solution.extract_results()
    parameters = solution.parameters(0)
