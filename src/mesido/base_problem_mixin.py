import numpy as np


class BaseProblemMixin:

    @staticmethod
    def _symmetric_big_m_constraints(expr, slack, nominal):
        """Return paired bigM constraints that enforce expr == 0 when slack is inactive."""
        return [
            ((expr + slack) / nominal, 0.0, np.inf),
            ((expr - slack) / nominal, -np.inf, 0.0),
        ]

    @staticmethod
    def _big_m_ineq_constraints(expr, slack, big_m, nominal):
        """Return paired bigM constraints that enforce expr =< 0 when a binary slack is active
        and expr >= 0 when a binary slack is inactive."""
        return [
            ((expr + slack * big_m) / nominal, 0.0, np.inf),
            ((expr - (1.0 - slack) * big_m) / nominal, -np.inf, 0.0),
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

    def __state_vector_scaled(self, variable: str, ensemble_member: int):
        """
        This functions returns the casadi symbols scaled with their nominal for the entire time
        horizon.
        """
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )
