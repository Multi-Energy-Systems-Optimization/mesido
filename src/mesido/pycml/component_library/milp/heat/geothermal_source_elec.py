from mesido.pycml.component_library.milp.electricity.electricity_base import ElectricityPort
from mesido.pycml.component_library.milp.heat.geothermal_source import GeothermalSource
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class GeothermalSourceElec(GeothermalSource):
    """
    The geothermal source electric asset is almost identical to the geothermal source one. The
    only difference is that this one includes an electricity in port. The electricity power
    calculation that it inherits from the geothermal source asset needs to be satisfied by an
    electricity carrier supplied through this new in port.

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

        self.component_subtype = "geothermal_source_elec"
        self.id_mapping_carrier = -1
        self.min_voltage = nan

        self.add_variable(ElectricityPort, "ElectricityIn")

        self.add_equation(((self.ElectricityIn.Power - self.Power_elec) / self.elec_power_nominal))
