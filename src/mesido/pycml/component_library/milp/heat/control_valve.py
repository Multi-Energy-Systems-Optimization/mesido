from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from ._non_storage_component import _NonStorageComponent


@add_variables_documentation_automatically
class ControlValve(_NonStorageComponent):
    """
    The control valve is a component to create pressure drop. We allow the control valve to create
    pressure drop for flow in both directions. Note that we set the absolute head loss symbol in
    the HeatMixin.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "control_valve"

        self.add_variable(Variable, "dH")

        self.add_equation(self.dH - (self.HeatOut.H - self.HeatIn.H))
        self.add_equation(
            (self.HeatOut.Hydraulic_power - self.HeatIn.Hydraulic_power)
            / (self.Q_nominal * self.nominal_pressure)
        )

        self.add_equation((self.HeatIn.Heat - self.HeatOut.Heat) / self.Heat_nominal)
