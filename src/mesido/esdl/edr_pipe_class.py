from dataclasses import dataclass
from typing import Self

from mesido.esdl.asset_to_component_base import _AssetToComponentBase
from mesido.pipe_class import GasPipeClass, PipeClass

from pyecore.ecore import EEnumLiteral

# The EDR costs are for trace pipes, so we need to halve the cost for a single pipe.
TRACE_TO_SINGLE_PIPE_COST_FACTOR = 0.5


@dataclass(frozen=True)
class EDRPipeClass(PipeClass):
    """
    Dataclass specifically to save the EDR pipe class information in. Note that we here utilize the
    edr information for:

    name: diameter name as a string, e.g. "DN150"
    diameter_enum: pipe DN size as an esdl.PipeDiameterEnum literal
    inner_diameter: inner diameter in meter
    maximum_velocity: maximum velocity in m/s
    u_1, u_2: insulative properties [W/(m*K)]
    investment cost: investment cost coefficient in Eur/m
    xml_string: The XML string representation of the EDR pipe class
    """

    diameter_enum: EEnumLiteral  # esdl.PipeDiameterEnum literal, e.g. esdl.PipeDiameterEnum.DN150
    xml_string: str

    @property
    def dn_size(self) -> float:
        """Return the nominal DN size as a float, e.g. 150.0 for DN150."""
        return float(self.diameter_enum.name[2:])

    @classmethod
    def from_edr_class(
        cls, diameter_enum: EEnumLiteral, edr_class_name: str, maximum_velocity: float
    ) -> Self:
        """
        This function creates an EDR pipe object of the specified edr class.

        Parameters
        ----------
        diameter_enum : EEnumLiteral of esdl.PipeDiameterEnum (e.g. esdl.PipeDiameterEnum.DN150)
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
        inner_diameter = edr_class["inner_diameter"]
        u_1 = edr_class["u_1"]
        u_2 = edr_class["u_2"]
        # Cost is halved because the EDR costs are for trace pipes
        investment_cost_single_pipe = (
            edr_class["investment_costs"] * TRACE_TO_SINGLE_PIPE_COST_FACTOR
        )
        xml_string = edr_class["xml_string"]

        # TODO: utilize max velocity from the edr data as well?
        return EDRPipeClass(
            diameter_enum.name,
            inner_diameter,
            maximum_velocity,
            (u_1, u_2),
            investment_cost_single_pipe,
            diameter_enum,
            xml_string,
        )


@dataclass(frozen=True)
class EDRGasPipeClass(GasPipeClass):
    """
    Dataclass specifically to save the EDR pipe class information in. Note that we here utilize the
    edr information for:

    name: diameter name as a string, e.g. "DN150"
    diameter_enum: pipe DN size as an esdl.PipeDiameterEnum literal
    inner_diameter: inner diameter in meter
    maximum_velocity: maximum velocity in m/s
    u_1, u_2: insulative properties [W/(m*K)]
    investment cost: investment cost coefficient in Eur/m
    xml_string: The XML string representation of the EDR pipe class
    """

    diameter_enum: EEnumLiteral  # esdl.PipeDiameterEnum literal, e.g. esdl.PipeDiameterEnum.DN150
    xml_string: str

    @property
    def dn_size(self) -> float:
        """Return the nominal DN size as a float, e.g. 150.0 for DN150."""
        return float(self.diameter_enum.name[2:])

    @classmethod
    def from_edr_class(
        cls, diameter_enum: EEnumLiteral, edr_class_name: str, maximum_velocity: float
    ):
        """
        This function creates an EDR pipe object of the specified edr class.

        Parameters
        ----------
        diameter_enum : EEnumLiteral of esdl.PipeDiameterEnum (e.g. esdl.PipeDiameterEnum.DN150)
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
        inner_diameter = edr_class["inner_diameter"]
        investment_costs = edr_class["investment_costs"]
        xml_string = edr_class["xml_string"]

        # TODO: utilize max velocity from the edr data as well?
        return EDRGasPipeClass(
            diameter_enum.name,
            inner_diameter,
            maximum_velocity,
            investment_costs,
            diameter_enum,
            xml_string,
        )
