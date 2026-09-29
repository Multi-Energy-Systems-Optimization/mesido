from mesido.pycml import Variable
from mesido.pycml.component_library.milp.electricity.electricity_base import ElectricityPort
from mesido.pycml.component_library.milp.gas.gas_base import GasPort
from mesido.pycml.component_library.milp.heat.heat_source import HeatSource
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class CoGeneration(HeatSource):
    """
    The co-generation component models a CHP unit with heat and electricity output.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        self.include_gas_in_port = modifiers.get("include_gas_in_port", False)
        super().__init__(
            name,
            **modifiers,
        )

        self.component_type = "co_generation"
        self.efficiency = nan
        self.HERatio = nan
        self.electric_power_nominal = nan
        self.gas_mass_flow_nominal = nan
        self.energy_content = nan

        self.add_variable(ElectricityPort, "ElectricityOut")
        self.add_variable(Variable, "Electricity_source", min=0.0, nominal=self.electric_power_nominal)

        self.add_equation(
            (self.ElectricityOut.Power - self.Electricity_source) / self.electric_power_nominal
        )
        self.add_equation((self.Heat_source - self.HERatio * self.Electricity_source) / self.Heat_nominal)

        if self.include_gas_in_port:
            self.add_variable(GasPort, "GasIn")
            self.add_variable(
                Variable, "Gas_demand_mass_flow", min=0.0, nominal=self.gas_mass_flow_nominal
            )
            self.add_equation(
                (self.GasIn.mass_flow - self.Gas_demand_mass_flow) / self.gas_mass_flow_nominal
            )
            self.add_equation(
                (
                    self.Gas_demand_mass_flow / 1000.0 * self.energy_content * self.efficiency
                    - self.Heat_source
                    - self.Electricity_source
                )
                / self.Heat_nominal
            )
