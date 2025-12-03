from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal.heat_component import BaseAsset
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from .heat_two_port import HeatTwoPort


@add_variables_documentation_automatically
class _StorageComponent(HeatTwoPort, BaseAsset):
    """
    A storage component is an asset type that does have states that have interdependent
    time-steps, it does have time-varying states like Heat_flow. In the StorageComponent we
    define most of the properties and variables being utilized by all storage components,
    like heat_nominal (property), heat_flow (variable).

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.minimum_pressure_drop = 1.0e5  # 1 bar of pressure drop
        self.pump_efficiency = 0.5

        self.Heat_nominal = self.cp * self.rho * self.dT * self.Q_nominal

        self.HeatIn.Heat.nominal = self.Heat_nominal
        self.HeatOut.Heat.nominal = self.Heat_nominal

        self.add_variable(Variable, "Heat_flow", nominal=self.Heat_nominal)

        self.add_variable(
            Variable, "Pump_power", min=0.0, nominal=self.Q_nominal * self.nominal_pressure
        )

        self.add_equation(
            (self.Heat_flow - (self.HeatIn.Heat - self.HeatOut.Heat)) / self.Heat_nominal
        )
