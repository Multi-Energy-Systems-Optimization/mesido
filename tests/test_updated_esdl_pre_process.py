import sys
from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import run_end_scenario_sizing

import numpy as np

from utils_test_scaling import create_problem_with_debug_info  # , problem_scaling_check

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestUpdatedESDL(TestCase):
    def test_updated_esdl(self):
        """
        Check that the updated ESDL resulting from optmizing a network, is correct by using the
        PoCTutorial and the Grow_workflow. This is done for the actual esdl file and the esdl
        string created by MESIDO. Both these resulting optimized energy systems should be identical
        and it is only the MESIDO esdl saving method that differs.

        Additional checks:
         - Check that the unique profile identification in profile_parser assigns the correct
         profile
         - Check that the correct mulitpler value has been used
         - Test limiting the pipe classes for a pipe connected to a heat demand

        """

        root_folder = str(Path(__file__).resolve().parent.parent)
        sys.path.insert(1, root_folder)

        import examples.PoCTutorial.src.run_grow_tutorial
        from examples.PoCTutorial.src.run_grow_tutorial import EndScenarioSizingStagedHighs

        base_folder = (
            Path(examples.PoCTutorial.src.run_grow_tutorial.__file__).resolve().parent.parent
        )

        optimscaling, logger, logs_list = create_problem_with_debug_info(
            EndScenarioSizingStagedHighs
        )

        problem = run_end_scenario_sizing(
            optimscaling,
            base_folder=base_folder,
            esdl_file_name="PoC Tutorial.esdl",
            esdl_parser=ESDLFileParser,
        )

        # This code below is used to do manual check. Do not delete
        # problem_scaling_check(logs_list, logger)

        # Save optimized esdl string
        optimized_esdl_string = problem.optimized_esdl_string
        file = open(
            Path.joinpath(base_folder, "model", "PoC Tutorial_GrowOptimized_esdl_string.esdl"), "w"
        )
        file.write(optimized_esdl_string)
        file.close()

        demand_matching_test(problem, problem.extract_results())
        energy_conservation_test(problem, problem.extract_results())
        heat_to_discharge_test(problem, problem.extract_results())

        # Check the unique profile identification in profile_parser
        # Test that the correct demand profile is assigned to a demand as expected. Note that the
        # demand profiles are the adapted profiles (peak-hourly, rest-5daily). Therefore the
        # expected max and average hard-coded values are compared to the problem values.
        np.testing.assert_allclose(
            8857200.0,
            max(problem.get_timeseries("HeatingDemand_b0ff.target_heat_demand").values),
            # demand4_MW, multiplier 0.75, same demand profile as demand HeatingDemand_08fd, but
            # with a different multiplier. So one would expect that this value differs from
            # HeatingDemand_08fd
        )
        np.testing.assert_allclose(
            724680.0,  # demand5_MW, multiplier 0.33
            max(problem.get_timeseries("HeatingDemand_8fbe.target_heat_demand").values),
        )
        np.testing.assert_allclose(
            805200.0,  # demand4_MW, multiplier 0.5
            max(problem.get_timeseries("HeatingDemand_08fd.target_heat_demand").values),
        )
        np.testing.assert_allclose(
            3484288.0247,  # demand4_MW, multiplier 5.5
            np.average(problem.get_timeseries("HeatingDemand_b0ff.target_heat_demand").values),
        )
        np.testing.assert_allclose(
            285078.111,  # demand5_MW, multiplier 0.3
            np.average(problem.get_timeseries("HeatingDemand_8fbe.target_heat_demand").values),
        )
        np.testing.assert_allclose(
            316753.457,  # demand4_MW, multiplier 0.5
            np.average(problem.get_timeseries("HeatingDemand_08fd.target_heat_demand").values),
        )

        # Check that the correct multiplier value was used
        # Compare 2 max values where the same profile was used but with different multiplier values
        # HeatingDemand_08fd: multiplier 0.5
        # HeatingDemand_b0ff: multplier 5.5
        np.testing.assert_allclose(
            max(problem.get_timeseries("HeatingDemand_08fd.target_heat_demand").values) / 0.5,
            max(problem.get_timeseries("HeatingDemand_b0ff.target_heat_demand").values) / 5.5,
        )
        np.testing.assert_allclose(
            np.average(problem.get_timeseries("HeatingDemand_08fd.target_heat_demand").values)
            / 0.5,
            np.average(problem.get_timeseries("HeatingDemand_b0ff.target_heat_demand").values)
            / 5.5,
        )

        # Test limiting the pipe classes for a pipe connected to a heat demand/producer
        # Pipe connected to a demand
        # Check that Pipe4 has 2 of pipe classes available, and that DN0 has not been
        # included in the list of avialbel pipe classes. Pipe4 started as an optional pipe with
        # DN900 as the starting point for the upper limit.
        for key in problem._heat_pipe_topo_pipe_class_map["Pipe4"].keys():
            np.testing.assert_equal(key.name in ["DN150", "DN200"], True)
        # Pipe connected to a producer
        # initially DN900
        np.testing.assert_equal(
            [*problem._heat_pipe_topo_pipe_class_map["Pipe1"].keys()][-1].name == "DN400", True
        )


if __name__ == "__main__":
    import time

    start_time = time.time()

    a = TestUpdatedESDL()
    a.test_updated_esdl()

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
