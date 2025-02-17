from mesido.pycml.component_library.milp._internal import HeatComponent
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from .heat_port import HeatPort


@add_variables_documentation_automatically
class HeatTwoPort(HeatComponent):
    """
    The HeatTwoPort component is used as a base for interaction with one hydraulically coupled
    system. As heat networks are closed systems we always need two ports to model both the in and
    out going flow in the system.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(HeatPort, "HeatIn")
        self.add_variable(HeatPort, "HeatOut")
