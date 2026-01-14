import logging
import numpy as np
from pathlib import Path
from unittest import TestCase

from rtctools.optimization.goal_programming_mixin_base import Goal

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
# from mesido.esdl.esdl_mixin import DBAccesType
from mesido.util import run_esdl_mesido_optimization
from mesido.workflows import EndScenarioSizingStaged, run_end_scenario_sizing
from mesido.workflows.grow_workflow import SolverCPLEX
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day,
)

logger = logging.getLogger("mesido")
logger.setLevel(logging.INFO)


class HeatColdDemand(TestCase):

    def heating_cooling_case(self):
        """
        In this case we have a network with an air-water hp, a WKO (warm and cold well) and both
        hot and cold demand. The heat and cold demand was balanced such that the seasonal storage
        gets utilized as intended.
        """
        import os
        import sys

        root_folder = os.path.join(Path(__file__).resolve().parent.parent.parent.parent, "tests")
        sys.path.insert(1, root_folder)

        from models.wko.src.example import HeatProblem
        from utils_tests import demand_matching_test, energy_conservation_test

        base_folder = Path(__file__).resolve().parent.parent

        # ------------------------------------------------------------------------------------------
        class HeatingCoolingProblem(HeatProblem):

            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)
                self._number_of_years = 30.0

                self.__indx_max_peak = None
                self.__day_steps = 5

            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = False
                return options

            def parameters(self, ensemble_member):
                parameters = super().parameters(ensemble_member)
                parameters["peak_day_index"] = self.__indx_max_peak
                parameters["time_step_days"] = self.__day_steps
                parameters["number_of_years"] = self._number_of_years
                return parameters

            def read(self):
                super().read()

                # Set the peak of the heating demand since the specified profile is normalized to 1

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
                # Cold demand specified profile is not normalized
                # Cold demand value is reduced to get the correct balance between the heat and cold
                # demand such that the seasonal storage is utilized
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

                (
                    self.__indx_max_peak,
                    self.__heat_demand_nominal,
                    self.__cold_demand_nominal,
                ) = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(
                    self,
                    self.__day_steps,
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
            input_timeseries_file="timeseries_4.csv",
        )
        results = heat_problem.extract_results()

        # checks to make sure the run was valid
        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        # TODO: check below can be added, once the heat_to_discharge_test have been updated such
        # that a pipe can absorb heat
        # heat_to_discharge_test(heat_problem, results)


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

        from models.wko.src.example import HeatProblem
        from utils_tests import (
            demand_matching_test,
            energy_conservation_test,
            heat_to_discharge_test,
        )

        base_folder = Path(__file__).resolve().parent.parent

        class MinElectcost(Goal):

            priority = 2

            order = 1

            def __init__(self, asset_name: str):
                self.function_nominal = 1.0e6
                self.asset_name = asset_name

            def function(
                self,
                optimization_problem: CollocatedIntegratedOptimizationProblem,
                ensemble_member: int,
            ):

                parameters = optimization_problem.parameters(ensemble_member)
                canonical, sign = optimization_problem.alias_relation.canonical_signed(
                    f"{self.asset_name}.Heat_source"
                )
                heat_source = (
                    optimization_problem.state_vector(canonical, ensemble_member)
                    * optimization_problem.variable_nominal(canonical)
                    * sign
                )

                assert len(optimization_problem.get_electricity_carriers().keys()) <= 1

                price_profile = optimization_problem.get_timeseries(
                    f"{list(optimization_problem.get_electricity_carriers().values())[0]['name']}"
                    ".price_profile"
                )
                timesteps_hr = np.diff(optimization_problem.times()) / 3600

                sum = 0.0
                for i in range(1, len(optimization_problem.times())):
                    sum += (
                        price_profile.values[i]
                        * heat_source[i]
                        * timesteps_hr[i - 1]
                        / parameters[f"{self.asset_name}.cop"]
                    )

                return sum

        class UpdatedProblem(EndScenarioSizingStaged, CollocatedIntegratedOptimizationProblem):

            # TODO: Issue sizing pipes connected to demands, available pipe classes are updated in read(), ESDLAdditionalVarsMixin before the code below. This means the incorrect demand values are then used. 
            def read(self):
                super().read()

                # Set the peak of the heating demand since the specified profile is normalized to 1

                for d in self.energy_system_components["heat_demand"]:
                    target = self.get_timeseries(f"{d}.target_heat_demand")
                    for ii in range(len(target.values)):
                        target.values[ii] = target.values[ii] * 7.0e6 # TODO --> use new profile in esdl, but issue with cold profile. So for now reading in profiles from file. Also currently we cannot use a combination of esdl and csv profile inputs, potentially needed?

                    self.io.set_timeseries(
                        f"{d}.target_heat_demand",
                        self.io._DataStore__timeseries_datetimes,
                        target.values,
                        0,
                    )
                # Cold demand specified profile is not normalized
                # Cold demand value is reduced to get the correct balance between the heat and cold
                # demand such that the seasonal storage is utilized

                for d in self.energy_system_components["cold_demand"]:
                    target = self.get_timeseries(f"{d}.target_cold_demand") # TODO -->> locally do not have access to proifle uploaded in mapediotr
                    for ii in range(len(target.values)):
                        # target.values[ii] = target.values[ii] * 0.25
                        target.values[ii] = target.values[ii] * 0.65
                        if (
                            target.times[ii] < 4.5*30.0*24.0*60.0*60  # 4
                            or target.times[ii] > 7.5*30.0*24.0*60.0*60  # 7
                            ):
                                target.values[ii] *= 0.01

                    max_cold_val = max(target.values)
                    ind_max_cold_val = np.where(target.values == max_cold_val)[0][0]
                    factor_sin_wave = []
                    for ii in range(1, 24):
                        factor_sin_wave.append(np.sin(2.0 * np.pi * float(ii) / 24.0))
                        target.values[ind_max_cold_val + (ii - 12)] += (
                            - 1.0e6 * factor_sin_wave[ii - 1]
                        )

                    self.io.set_timeseries(
                        f"{d}.target_cold_demand",
                        self.io._DataStore__timeseries_datetimes,
                        target.values,
                        0,
                    )

            def goals(self):

                goals = super().goals().copy()

                for ac in self.energy_system_components.get("air_water_heat_pump_elec", []):
                    goals.append(MinElectcost(ac))

                return goals

        kwargs = {
            # "write_result_db_profiles": True,
            # # "write_result_db_profiles": False,
            # "database_connections": [
            #     {
            #         "access_type": DBAccesType.WRITE,  # or DBAccesType.WRITE or DBAccesType.READ_WRITE
            #         "influxdb_host": "localhost",
            #         "influxdb_port": 8086,
            #         "influxdb_username": None,
            #         "influxdb_password": None,
            #         "influxdb_ssl": False,
            #         "influxdb_verify_ssl": False,
            #     },
            # ]
        }

        solution = run_end_scenario_sizing(
            # EndScenarioSizingStaged,
            UpdatedProblem,
            solver_class=SolverCPLEX,
            base_folder=base_folder,
            # esdl_file_name="Heating and cooling network with return network with costs.esdl",
            esdl_file_name=(
                "Heating and cooling and elec network with return network with costs.esdl"
            ),
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            # input_timeseries_file="timeseries_4.csv",
            input_timeseries_file="timeseries_4_elect_cost.csv",
            error_type_check=NetworkErrors.HEAT_AND_COOL_NETWORK_ERRORS,
            **kwargs,
        )

        results = solution.extract_results()

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        total_opex = 0.0
        total_capex = 0.0
        for asset in [
            *solution.energy_system_components.get("airco", []),
            *solution.energy_system_components.get("air_water_heat_pump", []),
            *solution.energy_system_components.get("air_water_heat_pump_elec", []),
            *solution.energy_system_components.get("low_temperature_ates", []),
        ]:
            # investment + installation costs costs
            if asset not in solution.energy_system_components["low_temperature_ates"]:
                investment_cost = solution.esdl_assets[
                    solution.esdl_asset_name_to_id_map[f"{asset}"]
                ].attributes["costInformation"].investmentCosts.value * results[f"{asset}__max_size"] / 1.0e6
                total_capex += investment_cost
                assert (abs(investment_cost - results[f"{asset}__investment_cost"]) < 1.0e-8)
            installation_cost = solution.esdl_assets[
                solution.esdl_asset_name_to_id_map[f"{asset}"]
            ].attributes["costInformation"].installationCosts.value
            total_capex += installation_cost
            assert (installation_cost == results[f"{asset}__installation_cost"])

            # fixed costs per year
            fixed_operational_cost = (
                solution.esdl_assets[
                    solution.esdl_asset_name_to_id_map[f"{asset}"]
                ].attributes["costInformation"].fixedMaintenanceCosts.value
                + solution.esdl_assets[
                    solution.esdl_asset_name_to_id_map[f"{asset}"]
                ].attributes["costInformation"].fixedOperationalCosts.value
            ) * results[f"{asset}__max_size"] / 1.0e6
            total_opex += fixed_operational_cost * solution.parameters(0)[f"{asset}.technical_life"]
            assert (
                abs(fixed_operational_cost - results[f"{asset}__fixed_operational_cost"])
                < 1.0e-8
            )

            # variable operational cost
            timesteps_hr = np.diff(solution.times()) / 3600
            if asset not in solution.energy_system_components["low_temperature_ates"]:
                var_op_costs = solution.esdl_assets[
                    solution.esdl_asset_name_to_id_map[f"{asset}"]
                ].attributes["costInformation"].variableOperationalCosts.value / 1.0e6
                assert (var_op_costs > 0)
            else:
                var_op_costs = 0.0
            factor = 1.0
            if asset in [
                *solution.energy_system_components.get("air_water_heat_pump", []),
                *solution.energy_system_components.get("air_water_heat_pump_elec", []),
            ]:
                factor = solution.esdl_assets[
                    solution.esdl_asset_name_to_id_map[f"{asset}"]
                ].attributes["COP"]
            assert (factor >= 1.0)
            variable_operational_cost = 0.0
            for ii in range(1, len(solution.times())):
                variable_operational_cost += (
                    var_op_costs
                    * results[f"{asset}.Heat_flow"][ii]
                    * timesteps_hr[ii - 1]
                    / factor
                )

            # below not needed due to results[f"{asset}.Pump_power"] = 0.0
            # if asset in solution.energy_system_components.get("low_temperature_ates", []):
            #     pump_power = 0.0
            #     for ii in range(1, len(solution.times())):
            #         # pump power
            #         pump_power += price_profile.values[ii] * results[f"{asset}.Pump_power"][ii] * timesteps_hr[ii - 1] / solution.parameters(0)[f"{asset}.pump_efficiency"]
            #     variable_operational_cost += pump_power

            if asset in solution.energy_system_components.get("air_water_heat_pump_elec", []):
                price_profile = solution.get_timeseries(
                    f"{list(solution.get_electricity_carriers().values())[0]['name']}.price_profile"
                )
                # elec costs: not included in the __variable_operational_cost variable yet
                elect_cost = 0.0
                for ii in range(1, len(solution.times())):
                    elect_cost += (
                        price_profile.values[ii]
                        * results[f"{asset}.Heat_flow"][ii]
                        * timesteps_hr[ii - 1]
                        / solution.parameters(0)[f"{asset}.cop"]
                    )

                pump_power = 0.0
                for ii in range(1, len(solution.times())):
                    # pump power
                    pump_power += (
                        price_profile.values[ii]
                        * results[f"{asset}.Pump_power"][ii]
                        * timesteps_hr[ii - 1]
                        / solution.parameters(0)[f"{asset}.pump_efficiency"]
                    )

                variable_operational_cost += pump_power

            total_opex += (
                variable_operational_cost * solution.parameters(0)[f"{asset}.technical_life"]
            )
            assert (
                abs(variable_operational_cost - results[f"{asset}__variable_operational_cost"])
                < 1.0e-8
            )

        for asset in solution.energy_system_components["heat_pipe"]:
            total_capex += results[f"{asset}__investment_cost"]

        # cold demand
        investment_cost = 0.0
        for asset in solution.energy_system_components.get("cold_demand", []):
            investment_cost += results[f"{asset}__max_size"] * solution.esdl_assets[
                solution.esdl_asset_name_to_id_map[f"{asset}"]
            ].attributes["costInformation"].investmentCosts.value / 1.0e6
        assert (abs(investment_cost - results[f"{asset}__investment_cost"]) < 1.0e-8)
        installation_cost = 0.0
        for asset in solution.energy_system_components.get("cold_demand", []):
            installation_cost += solution.esdl_assets[
                solution.esdl_asset_name_to_id_map[f"{asset}"]
            ].attributes["costInformation"].installationCosts.value
        assert (abs(installation_cost - results[f"{asset}__installation_cost"]) < 1.0e-8)
        total_capex += investment_cost + installation_cost

        assert (
            abs(
                solution.objective_value
                + (
                    results[f"CoolingDemand_1__installation_cost"]
                    + results[f"CoolingDemand_1__investment_cost"]
                )
                / 1.0e6 - (total_capex + total_opex + elect_cost) / 1.0e6
            ) < 1.0e-6
        )

        temp = 1.0

        import matplotlib.pyplot as plt
        legend_used = [
            "ATES",
            "Heat demand",
            "Heat pump",
            "Cooling demand",
            "Cold producer",
        ]
        # -----------------------------------------------------------------------------------------
        # Peak day
        times_steps = (
            solution.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[1:]
            - solution.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[0:-1]
        )
        index_start_peak_day = [None] * 2
        index_end_peak_day = [None] * 2
        index_start_peak_day[0] = np.where(times_steps == 3600.0)[0][0]
        index_end_peak_day[1] = np.where(times_steps == 3600.0)[0][-1] + 2
        index_start_peak_day[1] = index_end_peak_day[1] - 24
        index_end_peak_day[0] = index_start_peak_day[0] + 24

        for ip in range(len(index_start_peak_day)):
            times_peak_day = (
                solution.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[index_start_peak_day[ip]: index_end_peak_day[ip]]
                - min(
                    solution.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[index_start_peak_day[ip]: index_end_peak_day[ip]]
                )
            ) / 3600.0

            fig_1 = plt.figure()
            plt.plot(
                times_peak_day[1:],
                results["ATES_1.Heat_flow"][index_start_peak_day[ip] + 1: index_end_peak_day[ip]] / 1.0e6,
                # marker="x",
            )
            plt.plot(
                times_peak_day[1:],
                (
                    results["HeatingDemand_1.Heat_flow"][index_start_peak_day[ip] + 1: index_end_peak_day[ip]]
                    + results["HeatingDemand_2.Heat_flow"][index_start_peak_day[ip] + 1: index_end_peak_day[ip]]
                ) / 1.0e6,
                # marker="H",
                linestyle='dotted',
            )
            plt.plot(
                times_peak_day[1:],
                results["HeatPump_1.Heat_flow"][index_start_peak_day[ip] + 1: index_end_peak_day[ip]] / 1.0e6,
                # marker=">",
            )

            plt.plot(
                times_peak_day[1:],
                results["CoolingDemand_1.Heat_flow"][index_start_peak_day[ip] + 1: index_end_peak_day[ip]] / 1.0e6,
                # marker="*",
                linestyle='dotted',
            )
            plt.plot(
                times_peak_day[1:],
                results["Airco_1.Heat_flow"][index_start_peak_day[ip] + 1: index_end_peak_day[ip]] / 1.0e6,
                # marker="o",
            )

            plt.legend(legend_used, prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))

            plt.yticks(np.linspace(-6, 14, 11))
            plt.xlabel("Time [hourly]", fontsize=12)
            plt.ylabel("Power [MW]", fontsize=12)
            plt.tight_layout()
            plt.savefig(f"All_in_one_peak_day_ip{ip}")
            plt.show()
            plt.close()
            # temp = 1.0
            # # -----------------------------------------------------------------------------------------
        # Seasonal
        times_seasonal = (
            solution.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[1:index_start_peak_day[0]] # index_end_peak_day
        ) / 3600.0 / 24.0
        times_seasonal = np.append(
            times_seasonal, solution.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[index_end_peak_day[0]:index_start_peak_day[1]] / 3600.0 / 24.0
        )
        times_seasonal = np.append(
            times_seasonal, solution.get_timeseries(f"HeatingDemand_1.target_heat_demand").times[index_end_peak_day[1]:] / 3600.0 / 24.0
        )

        fig_2 = plt.figure()

        temp_season = (results["ATES_1.Heat_flow"][1:index_start_peak_day[0]])
        temp_season = np.append(
            temp_season, results["ATES_1.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]]
        )
        temp_season = np.append(temp_season, results["ATES_1.Heat_flow"][index_end_peak_day[1]:])
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            # marker="x",
        )

        temp_season = (
            results["HeatingDemand_1.Heat_flow"][1:index_start_peak_day[0]]
            + results["HeatingDemand_2.Heat_flow"][1:index_start_peak_day[0]]
        )
        temp_season = np.append(
            temp_season,
            results["HeatingDemand_1.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]]
            + results["HeatingDemand_2.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]]
        )
        temp_season = np.append(
            temp_season,
            results["HeatingDemand_1.Heat_flow"][index_end_peak_day[1]:]
            + results["HeatingDemand_2.Heat_flow"][index_end_peak_day[1]:]
        )
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            # marker="H",
            linestyle='dotted',
        )

        temp_season = (results["HeatPump_1.Heat_flow"][1:index_start_peak_day[0]])
        temp_season = np.append(
            temp_season,
            results["HeatPump_1.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]],
        )
        temp_season = np.append(
            temp_season,
            results["HeatPump_1.Heat_flow"][index_end_peak_day[1]:],
        )
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            # marker=">",
        )

        temp_season = (results["CoolingDemand_1.Heat_flow"][1:index_start_peak_day[0]])
        temp_season = np.append(
            temp_season,
            results["CoolingDemand_1.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]],
        )
        temp_season = np.append(
            temp_season,
            results["CoolingDemand_1.Heat_flow"][index_end_peak_day[1]:],
        )
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            # marker="*",
            linestyle='dotted',
        )

        temp_season = (results["Airco_1.Heat_flow"][1:index_start_peak_day[0]])
        temp_season = np.append(
            temp_season,
            results["Airco_1.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]]
        )
        temp_season = np.append(
            temp_season,
            results["Airco_1.Heat_flow"][index_end_peak_day[1]:]
        )
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            # marker="o",
        )

        plt.legend(legend_used, prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))

        plt.xlabel("Time [daily]", fontsize=12)
        plt.ylabel("Power [MW]", fontsize=12)
        plt.tight_layout()
        plt.savefig("All_in_one_seasonal")
        plt.show()
        # plt.close()
        # temp = 1.0
        # ------------------------------------------------------------------------------------------
        # ATES goodies
        # seasonal
        fig_4 = plt.figure()

        temp_season = (results["ATES_1.Stored_volume"][0:index_start_peak_day[0]])
        temp_season = np.append(
            temp_season,
            results["ATES_1.Stored_volume"][index_end_peak_day[0]:index_start_peak_day[1]],
        )
        temp_season = np.append(
            temp_season,
            results["ATES_1.Stored_volume"][index_end_peak_day[1]:],
        )
        plt.plot(
            np.append(0, times_seasonal),  # this was done so that one can see the start == end value
            temp_season,
            # marker="+",
            color='red',
        )

        max_volume_warm_well = max(temp_season) - min(temp_season)
        cold_well_volume = -temp_season
        cold_well_volume = cold_well_volume + max_volume_warm_well
        plt.plot(
            np.append(0, times_seasonal), # this was done so that one can see the start == end value
            cold_well_volume,
            # marker="x",
            color='cyan',
        )

        plt.legend(
            ["Warm well", "Cold well"],
            prop={'size': 10},
            loc='center left',
            bbox_to_anchor=(1, 0.5),
        )
        plt.xlabel("Time [daily]", fontsize=12)
        plt.ylabel("ATES stored volume [m$^3$]", fontsize=12)
        plt.tight_layout()
        plt.savefig("ATES_volume_seasonal")
        plt.show()
        plt.close()

        # peak day
        for ip in range(len(index_start_peak_day)):
            cold_well_volume = (
                -results["ATES_1.Stored_volume"][index_start_peak_day[ip]: index_end_peak_day[ip]]
            )
            cold_well_volume = cold_well_volume + max_volume_warm_well

            fig_warm_cold_well_peak, ax1 = plt.subplots()

            color = 'tab:red'
            ax1.set_xlabel('Time [hourly]', fontsize=12)
            ax1.set_ylabel('Warm well stored volume [m$^3$]', color=color, fontsize=12)
            ax1.plot(
                times_peak_day,
                results["ATES_1.Stored_volume"][index_start_peak_day[ip]: index_end_peak_day[ip]],
                color=color,
            )
            ax1.tick_params(axis='y', labelcolor=color)

            ax2 = ax1.twinx()  # instantiate a second Axes that shares the same x-axis

            color = 'tab:cyan'
            ax2.set_ylabel('Cold well stored volume [m$^3$]', color=color, fontsize=12)  # we already handled the x-label with ax1
            ax2.plot(times_peak_day, cold_well_volume, color=color)
            ax2.tick_params(axis='y', labelcolor=color)
            fig_warm_cold_well_peak.tight_layout()  # otherwise the right y-label is slightly clipped
            plt.savefig(f"ATES_volume_warm_cold_well_peak_day_ip{ip}")
            plt.show()
            plt.close()

        # ------------------------------------------------------------------------------------------
        # The plots below have not been updated yet
        # ------------------------------------------------------------------------------------------

        # Demands
        # heat dmemand
        # peak day

        fig_tot_heat_demand_peak_day = plt.figure()
        plt.plot(
            times_peak_day[1:],
            (
                results["HeatingDemand_1.Heat_flow"][index_start_peak_day[0] + 1: index_end_peak_day[0]]
                + results["HeatingDemand_2.Heat_flow"][index_start_peak_day[0] + 1: index_end_peak_day[0]]
            ) / 1.0e6,
            # marker="H",
            color='red',
            linestyle='dotted',
        )
        # plt.legend(["Total heat demand"], prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))
        plt.xlabel("Time [hourly]", fontsize=12)
        plt.ylabel("Power [MW]", fontsize=12)
        plt.tight_layout()
        plt.savefig(f"Total_heat_demand_profile_peak_day_ip{0}")
        plt.show()
        plt.close()

        # Demands
        # cold dmemand
        # peak day

        fig_tot_cold_demand_peak_day = plt.figure()
        plt.plot(
            times_peak_day[1:],
            (
                results["CoolingDemand_1.Heat_flow"][index_start_peak_day[1] + 1: index_end_peak_day[1]]
            ) / 1.0e6,
            # marker="H",
            color='cyan',
            linestyle='dotted',
        )
        # plt.legend(["Total heat demand"], prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))
        plt.xlabel("Time [hourly]", fontsize=12)
        plt.ylabel("Power [MW]", fontsize=12)
        plt.tight_layout()
        plt.savefig(f"Total_cold_demand_profile_peak_day_ip{1}")
        plt.show()
        plt.close()

        # heating demand
        # seaonal
        fig_6 = plt.figure()
        temp_season = (
            results["HeatingDemand_1.Heat_flow"][1:index_start_peak_day[0]]
            + results["HeatingDemand_2.Heat_flow"][1:index_start_peak_day[0]]
        )
        temp_season = np.append(
            temp_season,
            results["HeatingDemand_1.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]]
            + results["HeatingDemand_2.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]]
        )
        temp_season = np.append(
            temp_season,
            results["HeatingDemand_1.Heat_flow"][index_end_peak_day[1]:]
            + results["HeatingDemand_2.Heat_flow"][index_end_peak_day[1]:]
        )
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            # marker="H",
            color='red',
            linestyle='dotted',
        )

        # plt.legend(["Total heat demand"], prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))
        plt.xlabel("Time [daily]", fontsize=12)
        plt.ylabel("Power [MW]", fontsize=12)
        plt.tight_layout()
        plt.savefig("Total_heat_demand_profile_seasonal")
        plt.show()
        plt.close()

        fig_tot_cool_demand = plt.figure()
        temp_season = (results["CoolingDemand_1.Heat_flow"][1:index_start_peak_day[0]])
        temp_season = np.append(
            temp_season, results["CoolingDemand_1.Heat_flow"][index_end_peak_day[0]:index_start_peak_day[1]]
        )
        temp_season = np.append(
            temp_season, results["CoolingDemand_1.Heat_flow"][index_end_peak_day[1]:]
        )
        plt.plot(
            times_seasonal,
            temp_season / 1.0e6,
            # marker="*",
            color='cyan',
            linestyle='dotted',
        )

        # plt.legend(["Total heat demand"], prop={'size': 10}, loc='center left', bbox_to_anchor=(1, 0.5))
        plt.xlabel("Time [daily]", fontsize=12)
        plt.ylabel("Power [MW]", fontsize=12)
        plt.tight_layout()
        plt.savefig("Total_cool_demand_profile_seasonal")
        plt.show()
        plt.close()


        # temp = 111
        # # Check cyclic constraint
        # # np.testing.assert_allclose(
        # #     results["ATES_226d.Stored_heat"][0], results["ATES_226d.Stored_heat"][-1]
        # # )
        # # # Check heat loss and gain
        # # tol_value = 1.0e-6
        # # np.testing.assert_array_less(
        # #     0.0, results["Pipe1.HeatIn.Heat"] - results["Pipe1.HeatOut.Heat"] + tol_value
        # # )
        # # np.testing.assert_array_less(
        # #     results["Pipe1_ret.HeatIn.Heat"] - results["Pipe1_ret.HeatOut.Heat"] - tol_value, 0.0
        # # )


if __name__ == "__main__":
    # test_cold_demand = HeatColdDemand()
    # test_cold_demand.heating_cooling_case()

    t2 = HeatCoolingGrowWorkflow()
    t2.heating_cooling_case()
