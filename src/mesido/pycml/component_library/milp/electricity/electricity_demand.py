from mesido.pycml import Variable

from numpy import nan

from .electricity_base import ElectricityPort
from .._internal import BaseAsset
from .._internal.electricity_component import ElectricityComponent


class ElectricityDemand(ElectricityComponent, BaseAsset):
    """
    The electricity demand models consumption of electrical power. We set an equality constriant
    in to enforce the minimum voltage and the associated power at the demand. This allows us to
    overestimate the power losses in the rest of the network.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "electricity_demand"
        self.min_voltage = nan
        self.elec_power_nominal = nan
        self.id_mapping_carrier = -1

        self.add_variable(ElectricityPort, "ElectricityIn")
        self.add_variable(Variable, "Electricity_demand", min=0.0, nominal=self.elec_power_nominal)

        self.add_equation(
            ((self.ElectricityIn.Power - self.Electricity_demand) / self.elec_power_nominal)
        )
