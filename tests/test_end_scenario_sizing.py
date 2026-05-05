from pathlib import Path
from unittest import TestCase

import esdl

import mesido._darcy_weisbach as darcy_weisbach
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows import (
    EndScenarioSizing,
    EndScenarioSizingDiscounted,
    EndScenarioSizingStaged,
    run_end_scenario_sizing,
)
from mesido.workflows.grow_workflow import EndScenarioSizingHeadLossStaged
from mesido.workflows.utils.error_types import NetworkErrors

import numpy as np

from rtctools.util import run_optimization_problem

from utils_tests import cost_calculation_test, demand_matching_test


class TestEndScenarioSizing(TestCase):

    def test_heat_exchanger_sizing(self):
        """
        Check heat exchanger can be sized in EndScenarioSizingStaged problem.
        After optimization asset state and capacity attributes are changed.

        Checks:
        - max_size variable of the asset is calculated
        - heat exchanger state attribute is changed
        - heat exchanger capacity attribute is updated
        """
        import models.heat_exchange.src.run_heat_exchanger as run_heat_exchanger

        base_folder = Path(run_heat_exchanger.__file__).resolve().parent.parent

        solution = run_end_scenario_sizing(
            EndScenarioSizingStaged,
            base_folder=base_folder,
            esdl_file_name="heat_exchanger_with_costs.esdl",
            esdl_parser=ESDLFileParser,
        )
        results = solution.extract_results()
        name_to_id_map = solution.esdl_asset_name_to_id_map

        hex_id = name_to_id_map["HeatExchange_39ed"]

        # Check heat exchanger is sized
        np.testing.assert_allclose(
            max(results[f"{hex_id}.Secondary_heat"]), results[f"{hex_id}__max_size"]
        )

        # Check heat exchanger state attribute is changed from OPTIONAL
        # to ENABLED after the optimization
        energy_system = solution._ESDLMixin__energy_system_handler.energy_system
        asset = solution._id_to_asset(energy_system, hex_id)
        np.testing.assert_equal(esdl.AssetStateEnum.ENABLED, asset.state)

        # Check heat exchanger capacity attribute is updated
        # with max_size variable after the optimization
        np.testing.assert_allclose(results[f"{hex_id}__max_size"], asset.capacity)

    @classmethod
    def setUpClass(cls) -> None:
        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a full year with timesteps of 5 days and hour timesteps
        # for the peak day
        cls.solution = run_optimization_problem(
            EndScenarioSizing,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )
        cls.results = cls.solution.extract_results()
        cls.name_to_id_map = cls.solution.esdl_asset_name_to_id_map

    def test_end_scenario_sizing(self):
        """
        Check if the EndScenarioSizingHIGHS sizing workflow is behaving as expected. This is an
        optimization done over a full year with timesteps of 5 days and hour timesteps for the peak
        day.

        Checks:
        - demand matching
        - cost components
        - that the available pipe classes were adapted
        - minimum velocity setting
        - Cyclic behaviour for ATES
        - That buffer tank is only used on peak day
        - Check if TCO goal included the desired cost components.


        Missing:
        - Link ATES t0 utilization to state of charge at end of year for optimizations over one
        year.
        """

        # In the future we want to check the following
        # Is the timeline correctly converted, correct peak day, correct amount of timesteps, etc.
        # Check whether expected assets are disabled
        # Check the optimal size of assets
        # Check that computation time is within expected bounds

        name_to_id_map = self.solution.esdl_asset_name_to_id_map
        hp_1_id = name_to_id_map["HeatProducer_1"]
        hp_2_id = name_to_id_map["HeatProducer_2"]
        a_id = name_to_id_map["ATES_033c"]
        ht_id = name_to_id_map["HeatStorage_74c1"]
        hd_1_id = name_to_id_map["HeatingDemand_1"]
        hd_2_id = name_to_id_map["HeatingDemand_2"]
        hd_3_id = name_to_id_map["HeatingDemand_3"]

        # Check whehter the heat demand is matched
        demand_matching_test(self.solution, self.results)

        # Check the cost calculations
        np.testing.assert_array_less(1e3, self.results[f"{hp_1_id}__investment_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{hp_1_id}__installation_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{hp_2_id}__investment_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{hp_2_id}__installation_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{hp_2_id}__variable_operational_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{a_id}__investment_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{a_id}__installation_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{a_id}__variable_operational_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{ht_id}__investment_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{ht_id}__installation_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{hd_1_id}__installation_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{hd_2_id}__installation_cost"])
        np.testing.assert_array_less(1e3, self.results[f"{hd_3_id}__installation_cost"])
        for pipe_id in self.solution.energy_system_components.get("heat_pipe", []):
            np.testing.assert_array_less(1e3, self.results[f"{pipe_id}__investment_cost"])
        cost_calculation_test(self.solution, self.results, check_objective_function=True)

        # Check that indeed the available pipe classes were adapted based on expected flow
        # Pipe connected to a demand
        assert self.solution.pipe_classes("Pipe2")[0].name == "DN150"  # initially DN->None
        assert self.solution.pipe_classes("Pipe2")[-1].name == "DN250"  # initially DN450
        # Check that the available pipe classes are also limited for pipes in the return network
        # that do not have the related attribute assigned and are therefore not in the set of
        # self.cold_pipes.
        assert len(self.solution.unrelated_pipes) >= 1.0
        assert self.solution.pipe_classes("Pipe2_ret")[0].name == "DN150"  # initially DN->None
        assert self.solution.pipe_classes("Pipe2_ret")[-1].name == "DN250"  # initially DN450
        # Check the minimum velocity setting==default value. Keep the default value hard-coded to
        # prevent future coding bugs
        np.testing.assert_equal(1.0e-4, self.solution.heat_network_settings["minimum_velocity"])

        # Check whether cyclic ates constraint is working and split between the charging and
        # discharging heat_flow variables
        for a_id in self.solution.energy_system_components.get("ates", []):
            stored_heat = self.results[f"{a_id}.Stored_heat"]
            np.testing.assert_allclose(stored_heat[0], stored_heat[-1], atol=1.0)
            heat_ates = self.results[f"{a_id}.Heat_ates"]
            heat_flow_charging = self.results[f"{a_id}.Heat_flow_charging"]
            heat_flow_discharging = self.results[f"{a_id}.Heat_flow_discharging"]
            np.testing.assert_allclose(
                heat_ates, heat_flow_charging - heat_flow_discharging, atol=1.0
            )
            np.testing.assert_array_less(heat_flow_charging[heat_flow_discharging > 1e3], 1e3)

        # Check whether buffer tank is only active in peak day
        peak_day_indx = self.solution.parameters(0)["peak_day_index"]
        for b_id in self.solution.energy_system_components.get("heat_buffer", []):
            heat_buffer = self.results[f"{b_id}.Heat_buffer"]
            for i in range(len(self.solution.times())):
                if i < peak_day_indx or i > (peak_day_indx + 23):
                    np.testing.assert_allclose(heat_buffer[i], 0.0, atol=1.0e-6)
            heat_flow_charging = self.results[f"{b_id}.Heat_flow_charging"]
            heat_flow_discharging = self.results[f"{b_id}.Heat_flow_discharging"]
            np.testing.assert_allclose(
                heat_buffer, heat_flow_charging - heat_flow_discharging, atol=1.0
            )

    def test_end_scenario_sizing_staged(self):
        """
        Check if the EndScenarioSizingStagedHIGHS workflow is behaving as expected. This is an
        optimization done over a full year with timesteps of 5 days and hour timesteps for the peak
        day.

        Checks:
        - Cyclic behaviour for ATES
        - ATES is placed and that the size matches a single doublet, which is larger than the max
        heat_flow
        - That buffer tank is placed and only used on peak day
        - demand matching
        - Check if TCO goal included the desired cost components.

        - Compare objective value of staged approach wit non-staged approach

        Compare solution time of 3 scenarios on how to run the optimisation:
        - Staged approach should be solved faster than the unstaged approaches
        - Unstaged approaches, using the general function run_optimization_problem and the
        function run_end_scenario_sizing with staged_pipe_optimization to False should have
        comparable computation times.


        Missing:
        - Link ATES t0 utilization to state of charge at end of year for optimizations over one
        year.
        """
        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a full year with timesteps of 5 days and hour timesteps
        # for the peak day

        solution_unstaged = self.solution

        solution_unstaged_2 = run_end_scenario_sizing(
            EndScenarioSizing,
            staged_pipe_optimization=False,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        solution_staged = run_end_scenario_sizing(
            EndScenarioSizingStaged,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = solution_staged.extract_results()

        name_to_id_map = solution_staged.esdl_asset_name_to_id_map
        hp_1_id = name_to_id_map["HeatProducer_1"]
        hp_2_id = name_to_id_map["HeatProducer_2"]
        a_id = name_to_id_map["ATES_033c"]
        ht_id = name_to_id_map["HeatStorage_74c1"]
        hd_1_id = name_to_id_map["HeatingDemand_1"]
        hd_2_id = name_to_id_map["HeatingDemand_2"]
        hd_3_id = name_to_id_map["HeatingDemand_3"]

        # Check whehter the heat demand is matched
        demand_matching_test(solution_staged, results)

        # Check the cost calculations
        np.testing.assert_array_less(1e3, results[f"{hp_1_id}__investment_cost"])
        np.testing.assert_array_less(1e3, results[f"{hp_1_id}__installation_cost"])
        np.testing.assert_array_less(1e3, results[f"{hp_2_id}__investment_cost"])
        np.testing.assert_array_less(1e3, results[f"{hp_2_id}__installation_cost"])
        np.testing.assert_array_less(1e3, results[f"{hp_2_id}__variable_operational_cost"])
        np.testing.assert_array_less(1e3, results[f"{a_id}__investment_cost"])
        np.testing.assert_array_less(1e3, results[f"{a_id}__installation_cost"])
        np.testing.assert_array_less(1e3, results[f"{a_id}__variable_operational_cost"])
        np.testing.assert_array_less(1e3, results[f"{ht_id}__investment_cost"])
        np.testing.assert_array_less(1e3, results[f"{ht_id}__installation_cost"])
        np.testing.assert_array_less(1e3, results[f"{hd_1_id}__installation_cost"])
        np.testing.assert_array_less(1e3, results[f"{hd_2_id}__installation_cost"])
        np.testing.assert_array_less(1e3, results[f"{hd_3_id}__installation_cost"])
        for pipe_id in solution_staged.energy_system_components.get("heat_pipe", []):
            np.testing.assert_array_less(1e3, results[f"{pipe_id}__investment_cost"])
        cost_calculation_test(solution_staged, results, check_objective_function=True)

        # Check whether cyclic ates constraint is working
        for a in solution_staged.energy_system_components.get("ates", []):
            stored_heat = results[f"{a}.Stored_heat"]
            np.testing.assert_allclose(stored_heat[0], stored_heat[-1], atol=1.0)

        # Check that the ATES is placed and that the size should match the single_doublet_power
        np.testing.assert_allclose(
            results[f"{a}__max_size"],
            self.solution.parameters(0)[f"{a}.single_doublet_power"],
        )
        np.testing.assert_array_less(max(results[f"{a}.Heat_flow"]), results[f"{a}__max_size"])
        np.testing.assert_allclose(results[f"{a}_aggregation_count"], 1)

        # Check whether buffer tank placed and that it is only active in peak day
        peak_day_indx = int(solution_staged.parameters(0)["peak_day_index"])
        for b in solution_staged.energy_system_components.get("heat_buffer", []):
            np.testing.assert_allclose(results[f"{b}_aggregation_count"], 1)  # being placed
            np.testing.assert_array_less(
                1.0e3, max(results[f"{b}.Heat_flow"][peak_day_indx : peak_day_indx + 24])
            )  # at least 1 time step with such a heat_flow is expected in this network
            heat_buffer = results[f"{b}.Heat_buffer"]
            for i in range(len(solution_staged.times())):
                if i < peak_day_indx or i > (peak_day_indx + 23):
                    np.testing.assert_allclose(heat_buffer[i], 0.0, atol=1.0e-6)

        # comparing results of staged and unstaged problem definition. For larger systems there
        # might be a difference in the value but that would either be a difference within the
        # MIPgap (thus checking best bound objective is still smaller or equal than objective of
        # the other problem) or because of some tighter constraints in the staged problem e.g.
        # staged problem slightly higher objective value
        if (
            solution_staged.solver_stats["mip_gap"] == 0.0
            and solution_unstaged.solver_stats["mip_gap"] == 0.0
        ):
            np.testing.assert_allclose(
                solution_staged.objective_value, solution_unstaged.objective_value
            )
        else:
            np.testing.assert_array_less(
                solution_unstaged._priorities_output[1][4]["mip_dual_bound"] - 1e-6,
                solution_staged.objective_value,
            )
            np.testing.assert_array_less(
                solution_staged._priorities_output[3][4]["mip_dual_bound"] - 1e-6,
                solution_unstaged.objective_value,
            )
        # checking time spend on optimisation approaches, the difference between the two unstaged
        # approaches should be smaller than the difference with the staged and unstaged approach.
        # The staged approach should be quickest in solving. The two unstaged approaches should
        # have comparable computation time.
        solution_time_unstaged = sum([i[1] for i in solution_unstaged._priorities_output])
        solution_time_unstaged_2 = sum([i[1] for i in solution_unstaged_2._priorities_output])
        solution_time_staged = sum([i[1] for i in solution_staged._priorities_output])
        np.testing.assert_array_less(
            abs(solution_time_unstaged_2 - solution_time_unstaged),
            abs(solution_time_staged - solution_time_unstaged),
        )
        np.testing.assert_array_less(solution_time_staged, solution_time_unstaged)

    def test_end_scenario_sizing_discounted(self):
        """
        Check if the TestEndScenario sizing workflow is behaving as expected. This is an
        optimization done over a full year with timesteps of 5 days and hour timesteps for the peak
        day.

        Checks:
        - demand matching

        Missing:
        - Check if TCO goal included the desired cost components.

        """
        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        class TestEndScenarioSizingDiscountedHIGHS(EndScenarioSizingDiscounted):
            def solver_options(self):
                options = super().solver_options()
                options["solver"] = "highs"
                highs_options = options["highs"] = {}
                highs_options["mip_rel_gap"] = 0.05
                return options

        # This is an optimization done over a full year with timesteps of 5 days and hour timesteps
        # for the peak day
        solution = run_optimization_problem(
            TestEndScenarioSizingDiscountedHIGHS,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_all_optional.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
            error_type_check=NetworkErrors.NO_POTENTIAL_ERRORS_CHECK,  # Pass the error type here
        )

        results = solution.extract_results()
        # In the future we want to check the following
        # Is the timeline correctly converted, correct peak day, correct amount of timesteps, etc.
        # Check whether expected assets are disabled
        # Check the optimal size of assets
        # Check the cost breakdown, check whether all the enabled assets are in the cost breakdown
        # Check that computation time is within expected bounds

        # Check whether the heat demand is matched
        demand_matching_test(solution, results)

    def test_end_scenario_sizing_head_loss(self):
        """
        Test is EndScenarioSizingHeadLoss class is behaving as expected. E.g. should behave
        similarly to EndScenarioSizing class but now the linearised inequality Darcy Weisbach
        equations should be included for the head loss.

        Checks:
        - objective (TCO) same order of magnitude
        - head loss is calculated, currently only checked if it is equal or larger than the
        DW head_loss
        """

        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        class EndScenarioSizingHeadLossStagedNLines(EndScenarioSizingHeadLossStaged):
            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)

                self.heat_network_settings["n_linearization_lines"] = 3

        solution = run_end_scenario_sizing(
            EndScenarioSizingHeadLossStagedNLines,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_all_optional.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
            error_type_check=NetworkErrors.NO_POTENTIAL_ERRORS_CHECK,  # Pass the error type here
        )

        results = solution.extract_results()

        demand_matching_test(solution, results)

        tol = 1.0e-9
        pipes = solution.energy_system_components.get("heat_pipe")
        for pipe in pipes:
            pipe_diameter = solution.parameters(0)[f"{pipe}.diameter"]
            pipe_wall_roughness = solution.energy_system_options()["wall_roughness"]
            temperature = solution.parameters(0)[f"{pipe}.temperature"]
            pipe_length = solution.parameters(0)[f"{pipe}.length"]
            if pipe_diameter > 0.0:
                velocities = results[f"{pipe}.Q"] / solution.parameters(0)[f"{pipe}.area"]
            else:
                velocities = results[f"{pipe}.Q"]  # should be zero
            for ii in range(len(results[f"{pipe}.dH"])):
                if velocities[ii] > 0 and pipe_diameter > 0:
                    np.testing.assert_array_less(
                        darcy_weisbach.head_loss(
                            velocities[ii],
                            pipe_diameter,
                            pipe_length,
                            pipe_wall_roughness,
                            temperature,
                        ),
                        abs(results[f"{pipe}.dH"][ii]) + tol,
                    )

    def test_end_scenario_sizing_pipe_catalog_lower_pipe_dn(self):
        """
        Check that the temporary implementation of allowing the reduction of the lower pipe limit
        via measures
        """

        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        class ReducedDemandProblem(EndScenarioSizing):
            def read(self):
                super().read()

                # Reduce the heating demand to allwo usage of smaller pipes
                for d in self.energy_system_components["heat_demand"]:
                    target = self.get_timeseries(f"{d}.target_heat_demand")
                    target.values[:] = target.values[:] / 1.0e2

                    self.io.set_timeseries(
                        f"{d}.target_heat_demand",
                        self.io._DataStore__timeseries_datetimes,
                        target.values,
                        0,
                    )

        solution = run_end_scenario_sizing(
            ReducedDemandProblem,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_all_optional_pipe_catalog_pipe_DN.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
            error_type_check=NetworkErrors.NO_POTENTIAL_ERRORS_CHECK,
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        # Check min DN in the available pipe classes and the resulting pipe size
        pipes_to_check = ["Pipe2", "Pipe2_ret", "Pipe4", "Pipe4_ret"]  # user input minimum DN
        for pipe in solution.energy_system_components.get("heat_pipe"):
            available_pipe_classes = solution.pipe_classes(pipe)

            if pipe in pipes_to_check:
                np.testing.assert_equal(available_pipe_classes[0].name == "DN40", True)
                np.testing.assert_equal(parameters[f"{pipe}.diameter"], 0.0431)
                np.testing.assert_equal(results[f"{pipe}__hn_diameter"], 0.0431)
            elif pipe not in ["Pipe1", "Pipe1_ret"]:  # this Pipe1 is not placed
                if available_pipe_classes[0].name == "None":
                    np.testing.assert_equal(available_pipe_classes[1].name == "DN50", True)
                else:
                    np.testing.assert_equal(available_pipe_classes[0].name == "DN50", True)
                np.testing.assert_allclose(parameters[f"{pipe}.diameter"], 0.0545, atol=1e-6)
                np.testing.assert_allclose(results[f"{pipe}__hn_diameter"], 0.0545, atol=1e-6)

    def test_end_scenario_sizing_pipe_catalog(self):
        """
        Checks that the problem uses different pipe costs when a pipe catalog is provided along
        with the ESDL.
        Test 1: Check that the solution pipe classes used were of the pipe measures
        Test 2: Check that the pipe classes generated by instantiating the same problem with
        # different esdl that does not have measures will actually use the original EDR
        # pipe classes. Then we are sure that (rest of the) EDR pipe classes have not been used
        Test 3: If the costs that are used in the problem match the costs from the ESDL Measures

        """

        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a few days
        solution = run_end_scenario_sizing(
            EndScenarioSizing,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_all_optional_pipe_catalog.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
            error_type_check=NetworkErrors.NO_POTENTIAL_ERRORS_CHECK,
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        # Test 1: Check if the solution pipe classes used were of the pipe measures
        filter_type = "Pipe"
        pipe_measures = solution.filter_asset_measures(solution._esdl_measures, filter_type)
        pipe_diameter_cost_map = {
            str(pipe.diameter): pipe.costInformation.investmentCosts.value
            for pipe in pipe_measures.values()
        }
        solution_pipe_classes = solution.get_unique_pipe_classes()
        solution_pipe_class_cost_map = {
            sol_pipe.name: sol_pipe.investment_costs
            for sol_pipe in solution_pipe_classes
            if not sol_pipe.name == "None"
        }
        np.testing.assert_equal(
            solution_pipe_class_cost_map.items() <= pipe_diameter_cost_map.items(), True
        )

        # Test 2: Check that the pipe classes generated by instantiating the same problem with
        # different esdl that does not have measures will actually use the original EDR
        # pipe classes. Then we are sure that (rest of the) EDR pipe classes have not been used
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"
        original_problem = EndScenarioSizingStaged(
            esdl_parser=ESDLFileParser,
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
            error_type_check=NetworkErrors.NO_POTENTIAL_ERRORS_CHECK,
        )
        original_problem.pre()
        original_problem_pipe_classes = original_problem.get_unique_pipe_classes()
        original_problem_pipe_class_cost_map = {
            org_pipe.name: org_pipe.investment_costs
            for org_pipe in original_problem_pipe_classes
            if not org_pipe.name == "None"
        }
        np.testing.assert_equal(
            solution_pipe_class_cost_map.items() != original_problem_pipe_class_cost_map.items(),
            True,
        )

        # Test 3: If the costs that are used in the problem match the costs from the ESDL Measures
        # Optimized pipe class map of diameter
        optimized_pipe_classes_dia_map = {
            solution.get_optimized_pipe_class(pipe)
            .inner_diameter: solution.get_optimized_pipe_class(pipe)
            .name
            for pipe in [*solution.hot_pipes, *solution.unrelated_pipes]
        }
        # Assert that the same specific investment costs have been use between the measure and the
        # solution parameters
        for heat_pipe in solution.energy_system_components.get("heat_pipe"):
            # Check only if the pipe exits. Cost of 0 means the asset has been removed as a result
            # of the sizing optimization
            if results[f"{solution._asset_investment_cost_map[heat_pipe]}"] > 1.0:
                investment_cost_specific = (
                    results[f"{solution._asset_investment_cost_map[heat_pipe]}"][0]
                    / parameters[f"{heat_pipe}.length"]
                )  # [Eur/m]
                optimized_diameter = parameters[f"{heat_pipe}.diameter"]
                cost_map_from_measures = pipe_diameter_cost_map[
                    optimized_pipe_classes_dia_map[optimized_diameter]
                ]
                np.testing.assert_allclose(cost_map_from_measures, investment_cost_specific)

    def test_end_scenario_sizing_pipe_catalog_with_templates(self):
        """
        This test is a temporary. This checks that current implementation that reads and
        processes pipe measures can also reads and processes pipe templates.
        """

        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a few days
        solution = run_end_scenario_sizing(
            EndScenarioSizing,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_all_optional_pipe_catalog_with_templates.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
            error_type_check=NetworkErrors.NO_POTENTIAL_ERRORS_CHECK,
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        # Test 1: Check if the solution pipe classes used were of the pipe measures
        pipe_measures = solution.filter_asset_measures(solution._esdl_measures, "Pipe")
        pipe_diameter_cost_map = {
            str(pipe.diameter): pipe.costInformation.investmentCosts.value
            for pipe in pipe_measures.values()
        }
        solution_pipe_classes = solution.get_unique_pipe_classes()
        solution_pipe_class_cost_map = {
            sol_pipe.name: sol_pipe.investment_costs
            for sol_pipe in solution_pipe_classes
            if not sol_pipe.name == "None"
        }
        np.testing.assert_equal(
            solution_pipe_class_cost_map.items() <= pipe_diameter_cost_map.items(), True
        )

        # Test 2: Check that the pipe classes generated by instantiating the same problem with
        # different esdl that does not have measures will actually use the original EDR
        # pipe classes. Then we are sure that (rest of the) EDR pipe classes have not been used
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"
        original_problem = EndScenarioSizingStaged(
            esdl_parser=ESDLFileParser,
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
            error_type_check=NetworkErrors.NO_POTENTIAL_ERRORS_CHECK,
        )
        original_problem.pre()
        original_problem_pipe_classes = original_problem.get_unique_pipe_classes()
        original_problem_pipe_class_cost_map = {
            org_pipe.name: org_pipe.investment_costs
            for org_pipe in original_problem_pipe_classes
            if not org_pipe.name == "None"
        }
        np.testing.assert_equal(
            solution_pipe_class_cost_map.items() != original_problem_pipe_class_cost_map.items(),
            True,
        )

        # Test 3: If the costs that are used in the problem match the costs from the ESDL Measures
        # Optimized pipe class map of diameter
        optimized_pipe_classes_dia_map = {
            solution.get_optimized_pipe_class(pipe)
            .inner_diameter: solution.get_optimized_pipe_class(pipe)
            .name
            for pipe in solution.hot_pipes
        }
        # Assert that the same specific investment costs have been use between the measure and the
        # solution parameters
        for heat_pipe in solution.energy_system_components.get("heat_pipe"):
            # Check only if the pipe exits. Cost of 0 means the asset has been removed as a result
            # of the sizing optimization
            if results[f"{solution._asset_investment_cost_map[heat_pipe]}"] > 1.0:
                investment_cost_specific = (
                    results[f"{solution._asset_investment_cost_map[heat_pipe]}"][0]
                    / parameters[f"{heat_pipe}.length"]
                )  # [Eur/m]
                optimized_diameter = parameters[f"{heat_pipe}.diameter"]
                cost_map_from_measures = pipe_diameter_cost_map[
                    optimized_pipe_classes_dia_map[optimized_diameter]
                ]
                np.testing.assert_allclose(cost_map_from_measures, investment_cost_specific)


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestEndScenarioSizing()
    a.setUpClass()
    a.test_end_scenario_sizing()
    a.test_end_scenario_sizing_staged()
    a.test_end_scenario_sizing_discounted()
    a.test_end_scenario_sizing_head_loss()
    a.test_end_scenario_sizing_pipe_catalog_lower_pipe_dn()
    a.test_end_scenario_sizing_pipe_catalog()
    a.test_end_scenario_sizing_pipe_catalog_with_templates()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
