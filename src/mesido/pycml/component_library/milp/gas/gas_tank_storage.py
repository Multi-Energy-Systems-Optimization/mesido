from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal import BaseAsset

from numpy import nan

from .gas_base import GasPort
from .._internal.gas_component import GasComponent


class GasTankStorage(GasComponent, BaseAsset):
    """
    ...
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "gas_tank_storage"

        # TODO: currently the density value is hard constraint to the H2 value. As an idea, it might be interesting
        # TODO: to read this from an input file, or at least the gas stored in the tank.
        self.min_head = 30.0
        self.density = 2.5e3  # H2 density [g/m3] at 30bar
        self.density_max_storage = 23.715e3  # H2 density [g/m3] at 350bar
        self.T = 298 #K
        self.R = 8.314 #J/(molK)
        self.M = 2.016 #g/mol
        self.volume = nan
        self.Q_nominal = nan

        self.add_variable(GasPort, "GasIn")
        # TODO: ask if nominal value should be defined here or in esdl_heat_model
        self.add_variable(Variable, "Gas_tank_flow", nominal=self.Q_nominal * self.density)
        self.add_variable(Variable, "Gas_tank_pressure")

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

        # TODO: ask if this relation is correct. Density changed with pressure, so why not make it a variable?
        self.add_equation(((self.GasIn.Q - self.GasIn.mass_flow / self.density) / self.Q_nominal))

        self.add_equation(
            (
                (self.der(self.Stored_gas_mass) - (self.Gas_tank_flow))
                / (self._nominal_stored_gas * self.Q_nominal * self.density) ** 0.5
            )
        )

        self.add_equation(
            (self.Gas_tank_pressure - self.Stored_gas_mass*self.R*self.T/(self.M*self.volume))/self.Gas_tank_pressure.nominal
        )

        # self.add_initial_equation((self.Stored_gas_mass / self._nominal_stored_gas))
