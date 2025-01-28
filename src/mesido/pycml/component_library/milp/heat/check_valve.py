from mesido.pycml import Variable

from ._non_storage_component import _NonStorageComponent


class CheckValve(_NonStorageComponent):
    """
    The check valve allows the fluid to flow in only one direction. This is done with constraints
    in the HeatMixin.

    port = HeatIn or HeatOut

    Variables created:
        * {name}.dH
        * {name}.Heat_flow
        * {name}.Q
        * {name}.{port}.H
        * {name}.{port}.Heat
        * {name}.{port}.Hydraulic_power
        * {name}.{port}.Q

    Parameters:
        name : The name of the asset.
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
