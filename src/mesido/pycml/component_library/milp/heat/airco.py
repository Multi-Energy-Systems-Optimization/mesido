from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from ._non_storage_component import _NonStorageComponent


@add_variables_documentation_automatically
class Airco(_NonStorageComponent):
    """
    The airco component is there to extract thermal power (Heat) out of the network. This component
    can also be used to model cold producers, e.g. dry coolers.

    The heat to discharge constraints are set in the HeatPhysicsMixin. We enforce that the outgoing
    temperature of the airco matches the absolute thermal power, Q * cp * rho * T_ret == Heat,
    similar as with the sources. This allows us to guarantee that the flow can always carry the
    heat and that thermal losses are always estimated conservatively, as the heat losses further
    downstream in the network are over-estimated with T_ret where in reality this temperature
    drops. It also implicitly assumes that the temperature drops in the network are small and thus
    satisfy minimum temperature requirements.

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
                dict(
                    HeatIn=dict(Heat=dict(min=0.0)),
                    HeatOut=dict(Heat=dict(min=0.0)),
                ),
                modifiers,
            ),
        )

        self.component_type = "airco"

        self.minimum_pressure_drop = 1.0e5  # 1 bar of pressure drop

        # Assumption: heat in/out and extracted is nonnegative
        # Heat in the return (i.e. cold) line is zero
        self.add_variable(Variable, "Heat_airco", min=0.0, nominal=self.Heat_nominal)
        self.add_variable(Variable, "dH", max=0.0)
        self.add_equation(self.dH - (self.HeatOut.H - self.HeatIn.H))
        self.add_equation(
            (
                self.minimum_pressure_drop * self.Q
                - (self.HeatIn.Hydraulic_power - self.HeatOut.Hydraulic_power)
            )
            / (self.Q_nominal * self.minimum_pressure_drop)
        )

        self.add_equation(
            (self.HeatOut.Heat - (self.HeatIn.Heat - self.Heat_airco)) / self.Heat_nominal
        )

        self.add_equation((self.Heat_flow - self.Heat_airco) / self.Heat_nominal)
