from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestHEX(TestCase):
    def test_heat_exchanger(self):
        """
        Check the modelling of the heat exchanger component which allows two hydraulically
        decoupled networks to exchange heat with each other. It is enforced that heat can only flow
        from the primary side to the secondary side, and heat exchangers are allowed to be disabled
        for timesteps in which they are not used. This is to allow for the temperature constraints
        (T_primary > T_secondary) to become deactivated.

        Checks:
        - Standard checks for demand matching, heat to discharge and energy conservation
        - That the efficiency is correclty implemented for heat from primary to secondary
        - Check that the is_disabled is set correctly.
        - Check if the temperatures provided are physically feasible.

        """
        import models.heat_exchange.src.run_heat_exchanger as run_heat_exchanger
        from models.heat_exchange.src.run_heat_exchanger import (
            HeatProblem,
        )

        base_folder = Path(run_heat_exchanger.__file__).resolve().parent.parent
        # -----------------------------------------------------------------------------------------
        # Do not delete: this is used to manualy check writing out of profile data

        class HeatProblemPost(HeatProblem):
            # def post(self):
            #     super().post()
            #     self._write_updated_esdl(
            #         self._ESDLMixin__energy_system_handler.energy_system,
            #         optimizer_sim=True,
            #     )

            def energy_system_options(self):
                options = super().energy_system_options()
                # self.heat_network_settings["minimize_head_losses"] = True  # used for manual tests
                return options

        # Do not delete kwargs: this is used to manualy check writing out of profile data
        kwargs = {
            "write_result_db_profiles": False,
            "influxdb_host": "localhost",
            "influxdb_port": 8086,
            "influxdb_username": None,
            "influxdb_password": None,
            "influxdb_ssl": False,
            "influxdb_verify_ssl": False,
        }
        # -----------------------------------------------------------------------------------------

        solution = run_esdl_mesido_optimization(
            HeatProblemPost,
            base_folder=base_folder,
            esdl_file_name="heat_exchanger.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
            **kwargs,
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        prim_heat = results["HeatExchange_39ed.Primary_heat"]
        sec_heat = results["HeatExchange_39ed.Secondary_heat"]
        disabled = results["HeatExchange_39ed__disabled"]

        # We check the energy converted betweeen the commodities
        eff = parameters["HeatExchange_39ed.efficiency"]

        demand_matching_test(solution, results)
        heat_to_discharge_test(solution, results)
        energy_conservation_test(solution, results)

        np.testing.assert_allclose(prim_heat * eff, sec_heat)

        # Note that we are not testing the last element as we exploit the last timestep for
        # checking the disabled boolean and the assert statement doesn't work for a difference of
        # zero
        np.testing.assert_allclose(prim_heat[-1], 0.0, atol=1e-5)
        np.testing.assert_allclose(disabled[-1], 1.0)
        np.testing.assert_allclose(disabled[:-1], 0.0)
        # Check that heat is flowing through the hex
        np.testing.assert_array_less(-prim_heat[:-1], 0.0)

        np.testing.assert_array_less(
            parameters["HeatExchange_39ed.Secondary.T_supply"],
            parameters["HeatExchange_39ed.Primary.T_supply"],
        )
        np.testing.assert_array_less(
            parameters["HeatExchange_39ed.Secondary.T_return"],
            parameters["HeatExchange_39ed.Primary.T_return"],
        )

    def test_heat_exchanger_bypass(self):
        """
        Check the modelling of the heat exchanger component which allows two hydraulically
        decoupled networks to exchange heat with each other. It is enforced that heat can only flow
        from the primary side to the secondary side, and heat exchangers are allowed to be disabled
        for timesteps in which they are not used. This is to allow for the temperature constraints
        (T_primary > T_secondary) to become deactivated.
        An option to allow for bypassing of the heat exchanger has been added, such that when the
        heat exchanger is disabled, flow through the heat exchanger is allowed, however no heat
        exchange is allowed, in the case the carriers of both the supply and return on one side
        of the heat exchanger are the same.

        Checks:
        - Standard checks for demand matching and energy conservation.
        - Heat to discharge test is not applied as at one heat exchanger (the bypassed one), the
        heat going out on the primary side will not coincide exactly with the temperature due to
        heatlosses in the network before the heat exchanger.
        - Check that the is_disabled is set correctly.
        - Check if the temperatures provided are physically feasible.
        - Checks that heat exchanger is bypassed, e.g. not exchanging heat, but allowing flow when
        both supply and return on one side have the same temperature.
        """
        import models.heat_exchange.src.run_heat_exchanger as run_heat_exchanger
        from models.heat_exchange.src.run_heat_exchanger import (
            HeatProblem,
        )

        base_folder = Path(run_heat_exchanger.__file__).resolve().parent.parent

        class HeatProblemByPass(HeatProblem):

            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)

                self.heat_network_settings["heat_exchanger_bypass"] = True

            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = False

                return options

        solution = run_esdl_mesido_optimization(
            HeatProblemByPass,
            base_folder=base_folder,
            esdl_file_name="test_hex_bypass.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )

        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)

        hex_active = "HeatExchange_e410_copy"
        hex_bypass = "HeatExchange_e410"

        np.testing.assert_allclose(results[f"{hex_active}__disabled"][:-1], 0)
        np.testing.assert_allclose(results[f"{hex_bypass}__disabled"][:-1], 1)

        np.testing.assert_array_less(0.001, results[f"{hex_active}.Primary.Q"][:-1])
        np.testing.assert_array_less(0.001, results[f"{hex_bypass}.Primary.Q"][:-1])

        np.testing.assert_allclose(results[f"{hex_bypass}.Heat_flow"][:-1], 0, atol=1e-9)
        np.testing.assert_array_less(1e5, results[f"{hex_active}.Heat_flow"][:-1])

    def test_heat_exchanger_bypass_varying_temperature(self):
        """
        Check the modelling of the heat exchanger component which allows two hydraulically
        decoupled networks to exchange heat with each other. It is enforced that heat can only flow
        from the primary side to the secondary side, and heat exchangers are allowed to be disabled
        for timesteps in which they are not used. This is to allow for the temperature constraints
        (T_primary > T_secondary) to become deactivated.
        An option to allow for bypassing of the heat exchanger has been added, such that when the
        heat exchanger is disabled, flow through the heat exchanger is allowed, however no heat
        exchange is allowed, in the case the carriers of both the supply and return on one side
        of the heat exchanger are the same.

        Checks:
        - Standard checks for demand matching and energy conservation.
        - Heat to discharge test is not applied as at one heat exchanger (the bypassed one), the
        heat going out on the primary side will not coincide exactly with the temperature due to
        heatlosses in the network before the heat exchanger.
        - Check that the is_disabled is set correctly.
        - Check if the temperatures provided are physically feasible.
        - Checks that heat exchanger is bypassed, e.g. not exchanging heat, but allowing flow when
        both supply and return on one side have the same temperature.
        - Check that temperatures are selected correctly at the heat exchanger
        """

        import models.heat_exchange.src.run_heat_exchanger as run_heat_exchanger
        from models.heat_exchange.src.run_heat_exchanger import (
            HeatProblem,
        )

        base_folder = Path(run_heat_exchanger.__file__).resolve().parent.parent

        class HeatProblemByPassMultiTemp(HeatProblem):

            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)

                self.heat_network_settings["heat_exchanger_bypass"] = True

            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = False

                return options

            def temperature_carriers(self):
                return self.esdl_carriers

            def temperature_regimes(self, carrier):
                temperatures = []
                if carrier == 829940433102452838:
                    temperatures = [70.0, 65.0, 60.0]  # producer out

                if carrier == 8725433194681736500139:
                    temperatures = [65.0, 60.0]  # first hex out

                return temperatures

            def constraints(self, ensemble_member):
                constraints = super().constraints(ensemble_member)

                carriers = self.temperature_carriers()
                for carrier in carriers.values():
                    carrier_map = carrier["id_number_mapping"]
                    temperature_regimes = self.temperature_regimes(int(carrier_map))
                    if len(temperature_regimes) > 1:
                        carrier_var_name = str(carrier_map) + "_temperature"
                        var_carrier = self.extra_variable(carrier_var_name)
                        for i in range(var_carrier.shape[0] - 1):
                            constraints.append((var_carrier[i] - var_carrier[i + 1], 0.0, 0.0))

                        for temperature in temperature_regimes:
                            selected_temp_vec = self.state_vector(
                                f"{int(carrier_map)}_{temperature}"
                            )
                            for i in range(var_carrier.shape[0] - 1):
                                constraints.append(
                                    (selected_temp_vec[i] - selected_temp_vec[i + 1], 0.0, 0.0)
                                )

                return constraints

            # def solver_options(self):
            #     options = super().solver_options()
            #     options["solver"] = "cplex"
            #     return options

            def times(self, variable=None) -> np.ndarray:
                """
                Shorten the timeseries to speed up the test, when highs is used as a solver.
                """
                return super().times(variable)[:5]

        solution = run_esdl_mesido_optimization(
            HeatProblemByPassMultiTemp,
            base_folder=base_folder,
            esdl_file_name="test_hex_bypass_2.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )

        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)

        temp_prod = results["829940433102452838_temperature"]
        temp_hex = results["8725433194681736500139_temperature"]

        # check heat exchanger 1 is bypassed
        hex_active = "HeatExchange_e410_copy"
        hex_bypass = "HeatExchange_e410"

        np.testing.assert_allclose(results[f"{hex_active}__disabled"][:-1], 0)
        np.testing.assert_allclose(results[f"{hex_bypass}__disabled"][:-1], 1)

        np.testing.assert_array_less(0.001, results[f"{hex_active}.Primary.Q"][:-1])
        np.testing.assert_array_less(0.001, results[f"{hex_bypass}.Primary.Q"][:-1])

        np.testing.assert_allclose(results[f"{hex_bypass}.Heat_flow"][:-1], 0, atol=1e-6)
        np.testing.assert_array_less(1e5, results[f"{hex_active}.Heat_flow"][:-1])

        # check lowest temperatures are picked (due to minimum heatloss).
        # check temperatures on bypass side are the same.

        np.testing.assert_allclose(temp_prod, 60.0)
        np.testing.assert_allclose(temp_hex, 60.0)
        np.testing.assert_allclose(temp_hex, temp_prod)


class TestHP(TestCase):
    def test_heat_pump(self):
        """
        Check the modelling of the heat pump component which has a constant COP with no energy loss.
        In this specific problem we expect the use of the secondary source to be maximised as
        electrical heat from the HP is "free".

        Checks:
        - Standard checks for demand matching, heat to discharge and energy conservation
        - Check that the heat pump is producing according to its COP
        - Check that Secondary source use in minimized
        - Check that the upper bound value for heat producing capacity is the same as specified in
        the esdl


        """
        import models.heatpump.src.run_heat_pump as run_heat_pump
        from models.heatpump.src.run_heat_pump import (
            HeatProblem,
        )

        base_folder = Path(run_heat_pump.__file__).resolve().parent.parent

        # -----------------------------------------------------------------------------------------
        # Do not delete: this is used to manualy check writing out of profile data

        class HeatProblemPost(HeatProblem):
            # def post(self):
            #     super().post()
            #     self._write_updated_esdl(
            #         self._ESDLMixin__energy_system_handler.energy_system,
            #         optimizer_sim=True,
            #     )

            def energy_system_options(self):
                options = super().energy_system_options()
                # self.heat_network_settings["minimize_head_losses"] = True  # used for manual tests
                return options

        # Do not delete kwargs: this is used to manualy check writing out of profile data
        kwargs = {
            "write_result_db_profiles": False,
            "influxdb_host": "localhost",
            "influxdb_port": 8086,
            "influxdb_username": None,
            "influxdb_password": None,
            "influxdb_ssl": False,
            "influxdb_verify_ssl": False,
        }
        # -----------------------------------------------------------------------------------------

        solution = run_esdl_mesido_optimization(
            HeatProblemPost,
            base_folder=base_folder,
            esdl_file_name="heat_pump.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
            **kwargs,
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        prim_heat = results["GenericConversion_3d3f.Primary_heat"]
        sec_heat = results["GenericConversion_3d3f.Secondary_heat"]
        power_elec = results["GenericConversion_3d3f.Power_elec"]

        # Check that only the minimum velocity is flowing through the secondary source.
        cross_sectional_area = parameters["Pipe3.area"]
        np.testing.assert_allclose(
            results["ResidualHeatSource_aec9.Q"] / cross_sectional_area,
            1.0e-3,
            atol=2.5e-5,
        )

        demand_matching_test(solution, results)
        heat_to_discharge_test(solution, results)
        energy_conservation_test(solution, results)

        # We check the energy converted betweeen the commodities
        np.testing.assert_allclose(power_elec * parameters["GenericConversion_3d3f.COP"], sec_heat)
        np.testing.assert_allclose(power_elec + prim_heat, sec_heat)

        # Check that the heat pump upper bound
        for key in solution.esdl_assets.keys():
            if solution.esdl_assets[key].asset_type == "HeatPump":
                np.testing.assert_equal(
                    solution.bounds()["GenericConversion_3d3f.Heat_flow"][1],
                    solution.esdl_assets[key].attributes["power"],
                )


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestHEX()
    a.test_heat_exchanger()

    b = TestHP()
    b.test_heat_pump()
