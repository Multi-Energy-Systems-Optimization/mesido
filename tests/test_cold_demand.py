from pathlib import Path
from unittest import TestCase

import logging


from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day,
)

import numpy as np

from utils_test_scaling import create_log_list_scaling

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test

logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)


class TestColdDemand(TestCase):

    def test_insufficient_capacity(self):
        """
        This test checks that the error checks in the code for sufficient installed cool/heatig
        capacity of a cold/heat demand is sufficient (grow_workflow not used)

        Checks:
        1. SystemExit is raised
        2. That the error is due to insufficient heat/cold specified capacities

        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        logger, logs_list = create_log_list_scaling("WarmingUP-MPC")

        base_folder = Path(example.__file__).resolve().parent.parent

        with self.assertRaises(SystemExit) as cm:
            _ = run_esdl_mesido_optimization(
                HeatProblem,
                base_folder=base_folder,
                esdl_file_name="LT_wko_error_check.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="timeseries.csv",
            )
        # Is SystemExit is raised
        np.testing.assert_array_equal(cm.exception.code, 1)

        # Check that the heat & cold demand had an error
        np.testing.assert_equal(
            logs_list[0].msg == "HeatingDemand_9b90: The installed capacity of 0.05MW should be"
            " larger than the maximum of the heat demand profile 0.15MW",
            True,
        )
        np.testing.assert_equal(
            logs_list[2].msg == "CoolingDemand_15e8: The installed capacity of 0.05MW should be"
            " larger than the maximum of the heat demand profile 0.15MW",
            True,
        )

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

        Checks for scenario with and without pipe heat losses:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge (note cold line is colder than T_ground)
        4. the cyclic heat_stored contraint, which ensures yearly heat balance between the warm and
        cold well
        5. pipe heat loss and gain
            - pipe heat losses included: expect loss and gain values due to the carrier
            temperatures (warm and cold) in the pipes being higher and lower than the ground
            temperature
            - pipe heat losses excluded: excpect no heat losses or gains
        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        # ------------------------------------------------------------------------------------------
        # Pipe heat losses inlcuded
        class HeatingCoolingProblem(HeatProblem):

            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = False
                return options

            def constraints(self, ensemble_member):
                constraints = super().constraints(ensemble_member)

                # TODO: confirm if volume or heat balance is required over year. This will
                # determine if cyclic contraint below is for stored_heat or stored_volume
                # Add stored_heat cyclic constraint, this will also ensure that the total heat
                # change in the wko is 0 over the timeline
                # Note:
                #   - WKO in cooling mode: Hot well is being charged with heat and the cold well is
                # being discharged
                #   - WKO in heating mode: Cold well is being charged and the hot well is being
                #     discharged.
                for a in self.energy_system_components.get("low_temperature_ates", []):
                    stored_heat = self.state_vector(f"{a}.Stored_heat")
                    constraints.append(((stored_heat[-1] - stored_heat[0]), 0.0, 0.0))
                # This code below might be needed
                # Add stored_heat cyclic constraint, this will also ensure that the volume
                # into the lower temp & out of the higher temp is the same as the volume
                # out of the lower temp & into the higher temp over the timeline.
                # Note:
                #   - Volume increase: Hot well is being charged and the cold well is being
                #     discharged. -> WKO in cooling mode
                #   - Volume decrease: Cold well is being charged and the hot well is being
                #     discharged. -> WKO in heating mode
                # for ates_id in self.energy_system_components.get("low_temperature_ates", []):
                #     stored_volume = self.state_vector(f"{ates_id}.Stored_volume")
                #     volume_usage = 0.0
                #     volume_usage = stored_volume[0] - stored_volume[-1]
                #     constraints.append((volume_usage, 0.0, 0.0))

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

        # Check cyclic constraint
        np.testing.assert_allclose(
            results["ATES_226d.Stored_heat"][0], results["ATES_226d.Stored_heat"][-1]
        )
        # Check heat loss and gain
        tol_value = 1.0e-6
        np.testing.assert_array_less(
            0.0, results["Pipe1.HeatIn.Heat"] - results["Pipe1.HeatOut.Heat"] + tol_value
        )
        np.testing.assert_array_less(
            results["Pipe1_ret.HeatIn.Heat"] - results["Pipe1_ret.HeatOut.Heat"] - tol_value, 0.0
        )

        # ------------------------------------------------------------------------------------------
        # Pipe heat losses excluded
        class HeatingCoolingProblemNoHeatLoss(HeatingCoolingProblem):
            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = True
                return options

        heat_problem = run_esdl_mesido_optimization(
            HeatingCoolingProblemNoHeatLoss,
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

        # Check cyclic constraint
        np.testing.assert_allclose(
            results["ATES_226d.Stored_heat"][0], results["ATES_226d.Stored_heat"][-1]
        )
        # Check heat loss and gain
        tol_value = 1.0e-6
        np.testing.assert_allclose(
            0.0, results["Pipe1.HeatIn.Heat"] - results["Pipe1.HeatOut.Heat"], atol=1e-6
        )
        np.testing.assert_allclose(
            0.0, results["Pipe1_ret.HeatIn.Heat"] - results["Pipe1_ret.HeatOut.Heat"], atol=1e-6
        )
        # ------------------------------------------------------------------------------------------

    def test_heating_cooling_case(self):
        """
        ??? delete or update depending if used
        This test is to check the basic physics for a network which includes cold demand. In this
        case we have a network with an air-water hp, a WKO (warm and cold well) and both hot and
        cold demand.

        TODO: resolve issue in test case

        The demand profiles and the size of the heat pump has been chosen such that the heat is
        required is required to switch on to load the warm well of the WKO.

        Checks for scenario with and without pipe heat losses:
        1. demand is matched
        2. energy conservation in the network
        3. heat to discharge (note cold line is colder than T_ground)
        4. the cyclic heat_stored contraint, which ensures yearly heat balance between the warm and
        cold well
        5. pipe heat loss and gain
            - pipe heat losses included: expect loss and gain values due to the carrier
            temperatures (warm and cold) in the pipes being higher and lower than the ground
            temperature
            - pipe heat losses excluded: excpect no heat losses or gains
        """
        import models.wko.src.example as example
        from models.wko.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        # ------------------------------------------------------------------------------------------
        # Pipe heat losses inlcuded
        class HeatingCoolingProblem(HeatProblem):
            global total_times_steps
            # total_times_steps = 4  # total available timesteps = 8760
            # total_times_steps = 600
            # total_times_steps = 8760

            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)
                self._number_of_years = 30.0

                self.__indx_max_peak = None
                self.__day_steps = 5

            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = True
                return options

            def parameters(self, ensemble_member):
                parameters = super().parameters(ensemble_member)
                parameters["peak_day_index"] = self.__indx_max_peak
                parameters["time_step_days"] = self.__day_steps
                parameters["number_of_years"] = self._number_of_years
                return parameters

            def read(self):
                super().read()

                # Set the peak of the heating demand since the specified proifle is normalized to 1
                for d in self.energy_system_components["heat_demand"]:
                    target = self.get_timeseries(f"{d}.target_heat_demand")
                    for ii in range(len(target.values)):
                        target.values[ii] = target.values[ii] * 7.0e6

                    self.io.set_timeseries(
                        f"{d}.target_heat_demand",
                        self.io._DataStore__timeseries_datetimes,
                        target.values,
                        0,
                    )
         
                for d in self.energy_system_components["cold_demand"]:
                    target = self.get_timeseries(f"{d}.target_cold_demand")
                    for ii in range(len(target.values)):
                        target.values[ii] = target.values[ii] * 0.25

                    self.io.set_timeseries(
                        f"{d}.target_cold_demand",
                        self.io._DataStore__timeseries_datetimes,
                        target.values,
                        0,
                    )

                temp = 1215.3
                (
                    self.__indx_max_peak,
                    self.__heat_demand_nominal,
                    self.__cold_demand_nominal,
                ) = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(
                    self,
                    self.__day_steps,
                )
                temp = 1.2

            # def times(self, variable=None) -> np.ndarray:
            #     return super().times(variable)[0:total_times_steps]

            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = False
                return options

            def post(self):
                super().post()
                self._write_updated_esdl(
                    self._ESDLMixin__energy_system_handler.energy_system,
                    optimizer_sim=False,
                )

            def constraints(self, ensemble_member):
                constraints = super().constraints(ensemble_member)

                # TODO: confirm if volume or heat balance is required over year. This will
                # determine if cyclic contraint below is for stored_heat or stored_volume
                # Add stored_heat cyclic constraint, this will also ensure that the total heat
                # change in the wko is 0 over the timeline
                # Note:
                #   - WKO in cooling mode: Hot well is being charged with heat and the cold well is
                # being discharged
                #   - WKO in heating mode: Cold well is being charged and the hot well is being
                #     discharged.
                # for a in self.energy_system_components.get("low_temperature_ates", []):
                #     stored_heat = self.state_vector(f"{a}.Stored_heat")
                #     constraints.append(((stored_heat[-1] - stored_heat[0]), 0.0, 0.0))
                # This code below might be needed
                # Add stored_heat cyclic constraint, this will also ensure that the volume
                # into the lower temp & out of the higher temp is the same as the volume
                # out of the lower temp & into the higher temp over the timeline.
                # Note:
                #   - Volume increase: Hot well is being charged and the cold well is being
                #     discharged. -> WKO in cooling mode
                #   - Volume decrease: Cold well is being charged and the hot well is being
                #     discharged. -> WKO in heating mode
                for ates_id in self.energy_system_components.get("low_temperature_ates", []):
                    stored_volume = self.state_vector(f"{ates_id}.Stored_volume")
                    volume_usage = 0.0
                    volume_usage = stored_volume[0] - stored_volume[-1]
                    constraints.append((volume_usage, 0.0, 0.0))

                return constraints

        heat_problem = run_esdl_mesido_optimization(
            HeatingCoolingProblem,
            base_folder=base_folder,
            esdl_file_name="Heating and cooling network with return network.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            # input_timeseries_file="timeseries_3.csv",
            input_timeseries_file="timeseries_4.csv",
        )
        results = heat_problem.extract_results()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)




        import matplotlib.pyplot as plt
        # x_values = heat_problem.get_timeseries(f"HeatingDemand_1.target_heat_demand").times
        x_values = np.linspace(
            0,
            len(heat_problem.get_timeseries(f"HeatingDemand_1.target_heat_demand").times),
            len(heat_problem.get_timeseries(f"HeatingDemand_1.target_heat_demand").times),
        )

        legend_used = [
            "ATES",
            # "ATES.Stored_heat_scaled",
            "Heat demand",
            "Heat prodcuer",  #"Heat pump",
            "Cooling demand",
            "Cold producer", #"Airco",
        ]
        # -----------------------------------------------------------------------------------------
        # Peak day
        times_steps = (
            heat_problem.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[1:] -
            heat_problem.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[0:-1]
        )
        index_start_peak_day = np.where(times_steps==3600.0)[0][0]
        index_end_peak_day = np.where(times_steps==3600.0)[0][-1] + 2
        times_peak_day = (
            heat_problem.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[index_start_peak_day: index_end_peak_day] 
            - min(
                heat_problem.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[index_start_peak_day: index_end_peak_day]
            )
        ) / 3600.0

        fig_1 = plt.figure()
        plt.plot(
            times_peak_day[1:],
            results["ATES_1.Heat_flow"][index_start_peak_day + 1: index_end_peak_day] / 1.0e6,
            marker="x",
        )
        plt.plot(
            times_peak_day[1:],
            (
                results["HeatingDemand_1.Heat_flow"][index_start_peak_day + 1: index_end_peak_day]
                + results["HeatingDemand_2.Heat_flow"][index_start_peak_day + 1: index_end_peak_day]
            ) / 1.0e6,
            marker="H",
        )
        plt.plot(
            times_peak_day[1:],
            results["HeatPump_1.Heat_flow"][index_start_peak_day + 1: index_end_peak_day] / 1.0e6,
            marker=">",
        )

        plt.plot(
            times_peak_day[1:],
            results["CoolingDemand_1.Heat_flow"][index_start_peak_day + 1: index_end_peak_day] / 1.0e6,
            marker="*",
        )
        plt.plot(
            times_peak_day[1:],
            results["Airco_1.Heat_flow"][index_start_peak_day + 1: index_end_peak_day] / 1.0e6,
            marker="o",
        )

        plt.legend(legend_used, prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))

        plt.yticks(np.linspace(-6, 14, 11))
        plt.xlabel("Time [hourly]", fontsize=12)
        plt.ylabel("Power [MW]", fontsize=12)
        plt.tight_layout()
        plt.savefig("All_in_one_peak_day")
        plt.close()
        # plt.show()
        temp = 1.0
        # -----------------------------------------------------------------------------------------
        # Seasonal
        times_seasonal = (
            heat_problem.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[1:index_start_peak_day] # index_end_peak_day
        ) / 3600.0 / 24.0
        times_seasonal = np.append(
            times_seasonal, heat_problem.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[index_end_peak_day:] / 3600.0 / 24.0
        )

        fig_2 = plt.figure()

        temp_season = (results["ATES_1.Heat_flow"][1:index_start_peak_day])
        temp_season = np.append(temp_season, results["ATES_1.Heat_flow"][index_end_peak_day:])
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            marker="x",
        )

        temp_season = (
            results["HeatingDemand_1.Heat_flow"][1:index_start_peak_day]
            + results["HeatingDemand_2.Heat_flow"][1:index_start_peak_day]
        )
        temp_season = np.append(
            temp_season,
            results["HeatingDemand_1.Heat_flow"][index_end_peak_day:]
            + results["HeatingDemand_2.Heat_flow"][index_end_peak_day:]
        )
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            marker="H",
        )

        temp_season = (results["HeatPump_1.Heat_flow"][1:index_start_peak_day])
        temp_season = np.append(temp_season, results["HeatPump_1.Heat_flow"][index_end_peak_day:])
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            marker=">",
        )

        temp_season = (results["CoolingDemand_1.Heat_flow"][1:index_start_peak_day])
        temp_season = np.append(
            temp_season, results["CoolingDemand_1.Heat_flow"][index_end_peak_day:]
        )
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            marker="*",
        )

        temp_season = (results["Airco_1.Heat_flow"][1:index_start_peak_day])
        temp_season = np.append(temp_season, results["Airco_1.Heat_flow"][index_end_peak_day:])
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            marker="o",
        )

        plt.legend(legend_used, prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))

        plt.xlabel("Time [daily]", fontsize=12)
        plt.ylabel("Power [MW]", fontsize=12)
        plt.tight_layout()
        plt.savefig("All_in_one_seasonal")
        plt.close()
        # plt.show()
        temp = 1.0
        # ------------------------------------------------------------------------------------------
        # ATES goodies
        # seasonal
        fig_4 = plt.figure()

        temp_season = (results["ATES_1.Stored_volume"][0:index_start_peak_day])
        temp_season = np.append(temp_season, results["ATES_1.Stored_volume"][index_end_peak_day:])
        plt.plot(
            np.append(0, times_seasonal),# this was done so that one can see the start == end value
            temp_season,
            # marker="+",
            color='red',
        )

        max_volume_warm_well = max(temp_season) - min(temp_season)
        cold_well_volume = -temp_season
        cold_well_volume = cold_well_volume + max_volume_warm_well
        plt.plot(
            np.append(0, times_seasonal),# this was done so that one can see the start == end value
            cold_well_volume,
            # marker="x",
            color='cyan',
        )
        
        plt.legend(["Warm well", "Cold well"], prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))
        plt.xlabel("Time [daily]", fontsize=12)
        plt.ylabel("ATES stored volume [m$^3$]", fontsize=12)
        plt.tight_layout()
        # plt.show()
        plt.savefig("ATES_volume_seasonal")
        plt.close()

        # peak day
        cold_well_volume = -results["ATES_1.Stored_volume"][index_start_peak_day: index_end_peak_day]
        cold_well_volume = cold_well_volume + max_volume_warm_well

        fig_warm_cold_well_peak, ax1 = plt.subplots()

        color = 'tab:red'
        ax1.set_xlabel('Time [hourly]', fontsize=12)
        ax1.set_ylabel('Warm well stored volume [m$^3$]', color=color, fontsize=12)
        ax1.plot(
            times_peak_day, results["ATES_1.Stored_volume"][index_start_peak_day: index_end_peak_day],
            color=color,
        )
        ax1.tick_params(axis='y', labelcolor=color)

        ax2 = ax1.twinx()  # instantiate a second Axes that shares the same x-axis

        color = 'tab:cyan'
        ax2.set_ylabel('Cold well stored volume [m$^3$]', color=color,fontsize=12)  # we already handled the x-label with ax1
        ax2.plot(times_peak_day, cold_well_volume, color=color)
        ax2.tick_params(axis='y', labelcolor=color)
        fig_warm_cold_well_peak.tight_layout()  # otherwise the right y-label is slightly clipped
        plt.savefig("ATES_volume_warm_cold_well_peak_day")
        plt.close()
        # ------------------------------------------------------------------------------------------
        # Demands
        # heat dmemand
        # peak day

        fig_tot_heat_demand_peak_day = plt.figure()
        plt.plot(
            times_peak_day[1:],
            (
                results["HeatingDemand_1.Heat_flow"][index_start_peak_day + 1: index_end_peak_day]
                + results["HeatingDemand_2.Heat_flow"][index_start_peak_day + 1: index_end_peak_day]
            ) / 1.0e6,
            marker="H",
            color='red',
        )
        # plt.legend(["Total heat demand"], prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))
        plt.xlabel("Time [hourly]", fontsize=12)
        plt.ylabel("Power [MW]", fontsize=12)
        plt.tight_layout()
        # plt.show()
        plt.savefig("Total_heat_demand_profile_peak_day")
        plt.close()



        # heating demand
        # seaonal
        fig_6 = plt.figure()
        temp_season = (
            results["HeatingDemand_1.Heat_flow"][1:index_start_peak_day]
            + results["HeatingDemand_2.Heat_flow"][1:index_start_peak_day]
        )
        temp_season = np.append(
            temp_season,
            results["HeatingDemand_1.Heat_flow"][index_end_peak_day:]
            + results["HeatingDemand_2.Heat_flow"][index_end_peak_day:]
        )
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            # marker="H",
            color='red',
        )

        # plt.legend(["Total heat demand"], prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))
        plt.xlabel("Time [daily]", fontsize=12)
        plt.ylabel("Power [MW]", fontsize=12)
        plt.tight_layout()
        # plt.show()
        plt.savefig("Total_heat_demand_profile_seasonal")
        plt.close()

        fig_tot_cool_demand = plt.figure()
        temp_season = (results["CoolingDemand_1.Heat_flow"][1:index_start_peak_day])
        temp_season = np.append(
            temp_season, results["CoolingDemand_1.Heat_flow"][index_end_peak_day:]
        )
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            # marker="*",
            color='cyan'
        )

        # plt.legend(["Total heat demand"], prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))
        plt.xlabel("Time [daily]", fontsize=12)
        plt.ylabel("Power [MW]", fontsize=12)
        plt.tight_layout()
        # plt.show()
        plt.savefig("Total_cool_demand_profile_seasonal")
        plt.close()



        temp = 111
        # Check cyclic constraint
        # np.testing.assert_allclose(
        #     results["ATES_226d.Stored_heat"][0], results["ATES_226d.Stored_heat"][-1]
        # )
        # # Check heat loss and gain
        # tol_value = 1.0e-6
        # np.testing.assert_array_less(
        #     0.0, results["Pipe1.HeatIn.Heat"] - results["Pipe1.HeatOut.Heat"] + tol_value
        # )
        # np.testing.assert_array_less(
        #     results["Pipe1_ret.HeatIn.Heat"] - results["Pipe1_ret.HeatOut.Heat"] - tol_value, 0.0
        # )








if __name__ == "__main__":
    test_cold_demand = TestColdDemand()
    # test_cold_demand.test_insufficient_capacity()
    # test_cold_demand.test_cold_demand()
    # test_cold_demand.test_wko()
    # test_cold_demand.test_airco()
    test_cold_demand.test_heating_cooling_case()
