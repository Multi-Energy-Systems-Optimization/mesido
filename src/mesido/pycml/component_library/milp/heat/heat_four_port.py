from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal import HeatComponent

from ._non_storage_component import _NonStorageComponent


class HeatFourPort(HeatComponent):
    """
    The HeatFourPort is used as a base component to model assets that interact with two
    hydraulically decoupled systems.

    side = Primary | Secondary
    port = HeatIn | HeatOut

    Variables created:
        * {name}.Pump_power
        * {name}.{side}.{port}.H
        * {name}.{side}.{port}.Heat
        * {name}.{side}.{port}.Hydraulic_power
        * {name}.{side}.{port}.Q

    Parameters:
        name : The name of the asset.
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

        self.add_variable(_NonStorageComponent, "Primary", **modifiers["Primary"])
        self.add_variable(_NonStorageComponent, "Secondary", **modifiers["Secondary"])
        self.add_variable(
            Variable,
            "Pump_power",
            min=0.0,
            nominal=self.Secondary.Q_nominal * self.Secondary.nominal_pressure,
        )
