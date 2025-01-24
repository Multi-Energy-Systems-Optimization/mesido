from .heat_source import HeatSource


class AirWaterHeatPump(HeatSource):
    """
    The air water heat pump component is used to model the source behaviour of air water heat pumps.
    For now, it is just a source, but in the future this can be expanded.

    port = HeatIn or HeatOut

    Variables created:
        * {name}.dH
        * {name}.Emission
        * {name}.Heat_flow
        * {name}.Heat_source
        * {name}.Pump_power
        * {name}.Q
        * {name}.{port}.H
        * {name}.{port}.Heat
        * {name}.{port}.Hydraulic_power
        * {name}.{port}.Q


    Parameters:
        name : The name of the asset.
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_subtype = "air_water_heat_pump"
