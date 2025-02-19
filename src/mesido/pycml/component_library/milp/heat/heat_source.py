from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from ._non_storage_component import _NonStorageComponent


@add_variables_documentation_automatically
class HeatSource(_NonStorageComponent):
    """
    The source component is there to insert thermal power (Heat) into the network.

    The heat to discharge constraints are set in the HeatMixin. We enforce that the outgoing
    temperature of the source matches the absolute thermal power, Q * cp * rho * T_sup == Heat,
    similar as with the demands. This allows us to guarantee that the flow can always carry, as
    the heat losses further downstream in the network are over-estimated with T_ret where in
    reality this temperature drops. It also implicitly assumes that the temperature drops in the
    network are small and thus satisfy minimum temperature requirements.

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
                    HeatIn=dict(Heat=dict(min=0.0)),  # ensures it is not cooled down to below 0C
                    HeatOut=dict(Heat=dict(min=0.0)),
                ),
                modifiers,
            ),
        )

        self.component_type = "heat_source"

        self.price = nan  # TODO: delete not needed anymore
        self.co2_coeff = 1.0
        self.pump_efficiency = 0.5

        # Assumption: heat in/out and added is nonnegative
        # Heat in the return (i.e. cold) line is zero
        self.add_variable(Variable, "Heat_source", min=0.0, nominal=self.Heat_nominal)
        self.add_variable(Variable, "Emission", min=0.0, nominal=self.Heat_nominal)
        self.add_variable(Variable, "dH", min=0.0)
        self.add_variable(
            Variable, "Pump_power", min=0.0, nominal=self.Q_nominal * self.nominal_pressure
        )

        self.add_equation(self.dH - (self.HeatOut.H - self.HeatIn.H))
        self.add_equation(
            (self.Pump_power - (self.HeatOut.Hydraulic_power - self.HeatIn.Hydraulic_power))
            / (self.Q_nominal * self.nominal_pressure)
        )

        self.add_equation(
            (self.HeatOut.Heat - (self.HeatIn.Heat + self.Heat_source)) / self.Heat_nominal
        )
        # self.add_equation(
        #     (self.Emission - self.Heat_source * self.co2_coeff)
        #     / (self.Heat_nominal * self.co2_coeff)
        # )

        self.add_equation((self.Heat_flow - self.Heat_source) / self.Heat_nominal)
