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

        self.efficiency = nan

        self.component_subtype = "heat_source_gas"
