from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

import numpy as np

from rtctools.util import run_optimization_problem


class TestESDL(TestCase):
    def test_basic_source_and_demand_heat(self):
        """
        Check whether a hardcoded pycml model gives equivalent results compared to an esdl
        specified model. The model consists out of a source, pipe and demand

        Checks:
        - that the milp demand is equal.

        """
        import models.basic_source_and_demand.src.heat_comparison as heat_comparison
        from models.basic_source_and_demand.src.heat_comparison import HeatESDL, HeatPython

        base_folder = Path(heat_comparison.__file__).resolve().parent.parent
        input_folder = base_folder / "input"

        case_python = run_optimization_problem(
            HeatPython, base_folder=base_folder, input_folder=input_folder
        )
        case_esdl = run_optimization_problem(
            HeatESDL,
            base_folder=base_folder,
            esdl_file_name="model.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.xml",
        )

        self.assertAlmostEqual(case_python.objective_value, case_esdl.objective_value, 6)

        np.testing.assert_allclose(
            case_python.extract_results()["demand.Heat_demand"],
            case_esdl.extract_results()["demand.Heat_demand"],
        )

    # def test_basic_source_and_demand_qth(self):
    #     import models.basic_source_and_demand.src.qth_comparison as qth_comparison
    #     from models.basic_source_and_demand.src.qth_comparison import QTHPython, QTHESDL
    #
    #     base_folder = Path(qth_comparison.__file__).resolve().parent.parent
    #
    #     case_python = run_optimization_problem(QTHPython, base_folder=base_folder)
    #     case_esdl = run_optimization_problem(QTHESDL, base_folder=base_folder)
    #
    #     np.testing.assert_allclose(
    #         case_python._objective_values[0], case_esdl._objective_values, rtol=1e-5, atol=1e-5
    #     )


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestESDL()
    a.test_basic_source_and_demand_heat()
    temp = 0
