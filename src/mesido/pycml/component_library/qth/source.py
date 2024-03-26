from mesido.pycml import SymbolicParameter, Variable

from numpy import nan

from ._fluid_properties_component import _FluidPropertiesComponent
from ._non_storage_component import _NonStorageComponent


class Source(_NonStorageComponent, _FluidPropertiesComponent):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)
        self.Q_nominal = 1.0

        super().__init__(
            name,
            **self.merge_modifiers(
                dict(Q=dict(nominal=self.Q_nominal)),
                modifiers,
            ),
        )

        self.component_type = "source"

        self.Q_nominal = 1.0
        self.price = nan

        self.add_variable(SymbolicParameter, "theta")

        self.add_variable(
            Variable, "Heat_source", min=0.0, nominal=self.cp * self.rho * self.dT * self.Q_nominal
        )

        self.add_variable(Variable, "dH", min=0.0)

        self.add_equation(self.dH - (self.QTHOut.H - self.QTHIn.H))

        self.add_equation(
            (
                self.Heat_source
                - self.cp
                * self.rho
                * self.QTHOut.Q
                * ((1 - self.theta) * self.dT + self.theta * (-self.QTHIn.T + self.QTHOut.T))
            )
            / (self.cp * self.rho * self.dT * self.Q_nominal)
        )
