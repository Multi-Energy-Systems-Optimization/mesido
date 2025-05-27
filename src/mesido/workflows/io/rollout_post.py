import json
import os
from pathlib import Path
import xml.etree.ElementTree as ET  # noqa: N817

import numpy as np
from matplotlib import pyplot as plt

#TODO: This script should not be added, it is just temporary for testing!!!!!

def rollout_post(problem, results):
    runinfo_path = Path(problem.esdl_run_info_path).resolve()
    tree = ET.parse(runinfo_path)
    root = tree.getroot()
    results_path = root.findtext("pi:outputResultsFile", namespaces=ns)
    results_dict = dict()

    for key, value in results.items():
        new_value = [x for x in value]
        if len(new_value) == 1:
            new_value = new_value[0]
        results_dict[key] = new_value

    if results_path is None:
        workdir = root.findtext("pi:workDir", namespaces=ns)
        results_path = os.path.join(workdir, "results.json")
    with open(results_path, "w") as file:
        json.dump(results_dict, fp=file)

    import matplotlib.patches as mpatches
    plt.figure()
    color = ["b", "g", "r", "c", "m", "k", "y", "orange", "lime", "teal"]

    legend_years = []
    yearstep = problem._horizon / problem._years
    for i in range(problem._years):
        legend_years.append(mpatches.Patch(color=color[i],
                                           label=f"year {2025 + i * yearstep} {2025 + (i + 1) * yearstep}"))

    plt.legend(handles=legend_years)
    lat0 = 0.  # 52.045
    lon0 = 0.  # 4.315
    for id, asset in problem.esdl_assets.items():
        if asset.asset_type == "Pipe":
            name = asset.name
            if problem.is_cold_pipe(name):
                continue
            line_x = []
            line_y = []
            for point in asset.attributes["geometry"].point:
                line_x.append((point.lon - lon0))
                line_y.append((point.lat - lat0))
            is_placed_list = [results[f"{name}__is_placed_{i}"] for i in range(problem._years)]
            if 1 in is_placed_list:
                idx = np.round(is_placed_list.index(1))
                plot_size = np.round(asset.attributes["innerDiameter"] * 20)
                plt.plot(line_x, line_y, color[int(idx)], linewidth=plot_size)
        if asset.asset_type == "HeatingDemand":
            b = asset
            point = asset.attributes["geometry"]
            line_x = [(point.lon - lon0)]
            line_y = [(point.lat - lat0)]
            is_placed_list = [results[f"{asset.name}__is_placed_{i}"] for i in range(problem._years)]
            if 1 in is_placed_list:
                idx = np.round(is_placed_list.index(1))
                plot_size = np.round(max(results[f"{asset.name}.Heat_demand"]) / 1.e6 * 3)
                plt.plot(line_x, line_y, "o", color=color[int(idx)], markersize=plot_size)
        if (asset.asset_type == "HeatProducer" or
                asset.asset_type == "ResidualHeatSource" or
                asset.asset_type == "GeothermalSource"):
            point = asset.attributes["geometry"]
            line_x = [(point.lon - lon0)]
            line_y = [(point.lat - lat0)]
            is_placed_list = [results[f"{asset.name}__is_placed_{i}"] for i in range(problem._years)]
            if 1 in is_placed_list:
                idx = np.round(is_placed_list.index(1))
                plt.plot(line_x, line_y, "s", color=color[int(idx)])
        if (asset.asset_type == "ATES"):
            point = asset.attributes["geometry"]
            line_x = [(point.lon - lon0)]
            line_y = [(point.lat - lat0)]
            is_placed_list = [results[f"{asset.name}__is_placed_{i}"] for i in range(problem._years)]
            if 1 in is_placed_list:
                idx = np.round(is_placed_list.index(1))
                plt.plot(line_x, line_y, ">", color=color[int(idx)])
    plt.show()