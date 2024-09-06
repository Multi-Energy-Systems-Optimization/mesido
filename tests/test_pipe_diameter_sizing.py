import sys
from pathlib import Path
from unittest import TestCase

from mesido._darcy_weisbach import friction_factor
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestPipeDiameterSizingExample(TestCase):
    def test_half_network_gone(self):
        """
        This test is to check if the optimization behaves as expected under pipe class optimization.
        The test uses a symmetrical network with three demands in the middle that can be provided
        from a source both left and right. The optimal solution is that the optimizer only uses
        the left source and the associated left pipes.

        Checks:
        - Standard checks for demand matching, heat to discharge and energy conservation
        - That expected pipes are removed
        - Check that the Q is under the max for the selected pipe class.
        - Check that head losses are as expected for the selected diameter
        - Check that head loss equals zero for removed pipes
        - Same for hydraulic power, no idea why it is outcommented

        Missing:
        - For now we use the hardcoded pipe classes to allow for variable maximum velocity over the
        pipe classes.

        """
        root_folder = str(Path(__file__).resolve().parent.parent)
        sys.path.insert(1, root_folder)

        import examples.pipe_diameter_sizing.src.example  # noqa: E402, I100
        from examples.pipe_diameter_sizing.src.example import (
            PipeDiameterSizingProblem,
        )  # noqa: E402, I100

        base_folder = (
            Path(examples.pipe_diameter_sizing.src.example.__file__).resolve().parent.parent
        )

        del root_folder
        sys.path.pop(1)

        problem = run_esdl_mesido_optimization(
            PipeDiameterSizingProblem,
            base_folder=base_folder,
            esdl_file_name="2a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )

        feasibility = problem.solver_stats["return_status"]
        self.assertTrue((feasibility == "Optimal"))

        parameters = problem.parameters(0)
        diameters = {p: parameters[f"{p}.diameter"] for p in problem.hot_pipes}
        results = problem.extract_results()

        # Check that half the network is removed, i.e. 4 pipes. Note that it
        # is equally possible for the left or right side of the network to be
        # removed.
        self.assertEqual(
            len([d for d in diameters.values() if d == 0.0]),
            4,
            "More/less than 4 pipes have been removed",
        )
        # Check that the correct/specific 4 pipes on the left or 4 on the right have been removed
        pipes_removed = ["Pipe_8592", "Pipe_2927", "Pipe_9a6f", "Pipe_a718"]
        pipes_remained = ["Pipe_96bc", "Pipe_51e4", "Pipe_6b39", "Pipe_f9b0"]
        self.assertTrue(
            all(
                (elem in [k for k, d in diameters.items() if (d == 0.0)] for elem in pipes_remained)
            )
            or all(
                elem in [k for k, d in diameters.items() if (d == 0.0)] for elem in pipes_removed
            ),
            "The incorrect 4 pipes have been removed",
        )

        for pipe in problem.energy_system_components.get("heat_pipe", []):
            neighbour = problem.has_related_pipe(pipe)
            if neighbour and pipe not in problem.hot_pipes:
                pipe = problem.cold_to_hot_pipe(pipe)
            given_pipe_classes = problem.pipe_classes(pipe)
            chosen_pc = [
                pc
                for pc in given_pipe_classes
                if round(results[f"{pipe}__hn_pipe_class_{pc.name}"][0]) == 1.0
            ][0]
            np.testing.assert_array_less(
                results[f"{pipe}.Q"],
                chosen_pc.maximum_velocity * np.pi * (chosen_pc.inner_diameter / 2.0) ** 2 + 1.0e-6,
            )

        for pipe in problem.energy_system_components.get("heat_pipe", []):
            if results[f"{pipe}__hn_diameter"] <= 1e-15:
                # TODO: At the moment it is so that a pipe which is not placed (diameter == 0.) can
                # have head loss since there is an equivalent solution where simultaniously the
                # is_disconnected variable is also true disabling the head_loss constraints.
                # np.testing.assert_allclose(results[f"{pipe}.dH"][1:], 0., atol=1.e-12)
                pass
            else:
                # TODO: there is a mismatch in maximum velocity, the linearization is done with the
                #  global setting instead of the pipe class specific one
                pc = problem.get_optimized_pipe_class(pipe)
                ff = friction_factor(
                    pc.maximum_velocity,
                    pc.inner_diameter,
                    2.0e-4,
                    parameters[f"{pipe}.temperature"],
                )
                c_v = parameters[f"{pipe}.length"] * ff / (2 * 9.81) / pc.inner_diameter
                dh_max = c_v * pc.maximum_velocity**2
                dh_manual = dh_max * results[f"{pipe}.Q"][1:] / pc.area / pc.maximum_velocity
                np.testing.assert_allclose(-dh_manual, results[f"{pipe}.dH"][1:], atol=1.0e-12)

        # Ensure that the removed pipes do not have predicted hydraulic power values
        hydraulic_power_sum = 0.0
        for pipe in diameters.keys():
            if pipe in pipes_removed:
                hydraulic_power_sum += sum(abs(results[f"{pipe}.Hydraulic_power"]))
        self.assertEqual(hydraulic_power_sum, 0.0, "Hydraulic power exists for a removed pipe")

        # Hydraulic power = delta pressure * Q = f(Q^3), where delta pressure = f(Q^2)
        # The linear approximation of the 3rd order function should overestimate the hydraulic
        # power when compared to the product of Q and the linear approximation of 2nd order
        # function (delta pressure).
        hydraulic_power_sum = 0.0
        hydraulic_power_post_process = 0.0
        for pipe in diameters.keys():
            if pipe in pipes_remained:
                hydraulic_power_sum += sum(abs(results[f"{pipe}.Hydraulic_power"]))
                hydraulic_power_post_process += sum(
                    abs(
                        results[f"{pipe}.dH"]
                        * parameters[f"{pipe}.rho"]
                        * 9.81
                        * results[f"{pipe}.HeatOut.Q"]
                    )
                )

        self.assertGreater(hydraulic_power_sum, hydraulic_power_post_process)
        demand_matching_test(problem, results)
        energy_conservation_test(problem, results)
        heat_to_discharge_test(problem, results)


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestPipeDiameterSizingExample()
    a.test_half_network_gone()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
