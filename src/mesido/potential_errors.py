from typing import Dict, List

from mesido.exceptions import MesidoAssetIssueError
from mesido.network_common import MesidoAssetIssueType

AssetId = str
ErrorMessage = str


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
        self._gathered_potential_issues.setdefault(issue_type, {}).setdefault(asset_id, "")
        self._gathered_potential_issues[issue_type][asset_id] = error_message

    def have_issues_for(self, issue_types: List[MesidoAssetIssueType]) -> Dict[
        MesidoAssetIssueType,
        bool,
    ]:
        """
        Check if the potential issue exists and mark them as True for the specific issue type.

        """
        result = {}
        for ii in range(len(issue_types)):
            if (
                issue_types[ii] in self._gathered_potential_issues
                and len(self._gathered_potential_issues) > 0
            ):
                result[issue_types[ii]] = True
            else:
                result[issue_types[ii]] = False

        return result

    def convert_to_exception(
        self, issue_type: MesidoAssetIssueType, general_issue: str
    ) -> "MesidoAssetIssueError":
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


POTENTIAL_ERRORS = PotentialErrors()
