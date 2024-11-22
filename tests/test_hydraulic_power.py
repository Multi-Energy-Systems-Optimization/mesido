from pathlib import Path
from unittest import TestCase

from mesido._darcy_weisbach import head_loss
from mesido.constants import GRAVITATIONAL_CONSTANT
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.network_common import NetworkSettings
from mesido.util import run_esdl_mesido_optimization

import numpy as np

import pandas as pd

from utils_tests import demand_matching_test


class TestHydraulicPower(TestCase):
    def test_hydraulic_power_heat(self):
        """
        Check the workings for the hydraulic power variable.

        Scenario 1. LINEARIZED_N_LINES_WEAK_INEQUALITY (1 line segment)
        Scenario 2. LINEARIZED_ONE_LINE_EQUALITY
        Scenario 3. LINEARIZED_N_LINES_WEAK_INEQUALITY (default line segments = 5)

        Checks:
        - For all scenarios (unless stated otherwise):
            - check that the hydraulic power variable (based on linearized setting) is larger than
            the numerically calculated (post processed)
            - Scenario 1&3: check that the hydraulic power variable = known/verified value for the
            specific case
            - Scenario 1: check that the hydraulic power for the supply and return pipe is the same
            - Scenario 1&2: check that the hydraulic power for these two scenarios are the same
            - Scenario 2: check that the post processed hydraulic power based on flow results
            (voluemtric flow rate * pressure loss) of scenario 1 & 2 are the same.
            - Scenario 3: check that the hydraulic power variable of scenatio 1 > scenario 3, which
            would be expected because scenario 3 has more linear line segments, theerefore the
            approximation would be closer to the theoretical non-linear curve when compared to 1
            linear line approximation of the theoretical non-linear curve.

        Missing:
        - The way the problems are ran and adapted is different compared to the other tests, where
        a global variable is adapted between different runs. I would suggest that we make separate
        problems like we do in the other tests.
        - Also I would prefer using the results directly in this test instead of calling the
        df_MILP.
        - See if the hard coded values can be avoided.

        """
        import models.pipe_test.src.run_hydraulic_power as run_hydraulic_power
        from models.pipe_test.src.run_hydraulic_power import (
            HeatProblem,
        )

        # Settings
        base_folder = Path(run_hydraulic_power.__file__).resolve().parent.parent
        run_hydraulic_power.comp_vars_vals = {
            "pipe_length": [25000.0],  # [m]
        }
        run_hydraulic_power.comp_vars_init = {
            "pipe_length": 0.0,  # [m]
            "heat_demand": [3.95 * 10**6, 3.95 * 10**6],  # [W]
            "pipe_DN_MILP": 300,  # [mm]
        }
        standard_columns_specified = [
            "Pipe1_supply_dPress",
            "Pipe1_return_dPress",
            "Pipe1_supply_Q",
            "Pipe1_return_Q",
            "Pipe1_supply_mass_flow",
            "Pipe1_return_mass_flow",
            "Pipe1_supply_flow_vel",
            "Pipe1_return_flow_vel",
            "Pipe1_supply_dT",
            "Pipe1_return_dT",
            "Heat_source",
            "Heat_demand",
            "Heat_loss",
            "pipe_length",
        ]

        # Initialize variables
        run_hydraulic_power.ThermalDemand = run_hydraulic_power.comp_vars_init["heat_demand"]
        run_hydraulic_power.manual_set_pipe_length = run_hydraulic_power.comp_vars_init[
            "pipe_length"
        ]
        run_hydraulic_power.manual_set_pipe_DN_diam_MILP = run_hydraulic_power.comp_vars_init[
            "pipe_DN_MILP"
        ]
        # ----------------------------------------------------------------------------------------
        # 3 MILP simulations with the only difference being the linear head loss setting:
        # - LINEARIZED_N_LINES_WEAK_INEQUALITY (1 line segment)
        # - LINEARIZED_ONE_LINE_EQUALITY
        # - LINEARIZED_N_LINES_WEAK_INEQUALITY (default line segments = 5)
        # ----------------------------------------------------------------------------------------
        # Run MILP with LINEARIZED_N_LINES_WEAK_INEQUALITY head loss setting and 1 line segement
        run_hydraulic_power.df_MILP = pd.DataFrame(columns=standard_columns_specified)
        run_hydraulic_power.head_loss_setting = HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
        run_hydraulic_power.n_linearization_lines_setting = 1

        for val in range(0, len(run_hydraulic_power.comp_vars_vals["pipe_length"])):
            run_hydraulic_power.manual_set_pipe_length = run_hydraulic_power.comp_vars_vals[
                "pipe_length"
            ][val]
            run_esdl_mesido_optimization(
                HeatProblem,
                base_folder=base_folder,
                esdl_file_name="test_simple.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries_import.xml",
            )

        hydraulic_power_post_process_dw_1 = run_hydraulic_power.df_MILP["Pipe1_supply_Q"][0] * abs(
            run_hydraulic_power.df_MILP["Pipe1_supply_dPress"][0]
        )
        hydraulic_power_dw_1 = run_hydraulic_power.df_MILP["Pipe1_supply_Hydraulic_power"][0]
        # Hydraulic power = delta pressure * Q = f(Q^3), where delta pressure = f(Q^2)
        # The linear approximation (hydraulic_power_dw_1) of the 3rd order function should
        # overestimate the hydraulic power when compared to the product of Q and the linear
        # approximation of 2nd order function (delta pressure).
        np.testing.assert_array_less(
            hydraulic_power_post_process_dw_1,
            hydraulic_power_dw_1,
            "Post process hydraulic power must be < hydraulic_power",
        )
        # Compare hydraulic power, for an one hour timeseries with a specific demand, to a hard
        # coded value which originates from runnning MILP without big_m method being implemented,
        # during the comparison of MILP and a high-fidelity code
        # FIXME: this value from high-fidelity code needs to be checked, due to changes in the setup
        # of the heat_to_discharge constraints, the volumetric flow has increased, resulting in
        # larger pressure drops.
        np.testing.assert_allclose(128001.23151838078, hydraulic_power_dw_1, atol=10)
        np.testing.assert_allclose(
            run_hydraulic_power.df_MILP["Pipe1_return_Hydraulic_power"][0],
            run_hydraulic_power.df_MILP["Pipe1_supply_Hydraulic_power"][0],
            rtol=1e-2,
        )
        # ----------------------------------------------------------------------------------------
        # Rerun MILP with LINEARIZED_ONE_LINE_EQUALITY head loss setting
        run_hydraulic_power.df_MILP = pd.DataFrame(columns=standard_columns_specified)  # empty df
        run_hydraulic_power.head_loss_setting = HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY

        for val in range(0, len(run_hydraulic_power.comp_vars_vals["pipe_length"])):
            run_hydraulic_power.manual_set_pipe_length = run_hydraulic_power.comp_vars_vals[
                "pipe_length"
            ][val]
            run_esdl_mesido_optimization(
                HeatProblem,
                base_folder=base_folder,
                esdl_file_name="test_simple.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries_import.xml",
            )

        hydraulic_power_post_process_linear = run_hydraulic_power.df_MILP["Pipe1_supply_Q"][
            0
        ] * abs(run_hydraulic_power.df_MILP["Pipe1_supply_dPress"][0])
        hydraulic_power_linear = run_hydraulic_power.df_MILP["Pipe1_supply_Hydraulic_power"][0]
        # Hydraulic power = delta pressure * Q = f(Q^3), where delta pressure = f(Q^2)
        # The linear approximation (1 line segment) of the 3rd order function should
        # overestimate the hydraulic power when compared to the product of Q and the linear
        # approximation of 2nd order function (delta pressure).
        np.testing.assert_array_less(
            hydraulic_power_post_process_linear,
            hydraulic_power_linear,
            "Post process hydraulic power must be < hydraulic_power",
        )
        # Hydraulic hydraulic =  delta pressure * Q = f(Q^3), where delta pressure = f(Q^2)
        # The predicted hydraulic power should be the same when the delta pressure is approximated
        # by a linear segment, via 2 different head loss setting options. Head loss setting =
        # HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY and
        # HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY (with 1 linear segment)
        np.testing.assert_allclose(
            hydraulic_power_post_process_linear,
            hydraulic_power_post_process_dw_1,
            rtol=1e-7,
            err_msg="Values should be the same",
        )
        # Hydraulic hydraulic =  delta pressure * Q = f(Q^3)
        # The predicted hydraulic power should be the same if it is approximated by a linear segment
        # , via 2 different head loss setting options. Head loss setting =
        # HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY and
        # HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY (with 1 linear segment)
        np.testing.assert_allclose(
            hydraulic_power_linear, hydraulic_power_dw_1, err_msg="Values should be the same"
        )
        # ----------------------------------------------------------------------------------------
        # Rerun MILP with DW head loss setting, and default line segments
        run_hydraulic_power.df_MILP = pd.DataFrame(columns=standard_columns_specified)  # empty df
        run_hydraulic_power.head_loss_setting = HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
        run_hydraulic_power.n_linearization_lines_setting = 5

        for val in range(0, len(run_hydraulic_power.comp_vars_vals["pipe_length"])):
            run_hydraulic_power.manual_set_pipe_length = run_hydraulic_power.comp_vars_vals[
                "pipe_length"
            ][val]
            run_esdl_mesido_optimization(
                HeatProblem,
                base_folder=base_folder,
                esdl_file_name="test_simple.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries_import.xml",
            )

        hydraulic_power_post_process_dw = run_hydraulic_power.df_MILP["Pipe1_supply_Q"][0] * abs(
            run_hydraulic_power.df_MILP["Pipe1_supply_dPress"][0]
        )
        hydraulic_power_dw = run_hydraulic_power.df_MILP["Pipe1_supply_Hydraulic_power"][0]
        # Hydraulic power = delta pressure * Q = f(Q^3), where delta pressure = f(Q^2)
        # The linear approximation (default number of line segments) of the 3rd order function
        # should overestimate the hydraulic power when compared to the product of Q and the linear
        # approximation (default number of line segments) of 2nd order function (delta pressure).
        np.testing.assert_array_less(
            hydraulic_power_post_process_dw,
            hydraulic_power_dw,
            "Post process hydraulic power must be < hydraulic_power",
        )
        # Hydraulic power = delta pressure * Q = f(Q^3), where delta pressure = f(Q^2)
        # The approximation of the 3rd order function via 5 line segments (dafault value) should be
        # better compared to 1 line segment approximation thereof. The latter will result in an
        # overstimated prediction
        np.testing.assert_array_less(
            hydraulic_power_dw,
            hydraulic_power_dw_1,
            "5 line segments predicted hydraulic power > hydraulic_power with 1 line segment",
        )
        # Compare hydraulic power, for an one hour timeseries with a specific demand, to a hard
        # coded value which originates from runnning MILP without big_m method being implemented,
        # during the comparison of MILP and a high-fidelity code
        # FIXME: this value from high-fidelity code needs to be checked, due to changes in the setup
        #  of the heat_to_discharge constraints, the volumetric flow has increased, resulting in
        #  larger pressure drops.
        np.testing.assert_allclose(
            5332.57631593844,
            hydraulic_power_dw,
            atol=10.0,
        )

    def test_hydraulic_power_gas(self):
        """
        Checks the logic for the hydraulic power of gas pipes.
        - checks if value on linearized lines, for multiple lines
        - checks if hydraulic power is 0 at end of the pipe
        - checks if differences of in/out port is equal to the added hydraulic power of that pipe
        - checks absolutae value of the hydraulic power loss over a line
        - demand matching
        """
        import models.unit_cases_gas.source_sink.src.run_source_sink as run_source_sink
        from models.unit_cases_gas.source_sink.src.run_source_sink import (
            GasProblem,
        )

        # Settings
        base_folder = Path(run_source_sink.__file__).resolve().parent.parent

        class GasProblemHydraulic(GasProblem):
            def read(self):
                super().read()

                for d in self.energy_system_components["gas_demand"]:
                    new_timeseries = self.get_timeseries(f"{d}.target_gas_demand").values * 5e3
                    self.set_timeseries(f"{d}.target_gas_demand", new_timeseries)

            def energy_system_options(self):
                options = super().energy_system_options()

                self.gas_network_settings["head_loss_option"] = (
                    HeadLossOption.LINEARIZED_N_LINES_EQUALITY
                )
                self.gas_network_settings["n_linearization_lines"] = 3
                self.gas_network_settings["minimum_velocity"] = 0.0
                self.gas_network_settings["minimize_head_losses"] = False

                return options

        solution = run_esdl_mesido_optimization(
            GasProblemHydraulic,
            base_folder=base_folder,
            esdl_file_name="source_sink.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        # TODO: add check on values for hydraulic power.
        results = solution.extract_results()
        parameters = solution.parameters(0)

        demand_matching_test(solution, results)

        pipe = "Pipe_4abc"
        pipe_hp_in = results[f"{pipe}.GasIn.Hydraulic_power"]
        pipe_hp_out = results[f"{pipe}.GasOut.Hydraulic_power"]
        pipe_hp = results[f"{pipe}.Hydraulic_power"]

        pipe_mass = results["Pipe_4abc.GasIn.mass_flow"]

        # due to non linearity, every timestep on new linearized line, a doubled mass flow should
        # result in more than doubled hydraulic power
        tol_hp = 1.0e-6
        np.testing.assert_array_less(
            pipe_hp[0] * (pipe_mass[1] / pipe_mass[0]), pipe_hp[1] + tol_hp
        )
        np.testing.assert_array_less(
            pipe_hp[1] * (pipe_mass[2] / pipe_mass[1]), pipe_hp[2] + tol_hp
        )

        np.testing.assert_allclose(pipe_hp, pipe_hp_in - pipe_hp_out)
        np.testing.assert_allclose(0, pipe_hp_out)

        # TODO: use mass flow to get calculated hydraulic power

        rho = parameters[f"{pipe}.rho"]
        d = parameters[f"{pipe}.diameter"]
        area = parameters[f"{pipe}.area"]
        length = parameters[f"{pipe}.length"]
        pressure = parameters[f"{pipe}.pressure"]
        wall_roughness = solution.energy_system_options()["wall_roughness"]
        v_max = solution.gas_network_settings["maximum_velocity"]
        temperature = 20.0

        v_inspect = results[f"{pipe}.GasOut.Q"] / solution.parameters(0)[f"{pipe}.area"]

        calc_hp_accurate = [
            rho
            * GRAVITATIONAL_CONSTANT
            * v
            * area
            * head_loss(
                v,
                d,
                length,
                wall_roughness,
                temperature,
                network_type=NetworkSettings.NETWORK_TYPE_GAS,
                pressure=pressure,
            )
            for v in v_inspect
        ]
        np.testing.assert_array_less(calc_hp_accurate, pipe_hp + tol_hp)

        v_points = [
            i * v_max / solution.gas_network_settings["n_linearization_lines"]
            for i in range(solution.gas_network_settings["n_linearization_lines"] + 1)
        ]
        calc_hp_v_points = [
            rho
            * GRAVITATIONAL_CONSTANT
            * v
            * area
            * head_loss(
                v,
                d,
                length,
                wall_roughness,
                temperature,
                network_type=NetworkSettings.NETWORK_TYPE_GAS,
                pressure=pressure,
            )
            for v in v_points
        ]
        v_points_volumetric = np.asarray(v_points) * np.pi * d**2 / 4.0
        a = np.diff(calc_hp_v_points) / np.diff(v_points_volumetric)
        b = calc_hp_v_points[1:] - a * v_points_volumetric[1:]

        np.testing.assert_allclose(pipe_hp[0], a[0] * results[f"{pipe}.GasOut.Q"][0] + b[0])
        np.testing.assert_allclose(pipe_hp[1], a[1] * results[f"{pipe}.GasOut.Q"][1] + b[1])
        np.testing.assert_allclose(pipe_hp[2], a[2] * results[f"{pipe}.GasOut.Q"][2] + b[2])

    def test_hydraulic_power_gas_multi_demand(self):
        """
        Checks the logic for the hydraulic power of gas pipes.
        - checks if value on linearized lines, for multiple lines
        - checks if hydraulic power is 0 at end of the pipe if connected to a demand
        - checks if hydraulic power at start of line connected to a producers is larger than 0
        - checks if differences of in/out port is equal to the added hydraulic power of that pipe
        """
        import models.unit_cases_gas.multi_demand_source_node.src.run_test as run_test
        from models.unit_cases_gas.multi_demand_source_node.src.run_test import (
            GasProblem,
        )

        # Settings
        base_folder = Path(run_test.__file__).resolve().parent.parent

        class GasProblemHydraulic(GasProblem):

            def read(self):
                super().read()

                for d in self.energy_system_components["gas_demand"]:
                    new_timeseries = self.get_timeseries(f"{d}.target_gas_demand").values * 1.39
                    self.set_timeseries(f"{d}.target_gas_demand", new_timeseries)

            def energy_system_options(self):
                options = super().energy_system_options()

                self.gas_network_settings["head_loss_option"] = (
                    HeadLossOption.LINEARIZED_N_LINES_EQUALITY
                )
                self.gas_network_settings["n_linearization_lines"] = 3
                self.gas_network_settings["minimum_velocity"] = 0.0
                self.gas_network_settings["minimize_head_losses"] = False

                return options

        solution = run_esdl_mesido_optimization(
            GasProblemHydraulic,
            base_folder=base_folder,
            esdl_file_name="test.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        # TODO: add check on values for hydraulic power.
        results = solution.extract_results()

        pipes = ["Pipe_7c53", "Pipe_f1a4", "Pipe_0e39", "Pipe_c50f"]
        for pipe in pipes:
            pipe_hp_in = results[f"{pipe}.GasIn.Hydraulic_power"]
            pipe_hp_out = results[f"{pipe}.GasOut.Hydraulic_power"]
            pipe_hp = results[f"{pipe}.Hydraulic_power"]

            pipe_mass = results[f"{pipe}.GasIn.mass_flow"]

            np.testing.assert_allclose(pipe_hp, pipe_hp_in - pipe_hp_out, atol=1e-8)
            if pipe in ["Pipe_7c53", "Pipe_c50f"]:
                # connected to demand, thus hydraulic_power should be 0
                np.testing.assert_allclose(0, pipe_hp_out)

            v_max = solution.gas_network_settings["maximum_velocity"]

            v_inspect = results[f"{pipe}.GasOut.Q"] / solution.parameters(0)[f"{pipe}.area"]
            v_points = [
                i * v_max / solution.gas_network_settings["n_linearization_lines"]
                for i in range(solution.gas_network_settings["n_linearization_lines"] + 1)
            ]

            # Check hydraulic power for:
            # - On the first linear line (line_index = 0), the line intercepts the y-axis at 0. So a
            # simple ratio calc is used
            # - On any other linear line (line_index > 0), the line does not intercept the y-axis
            # at 0 anymore. But it is known that the gradient of these lines are higher than the
            # gradient of the line at line_index=0, due these lines representing a non-linear
            # curve. This implies that the hydraulic power on these lines will be higher than the
            # hydraulic power that is exrapolated from line_index=0. Also if on line index > 0 then
            # the extrapolated value will on a line will be larger.
            # Notes:
            # - It is ensured that for each pipe more than one line out of the linearized lines is
            # used
            # - Checks have been added to cater for the scenario where the a pipe has no flow at a
            # specific time step
            v_inspect_line_ind = []
            v_points = np.array(v_points)
            for k in range(len(v_inspect)):
                idx = v_points < v_inspect[k] + 1e-6
                v_inspect_line_ind.append(np.where(idx)[0][-1])

            ind_check = 0
            for k in range(len(v_inspect) - 1):
                if (
                    v_inspect_line_ind[k] == v_inspect_line_ind[k + 1]
                    and v_inspect_line_ind[k] == 0
                ):  # use simple ratio calc
                    if pipe_mass[k] > 0:
                        np.testing.assert_allclose(
                            pipe_hp[k] * pipe_mass[k + 1] / pipe_mass[k], pipe_hp[k + 1]
                        )
                    elif pipe_mass[k] == 0:
                        np.testing.assert_array_less(0.0, pipe_hp[k + 1])
                    elif pipe_mass[k] < 0:
                        raise RuntimeWarning("The mass flow cannot be negative for this test case")
                elif (
                    v_inspect_line_ind[k] == v_inspect_line_ind[k + 1]
                    and v_inspect_line_ind[k] > 0
                    and k > 0
                ):
                    # use fact that the extrapolated value will be smaller than the value on the
                    # next line
                    if pipe_mass[k - 1] > 0:
                        np.testing.assert_array_less(
                            pipe_hp[k - 1] * pipe_mass[k + 1] / pipe_mass[k - 1], pipe_hp[k + 1]
                        )
                        np.testing.assert_array_less(
                            pipe_hp[k - 1] * pipe_mass[k] / pipe_mass[k - 1], pipe_hp[k]
                        )
                    elif pipe_mass[k - 1] == 0:
                        np.testing.assert_array_less(0.0, pipe_hp[k + 1])
                    elif pipe_mass[k] < 0:
                        raise RuntimeWarning("The mass flow cannot be negative for this test case")
                elif (
                    v_inspect_line_ind[k] == v_inspect_line_ind[k + 1]
                    and v_inspect_line_ind[k] > 0
                    and k == 0
                ):
                    # use fact that the extrapolated value will be larger on the same line
                    if pipe_mass[k] > 0:
                        np.testing.assert_array_less(
                            pipe_hp[k] * pipe_mass[k + 1] / pipe_mass[k], pipe_hp[k + 1]
                        )
                    elif pipe_mass[k] == 0:
                        np.testing.assert_array_less(0.0, pipe_hp[k + 1])
                    elif pipe_mass[k] < 0:
                        raise RuntimeWarning("The mass flow cannot be negative for this test case")
                elif v_inspect_line_ind[k] < v_inspect_line_ind[k + 1]:
                    if pipe_mass[k] > 0:
                        np.testing.assert_array_less(
                            (pipe_hp[k]) * pipe_mass[k + 1] / pipe_mass[k], pipe_hp[k + 1]
                        )
                    elif pipe_mass[k] == 0:
                        np.testing.assert_array_less(0.0, pipe_hp[k + 1])
                    elif pipe_mass[k] < 0:
                        raise RuntimeWarning("The mass flow cannot be negative for this test case")
                    ind_check += 1
                else:
                    raise RuntimeWarning(
                        "For this test to succeed the flow should increase over time"
                    )
            np.testing.assert_array_less(
                0.5, ind_check, f"{pipe} is not checked between multiple lines"
            )

        # balance of hydraulic power
        pipes_demand = ["Pipe_7c53", "Pipe_c50f"]
        pipes_source = ["Pipe_0e39", "Pipe_f1a4"]
        balance = np.zeros(3)
        for p in pipes_demand:
            balance += results[f"{p}.GasIn.Hydraulic_power"]
        for p in pipes_source:
            balance -= results[f"{p}.GasOut.Hydraulic_power"]
        np.testing.assert_allclose(balance, 0.0, atol=1e-6)

        for node, connected_pipes in solution.energy_system_topology.gas_nodes.items():
            hydraulic_sum = 0.0

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                hydraulic_sum += results[f"{node}.GasConn[{i_conn+1}].Q"] * orientation

            np.testing.assert_allclose(hydraulic_sum, 0.0, atol=1.0e-3)

        for d in solution.energy_system_components.get("gas_demand"):
            np.testing.assert_allclose(results[f"{d}.GasIn.Hydraulic_power"], 0.0)
        for d in solution.energy_system_components.get("gas_source"):
            np.testing.assert_array_less(0.0, results[f"{d}.GasOut.Hydraulic_power"])


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestHydraulicPower()
    # a.test_hydraulic_power_heat()
    # a.test_hydraulic_power_gas()
    a.test_hydraulic_power_gas_multi_demand()

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
