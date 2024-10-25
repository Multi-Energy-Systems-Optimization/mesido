

class MesidoAssetIssueError(Exception):
    """
    This class is used as a MESIDO defined exception class.
    """

    def __init__(self, general_issue, error_type, message_per_asset_id):

        self.error_type = error_type
        self.general_issue = general_issue
        self.message_per_asset_id = message_per_asset_id

    def __str__(self):
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
