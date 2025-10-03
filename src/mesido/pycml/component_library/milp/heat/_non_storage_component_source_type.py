from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from ._non_storage_component import _NonStorageComponent


@add_variables_documentation_automatically
class _NonStorageComponentSourceType(_NonStorageComponent):
    """
    A non storage component is an asset type that does not have states that have interdependent
    time-steps, it does have time-varying states like Heat_flow. In the NonStorageComponent we
    define most of the properties being utilized by all components, like rho and cp.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        # dH is positive as it is assumed that the head is added by a pump at sources.
        self.dH.min = 0.0

        self.add_variable(
            Variable, "Pump_power", min=0.0, nominal=self.Q_nominal * self.nominal_pressure
        )

        self.add_equation(
            (self.Pump_power - (self.HeatOut.Hydraulic_power - self.HeatIn.Hydraulic_power))
            / (self.Q_nominal * self.nominal_pressure)
        )
