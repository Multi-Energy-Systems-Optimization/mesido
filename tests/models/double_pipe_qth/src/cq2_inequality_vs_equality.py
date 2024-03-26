from abc import ABCMeta

from mesido.qth_not_maintained.qth_loop_mixin import QTHLoopMixin
from mesido.qth_not_maintained.qth_mixin import HeadLossOption, QTHMixin

from rtctools.util import run_optimization_problem

if __name__ == "__main__":
    from double_pipe_qth import DoublePipeBase
else:
    from .double_pipe_qth import DoublePipeBase


class SwitchQTHToQTHLoop(ABCMeta):
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


class Base(DoublePipeBase):
    def times(self, variable=None):
        times = super().times(variable)
        return times  # [:2]


class LinearEqualityHeadLossMixin:
    def heat_network_options(self):
        options = super().heat_network_options()
        options["head_loss_option"] = HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
        return options


class QuadraticEqualityHeadLossMixin:
    def heat_network_options(self):
        options = super().heat_network_options()
        options["head_loss_option"] = HeadLossOption.CQ2_EQUALITY
        return options


class EqualLengthInequality(Base):
    model_name = "DoublePipeEqualQTH"


class UnequalLengthInequality(Base):
    model_name = "DoublePipeUnequalQTH"


class UnequalLengthValveInequality(Base):
    model_name = "DoublePipeUnequalWithValveQTH"


class EqualLengthLinearEquality(LinearEqualityHeadLossMixin, EqualLengthInequality):
    pass


class UnequalLengthLinearEquality(LinearEqualityHeadLossMixin, UnequalLengthInequality):
    pass


class UnequalLengthValveLinearEquality(LinearEqualityHeadLossMixin, UnequalLengthValveInequality):
    pass


class EqualLengthQuadraticEquality(QuadraticEqualityHeadLossMixin, EqualLengthInequality):
    pass


class UnequalLengthQuadraticEquality(QuadraticEqualityHeadLossMixin, UnequalLengthInequality):
    pass


class UnequalLengthValveQuadraticEquality(
    QuadraticEqualityHeadLossMixin, UnequalLengthValveInequality
):
    pass


class UnequalLengthQuadraticEqualityLoop(
    UnequalLengthQuadraticEquality, metaclass=SwitchQTHToQTHLoop
):
    pass


if __name__ == "__main__":
    # Cases that use only inequality formulations
    equal_length_inequality = run_optimization_problem(EqualLengthInequality)
    unequal_length_inequality = run_optimization_problem(UnequalLengthInequality)
    unequal_length_valve_inequality = run_optimization_problem(UnequalLengthValveInequality)

    # Cases that use linear equality formulation
    equal_length_linear_equality = run_optimization_problem(EqualLengthLinearEquality)
    unequal_length_linear_equality = run_optimization_problem(UnequalLengthLinearEquality)
    unequal_length_valve_linear_equality = run_optimization_problem(
        UnequalLengthValveLinearEquality
    )

    # Cases that use C*Q^2 equality formulations
    equal_length_quadratic_equality = run_optimization_problem(EqualLengthQuadraticEquality)
    unequal_length_quadratic_equality = run_optimization_problem(UnequalLengthQuadraticEquality)
    unequal_length_valve_quadratic_equality = run_optimization_problem(
        UnequalLengthValveQuadraticEquality
    )

    # Cases that use C*Q^2 equality formulations with the loop mixin
    unequal_length_quadratic_equality_loop = run_optimization_problem(
        UnequalLengthQuadraticEqualityLoop
    )
