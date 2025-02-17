from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal import BaseAsset
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .gas_base import GasPort
from .._internal.gas_component import GasComponent


@add_variables_documentation_automatically
class GasTankStorage(GasComponent, BaseAsset):
    """
    A gas tank storages can storage gas from the network, thereby allowing both charging and
    discharging, thus both flow directions.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "gas_tank_storage"

        self.min_head = 30.0
        self.density = 2.5e3  # H2 density [g/m3] at 30bar
        self.density_max_storage = 23.715e3  # H2 density [g/m3] at 350bar
        self.volume = nan
        self.Q_nominal = nan

        self.add_variable(GasPort, "GasIn")
        self.add_variable(Variable, "Gas_tank_flow", nominal=self.Q_nominal * self.density)

        self._typical_fill_time = 3600.0
        self._nominal_stored_gas = (
            self.Q_nominal * self.density_max_storage * self._typical_fill_time
        )
        self.add_variable(
            Variable,
            "Stored_gas_mass",
            min=0.0,
            max=self.density_max_storage * self.volume,
            nominal=self._nominal_stored_gas,
        )

        self.add_equation(
            ((self.GasIn.mass_flow - self.Gas_tank_flow) / (self.Q_nominal * self.density))
        )

        self.add_equation(((self.GasIn.Q - self.GasIn.mass_flow / self.density) / self.Q_nominal))

        self.add_equation(
            (
                (self.der(self.Stored_gas_mass) - (self.Gas_tank_flow))
                / (self._nominal_stored_gas * self.Q_nominal * self.density) ** 0.5
            )
        )

        self.add_initial_equation((self.Stored_gas_mass / self._nominal_stored_gas))
