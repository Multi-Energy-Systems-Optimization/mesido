from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np


class TestMILPGasMultiDemandSourceNode(TestCase):
    def test_multi_demand_source_node(self):
        """
        Test a network consisting out of 2 demands, 2 sources and a node. Verify that the head is
        equal for all ports at a node, and throughout the network that the flow (mass) balance is
        maintained.

        Checks:
        - Head is equal for all ports on the node
        - Consumed flow equals produced flow
        - Check for flow balance at the gas node

        """
        import models.unit_cases_gas.multi_demand_source_node.src.run_test as example
        from models.unit_cases_gas.multi_demand_source_node.src.run_test import GasProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        class TestGasProblem(GasProblem):
            def energy_system_options(self):
                options = super().energy_system_options()
                self.gas_network_settings["pipe_maximum_pressure"] = 100.0  # [bar]
                self.gas_network_settings["pipe_minimum_pressure"] = 0.0
                return options

        heat_problem = run_esdl_mesido_optimization(
            GasProblem,
            base_folder=base_folder,
            esdl_file_name="test.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = heat_problem.extract_results()

        # Test head at node
        for node, connected_pipes in heat_problem.energy_system_topology.gas_nodes.items():
            discharge_sum = 0.0

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                discharge_sum += results[f"{node}.GasConn[{i_conn+1}].Q"] * orientation
                np.testing.assert_allclose(
                    results[f"{node}.GasConn[{i_conn+1}].H"], results[f"{node}.H"], atol=1.0e-6
                )
            np.testing.assert_allclose(discharge_sum, 0.0, atol=1.0e-12)

        # Test if head is going down
        np.testing.assert_allclose(
            results["GasDemand_47d0.Gas_demand_mass_flow"]
            + results["GasDemand_7978.Gas_demand_mass_flow"],
            results["GasProducer_3573.Gas_source_mass_flow"]
            + results["GasProducer_a977.Gas_source_mass_flow"],
        )
