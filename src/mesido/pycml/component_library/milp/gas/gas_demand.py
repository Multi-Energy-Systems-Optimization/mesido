from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .gas_base import GasPort
from .._internal import BaseAsset
from .._internal.gas_component import GasComponent


@add_variables_documentation_automatically
class GasDemand(GasComponent, BaseAsset):
    """
    A gas demand consumes flow from the network.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "gas_demand"
        self.min_head = 30.0

        self.Q_nominal = nan

        self.density = 2.5e3  # H2 density [g/m3] at 30bar

        self.id_mapping_carrier = -1

        self.add_variable(GasPort, "GasIn")
        self.add_variable(
            Variable, "Gas_demand_mass_flow", min=0.0, nominal=self.Q_nominal * self.density
        )

        self.add_equation(
            ((self.GasIn.mass_flow - self.Gas_demand_mass_flow) / (self.Q_nominal * self.density))
        )

        self.add_equation(((self.GasIn.Q - self.GasIn.mass_flow / self.density) / self.Q_nominal))
