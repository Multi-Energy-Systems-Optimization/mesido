import unittest
from unittest.mock import MagicMock, patch

from mesido.esdl.asset_to_component_base import MesidoAssetIssueType, _AssetToComponentBase
from mesido.potential_errors import get_potential_errors, reset_potential_errors


class TestLogAndReportIssue(unittest.TestCase):
    """
    Test suite for _log_and_add_potential_issue method of AssetToComponentBase class.
    Tests logging and error reporting functionality.
    """

    @patch("builtins.open")
    @patch("json.load")
    def setUp(self, mock_json_load: MagicMock, mock_open: MagicMock) -> None:
        """Set up test fixtures before each test method."""
        self.message = "Test warning message"
        self.asset_id = 12345
        self.mock_instance = _AssetToComponentBase()
        # Mock JSON data
        mock_json_load.return_value = {}

    @patch("mesido.esdl.asset_to_component_base.logger")
    @patch("mesido.esdl.asset_to_component_base.get_potential_errors")
    def test_log_and_add_potential_issue_incorrect_cost(
        self,
        mock_get_potential_errors: MagicMock,
        mock_logger: MagicMock,
    ) -> None:
        """
        Test that _log_and_add_potential_issue correctly logs warning message
        and reports issue when cost information is incorrect.
        """
        # Arrange
        mock_potential_errors = MagicMock()
        mock_get_potential_errors.return_value = mock_potential_errors

        # Act
        self.mock_instance._log_and_add_potential_issue(
            self.message, self.asset_id, cost_error_type="incorrect"
        )

        # Assert
        mock_logger.warning.assert_called_once_with(self.message)
        mock_potential_errors.add_potential_issue.assert_called_once_with(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT, self.asset_id, self.message
        )

    @patch("mesido.esdl.asset_to_component_base.logger")
    @patch("mesido.esdl.asset_to_component_base.get_potential_errors")
    def test_log_and_add_potential_issue_missing_cost(
        self,
        mock_get_potential_errors: MagicMock,
        mock_logger: MagicMock,
    ) -> None:
        """
        Test that _log_and_add_potential_issue correctly logs warning message
        and reports issue when required attribute is missing.
        """
        # Arrange
        mock_potential_errors = MagicMock()
        mock_get_potential_errors.return_value = mock_potential_errors

        # Act
        self.mock_instance._log_and_add_potential_issue(
            self.message, self.asset_id, cost_error_type="missing"
        )

        # Assert
        mock_logger.warning.assert_called_once_with(self.message)
        mock_potential_errors.add_potential_issue.assert_called_once_with(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING, self.asset_id, self.message
        )

    @patch("mesido.esdl.asset_to_component_base.logger")
    @patch("mesido.esdl.asset_to_component_base.get_potential_errors")
    def test_log_and_do_not_add_potential_issue(
        self,
        mock_get_potential_errors: MagicMock,
        mock_logger: MagicMock,
    ) -> None:
        """
        Test that _log_and_report_issue correctly logs warning message
        when report_issue is set to False.
        """
        # Arrange
        mock_potential_errors = MagicMock()
        mock_get_potential_errors.return_value = mock_potential_errors

        # Act
        self.mock_instance._log_and_add_potential_issue(
            self.message,
            self.asset_id,
            report_issue=False,
        )

        # Assert
        mock_logger.warning.assert_called_once_with(self.message)
        mock_potential_errors.add_potential_issue.assert_not_called()


class TestPotentialErrorsGetters(unittest.TestCase):
    """Test that getter methods return deep copies to prevent state mutation."""

    def setUp(self):
        """Reset potential errors before each test."""
        reset_potential_errors()

    def tearDown(self):
        """Reset potential errors after each test."""
        reset_potential_errors()

    def test_get_all_issues_returns_deep_copy(self):
        """Test that get_all_issues() returns a deep copy to prevent external modification."""
        potential_errors = get_potential_errors()
        potential_errors.add_potential_issue(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT,
            "asset_1",
            "Original message",
        )

        # Modify returned dict
        all_issues = potential_errors.get_all_issues()
        all_issues[MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT][
            "asset_1"
        ] = "Modified message"

        # Verify internal state unchanged
        internal_issues = potential_errors.get_all_issues()
        self.assertEqual(
            internal_issues[MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT]["asset_1"],
            "Original message",
        )

    def test_get_issues_by_type_returns_deep_copy_and_filters(self):
        """Test that get_issues_by_type() returns a deep copy and correctly filters by type."""
        potential_errors = get_potential_errors()
        potential_errors.add_potential_issue(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT,
            "asset_1",
            "Incorrect cost",
        )
        potential_errors.add_potential_issue(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING,
            "asset_2",
            "Missing cost",
        )

        # Get issues for specific type
        incorrect_issues = potential_errors.get_issues_by_type(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT
        )

        # Verify correct filtering
        self.assertEqual(len(incorrect_issues), 1)
        self.assertIn("asset_1", incorrect_issues)
        self.assertEqual(incorrect_issues["asset_1"], "Incorrect cost")

        # Modify returned dict
        incorrect_issues["asset_1"] = "Modified message"

        # Verify internal state unchanged
        internal_issues = potential_errors.get_issues_by_type(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT
        )
        self.assertEqual(internal_issues["asset_1"], "Incorrect cost")

        # Verify empty dict for non-existent type
        empty_issues = potential_errors.get_issues_by_type(MesidoAssetIssueType.HEAT_PRODUCER_POWER)
        self.assertEqual(empty_issues, {})

    @patch("mesido.util.run_optimization_problem")
    @patch("mesido.util.get_potential_errors")
    def test_warnings_attached_to_solution(
        self, mock_get_potential_errors: MagicMock, mock_run_optimization: MagicMock
    ):
        """Test that mesido_warnings are attached to solution object."""
        from mesido.util import run_esdl_mesido_optimization

        # Setup mock solution
        mock_solution = MagicMock()
        mock_solution.solver_stats = {"return_status": "optimal"}
        mock_run_optimization.return_value = mock_solution

        # Setup mock potential errors with test data
        mock_potential_errors = MagicMock()
        test_warnings = {
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT: {"asset_1": "Test warning message"}
        }
        mock_potential_errors.get_all_issues.return_value = test_warnings
        mock_get_potential_errors.return_value = mock_potential_errors

        # Call the function
        result = run_esdl_mesido_optimization(
            problem=MagicMock(),
            esdl_parser=MagicMock(),
            esdl_file_name="test.esdl",
        )

        # Verify warnings were retrieved and attached
        mock_potential_errors.get_all_issues.assert_called_once()
        self.assertEqual(result.mesido_warnings, test_warnings)
        self.assertIs(result, mock_solution)

    @patch("mesido.util.run_optimization_problem")
    @patch("mesido.util.get_potential_errors")
    def test_empty_warnings_attached_to_solution(
        self, mock_get_potential_errors: MagicMock, mock_run_optimization: MagicMock
    ):
        """Test that empty mesido_warnings dict is attached when no issues exist."""
        from mesido.util import run_esdl_mesido_optimization

        mock_solution = MagicMock()
        mock_solution.solver_stats = {"return_status": "optimal"}
        mock_run_optimization.return_value = mock_solution

        mock_potential_errors = MagicMock()
        mock_potential_errors.get_all_issues.return_value = {}
        mock_get_potential_errors.return_value = mock_potential_errors

        result = run_esdl_mesido_optimization(
            problem=MagicMock(),
            esdl_parser=MagicMock(),
            esdl_file_name="test.esdl",
        )

        self.assertEqual(result.mesido_warnings, {})
        self.assertIs(result, mock_solution)


class TestPotentialErrorsReset(unittest.TestCase):
    """Test reset behavior to prevent error pollution between optimization runs."""

    def test_errors_persist_without_reset(self):
        """Test that errors from one run persist without explicit reset."""
        reset_potential_errors()
        potential_errors = get_potential_errors()

        # Simulate first optimization run
        potential_errors.add_potential_issue(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT,
            "asset_1",
            "First run error",
        )

        # Simulate second optimization run without reset
        potential_errors.add_potential_issue(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING,
            "asset_2",
            "Second run error",
        )

        # Both errors should be present
        all_issues = potential_errors.get_all_issues()
        self.assertEqual(len(all_issues), 2)
        self.assertIn(MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT, all_issues)
        self.assertIn(MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING, all_issues)

        reset_potential_errors()

    def test_reset_clears_all_errors(self):
        """Test that reset_potential_errors() clears all accumulated errors."""
        potential_errors = get_potential_errors()
        potential_errors.add_potential_issue(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT,
            "asset_1",
            "Error message",
        )

        reset_potential_errors()

        all_issues = potential_errors.get_all_issues()
        self.assertEqual(all_issues, {})


if __name__ == "__main__":
    unittest.main()
