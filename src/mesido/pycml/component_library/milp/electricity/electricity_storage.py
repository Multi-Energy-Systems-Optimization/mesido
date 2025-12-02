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
        self.add_variable(
            Variable,
            "Power_charging",
            min=0.0,
            max=self.ElectricityIn.Power.max,
            nominal=self.ElectricityIn.Power.nominal,
        )
        self.add_variable(
            Variable,
            "Power_discharging",
            min=0.0,
            max=self.ElectricityIn.Power.max,
            nominal=self.ElectricityIn.Power.nominal,
        )

        #Convex hull formulation is applied for the power charging and discharging. As long as
        # the efficiencies during charging and discharging are less than 1 and no negative prices
        # are applied, no binary variables are needed to describe whether the battery is in
        # charging or discharging mode.
        self.add_equation(
            (
                (self.ElectricityIn.Power - (self.Power_charging-self.Power_discharging))
                / self.ElectricityIn.Power.nominal
            )
        )

        self.add_equation(
            (
                (self.Effective_power_charging - self.charge_efficiency * self.Power_charging +
                 1/self.discharge_efficiency * self.Power_discharging
                )
                / self.ElectricityIn.Power.nominal
            )
        )

        self.add_equation(
            (
                (self.der(self.Stored_electricity) - self.Effective_power_charging)
                / self.ElectricityIn.Power.nominal
            )
        )


        #For current situation not required, but the battery could be split up in multiple
        # segments that each individually have their power charging and discharging and when
        # summed up are equal to current variables.