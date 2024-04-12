from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

import numpy as np

from rtctools.util import run_optimization_problem

from mesido.workflows.multicommodity_simulator_workflow import MultiCommoditySimulator
from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestMultiCommoditySimulator(TestCase):
    """
    In this test case 2 milp producers and an ATES is used to supply 3 heating demands. A merit
    order (preference of 1st use) is given to the producers: Producer_1 = 2 and Producer_2 = 1.

    Checks:
    - General checks namely demand matching, energy conservation and asset milp variable vs
      calculated milp (based on flow rate)
    - Check that producer 1 (merit oder = 2) is only used for the supply of milp lossed in the
      connected and is does not contribute to the heating demands 1, 2 and 3
    - Check that the ATES is not delivering any milp to the network during the 1st time step
    """

    def test_multi_commodity_simulator(self):
        import models.unit_cases_electricity.bus_networks.src.example as example

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_optimization_problem(
            MultiCommoditySimulator,
            base_folder=base_folder,
            esdl_file_name="Electric_bus4_priorities.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_2.csv",
        )

        results = solution.extract_results()

        # General checks
        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        for prod in solution.energy_system_components.get("electricity_source"):
            prod_profile_name = f"{prod}.maximum_electricity_source"
            energy_prod = results[f"{prod}.Electricity_source"]
            if prod_profile_name in solution.io.get_timeseries_names():
                target = solution.get_timeseries(prod_profile_name)
                np.testing.assert_allclose(target, energy_prod, atol=1.0e-3, rtol=1.0e-6)
            print(prod, energy_prod)

        for demand in solution.energy_system_components.get("electricity_demand"):
            energy_demand = results[f"{demand}.Electricity_demand"]
            if f"{demand}.target_electricity_demand" in solution.io.get_timeseries_names():
                target = solution.get_timeseries(f"{demand}.target_electricity_demand")
                print(demand, target, energy_demand)
            else:
                print(demand, energy_demand)


        # Check that producer 1 (merit oder = 2) is not used
        # and is does not contribute to the heating demands 1, 2 and 3
        #TODO: these tests need to be updated for elec/gas


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestMultiCommoditySimulator()
    a.test_multi_commodity_simulator()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
