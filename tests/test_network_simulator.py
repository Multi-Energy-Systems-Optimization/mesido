from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows import NetworkSimulatorHIGHSTestCase

import numpy as np

from rtctools.util import run_optimization_problem

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestNetworkSimulator(TestCase):
    """
    In this test case 2 heat producers and an ATES is used to supply 3 heating demands. A merit
    order (preference of 1st use) is given to the producers: Producer_1 = 2 and Producer_2 = 1.

    Checks:
    - General checks namely demand matching, energy conservation and asset heat variable vs
      calculated heat (based on flow rate)
    - Check that producer 1 (merit oder = 2) is only used for the supply of heat lossed in the
      connected and is does not contribute to the heating demands 1, 2 and 3
    - Check that the ATES is not delivering any heat to the network during the 1st time step
    """

    def test_network_simulator(self):
        import models.test_case_small_network_with_ates.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        solution = run_optimization_problem(
            NetworkSimulatorHIGHSTestCase,
            base_folder=base_folder,
            # TODO: it seems to write an output file (NOT NICE!)
            esdl_file_name="test_case_small_network_with_ates.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = solution.extract_results()

        # General checks
        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        # Check that producer 1 (merit oder = 2) is not used
        # and is does not contribute to the heating demands 1, 2 and 3
        np.testing.assert_allclose(
            results["HeatProducer_1.Heat_source"],
            0.0,
            err_msg="Heat producer 1 should be completely disabled "
            ", due to producer 2 being sufficient for "
            "the total heat demand (incl. heat losses) and it has the 1st priority for usage",
            rtol=1.0e-3,
            atol=1.0e-3,
        )
        # Check ATES
        np.testing.assert_array_less(
            results["ATES_033c.Heat_ates"][0],
            0.0,
            err_msg="ATES should not be delivering heat to the network in the 1st time step",
        )


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestNetworkSimulator()
    a.test_network_simulator()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
