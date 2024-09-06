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


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestHEX()
    a.test_heat_exchanger()

    b = TestHP()
    b.test_heat_pump()
