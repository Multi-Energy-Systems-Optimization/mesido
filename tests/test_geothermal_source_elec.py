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


class TestGeothermalSourceElec(TestCase):

    def test_geothermal_source_elec(self):
        """
        This tests checks the electric geothermal source for the standard checks and the energy conservation
        over the commodity change.

        Checks:
        1. Demand is matched.
        2. Energy is conserved in the network.
        3. Heat to discharge.
        4. Electric power is conserved.
        5. Checks that the asset equations behave as expected.
        6. Variable operational cost check.
        """
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            SourcePipeSink,
            base_folder=base_folder,
            esdl_file_name="sourcesink_with_geo_elec.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = heat_problem.extract_results()
        parameters = heat_problem.parameters(0)

        # Standard checks.
        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)
        electric_power_conservation_test(heat_problem, results)

        # Equations check
        np.testing.assert_array_less(0.0, results["GeothermalSource_a77b.Heat_source"])
        np.testing.assert_array_less(0.0, results["ElectricityProducer_4dde.ElectricityOut.Power"])
        np.testing.assert_array_less(
            parameters["GeothermalSource_a77b.cop"] * results["GeothermalSource_a77b.Power_elec"],
            results["GeothermalSource_a77b.Heat_source"] + 1.0e-6,
        )

        # Variable operational cost check.
        np.testing.assert_allclose(
            parameters["GeothermalSource_a77b.variable_operational_cost_coefficient"]
            * sum(results["GeothermalSource_a77b.Heat_source"][1:])
            / parameters["GeothermalSource_a77b.cop"],
            results["GeothermalSource_a77b__variable_operational_cost"],
        )


if __name__ == "__main__":  
    TestElecBoiler = TestGeothermalSourceElec()
    TestElecBoiler.test_geothermal_source_elec()

