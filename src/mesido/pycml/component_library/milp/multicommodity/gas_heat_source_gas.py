from mesido.pycml import Variable
from mesido.pycml.component_library.milp.gas.gas_base import GasPort
from mesido.pycml.component_library.milp.heat.heat_source_gas import HeatSourceGas
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class GasHeatSourceGas(HeatSourceGas):
    """
    The gas heat source gas component is used to model the source behaviour of gas boilers
    with gas input port. It functions as a heat source gas that supplies thermal energy
    to the connected heat network. Besides, it models the gas consumed by the asset.

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
        self.component_subtype = "gas_heat_source_gas"

        self.Q_nominal_gas = nan

        self.energy_content = nan  # [J/kg]
        self.density = 2.5e3  # H2 density [g/m3] at 30bar

        self.id_mapping_carrier = -1

        # Assumption: heat in/out and added is nonnegative
        # Heat in the return (i.e. cold) line is zero
        self.add_variable(GasPort, "GasIn")
        self.add_variable(
            Variable, "Gas_demand_mass_flow", min=0.0, nominal=self.Q_nominal_gas * self.density
        )  # [g/s]

        self.add_equation(
            (
                (self.GasIn.mass_flow - self.Gas_demand_mass_flow)
                / (self.Q_nominal_gas * self.density)
            )
        )

        # Heat_source [J/s] = mass_flow [g/s] / 1000 [g/kg] * energy_content [J/kg] * efficiency [-]
        self.add_equation(
            (
                (
                    self.GasIn.mass_flow / 1000.0 * self.energy_content * self.efficiency
                    - self.Heat_source
                )
                / self.Heat_nominal
            )
        )
