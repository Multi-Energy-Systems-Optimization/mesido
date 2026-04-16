from pathlib import Path
from unittest import TestCase

from mesido.esdl.asset_to_component_base import AssetStateEnum
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows import run_end_scenario_sizing_no_heat_losses
from mesido.workflows.endscenariosizing_ensemble import EndScenarioSizingStagedEnsemble

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestEndScenarioSizingEnsemble(TestCase):
    def test_end_scenario_sizing_ensemble(self):
        """
        Check if the EndScenarioSizingStagedEnsemble workflow is behaving as expected. This is an
        optimization done over a full year with timesteps of 5 days and hour timesteps for the peak
        day. With three ensembles, that have different requirements for the realisation depending
        on the heat demand.
        The test checks the objective value, the cost components of assets and if the sizes and
        CAPEX of specific asset types are consistent across all realisations.

        """
        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        run_asset_map = [
            {"_asset_types_fixed_size": ["heat_source", "ates", "heat_buffer"]},
            {"_asset_types_fixed_size": ["geothermal", "ates"]},
        ]
        objective_runs = []
        # TODO: add a run with heatlosses included Staged. Don't do it for all due to the effect
        # on the computational time.
        for config in run_asset_map:
            heat_problem = run_end_scenario_sizing_no_heat_losses(
                EndScenarioSizingStagedEnsemble,
                base_folder=base_folder,
                esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
                esdl_parser=ESDLFileParser,
                profile_reader=ProfileReaderFromFile,
                input_timeseries_file="Warmte_test.csv",
                _asset_types_fixed_size=config["_asset_types_fixed_size"],
                _asset_subtypes_not_included_fixed_size=[],
            )

            results = dict()
            parameters = dict()
            for e_m in range(heat_problem.ensemble_size):
                results[e_m] = heat_problem.extract_results(ensemble_member=e_m)
                parameters[e_m] = heat_problem.parameters(e_m)
                demand_matching_test(heat_problem, results[e_m], ensemble_member=e_m)

                energy_conservation_test(heat_problem, heat_problem.extract_results(e_m))
                heat_to_discharge_test(heat_problem, heat_problem.extract_results(e_m))

            def check_consistent_size_and_costs(
                results, heat_problem, assets, equal_size_assets=True, asset_opex_optional=False
            ):
                inv_costs_source = [0.0] * heat_problem.ensemble_size
                opex_source = [0.0] * heat_problem.ensemble_size
                problem_years = heat_problem._number_of_years
                for prod in assets:
                    if equal_size_assets:
                        prod_size = results[0][f"{prod}__max_size"]
                        prod_aggr_count = results[0][f"{prod}_aggregation_count"]
                    inv_cost_0 = results[0][heat_problem._asset_investment_cost_map[prod]][0]
                    inst_cost_0 = results[0][heat_problem._asset_installation_cost_map[prod]][0]
                    for e_m in range(heat_problem.ensemble_size):
                        inv_cost = results[e_m][heat_problem._asset_investment_cost_map[prod]][0]
                        inst_cost = results[e_m][heat_problem._asset_installation_cost_map[prod]][0]
                        tech_life_time = parameters[e_m][f"{prod}.technical_life"]
                        if equal_size_assets:
                            np.testing.assert_equal(prod_size, results[e_m][f"{prod}__max_size"])
                            np.testing.assert_equal(
                                prod_aggr_count, results[e_m][f"{prod}_aggregation_count"]
                            )
                            np.testing.assert_equal(inv_cost, inv_cost_0)
                            np.testing.assert_equal(inst_cost, inst_cost_0)
                        asset_state = heat_problem.parameters(e_m)[f"{prod}.state"]
                        if asset_state == AssetStateEnum.OPTIONAL:
                            inv_costs_source[e_m] += inv_cost * max(
                                1.0, problem_years / tech_life_time
                            )
                            inv_costs_source[e_m] += inst_cost * max(
                                1.0, problem_years / tech_life_time
                            )
                        if asset_state == AssetStateEnum.OPTIONAL or not asset_opex_optional:
                            opex_source[e_m] += (
                                results[e_m][heat_problem._asset_fixed_operational_cost_map[prod]][
                                    0
                                ]
                                * problem_years
                            )
                            opex_source[e_m] += (
                                results[e_m][
                                    heat_problem._asset_variable_operational_cost_map[prod]
                                ][0]
                                * problem_years
                            )
                return inv_costs_source, opex_source

            heat_demands = heat_problem.energy_system_components.get("heat_demand", [])
            heat_pipes = heat_problem.energy_system_components.get("heat_pipe", [])
            heat_sources = heat_problem.energy_system_components.get("heat_source", [])
            geothermal = heat_problem.energy_system_components.get("geothermal", [])
            buffers = heat_problem.energy_system_components.get("heat_buffer", [])
            ates = heat_problem.energy_system_components.get("ates", [])

            inv_costs_dem, opex_dem = check_consistent_size_and_costs(
                results,
                heat_problem,
                heat_demands,
                equal_size_assets=True,
                asset_opex_optional=True,
            )
            equal_sizes_heat_source = (
                True if "heat_source" in config["_asset_types_fixed_size"] else False
            )
            inv_costs_source, opex_source = check_consistent_size_and_costs(
                results, heat_problem, heat_sources, equal_size_assets=equal_sizes_heat_source
            )
            equal_sizes_geo = True if "geothermal" in config["_asset_types_fixed_size"] else False
            _, _ = check_consistent_size_and_costs(
                results, heat_problem, geothermal, equal_size_assets=equal_sizes_geo
            )
            equal_sizes_heat_buffer = (
                True if "heat_buffer" in config["_asset_types_fixed_size"] else False
            )
            inv_costs_buffer, opex_buffer = check_consistent_size_and_costs(
                results, heat_problem, buffers, equal_size_assets=equal_sizes_heat_buffer
            )
            equal_sizes_ates = True if "ates" in config["_asset_types_fixed_size"] else False
            inv_costs_ates, opex_ates = check_consistent_size_and_costs(
                results, heat_problem, ates, equal_size_assets=equal_sizes_ates
            )

            inv_costs_pipes, opex_pipes = check_consistent_size_and_costs(
                results,
                heat_problem,
                heat_pipes,
                equal_size_assets=False,
                asset_opex_optional=False,
            )
            set_self_hot_pipes = set(heat_problem.hot_pipes)
            for h_p in heat_pipes:
                if h_p in heat_problem._heat_pipe_topo_pipe_class_map.keys():
                    pipe_classes = heat_problem._heat_pipe_topo_pipe_class_map[h_p]
                    for pc in pipe_classes:
                        neighbour = heat_problem.has_related_pipe(h_p)
                        if neighbour and h_p not in set_self_hot_pipes:
                            var_name = (
                                f"{heat_problem.cold_to_hot_pipe(h_p)}__hn_pipe_class_{pc.name}"
                            )
                        else:
                            var_name = f"{h_p}__hn_pipe_class_{pc.name}"
                        pipe_size = []
                        for e_m in range(heat_problem.ensemble_size):
                            pipe_size.append(results[e_m][var_name][0])
                        np.testing.assert_allclose(pipe_size[0], pipe_size)

            capex_total = [
                inv_costs_dem[e_m]
                + inv_costs_source[e_m]
                + inv_costs_buffer[e_m]
                + inv_costs_ates[e_m]
                + inv_costs_pipes[e_m]
                for e_m in range(heat_problem.ensemble_size)
            ]
            opex_total = [
                opex_dem[e_m]
                + opex_source[e_m]
                + opex_buffer[e_m]
                + opex_ates[e_m]
                + opex_pipes[e_m]
                for e_m in range(heat_problem.ensemble_size)
            ]

            total_costs = np.asarray(capex_total) + np.asarray(opex_total)
            # ensure that the total costs for the system capex + opex is the lowest for the system
            # with the lowest demand (e_m=2) and highest for the system with the largest demand
            # (e_m=0)
            np.testing.assert_array_less(total_costs[1:], total_costs[:-1])

            probabilities = [heat_problem.ensemble_member_probability(i) for i in range(3)]
            obj_calc = sum(probabilities * total_costs)

            np.testing.assert_allclose(obj_calc / 1e6, heat_problem.objective_value)
            objective_runs.append(heat_problem.objective_value)

        # checking that the objective value of each next optimization is smaller than the
        # previous one as less assets are fixed in size between the ensembles
        for i in range(len(objective_runs) - 1):
            np.testing.assert_array_less(objective_runs[i + 1], objective_runs[i] + 1e-6)
