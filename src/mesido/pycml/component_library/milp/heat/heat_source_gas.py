from mesido.pycml import Variable
from mesido.pycml.component_library.milp.heat.heat_source import HeatSource
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class HeatSourceGas(HeatSource):
    """
    The heat source gas component represents the operational behavior of gas boilers.
    It functions as a heat source that supplies thermal energy to the connected heat network.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(
            name,
            **modifiers,
        )
        self.component_subtype = "heat_source_gas"
        self.efficiency = nan
        self.density = nan  # Gas density [g/m3] at 8 bar
        self.density_normal = nan  # gas density [g/m3] in normal condition
        self.energy_content = nan  # Gas energy content [J/kg]  at 8 bar
        self.Q_nominal_gas = nan

        self.add_variable(
            Variable, "Gas_demand_mass_flow", min=0.0, nominal=self.Q_nominal_gas * self.density
        )  # [g/s]
        self.add_variable(
            Variable, "Gas_demand_volumetric_flow_normal", min=0.0, nominal=self.Q_nominal_gas
        )  # [m3/s]

        # Heat_source [J/s] = mass_flow [g/s] / 1000 [g/kg] * energy_content [J/kg] * efficiency [-]
        self.add_equation(
            (
                (
                    self.Gas_demand_mass_flow / 1000.0 * self.energy_content * self.efficiency
                    - self.Heat_source
                )
                / self.Heat_nominal
            )
        )
