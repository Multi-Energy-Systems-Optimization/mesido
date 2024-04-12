import datetime
import unittest
from pathlib import Path
from typing import Optional

import esdl

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import InfluxDBProfileReader, ProfileReaderFromFile
from mesido.workflows import EndScenarioSizingStagedHIGHS

import numpy as np

import pandas as pd


class MockInfluxDBProfileReader(InfluxDBProfileReader):
    def __init__(self, energy_system: esdl.EnergySystem, file_path: Optional[Path]):
        super().__init__(energy_system, file_path)
        self._loaded_profiles = pd.read_csv(
            file_path,
            index_col="DateTime",
            date_parser=lambda x: pd.to_datetime(x).tz_convert(datetime.timezone.utc),
        )

    def _load_profile_timeseries_from_database(self, profile: esdl.InfluxDBProfile) -> pd.Series:
        return self._loaded_profiles[profile.id]


class TestProfileLoading(unittest.TestCase):
    def test_loading_from_influx(self):
        """
        This test checks if loading an ESDL with influxDB profiles works. Since
        the test environment doesn't always have access to an influxDB server,
        a connection is mocked and profiles are instead loaded from the file
        "influx_mock.csv" in the models/unit_cases/case_1a/input folder.
        EndScenarioSizing is called thus the checks done are on profile lenghts
        and some values. This is because this scenario should also do aggragation
        of the profiles for non-peak days.

        Also check:
            - that the timezone setting from the "influx_mock.csv" is correct
        """
        import models.unit_cases.case_1a.src.run_1a as run_1a

        base_folder = Path(run_1a.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"
        problem = EndScenarioSizingStagedHIGHS(
            esdl_parser=ESDLFileParser,
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="1a_with_influx_profiles.esdl",
            profile_reader=MockInfluxDBProfileReader,
            input_timeseries_file="influx_mock.csv",
        )
        problem.pre()

        np.testing.assert_equal(problem.io.reference_datetime.tzinfo, datetime.timezone.utc)

        # the three demands in the test ESDL
        for demand_name in ["HeatingDemand_2ab9", "HeatingDemand_6662", "HeatingDemand_506c"]:
            profile_values = problem.get_timeseries(f"{demand_name}.target_heat_demand").values
            self.assertEqual(profile_values[0], 0.0)
            self.assertEqual(len(profile_values), 26)

        heat_price_profile = problem.get_timeseries("Heat.price_profile").values
        self.assertEqual(heat_price_profile[0], 0.0)
        self.assertLess(max(heat_price_profile), 1.0)

    def test_loading_from_csv(self):
        """
        This test constructs a problem with input profiles read from a CSV file.
        The test checks if the profiles read match the profiles from the CVS file and that the
        default UTC timezone has been set.
        """
        import models.unit_cases_electricity.electrolyzer.src.example as example
        from models.unit_cases_electricity.electrolyzer.src.example import MILPProblem

        base_folder = Path(example.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"
        problem = MILPProblem(
            esdl_parser=ESDLFileParser,
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="h2.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        problem.pre()

        np.testing.assert_equal(problem.io.reference_datetime.tzinfo, datetime.timezone.utc)

        expected_array = np.array([1.0e8] * 3)
        np.testing.assert_equal(
            expected_array,
            problem.get_timeseries("WindPark_7f14.maximum_electricity_source").values,
        )

        expected_array = np.array([1.0] * 3)
        np.testing.assert_equal(expected_array, problem.get_timeseries("elec.price_profile").values)

        expected_array = np.array([1.0e6] * 3)
        np.testing.assert_equal(expected_array, problem.get_timeseries("gas.price_profile").values)

    def test_loading_from_xml(self):
        """
        This test loads a simple problem using an XML file for input profiles.
        The test checks if the load profiles match those specified in the XML file and that the
        default UTC timezone has been set.
        """
        import models.basic_source_and_demand.src.heat_comparison as heat_comparison
        from models.basic_source_and_demand.src.heat_comparison import HeatESDL

        base_folder = Path(heat_comparison.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"
        problem = HeatESDL(
            esdl_parser=ESDLFileParser,
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="model.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.xml",
        )
        problem.pre()

        np.testing.assert_equal(problem.io.reference_datetime.tzinfo, datetime.timezone.utc)

        expected_array = np.array([1.5e5] * 16 + [1.0e5] * 13 + [0.5e5] * 16)
        np.testing.assert_equal(
            expected_array, problem.get_timeseries("demand.target_heat_demand").values
        )

    def test_loading_from_csv_with_influx_profiles_given(self):
        """
        This test loads a problem using an ESDL file which has influxDB profiles
        specified. Furthermore, the problem is given a csv file to load profiles
        from. This test thus checks if the ESDL_mixin correctly loads the profiles
        from the csv instead of trying to get them from influxDB. The test check
        if the loaded profiles match those specified in the csv.
        """
        import models.unit_cases_electricity.electrolyzer.src.example as example
        from models.unit_cases_electricity.electrolyzer.src.example import MILPProblem

        base_folder = Path(example.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"
        problem = MILPProblem(
            esdl_parser=ESDLFileParser,
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="h2_profiles_added_dummy_values.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        problem.pre()

        np.testing.assert_equal(problem.io.reference_datetime.tzinfo, datetime.timezone.utc)

        expected_array = np.array([1.0e8] * 3)
        np.testing.assert_equal(
            expected_array,
            problem.get_timeseries("WindPark_7f14.maximum_electricity_source").values,
        )

        expected_array = np.array([1.0] * 3)
        np.testing.assert_equal(expected_array, problem.get_timeseries("elec.price_profile").values)

        expected_array = np.array([1.0e6] * 3)
        np.testing.assert_equal(expected_array, problem.get_timeseries("gas.price_profile").values)


if __name__ == "__main__":
    unittest.main()
