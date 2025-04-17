from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from ._non_storage_component import _NonStorageComponent


@add_variables_documentation_automatically
class CheckValve(_NonStorageComponent):
    """
    The check valve allows the fluid to flow in only one direction. This is done with constraints
    in the HeatMixin.

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
                    Q=dict(min=0.0),
                ),
                modifiers,
            ),
        )

        self.component_type = "check_valve"

        self.add_variable(Variable, "dH", min=0.0)

        self.add_equation(self.dH - (self.HeatOut.H - self.HeatIn.H))

        self.add_equation((self.HeatIn.Heat - self.HeatOut.Heat) / self.Heat_nominal)
