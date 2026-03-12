from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization
from mesido.workflows.goals.minimize_tco_goal import MinimizeTCO

import numpy as np

import pytest

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestProducerMaxProfile(TestCase):
    """
    A test to verify that the heat produced by a heat producer is capped by a profile, where the
    producer will always produce equal or less than said profile. This constraint is checked for a
    producer, where the producer's profile was also intentionally smaller than required for a
    couple of timesteps

    """

    @pytest.mark.slow_1
    @pytest.mark.timeout(150)  # overrides the default timelimt of the pytest command
    def test_max_producer_scaled_profile(self):
        """
        Use a scaled profile, where the profile was intentionally reduced for a couple of
        time-steps (reducing the profile value at a few time steps). With the producer size not
        being minimized.

        Checks:
        - Standard checks demand matching, energy conservation and heat to discharge
        - Check that the heat_source <= scaled_profile * size_source

        """

        import models.unit_cases.case_3a.src.run_3a as run_3a
        from models.unit_cases.case_3a.src.run_3a import HeatProblemProdProfile

        base_folder = Path(run_3a.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            HeatProblemProdProfile,
            base_folder=base_folder,
            esdl_file_name="3a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )
        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)
        tol = 1e-8
        heat_producer = results["GeothermalSource_b702.Heat_source"]
        size_producer = results["GeothermalSource_b702__max_size"]

        heat_producer_profile_scaled = solution.get_timeseries(
            "GeothermalSource_b702.maximum_heat_source"
        ).values
        heat_producer_profile_full = heat_producer_profile_scaled * size_producer

        # check that heat produced is smaller than the profile
        biggerthen = all(heat_producer_profile_full + tol >= heat_producer)
        self.assertTrue(biggerthen)

    @pytest.mark.slow_1
    @pytest.mark.timeout(150)  # overrides the default timelimt of the pytest command
    def test_max_producer_esdl_unscaled_profile(self):
        """
        Use a profile specified in Watts, where the profile was intentionally modified (via the
        profile multiplier) such that it is smaller than the requried heating demand at a couple of
        timesteps. With the producer size being minimized.

        Checks:
        - Standard checks demand matching, energy conservation and heat to discharge
        - Check that the heat source <= specified profile [W]
        - Check that heat produced is capped at a couple of timesteps
        """

        import models.unit_cases.case_3a.src.run_3a as run_3a
        from models.unit_cases.case_3a.src.run_3a import BeseProblemProdProfile

        base_folder = Path(run_3a.__file__).resolve().parent.parent

        class HeatProblemESDLProdProfileAdaptedTCO(BeseProblemProdProfile):
            def read(self):
                super().read()
                set_producer = "HeatProducer_b702"
                producer_timeseries = self.get_timeseries(
                    f"{set_producer}.maximum_heat_source"
                ).values
                producer_timeseries[0:5] = np.ones(5) * 500.0e3
                self.set_timeseries(f"{set_producer}.maximum_heat_source", producer_timeseries)

            def goals(self):
                goals = super().goals().copy()
                goals.append(MinimizeTCO(priority=20, number_of_years=1))

                return goals

        for problem_class in [BeseProblemProdProfile, HeatProblemESDLProdProfileAdaptedTCO]:

            if problem_class == BeseProblemProdProfile:
                # No sizing of the producer
                esdl_file_used = "3a_esdl_source_unscaled_profile.esdl"
            elif problem_class == HeatProblemESDLProdProfileAdaptedTCO:
                # Sizing of the producer is included
                esdl_file_used = "3a_esdl_source_unscaled_profile_sizing_no_storage.esdl"

            solution = run_esdl_mesido_optimization(
                problem_class,
                base_folder=base_folder,
                esdl_file_name=esdl_file_used,
                esdl_parser=ESDLFileParser,
            )
            results = solution.extract_results()

            demand_matching_test(solution, results)
            energy_conservation_test(solution, results)
            heat_to_discharge_test(solution, results, atol=1.0)
            tol = 1e-4
            heat_produced = results["HeatProducer_b702.Heat_source"]

            if problem_class == BeseProblemProdProfile:
                heat_production_upper_limit = solution.get_timeseries(
                    "HeatProducer_b702.maximum_heat_source"
                ).values
                np.testing.assert_equal(
                    solution.esdl_assets[
                        solution.esdl_asset_name_to_id_map["HeatProducer_b702"]
                    ].attributes["power"],
                    results["HeatProducer_b702__max_size"],
                )
                np.testing.assert_array_less(heat_produced - tol, heat_production_upper_limit)
                np.testing.assert_array_less(
                    3,
                    np.sum(
                        np.isclose(heat_produced, heat_production_upper_limit, atol=tol, rtol=1e-10)
                    ),
                )
                np.testing.assert_array_less(
                    np.sum(
                        np.isclose(heat_produced, heat_production_upper_limit, atol=tol, rtol=1e-10)
                    ),
                    20,
                )  # checking that the upper production limit was not achieved for all entries
            elif problem_class == HeatProblemESDLProdProfileAdaptedTCO:
                heat_production_upper_limit = (
                    solution.get_timeseries("HeatProducer_b702.maximum_heat_source").values
                    / max(solution.get_timeseries("HeatProducer_b702.maximum_heat_source").values)
                    * results["HeatProducer_b702__max_size"]
                )
                np.testing.assert_allclose(
                    max(heat_production_upper_limit),
                    results["HeatProducer_b702__max_size"],
                    atol=1e-9,
                )
                np.testing.assert_array_less(heat_produced - tol, heat_production_upper_limit)
                np.testing.assert_allclose(
                    len(heat_produced) - 5,
                    np.sum(
                        np.isclose(heat_produced, heat_production_upper_limit, atol=tol, rtol=1e-9)
                    ),
                )
            else:
                exit("Problem class not catered for in this test case")

    @pytest.mark.slow_1
    @pytest.mark.timeout(150)  # overrides the default timelimt of the pytest command
    def test_max_producer_esdl_scaled_profile(self):
        """
        Use a scaled profile, where the profile was intentionally reduced for a couple of
        time-steps (reducing the profile value at a few time steps). With the producer size not
        being minimized.

        Checks:
        - Standard checks demand matching, energy conservation and heat to discharge
        - Check that the heat source <= specified profile * producer size
        - Check that heat produced is capped at a couple of timesteps
        """

        import models.unit_cases.case_3a.src.run_3a as run_3a
        from models.unit_cases.case_3a.src.run_3a import HeatProblemESDLProdProfile

        base_folder = Path(run_3a.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            HeatProblemESDLProdProfile,
            base_folder=base_folder,
            esdl_file_name="3a_esdl_source_scaled_profile.esdl",
            esdl_parser=ESDLFileParser,
        )
        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)
        tol = 1e-8
        heat_produced = results["HeatProducer_b702.Heat_source"]
        heat_production_upper_limit = (
            solution.get_timeseries("HeatProducer_b702.maximum_heat_source").values
            / max(solution.get_timeseries("HeatProducer_b702.maximum_heat_source").values)
            * results["HeatProducer_b702__max_size"]
        )

        # check that heat produced is smaller than the profile
        np.testing.assert_array_less(heat_produced - tol, heat_production_upper_limit)
        np.testing.assert_equal(
            np.sum(np.isclose(heat_produced, heat_production_upper_limit, atol=tol, rtol=1e-10)), 6
        )


if __name__ == "__main__":

    a = TestProducerMaxProfile()
    a.test_max_producer_scaled_profile()
    a.test_max_producer_esdl_unscaled_profile()
    a.test_max_producer_esdl_scaled_profile()
