from enum import Enum

from mesido.potential_errors import MesidoAssetIssueType, get_potential_errors

# Convert potentials errors to errors for the following networks/definitions
HEAT_NETWORK_ERRORS = "heat_network"
HEAT_AND_COOL_NETWORK_ERRORS = "heat_and_cool_network"
CUSTOM_ERRORS = "custom_errors"  # an example of custom stuff that can be added in the future
NO_POTENTIAL_ERRORS_CHECK = "no_potential_errors"


def mesido_issue_type_gen_message(issue_type: MesidoAssetIssueType) -> str:
    """
    Get general message per issue type.

    Returns
    -------
    String message
    """
    type_and_general_meassage = {
        MesidoAssetIssueType.HEAT_PRODUCER_POWER: "Asset insufficient installed capacity: please"
        " increase the installed power or reduce the profile constraint peak value of the"
        " producer(s) listed.",
        MesidoAssetIssueType.HEAT_DEMAND_POWER: "Asset insufficient installed capacity: please"
        " increase the installed power or reduce the demand profile peak value of the demand(s)"
        " listed.",
        MesidoAssetIssueType.COLD_DEMAND_POWER: "Asset insufficient installed capacity: please"
        " increase the installed power or reduce the demand profile peak value of the demand(s)"
        " listed.",
        MesidoAssetIssueType.HEAT_DEMAND_TYPE: "Incorrect asset type: please update.",
        MesidoAssetIssueType.ASSET_PROFILE_CAPABILITY: "Profile assigment not allowed.",
        MesidoAssetIssueType.ASSET_PROFILE_AVAILABILITY: "Profile is not available in the "
        "database.",
        MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT: "Incorrect cost information.",
        MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING: "Required cost attribute is missing.",
        MesidoAssetIssueType.HEAT_EXCHANGER_TEMPERATURES: "Temperatures at heat exchanger set "
        "incorrectly.",
        MesidoAssetIssueType.HEAT_EXCHANGER_POWER: "The capacity of the heat exchanger is not "
        "defined",
        MesidoAssetIssueType.HEAT_DEMAND_STATE: "Heating Demand state set to OPTIONAL",
    }

    return type_and_general_meassage[issue_type]


def potential_error_to_error(network_check_type: Enum) -> None:
    """
    Convert potential errors to errors for the define error types

    """

    errors_on_types = {
        HEAT_NETWORK_ERRORS: [
            MesidoAssetIssueType.HEAT_PRODUCER_POWER,
            MesidoAssetIssueType.HEAT_DEMAND_POWER,
            MesidoAssetIssueType.COLD_DEMAND_POWER,
            MesidoAssetIssueType.HEAT_DEMAND_TYPE,
            MesidoAssetIssueType.ASSET_PROFILE_CAPABILITY,
            MesidoAssetIssueType.ASSET_PROFILE_AVAILABILITY,
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT,
            MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING,
            MesidoAssetIssueType.HEAT_EXCHANGER_TEMPERATURES,
            MesidoAssetIssueType.HEAT_EXCHANGER_POWER,
            MesidoAssetIssueType.HEAT_DEMAND_STATE,
        ],
        HEAT_AND_COOL_NETWORK_ERRORS: [
            MesidoAssetIssueType.HEAT_DEMAND_POWER,
            MesidoAssetIssueType.COLD_DEMAND_POWER,
            MesidoAssetIssueType.HEAT_DEMAND_TYPE,
            MesidoAssetIssueType.ASSET_PROFILE_CAPABILITY,
            MesidoAssetIssueType.ASSET_PROFILE_AVAILABILITY,
            MesidoAssetIssueType.HEAT_EXCHANGER_TEMPERATURES,
            MesidoAssetIssueType.HEAT_DEMAND_STATE,
        ],
        # Example of extra error types / groups that can be added. This one is not used yet.
        CUSTOM_ERRORS: [MesidoAssetIssueType.ASSET_PROFILE_CAPABILITY],
        NO_POTENTIAL_ERRORS_CHECK: [],
    }

    # Error checking:
    # - installed capacity/power of a heating/cooling demand is sufficient for the specified
    #   demand profile
    # - asset used for a heating demand
    # - profile assigment capability
    # TODO: Once pyhton 3.11 is used, use the following: Group multiple exceptions (as it is
    # possible multiple exceptions at once are true here):
    # https://www.geeksforgeeks.org/exception-groups-in-python/
    for etype in errors_on_types[network_check_type]:
        if get_potential_errors().have_issues_for(etype):
            get_potential_errors().convert_to_exception(etype, mesido_issue_type_gen_message(etype))
