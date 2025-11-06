import copy
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

    def get_all_issues(self) -> Dict[MesidoAssetIssueType, Dict[AssetId, ErrorMessage]]:
        """
        Retrieve all gathered potential issues (both warnings and errors).

        This method provides access to all validation issues that have been collected,
        including those that were not converted to exceptions. This is useful for:
        - Retrieving warnings that don't block execution
        - Frontend display of validation issues
        - Logging and debugging purposes

        Returns
        -------
        Dict mapping issue types to a dict of asset IDs and their error messages.
        Returns a deep copy to prevent external modification of internal state.

        Notes
        -----
        Uses deep copy to ensure the singleton's internal state cannot be mutated
        by external code. This is appropriate given the method is called infrequently
        (once per optimization) and the data size is typically small (<10 issues).
        """
        return copy.deepcopy(self._gathered_potential_issues)

    def get_issues_by_type(self, issue_type: MesidoAssetIssueType) -> Dict[AssetId, ErrorMessage]:
        """
        Retrieve all issues for a specific issue type.

        Parameters
        ----------
        issue_type : MesidoAssetIssueType
            The type of issue to retrieve (e.g., ASSET_COST_ATTRIBUTE_INCORRECT)

        Returns
        -------
        Dict mapping asset IDs to error messages for the given issue type.
        Returns empty dict if no issues exist for that type.
        Returns a deep copy to prevent external modification of internal state.
        """
        return copy.deepcopy(self._gathered_potential_issues.get(issue_type, {}))


# When adding POTENTIAL_ERRORS to a workflow a reset thereof is required due to it being a
# persistent object
POTENTIAL_ERRORS = PotentialErrors()


def get_potential_errors() -> PotentialErrors:
    return POTENTIAL_ERRORS


def reset_potential_errors() -> None:
    POTENTIAL_ERRORS._gathered_potential_issues = {}
