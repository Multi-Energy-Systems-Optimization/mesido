from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestMaxSizeAggregationCount(TestCase):
    def test_max_size_and_aggr_count(self):
        """
        Check the behaviour of the asset sizing, asset placement and the cost
        components associated to those variables.

        - the asset size should be at least as large as it's maximum utilization
        - the asset should be placed when it is utilized
        - the cost components should be present if the asset is placed and used.
        - For this scenario a problem is set-up with two optional sources (with their connection
        pipes) where one source can supply the network by itself. It is expected that only one
        source will be placed due to the minimization of the cost (which cost is this?, I assume
        operational cost) and installation cost. The placement behaviour is further tested in a
        second case by adding an optional ates and buffer. However, these 2 additional optional
        assets should not be placed by the optmizer because of heat losses.

        Checks:
        - Check that source 1 is utilized and also placed
        - Check that source 2 is utilized and placed
        - Check that max_size source 1 is zero
        - Check that max_size source 2 is > utilization
        - Check cost components for source 1 and 2
        - Check max size and placement of ates
        - Fixed operational cost for sources

        """
        import models.test_case_small_network_with_ates_with_buffer.src.run_ates as run_ates
        from models.test_case_small_network_with_ates_with_buffer.src.run_ates import (
            HeatProblem,
        )

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a few days
        solution = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        # Producer 1 should not produce due to higher cost
        # Producer 2 should produce
        heat_1 = results["HeatProducer_1.Heat_source"]
        heat_2 = results["HeatProducer_2.Heat_source"]
        prod_1_placed = results["HeatProducer_1_aggregation_count"]
        prod_2_placed = results["HeatProducer_2_aggregation_count"]
        var_cost_1 = results["HeatProducer_1__variable_operational_cost"]
        var_cost_2 = results["HeatProducer_2__variable_operational_cost"]
        fix_cost_1 = results["HeatProducer_1__fixed_operational_cost"]
        fix_cost_2 = results["HeatProducer_2__fixed_operational_cost"]
        inst_cost_1 = results["HeatProducer_1__installation_cost"]
        inst_cost_2 = results["HeatProducer_2__installation_cost"]
        inv_cost_1 = results["HeatProducer_1__investment_cost"]
        inv_cost_2 = results["HeatProducer_2__investment_cost"]
        max_size_1 = results["HeatProducer_1__max_size"]
        max_size_2 = results["HeatProducer_2__max_size"]

        # Test if source 1 is off and 2 is producing
        np.testing.assert_allclose(heat_1, 0.0, atol=1e-6)
        np.testing.assert_equal(True, heat_2[1:] > 0.0)

        # Test if source 1 is not placed and 2 is placed
        np.testing.assert_allclose(prod_1_placed, 0.0)
        np.testing.assert_allclose(prod_2_placed, 1.0, atol=1.0e-6)

        # Test that max size is correct, note that we use an equality check as due to the cost
        # minimization they should be equal.
        np.testing.assert_allclose(max(heat_2), max_size_2)
        np.testing.assert_allclose(max_size_1, 0.0)

        # Test that investmentcost is correctly linked to max size
        np.testing.assert_allclose(
            inv_cost_2,
            solution.parameters(0)["HeatProducer_2.investment_cost_coefficient"] * max_size_2,
        )

        # Test that cost only exist for 2 and not for 1. Note the tolerances
        # to avoid test failing when heat losses slightly change
        np.testing.assert_allclose(var_cost_1, 0.0, atol=1e-9)
        np.testing.assert_allclose(
            var_cost_2,
            np.sum(
                results["HeatProducer_2.Heat_source"][1:]
                * (solution.times()[1:] - solution.times()[:-1])
                / 3600
            )
            * parameters["HeatProducer_2.variable_operational_cost_coefficient"],
            atol=1000.0,
            rtol=1.0e-2,
        )
        np.testing.assert_allclose(fix_cost_1, 0.0, atol=1.0e-6)
        np.testing.assert_allclose(
            fix_cost_2,
            max_size_2 * parameters["HeatProducer_2.fixed_operational_cost_coefficient"],
            atol=1.0e-6,
        )
        np.testing.assert_allclose(inst_cost_1, 0.0, atol=1e-9)
        np.testing.assert_allclose(inst_cost_2, 100000.0)
        np.testing.assert_allclose(inv_cost_1, 0.0, atol=1e-9)
        np.testing.assert_allclose(
            inv_cost_2,
            max_size_2 * parameters["HeatProducer_2.investment_cost_coefficient"],
            atol=1.0,
            rtol=1.0e-2,
        )

        # Since the buffer and ates are not optional they must consume some heat to compensate
        # losses as the buffer has a minimum fraction volume of 5%.
        # Therefore, we can check the max_size constraint.
        np.testing.assert_allclose(
            True, results["HeatStorage_74c1.Stored_heat"] <= results["HeatStorage_74c1__max_size"]
        )
        np.testing.assert_allclose(
            True, abs(results["ATES_033c.Heat_ates"]) <= results["ATES_033c__max_size"]
        )
        np.testing.assert_allclose(results["ATES_033c_aggregation_count"], 1.0)
        np.testing.assert_allclose(results["HeatStorage_74c1_aggregation_count"], 1.0)

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
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = solution.extract_results()

        np.testing.assert_allclose(results["ATES_033c.Heat_ates"], 0.0, atol=1.0e-6)
        np.testing.assert_allclose(results["HeatStorage_74c1.Stored_heat"], 0.0, atol=1.0e-3)
        np.testing.assert_allclose(results["ATES_033c_aggregation_count"], 0.0, atol=1.0e-6)
        np.testing.assert_allclose(results["HeatStorage_74c1_aggregation_count"], 0.0, atol=1.0e-6)

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)
