import logging
from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing

import numpy as np

logger = logging.getLogger("mesido")
logger.setLevel(logging.INFO)


class HeatCoolingGrowWorkflow(TestCase):

    def heating_cooling_case(self):
        """
        In this case we have a network with an air-water hp, a WKO (warm and cold well) and both
        hot and cold demand. The heat and cold demand was balanced such that the seasonal storage
        gets utilized as intended while minizing the TCO.
        """
        import os
        import sys

        from mesido.workflows.utils.error_types import NetworkErrors

        root_folder = os.path.join(Path(__file__).resolve().parent.parent.parent.parent, "tests")
        sys.path.insert(1, root_folder)

        from utils_tests import (
            cost_calculation_test,
            demand_matching_test,
            energy_conservation_test,
            heat_to_discharge_test,
        )

        base_folder = Path(__file__).resolve().parent.parent

        solution = run_end_scenario_sizing(
            EndScenarioSizingStaged,
            base_folder=base_folder,
            esdl_file_name=(
                "Heating and cooling and elec network with return network with costs.esdl"
            ),
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_4_elect_cost_modified.csv",
            error_type_check=NetworkErrors.HEAT_AND_COOL_NETWORK_ERRORS,
        )
        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        name_to_id_map = solution.esdl_asset_name_to_id_map

        a_1_id = name_to_id_map["ATES_1"]
        hp_1_id = name_to_id_map["HeatPump_1"]
        ac_1_id = name_to_id_map["Airco_1"]
        cd_1_id = name_to_id_map["CoolingDemand_1"]

        pipe_names = [
            "Pipe2",
            "Pipe4",
            "Pipe6",
            "Pipe7",
            "Pipe9",
            "Pipe2_ret",
            "Pipe4_ret",
            "Pipe6_ret",
            "Pipe7_ret",
            "Pipe9_ret",
        ]

        # Check if assets are used
        np.testing.assert_array_less(
            1e3,
            results[f"{a_1_id}.Heat_flow_charging"] + results[f"{a_1_id}.Heat_flow_discharging"],
        )
        np.testing.assert_array_less(1e2, results[f"{hp_1_id}.Heat_flow"])
        np.testing.assert_array_less(1e6, np.sum(results[f"{ac_1_id}.Heat_flow"]))

        # Check the problem cost calculation and objective
        np.testing.assert_array_less(1e3, results[f"{a_1_id}__installation_cost"])
        np.testing.assert_array_less(1e3, results[f"{a_1_id}__fixed_operational_cost"])
        np.testing.assert_array_less(1e3, results[f"{hp_1_id}__investment_cost"])
        np.testing.assert_array_less(1e3, results[f"{hp_1_id}__installation_cost"])
        np.testing.assert_array_less(1e3, results[f"{hp_1_id}__variable_operational_cost"])
        np.testing.assert_array_less(1e3, results[f"{hp_1_id}__fixed_operational_cost"])
        np.testing.assert_array_less(1e3, results[f"{ac_1_id}__investment_cost"])
        np.testing.assert_array_less(1e3, results[f"{ac_1_id}__installation_cost"])
        np.testing.assert_array_less(1e3, results[f"{ac_1_id}__variable_operational_cost"])
        np.testing.assert_array_less(1e3, results[f"{ac_1_id}__fixed_operational_cost"])
        np.testing.assert_array_less(1e3, results[f"{cd_1_id}__investment_cost"])
        np.testing.assert_array_less(1e3, results[f"{cd_1_id}__installation_cost"])
        for pipe_name in pipe_names:
            pipe_id = name_to_id_map[pipe_name]
            np.testing.assert_array_less(1e3, results[f"{pipe_id}__investment_cost"])
        cost_calculation_test(solution, results, check_objective_function=True)

        # # --------------------------------------------------------------------------------------
        # # Do not delete the code below. It is used for creating plots (also used for conference
        # # presentations)
        #
        # create_plots = False
        #
        # hd_1_id = name_to_id_map["HeatingDemand_1"]
        # hd_2_id = name_to_id_map["HeatingDemand_2"]
        # cd_1_id = name_to_id_map["CoolingDemand_1"]
        #
        # if create_plots:
        #
        #     import matplotlib.pyplot as plt
        #
        #     legend_used = [
        #         "ATES",
        #         "Heat demand",
        #         "Heat pump",
        #         "Cooling demand",
        #         "Cold producer",
        #     ]
        #     # ------------------------------------------------------------------------------------
        #     # Peak day
        #     times_steps = (
        #         solution.get_timeseries(f"{hd_1_id}.target_heat_demand").times[1:]
        #         - solution.get_timeseries(f"{hd_1_id}.target_heat_demand").times[0:-1]
        #     )
        #     index_start_peak_day = [None] * 2
        #     index_end_peak_day = [None] * 2
        #     index_start_peak_day[0] = np.where(times_steps == 3600.0)[0][0]
        #     index_end_peak_day[1] = np.where(times_steps == 3600.0)[0][-1] + 2
        #     index_start_peak_day[1] = index_end_peak_day[1] - 24
        #     index_end_peak_day[0] = index_start_peak_day[0] + 24
        #
        #     for ip in range(len(index_start_peak_day)):
        #         times_peak_day = (
        #             solution.get_timeseries(f"{hd_1_id}.target_heat_demand").times[
        #                 index_start_peak_day[ip] : index_end_peak_day[ip]
        #             ]
        #             - min(
        #                 solution.get_timeseries(f"{hd_1_id}.target_heat_demand").times[
        #                     index_start_peak_day[ip] : index_end_peak_day[ip]
        #                 ]
        #             )
        #         ) / 3600.0
        #
        #         fig_1 = plt.figure()
        #         plt.plot(
        #             times_peak_day[1:],
        #             results[f"{a_1_id}.Heat_flow"][
        #                 index_start_peak_day[ip] + 1 : index_end_peak_day[ip]
        #             ]
        #             / 1.0e6,
        #             # marker="x",
        #         )
        #         plt.plot(
        #             times_peak_day[1:],
        #             (
        #                 results[f"{hd_1_id}.Heat_flow"][
        #                     index_start_peak_day[ip] + 1 : index_end_peak_day[ip]
        #                 ]
        #                 + results[f"{hd_2_id}.Heat_flow"][
        #                     index_start_peak_day[ip] + 1 : index_end_peak_day[ip]
        #                 ]
        #             )
        #             / 1.0e6,
        #             # marker="H",
        #             linestyle="dotted",
        #         )
        #         plt.plot(
        #             times_peak_day[1:],
        #             results[f"{hp_1_id}.Heat_flow"][
        #                 index_start_peak_day[ip] + 1 : index_end_peak_day[ip]
        #             ]
        #             / 1.0e6,
        #             # marker=">",
        #         )
        #
        #         plt.plot(
        #             times_peak_day[1:],
        #             results[f"{cd_1_id}.Heat_flow"][
        #                 index_start_peak_day[ip] + 1 : index_end_peak_day[ip]
        #             ]
        #             / 1.0e6,
        #             # marker="*",
        #             linestyle="dotted",
        #         )
        #         plt.plot(
        #             times_peak_day[1:],
        #             results[f"{ac_1_id}.Heat_flow"][
        #                 index_start_peak_day[ip] + 1 : index_end_peak_day[ip]
        #             ]
        #             / 1.0e6,
        #             # marker="o",
        #         )
        #
        #         plt.legend(
        #             legend_used, prop={"size": 10}, loc="center left", bbox_to_anchor=(1, 0.5)
        #         )
        #
        #         plt.yticks(np.linspace(-6, 14, 11))
        #         plt.xlabel("Time [hourly]", fontsize=12)
        #         plt.ylabel("Power [MW]", fontsize=12)
        #         plt.tight_layout()
        #         plt.savefig(f"All_in_one_peak_day_ip{ip}")
        #         plt.show()
        #         plt.close()
        #     # ----------------------------------------------------------------------------------
        #     # Seasonal
        #     times_seasonal = (
        #         (
        #             solution.get_timeseries(f"{hd_1_id}.target_heat_demand").times[
        #                 1 : index_start_peak_day[0]
        #             ]  # index_end_peak_day
        #         )
        #         / 3600.0
        #         / 24.0
        #     )
        #     times_seasonal = np.append(
        #         times_seasonal,
        #         solution.get_timeseries(f"{hd_1_id}.target_heat_demand").times[
        #             index_end_peak_day[0] : index_start_peak_day[1]
        #         ]
        #         / 3600.0
        #         / 24.0,
        #     )
        #     times_seasonal = np.append(
        #         times_seasonal,
        #         solution.get_timeseries(f"{hd_1_id}.target_heat_demand").times[
        #             index_end_peak_day[1] :
        #         ]
        #         / 3600.0
        #         / 24.0,
        #     )
        #
        #     fig_2 = plt.figure()
        #
        #     temp_season = results[f"{a_1_id}.Heat_flow"][1 : index_start_peak_day[0]]
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{a_1_id}.Heat_flow"][index_end_peak_day[0] : index_start_peak_day[1]],
        #     )
        #     temp_season = np.append(
        #         temp_season, results[f"{a_1_id}.Heat_flow"][index_end_peak_day[1] :]
        #     )
        #     plt.plot(
        #         times_seasonal,
        #         temp_season / 1.0e6,
        #         # marker="x",
        #     )
        #
        #     temp_season = (
        #         results[f"{hd_1_id}.Heat_flow"][1 : index_start_peak_day[0]]
        #         + results[f"{hd_2_id}.Heat_flow"][1 : index_start_peak_day[0]]
        #     )
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{hd_1_id}.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]]
        #         +results[f"{hd_2_id}.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]],
        #     )
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{hd_1_id}.Heat_flow"][index_end_peak_day[1] :]
        #         + results[f"{hd_2_id}.Heat_flow"][index_end_peak_day[1] :],
        #     )
        #     plt.plot(
        #         times_seasonal,
        #         temp_season / 1.0e6,
        #         # marker="H",
        #         linestyle="dotted",
        #     )
        #
        #     temp_season = results[f"{hp_1_id}.Heat_flow"][1 : index_start_peak_day[0]]
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{hp_1_id}.Heat_flow"][index_end_peak_day[0] : index_start_peak_day[1]],
        #     )
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{hp_1_id}.Heat_flow"][index_end_peak_day[1] :],
        #     )
        #     plt.plot(
        #         times_seasonal,
        #         temp_season / 1.0e6,
        #         # marker=">",
        #     )
        #
        #     temp_season = results[f"{cd_1_id}.Heat_flow"][1 : index_start_peak_day[0]]
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{cd_1_id}.Heat_flow"][index_end_peak_day[0] : index_start_peak_day[1]],
        #     )
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{cd_1_id}.Heat_flow"][index_end_peak_day[1] :],
        #     )
        #     plt.plot(
        #         times_seasonal,
        #         temp_season / 1.0e6,
        #         # marker="*",
        #         linestyle="dotted",
        #     )
        #
        #     temp_season = results[f"{ac_1_id}.Heat_flow"][1 : index_start_peak_day[0]]
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{ac_1_id}.Heat_flow"][index_end_peak_day[0] : index_start_peak_day[1]],
        #     )
        #     temp_season = np.append(
        #         temp_season, results[f"{ac_1_id}.Heat_flow"][index_end_peak_day[1] :]
        #     )
        #     plt.plot(
        #         times_seasonal,
        #         temp_season / 1.0e6,
        #         # marker="o",
        #     )
        #
        #     plt.legend(legend_used, prop={"size": 10}, loc="center left", bbox_to_anchor=(1, 0.5))
        #
        #     plt.xlabel("Time [daily]", fontsize=12)
        #     plt.ylabel("Power [MW]", fontsize=12)
        #     plt.tight_layout()
        #     plt.savefig("All_in_one_seasonal")
        #     plt.show()
        #     plt.close()
        #
        #     # ------------------------------------------------------------------------------------
        #     # ATES goodies
        #     # seasonal
        #     fig_4 = plt.figure()
        #
        #     temp_season = results[f"{a_1_id}.Stored_volume"][0 : index_start_peak_day[0]]
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{a_1_id}.Stored_volume"][index_end_peak_day[0]:index_start_peak_day[1]],
        #     )
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{a_1_id}.Stored_volume"][index_end_peak_day[1] :],
        #     )
        #     plt.plot(
        #         # this was done so that one can see the start == end value
        #         np.append(0, times_seasonal),
        #         temp_season,
        #         # marker="+",
        #         color="red",
        #     )
        #
        #     max_volume_warm_well = max(temp_season) - min(temp_season)
        #     cold_well_volume = -temp_season
        #     cold_well_volume = cold_well_volume + max_volume_warm_well
        #     plt.plot(
        #         # this was done so that one can see the start == end value
        #         np.append(0, times_seasonal),
        #         cold_well_volume,
        #         # marker="x",
        #         color="cyan",
        #     )
        #
        #     plt.legend(
        #         ["Warm well", "Cold well"],
        #         prop={"size": 10},
        #         loc="center left",
        #         bbox_to_anchor=(1, 0.5),
        #     )
        #     plt.xlabel("Time [daily]", fontsize=12)
        #     plt.ylabel("ATES stored volume [m$^3$]", fontsize=12)
        #     plt.tight_layout()
        #     plt.savefig("ATES_volume_seasonal")
        #     plt.show()
        #     plt.close()
        #
        #     # peak day
        #     for ip in range(len(index_start_peak_day)):
        #         cold_well_volume = -results[f"{a_1_id}.Stored_volume"][
        #             index_start_peak_day[ip] : index_end_peak_day[ip]
        #         ]
        #         cold_well_volume = cold_well_volume + max_volume_warm_well
        #
        #         fig_warm_cold_well_peak, ax1 = plt.subplots()
        #
        #         color = "tab:red"
        #         ax1.set_xlabel("Time [hourly]", fontsize=12)
        #         ax1.set_ylabel("Warm well stored volume [m$^3$]", color=color, fontsize=12)
        #         ax1.plot(
        #             times_peak_day,
        #             results[f"{a_1_id}.Stored_volume"][
        #                 index_start_peak_day[ip] : index_end_peak_day[ip]
        #             ],
        #             color=color,
        #         )
        #         ax1.tick_params(axis="y", labelcolor=color)
        #
        #         ax2 = ax1.twinx()  # instantiate a second Axes that shares the same x-axis
        #
        #         color = "tab:cyan"
        #         # we already handled the x-label with ax1
        #         ax2.set_ylabel("Cold well stored volume [m$^3$]", color=color, fontsize=12)
        #         ax2.plot(times_peak_day, cold_well_volume, color=color)
        #         ax2.tick_params(axis="y", labelcolor=color)
        #         # Line below needed otherwise the right y-label is slightly clipped
        #         fig_warm_cold_well_peak.tight_layout()
        #         plt.savefig(f"ATES_volume_warm_cold_well_peak_day_ip{ip}")
        #         plt.show()
        #         plt.close()
        #     # ------------------------------------------------------------------------------------
        #     # Demands
        #     # heat dmemand
        #     # peak day
        #
        #     fig_tot_heat_demand_peak_day = plt.figure()
        #     plt.plot(
        #         times_peak_day[1:],
        #         (
        #             results[f"{hd_1_id}.Heat_flow"][
        #                 index_start_peak_day[0] + 1 : index_end_peak_day[0]
        #             ]
        #             + results[f"{hd_2_id}.Heat_flow"][
        #                 index_start_peak_day[0] + 1 : index_end_peak_day[0]
        #             ]
        #         )
        #         / 1.0e6,
        #         # marker="H",
        #         color="red",
        #         linestyle="dotted",
        #     )
        #     plt.xlabel("Time [hourly]", fontsize=12)
        #     plt.ylabel("Power [MW]", fontsize=12)
        #     plt.tight_layout()
        #     plt.savefig(f"Total_heat_demand_profile_peak_day_ip{0}")
        #     plt.show()
        #     plt.close()
        #
        #     # Demands
        #     # cold dmemand
        #     # peak day
        #
        #     fig_tot_cold_demand_peak_day = plt.figure()
        #     plt.plot(
        #         times_peak_day[1:],
        #         (
        #             results[f"{cd_1_id}.Heat_flow"][
        #                 index_start_peak_day[1] + 1 : index_end_peak_day[1]
        #             ]
        #         )
        #         / 1.0e6,
        #         # marker="H",
        #         color="cyan",
        #         linestyle="dotted",
        #     )
        #     plt.xlabel("Time [hourly]", fontsize=12)
        #     plt.ylabel("Power [MW]", fontsize=12)
        #     plt.tight_layout()
        #     plt.savefig(f"Total_cold_demand_profile_peak_day_ip{1}")
        #     plt.show()
        #     plt.close()
        #
        #     # heating demand
        #     # seasonal
        #     fig_6 = plt.figure()
        #     temp_season = (
        #         results[f"{hd_1_id}.Heat_flow"][1 : index_start_peak_day[0]]
        #         + results[f"{hd_2_id}.Heat_flow"][1 : index_start_peak_day[0]]
        #     )
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{hd_1_id}.Heat_flow"][index_end_peak_day[0] : index_start_peak_day[1]]
        #         + results[f"{hd_2_id}.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]],
        #     )
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{hd_1_id}.Heat_flow"][index_end_peak_day[1] :]
        #         + results[f"{hd_2_id}.Heat_flow"][index_end_peak_day[1] :],
        #     )
        #     plt.plot(
        #         times_seasonal,
        #         temp_season / 1.0e6,
        #         # marker="H",
        #         color="red",
        #         linestyle="dotted",
        #     )
        #     plt.xlabel("Time [daily]", fontsize=12)
        #     plt.ylabel("Power [MW]", fontsize=12)
        #     plt.tight_layout()
        #     plt.savefig("Total_heat_demand_profile_seasonal")
        #     plt.show()
        #     plt.close()
        #
        #     fig_tot_cool_demand = plt.figure()
        #     temp_season = results[f"{cd_1_id}.Heat_flow"][1 : index_start_peak_day[0]]
        #     temp_season = np.append(
        #         temp_season,
        #         results[f"{cd_1_id}.Heat_flow"][index_end_peak_day[0] : index_start_peak_day[1]],
        #     )
        #     temp_season = np.append(
        #         temp_season, results[f"{cd_1_id}.Heat_flow"][index_end_peak_day[1] :]
        #     )
        #     plt.plot(
        #         times_seasonal,
        #         temp_season / 1.0e6,
        #         # marker="*",
        #         color="cyan",
        #         linestyle="dotted",
        #     )
        #     plt.xlabel("Time [daily]", fontsize=12)
        #     plt.ylabel("Power [MW]", fontsize=12)
        #     plt.tight_layout()
        #     plt.savefig("Total_cool_demand_profile_seasonal")
        #     plt.show()
        #     plt.close()


if __name__ == "__main__":

    t2 = HeatCoolingGrowWorkflow()
    t2.heating_cooling_case()
