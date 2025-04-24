from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .electricity_base import ElectricityPort
from .._internal import BaseAsset
from .._internal.electricity_component import ElectricityComponent


@add_variables_documentation_automatically
class ElectricitySource(ElectricityComponent, BaseAsset):
    """
    The electricity source component is used to generate electrical power and provide that to the
    network. As we set the equality constraint on the demand side we do not have to set any
    constraint at the source side.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "electricity_source"
        self.meret_place = 1

        self.price = nan

        self.power_nominal = nan

        self.add_variable(ElectricityPort, "ElectricityOut")  # [W]
        self.add_variable(
            Variable, "Electricity_source", min=0.0, nominal=self.power_nominal
        )  # [W]

        self.add_equation(
            ((self.ElectricityOut.Power - self.Electricity_source) / self.power_nominal)
        )
