from mesido.workflows.utils import helpers

import pytest


@pytest.mark.parametrize(
    "error_message",
    [
        "TOO MANY SESSIONS",
        "Failed to create GUROBI environment. Flag: 10009:Single-use license. "
        "Another gurobi process running.",
    ],
)
def test_gurobi_session_retry_retries_license_errors(error_message, monkeypatch):
    """Retry solver calls that fail with a Gurobi license-session error.

    Checks:
    1. The solver succeeds after a license-session error
    2. The solver is called twice
    """
    monkeypatch.setattr(helpers, "GUROBI_SESSION_RETRY_INTERVAL_S", 0)
    attempts = 0

    def solver():
        """Fail once with the parameterized license error, then succeed."""
        nonlocal attempts
        attempts += 1
        if attempts == 1:
            raise RuntimeError(error_message)
        return "solution"

    retrying_solver = helpers._with_gurobi_session_retry(solver)

    assert retrying_solver() == "solution"
    assert attempts == 2


def test_gurobi_session_retry_propagates_unrelated_errors():
    """Propagate unrelated solver errors without retrying.

    Checks:
    1. The unrelated error is propagated
    2. The solver is called only once
    """
    attempts = 0

    def solver():
        """Always raise an unrelated error while counting attempts."""
        nonlocal attempts
        attempts += 1
        raise RuntimeError("unrelated error")

    retrying_solver = helpers._with_gurobi_session_retry(solver)

    with pytest.raises(RuntimeError, match="unrelated error"):
        retrying_solver()

    assert attempts == 1


def test_optimization_problem_solver_applies_gurobi_retry(monkeypatch):
    """Apply Gurobi session retries to optimization problem solver calls.

    Checks:
    1. The solver succeeds after a Gurobi session error
    2. The solver is called twice
    """
    monkeypatch.setattr(helpers, "GUROBI_SESSION_RETRY_INTERVAL_S", 0)
    attempts = 0

    def solver():
        """Fail on the first call with a Gurobi session error, then succeed."""
        nonlocal attempts
        attempts += 1
        if attempts == 1:
            raise RuntimeError("TOO MANY SESSIONS")
        return "solution"

    class Problem:
        def solver_options(self):
            """Expose the test solver through the expected solver options."""
            return {"casadi_solver": solver}

    def run_optimization_problem(problem_class, **kwargs):
        """Run the solver from the supplied problem class."""
        assert kwargs == {"run_option": "test"}
        return problem_class().solver_options()["casadi_solver"]()

    monkeypatch.setattr(helpers, "run_optimization_problem", run_optimization_problem)

    result = helpers.run_optimization_problem_solver(Problem, run_option="test")

    assert result == "solution"
    assert attempts == 2
