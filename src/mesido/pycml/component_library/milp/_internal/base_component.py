from mesido.pycml import Component

from numpy import nan


class BaseAsset(Component):
    """
    A base asset that carries properties used throughout the different commodities. In this case
    only the financial structure is used in all commodities.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)
        self.state = 1

        self.variable_operational_cost_coefficient = 0.0
        self.fixed_operational_cost_coefficient = 0.0
        self.investment_cost_coefficient = 0.0
        self.installation_cost = 0.0

        self.technical_life = nan
        self.discount_rate = nan
