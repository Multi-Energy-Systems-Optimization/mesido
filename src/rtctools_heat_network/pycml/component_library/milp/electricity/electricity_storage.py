from numpy import nan

from rtctools_heat_network.pycml import Variable
from rtctools_heat_network.pycml.component_library.milp._internal import BaseAsset

from .electricity_base import ElectricityPort
from .._internal import BaseAsset
from .._internal.electricity_component import ElectricityComponent


class ElectricityStorage(ElectricityComponent, BaseAsset):
    """
    ...
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "electricity_storage"

        self.add_variable(ElectricityPort, "ElectricityIn")
        self.add_variable(Variable, "Stored_electricity", nominal=self.Q_nominal * self.density)

        self._typical_fill_time = 3600.0
        self._nominal_stored_electricity = (
            self.EIn * self._typical_fill_time
        )
        self.add_variable(
            Variable,
            "Stored_electricity",
            min=0.0,
            max=self.max_stored_electricity,
            nominal=self._nominal_stored_electricity,
        )

        self.add_equation(
            ((self.der(self.Stored_electricity) - self.ElectricityIn.Power)
             / self.elec_power_nominal)
        )

        self.add_initial_equation((self.Stored_electricity / self._nominal_stored_electricity))
