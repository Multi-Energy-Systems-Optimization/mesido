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
    #TODO: check TCO costs for these ensembles.
    return results
