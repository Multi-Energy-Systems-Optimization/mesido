from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.head_loss_class import HeadLossOption
from mesido.physics_mixin import PhysicsMixin

import numpy as np

import pandas as pd

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)


class TargetDemandGoal(Goal):
    priority = 1

    order = 2

    def __init__(self, state, target):
        self.state = state

        self.target_min = target
        self.target_max = target
        self.function_range = (0.0, 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class MinimizeSourcesHeatGoal(Goal):
    order = 1

    def __init__(self, nominal=1e6, priority=2):
        self.function_nominal = nominal
        self.priority = priority

    def function(self, optimization_problem, ensemble_member):
        obj = 0.0
        for source in optimization_problem.energy_system_components.get("heat_source", []):
            obj += optimization_problem.state(f"{source}.Heat_source")

        return obj


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        goals.append(MinimizeSourcesHeatGoal())

        return goals


class HeatProblem(
    _GoalsAndOptions,
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def __init__(self, *args, **kwargs):

        global head_loss_setting, n_linearization_lines_setting
        super().__init__(*args, **kwargs)
        self.heat_network_settings["head_loss_option"] = head_loss_setting
        if head_loss_setting == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY:
            self.heat_network_settings["n_linearization_lines"] = n_linearization_lines_setting
        self.heat_network_settings["minimize_head_losses"] = True

    def pre(self):
        super().pre()
        global ThermalDemand
        # Making modifications to the target
        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")

            # Manually set Demand
            for ii in range(len(target.values)):
                target.values[ii] = ThermalDemand[ii]  # single demand values [W]

            self.io.set_timeseries(
                f"{demand}.target_heat_demand",
                self.io._DataStore__timeseries_datetimes,
                target.values,
                0,
            )

    # Added for case where head loss is modelled via DW
    def heat_network_options(self):
        global head_loss_setting, n_linearization_lines_setting
        options = super().heat_network_options()
        self.heat_network_settings["head_loss_option"] = head_loss_setting
        if head_loss_setting == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY:
            self.heat_network_settings["n_linearization_lines"] = n_linearization_lines_setting
        self.heat_network_settings["minimize_head_losses"] = True

        return options

    @property
    def esdl_assets(self):
        global manual_set_pipe_DN_diam_MILP, manual_set_pipe_length
        assets = super().esdl_assets

        # Example of how you can edit things here
        for a in assets.values():
            # Manually set supply and return Temp
            for c in a.global_properties["carriers"].values():
                c["supplyTemperature"] = 80
                c["returnTemperature"] = 40
            # TODO: This will probabply go wrong with a network with multiple ates's and the
            # hardcoded values should be fixed
            if a.asset_type == "Pipe":
                a.attributes["length"] = manual_set_pipe_length  # [m]
                # Manually set pipe diameter
                import esdl

                a.attributes["diameter"] = esdl.PipeDiameterEnum.DN200
                if manual_set_pipe_DN_diam_MILP == 100:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN100
                elif manual_set_pipe_DN_diam_MILP == 125:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN125
                elif manual_set_pipe_DN_diam_MILP == 150:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN150
                elif manual_set_pipe_DN_diam_MILP == 200:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN200
                elif manual_set_pipe_DN_diam_MILP == 250:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN250
                elif manual_set_pipe_DN_diam_MILP == 300:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN300
                elif manual_set_pipe_DN_diam_MILP == 350:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN350
                elif manual_set_pipe_DN_diam_MILP == 400:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN400
                elif manual_set_pipe_DN_diam_MILP == 450:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN450
                elif manual_set_pipe_DN_diam_MILP == 500:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN500
                elif manual_set_pipe_DN_diam_MILP == 600:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN600
                elif manual_set_pipe_DN_diam_MILP == 650:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN650
                elif manual_set_pipe_DN_diam_MILP == 700:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN700
                elif manual_set_pipe_DN_diam_MILP == 800:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN800
                elif manual_set_pipe_DN_diam_MILP == 900:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN900
                elif manual_set_pipe_DN_diam_MILP == 1000:
                    a.attributes["diameter"] = esdl.PipeDiameterEnum.DN1000
                else:
                    exit("Invalid DN specified")
                # Manually set T ambient
                a.attributes["T_ground"] = 10  # Ambient temperature

        return assets

    def post(self):
        global df_MILP

        super().post()

        results = self.extract_results()
        parameters = self.parameters(0)
        data_milp = {}  # Data storage

        # Pressure drop [Pa]
        data_milp = {"Pipe1_supply_dPress": results["Pipe1.dH"] * parameters["Pipe1.rho"] * 9.81}
        data_milp.update(
            {"Pipe1_return_dPress": results["Pipe1_ret.dH"] * parameters["Pipe1_ret.rho"] * 9.81}
        )

        # Volumetric flow [m3/s]
        data_milp.update({"Pipe1_supply_Q": results["Pipe1.HeatOut.Q"]})
        data_milp.update({"Pipe1_return_Q": results["Pipe1_ret.HeatOut.Q"]})

        # Mass flow [kg/s]
        data_milp.update(
            {
                "Pipe1_supply_mass_flow": results["HeatingDemand_1.Heat_demand"]
                / parameters["HeatingDemand_1.cp"]
                / parameters["HeatingDemand_1.dT"]
            }
        )
        data_milp.update(
            {
                "Pipe1_return_mass_flow": results["HeatingDemand_1.Heat_demand"]
                / parameters["HeatingDemand_1.cp"]
                / parameters["HeatingDemand_1.dT"]
            }
        )

        # Flow velocity [m/s]
        data_milp.update(
            {
                "Pipe1_supply_flow_vel": data_milp["Pipe1_supply_mass_flow"]
                / parameters["Pipe1.rho"]
                / parameters["Pipe1.area"]
            }
        )
        data_milp.update(
            {
                "Pipe1_return_flow_vel": data_milp["Pipe1_return_mass_flow"]
                / parameters["Pipe1_ret.rho"]
                / parameters["Pipe1_ret.area"]
            }
        )

        # Pipe deltaT
        data_milp.update({"Pipe1_supply_dT": parameters["Pipe1.dT"]})
        data_milp.update({"Pipe1_return_dT": parameters["Pipe1_ret.dT"]})

        # Heat source, demand and loss [W]
        data_milp.update({"Heat_source": results["ResidualHeatSource_1.Heat_source"]})
        data_milp.update({"Heat_demand": results["HeatingDemand_1.Heat_demand"]})
        data_milp.update(
            {
                "Heat_loss": results["ResidualHeatSource_1.Heat_source"]
                - results["HeatingDemand_1.Heat_demand"]
            }
        )

        # Hydraulic power via linearized method in MILP [W]
        data_milp.update({"Pipe1_supply_Hydraulic_power": results["Pipe1.Hydraulic_power"]})
        data_milp.update({"Pipe1_return_Hydraulic_power": results["Pipe1_ret.Hydraulic_power"]})

        # Determine index to be used for row data that will be added to the dataframe
        if len(df_MILP) == 0:
            index_df_milp = 0
        else:
            index_df_milp = df_MILP.index[-1] + 1

        try:
            if len(data_milp["Pipe1_supply_dPress"]) > 1:
                df_MILP = pd.concat([df_MILP, pd.DataFrame(data_milp)], ignore_index=True)
        except Exception:  # Case when there is only one row value added
            df_MILP = pd.concat([df_MILP, pd.DataFrame(data_milp)], index=[index_df_milp])

        # Update pipe length value for the last rows added in dataframe
        index_last_row = df_MILP.last_valid_index()
        if index_last_row != index_last_row:
            exit("The last index of the dataframe is invalid")
        try:
            if len(data_milp["Pipe1_supply_dPress"]) > 1:
                m_rows_added = len(data_milp["Pipe1_supply_dPress"])
        except Exception:  # Case when there is only one row value added
            m_rows_added = 1

        df_MILP.loc[(index_last_row + 1 - m_rows_added) : (index_last_row + 1), "pipe_length"] = (
            manual_set_pipe_length
        )
