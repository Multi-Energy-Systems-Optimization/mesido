from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.multicommodity_simulator_workflow import MultiCommoditySimulator, \
    MultiCommoditySimulatorNoLosses

import numpy as np

from rtctools.util import run_optimization_problem

from utils_tests import demand_matching_test, energy_conservation_test


def checks_all_mc_simulations(solution, results):
    # General checks
    demand_matching_test(solution, results)
    energy_conservation_test(solution, results)

    for prod in solution.energy_system_components.get("electricity_source", []):
        prod_profile_name = f"{prod}.maximum_electricity_source"
        energy_prod = results[f"{prod}.Electricity_source"]
        if prod_profile_name in solution.io.get_timeseries_names():
            target = solution.get_timeseries(prod_profile_name).values
            np.testing.assert_allclose(target, energy_prod, atol=1.0e-3, rtol=1.0e-6)
        print(prod, energy_prod)

    for demand in solution.energy_system_components.get("electricity_demand", []):
        energy_demand = results[f"{demand}.Electricity_demand"]
        if f"{demand}.target_electricity_demand" in solution.io.get_timeseries_names():
            target = solution.get_timeseries(f"{demand}.target_electricity_demand")
            print(demand, target, energy_demand)
        else:
            print(demand, energy_demand)

    for demand in solution.energy_system_components.get("gas_demand", []):
        energy_demand = results[f"{demand}.Gas_demand_mass_flow"]
        if f"{demand}.target_gas_demand" in solution.io.get_timeseries_names():
            target = solution.get_timeseries(f"{demand}.target_gas_demand")
            print(demand, target, energy_demand)
        else:
            print(demand, energy_demand)


class TestMultiCommoditySimulator(TestCase):
    #TODO: update docstring
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

    def test_multi_commodity_simulator_priorities_el(self):
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

        bounds = solution.bounds()
        results = solution.extract_results()

        checks_all_mc_simulations(solution, results)

        prod_1 = results["ElectricityProducer_a215.Electricity_source"]
        prod_2 = results["ElectricityProducer_17a1.Electricity_source"]
        dem_1 = results["ElectricityDemand_e527.Electricity_demand"]
        dem_2 = results["ElectricityDemand_281a.Electricity_demand"]

        # check producer with highest priority (lowest marginal costs is maximizing production)
        np.testing.assert_allclose(
            prod_1, bounds["ElectricityProducer_a215.Electricity_source"][1], atol=1e-3, rtol=1e-6
        )
        # check producer with second highest priority is only producing to meet profile of demand
        prod_2_target = dem_1 - prod_1
        prod_2_target[prod_2_target < 0] = 0
        np.testing.assert_allclose(prod_2, prod_2_target, atol=1e-3, rtol=1e-6)
        # check demand with lowest marginal cost is only consuming if electricity left from producer
        # with highest priority after the matching of demand profile
        demand_2_target = prod_1 - dem_1
        demand_2_target[demand_2_target < 0] = 0
        np.testing.assert_allclose(dem_2, demand_2_target, atol=1e-3, rtol=1e-6)

    def test_multi_commodity_simulator_prod_profile(self):
        import models.unit_cases_electricity.bus_networks.src.example as example

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_optimization_problem(
            MultiCommoditySimulator,
            base_folder=base_folder,
            esdl_file_name="Electric_bus4_priorities.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_2_prod.csv",
        )

        bounds = solution.bounds()
        results = solution.extract_results()

        checks_all_mc_simulations(solution, results)

        prod_1 = results["ElectricityProducer_a215.Electricity_source"]
        prod_2 = results["ElectricityProducer_17a1.Electricity_source"]
        dem_1 = results["ElectricityDemand_e527.Electricity_demand"]
        dem_2 = results["ElectricityDemand_281a.Electricity_demand"]

        # check producer with highest priority (lowest marginal costs is maximizing production) is
        # producing at max capacity, except when demand profile + max demand of other demand is
        # lower than prod_2 profile and max capacity prod_1
        np.testing.assert_allclose(
            prod_1[1:],
            bounds["ElectricityProducer_a215.Electricity_source"][1],
            atol=1e-3,
            rtol=1e-6,
        )
        np.testing.assert_allclose(
            prod_1[0],
            bounds["ElectricityDemand_281a.Electricity_demand"][1] + dem_1[0] - prod_2[0],
            atol=1e-3,
            rtol=1e-6,
        )

        # check demand with lowest marginal cost is only consuming if electricity left from producer
        # with highest priority and producer with profile, after the matching of demand profile
        demand_2_target = prod_1 + prod_2 - dem_1
        demand_2_target[demand_2_target < 0] = 0
        np.testing.assert_allclose(dem_2, demand_2_target, atol=1e-3, rtol=1e-6)

        # Check that producer 1 (merit oder = 2) is not used
        # and is does not contribute to the heating demands 1, 2 and 3
        # TODO: these tests need to be updated for elec/gas

        import models.unit_cases_gas.multi_demand_source_node.src.run_test as example

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_optimization_problem(
            MultiCommoditySimulator,
            base_folder=base_folder,
            esdl_file_name="test_priorities.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        results = solution.extract_results()
        bounds = solution.bounds()

        checks_all_mc_simulations(solution, results)

        prod_1 = results["GasProducer_3573.Gas_source_mass_flow"]
        prod_2 = results["GasProducer_a977.Gas_source_mass_flow"]
        dem_1 = results["GasDemand_47d0.Gas_demand_mass_flow"]
        dem_2 = results["GasDemand_7979.Gas_demand_mass_flow"]
        prod_1_bound = bounds["GasProducer_3573.Gas_source_mass_flow"][1]
        dem_2_bound = bounds["GasDemand_7979.Gas_demand_mass_flow"]

        # check producer with highest marginal cost (prod_2) is only producing to match demand
        # profile of dem_1 + the max of dem_2,
        # check producer_1 is maxed out
        prod_2_target = dem_1 + dem_2 - prod_1
        prod_2_target[prod_2_target < 0] = 0
        np.testing.assert_allclose(prod_2, prod_2_target, atol=1e-3, rtol=1e-6)
        np.testing.assert_allclose(prod_1, prod_1_bound)

        # check demand 1 is matching the profile (in check_all_mc_simulations) and that demand 2 is maxed out
        checks_all_mc_simulations(solution, results)
        np.testing.assert_allclose(dem_2, dem_2_bound[1], atol=1e-3, rtol=1e-6)

    def test_multi_commodity_simulator_emerge(self):
        import models.emerge.src.example as example

        base_folder = Path(example.__file__).resolve().parent.parent

        class MCSimulatorShort(MultiCommoditySimulatorNoLosses):
            def times(self, variable=None):
                return super().times(variable)

        solution = run_optimization_problem(
            MCSimulatorShort,
            base_folder=base_folder,
            esdl_file_name="emerge_priorities_withoutstorage.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_short.csv",
        )

        #TODO: gas and/or electrolyzer gives issues when using highs as solver.
        bounds = solution.bounds()
        results = solution.extract_results()

        checks_all_mc_simulations(solution, results)

        demand_gas = results[f"GasDemand_4146.Gas_demand_mass_flow"][4:10]
        demand_el = results[f"ElectricityDemand_f833.Electricity_demand"][4:10]
        electrolyzer_power = results[f"Electrolyzer_6327.Power_consumed"][4:10]
        electrolyzer_gas = results[f"Electrolyzer_6327.Gas_mass_flow_out"][4:10]
        # storage_flow = results["GasStorage_9172.Gas_tank_flow"][4:10]
        # storage_mass = results["GasStorage_9172.Stored_gas_mass"][4:10]

        # check producer with highest priority (lowest marginal costs is maximizing production) is
        # producing at max capacity, except when demand profile + max demand of other demand is
        # lower than prod_2 profile and max capacity prod_1
        # np.testing.assert_allclose(
        #     prod_1[1:],
        #     bounds["ElectricityProducer_a215.Electricity_source"][1],
        #     atol=1e-3,
        #     rtol=1e-6,
        # )
        # np.testing.assert_allclose(
        #     prod_1[0],
        #     bounds["ElectricityDemand_281a.Electricity_demand"][1] + dem_1[0] - prod_2[0],
        #     atol=1e-3,
        #     rtol=1e-6,
        # )
        #
        # # check demand with lowest marginal cost is only consuming if electricity left from producer
        # # with highest priority and producer with profile, after the matching of demand profile
        # demand_2_target = prod_1 + prod_2 - dem_1
        # demand_2_target[demand_2_target < 0] = 0
        # np.testing.assert_allclose(dem_2, demand_2_target, atol=1e-3, rtol=1e-6)

if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestMultiCommoditySimulator()
    a.test_multi_commodity_simulator()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
