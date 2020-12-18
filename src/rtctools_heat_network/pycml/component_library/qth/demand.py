from numpy import nan

from rtctools_heat_network.pycml import SymbolicParameter, Variable

from .qth_two_port import QTHTwoPort


class Demand(QTHTwoPort):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "demand"

        self.T_supply = nan
        self.T_return = nan
        self.dT = self.T_supply - self.T_return
        self.cp = 4200.0
        self.rho = 988.0

        self.add_variable(SymbolicParameter, "theta")

        self.add_variable(Variable, "Heat_demand", nominal=self.cp * self.rho * self.dT)

        self.add_equation(self.QTHOut.Q - self.QTHIn.Q)
        self.add_equation(
            (
                self.Heat_demand
                - self.cp
                * self.rho
                * self.QTHOut.Q
                * ((1 - self.theta) * self.dT + self.theta * (self.QTHIn.T - self.QTHOut.T))
            )
            / (self.cp * self.rho * self.dT)
        )