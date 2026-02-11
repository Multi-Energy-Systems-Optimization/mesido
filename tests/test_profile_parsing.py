import datetime
import operator
import os
import unittest
import unittest.mock
from pathlib import Path
from typing import Dict, Optional, Tuple

import esdl

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import InfluxDBProfileReader, ProfileReaderFromFile
from mesido.workflows import EndScenarioSizingStaged
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_profile_averages_timestep_size,
    adapt_profile_to_copy_for_number_of_years,
)

import numpy as np

import pandas as pd


class MockInfluxDBProfileReader(InfluxDBProfileReader):
    def __init__(
        self,
        energy_system: esdl.EnergySystem,
        file_path: Optional[Path],
        database_credentials: Optional[Dict[str, Tuple[str, str]]] = None,
    ):
        super().__init__(energy_system, file_path, database_credentials=database_credentials)
        self._loaded_profiles = pd.read_csv(
            file_path,
            index_col="DateTime",
            date_parser=lambda x: pd.to_datetime(x).tz_convert(datetime.timezone.utc),
        )

    def _load_profile_timeseries_from_database(self, profile: esdl.InfluxDBProfile) -> pd.Series:
        return self._loaded_profiles[profile.id]


class TestProfileUpdating(unittest.TestCase):
    def test_profile_updating(self):
        """
        Tests the updating of the profiles.
        The peak day hourly with averaged 5 days is currently tested in test_cold_demand.py.
        This test covers the profile updating with varying timescales. Of amongst others the
        adapt_hourly_profile_averages_timestep_size method and the
        adapt_profile_to_copy_for_number_of_years method in adapt_profiles.py

        Returns:

        """
        import models.unit_cases.case_3a.src.run_3a as run_3a
        from models.unit_cases.case_3a.src.run_3a import HeatProblem

        base_folder = Path(run_3a.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"

        problem_step_size = 8

        class ProfileUpdateHourly(HeatProblem):
            def read(self):
                """
                Reads a profile with hourly time steps and adapts and adapts to averages over the
                specified number of hours.
                """
                super().read()

                adapt_hourly_profile_averages_timestep_size(self, problem_step_size)

        problem = ProfileUpdateHourly(
            esdl_parser=ESDLFileParser,
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="3a.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )
        problem.pre()

        timeseries_updated = problem.io.datetimes
        dts = list(map(operator.sub, timeseries_updated[1:], timeseries_updated[0:-1]))
        assert all(dt.seconds == 3600 * problem_step_size for dt in dts[:-1])
        assert dts[-1].seconds <= 3600 * problem_step_size

        # TODO: also check the values of the averages

        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"
        problem_years = 3

        class ProfileUpdateMultiYear(HeatProblem):
            def read(self):
                """
                Reads the yearly profile with unspecified time steps and copies the profile for
                multiple years.
                """
                super().read()

                adapt_profile_to_copy_for_number_of_years(self, problem_years)

        problem = ProfileUpdateMultiYear(
            esdl_parser=ESDLFileParser,
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )
        problem.pre()

        # TODO: update checks
        len_org_time_serie = 8760  # the last timestep is not copied
        timeseries_updated = problem.io.datetimes
        dts = list(
            map(
                operator.sub,
                timeseries_updated[len_org_time_serie:-1],
                timeseries_updated[0:-len_org_time_serie],
            )
        )
        assert len(timeseries_updated) == len_org_time_serie * problem_years
        assert all(dt.days == 365 for dt in dts)


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

        problem = EndScenarioSizingStaged(
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
            self.assertEqual(profile_values[0], profile_values[1])
            self.assertEqual(len(profile_values), 26)

        heat_price_profile = problem.get_timeseries("Heat.price_profile").values
        self.assertEqual(heat_price_profile[0], heat_price_profile[1])
        self.assertLess(max(heat_price_profile), 1.0)

    def test_loading_from_csv(self):
        """
        This test constructs a problem with input profiles read from a CSV file.
        The test checks if the profiles read match the profiles from the CVS file and that the
        default UTC timezone has been set.
        """
        import models.unit_cases_electricity.electrolyzer.src.example as example
        from models.unit_cases_electricity.electrolyzer.src.example import MILPProblemInequality

        base_folder = Path(example.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"
        problem = MILPProblemInequality(
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
        np.testing.assert_equal(
            expected_array, problem.get_timeseries("Hydrogen.price_profile").values
        )

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
        from models.unit_cases_electricity.electrolyzer.src.example import MILPProblemInequality

        base_folder = Path(example.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"
        problem = MILPProblemInequality(
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
        np.testing.assert_equal(
            expected_array, problem.get_timeseries("Hydrogen.price_profile").values
        )

    def test_loading_profile_from_esdl(self):
        """
        This test loads a problem using an ESDL file which has influxDB profiles
        specified, and checks if the profile_parser correctly loads those profiles
        and checks for their correctness against a manually loaded csv file with the same profiles.
        """
        import models.unit_cases.case_3a.src.run_3a as run_3a
        from models.unit_cases.case_3a.src.run_3a import HeatProblemESDLProdProfile

        base_folder = Path(run_3a.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"
        problem = HeatProblemESDLProdProfile(
            base_folder=base_folder,
            model_folder=model_folder,
            esdl_file_name="3a_esdl_multiple_heat_sources_unscaled_profile.esdl",
            esdl_parser=ESDLFileParser,
        )
        problem.pre()

        expected_values_file = pd.read_csv(
            os.path.join(input_folder, "SpaceHeat&HotWater_PowerProfile_2000_2010.csv")
        )
        expected_values = expected_values_file["Ruimte&Tap_W"]
        for asset in problem.energy_system_components.get("heat_source"):
            np.testing.assert_allclose(
                problem.get_timeseries(f"{asset}.maximum_heat_source").values,
                expected_values * 1e6,
                atol=1e-2,
            )

    def test_loading_profiles_ensemble_members(self):
        """
        This is the most basic check where we have a simple network and check for the basic physics.
        This simple network includes two source, pipes, nodes, and 3 demands.

        Checks;
        - Demand matching
        - Energy conservation
        - Heat to discharge

        """
        import models.unit_cases.case_2a_ensemble.src.run_2a as run_2a
        from models.unit_cases.case_2a_ensemble.src.run_2a import HeatProblemEnsemble

        base_folder = Path(run_2a.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"

        problem = HeatProblemEnsemble(
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="2a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )

        problem.pre()

        #check that the ensemble size is set at 2, which is based on the ensemble.csv
        np.testing.assert_equal(problem.ensemble_size, 2)

        # check that the timeseries are loaded for all ensemble sizes and that the timeseries are
        # equal to a heating demand of 350000 except for HeatingDemand_6f99 at the second
        # ensemble, where it is equal to 300000.
        timeseries_names = problem.io.get_timeseries_names()
        for t_name in timeseries_names:
            for e_m in range(problem.ensemble_size):
                t_series = problem.get_timeseries(t_name, e_m)
                if e_m == 1 and t_name == 'HeatingDemand_6f99.target_heat_demand':
                    np.testing.assert_allclose(t_series.values, [300000]*3)
                else:
                    np.testing.assert_allclose(t_series.values, [350000]*3)


if __name__ == "__main__":
    # unittest.main()
    a = TestProfileLoading()
    c = TestProfileUpdating()
    a.test_loading_from_influx()
    a.test_loading_from_csv()
    a.test_loading_from_xml()
    a.test_loading_from_csv_with_influx_profiles_given()
    c.test_profile_updating()
    a.test_loading_profile_from_esdl()
