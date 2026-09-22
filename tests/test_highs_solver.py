"""Tests for the HiGHS solver integration via rtctools-highs.

Verifies:
1. rtctools_highs registers the pinned HiGHS version (see EXPECTED_HIGHS_VERSION
   below) rather than the older version bundled with CasADi.
2. The Python GIL is released during CasADi solves, enabling concurrent Python
   threads while the solver runs. This requires CasADi to be built with GIL
   release support (see mesido's setup.py / requirements for the pinned version).
"""

import re
import threading
import time

import casadi as ca

import numpy as np

import rtctools_highs  # noqa: F401 — registers the pinned HiGHS plugin with CasADi

# HiGHS version registered by the "rtctools-highs" pin in setup.py. Update this
# when that pin changes — the upstream release tag encodes the bundled HiGHS
# version (format: "highs-<HIGHS_VERSION>-casadi-<CASADI_VERSION>", see
# https://github.com/rtc-tools/rtc-tools-casadi-plugins/tags).
EXPECTED_HIGHS_VERSION = "1.15.1"


def _make_solver(**highs_opts):
    x = ca.MX.sym("x")
    qp = {"x": x, "f": (x - 1) ** 2, "g": x}
    return ca.qpsol("s", "highs", qp, {"highs": highs_opts})


# Weight-to-value offset for _make_slow_knapsack_solver. A "strongly correlated"
# knapsack (value close to weight) makes the LP relaxation's bound weak, so
# branch-and-bound can't prune effectively — a classic slow-to-solve instance family.
KNAPSACK_VALUE_WEIGHT_OFFSET = 50


def _make_slow_knapsack_solver(n_items=40, seed=1):
    """Build a HiGHS MILP knapsack solver and its capacity bound.

    The instance is sized to take ~1s to solve — long enough to span many GIL
    switch intervals — while being trivial to construct symbolically.

    Returns (solver, capacity): capacity is the constraint bound to pass at
    call time (ubg=capacity), not a solver configuration option.
    """
    rng = np.random.default_rng(seed)
    weights = rng.integers(1, 10000, n_items).astype(float)
    values = weights + KNAPSACK_VALUE_WEIGHT_OFFSET
    capacity = weights.sum() / 2

    x = ca.MX.sym("x", n_items)
    qp = {"x": x, "f": -ca.dot(values, x), "g": ca.dot(weights, x)}
    solver = ca.qpsol(
        "s",
        "highs",
        qp,
        {
            "highs": {"output_flag": False, "mip_rel_gap": 1e-9},
            "discrete": [True] * n_items,
        },
    )
    return solver, capacity


class TestHiGHSVersion:
    def test_highs_version(self, tmp_path):
        """The HiGHS version registered by rtctools_highs must match the pinned version."""
        log_file = str(tmp_path / "highs.log")
        solver = _make_solver(output_flag=True, log_file=log_file)
        solver(lbx=-10, ubx=10, lbg=0, ubg=2)

        assert solver.stats()["return_status"] == "Optimal"

        log = (tmp_path / "highs.log").read_text()
        match = re.search(r"Running HiGHS (\S+)", log)
        assert match, f"HiGHS version line not found in log:\n{log}"
        assert match.group(1) == EXPECTED_HIGHS_VERSION, (
            f"Expected HiGHS {EXPECTED_HIGHS_VERSION} but got {match.group(1)} — "
            "the CasADi-bundled HiGHS version may have been loaded instead"
        )


class TestGILRelease:
    """Verify that CasADi releases the GIL during solves.

    GIL release means Python threads can run concurrently while CasADi/HiGHS
    is solving. We verify this by running a HiGHS solve in a background thread
    and confirming a Python counter increments during the solve — which only
    happens if the GIL is released.
    """

    def test_gil_released_during_solve(self):
        # The solve must be a single call exceeding CPython's 5ms GIL switch
        # interval — a loop of fast solves would yield the GIL on its own and
        # prove nothing.
        solver, capacity = _make_slow_knapsack_solver()

        counter = {"n": 0}
        result = {"status": None, "error": None, "elapsed": None}
        solve_done = threading.Event()
        counter_ready = threading.Event()

        def run_solve():
            counter_ready.wait()
            try:
                t0 = time.perf_counter()
                solver(lbx=0, ubx=1, lbg=0, ubg=capacity)
                result["elapsed"] = time.perf_counter() - t0
                result["status"] = solver.stats()["return_status"]
            except Exception as e:  # noqa — re-raised on the main thread below
                result["error"] = e
            finally:
                solve_done.set()

        def increment_counter():
            counter_ready.set()
            while not solve_done.is_set():
                counter["n"] += 1
                time.sleep(0.0001)

        counter_thread = threading.Thread(target=increment_counter, daemon=True)
        # Daemon: if the solve hangs past the join timeout below, the test must
        # still be able to fail and exit rather than block interpreter shutdown.
        solve_thread = threading.Thread(target=run_solve, daemon=True)

        counter_thread.start()
        solve_thread.start()
        solve_thread.join(timeout=30)
        solve_done.set()  # stop counter_thread even if the join above timed out
        assert not solve_thread.is_alive(), "Solve timed out"

        # An assert/exception inside run_solve wouldn't otherwise fail the test,
        # since exceptions raised on a background thread don't propagate to pytest.
        if result["error"] is not None:
            raise result["error"]
        assert result["status"] == "Optimal", f"Unexpected solver status: {result['status']}"

        # The counter check below is only meaningful if the solve actually spanned
        # many GIL switch intervals; a solve that finished too fast would pass for
        # the wrong reason (Python-level scheduling noise, not real GIL release).
        assert result["elapsed"] > 0.1, (
            f"Solve finished in {result['elapsed']:.4f}s, too fast for this test to "
            "distinguish real GIL release from scheduling noise. The knapsack "
            "instance may need to be made harder (e.g. more items)."
        )

        assert counter["n"] > 200, (
            "Counter did not advance meaningfully during solve — GIL may not have "
            "been released. Check that casadi was built with "
            "WITH_PYTHON_GIL_RELEASE=ON."
        )
