# Note: The commented out items are requried for the manual checks/print outs below in this file
# import os
# import sys
# from pathlib import Path

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.gas_elect_workflow import GasElectProblem
from mesido.workflows.utils.helpers import run_optimization_problem_solver

# root_folder = os.path.join(str(Path(__file__).resolve().parent.parent.parent.parent), "tests")
# sys.path.insert(1, root_folder)

# from utils_tests import (
#     demand_matching_test,
#     electric_power_conservation_test,
#     energy_conservation_test,
#     heat_to_discharge_test,
# )

if __name__ == "__main__":
    import time

    start_time = time.time()

    solution = run_optimization_problem_solver(
        GasElectProblem,
        esdl_parser=ESDLFileParser,
        esdl_file_name="Example_gas_elec.esdl",
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="Example_gas_demand_nom_m3_s.csv",
    )

    results = solution.extract_results()

    # ----------------------------------------------------------------------------------------------
    # Do not delete the code below: manual checking and testing of values + usefull prints to
    # terminal

    # demand_matching_test(solution, results)
    # energy_conservation_test(solution, results)
    # heat_to_discharge_test(solution, results)

    # for asset_name in [*solution.energy_system_components.get("air_water_heat_pump_elec", [])]:
    #     power_cons = results[f"{asset_name}.Power_consumed"]
    #     print(f"{asset_name} power consumed: {power_cons}")

    # for asset_name in [*solution.energy_system_components.get("gas_boiler", [])]:
    #     power_cons = results[f"{asset_name}.Gas_demand_mass_flow"]
    #     print(f"{asset_name} gas consumed: {power_cons}")

    # # Check gas consumption vs production balance
    # total_gas_demand_g = [0] * len(np.diff(solution.times()))
    # total_gas_source_g = [0] * len(np.diff(solution.times()))
    # for asset_name in [*solution.energy_system_components.get("gas_boiler", [])]:
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
    # np.testing.assert_allclose(total_gas_source_g, total_gas_demand_g)

    # # Check elect power demand vs production balance
    # electric_power_conservation_test(solution, results)

    # Check OPEX costs
    # np.testing.assert_allclose(
    #     sum(
    #         results["STATION_5.Gas_source_mass_flow"][1:] * 0.0037926 * np.diff(solution.times())
    #     ),
    #     results["STATION_5__variable_operational_cost"][0],
    # )
    # np.testing.assert_allclose(
    #     sum(
    #         results["Elec_prod_5.Electricity_source"][1:]
    #         * (np.diff(solution.times()))
    #         / 3600.0
    #         * 0.00027
    #     ),
    #     results["Elec_prod_5__variable_operational_cost"][0],
    #     atol=1e-10,
    # )
    # np.testing.assert_allclose(
    #     sum(
    #         results["STATION_10.Gas_source_mass_flow"][1:] * 0.0037926 * np.diff(solution.times())
    #     ),
    #     results["STATION_10__variable_operational_cost"][0],
    # )
    # np.testing.assert_allclose(
    #     sum(
    #         results["Elec_prod_10.Electricity_source"][1:]
    #         * (np.diff(solution.times()))
    #         / 3600.0
    #         * 0.00027
    #     ),
    #     results["Elec_prod_10__variable_operational_cost"][0],
    #     atol=1e-10,
    # )

    # # Check that heat energy balance
    # for asset_name in [*solution.energy_system_components.get("heat_demand", [])]:
    #     dmnd_num = asset_name.strip("Demand_")
    #     dmnd_val = results[f"Demand_{dmnd_num}.Heat_flow"]
    #     prod_perc_hp = results[f"Heatpump_{dmnd_num}.Heat_flow"] / dmnd_val
    #     prod_perc_gb = results[f"Gasboiler_{dmnd_num}.Heat_flow"] / dmnd_val
    #     # Do not delete: use for manual checks
    #     print(
    #         f"dmnd_num: {dmnd_num} demand {dmnd_val/1.0e3}kW, source % split "
    #         f"HP: {[round(elem*100.0, 1) for elem in prod_perc_hp]} & "
    #         f"GasBoiler{[round(elem*100.0, 1) for elem in prod_perc_gb]}"
    #     )
    #     np.testing.assert_allclose(prod_perc_hp + prod_perc_gb, 1.0)

    # # Costs
    # opex_gas = (
    #     results["STATION_5__variable_operational_cost"][0]
    #     + results["STATION_10__variable_operational_cost"][0]
    # )
    # opex_elect = (
    #     results["Elec_prod_10__variable_operational_cost"][0]
    #     + results["Elec_prod_5__variable_operational_cost"][0]
    # )
    # opex_tot = opex_gas + opex_elect
    # print(f"OPEX for gas:{opex_gas} + elect:{opex_elect} = total OPEX {opex_tot}")

    # # Check that the gas energy content
    # np.testing.assert_allclose(
    #     # g/s /1000 * energy_content J/kg
    #     results["Gasboiler_4391.Gas_demand_mass_flow"] / 1000 * 41373333.404736854,
    #     results["Gasboiler_4391.Heat_flow"],
    # )
    # ----------------------------------------------------------------------------------------------
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
