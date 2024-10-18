from typing import Dict

from mesido.network_common import MesidoAssetIssueType


class MesidoAssetIssue(Exception):
    def __init__(self, general_issue, error_type, message_per_asset_id):
        self.general_issue = general_issue
        self.error_type = error_type
        self.message_per_asset_id = message_per_asset_id

    def __str__(self):
        return f"{self.error_type}: {self.general_issue}"

    # general_issue: str

    # # Example: "HeatDemand1234": "This heat demand is purple and I do not like purple"
    # message_per_asset_id: Dict[str, str]
    # error_type: MesidoAssetIssueType
