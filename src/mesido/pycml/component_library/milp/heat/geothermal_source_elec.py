from mesido.pycml import Variable
from mesido.pycml.component_library.milp.electricity.electricity_base import ElectricityPort
from mesido.pycml.component_library.milp.heat.geothermal_source import GeothermalSource
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class GeothermalSourceElec(GeothermalSource):
    """
    TODO: document

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

        self.elec_power_nominal = nan
        self.cop = modifiers["cop"]
        self.component_subtype = "geothermal_source_elec"
        self.id_mapping_carrier = -1
        self.min_voltage = nan

        self.add_variable(ElectricityPort, "ElectricityIn")
        self.add_variable(Variable, "Power_elec", min=0.0, nominal=self.elec_power_nominal)
        #self.add_variable(Variable, "Power_elec", min=0.0, nominal=10.0)

        self.add_equation(((self.ElectricityIn.Power - self.Power_elec) / self.elec_power_nominal))

        self.add_equation(((self.Power_elec * self.cop - self.Heat_source) / self.Heat_nominal))

        
