from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal import BaseAsset
from mesido.pycml.component_library.milp._internal.electricity_component import (
    ElectricityComponent,
)
from mesido.pycml.component_library.milp.electricity.electricity_base import (
    ElectricityPort,
)
from mesido.pycml.component_library.milp.gas.gas_base import (
    GasPort,
)
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class Electrolyzer(ElectricityComponent, BaseAsset):
    """
    An electrolyzer consumes electricity and produces hydrogen.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(
            name,
            **self.merge_modifiers(
                dict(),
                modifiers,
            ),
        )

        self.component_type = "electrolyzer"

        self.a_eff_coefficient = nan
        self.b_eff_coefficient = nan
        self.c_eff_coefficient = nan

        self.minimum_load = nan

        self.density = 2.5  # H2 density [kg/m3] at 30bar

        self.Q_nominal = nan
        self.min_voltage = nan

        self.efficiency = nan

        self.nominal_gass_mass_out = self.Q_nominal * self.density
        self.nominal_power_consumed = nan

        self.add_variable(ElectricityPort, "ElectricityIn")  # [W]
        self.add_variable(Variable, "Power_consumed", min=0.0, nominal=self.nominal_power_consumed)
        self.add_equation(
            (self.ElectricityIn.Power - self.Power_consumed) / self.nominal_power_consumed
        )  # [W]

        self.add_variable(GasPort, "GasOut")
        self.add_variable(
            Variable, "Gas_mass_flow_out", min=0.0, nominal=self.nominal_gass_mass_out
        )  # [g/s]
        self.add_equation(
            (self.GasOut.mass_flow - self.Gas_mass_flow_out) / self.nominal_gass_mass_out
        )
