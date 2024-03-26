from mesido.pycml import ControlInput, Model as _Model, SymbolicParameter, Variable
from mesido.pycml.component_library.qth import (
    Buffer,
    Demand,
    Node,
    Pipe,
    Pump,
    Source,
)


class ModelQTH(_Model):
    def __init__(self):
        super().__init__(None)

        # Declare Model Elements
        self.add_variable(SymbolicParameter, "theta")

        self.Q_nominal = 0.001

        self.t_supply_max = 110.0
        self.t_supply_min = 10.0
        self.t_return_max = 110.0
        self.t_return_min = 10.0

        self.t_source1_min = 65.0
        self.t_source1_max = 85.0
        self.t_source2_min = 65.0
        self.t_source2_max = 90.0

        self.t_demand_min = 70

        self.t_supply_nom = 75.0
        self.t_return_nom = 45.0

        supply_return_modifiers = dict(T_supply=self.t_supply_nom, T_return=self.t_return_nom)

        # Heatsource min en max in [W]
        self.add_variable(
            Source,
            "source1",
            Heat_source=dict(min=0.0, max=1.5e6, nominal=1e6),
            theta=self.theta,
            QTHOut=dict(T=dict(min=self.t_source1_min, max=self.t_source1_max)),
            Q_nominal=self.Q_nominal,
            **supply_return_modifiers,
        )
        self.add_variable(
            Source,
            "source2",
            Heat_source=dict(min=0.0, max=1.5e7, nominal=1e6),
            theta=self.theta,
            QTHOut=dict(T=dict(min=self.t_source2_min, max=self.t_source2_max)),
            Q_nominal=self.Q_nominal,
            **supply_return_modifiers,
        )

        cold_pipe_modifiers = dict(
            temperature=self.t_return_nom,
            QTHIn=dict(T=dict(min=self.t_return_min, max=self.t_return_max)),
            QTHOut=dict(T=dict(min=self.t_return_min, max=self.t_return_max)),
            **supply_return_modifiers,
        )

        self.add_variable(
            Pipe,
            "pipe1a_cold",
            length=170.365,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe1b_cold",
            length=309.635,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe4a_cold",
            length=5,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe4b_cold",
            length=15,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe5_cold",
            length=126,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe7_cold",
            length=60,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe9_cold",
            length=70,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe15_cold",
            length=129,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe25_cold",
            length=150,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe26_cold",
            length=30,
            diameter=0.1,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe27_cold",
            length=55,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe29_cold",
            length=134,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe30_cold",
            length=60,
            diameter=0.1,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe31_cold",
            length=60,
            diameter=0.1,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe32_cold",
            length=50,
            diameter=0.1,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe52_cold",
            disconnectable=True,
            length=10,
            diameter=0.164,
            Q=dict(nominal=self.Q_nominal),
            **cold_pipe_modifiers,
        )

        self.add_variable(
            Demand,
            "demand7",
            theta=self.theta,
            QTHIn=dict(T=dict(min=self.t_demand_min)),
            Q_nominal=self.Q_nominal,
            **supply_return_modifiers,
        )
        self.add_variable(
            Demand,
            "demand91",
            theta=self.theta,
            QTHIn=dict(T=dict(min=self.t_demand_min)),
            Q_nominal=self.Q_nominal,
            **supply_return_modifiers,
        )
        self.add_variable(
            Demand,
            "demand92",
            theta=self.theta,
            QTHIn=dict(T=dict(min=self.t_demand_min)),
            Q_nominal=self.Q_nominal,
            **supply_return_modifiers,
        )

        self.add_variable(
            Buffer,
            "buffer1",
            Q_nominal=self.Q_nominal,
            height=10,
            radius=5,
            heat_transfer_coeff=1.0,
            init_T_hot_tank=self.t_supply_nom,
            init_T_cold_tank=self.t_return_nom,
            **supply_return_modifiers,
        )

        hot_pipe_modifiers = dict(
            temperature=self.t_supply_nom,
            QTHIn=dict(T=dict(min=self.t_supply_min, max=self.t_supply_max)),
            QTHOut=dict(T=dict(min=self.t_supply_min, max=self.t_supply_max)),
            **supply_return_modifiers,
        )

        self.add_variable(
            Pipe,
            "pipe1a_hot",
            length=170.365,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe1b_hot",
            length=309.635,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe4a_hot",
            length=5,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe4b_hot",
            length=15,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe5_hot",
            length=126,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe7_hot",
            length=60,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe9_hot",
            length=70,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe15_hot",
            length=129,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe25_hot",
            length=150,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe26_hot",
            length=30,
            diameter=0.1,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe27_hot",
            length=55,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe29_hot",
            length=134,
            diameter=0.15,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe30_hot",
            length=60,
            diameter=0.1,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe31_hot",
            length=60,
            diameter=0.1,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe32_hot",
            length=50,
            diameter=0.1,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )
        self.add_variable(
            Pipe,
            "pipe52_hot",
            disconnectable=True,
            length=10,
            diameter=0.164,
            Q=dict(nominal=self.Q_nominal),
            **hot_pipe_modifiers,
        )

        self.add_variable(Node, "nodeS2_hot", n=3, temperature=75.0)
        self.add_variable(Node, "nodeD7_hot", n=3, temperature=75.0)
        self.add_variable(Node, "nodeD92_hot", n=3, temperature=75.0)
        self.add_variable(Node, "nodeB1_hot", n=3, temperature=75.0)

        self.add_variable(Node, "nodeS2_cold", n=3, temperature=45.0)
        self.add_variable(Node, "nodeD7_cold", n=3, temperature=45.0)
        self.add_variable(Node, "nodeD92_cold", n=3, temperature=45.0)
        self.add_variable(Node, "nodeB1_cold", n=3, temperature=45.0)

        # Q in [m^3/s] and H in [m]
        self.add_variable(
            Pump,
            "pump1",
            Q=dict(min=0.00002778, max=0.01111, nominal=self.Q_nominal),
            dH=dict(min=0.2, max=20.0),
            QTHIn=dict(H=dict(min=0.0, max=0.0)),
        )
        self.add_variable(
            Pump,
            "pump2",
            Q=dict(min=0.00002778, max=0.01111, nominal=self.Q_nominal),
            dH=dict(min=0.2, max=20.0),
        )

        # Define Input/Output Variables and set them equal to model variables.
        # Heatdemand min en max in [W]
        self.add_variable(ControlInput, "Heat_source1", value=self.source1.Heat_source)
        self.add_variable(ControlInput, "Heat_source2", value=self.source2.Heat_source)

        self.add_variable(Variable, "Heat_demand7_opt", value=self.demand7.Heat_demand)
        self.add_variable(Variable, "Heat_demand91_opt", value=self.demand91.Heat_demand)
        self.add_variable(Variable, "Heat_demand92_opt", value=self.demand92.Heat_demand)

        # Connect Model Elements

        # Hot lines from source1 to demand91
        self.connect(self.source1.QTHOut, self.pipe1a_hot.QTHIn)
        self.connect(self.pipe1a_hot.QTHOut, self.pump1.QTHIn)
        self.connect(self.pump1.QTHOut, self.pipe1b_hot.QTHIn)
        self.connect(self.pipe1b_hot.QTHOut, self.nodeS2_hot.QTHConn[1])
        self.connect(self.nodeS2_hot.QTHConn[2], self.pipe5_hot.QTHIn)
        self.connect(self.pipe5_hot.QTHOut, self.pipe7_hot.QTHIn)
        self.connect(self.pipe7_hot.QTHOut, self.pipe9_hot.QTHIn)
        self.connect(self.pipe9_hot.QTHOut, self.nodeB1_hot.QTHConn[1])
        self.connect(self.nodeB1_hot.QTHConn[2], self.pipe15_hot.QTHIn)
        self.connect(self.pipe15_hot.QTHOut, self.pipe25_hot.QTHIn)
        self.connect(self.pipe25_hot.QTHOut, self.nodeD7_hot.QTHConn[1])
        self.connect(self.nodeD7_hot.QTHConn[2], self.pipe27_hot.QTHIn)
        self.connect(self.pipe27_hot.QTHOut, self.pipe29_hot.QTHIn)
        self.connect(self.pipe29_hot.QTHOut, self.nodeD92_hot.QTHConn[1])
        self.connect(self.nodeD92_hot.QTHConn[2], self.pipe31_hot.QTHIn)
        self.connect(self.pipe31_hot.QTHOut, self.pipe32_hot.QTHIn)
        self.connect(self.pipe32_hot.QTHOut, self.demand91.QTHIn)

        # Cold lines from demand91 to source 1
        self.connect(self.demand91.QTHOut, self.pipe32_cold.QTHIn)
        self.connect(self.pipe32_cold.QTHOut, self.pipe31_cold.QTHIn)
        self.connect(self.pipe31_cold.QTHOut, self.nodeD92_cold.QTHConn[1])
        self.connect(self.nodeD92_cold.QTHConn[2], self.pipe29_cold.QTHIn)
        self.connect(self.pipe29_cold.QTHOut, self.pipe27_cold.QTHIn)
        self.connect(self.pipe27_cold.QTHOut, self.nodeD7_cold.QTHConn[1])
        self.connect(self.nodeD7_cold.QTHConn[2], self.pipe25_cold.QTHIn)
        self.connect(self.pipe25_cold.QTHOut, self.pipe15_cold.QTHIn)
        self.connect(self.pipe15_cold.QTHOut, self.nodeB1_cold.QTHConn[1])
        self.connect(self.nodeB1_cold.QTHConn[2], self.pipe9_cold.QTHIn)
        self.connect(self.pipe9_cold.QTHOut, self.pipe7_cold.QTHIn)
        self.connect(self.pipe7_cold.QTHOut, self.pipe5_cold.QTHIn)
        self.connect(self.pipe5_cold.QTHOut, self.nodeS2_cold.QTHConn[1])
        self.connect(self.nodeS2_cold.QTHConn[2], self.pipe1b_cold.QTHIn)
        self.connect(self.pipe1b_cold.QTHOut, self.pipe1a_cold.QTHIn)
        self.connect(self.pipe1a_cold.QTHOut, self.source1.QTHIn)

        # Source2
        self.connect(self.source2.QTHOut, self.pipe4a_hot.QTHIn)
        self.connect(self.pipe4a_hot.QTHOut, self.pump2.QTHIn)
        self.connect(self.pump2.QTHOut, self.pipe4b_hot.QTHIn)
        self.connect(self.pipe4b_hot.QTHOut, self.nodeS2_hot.QTHConn[3])
        self.connect(self.nodeS2_cold.QTHConn[3], self.pipe4a_cold.QTHIn)
        self.connect(self.pipe4a_cold.QTHOut, self.pipe4b_cold.QTHIn)
        self.connect(self.pipe4b_cold.QTHOut, self.source2.QTHIn)

        # Demand7
        self.connect(self.nodeD7_hot.QTHConn[3], self.pipe26_hot.QTHIn)
        self.connect(self.pipe26_hot.QTHOut, self.demand7.QTHIn)
        self.connect(self.demand7.QTHOut, self.pipe26_cold.QTHIn)
        self.connect(self.pipe26_cold.QTHOut, self.nodeD7_cold.QTHConn[3])

        # Demand92
        self.connect(self.nodeD92_hot.QTHConn[3], self.pipe30_hot.QTHIn)
        self.connect(self.pipe30_hot.QTHOut, self.demand92.QTHIn)
        self.connect(self.demand92.QTHOut, self.pipe30_cold.QTHIn)
        self.connect(self.pipe30_cold.QTHOut, self.nodeD92_cold.QTHConn[3])

        # Buffer1
        # Hot
        self.connect(self.nodeB1_hot.QTHConn[3], self.pipe52_hot.QTHIn)
        self.connect(self.pipe52_hot.QTHOut, self.buffer1.QTHIn)
        # Cold
        self.connect(self.buffer1.QTHOut, self.pipe52_cold.QTHIn)
        self.connect(self.pipe52_cold.QTHOut, self.nodeB1_cold.QTHConn[3])
