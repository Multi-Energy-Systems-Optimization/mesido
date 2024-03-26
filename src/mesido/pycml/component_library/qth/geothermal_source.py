from numpy import nan

from .source import Source


class GeothermalSource(Source):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_subtype = "geothermal"

        self.target_flow_rate = nan
