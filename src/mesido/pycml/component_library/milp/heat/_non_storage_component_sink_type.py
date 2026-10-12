from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from ._non_storage_component import _NonStorageComponent


@add_variables_documentation_automatically
class _NonStorageComponentSinkType(_NonStorageComponent):
    """
    A non storage component is an asset type that does not have states that have interdependent
    time-steps, it does have time-varying states like Heat_flow. In the
    NonStorageSinkTypeComponent we add a limit on the headloss.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        if self.include_head_loss_variables:
            self.dH.max = 0.0

            self.Hydraulic_power_nominal = self.Q_nominal * self.nominal_pressure
            self.add_variable(
                Variable, "Hydraulic_power", min=0.0, nominal=self.Hydraulic_power_nominal
            )  # [W]

            self.add_equation(
                (
                    self.Hydraulic_power
                    - (self.HeatIn.Hydraulic_power - self.HeatOut.Hydraulic_power)
                )
                / (self.nominal_pressure * self.Q_nominal * self.Hydraulic_power_nominal) ** 0.5
            )
