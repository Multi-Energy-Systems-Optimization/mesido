import datetime
import operator
import os
import unittest
import unittest.mock
from pathlib import Path
from typing import Optional

import esdl

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ESDLProfileReader, ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization
from mesido.workflows import EndScenarioSizingStaged
from mesido.workflows.utils.adapt_profiles import (
    adapt_profile_to_averaged_timestep,
    adapt_profile_to_copy_for_number_of_years,
)

import numpy as np

import pandas as pd

from utils_tests import (
    demand_matching_test,
    electric_power_conservation_test,
    energy_conservation_test,
    heat_to_discharge_test,
)


class MockESDLProfileReader(ESDLProfileReader):
    def __init__(
        self,
        energy_system: esdl.EnergySystem,
        file_path: Optional[Path],
        use_esdl_ranged_contraint: bool,
    ):
        super().__init__(
            energy_system,
            file_path,
            use_esdl_ranged_contraint=use_esdl_ranged_contraint,
        )
        self._loaded_profiles = pd.read_csv(
            file_path,
            index_col="DateTime",
            date_parser=lambda x: pd.to_datetime(x).tz_convert(datetime.timezone.utc),
        )

    def _load_profile_timeseries_from_database(self, profile: esdl.InfluxDBProfile) -> pd.Series:
        return self._loaded_profiles[profile.id]


class TestProfileParsing(unittest.TestCase):
    def test_parsing_input_profile_with_15min_timesteps(self):
        """
        Tests that a full optimization runs correctly when input profiles have 15-minute
        time steps.

        Uses the sourcesink_with_eboiler model (HeatingDemand + ElectricBoiler +
        ElectricityProducer) and an input csv with 15 minutes time steps.

        Checks:
        - Standard demand matching, energy conservation, heat-to-discharge and electric
          power conservation checks pass.
        - Input CSV has 15-min time spacing and expected number of data points
        - Input profile is parsed correctly (1-day average time steps).
        - Resulting demand, e-source and e-price profile lengths are correct
        - No indexing problem with input demand and electricity profile

        """
        import models.source_pipe_sink.src.double_pipe_heat as double_pipe_heat
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSinkDayAveraged

        base_folder = Path(double_pipe_heat.__file__).resolve().parent.parent

        day_steps = 1  # average over 1 day for profile parsing

        solution = run_esdl_mesido_optimization(
            SourcePipeSinkDayAveraged,
            base_folder=base_folder,
            esdl_file_name="sourcesink_with_eboiler.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import_15min.csv",
            _day_steps=day_steps,
        )

        results = solution.extract_results()

        # Check: utils tests
        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)
        electric_power_conservation_test(solution, results)

        # Check: input CSV has 15-min time spacing and expected number of data points
        input_csv_path = base_folder / "input" / "timeseries_import_15min.csv"
        input_data = pd.read_csv(input_csv_path)
        dt0 = datetime.datetime.strptime(input_data["DateTime"].iloc[0], "%d-%m-%Y %H:%M")
        dt1 = datetime.datetime.strptime(input_data["DateTime"].iloc[1], "%d-%m-%Y %H:%M")
        input_timestep_seconds = (dt1 - dt0).total_seconds()
        np.testing.assert_array_equal(
            input_timestep_seconds,
            900,
            err_msg=f"Expected timestep is 900 s(15 min), got {input_timestep_seconds} s",
        )
        input_n_days = 3
        input_n_steps = (
            input_n_days * 24 * (3600 / input_timestep_seconds)
        )  # 3 days x 24 hr/day x 4 steps/hr = 288
        np.testing.assert_array_equal(
            len(input_data),
            input_n_steps,
        )

        # Check: input profile is parsed correctly (1-day average timesteps)
        expected_n_output_intervals = input_n_days // day_steps  # 3
        datetimes = solution.io.datetimes
        np.testing.assert_array_equal(
            len(datetimes),
            expected_n_output_intervals + 1,  # +1 for closing sentinel
        )
        dts = [datetimes[i + 1] - datetimes[i] for i in range(len(datetimes) - 1)]
        expected_step_seconds = day_steps * 24 * 3600  # 86 400 s = 1 day
        actual_step_seconds = np.array([dt.total_seconds() for dt in dts])
        np.testing.assert_array_equal(
            expected_step_seconds,
            actual_step_seconds,
        )
        np.testing.assert_array_equal(
            expected_step_seconds,
            np.diff(solution.times()),
        )

        # Check: resulting demand, e-source and e-price profile lengths are correct
        name_to_id_map = solution.esdl_asset_name_to_id_map
        demand_id = name_to_id_map["demand"]
        electricity_producer_id = name_to_id_map["ElectricityProducer_4dde"]

        np.testing.assert_array_equal(
            len(results[f"{demand_id}.Heat_demand"]),
            expected_n_output_intervals + 1,
        )
        np.testing.assert_array_equal(
            len(results[f"{electricity_producer_id}.Electricity_source"]),
            expected_n_output_intervals + 1,
        )
        np.testing.assert_array_equal(
            len(solution.get_timeseries("elec.price_profile").values),
            expected_n_output_intervals + 1,
        )


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

                adapt_profile_to_averaged_timestep(self, problem_step_size)

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
            profile_reader=MockESDLProfileReader,
            input_timeseries_file="influx_mock.csv",
        )
        problem.pre()
        name_to_id_map = problem.esdl_asset_name_to_id_map

        np.testing.assert_equal(problem.io.reference_datetime.tzinfo, datetime.timezone.utc)

        # the three demands in the test ESDL
        for demand_name in ["HeatingDemand_2ab9", "HeatingDemand_6662", "HeatingDemand_506c"]:
            demand_id = name_to_id_map[demand_name]
            profile_values = problem.get_timeseries(f"{demand_id}.target_heat_demand").values
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

        name_to_id_map = problem.esdl_asset_name_to_id_map

        np.testing.assert_equal(problem.io.reference_datetime.tzinfo, datetime.timezone.utc)

        expected_array = np.array([1.0e8] * 3)
        np.testing.assert_equal(
            expected_array,
            problem.get_timeseries(
                f"{name_to_id_map['WindPark_7f14']}.maximum_electricity_source"
            ).values,
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
        name_to_id_map = problem.esdl_asset_name_to_id_map

        np.testing.assert_equal(problem.io.reference_datetime.tzinfo, datetime.timezone.utc)

        expected_array = np.array([1.5e5] * 16 + [1.0e5] * 13 + [0.5e5] * 16)
        np.testing.assert_equal(
            expected_array,
            problem.get_timeseries(f"{name_to_id_map['demand']}.target_heat_demand").values,
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
        name_to_id_map = problem.esdl_asset_name_to_id_map

        np.testing.assert_equal(problem.io.reference_datetime.tzinfo, datetime.timezone.utc)

        expected_array = np.array([1.0e8] * 3)
        wind_park_id = name_to_id_map["WindPark_7f14"]
        np.testing.assert_equal(
            expected_array,
            problem.get_timeseries(f"{wind_park_id}.maximum_electricity_source").values,
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
        for asset_id in problem.energy_system_components.get("heat_source"):
            np.testing.assert_allclose(
                problem.get_timeseries(f"{asset_id}.maximum_heat_source").values,
                expected_values * 1e6,
                atol=1e-2,
            )

    def test_loading_profiles_ensemble_members(self):
        """
        This test constructs multiple ensemble members based on an "ensemble_member" CSV file
        that describes the probability of the ensemble member and the name and number.
        The profiles related to each ensemble member are read from the respective CSV files and
        saved in for each member.
        The test checks if the profiles read match the profiles from the CVS files and if the
        ensemble_member_size is set accordingly.
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

        name_to_id = problem.esdl_asset_name_to_id_map

        # check that the ensemble size is set at 2, which is based on the ensemble.csv
        np.testing.assert_equal(problem.ensemble_size, 2)
        prob_0 = problem.ensemble_member_probability(0)
        prob_1 = problem.ensemble_member_probability(1)
        np.testing.assert_allclose(prob_0, 0.7)
        np.testing.assert_allclose(prob_1, 0.3)

        # check that the timeseries are loaded for all ensemble sizes and that the timeseries are
        # equal to a heating demand of 350000 except for HeatingDemand_6f99 at the second
        # ensemble, where it is equal to 300000.
        timeseries_names = problem.io.get_timeseries_names()
        for t_name in timeseries_names:
            for e_m in range(problem.ensemble_size):
                t_series = problem.get_timeseries(t_name, e_m)
                if e_m == 1 and t_name == f"{name_to_id['HeatingDemand_6f99']}.target_heat_demand":
                    np.testing.assert_allclose(t_series.values, [300000] * 3)
                else:
                    np.testing.assert_allclose(t_series.values, [350000] * 3)


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
