from pathlib import Path
from unittest import TestCase

from mesido.esdl.asset_to_component_base import _AssetToComponentBase
from mesido.esdl.edr_pipe_class import EDRGasPipeClass
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.utils.helpers import run_optimization_problem_solver

import models.gas_electricity_network.src.run_gas_elect as example
from models.gas_electricity_network.src.run_gas_elect import (
    GasElectProblem,
    GasElectProblemCheapCable,
)

import numpy as np

from utils_tests import (
    demand_matching_test,
    electric_power_conservation_test,
    energy_conservation_test,
    gas_pipes_head_loss_test,
    heat_to_discharge_test,
)


base_folder = Path(example.__file__).resolve().parent.parent


class TestGasElect(TestCase):
    def test_gas_pipe_electricity_cable_cost_optimization(self):
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
        - Variable operational cost of GasBoiler assets in EUR/MWh  refers
        to euro-per-watt-gas-per-hour


        Checks:
        1 - Investment cost of cable and gas pipe influences optimal solution to
        prove that cable sizing is implemented
        """

        solution_expensive_cable = run_optimization_problem_solver(
            GasElectProblem,
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            esdl_file_name="gas_elect_loop_tree_NewCosts.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="HeatingDemand_W_manual.csv",
        )

        results_expensive_cable = solution_expensive_cable.extract_results()

        solution_cheap_cable = run_optimization_problem_solver(
            GasElectProblemCheapCable,
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            esdl_file_name="gas_elect_loop_tree_NewCosts.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="HeatingDemand_W_manual.csv",
        )

        results_cheap_cable = solution_cheap_cable.extract_results()

        gas_boiler_expensive_cable = (
            results_expensive_cable["GasHeater_1.Heat_source"][1:]
            + results_expensive_cable["GasHeater_2.Heat_source"][1:]
        )
        heat_pump_expensive_cable = (
            results_expensive_cable["HeatPump_1.Heat_source"][1:]
            + results_expensive_cable["HeatPump_2.Heat_source"][1:]
        )

        gas_boiler_cheap_cable = (
            results_cheap_cable["GasHeater_1.Heat_source"][1:]
            + results_cheap_cable["GasHeater_2.Heat_source"][1:]
        )
        heat_pump_cheap_cable = (
            results_cheap_cable["HeatPump_1.Heat_source"][1:]
            + results_cheap_cable["HeatPump_2.Heat_source"][1:]
        )

        np.testing.assert_array_less(heat_pump_expensive_cable, gas_boiler_expensive_cable)
        np.testing.assert_array_less(gas_boiler_cheap_cable, heat_pump_cheap_cable)

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
        - Variable operational cost of GasBoiler assets in EUR/MWh  refers
        to euro-per-watt-gas-per-hour


        Checks:
        1. utils test: demand_matching_test, energy_conservation_test, heat_to_discharge_test,
        electric_power_conservation_test, gas_pipes_head_loss_test
        2. gas pipe diameter value in resulting parameters are updated with optimized values
        in results
        3. higher heating demand require larger size of gas pipes
        4. heat source energy of gas boiler is equal to consumed gas energy * efficiency
        5. gas consumption is equal to production
        6. manually calculated TCO is equal to Objective function value
        """

        solution = run_optimization_problem_solver(
            GasElectProblemCheapCable,
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            esdl_file_name="gas_elect_loop_tree.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="HeatingDemand_W_manual.csv",
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        solution_high_demand = run_optimization_problem_solver(
            GasElectProblemCheapCable,
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            esdl_file_name="gas_elect_loop_tree.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="HeatingDemand_W_manual_HighDemand.csv",
        )

        results_high_demand = solution_high_demand.extract_results()

        # Test: Utils_tests
        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)
        electric_power_conservation_test(solution, results)
        gas_pipes_head_loss_test(solution, results)

        demand_matching_test(solution_high_demand, results_high_demand)
        energy_conservation_test(solution_high_demand, results_high_demand)
        heat_to_discharge_test(solution_high_demand, results_high_demand)
        electric_power_conservation_test(solution_high_demand, results_high_demand)
        gas_pipes_head_loss_test(solution_high_demand, results_high_demand)

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
        np.testing.assert_array_less(
            np.array(pipe_diameters), np.array(pipe_diameters_high_demand) + 1e-9
        )

        # Test: Check the burning efficiency of gas heaters
        for asset_name in [*solution.energy_system_components.get("gas_boiler", [])]:
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
        for asset_name in [*solution.energy_system_components.get("gas_boiler", [])]:
            total_gas_demand_g += results[f"{asset_name}.Gas_demand_mass_flow"][1:] * np.diff(
                solution.times()
            )
        for asset_name in [*solution.energy_system_components.get("gas_source", [])]:
            total_gas_source_g += results[f"{asset_name}.Gas_source_mass_flow"][1:] * np.diff(
                solution.times()
            )
        np.testing.assert_allclose(total_gas_source_g, total_gas_demand_g)

        # Test: Check if manually calculated TCO is equal to Objective function value
        pipe_classes = [
            EDRGasPipeClass.from_edr_class(
                name, edr_class_name, solution.gas_network_settings["maximum_velocity"]
            )
            for name, edr_class_name in _AssetToComponentBase.STEEL_S1_PIPE_EDR_ASSETS.items()
        ]
        total_opex = 0.0
        total_capex = 0.0
        for asset in [
            *solution.energy_system_components.get("heat_source", []),
            *solution.energy_system_components.get("electricity_cable", []),
            *solution.energy_system_components.get("gas_pipe", []),
        ]:
            esdl_asset = solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
            costs_esdl_asset = esdl_asset.attributes["costInformation"]

            # investment cost
            investment_cost = 0.0
            if asset in solution.energy_system_components["heat_source"]:
                investment_cost_info = costs_esdl_asset.investmentCosts.value
                investment_cost = investment_cost_info * results[f"{asset}__max_size"] / 1.0e6
            elif asset in solution.energy_system_components["electricity_cable"]:
                cable_class = solution.electricity_cable_classes(asset)
                for iter in range(len(cable_class)):
                    if cable_class[iter].maximum_current == parameters[f"{asset}.max_current"]:
                        investment_cost = (
                            cable_class[iter].investment_costs * parameters[f"{asset}.length"]
                        )
            elif asset in solution.energy_system_components["gas_pipe"]:
                if parameters[f"{asset}.diameter"] > 0:
                    for iter in range(len(pipe_classes)):
                        #  If pipe is enabled, parameters[f"{asset}.diameter"] comes from
                        #  _gas_pipe_database.jso whereas pipe_classes[iter].inner_diameter
                        #  comes from _edr_pipes.json. Hence, there is a small difference
                        #  in the inner diameters of the same DN size
                        if (
                            abs(pipe_classes[iter].inner_diameter - parameters[f"{asset}.diameter"])
                            < 0.01
                        ):  # pipe_classes[iter].inner_diameter == parameters[f"{asset}.diameter"]:
                            investment_cost = (
                                pipe_classes[iter].investment_costs * parameters[f"{asset}.length"]
                            )
            total_capex += investment_cost
            np.testing.assert_allclose(
                investment_cost, results[f"{asset}__investment_cost"], atol=1.0e-8
            )

            # installation cost
            if asset in solution.energy_system_components["heat_source"]:
                if results[f"{asset}__max_size"] < 1e-8:
                    installation_cost = 0
                else:
                    installation_cost = costs_esdl_asset.installationCosts.value
                total_capex += installation_cost
                np.testing.assert_allclose(
                    installation_cost, results[f"{asset}__installation_cost"]
                )

            # variable operational cost
            timesteps_hr = np.diff(solution.times()) / 3600
            variable_operational_cost = 0.0
            if asset in solution.energy_system_components["heat_source"]:
                var_op_costs = costs_esdl_asset.variableOperationalCosts.value / 1.0e6
                assert var_op_costs > 0
                factor = 1.0
                if asset in [
                    *solution.energy_system_components.get("air_water_heat_pump_elec", []),
                ]:
                    factor = esdl_asset.attributes["COP"]
                if asset in [
                    *solution.energy_system_components.get("gas_boiler", []),
                ]:
                    factor = esdl_asset.attributes["efficiency"]
                for ii in range(1, len(solution.times())):
                    variable_operational_cost += (
                        var_op_costs
                        * results[f"{asset}.Heat_flow"][ii]
                        * timesteps_hr[ii - 1]
                        / factor
                    )
            np.testing.assert_allclose(
                variable_operational_cost, results[f"{asset}__variable_operational_cost"]
            )
            total_opex += variable_operational_cost

        np.testing.assert_allclose(
            solution.objective_value, (total_capex[0] + total_opex) / 1.0e6, atol=1.0e-6
        )


if __name__ == "__main__":

    a = TestGasElect()
    a.test_gas_pipe_electricity_cable_cost_optimization()
    # a.test_gas_elect()
