from pathlib import Path
from unittest import TestCase

import numpy as np

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows import run_end_scenario_sizing
from mesido.workflows.endscenariosizing_ensemble import EndScenarioSizingStagedEnsemble
from mesido.workflows.grow_workflow import SolverCPLEX

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestEndScenarioSizingEnsemble(TestCase):
    def test_end_scenario_sizing_staged(self):
        """
        Check if the EndScenarioSizingStaged workflow is behaving as expected. This is an
        optimization done over a full year with timesteps of 5 days and hour timesteps for the peak
        day.


        """
        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a full year with timesteps of 5 days and hour timesteps
        # for the peak da
        heat_problem = run_end_scenario_sizing(
            EndScenarioSizingStagedEnsemble,
            solver_class=SolverCPLEX,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = dict()
        for e_m in range(heat_problem.ensemble_size):
            results[e_m] = heat_problem.extract_results(ensemble_member=e_m)
            demand_matching_test(heat_problem, results[e_m], ensemble_member=e_m)

            energy_conservation_test(heat_problem, heat_problem.extract_results(e_m))
            heat_to_discharge_test(heat_problem, heat_problem.extract_results(e_m))

        inv_costs_dem = [0.0] * heat_problem.ensemble_size
        opex_dem = [0.0] * heat_problem.ensemble_size
        for e_m in range(heat_problem.ensemble_size):
            print("### Ensemble member", e_m)
            for demand in heat_problem.energy_system_components.get("heat_demand", []):
                inv_costs_dem[e_m] += results[e_m][heat_problem._asset_investment_cost_map[demand]][
                    0
                ]
                inv_costs_dem[e_m] += results[e_m][
                    heat_problem._asset_installation_cost_map[demand]
                ][0]
                opex_dem[e_m] += results[e_m][
                    heat_problem._asset_fixed_operational_cost_map[demand]
                ][0]
                opex_dem[e_m] += results[e_m][
                    heat_problem._asset_variable_operational_cost_map[demand]
                ][0]

        def check_consistent_size_and_costs(assets, equal_size_assets=True):
            inv_costs_source = [0.0] * heat_problem.ensemble_size
            opex_source = [0.0] * heat_problem.ensemble_size
            for prod in assets:
                prod_size = results[0][f"{prod}__max_size"]
                prod_aggr_count = results[0][f"{prod}_aggregation_count"]
                inv_cost_0 = results[0][heat_problem._asset_investment_cost_map[prod]][0]
                inst_cost_0 = results[0][heat_problem._asset_installation_cost_map[prod]][0]
                for e_m in range(heat_problem.ensemble_size):
                    inv_cost = results[e_m][heat_problem._asset_investment_cost_map[prod]][0]
                    inst_cost = results[e_m][heat_problem._asset_installation_cost_map[prod]][0]
                    if equal_size_assets:
                        np.testing.assert_equal(prod_size, results[e_m][f"{prod}__max_size"])
                        np.testing.assert_equal(prod_aggr_count, results[e_m][f"{prod}_aggregation_count"])
                        np.testing.assert_equal(inv_cost, inv_cost_0)
                        np.testing.assert_equal(inst_cost, inst_cost_0)
                    inv_costs_source[e_m] += inv_cost
                    inv_costs_source[e_m] += inst_cost
                    opex_source[e_m] += results[e_m][
                        heat_problem._asset_fixed_operational_cost_map[prod]
                    ][0]
                    opex_source[e_m] += results[e_m][
                        heat_problem._asset_variable_operational_cost_map[prod]
                    ][0]
            return inv_costs_source, opex_source

        heat_sources = heat_problem.energy_system_components.get("heat_source",[])
        buffers = heat_problem.energy_system_components.get("heat_buffer", [])
        ates = heat_problem.energy_system_components.get("ates", [])
        inv_costs_source, opex_source = check_consistent_size_and_costs(heat_sources)
        inv_costs_buffer, opex_buffer = check_consistent_size_and_costs(buffers,
                                                                        equal_size_assets=False)
        inv_costs_ates, opex_ates = check_consistent_size_and_costs(ates, equal_size_assets=False)

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
                    pipe_size = []
                    for e_m in range(heat_problem.ensemble_size):
                        pipe_size.append(results[e_m][var_name][0])
                    np.testing.assert_allclose(pipe_size[0], pipe_size)
            for e_m in range(heat_problem.ensemble_size):
                pipe_inv = results[e_m][heat_problem._asset_investment_cost_map[h_p]][0]
                pipe_inst = results[e_m][heat_problem._asset_investment_cost_map[h_p]][0]
                inv_costs_pipes[e_m] += pipe_inv + pipe_inst
                opex_pipes[e_m] += results[e_m][
                    heat_problem._asset_fixed_operational_cost_map[h_p]
                ][0]
                opex_pipes[e_m] += results[e_m][
                    heat_problem._asset_variable_operational_cost_map[h_p]
                ][0]
        capex_total = [inv_costs_dem[e_m] + inv_costs_source[e_m] + inv_costs_buffer[e_m] + inv_costs_ates[e_m] +
                         inv_costs_pipes[e_m] for e_m in range(heat_problem.ensemble_size)]
        opex_total = [opex_dem[e_m] + opex_source[e_m] + opex_buffer[e_m] + opex_ates[e_m] +
                      opex_pipes[e_m] for e_m in range(heat_problem.ensemble_size)]

        total_costs = capex_total + opex_total
        #ensure that the total costs for the system capex + opex is the lowest for the system
        # with the lowest demand (e_m=2) and highest for the system with the largest demand (e_m=0)
        np.testing.assert_array_less(total_costs[1:], total_costs[:-1])

        probabilities = [heat_problem.ensemble_member_probability(i) for i in range(3)]
        obj_calc = sum(probabilities * total_costs)
        #TODO still need to multiply with relevant number of years and technical lifetime.
        # np.testing.assert_allclose(obj_calc/1e6, heat_problem.objective_value)

        #TODO add test, where ates size/aggregation is also fixed. And test where heat producer
        # size is not fixed, but only for geothermal.