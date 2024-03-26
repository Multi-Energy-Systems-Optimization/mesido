from mesido.pycml import SymbolicParameter, Variable

from ._fluid_properties_component import _FluidPropertiesComponent
from ._non_storage_component import _NonStorageComponent


class Demand(_NonStorageComponent, _FluidPropertiesComponent):
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

        self.component_type = "heat_demand"

        self.Q_nominal = 1.0

        self.add_variable(SymbolicParameter, "theta")

        self.add_variable(
            Variable, "Heat_demand", nominal=self.cp * self.rho * self.dT * self.Q_nominal
        )

        self.add_equation(
            (
                self.Heat_demand
                - self.cp
                * self.rho
                * self.QTHOut.Q
                * ((1 - self.theta) * self.dT + self.theta * (self.QTHIn.T - self.QTHOut.T))
            )
            / (self.cp * self.rho * self.dT * self.Q_nominal)
        )
