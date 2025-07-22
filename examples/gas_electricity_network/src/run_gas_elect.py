# Note: The commented out items are requried for the manual checks/print outs below in this file
import os
import sys
from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.gas_elect_workflow import GasElectProblem
from mesido.workflows.utils.helpers import run_optimization_problem_solver

from mesido._darcy_weisbach import friction_factor

import numpy as np

root_folder = os.path.join(str(Path(__file__).resolve().parent.parent.parent.parent), "tests")
sys.path.insert(1, root_folder)

from utils_tests import (
    demand_matching_test,
    electric_power_conservation_test,
    energy_conservation_test,
    heat_to_discharge_test,
)

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

    print('============================')
    print('============TESTS===========')
    print('============================')

    # Test: Check if heat demand is equal to the energy supplied by conversion
    print('===Test 1: Energy Balance in Conversion Assets===')
    print(results['HeatingDemand_1.HeatOut.Heat'] - ( results['HeatPump_1.HeatOut.Heat'] + results['GasHeater_1.Heat_source'] ))
    print(results['HeatingDemand_2.HeatOut.Heat'] - ( results['HeatPump_2.HeatOut.Heat'] + results['GasHeater_2.Heat_source'] ))
    np.testing.assert_allclose(results['HeatingDemand_1.HeatOut.Heat'], ( results['HeatPump_1.HeatOut.Heat'] + results['GasHeater_1.Heat_source'] ))
    np.testing.assert_allclose(results['HeatingDemand_2.HeatOut.Heat'], ( results['HeatPump_2.HeatOut.Heat'] + results['GasHeater_2.Heat_source'] ))

    a=1

    # # Test: Check if the resulting head loss is matching with the theoretical value of the resulting variables
    # for pipe in solution.energy_system_components.get("gas_pipe", []):
    #     if results[f"{pipe}__gn_diameter"] <= 1e-15:
    #         pass
    #     else:
    #         # There is a problem at head-loss calculation. In manual head loss we use max velocity yet head loss in results sections i greater
    #         pc = solution.get_optimized_gas_pipe_class(pipe)
    #         ff = friction_factor(
    #             pc.maximum_velocity,
    #             pc.inner_diameter,
    #             wall_roughness=solution.energy_system_options()["wall_roughness"],
    #             temperature=20,
    #         )
    #         # wall_roughness=2.0e-4 # 1.50E-05 # problem.energy_system_options()["wall_roughness"]
    #         # temperature=20 # is default for gas pipes
    #
    #         c_v = parameters[f"{pipe}.length"] * ff / (2 * 9.81) / pc.inner_diameter
    #         dh_max = c_v * pc.maximum_velocity ** 2
    #         dh_manual = dh_max * results[f"{pipe}.Q"][1:] / pc.area / pc.maximum_velocity
    #         print(pipe, -dh_manual, results[f"{pipe}.dH"][1:])
    #         # np.testing.assert_allclose(-dh_manual, results[f"{pipe}.dH"][1:], atol=1.0e-12)
    #
    # print('============================')

    # ----------------------------------------------------------------------------------------------
    # Do not delete the code below: manual checking and testing of values + usefull prints to
    # terminal

    demand_matching_test(solution, results)
    energy_conservation_test(solution, results)
    heat_to_discharge_test(solution, results)

    for asset_name in [*solution.energy_system_components.get("air_water_heat_pump_elec", [])]:
        power_cons = results[f"{asset_name}.Power_consumed"]
        # print(f"{asset_name} power consumed: {power_cons}")

    for asset_name in [*solution.energy_system_components.get("gas_boiler", [])]:
        power_cons = results[f"{asset_name}.Gas_demand_mass_flow"]
        # print(f"{asset_name} gas consumed: {power_cons}")

    # Check gas consumption vs production balance
    total_gas_demand_g = [0] * len(np.diff(solution.times()))
    total_gas_source_g = [0] * len(np.diff(solution.times()))
    for asset_name in [*solution.energy_system_components.get("gas_boiler", [])]:
        for ii in range(1, len(results[f"{asset_name}.Gas_demand_mass_flow"])):
            total_gas_demand_g[ii - 1] += (
                results[f"{asset_name}.Gas_demand_mass_flow"][ii]
                * np.diff(solution.times())[ii - 1]
            )

    for asset_name in [*solution.energy_system_components.get("gas_source", [])]:
        for ii in range(1, len(results[f"{asset_name}.Gas_source_mass_flow"])):
            total_gas_source_g[ii - 1] += (
                results[f"{asset_name}.Gas_source_mass_flow"][ii]
                * np.diff(solution.times())[ii - 1]
            )
    np.testing.assert_allclose(total_gas_source_g, total_gas_demand_g)
    print('total_gas_source_g: ', total_gas_source_g )
    print('total_gas_demand_g: ', total_gas_demand_g)

    # Check elect power demand vs production balance
    electric_power_conservation_test(solution, results)

    print('============================')

    total_opex = 0.0
    total_capex = 0.0
    for asset in [
        *solution.energy_system_components.get("heat_source", []),
        *solution.energy_system_components.get("electricity_cable", []),
        *solution.energy_system_components.get("gas_pipe", []),
    ]:

        # investment and installation cost
        if asset in solution.energy_system_components["heat_source"]:
            investment_cost = solution.esdl_assets[
                                  solution.esdl_asset_name_to_id_map[f"{asset}"]
                              ].attributes["costInformation"].investmentCosts.value * results[
                                  f"{asset}__max_size"] / 1.0e6
            total_capex += investment_cost
            print("investment cost: ", asset, investment_cost, abs(investment_cost - results[f"{asset}__investment_cost"]) < 1.0e-8)

        if asset in [*solution.energy_system_components["gas_pipe"],
                     *solution.energy_system_components["electricity_cable"]]:
            try: # some pipes and cables are disappeared because of the optimization
                investment_cost = solution.esdl_assets[
                                      solution.esdl_asset_name_to_id_map[f"{asset}"]
                                  ].attributes["costInformation"].investmentCosts.value * parameters[
                                      f"{asset}.length"]
                total_capex += investment_cost
                print("investment cost: ", asset, investment_cost, abs(investment_cost - results[f"{asset}__investment_cost"]) < 1.0e-8)
                # print(asset, solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]].attributes["costInformation"].investmentCosts.value)
            except:
                pass

        try:
            installation_cost = solution.esdl_assets[
                solution.esdl_asset_name_to_id_map[f"{asset}"]
            ].attributes["costInformation"].installationCosts.value
            total_capex += installation_cost
            print("installation cost: ", asset, installation_cost, abs(installation_cost - results[f"{asset}__installation_cost"]) < 1.0e-8)
        except:
            pass

        # variable operational cost
        timesteps_hr = np.diff(solution.times()) / 3600
        if asset not in [
            *solution.energy_system_components["gas_pipe"],
            *solution.energy_system_components["electricity_cable"]
            ]:
            var_op_costs = solution.esdl_assets[
                               solution.esdl_asset_name_to_id_map[f"{asset}"]
                           ].attributes["costInformation"].variableOperationalCosts.value / 1.0e6
            assert (var_op_costs > 0)
        else:
            var_op_costs = 0.0
        factor = 1.0
        if asset in solution.energy_system_components["heat_source"]:
            if asset in [
                *solution.energy_system_components.get("air_water_heat_pump", []),
                *solution.energy_system_components.get("air_water_heat_pump_elec", []),
            ]:
                # solution.energy_system_components["air_water_heat_pump"]:
                factor = solution.esdl_assets[
                    solution.esdl_asset_name_to_id_map[f"{asset}"]
                ].attributes["COP"]
            assert (factor >= 1.0)
            variable_operational_cost = 0.0
            for ii in range(1, len(solution.times())):
                variable_operational_cost += (
                        var_op_costs
                        * results[f"{asset}.Heat_flow"][ii]
                        * timesteps_hr[ii - 1]
                        / factor
                )
            if asset in solution.energy_system_components.get("air_water_heat_pump_elec", []):
                for ii in range(1, len(solution.times())):
                    variable_operational_cost += (
                            0 # 0.2e-3  # euro/Wh, carrier cost if elec is used
                            * results[f"{asset}.Heat_flow"][ii]
                            * timesteps_hr[ii - 1]
                            / factor
                    )
            print("variable operational cost: ", asset, variable_operational_cost, abs(variable_operational_cost - results[f"{asset}__variable_operational_cost"]) < 1.0e-8)
        total_opex += (
                variable_operational_cost * solution.parameters(0)[f"{asset}.technical_life"]
        )
        # print("variable operational cost: ", asset, variable_operational_cost, abs(variable_operational_cost - results[f"{asset}__variable_operational_cost"])< 1.0e-8)


    # print (abs(solution.objective_value - (total_capex + total_opex) / 1.0e6) < 1.0e-8)

    print('============================')

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
