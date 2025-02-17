from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal import BaseAsset
from mesido.pycml.component_library.milp.heat.heat_four_port import HeatFourPort
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class HeatExchanger(HeatFourPort, BaseAsset):
    """
    The heat exchanger component is used to model the exchange of thermal power between two
    hydraulically decoupled systems. A constant efficiency is used to model milp losses and a
    maximum power is set on the primary side to model physical constraints on the amount of heat
    transfer.

    The heat to discharge constraints are set in the HeatMixin. The primary side is modelled as a
    demand, meaning it consumes energy from the primary network and gives it to the secondary side,
    where the secondary side acts like a source to the secondary network. This also means that heat
    can only flow from primary to secondary.

    To avoid unphysical heat transfer the HeatPhysicsMixin sets constraints on the temperatures on
    both sides in the case of varying temperature. We also allow a heat_exchanger to be disabled on
    certain time-steps to then allow these temperature constraints to be also disabled.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(
            name,
            **self.merge_modifiers(
                dict(),
                modifiers,
            ),
        )

        self.component_type = "heat_exchanger"
        self.efficiency = nan

        self.nominal = (
            self.Secondary.Q_nominal * self.Secondary.rho * self.Secondary.cp * self.Secondary.dT
        )

        self.price = nan
        self.minimum_pressure_drop = 1.0e5  # 1 bar of pressure drop
        self.pump_efficiency = 0.5

        # Assumption: heat in/out and added is nonnegative

        self.add_variable(Variable, "Primary_heat", min=0.0)
        self.add_variable(Variable, "Secondary_heat", min=0.0)
        self.add_variable(Variable, "Heat_flow", nominal=self.nominal)
        self.add_variable(Variable, "dH_prim")
        self.add_variable(Variable, "dH_sec")

        # Hydraulically decoupled so Heads remain the same
        self.add_equation(self.dH_prim - (self.Primary.HeatOut.H - self.Primary.HeatIn.H))
        self.add_equation(
            (
                self.minimum_pressure_drop * self.Primary.Q
                - (self.Primary.HeatIn.Hydraulic_power - self.Primary.HeatOut.Hydraulic_power)
            )
            / (self.Primary.Q_nominal * self.Primary.nominal_pressure)
        )
        self.add_equation(self.dH_sec - (self.Secondary.HeatOut.H - self.Secondary.HeatIn.H))
        self.add_equation(
            (
                self.Pump_power
                - (self.Secondary.HeatOut.Hydraulic_power - self.Secondary.HeatIn.Hydraulic_power)
            )
            / (self.Secondary.Q_nominal * self.Secondary.nominal_pressure)
        )

        self.add_equation(
            ((self.Primary_heat * self.efficiency - self.Secondary_heat) / self.nominal)
        )

        self.add_equation(
            (
                (self.Primary_heat - (self.Primary.HeatIn.Heat - self.Primary.HeatOut.Heat))
                / self.nominal
            )
        )
        self.add_equation(
            (
                (self.Secondary_heat - (self.Secondary.HeatOut.Heat - self.Secondary.HeatIn.Heat))
                / self.nominal
            )
        )
        self.add_equation((self.Heat_flow - self.Secondary_heat) / self.nominal)
