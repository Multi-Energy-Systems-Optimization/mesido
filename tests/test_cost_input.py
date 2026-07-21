import logging
import unittest
import unittest.mock
from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.exceptions import MesidoAssetIssueError
from mesido.potential_errors import MesidoAssetIssueType, PotentialErrors
from mesido.util import run_esdl_mesido_optimization
from mesido.workflows import EndScenarioSizing
from mesido.workflows.utils.error_types import mesido_issue_type_gen_message

from models.cost_information_errors import test_check_cost_information

import numpy as np

logger = logging.getLogger("mesido")
logger.setLevel(logging.INFO)


class TestCostInputCheck(TestCase):
    # NOTE: These tests are temporarily disabled because cost attribute errors
    # (ASSET_COST_ATTRIBUTE_INCORRECT and ASSET_COST_ATTRIBUTE_MISSING) have been
    # temporarily excluded from HEAT_NETWORK_ERRORS to generate warnings instead of errors.
    # TODO: Re-enable these tests when cost errors are added back to HEAT_NETWORK_ERRORS

    @unittest.skip(
        "Temporarily disabled: ASSET_COST_ATTRIBUTE_INCORRECT and "
        "ASSET_COST_ATTRIBUTE_MISSING have been excluded from HEAT_NETWORK_ERRORS to "
        "generate warnings instead of raising exceptions. Re-enable when cost errors "
        "are added back to HEAT_NETWORK_ERRORS."
    )
    def test_incorrect_cost_fail(self):
        """
        Test that ESDL files with incorrect cost attributes raise appropriate errors.

        This test verifies that the error checking mechanism correctly identifies and raises
        an exception when an ESDL file contains assets with incorrect cost attribute specifications.
        Specifically, it tests a case where an asset has installation costs specified per unit WATT
        when it should be None.

        The test uses a mock to replace the global POTENTIAL_ERRORS singleton with a fresh instance,
        ensuring that previous errors don't affect this test.

        Checks:
        1. The correct error type (ASSET_COST_ATTRIBUTE_INCORRECT) is raised
        2. The error message correctly identifies the general issue
        3. The error contains the specific asset ID and a detailed message explaining the problem
        """

        base_folder = Path(test_check_cost_information.__file__).resolve().parent

        with (
            self.assertRaises(MesidoAssetIssueError) as cm,
            unittest.mock.patch("mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()),
        ):
            _ = run_esdl_mesido_optimization(
                EndScenarioSizing,
                base_folder=base_folder,
                esdl_file_name="graph_HDemands_incl_demand_4_incorrect_no_db.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="profiles.csv",
            )

        # Check that the cold demand had an error
        np.testing.assert_equal(
            cm.exception.error_type, MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT
        )
        np.testing.assert_equal(
            cm.exception.general_issue,
            mesido_issue_type_gen_message(MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT),
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["f4fd7ca1-3f10-4bdb-88b3-daf8c456d959"],
            "Specified installation costs of asset Producer_2 include a component per unit WATT,"
            " but should be None.",
        )

    @unittest.skip(
        "Temporarily disabled: ASSET_COST_ATTRIBUTE_MISSING has been excluded "
        "from HEAT_NETWORK_ERRORS to generate warnings instead of raising "
        "exceptions. Re-enable when cost errors are added back."
    )
    def test_missing_cost_fail(self):
        """
        Test that ESDL files with missing cost attributes raise appropriate errors.

        This test verifies that the error checking mechanism correctly identifies and raises
        an exception when an ESDL file contains assets with missing cost attributes that are
        required. Specifically, it tests a case where an asset has investment costs, which
        are required.

        The test uses a mock to replace the global POTENTIAL_ERRORS singleton with a fresh instance,
        ensuring that previous errors don't affect this test.

        Checks:
        1. The correct error type (ASSET_COST_ATTRIBUTE_MISSING) is raised
        2. The error message correctly identifies the general issue
        3. The error contains the specific asset ID and a detailed message explaining the problem
        """

        # Test missing investment cost, which is required for HeatProducer

        base_folder = Path(test_check_cost_information.__file__).resolve().parent

        with (
            self.assertRaises(MesidoAssetIssueError) as cm,
            unittest.mock.patch("mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()),
        ):
            _ = run_esdl_mesido_optimization(
                EndScenarioSizing,
                base_folder=base_folder,
                esdl_file_name="graph_HDemands_incl_demand_4_missing_investment_no_db.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="profiles.csv",
            )

        # Check that the cold demand had an error
        np.testing.assert_equal(
            cm.exception.error_type, MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING
        )
        np.testing.assert_equal(
            cm.exception.general_issue,
            mesido_issue_type_gen_message(MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING),
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["f4fd7ca1-3f10-4bdb-88b3-daf8c456d959"],
            "No investment costs information specified for Producer_2 of type HeatProducer.",
        )

        # Test missing operational cost, which is required for HeatProducer

        with (
            self.assertRaises(MesidoAssetIssueError) as cm,
            unittest.mock.patch("mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()),
        ):
            _ = run_esdl_mesido_optimization(
                EndScenarioSizing,
                base_folder=base_folder,
                esdl_file_name="graph_HDemands_incl_demand_4_missing_operational_no_db.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="profiles.csv",
            )

        # Check that the cost error was raised
        np.testing.assert_equal(
            cm.exception.error_type, MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING
        )
        np.testing.assert_equal(
            cm.exception.general_issue,
            mesido_issue_type_gen_message(MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING),
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["f4fd7ca1-3f10-4bdb-88b3-daf8c456d959"],
            (
                "No variable operational costs information specified for Producer_2 "
                "of type HeatProducer."
            ),
        )


if __name__ == "__main__":
    test_cold_demand = TestCostInputCheck()
    test_cold_demand.test_incorrect_cost_fail()
    test_cold_demand.test_missing_cost_fail()
