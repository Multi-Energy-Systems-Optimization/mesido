from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestMultipleCarriers(TestCase):
    def test_multiple_carriers(self):
        """
        Test to check optimzation is functioning as expected for a problem where two hydraulically
        decoupled networks which have no interaction.

        Checks:
        - Heat to discharge relation for both networks are not interferring with each other

        """
        import models.multiple_carriers.src.run_multiple_carriers as run_multiple_carriers
        from models.multiple_carriers.src.run_multiple_carriers import (
            HeatProblem,
        )

        base_folder = Path(run_multiple_carriers.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="MultipleCarrierTest.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )

        results = solution.extract_results()

        # We check for a system consisting out of 2 hydraulically decoupled networks that the energy
        # balance equations are done with the correct carrier.
        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)
