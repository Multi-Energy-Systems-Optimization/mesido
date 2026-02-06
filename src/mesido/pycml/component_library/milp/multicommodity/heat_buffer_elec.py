from mesido.pycml import Variable
from mesido.pycml.component_library.milp.electricity.electricity_base import ElectricityPort
from mesido.pycml.component_library.milp.heat.heat_buffer import HeatBufferModel
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class HeatBufferElec(HeatBufferModel):
    """
    The heat buffer component models heat storage in a tank. This component also incorporates the
    ability to use electricity for charging this component. Like all heat storage components,
    it loses heat to the surroundings, however here also an efficiency for the conversion of
    electricity to heat is incorporated. Since this way of charging heat does not require water
    flow through the inlet/outlet pipes, a separate variable is created to define the additional
    heat charged.

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
        self.id_mapping_carrier = -1
        #
        # # Assumption: heat in/out is nonnegative
        self.add_variable(ElectricityPort, "ElectricityIn")
        self.add_variable(Variable, "Power_elec", min=0.0, nominal=self.elec_power_nominal)
        self.add_variable(Variable, "Heat_elec_charging", min=0.0, nominal=self.elec_power_nominal)
        #
        self.add_equation(((self.ElectricityIn.Power - self.Power_elec) / self.elec_power_nominal))
        #
        self.add_equation(
            (
                (self.Power_elec * self.charging_efficiency - self.Heat_elec_charging)
                / self.elec_power_nominal
            )
        )

        # Buffer is charged by heat flow from heat network and electricity component of the asset
        self.add_equation(
            (self.Heat_flow + self.Heat_elec_charging - self.Heat_buffer) / self.Heat_nominal
        )

        # Note: If this type of buffer should be charged only by electricity component,
        # we should set minimum Heat_flow to 0  (self.Heat_flow.min = 0.0)
