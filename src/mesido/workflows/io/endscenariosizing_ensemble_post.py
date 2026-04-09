import numpy as np

from tests.utils_tests import energy_conservation_test, heat_to_discharge_test


def post_processing_ensemble(heat_problem):
    results = dict()
    for ensemble_member in range(heat_problem.ensemble_size):
        results[ensemble_member] = heat_problem.extract_results(ensemble_member=ensemble_member)

    energy_conservation_test(heat_problem, heat_problem.extract_results())
    heat_to_discharge_test(heat_problem, heat_problem.extract_results())

    for ensemble_member in range(heat_problem.ensemble_size):
        print("### Ensemble member", ensemble_member)
        for demand in heat_problem.energy_system_components.get("heat_demand", []):
            result_demand = results[ensemble_member][f"{demand}.Heat_demand"]
            target_demand = heat_problem.get_timeseries(f"{demand}.target_heat_demand", ensemble_member)
            print(demand, result_demand)
            print("target: ", target_demand)
            np.testing.assert_allclose(target_demand.values, result_demand)
        for prod in heat_problem.energy_system_components.get("heat_source", []):
            print(prod, "Heat_source", results[ensemble_member][f"{prod}.Heat_source"])
            print(prod, "Max size", results[ensemble_member][f"{prod}__max_size"])

    set_self_hot_pipes = set(heat_problem.hot_pipes)
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

    # TODO: check TCO costs for these ensembles.
    return results
