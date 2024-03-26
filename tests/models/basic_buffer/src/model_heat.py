from mesido.pycml import ControlInput, Model as _Model, Variable
from mesido.pycml.component_library.milp import (
    HeatBuffer,
    HeatDemand,
    HeatPipe,
    HeatSource,
    Node,
    Pump,
)


class ModelHeat(_Model):
    def __init__(self):
        super().__init__(None)

        # Declare Model Elements
        self.Q_nominal = 0.001

        self.heat_nominal_cold_pipes = 45.0 * 4200 * 988 * 0.005
        self.heat_nominal_hot_pipes = 75.0 * 4200 * 988 * 0.005
        self.heat_max_abs = 0.01111 * 100.0 * 4200.0 * 988

        # Set default temperatures
        self.T_supply = 75.0
        self.T_return = 45.0

        supply_return_modifiers = dict(
            T_supply=self.T_supply, T_return=self.T_return, Q_nominal=self.Q_nominal
        )

        # Heatsource min en max in [W]
        self.add_variable(
            HeatSource,
            "source1",
            Heat_source=dict(min=0.0, max=1.5e6, nominal=1e6),
            HeatIn=dict(Heat=dict(nominal=self.heat_nominal_cold_pipes)),
            HeatOut=dict(Heat=dict(nominal=self.heat_nominal_hot_pipes)),
            **supply_return_modifiers,
        )
        self.add_variable(
            HeatSource,
            "source2",
            Heat_source=dict(min=0.0, max=1.5e7, nominal=1e6),
            HeatIn=dict(Heat=dict(nominal=self.heat_nominal_cold_pipes)),
            HeatOut=dict(Heat=dict(nominal=self.heat_nominal_hot_pipes)),
            **supply_return_modifiers,
        )

        cold_pipe_modifiers = dict(
            temperature=self.T_return,
            HeatOut=dict(
                Heat=dict(
                    min=-self.heat_max_abs,
                    max=self.heat_max_abs,
                    nominal=self.heat_nominal_cold_pipes,
                )
            ),
            HeatIn=dict(
                Heat=dict(
                    min=-self.heat_max_abs,
                    max=self.heat_max_abs,
                    nominal=self.heat_nominal_cold_pipes,
                )
            ),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatPipe, "pipe1a_cold", length=170.365, diameter=0.15, **cold_pipe_modifiers
        )
        self.add_variable(
            HeatPipe, "pipe1b_cold", length=309.635, diameter=0.15, **cold_pipe_modifiers
        )
        self.add_variable(HeatPipe, "pipe4a_cold", length=5, diameter=0.15, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe4b_cold", length=15, diameter=0.15, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe5_cold", length=126, diameter=0.15, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe7_cold", length=60, diameter=0.15, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe9_cold", length=70, diameter=0.15, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe15_cold", length=129, diameter=0.15, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe25_cold", length=150, diameter=0.15, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe26_cold", length=30, diameter=0.1, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe27_cold", length=55, diameter=0.15, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe29_cold", length=134, diameter=0.15, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe30_cold", length=60, diameter=0.1, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe31_cold", length=60, diameter=0.1, **cold_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe32_cold", length=50, diameter=0.1, **cold_pipe_modifiers)
        self.add_variable(
            HeatPipe,
            "pipe52_cold",
            disconnectable=True,
            length=10,
            diameter=0.164,
            **cold_pipe_modifiers,
        )

        self.add_variable(
            HeatDemand,
            "demand7",
            Heat_demand=dict(min=0.0, max=self.heat_max_abs),
            **supply_return_modifiers,
        )
        self.add_variable(
            HeatDemand,
            "demand91",
            Heat_demand=dict(min=0.0, max=self.heat_max_abs),
            **supply_return_modifiers,
        )
        self.add_variable(
            HeatDemand,
            "demand92",
            Heat_demand=dict(min=0.0, max=self.heat_max_abs),
            **supply_return_modifiers,
        )

        self.add_variable(
            HeatBuffer,
            "buffer1",
            Heat_buffer=dict(min=-self.heat_max_abs, max=self.heat_max_abs),
            height=10,
            radius=5,
            **supply_return_modifiers,
        )

        hot_pipe_modifiers = dict(
            temperature=self.T_supply,
            HeatOut=dict(
                Heat=dict(
                    min=-self.heat_max_abs,
                    max=self.heat_max_abs,
                    nominal=self.heat_nominal_hot_pipes,
                )
            ),
            HeatIn=dict(
                Heat=dict(
                    min=-self.heat_max_abs,
                    max=self.heat_max_abs,
                    nominal=self.heat_nominal_hot_pipes,
                )
            ),
            **supply_return_modifiers,
        )
        self.add_variable(
            HeatPipe, "pipe1a_hot", length=170.365, diameter=0.15, **hot_pipe_modifiers
        )
        self.add_variable(
            HeatPipe, "pipe1b_hot", length=309.635, diameter=0.15, **hot_pipe_modifiers
        )
        self.add_variable(HeatPipe, "pipe4a_hot", length=5, diameter=0.15, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe4b_hot", length=15, diameter=0.15, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe5_hot", length=126, diameter=0.15, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe7_hot", length=60, diameter=0.15, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe9_hot", length=70, diameter=0.15, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe15_hot", length=129, diameter=0.15, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe25_hot", length=150, diameter=0.15, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe26_hot", length=30, diameter=0.1, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe27_hot", length=55, diameter=0.15, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe29_hot", length=134, diameter=0.15, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe30_hot", length=60, diameter=0.1, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe31_hot", length=60, diameter=0.1, **hot_pipe_modifiers)
        self.add_variable(HeatPipe, "pipe32_hot", length=50, diameter=0.1, **hot_pipe_modifiers)
        self.add_variable(
            HeatPipe,
            "pipe52_hot",
            disconnectable=True,
            length=10,
            diameter=0.164,
            **hot_pipe_modifiers,
        )

        self.add_variable(Node, "nodeS2_hot", n=3)
        self.add_variable(Node, "nodeD7_hot", n=3)
        self.add_variable(Node, "nodeD92_hot", n=3)
        self.add_variable(Node, "nodeB1_hot", n=3)

        self.add_variable(Node, "nodeS2_cold", n=3)
        self.add_variable(Node, "nodeD7_cold", n=3)
        self.add_variable(Node, "nodeD92_cold", n=3)
        self.add_variable(Node, "nodeB1_cold", n=3)

        # Q in [m^3/s] and H in [m]
        self.add_variable(Pump, "pump1", **supply_return_modifiers)
        self.add_variable(Pump, "pump2", **supply_return_modifiers)

        # Define Input/Output Variables and set them equal to model variables.
        # Heatdemand min en max in [W]
        self.add_variable(ControlInput, "Heat_source1", value=self.source1.Heat_source)
        self.add_variable(ControlInput, "Heat_source2", value=self.source2.Heat_source)

        self.add_variable(Variable, "Heat_demand7_opt", value=self.demand7.Heat_demand)
        self.add_variable(Variable, "Heat_demand91_opt", value=self.demand91.Heat_demand)
        self.add_variable(Variable, "Heat_demand92_opt", value=self.demand92.Heat_demand)

        # Connect Model Elements

        # Hot lines from source1 to demand91
        self.connect(self.source1.HeatOut, self.pipe1a_hot.HeatIn)
        self.connect(self.pipe1a_hot.HeatOut, self.pump1.HeatIn)
        self.connect(self.pump1.HeatOut, self.pipe1b_hot.HeatIn)
        self.connect(self.pipe1b_hot.HeatOut, self.nodeS2_hot.HeatConn[1])
        self.connect(self.nodeS2_hot.HeatConn[2], self.pipe5_hot.HeatIn)
        self.connect(self.pipe5_hot.HeatOut, self.pipe7_hot.HeatIn)
        self.connect(self.pipe7_hot.HeatOut, self.pipe9_hot.HeatIn)
        self.connect(self.pipe9_hot.HeatOut, self.nodeB1_hot.HeatConn[1])
        self.connect(self.nodeB1_hot.HeatConn[2], self.pipe15_hot.HeatIn)
        self.connect(self.pipe15_hot.HeatOut, self.pipe25_hot.HeatIn)
        self.connect(self.pipe25_hot.HeatOut, self.nodeD7_hot.HeatConn[1])
        self.connect(self.nodeD7_hot.HeatConn[2], self.pipe27_hot.HeatIn)
        self.connect(self.pipe27_hot.HeatOut, self.pipe29_hot.HeatIn)
        self.connect(self.pipe29_hot.HeatOut, self.nodeD92_hot.HeatConn[1])
        self.connect(self.nodeD92_hot.HeatConn[2], self.pipe31_hot.HeatIn)
        self.connect(self.pipe31_hot.HeatOut, self.pipe32_hot.HeatIn)
        self.connect(self.pipe32_hot.HeatOut, self.demand91.HeatIn)

        # Cold lines from demand91 to source 1
        self.connect(self.demand91.HeatOut, self.pipe32_cold.HeatIn)
        self.connect(self.pipe32_cold.HeatOut, self.pipe31_cold.HeatIn)
        self.connect(self.pipe31_cold.HeatOut, self.nodeD92_cold.HeatConn[1])
        self.connect(self.nodeD92_cold.HeatConn[2], self.pipe29_cold.HeatIn)
        self.connect(self.pipe29_cold.HeatOut, self.pipe27_cold.HeatIn)
        self.connect(self.pipe27_cold.HeatOut, self.nodeD7_cold.HeatConn[1])
        self.connect(self.nodeD7_cold.HeatConn[2], self.pipe25_cold.HeatIn)
        self.connect(self.pipe25_cold.HeatOut, self.pipe15_cold.HeatIn)
        self.connect(self.pipe15_cold.HeatOut, self.nodeB1_cold.HeatConn[1])
        self.connect(self.nodeB1_cold.HeatConn[2], self.pipe9_cold.HeatIn)
        self.connect(self.pipe9_cold.HeatOut, self.pipe7_cold.HeatIn)
        self.connect(self.pipe7_cold.HeatOut, self.pipe5_cold.HeatIn)
        self.connect(self.pipe5_cold.HeatOut, self.nodeS2_cold.HeatConn[1])
        self.connect(self.nodeS2_cold.HeatConn[2], self.pipe1b_cold.HeatIn)
        self.connect(self.pipe1b_cold.HeatOut, self.pipe1a_cold.HeatIn)
        self.connect(self.pipe1a_cold.HeatOut, self.source1.HeatIn)

        # Source2
        self.connect(self.source2.HeatOut, self.pipe4a_hot.HeatIn)
        self.connect(self.pipe4a_hot.HeatOut, self.pump2.HeatIn)
        self.connect(self.pump2.HeatOut, self.pipe4b_hot.HeatIn)
        self.connect(self.pipe4b_hot.HeatOut, self.nodeS2_hot.HeatConn[3])
        self.connect(self.nodeS2_cold.HeatConn[3], self.pipe4a_cold.HeatIn)
        self.connect(self.pipe4a_cold.HeatOut, self.pipe4b_cold.HeatIn)
        self.connect(self.pipe4b_cold.HeatOut, self.source2.HeatIn)

        # Demand7
        self.connect(self.nodeD7_hot.HeatConn[3], self.pipe26_hot.HeatIn)
        self.connect(self.pipe26_hot.HeatOut, self.demand7.HeatIn)
        self.connect(self.demand7.HeatOut, self.pipe26_cold.HeatIn)
        self.connect(self.pipe26_cold.HeatOut, self.nodeD7_cold.HeatConn[3])

        # Demand92
        self.connect(self.nodeD92_hot.HeatConn[3], self.pipe30_hot.HeatIn)
        self.connect(self.pipe30_hot.HeatOut, self.demand92.HeatIn)
        self.connect(self.demand92.HeatOut, self.pipe30_cold.HeatIn)
        self.connect(self.pipe30_cold.HeatOut, self.nodeD92_cold.HeatConn[3])

        # Buffer1
        # Hot
        self.connect(self.nodeB1_hot.HeatConn[3], self.pipe52_hot.HeatIn)
        self.connect(self.pipe52_hot.HeatOut, self.buffer1.HeatIn)
        # Cold
        self.connect(self.buffer1.HeatOut, self.pipe52_cold.HeatIn)
        self.connect(self.pipe52_cold.HeatOut, self.nodeB1_cold.HeatConn[3])
