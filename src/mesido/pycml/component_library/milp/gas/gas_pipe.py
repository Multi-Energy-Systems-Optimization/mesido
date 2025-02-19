from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan, pi

from .gas_base import GasTwoPort
from .._internal import BaseAsset


@add_variables_documentation_automatically
class GasPipe(GasTwoPort, BaseAsset):
    """
    The gas_pipe component is used to model head loss through the pipe. At the moment we only have
    a placeholder linear head loss formulation in place.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "gas_pipe"
        self.disconnectable = False

        self.v_max = 15.0
        self.density = 2.5e3  # [g/m3]
        self.rho = self.density
        self.diameter = nan
        self.area = 0.25 * pi * self.diameter**2
        self.Q_nominal = self.v_max / 2.0 * self.area
        self.pressure = 16.0e5
        self.id_mapping_carrier = -1

        self.nominal_head = 30.0
        self.length = nan
        self.r = 1.0e-6 * self.length  # TODO: temporary value
        self.nominal_head_loss = (self.Q_nominal * self.r * self.nominal_head) ** 0.5

        self.add_variable(Variable, "dH")
        self.add_variable(Variable, "Q", nominal=self.Q_nominal)

        # Flow should be preserved
        self.add_equation(((self.GasIn.Q - self.GasOut.Q) / self.Q_nominal))
        self.add_equation(((self.Q - self.GasOut.Q) / self.Q_nominal))
        self.add_equation(((self.GasIn.Q - self.GasIn.mass_flow / self.density) / self.Q_nominal))

        # Flow should be preserved
        self.add_equation(
            ((self.GasIn.mass_flow - self.GasOut.mass_flow) / (self.Q_nominal * self.density))
        )

        # Hydraulic power
        # TODO replace value
        # rho * ff * length * area / 2 / diameter * velocity**3
        self.add_variable(
            Variable, "Hydraulic_power", min=0.0, nominal=self.GasIn.Hydraulic_power.nominal
        )  # [W]

        self.add_equation(
            (self.Hydraulic_power - (self.GasIn.Hydraulic_power - self.GasOut.Hydraulic_power))
            / self.GasIn.Hydraulic_power.nominal
        )
