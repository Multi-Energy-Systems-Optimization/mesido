import datetime
import operator
import unittest
import unittest.mock
from pathlib import Path
from typing import Optional

import esdl

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import InfluxDBProfileReader, ProfileReaderFromFile
from mesido.exceptions import MesidoAssetIssueError
from mesido.potential_errors import MesidoAssetIssueType, PotentialErrors
from mesido.workflows import EndScenarioSizingStaged
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_profile_averages_timestep_size,
    adapt_profile_to_copy_for_number_of_years,
)
from mesido.workflows.utils.error_types import mesido_issue_type_gen_message

import numpy as np

import pandas as pd

from utils_test_scaling import create_log_list_scaling


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


class TestPotentialErrors(unittest.TestCase):
    def test_asset_potential_errors(self):
        """
        This test checks that the error checks in the code for sufficient installed cool/heatig
        capacity of a cold/heat demand is sufficient (grow_workflow)

        Checks:
        1. Correct error is raised
        2. That the error is due to:
            - insufficient heat specified capacities for 3 heating demands
            - incorrect heating demand type being used for 1 heating demand
            - profile cannot be assigned to a specific asset
        """
        import models.unit_cases.case_1a.src.run_1a as run_1a

        base_folder = Path(run_1a.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"

        logger, logs_list = create_log_list_scaling("WarmingUP-MPC")

        with self.assertRaises(MesidoAssetIssueError) as cm, unittest.mock.patch(
            "mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()
        ):
            problem = EndScenarioSizingStaged(
                esdl_parser=ESDLFileParser,
                base_folder=base_folder,
                model_folder=model_folder,
                input_folder=input_folder,
                esdl_file_name="1a_with_influx_profiles_error_check_1.esdl",
                profile_reader=MockInfluxDBProfileReader,
                input_timeseries_file="influx_mock.csv",
            )
            problem.pre()

        # Check that the heat demand had an error
        np.testing.assert_equal(cm.exception.error_type, MesidoAssetIssueType.HEAT_DEMAND_POWER)
        np.testing.assert_equal(
            cm.exception.general_issue,
            mesido_issue_type_gen_message(MesidoAssetIssueType.HEAT_DEMAND_POWER),
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["2ab92324-f86e-4976-9a6e-f7454b77ba3c"],
            "Asset named HeatingDemand_2ab9: The installed capacity of 6.0MW should be larger than"
            " the maximum of the heat demand profile 5175.717MW",
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["506c41ac-d415-4482-bf10-bf12f17aeac6"],
            "Asset named HeatingDemand_506c: The installed capacity of 2.0MW should be larger than"
            " the maximum of the heat demand profile 1957.931MW",
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["6662aebb-f85e-4df3-9f7e-c58993586fba"],
            "Asset named HeatingDemand_6662: The installed capacity of 2.0MW should be larger than"
            " the maximum of the heat demand profile 1957.931MW",
        )
        np.testing.assert_equal(len(cm.exception.message_per_asset_id), 3.0)

        # Check heating demand type error
        with self.assertRaises(MesidoAssetIssueError) as cm, unittest.mock.patch(
            "mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()
        ):
            problem = EndScenarioSizingStaged(
                esdl_parser=ESDLFileParser,
                base_folder=base_folder,
                model_folder=model_folder,
                input_folder=input_folder,
                esdl_file_name="1a_with_influx_profiles_error_check_2.esdl",
                profile_reader=MockInfluxDBProfileReader,
                input_timeseries_file="influx_mock.csv",
            )
            problem.pre()
        # Check that the heat demand had an error
        np.testing.assert_equal(cm.exception.error_type, MesidoAssetIssueType.HEAT_DEMAND_TYPE)
        np.testing.assert_equal(
            cm.exception.general_issue,
            mesido_issue_type_gen_message(MesidoAssetIssueType.HEAT_DEMAND_TYPE),
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["2ab92324-f86e-4976-9a6e-f7454b77ba3c"],
            "Asset named HeatingDemand_2ab9: This asset is currently a GenericConsumer please"
            " change it to a HeatingDemand",
        )
        np.testing.assert_equal(len(cm.exception.message_per_asset_id), 1.0)

        # Check asset profile capability
        with self.assertRaises(MesidoAssetIssueError) as cm, unittest.mock.patch(
            "mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()
        ):
            problem = EndScenarioSizingStaged(
                esdl_parser=ESDLFileParser,
                base_folder=base_folder,
                model_folder=model_folder,
                input_folder=input_folder,
                esdl_file_name="1a_with_influx_profiles_error_check_3.esdl",
                profile_reader=MockInfluxDBProfileReader,
                input_timeseries_file="influx_mock.csv",
            )
            problem.pre()
        # Check that the joint has an error
        np.testing.assert_equal(
            cm.exception.error_type,
            MesidoAssetIssueType.ASSET_PROFILE_CAPABILITY,
        )
        np.testing.assert_equal(
            cm.exception.general_issue,
            mesido_issue_type_gen_message(MesidoAssetIssueType.ASSET_PROFILE_CAPABILITY),
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["95802cf8-61d6-4773-bb99-e275c3bf26cc"],
            "Asset named Joint_9580: The assigment of profile field demand3_MW is not possible for"
            " this asset type <class 'esdl.esdl.Joint'>",
        )
        np.testing.assert_equal(len(cm.exception.message_per_asset_id), 1.0)


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


if __name__ == "__main__":
    # unittest.main()
    a = TestProfileLoading()
    b = TestPotentialErrors()
    c = TestProfileUpdating()
    # b.test_asset_potential_errors()
    # a.test_loading_from_influx()
    # a.test_loading_from_csv()
    # a.test_loading_from_xml()
    # a.test_loading_from_csv_with_influx_profiles_given()
    c.test_profile_updating()
