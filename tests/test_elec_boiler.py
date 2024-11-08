from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import (
    demand_matching_test,
    electric_power_conservation_test,
    energy_conservation_test,
    heat_to_discharge_test,
)


class TestElecBoiler(TestCase):
    def test_elec_boiler(self):
        """
        This tests checks the elec boiler for the standard checks and the energy conservation over
        the commodity change.

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge
        4. energy conservation over the heat and electricity commodity
        """
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            SourcePipeSink,
            base_folder=base_folder,
            esdl_file_name="sourcesink_witheboiler.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = heat_problem.extract_results()
        parameters = heat_problem.parameters(0)

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)
        electric_power_conservation_test(heat_problem, results)

        np.testing.assert_array_less(0.0, results["ElectricBoiler_9aab.Heat_source"])
        np.testing.assert_array_less(0.0, results["ElectricityProducer_4dde.ElectricityOut.Power"])
        np.testing.assert_array_less(
            parameters["ElectricBoiler_9aab.efficiency"]
            * results["ElectricBoiler_9aab.Power_consumed"],
            results["ElectricBoiler_9aab.Heat_source"] + 1.0e-6,
        )

    def test_air_water_hp_elec(self):
        """
        This tests checks the air-water hp elec for the standard checks and the energy conservation
        over the commodity change.

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
            esdl_file_name="sourcesink_withHP.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = heat_problem.extract_results()
        parameters = heat_problem.parameters(0)

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)
        electric_power_conservation_test(heat_problem, results)

        np.testing.assert_array_less(0.0, results["HeatPump_d8fd.Heat_source"])
        np.testing.assert_array_less(0.0, results["ElectricityProducer_4dde.ElectricityOut.Power"])
        np.testing.assert_array_less(
            parameters["HeatPump_d8fd.cop"] * results["HeatPump_d8fd.Power_consumed"],
            results["HeatPump_d8fd.Heat_source"] + 1.0e-6,
        )


if __name__ == "__main__":
    TestElecBoiler = TestElecBoiler()
    TestElecBoiler.test_elec_boiler()
    TestElecBoiler.test_air_water_hp_elec()
