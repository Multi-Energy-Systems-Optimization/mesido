from typing import Dict, TYPE_CHECKING, Tuple, Type

if TYPE_CHECKING:  # This prevents circular referencing between this file and potential_errors.py
    from mesido.potential_errors import ErrorMessage, MesidoAssetIssueType


class MesidoAssetIssueError(Exception):
    """
    This class is used as a MESIDO defined exception class.
    """

    error_type: "MesidoAssetIssueType"
    general_issue: str
    message_per_asset_id: Dict[str, "ErrorMessage"]

    def __init__(
        self,
        general_issue: str,
        error_type: "MesidoAssetIssueType",
        message_per_asset_id: Dict[str, "ErrorMessage"],
    ):

        self.error_type = error_type
        self.general_issue = general_issue
        self.message_per_asset_id = message_per_asset_id

    def __str__(self) -> str:
        """
        Returns
        -------
        A string containing the following:
        - Error type (e.g.HEAT_DEMAND_POWER)
        - General meassage about the group of error messages per asset id
        - Asset id
        - Error message for the applicable asset
        """
        return_string = f"{self.error_type}: {self.general_issue}"
        for keys, values in self.message_per_asset_id.items():
            return_string += f"\nAsset id: {keys}"
            return_string += f" {values}"

        return return_string

    # Currently this function has been added for Design Toolkit back end purposes
    def __reduce__(
        self,
    ) -> Tuple[
        Type["MesidoAssetIssueError"], Tuple[str, "MesidoAssetIssueType", Dict[str, "ErrorMessage"]]
    ]:
        """Reduce an instance of this class to pickable components.

        This is required so the class can be serialized and deserialized in the pickle format.

        Returns
        -------
        A tuple containing:
        - The class
        - Separate arguments of this instance
        """
        return (
            MesidoAssetIssueError,
            (self.general_issue, self.error_type, self.message_per_asset_id),
        )
