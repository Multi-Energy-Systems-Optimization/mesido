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
    monkeypatch.setattr(helpers, "GUROBI_SESSION_RETRY_INTERVAL_S", 0)
    attempts = 0

    def solver():
        nonlocal attempts
        attempts += 1
        if attempts == 1:
            raise RuntimeError(error_message)
        return "solution"

    retrying_solver = helpers._with_gurobi_session_retry(solver)

    assert retrying_solver() == "solution"
    assert attempts == 2


def test_gurobi_session_retry_propagates_unrelated_errors():
    attempts = 0

    def solver():
        nonlocal attempts
        attempts += 1
        raise RuntimeError("unrelated error")

    retrying_solver = helpers._with_gurobi_session_retry(solver)

    with pytest.raises(RuntimeError, match="unrelated error"):
        retrying_solver()

    assert attempts == 1


def test_optimization_problem_solver_applies_gurobi_retry(monkeypatch):
    monkeypatch.setattr(helpers, "GUROBI_SESSION_RETRY_INTERVAL_S", 0)
    attempts = 0

    def solver():
        nonlocal attempts
        attempts += 1
        if attempts == 1:
            raise RuntimeError("TOO MANY SESSIONS")
        return "solution"

    class Problem:
        def solver_options(self):
            return {"casadi_solver": solver}

    def run_optimization_problem(problem_class, **kwargs):
        assert kwargs == {"run_option": "test"}
        return problem_class().solver_options()["casadi_solver"]()

    monkeypatch.setattr(helpers, "run_optimization_problem", run_optimization_problem)

    result = helpers.run_optimization_problem_solver(Problem, run_option="test")

    assert result == "solution"
    assert attempts == 2
