from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal import HeatComponent
from mesido.pycml.pycml_mixin import add_names_automatically

from ._non_storage_component import _NonStorageComponent


@add_names_automatically
class HeatFourPort(HeatComponent):
    """
    The HeatFourPort is used as a base component to model assets that interact with two
    hydraulically decoupled systems.

    side = Primary | Secondary
    port = HeatIn | HeatOut

    Variables created:
        {add_names_here}

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
