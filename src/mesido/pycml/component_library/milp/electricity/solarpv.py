from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from .. import ElectricitySource


@add_variables_documentation_automatically
class SolarPV(ElectricitySource):
    """
    The solar pv asset is an electricity source component used to generate electrical power and
    provide that to the network, which can handle production profiles.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_subtype = "solar_pv"
