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

import numpy as np

from rtctools.util import run_optimization_problem

from utils_tests import demand_matching_test


class TestEndScenarioSizing(TestCase):
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

    def test_end_scenario_sizing(self):
        """
        Check if the EndScenarioSizingHIGHS sizing workflow is behaving as expected. This is an
        optimization done over a full year with timesteps of 5 days and hour timesteps for the peak
        day.

        Checks:
        - demand matching
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
        # Check the cost breakdown, check whether all the enabled assets are in the cost breakdown
        # Check that computation time is within expected bounds

        # Check whehter the heat demand is matched
        demand_matching_test(self.solution, self.results)

        # Check that indeed the available pipe classes were adapted based on expected flow
        # Pipe connected to a demand
        assert self.solution.pipe_classes("Pipe2")[0].name == "DN150"  # initially DN->None
        assert self.solution.pipe_classes("Pipe2")[-1].name == "DN250"  # initially DN450
        # Check that the available pipe classes are also limited for pipes in the return network
        # that do not have the related attribute assigned and are therefore not in the set of
        # self.cold_pipes.
        assert len(self.solution.unrelated_pipes)>=1.0
        assert self.solution.pipe_classes("Pipe2_ret")[0].name == "DN150"  # initially DN->None
        assert self.solution.pipe_classes("Pipe2_ret")[-1].name == "DN250"  # initially DN450
        # Check the minimum velocity setting==default value. Keep the default value hard-coded to
        # prevent future coding bugs
        np.testing.assert_equal(1.0e-4, self.solution.heat_network_settings["minimum_velocity"])

        # Check whether cyclic ates constraint is working
        for a in self.solution.energy_system_components.get("ates", []):
            stored_heat = self.results[f"{a}.Stored_heat"]
            np.testing.assert_allclose(stored_heat[0], stored_heat[-1], atol=1.0)

        # Check whether buffer tank is only active in peak day
        peak_day_indx = self.solution.parameters(0)["peak_day_index"]
        for b in self.solution.energy_system_components.get("heat_buffer", []):
            heat_buffer = self.results[f"{b}.Heat_buffer"]
            for i in range(len(self.solution.times())):
                if i < peak_day_indx or i > (peak_day_indx + 23):
                    np.testing.assert_allclose(heat_buffer[i], 0.0, atol=1.0e-6)

        obj = self.get_objective_value_end_scenario_sizing(self.solution)

        np.testing.assert_allclose(obj / 1.0e6, self.solution.objective_value)

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

        # Check whehter the heat demand is matched
        demand_matching_test(solution_staged, results)

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

        obj = self.get_objective_value_end_scenario_sizing(solution_staged)

        np.testing.assert_allclose(obj / 1.0e6, solution_staged.objective_value)

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

        solution = run_end_scenario_sizing(
            EndScenarioSizingHeadLossStaged,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_all_optional.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
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

    def test_end_scenario_sizing_pipe_catalog(self):
        """
        Checks that the problem uses different pipe costs when a pipe catalog is provided along
        with the ESDL.
        Test 1: Check that the solution pipe classes used were of the pipe templates
        Test 2: Check that the pipe classes generated by instantiating the same problem with
        # different esdl that does not have templates will actually use the original EDR
        # pipe classes. Then we are sure that (rest of the) EDR pipe classes have not been used
        Test 3: If the costs that are used in the problem match the costs from the ESDL Template

        """

        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a few days
        solution = run_end_scenario_sizing(
            EndScenarioSizing,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional_pipe_catalog"
            ".esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        # Test 1: Check if the solution pipe classes used were of the pipe templates
        pipe_templates = solution.filter_asset_templates(solution._esdl_templates, "Pipe")
        pipe_diameter_cost_map = {
            str(pipe.attributes["asset"].diameter): pipe.attributes[
                "asset"
            ].costInformation.investmentCosts.value
            for pipe in pipe_templates.values()
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
        # different esdl that does not have templates will actually use the original EDR
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

        # Test 3: If the costs that are used in the problem match the costs from the ESDL Template
        # Optimized pipe class map of diameter
        optimized_pipe_classes_dia_map = {
            solution.get_optimized_pipe_class(pipe)
            .inner_diameter: solution.get_optimized_pipe_class(pipe)
            .name
            for pipe in solution.hot_pipes
        }
        # Assert that the same specific investment costs have been use between the template and the
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
                cost_map_from_template = pipe_diameter_cost_map[
                    optimized_pipe_classes_dia_map[optimized_diameter]
                ]
                np.testing.assert_allclose(cost_map_from_template, investment_cost_specific)

    def get_objective_value_end_scenario_sizing(self, solution):
        results = solution.extract_results()
        obj = 0.0
        years = solution.parameters(0)["number_of_years"]
        for asset in [
            *solution.energy_system_components.get("heat_source", []),
            *solution.energy_system_components.get("ates", []),
            *solution.energy_system_components.get("heat_buffer", []),
            *solution.energy_system_components.get("heat_demand", []),
            *solution.energy_system_components.get("heat_exchanger", []),
            *solution.energy_system_components.get("heat_pump", []),
            *solution.energy_system_components.get("heat_pipe", []),
        ]:
            # If heating demand asset's state is enabled, then exclude the costs since it is not
            # part of the TCO calculation. This is because we do not size heating demand assets in
            # the optimization
            asset_id = self.solution.esdl_asset_name_to_id_map[asset]
            asset_state = self.solution.esdl_assets[asset_id].attributes["state"]
            asset_type = self.solution.esdl_assets[asset_id].asset_type
            if not (
                (asset_type == "HeatingDemand") and (asset_state == esdl.AssetStateEnum.ENABLED)
            ):
                obj += results[f"{solution._asset_fixed_operational_cost_map[asset]}"] * years
                obj += results[f"{solution._asset_variable_operational_cost_map[asset]}"] * years
                obj += results[f"{solution._asset_investment_cost_map[asset]}"]
                obj += results[f"{solution._asset_installation_cost_map[asset]}"]

        return obj


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestEndScenarioSizing()
    a.setUpClass()
    a.test_end_scenario_sizing()
    a.test_end_scenario_sizing_staged()
    a.test_end_scenario_sizing_discounted()
    a.test_end_scenario_sizing_head_loss()
    a.test_end_scenario_sizing_pipe_catalog()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
