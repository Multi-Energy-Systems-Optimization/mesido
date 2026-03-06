import logging
from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing
from mesido.workflows.utils.error_types import NetworkErrors
import numpy as np


from utils_tests import (
    demand_matching_test,
    energy_conservation_test,
    heat_to_discharge_test,
)

logger = logging.getLogger("mesido")
logger.setLevel(logging.INFO)


class HeatCoolingGrowWorkflow(TestCase):

    def test_heating_cooling_case(self):
        """
        In this case we have a network with an air-water hp, a WKO (warm and cold well) and both
        hot and cold demand. The heat and cold demand was balanced such that the seasonal storage
        gets utilized as intended while minizing the TCO.
        """

        import models.heating_and_cooling.src.run_case as example

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_end_scenario_sizing(
            EndScenarioSizingStaged,
            base_folder=base_folder,
            esdl_file_name=(
                "Heating and cooling and elec network with return network with costs.esdl"
            ),
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_4_elect_cost_modified.csv",
            error_type_check=NetworkErrors.HEAT_AND_COOL_NETWORK_ERRORS,
        )

        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        total_opex = 0.0
        total_capex = 0.0
        for asset in [
            *solution.energy_system_components.get("airco", []),
            *solution.energy_system_components.get("air_water_heat_pump", []),
            *solution.energy_system_components.get("air_water_heat_pump_elec", []),
            *solution.energy_system_components.get("low_temperature_ates", []),
        ]:
            # investment + installation costs costs
            if asset not in solution.energy_system_components["low_temperature_ates"]:
                investment_cost = (
                    solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                    .attributes["costInformation"]
                    .investmentCosts.value
                    * results[f"{asset}__max_size"]
                    / 1.0e6
                )
                total_capex += investment_cost
                assert abs(investment_cost - results[f"{asset}__investment_cost"]) < 1.0e-8
            installation_cost = (
                solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                .attributes["costInformation"]
                .installationCosts.value
            )
            total_capex += installation_cost
            assert installation_cost == results[f"{asset}__installation_cost"]

            # fixed costs per year
            fixed_operational_cost = (
                (
                    solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                    .attributes["costInformation"]
                    .fixedMaintenanceCosts.value
                    + solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                    .attributes["costInformation"]
                    .fixedOperationalCosts.value
                )
                * results[f"{asset}__max_size"]
                / 1.0e6
            )
            total_opex += fixed_operational_cost * solution.parameters(0)[f"{asset}.technical_life"]
            assert (
                abs(fixed_operational_cost - results[f"{asset}__fixed_operational_cost"]) < 1.0e-8
            )

            # variable operational cost
            timesteps_hr = np.diff(solution.times()) / 3600
            if asset not in solution.energy_system_components["low_temperature_ates"]:
                var_op_costs = (
                    solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                    .attributes["costInformation"]
                    .variableOperationalCosts.value
                    / 1.0e6
                )
                assert var_op_costs > 0
            else:
                var_op_costs = 0.0
            factor = 1.0
            if asset in [
                *solution.energy_system_components.get("air_water_heat_pump", []),
                *solution.energy_system_components.get("air_water_heat_pump_elec", []),
            ]:
                factor = solution.esdl_assets[
                    solution.esdl_asset_name_to_id_map[f"{asset}"]
                ].attributes["COP"]
            assert factor >= 1.0
            variable_operational_cost = 0.0
            for ii in range(1, len(solution.times())):
                variable_operational_cost += (
                    var_op_costs * results[f"{asset}.Heat_flow"][ii] * timesteps_hr[ii - 1] / factor
                )

            if asset in solution.energy_system_components.get("air_water_heat_pump_elec", []):
                price_profile = solution.get_timeseries(
                    f"{list(solution.get_electricity_carriers().values())[0]['name']}.price_profile"
                )
                # elec costs: not included in the __variable_operational_cost variable yet
                elect_cost = 0.0
                for ii in range(1, len(solution.times())):
                    elect_cost += (
                        price_profile.values[ii]
                        * results[f"{asset}.Heat_flow"][ii]
                        * timesteps_hr[ii - 1]
                        / solution.parameters(0)[f"{asset}.cop"]
                    )

                pump_power = 0.0
                for ii in range(1, len(solution.times())):
                    # pump power
                    pump_power += (
                        price_profile.values[ii]
                        * results[f"{asset}.Pump_power"][ii]
                        * timesteps_hr[ii - 1]
                        / solution.parameters(0)[f"{asset}.pump_efficiency"]
                    )

                variable_operational_cost += pump_power + elect_cost

            total_opex += (
                variable_operational_cost * solution.parameters(0)[f"{asset}.technical_life"]
            )
            assert (
                abs(variable_operational_cost - results[f"{asset}__variable_operational_cost"])
                < 1.0e-8
            )

        for asset in solution.energy_system_components["heat_pipe"]:
            total_capex += results[f"{asset}__investment_cost"]

        # cold demand
        investment_cost = 0.0
        for asset in solution.energy_system_components.get("cold_demand", []):
            investment_cost += (
                results[f"{asset}__max_size"]
                * solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                .attributes["costInformation"]
                .investmentCosts.value
                / 1.0e6
            )
        assert abs(investment_cost - results[f"{asset}__investment_cost"]) < 1.0e-8
        installation_cost = 0.0
        for asset in solution.energy_system_components.get("cold_demand", []):
            installation_cost += (
                solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
                .attributes["costInformation"]
                .installationCosts.value
            )
        assert abs(installation_cost - results[f"{asset}__installation_cost"]) < 1.0e-8
        total_capex += investment_cost + installation_cost

        assert (
            abs(
                solution.objective_value
                + (
                    results["CoolingDemand_1__installation_cost"]
                    + results["CoolingDemand_1__investment_cost"]
                )
                / 1.0e6
                - (total_capex + total_opex) / 1.0e6
            )
            < 1.0e-6
        )
