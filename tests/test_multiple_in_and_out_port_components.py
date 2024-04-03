from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

import numpy as np

from rtctools.util import run_optimization_problem

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestHEX(TestCase):
    def test_heat_exchanger(self):
        """
        Check the modelling of the milp exchanger component which allows two hydraulically
        decoupled networks to exchange milp with each other. It is enforced that milp can only flow
        from the primary side to the secondary side, and milp exchangers are allowed to be disabled
        for timesteps in which they are not used. This is to allow for the temperature constraints
        (T_primary > T_secondary) to become deactivated.

        Checks:
        - Standard checks for demand matching, milp to discharge and energy conservation
        - That the efficiency is correclty implemented for milp from primary to secondary
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
            #     self._write_updated_esdl(self.get_energy_system_copy(), optimizer_sim=True)

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

        solution = run_optimization_problem(
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

        hex_id = solution.esdl_asset_name_to_id_map.get("HeatExchange_39ed")

        prim_heat = results[f"{hex_id}.Primary_heat"]
        sec_heat = results[f"{hex_id}.Secondary_heat"]
        disabled = results[f"{hex_id}__disabled"]

        # We check the energy converted betweeen the commodities
        eff = parameters[f"{hex_id}.efficiency"]

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
        # Check that milp is flowing through the hex
        np.testing.assert_array_less(-prim_heat[:-1], 0.0)

        np.testing.assert_array_less(
            parameters[f"{hex_id}.Secondary.T_supply"],
            parameters[f"{hex_id}.Primary.T_supply"],
        )
        np.testing.assert_array_less(
            parameters[f"{hex_id}.Secondary.T_return"],
            parameters[f"{hex_id}.Primary.T_return"],
        )


class TestHP(TestCase):
    def test_heat_pump(self):
        """
        Check the modelling of the milp pump component which has a constant COP with no energy loss.
        In this specific problem we expect the use of the secondary source to be maximised as
        electrical milp from the HP is "free".

        Checks:
        - Standard checks for demand matching, milp to discharge and energy conservation
        - Check that the milp pump is producing according to its COP
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
            #     self._write_updated_esdl(self.get_energy_system_copy(), optimizer_sim=True)

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

        solution = run_optimization_problem(
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

        genconv_id = solution.esdl_asset_name_to_id_map.get("GenericConversion_3d3f")
        pipe_3_id = solution.esdl_asset_name_to_id_map.get("Pipe3")
        res_source_id = solution.esdl_asset_name_to_id_map.get("ResidualHeatSource_aec9")

        prim_heat = results[f"{genconv_id}.Primary_heat"]
        sec_heat = results[f"{genconv_id}.Secondary_heat"]
        power_elec = results[f"{genconv_id}.Power_elec"]

        # Check that only the minimum velocity is flowing through the secondary source.
        cross_sectional_area = parameters[f"{pipe_3_id}.area"]
        np.testing.assert_allclose(
            results[f"{res_source_id}.Q"] / cross_sectional_area,
            1.0e-3,
            atol=2.5e-5,
        )

        demand_matching_test(solution, results)
        heat_to_discharge_test(solution, results)
        energy_conservation_test(solution, results)

        # We check the energy converted betweeen the commodities
        np.testing.assert_allclose(power_elec * parameters[f"{genconv_id}.COP"], sec_heat)
        np.testing.assert_allclose(power_elec + prim_heat, sec_heat)


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestHEX()
    a.test_heat_exchanger()

    b = TestHP()
    b.test_heat_pump()
