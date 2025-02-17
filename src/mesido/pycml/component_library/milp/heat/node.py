from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal import BaseAsset, HeatComponent
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from .heat_port import HeatPort


@add_variables_documentation_automatically
class Node(HeatComponent, BaseAsset):
    """
    A node is the only component in the network that allows to model 3 or more flows to come
    together. This essentially means that only pipes can be connected to ports and that it models
    junctions where multiple pipes come together. The node ensures that the heat on all ports is
    equal. Furthermore, it ensures that discharge and heat are conserved for which constraints in
    the HeatMixin are set.

    port = HeatConn[i] (i is the index of the port)

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.

    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "node"

        self.n = 2
        assert self.n >= 2

        self.add_variable(HeatPort, "HeatConn", self.n)
        self.add_variable(Variable, "H")

        # Because the orientation of the connected pipes are important to
        # setup the heat conservation, these constraints are added in the
        # mixin.

        for i in range(1, self.n + 1):
            self.add_equation(self.HeatConn[i].H - self.H)
            # Q and Heat to be set in the mixin
