from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestColdDemand(TestCase):
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

        Checks:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge (note cold line is colder than T_ground)
        4. the cyclic heat_stored contraint, which ensures yearly heat balance between the warm and
        cold well

        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        class HeatingCoolingProblem(HeatProblem):
            # def energy_system_options(self):
            #     options = super().energy_system_options()
            #     options["neglect_pipe_heat_losses"] = True
            #     return options

            def constraints(self, ensemble_member):
                constraints = super().constraints(ensemble_member)

                # Add cyclic constraint, this will also ensure that the total power used in the
                # lower temp & higher temp well and via versa is the same.
                # Note:
                #   - WKO in cooling mode: Hot well is being charged with heat and the cold well is
                # being discharged
                #   - WKO in heating mode: Cold well is being charged and the hot well is being
                #     discharged.
                for a in self.energy_system_components.get("low_temperature_ates", []):
                    stored_heat = self.state_vector(f"{a}.Stored_heat")
                    constraints.append(((stored_heat[-1] - stored_heat[0]), 0.0, 0.0))
                    # This was added to force the heatpump to start loading the WKO 1st 3 timesteps
                    # constraints.append((stored_heat[0], 0.0, 0.0))

                # TODO: confirm if the yearly balance between warm and cold well is heat / flow
                # related?
                # This code below might be needed
                # Add constriant such that the total volume used of the lower temp & higher temp
                # well of the WKO is the same. Yearly volume balance between the 2 wells. This
                # ensures volume balance over the timeline. This is done by adding a constriant to
                # esnure the total volume change over the period = 0.
                # Note:
                #   - Volume increase: Hot well is being charged and the cold well is being
                #     discharged. -> WKO in cooling mode
                #   - Volume decrease: Cold well is being charged and the hot well is being
                #     discharged. -> WKO in heating mode
                # if heat balance over the year is required, then this needs to change ?????? TBC
                # for ates_id in self.energy_system_components.get("low_temperature_ates", []):
                #     stored_volume = self.state_vector(f"{ates_id}.Stored_volume")
                #     volume_usage = 0.0

                #     volume_usage = stored_volume[0] - stored_volume[-1]
                #     constraints.append((volume_usage, 0.0, 0.0))

                    # for itstep in range(len(self.times()) - 1):
                    #     volume_usage = (
                    #         volume_usage + stored_volume[itstep + 1] - stored_volume[itstep]
                    #     )
                    # constraints.append((volume_usage, 0.0, 0.0))

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

        np.testing.assert_allclose(
            results["ATES_226d.Stored_heat"][0], results["ATES_226d.Stored_heat"][-1]
        )
        # np.testing.assert_allclose(results["ATES_226d.Stored_heat"][0], 0.0)

        # Heat pump does not switch on to start loading the WKO.
        # Is this intended for some reason Femke?


if __name__ == "__main__":
    test_cold_demand = TestColdDemand()
    test_cold_demand.test_wko()

    a = 1
