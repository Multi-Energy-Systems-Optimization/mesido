from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from ._non_storage_component import _NonStorageComponent


@add_variables_documentation_automatically
class Pump(_NonStorageComponent):
    """
    The pump component is there to add head to the flow. We assume head can only be added for
    positive flow.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.temperature = nan
        self.carrier_id = -1

        self.component_type = "pump"

        self.pump_efficiency = 0.5

        self.add_variable(Variable, "dH", min=0.0)
        self.add_variable(
            Variable, "Pump_power", min=0.0, nominal=self.Q_nominal * self.nominal_pressure
        )

        self.add_equation(self.dH - (self.HeatOut.H - self.HeatIn.H))

        self.add_equation(
            (self.Pump_power - (self.HeatOut.Hydraulic_power - self.HeatIn.Hydraulic_power))
            / (self.Q_nominal * self.nominal_pressure)
        )

        self.add_equation((self.HeatIn.Heat - self.HeatOut.Heat) / self.Heat_nominal)
