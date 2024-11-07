import os
import sys
from pathlib import Path

import logging
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.goals.minimize_tco_goal import MinimizeTCO
from mesido.workflows.grow_workflow import SolverCPLEX, SolverHIGHS
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.gas_elect_workflow import GasElectProblem

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import SinglePassGoalProgrammingMixin
from rtctools.util import run_optimization_problem

from mesido.workflows.utils.helpers import run_optimization_problem_solver

root_folder = os.path.join(str(Path(__file__).resolve().parent.parent.parent.parent), "tests")
sys.path.insert(1, root_folder)

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test, electric_power_conservation_test

from utils_test_scaling import create_problem_with_debug_info, problem_scaling_check


if __name__ == "__main__":
    import time

    start_time = time.time()

    optimscaling, logger, logs_list = create_problem_with_debug_info(GasElectProblem)

    solution = run_optimization_problem_solver(
        # optimscaling,
        GasElectProblem,
        solver_class=SolverCPLEX,
        esdl_parser=ESDLFileParser,
        # esdl_file_name="Kapelle_gas_elec_efvc_.esdl",
        # esdl_file_name="Kapelle_gas_elec_efvc_kvr_partial_pipes_network.esdl",  # time=1.5minutes no dh
        # esdl_file_name="Kapelle_gas_elec_efvc_kvr_partial_direct_network.esdl",  # time=1.5 minutes no dh
        esdl_file_name="Kapelle_gas_elec_efvc_kvr_complete_direct_network.esdl",
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="gas_demand_nom_m3_s_efvc_.csv",
    )

    # This code below is used to do manual check. Do not delete
    # problem_scaling_check(logs_list, logger)

    results = solution.extract_results()

    demand_matching_test(solution, results)
    energy_conservation_test(solution, results)
    heat_to_discharge_test(solution, results)

    # for asset_name in [*solution.energy_system_components.get("heat_source", [])]:
    # for asset_name in [*solution.energy_system_components.get("elec_boiler", [])]: 
    for asset_name in [*solution.energy_system_components.get("air_water_heat_pump_elec", [])]:
        power_cons = results[f"{asset_name}.Power_consumed"]
        value = results[f"{asset_name}__variable_operational_cost"]
        print(f"{asset_name} power consumed: {power_cons}, opex: {value}")

    for asset_name in [*solution.energy_system_components.get("gas_boiler", [])]:
        power_cons = results[f"{asset_name}.Gas_demand_mass_flow"]
        value = results[f"{asset_name}__variable_operational_cost"]
        print(f"{asset_name} gas consumed: {power_cons}, opex: {value}")

    # print(f'Gas OPEX: {results["STATION_5__variable_operational_cost"]}')
    # print(f'Elec prodcuer OPEX: {results["Elec_prod_5__variable_operational_cost"]}')

    # Check gas consumption vs production balance
    total_gas_demand_g = [0] * len(np.diff(solution.times()))
    total_gas_source_g = [0] * len(np.diff(solution.times()))
    for asset_name in [*solution.energy_system_components.get("gas_boiler", [])]:
        for ii in range(1, len(results[f"{asset_name}.Power_consumed"])):
            total_gas_demand_g[ii - 1] += (
                results[f"{asset_name}.Power_consumed"][ii]
                * np.diff(solution.times())[ii - 1]
            )

    for asset_name in [*solution.energy_system_components.get("gas_source", [])]:
        for ii in range(1, len(results[f"{asset_name}.Gas_source_mass_flow"])):
            total_gas_source_g[ii - 1] += (
                results[f"{asset_name}.Gas_source_mass_flow"][ii]
                * np.diff(solution.times())[ii - 1]
            )
    np.testing.assert_allclose(total_gas_source_g, total_gas_demand_g)

    # Check elect power demand vs production balance
    electric_power_conservation_test(solution, results)


    # Check costs
    np.testing.assert_allclose(
        sum(results["STATION_5.Gas_source_mass_flow"][1:] * 0.00123 * np.diff(solution.times())),
        results["STATION_5__variable_operational_cost"][0],
    )
    np.testing.assert_allclose(
        sum(
            results["Elec_prod_5.Electricity_source"][1:]
            * (np.diff(solution.times()))
            / 3600.0
            * 0.021
        ),
        results["Elec_prod_5__variable_operational_cost"][0],
    )


    kvr= 0.0
        # elec_price_profile = "Elec.price_profile"
        # gas_tranport_cost = sum(
        #     (
        #         solution.get_timeseries(elec_price_profile).times[1:]
        #         - solution.get_timeseries(elec_price_profile).times[0:-1]
        #     )
        #     / 3600.0
        #     * results["STATION_5.Gas_source_mass_flow"][1:]
        #     * 0.00123,
        # )
        # np.testing.assert_allclose(
        #     gas_tranport_cost,
        #     results["STATION_5__variable_operational_cost"],
        # )

        

    # results["Heatpump_4482.Power_consumed"]

    # results["STATION_5.Gas_source_mass_flow"]
    # results["Elec_prod_5.Electricity_source"]

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
