from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestAtes(TestCase):
    def test_ates(self):
        """
        Checks the constraints concerning the milp to discharge and energy conservation
        for the ates. The heat loss model used are tested and the typical cyclic constraint that
        will be applied in most use cases.

        Checks:
        - the heat loss is computed as expected (loss coef * stored heat [J])
        - checks that the efficiency causes less energy discharged than charged
        - cyclic storage behaviour
        - standard energy conservation, etc.

        """
        import models.test_case_small_network_with_ates.src.run_ates as run_ates
        from models.test_case_small_network_with_ates.src.run_ates import (
            HeatProblem,
        )

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a full year with 365 day timesteps
        solution = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = solution.extract_results()

        stored_heat = results["ATES_033c.Stored_heat"]
        heat_loss = results["ATES_033c.Heat_loss"]
        heat_ates = results["ATES_033c.Heat_ates"]
        summed_charge = np.sum(np.clip(heat_ates, 0.0, np.inf))
        summed_discharge = np.abs(np.sum(np.clip(heat_ates, -np.inf, 0.0)))

        # Test if the milp loss is as expected
        coeff = solution.parameters(0)["ATES_033c.heat_loss_coeff"]
        np.testing.assert_allclose(heat_loss, coeff * stored_heat)
        np.testing.assert_array_less(summed_discharge, summed_charge)

        # Test begin and end same state
        np.testing.assert_allclose(stored_heat[0], stored_heat[-1])

        # Test HeatIn and HeatIn positive negative for ATES
        # HeatIn must be exactly Q*cp*rho*T when discharging
        cp = solution.parameters(0)[f"ATES_033c.cp"]
        rho = solution.parameters(0)[f"ATES_033c.rho"]
        t_sup = solution.parameters(0)[f"ATES_033c.T_supply"]
        t_ret = solution.parameters(0)[f"ATES_033c.T_return"]
        discharging = results["ATES_033c.HeatIn.Q"] < -1e-4
        charging = results["ATES_033c.HeatIn.Q"] > 1e-4
        np.testing.assert_allclose(results["ATES_033c.HeatIn.Heat"][discharging], results[
            "ATES_033c.HeatIn.Q"][discharging] * cp * rho * t_sup)
        np.testing.assert_allclose(results["ATES_033c.HeatIn_Heat_charging"][discharging], 0.0,
                                   atol=1e-6)
        np.testing.assert_allclose(
            results["ATES_033c.HeatIn_Heat_discharging"][charging], 0.0, atol=1e-6
        )
        np.testing.assert_allclose(
            results["ATES_033c.HeatOut.Heat"][charging],
            results["ATES_033c.HeatOut.Q"][charging] * cp * rho * t_ret,
        )
        np.testing.assert_allclose(
            results["ATES_033c.HeatOut_Heat_charging"][discharging], 0.0, atol=1e-6
        )
        np.testing.assert_allclose(
            results["ATES_033c.HeatOut_Heat_discharging"][charging], 0.0, atol=1e-6
        )

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestAtes()
    a.test_ates()
    temp = 0
