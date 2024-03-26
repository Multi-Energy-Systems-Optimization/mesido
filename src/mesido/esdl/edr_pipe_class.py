from dataclasses import dataclass

from mesido.esdl.asset_to_component_base import _AssetToComponentBase
from mesido.pipe_class import GasPipeClass, PipeClass


@dataclass(frozen=True)
class EDRPipeClass(PipeClass):
    """
    Dataclass specifically to save the EDR pipe class information in. Note that we here utilize the
    edr information for:

    diameter: inner diameter in meter
    u_1, u_2: insulative properties [W/(m*K)]
    investment cost: investment cost coefficient in Eur/m
    """

    xml_string: str

    @classmethod
    def from_edr_class(cls, name: str, edr_class_name: str, maximum_velocity: float):
        """
        This function creates an EDR pipe object of the specified edr class.

        Parameters
        ----------
        name : The name assigned to the specific pipe class
        edr_class_name : The name of the pipe class in the edr
        maximum_velocity : The maximum velocity in m/s

        Returns
        -------
        The EDR pipe class
        """
        if not hasattr(EDRPipeClass, "._edr_pipes"):
            # TODO: Currently using private API of RTC-Tools Heat Network.
            # Make this functionality part of public API?
            EDRPipeClass._edr_pipes = _AssetToComponentBase()._edr_pipes

        edr_class = EDRPipeClass._edr_pipes[edr_class_name]
        diameter = edr_class["inner_diameter"]
        u_1 = edr_class["u_1"]
        u_2 = edr_class["u_2"]
        investment_costs = edr_class["investment_costs"]
        xml_string = edr_class["xml_string"]

        # TODO: utilize max velocity from the edr data as well?
        return EDRPipeClass(
            name, diameter, maximum_velocity, (u_1, u_2), investment_costs, xml_string
        )


@dataclass(frozen=True)
class EDRGasPipeClass(GasPipeClass):
    """
    Dataclass specifically to save the EDR pipe class information in. Note that we here utilize the
    edr information for:

    diameter: inner diameter in meter
    u_1, u_2: insulative properties [W/(m*K)]
    investment cost: investment cost coefficient in Eur/m
    """

    xml_string: str

    @classmethod
    def from_edr_class(cls, name: str, edr_class_name: str, maximum_velocity: float):
        """
        This function creates an EDR pipe object of the specified edr class.

        Parameters
        ----------
        name : The name assigned to the specific pipe class
        edr_class_name : The name of the pipe class in the edr
        maximum_velocity : The maximum velocity in m/s

        Returns
        -------
        The EDR pipe class
        """
        if not hasattr(EDRPipeClass, "._edr_pipes"):
            # TODO: Currently using private API of RTC-Tools Heat Network.
            # Make this functionality part of public API?
            EDRPipeClass._edr_pipes = _AssetToComponentBase()._edr_pipes

        edr_class = EDRPipeClass._edr_pipes[edr_class_name]
        diameter = edr_class["inner_diameter"]
        investment_costs = edr_class["investment_costs"]
        xml_string = edr_class["xml_string"]

        # TODO: utilize max velocity from the edr data as well?
        return EDRGasPipeClass(name, diameter, maximum_velocity, investment_costs, xml_string)
