import numpy as np


class BaseProblemMixin:


    @staticmethod
    def _symmetric_big_m_constraints(expr, slack, nominal):
        """Return paired bigM constraints that enforce expr == 0 when slack is inactive."""
        return [
            ((expr + slack) / nominal, 0.0, np.inf),
            ((expr - slack) / nominal, -np.inf, 0.0),
        ]

    def goal_programming_options(self):
        """
        Here we set the goal programming configuration. We use soft constraints for consecutive
        goals.
        """
        options = super().goal_programming_options()
        options["keep_soft_constraints"] = True
        return options

    def solver_options(self):
        """
        Here we define the solver options. By default we use the open-source solver cbc and casadi
        solver qpsol.
        """
        options = super().solver_options()
        options["casadi_solver"] = "qpsol"
        options["solver"] = "highs"
        return options

    def compiler_options(self):
        """
        In this function we set the compiler configuration.
        """
        options = super().compiler_options()
        options["resolve_parameter_values"] = True
        return options
