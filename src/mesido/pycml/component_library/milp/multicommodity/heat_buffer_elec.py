from mesido.pycml import Variable
from mesido.pycml.component_library.milp.electricity.electricity_base import ElectricityPort
from mesido.pycml.component_library.milp.heat.heat_buffer import _HeatBufferComponent
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class HeatBufferElec(_HeatBufferComponent):
    """
    The HeatBufferElec component represents a heat buffer that can be charged exclusively
    using electricity. This asset cannot be charged by water flow through the inlet/outlet pipes

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

        self.component_subtype = "heat_buffer_elec"
        self.elec_power_nominal = nan
        self.charging_efficiency = nan

        self.add_variable(ElectricityPort, "ElectricityIn")
        self.add_variable(Variable, "Power_elec", min=0.0, nominal=self.elec_power_nominal)
        self.add_variable(
            Variable,
            "Heat_elec_charging",
            min=0.0,
            max=2.0 * self.elec_power_nominal,
            nominal=self.elec_power_nominal,
        )
        #
        # Buffer can only discharge into heat network. It cannot be charged by heat network
        self.Heat_flow.max = 0.0
        #
        self.add_equation(((self.ElectricityIn.Power - self.Power_elec) / self.elec_power_nominal))
        #
        self.add_equation(
            (
                (self.Power_elec * self.charging_efficiency - self.Heat_elec_charging)
                / self.elec_power_nominal
            )
        )

        # Heat flow balance of the buffer
        self.add_equation(
            (self.Heat_flow + self.Heat_elec_charging - self.Heat_buffer) / self.Heat_nominal
        )
