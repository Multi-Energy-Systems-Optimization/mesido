from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

import numpy as np

from rtctools.util import run_optimization_problem


class TestAssetIsRealized(TestCase):
    def test_asset_is_realized(self):
        r"""
        This is a test to check the behaviour of the cumulative investments made and the
        asset is realized variable. We want the asset only to become available once sufficient
        investments are made.

        In this specific test we optimize to match the milp demand. However, the sources are not
        available from the start as the cumulative invesments made at timestep 0 is 0. Furthermore,
        there is a cap on the investments that can be done per timestep. We expect the optimizer
        to find a solution that releases the sources as soon as possible in order to match demand
        and the demand not to be matched until that point in time.

        Checks:
        - That the investment cap per time step is satisfied
        - Check that the total investments actually are sufficient once the asset is realized
        - Check that the asset is not used before the asset_is_realized == 1
        """
        import models.test_case_small_network_with_ates.src.run_ates as run_ates
        from models.test_case_small_network_with_ates.src.run_ates import (
            HeatProblemPlacingOverTime,
        )

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over 25 timesteps with a cap on how quickly the cost
        # for the 2 producers can be realized
        solution = run_optimization_problem(
            HeatProblemPlacingOverTime,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = solution.extract_results()

        prod_1_id = solution.esdl_asset_name_to_id_map.get("HeatProducer_1")
        prod_2_id = solution.esdl_asset_name_to_id_map.get("HeatProducer_2")

        # First we test whether the investments made are below cap
        cap = 2.5e5 + 1.0e-3  # some small tolerance, CBC...
        np.testing.assert_allclose(
            True, np.diff(results[f"{prod_1_id}__cumulative_investments_made_in_eur"]) <= cap
        )
        np.testing.assert_allclose(
            True, np.diff(results[f"{prod_2_id}__cumulative_investments_made_in_eur"]) <= cap
        )

        # Now we test if the investments made are greater then the needed investments once the
        # asset is realized
        inds_1 = np.where(np.round(results[f"{prod_1_id}__asset_is_realized"]) == 1)
        np.testing.assert_allclose(
            True,
            (
                results[f"{prod_1_id}__cumulative_investments_made_in_eur"][inds_1]
                >= results[f"{prod_1_id}__investment_cost"]
                + results[f"{prod_1_id}__installation_cost"]
                - 1.0e-3
            ),
        )
        inds_2 = np.where(np.round(results[f"{prod_2_id}__asset_is_realized"]) == 1)
        np.testing.assert_allclose(
            True,
            (
                results[f"{prod_2_id}__cumulative_investments_made_in_eur"][inds_2]
                >= results[f"{prod_2_id}__investment_cost"]
                + results[f"{prod_2_id}__installation_cost"]
                - 1.0e-3
            ),
        )

        # Here we test that the asset is not used until it is actually realized
        inds_not_1 = np.where(np.round(results[f"{prod_1_id}__asset_is_realized"]) == 0)
        np.testing.assert_allclose(
            results[f"{prod_1_id}.Heat_source"][inds_not_1], 0.0, atol=1e-6
        )
        inds_not_2 = np.where(np.round(results[f"{prod_2_id}__asset_is_realized"]) == 0)
        np.testing.assert_allclose(
            results[f"{prod_1_id}.Heat_source"][inds_not_2], 0.0, atol=1e-6
        )

        # Here we test that the asset is actually used once it is realized
        np.testing.assert_allclose(results[f"{prod_1_id}.Heat_source"][inds_1] > 0.0, True)
        np.testing.assert_allclose(results[f"{prod_2_id}.Heat_source"][inds_2] > 0.0, True)


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestAssetIsRealized()
    a.test_asset_is_realized()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
