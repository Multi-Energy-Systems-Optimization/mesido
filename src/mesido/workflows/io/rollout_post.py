import os

from esdl import esdl
from esdl.esdl_handler import EnergySystemHandler

import matplotlib.patches as mpatches
from matplotlib import pyplot as plt

from mesido.post_processing.post_processing_utils import extract_data_results_alias

import numpy as np


class RollOutPost:
    """
    This class contains the basic functions to plot the results of:
     - the placement of assets geospatially and over time
     - the allocation of assets over time.
    """

    def __init__(self, **kwargs):
        self.output_folder = kwargs.get("output_folder")
        self.input_folder = kwargs.get("input_folder", self.output_folder)
        self.model_folder = kwargs.get("model_folder", self.output_folder)
        self.figure_folder = kwargs.get("figure_folder")
        self.esdl_file_name = kwargs.get("esdl_file_name", "ESDL_file.esdl")

        self.results, raw_data = extract_data_results_alias(self.output_folder)
        self.parameters = raw_data["parameters"]
        self.bounds = raw_data["bounds"]

        self.times = np.asarray(self.parameters["times"])
        self.years = int((self.times[-1] - self.times[0]) / 8760 / 3600)
        self._horizon = 30  # total years that are represented by the self.years

        self.esh = EnergySystemHandler()
        self.esh.load_file(os.path.join(self.model_folder, self.esdl_file_name))

    def all_plots(self):
        """
        This function runs all plotting function available for rollout and saves them to the
        output folder.
        """

        self.plot_asset_allocation()
        self.plot_geograph_time()
        self.plot_financials()

    def plot_asset_allocation(self):
        """
        This function plots the allocation of assets (demands, pipes, storages, sources)
        over time and is saved the output folder.
        """
        results = self.results
        ates_assets = self.esh.get_all_instances_of_type(esdl.ATES)

        figure, ax = plt.subplots()
        times = np.asarray(self.parameters["times"])
        times = times - times[0]
        for ates in ates_assets:
            plt.plot(
                times / 3600 / 24, results[f"{ates.name}.Stored_heat"] / 1e9, label=str(ates.name)
            )

        plt.xlabel("Time [days]")
        plt.ylabel("Stored Heat [GJ]")
        plt.title("Heat Storage vs Time")
        plt.legend()
        plt.xticks(range(0, int(times[-1] / 3600 / 24) + 1, 20), minor=True)
        coarse_ticks = [0, 365, 730, 1095]
        plt.xticks(coarse_ticks, [str(t) for t in coarse_ticks])
        plt.grid()
        plt.tight_layout()
        savefig = os.path.join(self.figure_folder, "heat_storage_vs_time.png")
        plt.savefig(savefig)
        plt.close()

        figure, ax = plt.subplots()
        heat_sources = self.esh.get_all_instances_of_type(esdl.HeatProducer)
        for heatsource in heat_sources:
            plt.plot(
                times / 3600 / 24,
                results[f"{heatsource.name}.Heat_source"] / 1e6,
                label=str(heatsource),
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
        savefig = os.path.join(self.figure_folder, "heat_produced_vs_time.png")
        plt.savefig(savefig)
        plt.close()

        figure, ax = plt.subplots()
        for ates_asset in ates_assets:
            ates = ates_asset.name
            plt.plot(
                times / 3600 / 24,
                np.array(results[f"{ates}.Heat_ates"]) / 1e6,
                label=str(ates) + " Heat_ates",
            )
            plt.plot(
                times / 3600 / 24,
                np.array(results[f"{ates}.Heat_loss"]) / 1e6,
                label=str(ates) + " Heat_loss",
            )
            plt.plot(
                times / 3600 / 24,
                np.array(results[f"{ates}.Storage_yearly_change"]) / 1e6,
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
        savefig = os.path.join(self.figure_folder, "heat_ates_vs_time.png")
        plt.savefig(savefig)
        plt.close()

        total_pipe_length = 0.0
        for pipe in self.esh.get_all_instances_of_type(esdl.Pipe):
            total_pipe_length += pipe.length
        print(total_pipe_length)

    def plot_geograph_time(self):
        """
        This function plots the placements of assets (demands, pipes, storages, sources)
        geographically over time and is saved in the output folder.
        """

        plt.figure()
        color = ["b", "g", "r", "c", "m", "k", "y", "orange", "lime", "teal"]

        legend_years = []
        times = self.times
        problem_years = int((times[-1] - times[0]) / 8760 / 3600)
        yearstep = int(self._horizon / problem_years)
        for i in range(problem_years):
            legend_years.append(
                mpatches.Patch(color=color[i], label=f"year {i * yearstep} {(i + 1) * yearstep}")
            )

        plt.legend(handles=legend_years)
        lat0 = 0.0  # 52.045
        lon0 = 0.0  # 4.315
        for asset in self.esh.get_all_instances_of_type(esdl.EnergyAsset):
            if isinstance(asset, esdl.Pipe):
                name = asset.name
                if name.endswith("_ret"):
                    continue
                line_x = []
                line_y = []
                for point in asset.geometry.point:
                    line_x.append((point.lon - lon0))
                    line_y.append((point.lat - lat0))
                is_placed_list = [
                    self.results[f"{name}__asset_is_realized_{i}"] for i in range(problem_years)
                ]
                if 1 in is_placed_list:
                    idx = np.round(is_placed_list.index(1))
                    plot_size = np.round(asset.innerDiameter * 20)
                    plt.plot(line_x, line_y, color[int(idx)], linewidth=plot_size)
            elif isinstance(asset, esdl.HeatingDemand):
                point = asset.geometry
                line_x = [point.lon - lon0]
                line_y = [point.lat - lat0]
                is_placed_list = [
                    self.results[f"{asset.name}__asset_is_realized_{i}"]
                    for i in range(problem_years)
                ]
                if 1 in is_placed_list:
                    idx = np.round(is_placed_list.index(1))
                    plot_size = np.round(max(self.results[f"{asset.name}.Heat_demand"]) / 1.0e6 * 2)
                    plt.plot(line_x, line_y, "o", color=color[int(idx)], markersize=plot_size)
            elif isinstance(asset, esdl.HeatProducer):
                point = asset.geometry
                line_x = [point.lon - lon0]
                line_y = [point.lat - lat0]
                is_placed_list = [
                    self.results[f"{asset.name}__asset_is_realized_{i}"]
                    for i in range(problem_years)
                ]
                if 1 in is_placed_list:
                    idx = np.round(is_placed_list.index(1))
                    plot_size = np.round(max(self.results[f"{asset.name}.Heat_flow"]) / 1.0e6)
                    plt.plot(line_x, line_y, "s", color=color[int(idx)], markersize=plot_size)
            elif isinstance(asset, esdl.ATES):
                point = asset.geometry
                line_x = [point.lon - lon0]
                line_y = [point.lat - lat0]
                is_placed_list = [
                    self.results[f"{asset.name}__asset_is_realized_{i}"]
                    for i in range(problem_years)
                ]
                if 1 in is_placed_list:
                    idx = np.round(is_placed_list.index(1))
                    plot_size = np.round(max(self.results[f"{asset.name}.Heat_flow"]) / 1.0e6)
                    plt.plot(line_x, line_y, ">", color=color[int(idx)], markersize=plot_size)
            elif isinstance(asset, esdl.HeatStorage):
                point = asset.geometry
                line_x = [point.lon - lon0]
                line_y = [point.lat - lat0]
                is_placed_list = [
                    self.results[f"{asset.name}__asset_is_realized_{i}"]
                    for i in range(problem_years)
                ]
                if 1 in is_placed_list:
                    idx = np.round(is_placed_list.index(1))
                    plot_size = np.round(max(self.results[f"{asset.name}.Heat_flow"]) / 1.0e6)
                    plt.plot(line_x, line_y, ">", color=color[int(idx)], markersize=plot_size)
            else:
                print(f"Asset {asset.name} is not placed on map")

        savefig = os.path.join(self.figure_folder, "geospatial_time_asset_placement.png")
        plt.savefig(savefig)
        plt.show()

    def plot_financials(self):
        parameters = self.parameters
        bounds = self.bounds
        fixed_opex_type = {}
        variable_opex_type = {}
        capex_cumulative_type = {}
        dt = np.diff(self.times)
        steps_per_year = int(len(self.times) / self.years)
        capex_year_totals = [0 for _ in range(self.years)]
        opex_year_totals = [0 for _ in range(self.years)]
        for asset in self.esh.get_all_instances_of_type(esdl.EnergyAsset):
            if asset in [
                *self.esh.get_all_instances_of_type(esdl.HeatingDemand),
                *self.esh.get_all_instances_of_type(esdl.HeatProducer),
                *self.esh.get_all_instances_of_type(esdl.HeatStorage),
                *self.esh.get_all_instances_of_type(esdl.Pipe),
            ]:
                asset_name = asset.name
                asset_type = str(type(asset))
                is_placed = self.get_asset_is__realized_symbols(asset_name)
                cumulative_capex_var = self.get_cumulative_capex_symbols(asset_name)
                fixed_operational_cost_coeff = parameters[
                    f"{asset_name}.fixed_operational_cost_coefficient"
                ]
                variable_operational_cost_coeff = parameters[
                    f"{asset_name}.variable_operational_cost_coefficient"
                ]
                # fixed_operational_cost =
                # optimization_problem._asset_fixed_operational_cost_map.get(
                #     asset_name)
                heat_flow_var = self.results[f"{asset_name}.Heat_flow"]
                max_power = 0.0
                if not isinstance(asset, esdl.Pipe):
                    max_power = bounds[f"{asset_name}__max_size"][1]
                    if max_power == 0:
                        raise RuntimeError(
                            f"Could not determine the max power of asset {asset_name}"
                        )
                # TODO: this can later be replaced by creating a new variable
                # {asset}_fix_operational_cost_{year} set equal to is_placed[i] *
                # _asset_fixed_operational_cost_map_var using bigm constraints.

                var_opex_costs = heat_flow_var[1:] * variable_operational_cost_coeff * dt / 3600
                if asset_type not in variable_opex_type.keys():
                    variable_opex_type[asset_type] = var_opex_costs
                else:
                    variable_opex_type[asset_type] += var_opex_costs

                for i in range(self.years):
                    if asset_type not in fixed_opex_type.keys():
                        fixed_opex_type[asset_type] = []
                    fixed_opex_costs = is_placed[i] * fixed_operational_cost_coeff * max_power
                    if len(fixed_opex_type[asset_type]) == i + 1:
                        fixed_opex_type[asset_type][i] += fixed_opex_costs
                    else:
                        fixed_opex_type[asset_type].append(fixed_opex_costs)

                    if asset_type not in capex_cumulative_type.keys():
                        capex_cumulative_type[asset_type] = []
                    cumulative_capex_costs = cumulative_capex_var[i]
                    if len(capex_cumulative_type[asset_type]) == i + 1:
                        capex_cumulative_type[asset_type][i] += cumulative_capex_costs
                    else:
                        capex_cumulative_type[asset_type].append(cumulative_capex_costs)

                    capex_year_totals[i] += cumulative_capex_costs
                    opex_year_totals[i] += fixed_opex_costs + sum(
                        var_opex_costs[i * steps_per_year : (i + 1) * steps_per_year]
                    )

        years = [i * self._horizon / self.years for i in range(self.years)]

        capex_year_totals = np.asarray(capex_year_totals)
        opex_year_totals = np.asarray(opex_year_totals)
        cumulative_opex_totals = np.cumsum(opex_year_totals * 30 / self.years)

        plt.figure()
        plt.plot(years, capex_year_totals + cumulative_opex_totals, label="costs")
        # plt.plot(years, revenue, label="revenue all connected")
        plt.plot(years, capex_year_totals, alpha=0.2, label="capex")
        plt.plot(years, cumulative_opex_totals, alpha=0.2, label="cumulative opex")
        plt.xlabel("time [years]")
        plt.ylabel("M€")
        plt.grid()
        plt.title("CAPEX, OPEX and revenue")
        plt.legend()
        savefig = os.path.join(self.figure_folder, "financial.png")
        plt.savefig(savefig)
        plt.show()

    # DO NOT DELETE: potential future use of post processing
    # def animate_init():
    #     line.set_data([], [])
    #     return (line,)
    #
    # def animate_fig(i):
    #     lat0 = 0.0  # 52.045
    #     lon0 = 0.0  # 4.315
    #     for id, asset in esdl_assets.items():
    #         if asset.asset_type == "Pipe":
    #             name = asset.name
    #             if "_ret" in name:
    #                 continue
    #             line_x = []
    #             line_y = []
    #             for point in asset.attributes["geometry"].point:
    #                 line_x.append((point.lon - lon0))
    #                 line_y.append((point.lat - lat0))
    #             is_placed_list = [results[f"{name}__is_placed_{i}"] for i in range(10)]
    #             if 1 in is_placed_list:
    #                 idx = np.round(is_placed_list.index(1))
    #                 if idx == i - 1:
    #                     plot_size = np.round(asset.attributes["innerDiameter"] * 20)
    #                     plt.plot(line_x, line_y, color[int(idx)], linewidth=plot_size)
    #                     # line.set_data(line_x, line_y)#, color[int(idx)], linewidth=plot_size)
    #         if asset.asset_type == "HeatingDemand":
    #             b = asset
    #             point = asset.attributes["geometry"]
    #             line_x = [(point.lon - lon0)]
    #             line_y = [(point.lat - lat0)]
    #             is_placed_list = [results[f"{asset.name}__is_placed_{i}"] for i in range(10)]
    #             if 1 in is_placed_list:
    #                 idx = np.round(is_placed_list.index(1))
    #                 if idx == i - 1:
    #                     plot_size =
    #                     np.round(max(results[f"{asset.name}.Heat_demand"]) / 1.0e6 * 3)
    #                     plt.plot(line_x, line_y, "o", color=color[int(idx)], markersize=plot_size)
    #                     # line.set_data(line_x, line_y)
    #         if (
    #             asset.asset_type == "HeatProducer"
    #             or asset.asset_type == "ResidualHeatSource"
    #             or asset.asset_type == "GeothermalSource"
    #         ):
    #             point = asset.attributes["geometry"]
    #             line_x = [(point.lon - lon0)]
    #             line_y = [(point.lat - lat0)]
    #             is_placed_list = [results[f"{asset.name}__is_placed_{i}"] for i in range(10)]
    #             if 1 in is_placed_list:
    #                 idx = np.round(is_placed_list.index(1))
    #                 if idx == i - 1:
    #                     plt.plot(line_x, line_y, "s", color=color[int(idx)])
    #                     # line.set_data(line_x, line_y)
    #         if asset.asset_type == "ATES":
    #             point = asset.attributes["geometry"]
    #             line_x = [(point.lon - lon0)]
    #             line_y = [(point.lat - lat0)]
    #             is_placed_list = [results[f"{asset.name}__is_placed_{i}"] for i in range(10)]
    #             if 1 in is_placed_list:
    #                 idx = np.round(is_placed_list.index(1))
    #                 if idx == i - 1:
    #                     plt.plot(line_x, line_y, ">", color=color[int(idx)])
    #                     # line.set_data(line_x,line_y)
    #     return (line,)

    def get_asset_is__realized_symbols(self, asset_name):
        var_names = [f"{asset_name}__asset_is_realized_{y}" for y in range(self.years)]
        return [self.results[var_n] for var_n in var_names]

    def get_cumulative_capex_symbols(self, asset_name):
        var_names = [
            f"{asset_name}__cumulative_investments_made_in_eur_year_{y}" for y in range(self.years)
        ]
        return [self.results[var_n] for var_n in var_names]


if __name__ == "__main__":
    kwargs = {
        "output_folder": r"C:\git\mesido\examples\municipality" r"\test2",
        "esdl_file_name": "GROW_withATES_Prod_install_full_GrowOptimized_costsupdated.esdl",
        "figure_folder": r"C:\git\mesido\examples\municipality\test2" r"\figures",
    }
    rolloutpost = RollOutPost(**kwargs)
    rolloutpost.all_plots()
