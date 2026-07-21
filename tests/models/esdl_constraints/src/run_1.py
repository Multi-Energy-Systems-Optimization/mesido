from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStaged

# from rtctools.util import run_optimization_problem


class NetworkProblem(EndScenarioSizingStaged):
    ...
    # Nothing to be added for now


if __name__ == "__main__":
    base_folder = Path(__file__).resolve().parent.parent
    model_folder = base_folder / "model"

    problem = EndScenarioSizingStaged(
        # base_folder=base_folder,
        # model_folder=model_folder,
        esdl_parser=ESDLFileParser,
        esdl_file_name="testing_network_1.esdl",
    )
    problem.pre()

    # For potential future
    # This network has not been setup to be able to optimize yet
    # solution = run_optimization_problem(
    #     problem,
    # )
    # results = solution.extract_results()
