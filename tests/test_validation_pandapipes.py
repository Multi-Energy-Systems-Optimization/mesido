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
                return super().times(variable)[:9]

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
        esdlparser.add_additional_joint()

        # ------------------------------------------------------------------------------
        # ------------------------------------------------------------------------------
        # Setup scenario
        total_producers = len(esdlparser.esdl_asset['heat']['producer'])
        total_consumers = len(esdlparser.esdl_asset['heat']['consumer'])

        # Create panda_pipes network
        net, net_asset, supply_temperature, return_temperature = (
            esdlparser.createpandapipenet()
        )

        # Setup profile data
        raw_profile_demand_load_watt = pd.read_csv(
            os.path.join(base_folder, "input", demand_time_series_file)
        )
        profile_demand_load_watt = pd.DataFrame(columns=["0"])
        profile_demand_load_watt["0"] = raw_profile_demand_load_watt["demand_1"]

        demand_power = profile_demand_load_watt["0"].to_numpy() / total_consumers
        profile_demand_load_watt = pd.DataFrame(results["demand_1.Heat_demand"])

        # Setup supply mass flow for panda_pipes
        average_temperature_kelvin = (
            (supply_temperature + return_temperature) / 2.0 + 273.15
        )
        cp_joule_kgkelvin = pp.get_fluid(net).get_heat_capacity(
            average_temperature_kelvin
        )

        # Enforce mass flow rate instead of cacluting it from Q = m_dot...
        mesido_demand_flow_kg_s = results["Pipe1.Q"] * 988.0
        demand_flow = mesido_demand_flow_kg_s
        supply_flow = demand_flow * total_consumers / total_producers

        # Assign profiles to assets
        net.flow_control.control_active[0] = False  # 1st supplier
        net.flow_control.control_active[0 + total_producers] = False  # 1st demand

        # Producer
        isupply = 0
        supply_flow_kg_s = pd.DataFrame(supply_flow, columns=[f'{isupply}'])
        ds_supply_pump_flow_kg_s = DFData(supply_flow_kg_s)
        control.ConstControl(
            net,
            element='circ_pump_mass',
            variable='mdot_flow_kg_per_s',
            element_index=net.circ_pump_mass.index.values[isupply],
            data_source=ds_supply_pump_flow_kg_s,
            profile_name=net.circ_pump_mass.index.values[isupply].astype(str)
        )
        supply_temp_kelvin = pd.DataFrame(
            [supply_temperature + 273.15] * len(profile_demand_load_watt),
            columns=[f'{isupply}'],
        )
        df_supply_pump_temperature_kelvin = DFData(supply_temp_kelvin)
        control.ConstControl(
            net,
            element='circ_pump_mass',
            variable='t_flow_k',
            element_index=net.circ_pump_mass.index.values[isupply],
            data_source=df_supply_pump_temperature_kelvin,
            profile_name=net.circ_pump_mass.index.values[isupply].astype(str)
        )
        supply_flow_kgs_s = pd.DataFrame(supply_flow, columns=[f'{isupply}'])
        ds_supply_control_flow_kgs_s = DFData(supply_flow_kgs_s)
        control.ConstControl(
            net, element='flow_control',
            variable='controlled_mdot_kg_per_s',
            element_index=net.flow_control.index.values[isupply],
            data_source=ds_supply_control_flow_kgs_s,
            profile_name=net.flow_control.index.values[isupply].astype(str)
        )

        # Demand settings
        idemand = 0
        demand_power_watt = pd.DataFrame(demand_power, columns=[f'{idemand}'])
        ds_demand_power_watt = DFData(demand_power_watt)
        control.ConstControl(
            net,
            element='heat_exchanger',
            variable='qext_w',
            element_index=net.heat_exchanger.index.values[idemand],
            data_source=ds_demand_power_watt,
            profile_name=net.heat_exchanger.index.values[idemand].astype(str)
        )

        demand_flow_kgs_s = pd.DataFrame(
            demand_flow,
            columns=[f'{idemand + total_producers}'],
        )
        ds_demand_control_flow_kgs_s = DFData(demand_flow_kgs_s)
        control.ConstControl(
            net, element='flow_control',
            variable='controlled_mdot_kg_per_s',
            element_index=net.flow_control.index.values[idemand + total_producers],
            data_source=ds_demand_control_flow_kgs_s,
            profile_name=net.flow_control.index.values[
                idemand + total_producers
            ].astype(str)
        )

        if profile_demand_load_watt.shape[0] != supply_flow_kg_s.shape[0]:
            exit("profiles do not match")
        # Completed scenario setup

        # ------------------------------------------------------------------------------
        # ------------------------------------------------------------------------------
        # Run panda_pipes simulation
        time_steps = range(profile_demand_load_watt.shape[0])
        log_variables = [
            ('res_pipe', 'v_mean_m_per_s'),
            ('res_pipe', 'p_from_bar'),
            ('res_pipe', 'p_to_bar'),
            ('res_pipe', 'mdot_from_kg_per_s'),
            ('heat_exchanger', 'qext_w'),
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
            ow.np_results["res_pipe.p_to_bar"][0:mdata_points]
            - ow.np_results["res_pipe.p_from_bar"][0:mdata_points]
        ) * 100e3 / density[0][0] / GRAVITATIONAL_CONSTANT

        # Compare head losses
        for ii in range(len(results["Pipe1.dH"])):
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


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = ValidateWithPandaPipes()
    a.test_heat_network_head_loss()

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
