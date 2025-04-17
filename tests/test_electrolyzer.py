from pathlib import Path
from unittest import TestCase

import mesido._darcy_weisbach as darcy_weisbach
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.network_common import NetworkSettings
from mesido.util import run_esdl_mesido_optimization

import numpy as np


class TestElectrolyzer(TestCase):
    def test_electrolyzer_inequality(self):
        """
        This test is to check the functioning the example with an offshore wind farm in combination
        with an electrolyzer and hydrogen storage. The electrolyzer is modelled as the option
        LINEARIZED_THREE_LINES_WEAK_INEQUALITY.

        Checks:
        - The objective value with the revenue included
        - Check the bounds on the electrolyzer
        - Check the setpoint for the windfarm
        - Check the max production profile of the windfarm
        - Check the electrolyzer inequality constraints formulation
        - The water kinematic viscosity of hydrogen by comparing head loss to a hard-coded value
        - The pipe head loss constraint for a hydrogen network
        """
        import models.unit_cases_electricity.electrolyzer.src.example as example
        from models.unit_cases_electricity.electrolyzer.src.example import MILPProblemInequality

        base_folder = Path(example.__file__).resolve().parent.parent

        class MILPProblemInequalityWithoutPresolve(MILPProblemInequality):
            def solver_options(self):
                options = super().solver_options()
                options["solver"] = "highs"
                highs_options = options["highs"] = {}
                highs_options["presolve"] = "off"

                return options

        solution = run_esdl_mesido_optimization(
            MILPProblemInequalityWithoutPresolve,
            base_folder=base_folder,
            esdl_file_name="h2.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_electrolyzer_general.csv",
        )

        results = solution.extract_results()

        # TODO: potential move this code to the head loss test case (does not contain a hydrogen
        # network optimization). For now this was not done, because it would imply adding a
        # hydrogen network solve purely for the checks below which seems unnecessary
        # Check:
        # - Compare the head loss to hard-coded values. Difference expected if an error
        # occours in the calculation of the gas kinematic viscosity.

        # - Check head loss contraint
        v_inspect = results["Pipe_6ba6.GasOut.Q"] / solution.parameters(0)["Pipe_6ba6.area"]
        head_loss_max = darcy_weisbach.head_loss(
            solution.gas_network_settings["maximum_velocity"],
            solution.parameters(0)["Pipe_6ba6.diameter"],
            solution.parameters(0)["Pipe_6ba6.length"],
            solution.energy_system_options()["wall_roughness"],
            20.0,
            network_type=NetworkSettings.NETWORK_TYPE_HYDROGEN,
            pressure=solution.parameters(0)["Pipe_6ba6.pressure"],
        )
        for iv in range(len(v_inspect)):
            np.testing.assert_allclose(
                v_inspect[iv] / solution.gas_network_settings["maximum_velocity"] * head_loss_max,
                2.1760566566624733,
            )
            np.testing.assert_allclose(-results["Pipe_6ba6.dH"][iv], 2.1760566566624733)

        gas_price_profile = "Hydrogen.price_profile"
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
        np.testing.assert_allclose(
            np.diff(results["GasStorage_e492.Stored_gas_mass"]),
            results["GasStorage_e492.Gas_tank_flow"][1:] * timestep,
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
            electrical_power_min=max(
                solution.parameters(0)["Electrolyzer_fc66.minimum_load"],
                0.01 * solution.bounds()["Electrolyzer_fc66.ElectricityIn.Power"][1],
            ),
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

        # Check electrolyzer input power
        np.testing.assert_allclose(
            results["Electrolyzer_fc66.ElectricityIn.Power"],
            [1.00000000e08, 1.00000000e08, 1.00000000e08],
        )
        # Check electrolyzer output massflow
        np.testing.assert_allclose(
            results["Electrolyzer_fc66.Gas_mass_flow_out"], [431.367058, 431.367058, 431.367058]
        )

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
        # TODO: add check on the electricity power conservation

    def test_electrolyzer_minimum_power(self):
        """
        This test is to check that the electrolyzer is switched off when input power is below
        the minimum power. The electrolyzer is modelled as the option
        LINEARIZED_THREE_LINES_WEAK_INEQUALITY.

        Checks:
        - Input power to the electrolyzer is 0 when available wind power is 49MW, as the
        threshold for the electrolyzer is 50MW
        - Output gas is 0 when available wind power is 49MW, as the threshold for the
        electrolyzer is 50MW
        - Electrolyzer is switched off when available wind power is 49MW, as the threshold for the
        electrolyzer is 50MW
        - Input power is greater than 0 when available power is greater than 50MW
        - Output gas is greater than 0 when available power is greater than 50MW
        - Electrolyzer is switched on when available power is greater than 50MW
        - Electrolyzer input power equals hardcoded values
        - Electrolyzer output massflow equals harcoded values

        """
        import models.unit_cases_electricity.electrolyzer.src.example as example
        from models.unit_cases_electricity.electrolyzer.src.example import MILPProblemInequality

        base_folder = Path(example.__file__).resolve().parent.parent

        class MILPProblemInequalityWithoutPresolve(MILPProblemInequality):
            def solver_options(self):
                options = super().solver_options()
                options["solver"] = "highs"
                highs_options = options["highs"] = {}
                highs_options["presolve"] = "off"

                return options

        solution = run_esdl_mesido_optimization(
            MILPProblemInequalityWithoutPresolve,
            base_folder=base_folder,
            esdl_file_name="h2.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_minimum_electrolyzer_power.csv",
        )

        results = solution.extract_results()

        # Check that the input power is 0
        np.testing.assert_allclose(
            results["Electrolyzer_fc66.ElectricityIn.Power"][-1],
            0.0,
            atol=5e-5,
        )
        # Check that the output gas is 0
        np.testing.assert_allclose(
            results["Electrolyzer_fc66.Gas_mass_flow_out"][-1],
            0.0,
        )
        # Check that the electrolyzer is switched off
        np.testing.assert_allclose(
            results["Electrolyzer_fc66__asset_is_switched_on"][-1],
            0,
        )
        # Check that the input power is greater than 0
        np.testing.assert_array_less(
            np.zeros(2),
            results["Electrolyzer_fc66.ElectricityIn.Power"][:-1],
        )
        # Check that the output gas is 0
        np.testing.assert_array_less(
            np.zeros(2),
            results["Electrolyzer_fc66.Gas_mass_flow_out"][:-1],
        )
        # Check that the electrolyzer is switched off
        np.testing.assert_allclose(
            results["Electrolyzer_fc66__asset_is_switched_on"][:-1],
            np.ones(2),
        )
        # Check electrolyzer input power
        # np.testing.assert_allclose(
        #     results["Electrolyzer_fc66.ElectricityIn.Power"],
        #     [ 1.00000000e+08,  1.00000000e+08, -3.59365315e-05],
        #     atol=1e-4,
        # )
        # Check electrolyzer output massflow
        # np.testing.assert_allclose(
        #     results["Electrolyzer_fc66.Gas_mass_flow_out"],
        #     [431.367058, 431.367058,   0.      ],
        #     atol=1e-4,
        # )

    def test_electrolyzer_constant_efficiency(self):
        """
        This test is to check the functioning the example with an offshore wind farm in combination
        with an electrolyzer and hydrogen storage. The electrolyzer is modelled as the option
        CONSTANT_EFFICIENCY.

        Checks:
        - Check the constant efficiency formulation of the electrolyzer
        - Check hardcoded values for input power and output massflow os the electrolyzer

        """
        import models.unit_cases_electricity.electrolyzer.src.example as example
        from models.unit_cases_electricity.electrolyzer.src.example import (
            MILPProblemConstantEfficiency,
        )

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            MILPProblemConstantEfficiency,
            base_folder=base_folder,
            esdl_file_name="h2.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_electrolyzer_general.csv",
        )

        results = solution.extract_results()

        # Electrolyser
        efficiency = solution.parameters(0)["Electrolyzer_fc66.efficiency"]
        np.testing.assert_allclose(
            results["Electrolyzer_fc66.Gas_mass_flow_out"] * efficiency * 3600,
            results["Electrolyzer_fc66.ElectricityIn.Power"],
        )

        # Check input power values. Not really needed since the massflow check is equivalent
        # np.testing.assert_allclose(
        #     results["Electrolyzer_fc66.ElectricityIn.Power"],
        #     [1.00000000e+08, 1.00000000e+08, 1.00000000e+08],
        #     atol=1e-4,
        # )
        # Check output massflow values
        np.testing.assert_allclose(
            results["Electrolyzer_fc66.Gas_mass_flow_out"],
            [440.91710758, 440.91710758, 440.91710758],
            atol=1e-4,
        )

    def test_electrolyzer_equality_constraint(self):
        """
        This test is to check the functioning the example with an offshore wind farm in combination
        with an electrolyzer and hydrogen storage. The electrolyzer is modelled as the option
        LINEARIZED_THREE_LINES_EQUALITY.

        Checks:
        - Check that only one line is activated
        - Check that the expected lines are activated, depending on the input power
        - Check that the output massflow lies on the line segment
        - Check hardcoded values

        """
        import models.unit_cases_electricity.electrolyzer.src.example as example
        from models.unit_cases_electricity.electrolyzer.src.example import (
            MILPProblemEquality,
        )

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            MILPProblemEquality,
            base_folder=base_folder,
            esdl_file_name="h2.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_equality_constraints.csv",
        )

        results = solution.extract_results()

        # Check that there is only one activated line per timestep
        for timestep in range(len(results["Electrolyzer_fc66__line_0_active"])):
            np.testing.assert_allclose(
                (
                    results["Electrolyzer_fc66__line_0_active"][timestep]
                    + results["Electrolyzer_fc66__line_1_active"][timestep]
                    + results["Electrolyzer_fc66__line_2_active"][timestep]
                    + (1 - results["Electrolyzer_fc66__asset_is_switched_on"][timestep])
                ),
                1.0,
            )
        # Check that for the first, second and third timesteps, only the lines
        # 0, 1 and 2 are activated (respectively), being the wind power 100, 300
        # and 400 MW.
        for idx in range(3):
            np.testing.assert_allclose(
                (
                    results[f"Electrolyzer_fc66__line_{idx}_active"][idx]
                    + (1 - results["Electrolyzer_fc66__asset_is_switched_on"][idx])
                ),
                1.0,
            )
        # Check that the output massflow lies on the line segment
        coef_a = solution.parameters(0)["Electrolyzer_fc66.a_eff_coefficient"]
        coef_b = solution.parameters(0)["Electrolyzer_fc66.b_eff_coefficient"]
        coef_c = solution.parameters(0)["Electrolyzer_fc66.c_eff_coefficient"]
        a, b = solution._get_linear_coef_electrolyzer_mass_vs_epower_fit(
            coef_a,
            coef_b,
            coef_c,
            n_lines=3,
            electrical_power_min=max(
                solution.parameters(0)["Electrolyzer_fc66.minimum_load"],
                0.01 * solution.bounds()["Electrolyzer_fc66.ElectricityIn.Power"][1],
            ),
            electrical_power_max=solution.bounds()["Electrolyzer_fc66.ElectricityIn.Power"][1],
        )
        for idx in range(3):
            np.testing.assert_allclose(
                results["Electrolyzer_fc66.Gas_mass_flow_out"][idx],
                results["Electrolyzer_fc66.ElectricityIn.Power"][idx] * a[idx] + b[idx],
            )
        # Check hardcoded values
        np.testing.assert_allclose(
            results["Electrolyzer_fc66.Gas_mass_flow_out"],
            [431.367058, 1285.95625642, 1673.61498453],
            atol=1e-4,
        )

    def test_electrolyzer_equality_constraint_inactive_line(self):
        """
        This test is to check the functioning the example with an offshore wind farm in combination
        with an electrolyzer and hydrogen storage. The electrolyzer is modelled as the option
        LINEARIZED_THREE_LINES_EQUALITY.

        Checks:
        - Check that no line is active when the electrolyzer is switched off
        - Check that the input power is 0 when the electrolyzer is switched off
        - Check that the output massflow is 0 when the electrolyzer is switched off

        """
        import models.unit_cases_electricity.electrolyzer.src.example as example
        from models.unit_cases_electricity.electrolyzer.src.example import (
            MILPProblemEquality,
        )

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            MILPProblemEquality,
            base_folder=base_folder,
            esdl_file_name="h2.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_minimum_electrolyzer_power.csv",
        )

        results = solution.extract_results()

        # Input power to the electrolyzer is below the minimum one,
        # such that no line should be active
        np.testing.assert_allclose(
            (
                results["Electrolyzer_fc66__line_0_active"][-1]
                + results["Electrolyzer_fc66__line_1_active"][-1]
                + results["Electrolyzer_fc66__line_2_active"][-1]
                + (1 - results["Electrolyzer_fc66__asset_is_switched_on"][-1])
            ),
            1.0,
        )
        # Check that the input power is 0
        np.testing.assert_allclose(
            results["Electrolyzer_fc66.ElectricityIn.Power"][-1],
            0.0,
            atol=1e-4,
        )
        # Check that the output gas is 0
        np.testing.assert_allclose(
            results["Electrolyzer_fc66.Gas_mass_flow_out"][-1],
            0.0,
            atol=1e-4,
        )


if __name__ == "__main__":

    a = TestElectrolyzer()
    a.test_electrolyzer_inequality()
    a.test_electrolyzer_minimum_power()
    a.test_electrolyzer_constant_efficiency()
    a.test_electrolyzer_equality_constraint()
    a.test_electrolyzer_equality_constraint_inactive_line()
