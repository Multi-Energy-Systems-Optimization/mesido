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

        # electric power conservation system and no dissipation of power and current in bus
        electric_power_conservation_test(solution, results)

        v1 = results["Bus_f262.ElectricityConn[1].V"]
        v2 = results["Bus_f262.ElectricityConn[2].V"]
        v_outgoing_cable = results["ElectricityCable_de9a.ElectricityIn.V"]
        v_incoming_cable = results["ElectricityCable_1ad0.ElectricityOut.V"]
        v_demand = results["ElectricityDemand_e527.ElectricityIn.V"]
        p_demand = results["ElectricityDemand_e527.ElectricityIn.Power"]
        i_demand = results["ElectricityDemand_e527.ElectricityIn.I"]

        # Incoming voltage == outgoing voltage of bus
        self.assertTrue(all(v1 == v2))
        # Ingoing voltage of bus == voltage of incoming cable
        self.assertTrue(all(v1 == v_incoming_cable))
        # Outgoing voltage of bus == voltage of outgoing cable
        self.assertTrue(all(v1 == v_outgoing_cable))

        # check if minimum voltage is reached
        np.testing.assert_array_less(
            solution.parameters(0)["ElectricityDemand_e527.min_voltage"] - 1.0e-3, v_demand
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

        # electric power conservation system and no dissipation of power and current in bus
        electric_power_conservation_test(solution, results)

        demand_1 = "ElectricityDemand_e527"
        demand_2 = "ElectricityDemand_281a"
        prod_1 = "ElectricityProducer_a215"
        prod_2 = "ElectricityProducer_17a1"
        unidirectional_cable = "ElectricityCable_d16c"

        p_demand_1 = results[f"{demand_1}.ElectricityIn.Power"]
        p_demand_2 = results[f"{demand_2}.ElectricityIn.Power"]
        cable_power_bound = solution.bounds()[f"{unidirectional_cable}.ElectricityIn.Power"][0]

        bound_prod_1 = solution.bounds()[f"{prod_1}.Electricity_source"][1]
        bound_prod_2 = solution.bounds()[f"{prod_2}.Electricity_source"][1]
        target_demand_1 = solution.get_timeseries(f"{demand_1}.target_electricity_demand").values
        target_demand_1[target_demand_1 > bound_prod_1] = bound_prod_1
        target_demand_2 = solution.get_timeseries(f"{demand_2}.target_electricity_demand").values
        target_demand_2[target_demand_2 > (bound_prod_1 + bound_prod_2)] = (
            bound_prod_1 + bound_prod_2
        )

        np.testing.assert_allclose(p_demand_1, target_demand_1)
        np.testing.assert_allclose(p_demand_2, target_demand_2)

        np.testing.assert_allclose(0.0, cable_power_bound)
