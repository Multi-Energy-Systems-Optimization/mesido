from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from ._non_storage_component import _NonStorageComponent
from .ates import ATES


@add_variables_documentation_automatically
class ATESMultiPort(ATES):
    """
    The air water heat pump component is used to model the source behaviour of air water heat pumps.
    For now, it is just a source, but in the future this can be expanded.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)
        self.component_subtype = "ates_multi_port"

        self.max_heat_flow = self.cp * self.rho * self.dT * self.Q.max

        self.HeatIn.Heat.min, self.HeatIn.Heat.max = (-self.max_heat_flow, self.max_heat_flow)
        self.HeatOut.Heat.min, self.HeatOut.Heat.max = (-self.max_heat_flow, self.max_heat_flow)

        modifiers["DischargeHot"].update({"Q": {"min": 0.0}})
        modifiers["DischargeCold"].update({"Q": {"min": 0.0}})
        modifiers["ChargeHot"].update({"Q": {"min": 0.0}})
        self.add_variable(_NonStorageComponent, "DischargeHot", **modifiers["DischargeHot"])
        self.add_variable(_NonStorageComponent, "DischargeCold", **modifiers["DischargeCold"])
        self.add_variable(_NonStorageComponent, "ChargeHot", **modifiers["ChargeHot"])

        # linking combination of ports
        # heat_flow_dischargehot <0
        # heat_flow_dischargecold <0
        # heat_flow_chargehot >0
        self.add_equation(
            (
                self.DischargeHot.HeatIn.Heat
                - self.DischargeHot.HeatOut.Heat
                - self.DischargeHot.Heat_flow
            )
            / self.Heat_nominal
        )
        self.add_equation(
            (
                self.DischargeCold.HeatIn.Heat
                - self.DischargeCold.HeatOut.Heat
                - self.DischargeCold.Heat_flow
            )
            / self.Heat_nominal
        )
        self.add_equation(
            (self.ChargeHot.HeatIn.Heat - self.ChargeHot.HeatOut.Heat - self.ChargeHot.Heat_flow)
            / self.Heat_nominal
        )

        # linking all ports to ates flow and ates heat
        self.add_equation(
            (
                self.Heat_ates
                - self.ChargeHot.Heat_flow
                - self.DischargeHot.Heat_flow
                - self.DischargeCold.Heat_flow
            )
            / self.Heat_nominal
        )
