from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal.heat_component import BaseAsset
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .heat_two_port import HeatTwoPort


@add_variables_documentation_automatically
class _StorageComponent(HeatTwoPort, BaseAsset):
    """
    A storage component is an asset type that does have states that have interdependent
    time-steps, it does have time-varying states like Heat_flow. In the StorageComponent we
    define most of the properties being utilized by all storage components, like rho and cp.

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
        self.Heat_nominal = self.cp * self.rho * self.dT * self.Q_nominal
        self.nominal_pressure = 16.0e5
        self.minimum_pressure_drop = 1.0e5  # 1 bar of pressure drop
        self.pump_efficiency = 0.5

        self.HeatIn.Heat.nominal = self.Heat_nominal
        self.HeatOut.Heat.nominal = self.Heat_nominal

        self.add_variable(Variable, "Q", nominal=self.Q_nominal)

        self.add_variable(Variable, "Heat_flow", nominal=self.Heat_nominal)

        self.add_equation(self.HeatIn.Q - self.Q)
        self.add_equation(self.HeatIn.Q - self.HeatOut.Q)

        self.add_variable(Variable, "dH")
        self.add_equation(self.dH - (self.HeatOut.H - self.HeatIn.H))

        self.add_variable(
            Variable, "Pump_power", min=0.0, nominal=self.Q_nominal * self.nominal_pressure
        )

        self.add_equation(
            (self.Heat_flow - (self.HeatIn.Heat - self.HeatOut.Heat)) / self.Heat_nominal
        )
