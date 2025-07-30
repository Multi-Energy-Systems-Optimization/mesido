from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.utils.helpers import run_optimization_problem_solver

from mesido._darcy_weisbach import friction_factor

import numpy as np

from utils_tests import (
    demand_matching_test,
    energy_conservation_test,
    heat_to_discharge_test,
    electric_power_conservation_test,
)


class TestGasElect(TestCase):
    def test_gas_elect(self):
        """
        Small scaled case that uses gas and electricity commodities is added. Case includes
        2 Heating demand, 1 gas pipe looped network, 1 electricity network, 2 heat pumps and
        2 gas boilers. Conversion assets have installation (EUR), investment (EUR/MW) and
        variable operational costs (EUR/MWh). Gas pipes and electricity cables have
        investment cost (EUR/m). Units in EUR/MW and EUR/MWh of conversion assets refers
        to per-watt-electricity or per-watt-gas or per=watt-thermal depending on the
        commodity that is consumed or produced by the conversion asset.

        Checks:
        1. the power recieved by heat demand is equal to the power supplied by conversion assets
        2. gas pipe diameter value in resulting parameters are updated with optimized values
        in results
        3. the result dH is equal to manually calculated dH via linear interpolation.
        4. gas consumption is equal to production
        5. manually calculated TCO is equal to Objective function value
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
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        # Test: Power recieved by heat demand is equal to the power supplied by conversion assets
        np.testing.assert_allclose(
            results["HeatingDemand_1.Heat_flow"],
            (results["HeatPump_1.Heat_source"] + results["GasHeater_1.Heat_source"]),
        )
        np.testing.assert_allclose(
            results["HeatingDemand_2.Heat_flow"],
            (results["HeatPump_2.Heat_source"] + results["GasHeater_2.Heat_source"]),
        )

        # Test: Check if gas pipe diameter value in resulting parameters are
        # updated with optimized values in results
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
        for pipe in solution.energy_system_components.get("gas_pipe", []):
            if results[f"{pipe}__gn_diameter"] <= 1e-15:
                pass
            else:
                v_max = solution.gas_network_settings["maximum_velocity"]
                pipe_diameter = results[f"{pipe}__gn_diameter"][0]
                area = np.pi * pipe_diameter**2 / 4.0
                v_pipe = results[f"{pipe}.Q"] / area
                # print("Velocity of ", pipe, v_pipe)
                # print("Diameter of ", pipe, pipe_diameter)
                if str(solution.gas_network_settings[
                           "head_loss_option"]) == "HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY":
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
                        investment_cost = (
                            results[f"{asset}__gn_cost"] * parameters[f"{asset}.length"]
                        )
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
                np.testing.assert_allclose(
                    installation_cost, results[f"{asset}__installation_cost"]
                )
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
                        abs(
                            variable_operational_cost
                            - results[f"{asset}__variable_operational_cost"]
                        )
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


if __name__ == "__main__":

    a = TestGasElect()
    a.test_gas_elect()
