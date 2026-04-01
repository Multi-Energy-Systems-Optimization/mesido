from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestLogicalLinks(TestCase):
    def test_logical_links_electricity(self):
        """
        This test checks if the logic implemented for logically linked energy system, Meaning an
        energy system where assets are directly connected to each other without a network
        (transport asset(s)) in between.

        Checks:
        1. Check that energy is conserved

        """
        import models.unit_cases_electricity.bus_networks.src.example as example
        from models.unit_cases_electricity.bus_networks.src.example import ElectricityProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        problem = run_esdl_mesido_optimization(
            ElectricityProblem,
            esdl_file_name="Electric_bus4_logical_links.esdl",
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = problem.extract_results()

        np.testing.assert_allclose(
            results["ElectricityDemand_281a.Electricity_demand"]
            + results["ElectricityDemand_e527.Electricity_demand"],
            results["ElectricityProducer_17a1.Electricity_source"]
            + results["ElectricityProducer_a215.Electricity_source"],
        )

    def test_logical_links_gas(self):
        """
        This test checks if the logic implemented for logically linked energy system, Meaning an
        energy system where assets are directly connected to each other without a network
        (transport asset(s)) in between.

        Checks:
        1. Check that energy is conserved

        """
        import models.unit_cases_gas.multi_demand_source_node.src.run_test as example
        from models.unit_cases_gas.multi_demand_source_node.src.run_test import GasProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        problem = run_esdl_mesido_optimization(
            GasProblem,
            esdl_file_name="test_logical_links.esdl",
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = problem.extract_results()

        np.testing.assert_allclose(
            results["GasDemand_47d0.Gas_demand_mass_flow"]
            + results["GasDemand_7978.Gas_demand_mass_flow"],
            results["GasProducer_a977.Gas_source_mass_flow"]
            + results["GasProducer_3573.Gas_source_mass_flow"],
        )

    def test_logical_links_nodes(self):
        """
        This test checks if the logic implemented for a partially logically linked energy system.
        Meaning an energy system where assets are directly connected to each other without a network
        (transport asset(s)) in between. This specific test covers the logical connection between
        two nodes.
        """

        import models.unit_cases_gas.source_pipe_split_sink.src.run_source_sink as example
        from models.unit_cases_gas.source_pipe_split_sink.src.run_source_sink import GasProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        problem = run_esdl_mesido_optimization(
            GasProblem,
            esdl_file_name="split_with_logical_link.esdl",
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = problem.extract_results()

        demand_matching_test(problem, results)

        # We check that no artificial gas in created
        np.testing.assert_allclose(
            results["GasProducer_0876.GasOut.Q"], results["GasDemand_a2d8.GasIn.Q"]
        )

        # We test conservaiton of flow at the nodes
        for node, connected_pipes in problem.energy_system_topology.gas_nodes.items():
            discharge_sum = 0.0

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                discharge_sum += results[f"{node}.GasConn[{i_conn+1}].Q"] * orientation
                np.testing.assert_allclose(
                    results[f"{node}.GasConn[{i_conn+1}].H"], results[f"{node}.H"], atol=1.0e-6
                )
            np.testing.assert_allclose(discharge_sum, 0.0, atol=1.0e-12)

    def test_logical_links_nodes_heat(self):
        """
        This test checks if the logic implemented for a partially logically linked energy system.
        Meaning an energy system where assets are directly connected to each other without a network
        (transport asset(s)) in between. This specific test covers the logical connection between
        two nodes in a heat network. Please note that due to the closed system constraints we need
        to set the minimum velocity to zero to avoid backflow in the solution.
        """

        import models.source_pipe_split_sink.src.double_pipe_heat as example
        from models.source_pipe_split_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        problem = run_esdl_mesido_optimization(
            SourcePipeSink,
            esdl_file_name="sourcesink_with_node2node_logical_link.esdl",
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = problem.extract_results()

        demand_matching_test(problem, results)
        energy_conservation_test(problem, results)
        heat_to_discharge_test(problem, results)

        # We test conservaiton of flow at the nodes
        for node, connected_pipes in problem.energy_system_topology.nodes.items():
            discharge_sum = 0.0

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                discharge_sum += results[f"{node}.HeatConn[{i_conn+1}].Q"] * orientation
                np.testing.assert_allclose(
                    results[f"{node}.HeatConn[{i_conn+1}].H"], results[f"{node}.H"], atol=1.0e-6
                )
            np.testing.assert_allclose(discharge_sum, 0.0, atol=1.0e-12)

    def test_logical_links_all_connections_heat(self):
        """
        This test checks if the logic implemented for a partially logically linked energy system.
        Meaning an energy system where assets are directly connected to each other without a network
        (transport asset(s)) in between. This specific test covers the logical connection between
        producers and consumers to nodes in a heat network. Please note that due to the closed
        system constraints we need to set the minimum velocity to zero to avoid backflow in the solution.

        This is the most basic check where we have a simple network and check for the basic physics.
        This simple network includes one source, some pipes and logical links, node, a tank storage
        and 3 demands.
        The buffer cannot yet be connected with a logical link, due to the flow direction variable.
        The logical links can give scaling issues when used at demands.

        Checks;
        - Demand matching
        - Energy conservation
        - Heat to discharge
        Check that the history for the buffer is set correctly at t=0
        - Check that the heat loss is positive and as expected
        - results of 3a do not vary a lot.
        """

        import models.source_pipe_split_sink.src.double_pipe_heat as example
        from models.source_pipe_split_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        problem = run_esdl_mesido_optimization(
            SourcePipeSink,
            esdl_file_name="sourcesink_with_cons2node2node2prod_logical_link.esdl",
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = problem.extract_results()

        demand_matching_test(problem, results)
        energy_conservation_test(problem, results)
        heat_to_discharge_test(problem, results)

        # We test conservaiton of flow at the nodes
        for node, connected_pipes in problem.energy_system_topology.nodes.items():
            discharge_sum = 0.0

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                discharge_sum += results[f"{node}.HeatConn[{i_conn+1}].Q"] * orientation
                np.testing.assert_allclose(
                    results[f"{node}.HeatConn[{i_conn+1}].H"], results[f"{node}.H"], atol=1.0e-6
                )
            np.testing.assert_allclose(discharge_sum, 0.0, atol=1.0e-12)

        import models.unit_cases.case_3a.src.run_3a as run_3a
        from models.unit_cases.case_3a.src.run_3a import HeatProblem

        base_folder = Path(run_3a.__file__).resolve().parent.parent

        production_list = []
        for esdl_file in [
            "3a_cons2node.esdl",
            "3a_prod2node.esdl",
            "3a_prod2node2cons.esdl",
            "3a.esdl",
        ]:
            # Just a "problem is not infeasible"
            heat_problem = run_esdl_mesido_optimization(
                HeatProblem,
                base_folder=base_folder,
                esdl_file_name=esdl_file,
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries_import.xml",
            )

            results = heat_problem.extract_results()
            parameters = heat_problem.parameters(0)
            bounds = heat_problem.bounds()

            demand_matching_test(heat_problem, results)
            energy_conservation_test(heat_problem, results)
            heat_to_discharge_test(heat_problem, results)

            for prod in heat_problem.energy_system_components.get("heat_source", []):
                production_list.append(results[f"{prod}.Heat_source"])

            for buffer in heat_problem.energy_system_components.get("heat_buffer", []):
                # buffer should have positive heat loss
                assert parameters[f"{buffer}.heat_loss_coeff"] > 0.0
                np.testing.assert_allclose(
                    results[f"{buffer}.Stored_heat"] * parameters[f"{buffer}.heat_loss_coeff"],
                    results[f"{buffer}.Heat_loss"],
                )
                np.testing.assert_allclose(
                    results[f"{buffer}.Stored_heat"][0],
                    bounds[f"{buffer}.Stored_heat"][0].values[0],
                )
                np.testing.assert_allclose(
                    results[f"{buffer}.Stored_heat"][-1] - results[f"{buffer}.Stored_heat"][0],
                    np.sum(results[f"{buffer}.Heat_buffer"][1:] * 3600.0)
                    - np.sum(results[f"{buffer}.Heat_loss"][1:] * 3600.0),
                    atol=1.0,
                )
                np.testing.assert_allclose(results[f"{buffer}.Heat_buffer"][0], 0.0, atol=1.0e-6)

        # check that the total heat production is almost the same for all models, with and without
        # logical links.
        total_productions = [sum(production_list[i]) for i in range(len(production_list))]
        np.testing.assert_allclose(total_productions[-1], total_productions, rtol=1e-5)

    def test_logical_links_network_hybrid(self):
        """
        This test checks if the logic implemented for logically linked energy system, Meaning an
        energy system where assets are directly connected to each other without a network
        (transport asset(s)) in between. This test uses the emerge use-case and the logic is both
        checked for the gas and heat commodity.

        Checks:
        1. Check that energy is conserved

        """
        import models.emerge.src.example as example
        from models.emerge.src.example import EmergeTest

        base_folder = Path(example.__file__).resolve().parent.parent

        problem = run_esdl_mesido_optimization(
            EmergeTest,
            base_folder=base_folder,
            esdl_file_name="emerge_with_logical_links.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_short.csv",
        )
        results = problem.extract_results()

        assert all(
            results["ElectricityCable_e388.ElectricityIn.V"]
            == results["Bus_24cf.ElectricityConn[3].V"]
        )

        assert (
            np.sum(
                np.abs(
                    results["WindPark_9074.ElectricityOut.V"]
                    - results["Bus_24cf.ElectricityConn[3].V"]
                )
            )
            != 0.0
        )


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestLogicalLinks()
    a.test_logical_links_electricity()
    a.test_logical_links_gas()
    a.test_logical_links_nodes()
    a.test_logical_links_nodes_heat()
    a.test_logical_links_network_hybrid()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
