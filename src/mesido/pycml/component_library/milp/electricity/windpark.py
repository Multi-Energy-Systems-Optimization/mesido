from .. import ElectricitySource


class WindPark(ElectricitySource):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_subtype = "wind_park"
