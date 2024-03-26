from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal import HeatComponent

from ._non_storage_component import _NonStorageComponent


class HeatFourPort(HeatComponent):
    """
    The HeatFourPort is used as a base component to model assets that interact with two
    hydraulically decoupled systems.
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
