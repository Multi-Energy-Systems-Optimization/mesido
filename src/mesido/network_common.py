from enum import Enum

from strenum import StrEnum


class NetworkSettings(StrEnum):
    """
    Enumeration for network settings.
    """

    NETWORK_TYPE_GAS = "Gas"  # Natural gas
    NETWORK_TYPE_HYDROGEN = "Hydrogen"
    NETWORK_TYPE_HEAT = "Heat"
    NETWORK_TYPE_ELECTRICITY = "Electricity"

    NETWORK_COMPOSITION_GAS = (
        "methane[0.813]&ethane[0.0285]&propane[0.0037]&butane[0.0014]"
        "&n-Pentane[0.0004]&n-Hexane[0.0005]&nitrogen[0.1435]&CO2[0.0089]"
        "&oxygen[0.0001]"
    )  # Natural gas Groningen


# Asset error type that can occur
class MesidoAssetIssueType(Enum):
    HEAT_DEMAND_POWER = "heat_demand.power"
    COLD_DEMAND_POWER = "cold_demand.power"
    HEAT_DEMAND_TYPE = "heat_demand.type"
