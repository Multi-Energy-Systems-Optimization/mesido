from pandapipeesdlparser import PandapipeEsdlParserClass
import pandapipes as pp  # could not get installed via pip, Pandas requires version '1.3.6' ... bottleneck-> pip install --upgrade bottleneck
import pandapipes.plotting as plot
import numpy as np
import time
import matplotlib as mpl
import pandas as pd
import os
import pandapower.control as control
from pandapipes.timeseries import run_timeseries
from pandapower.timeseries import DFData
from pandapower.timeseries import OutputWriter
# import matlab.engine

# --------------------------------------------------------------------------------------------------
# Hard-coded values to be aware of
"""
- Ground temperature: T_ground_deg = 10.0, this value has been hardcoded in createpandapipenet() to
 match the value in CHESS
- Pipe roughness: k_mm=0.2, hard-coded in createpandapipenet() to match the value in MESIDO
- Conduction coefficient of pipe material: alpha_w_per_m2k=0.5 ? not sure about this value in MESIDO, hard coded in CHESS and panda_pipes
- m_dot results from CHESS used as input for pandapipes runs
- Also check "Test case names and description.xlsx" for info about test case names and descriptions
- Results:
    - summer demand profile results: summer profile * 10.0
    - winter demand profile results: winter profile * 1.0
    - constant demand profile results: 10MW demand 
"""
# --------------------------------------------------------------------------------------------------
# Run CHESS, else only panda_pipes will be run
execute_simulation = {
    'CHESS': False,
}
# --------------------------------------------------------------------------------------------------
# Load ESDL
print('Load ESDL...')
# network_type = 'Tree'
# network_type = 'Ring'
# number_of_consumers = 1  # Value must be 1 or 2
# number_of_suppliers = 1  # Value must be 1 or 2

# for network_type in ['Tree', 'Ring']: 
for network_type in ['Tree']:  # code used to manually check specific cases
    for number_of_consumers in range(1, 1 + 1):
        for number_of_suppliers in range(1, 1 + 1):
    # for number_of_consumers in range(2, 2+1):  # code used to manually check specific cases
    #     for number_of_suppliers in range(1, 1+1):  # code used to manually check specific cases
            print(f'\nRunning network: {network_type}_S{number_of_suppliers}C{number_of_consumers}\n')
            if (
                (number_of_consumers not in [1, 2]) or
                (number_of_suppliers not in [1, 2]) or
                (network_type not in ['Ring', 'Tree'])
            ):
                exit('Check input network type settings')
            from pathlib import Path
            root = Path(__file__).parent.resolve()
            esdl_file = os.path.join(
                root,
                "..\\model",
                f"Test_{network_type}_S{number_of_suppliers}C{number_of_consumers}.esdl")
            # esdl_file = (
            #     '../model/' +
            #     f'Test_{network_type}_S{number_of_suppliers}C{number_of_consumers}.esdl'
            # )
            # cfg_file = (
            #     'C:/Projects_gitlab/PandaPipes/repo_Ryvo/pandapipe-testing/testmodel/General/' +
            #     f'Test_{network_type}_S{number_of_suppliers}C{number_of_consumers}.cfg'
            # )  # Only used in  CHESS

            esdlparser = PandapipeEsdlParserClass()
            esdlparser.loadESDLFile(esdl_file)
            esdlparser.add_additional_joint()

            # Set scenario
            print('Set scenario...')
            Nsupply = len(esdlparser.esdl_asset['heat']['producer'])
            Ndemand = len(esdlparser.esdl_asset['heat']['consumer'])

            # --------------------------------------------------------------------------------------------------
            # Create panda_pipes network
            print('Create pandapipe network...')
            T_ground_deg = 10.0
            net, net_asset, Tsup, Tret = esdlparser.createpandapipenet()

            # --------------------------------------------------------------------------------------------------
            # Set demand
            print('Set demand ...')

            # Setup profile data
            # demand_multiplier = 10.0 # this will result in velocities in order of v = 0.1m/s
            # raw_profile_demand_load_W = pd.read_csv(os.path.join('testmodel/General', 'Summer day demand profile.csv'))
            # demand_profile_type = 'Summer'

            demand_multiplier = 1.0 # this will result in velocities in order of v = 3m/s

            # raw_profile_demand_load_W = pd.read_csv(os.path.join(root, "..\\model", 'Winter day demand profile.csv'))
            # demand_profile_type = 'Winter'

            raw_profile_demand_load_W = pd.read_csv(os.path.join(root, "..\\input", "timeseries_constant.csv"))
            demand_profile_type = 'Constant_1'

            profile_demand_load_W = pd.DataFrame(columns=['0']) 
            # profile_demand_load_W['0'] = raw_profile_demand_load_W['Demand [W]']  # demand_1
            profile_demand_load_W['0'] = raw_profile_demand_load_W["demand_1"]  # demand_1

            profile_demand_load_W.iloc[:] *= demand_multiplier

            # Manual values/modifications - for testing purposes
            # profile_demand_load_W.iloc[:] = 10E6
            # profile_demand_load_W.iloc[:] = 2600*10
            # demand_profile_type = 'Constant'

            #-------------------------------------------------------------------------------------
            # Constant_1 runs
            # Demand chosen such that the min speed if in the order of 0.1m/s
            # profile_demand_load_W.iloc[:] = 2 * 570 * 10**3 
            # demand_profile_type = 'Constant_1'

            # Add 10 days to the timeline to check CHESS
            # for ii in range(0, 10):
            #     profile_demand_load_W = profile_demand_load_W.append(profile_demand_load_W.iloc[0:24])
            # demand_profile_type = 'Constant_1R1'

            # Change T supply of pandpapipes by -6 degrees in the 6th time step, to compare pp and Wanda 
            # demand_profile_type = 'Constant_1R2'
            #-------------------------------------------------------------------------------------

            # profile_demand_load_W.iloc[:] = 30 * 570 * 10**3 
            # demand_profile_type = 'Constant_2'

            demand_power = profile_demand_load_W[f'0'].to_numpy() / Ndemand
            # --------------------------------------------------------------------------------------------------
            # Setup supply mass flow for panda_pipes 
            dT = Tsup - Tret
            Tav_K = (Tsup + Tret) / 2.0 + 273.15
            Cp_J_kgK = pp.get_fluid(net).get_heat_capacity(Tav_K)
            # CP value in MESIDO = 4200J/kgK

            # Enforce mass flow rate instead of cacluting it from Q = m_dot...
            # 297.83213455 149.02261074  74.61784883  12.11784883
            demand_flow = np.array([297.83] * len(demand_power))  # [kg/s] 
            # demand_flow = np.array([149.02261074] * len(demand_power))  # [kg/s]
            # demand_flow = np.array([74.61784883] * len(demand_power))  # [kg/s]
            # demand_flow = np.array([12.11784883] * len(demand_power))  # [kg/s]
            # demand_flow = (demand_power) / (Cp_J_kgK * dT)
            supply_flow = demand_flow * Ndemand / Nsupply 

            # --------------------------------------------------------------------------------------------------
            # Overwrite supply/demand mass flow for panda_pipes by using CHESS results 
            # Use existing CHESS results to specificy mass flow rate instead
            # This code/implementation below is very bad, to fixed later

            # I need to check this between pandapipes and MESIDO
            # ipipe = 1
            # supply_flow = results_all_CHESS[f'Pipe{ipipe}']['Flow'].to_numpy()
            # demand_flow = supply_flow * Nsupply / Ndemand 

            # --------------------------------------------------------------------------------------------------
            # Plot setting
            plot_network = 0
            plot_powerflow = 0
            plot_massflow = 0
            plot_velocity = 0
            plot_pressure = 0
            plot_pressure_drop = 0
            plot_temperature = 0
            # --------------------------------------------------------------------------------------------------
            # Assign profiles to assets
            net.flow_control.control_active[0] = False  # 1st supplier
            net.flow_control.control_active[0 + Nsupply] = False  # 1st demand

            supply_pump_mass_flow_kg_per_s = []
            supply_pump_T_K = []
            supply_control_mass_flow_kg_per_s = []
            demand_heat_load_W = []
            for isupply in range(0, Nsupply):
                supply_flow_kg_s = pd.DataFrame(supply_flow, columns=[f'{isupply}'])
                ds_supply_pump_flow_kg_s = DFData(supply_flow_kg_s)
                supply_pump_mass_flow_kg_per_s.append(
                    control.ConstControl(
                        net,
                        element='circ_pump_mass',
                        variable='mdot_flow_kg_per_s',
                        element_index=net.circ_pump_mass.index.values[isupply],
                        data_source=ds_supply_pump_flow_kg_s,
                        profile_name=net.circ_pump_mass.index.values[isupply].astype(str)
                    )
                )
                supply_temp_K = pd.DataFrame([Tsup + 273.15]*len(profile_demand_load_W), columns=[f'{isupply}'])
                supply_temp_K.iloc[5:] = supply_temp_K.iloc[0] - 6.0

                ds_supply_pump_T_K = DFData(supply_temp_K)
                supply_pump_T_K.append(
                    control.ConstControl(
                        net,
                        element='circ_pump_mass',
                        variable='t_flow_k',
                        element_index=net.circ_pump_mass.index.values[isupply],
                        data_source=ds_supply_pump_T_K,
                        profile_name=net.circ_pump_mass.index.values[isupply].astype(str)
                    )
                )
                supply_flow_kgs_s = pd.DataFrame(supply_flow, columns=[f'{isupply}'])
                ds_supply_control_flow_kgs_s = DFData(supply_flow_kgs_s)
                supply_control_mass_flow_kg_per_s.append(
                    control.ConstControl(
                        net, element='flow_control',
                        variable='controlled_mdot_kg_per_s',
                        element_index=net.flow_control.index.values[isupply],
                        data_source=ds_supply_control_flow_kgs_s,
                        profile_name=net.flow_control.index.values[isupply].astype(str)
                    )
                )


            for idemand in range(0, Ndemand):
                demand_power_W = pd.DataFrame(demand_power, columns=[f'{idemand}'])
                ds_demand_power_W = DFData(demand_power_W)
                demand_heat_load_W.append(
                    control.ConstControl(
                        net,
                        element='heat_exchanger',
                        variable='qext_w',
                        element_index=net.heat_exchanger.index.values[idemand],
                        data_source=ds_demand_power_W,
                        profile_name=net.heat_exchanger.index.values[idemand].astype(str)
                    )
                )

                demand_flow_kgs_s = pd.DataFrame(demand_flow, columns=[f'{idemand + Nsupply}'])
                ds_demand_control_flow_kgs_s = DFData(demand_flow_kgs_s)
                demand_control_mass_flow_kg_per_s = control.ConstControl(
                        net, element='flow_control',
                        variable='controlled_mdot_kg_per_s',
                        element_index=net.flow_control.index.values[idemand + Nsupply],
                        data_source=ds_demand_control_flow_kgs_s,
                        profile_name=net.flow_control.index.values[idemand + Nsupply].astype(str)
                    )


            if profile_demand_load_W.shape[0] != supply_flow_kg_s.shape[0]:
                exit("profiles do not match")

            # --------------------------------------------------------------------------------------------------
            # Run panpa_pipes simulation
            print('running scenario...')

            t = time.time()
            time_steps = range(profile_demand_load_W.shape[0])
            log_variables = [
                ('res_junction', 'p_bar'),
                ('res_pipe', 'v_mean_m_per_s'),
                ('res_pipe', 'reynolds'),
                ('res_pipe', 'lambda'),
                ('res_pipe', 'vdot_norm_m3_per_s'),
                ('res_pipe', 't_from_k'),
                ('res_pipe', 't_to_k'),
                ('res_pipe', 'p_from_bar'),
                ('res_pipe', 'p_to_bar'),
                ('res_pipe', 't_from_k'),
                ('res_pipe', 't_to_k'),
                ('res_pipe', 'mdot_from_kg_per_s'),
                ('res_pipe', 'mdot_to_kg_per_s'),
                ('heat_exchanger', 'qext_w'),
                ('circ_pump_mass', 'mdot_flow_kg_per_s'),
                ('circ_pump_mass', 't_flow_k')
            ]
            ow = OutputWriter(net, time_steps, output_path=None, log_variables=log_variables)

            # run_timeseries(net, time_steps, mode='hydraulics')
            try:
                run_timeseries(net, time_steps, mode='all', friction_model='colebrook')
                # run_timeseries(net, time_steps, mode='hydraulics', friction_model='colebrook')
            except:
                print(
                    '\n*************** panpdapipes run failed: ' +
                    f'{network_type}_S{number_of_suppliers}C{number_of_consumers} ***************\n'
                )
                continue
            # run_timeseries(net, time_steps, mode='all')

            print(net.res_pipe.p_from_bar.values - net.res_pipe.p_to_bar.values)
            loop_elapsed = time.time() - t
            print('simulation done' + ':' + str(loop_elapsed))

            # --------------------------------------------------------------------------------------------------
            # Post processing panda_pipes results

            net = esdlparser.correcting_pressure_return(net)

            ow.np_results["heat_exchanger.qext_w"]

            results_file_columns = [
                "Time_step_index",
                "Flow_kg_s",
                "VolumeFlow_m3_timestep",
                "Speed_m_s",
                "Tin_deg",
                "Tout_deg",
                "Temperature_deg",
                "ThermalLosses_W",
                "AmbientTemperature_deg",
                "dP_Pa",
                "Pin_Pa",
                "Pout_Pa",
                "Pressure_Pa",
                "dP_Pa_m",
            ]

            results_post_proc_all_pp = {}
            for ipipe in range(0, len(net.pipe)):
                results_post_proc_pipe = pd.DataFrame(columns=results_file_columns)
                results_post_proc_pipe["Time_step_index"] = time_steps
                results_post_proc_pipe["Flow_kg_s"] = (
                    ow.np_results["res_pipe.mdot_from_kg_per_s"][:,ipipe] -
                    ow.np_results["res_pipe.mdot_to_kg_per_s"][:,ipipe]
                )/2.0
                results_post_proc_pipe["VolumeFlow_m3_timestep"] = ow.np_results["res_pipe.vdot_norm_m3_per_s"][:,ipipe] * 3600
                results_post_proc_pipe["Speed_m_s"] = ow.np_results["res_pipe.v_mean_m_per_s"][:,ipipe]
                results_post_proc_pipe["Tin_deg"] = ow.np_results["res_pipe.t_from_k"][:,ipipe] - 273.15
                results_post_proc_pipe["Tout_deg"] = ow.np_results["res_pipe.t_to_k"][:,ipipe] - 273.15
                results_post_proc_pipe["Temperature_deg"] = (results_post_proc_pipe["Tin_deg"] +
                                                        results_post_proc_pipe["Tout_deg"]) / 2.0

                Cp_av_J_kgK = pp.get_fluid(net).get_heat_capacity(
                    (results_post_proc_pipe["Tin_deg"] + results_post_proc_pipe["Tout_deg"]) / 2.0 + 273.15
                )
                results_post_proc_pipe["ThermalLosses_W"] = (
                    results_post_proc_pipe["Flow_kg_s"] * Cp_av_J_kgK *
                    (results_post_proc_pipe["Tin_deg"] - results_post_proc_pipe["Tout_deg"])
                )

                results_post_proc_pipe["AmbientTemperature_deg"] = T_ground_deg
                results_post_proc_pipe["dP_Pa"] = (ow.np_results["res_pipe.p_from_bar"][:,ipipe] -
                                                ow.np_results["res_pipe.p_to_bar"][:,ipipe]) * 100e3
                results_post_proc_pipe["Pin_Pa"] = ow.np_results["res_pipe.p_from_bar"][:,ipipe] * 100e3
                results_post_proc_pipe["Pout_Pa"] = ow.np_results["res_pipe.p_to_bar"][:,ipipe] * 100e3
                results_post_proc_pipe["Pressure_Pa"] = (results_post_proc_pipe["Pin_Pa"] +
                                                        results_post_proc_pipe["Pout_Pa"]) / 2.0
                results_post_proc_pipe["dP_Pa_m"] = (
                    (results_post_proc_pipe["Pin_Pa"] - results_post_proc_pipe["Pout_Pa"]) /
                    (net.pipe['length_km'][ipipe] * 1e3)
                )

                results_post_proc_all_pp[f"{net.pipe['name'][ipipe]}"] = results_post_proc_pipe
                pp_result_file_dir = (
                    f"testmodel/General/Results/panda_pipes/{demand_profile_type}/" + 
                    f"Test_{network_type}_S{number_of_suppliers}C{number_of_consumers}/"
                )
                pp_result_file_name = f"pp_{net.pipe['name'][ipipe]}.csv"
                os.makedirs(pp_result_file_dir, exist_ok=True)
                results_post_proc_all_pp[f"{net.pipe['name'][ipipe]}"].to_csv(
                    pp_result_file_dir+pp_result_file_name, index=False
                )   
            # --------------------------------------------------------------------------------------------------
            # print to screen
            # print(net.res_junction)
            # print(net.res_pipe)
            # print(net.res_heat_exchanger)
            # print(net.res_circ_pump_mass)

            # print(net.junction)
            # print(net.pipe)
            # print(net.heat_exchanger)
            # print(net.circ_pump_mass)
            # print(net.flow_control)

            # --------------------------------------------------------------------------------------------------
            # Plotting pandapipes data 
            cmap = mpl.colormaps['viridis']

            if plot_network:
                plot.simple_plot(net,
                                junction_size=0.1,
                                heat_exchanger_size = 0.2,
                                heat_exchanger_color='blue',
                                flow_control_size=0,
                                pump_size=0.2,
                                pump_color='green'
                                )

            if plot_powerflow:
                # power
                zdata = abs(net.res_pipe.mdot_from_kg_per_s.values) * Cp * dT * 1e-6
                pipe_collection  = plot.create_pipe_collection(
                    net, pipes=None, linewidths=2, z=zdata, cmap=cmap,cbar_title='power[MW]'
                )
                plot.draw_collections([pipe_collection])

            if plot_massflow:
                # flowrate
                zdata = abs(net.res_pipe.mdot_from_kg_per_s.values)
                pipe_collection  = plot.create_pipe_collection(net, pipes=None, linewidths=2, z=zdata, cmap=cmap,cbar_title='mass flow rate [kg/s]')
                plot.draw_collections([pipe_collection])

            if plot_powerflow:
                # velocity
                zdata = abs(net.res_pipe.v_mean_m_per_s.values)
                pipe_collection  = plot.create_pipe_collection(net, pipes=None, linewidths=2, z=zdata, cmap=cmap,cbar_title='velocity [m/s]')
                plot.draw_collections([pipe_collection])

            if plot_temperature:
                # average temperature
                zdata = (net.res_pipe.t_from_k.values+net.res_pipe.t_to_k.values)/2 - 273.15
                pipe_collection  = plot.create_pipe_collection(net, pipes=None, linewidths=2, z=zdata, cmap=cmap,cbar_title='average temperature [C]')
                plot.draw_collections([pipe_collection])

                # temperature losses
                zdata = (net.res_pipe.t_from_k.values-net.res_pipe.t_to_k.values)
                pipe_collection  = plot.create_pipe_collection(net, pipes=None, linewidths=2, z=zdata, cmap=cmap,cbar_title='temperature losses [C]')
                plot.draw_collections([pipe_collection])

            if plot_pressure:
                # average pressure
                zdata = (net.res_pipe.p_from_bar.values+net.res_pipe.p_to_bar.values)/2
                pipe_collection  = plot.create_pipe_collection(net, pipes=None, linewidths=2, z=zdata, cmap=cmap,cbar_title='average pressure [bar]')
                plot.draw_collections([pipe_collection])

            if  plot_pressure_drop:
                    # pressure loss
                    zdata = abs(net.res_pipe.p_from_bar.values-net.res_pipe.p_to_bar.values)
                    pipe_collection  = plot.create_pipe_collection(net, pipes=None, linewidths=2, z=zdata, cmap=cmap,cbar_title='pressure loss [bar]')
                    plot.draw_collections([pipe_collection])

                    # pressure loss
                    zdata = abs(net.res_pipe.p_from_bar.values-net.res_pipe.p_to_bar.values)*1e5 / (net.pipe.length_km.values*1e3)
                    pipe_collection  = plot.create_pipe_collection(net, pipes=None, linewidths=2, z=zdata, cmap=cmap,cbar_title='pressure loss [Pa/m]')
                    plot.draw_collections([pipe_collection])


            net.res_pipe.mdot_from_kg_per_s

            if execute_simulation['CHESS']:
            # --------------------------------------------------------------------------------------------------
            # Compare pandapipes and CHESS
            # pp % diff relative to CHESS
                comparison_columns = [
                    'Time_step_index',
                    'Pipe',
                    'CHESS_Speed_m_s',
                    'Flow_perc',
                    'Temperature_perc',
                    'dP_perc',
                    'ThermalLosses_perc',
                    'Cumulative_ThermalLosses_perc',
                ]
                results_CHESS_vs_pp = pd.DataFrame(columns=comparison_columns)

                for ipipe in range(1, int(len(net.pipe)/2+1)):
                    pipe_set = [f'Pipe{ipipe}', f'Pipe{ipipe}_ret']

                    for pipe in pipe_set:
                        results_CHESS_vs_pp['Time_step_index'] = results_post_proc_all_pp[pipe]['Time_step_index']

                        results_CHESS_vs_pp['Pipe'] = [pipe]*(len(results_all_CHESS[pipe]['Flow']))
                        results_CHESS_vs_pp['CHESS_Speed_m_s'] = results_all_CHESS[pipe]['Speed']

                        results_CHESS_vs_pp['Flow_perc'] = (
                            (results_all_CHESS[pipe]['Flow'] - results_post_proc_all_pp[pipe]['Flow_kg_s']) /
                            results_all_CHESS[pipe]['Flow'] * 100.0
                        )
                        results_CHESS_vs_pp['Temperature_perc'] = (
                            (results_all_CHESS[pipe]['Temperature'] -
                            results_post_proc_all_pp[pipe]['Temperature_deg']) /
                            results_all_CHESS[pipe]['Temperature'] * 100.0
                        )
                        results_CHESS_vs_pp['dP_perc'] = (
                            (results_all_CHESS[pipe]['Pout'] - results_all_CHESS[pipe]['Pin'] -
                            (
                                results_post_proc_all_pp[pipe]['Pout_Pa'] -
                                results_post_proc_all_pp[pipe]['Pin_Pa']
                            )
                            ) /
                            (results_all_CHESS[pipe]['Pout'] - results_all_CHESS[pipe]['Pin']) * 100.0
                        )
                        results_CHESS_vs_pp['ThermalLosses_perc'] = (
                            (
                                results_all_CHESS[pipe]['ThermalLosses'] -
                                results_post_proc_all_pp[pipe]['ThermalLosses_W']
                            ) / results_all_CHESS[pipe]['ThermalLosses'] * 100.0
                        )

                        for ii in range(0, len(results_CHESS_vs_pp['Cumulative_ThermalLosses_perc'])):
                            results_CHESS_vs_pp['Cumulative_ThermalLosses_perc'][ii] = (
                                (
                                    sum(results_all_CHESS[pipe]['ThermalLosses'][0:ii+1]) -
                                    sum(results_post_proc_all_pp[pipe]['ThermalLosses_W'][0:ii+1])
                                ) / sum(results_all_CHESS[pipe]['ThermalLosses'][0:ii+1]) * 100.0
                            )

                        comparison_result_file_dir = (
                            f'testmodel/General/Results/CHESS_vs_pp/{demand_profile_type}/'
                        )
                        comparison_result_file_name = (
                            'CHESS_vs_pp' +
                            f'_Test_{network_type}_S{number_of_suppliers}C{number_of_consumers}_{pipe}.csv'
                        )
                        os.makedirs(comparison_result_file_dir, exist_ok=True)
                        results_CHESS_vs_pp.to_csv(
                            comparison_result_file_dir+comparison_result_file_name, index=False
                        )
            # --------------------------------------------------------------------------------------------------

