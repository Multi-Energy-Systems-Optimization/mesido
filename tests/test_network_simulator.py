from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows import NetworkSimulatorHIGHS

import numpy as np

from rtctools.util import run_optimization_problem

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestNetworkSimulator(TestCase):
    """
    In this test case 2 heat producers are used to supply 3 heating demands. A merit
    order (preference of 1st use) is given to the producers: Producer_1 = 2 and Producer_2 = 1.

    Checks:
    - General checks namely demand matching, energy conservation and asset heat variable vs
      calculated heat (based on flow rate)
    - Check that producer 1 (merit oder = 2) is only used for the supply of heat lossed in the
      connected and is does not contribute to the heating demands 1, 2 and 3
    """

    def test_network_simulator(self):
        import models.test_case_small_network_with_ates.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        class NetworkSimulatorHIGHSTestCase(NetworkSimulatorHIGHS):
            def energy_system_options(self):
                options = super().energy_system_options()

                options["heat_loss_disconnected_pipe"] = False

                return options

            def times(self, variable=None) -> np.ndarray:
                return super().times(variable)[:5]

            # def read(self):
            #     super().read()
            #     # for d in self.energy_system_components["heat_demand"]:
            #     #     target = self.get_timeseries(f"{d}.target_heat_demand")
            #     #     for ii in range(len(target.values)):
            #     #         target.values[ii] = target.values[ii] * 1.0e-3

            #     #     self.io.set_timeseries(
            #     #         f"{d}.target_heat_demand",
            #     #         self.io._DataStore__timeseries_datetimes,
            #     #         target.values,
            #     #         0,
            #     #     )

            #     adapt_hourly_profile_averages_timestep_size(self, 1000)

        solution = run_optimization_problem(
            NetworkSimulatorHIGHSTestCase,
            base_folder=base_folder,
            # TODO: it seems to write an output file (NOT NICE!)
            esdl_file_name="test_case_small_network_without_ates.esdl",
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


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestNetworkSimulator()
    a.test_network_simulator()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
