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


class TestMultiCommodityHeatPump(TestCase):
    """Test to verify that the optimisation problem can handle multicommodity problems, relating
    electricity and heat"""

    def test_heat_pump_elec_min_heat(self):
        """
        Verify that the minimisation of the heat_source used, and thus the optimization should
        exploit the heatpump as much as possible, and minimum use of heat source at secondary
        side.

        Checks:
        - Standard checks for demand matching, heat to discharge and energy conservation
        - Checks for sufficient production
        - Checks for heat pump energy conservation and COP modelling
        - Checks for Power = I * V at the heatpump

        """
        import models.unit_cases_electricity.heat_pump_elec.src.run_hp_elec as run_hp_elec
        from models.unit_cases_electricity.heat_pump_elec.src.run_hp_elec import HeatProblem2

        base_folder = Path(run_hp_elec.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            HeatProblem2,
            base_folder=base_folder,
            esdl_file_name="heat_pump_elec.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )
        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results, atol_total=11)
        heat_to_discharge_test(solution, results)

        v_min_hp = solution.parameters(0)["GenericConversion_3d3f.min_voltage"]
        i_max = solution.parameters(0)["ElectricityCable_9d3b.max_current"]
        cop = solution.parameters(0)["GenericConversion_3d3f.COP"]

        heatsource_prim = results["ResidualHeatSource_61b8.Heat_source"]
        heatsource_sec = results["ResidualHeatSource_aec9.Heat_source"]
        heatpump_power = results["GenericConversion_3d3f.Power_elec"]
        heatpump_heat_prim = results["GenericConversion_3d3f.Primary_heat"]
        heatpump_heat_sec = results["GenericConversion_3d3f.Secondary_heat"]
        heatdemand_sec = results["HeatingDemand_18aa.Heat_demand"]
        heatdemand_prim = results["HeatingDemand_3322.Heat_demand"]
        elec_prod_power = results["ElectricityProducer_ac2e.ElectricityOut.Power"]

        heatpump_voltage = results["GenericConversion_3d3f.ElectricityIn.V"]
        heatpump_current = results["GenericConversion_3d3f.ElectricityIn.I"]

        np.testing.assert_allclose(heatsource_sec, 0.0, atol=1.0e-3)

        # check that heatpump is providing more energy to secondary side than demanded
        np.testing.assert_array_less(heatdemand_sec - heatpump_heat_sec, 0)
        # check that producer is providing more energy to heatpump and primary demand
        np.testing.assert_array_less(heatdemand_prim - (heatsource_prim - heatpump_heat_prim), 0)

        # check that heatpumppower*COP==secondaryheat heatpump
        np.testing.assert_allclose(heatpump_power * cop, heatpump_heat_sec)
        # check power consumption with current and voltage heatpump
        np.testing.assert_allclose(heatpump_power, heatpump_current * heatpump_voltage)
        np.testing.assert_array_less(heatpump_power, elec_prod_power)
        # check if current and voltage limits are satisfied
        np.testing.assert_array_less(heatpump_current, i_max * np.ones(len(heatpump_current)))
        np.testing.assert_allclose(v_min_hp * np.ones(len(heatpump_voltage)), heatpump_voltage)

    def test_heat_pump_elec_min_heat_curr_limit(self):
        """
        Verify the minimization of the heat_source used. However, due to limitations in the
        electricity transport through the cables, the power to the heatpump is limited. This in
        turn limits the heat produced by the heatpump which is then not sufficient for the total
        heating demand, resulting in heat production by the secondary heatsource (heat produced by
        this asset is not 0).

        Checks:
        - Standard checks for demand matching, heat to discharge and energy conservation
        - Checks for sufficient production
        - Checks for heat pump energy conservation and COP modelling
        - Checks for Power = I * V at the heatpump

        """
        import models.unit_cases_electricity.heat_pump_elec.src.run_hp_elec as run_hp_elec
        from models.unit_cases_electricity.heat_pump_elec.src.run_hp_elec import HeatProblem

        base_folder = Path(run_hp_elec.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="heat_pump_elec.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )
        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        v_min_hp = solution.parameters(0)["GenericConversion_3d3f.min_voltage"]
        i_max = solution.parameters(0)["ElectricityCable_9d3b.max_current"]
        cop = solution.parameters(0)["GenericConversion_3d3f.COP"]

        heatsource_prim = results["ResidualHeatSource_61b8.Heat_source"]
        heatsource_sec = results["ResidualHeatSource_aec9.Heat_source"]
        heatpump_power = results["GenericConversion_3d3f.Power_elec"]
        heatpump_heat_prim = results["GenericConversion_3d3f.Primary_heat"]
        heatpump_heat_sec = results["GenericConversion_3d3f.Secondary_heat"]
        heatdemand_sec = results["HeatingDemand_18aa.Heat_demand"]
        heatdemand_prim = results["HeatingDemand_3322.Heat_demand"]
        elec_prod_power = results["ElectricityProducer_ac2e.ElectricityOut.Power"]

        heatpump_voltage = results["GenericConversion_3d3f.ElectricityIn.V"]
        heatpump_current = results["GenericConversion_3d3f.ElectricityIn.I"]

        # check that heatpump isnot providing enough energy to secondary side for demanded
        np.testing.assert_array_less(
            np.zeros(len(heatdemand_sec)), heatdemand_sec - heatpump_heat_sec
        )
        np.testing.assert_array_less(
            heatdemand_sec - (heatpump_heat_sec + heatsource_sec), np.zeros(len(heatdemand_sec))
        )
        # check that heatpump is limited by electric transport power limitations:
        np.testing.assert_allclose(heatpump_power, i_max * v_min_hp * np.ones(len(heatpump_power)))
        # check that prim producer is providing more energy to heatpump and primary demand
        np.testing.assert_array_less(heatdemand_prim - (heatsource_prim - heatpump_heat_prim), 0)
        # check that heatpumppower*COP==secondaryheat heatpump
        np.testing.assert_allclose(heatpump_power * cop, heatpump_heat_sec)
        # check power consumption with current and voltage heatpump
        np.testing.assert_allclose(heatpump_power, heatpump_current * heatpump_voltage)
        np.testing.assert_array_less(heatpump_power, elec_prod_power)
        # check if current and voltage limits are satisfied
        np.testing.assert_allclose(heatpump_current, i_max * np.ones(len(heatpump_current)))
        np.testing.assert_allclose(v_min_hp * np.ones(len(heatpump_voltage)), heatpump_voltage)
        # TODO: currently connecting pipes at HPs can not be disabled, these don't have the
        # functionality as this causes other problems with HP tests, have to adjust this later.
        # This option would be added/changed in asset_to_component_base

    def test_heat_pump_elec_min_elec(self):
        """
        Verify that minimisation of the electricity power used, and thus
        exploiting the heatpump only for heat that cannot directly be covered by other sources.

        Checks:
        - Standard checks for demand matching, heat to discharge and energy conservation
        - Checks for sufficient production
        - Checks for heat pump energy conservation and COP modelling
        - Checks for Power = I * V at the heatpump

        """
        import models.unit_cases_electricity.heat_pump_elec.src.run_hp_elec as run_hp_elec
        from models.unit_cases_electricity.heat_pump_elec.src.run_hp_elec import (
            ElectricityProblem,
        )

        base_folder = Path(run_hp_elec.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            ElectricityProblem,
            base_folder=base_folder,
            esdl_file_name="heat_pump_elec.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )
        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)
        electric_power_conservation_test(solution, results)

        tol = 1e-6
        heatsource_prim = results["ResidualHeatSource_61b8.Heat_source"]
        # heatsource_sec = results["ResidualHeatSource_aec9.Heat_source"]
        heatpump_power = results["GenericConversion_3d3f.Power_elec"]
        heatpump_heat_prim = results["GenericConversion_3d3f.Primary_heat"]
        heatpump_heat_sec = results["GenericConversion_3d3f.Secondary_heat"]
        heatpump_disabled = results["GenericConversion_3d3f.__disabled"]
        # heatdemand_sec = results["HeatingDemand_18aa.Heat_demand"]
        heatdemand_prim = results["HeatingDemand_3322.Heat_demand"]
        elec_prod_power = results["ElectricityProducer_ac2e.ElectricityOut.Power"]
        # pipe_sec_out_hp_disconnected = results["Pipe_408e.__is_disconnected"]

        # check that heatpump is not used:
        np.testing.assert_allclose(heatpump_power, np.zeros(len(heatpump_power)), atol=tol)
        np.testing.assert_allclose(heatpump_heat_sec, np.zeros(len(heatpump_heat_sec)), atol=tol)
        np.testing.assert_allclose(heatpump_heat_prim, np.zeros(len(heatpump_heat_prim)), atol=tol)

        np.testing.assert_allclose(elec_prod_power, np.zeros(len(heatpump_heat_prim)), atol=tol)
        np.testing.assert_allclose(heatpump_disabled, np.ones(len(heatpump_heat_prim)), atol=tol)

        # check that prim producer is providing more energy to heatpump and primary demand
        np.testing.assert_array_less(heatdemand_prim - (heatsource_prim - heatpump_heat_prim), 0)

    def test_air_to_water_heat_pump_elec_min_elec(self):
        """
        Verify that minimisation of the electricity power used, and thus exploiting the heatpump

        Checks:
        - Standard checks for demand matching, heat to discharge and energy conservation and elect
        power conervation
        - Checks for Power = I * V at the heatpump

        """
        import models.unit_cases_electricity.heat_pump_elec.src.run_hp_elec as run_hp_elec
        from models.unit_cases_electricity.heat_pump_elec.src.run_hp_elec import (
            ElectricityProblem,
        )

        base_folder = Path(run_hp_elec.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            ElectricityProblem,
            base_folder=base_folder,
            esdl_file_name="air_to_water_heat_pump_elec.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )
        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)
        electric_power_conservation_test(solution, results)

        tol = 1e-6

        # TODO add addtional checks for air to water heat pump like COP etc, and maybe add other
        # heat sources

        # check that electricity contraint for power is working
        np.testing.assert_allclose(
            results["HeatPump_0ce6.Power_elec"],
            results["HeatPump_0ce6.ElectricityIn.I"] * results["HeatPump_0ce6.ElectricityIn.V"],
            atol=tol,
        )

    def test_heat_pump_elec_price_profile(self):
        """
        Verify that minimisation of the electricity power used when price of electricity is high.

        Checks:
        - Standard checks for demand matching, heat to discharge and energy conservation
        - Check that the producer not connected to the heat pump is only used when electricity
        prices of HP are high
        - Check calculation of variable operational costs which include the electricity prices

        """
        import models.unit_cases_electricity.heat_pump_elec.src.run_hp_elec as run_hp_elec
        from models.unit_cases_electricity.heat_pump_elec.src.run_hp_elec import (
            ElectricityProblemPriceProfile,
        )

        base_folder = Path(run_hp_elec.__file__).resolve().parent.parent

        class TestProblem(ElectricityProblemPriceProfile):
            def solver_options(self):
                options = super().solver_options()
                # For some reason the test requires cbc, highs fails for strange reasons
                options["solver"] = "cbc"
                return options

        solution = run_esdl_mesido_optimization(
            TestProblem,
            base_folder=base_folder,
            esdl_file_name="heat_pump_elec_priceprofile.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_elec.csv",
        )

        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        heatpump_power = results["GenericConversion_3d3f.Power_elec"]
        heatpump_heat_sec = results["GenericConversion_3d3f.Secondary_heat"]
        heatpump_disabled = results["GenericConversion_3d3f.__disabled"]
        heatdemand_sec = results["HeatingDemand_18aa.Heat_demand"]
        var_opex_hp = results["GenericConversion_3d3f__variable_operational_cost"]
        # pipe_sec_out_hp_disconnected = results["Pipe_408e.__is_disconnected"]

        # check that heatpump is not used when electricity price is high:
        price_profile = solution.get_timeseries("Electr.price_profile").values
        price_profile_max = price_profile == max(price_profile)
        self.assertTrue(all(price_profile_max >= heatpump_disabled))
        self.assertTrue(all(price_profile_max[1:] * heatpump_power[1:] == 0))

        # check that heatpump is producing all heat for the heatdemand on the secondary side when
        # electricity price is low
        ind_hp = np.asarray(1 - price_profile_max).nonzero()
        np.testing.assert_allclose(heatpump_heat_sec[ind_hp], heatdemand_sec[ind_hp])

        # check variable_operational_cost for heat pump including the price_profile of electricity
        var_opex_hp_non_el = 1e-6  # var_opex in ESDL for HP
        timestep = 1.0  # hr
        var_opex_hp_calc = sum(
            (price_profile[1:] + var_opex_hp_non_el) * heatpump_power[1:] * timestep
        )
        np.testing.assert_allclose(var_opex_hp_calc, var_opex_hp)


class TestGeothermalSourceElec(TestCase):

    def test_geothermal_source(self):
        """
        This tests the electric behavior of the regular geothermal source asset.

        It first does the standard checks, and then the equations that are added to the geothermal
        asset, including the electricity power consumption.

        """
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            SourcePipeSink,
            base_folder=base_folder,
            esdl_file_name="sourcesink_with_geo.esdl",
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
        np.testing.assert_allclose(
            parameters["GeothermalSource_a77b.cop"] * results["GeothermalSource_a77b.Power_elec"],
            results["GeothermalSource_a77b.Heat_source"],
        )

        # Variable operational cost check.
        np.testing.assert_allclose(
            parameters["GeothermalSource_a77b.variable_operational_cost_coefficient"]
            * sum(results["GeothermalSource_a77b.Heat_source"][1:])
            / parameters["GeothermalSource_a77b.cop"],
            results["GeothermalSource_a77b__variable_operational_cost"],
        )

    def test_geothermal_source_elec(self):
        """
        This tests checks the electric geothermal producer asset with an electricity port.

        It does all the same checks as with the regular geothermal asset, plus tests on the
        electricity in port.
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
        np.testing.assert_allclose(
            results["ElectricityProducer_4dde.ElectricityOut.Power"],
            results["GeothermalSource_a77b.ElectricityIn.Power"],
        )
        np.testing.assert_allclose(
            parameters["GeothermalSource_a77b.cop"] * results["GeothermalSource_a77b.Power_elec"],
            results["GeothermalSource_a77b.Heat_source"],
        )

        # Test electricity port
        np.testing.assert_allclose(
            results["GeothermalSource_a77b.ElectricityIn.Power"],
            results["GeothermalSource_a77b.Power_elec"],
        )

        # Variable operational cost check.
        np.testing.assert_allclose(
            parameters["GeothermalSource_a77b.variable_operational_cost_coefficient"]
            * sum(results["GeothermalSource_a77b.Heat_source"][1:])
            / parameters["GeothermalSource_a77b.cop"],
            results["GeothermalSource_a77b__variable_operational_cost"],
        )

    def test_geothermal_source_elec_no_cop(self):
        """
        This tests checks the electric geothermal producer asset when no cop is provided.

        It is the same test case as with the regular one, but in this case, the cop is not
        provided and it assigned a value of 0.0, resulting in no power related costs.
        """
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            SourcePipeSink,
            base_folder=base_folder,
            esdl_file_name="sourcesink_with_geo_elec_no_cop.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = heat_problem.extract_results()

        # Standard checks.
        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)
        electric_power_conservation_test(heat_problem, results)

        # Equations check
        np.testing.assert_allclose(
            results["ElectricityProducer_4dde.ElectricityOut.Power"],
            results["GeothermalSource_a77b.ElectricityIn.Power"],
        )
        np.testing.assert_allclose(results["ElectricityProducer_4dde.ElectricityOut.Power"], 0.0)

        # Test electricity port
        np.testing.assert_allclose(
            results["GeothermalSource_a77b.ElectricityIn.Power"],
            results["GeothermalSource_a77b.Power_elec"],
        )

        # Variable operational cost check.
        np.testing.assert_allclose(0.0, results["GeothermalSource_a77b__variable_operational_cost"])
