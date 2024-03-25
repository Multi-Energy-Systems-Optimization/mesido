from rtctools_heat_network.pycml import Variable

from .. import ElectricitySource


class SolarPV(ElectricitySource):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_subtype = "solar_pv"

        self.add_variable(Variable, "Set_point", min=0.0, max=1.0)
