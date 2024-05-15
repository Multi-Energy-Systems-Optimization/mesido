from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np


# from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestElectrolyzer(TestCase):
    def test_electrolyzer(self):
        """
        This test is to check the functioning the example with an offshore wind farm in combination
        with an electrolyzer and hydrogen storage.

        Checks:
        - The objective value with the revenue included
        - Check the bounds on the electrolyzer
        - Check the setpoint for the windfarm
        - Check the max production profile of the windfarm
        - Check the electrolyzer inequality constraints formulation

        """
        import models.unit_cases_electricity.electrolyzer.src.example as example
        from models.unit_cases_electricity.electrolyzer.src.example import MILPProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        class MILPProblemSolve(MILPProblem):
            def energy_system_options(self):
                options = super().energy_system_options()
                self.gas_network_settings["pipe_maximum_pressure"] = 100.0  # [bar]
                self.gas_network_settings["pipe_minimum_pressure"] = 0.0
                return options

        solution = run_esdl_mesido_optimization(
            MILPProblem,
            base_folder=base_folder,
            esdl_file_name="h2.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        results = solution.extract_results()

        gas_price_profile = "gas.price_profile"
        state = "GasDemand_0cf3.Gas_demand_mass_flow"
        nominal = solution.variable_nominal(state) * np.median(
            solution.get_timeseries(gas_price_profile).values
        )
        gas_revenue = (
            np.sum(
                solution.get_timeseries(gas_price_profile).values
                * results["GasDemand_0cf3.Gas_demand_mass_flow"]
            )
            / nominal
        )

        elec_price_profile = "elec.price_profile"
        state = "ElectricityDemand_9d15.ElectricityIn.Power"
        nominal = solution.variable_nominal(state) * np.median(
            solution.get_timeseries(elec_price_profile).values
        )
        electricity_revenue = (
            np.sum(
                solution.get_timeseries(elec_price_profile).values
                * results["ElectricityDemand_9d15.ElectricityIn.Power"]
            )
            / nominal
        )
        # Check that goal is larger than the revenues as costs are taken into account
        np.testing.assert_array_less(
            -(gas_revenue + electricity_revenue),
            solution.objective_value,
        )
        tol = 1.0e-6
        # Check that the electrolyzer only consumes electricity and does not produce.
        np.testing.assert_array_less(-results["Electrolyzer_fc66.ElectricityIn.Power"], tol)

        # Check that windfarm does not produce more than the specified maximum profile
        ub = solution.get_timeseries("WindPark_7f14.maximum_electricity_source").values
        np.testing.assert_array_less(results["WindPark_7f14.ElectricityOut.Power"], ub + tol)

        # Check that the wind farm setpoint matches with the production
        np.testing.assert_allclose(
            results["WindPark_7f14.ElectricityOut.Power"], ub * results["WindPark_7f14__set_point"]
        )

        # Checks on the storage
        timestep = 3600.0
        rho = solution.parameters(0)["GasStorage_e492.density_max_storage"]
        np.testing.assert_allclose(
            np.diff(results["GasStorage_e492.Stored_gas_mass"]),
            results["GasStorage_e492.Gas_tank_flow"][1:] * rho * timestep,
            rtol=1e-6,
            atol=1e-8,
        )
        np.testing.assert_allclose(results["GasStorage_e492.Stored_gas_mass"][0], 0.0)
        np.testing.assert_allclose(results["GasStorage_e492.Gas_tank_flow"][0], 0.0)

        for cable in solution.energy_system_components.get("electricity_cable", []):
            ub = solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{cable}"]].attributes[
                "capacity"
            ]
            np.testing.assert_array_less(results[f"{cable}.ElectricityOut.Power"], ub + tol)
            lb = (
                solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{cable}"]]
                .in_ports[0]
                .carrier.voltage
            )
            tol = 1.0e-2
            np.testing.assert_array_less(lb - tol, results[f"{cable}.ElectricityOut.V"])
            np.testing.assert_array_less(
                results[f"{cable}.ElectricityOut.Power"],
                results[f"{cable}.ElectricityOut.V"] * results[f"{cable}.ElectricityOut.I"] + tol,
            )

        # Electrolyser
        coef_a = solution.parameters(0)["Electrolyzer_fc66.a_eff_coefficient"]
        coef_b = solution.parameters(0)["Electrolyzer_fc66.b_eff_coefficient"]
        coef_c = solution.parameters(0)["Electrolyzer_fc66.c_eff_coefficient"]
        a, b = solution._get_linear_coef_electrolyzer_mass_vs_epower_fit(
            coef_a,
            coef_b,
            coef_c,
            n_lines=3,
            electrical_power_min=0.0,
            electrical_power_max=solution.bounds()["Electrolyzer_fc66.ElectricityIn.Power"][1],
        )
        # TODO: Add test below once the mass flow is coupled to the volumetric flow rate. Currently
        #  the gas network is non-limiting (mass flow not coupled to volumetric flow rate)
        #  np.testing.assert_allclose(results["Electrolyzer_fc66.Gas_mass_flow_out"],
        #                            results["Electrolyzer_fc66.GasOut.Q"] *
        #                            milp_problem.parameters(0)["Electrolyzer_fc66.density"])
        for i in range(len(a)):
            np.testing.assert_array_less(
                results["Electrolyzer_fc66.Gas_mass_flow_out"],
                results["Electrolyzer_fc66.ElectricityIn.Power"] * a[i] + b[i] + 1.0e-3,
            )

        # print(results["Electrolyzer_fc66.ElectricityIn.Power"])
        # print(results["Electrolyzer_fc66.Gas_mass_flow_out"])

        #  -----------------------------------------------------------------------------------------
        # Do cost checks

        # Check variable opex: transport cost 0.1 euro/kg H2
        gas_tranport_cost = sum(
            (
                solution.get_timeseries(elec_price_profile).times[1:]
                - solution.get_timeseries(elec_price_profile).times[0:-1]
            )
            / 3600.0
            * results["Pipe_6ba6.GasOut.mass_flow"][1:]
            * 0.1,
        )
        np.testing.assert_allclose(
            gas_tranport_cost,
            results["GasDemand_0cf3__variable_operational_cost"],
        )

        # Check storage cost fix opex 10 euro/kgH2/year -> 10*23.715 = 237.15euro/m3
        # Storage reserved size = 500m3
        storage_fixed_opex = 237.15 * 500000.0
        np.testing.assert_allclose(
            storage_fixed_opex,
            sum(results["GasStorage_e492__fixed_operational_cost"]),
        )

        # Check electrolyzer fixed opex, based on installed size of 500MW and 10euro/kW
        electrolyzer_fixed_opex = 1.0 * 500.0e6 / 1.0e3
        np.testing.assert_allclose(
            electrolyzer_fixed_opex,
            sum(results["Electrolyzer_fc66__fixed_operational_cost"]),
        )

        # Check electrolyzer investment cost, based on installed size of 500MW and 20euro/kW
        electrolyzer_investment_cost = 20.0 * 500.0e6 / 1.0e3
        np.testing.assert_allclose(
            electrolyzer_investment_cost,
            sum(results["Electrolyzer_fc66__investment_cost"]),
        )
        #  -----------------------------------------------------------------------------------------


if __name__ == "__main__":
    import time

    start_time = time.time()
    test = TestElectrolyzer()
    sol = test.test_electrolyzer()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
