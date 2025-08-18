import os
import sys
from pathlib import Path

from esdl import AssetStateEnum
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
# from mesido.head_loss_class import HeadLossOption
# from mesido.network_common import NetworkSettings
from mesido.pipe_class import CableClass
from mesido.workflows.gas_elect_workflow import GasElectProblem
from mesido.workflows.utils.helpers import run_optimization_problem_solver

import matplotlib.pyplot as plt
import numpy as np


root_folder = os.path.join(str(Path(__file__).resolve().parent.parent.parent.parent), "tests")
sys.path.insert(1, root_folder)

# from utils_tests import (
#     demand_matching_test,
#     electric_power_conservation_test,
#     energy_conservation_test,
#     heat_to_discharge_test,
#     gas_pipes_head_loss_test,
# )

if __name__ == "__main__":
    import time

    start_time = time.time()

    class GasElectProblemModified(GasElectProblem):
        def __init__(self, *args, **kwargs):
            super().__init__(*args, **kwargs)

        def energy_system_options(self):
            options = super().energy_system_options()

            # # Setting when started with head loss inclusions
            # self.gas_network_settings["minimize_head_losses"] = False
            # self.gas_network_settings["head_loss_option"] = (
            #     HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
            # )

            return options

        def electricity_cable_classes(self, p):

            if (
                self.esdl_assets[self.esdl_asset_name_to_id_map[p]].attributes["state"]
                == AssetStateEnum.ENABLED
            ):
                cable_list = [
                    CableClass(
                        name="CableType1",
                        maximum_current=11000.0,
                        resistance=3.0,
                        investment_costs=60000.0,
                    ),
                ]

            elif (
                self.esdl_assets[self.esdl_asset_name_to_id_map[p]].attributes["state"]
                == AssetStateEnum.DISABLED
            ):
                cable_list = [
                    CableClass(
                        name="None", maximum_current=0.0, resistance=0.0, investment_costs=0.0
                    ),
                ]

            elif (
                self.esdl_assets[self.esdl_asset_name_to_id_map[p]].attributes["state"]
                == AssetStateEnum.OPTIONAL
            ):
                cable_list = [
                    CableClass(
                        name="None", maximum_current=0.0, resistance=0.0, investment_costs=0.0
                    ),
                    CableClass(
                        name="CableType1",
                        maximum_current=11000.0,
                        resistance=3.0,
                        investment_costs=60000.0,
                    ),
                ]

            return cable_list

    solution = run_optimization_problem_solver(
        GasElectProblemModified,
        esdl_parser=ESDLFileParser,
        esdl_file_name="EG_onshore_NL_gas_elec_case_study_drc_efvc_.esdl",
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="HeatingDemand_W_NL_gas_elec.csv",
    )

    results = solution.extract_results()
    parameters = solution.parameters(0)

    # # Test: Utils_tests
    # demand_matching_test(solution, results)
    # energy_conservation_test(solution, results)
    # heat_to_discharge_test(solution, results)
    # electric_power_conservation_test(solution, results)
    # gas_pipes_head_loss_test(solution, results)

    # Tests: Check if heat target is matched by resulting heat demands and
    # they are supplied by conversion elements
    # This tests are redundant because of demand_matching_test
    total_heat_demand = [0.0] * solution.times()
    total_heat_target = [0.0] * solution.times()
    total_heat_converted = [0.0] * solution.times()
    for asset in [*solution.energy_system_components.get("heat_demand", [])]:
        total_heat_demand += results[f"{asset}.Heat_demand"]
        total_heat_target += solution.get_timeseries(f"{asset}.target_heat_demand").values
    for asset in [*solution.energy_system_components.get("heat_source", [])]:
        total_heat_converted += results[f"{asset}.Heat_flow"]
    # print("Total Heat Demand: ", np.sum(total_heat_demand))
    # print("Total Heat Target: ", np.sum(total_heat_target))
    # print("Total Heat Converted: ", np.sum(total_heat_converted))
    np.testing.assert_allclose(total_heat_demand, total_heat_target)
    np.testing.assert_allclose(total_heat_converted, total_heat_demand)

    # Check cables
    print("====================================")
    print("==============Cables================")
    print("====================================")
    for cable in [*solution.energy_system_components.get("electricity_cable", [])]:
        cable_class = solution.get_optimized_electricity_cable_class(cable)
        cable_current_capacity = cable_class.maximum_current
        if cable_current_capacity == 0.0:
            print(f"{cable}: ", "No Cable")
        else:
            print(
                f"{cable}: ", "current capacity-", " ", parameters[f"{cable}.max_current"], " [A]"
            )

    # Check pipes
    print("===================================")
    print("==============Pipes================")
    print("===================================")
    for pipe in [*solution.energy_system_components.get("gas_pipe", [])]:
        pipe_diameter = results[f"{pipe}__gn_diameter"][0]
        if pipe_diameter == 0.0:
            print(f"{pipe}: ", "No Pipe")
        else:
            area = np.pi * pipe_diameter**2 / 4.0
            v_pipe = abs(results[f"{pipe}.Q"][1:]) / area
            print(
                f"{pipe}: ",
                "diameter- ",
                pipe_diameter,
                " [m],",
                " ",
                "velocity- ",
                np.round(max(v_pipe), 3),
                " [m/s]",
            )

    # Check heat sources and heat demand
    print("=======================================")
    print("========Conversion Assets==============")
    print("=======================================")
    industries = ["Borselle", "Vlaardingen", "Beverwijk", "Eemshaven", "Maasbracht"]
    for industry in industries:
        print(f"======{industry}======")
        heatflow_hp_gb = [0.0] * solution.times()[1:]
        for asset in [*solution.energy_system_components.get("heat_source", [])]:
            if industry in asset:
                heatflow_hp_gb += results[f"{asset}.Heat_flow"][1:]
                print(asset, results[f"{asset}.Heat_flow"][1:])

        heatflow_hd = [0.0] * solution.times()[1:]
        for asset in [*solution.energy_system_components.get("heat_demand", [])]:
            if industry in asset:
                heatflow_hd += results[f"{asset}.Heat_flow"][1:]
                print(asset, results[f"{asset}.Heat_flow"][1:])
        np.testing.assert_allclose(heatflow_hp_gb, heatflow_hd)

    # Check Electricity Sources
    print("===========================================")
    print("========Electricity Producers==============")
    print("===========================================")
    elec_producers = [
        "Borselle",
        "Maasvlakte",
        "Beverwijk",
        "Diemen",
        "Lelystad",
        "Eemshaven",
        "Maasbracht",
    ]
    for elec_producer in elec_producers:
        # print(f"======{elec_producer}======")
        elec_prod = [0.0] * solution.times()[1:]
        for asset in [*solution.energy_system_components.get("electricity_source", [])]:
            if elec_producer in asset:
                elec_prod += results[f"{asset}.Electricity_source"][1:]
                print(asset, results[f"{asset}.Electricity_source"][1:])

    # Check Gas Sources
    print("===================================")
    print("========Gas Producers==============")
    print("===================================")
    gas_producers = ["Borselle", "Maasvlakte", "DenHelder", "Eemshaven"]
    energy_content = parameters[
        "GasHeater_Beverwijk.energy_content"
    ]  # Currently GasSource has no energy_content attribute
    for gas_producer in gas_producers:
        # print(f"======{gas_producer}======")
        gas_prod = [0.0] * solution.times()[1:]
        for asset in [*solution.energy_system_components.get("gas_source", [])]:
            if gas_producer in asset:
                gas_prod += results[f"{asset}.GasOut.mass_flow"][1:] / 1000.0 * energy_content
                print(asset, results[f"{asset}.GasOut.mass_flow"][1:] / 1000.0 * energy_content)

# Figure
# Create a figure and a single subplot
fig, ax1 = plt.subplots()

# Define colors and line styles
blues = plt.cm.Blues(np.linspace(1, 0, 10))
oranges = plt.cm.Oranges(np.linspace(1, 0, 10))

line_styles = [
    (0, (1, 1)),  # dotted
    (0, (5, 5)),  # dashed
    (0, (3, 5, 1, 5)),  # dash-dot-dot
    (0, (3, 1, 1, 1)),  # dash-dot-dash
    (0, (1, 10)),  # sparse dots
    (0, (5, 1)),  # dense dashes
    (0, (1, 5)),  # sparse dots
    (0, (3, 3, 1, 3)),  # dash-dot-dot
    (0, (2, 2)),  # short dashes
    (0, (1, 1, 1, 1)),  # very dense dots
]

# Generate and plot 10 time series
i = 0
for asset in [*solution.energy_system_components.get("air_water_heat_pump_elec", [])]:
    ax1.step(
        solution.times() / 3600,
        results[f"{asset}.Heat_flow"] / 1e9,
        label=f"{asset}",
        color="Blue",
        linestyle=line_styles[i],
        linewidth=2,
        where="pre",
    )
    i += 1
i = 0
for asset in [*solution.energy_system_components.get("gas_boiler", [])]:
    ax1.step(
        solution.times() / 3600,
        results[f"{asset}.Heat_flow"] / 1e9,
        label=f"{asset}",
        color="Red",
        linestyle=line_styles[i],
        linewidth=2,
        where="pre",
    )
    i += 1

# Add legend and labels
ax1.set_title("Conversion Assets")
ax1.set_xlabel("Time (hr)")
ax1.set_ylabel("Power (GW)")
ax1.legend(loc="center right", ncol=2)

var_op_cost_gas_boiler = (
    solution.esdl_assets[solution.esdl_asset_name_to_id_map["GasHeater_Maasbracht"]]
    .attributes["costInformation"]
    .variableOperationalCosts.value
)
var_op_cost_heatpump = (
    solution.esdl_assets[solution.esdl_asset_name_to_id_map["HeatPump_Maasbracht"]]
    .attributes["costInformation"]
    .variableOperationalCosts.value
)


ax1.text(
    0.75,
    0.9,
    "Gas Price: "
    + str(var_op_cost_gas_boiler)
    + "EUR/MWh"
    + "\n"
    + "Electricity Price: "
    + str(var_op_cost_heatpump)
    + "EUR/MWh",
    horizontalalignment="center",
    verticalalignment="center",
    transform=ax1.transAxes,
)


# Display the plot
plt.grid(True, linestyle="--", alpha=0.4)
plt.tight_layout()
fig.savefig("../output_efvc_/conversion_assets.png")
plt.show()


a = 1
