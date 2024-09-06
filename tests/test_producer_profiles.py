from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestProducerMaxProfile(TestCase):
    """
    A test to verify that the producer can have a given scaled profile, where the producer will
    always produce equal or less than said profile. This constraint is checked for a producer,
    where the producer's profile was also intentionally reduced for a couple of time-steps
    (reducing the profile value at a few time steps).

    Checks:
    - Standard checks demand matching, energy conservation and heat to discharge
    - check that heat_source <= scaled_profile * size_source.

    """

    def test_max_producer_profile(self):
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
