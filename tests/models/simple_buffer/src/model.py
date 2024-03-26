from mesido.pycml import ControlInput, Model as _Model
from mesido.pycml.component_library.milp import (
    HeatBuffer,
    HeatDemand,
    HeatPipe,
    HeatSource,
    Node,
    Pump,
)


class Model(_Model):
    def __init__(self):
        super().__init__(None)

        # Declare Model Elements
        self.min_fraction_tank_volume = 0.0

        self.Q_nominal = 0.001

        self.T_supply = 75.0
        self.T_return = 45.0

        supply_return_modifiers = dict(
            T_supply=self.T_supply, T_return=self.T_return, Q_nominal=self.Q_nominal
        )

        self.add_variable(
            Pump,
            "pump",
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatSource,
            "source",
            Heat_source=dict(min=0.75e5, max=1.25e5, nominal=1e5),
            HeatOut=dict(Heat=dict(max=2e5)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatDemand, "demand", HeatIn=dict(Heat=dict(max=2e5)), **supply_return_modifiers
        )

        self.add_variable(
            HeatBuffer,
            "buffer",
            Heat_buffer=dict(min=-1e6, max=1e6, nominal=1e5),
            height=10,
            radius=5,
            min_fraction_tank_volume=self.min_fraction_tank_volume,
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_sourcebuffer_hot",
            length=1000.0,
            diameter=0.15,
            temperature=self.T_supply,
            HeatIn=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            HeatOut=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_bufferdemand_hot",
            length=1000.0,
            diameter=0.15,
            temperature=self.T_supply,
            HeatIn=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            HeatOut=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_buffer_hot",
            disconnectable=True,
            length=10.0,
            diameter=0.15,
            temperature=self.T_supply,
            HeatIn=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            HeatOut=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            **supply_return_modifiers,
        )

        self.add_variable(Node, "node_buffer_hot", n=3)
        self.add_variable(Node, "node_buffer_cold", n=3)

        self.add_variable(
            HeatPipe,
            "pipe_sourcebuffer_cold",
            length=1000.0,
            diameter=0.15,
            temperature=self.T_return,
            HeatIn=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            HeatOut=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_bufferdemand_cold",
            length=1000.0,
            diameter=0.15,
            temperature=self.T_return,
            HeatIn=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            HeatOut=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_buffer_cold",
            disconnectable=True,
            length=10.0,
            diameter=0.15,
            temperature=self.T_return,
            HeatIn=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            HeatOut=dict(Heat=dict(min=-2e5, max=2e5, nominal=1e5)),
            **supply_return_modifiers,
        )

        self.add_variable(ControlInput, "Heat_source", value=self.source.Heat_source)

        self.connect(self.source.HeatOut, self.pipe_sourcebuffer_hot.HeatIn)
        self.connect(self.pipe_sourcebuffer_hot.HeatOut, self.node_buffer_hot.HeatConn[1])
        self.connect(self.node_buffer_hot.HeatConn[2], self.pipe_bufferdemand_hot.HeatIn)
        self.connect(self.pipe_bufferdemand_hot.HeatOut, self.demand.HeatIn)
        self.connect(self.node_buffer_hot.HeatConn[3], self.pipe_buffer_hot.HeatIn)
        self.connect(self.pipe_buffer_hot.HeatOut, self.buffer.HeatIn)

        self.connect(self.demand.HeatOut, self.pipe_bufferdemand_cold.HeatIn)
        self.connect(self.pipe_bufferdemand_cold.HeatOut, self.node_buffer_cold.HeatConn[1])
        self.connect(self.node_buffer_cold.HeatConn[2], self.pipe_sourcebuffer_cold.HeatIn)
        self.connect(self.pipe_sourcebuffer_cold.HeatOut, self.pump.HeatIn)
        self.connect(self.pump.HeatOut, self.source.HeatIn)
        self.connect(self.buffer.HeatOut, self.pipe_buffer_cold.HeatIn)
        self.connect(self.pipe_buffer_cold.HeatOut, self.node_buffer_cold.HeatConn[3])
