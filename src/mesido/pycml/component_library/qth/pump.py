from mesido.pycml import Variable

from ._non_storage_component import _NonStorageComponent


class Pump(_NonStorageComponent):
    def __init__(self, name, **modifiers):
        super().__init__(
            name,
            **self.merge_modifiers(
                dict(Q=dict(min=0.0)),
                modifiers,
            ),
        )

        self.component_type = "pump"

        self.add_variable(Variable, "dH", min=0.0)

        self.add_equation(self.dH - (self.QTHOut.H - self.QTHIn.H))

        self.add_equation(self.QTHIn.T - self.QTHOut.T)
