from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from .heat_source import HeatSource


@add_variables_documentation_automatically
class AirWaterHeatPump(HeatSource):
    """
    The air water heat pump component is used to model the source behaviour of air water heat pumps.
    For now, it is just a source, but in the future this can be expanded.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_subtype = "air_water_heat_pump"
