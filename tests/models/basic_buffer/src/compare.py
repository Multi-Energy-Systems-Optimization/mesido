import sys
import time
from abc import ABCMeta
from pathlib import Path

from mesido.pycml.pycml_mixin import PyCMLMixin
from mesido.qth_not_maintained.qth_loop_mixin import (
    BufferTargetDischargeGoal,
    QTHLoopMixin,
)
from mesido.qth_not_maintained.qth_mixin import QTHMixin
from mesido.qth_not_maintained.util import run_heat_network_optimization

from rtctools.optimization.modelica_mixin import ModelicaMixin

# We want to import the example we compare with as a module that is somewhat
# uniquely identifiable. We therefore start from the root.
root_folder = str(Path(__file__).resolve().parent.parent.parent.parent.parent)
sys.path.insert(1, root_folder)

import examples.basic_buffer.src.example  # noqa: E402, I100
from examples.basic_buffer.src.example import (  # noqa: E402, I100
    HeatProblem as _HeatProblem,
    QTHProblem as _QTHProblem,
)

base_folder = Path(examples.basic_buffer.src.example.__file__).resolve().parent.parent

del root_folder
sys.path.pop(1)

if __name__ == "__main__":
    from model_heat import ModelHeat
    from model_qth import ModelQTH
else:
    from .model_heat import ModelHeat
    from .model_qth import ModelQTH


class SwitchModelicaToPyCML(ABCMeta):
    def mro(cls):
        assert len(cls.__bases__) == 1
        return [cls] + [x if x != ModelicaMixin else PyCMLMixin for x in cls.__bases__[0].__mro__]


class SwitchQTHToQTHLoop(SwitchModelicaToPyCML, ABCMeta):
    def mro(cls):
        assert len(cls.__bases__) == 1

        bases = list(cls.__bases__[0].__mro__)
        index = bases.index(QTHMixin)
        try:
            ind_loop = bases.index(QTHLoopMixin)
            assert ind_loop == index - 1
        except ValueError:
            bases.insert(index, QTHLoopMixin)

        return [cls, *bases]


class HeatProblemModelica(_HeatProblem):
    def priority_completed(self, priority):
        super().priority_completed(priority)

        if not hasattr(self, "_objective_values"):
            self._objective_values = []
        self._objective_values.append(self.objective_value)

    def post(self):
        pass


class QTHProblemModelica(_QTHProblem):
    def priority_completed(self, priority):
        super().priority_completed(priority)

        if not hasattr(self, "_objective_values"):
            self._objective_values = []
        self._objective_values.append(self.objective_value)

    def post(self):
        pass


class HeatProblemPyCML(HeatProblemModelica, metaclass=SwitchModelicaToPyCML):
    def __init__(self, *args, **kwargs):
        self.__model = ModelHeat()
        super().__init__(*args, **kwargs)

    def pycml_model(self):
        return self.__model


class QTHProblemPyCML(QTHProblemModelica, metaclass=SwitchModelicaToPyCML):
    def __init__(self, *args, **kwargs):
        self.__model = ModelQTH()
        super().__init__(*args, **kwargs)

    def pycml_model(self):
        return self.__model


class QTHLoopProblemPyCML(QTHProblemPyCML, metaclass=SwitchQTHToQTHLoop):
    def __init__(self, *args, **kwargs):
        self.__model = ModelQTH()
        super().__init__(*args, **kwargs)

    def pycml_model(self):
        return self.__model

    def goals(self):
        goals = super().goals()
        buffer_goals = self.buffer_target_discharge_goals(priority=5)
        return [*goals, *buffer_goals]

    def post(self):
        super().post()
        goals = [*self.goals(), *self.path_goals()]
        buffer_target_goal_priority = sorted({g.priority for g in goals})[1]
        assert all(
            g.priority == buffer_target_goal_priority
            for g in goals
            if isinstance(g, BufferTargetDischargeGoal)
        )


if __name__ == "__main__":
    # Run
    start_time = time.time()

    m1, m2 = run_heat_network_optimization(
        HeatProblemModelica, QTHProblemModelica, base_folder=base_folder
    )
    e1, e2 = run_heat_network_optimization(
        HeatProblemPyCML, QTHProblemPyCML, base_folder=base_folder
    )

    e1_loop, e2_loop = run_heat_network_optimization(
        HeatProblemPyCML, QTHLoopProblemPyCML, base_folder=base_folder
    )

    # Output runtime
    print("Execution time: " + time.strftime("%H:%M:%S", time.gmtime(time.time() - start_time)))
