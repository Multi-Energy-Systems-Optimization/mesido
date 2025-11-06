"""
Minimal test to verify that assets not in ASSET_COST_REQUIREMENTS can have their costs
processed when NO_POTENTIAL_ERRORS_CHECK is used.
"""

from unittest import TestCase
from unittest.mock import Mock

import esdl

from mesido.esdl.asset_to_component_base import (
    NO_POTENTIAL_ERRORS_CHECK,
    _AssetToComponentBase,
)
from mesido.esdl.common import Asset


class TestCostValidationBypass(TestCase):
    def test_unsupported_asset_cost_extraction_with_no_error_check(self):
        """
        Test that an asset type NOT in ASSET_COST_REQUIREMENTS can still have its
        cost information extracted when NO_POTENTIAL_ERRORS_CHECK is used.
        """
        # Create instance with NO_POTENTIAL_ERRORS_CHECK
        converter = _AssetToComponentBase(error_type_check=NO_POTENTIAL_ERRORS_CHECK)

        # Create a mock asset of type "Pump" which is NOT in ASSET_COST_REQUIREMENTS
        mock_asset = Mock(spec=Asset)
        mock_asset.asset_type = "Pump"
        mock_asset.name = "TestPump"
        mock_asset.id = "test-pump-id"

        # Create mock cost information
        mock_cost_info = Mock(spec=esdl.SingleValue)
        mock_cost_info.value = 100.0

        mock_unit_info = Mock()
        mock_unit_info.unit = esdl.UnitEnum.EURO
        mock_unit_info.perTimeUnit = esdl.TimeUnitEnum.YEAR
        mock_unit_info.perUnit = esdl.UnitEnum.WATT
        mock_unit_info.multiplier = esdl.MultiplierEnum.NONE
        mock_unit_info.perMultiplier = esdl.MultiplierEnum.NONE
        mock_cost_info.profileQuantityAndUnit = mock_unit_info

        # Test that validation returns True for unsupported asset when NO_POTENTIAL_ERRORS_CHECK
        result = converter._validate_cost_attribute(
            mock_asset, "fixedOperationalCosts", mock_cost_info
        )

        # Should return True, allowing cost extraction
        self.assertTrue(
            result,
            "Cost validation should return True for unsupported assets when "
            "NO_POTENTIAL_ERRORS_CHECK is used",
        )

    def test_unsupported_asset_cost_blocked_without_no_error_check(self):
        """
        Test that an asset type NOT in ASSET_COST_REQUIREMENTS is blocked
        when NO_POTENTIAL_ERRORS_CHECK is NOT used.
        """
        # Create instance WITHOUT NO_POTENTIAL_ERRORS_CHECK
        converter = _AssetToComponentBase()

        # Create a mock asset of type "Pump" which is NOT in ASSET_COST_REQUIREMENTS
        mock_asset = Mock(spec=Asset)
        mock_asset.asset_type = "Pump"
        mock_asset.name = "TestPump"
        mock_asset.id = "test-pump-id"

        # Create mock cost information
        mock_cost_info = Mock(spec=esdl.SingleValue)
        mock_cost_info.value = 100.0

        # Test that validation returns False for unsupported asset without NO_POTENTIAL_ERRORS_CHECK
        result = converter._validate_cost_attribute(
            mock_asset, "fixedOperationalCosts", mock_cost_info
        )

        # Should return False, blocking cost extraction
        self.assertFalse(
            result,
            "Cost validation should return False for unsupported assets when "
            "NO_POTENTIAL_ERRORS_CHECK is NOT used",
        )

    def test_supported_asset_always_works(self):
        """
        Test that assets IN ASSET_COST_REQUIREMENTS work regardless of error check setting.
        """
        # Test with NO_POTENTIAL_ERRORS_CHECK
        converter_with_check = _AssetToComponentBase(error_type_check=NO_POTENTIAL_ERRORS_CHECK)

        # Create a mock asset of type "HeatPump" which IS in ASSET_COST_REQUIREMENTS
        mock_asset = Mock(spec=Asset)
        mock_asset.asset_type = "HeatPump"
        mock_asset.name = "TestHeatPump"
        mock_asset.id = "test-heatpump-id"

        # Create mock cost information
        mock_cost_info = Mock(spec=esdl.SingleValue)
        mock_cost_info.value = 100.0

        result_with = converter_with_check._validate_cost_attribute(
            mock_asset, "investmentCosts", mock_cost_info  # This is required for heat_pump
        )

        # Test without NO_POTENTIAL_ERRORS_CHECK
        converter_without_check = _AssetToComponentBase()
        result_without = converter_without_check._validate_cost_attribute(
            mock_asset, "investmentCosts", mock_cost_info
        )

        # Both should return True
        self.assertTrue(result_with, "Supported assets should work with NO_POTENTIAL_ERRORS_CHECK")
        self.assertTrue(
            result_without, "Supported assets should work without NO_POTENTIAL_ERRORS_CHECK"
        )

    def test_gas_demand_with_no_error_check(self):
        """Test GasDemand cost extraction with NO_POTENTIAL_ERRORS_CHECK."""
        converter = _AssetToComponentBase(error_type_check=NO_POTENTIAL_ERRORS_CHECK)

        mock_asset = Mock(spec=Asset)
        mock_asset.asset_type = "GasDemand"
        mock_asset.name = "TestGasDemand"
        mock_asset.id = "test-gasdemand-id"

        mock_cost_info = Mock(spec=esdl.SingleValue)
        mock_cost_info.value = 0.1

        result = converter._validate_cost_attribute(
            mock_asset, "variableOperationalCosts", mock_cost_info
        )

        self.assertTrue(
            result,
            "GasDemand should allow cost extraction with NO_POTENTIAL_ERRORS_CHECK",
        )

    def test_electrolyzer_with_no_error_check(self):
        """Test Electrolyzer cost extraction with NO_POTENTIAL_ERRORS_CHECK."""
        converter = _AssetToComponentBase(error_type_check=NO_POTENTIAL_ERRORS_CHECK)

        mock_asset = Mock(spec=Asset)
        mock_asset.asset_type = "Electrolyzer"
        mock_asset.name = "TestElectrolyzer"
        mock_asset.id = "test-electrolyzer-id"

        mock_cost_info = Mock(spec=esdl.SingleValue)
        mock_cost_info.value = 20.0

        result = converter._validate_cost_attribute(mock_asset, "investmentCosts", mock_cost_info)

        self.assertTrue(
            result,
            "Electrolyzer should allow cost extraction with NO_POTENTIAL_ERRORS_CHECK",
        )

    def test_gas_storage_with_no_error_check(self):
        """Test GasStorage cost extraction with NO_POTENTIAL_ERRORS_CHECK."""
        converter = _AssetToComponentBase(error_type_check=NO_POTENTIAL_ERRORS_CHECK)

        mock_asset = Mock(spec=Asset)
        mock_asset.asset_type = "GasStorage"
        mock_asset.name = "TestGasStorage"
        mock_asset.id = "test-gasstorage-id"

        mock_cost_info = Mock(spec=esdl.SingleValue)
        mock_cost_info.value = 10.0

        result = converter._validate_cost_attribute(
            mock_asset, "fixedOperationalCosts", mock_cost_info
        )

        self.assertTrue(
            result,
            "GasStorage should allow cost extraction with NO_POTENTIAL_ERRORS_CHECK",
        )

    def test_ates_with_missing_required_cost_and_no_error_check(self):
        """
        Test ATES with missing fixedOperationalCosts (required) when
        NO_POTENTIAL_ERRORS_CHECK is used. Validation returns False for None,
        causing the cost processing loop to skip it, naturally contributing 0.0
        to the total cost (same behavior as before validation was added).
        """
        converter = _AssetToComponentBase(error_type_check=NO_POTENTIAL_ERRORS_CHECK)

        mock_asset = Mock(spec=Asset)
        mock_asset.asset_type = "ATES"
        mock_asset.name = "TestATES"
        mock_asset.id = "test-ates-id"

        # Test with None cost_info (missing required attribute)
        result = converter._validate_cost_attribute(
            mock_asset,
            "fixedOperationalCosts",  # This is REQUIRED for ATES
            None,  # Missing in ESDL file
        )

        # With NO_POTENTIAL_ERRORS_CHECK, should return False for None to skip
        # processing. This naturally contributes 0.0 to the cost without raising
        # warnings
        self.assertFalse(
            result,
            "ATES validation should return False for None cost_info to skip " "processing cleanly",
        )

        # Test with present cost_info
        mock_cost_info = Mock(spec=esdl.SingleValue)
        mock_cost_info.value = 15.0

        result_with_cost = converter._validate_cost_attribute(
            mock_asset, "fixedOperationalCosts", mock_cost_info
        )

        self.assertTrue(
            result_with_cost,
            "ATES validation should return True when cost_info is present with "
            "NO_POTENTIAL_ERRORS_CHECK",
        )


if __name__ == "__main__":
    import unittest

    unittest.main()
