from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.rollout_workflow import RollOutProblem
from rtctools.util import run_optimization_problem


class TestRollOutOptimization(TestCase):

    def test_roll_out_optimization(self):
        """


        Checks:
        - demand matching if placed else demand zero (is_realized variable)
        - heat_to_discharge_test & energy_conservation_test
        - periodiciteit van ATES (end==begin)
        - yearly_storage_initial_value variable implementation (0 when not first timestep of year)
        - yearly max investment
        - to define rollout problem: check that not all heatingdemands are placed in the first
        year, check that all heatingdemands are placed at end of the problem, and both producers
        & ATES.
        - check if integer variables are 0 or 1 for every timestep
        - check number of timesteps in timeseries.
        - if asset placed, also placed for future
        - check percentage is placed


        Missing:
        - Link ATES t0 utilization to state of charge at end of year for optimizations over one
        year.
        """
        #TODO: update location of model also update model & inputfile in run.
        import models.test_case_small_network_with_ates_with_buffer.src.run_ates \
            as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a full year with timesteps of 5 days and hour timesteps
        # for the peak day
        class RollOutTimeStep(RollOutProblem):
            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)

                self._timestep_size = 30 * 24


        solution = run_optimization_problem(
            RollOutTimeStep,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )
        results = solution.extract_results()