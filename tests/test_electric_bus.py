"""All test for a electric node/bus

Currently both the MILP and NLP tests

What at least was implement
- voltages on all connections are the same
- power in == power out
"""

from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import electric_power_conservation_test


class TestMILPbus(TestCase):
    def test_logical_links_between_busses(self):
        """Check two cable-free buses with local production, demand and bidirectional transfer."""
        import models.unit_cases_electricity.bus_networks.src.example as example
        from models.unit_cases_electricity.bus_networks.src.example import ElectricityProblem

        solution = run_esdl_mesido_optimization(
            ElectricityProblem,
            base_folder=Path(example.__file__).resolve().parent.parent,
            esdl_file_name="Electric_bus4_two_busses_logical_links.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_uni.csv",
        )
        results = solution.extract_results()
        name_to_id_map = solution.esdl_asset_name_to_id_map
        bus_ids = [name_to_id_map[name] for name in ("Bus_f262", "Bus_bae4")]
        atol = 1.0e-2

        self.assertFalse(solution.energy_system_components.get("electricity_cable", []))
        self.assertEqual(set(solution.energy_system_topology.busses), set(bus_ids))
        electric_power_conservation_test(solution, results, atol=atol)

        for bus_id, producer_name, demand_name in (
            (bus_ids[0], "ElectricityProducer_17a1", "ElectricityDemand_281a"),
            (bus_ids[1], "ElectricityProducer_a215", "ElectricityDemand_e527"),
        ):
            producer_id = name_to_id_map[producer_name]
            demand_id = name_to_id_map[demand_name]
            other_bus_id = next(bus for bus in bus_ids if bus != bus_id)
            connections = solution.energy_system_topology.busses[bus_id]
            self.assertEqual(
                {asset for asset, _orientation in connections.values()},
                {producer_id, demand_id, other_bus_id},
            )
            bus_asset = solution.esdl_assets[bus_id]
            connected_asset_ids = {
                connected.eContainer().id
                for port in [*bus_asset.in_ports, *bus_asset.out_ports]
                for connected in port.connectedTo
            }
            self.assertEqual(connected_asset_ids, {producer_id, demand_id, other_bus_id})

            demand = results[f"{demand_id}.Electricity_demand"]
            production = results[f"{producer_id}.Electricity_source"]
            target = solution.get_timeseries(f"{demand_id}.target_electricity_demand").values
            np.testing.assert_allclose(demand, target, atol=atol)
            capacity = solution.esdl_assets[producer_id].attributes["power"]
            self.assertTrue(np.all(production >= -atol))
            self.assertTrue(np.all(production <= capacity + atol))

            for index, (connected_id, orientation) in connections.items():
                bus_port = f"{bus_id}.ElectricityConn[{index + 1}]"
                np.testing.assert_allclose(
                    results[f"{bus_port}.V"], results[f"{bus_id}.V"], atol=atol
                )
                if connected_id == other_bus_id:
                    other_connections = solution.energy_system_topology.busses[other_bus_id]
                    other_index = next(
                        i for i, (asset, _) in other_connections.items() if asset == bus_id
                    )
                    connected_port = f"{other_bus_id}.ElectricityConn[{other_index + 1}]"
                    # Logical links share power and current, but intentionally not voltage.
                    np.testing.assert_allclose(
                        orientation * results[f"{bus_port}.Power"],
                        demand - production,
                        atol=atol,
                    )
                    transfer = results[f"{bus_port}.Power"]
                    self.assertTrue(np.any(transfer > atol))
                    self.assertTrue(np.any(transfer < -atol))
                else:
                    suffix = "ElectricityOut" if connected_id == producer_id else "ElectricityIn"
                    connected_port = f"{connected_id}.{suffix}"
                for quantity in ("Power", "I"):
                    np.testing.assert_allclose(
                        results[f"{bus_port}.{quantity}"],
                        results[f"{connected_port}.{quantity}"],
                        atol=atol,
                    )

    def test_voltages_and_power_network1(self):
        """
        Checks the behaviour of electricity networks with a bus asset. A bus asset is the
        only asset that is allowed to have more than one electricity port.

        Checks:
        - Voltage is equal for the bus ports
        - Checks energy conservation in the bus
        - Checks current conservation in the bus
        - Checks that minimum voltage is met
        - Checks that power meets the current * voltage at the demands

        """
        import models.unit_cases_electricity.bus_networks.src.example as example
        from models.unit_cases_electricity.bus_networks.src.example import ElectricityProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        # Run the problem
        solution = run_esdl_mesido_optimization(
            ElectricityProblem,
            base_folder=base_folder,
            esdl_file_name="Electric_bus3.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = solution.extract_results()
        name_to_id_map = solution.esdl_asset_name_to_id_map

        bus_id = name_to_id_map["Bus_f262"]
        cable_de_id = name_to_id_map["ElectricityCable_de9a"]
        cable_ad_id = name_to_id_map["ElectricityCable_1ad0"]
        demand_id = name_to_id_map["ElectricityDemand_e527"]

        # electric power conservation system and no dissipation of power and current in bus
        electric_power_conservation_test(solution, results)

        v1 = results[f"{bus_id}.ElectricityConn[1].V"]
        v2 = results[f"{bus_id}.ElectricityConn[2].V"]
        v_outgoing_cable = results[f"{cable_de_id}.ElectricityIn.V"]
        v_incoming_cable = results[f"{cable_ad_id}.ElectricityOut.V"]
        v_demand = results[f"{demand_id}.ElectricityIn.V"]
        p_demand = results[f"{demand_id}.ElectricityIn.Power"]
        i_demand = results[f"{demand_id}.ElectricityIn.I"]

        # Incoming voltage == outgoing voltage of bus
        self.assertTrue(all(v1 == v2))
        # Ingoing voltage of bus == voltage of incoming cable
        self.assertTrue(all(v1 == v_incoming_cable))
        # Outgoing voltage of bus == voltage of outgoing cable
        self.assertTrue(all(v1 == v_outgoing_cable))

        # check if minimum voltage is reached
        np.testing.assert_array_less(
            solution.parameters(0)[f"{demand_id}.min_voltage"] - 1.0e-3, v_demand
        )
        # Check that current is high enough to carry the power
        np.testing.assert_array_less(p_demand - 1e-12, v_demand * i_demand)

    def test_unidirectional_cable(self):
        """
        Checks the behaviour of electricity networks with a two bus assets connected with a cable
        that is only allowed to be unidirectional.

        Electricity from producer 1 can go to demand 1 and demand 2, but electricity from producer 2
        can only go to demand 2 due to unidirectional cable between the two busses

        Checks:
        - electric power conservation
        - bounds on unidirectional cable set to a minimum power flow of 0.0
        - demand 1 is limited by production of producer 1

        """
        import models.unit_cases_electricity.bus_networks.src.example as example
        from models.unit_cases_electricity.bus_networks.src.example import ElectricityProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        # Run the problem
        solution = run_esdl_mesido_optimization(
            ElectricityProblem,
            base_folder=base_folder,
            esdl_file_name="Electric_bus4.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_uni.csv",
        )
        results = solution.extract_results()
        name_to_id_map = solution.esdl_asset_name_to_id_map

        demand_1_id = name_to_id_map["ElectricityDemand_e527"]
        demand_2_id = name_to_id_map["ElectricityDemand_281a"]
        prod_1_id = name_to_id_map["ElectricityProducer_a215"]
        prod_2_id = name_to_id_map["ElectricityProducer_17a1"]
        cable_id = name_to_id_map["ElectricityCable_d16c"]

        # electric power conservation system and no dissipation of power and current in bus
        electric_power_conservation_test(solution, results)

        p_demand_1 = results[f"{demand_1_id}.ElectricityIn.Power"]
        p_demand_2 = results[f"{demand_2_id}.ElectricityIn.Power"]
        cable_power_bound = solution.bounds()[f"{cable_id}.ElectricityIn.Power"][0]

        bound_prod_1 = solution.bounds()[f"{prod_1_id}.Electricity_source"][1]
        bound_prod_2 = solution.bounds()[f"{prod_2_id}.Electricity_source"][1]
        target_demand_1 = solution.get_timeseries(f"{demand_1_id}.target_electricity_demand").values
        target_demand_1[target_demand_1 > bound_prod_1] = bound_prod_1
        target_demand_2 = solution.get_timeseries(f"{demand_2_id}.target_electricity_demand").values
        target_demand_2[target_demand_2 > (bound_prod_1 + bound_prod_2)] = (
            bound_prod_1 + bound_prod_2
        )

        np.testing.assert_allclose(p_demand_1, target_demand_1)
        np.testing.assert_allclose(p_demand_2, target_demand_2)

        np.testing.assert_allclose(0.0, cable_power_bound)
