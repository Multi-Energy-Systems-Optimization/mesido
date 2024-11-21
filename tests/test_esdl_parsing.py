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


if __name__ == "__main__":
    unittest.main()
