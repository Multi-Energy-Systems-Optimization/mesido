from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from tests.utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestMaxRampConstraintWarmingUp3A(TestCase):
    def test_max_ramp_constraint_case_3a(self):
        """
        Validate max ramp constraints on warming-up unit case 3a by enforcing
        ramp constraints in a dedicated test problem and checking the optimized
        heat-flow ramps against their limits. First validating that the orginal problem without a
        ramp constraint does violate the ramp limits, and then validating that the ramp-limited
        problem does not violate the ramp limits.
        """
        import models.unit_cases.case_3a.src.run_3a as run_3a
        from models.unit_cases.case_3a.src.run_3a import HeatProblem

        base_folder = Path(run_3a.__file__).resolve().parent.parent

        class RampLimitedHeatProblem(HeatProblem):
            def parameters(self, ensemble_member):
                parameters = super().parameters(ensemble_member)
                for source in self.energy_system_components.get("heat_source", []):
                    parameters[f"{source}.max_ramp_coeff"] = 0.10
                return parameters

        baseline_solution = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="3a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )

        ramp_limited_solution = run_esdl_mesido_optimization(
            RampLimitedHeatProblem,
            base_folder=base_folder,
            esdl_file_name="3a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )

        baseline_results = baseline_solution.extract_results()
        results = ramp_limited_solution.extract_results()
        parameters = ramp_limited_solution.parameters(0)
        bounds = ramp_limited_solution.bounds()
        dt_hrs = np.diff(ramp_limited_solution.times()) / 3600.0

        demand_matching_test(ramp_limited_solution, results)
        energy_conservation_test(ramp_limited_solution, results)
        heat_to_discharge_test(ramp_limited_solution, results)

        any_stricter_than_baseline = False

        for source in ramp_limited_solution.energy_system_components.get("heat_source", []):
            max_ramp_coeff = parameters.get(f"{source}.max_ramp_coeff", 1.0)
            np.testing.assert_allclose(max_ramp_coeff, 0.10, rtol=1e-3)

            heat_flow = results[f"{source}.Heat_flow"]
            ramp_abs = np.abs(np.diff(heat_flow))
            baseline_heat_flow = baseline_results[f"{source}.Heat_flow"]
            baseline_ramp_abs = np.abs(np.diff(baseline_heat_flow))

            max_size_var = f"{source}__max_size"
            if max_size_var in results:
                max_size = float(np.atleast_1d(results[max_size_var])[0])
            else:
                lb, ub = bounds[f"{source}.Heat_flow"]
                max_size = max(abs(float(lb)), abs(float(ub)))

            ramp_limit = dt_hrs * max_ramp_coeff * max_size
            tol = 1.0e-6 * max(1.0, abs(max_size))
            np.testing.assert_array_less(ramp_abs, ramp_limit + tol)

            # Ensure at least one source/timestep is strictly more ramp-limited.
            if np.any(ramp_limit < baseline_ramp_abs):
                any_stricter_than_baseline = True

        self.assertTrue(
            any_stricter_than_baseline,
            "Ramp-limited case did not produce any stricter ramp than baseline 3a.",
        )
