from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestColdDemand(TestCase):
    def test_cold_demand(self):
        """
        This test is to check the basic physics for a network which includes cold demand. In this
        case we have a network with an air-water hp, a low temperature ates and both hot and cold
        demand. In this case the demands are matched and the low temperature ates is utilized.

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge (note cold line is colder than T_ground)

        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="LT_wko.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        demand_matching_test(heat_problem, heat_problem.extract_results())
        energy_conservation_test(heat_problem, heat_problem.extract_results())
        heat_to_discharge_test(heat_problem, heat_problem.extract_results())

    def test_airco(self):
        """
        This test is to check the basic physics for a network which includes an airco. In this
        case we have a network with an air-water hp, a low temperature ates and both hot and cold
        demand. In this case the demands are matched and the low temperature ates is utilized.

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge

        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="airco.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        demand_matching_test(heat_problem, heat_problem.extract_results())
        energy_conservation_test(heat_problem, heat_problem.extract_results())
        heat_to_discharge_test(heat_problem, heat_problem.extract_results())


if __name__ == "__main__":
    a = 1
