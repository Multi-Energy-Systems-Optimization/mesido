from mesido.pycml import Connector, Variable
from mesido.pycml.component_library.milp._internal import HeatComponent


class HeatPort(HeatComponent, Connector):
    """
    The HeatPort is used to model the variables at an in or outgoing port of a component. For the
    HeatMixin we model thermal Power (Heat [W]), flow (Q [m3/s]) and head (H [m]) at every port in
    the network.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(Variable, "Heat")
        self.add_variable(Variable, "Q")
        self.add_variable(Variable, "H")
        self.add_variable(Variable, "Hydraulic_power")
