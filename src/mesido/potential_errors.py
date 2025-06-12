from enum import Enum
from typing import Dict, List, NoReturn

from mesido.exceptions import MesidoAssetIssueError

AssetId = str
ErrorMessage = str


# Asset error type that can occur
class MesidoAssetIssueType(Enum):
    HEAT_PRODUCER_POWER = "heat_producer.power"
    HEAT_DEMAND_POWER = "heat_demand.power"
    COLD_DEMAND_POWER = "cold_demand.power"
    HEAT_DEMAND_TYPE = "heat_demand.type"
    ASSET_PROFILE_CAPABILITY = "asset_profile.capability"
    HEAT_EXCHANGER_TEMPERATURES = "heat_exchanger.temperature"


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
