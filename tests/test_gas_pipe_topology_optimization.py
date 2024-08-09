from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.util import run_esdl_mesido_optimization

import numpy as np


class TestGasNetwork(TestCase):
    def test_gas_pipe_top(self):
        """
        This test checks the functioning of topology optimization of gas pipes. It uses
        a symmetrical network where the left side should stay in as those pipes are shorter.

        Checks:
        1. Demand is matched
        2. The correct pipes are removed and remained in place
        3. That the correct producer is used

        """
        import models.gas_pipe_topology.src.example as example
        from models.gas_pipe_topology.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        class GasNetworkProblem(HeatProblem):
            def energy_system_options(self):
                options = super().energy_system_options()
                self.gas_network_settings["head_loss_option"] = (
                    HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
                )
                self.gas_network_settings["minimize_head_losses"] = False
                return options

        solution = run_esdl_mesido_optimization(
            GasNetworkProblem,
            base_folder=base_folder,
            esdl_file_name="2a_gas.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        results = solution.extract_results()

        for demand in solution.energy_system_components.get("gas_demand", []):
            target = solution.get_timeseries(f"{demand}.target_gas_demand").values
            np.testing.assert_allclose(target, results[f"{demand}.Gas_demand_mass_flow"])

        removed_pipes = ["Pipe_a718", "Pipe_9a6f", "Pipe_2927", "Pipe_8592"]
        remained_pipes = ["Pipe_51e4", "Pipe_6b39", "Pipe_f9b0", "Pipe_96bc"]
        for pipe in removed_pipes:
            np.testing.assert_allclose(results[f"{pipe}__gn_diameter"], 0.0, atol=1.0e-6)
            np.testing.assert_allclose(results[f"{pipe}__investment_cost"], 0.0, atol=1.0e-6)
            np.testing.assert_allclose(results[f"{pipe}__gn_max_discharge"], 0.0, atol=1.0e-6)
        for pipe in remained_pipes:
            np.testing.assert_array_less(0.0, results[f"{pipe}__gn_diameter"])
            np.testing.assert_array_less(0.0, results[f"{pipe}__investment_cost"])
            np.testing.assert_equal(True, None is not results[f"{pipe}__gn_max_discharge"])

        np.testing.assert_allclose(results["GasProducer_c92e.GasOut.Q"], 0.0, atol=1e-10)
        np.testing.assert_array_less(0.0, results["GasProducer_17aa.GasOut.Q"])


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestGasNetwork()
    a.test_gas_pipe_top()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
