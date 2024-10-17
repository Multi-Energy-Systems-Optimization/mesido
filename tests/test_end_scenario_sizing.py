from pathlib import Path
from unittest import TestCase

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

        obj = 0.0
        years = self.solution.parameters(0)["number_of_years"]
        for asset in [
            *self.solution.energy_system_components.get("heat_source", []),
            *self.solution.energy_system_components.get("ates", []),
            *self.solution.energy_system_components.get("heat_buffer", []),
            *self.solution.energy_system_components.get("heat_demand", []),
            *self.solution.energy_system_components.get("heat_exchanger", []),
            *self.solution.energy_system_components.get("heat_pump", []),
            *self.solution.energy_system_components.get("heat_pipe", []),
        ]:
            obj += self.results[f"{self.solution._asset_fixed_operational_cost_map[asset]}"] * years
            obj += (
                self.results[f"{self.solution._asset_variable_operational_cost_map[asset]}"] * years
            )
            obj += self.results[f"{self.solution._asset_investment_cost_map[asset]}"]
            obj += self.results[f"{self.solution._asset_installation_cost_map[asset]}"]

        np.testing.assert_allclose(obj / 1.0e6, self.solution.objective_value)

    def test_end_scenario_sizing_staged(self):
        """
        Check if the EndScenarioSizingStagedHIGHS workflow is behaving as expected. This is an
        optimization done over a full year with timesteps of 5 days and hour timesteps for the peak
        day.

        Checks:
        - Cyclic behaviour for ATES
        - That buffer tank is only used on peak day
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

        # Check whether buffer tank is only active in peak day
        peak_day_indx = solution_staged.parameters(0)["peak_day_index"]
        for b in solution_staged.energy_system_components.get("heat_buffer", []):
            heat_buffer = results[f"{b}.Heat_buffer"]
            for i in range(len(solution_staged.times())):
                if i < peak_day_indx or i > (peak_day_indx + 23):
                    np.testing.assert_allclose(heat_buffer[i], 0.0, atol=1.0e-6)

        obj = 0.0
        years = solution_staged.parameters(0)["number_of_years"]
        for asset in [
            *solution_staged.energy_system_components.get("heat_source", []),
            *solution_staged.energy_system_components.get("ates", []),
            *solution_staged.energy_system_components.get("heat_buffer", []),
            *solution_staged.energy_system_components.get("heat_demand", []),
            *solution_staged.energy_system_components.get("heat_exchanger", []),
            *solution_staged.energy_system_components.get("heat_pump", []),
            *solution_staged.energy_system_components.get("heat_pipe", []),
        ]:
            obj += results[f"{solution_staged._asset_fixed_operational_cost_map[asset]}"] * years
            obj += results[f"{solution_staged._asset_variable_operational_cost_map[asset]}"] * years
            obj += results[f"{solution_staged._asset_investment_cost_map[asset]}"]
            obj += results[f"{solution_staged._asset_installation_cost_map[asset]}"]

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
        - Cyclic behaviour for ATES
        - That buffer tank is only used on peak day
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
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
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

        # Check whether cyclic ates constraint is working
        for a in solution.energy_system_components.get("ates", []):
            stored_heat = results[f"{a}.Stored_heat"]
            np.testing.assert_allclose(stored_heat[0], stored_heat[-1], atol=1.0)

        # Check whether buffer tank is only active in peak day
        peak_day_indx = solution.parameters(0)["peak_day_index"]
        for b in solution.energy_system_components.get("heat_buffer", []):
            heat_buffer = results[f"{b}.Heat_buffer"]
            for i in range(len(solution.times())):
                if i < peak_day_indx or i > (peak_day_indx + 23):
                    np.testing.assert_allclose(heat_buffer[i], 0.0, atol=1.0e-6)

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
            esdl_file_name="test_case_small_network_with_ates_with_buffer_all_optional.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )

        results = solution.extract_results()

        demand_matching_test(solution, results)

        pipes = solution.energy_system_components.get("heat_pipe")
        for pipe in pipes:
            pipe_diameter = solution.parameters(0)[f"{pipes[0]}.diameter"]
            pipe_wall_roughness = solution.energy_system_options()["wall_roughness"]
            temperature = solution.parameters(0)[f"{pipes[0]}.temperature"]
            pipe_length = solution.parameters(0)[f"{pipes[0]}.length"]
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
                        abs(results[f"{pipe}.dH"][ii]),
                    )


if __name__ == "__main__":
    import time

    start_time = time.time()
    a = TestEndScenarioSizing()
    a.setUpClass()
    a.test_end_scenario_sizing()
    a.test_end_scenario_sizing_staged()
    a.test_end_scenario_sizing_discounted()
    a.test_end_scenario_sizing_head_loss()
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
