from mesido.pycml.component_library.milp import ElectricitySource, GasDemand
from mesido.pycml.component_library.milp.heat.heat_source import HeatSource
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class CoGeneration(HeatSource, ElectricitySource, GasDemand):
    """
    The component models coupled heat and electricity output with an optional gaseous input.
    ESDL CHP assets currently use this model; other co-generation technologies (FuelCell) or output
    combinations could be build on top of this asset or share the same basis.

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

        # TODO: Replace component_subtype with component_type after updating FinancialMixin and
        #  AssetSizingMixin.
        self.component_subtype = "co_generation"
        self.efficiency = nan
        self.HERatio = nan
        self.energy_content = nan
        self.include_gas_in_port = True

        self.add_equation(
            (self.Heat_source - self.HERatio * self.Electricity_source) / self.Heat_nominal
        )

        self.add_equation(
            (
                self.Gas_demand_mass_flow / 1000.0 * self.energy_content * self.efficiency
                - self.Heat_source
                - self.Electricity_source
            )
            / self.Heat_nominal
        )
