from mesido.pycml import Connector, Variable

from .._internal.gas_component import GasComponent


class GasPort(GasComponent, Connector):
    """
    The gas port is used to model the variables at a port where two assets are connected. For the
    gas network we model flow (Q [m3/s]) and head (H [m]). The Q_shadow variable is only used for
    correctly connecting ports of assets later on.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)
        # TODO: think of more elegant approach for Q_shadow, currently required to ensure that
        #  every port has a unique variable to make the correct port mapping
        self.add_variable(Variable, "Q")  # [m3/s]
        self.add_variable(Variable, "mass_flow")  # [g/s]
        self.add_variable(Variable, "H")  # [m]
        self.add_variable(Variable, "Hydraulic_power")  # [W]


class GasTwoPort(GasComponent):
    """
    For gas components that transport flow we have a two port component.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(GasPort, "GasIn")
        self.add_variable(GasPort, "GasOut")
