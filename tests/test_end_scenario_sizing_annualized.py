from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

import numpy as np

from rtctools.util import run_optimization_problem


class TestEndScenarioSizingAnnualized(TestCase):
    """
    Tests for end scenario sizing with annualized costs in a small network with optional assets.

    This class tests two models for a heat network: with
    and without annualized costs. It asserts the following:
    1. Under some conditions, the objective value of the annualized model is equal to the solution
    from the non annualized one.
    2. The effect of the discount rate on the objective value.
    3. The correctness of annualized capital expenditures calculations.
    4: The calculate_annuity_factor function returns the correct valuea

    """

    def test_end_scenario_sizing_annualized(self):
        from models.test_case_small_network_optional_assets_annualized.src.run_ates import (
            HeatProblem,
        )
        from models.test_case_small_network_optional_assets_annualized.src.run_annualized import (
            HeatProblemDiscAnnualizedCost,
            HeatProblemDiscAnnualizedCostModifiedParam,
            HeatProblemDiscAnnualizedCostModifiedDiscountRate,
        )
        from models.test_case_small_network_optional_assets_annualized.src import (
            run_annualized,
        )
        from mesido.financial_mixin import calculate_annuity_factor

        base_folder = Path(run_annualized.__file__).resolve().parent.parent

        solution_run_ates = run_optimization_problem(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="annualized_test_case_discount5.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        # Solution of model with annualized cost, considering a discount rate > 0
        # and a technical life > 1
        solution_annualized_cost = run_optimization_problem(
            HeatProblemDiscAnnualizedCost,
            base_folder=base_folder,
            esdl_file_name="annualized_test_case_discount5.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        # Solution of model with annualized cost, with discount rate = 0 and
        # technical life = 1 year. This model is used to compare the objective value
        # of the annualized model with the objective value of the non-discounted model.
        solution__annualized_modified_param = run_optimization_problem(
            HeatProblemDiscAnnualizedCostModifiedParam,
            base_folder=base_folder,
            esdl_file_name="annualized_test_case_discount5.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        # Solution of model with annualized cost, with discount rate = 0.
        # This model is used to test the effect of the discount rate on the objective value.
        solution__annualized_modified_discount = run_optimization_problem(
            HeatProblemDiscAnnualizedCostModifiedDiscountRate,
            base_folder=base_folder,
            esdl_file_name="annualized_test_case_discount5.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        # # Assertion 1: Model for annualized objective value with discount=0 and
        # # technical life 1 year matches the objective value of the non-discounted problem
        np.testing.assert_allclose(
            solution__annualized_modified_param.objective_value, solution_run_ates.objective_value
        )

        # Assertion 2: Undiscounted problem has a lower objective value than the discocunted one
        # due to cost of capital not considered in undiscounted problem
        np.testing.assert_array_less(
            solution__annualized_modified_discount.objective_value,
            solution_annualized_cost.objective_value,
        )

        results = solution_annualized_cost.extract_results()
        heat_producers = [1, 2]
        # Number of decimal positions for test accuracy
        decimal = 4
        for i in heat_producers:
            investment_and_installation_cost = (
                results[f"HeatProducer_{i}__investment_cost"]
                + results[f"HeatProducer_{i}__installation_cost"]
            )
            # These are the same parameters used by the model from the ESDL file:
            asset_id = solution_annualized_cost.esdl_asset_name_to_id_map[f"HeatProducer_{i}"]
            years_asset_life = solution_annualized_cost.esdl_assets[asset_id].attributes[
                "technicalLifetime"
            ]
            discount_rate = (
                solution_annualized_cost.esdl_assets[asset_id]
                .attributes["costInformation"]
                .discountRate.value
            ) / 100
            # TODO: Handle if NoneType
            discount_factor = calculate_annuity_factor(discount_rate, years_asset_life)
            annualized_capex = results[f"HeatProducer_{i}__annualized_capex"]
            # # Assertion 3: annualized capex matches the discounted investment
            # # and installation cost
            np.testing.assert_almost_equal(
                annualized_capex,
                investment_and_installation_cost * discount_factor,
                decimal,
            )

        # Assertion 4: The calculate_annuity_factor function returns the correct value
        # Checks that calculate_annuity_factor() returns 1.0 for a discount factor rate
        # of 0 and technical life of 1, and that it returns a value of 1.1 for discount
        # rate of 10%
        assert np.isclose(calculate_annuity_factor(0, 1), 1.0, atol=1e-14, rtol=0.0)
        assert np.isclose(calculate_annuity_factor(0.1, 1), 1.1, atol=1e-14, rtol=0.0)


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestEndScenarioSizingAnnualized()
    a.test_end_scenario_sizing_annualized()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
