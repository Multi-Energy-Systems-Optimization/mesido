from mesido.pycml import Connector, Variable

from ._internal import QTHComponent


class QTHPort(QTHComponent, Connector):
    """
    Connector with potential temperature (T), flow discharge (Q) and head (H)
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(Variable, "T")  # Temperature
        self.add_variable(Variable, "Q")  # Volume flow (positive inwards)
        self.add_variable(Variable, "H")  # Head
