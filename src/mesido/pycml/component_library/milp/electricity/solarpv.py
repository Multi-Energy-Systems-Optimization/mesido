from .. import ElectricitySource


class SolarPV(ElectricitySource):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_subtype = "solar_pv"
