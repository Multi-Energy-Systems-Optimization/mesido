from pathlib import Path
from unittest import TestCase

import mesido._darcy_weisbach as darcy_weisbach
from mesido.constants import GRAVITATIONAL_CONSTANT
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.network_common import NetworkSettings
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test


class ValidateWithPandaPipes(TestCase):
    """
    Test case for a heat network and a gas network consisting out of a source, pipe(s) and a sink
    """

    def test_heat_network_head_loss(self):
        """
        Heat network: test the piecewise linear equality and inequality constraints of the head loss
        approximation.

        Checks:
        - ....
        """
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        for head_loss_option_setting in [
            HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY,
        ]:
            # Added for case where head loss is modelled via DW
            class SourcePipeSinkDW(SourcePipeSink):

                def energy_system_options(self):
                    options = super().energy_system_options()

                    nonlocal head_loss_option_setting
                    head_loss_option_setting = head_loss_option_setting

                    if (
                        head_loss_option_setting
                        == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
                    ):
                        self.gas_network_settings["head_loss_option"] = (
                            HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
                        )
                        self.gas_network_settings["n_linearization_lines"] = 10
                        self.heat_network_settings["minimize_head_losses"] = True
                    elif head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_EQUALITY:
                        self.heat_network_settings["head_loss_option"] = (
                            HeadLossOption.LINEARIZED_N_LINES_EQUALITY
                        )
                        self.heat_network_settings["minimize_head_losses"] = True
                        self.heat_network_settings["minimum_velocity"] = 1.0e-6

                    return options

            solution = run_esdl_mesido_optimization(
                SourcePipeSinkDW,
                base_folder=base_folder,
                esdl_file_name="sourcesink.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries_import.csv",
            )
            results = solution.extract_results()

            pipes = ["Pipe1"]
            for itime in range(len(results[f"{pipes[0]}.dH"])):
                v_max = solution.heat_network_settings["maximum_velocity"]
                pipe_diameter = solution.parameters(0)[f"{pipes[0]}.diameter"]
                pipe_wall_roughness = solution.energy_system_options()["wall_roughness"]
                temperature = solution.parameters(0)[f"{pipes[0]}.temperature"]
                pipe_length = solution.parameters(0)[f"{pipes[0]}.length"]
                v_points = np.linspace(
                    0.0,
                    v_max,
                    solution.heat_network_settings["n_linearization_lines"] + 1,
                )
                v_inspect = (
                    results[f"{pipes[0]}.Q"][itime] / solution.parameters(0)[f"{pipes[0]}.area"]
                )
                idx = []
                linearized_idx = []
                idx.append(
                    (results["Pipe1.Q"][itime] / solution.parameters(0)["Pipe1.area"]) >= v_points
                )
                idx.append(
                    (results["Pipe1.Q"][itime] / solution.parameters(0)["Pipe1.area"]) < v_points
                )
                linearized_idx.append(np.where(idx[0])[0][-1])
                linearized_idx.append(np.where(idx[1])[0][0])

                # Theoretical head loss calc, dH =
                # friction_factor * 8 * pipe_length * volumetric_flow^2 / ( pipe_diameter^5 * g *
                # pi^2)
                dh_theory = (
                    darcy_weisbach.friction_factor(
                        v_inspect,
                        pipe_diameter,
                        pipe_wall_roughness,
                        temperature,
                    )
                    * 8.0
                    * pipe_length
                    * (v_inspect * np.pi * pipe_diameter**2 / 4.0) ** 2
                    / (pipe_diameter**5 * GRAVITATIONAL_CONSTANT * np.pi**2)
                )
                # Approximate dH [m] vs Q [m3/s] with a linear line between between v_points
                # dH_manual_linear = a*Q + b
                # Then use this linear function to calculate the head loss
                delta_dh_theory = darcy_weisbach.head_loss(
                    v_points[linearized_idx[1]],
                    pipe_diameter,
                    pipe_length,
                    pipe_wall_roughness,
                    temperature,
                ) - darcy_weisbach.head_loss(
                    v_points[linearized_idx[0]],
                    pipe_diameter,
                    pipe_length,
                    pipe_wall_roughness,
                    temperature,
                )

                delta_volumetric_flow = (
                    v_points[linearized_idx[1]] * np.pi * pipe_diameter**2 / 4.0
                ) - (v_points[linearized_idx[0]] * np.pi * pipe_diameter**2 / 4.0)

                a = delta_dh_theory / delta_volumetric_flow
                b = delta_dh_theory - a * delta_volumetric_flow
                dh_manual_linear = a * (v_inspect * np.pi * pipe_diameter**2 / 4.0) + b

                dh_milp_head_loss_function = darcy_weisbach.head_loss(
                    v_inspect, pipe_diameter, pipe_length, pipe_wall_roughness, temperature
                )

                np.testing.assert_allclose(dh_theory, dh_milp_head_loss_function)
                np.testing.assert_array_less(dh_milp_head_loss_function, dh_manual_linear)

                if head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY:
                    np.testing.assert_array_less(
                        dh_manual_linear, -results[f"{pipes[0]}.dH"][itime] + 1e-6
                    )
                elif head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_EQUALITY:
                    np.testing.assert_allclose(
                        -results[f"{pipes[0]}.dH"][itime], dh_manual_linear, rtol=1e-5, atol=1e-7
                    )

            for pipe in pipes:
                velocities = results[f"{pipe}.Q"] / solution.parameters(0)[f"{pipe}.area"]
                for ii in range(len(results[f"{pipe}.dH"])):
                    np.testing.assert_array_less(
                        darcy_weisbach.head_loss(
                            velocities[ii],
                            pipe_diameter,
                            pipe_length,
                            pipe_wall_roughness,
                            temperature,
                        ),
                        -results[f"{pipe}.dH"][ii],
                    )

            pump_power = results["source.Pump_power"]
            pump_power_post_process = (
                results["source.dH"] / GRAVITATIONAL_CONSTANT * 1.0e5 * results["source.Q"]
            )

            # The pump power should be overestimated compared to the actual head loss due to the
            # fact that we are linearizing a third order equation for hydraulic power instead of
            # the second order for head loss.
            np.testing.assert_array_less(pump_power_post_process, pump_power)

            sum_hp = (
                results["demand.HeatOut.Hydraulic_power"] - results["demand.HeatIn.Hydraulic_power"]
            )
            sum_hp += (
                results["Pipe1.HeatOut.Hydraulic_power"] - results["Pipe1.HeatIn.Hydraulic_power"]
            )
            sum_hp += (
                results["Pipe1_ret.HeatOut.Hydraulic_power"]
                - results["Pipe1_ret.HeatIn.Hydraulic_power"]
            )

            np.testing.assert_allclose(abs(sum_hp), pump_power, atol=1.0e-3)


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = test_heat_network_head_loss()
    a.test_heat_network_head_loss()

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
