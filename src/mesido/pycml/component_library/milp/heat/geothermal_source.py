from numpy import nan

from .heat_source import HeatSource


class GeothermalSource(HeatSource):
    """
    The geothermal source component is used to model geothermal doublets. It is equivilent to a
    normal source with the only difference being in the modelling of doublets. The main reason for
    this component instead of using just a regular source is that to have the integer behaviour of
    increasing the amount of doublets. In the HeatMixin an integer is created _aggregation_count to
    model the amount of doublets and the maximum power will scale with this integer instead of
    continuous. This will also ensure that the cost will scale with this integer.

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

        self.component_subtype = "geothermal"

        self.target_flow_rate = nan
        self.single_doublet_power = nan
        self.nr_of_doublets = 1.0
