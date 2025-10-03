from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal import HeatComponent
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from ._non_storage_component_sink_type import _NonStorageComponentSinkType
from ._non_storage_component_source_type import _NonStorageComponentSourceType


@add_variables_documentation_automatically
class HeatFourPort(HeatComponent):
    """
    The HeatFourPort is used as a base component to model assets that interact with two
    hydraulically decoupled systems.

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

        self.add_variable(_NonStorageComponentSinkType, "Primary", **modifiers["Primary"])
        self.add_variable(_NonStorageComponentSourceType, "Secondary", **modifiers["Secondary"])
        self.add_variable(
            Variable,
            "Pump_power",
            min=0.0,
            nominal=self.Secondary.Q_nominal * self.Secondary.nominal_pressure,
        )

        self.nominal = (
            self.Secondary.Q_nominal * self.Secondary.rho * self.Secondary.cp * self.Secondary.dT
        )

        # Assumption: heat in/out and added is nonnegative
        self.add_variable(Variable, "Primary_heat", min=0.0)
        self.add_variable(Variable, "Secondary_heat", min=0.0)
        self.add_variable(Variable, "Heat_flow", nominal=self.nominal)

        self.add_variable(Variable, "dH_prim", max=0.0)
        self.add_variable(Variable, "dH_sec", min=0.0)

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

        # Hydraulically decoupled so Heads remain the same
        self.add_equation(self.dH_prim - self.Primary.dH)
        self.add_equation(self.dH_sec - self.Secondary.dH)
        self.add_equation(
            (self.Pump_power - self.Secondary.Pump_power)
            / (self.Secondary.Q_nominal * self.Secondary.nominal_pressure)
        )
