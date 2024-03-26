from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption


import numpy as np

import pandas as pd

from rtctools.util import run_optimization_problem


class TestHydraulicPower(TestCase):
    def test_hydraulic_power(self):
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
            run_optimization_problem(
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
            run_optimization_problem(
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
            run_optimization_problem(
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


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestHydraulicPower()
    a.test_hydraulic_power()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
