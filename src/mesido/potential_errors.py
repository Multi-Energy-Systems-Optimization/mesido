from enum import Enum
from typing import Dict, List, NoReturn

from mesido.exceptions import MesidoAssetIssueError

AssetId = str
ErrorMessage = str


# Asset error type that can occur
class MesidoAssetIssueType(Enum):
    """
    Enumeration of possible asset issue types in the MESIDO system.

    This enum defines the different types of issues that can occur with assets in the system.
    Each issue type has a specific validation purpose:

    - HEAT_PRODUCER_POWER, Validate if power producers have sufficient installed capacity
    - HEAT_DEMAND_POWER, COLD_DEMAND_POWER: Validate that installed capacity meets demand
    - HEAT_DEMAND_TYPE: Validate correct asset type for heat demand
    - ASSET_PROFILE_CAPABILITY: Validate profile assignment capabilities
    - ASSET_COST_ATTRIBUTE_INCORRECT: Validate that existing cost attributes have
        correct values/units
    - ASSET_COST_ATTRIBUTE_MISSING: Validate that required cost attributes are present
    - HEAT_EXCHANGER_TEMPERATURES: Validate temperature settings for heat exchangers

    For cost attributes:
    Cost attributes can be required or optional for each asset.
    - Required inputs: Must exist in the ESDL file (ASSET_COST_ATTRIBUTE_MISSING) and
      have correct values/units (ASSET_COST_ATTRIBUTE_INCORRECT)
    - Optional inputs: Not required to exist, but if present must have correct
      values/units (ASSET_COST_ATTRIBUTE_INCORRECT)
    """

    HEAT_PRODUCER_POWER = "heat_producer.power"
    HEAT_DEMAND_POWER = "heat_demand.power"
    COLD_DEMAND_POWER = "cold_demand.power"
    HEAT_DEMAND_TYPE = "heat_demand.type"
    ASSET_PROFILE_CAPABILITY = "asset_profile.capability"
    ASSET_PROFILE_AVAILABILITY = "asset_profile.availability"
    ASSET_COST_ATTRIBUTE_INCORRECT = "asset_cost_attribute.incorrect"
    ASSET_COST_ATTRIBUTE_MISSING = "asset_cost_attribute.missing"
    HEAT_EXCHANGER_TEMPERATURES = "heat_exchanger.temperature"
    HEAT_EXCHANGER_POWER = "heat_exchanger.capacity"
    HEAT_DEMAND_STATE = "heat_demand.state"
    ASSET_PROFILE_MULTIPLIER = "asset_profile.multiplier"
    COLD_ASSET_TYPE_NOT_SUPPORTED = "cold_asset.type"
    ELECT_ASSET_TYPE_NOT_SUPPORTED = "elect_asset.type"
    ASSET_UPPER_LIMIT = "asset.upper_limit_size"


class PotentialErrors:
    """Singleton, do not instantiate. Use POTENTIAL_ERRORS."""

    _gathered_potential_issues: Dict[MesidoAssetIssueType, Dict[AssetId, List[ErrorMessage]]]

    def __init__(self):
        self._gathered_potential_issues = {}

    def add_potential_issue(
        self, issue_type: MesidoAssetIssueType, asset_id: AssetId, error_message: ErrorMessage
    ) -> None:
        """
        Add potential issues to _gathered_potential_issues.

        """
        self._gathered_potential_issues.setdefault(issue_type, {})
        self._gathered_potential_issues[issue_type][asset_id] = error_message

    def have_issues_for(self, issue_type: MesidoAssetIssueType) -> bool:
        """
        Check if the potential issue exists.

        """
        result = False
        if issue_type in self._gathered_potential_issues:
            result = True

        return result

    def convert_to_exception(
        self, issue_type: MesidoAssetIssueType, general_issue: str
    ) -> NoReturn:
        """
        Raise a MESIDO exception if the issue exists.

        """
        if issue_type not in self._gathered_potential_issues:
            raise RuntimeError("Something very wrong. Issue type not in potential errors")

        raise MesidoAssetIssueError(
            general_issue=general_issue,
            error_type=issue_type,
            message_per_asset_id=self._gathered_potential_issues[issue_type],
        )


# When adding POTENTIAL_ERRORS to a workflow a reset thereof is required due to it being a
# persistent object
POTENTIAL_ERRORS = PotentialErrors()


def get_potential_errors() -> PotentialErrors:
    return POTENTIAL_ERRORS


def reset_potential_errors() -> None:
    POTENTIAL_ERRORS._gathered_potential_issues = {}
