import enum
from typing import Dict, List


# Goes into ./potential_errors.py

class MesidoAssetIssueType(enum.Enum):
    HEAT_DEMAND_POWER = "heat_demand.power"
    "etc."


AssetId = str
ErrorMessage = str


class PotentialErrors:
    """Singleton, do not instantiate. Use POTENTIAL_ERRORS."""
    _gathered_potential_issues: Dict[MesidoAssetIssueType, Dict[AssetId, List[ErrorMessage]]]

    def add_potential_issue(
            self, issue_type: MesidoAssetIssueType, asset_id: AssetId, error_message: ErrorMessage
    ) -> None:
        self._gathered_potential_issues.setdefault(
            issue_type, {}
        ).setdefault(asset_id, []).append(error_message)

    def have_issues_for(self, issue_types: List[MesidoAssetIssueType]) -> bool:
        """

        """
        result = False
        for issue_type in issue_types:
            if (
                issue_type in self._gathered_potential_issues
                and len(self._gathered_potential_issues) > 0
            ):
                result = True

        return result

    def convert_to_exception(
            self, issue_type: MesidoAssetIssueType, general_issue: str
    ) -> "MesidoAssetIssue":
        if issue_type not in self._gathered_potential_issues:
            raise RuntimeError('Something very wrong. Issue type not in potential errors')

        return MesidoAssetIssue(general_issue=general_issue,
                                error_type=issue_type,
                                message_per_asset_id=self._gathered_potential_issues[issue_type])


POTENTIAL_ERRORS = PotentialErrors()
# POTENTIAL_ERRORS = {}

# def get_potential_errors_for(run_id: str) -> PotentialErrors:
#     return POTENTIAL_ERRORS.setdefault(run_id, PotentialErrors())


# Goes into ./exceptions.py
# class MesidoAssetIssue(Exception):
#     general_issue: str
#     message_per_asset_id: Dict[str, str]  # Example: "HeatDemand1234": "This heat demand is purple and I do not like purple"
#     error_type: MesidoAssetIssueType



### EXAMPLE
def run_end_scenario_sizing(*args, **kwargs):
    try:
        POTENTIAL_ERRORS.add_potential_issue(MesidoAssetIssueType.HEAT_DEMAND_POWER, "some asset id", "error message")
    except MesidoAssetIssue as e:
        for asset_id, message in e.message_per_asset_id:
            logger.error("For asset %s %s", asset_id, message)
        logger.error(e.general_issue)
        raise



# #v_______________________________________________
# # ERROR CODE VERSION:
# class MesidoAssetMessage:
#     asset_message_error_code: str
#     variables: Dict[str, Union[int, float, str, bool]]


# class MesidoAssetIssue(Exception):
#     general_issue_error_code: str
#     variables: Dict[str, Union[int, float, str, bool]]
#     error_code_with_variables_per_asset_id: Dict[AssetId, MesidoAssetMessage]
#     error_type: MesidoAssetIssueType


# MesidoAssetIssue().error_code_with_variables_per_asset_id['HeatDemand1234'] = MesidoAssetMessage('asset.heat_demand.power_001', {'asset_id': "HeatDemand1234", "asset_power": 5.0, "max_profile_value": 4.5})


# general_issue_error_codes = {
#     "general.heat_demand.power_001": "bla bla bla"
# }
# asset_error_codes = {
#     "asset.heat_demand.power_001": "{asset_id}: The installed capacity of {asset_power}MW should be larger than the maximum of the heat demand profile {max_profile_value}MW"
# }


# def run_end_scenario_sizing(*args, **kwargs):
#     try:
#         POTENTIAL_ERRORS.add_potential_issue(MesidoAssetIssueType.HEAT_DEMAND_POWER, "some asset id", "error message")
#     except MesidoAssetIssue as e:
#         for asset_id, message in e.message_per_asset_id:
#             logger.error(instantiate_template(asset_error_codes[message.asset_message_error_code] asset_id, message.variables))
#         logger.error(e.general_issue_error_code + ":" + instantiate_template(asset_error_codes[e.general_issue_error_code], e.variables))
#         raise



