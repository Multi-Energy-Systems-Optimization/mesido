from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import (
    cost_calculation_test,
    demand_matching_test,
    electric_power_conservation_test,
    energy_conservation_test,
    heat_to_discharge_test,
)


class TestElecBoiler(TestCase):

    def test_elec_heat_source_elec(self):
        """
        This tests checks the elec heat sourc elec for the standard checks and the energy
        conservation over the commodity change.

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge
        4. electric power conservation
        5. cost calculation is checked
        """
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            SourcePipeSink,
            base_folder=base_folder,
            esdl_file_name="sourcesink_with_eboiler.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = heat_problem.extract_results()
        parameters = heat_problem.parameters(0)
        name_to_id_map = heat_problem.esdl_asset_name_to_id_map

        e_boiler_id = name_to_id_map["ElectricBoiler_9aab"]
        elec_producer_id = name_to_id_map["ElectricityProducer_4dde"]

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)
        electric_power_conservation_test(heat_problem, results)

        # Check the cost calculations
        np.testing.assert_array_less(99.0, results[f"{e_boiler_id}__investment_cost"])
        np.testing.assert_array_less(99.0, results[f"{e_boiler_id}__installation_cost"])
        np.testing.assert_array_less(10.0, results[f"{e_boiler_id}__variable_operational_cost"])
        cost_calculation_test(heat_problem, results)

        np.testing.assert_array_less(0.0, results[f"{e_boiler_id}.Heat_source"])
        np.testing.assert_array_less(0.0, results[f"{elec_producer_id}.ElectricityOut.Power"])
        np.testing.assert_allclose(
            parameters[f"{e_boiler_id}.efficiency"] * results[f"{e_boiler_id}.Power_consumed"],
            results[f"{e_boiler_id}.Heat_source"],
        )

    def test_heat_source_elec(self):
        """
        This tests checks the heat sourc elec for the standard checks and the energy conservation
        over the commodity change.

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge
        4. cost calculation is checked
        """
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            SourcePipeSink,
            base_folder=base_folder,
            esdl_file_name="sourcesink_with_eboiler_no_elec.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = heat_problem.extract_results()
        parameters = heat_problem.parameters(0)
        name_to_id_map = heat_problem.esdl_asset_name_to_id_map
        e_boiler_id = name_to_id_map["ElectricBoiler_9aab"]

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)

        # Check the cost calculations
        np.testing.assert_array_less(99.0, results[f"{e_boiler_id}__investment_cost"])
        np.testing.assert_array_less(99.0, results[f"{e_boiler_id}__installation_cost"])
        np.testing.assert_array_less(10.0, results[f"{e_boiler_id}__variable_operational_cost"])
        cost_calculation_test(heat_problem, results)

        np.testing.assert_array_less(0.0, results[f"{e_boiler_id}.Heat_source"])
        np.testing.assert_allclose(
            parameters[f"{e_boiler_id}.efficiency"] * results[f"{e_boiler_id}.Power_consumed"],
            results[f"{e_boiler_id}.Heat_source"],
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
        5. cost calculation is checked
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
        name_to_id_map = heat_problem.esdl_asset_name_to_id_map
        hp_id = name_to_id_map["HeatPump_d8fd"]
        p_1_id = name_to_id_map["Pipe1"]

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)
        electric_power_conservation_test(heat_problem, results)

        # Check costs
        np.testing.assert_array_less(100.0, results[f"{hp_id}__variable_operational_cost"])
        np.testing.assert_array_less(1e3, results[f"{p_1_id}__investment_cost"])
        cost_calculation_test(heat_problem, results)

        elec_producer_id = name_to_id_map["ElectricityProducer_4dde"]
        np.testing.assert_array_less(0.0, results[f"{hp_id}.Heat_source"])
        np.testing.assert_array_less(0.0, results[f"{elec_producer_id}.ElectricityOut.Power"])
        np.testing.assert_array_less(
            parameters[f"{hp_id}.cop"] * results[f"{hp_id}.Power_elec"],
            results[f"{hp_id}.Heat_source"] + 1.0e-6,
        )


if __name__ == "__main__":
    TestElecBoiler = TestElecBoiler()
    TestElecBoiler.test_elec_heat_source_elec()
    TestElecBoiler.test_heat_source_elec()
    TestElecBoiler.test_air_water_hp_elec()
