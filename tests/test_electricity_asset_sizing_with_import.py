"""Price-driven producer, battery, and grid-import sizing regression.

The paired ESDL systems use the same common electricity bus and either fixed-capacity cables or
only direct logical links. Imports are inexpensive at the first three hourly samples and expensive
at the last two. The selected 400 W battery charges from low-priced imports and reduces the
high-priced import requirement; local generation supplies the remaining high-price demand. The
carrier price and nonzero EUR/MWh import coefficient are independently integrated against import
power and timestep duration. Battery throughput costs are unsupported and deliberately zero.
"""

from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import (
    cost_calculation_test,
    demand_matching_test,
    electric_power_conservation_test,
    feasibility_test,
)


class TestElectricityAssetSizingWithImport(TestCase):
    @classmethod
    def setUpClass(cls):
        import models.unit_cases_electricity.asset_sizing.src.example as example
        from models.unit_cases_electricity.asset_sizing.src.example import (
            ElectricityAssetSizingPriceProblem,
        )

        cls.base_folder = Path(example.__file__).resolve().parent.parent
        cls.solutions = {
            topology: run_esdl_mesido_optimization(
                ElectricityAssetSizingPriceProblem,
                base_folder=cls.base_folder,
                esdl_file_name=f"asset_sizing_import_{topology}.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries_with_e_price.csv",
            )
            for topology in ("cables", "logical_links")
        }

    def _assert_import_sizing(self, solution, expected_cables):
        results = solution.extract_results()
        names = solution.esdl_asset_name_to_id_map
        selected_source = names["SelectedProducer"]
        rejected_source = names["RejectedProducer"]
        selected_battery = names["SelectedBattery"]
        rejected_battery = names["RejectedBattery"]
        electricity_import = names["ElectricityImport"]

        feasibility_test(solution)
        demand_matching_test(solution, results)
        electric_power_conservation_test(solution, results)
        self.assertFalse(solution.energy_system_options()["include_electric_cable_power_loss"])
        cables = solution.energy_system_components.get("electricity_cable", [])
        self.assertEqual(bool(cables), expected_cables)
        self.assertEqual(len(cables), 6 if expected_cables else 0)
        for cable in cables:
            np.testing.assert_allclose(results[f"{cable}.Power_loss"], 0.0, atol=1e-8)

        expected_prices = np.array([1.0e-5, 1.0e-5, 1.0e-5, 1.0e-2, 1.0e-2])
        price_profile = solution.get_timeseries("Electricity.price_profile")
        np.testing.assert_allclose(price_profile.values, expected_prices, rtol=1e-9, atol=1e-12)
        np.testing.assert_allclose(price_profile.times, solution.times(), atol=0.0)

        import_power = results[f"{electricity_import}.Electricity_source"]
        np.testing.assert_allclose(
            results[f"{electricity_import}_aggregation_count"], 1.0, atol=1e-7
        )
        self.assertGreater(np.sum(import_power[1:3]), 0.0)
        self.assertTrue(
            np.all(
                import_power <= solution.esdl_assets[electricity_import].attributes["power"] + 1e-7
            )
        )
        import_coefficient = solution.parameters(0)[
            f"{electricity_import}.variable_operational_cost_coefficient"
        ]
        self.assertGreater(import_coefficient, 0.0)
        timestep_hours = np.diff(solution.times()) / 3600.0
        expected_import_cost = np.sum(
            import_power[1:] * (expected_prices[1:] + import_coefficient) * timestep_hours
        )
        np.testing.assert_allclose(
            results[f"{electricity_import}__variable_operational_cost"],
            expected_import_cost,
            rtol=1e-7,
            atol=1e-8,
        )

        selected_source_power = results[f"{selected_source}.Electricity_source"]
        selected_source_size = results[f"{selected_source}__max_size"]
        self.assertGreater(np.max(selected_source_power), 0.0)
        self.assertLess(
            selected_source_size, solution.esdl_assets[selected_source].attributes["power"]
        )
        self.assertGreater(selected_source_size, 0.0)
        np.testing.assert_allclose(selected_source_size, 500.0, atol=1e-5)
        np.testing.assert_allclose(selected_source_size, np.max(selected_source_power), atol=1e-5)
        np.testing.assert_allclose(results[f"{selected_source}_aggregation_count"], 1.0, atol=1e-7)
        np.testing.assert_allclose(results[f"{rejected_source}.Electricity_source"], 0.0, atol=1e-7)
        np.testing.assert_allclose(results[f"{rejected_source}__max_size"], 0.0, atol=1e-6)
        np.testing.assert_allclose(results[f"{rejected_source}_aggregation_count"], 0.0, atol=1e-7)

        selected_energy = results[f"{selected_battery}.Stored_electricity"]
        selected_capacity = results[f"{selected_battery}__max_size"]
        selected_charge = results[f"{selected_battery}.Power_charging"]
        selected_discharge = results[f"{selected_battery}.Power_discharging"]
        self.assertGreater(selected_capacity, 0.0)
        self.assertLess(
            selected_capacity,
            solution.esdl_assets[selected_battery].attributes["capacity"],
        )
        np.testing.assert_allclose(selected_capacity, np.max(selected_energy), atol=1e-5)
        self.assertGreater(np.sum(selected_charge[1:3]), 0.0)
        self.assertGreater(np.sum(selected_discharge[3:]), 0.0)
        np.testing.assert_allclose(selected_energy[0], 0.0, atol=1e-6)
        np.testing.assert_allclose(selected_energy[-1], 0.0, atol=1e-5)
        np.testing.assert_array_less(-1e-7, selected_energy)
        self.assertTrue(np.all(selected_energy <= selected_capacity + 1e-5))
        battery_attributes = solution.esdl_assets[selected_battery].attributes
        self.assertTrue(np.all(selected_charge <= battery_attributes["maxChargeRate"] + 1e-6))
        self.assertTrue(np.all(selected_discharge <= battery_attributes["maxDischargeRate"] + 1e-6))
        expected_energy_change = (
            solution.parameters(0)[f"{selected_battery}.charge_efficiency"] * selected_charge[1:]
            - selected_discharge[1:]
            / solution.parameters(0)[f"{selected_battery}.discharge_efficiency"]
        ) * np.diff(solution.times())
        np.testing.assert_allclose(np.diff(selected_energy), expected_energy_change, atol=1e-4)
        np.testing.assert_allclose(results[f"{selected_battery}_aggregation_count"], 1.0, atol=1e-7)

        rejected_battery = names["RejectedBattery"]
        np.testing.assert_allclose(
            results[f"{rejected_battery}.Stored_electricity"], 0.0, atol=1e-6
        )
        np.testing.assert_allclose(results[f"{rejected_battery}__max_size"], 0.0, atol=1e-5)
        np.testing.assert_allclose(results[f"{rejected_battery}_aggregation_count"], 0.0, atol=1e-7)
        np.testing.assert_allclose(results[f"{rejected_battery}.Power_charging"], 0.0, atol=1e-7)
        np.testing.assert_allclose(results[f"{rejected_battery}.Power_discharging"], 0.0, atol=1e-7)

        cost_calculation_test(solution, results)
        self.assertGreater(results[f"{selected_battery}__investment_cost"], 0.0)
        self.assertGreater(results[f"{selected_battery}__fixed_operational_cost"], 0.0)
        for rejected in (rejected_source, rejected_battery):
            for cost in (
                "investment_cost",
                "installation_cost",
                "fixed_operational_cost",
                "variable_operational_cost",
            ):
                np.testing.assert_allclose(results[f"{rejected}__{cost}"], 0.0, atol=1e-7)

    def test_import_sizing_with_cables(self):
        self._assert_import_sizing(self.solutions["cables"], expected_cables=True)

    def test_import_sizing_with_logical_links(self):
        self._assert_import_sizing(self.solutions["logical_links"], expected_cables=False)

    def test_import_topology_variants_have_equal_sizing_and_asset_costs(self):
        cable_solution = self.solutions["cables"]
        logical_solution = self.solutions["logical_links"]
        cable_results = cable_solution.extract_results()
        logical_results = logical_solution.extract_results()
        for asset_name in (
            "SelectedProducer",
            "RejectedProducer",
            "SelectedBattery",
            "RejectedBattery",
            "ElectricityImport",
        ):
            cable_id = cable_solution.esdl_asset_name_to_id_map[asset_name]
            logical_id = logical_solution.esdl_asset_name_to_id_map[asset_name]
            for suffix in (
                "__max_size",
                "_aggregation_count",
                "__investment_cost",
                "__installation_cost",
                "__fixed_operational_cost",
                "__variable_operational_cost",
            ):
                np.testing.assert_allclose(
                    cable_results[f"{cable_id}{suffix}"],
                    logical_results[f"{logical_id}{suffix}"],
                    atol=1e-6,
                    rtol=1e-7,
                )
