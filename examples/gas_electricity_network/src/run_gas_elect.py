# Note: The commented out items are requried for the manual checks/print outs below in this file
import os
import sys
from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.gas_elect_workflow import GasElectProblem
from mesido.workflows.utils.helpers import run_optimization_problem_solver

from mesido._darcy_weisbach import friction_factor, head_loss
from mesido.constants import GRAVITATIONAL_CONSTANT

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
    # print('HeatingDemand_1: ',results['HeatingDemand_1.Heat_flow'] )
    # print('HeatPump_1: ', results['HeatPump_1.Heat_source'])
    # print('GasHeater_1: ', results['GasHeater_1.Heat_source'])
    # print('HeatingDemand_2: ', results['HeatingDemand_2.Heat_flow'])
    # print('HeatPump_2: ', results['HeatPump_2.Heat_source'])
    # print('GasHeater_2: ', results['GasHeater_2.Heat_source'])

    print("==Tests Start==")

    # Test: Power recieved by heat demand is equal to the power supplied by conversion assets
    np.testing.assert_allclose(
        results["HeatingDemand_1.Heat_flow"],
        (results["HeatPump_1.Heat_source"] + results["GasHeater_1.Heat_source"]),
    )
    np.testing.assert_allclose(
        results["HeatingDemand_2.Heat_flow"],
        (results["HeatPump_2.Heat_source"] + results["GasHeater_2.Heat_source"]),
    )

    # Test: Check if gas pipe diameter value in resulting parameters are updated
    # with optimized values in results
    for pipe in solution.energy_system_components.get("gas_pipe", []):
        np.testing.assert_allclose(
            results[f"{pipe}__gn_diameter"],
            solution.parameters(0)[f"{pipe}.diameter"],
            atol=1.0e-12,
        )
        np.testing.assert_allclose(
            np.pi * results[f"{pipe}__gn_diameter"][0] ** 2 / 4.0,
            solution.parameters(0)[f"{pipe}.area"],
            atol=1.0e-12,
        )

    # Test: If the result dH is equal to manually calculated dH via linear interpolation.
    #       This check is only valid for HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY case.
    # Todo: Calculated head loss is marginally smaller than the result. Check the reason.
    for pipe in solution.energy_system_components.get("gas_pipe", []):
        if results[f"{pipe}__gn_diameter"] <= 1e-15:
            pass
        else:
            v_max = solution.gas_network_settings["maximum_velocity"]
            pipe_diameter = results[f"{pipe}__gn_diameter"][0]
            area = np.pi * pipe_diameter**2 / 4.0
            pipe_wall_roughness = solution.energy_system_options()["wall_roughness"]
            temperature = 20  # is default for gas pipes
            pipe_length = solution.parameters(0)[f"{pipe}.length"]
            v_pipe = results[f"{pipe}.Q"] / area
            # print("Velocity of ", pipe, v_pipe)
            # print("Diameter of ", pipe, pipe_diameter)
            if str(solution.gas_network_settings["head_loss_option"]) == "HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY":
                ff = friction_factor(
                    v_max,
                    pipe_diameter,
                    network_type=solution.gas_network_settings["network_type"],
                    pressure=solution.parameters(0)[f"{pipe}.pressure"],
                    wall_roughness=solution.energy_system_options()["wall_roughness"],
                    temperature=20,
                )
                c_v = parameters[f"{pipe}.length"] * ff / (2 * 9.81) / pipe_diameter
                dh_max = c_v * v_max**2
                dh_manual = dh_max * v_pipe / v_max
                # print("Calculated head loss in ", pipe, -dh_manual)
                # print("Resulting head loss in ", pipe, results[f"{pipe}.dH"])
                np.testing.assert_allclose(-dh_manual, results[f"{pipe}.dH"], atol=1.0e-12)

            elif str(solution.gas_network_settings["head_loss_option"]) == "HeadLossOption.LINEARIZED_N_LINES_EQUALITY":
                print("This is a n_line_equality")
                # itime = 0
                # v_max = solution.gas_network_settings["maximum_velocity"]
                # pipe_diameter = solution.parameters(0)[f"{pipe}.diameter"]
                # pipe_wall_roughness = solution.energy_system_options()["wall_roughness"]
                # temperature = 20
                # pipe_length = solution.parameters(0)[f"{pipe}.length"]
                # v_points = np.linspace(
                #     0.0,
                #     v_max,
                #     solution.gas_network_settings["n_linearization_lines"] + 1,
                # )
                # v_inspect = v_pipe[itime]
                #
                # # Theoretical head loss calc, dH =
                # # friction_factor * 8 * pipe_length * volumetric_flow^2 / ( pipe_diameter^5 * g * pi^2)
                # dh_theory = (
                #         friction_factor(
                #             v_inspect,
                #             pipe_diameter,
                #             pipe_wall_roughness,
                #             temperature,
                #             network_type=solution.gas_network_settings["network_type"],
                #             pressure=solution.parameters(0)[f"{pipe}.pressure"],
                #         )
                #         * 8.0
                #         * pipe_length
                #         * (v_inspect * np.pi * pipe_diameter ** 2 / 4.0) ** 2
                #         / (pipe_diameter ** 5 * GRAVITATIONAL_CONSTANT * np.pi ** 2)
                # )
                # # Approximate dH [m] vs Q [m3/s] with a linear line between between v_points
                # # dH_manual_linear = a*Q + b
                # # Then use this linear function to calculate the head loss
                # delta_dh_theory = (
                #             head_loss(
                #                 v_points[1],
                #                 pipe_diameter,
                #                 pipe_length,
                #                 pipe_wall_roughness,
                #                 temperature,
                #                 network_type=solution.gas_network_settings["network_type"],
                #                 pressure=solution.parameters(0)[f"{pipe}.pressure"],
                #             )
                #             - head_loss(
                #                 v_points[0],
                #                 pipe_diameter,
                #                 pipe_length,
                #                 pipe_wall_roughness,
                #                 temperature,
                #                 network_type=solution.gas_network_settings["network_type"],
                #                 pressure=solution.parameters(0)[f"{pipe}.pressure"],
                #             )
                # )
                #
                # delta_volumetric_flow = (v_points[1] * np.pi * pipe_diameter ** 2 / 4.0) - (
                #         v_points[0] * np.pi * pipe_diameter ** 2 / 4.0
                # )
                #
                # a = delta_dh_theory / delta_volumetric_flow
                # b = delta_dh_theory - a * delta_volumetric_flow
                # dh_manual_linear = a * (v_inspect * np.pi * pipe_diameter ** 2 / 4.0) + b
                #
                # dh_milp_head_loss_function = head_loss(
                #     v_inspect, pipe_diameter, pipe_length, pipe_wall_roughness, temperature
                # )
                # print((dh_milp_head_loss_function, dh_manual_linear))
                # a=1
                # # np.testing.assert_allclose(dh_theory, dh_milp_head_loss_function)
                # # np.testing.assert_array_less(dh_milp_head_loss_function, dh_manual_linear)

    # Test: Utils_tests
    demand_matching_test(solution, results)
    energy_conservation_test(solution, results)
    heat_to_discharge_test(solution, results)
    electric_power_conservation_test(solution, results)

    # Test: Check gas consumption vs production balance
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
    # print('total_gas_source_g: ', total_gas_source_g )
    # print('total_gas_demand_g: ', total_gas_demand_g)
    np.testing.assert_allclose(total_gas_source_g, total_gas_demand_g)

    # Test: Check if manually calculated TCO is equal to Objective function value
    total_opex = 0.0
    total_capex = 0.0
    for asset in [
        *solution.energy_system_components.get("heat_source", []),
        *solution.energy_system_components.get("electricity_cable", []),
        *solution.energy_system_components.get("gas_pipe", []),
    ]:

        # investment cost
        try:
            if asset in solution.energy_system_components["heat_source"]:
                investment_cost = (
                    solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                    .attributes["costInformation"]
                    .investmentCosts.value
                    * results[f"{asset}__max_size"]
                    / 1.0e6
                )
            else:
                try:  # gas pipe
                    investment_cost = results[f"{asset}__gn_cost"] * parameters[f"{asset}.length"]
                except:  # electric cable
                    investment_cost = (
                        solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                        .attributes["costInformation"]
                        .investmentCosts.value
                        * parameters[f"{asset}.length"]
                    )

            total_capex += investment_cost
            print(
                "investment cost: ",
                asset,
                investment_cost,
                abs(investment_cost - results[f"{asset}__investment_cost"]) < 1.0e-8,
            )
            np.testing.assert_allclose(investment_cost, results[f"{asset}__investment_cost"])
        except:
            pass

        # installation cost
        try:
            if results[f"{asset}__max_size"] == 0:
                installation_cost = 0
            else:
                installation_cost = (
                    solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                    .attributes["costInformation"]
                    .installationCosts.value
                )
            print(
                "installation cost: ",
                asset,
                installation_cost,
                abs(installation_cost - results[f"{asset}__installation_cost"]) < 1.0e-8,
            )
            total_capex += installation_cost
            np.testing.assert_allclose(installation_cost, results[f"{asset}__installation_cost"])
        except:
            pass

        # variable operational cost
        try:
            timesteps_hr = np.diff(solution.times()) / 3600
            variable_operational_cost = 0.0
            if asset in solution.energy_system_components["heat_source"]:
                var_op_costs = (
                    solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                    .attributes["costInformation"]
                    .variableOperationalCosts.value
                    / 1.0e6
                )
                assert var_op_costs > 0
                factor = 1.0
                if asset in [
                    *solution.energy_system_components.get("air_water_heat_pump_elec", []),
                ]:
                    factor = solution.esdl_assets[
                        solution.esdl_asset_name_to_id_map[f"{asset}"]
                    ].attributes["COP"]
                if asset in [
                    *solution.energy_system_components.get("gas_boiler", []),
                ]:
                    factor = solution.esdl_assets[
                        solution.esdl_asset_name_to_id_map[f"{asset}"]
                    ].attributes["efficiency"]
                # assert factor >= 1.0
                for ii in range(1, len(solution.times())):
                    variable_operational_cost += (
                        var_op_costs
                        * results[f"{asset}.Heat_flow"][ii]
                        * timesteps_hr[ii - 1]
                        / factor
                    )
                print(
                    "variable operational cost: ",
                    asset,
                    variable_operational_cost,
                    abs(variable_operational_cost - results[f"{asset}__variable_operational_cost"])
                    < 1.0e-8,
                )
            np.testing.assert_allclose(
                variable_operational_cost, results[f"{asset}__variable_operational_cost"]
            )
        except:
            pass

        total_opex += variable_operational_cost

    print("Calculated TCO:  ", (total_capex[0] + total_opex) / 1.0e6)
    print("Objective Value: ", solution.objective_value)
    np.testing.assert_allclose(
        solution.objective_value,
        (total_capex[0] + total_opex) / 1.0e6,
        atol=1.0e-6
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
