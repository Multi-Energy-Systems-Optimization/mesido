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

    # def asset_cost_calculation_tests(self, solution, results):
    #     # Check the cost components
    #     for asset in [
    #         *solution.energy_system_components.get("heat_source", []),
    #     ]:
    #         esdl_asset = solution.esdl_assets[solution.esdl_asset_name_to_id_map[f"{asset}"]]
    #         costs_esdl_asset = esdl_asset.attributes["costInformation"]

    #         # investment cost
    #         investment_cost_info = costs_esdl_asset.investmentCosts.value
    #         investment_cost = investment_cost_info * results[f"{asset}__max_size"] / 1.0e6
    #         np.testing.assert_allclose(
    #             investment_cost, results[f"{asset}__investment_cost"], atol=1.0e-7
    #         )

    #         # installation cost
    #         installation_cost = costs_esdl_asset.installationCosts.value
    #         np.testing.assert_allclose(installation_cost, results[f"{asset}__installation_cost"])

    #         # variable operational cost
    #         timesteps_hr = np.diff(solution.times()) / 3600.0
    #         variable_operational_cost = 0.0
    #         var_op_costs = costs_esdl_asset.variableOperationalCosts.value
    #         for ii in range(1, len(solution.times())):
    #             variable_operational_cost += (
    #                 var_op_costs
    #                 * results[f"{asset}.Power_consumed"][ii]
    #                 * timesteps_hr[ii - 1]
    #                 / 1e6
    #             )
    #         np.testing.assert_allclose(
    #             variable_operational_cost, results[f"{asset}__variable_operational_cost"]
    #         )

    # def test_elec_heat_source_elec(self):
    #     """
    #     This tests checks the elec heat sourc elec for the standard checks and the energy
    #     conservation over the commodity change.

    #     Checks:
    #     1. demand is matched
    #     2. energy conservation in the network
    #     3. heat to discharge
    #     4. energy conservation over the heat and electricity commodity
    #     5. ElectricBoiler cost components
    #     """
    #     import models.source_pipe_sink.src.double_pipe_heat as example
    #     from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

    #     base_folder = Path(example.__file__).resolve().parent.parent

    #     heat_problem = run_esdl_mesido_optimization(
    #         SourcePipeSink,
    #         base_folder=base_folder,
    #         esdl_file_name="sourcesink_with_eboiler.esdl",
    #         esdl_parser=ESDLFileParser,
    #         profile_reader=ProfileReaderFromFile,
    #         input_timeseries_file="timeseries_import.csv",
    #     )
    #     results = heat_problem.extract_results()
    #     parameters = heat_problem.parameters(0)

    #     demand_matching_test(heat_problem, results)
    #     energy_conservation_test(heat_problem, results)
    #     heat_to_discharge_test(heat_problem, results)
    #     electric_power_conservation_test(heat_problem, results)

    #     np.testing.assert_array_less(0.0, results["ElectricBoiler_9aab.Heat_source"])
    #     np.testing.assert_array_less(0.0, results["ElectricityProducer_4dde.ElectricityOut.Power"])
    #     np.testing.assert_allclose(
    #         parameters["ElectricBoiler_9aab.efficiency"]
    #         * results["ElectricBoiler_9aab.Power_consumed"],
    #         results["ElectricBoiler_9aab.Heat_source"],
    #     )

    #     # Check the cost components of ElectricBoiler
    #     self.asset_cost_calculation_tests(heat_problem, results)

    # def test_heat_source_elec(self):
    #     """
    #     This tests checks the heat sourc elec for the standard checks and the energy conservation
    #     over the commodity change.

    #     Checks:
    #     1. demand is matched
    #     2. energy conservation in the network
    #     3. heat to discharge
    #     4. energy conservation over the heat and electricity commodity
    #     5. ElectricBoiler cost components
    #     """
    #     import models.source_pipe_sink.src.double_pipe_heat as example
    #     from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

    #     base_folder = Path(example.__file__).resolve().parent.parent

    #     heat_problem = run_esdl_mesido_optimization(
    #         SourcePipeSink,
    #         base_folder=base_folder,
    #         esdl_file_name="sourcesink_with_eboiler_no_elec.esdl",
    #         esdl_parser=ESDLFileParser,
    #         profile_reader=ProfileReaderFromFile,
    #         input_timeseries_file="timeseries_import.csv",
    #     )
    #     results = heat_problem.extract_results()
    #     parameters = heat_problem.parameters(0)

    #     demand_matching_test(heat_problem, results)
    #     energy_conservation_test(heat_problem, results)
    #     heat_to_discharge_test(heat_problem, results)

    #     np.testing.assert_array_less(0.0, results["ElectricBoiler_9aab.Heat_source"])
    #     np.testing.assert_allclose(
    #         parameters["ElectricBoiler_9aab.efficiency"]
    #         * results["ElectricBoiler_9aab.Power_consumed"],
    #         results["ElectricBoiler_9aab.Heat_source"],
    #     )

    #     # Check the cost components of ElectricBoiler
    #     self.asset_cost_calculation_tests(heat_problem, results)

    def test_geothermal_source_elec(self):
        """
        TODO: document.

        Checks:
        1. TODO
        """
        # import models.source_pipe_sink.src.double_pipe_heat as example
        # from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        # base_folder = Path(example.__file__).resolve().parent.parent

        # heat_problem = run_esdl_mesido_optimization(
        #     SourcePipeSink,
        #     base_folder=base_folder,
        #     esdl_file_name="sourcesink_withHP.esdl",
        #     esdl_parser=ESDLFileParser,
        #     profile_reader=ProfileReaderFromFile,
        #     input_timeseries_file="timeseries_import.csv",
        # )
        # results = heat_problem.extract_results()
        # parameters = heat_problem.parameters(0)

        # demand_matching_test(heat_problem, results)
        # energy_conservation_test(heat_problem, results)
        # heat_to_discharge_test(heat_problem, results)
        # electric_power_conservation_test(heat_problem, results)

        # np.testing.assert_array_less(0.0, results["HeatPump_d8fd.Heat_source"])
        # np.testing.assert_array_less(0.0, results["ElectricityProducer_4dde.ElectricityOut.Power"])
        # np.testing.assert_array_less(
        #     parameters["HeatPump_d8fd.cop"] * results["HeatPump_d8fd.Power_elec"],
        #     results["HeatPump_d8fd.Heat_source"] + 1.0e-6,
        # )

        # # Check how variable operation cost is calculated
        # np.testing.assert_allclose(
        #     parameters["HeatPump_d8fd.variable_operational_cost_coefficient"]
        #     * sum(results["HeatPump_d8fd.Heat_source"][1:])
        #     / parameters["HeatPump_d8fd.cop"],
        #     results["HeatPump_d8fd__variable_operational_cost"],
        # )
        pass

if __name__ == "__main__":
    
    TestElecBoiler = TestGeothermalSourceElec()
    TestElecBoiler.test_geothermal_source_elec()
