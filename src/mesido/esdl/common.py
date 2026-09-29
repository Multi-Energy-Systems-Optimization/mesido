from dataclasses import dataclass


@dataclass
class Asset:
    """
    Dataclass for an asset containing the information from the esdl objects.

    asset_type: string for the esdl asset type.
    id: str of the esdl id of the asset.
    in_ports: by default none, otherwise list of ports.
    out_ports: by default none, otherwise list of ports.
    attributes: dict of all the specified attributes of the esdl asset.
    global_properties: all the global properties specified in the esdl like the carriers.
    """

    asset_type: str
    id: str
    name: str
    in_ports: None
    out_ports: None
    attributes: dict
    global_properties: dict
