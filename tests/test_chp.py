from pathlib import Path
from unittest import TestCase

import numpy as np

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

from utils_tests import (
    cost_calculation_test,
    demand_matching_test,
    electric_power_conservation_test,
    energy_conservation_test,
    heat_to_discharge_test,
)


class TestCHP(TestCase):
    def test_chp(self):
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            SourcePipeSink,
            base_folder=base_folder,
            esdl_file_name="sourcesink_with_chp.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = heat_problem.extract_results()
        parameters = heat_problem.parameters(0)
        bounds = heat_problem.bounds()
        name_to_id_map = heat_problem.esdl_asset_name_to_id_map

        chp_id = name_to_id_map["CHP_9aab"]
        elec_demand_id = name_to_id_map["ElectricityDemand_4dde"]
        gas_producer_id = name_to_id_map["GasProducer_82ec"]
        gas_pipe_id = name_to_id_map["Pipe_a7b5"]

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)
        electric_power_conservation_test(heat_problem, results)
        
        #TODO: right now the variable operational costs are also still based on heat per MWh.
        cost_calculation_test(heat_problem, results)

        np.testing.assert_array_less(0.0, results[f"{chp_id}.Heat_source"])
        np.testing.assert_array_less(0.0, results[f"{chp_id}.Electricity_source"])
        np.testing.assert_array_less(0.0, results[f"{chp_id}.Gas_demand_mass_flow"])
        np.testing.assert_array_less(0.0, results[f"{gas_producer_id}.Gas_source_mass_flow"])
        np.testing.assert_array_less(0.0, results[f"{elec_demand_id}.Electricity_demand"])
        np.testing.assert_allclose(parameters[f"{chp_id}.T_supply"], 70.0)
        np.testing.assert_allclose(parameters[f"{chp_id}.T_return"], 40.0)

        np.testing.assert_allclose(
            parameters[f"{chp_id}.HERatio"] * results[f"{chp_id}.Electricity_source"],
            results[f"{chp_id}.Heat_source"],
        )
        np.testing.assert_allclose(
            parameters[f"{chp_id}.efficiency"]
            * results[f"{chp_id}.Gas_demand_mass_flow"]
            * parameters[f"{chp_id}.energy_content"]
            / 1000.0,
            results[f"{chp_id}.Heat_source"] + results[f"{chp_id}.Electricity_source"],
            atol=1.0e-6,
        )

        v_max_gas = heat_problem.gas_network_settings["maximum_velocity"]
        np.testing.assert_allclose(
            bounds[f"{gas_pipe_id}.GasIn.Q"][1],
            parameters[f"{gas_pipe_id}.diameter"] ** 2 / 4 * np.pi * v_max_gas,
        )


if __name__ == "__main__":
    TestCHP = TestCHP()
    TestCHP.test_chp()
