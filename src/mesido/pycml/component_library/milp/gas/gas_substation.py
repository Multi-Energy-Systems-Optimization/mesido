from numpy import nan

from .gas_base import GasTwoPort
from .._internal import BaseAsset


class GasSubstation(GasTwoPort, BaseAsset):
    """
    A gas substation that reduces the pressure level of the flow
    (basically pressure reducinng valve).
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "gas_substation"
        self.min_head = 30.0

        self.Q_nominal_in = nan
        self.Q_nominal_out = nan

        self.density_in = 2.5e3  # H2 density [g/m3] at 30bar
        self.density_out = 2.5e3  # H2 density [g/m3] at 30bar

        self.add_equation(
            (
                (self.GasIn.Q * self.density_in - self.GasOut.Q * self.density_out)
                / (self.Q_nominal_in * self.density_in * self.Q_nominal_out * self.density_out)
                ** 0.5
            )
        )

        self.add_equation(
            ((self.GasIn.Q - self.GasIn.mass_flow / self.density_in) / self.Q_nominal_in)
        )
        self.add_equation(
            ((self.GasOut.Q - self.GasOut.mass_flow / self.density_out) / self.Q_nominal_out)
        )
