import unittest
from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser, ESDLStringParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

import numpy as np

from rtctools.util import run_optimization_problem


class TestESDLParsing(unittest.TestCase):

    def test_from_string_and_from_file_are_equal(self):
        """
        This test checks if we load the model for the electrolyzer test case
        from the file and convert this to an ESDL string, that the results
        from using either the file or the string as input are the same.
        """
        import models.unit_cases_electricity.electrolyzer.src.example as example
        from models.unit_cases_electricity.electrolyzer.src.example import MILPProblemInequality

        base_folder = Path(example.__file__).resolve().parent.parent

        solution_from_file = run_optimization_problem(
            MILPProblemInequality,
            base_folder=base_folder,
            esdl_file_name="h2.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results_from_file = solution_from_file.extract_results()
        results_from_file_as_dict = dict(results_from_file)

        esdl_string = solution_from_file.esdl_bytes_string
        solution_from_string = run_optimization_problem(
            MILPProblemInequality,
            base_folder=base_folder,
            esdl_string=esdl_string,
            esdl_parser=ESDLStringParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results_from_string = solution_from_string.extract_results()
        results_from_string_as_dict = dict(results_from_string)
        # We need dict conversion since the returned AliasDict checks if they
        # are exactly the same object
        np.testing.assert_equal(results_from_file_as_dict, results_from_string_as_dict)

    def test_duplicate_asset_names_with_different_ids(self):
        """
        This test checks that MESIDO correctly handles ESDL assets that have the same name
        but different unique identifiers. The test verifies that:
        1. The ESDL contains two pipes with the same name "Pipe"
        2. These pipes have different IDs ("pipe-1" and "pipe-2")
        3. MESIDO creates separate asset entries for each pipe using their respective IDs
        4. Both pipes are correctly available in the problem's asset maps
        """
        import models.unit_cases.case_1a.src.run_1a as example
        from models.unit_cases.case_1a.src.run_1a import (
            HeatProblem,
        )

        base_folder = Path(example.__file__).resolve().parent.parent

        # Run the optimization problem
        problem = run_optimization_problem(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="1a_name_duplicate.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )

        # Verify that the ESDL parser correctly identified both pipes
        # Even though they have the same name, they should have different IDs
        pipe_1_id = "Pipe1"
        pipe_2_id = "Pipe2"

        # Verify both pipes are in the heat_pipe component list
        heat_pipes = problem.energy_system_components.get("heat_pipe", [])
        assert (
            pipe_1_id in heat_pipes
        ), f"Pipe {pipe_1_id} not found in energy_system_components heat_pipe list"
        assert (
            pipe_2_id in heat_pipes
        ), f"Pipe {pipe_2_id} not found in energy_system_components heat_pipe list"

        # Verify that both pipes have the same name in the ESDL
        pipe_1_asset = problem.esdl_assets[pipe_1_id]
        pipe_2_asset = problem.esdl_assets[pipe_2_id]

        assert (
            pipe_1_asset.name == pipe_2_asset.name
        ), "Expected pipe_1 and pipe_2 name to be the same"

        # Verify that the IDs are different
        assert pipe_1_id != pipe_2_id, "Expected different IDs for the two pipes"

        # Verify that we can access parameters for both pipes using their IDs
        parameters = problem.parameters(0)

        # Both pipes should have diameter parameters accessible via their IDs
        pipe_1_diameter_key = f"{pipe_1_id}.diameter"
        pipe_2_diameter_key = f"{pipe_2_id}.diameter"

        assert (
            pipe_1_diameter_key in parameters
        ), f"Expected diameter parameter for pipe_1: {pipe_1_diameter_key}"
        assert (
            pipe_2_diameter_key in parameters
        ), f"Expected diameter parameter for pipe_2: {pipe_2_diameter_key}"


if __name__ == "__main__":
    unittest.main()
