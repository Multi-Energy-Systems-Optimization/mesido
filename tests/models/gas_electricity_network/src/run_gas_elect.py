# Note: The commented out items are requried for the manual checks/print outs below in this file
import sys
from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.gas_elect_workflow import GasElectProblem
from mesido.workflows.utils.helpers import run_optimization_problem_solver

# from mesido.esdl.asset_to_component_base import _AssetToComponentBase
# from mesido.esdl.edr_pipe_class import EDRGasPipeClass
# import numpy as np

root_folder = str(Path(__file__).resolve().parent.parent.parent.parent)
sys.path.insert(1, root_folder)

# from utils_tests import (
#     demand_matching_test,
#     electric_power_conservation_test,
#     energy_conservation_test,
#     heat_to_discharge_test,
#     gas_pipes_head_loss_test,
# )

if __name__ == "__main__":
    import time

    start_time = time.time()

    solution = run_optimization_problem_solver(
        GasElectProblem,
        esdl_parser=ESDLFileParser,
        esdl_file_name="gas_elect_loop_tree.esdl",
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="HeatingDemand_W_manual.csv",
    )

    results = solution.extract_results()
    parameters = solution.parameters(0)

    solution_high_demand = run_optimization_problem_solver(
        GasElectProblem,
        esdl_parser=ESDLFileParser,
        esdl_file_name="gas_elect_loop_tree.esdl",
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="HeatingDemand_W_manual_HighDemand.csv",
    )

    results_high_demand = solution_high_demand.extract_results()
    parameters_high_demand = solution_high_demand.parameters(0)

    # ----------------------------------------------------------------------------------------------
    # Do not delete the code below: manual checking and testing of values + usefull prints to
    # terminal
    #
    # print("==Tests Start==")
    #
    # print("HeatingDemand_1: ", results["HeatingDemand_1.Heat_flow"])
    # print("HeatPump_1: ", results["HeatPump_1.Heat_source"])
    # print("GasHeater_1: ", results["GasHeater_1.Heat_source"])
    # print("HeatingDemand_2: ", results["HeatingDemand_2.Heat_flow"])
    # print("HeatPump_2: ", results["HeatPump_2.Heat_source"])
    # print("GasHeater_2: ", results["GasHeater_2.Heat_source"])
    #
    # # Test: Utils_tests
    # demand_matching_test(solution, results)
    # energy_conservation_test(solution, results)
    # heat_to_discharge_test(solution, results)
    # electric_power_conservation_test(solution, results)
    # gas_pipes_head_loss_test(solution, results)
    #
    # demand_matching_test(solution_high_demand, results_high_demand)
    # energy_conservation_test(solution_high_demand, results_high_demand)
    # heat_to_discharge_test(solution_high_demand, results_high_demand)
    # electric_power_conservation_test(solution_high_demand, results_high_demand)
    # gas_pipes_head_loss_test(solution_high_demand, results_high_demand)
    #
    # # Test: Power recieved by heat demand is equal to the power supplied by conversion assets
    # np.testing.assert_allclose(
    #     results["HeatingDemand_1.Heat_flow"],
    #     (results["HeatPump_1.Heat_source"] + results["GasHeater_1.Heat_source"]),
    # )
    # np.testing.assert_allclose(
    #     results["HeatingDemand_2.Heat_flow"],
    #     (results["HeatPump_2.Heat_source"] + results["GasHeater_2.Heat_source"]),
    # )
    #
    # # Test: Check if gas pipe diameter value in resulting parameters are updated
    # # with optimized values in results
    # for pipe in solution.energy_system_components.get("gas_pipe", []):
    #     np.testing.assert_allclose(
    #         results[f"{pipe}__gn_diameter"],
    #         solution.parameters(0)[f"{pipe}.diameter"],
    #         atol=1.0e-12,
    #     )
    #     np.testing.assert_allclose(
    #         np.pi * results[f"{pipe}__gn_diameter"][0] ** 2 / 4.0,
    #         solution.parameters(0)[f"{pipe}.area"],
    #         atol=1.0e-12,
    #     )
    #
    # # Test: Show a larger pipe size is need for high heating demand
    # pipe_diameters = []
    # for pipe in solution.energy_system_components.get("gas_pipe", []):
    #     if results[f"{pipe}__gn_diameter"] <= 1e-15:
    #         pass
    #     else:
    #         pipe_diameters.append(results[f"{pipe}__gn_diameter"][0])
    #
    # pipe_diameters_high_demand = []
    # for pipe in solution_high_demand.energy_system_components.get("gas_pipe", []):
    #     if results_high_demand[f"{pipe}__gn_diameter"] <= 1e-15:
    #         pass
    #     else:
    #         pipe_diameter = results_high_demand[f"{pipe}__gn_diameter"][0]
    #         pipe_diameters_high_demand.append(pipe_diameter)
    #         print("Diameter of ", pipe, pipe_diameter)
    # # print(np.array(pipe_diameters), np.array(pipe_diameters_HighDemand))
    # np.testing.assert_array_less(np.array(pipe_diameters), np.array(pipe_diameters_high_demand))
    #
    # # Test: Check the burning efficiency of gas heaters
    # for asset_name in [*solution.energy_system_components.get("gas_heat_source_gas", [])]:
    #     np.testing.assert_allclose(
    #         parameters[f"{asset_name}.energy_content"]
    #         * results[f"{asset_name}.GasIn.mass_flow"]
    #         * parameters[f"{asset_name}.efficiency"]
    #         / 1000.0,  # [J/kg] * [g/s] / 1000.0 = [J/s]
    #         results[f"{asset_name}.Heat_source"],
    #     )
    #
    # # Test: Check gas consumption vs production balance
    # total_gas_demand_g = [0] * len(np.diff(solution.times()))
    # total_gas_source_g = [0] * len(np.diff(solution.times()))
    # for asset_name in [*solution.energy_system_components.get("gas_heat_source_gas", [])]:
    #     for ii in range(1, len(results[f"{asset_name}.Gas_demand_mass_flow"])):
    #         total_gas_demand_g[ii - 1] += (
    #             results[f"{asset_name}.Gas_demand_mass_flow"][ii]
    #             * np.diff(solution.times())[ii - 1]
    #         )
    # for asset_name in [*solution.energy_system_components.get("gas_source", [])]:
    #     for ii in range(1, len(results[f"{asset_name}.Gas_source_mass_flow"])):
    #         total_gas_source_g[ii - 1] += (
    #             results[f"{asset_name}.Gas_source_mass_flow"][ii]
    #             * np.diff(solution.times())[ii - 1]
    #         )
    # # print('total_gas_source_g: ', total_gas_source_g )
    # # print('total_gas_demand_g: ', total_gas_demand_g)
    # np.testing.assert_allclose(total_gas_source_g, total_gas_demand_g)
    #
    # # Test: Check if manually calculated TCO is equal to Objective function value
    # pipe_classes = [
    #     EDRGasPipeClass.from_edr_class(
    #         name, edr_class_name, solution.gas_network_settings["maximum_velocity"]
    #     )
    #     for name, edr_class_name in _AssetToComponentBase.STEEL_S1_PIPE_EDR_ASSETS.items()
    # ]
    # total_opex = 0.0
    # total_capex = 0.0
    # for asset in [
    #     *solution.energy_system_components.get("heat_source", []),
    #     *solution.energy_system_components.get("electricity_cable", []),
    #     *solution.energy_system_components.get("gas_pipe", []),
    # ]:
    #
    #     # investment cost
    #     investment_cost = 0.0
    #     if asset in [
    #         *solution.energy_system_components.get("heat_source", []),
    #         *solution.energy_system_components.get("electricity_cable", []),
    #     ]:
    #         investment_cost_info = (
    #             solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
    #             .attributes["costInformation"]
    #             .investmentCosts.value
    #         )
    #     if asset in solution.energy_system_components["heat_source"]:
    #         investment_cost = investment_cost_info * results[f"{asset}__max_size"] / 1.0e6
    #     elif asset in solution.energy_system_components["electricity_cable"]:
    #         investment_cost = investment_cost_info * parameters[f"{asset}.length"]
    #     elif asset in solution.energy_system_components["gas_pipe"]:
    #         if parameters[f"{asset}.diameter"] > 0:
    #             for iter in range(len(pipe_classes)):
    #                 if pipe_classes[iter].inner_diameter == parameters[f"{asset}.diameter"]:
    #                     investment_cost = (
    #                         pipe_classes[iter].investment_costs * parameters[f"{asset}.length"]
    #                     )
    #     total_capex += investment_cost
    #     print(
    #         "investment cost: ",
    #         asset,
    #         investment_cost,
    #         abs(investment_cost - results[f"{asset}__investment_cost"]) < 1.0e-8,
    #     )
    #     np.testing.assert_allclose(investment_cost, results[f"{asset}__investment_cost"])
    #
    #     # installation cost
    #     if asset in solution.energy_system_components["heat_source"]:
    #         if results[f"{asset}__max_size"] < 1e-8:
    #             installation_cost = 0
    #         else:
    #             installation_cost = (
    #                 solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
    #                 .attributes["costInformation"]
    #                 .installationCosts.value
    #             )
    #         print(
    #             "installation cost: ",
    #             asset,
    #             installation_cost,
    #             abs(installation_cost - results[f"{asset}__installation_cost"]) < 1.0e-8,
    #         )
    #         total_capex += installation_cost
    #         np.testing.assert_allclose(installation_cost, results[f"{asset}__installation_cost"])
    #
    #     # variable operational cost
    #     timesteps_hr = np.diff(solution.times()) / 3600
    #     variable_operational_cost = 0.0
    #     if asset in solution.energy_system_components["heat_source"]:
    #         var_op_costs = (
    #             solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
    #             .attributes["costInformation"]
    #             .variableOperationalCosts.value
    #             / 1.0e6
    #         )
    #         assert var_op_costs > 0
    #         factor = 1.0
    #         if asset in [
    #             *solution.energy_system_components.get("air_water_heat_pump_elec", []),
    #         ]:
    #             factor = solution.esdl_assets[
    #                 solution.esdl_asset_name_to_id_map[f"{asset}"]
    #             ].attributes["COP"]
    #         if asset in [
    #             *solution.energy_system_components.get("gas_heat_source_gas", []),
    #         ]:
    #             factor = solution.esdl_assets[
    #                 solution.esdl_asset_name_to_id_map[f"{asset}"]
    #             ].attributes["efficiency"]
    #         # assert factor >= 1.0
    #         for ii in range(1, len(solution.times())):
    #             variable_operational_cost += (
    #                 var_op_costs * results[f"{asset}.Heat_flow"][ii] * timesteps_hr[ii - 1]
    #                 / factor
    #             )
    #         print(
    #             "variable operational cost: ",
    #             asset,
    #             variable_operational_cost,
    #             abs(variable_operational_cost - results[f"{asset}__variable_operational_cost"])
    #             < 1.0e-8,
    #         )
    #     np.testing.assert_allclose(
    #         variable_operational_cost, results[f"{asset}__variable_operational_cost"]
    #     )
    #     total_opex += variable_operational_cost
    #
    # print("Calculated TCO:  ", (total_capex[0] + total_opex) / 1.0e6)
    # print("Objective Value: ", solution.objective_value)
    # np.testing.assert_allclose(
    #     solution.objective_value, (total_capex[0] + total_opex) / 1.0e6, atol=1.0e-6
    # )
    #
    # print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
