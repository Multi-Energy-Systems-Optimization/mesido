import unittest
from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser, ESDLStringParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from rtctools.util import run_optimization_problem
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day,
)

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


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

    def test_heat_cold_demand_peak_overlap(self):
        """
        This is a demand parsing and discretization test.
        It checks whether the timeseries are discretized correctly. This case runs a heat and
        cold demand case where the heat and cold demand peak days are on the same day.
        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent
        
        class DiscretizationProblem(HeatProblem):
            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)
                self.day_steps = 1
            
            def read(self):
                super().read()
                
                (
                    self.__indx_max_peak,
                    self.__heat_demand_nominal,
                    self.__cold_demand_nominal,
                ) = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(
                    self,
                    self.day_steps,
                )

        heat_problem = run_esdl_mesido_optimization(
            DiscretizationProblem,
            base_folder=base_folder,
            esdl_file_name="LT_wko.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_peak_overlap.csv",
        )
        results = heat_problem.extract_results()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)

    def test_heat_cold_demand_peak_back_to_back(self):
        """
        This is a demand parsing and discretization test.
        It checks whether the timeseries are discretized correctly. This case runs a heat and
        cold demand case where the heat and cold demand peak days are back to back.
        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent
        
        class DiscretizationProblem(HeatProblem):
            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)
                self.day_steps = 1
            
            def read(self):
                super().read()
                
                (
                    self.__indx_max_peak,
                    self.__heat_demand_nominal,
                    self.__cold_demand_nominal,
                ) = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(
                    self,
                    self.day_steps,
                )

        heat_problem = run_esdl_mesido_optimization(
            DiscretizationProblem,
            base_folder=base_folder,
            esdl_file_name="LT_wko.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_peak_back_to_back.csv",
        )
        results = heat_problem.extract_results()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)
        

    def test_heat_cold_peak_before_heat(self):
        """
        This is a demand parsing and discretization test.
        It checks whether the timeseries are discretized correctly. This case runs a heat and
        cold demand case where the cold demand peak happens before the heat one.
        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent
        
        class DiscretizationProblem(HeatProblem):
            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)
                self.day_steps = 1
            
            def read(self):
                super().read()
                
                (
                    self.__indx_max_peak,
                    self.__heat_demand_nominal,
                    self.__cold_demand_nominal,
                ) = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(
                    self,
                    self.day_steps,
                )

        heat_problem = run_esdl_mesido_optimization(
            DiscretizationProblem,
            base_folder=base_folder,
            esdl_file_name="LT_wko.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_cold_peak_before.csv",
        )
        results = heat_problem.extract_results()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)


if __name__ == "__main__":
    unittest.main()
