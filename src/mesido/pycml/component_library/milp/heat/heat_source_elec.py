from mesido.pycml import Variable
from mesido.pycml.component_library.milp.heat.heat_source import HeatSource
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class HeatSourceElec(HeatSource):
    """
    The heat source elec component represents the operational behavior of e-boilers.
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
        self.elec_power_nominal = nan
        self.component_subtype = "heat_source_elec"

        self.add_variable(Variable, "Power_consumed", min=0.0, nominal=self.elec_power_nominal)

        self.add_equation(
            ((self.Power_consumed * self.efficiency - self.Heat_source) / self.Heat_nominal)
        )
