from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .electricity_base import ElectricityPort
from .._internal import BaseAsset
from .._internal.electricity_component import ElectricityComponent


@add_variables_documentation_automatically
class ElectricityStorage(ElectricityComponent, BaseAsset):
    """
    The electricity storage component is used to store electrical power of a network.
    The change in stored electrical power should be equal to the electricity entering and leaving
    the component multiplied with its efficiency.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "electricity_storage"

        self.max_capacity = nan
        self.min_voltage = nan
        self.charge_efficiency = 1.0
        self.discharge_efficiency = 1.0

        self.add_variable(ElectricityPort, "ElectricityIn")

        self._typical_fill_time = 3600.0
        self._nominal_stored_electricity = self.ElectricityIn.Power.max * self._typical_fill_time
        self.add_variable(
            Variable,
            "Stored_electricity",
            min=0.0,
            max=self.max_capacity,
            nominal=self._nominal_stored_electricity,
        )
        self.add_variable(
            Variable,
            "Effective_power_charging",
            nominal=self.ElectricityIn.Power.nominal,
            max=self.ElectricityIn.Power.max,
        )

        self.add_equation(
            (
                (self.der(self.Stored_electricity) - self.Effective_power_charging)
                / self.ElectricityIn.Power.nominal
            )
        )
