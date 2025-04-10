import unittest
from unittest.mock import patch, MagicMock
from mesido.esdl.asset_to_component_base import _AssetToComponentBase, MesidoAssetIssueType

class TestLogAndReportIssue(unittest.TestCase):
    @patch('mesido.esdl.asset_to_component_base.logger')  # Mock the logger
    @patch('mesido.esdl.asset_to_component_base.get_potential_errors')  # Mock get_potential_errors
    def test_log_and_report_issue(self, mock_get_potential_errors, mock_logger):
        # Arrange
        mock_potential_errors = MagicMock()
        mock_get_potential_errors.return_value = mock_potential_errors

        mock_instance = _AssetToComponentBase()  # Replace `YourClass` with the actual class name
        message = "Test warning message"
        asset_id = 12345

        # Act
        mock_instance._log_and_report_issue(message, asset_id)

        # Assert
        # Check that logger.warning was called with the correct message
        mock_logger.warning.assert_called_once_with(message)

        # Check that get_potential_errors().add_potential_issue was called with the correct arguments
        mock_potential_errors.add_potential_issue.assert_called_once_with(
            MesidoAssetIssueType.ASSET_COST_INFORMATION,
            asset_id,
            message
        )

if __name__ == '__main__':
    unittest.main()