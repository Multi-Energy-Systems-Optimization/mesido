import logging
from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_test_scaling import create_log_list_scaling

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test

logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)


class TestColdDemand(TestCase):

    def test_insufficient_capacity(self):
        """
        This test checks that the error checks in the code for sufficient installed cool/heatig
        capacity of a cold/heat demand is sufficient (grow_workflow not used)

        Checks:
        1. SystemExit is raised
        2. That the error is due to insufficient heat/cold specified capacities

        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        logger, logs_list = create_log_list_scaling("WarmingUP-MPC")

        base_folder = Path(example.__file__).resolve().parent.parent

        with self.assertRaises(SystemExit) as cm:
            _ = run_esdl_mesido_optimization(
                HeatProblem,
                base_folder=base_folder,
                esdl_file_name="LT_wko_error_check.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries.csv",
            )
        # Is SystemExit is raised
        np.testing.assert_array_equal(cm.exception.code, 1)

        # Check that the heat & cold demand had an error
        np.testing.assert_equal(
            logs_list[0].msg == "HeatingDemand_9b90: The installed capacity of 0.05MW should be"
            " larger than the maximum of the heat demand profile 0.15MW",
            True,
        )
        np.testing.assert_equal(
            logs_list[2].msg == "CoolingDemand_15e8: The installed capacity of 0.05MW should be"
            " larger than the maximum of the heat demand profile 0.15MW",
            True,
        )

    def test_cold_demand(self):
        """
        This test is to check the basic physics for a network which includes cold demand. In this
        case we have a network with an air-water hp, a low temperature ates and both hot and cold
        demand. In this case the demands are matched and the low temperature ates is utilized.

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge (note cold line is colder than T_ground)

        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="LT_wko.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = heat_problem.extract_results()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)

    def test_airco(self):
        """
        This test is to check the basic physics for a network which includes an airco. In this
        case we have a network with an air-water hp, a low temperature ates and both hot and cold
        demand. In this case the demands are matched and the low temperature ates is utilized.

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge

        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="airco.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = heat_problem.extract_results()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)

    def test_wko(self):
        """
        This test is to check the basic physics for a network which includes cold demand. In this
        case we have a network with an air-water hp, a WKO (warm and cold well) and both hot and
        cold demand.

        TODO: resolve issue in test case

        The demand profiles and the size of the heat pump has been chosen such that the heat is
        required is required to switch on to load the warm well of the WKO.

        Checks for scenario with and without pipe heat losses:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge (note cold line is colder than T_ground)
        4. the cyclic heat_stored contraint, which ensures yearly heat balance between the warm and
        cold well
        5. pipe heat loss and gain
            - pipe heat losses included: expect loss and gain values due to the carrier
            temperatures (warm and cold) in the pipes being higher and lower than the ground
            temperature
            - pipe heat losses excluded: excpect no heat losses or gains
        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        # ------------------------------------------------------------------------------------------
        # Pipe heat losses inlcuded
        class HeatingCoolingProblem(HeatProblem):

            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = False
                return options

            def constraints(self, ensemble_member):
                constraints = super().constraints(ensemble_member)

                # TODO: confirm if volume or heat balance is required over year. This will
                # determine if cyclic contraint below is for stored_heat or stored_volume
                # Add stored_heat cyclic constraint, this will also ensure that the total heat
                # change in the wko is 0 over the timeline
                # Note:
                #   - WKO in cooling mode: Hot well is being charged with heat and the cold well is
                # being discharged
                #   - WKO in heating mode: Cold well is being charged and the hot well is being
                #     discharged.
                for a in self.energy_system_components.get("low_temperature_ates", []):
                    stored_heat = self.state_vector(f"{a}.Stored_heat")
                    constraints.append(((stored_heat[-1] - stored_heat[0]), 0.0, 0.0))
                # This code below might be needed
                # Add stored_heat cyclic constraint, this will also ensure that the volume
                # into the lower temp & out of the higher temp is the same as the volume
                # out of the lower temp & into the higher temp over the timeline.
                # Note:
                #   - Volume increase: Hot well is being charged and the cold well is being
                #     discharged. -> WKO in cooling mode
                #   - Volume decrease: Cold well is being charged and the hot well is being
                #     discharged. -> WKO in heating mode
                # for ates_id in self.energy_system_components.get("low_temperature_ates", []):
                #     stored_volume = self.state_vector(f"{ates_id}.Stored_volume")
                #     volume_usage = 0.0
                #     volume_usage = stored_volume[0] - stored_volume[-1]
                #     constraints.append((volume_usage, 0.0, 0.0))

                return constraints

        heat_problem = run_esdl_mesido_optimization(
            HeatingCoolingProblem,
            base_folder=base_folder,
            esdl_file_name="LT_wko_heating_and_cooling.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_2.csv",
        )
        results = heat_problem.extract_results()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)

        # Check cyclic constraint
        np.testing.assert_allclose(
            results["ATES_226d.Stored_heat"][0], results["ATES_226d.Stored_heat"][-1]
        )
        # Check heat loss and gain
        tol_value = 1.0e-6
        np.testing.assert_array_less(
            0.0, results["Pipe1.HeatIn.Heat"] - results["Pipe1.HeatOut.Heat"] + tol_value
        )
        np.testing.assert_array_less(
            results["Pipe1_ret.HeatIn.Heat"] - results["Pipe1_ret.HeatOut.Heat"] - tol_value, 0.0
        )

        # ------------------------------------------------------------------------------------------
        # Pipe heat losses excluded
        class HeatingCoolingProblemNoHeatLoss(HeatingCoolingProblem):
            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = True
                return options

        heat_problem = run_esdl_mesido_optimization(
            HeatingCoolingProblemNoHeatLoss,
            base_folder=base_folder,
            esdl_file_name="LT_wko_heating_and_cooling.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_2.csv",
        )
        results = heat_problem.extract_results()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)

        # Check cyclic constraint
        np.testing.assert_allclose(
            results["ATES_226d.Stored_heat"][0], results["ATES_226d.Stored_heat"][-1]
        )
        # Check heat loss and gain
        tol_value = 1.0e-6
        np.testing.assert_allclose(
            0.0, results["Pipe1.HeatIn.Heat"] - results["Pipe1.HeatOut.Heat"], atol=1e-6
        )
        np.testing.assert_allclose(
            0.0, results["Pipe1_ret.HeatIn.Heat"] - results["Pipe1_ret.HeatOut.Heat"], atol=1e-6
        )
        # ------------------------------------------------------------------------------------------


if __name__ == "__main__":
    test_cold_demand = TestColdDemand()
    test_cold_demand.test_insufficient_capacity()
    test_cold_demand.test_cold_demand()
    test_cold_demand.test_wko()
    test_cold_demand.test_airco()
