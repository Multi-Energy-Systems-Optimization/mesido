from mesido.pycml import Variable
from mesido.pycml.component_library.milp import ElectricitySource, GasDemand
from mesido.pycml.component_library.milp.electricity.electricity_base import ElectricityPort
from mesido.pycml.component_library.milp.gas.gas_base import GasPort
from mesido.pycml.component_library.milp.heat.heat_source import HeatSource
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class CoGeneration(HeatSource, ElectricitySource, GasDemand):
    """
    The co-generation component models a unit with heat and electricity output and optionally a
    gaseous input. This can be the basis for a CHP or fuelcell asset model.

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

        self.component_subtype = "co_generation" #should become component_type, but then
        # financialmixin and asset_sizing_mixin also need to be updated.
        self.efficiency = nan
        self.HERatio = nan
        self.energy_content = nan
        self.incude_gas_in_port = True

        self.add_equation((self.Heat_source - self.HERatio * self.Electricity_source) / self.Heat_nominal)

        self.add_equation(
            (
                self.Gas_demand_mass_flow / 1000.0 * self.energy_content * self.efficiency
                - self.Heat_source
                - self.Electricity_source
            )
            / self.Heat_nominal
        )
