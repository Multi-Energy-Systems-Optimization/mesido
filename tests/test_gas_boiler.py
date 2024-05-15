from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestGasBoiler(TestCase):
    def test_gas_boiler(self):
        """
        This tests checks the gas boiler for the standard checks and the energy conservation over
        the commodity change.

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge
        4. energy conservation over the commodity

        """
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            SourcePipeSink,
            base_folder=base_folder,
            esdl_file_name="sourcesink_withgasboiler.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = heat_problem.extract_results()
        parameters = heat_problem.parameters(0)

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)

        np.testing.assert_array_less(0.0, results["GasHeater_f713.Heat_source"])
        np.testing.assert_array_less(0.0, results["GasProducer_82ec.Gas_source_mass_flow"])
        np.testing.assert_array_less(
            parameters["GasHeater_f713.internal_energy"]
            * results["GasHeater_f713.GasIn.mass_flow"],
            results["GasHeater_f713.Heat_source"] + 1.0e-6,
        )
