from .. import ElectricitySource
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically


@add_variables_documentation_automatically
class WindPark(ElectricitySource):
    """
    The windpark is an electricity source component used to generate electrical power and
    provide that to the network, which can handle production profiles.

    port = ElectricityIn or ElectricityOut

    Variables created:
        {add_names_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_subtype = "wind_park"
