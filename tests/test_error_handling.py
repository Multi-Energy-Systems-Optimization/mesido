import unittest
from unittest.mock import MagicMock, patch

from mesido.esdl.asset_to_component_base import MesidoAssetIssueType, _AssetToComponentBase


class TestLogAndReportIssue(unittest.TestCase):
    """
    Test suite for _log_and_report_issue method of AssetToComponentBase class.
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
    def test_log_and_report_issue_incorrect(
        self,
        mock_get_potential_errors: MagicMock,
        mock_logger: MagicMock,
    ) -> None:
        """
        Test that _log_and_report_issue correctly logs warning message
        and reports issue when cost information is incorrect.
        """
        # Arrange
        mock_potential_errors = MagicMock()
        mock_get_potential_errors.return_value = mock_potential_errors

        # Act
        self.mock_instance._log_and_report_issue(
            self.message, self.asset_id, cost_error_type="incorrect"
        )

        # Assert
        mock_logger.warning.assert_called_once_with(self.message)
        mock_potential_errors.add_potential_issue.assert_called_once_with(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT, self.asset_id, self.message
        )

    @patch("mesido.esdl.asset_to_component_base.logger")
    @patch("mesido.esdl.asset_to_component_base.get_potential_errors")
    def test_log_and_report_issue_missing(
        self,
        mock_get_potential_errors: MagicMock,
        mock_logger: MagicMock,
    ) -> None:
        """
        Test that _log_and_report_issue correctly logs warning message
        and reports issue when required attribute is missing.
        """
        # Arrange
        mock_potential_errors = MagicMock()
        mock_get_potential_errors.return_value = mock_potential_errors

        # Act
        self.mock_instance._log_and_report_issue(
            self.message, self.asset_id, cost_error_type="missing"
        )

        # Assert
        mock_logger.warning.assert_called_once_with(self.message)
        mock_potential_errors.add_potential_issue.assert_called_once_with(
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING, self.asset_id, self.message
        )

    @patch("mesido.esdl.asset_to_component_base.logger")
    @patch("mesido.esdl.asset_to_component_base.get_potential_errors")
    def test_log_and_no_report_issue(
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
        self.mock_instance._log_and_report_issue(
            self.message,
            self.asset_id,
            report_issue=False,
        )

        # Assert
        mock_logger.warning.assert_called_once_with(self.message)
        mock_potential_errors.add_potential_issue.assert_not_called()


if __name__ == "__main__":
    unittest.main()
