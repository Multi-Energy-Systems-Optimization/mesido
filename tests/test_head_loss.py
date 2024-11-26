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


class TestHeadLoss(TestCase):
    """
    Test case for a heat network and a gas network consisting out of a source, pipe(s) and a sink
    """

    def test_heat_network_head_loss(self):
        """
        Heat network: test the piecewise linear equality and inequality constraints of the head loss
        approximation.

        Checks:
        - That the head_loss() function does return the expected theoretical dH at a data point
        in the middle of the 1st line segment (dH curve is approximated with 5 linear lines)
        - That the head_loss() function does return a value smaller than a manual linearly
        approximated dH at a data point in the middle of the 1st line segment (dH curve is
        approximated with 5 linear lines)
        - That for the dH value approximated by the code is conservative, in other word greater
        than the theoretical value
        - That the pump power is conservative
        - The water kinematic viscosity of water by comparing head loss to a hard-coded value
        """
        import models.source_pipe_sink.src.double_pipe_heat as example
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        for head_loss_option_setting in [
            HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY,
            HeadLossOption.LINEARIZED_N_LINES_EQUALITY,
        ]:
            # Added for case where head loss is modelled via DW
            class SourcePipeSinkDW(SourcePipeSink):
                # Do not delete: this is used to manualy check writing out of profile data
                # def post(self):
                #     super().post()
                #     self._write_updated_esdl(
                #       self._ESDLMixin__energy_system_handler.energy_system,
                #       optimizer_sim=True,
                #   )

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
                        self.gas_network_settings["n_linearization_lines"] = 5
                        self.heat_network_settings["minimize_head_losses"] = True
                    elif head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_EQUALITY:
                        self.heat_network_settings["head_loss_option"] = (
                            HeadLossOption.LINEARIZED_N_LINES_EQUALITY
                        )
                        self.heat_network_settings["minimize_head_losses"] = False
                        self.heat_network_settings["minimum_velocity"] = 1.0e-6

                    return options

            # Do not delete kwargs: this is used to manualy check writing out of profile data
            kwargs = {
                "write_result_db_profiles": False,
                "influxdb_host": "localhost",
                "influxdb_port": 8086,
                "influxdb_username": None,
                "influxdb_password": None,
                "influxdb_ssl": False,
                "influxdb_verify_ssl": False,
            }

            solution = run_esdl_mesido_optimization(
                SourcePipeSinkDW,
                base_folder=base_folder,
                esdl_file_name="sourcesink.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries_import.csv",
                **kwargs,
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

                # Compare the head loss to hard-coded values. Difference expected if an error
                # occours in the calculation of the gas kinematic viscosity.
                if head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY:
                    if itime == 3:  # this index was chosen randomly
                        np.testing.assert_allclose(dh_milp_head_loss_function, 0.001690727020401069)

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

    def test_heat_network_pipe_split_head_loss(self):
        """
        Heat network: test the piecewise linear weak inequality and equality constraints of the
        head loss approximation.

        Checks:
        - That the head_loss() function does return the expected theoretical dH at a data point
        in the middle of the 1st line segment (dH curve is approximated with 5 linear lines)
        - That the head_loss() function does return a value smaller than a manual linearly
        approximated dH at a data point in the middle of the 1st line segment (dH curve is
        approximated with 5 linear lines)
        - That for the dH value approximated by the code is conservative, in other words greater
        than the theoretical value
        - Compare the optimized dH to the linear calculated value to ensure the specified
        constraint for the head loss linearization is satisfied.
        - For LINEARIZED_N_LINES_EQUALITY:
            - That only one linear line is active for the applicable pipes
            - That the linearized dH value is constraint is satisfied
            - Pipe 4 for has a zero flow rate, but its dH should be the same as pipe 2
        - Check that the minimum velocity in the longest parallel pipe (Pipe4):
            - LINEARIZED_N_LINES_WEAK_INEQUALITY: pipe velo == 0.0 or == default value
            - LINEARIZED_N_LINES_EQUALITY: velo > min velocity
        """
        import models.source_pipe_split_sink.src.double_pipe_heat as example
        from models.source_pipe_split_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(example.__file__).resolve().parent.parent

        # Keep track of the number of runs
        counter_linearized_n_lines_weak_ineq_runs = 0
        counter_total_runs = 0

        # Specify the head loss linearizations to be tested
        for head_loss_option_setting in [
            # Do not change the order of the items below.
            HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY,  # with min velo = 0.0
            HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY,  # with min velo = default value
            HeadLossOption.LINEARIZED_N_LINES_EQUALITY,
        ]:
            counter_total_runs += 1

            if head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY:
                counter_linearized_n_lines_weak_ineq_runs += 1

            # Added for case where head loss is modelled via DW
            class SourcePipeSinkDW(SourcePipeSink):
                def energy_system_options(self):
                    options = super().energy_system_options()

                    nonlocal head_loss_option_setting, counter_linearized_n_lines_weak_ineq_runs
                    head_loss_option_setting = head_loss_option_setting
                    counter_linearized_n_lines_weak_ineq_runs = (
                        counter_linearized_n_lines_weak_ineq_runs
                    )

                    self.heat_network_settings["head_loss_option"] = head_loss_option_setting

                    self.heat_network_settings["n_linearization_lines"] = 2
                    if head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_EQUALITY:
                        self.heat_network_settings["minimize_head_losses"] = False
                        self.heat_network_settings["minimum_velocity"] = 0.0
                        options["neglect_pipe_heat_losses"] = True
                    elif (
                        head_loss_option_setting
                        == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
                    ):
                        self.heat_network_settings["minimize_head_losses"] = True
                        if counter_linearized_n_lines_weak_ineq_runs == 1:
                            self.heat_network_settings["minimum_velocity"] = 0.0
                            options["neglect_pipe_heat_losses"] = True
                        elif counter_linearized_n_lines_weak_ineq_runs == 2:
                            ...
                            # Do not delete. This reminds the dev that different min velo value
                            # with min velo = default value (>0.0), instead of specifying a value
                            # here

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

            demand_matching_test(solution, results)

            pipes = ["Pipe1", "Pipe2", "Pipe3", "Pipe4"]
            # Only evaluate 1 pipe and 1 timestep for now to reduce the test case computational time
            ipipe = 0
            itime = 0
            v_max = solution.heat_network_settings["maximum_velocity"]
            pipe_diameter = solution.parameters(0)[f"{pipes[ipipe]}.diameter"]
            pipe_wall_roughness = solution.energy_system_options()["wall_roughness"]
            temperature = solution.parameters(0)[f"{pipes[ipipe]}.temperature"]
            pipe_length = solution.parameters(0)[f"{pipes[ipipe]}.length"]
            v_points = np.linspace(
                0.0,
                v_max,
                solution.heat_network_settings["n_linearization_lines"] + 1,
            )
            v_inspect = (
                results[f"{pipes[ipipe]}.HeatIn.Q"][itime]
                / solution.parameters(0)[f"{pipes[ipipe]}.area"]
            )

            # Theoretical head loss calc, dH =
            # friction_factor * 8 * pipe_length * volumetric_flow^2 / ( pipe_diameter^5 * g * pi^2)
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
                v_points[1], pipe_diameter, pipe_length, pipe_wall_roughness, temperature
            ) - darcy_weisbach.head_loss(
                v_points[0], pipe_diameter, pipe_length, pipe_wall_roughness, temperature
            )

            delta_volumetric_flow = (v_points[1] * np.pi * pipe_diameter**2 / 4.0) - (
                v_points[0] * np.pi * pipe_diameter**2 / 4.0
            )

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
                    dh_manual_linear, -results[f"{pipes[ipipe]}.dH"][itime] + 1e-6
                )
            elif head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_EQUALITY:
                np.testing.assert_allclose(
                    -results[f"{pipes[ipipe]}.dH"][itime], dh_manual_linear, rtol=1e-5, atol=1e-7
                )

            if head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_EQUALITY:
                # Check:
                #  - That only one linear line is active for the applicable pipes
                #  - That the linearized dH value is constraint is satisfied
                #  - Pipe 4 for has a zero flow rate, but its dH should be the same as pipe 2
                for pipe in pipes:
                    # Check that only one linear line segment is active for the head loss
                    # linearization
                    if pipe not in ["Pipe4"]:  # Pipe 4 has no flow rate
                        np.testing.assert_allclose(
                            results[f"{pipe}__pipe_linear_line_segment_num_1_neg_discharge"],
                            0.0,
                        )
                        np.testing.assert_allclose(
                            results[f"{pipe}__pipe_linear_line_segment_num_2_neg_discharge"],
                            0.0,
                        )
                        np.testing.assert_allclose(
                            results[f"{pipe}__pipe_linear_line_segment_num_2_pos_discharge"],
                            0.0,
                        )
                        np.testing.assert_allclose(
                            results[f"{pipe}__pipe_linear_line_segment_num_1_pos_discharge"],
                            1.0,
                        )
                        np.testing.assert_allclose(
                            results[f"{pipe}__pipe_linear_line_segment_num_2_pos_discharge"],
                            0.0,
                        )

                    if pipe not in ["Pipe4", "Pipe4_ret"]:
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
                                abs(results[f"{pipe}.dH"][ii]),
                            )
                    elif pipe in ["Pipe4", "Pipe4_ret"]:
                        np.testing.assert_allclose(
                            results["Pipe2.dH"][ii], results[f"{pipe}.dH"][ii]
                        )

            # Check min pipe velocity
            if (
                solution.heat_network_settings["head_loss_option"]
                == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
                and counter_linearized_n_lines_weak_ineq_runs == 1
            ):
                np.testing.assert_allclose(
                    results["Pipe4.HeatIn.Q"]
                    / (solution.parameters(0)["Pipe4.diameter"] ** 2 / 4.0 * np.pi),
                    0.0,
                    atol=1e-07,
                )
            elif (
                solution.heat_network_settings["head_loss_option"]
                == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
                and counter_linearized_n_lines_weak_ineq_runs == 2
            ):
                np.testing.assert_allclose(
                    results["Pipe4.HeatIn.Q"]
                    / (solution.parameters(0)["Pipe4.diameter"] ** 2 / 4.0 * np.pi),
                    0.005,  # Keep this value hard-coded to prevent future errors
                )
            else:  # LINEARIZED_N_LINES_EQUALITY
                np.testing.assert_array_less(
                    solution.heat_network_settings["minimum_velocity"],
                    results["Pipe4.HeatIn.Q"]
                    / (solution.parameters(0)["Pipe4.diameter"] ** 2 / 4.0 * np.pi),
                )
            # Checking that all the runs were done
            if counter_total_runs not in [
                1,
                2,
                3,
            ] or counter_linearized_n_lines_weak_ineq_runs not in [0, 1, 2]:
                exit("Something went wrong with the number of runs")
            elif counter_total_runs == 3 and counter_linearized_n_lines_weak_ineq_runs != 2:
                exit("Something went wrong with the number of runs")

    def test_gas_network_head_loss(self):
        """
        Gas network: Test the head loss approximation

        Checks:
        - head loss variable vs manually calcuated value
        - that the approximated head loss matches the manually calculated value
        - that linearized dH satisfies the specified constraint
        - that only one linear line segment is active for the head loss linearization
        - the kinematic viscosity of natural gas by comparing head loss to a hard-coded value
        """

        import models.unit_cases_gas.source_sink.src.run_source_sink as example
        from models.unit_cases_gas.source_sink.src.run_source_sink import GasProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        linear_head_loss_equality = 0.0

        # Specify the head loss linearizations to be tested
        for head_loss_option_setting in [
            HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY,
            HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY,
            HeadLossOption.LINEARIZED_N_LINES_EQUALITY,
        ]:

            class TestSourceSink(GasProblem):
                def energy_system_options(self):
                    options = super().energy_system_options()

                    nonlocal head_loss_option_setting
                    head_loss_option_setting = head_loss_option_setting

                    self.gas_network_settings["head_loss_option"] = head_loss_option_setting
                    if head_loss_option_setting == HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY:
                        # This setting is below is not needed for the optmizer, but is used in the
                        # test below.
                        self.gas_network_settings["n_linearization_lines"] = 1  # dot not delete
                        self.gas_network_settings["minimize_head_losses"] = True
                    elif (
                        head_loss_option_setting
                        == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
                    ):
                        self.gas_network_settings["n_linearization_lines"] = 2
                        self.gas_network_settings["minimize_head_losses"] = True
                    elif head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_EQUALITY:
                        self.gas_network_settings["n_linearization_lines"] = 2
                        self.gas_network_settings["minimize_head_losses"] = True
                        self.gas_network_settings["minimum_velocity"] = 0.0

                    return options

            solution = run_esdl_mesido_optimization(
                TestSourceSink,
                base_folder=base_folder,
                esdl_file_name="source_sink.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries.csv",
            )
            results = solution.extract_results()

            # Check the head loss variable
            np.testing.assert_allclose(
                results["Pipe_4abc.GasOut.H"] - results["Pipe_4abc.GasIn.H"],
                results["Pipe_4abc.dH"],
            )

            pipes = ["Pipe_4abc"]
            v_max = solution.gas_network_settings["maximum_velocity"]
            pipe_diameter = solution.parameters(0)[f"{pipes[0]}.diameter"]
            pipe_wall_roughness = solution.energy_system_options()["wall_roughness"]
            # TODO: resolve temperature - >solution.parameters(0)[f"{pipes[0]}.temperature"]
            temperature = 20.0
            pipe_length = solution.parameters(0)[f"{pipes[0]}.length"]
            v_points = [0.0, v_max / solution.gas_network_settings["n_linearization_lines"]]
            v_inspect = results[f"{pipes[0]}.GasOut.Q"] / solution.parameters(0)[f"{pipes[0]}.area"]

            # Approximate dH [m] vs Q [m3/s] with a linear line between between v_points
            # dH_manual_linear = a*Q + b
            # Then use this linear function to calculate the head loss
            head_loss_v_point_1 = darcy_weisbach.head_loss(
                v_points[1],
                pipe_diameter,
                pipe_length,
                pipe_wall_roughness,
                temperature,
                network_type=NetworkSettings.NETWORK_TYPE_GAS,
                pressure=solution.parameters(0)[f"{pipes[0]}.pressure"],
            )
            delta_dh_theory = head_loss_v_point_1 - darcy_weisbach.head_loss(
                v_points[0],
                pipe_diameter,
                pipe_length,
                pipe_wall_roughness,
                temperature,
                network_type=NetworkSettings.NETWORK_TYPE_GAS,
                pressure=solution.parameters(0)[f"{pipes[0]}.pressure"],
            )
            # Compare the hydraulic power to hard-coded values. Difference expected if an error
            # occours in the calculation of the gas kinematic viscosity.
            if head_loss_option_setting == HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY:
                np.testing.assert_allclose(head_loss_v_point_1, 1339.4824830351974)

            delta_volumetric_flow = (v_points[1] * np.pi * pipe_diameter**2 / 4.0) - (
                v_points[0] * np.pi * pipe_diameter**2 / 4.0
            )

            a = delta_dh_theory / delta_volumetric_flow
            b = delta_dh_theory - a * delta_volumetric_flow
            dh_manual_linear = a * (v_inspect * np.pi * pipe_diameter**2 / 4.0) + b

            # Check that the head loss approximation with 2 linear lines (inequality constraints
            # is < than the linear equality head loss constraint
            if head_loss_option_setting == HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY:
                # Check that the aproximated head loss matches the manually calculated value
                np.testing.assert_allclose(dh_manual_linear, -results[f"{pipes[0]}.dH"])
                linear_head_loss_equality = dh_manual_linear
            elif head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY:
                np.testing.assert_array_less(-results[f"{pipes[0]}.dH"], linear_head_loss_equality)
            elif head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_EQUALITY:
                # Check that the approximated head loss matches the manually calculated value
                np.testing.assert_allclose(dh_manual_linear[1], -results[f"{pipes[0]}.dH"][1])

            for pipe in pipes:
                velocities = results[f"{pipe}.Q"] / solution.parameters(0)[f"{pipe}.area"]
                # linearized dH satisfies the specified constraint
                np.testing.assert_array_less(
                    darcy_weisbach.head_loss(
                        velocities[0], pipe_diameter, pipe_length, pipe_wall_roughness, temperature
                    ),
                    -results[f"{pipe}.dH"][0],
                )
                if head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_EQUALITY:
                    # Check that only one linear line segment is active for the head loss
                    # linearization
                    np.testing.assert_allclose(
                        results[f"{pipe}__pipe_linear_line_segment_num_1_neg_discharge"],
                        0.0,
                    )
                    np.testing.assert_allclose(
                        results[f"{pipe}__pipe_linear_line_segment_num_2_neg_discharge"],
                        0.0,
                    )
                    np.testing.assert_allclose(
                        results[f"{pipe}__pipe_linear_line_segment_num_2_pos_discharge"],
                        0.0,
                    )
                    np.testing.assert_allclose(
                        results[f"{pipe}__pipe_linear_line_segment_num_1_pos_discharge"],
                        1.0,
                    )
                    np.testing.assert_allclose(
                        results[f"{pipe}__pipe_linear_line_segment_num_2_pos_discharge"],
                        0.0,
                    )

    def test_gas_network_pipe_split_head_loss(self):
        """
        Gas network: Test the head loss approximation for a parallel pipe network.

        Checks:
        - The head loss variable dH and __head_loss
        - That the gas demand is satisfied
        - Check that the aproximated head loss matches the maunally calculated value
        - That the linearized dH head loss contraint is satisfied
        - That only one linear line segment is active for the head loss linearization. Data points
        exists on both the 1st and 2nd linear line segment

        Notes:
        - The gas demand profile values have been chosen such that 2 data points are present on
        each of the two linearized head loss lines
        """

        import models.unit_cases_gas.source_pipe_split_sink.src.run_source_sink as example
        from models.unit_cases_gas.source_pipe_split_sink.src.run_source_sink import GasProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        # Specify the head loss linearizations to be tested
        for head_loss_option_setting in [
            HeadLossOption.LINEARIZED_N_LINES_EQUALITY,
        ]:

            class TestSourceSink(GasProblem):
                def energy_system_options(self):
                    options = super().energy_system_options()
                    self.gas_network_settings["minimum_velocity"] = 0.0

                    nonlocal head_loss_option_setting
                    head_loss_option_setting = head_loss_option_setting

                    self.gas_network_settings["head_loss_option"] = head_loss_option_setting
                    if head_loss_option_setting == HeadLossOption.LINEARIZED_N_LINES_EQUALITY:
                        # do not change in value below, see notes above
                        self.gas_network_settings["n_linearization_lines"] = 2
                        self.gas_network_settings["minimize_head_losses"] = False
                    # if statements below are currently not used, potential use in the future
                    elif head_loss_option_setting == HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY:
                        self.gas_network_settings["minimize_head_losses"] = True
                    elif (
                        head_loss_option_setting
                        == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
                    ):
                        self.gas_network_settings["n_linearization_lines"] = 2
                        self.gas_network_settings["minimize_head_losses"] = True

                    return options

            solution = run_esdl_mesido_optimization(
                TestSourceSink,
                base_folder=base_folder,
                esdl_file_name="source_sink.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries.csv",
            )
            results = solution.extract_results()

            # Check the head loss variable
            np.testing.assert_allclose(
                results["Pipe1.GasOut.H"] - results["Pipe1.GasIn.H"],
                results["Pipe1.dH"],
            )
            np.testing.assert_allclose(-results["Pipe1.dH"], results["Pipe1.__head_loss"])

            pipes = ["Pipe1"]
            v_max = solution.gas_network_settings["maximum_velocity"]
            pipe_diameter = solution.parameters(0)[f"{pipes[0]}.diameter"]
            pipe_wall_roughness = solution.energy_system_options()["wall_roughness"]
            temperature = 20.0
            pipe_length = solution.parameters(0)[f"{pipes[0]}.length"]
            v_points = np.linspace(
                0.0,
                v_max,
                solution.gas_network_settings["n_linearization_lines"] + 1,
            )
            v_inspect = results[f"{pipes[0]}.GasOut.Q"] / solution.parameters(0)[f"{pipes[0]}.area"]

            # Approximate dH [m] vs Q [m3/s] with a linear line between between v_points
            # dH_manual_linear = a*Q + b
            # Then use this linear function to calculate the head loss
            delta_dh_theory = []
            delta_volumetric_flow = []
            a = []
            b = []
            dh_manual_linear = []
            for ii in range(solution.gas_network_settings["n_linearization_lines"]):
                delta_dh_theory.append(
                    darcy_weisbach.head_loss(
                        v_points[ii + 1],
                        pipe_diameter,
                        pipe_length,
                        pipe_wall_roughness,
                        temperature,
                        network_type=NetworkSettings.NETWORK_TYPE_GAS,
                        pressure=solution.parameters(0)[f"{pipes[0]}.pressure"],
                    )
                    - darcy_weisbach.head_loss(
                        v_points[ii],
                        pipe_diameter,
                        pipe_length,
                        pipe_wall_roughness,
                        temperature,
                        network_type=NetworkSettings.NETWORK_TYPE_GAS,
                        pressure=solution.parameters(0)[f"{pipes[0]}.pressure"],
                    )
                )

                delta_volumetric_flow.append(
                    (v_points[ii + 1] * np.pi * pipe_diameter**2 / 4.0)
                    - (v_points[ii] * np.pi * pipe_diameter**2 / 4.0)
                )

                a.append(delta_dh_theory[ii] / delta_volumetric_flow[ii])
                b.append(sum(delta_dh_theory[0:ii]) - a[ii] * sum(delta_volumetric_flow[0:ii]))

            # dh for the 2 data point on the 1st linear line segment
            dh_manual_linear.append(a[0] * (v_inspect[0] * np.pi * pipe_diameter**2 / 4.0) + b[0])
            dh_manual_linear.append(a[0] * (v_inspect[1] * np.pi * pipe_diameter**2 / 4.0) + b[0])
            # dh for the 2 data point on the 2nd linear line segment
            dh_manual_linear.append(a[1] * (v_inspect[2] * np.pi * pipe_diameter**2 / 4.0) + b[1])
            dh_manual_linear.append(a[1] * (v_inspect[3] * np.pi * pipe_diameter**2 / 4.0) + b[1])

            # Gas flow balance
            np.testing.assert_allclose(
                results["GasDemand_a2d8.Gas_demand_mass_flow"],
                solution.get_timeseries("GasDemand_a2d8.target_gas_demand").values,
            )
            # demand_matching_test(solution, results)  # TODO still to be updated for gas networks

            # Check that the aproximated head loss matches the maunally calculated value
            np.testing.assert_allclose(dh_manual_linear, -results["Pipe1.dH"], atol=1e-6)

            for pipe in pipes:
                velocities = results[f"{pipe}.Q"] / solution.parameters(0)[f"{pipe}.area"]
                np.testing.assert_array_less(
                    darcy_weisbach.head_loss(
                        velocities[0], pipe_diameter, pipe_length, pipe_wall_roughness, temperature
                    ),
                    -results[f"{pipe}.dH"][0],
                )

                # Check that only one linear line segment is active for the head loss linearization
                np.testing.assert_allclose(
                    results[f"{pipe}__pipe_linear_line_segment_num_1_neg_discharge"],
                    0.0,
                )
                np.testing.assert_allclose(
                    results[f"{pipe}__pipe_linear_line_segment_num_2_neg_discharge"],
                    0.0,
                )
                # Gas demand for the 1st 2 timesteps fall on the 1st linear line segment
                np.testing.assert_allclose(
                    results[f"{pipe}__pipe_linear_line_segment_num_1_pos_discharge"][0:2],
                    1.0,
                )
                np.testing.assert_allclose(
                    results[f"{pipe}__pipe_linear_line_segment_num_1_pos_discharge"][2:4],
                    0.0,
                )
                # Gas demand for the last 2 timesteps fall on the 2nd linear line segment
                np.testing.assert_allclose(
                    results[f"{pipe}__pipe_linear_line_segment_num_2_pos_discharge"][0:2],
                    0.0,
                )
                np.testing.assert_allclose(
                    results[f"{pipe}__pipe_linear_line_segment_num_2_pos_discharge"][2:4],
                    1.0,
                )

    def test_gas_substation(self):
        """
        Test to check if the gas substation reduces the pressure and the head loss computation
        are correctly performed at the two pressure levels.

        Checks:
        - That the two pipes are at two different pressure levels
        _ That the pipes have the expected head loss given their reference pressures
        """
        import models.multiple_gas_carriers.src.run_multiple_gas_carriers as example
        from models.multiple_gas_carriers.src.run_multiple_gas_carriers import GasProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            GasProblem,
            base_folder=base_folder,
            esdl_file_name="multiple_carriers.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = solution.extract_results()
        parameters = solution.parameters(0)

        demand_matching_test(solution, results)

        assert parameters["Pipe1.pressure"] >= parameters["Pipe2.pressure"]

        for pipe in solution.energy_system_components.get("gas_pipe", []):
            dh = results[f"{pipe}.dH"]
            vel = results[f"{pipe}.Q"] / (np.pi * (parameters[f"{pipe}.diameter"] / 2.0) ** 2)
            for i in range(len(solution.times())):
                analytical_dh = (
                    vel[i]
                    / solution.gas_network_settings["maximum_velocity"]
                    * darcy_weisbach.head_loss(
                        solution.gas_network_settings["maximum_velocity"],
                        parameters[f"{pipe}.diameter"],
                        parameters[f"{pipe}.length"],
                        solution.energy_system_options()["wall_roughness"],
                        20.0,
                        network_type=NetworkSettings.NETWORK_TYPE_GAS,
                        pressure=parameters[f"{pipe}.pressure"],
                    )
                )
                np.testing.assert_allclose(abs(dh[i]), abs(analytical_dh), atol=1.0e-6)

    def test_compressor(self):
        """
        Test to check if the gas compressor increases the pressure and the head loss computation
        are correctly performed at the two pressure levels.

        Checks:
        - Demand matching ensuring that there is flow
        - That the two pipes are at two different pressure levels
        _ That the pipes have the expected head loss given their reference pressures
        """
        import models.multiple_gas_carriers.src.run_multiple_gas_carriers as example
        from models.multiple_gas_carriers.src.run_multiple_gas_carriers import GasProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        solution = run_esdl_mesido_optimization(
            GasProblem,
            base_folder=base_folder,
            esdl_file_name="compressor.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = solution.extract_results()
        parameters = solution.parameters(0)

        demand_matching_test(solution, results)

        assert parameters["Pipe1.pressure"] <= parameters["Pipe2.pressure"]

        for pipe in solution.energy_system_components.get("gas_pipe", []):
            dh = results[f"{pipe}.dH"]
            vel = results[f"{pipe}.Q"] / (np.pi * (parameters[f"{pipe}.diameter"] / 2.0) ** 2)
            for i in range(len(solution.times())):
                analytical_dh = (
                    vel[i]
                    / solution.gas_network_settings["maximum_velocity"]
                    * darcy_weisbach.head_loss(
                        solution.gas_network_settings["maximum_velocity"],
                        parameters[f"{pipe}.diameter"],
                        parameters[f"{pipe}.length"],
                        solution.energy_system_options()["wall_roughness"],
                        20.0,
                        network_type=NetworkSettings.NETWORK_TYPE_GAS,
                        pressure=parameters[f"{pipe}.pressure"],
                    )
                )
                np.testing.assert_allclose(abs(dh[i]), abs(analytical_dh), atol=1.0e-6)


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestHeadLoss()
    a.test_heat_network_head_loss()
    a.test_heat_network_pipe_split_head_loss()
    a.test_gas_network_head_loss()
    a.test_gas_network_pipe_split_head_loss()
    a.test_gas_substation()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
