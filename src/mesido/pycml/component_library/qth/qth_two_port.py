from ._internal import QTHComponent
from .qth_port import QTHPort


class QTHTwoPort(QTHComponent):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(QTHPort, "QTHIn")
        self.add_variable(QTHPort, "QTHOut")
