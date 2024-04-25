from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestAbsoluteHeat(TestCase):
    def test_absolute_heat(self):
        """
        This is a single line ring model, meaning that there are no dedicated supply or return
        lines. This means that this model pipes are not related (no relation between hot and cold
        pipes exists).

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge

        """
        import models.absolute_heat.src.example as example
        from models.absolute_heat.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="absolute_heat.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        demand_matching_test(heat_problem, heat_problem.extract_results())
        energy_conservation_test(heat_problem, heat_problem.extract_results())
        heat_to_discharge_test(heat_problem, heat_problem.extract_results())


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestAbsoluteHeat()
    a.test_absolute_heat()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
