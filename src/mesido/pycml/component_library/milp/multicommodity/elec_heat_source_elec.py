from mesido.pycml import Variable
from mesido.pycml.component_library.milp.electricity.electricity_base import ElectricityPort
from mesido.pycml.component_library.milp.heat.heat_source_elec import HeatSourceElec
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class ElecHeatSourceElec(HeatSourceElec):
    """
    The elec heat source elec component is used to model the source behaviour of e-boilers
    with electricity input port. It functions as a heat source gas that supplies thermal energy
    to the connected heat network. Besides, it models the electricity consumed by the asset.

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

        self.component_subtype = "elec_heat_source_elec"

        self.id_mapping_carrier = -1

        self.min_voltage = nan
        self.elec_power_nominal = nan
        self.efficiency = nan

        # Assumption: heat in/out and added is nonnegative
        # Heat in the return (i.e. cold) line is zero
        self.add_variable(ElectricityPort, "ElectricityIn")
        self.add_variable(Variable, "Power_consumed", min=0.0, nominal=self.elec_power_nominal)

        self.add_equation(
            ((self.ElectricityIn.Power - self.Power_consumed) / self.elec_power_nominal)
        )

        self.add_equation(
            ((self.Power_consumed * self.efficiency - self.Heat_source) / self.Heat_nominal)
        )
