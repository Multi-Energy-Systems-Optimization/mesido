import json
import os
from pathlib import Path
import xml.etree.ElementTree as ET  # noqa: N817

import numpy as np
from matplotlib import pyplot as plt
import matplotlib.patches as mpatches


class RollOutPost:
    """
    This class contains the basic functions to plot the results of:
     - the placement of assets geospatially and over time
     - the allocation of assets over time.
    """

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.model_folder = kwargs.get("model_folder")
        self.output_folder = kwargs.get("output_folder")
        self.esdl_file_name = kwargs.get("esdl_file_name", "ESDL_file.esdl")

    def all_plots(self):
        """
        This function runs all plotting function available for rollout and saves them to the
        output folder.
        """

        self.plot_asset_allocation()
        self.plot_geograph_time()

    def plot_asset_allocation(self):
        """
        This function plots the allocation of assets (demands, pipes, storages, sources)
        over time and is saved the output folder.
        """

        solution.times()
        for ates in solution.energy_system_components.get("ates", []):
            print(results[f"{ates}.Stored_heat"])

        figure, ax = plt.subplots()
        times = solution.times()
        for ates in solution.energy_system_components.get("ates", []):
            # stored_heat = [results.get(f"{ates}.Stored_heat", 0) for t in range(times)]
            plt.plot(times / 3600 / 24, results[f"{ates}.Stored_heat"] / 1e9, label=str(ates))

        plt.xlabel("Time [days]")
        plt.ylabel("Stored Heat [GJ]")
        plt.title("Heat Storage vs Time")
        plt.legend()
        plt.xticks(range(0, int(times[-1] / 3600 / 24) + 1, 20), minor=True)
        coarse_ticks = [0, 365, 730, 1095]
        plt.xticks(coarse_ticks, [str(t) for t in coarse_ticks])
        plt.grid()
        plt.tight_layout()
        plt.show()
        savefig = os.path.join(self.output_folder, "heat_storage_vs_time.png")
        plt.savefig(savefig)
        plt.close()

        figure, ax = plt.subplots()
        times = solution.times()
        for heatsource in solution.energy_system_components.get("heat_source", []):
            # stored_heat = [results.get(f"{ates}.Stored_heat", 0) for t in range(times)]
            plt.plot(
                times / 3600 / 24, results[f"{heatsource}.Heat_source"] / 1e6, label=str(heatsource)
            )

        plt.xlabel("Time [days]")
        plt.ylabel("Heat produced [MW]")
        plt.title("Heat [produced] vs Time")
        plt.legend()
        plt.xticks(range(0, int(times[-1] / 3600 / 24) + 1, 20), minor=True)
        coarse_ticks = [0, 365, 730, 1095]
        plt.xticks(coarse_ticks, [str(t) for t in coarse_ticks])
        plt.grid()
        plt.tight_layout()
        plt.show()
        savefig = os.path.join(self.output_folder, "heat_produced_vs_time.png")
        plt.savefig(savefig)
        plt.close()

        figure, ax = plt.subplots()
        for ates in solution.energy_system_components.get("ates", []):
            # stored_heat = [results.get(f"{ates}.Stored_heat", 0) for t in range(times)]
            plt.plot(
                times / 3600 / 24,
                results[f"{ates}.Heat_ates"] / 1e6,
                label=str(ates) + " Heat_ates",
            )
            plt.plot(
                times / 3600 / 24,
                results[f"{ates}.Heat_loss"] / 1e6,
                label=str(ates) + " Heat_loss",
            )
            plt.plot(
                times / 3600 / 24,
                results[f"{ates}.Storage_yearly_change"] / 1e6,
                label=str(ates) + " Storage_yearly_change",
            )

        plt.xlabel("Time [days]")
        plt.ylabel("Heat [MW]")
        plt.title("Heat  vs Time")
        plt.legend()
        plt.xticks(range(0, int(times[-1] / 3600 / 24) + 1, 20), minor=True)
        coarse_ticks = [0, 365, 730, 1095]
        plt.xticks(coarse_ticks, [str(t) for t in coarse_ticks])
        plt.grid()
        plt.tight_layout()
        plt.show()
        savefig = os.path.join(self.output_folder, "heat_ates_vs_time.png")
        plt.savefig(savefig)
        plt.close()

    def plot_geograph_time(self):
        """
        This function plots the placements of assets (demands, pipes, storages, sources)
        geographically over time and is saved in the output folder.
        """

        plt.figure()
        color = ["b", "g", "r", "c", "m", "k", "y", "orange", "lime", "teal"]

        legend_years = []
        yearstep = self.problem._horizon / self.problem._years
        for i in range(self.problem._years):
            legend_years.append(
                mpatches.Patch(color=color[i], label=f"year {i * yearstep} {(i + 1) * yearstep}")
            )

        plt.legend(handles=legend_years)
        lat0 = 0.0  # 52.045
        lon0 = 0.0  # 4.315
        for id, asset in self.problem.esdl_assets.items():
            if asset.asset_type == "Pipe":
                name = asset.name
                if self.problem.is_cold_pipe(name):
                    continue
                line_x = []
                line_y = []
                for point in asset.attributes["geometry"].point:
                    line_x.append((point.lon - lon0))
                    line_y.append((point.lat - lat0))
                is_placed_list = [
                    self.results[f"{name}__asset_is_realized_{i}"]
                    for i in range(self.problem._years)
                ]
                if 1 in is_placed_list:
                    idx = np.round(is_placed_list.index(1))
                    plot_size = np.round(asset.attributes["innerDiameter"] * 20)
                    plt.plot(line_x, line_y, color[int(idx)], linewidth=plot_size)
            if asset.asset_type == "HeatingDemand":
                b = asset
                point = asset.attributes["geometry"]
                line_x = [(point.lon - lon0)]
                line_y = [(point.lat - lat0)]
                is_placed_list = [
                    self.results[f"{asset.name}__asset_is_realized_{i}"]
                    for i in range(self.problem._years)
                ]
                if 1 in is_placed_list:
                    idx = np.round(is_placed_list.index(1))
                    plot_size = np.round(max(self.results[f"{asset.name}.Heat_demand"]) / 1.0e6 * 3)
                    plt.plot(line_x, line_y, "o", color=color[int(idx)], markersize=plot_size)
            if (
                asset.asset_type == "HeatProducer"
                or asset.asset_type == "ResidualHeatSource"
                or asset.asset_type == "GeothermalSource"
            ):
                point = asset.attributes["geometry"]
                line_x = [(point.lon - lon0)]
                line_y = [(point.lat - lat0)]
                is_placed_list = [
                    self.results[f"{asset.name}__asset_is_realized_{i}"]
                    for i in range(self.problem._years)
                ]
                if 1 in is_placed_list:
                    idx = np.round(is_placed_list.index(1))
                    plt.plot(line_x, line_y, "s", color=color[int(idx)])
            if asset.asset_type == "ATES":
                point = asset.attributes["geometry"]
                line_x = [(point.lon - lon0)]
                line_y = [(point.lat - lat0)]
                is_placed_list = [
                    self.results[f"{asset.name}__asset_is_realized_{i}"]
                    for i in range(self.problem._years)
                ]
                if 1 in is_placed_list:
                    idx = np.round(is_placed_list.index(1))
                    plt.plot(line_x, line_y, ">", color=color[int(idx)])
        savefig = os.path.join(self.output_folder, "geospatial_time_asset_placement.png")
        plt.savefig(savefig)
        plt.show()
