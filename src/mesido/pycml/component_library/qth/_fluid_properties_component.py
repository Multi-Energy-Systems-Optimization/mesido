from numpy import nan

from .qth_two_port import QTHTwoPort


class _FluidPropertiesComponent(QTHTwoPort):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.T_supply = nan
        self.T_return = nan
        self.T_supply_id = -1
        self.T_return_id = -1
        self.dT = self.T_supply - self.T_return
        self.cp = 4200.0
        self.rho = 988.0
