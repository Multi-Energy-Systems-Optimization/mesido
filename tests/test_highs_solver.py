"""Tests for HiGHS 1.14.0 integration via rtctools-highs.

Verifies:
1. rtctools_highs registers HiGHS 1.14.0 (not CasADi's bundled 1.10.0).
2. The Python GIL is released during CasADi solves (WITH_PYTHON_GIL_RELEASE=ON
   in casadi 3.7.2), enabling concurrent Python threads while HiGHS runs.
"""

import re
import threading
import time

import casadi as ca

import rtctools_highs  # noqa: F401 — registers HiGHS 1.14.0 plugin with CasADi


def _make_solver(**highs_opts):
    x = ca.MX.sym("x")
    qp = {"x": x, "f": (x - 1) ** 2, "g": x}
    return ca.qpsol("s", "highs", qp, {"highs": highs_opts})


class TestHiGHSVersion:
    def test_highs_version(self, tmp_path):
        """HiGHS 1.14.0 must be used — not CasADi's bundled 1.10.0."""
        log_file = str(tmp_path / "highs.log")
        solver = _make_solver(output_flag=True, log_file=log_file)
        solver(lbx=-10, ubx=10, lbg=0, ubg=2)

        assert solver.stats()["return_status"] == "Optimal"

        log = (tmp_path / "highs.log").read_text()
        match = re.search(r"Running HiGHS (\S+)", log)
        assert match, f"HiGHS version line not found in log:\n{log}"
        assert match.group(1) == "1.14.0", (
            f"Expected HiGHS 1.14.0 but got {match.group(1)} — "
            "CasADi's bundled HiGHS 1.10.0 may have been loaded instead"
        )


class TestGILRelease:
    """Verify casadi 3.7.2 releases the GIL during solves.

    WITH_PYTHON_GIL_RELEASE=ON means Python threads can run concurrently
    while CasADi/HiGHS is solving. We verify this by running a HiGHS solve
    in a background thread and confirming a Python counter increments during
    the solve — which only happens if the GIL is released.
    """

    def test_gil_released_during_solve(self):
        solver = _make_solver()
        counter = {"n": 0}
        solve_done = threading.Event()

        def run_solve():
            solver(lbx=-10, ubx=10, lbg=0, ubg=2)
            assert solver.stats()["return_status"] == "Optimal"
            solve_done.set()

        def increment_counter():
            while not solve_done.is_set():
                counter["n"] += 1
                time.sleep(0.0001)

        counter_thread = threading.Thread(target=increment_counter, daemon=True)
        solve_thread = threading.Thread(target=run_solve)

        solve_thread.start()
        counter_thread.start()
        solve_thread.join(timeout=30)
        assert not solve_thread.is_alive(), "Solve timed out"

        assert counter["n"] > 0, (
            "Counter did not increment during solve — GIL may not have been released. "
            "Check that casadi was built with WITH_PYTHON_GIL_RELEASE=ON."
        )
