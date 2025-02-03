from mesido.pycml.component_library.milp._internal import HeatComponent
from mesido.pycml.pycml_mixin import add_names_automatically

from .heat_port import HeatPort


@add_names_automatically
class HeatTwoPort(HeatComponent):
    """
    The HeatTwoPort component is used as a base for interaction with one hydraulically coupled
    system. As heat networks are closed systems we always need two ports to model both the in and
    out going flow in the system.

    port = HeatIn or HeatOut

    Variables created:
        {add_names_here}

    Parameters:
        name : The name of the asset.
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(HeatPort, "HeatIn")
        self.add_variable(HeatPort, "HeatOut")
