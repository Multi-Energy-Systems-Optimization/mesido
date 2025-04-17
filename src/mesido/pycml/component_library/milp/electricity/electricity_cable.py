from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .electricity_base import ElectricityTwoPort
from .._internal import BaseAsset


@add_variables_documentation_automatically
class ElectricityCable(ElectricityTwoPort, BaseAsset):
    """
    The electricity cable component is used to model voltage and power drops in the electricity
    lines. We model the power losses by over estimating them with the maximum current. We ensure
    that the power is always less than what the current is able to carry by an equality constraint
    at the demand where we enforce the minimum voltage.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "electricity_cable"
        self.disconnectable = False

        self.length = 1.0

        # Powerloss with inequality in the milp-mixin
        # values for NAYY 4x50 SE
        # from: https://pandapower.readthedocs.io/en/v2.6.0/std_types/basic.html
        self.max_current = nan
        self.min_voltage = nan
        self.max_voltage = self.min_voltage * 2.0
        self.nominal_current = nan
        self.nominal_voltage = nan
        self.r = nan
        self.nominal_voltage_loss = (self.nominal_current * self.r * self.nominal_voltage) ** 0.5
        self.power_loss_nominal = self.r * self.max_current * self.nominal_current
        # We accept lower accuracy in the loss computation to improve scaling in case the nominals
        # are very far apart. Typically, when a short cable has a very high max capacity.
        if self.power_loss_nominal / self.ElectricityIn.Power.nominal < 1.0e-4:
            self.power_loss_nominal = self.ElectricityIn.Power.nominal * 1.0e-4
        self.add_variable(Variable, "Power_loss", min=0.0, nominal=self.power_loss_nominal)
        self.add_variable(Variable, "I", nominal=self.nominal_current)
        self.add_variable(Variable, "V_loss", nominal=self.nominal_voltage_loss)

        # TODO: if one wants to include the option for cable_voltage_losses to be false as with
        #  cable_power_losses, then the next equation and V_loss variable instantiation should move
        #  to electricity_physics_mixin, to ensure proper scaling.
        self.add_equation(
            (
                (self.ElectricityOut.V - (self.ElectricityIn.V - self.V_loss))
                / self.nominal_voltage_loss
            )
        )
        self.add_equation(((self.ElectricityIn.I - self.ElectricityOut.I) / self.nominal_current))
        self.add_equation(((self.ElectricityIn.I - self.I) / self.nominal_current))
        self.add_equation(
            (
                (self.ElectricityOut.Power - (self.ElectricityIn.Power - self.Power_loss))
                / (self.ElectricityIn.Power.nominal * self.Power_loss.nominal) ** 0.5
            )
        )
