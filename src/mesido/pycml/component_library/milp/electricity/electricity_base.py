from mesido.pycml import Connector, Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from .._internal.electricity_component import ElectricityComponent


@add_variables_documentation_automatically
class ElectricityPort(ElectricityComponent, Connector):
    """
    The electricity port is used to model the variables at a port where two assets are connected.
    For electricity networks we model the electrical power (P), the voltage (V) and the current (I).

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(Variable, "Power")
        self.add_variable(Variable, "I")
        self.add_variable(Variable, "V", min=0.0)


@add_variables_documentation_automatically
class ElectricityTwoPort(ElectricityComponent):
    """
    For electricity components that transport power we have a two port component to allow for
    electricity flow in and out of the component.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(ElectricityPort, "ElectricityIn")
        self.add_variable(ElectricityPort, "ElectricityOut")
