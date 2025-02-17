from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .gas_base import GasPort
from .._internal import BaseAsset
from .._internal.gas_component import GasComponent


@add_variables_documentation_automatically
class GasSource(GasComponent, BaseAsset):
    """
    A gas source generates gas flow for the network.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "gas_source"

        self.min_head = 30.0

        self.density = 2.5e3

        self.Q_nominal = nan

        self.add_variable(GasPort, "GasOut")
        self.add_variable(Variable, "Gas_source_mass_flow", min=0.0)

        self.add_equation(
            ((self.GasOut.mass_flow - self.Gas_source_mass_flow) / (self.Q_nominal * self.density))
        )

        self.add_equation(((self.GasOut.Q - self.GasOut.mass_flow / self.density) / self.Q_nominal))
