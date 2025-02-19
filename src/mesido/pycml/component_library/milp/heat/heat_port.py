from mesido.pycml import Connector, Variable
from mesido.pycml.component_library.milp._internal import HeatComponent
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically


@add_variables_documentation_automatically
class HeatPort(HeatComponent, Connector):
    """
    The HeatPort is used to model the variables at an in or outgoing port of a component. For the
    HeatMixin we model thermal Power (Heat [W]), flow (Q [m3/s]) and head (H [m]) at every port in
    the network.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(Variable, "Heat")
        self.add_variable(Variable, "Q")
        self.add_variable(Variable, "H")
        self.add_variable(Variable, "Hydraulic_power")
