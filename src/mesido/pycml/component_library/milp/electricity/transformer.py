from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .electricity_base import ElectricityTwoPort
from .._internal import BaseAsset


@add_variables_documentation_automatically
class Transformer(ElectricityTwoPort, BaseAsset):
    """
    The transformer component is used to change the voltage level of the network whilst conserving
    the power.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "transformer"
        self.meret_place = 1

        self.price = nan

        self.min_voltage = nan

        self.power_nominal = nan

        self.add_equation(
            ((self.ElectricityIn.Power - self.ElectricityOut.Power) / self.power_nominal)
        )
