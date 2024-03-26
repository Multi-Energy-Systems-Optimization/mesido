from mesido.pycml import Variable

from .qth_two_port import QTHTwoPort


class _NonStorageComponent(QTHTwoPort):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_variable(Variable, "Q")

        self.add_variable(Variable, "H_in")
        self.add_variable(Variable, "H_out")

        self.add_equation(self.QTHIn.Q - self.Q)
        self.add_equation(self.QTHOut.Q - self.QTHIn.Q)

        self.add_equation(self.QTHIn.H - self.H_in)
        self.add_equation(self.QTHOut.H - self.H_out)
