from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, electric_power_conservation_test, feasibility_test


class TestMILPElectricSourceSink(TestCase):
    def test_source_sink(self):
        """
        Tests for an electricity network that consist out of a source, a sink and storage,
        connected with electricity cables.

        Checks:
        - Check that the efficiency for charging and discharging is used proper to determine the
        consumed and stored power
        - Check that the battery is used to match demand
        - Check that charging and discharging properly connected to the network (direction)
        - Check that the is_charging variable is set correctly


        """

        import models.unit_cases_electricity.battery.src.example as example
        from models.unit_cases_electricity.battery.src.example import ElectricityProblem

        base_folder = Path(example.__file__).resolve().parent.parent
        tol = 1e-10

        solution = run_esdl_mesido_optimization(
            ElectricityProblem,
            base_folder=base_folder,
            esdl_file_name="source_sink_storage.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = solution.extract_results()
        parameters = solution.parameters(0)

        feasibility_test(solution)

        demand_matching_test(solution, results)
        electric_power_conservation_test(solution, results)

        storage_name = solution.energy_system_components.get("electricity_storage")[0]
        charge_eff = parameters[f"{storage_name}.charge_efficiency"]
        discharge_eff = parameters[f"{storage_name}.discharge_efficiency"]
        is_charging = results[f"{storage_name}__is_charging"]
        eff_power_change_bat = results[f"{storage_name}.Effective_power_charging"]
        eff_power_change_discharge_bat = results[f"{storage_name}__effective_power_discharging"]
        power_bat_network = results[f"{storage_name}.ElectricityIn.Power"]
        stored_el = results[f"{storage_name}.Stored_electricity"]

        power_cable_bat = results["ElectricityCable_91c1.ElectricityOut.Power"]
        np.testing.assert_allclose(power_cable_bat, power_bat_network, atol=tol)

        # if battery is charging (1), ElectricityIn.Power and effective_power charging should be
        # positive, else negative
        bigger_then = all(is_charging * eff_power_change_bat >= 0)
        smaller_then = all((1 - is_charging) * eff_power_change_bat <= 0)
        self.assertTrue(bigger_then)
        self.assertTrue(smaller_then)

        bigger_then = all(is_charging * power_bat_network >= 0)
        smaller_then = all((1 - is_charging) * power_bat_network <= 0)
        self.assertTrue(bigger_then)
        self.assertTrue(smaller_then)

        # battery should be charging at atleast one timestep to overcome the difference between max
        # production and demand
        self.assertTrue(sum(is_charging) >= 1)

        # stored electricity starts at 0
        np.testing.assert_allclose(
            stored_el[0],
            0.0,
            err_msg="The battery should be empty at the start to check if it operates and "
            "predicted",
        )

        # stored electricity change should be equal to the effective power change
        stored_change = stored_el[1:] - stored_el[:-1]
        np.testing.assert_allclose(eff_power_change_bat[1:] * 3600, stored_change, atol=tol)

        # effective power change while charging should be equal to efficiency * powerIn
        np.testing.assert_allclose(
            eff_power_change_bat * is_charging,
            power_bat_network * is_charging * charge_eff,
            atol=tol,
        )
        # effective power change while discharging should be equal to powerOut/efficiency
        np.testing.assert_allclose(
            eff_power_change_bat * (1 - is_charging),
            power_bat_network * (1 - is_charging) / discharge_eff,
            atol=tol,
        )

        # effective power discharge variable should always be the bigger or equal to the negative
        # of the charge variable and bigger then zero. The zero should only occur if battery is
        # charging. When a goal would be set to minimise discharge it should match the charge power,
        # however now this goal is not turned on.
        # TODO: when the new goal is included create test, this will end up in the mc_simulator
        np.testing.assert_array_less(-eff_power_change_bat, eff_power_change_discharge_bat + tol)
        self.assertTrue(all(eff_power_change_discharge_bat >= 0.0))
