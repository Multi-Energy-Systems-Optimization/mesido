from pathlib import Path
from unittest import TestCase

import esdl

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import (
    _get_esdl_scaled_cost,
    cost_calculation_test,
    demand_matching_test,
    electric_power_conservation_test,
    energy_conservation_test,
    feasibility_test,
    heat_to_discharge_test,
)


class TestMaxSizeAggregationCount(TestCase):
    def test_max_size_and_aggr_count(self):
        """
        Check the behaviour of the asset sizing, asset placement and the cost
        components associated to those variables.

        - the asset size should be at least as large as it's maximum utilization
        - the asset should be placed when it is utilized, even when an asset have not installation
        cost (geothermal optional source)
        - the geothermal source has the highest costs, and it specifically has no installation cost
        to test the aggregation_count constraint
        - the cost components should be present if the asset is placed and used.
        - For this scenario a problem is set-up with two optional sources (with their connection
        pipes) where one source can supply the network by itself. It is expected that only one
        source will be placed due to the minimization of the cost (which cost is this?, I assume
        operational cost) and installation cost. The placement behaviour is further tested in a
        second case by adding an optional ates and buffer. However, these 2 additional optional
        assets should not be placed by the optimizer because of heat losses.

        Checks:
        - Check that source 1 is utilized and also placed
        - Check that source 2 is utilized and placed
        - Check that the geothermal source is not placed
        - Check that max_size of source 1 and geothermal is zero
        - Check that max_size source 2 is > utilization
        - Check cost components for source 1 and 2
        - Check max size and placement of ates
        - Fixed operational cost for sources
        - Maximum and minimum temperatures of heat producer and geothermal source
          are parsed from esdl

        """
        import models.test_case_small_network_with_ates_buffer_geo.src.run_ates as run_ates
        from models.test_case_small_network_with_ates_buffer_geo.src.run_ates import (
            HeatProblem,
        )

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a few days
        solution = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates_buffer_geo.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)
        name_to_id_map = solution.esdl_asset_name_to_id_map
        producer_1_id = name_to_id_map["HeatProducer_1"]
        producer_2_id = name_to_id_map["HeatProducer_2"]
        geo_id = name_to_id_map["GeothermalSource_50cf"]
        ates_id = name_to_id_map["ATES_033c"]
        buffer_id = name_to_id_map["HeatStorage_74c1"]

        # Producer 1 and geothermal source should not produce due to higher cost
        # Producer 2 should produce
        heat_1 = results[f"{producer_1_id}.Heat_source"]
        heat_2 = results[f"{producer_2_id}.Heat_source"]
        heat_geo = results[f"{geo_id}.Heat_source"]
        prod_1_placed = results[f"{producer_1_id}_aggregation_count"]
        prod_2_placed = results[f"{producer_2_id}_aggregation_count"]
        geo_placed = results[f"{geo_id}_aggregation_count"]
        var_cost_1 = results[f"{producer_1_id}__variable_operational_cost"]
        fix_cost_1 = results[f"{producer_1_id}__fixed_operational_cost"]
        inst_cost_1 = results[f"{producer_1_id}__installation_cost"]
        inst_cost_2 = results[f"{producer_2_id}__installation_cost"]
        inv_cost_1 = results[f"{producer_1_id}__investment_cost"]
        max_size_1 = results[f"{producer_1_id}__max_size"]
        max_size_2 = results[f"{producer_2_id}__max_size"]
        max_size_geo = results[f"{geo_id}__max_size"]

        # Test if source 1 and the geothermal source is off and 2 is producing
        np.testing.assert_allclose(heat_1, 0.0, atol=1e-6)
        np.testing.assert_allclose(heat_geo, 0.0, atol=1e-6)

        np.testing.assert_equal(True, heat_2[1:] > 0.0)

        # Test if source 1 and the geothermal is not placed and 2 is placed
        np.testing.assert_allclose(prod_1_placed, 0.0)
        np.testing.assert_allclose(prod_2_placed, 1.0, atol=1.0e-6)
        # Geothermal should not be placed while only having an investment cost (high) input
        np.testing.assert_allclose(geo_placed, 0.0)
        np.testing.assert_allclose(
            solution.parameters(0)[f"{geo_id}.investment_cost_coefficient"],
            100.0,  # euro/W, value was specifcially chosen this high top prevent its usage
            atol=1.0e-6,
        )
        np.testing.assert_allclose(
            0.0, solution.parameters(0)[f"{geo_id}.installation_cost"], atol=1.0e-9
        )

        # Test that max size is correct, note that we use an equality check as due to the cost
        # minimization they should be equal.
        np.testing.assert_allclose(max(heat_2), max_size_2)
        np.testing.assert_allclose(max_size_1, 0.0)
        np.testing.assert_allclose(max_size_geo, 0.0)

        # Test that cost only exist for 2 and not for 1. Note the tolerances
        # to avoid test failing when heat losses slightly change
        np.testing.assert_allclose(var_cost_1, 0.0, atol=1e-9)
        np.testing.assert_allclose(fix_cost_1, 0.0, atol=1.0e-6)
        np.testing.assert_allclose(inst_cost_1, 0.0, atol=1e-9)
        np.testing.assert_allclose(inst_cost_2, 100000.0)
        np.testing.assert_allclose(inv_cost_1, 0.0, atol=1e-9)
        np.testing.assert_array_less(1e3, results[f"{producer_2_id}__investment_cost"])
        np.testing.assert_array_less(1e3, results[f"{producer_2_id}__variable_operational_cost"])
        np.testing.assert_array_less(1e3, results[f"{producer_2_id}__fixed_operational_cost"])
        cost_calculation_test(solution, results)

        # Since the buffer and ates are not optional they must consume some heat to compensate
        # losses as the buffer has a minimum fraction volume of 5%.
        # Therefore, we can check the max_size constraint.
        np.testing.assert_allclose(
            True, results[f"{buffer_id}.Stored_heat"] <= results[f"{buffer_id}__max_size"]
        )
        np.testing.assert_allclose(
            True, abs(results[f"{ates_id}.Heat_ates"]) <= results[f"{ates_id}__max_size"]
        )
        np.testing.assert_allclose(results[f"{ates_id}_aggregation_count"], 1.0)
        np.testing.assert_allclose(results[f"{buffer_id}_aggregation_count"], 1.0)

        # Check max, min temperature of heat producer and geothermal source are parsed from esdl
        for asset_id in [
            *solution.energy_system_components.get("heat_source", []),
        ]:
            esdl_asset = solution.esdl_assets[f"{asset_id}"]
            np.testing.assert_equal(
                esdl_asset.attributes["maxTemperature"], parameters[f"{asset_id}.max_temperature"]
            )
            np.testing.assert_equal(
                esdl_asset.attributes["minTemperature"], parameters[f"{asset_id}.min_temperature"]
            )

        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates
        from models.test_case_small_network_ates_buffer_optional_assets.src.run_ates import (
            HeatProblem,
        )

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is the same problem, but now with the buffer and ates also optional.
        # Therefore, we expect that the ates and buffer are no longer placed to avoid their heat
        # losses. This allows us to check if their placement constraints are proper.
        solution = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name=(
                "test_case_small_network_with_ates_with_buffer_all_optional_not_placed.esdl"
            ),
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = solution.extract_results()
        name_to_id_map = solution.esdl_asset_name_to_id_map

        ates_id = name_to_id_map["ATES_033c"]
        buffer_id = name_to_id_map["HeatStorage_74c1"]

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        np.testing.assert_allclose(results[f"{ates_id}.Heat_ates"], 0.0, atol=1.0e-6)
        np.testing.assert_allclose(results[f"{buffer_id}.Stored_heat"], 0.0, atol=1.0e-3)
        np.testing.assert_allclose(results[f"{ates_id}_aggregation_count"], 0.0, atol=1.0e-6)
        np.testing.assert_allclose(results[f"{buffer_id}_aggregation_count"], 0.0, atol=1.0e-6)


class TestElectricityAssetSizing(TestCase):
    """Compare optional electricity sizing through cables and direct logical links.

    Two candidate producers and two candidate batteries share a bus. A 500 W availability
    profile, against 1000 W nameplate power, requires a selected battery to meet final high demand.
    Capacity costs are positive and battery costs are specified per Wh then converted to the
    model's stored-energy unit (J). The selected producer has zero installation cost; battery
    throughput costs remain zero because MESIDO does not model battery-throughput OPEX.
    """

    @classmethod
    def setUpClass(cls):
        import models.unit_cases_electricity.asset_sizing.src.example as example
        from models.unit_cases_electricity.asset_sizing.src.example import (
            ElectricityAssetSizingProblem,
        )

        base_folder = Path(example.__file__).resolve().parent.parent
        cls.solutions = {
            topology: run_esdl_mesido_optimization(
                ElectricityAssetSizingProblem,
                base_folder=base_folder,
                esdl_file_name=f"asset_sizing_{topology}.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries.csv",
            )
            for topology in ("cables", "logical_links")
        }

    def _assert_sizing_solution(self, solution, expected_cables):
        results = solution.extract_results()
        names = solution.esdl_asset_name_to_id_map
        source = names["SelectedProducer"]
        rejected_source = names["RejectedProducer"]
        battery = names["SelectedBattery"]
        rejected_battery = names["RejectedBattery"]
        parameters = solution.parameters(0)

        feasibility_test(solution)
        demand_matching_test(solution, results)
        electric_power_conservation_test(solution, results)
        self.assertFalse(solution.energy_system_options()["include_electric_cable_power_loss"])
        cables = solution.energy_system_components.get("electricity_cable", [])
        self.assertEqual(bool(cables), expected_cables)
        self.assertEqual(len(cables), 5 if expected_cables else 0)
        for cable in cables:
            np.testing.assert_allclose(results[f"{cable}.Power_loss"], 0.0, atol=1e-8)

        source_power = results[f"{source}.Electricity_source"]
        source_size = results[f"{source}__max_size"]
        self.assertGreater(source_size, 0.0)
        self.assertLess(source_size, solution.esdl_assets[source].attributes["power"])
        self.assertTrue(np.all(source_power >= -1e-8))
        self.assertTrue(np.all(source_power <= source_size + 1e-6))
        np.testing.assert_allclose(source_size, 500.0, atol=1e-5)
        np.testing.assert_allclose(source_size, np.max(source_power), atol=1e-5)
        np.testing.assert_allclose(results[f"{source}_aggregation_count"], 1.0, atol=1e-7)
        np.testing.assert_allclose(results[f"{rejected_source}.Electricity_source"], 0.0, atol=1e-7)
        np.testing.assert_allclose(results[f"{rejected_source}__max_size"], 0.0, atol=1e-6)
        np.testing.assert_allclose(results[f"{rejected_source}_aggregation_count"], 0.0, atol=1e-7)

        stored = results[f"{battery}.Stored_electricity"]
        capacity = results[f"{battery}__max_size"]
        charge = results[f"{battery}.Power_charging"]
        discharge = results[f"{battery}.Power_discharging"]
        battery_attributes = solution.esdl_assets[battery].attributes
        self.assertGreater(capacity, 0.0)
        self.assertLess(capacity, battery_attributes["capacity"])
        self.assertGreater(np.max(charge), 0.0)
        self.assertGreater(np.max(discharge), 0.0)
        np.testing.assert_allclose(capacity, 2_592_000.0, atol=1e-4)
        np.testing.assert_allclose(capacity, np.max(stored), atol=1e-5)
        self.assertTrue(np.all(stored >= -1e-7))
        self.assertTrue(np.all(stored <= capacity + 1e-5))
        self.assertTrue(np.all(charge <= battery_attributes["maxChargeRate"] + 1e-6))
        self.assertTrue(np.all(discharge <= battery_attributes["maxDischargeRate"] + 1e-6))
        np.testing.assert_allclose(stored[0], 0.0, atol=1e-6)
        np.testing.assert_allclose(stored[-1], 0.0, atol=1e-5)
        energy_change = (
            parameters[f"{battery}.charge_efficiency"] * charge[1:]
            - discharge[1:] / parameters[f"{battery}.discharge_efficiency"]
        ) * np.diff(solution.times())
        np.testing.assert_allclose(np.diff(stored), energy_change, atol=1e-4, rtol=1e-7)
        np.testing.assert_allclose(results[f"{battery}_aggregation_count"], 1.0, atol=1e-7)

        np.testing.assert_allclose(
            results[f"{rejected_battery}.Stored_electricity"], 0.0, atol=1e-6
        )
        np.testing.assert_allclose(results[f"{rejected_battery}.Power_charging"], 0.0, atol=1e-7)
        np.testing.assert_allclose(results[f"{rejected_battery}.Power_discharging"], 0.0, atol=1e-7)
        np.testing.assert_allclose(results[f"{rejected_battery}__max_size"], 0.0, atol=1e-5)
        np.testing.assert_allclose(results[f"{rejected_battery}_aggregation_count"], 0.0, atol=1e-7)

        # Battery throughput costs are not modelled. The shared helper checks their ESDL
        # coefficient is zero and validates the selected battery's EUR/Wh -> EUR/J capacity costs.
        cost_calculation_test(solution, results, check_objective_function=True)
        self.assertGreater(results[f"{source}__investment_cost"], 0.0)
        self.assertGreater(results[f"{battery}__investment_cost"], 0.0)
        self.assertGreater(results[f"{battery}__fixed_operational_cost"], 0.0)
        np.testing.assert_allclose(results[f"{source}__installation_cost"], 0.0, atol=1e-8)
        for asset in (rejected_source, rejected_battery):
            for cost in (
                "investment_cost",
                "installation_cost",
                "fixed_operational_cost",
                "variable_operational_cost",
            ):
                np.testing.assert_allclose(results[f"{asset}__{cost}"], 0.0, atol=1e-7)

    def test_optional_electricity_assets_with_cables(self):
        """Check optional source and battery selection on fixed-capacity cables."""
        self._assert_sizing_solution(self.solutions["cables"], expected_cables=True)

    def test_optional_electricity_assets_with_logical_links(self):
        """Check the same asset decisions with all physical electricity cables removed."""
        self._assert_sizing_solution(self.solutions["logical_links"], expected_cables=False)

    def test_cable_and_logical_link_sizing_invariants_match(self):
        """Network topology must not change asset sizes, placement, or non-transport costs."""
        cable_solution = self.solutions["cables"]
        logical_solution = self.solutions["logical_links"]
        cable_results = cable_solution.extract_results()
        logical_results = logical_solution.extract_results()
        for name in (
            "SelectedProducer",
            "RejectedProducer",
            "SelectedBattery",
            "RejectedBattery",
        ):
            cable_id = cable_solution.esdl_asset_name_to_id_map[name]
            logical_id = logical_solution.esdl_asset_name_to_id_map[name]
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

    def test_cost_helper_rejects_nonzero_battery_throughput_cost(self):
        """Battery throughput OPEX is explicitly outside the supported financial formulation."""
        solution = self.solutions["cables"]
        results = solution.extract_results()
        battery_id = solution.esdl_asset_name_to_id_map["SelectedBattery"]
        variable_cost = (
            solution.esdl_assets[battery_id].attributes["costInformation"].variableOperationalCosts
        )
        previous_value = variable_cost.value
        try:
            variable_cost.value = 1.0e-3
            with self.assertRaisesRegex(
                AssertionError,
                "Nonzero battery variable operational costs are unsupported",
            ):
                cost_calculation_test(solution, results)
        finally:
            variable_cost.value = previous_value


if __name__ == "__main__":
    import time

    start_time = time.time()

    a = TestMaxSizeAggregationCount()
    a.test_max_size_and_aggr_count()
