from mesido.pycml.component_library.milp._internal import HeatComponent

from .heat_port import HeatPort


class HeatTwoPort(HeatComponent):
    """
    The HeatTwoPort component is used as a base for interaction with one hydraulically coupled
    system. As heat networks are closed systems we always need two ports to model both the in and
    out going flow in the system.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(HeatPort, "HeatIn")
        self.add_variable(HeatPort, "HeatOut")
