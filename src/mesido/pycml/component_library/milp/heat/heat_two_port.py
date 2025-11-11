from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal import HeatComponent
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

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

        self.Q_nominal = 1.0
        self.T_supply = nan
        self.T_return = nan
        self.T_supply_id = -1
        self.T_return_id = -1
        self.dT = self.T_supply - self.T_return
        self.cp = 4200.0
        self.rho = 988.0
        self.nominal_pressure = 16.0e5

        self.add_variable(HeatPort, "HeatIn")
        self.add_variable(HeatPort, "HeatOut")

        self.add_variable(Variable, "Q", nominal=self.Q_nominal)

        self.add_equation(self.HeatIn.Q - self.Q)
        self.add_equation(self.HeatIn.Q - self.HeatOut.Q)

        self.add_variable(Variable, "dH")
        self.add_equation(self.dH - (self.HeatOut.H - self.HeatIn.H))
