from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

from rtctools.util import run_optimization_problem


class TestEmerge(TestCase):
    def test_emerge_workflow(self):
        """
        This test checks if the emerge workflow is succesfully optimized

        Checks:
        1. check if solver succeeds

        """
        import models.emerge.src.example as example
        from mesido.workflows.emerge import EmergeWorkFlow

        base_folder = Path(example.__file__).resolve().parent.parent

        # TODO: use the new run_esdl_mesido_optimization function
        _ = run_optimization_problem(
            EmergeWorkFlow,
            base_folder=base_folder,
            esdl_file_name="emerge.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
