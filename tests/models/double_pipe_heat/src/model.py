from mesido.pycml import ControlInput, Model as _Model
from mesido.pycml.component_library.milp import (
    HeatDemand,
    HeatPipe,
    HeatSource,
    Node,
    Pump,
)


class Model(_Model):
    def __init__(self):
        super().__init__(None)

        self.Q_nominal = 0.001

        self.T_supply = 75.0
        self.T_return = 45.0
        self.max_heat = 4200 * 988 * self.T_supply

        supply_return_modifiers = dict(
            T_supply=self.T_supply, T_return=self.T_return, Q_nominal=self.Q_nominal
        )

        self.add_variable(
            HeatSource,
            "source",
            Heat_source=dict(min=0.75e5, max=1.25e5),
            Heat_flow=dict(min=0.75e5, max=1.25e5),
            HeatOut=dict(Heat=dict(max=self.max_heat)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatDemand,
            "demand",
            HeatIn=dict(Heat=dict(max=self.max_heat)),
            Heat_demand=dict(min=0.0, max=self.max_heat),
            Heat_flow=dict(min=0.0, max=self.max_heat),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_hot",
            length=1000.0,
            diameter=0.15,
            temperature=self.T_supply,
            HeatIn=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            HeatOut=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_cold",
            length=1000.0,
            diameter=0.15,
            temperature=self.T_return,
            HeatIn=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            HeatOut=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_2_hot",
            length=1000.0,
            diameter=0.15,
            temperature=self.T_supply,
            HeatIn=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            HeatOut=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_2_cold",
            length=1000.0,
            diameter=0.15,
            temperature=self.T_return,
            HeatIn=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            HeatOut=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_demand_hot",
            length=0.0,
            diameter=0.15,
            temperature=self.T_supply,
            HeatIn=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            HeatOut=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_demand_cold",
            length=0.0,
            diameter=0.15,
            temperature=self.T_return,
            HeatIn=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            HeatOut=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_source_hot",
            length=0.0,
            diameter=0.15,
            temperature=self.T_supply,
            HeatIn=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            HeatOut=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe,
            "pipe_source_cold",
            length=0.0,
            diameter=0.15,
            temperature=self.T_return,
            HeatIn=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            HeatOut=dict(Heat=dict(min=-self.max_heat, max=self.max_heat)),
            **supply_return_modifiers,
        )

        self.add_variable(
            Pump,
            "pump",
            **supply_return_modifiers,
        )

        self.add_variable(
            Node,
            "node_source_hot",
            n=3,
        )

        self.add_variable(
            Node,
            "node_demand_hot",
            n=3,
        )

        self.add_variable(
            Node,
            "node_source_cold",
            n=3,
        )

        self.add_variable(
            Node,
            "node_demand_cold",
            n=3,
        )

        self.add_variable(ControlInput, "Heat_source", value=self.source.Heat_source)

        self.connect(self.source.HeatOut, self.pipe_source_hot.HeatIn)
        self.connect(self.pipe_source_hot.HeatOut, self.node_source_hot.HeatConn[1])
        self.connect(self.node_source_hot.HeatConn[2], self.pipe_hot.HeatIn)
        self.connect(self.node_source_hot.HeatConn[3], self.pipe_2_hot.HeatIn)

        self.connect(self.pipe_hot.HeatOut, self.node_demand_hot.HeatConn[2])
        self.connect(self.pipe_2_hot.HeatOut, self.node_demand_hot.HeatConn[3])
        self.connect(self.node_demand_hot.HeatConn[1], self.pipe_demand_hot.HeatIn)
        self.connect(self.pipe_demand_hot.HeatOut, self.demand.HeatIn)

        self.connect(self.demand.HeatOut, self.pipe_demand_cold.HeatIn)
        self.connect(self.pipe_demand_cold.HeatOut, self.node_demand_cold.HeatConn[1])
        self.connect(self.pipe_cold.HeatIn, self.node_demand_cold.HeatConn[2])
        self.connect(self.pipe_2_cold.HeatIn, self.node_demand_cold.HeatConn[3])

        self.connect(self.node_source_cold.HeatConn[2], self.pipe_cold.HeatOut)
        self.connect(self.node_source_cold.HeatConn[3], self.pipe_2_cold.HeatOut)
        self.connect(self.node_source_cold.HeatConn[1], self.pipe_source_cold.HeatIn)
        self.connect(self.pipe_source_cold.HeatOut, self.pump.HeatIn)
        self.connect(self.pump.HeatOut, self.source.HeatIn)
