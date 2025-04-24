from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from .gas_base import GasPort
from .._internal import BaseAsset
from .._internal.gas_component import GasComponent


@add_variables_documentation_automatically
class GasNode(GasComponent, BaseAsset):
    """
    The gas node is a component where we model multiple flows coming together,
    this is the only component where it is allowed that 3 or more flows come together. This means
    that a node is always connected to gas pipes. We set constraints for equal head at all ports.
    Furthermore, we set constraints for conservation of flow.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "gas_node"

        self.n = 2
        assert self.n >= 2

        self.add_variable(GasPort, "GasConn", self.n)
        self.add_variable(Variable, "H", min=0.0)

        for i in range(1, self.n + 1):
            self.add_equation(self.GasConn[i].H - self.H)

        # Because the orientation of the connected pipes are important to setup the mass
        # conservation, these constraints are added in the mixin.
