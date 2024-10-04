import os
import sys
from pathlib import Path
from unittest import TestCase

from mesido.constants import GRAVITATIONAL_CONSTANT
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.util import run_esdl_mesido_optimization

import numpy as np

import pandapipes as pp
from pandapipes.timeseries import run_timeseries

import pandapower.control as control
from pandapower.timeseries import DFData
from pandapower.timeseries import OutputWriter

import pandas as pd

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class ValidateWithPandaPipes(TestCase):
    """
    Test case for a heat network consisting out of a source, pipe(s) and a sink
    """

    def test_heat_network_head_loss(self):
        """
        Heat network: compare the piecewise linear inequality constraints of the head loss
        approximation to pandapipes

        Checks:
        - head losses
        - cp value
        - check pandapipes values
        """
        root_folder = str(Path(__file__).resolve().parent.parent)
        sys.path.insert(1, root_folder)

        import examples.pandapipes.src.run_example
        from examples.pandapipes.src.run_example import HeatProblemHydraulic

        base_folder = Path(examples.pandapipes.src.run_example.__file__).resolve().parent.parent

        class SourcePipeSinkNetwork(HeatProblemHydraulic):

            def energy_system_options(self):
                options = super().energy_system_options()
                self.heat_network_settings["head_loss_option"] = (
                    HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
                )
                self.heat_network_settings["n_linearization_lines"] = 10

                self.heat_network_settings["minimum_velocity"] = 0.0

                return options

            def times(self, variable=None) -> np.ndarray:
                """
                Shorten the timeseries to speed up the test

                Parameters
                ----------
                variable : string with name of the variable

                Returns
                -------
                The timeseries
                """
                return super().times(variable)[:10]

        demand_time_series_file = "timeseries_constant.csv"

        solution = run_esdl_mesido_optimization(
            SourcePipeSinkNetwork,
            base_folder=base_folder,
            esdl_file_name="Test_Tree_S1C1.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file=demand_time_series_file,
        )
        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        # ------------------------------------------------------------------------------
        # ------------------------------------------------------------------------------
        # Setup and run pandapipes
        # ------------------------------------------------------------------------------
        # ------------------------------------------------------------------------------
        from examples.pandapipes.src.pandapipeesdlparser import PandapipeEsdlParserClass

        esdl_file = os.path.join(base_folder, "model", "Test_Tree_S1C1.esdl")
        esdlparser = PandapipeEsdlParserClass()
        esdlparser.loadESDLFile(esdl_file)
        # A producer/consumer cannot directly connect to a pipe, but must be connected to a joint,
        # therefore additional joints created for the inlet & outlet of these assets
        esdlparser.add_additional_joint()

        # ------------------------------------------------------------------------------
        # ------------------------------------------------------------------------------
        # Setup scenario
        total_producers = len(esdlparser.esdl_asset["heat"]["producer"])
        total_consumers = len(esdlparser.esdl_asset["heat"]["consumer"])

        # Create panda_pipes network
        net, net_asset, supply_temperature, return_temperature = esdlparser.createpandapipenet()

        # Setup profile data
        raw_profile_demand_load_watt = pd.read_csv(
            os.path.join(base_folder, "input", demand_time_series_file)
        )
        profile_demand_load_watt = pd.DataFrame(columns=["0"])
        profile_demand_load_watt["0"] = raw_profile_demand_load_watt["demand_1"]

        demand_power = profile_demand_load_watt["0"].to_numpy() / total_consumers
        profile_demand_load_watt = pd.DataFrame(results["demand_1.Heat_demand"])

        # Setup supply mass flow for panda_pipes
        average_temperature_kelvin = (supply_temperature + return_temperature) / 2.0 + 273.15
        cp_joule_kgkelvin = pp.get_fluid(net).get_heat_capacity(average_temperature_kelvin)

        # Enforce mass flow rate instead of cacluting it from Q = m_dot...
        mesido_demand_flow_kg_s = results["Pipe1.Q"] * 988.0
        demand_flow = mesido_demand_flow_kg_s
        supply_flow = demand_flow * total_consumers / total_producers

        # Below control is needed when there is more than 1 producer/heat demand
        net.flow_control.control_active[0] = False  # 1st supplier
        net.flow_control.control_active[0 + total_producers] = False  # 1st demand

        # Assign profiles to the following assets:
        #  - producer mass flow rate, supply temperature
        #  - heat demand power
        # Producer
        isupply = 0
        supply_flow_kg_s = pd.DataFrame(supply_flow, columns=[f"{isupply}"])
        ds_supply_pump_flow_kg_s = DFData(supply_flow_kg_s)
        control.ConstControl(
            net,
            element="circ_pump_mass",
            variable="mdot_flow_kg_per_s",
            element_index=net.circ_pump_mass.index.values[isupply],
            data_source=ds_supply_pump_flow_kg_s,
            profile_name=net.circ_pump_mass.index.values[isupply].astype(str),
        )
        supply_temp_kelvin = pd.DataFrame(
            [supply_temperature + 273.15] * len(profile_demand_load_watt),
            columns=[f"{isupply}"],
        )
        df_supply_pump_temperature_kelvin = DFData(supply_temp_kelvin)
        control.ConstControl(
            net,
            element="circ_pump_mass",
            variable="t_flow_k",
            element_index=net.circ_pump_mass.index.values[isupply],
            data_source=df_supply_pump_temperature_kelvin,
            profile_name=net.circ_pump_mass.index.values[isupply].astype(str),
        )

        # Demand settings
        idemand = 0
        demand_power_watt = pd.DataFrame(demand_power, columns=[f"{idemand}"])
        ds_demand_power_watt = DFData(demand_power_watt)
        control.ConstControl(
            net,
            element="heat_exchanger",
            variable="qext_w",
            element_index=net.heat_exchanger.index.values[idemand],
            data_source=ds_demand_power_watt,
            profile_name=net.heat_exchanger.index.values[idemand].astype(str),
        )

        if profile_demand_load_watt.shape[0] != supply_flow_kg_s.shape[0]:
            exit("profiles do not match")
        # Completed scenario setup

        # ------------------------------------------------------------------------------
        # ------------------------------------------------------------------------------
        # Run panda_pipes simulation
        time_steps = range(profile_demand_load_watt.shape[0])
        log_variables = [
            ("res_pipe", "v_mean_m_per_s"),
            ("res_pipe", "p_from_bar"),
            ("res_pipe", "p_to_bar"),
            ("res_pipe", "mdot_from_kg_per_s"),
            ("heat_exchanger", "qext_w"),
        ]
        ow = OutputWriter(
            net,
            time_steps,
            output_path=None,
            log_variables=log_variables,
        )

        try:
            run_timeseries(net, time_steps, mode="all", friction_model="colebrook")
        except Exception as e:
            print(e)
            exit("Pandapipes runs was not successful")

        # ------------------------------------------------------------------------------
        # Post processing panda_pipes results and tests
        net = esdlparser.correcting_pressure_return(net)
        ow.np_results["heat_exchanger.qext_w"]
        mdata_points = len(mesido_demand_flow_kg_s)

        density = (
            ow.np_results["res_pipe.mdot_from_kg_per_s"][0:mdata_points]
            / ow.np_results["res_pipe.v_mean_m_per_s"][0:mdata_points]
            / (np.pi * net.pipe.diameter_m[0] * net.pipe.diameter_m[0] / 4.0)
        )
        pandapipes_head_loss_m = (
            (
                ow.np_results["res_pipe.p_to_bar"][0:mdata_points]
                - ow.np_results["res_pipe.p_from_bar"][0:mdata_points]
            )
            * 100.0e3
            / density[0][0]
            / GRAVITATIONAL_CONSTANT
        )

        # Compare head losses
        # Hard coded value of 9 used below, since the last data entry has value close to 0, and
        # a comparison is not of importance
        for ii in range(len(results["Pipe1.dH"][:9])):
            np.testing.assert_array_less(
                pandapipes_head_loss_m[ii][0], 0.0
            )  # check that values are negative
            # check that mesido > pandapipes within %
            np.testing.assert_array_less(
                results["Pipe1.dH"][ii] / pandapipes_head_loss_m[ii][0], 1.08
            )
            np.testing.assert_array_less(
                1.0, results["Pipe1.dH"][ii] / pandapipes_head_loss_m[ii][0]
            )
        # Check cp value
        np.testing.assert_allclose(4200.0, cp_joule_kgkelvin)

        # Check panpapipes results
        # Expected results (during validation) during validation work
        expected_dh = {  #
            "pandapipes": [
                -1.34309074e01,
                -1.06285745e01,
                -8.15362473e00,
                -6.00606036e00,
                -4.18588773e00,
                -2.69436747e00,
                -1.52897525e00,
                -6.91030646e-01,
                -1.80687567e-01,
                -2.05221922e-05,
            ],
        }
        for ii in range(len(pandapipes_head_loss_m)):
            np.testing.assert_allclose(expected_dh["pandapipes"][ii], pandapipes_head_loss_m[ii][0])

        # ------------------------------------------------------------------------------------------
        # Do not delete the code below.
        # ------------------------------------------------------------------------------------------

        # # Plotting code for manual checking values
        # import matplotlib.pyplot as plt

        # # Setup data for easy plotting
        # velo_m_s = {
        #     "pandapipes": [],
        #     "mesido": results["Pipe1.HeatIn.Q"] / solution.parameters(0)["Pipe1.area"],
        # }
        # head_loss_m = {
        #     "pandapipes": [],
        #     "mesido": -results["Pipe1.dH"],
        # }
        # for ii in range(len(ow.np_results["res_pipe.v_mean_m_per_s"])):
        #     velo_m_s["pandapipes"].append(ow.np_results["res_pipe.v_mean_m_per_s"][ii][0])
        #     head_loss_m["pandapipes"].append(-pandapipes_head_loss_m[ii][0])

        # # Plot data
        # plt.figure().set_size_inches(10, 6)
        # plt.plot(velo_m_s["pandapipes"], head_loss_m["pandapipes"], linewidth=2)
        # plt.plot(
        #     velo_m_s["mesido"],
        #     head_loss_m["mesido"],
        #     "k--",
        #     linewidth=2,
        #     alpha=0.75,
        #     marker="x"
        # )

        # plt.legend(["pandapipes", "MESIDO"], prop={'size': 13})
        # plt.xlabel("Flow velocity [m/s]", fontsize=16)
        # plt.ylabel("Head loss [m]", fontsize=16)
        # plt.grid()
        # plt.xticks(np.linspace(0, 2.5, 6), fontsize=16)
        # plt.yticks(
        #     np.linspace(0, 15.0, 7),
        #     labels=["0.0", "2.5", "5.0", "7.5", "10.0", "12.5", "15.0"],
        #     fontsize=16,
        # )
        # plt.xlim([0., 2.5])
        # plt.tick_params(left=False, right=False, labelleft=False)
        # plt.ylim([0., 15.])
        # plt.tick_params(left=True, right=False, labelleft=True)
        # n_lines = solution.heat_network_settings["n_linearization_lines"]
        # plt.savefig(f"dH MESIDO_{n_lines} vs pandapipes")
        # plt.show()
        # plt.close()

        # end Plotting code for manual checking values
        # ------------------------------------------------------------------------------------------


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = ValidateWithPandaPipes()
    a.test_heat_network_head_loss()

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
