from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import GoalProgrammingMixin
from rtctools.optimization.goal_programming_mixin_base import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.util import run_optimization_problem


class RevenueGoal(Goal):
    priority = 1

    order = 1

    def __init__(self, state, price_profile, nominal):
        self.state = state

        self.price_profile = price_profile
        self.function_nominal = nominal

    def function(self, optimization_problem, ensemble_member):
        canonical, sign = optimization_problem.alias_relation.canonical_signed(self.state)
        symbols = (
            sign
            * optimization_problem.state_vector(canonical, ensemble_member)
            * optimization_problem.variable_nominal(self.state)
        )
        price_profile = optimization_problem.get_timeseries(self.price_profile).values
        sum = 0.0
        for i in range(len(price_profile)):
            sum += symbols[i] * price_profile[i]

        for asset in [
            *optimization_problem.energy_system_components.get("gas_demand", []),
            *optimization_problem.energy_system_components.get("gas_source", []),
            *optimization_problem.energy_system_components.get("electrolyzer", []),
            *optimization_problem.energy_system_components.get("gas_tank_storage", []),
            *optimization_problem.energy_system_components.get("wind_park", []),
            *optimization_problem.energy_system_components.get("electricity_demand", []),
            *optimization_problem.energy_system_components.get("electricity_source", []),
        ]:
            sum -= optimization_problem.extra_variable(
                f"{asset}__variable_operational_cost", ensemble_member
            )
            sum -= optimization_problem.extra_variable(
                f"{asset}__fixed_operational_cost", ensemble_member
            )

        return -sum


# DO NOT DELETE, this goal is only there to debug physics of electrolyzer and to be able to run
# without financial computations.
class MaxH2Goal(Goal):
    priority = 1

    order = 1

    def function(self, optimization_problem, ensemble_member):
        sum = 0.0

        for asset in [
            *optimization_problem.energy_system_components.get("electrolyzer", []),
        ]:
            sum = optimization_problem.state(f"{asset}.Gas_mass_flow_out")

        return -sum


class _GoalsAndOptions:
    def goals(self):
        goals = super().goals().copy()

        # TODO: these goals should incorperate the timestep
        for demand in self.energy_system_components.get("electricity_demand", []):
            carrier_name = (
                self.esdl_assets[self.esdl_asset_name_to_id_map[demand]].in_ports[0].carrier.name
            )
            price_profile = f"{carrier_name}.price_profile"
            # price_profile = f"{demand}.electricity_price"
            state = f"{demand}.Electricity_demand"
            nominal = self.variable_nominal(state) * np.median(
                self.get_timeseries(price_profile).values
            )

            goals.append(RevenueGoal(state, price_profile, nominal))

        for demand in self.energy_system_components.get("gas_demand", []):
            # Code below: When profile is assigned to carrier instead of using .csv file
            carrier_name = (
                self.esdl_assets[self.esdl_asset_name_to_id_map[demand]].in_ports[0].carrier.name
            )
            price_profile = f"{carrier_name}.price_profile"
            # price_profile = f"{demand}.gas_price"
            state = f"{demand}.Gas_demand_mass_flow"
            nominal = self.variable_nominal(state) * np.median(
                self.get_timeseries(price_profile).values
            )

            goals.append(RevenueGoal(state, price_profile, nominal))

        return goals

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        for gs in self.energy_system_components.get("gas_tank_storage", []):
            canonical, sign = self.alias_relation.canonical_signed(f"{gs}.Stored_gas_mass")
            storage_t0 = sign * self.state_vector(canonical, ensemble_member)[0]
            constraints.append((storage_t0, 0.0, 0.0))
            canonical, sign = self.alias_relation.canonical_signed(f"{gs}.Gas_tank_flow")
            gas_flow_t0 = sign * self.state_vector(canonical, ensemble_member)[0]
            constraints.append((gas_flow_t0, 0.0, 0.0))

        return constraints


class MILPProblem(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        # goals.append(MaxH2Goal())

        return goals

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"

        return options

    def energy_system_options(self):
        options = super().energy_system_options()
        options["include_asset_is_switched_on"] = True
        options["include_electric_cable_power_loss"] = False

        return options

    # def times(self, variable=None) -> np.ndarray:
    #     return super().times(variable)[:5]


if __name__ == "__main__":
    elect = run_optimization_problem(
        MILPProblem,
        esdl_file_name="h2.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries.csv",
    )
    r = elect.extract_results()

    print(r["Electrolyzer_fc66.ElectricityIn.Power"])
    print(r["Electrolyzer_fc66.Gas_mass_flow_out"])

    # ----------------------------------------------------------------------------------------------
    # Do not delete the temp code below for now: main purpose was to create comparison plots
    # Create some plots

    # import matplotlib.pyplot as plt

    # f1 = plt.figure()
    # ax1 = f1.add_subplot(111)
    # ax1.plot(elect.get_timeseries(price_profile).times, r["GasStorage_e492.Stored_gas_mass"])
    # plt.xlabel('Time steps [s]')
    # plt.ylabel('Gas storage [kg]')
    # plt.show()

    # f2 = plt.figure()
    # ax2 = f2.add_subplot(111)
    # ax2.plot(elect.get_timeseries(price_profile).times, gas_rate)
    # plt.xlabel('Time steps [s]')
    # plt.ylabel('Gas price [euro/kg]')
    # plt.show()

    # f3 = plt.figure()
    # ax3 = f3.add_subplot(111)
    # ax3.plot(elect.get_timeseries(price_profile).times, r["Electrolyzer_fc66.Gas_mass_flow_out"])
    # plt.xlabel('Time steps [s]')
    # plt.ylabel('Electrolyzer gas mass flow out [kg/hr]')
    # plt.show()

    # f4 = plt.figure()
    # ax4 = f4.add_subplot(111)
    # ax4.plot(
    #     elect.get_timeseries(price_profile).times, r["Electrolyzer_fc66.Power_consumed"]
    # )
    # plt.xlabel('Time steps [s]')
    # plt.ylabel('Electrolyzer power usage [W]')
    # plt.show()

    # f5 = plt.figure()
    # ax5 = f5.add_subplot(111)
    # ax5.plot(
    #     elect.get_timeseries(price_profile).times, r["Pipe_6ba6.GasOut.mass_flow"] / 3600.0
    # )
    # plt.xlabel('Time steps [s]')
    # plt.ylabel('Gass sold [kg/s]')
    # plt.show()

    # The code below was used for storing data of multiple runs (different settings like with
    # without mass storage)

    # import pandas as pd

    # storage = "storage_included"
    # data_name = "Pipe_6ba6.GasOut.mass_flow"
    # test = {data_name: r[data_name] / 3600.0}
    # df_data = pd.DataFrame(test)
    # df_data.to_pickle(
    #     "C:\\Projects_gitlab\\NWN_dev\\rtc-tools-milp-network\\tests\\models\\"
    #     f"unit_cases_electricity\\electrolyzer\\df_data{storage}.pkl"
    # )
    # df_read_1 = pd.read_pickle(
    #     "C:\\Projects_gitlab\\NWN_dev\\rtc-tools-milp-network\\tests\\models\\"
    #     f"unit_cases_electricity\\electrolyzer\\df_data{storage}.pkl"
    # )

    # storage = "storage_excluded"
    # data_name = "Pipe_6ba6.GasOut.mass_flow"
    # test = {data_name: r[data_name] / 3600.0}
    # df_data = pd.DataFrame(test)
    # df_data.to_pickle(
    #     "C:\\Projects_gitlab\\NWN_dev\\rtc-tools-milp-network\\tests\\models\\"
    #     f"unit_cases_electricity\\electrolyzer\\df_data{storage}.pkl"
    # )
    # df_read_2 = pd.read_pickle(
    #     "C:\\Projects_gitlab\\NWN_dev\\rtc-tools-milp-network\\tests\\models\\"
    #     f"unit_cases_electricity\\electrolyzer\\df_data{storage}.pkl"
    # )

    # plt.xlabel('Number of time steps')
    # plt.ylabel('Gass sold [kg/s]')
    # plt.show()
    # temp = 0.0
    # ----------------------------------------------------------------------------------------------
