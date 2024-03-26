from mesido.pycml import ControlInput, Model as _Model, SymbolicParameter
from mesido.pycml.component_library.qth import Demand, Pipe, Pump, Source


class Model(_Model):
    def __init__(self):
        super().__init__(None)

        # Declare Model Elements
        self.add_variable(SymbolicParameter, "theta")

        self.Q_nominal = 0.001

        self.t_supply_max = 110.0
        self.t_supply_min = 10.0
        self.t_return_max = 110.0
        self.t_return_min = 10.0

        self.t_source_min = 65.0
        self.t_source_max = 85.0
        self.t_demand_min = 70

        self.t_supply_nom = 75.0
        self.t_return_nom = 45.0

        supply_return_modifiers = dict(T_supply=self.t_supply_nom, T_return=self.t_return_nom)

        self.add_variable(
            Source,
            "source",
            Heat_source=dict(min=0.75e5, max=1.25e5, nominal=1e5),
            theta=self.theta,
            QTHOut=dict(T=dict(min=self.t_source_min, max=self.t_source_max)),
            Q_nominal=self.Q_nominal,
            **supply_return_modifiers,
        )

        self.add_variable(
            Demand,
            "demand",
            theta=self.theta,
            QTHIn=dict(T=dict(min=self.t_demand_min)),
            Q_nominal=self.Q_nominal,
            **supply_return_modifiers,
        )

        self.add_variable(
            Pipe,
            "pipe_hot",
            length=1000.0,
            diameter=0.15,
            temperature=self.t_supply_nom,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            QTHIn=dict(T=dict(min=self.t_supply_min, max=self.t_supply_max)),
            QTHOut=dict(T=dict(min=self.t_supply_min, max=self.t_supply_max)),
            **supply_return_modifiers,
        )

        self.add_variable(
            Pipe,
            "pipe_cold",
            length=1000.0,
            diameter=0.15,
            temperature=self.t_return_nom,
            Q=dict(min=0.0, nominal=self.Q_nominal),
            QTHIn=dict(T=dict(min=self.t_return_min, max=self.t_return_max)),
            QTHOut=dict(T=dict(min=self.t_return_min, max=self.t_return_max)),
            **supply_return_modifiers,
        )

        self.add_variable(
            Pump,
            "pump",
            Q=dict(min=0.0, nominal=self.Q_nominal),
            QTHIn=dict(H=dict(min=0.0, max=0.0)),
        )

        self.add_variable(ControlInput, "Heat_source", value=self.source.Heat_source)

        self.connect(self.source.QTHOut, self.pipe_hot.QTHIn)
        self.connect(self.pipe_hot.QTHOut, self.demand.QTHIn)
        self.connect(self.demand.QTHOut, self.pipe_cold.QTHIn)
        self.connect(self.pipe_cold.QTHOut, self.pump.QTHIn)
        self.connect(self.pump.QTHOut, self.source.QTHIn)
