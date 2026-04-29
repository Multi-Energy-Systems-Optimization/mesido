from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.utils.error_types import NetworkErrors
from mesido.workflows.utils.helpers import run_optimization_problem_solver

import numpy as np

from utils_tests import (
    cost_calculation_test,
    demand_matching_test,
    electric_power_conservation_test,
    energy_conservation_test,
    gas_pipes_head_loss_test,
    heat_to_discharge_test,
)


class TestGasElect(TestCase):
    def test_gas_elect(self):
        """
        Small scaled case that uses hydrogen and electricity commodities is added. Case includes
        2 Heating demand, 1 gas pipe looped network, 1 electricity network, 2 heat pumps and
        2 gas boilers. Conversion assets have installation (EUR), investment (EUR/MW) and
        variable operational costs (EUR/MWh). Gas pipes and electricity cables have
        investment cost (EUR/m).
        - Investment cost of HeatPump assets in EUR/MW  refers to euro-per-watt-thermal
        - Investment cost of GasBoiler assets in EUR/MW  refers to euro-per-watt-thermal
        - Variable operational cost of HeatPump assets in EUR/MWh  refers
        to euro-per-watt-electricity-per-hour
        - Variable operational cost of GasBoiler assets in EUR/Nm3  refers
        to euro-per-watt-gas-per-normal-volume


        Checks:
        1. utils test: demand_matching_test, energy_conservation_test, heat_to_discharge_test,
         electric_power_conservation_test, gas_pipes_head_loss_test, cost_calculation_test,
        2. gas pipe diameter value in resulting parameters are updated with optimized values
        in results
        3. higher heating demand require larger size of gas pipes
        4. heat source energy of gas boiler is equal to consumed gas energy * efficiency
        5. gas consumption is equal to production
        """
        import models.gas_electricity_network.src.run_gas_elect as example
        from models.gas_electricity_network.src.run_gas_elect import GasElectProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_optimization_problem_solver(
            GasElectProblem,
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            esdl_file_name="gas_elect_loop_tree.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="HeatingDemand_W_manual.csv",
            error_type_check=NetworkErrors.NO_POTENTIAL_ERRORS_CHECK,
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)
        name_to_id_map = solution.esdl_asset_name_to_id_map
        gh_1_id = name_to_id_map["GasHeater_1"]
        hp_2_id = name_to_id_map["HeatPump_2"]

        solution_high_demand = run_optimization_problem_solver(
            GasElectProblem,
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            esdl_file_name="gas_elect_loop_tree.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="HeatingDemand_W_manual_HighDemand.csv",
            error_type_check=NetworkErrors.NO_POTENTIAL_ERRORS_CHECK,
        )

        results_high_demand = solution_high_demand.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)
        electric_power_conservation_test(solution, results)
        gas_pipes_head_loss_test(solution, results)

        # Check the cost calculations
        np.testing.assert_array_less(1e3, results[f"{gh_1_id}__variable_operational_cost"])
        np.testing.assert_array_less(1e3, results[f"{hp_2_id}__variable_operational_cost"])
        cost_calculation_test(solution, results, check_objective_function=True)

        demand_matching_test(solution_high_demand, results_high_demand)
        energy_conservation_test(solution_high_demand, results_high_demand)
        heat_to_discharge_test(solution_high_demand, results_high_demand)
        electric_power_conservation_test(solution_high_demand, results_high_demand)
        gas_pipes_head_loss_test(solution_high_demand, results_high_demand)

        # Check the cost calculations
        np.testing.assert_array_less(
            1e3, results_high_demand[f"{gh_1_id}__variable_operational_cost"]
        )
        np.testing.assert_array_less(
            1e3, results_high_demand[f"{hp_2_id}__variable_operational_cost"]
        )
        cost_calculation_test(
            solution_high_demand, results_high_demand, check_objective_function=True
        )

        # Test: Check if gas pipe diameter value in resulting parameters are
        # updated with optimized values in results
        for pipe in solution.energy_system_components.get("gas_pipe", []):
            np.testing.assert_allclose(
                results[f"{pipe}__gn_diameter"],
                solution.parameters(0)[f"{pipe}.diameter"],
            )
            np.testing.assert_allclose(
                np.pi * results[f"{pipe}__gn_diameter"][0] ** 2 / 4.0,
                solution.parameters(0)[f"{pipe}.area"],
            )

        # Test: Show a larger pipe size is need for high heating demand
        pipe_diameters = []
        for pipe in solution.energy_system_components.get("gas_pipe", []):
            if results[f"{pipe}__gn_diameter"] <= 1e-15:
                pass
            else:
                pipe_diameters.append(results[f"{pipe}__gn_diameter"][0])
        pipe_diameters_high_demand = []
        for pipe in solution_high_demand.energy_system_components.get("gas_pipe", []):
            if results_high_demand[f"{pipe}__gn_diameter"] <= 1e-15:
                pass
            else:
                pipe_diameters_high_demand.append(results_high_demand[f"{pipe}__gn_diameter"][0])
        np.testing.assert_array_less(np.array(pipe_diameters), np.array(pipe_diameters_high_demand))

        # Test: Check the burning efficiency of gas heaters
        for asset_name in [*solution.energy_system_components.get("gas_heat_source_gas", [])]:
            np.testing.assert_allclose(
                parameters[f"{asset_name}.energy_content"]
                * results[f"{asset_name}.GasIn.mass_flow"]
                * parameters[f"{asset_name}.efficiency"]
                / 1000.0,  # [J/kg] * [g/s] / 1000.0 = [J/s]
                results[f"{asset_name}.Heat_source"],
            )

        # Test: Check gas consumption vs production balance
        total_gas_demand_g = [0] * len(np.diff(solution.times()))
        total_gas_source_g = [0] * len(np.diff(solution.times()))
        for asset_name in [*solution.energy_system_components.get("gas_heat_source_gas", [])]:
            total_gas_demand_g += results[f"{asset_name}.Gas_demand_mass_flow"][1:] * np.diff(
                solution.times()
            )
        for asset_name in [*solution.energy_system_components.get("gas_source", [])]:
            total_gas_source_g += results[f"{asset_name}.Gas_source_mass_flow"][1:] * np.diff(
                solution.times()
            )
        np.testing.assert_allclose(total_gas_source_g, total_gas_demand_g)


if __name__ == "__main__":

    a = TestGasElect()
    a.test_gas_elect()
