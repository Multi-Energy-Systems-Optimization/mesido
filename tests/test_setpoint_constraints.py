from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

import pytest


class TestSetpointConstraints(TestCase):
    @pytest.mark.first
    def test_setpoint_constraints(self):
        """
        his function checks the working of the setpoint constraints for a few cases to ensure the
        behaviour is as expected. The setpoint constraints are used to enforce a maximum number of
        changes allowed of X times over a desired window length.

        Checks:
        - That setpoint does not change over windowlength if 0 is specified.
        - That setpoint does not change over windowlength if 0 is specified via the
        ESDLAdditionalVarsMixin.
        - That setpoint indeed changes once if 1 is specified.

        """
        import models.unit_cases.case_3a.src.run_3a as run_3a
        from models.unit_cases.case_3a.src.run_3a import HeatProblemSetPointConstraints

        base_folder = Path(run_3a.__file__).resolve().parent.parent

        _heat_problem_3 = run_esdl_mesido_optimization(
            HeatProblemSetPointConstraints,
            base_folder=base_folder,
            esdl_file_name="3a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
            **{"timed_setpoints": {"GeothermalSource_b702": (45, 1)}},
        )
        results_3 = _heat_problem_3.extract_results()

        _heat_problem_4 = run_esdl_mesido_optimization(
            HeatProblemSetPointConstraints,
            base_folder=base_folder,
            esdl_file_name="3a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
            **{"timed_setpoints": {"GeothermalSource_b702": (45, 0)}},
        )
        results_4 = _heat_problem_4.extract_results()

        # Here we check whehter the ESDLAdditionalVarsMixin is working as intended when
        # a constraint for the setpoints is specified
        import models.unit_cases.case_3a_setpoint.src.run_3a as run_3a
        from models.unit_cases.case_3a_setpoint.src.run_3a import HeatProblem

        base_folder = Path(run_3a.__file__).resolve().parent.parent

        sol_esdl_setpoints = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="3a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )
        results_4 = _heat_problem_4.extract_results()

        esdl_results = sol_esdl_setpoints.extract_results()
        np.testing.assert_array_less(
            abs(
                esdl_results["GeothermalSource_b702.Heat_source"][2:]
                - esdl_results["GeothermalSource_b702.Heat_source"][1:-1]
            ),
            1.0e-6,
        )

        # Check that solution has one setpoint change
        a = abs(
            results_3["GeothermalSource_b702.Heat_source"][2:]
            - results_3["GeothermalSource_b702.Heat_source"][1:-1]
        )
        np.testing.assert_array_less((a >= 1.0).sum(), 2)  # the 1.0 value is a manual threshold

        # Check that solution has no setpoint change
        np.testing.assert_array_less(
            abs(
                results_4["GeothermalSource_b702.Heat_source"][2:]
                - results_4["GeothermalSource_b702.Heat_source"][1:-1]
            ),
            1.0e-3,
        )

    @pytest.mark.second
    def test_run_small_ates_timed_setpoints_2_changes(self):
        """
        Run the small network with ATES and check that the setpoint changes as specified.
        The heat source for producer_1 changes 8 times (consecutively) when no timed_setpoints are
        specified. The 1 year heat demand profiles contains demand values: hourly (peak day), weekly
        (every 5days/120hours/432000s) and 1 time step of 4days (96hours/345600s, step before the
        start of the peak day). Now check that the time_setpoints can limit the setpoint changes to
        2 changes/year.

        Checks:
        - That the setpoint does change twice over window length if 2 is specified

        """
        import models.test_case_small_network_with_ates.src.run_ates as run_ates
        from models.test_case_small_network_with_ates.src.run_ates import HeatProblemSetPoints

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            HeatProblemSetPoints,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
            **{"timed_setpoints": {"HeatProducer_1": (24 * 365, 2)}},
        )
        results = solution.extract_results()
        check = abs(
            results["HeatProducer_1.Heat_source"][2:] - results["HeatProducer_1.Heat_source"][1:-1]
        )
        # check if there are less than 3 switches, a solution might be found with less
        # than 2 switches
        np.testing.assert_array_less((check >= 1.0).sum(), 3.0)

    @pytest.mark.third
    def test_run_small_ates_timed_setpoints_0_changes(self):
        """
        Run the small network with ATES and check that the setpoint changes as specified.
        The heat source for producer_1 changes 8 times (consecutively) when no timed_setpoints are
        specified. The 1 year heat demand profiles contains demand values: hourly (peak day), weekly
        (every 5days/120hours/432000s) and 1 time step of 4days (96hours/345600s, step before the
        start of the peak day). Now check that the time_setpoints can limit the setpoint changes to
        0 changes/year.

        Checks:
        - That setpoint does not change over window length if 0 is specified

        """
        import models.test_case_small_network_with_ates.src.run_ates as run_ates
        from models.test_case_small_network_with_ates.src.run_ates import HeatProblemSetPoints

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            HeatProblemSetPoints,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
            **{"timed_setpoints": {"HeatProducer_1": (24 * 365, 0)}},  # not change at all - works
        )
        results = solution.extract_results()
        check = abs(
            results["HeatProducer_1.Heat_source"][2:] - results["HeatProducer_1.Heat_source"][1:-1]
        )
        np.testing.assert_array_less(check, 1.0e-5)

    @pytest.mark.fourth
    def test_run_small_ates_timed_setpoints_multiple_constraints(self):
        """
        Run the small network with ATES and check that the setpoint changes as specified.
        The heat source for producer_1 changes 8 times (consecutively) when no timed_setpoints are
        specified. The 1 year heat demand profiles contains demand values: hourly (peak day), weekly
        (every 5days/120hours/432000s) and 1 time step of 4days (96hours/345600s, step before the
        start of the peak day). Now check that the time_setpoints can limit the setpoint changes to
        1 changes over multiple window sizes.

        Checks:
        - That setpoint does change once over window length if 1 is specified for multiple
        window sizes

        """
        import models.test_case_small_network_with_ates.src.run_ates as run_ates
        from models.test_case_small_network_with_ates.src.run_ates import HeatProblemSetPoints

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        for ihrs in range(119, 122):
            solution = run_esdl_mesido_optimization(
                HeatProblemSetPoints,
                base_folder=base_folder,
                esdl_file_name="test_case_small_network_with_ates.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="Warmte_test.csv",
                **{"timed_setpoints": {"HeatProducer_1": (ihrs, 1)}},
            )
            results = solution.extract_results()
            diff = (
                results["HeatProducer_1.Heat_source"][2:]
                - results["HeatProducer_1.Heat_source"][1:-1]
            )
            ires = [idx + 2 for idx, val in enumerate(diff) if abs(val) > 1e-6]
            for ii in range(1, len(ires)):
                check = (
                    solution.get_timeseries("HeatingDemand_1.target_heat_demand", 0).times[ires[ii]]
                    - solution.get_timeseries("HeatingDemand_1.target_heat_demand", 0).times[
                        ires[ii - 1]
                    ]
                )
                # The following checks should be true because the changes setpoint changes occur at
                # the during 120hr time intervals
                if ihrs == 119:
                    np.testing.assert_array_less(ihrs * 3600, check)
                elif ihrs == 120:
                    np.testing.assert_equal(np.less_equal(ihrs * 3600, check), True)
                elif ihrs == 121:
                    np.testing.assert_equal(np.less_equal((ihrs - 1) * 3600, check), True)
                else:
                    exit("ii out of range")


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestSetpointConstraints()
    a.test_setpoint_constraints()
    a.test_run_small_ates_timed_setpoints_2_changes()
    a.test_run_small_ates_timed_setpoints_0_changes()
    a.test_run_small_ates_timed_setpoints_multiple_constraints()

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
