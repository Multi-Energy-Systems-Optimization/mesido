from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.util import run_esdl_mesido_optimization

import numpy as np


class TestMILPGasSourceSink(TestCase):
    def test_source_sink(self):
        """
        Test case for a network consisting out of a source, pipes and a sink

        Checks:
        - That flow is maintained.
        - That the head drops over the pipe.

        """
        import models.unit_cases_gas.source_sink.src.run_source_sink as example
        from models.unit_cases_gas.source_sink.src.run_source_sink import GasProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        # Added for case where head loss is modelled via DW
        class TestSourceSink(GasProblem):
            def energy_system_options(self):
                options = super().energy_system_options()
                self.heat_network_settings["head_loss_option"] = (
                    HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
                )
                self.heat_network_settings["n_linearization_lines"] = 5
                self.heat_network_settings["minimize_head_losses"] = True

                self.heat_network_settings["pipe_maximum_pressure"] = 100.0  # [bar]
                self.heat_network_settings["pipe_minimum_pressure"] = 0.0
                return options

        soltion = run_esdl_mesido_optimization(
            GasProblem,
            base_folder=base_folder,
            esdl_file_name="source_sink.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = soltion.extract_results()

        # Test if mass conserved
        np.testing.assert_allclose(
            results["GasProducer_0876.GasOut.Q"], results["GasDemand_a2d8.GasIn.Q"]
        )

        # Test if head is going down
        np.testing.assert_array_less(results["Pipe_4abc.GasOut.H"], results["Pipe_4abc.GasIn.H"])


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestMILPGasSourceSink()
    a.test_source_sink()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
