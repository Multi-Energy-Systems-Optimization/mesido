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

import rtctools_highs  # noqa: F401 — registers the pinned HiGHS plugin with CasADi

# The HiGHS solver version that the pinned "rtctools-highs" release in setup.py
# is expected to register. Update this single constant when the pin changes,
# rather than hard-coding the version elsewhere in this test.
# As of rtctools-highs 0.1.4, the upstream release is tagged with the bundled
# versions it contains (e.g. "highs-1.15.1-casadi-3.7.2" at
# https://github.com/rtc-tools/rtc-tools-casadi-plugins/tags). Whenever the
# "rtctools-highs" pin in setup.py is bumped, update EXPECTED_HIGHS_VERSION to
# match the HiGHS version encoded in that new release's tag.
EXPECTED_HIGHS_VERSION = "1.15.1"


def _make_solver(**highs_opts):
    x = ca.MX.sym("x")
    qp = {"x": x, "f": (x - 1) ** 2, "g": x}
    return ca.qpsol("s", "highs", qp, {"highs": highs_opts})


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
