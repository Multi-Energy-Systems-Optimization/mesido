from typing import Dict

from potential_errors import MesidoAssetIssueType


class MesidoAssetIssue(Exception):
    general_issue: str

    # Example: "HeatDemand1234": "This heat demand is purple and I do not like purple"
    message_per_asset_id: Dict[str, str]
    error_type: MesidoAssetIssueType
