from numpy import nan

from .electricity_base import ElectricityTwoPort
from .._internal import BaseAsset


class Transformer(ElectricityTwoPort, BaseAsset):
    """
    The electricity source component is used to generate electrical power and provide that to the
    network. As we set the equality constraint on the demand side we do not have to set any
    constraint at the source side.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "transformer"
        self.meret_place = 1

        self.price = nan

        self.min_voltage = nan

        self.power_nominal = nan

        self.add_equation(
            ((self.ElectricityIn.Power - self.ElectricityOut.Power) / self.power_nominal)
        )
