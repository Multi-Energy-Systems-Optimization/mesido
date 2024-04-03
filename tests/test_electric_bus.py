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

import numpy as np


from rtctools.util import run_optimization_problem


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
        solution = run_optimization_problem(
            ElectricityProblem,
            base_folder=base_folder,
            esdl_file_name="Electric_bus3.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        results = solution.extract_results()
        bus_id = solution.esdl_asset_name_to_id_map.get("Bus_f262")
        cable_1_id = solution.esdl_asset_name_to_id_map.get("ElectricityCable_de9a")
        cable_2_id = solution.esdl_asset_name_to_id_map.get("ElectricityCable_1ad0")
        elec_demand_id = solution.esdl_asset_name_to_id_map.get("ElectricityDemand_e527")

        v1 = results[f"{bus_id}.ElectricityConn[1].V"]
        v2 = results[f"{bus_id}.ElectricityConn[2].V"]
        v_outgoing_cable = results[f"{cable_1_id}.ElectricityIn.V"]
        v_incoming_cable = results[f"{cable_2_id}.ElectricityOut.V"]
        v_demand = results[f"{elec_demand_id}.ElectricityIn.V"]
        p_demand = results[f"{elec_demand_id}.ElectricityIn.Power"]
        i_demand = results[f"{elec_demand_id}.ElectricityIn.I"]
        p1 = results[f"{bus_id}.ElectricityConn[1].Power"]
        p2 = results[f"{bus_id}.ElectricityConn[2].Power"]
        p3 = results[f"{bus_id}.ElectricityConn[3].Power"]
        p4 = results[f"{bus_id}.ElectricityConn[4].Power"]
        i1 = results[f"{bus_id}.ElectricityConn[1].I"]
        i2 = results[f"{bus_id}.ElectricityConn[2].I"]
        i3 = results[f"{bus_id}.ElectricityConn[3].I"]
        i4 = results[f"{bus_id}.ElectricityConn[4].I"]

        # Incoming voltage == outgoing voltage of bus
        self.assertTrue(all(v1 == v2))
        # Ingoing voltage of bus == voltage of incoming cable
        self.assertTrue(all(v1 == v_incoming_cable))
        # Outgoing voltage of bus == voltage of outgoing cable
        self.assertTrue(all(v1 == v_outgoing_cable))
        # Power in == power out = no dissipation of power
        np.testing.assert_allclose(p1 + p2 - p3 - p4, 0.0, rtol=1.0e-6, atol=1.0e-6)
        # Current in == current out = no dissipation of power
        np.testing.assert_allclose(i1 + i2 - i3 - i4, 0.0, rtol=1.0e-6, atol=1.0e-6)
        # check if minimum voltage is reached
        np.testing.assert_array_less(
            solution.parameters(0)[f"{elec_demand_id}.min_voltage"] - 1.0e-3, v_demand
        )
        # Check that current is high enough to carry the power
        np.testing.assert_array_less(p_demand - 1e-12, v_demand * i_demand)
