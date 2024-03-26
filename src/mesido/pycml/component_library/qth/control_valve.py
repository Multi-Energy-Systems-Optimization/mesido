from mesido.pycml import Variable

from ._non_storage_component import _NonStorageComponent


class ControlValve(_NonStorageComponent):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "control_valve"

        self.add_variable(Variable, "dH")

        self.add_equation(self.dH - (self.QTHOut.H - self.QTHIn.H))

        self.add_equation(self.QTHIn.T - self.QTHOut.T)
