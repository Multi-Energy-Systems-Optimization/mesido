from mesido.pycml import ControlInput, Model as _Model
from mesido.pycml.component_library.milp import (
    HeatDemand,
    HeatPipe,
    HeatSource,
    Pump,
)


class Model(_Model):
    """
    Very simple model of a milp network consisting of a source, pump, pipe and demand for testing
    head loss.
    """

    def __init__(self):
        super().__init__(None)

        self.Q_nominal = 0.001

        self.T_supply = 75.0
        self.T_return = 45.0

        supply_return_modifiers = dict(
            T_supply=self.T_supply, T_return=self.T_return, Q_nominal=self.Q_nominal
        )

        self.add_variable(
            HeatSource,
            "source",
            Heat_source=dict(min=0.0e5, max=1.8e5, nominal=0.9e5),
            HeatOut=dict(Heat=dict(max=5e5)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatDemand, "demand", HeatIn=dict(Heat=dict(max=5e5)), **supply_return_modifiers
        )

        self.add_variable(
            HeatPipe,
            "pipe_hot",
            length=1000.0,
            diameter=0.15,
            temperature=self.T_supply,
            HeatIn=dict(Heat=dict(min=-5e5, max=5e5, nominal=2.5e5)),
            HeatOut=dict(Heat=dict(min=-5e5, max=5e5, nominal=2.5e5)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_cold",
            length=1000.0,
            diameter=0.15,
            temperature=self.T_return,
            HeatIn=dict(Heat=dict(min=-5e5, max=5e5, nominal=2.5e5)),
            HeatOut=dict(Heat=dict(min=-5e5, max=5e5, nominal=2.5e5)),
            **supply_return_modifiers,
        )

        self.add_variable(
            Pump,
            "pump",
            **supply_return_modifiers,
        )

        self.add_variable(ControlInput, "Heat_source", value=self.source.Heat_source)

        self.connect(self.source.HeatOut, self.pipe_hot.HeatIn)
        self.connect(self.pipe_hot.HeatOut, self.demand.HeatIn)
        self.connect(self.demand.HeatOut, self.pipe_cold.HeatIn)
        self.connect(self.pipe_cold.HeatOut, self.pump.HeatIn)
        self.connect(self.pump.HeatOut, self.source.HeatIn)
