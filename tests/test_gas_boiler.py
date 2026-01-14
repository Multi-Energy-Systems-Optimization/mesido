import math
from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestGasBoiler(TestCase):

    def asset_cost_calculation_tests(self, solution, results, parameters):
        # Check the cost components of GasHeater
        for asset in [
            *solution.energy_system_components.get("heat_source", []),
        ]:
            esdl_asset = solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
            costs_esdl_asset = esdl_asset.attributes["costInformation"]

            # investment cost
            investment_cost_info = costs_esdl_asset.investmentCosts.value
            investment_cost = investment_cost_info * results[f"{asset}__max_size"] / 1.0e6
            np.testing.assert_allclose(
                investment_cost, results[f"{asset}__investment_cost"], atol=1.0e-7
            )

            # installation cost
            installation_cost = costs_esdl_asset.installationCosts.value
            np.testing.assert_allclose(installation_cost, results[f"{asset}__installation_cost"])

            # variable operational cost
            timesteps_hr = np.diff(solution.times())
            variable_operational_cost = 0.0
            var_op_costs = costs_esdl_asset.variableOperationalCosts.value
            for ii in range(1, len(solution.times())):
                variable_operational_cost += (
                    var_op_costs
                    * results[f"{asset}.Gas_demand_mass_flow"][ii]
                    / parameters[f"{asset}.density_normal"]
                    * timesteps_hr[ii - 1]
                )
            np.testing.assert_allclose(
                variable_operational_cost, results[f"{asset}__variable_operational_cost"]
            )

    def test_gas_heat_source_gas(self):
        """
        This tests checks the gas boiler for the standard checks and the energy conservation over
        the commodity change.

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge
        4. energy conservation over the commodity
        5. GasHeater cost components

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
        bounds = heat_problem.bounds()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)

        np.testing.assert_array_less(0.0, results["GasHeater_f713.Heat_source"])
        np.testing.assert_array_less(0.0, results["GasProducer_82ec.Gas_source_mass_flow"])
        np.testing.assert_array_less(
            parameters["GasHeater_f713.energy_content"]
            * results["GasHeater_f713.GasIn.mass_flow"]
            * parameters["GasHeater_f713.efficiency"]
            / 1000.0,  # [J/kg] * [g/s] / 1000.0 = [J/s]
            results["GasHeater_f713.Heat_source"] + 1.0e-6,
        )

        # check if the maximum gas velocity set in problem is used to determine bounds on pipes
        v_max_gas = heat_problem.gas_network_settings[
            "maximum_velocity"
        ]  # m/s maximum velocity set in problem.
        np.testing.assert_allclose(
            bounds["Pipe_a7b5.GasIn.Q"][1],
            parameters["Pipe_a7b5.diameter"] ** 2 / 4 * math.pi * v_max_gas,
        )

        # # Check the cost components of GasHeater
        self.asset_cost_calculation_tests(heat_problem, results, parameters)

    def test_heat_source_gas(self):
        """
        This tests checks the gas boiler without gas inlet port for the standard checks
        and GasHeater cost components

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge
        4. GasHeater cost components

        """
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            SourcePipeSink,
            base_folder=base_folder,
            esdl_file_name="sourcesink_withgasboiler_no_gas.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = solution.extract_results()
        parameters = solution.parameters(0)

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        # # Check the cost components of GasHeater
        self.asset_cost_calculation_tests(solution, results, parameters)


if __name__ == "__main__":

    a = TestGasBoiler()
    a.test_gas_heat_source_gas()
    a.test_heat_source_gas()
