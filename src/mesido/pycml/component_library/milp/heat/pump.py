from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from ._non_storage_component_source_type import _NonStorageComponentSourceType


@add_variables_documentation_automatically
class Pump(_NonStorageComponentSourceType):
    """
    The pump component is there to add head to the flow. We assume head can only be added for
    positive flow.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.temperature = nan
        self.carrier_id = -1

        self.component_type = "pump"

        self.pump_efficiency = 0.5

        self.add_equation((self.HeatIn.Heat - self.HeatOut.Heat) / self.Heat_nominal)
