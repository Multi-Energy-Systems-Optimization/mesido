import numpy as np

from tests.utils_tests import energy_conservation_test, heat_to_discharge_test


def post_processing_ensemble(heat_problem):
    results = dict()
    for e_m in range(heat_problem.ensemble_size):
        results[e_m] = heat_problem.extract_results(ensemble_member=e_m)

    energy_conservation_test(heat_problem, heat_problem.extract_results())
    heat_to_discharge_test(heat_problem, heat_problem.extract_results())

    inv_costs_source = [0.0] * heat_problem.ensemble_size
    opex_source = [0.0] * heat_problem.ensemble_size
    inv_costs_dem = [0.0] * heat_problem.ensemble_size
    opex_dem = [0.0] * heat_problem.ensemble_size
    for e_m in range(heat_problem.ensemble_size):
        print("### Ensemble member", e_m)
        for demand in heat_problem.energy_system_components.get("heat_demand", []):
            result_demand = results[e_m][f"{demand}.Heat_demand"]
            target_demand = heat_problem.get_timeseries(f"{demand}.target_heat_demand", e_m)
            print(demand, result_demand)
            print("target: ", target_demand)
            np.testing.assert_allclose(target_demand.values, result_demand)
            inv_costs_dem[e_m] += results[e_m][heat_problem._asset_investment_cost_map[demand]][0]
            inv_costs_dem[e_m] += results[e_m][heat_problem._asset_installation_cost_map[demand]][
                0
            ]
            opex_dem[e_m] += results[e_m][heat_problem._asset_fixed_operational_cost_map[demand]][
                0
            ]
            opex_dem[e_m] += results[e_m][
                heat_problem._asset_variable_operational_cost_map[demand]
            ][0]

        for prod in heat_problem.energy_system_components.get("heat_source", []):
            print(prod, "Heat_source", results[e_m][f"{prod}.Heat_source"])
            print(prod, "Max size", results[e_m][f"{prod}__max_size"])
            inv_costs_source[e_m] += results[e_m][heat_problem._asset_investment_cost_map[prod]][0]
            inv_costs_source[e_m] += results[e_m][heat_problem._asset_installation_cost_map[prod]][0]
            opex_source[e_m] += results[e_m][heat_problem._asset_fixed_operational_cost_map[prod]][0]
            opex_source[e_m] += results[e_m][heat_problem._asset_variable_operational_cost_map[prod]][
                0
            ]

    set_self_hot_pipes = set(heat_problem.hot_pipes)
    inv_costs_pipes = [0.0] * heat_problem.ensemble_size
    opex_pipes = [0.0] * heat_problem.ensemble_size
    for h_p in heat_problem.energy_system_components.get("heat_pipe", []):
        if h_p in heat_problem._heat_pipe_topo_pipe_class_map.keys():
            pipe_classes = heat_problem._heat_pipe_topo_pipe_class_map[h_p]
            for pc in pipe_classes:
                neighbour = heat_problem.has_related_pipe(h_p)
                if neighbour and h_p not in set_self_hot_pipes:
                    var_name = f"{heat_problem.cold_to_hot_pipe(h_p)}__hn_pipe_class_{pc.name}"
                else:
                    var_name = f"{h_p}__hn_pipe_class_{pc.name}"
                values = []
                for e_m in range(heat_problem.ensemble_size):
                    values.append(results[e_m][var_name][0])
                np.testing.assert_allclose(values[0], values)
                print(h_p, var_name, values)
        for e_m in range(heat_problem.ensemble_size):
            inv_costs_pipes[e_m] += results[e_m][heat_problem._asset_investment_cost_map[h_p]][0]
            inv_costs_pipes[e_m] += results[e_m][heat_problem._asset_installation_cost_map[h_p]][0]
            opex_pipes[e_m] += results[e_m][heat_problem._asset_fixed_operational_cost_map[h_p]][0]
            opex_pipes[e_m] += results[e_m][heat_problem._asset_variable_operational_cost_map[h_p]][0]
    print("sources investment", inv_costs_source)
    print("sources opex", opex_source)
    print("demands investment", inv_costs_dem)
    print("demands opex", opex_dem)
    print("pipes investment", inv_costs_pipes)
    print("pipes opex", opex_pipes)

    # TODO: check TCO costs for these ensembles.
    return results
