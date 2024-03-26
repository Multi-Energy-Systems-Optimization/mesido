from mesido.pycml import Variable

from ._internal import QTHComponent
from .qth_port import QTHPort


class Node(QTHComponent):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "node"

        self.n = 2
        assert self.n >= 2

        self.temperature = None

        self.add_variable(Variable, "Tnode")
        self.add_variable(QTHPort, "QTHConn", self.n)
        self.add_variable(Variable, "H")

        # Because the orientation of the connected pipes are important to
        # setup the milp conservation, these constraints are added in the
        # mixin.

        for i in range(1, self.n + 1):
            self.add_equation(self.QTHConn[i].H - self.H)
            # Q and T to be set in the mixin
