from mesido.network_common import NetworkSettings
from mesido.pycml.component_library.milp._internal.base_component import BaseAsset


class GasComponent(BaseAsset):
    """
    Base gas component nothing to add here yet.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)
        self.network_type = NetworkSettings.NETWORK_TYPE_GAS
