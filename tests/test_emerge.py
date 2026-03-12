from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization


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

        _ = run_esdl_mesido_optimization(
            EmergeWorkFlow,
            base_folder=base_folder,
            esdl_file_name="emerge.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        # TODO: checks on values need to be added, not sure if cost values now make sense, scaling
        #  is not too bad, but if presolve of HIGHS is on, it becomes infeasible.


if __name__ == "__main__":

    a = TestEmerge()
    a.test_emerge_workflow()
