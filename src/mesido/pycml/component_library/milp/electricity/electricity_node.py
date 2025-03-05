from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .electricity_base import ElectricityPort
from .._internal import BaseAsset
from .._internal.electricity_component import ElectricityComponent


@add_variables_documentation_automatically
class ElectricityNode(ElectricityComponent, BaseAsset):
    """
    The electricity node or bus is a component where we model multiple currents coming together,
    this is the only component where it is allowed that 3 or more currents come together. This means
    that a node is always connected to cables. We set constraints for equal voltage at all ports.
    Furthermore, we set constraints for conservation of power and current.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "electricity_node"

        self.voltage_nominal = nan

        self.n = 2
        assert self.n >= 2

        self.add_variable(ElectricityPort, "ElectricityConn", self.n)
        self.add_variable(Variable, "V", min=0.0, nominal=self.voltage_nominal)

        for i in range(1, self.n + 1):
            self.add_equation((self.ElectricityConn[i].V - self.V) / self.voltage_nominal)

        # Because the orientation of the connected cables are important to setup the energy
        # conservation, these constraints are added in the mixin.
