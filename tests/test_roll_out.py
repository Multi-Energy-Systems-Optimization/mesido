from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization
from mesido.workflows.rollout_workflow import RollOutProblem

import numpy as np

# from utils_tests import energy_conservation_test
from utils_tests import heat_to_discharge_test


class TestRollOutOptimization(TestCase):

    def test_roll_out_optimization(self):
        """
        Checks:
        - demand matching if placed else demand zero (is_realized variable)
        - heat_to_discharge_test & energy_conservation_test
        - periodiciteit van ATES (end==begin)
        - yearly_storage_initial_value variable implementation (0 when not first timestep of year)
        - yearly max investment
        - to define rollout problem: check that not all heatingdemands are placed in the first
        year, check that all heatingdemands are placed at end of the problem, and both producers
        & ATES.
        - check if integer variables are 0 or 1 for every timestep
        - check number of timesteps in timeseries.
        - if asset placed, also placed for future
        - check fraction is placed
        - check yearly_pipe_length_constraints
        - check if all demands are placed at the end of the simulation
        - check heat buffer constraints


        Missing:
        - Link ATES t0 utilization to state of charge at end of year for optimizations over one
        year.
        """

        # TODO: update location of model also update model & inputfile in run.
        import models.test_case_small_network_ates_buffer_optional_assets.src.run_ates as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over three years with timesteps of 30 days
        class RollOutTimeStep(RollOutProblem):
            # pass
            def read(self):
                super().read()
                # m = [3, 5, 5]
                m = [1, 2, 2]
                for i in range(1, 4):
                    demand_timeseries = self.get_timeseries(f"HeatingDemand_{i}.target_heat_demand")
                    demand_timeseries.values[:] = demand_timeseries.values[:] * m[i - 1]
                    self.set_timeseries(f"HeatingDemand_{i}.target_heat_demand", demand_timeseries)

        solution = run_esdl_mesido_optimization(
            RollOutTimeStep,
            base_folder=base_folder,
            esdl_file_name="PoC_tutorial_incl_ATES_buffer.esdl",
            # esdl_file_name="PoC_tutorial_incl_ATES.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
            yearly_max_capex=7.0e6,
            yearly_max_pipe_length=1.0e3,  # m per year
            include_peak_day=True,
        )
        results = solution.extract_results()

        # tolerance settings for the tests
        atol = 1.0e-1
        rtol = 1.0e-6

        # Demand matching if placed else demand zero (is_realized variable)
        for d in solution.energy_system_components.get("heat_demand", []):
            for y in range(solution._years):
                is_realized = results[f"{d}__asset_is_realized_{y}"]
                if is_realized <= 0.99:
                    # If not placed, demand should be zero
                    np.testing.assert_allclose(
                        results[f"{d}.Heat_demand"][
                            solution._timesteps_per_year
                            * y : solution._timesteps_per_year
                            * (y + 1)
                        ],
                        0.0,
                        atol=atol,
                        rtol=rtol,
                    )
                else:
                    # If placed, demand should match the target heat demand
                    len_times = len(solution.times())

                    target = solution.get_timeseries(f"{d}.target_heat_demand").values[
                        solution._timesteps_per_year * y : len_times
                    ]
                    np.testing.assert_allclose(
                        target,
                        results[f"{d}.Heat_demand"][solution._timesteps_per_year * y : len_times],
                        atol=atol,
                        rtol=rtol,
                    )
                    break  # once an asset is placed it remains placed in the future

        heat_to_discharge_test(solution, results)
        # TODO uncomment once PR 340 is merged and use a slightly relexed tolerance
        # as argument and uncomment next line
        # energy_conservation_test(solution, results)

        assets_to_check = [
            *solution.energy_system_components.get("heat_source", []),
            *solution.energy_system_components.get("heat_demand", []),
            *solution.energy_system_components.get("ates", []),
            *solution.energy_system_components.get("heat_pipe", []),
        ]

        for asset in assets_to_check:
            # Check if integer variables are 0 or 1
            for y in range(solution._years):
                asset_is_realized = results[f"{asset}__asset_is_realized_{y}"]
                np.testing.assert_(
                    np.isclose(asset_is_realized, 0, atol=atol)
                    or np.isclose(asset_is_realized, 1, atol=atol),
                    f"{asset}__asset_is_realized_{y} should be 0 or 1",
                )

            # If asset placed, also placed for future
            for y in range(solution._years - 1):
                asset_is_realized = results[f"{asset}__asset_is_realized_{y}"]
                next_asset_is_realized = results[f"{asset}__asset_is_realized_{y + 1}"]
                tol = 1e-6
                np.testing.assert_(
                    asset_is_realized <= next_asset_is_realized + tol,
                    f"{asset}__asset_is_realized_{y} should be <=\
                        {asset}__asset_is_realized_{y + 1}",
                )

        # Check yearly max investment constraint
        cumulative_prev_year = 0
        for y in range(solution._years):
            cumulative_capex = 0
            cumulative_capex += sum(
                results[f"{asset}__cumulative_investments_made_in_eur_year_{y}"]
                for asset in assets_to_check
            )
            np.testing.assert_(
                cumulative_capex - cumulative_prev_year <= solution._years_timestep_max_capex + tol,
                f"yearly capex {cumulative_capex - cumulative_prev_year}\
                should be <= maximum yearly investment {solution._years_timestep_max_capex}\
                for year {y}",
            )
            cumulative_prev_year = cumulative_capex

        # check number of timesteps in timeseries.
        np.testing.assert_equal(
            len(solution.times()),
            solution._timesteps_per_year * solution._years + 1,
            "Number of timesteps in timeseries is not correct",
        )

        # Yearly periodicity of ATES
        for ates in solution.energy_system_components.get("ates", []):
            times = solution.times() / 3600 / 24
            for i in range(len(times) - 1):
                if i % solution._timesteps_per_year == 0:
                    np.testing.assert_allclose(
                        results[f"{ates}.Stored_heat"][i],
                        results[f"{ates}.Stored_heat"][i + solution._timesteps_per_year - 1],
                        atol=atol,
                        rtol=rtol,
                    )

        #  Storage_yearly_change variable should be 0 when not first timestep of year
        for ates in solution.energy_system_components.get("ates", []):
            times = solution.times() / 3600 / 24
            for i in range(len(times)):
                if i % solution._timesteps_per_year != 0:
                    np.testing.assert_allclose(
                        results[f"{ates}.Storage_yearly_change"][i],
                        0.0,
                        atol=atol,
                        rtol=rtol,
                    )

        # Check if it is not a trivial roll-out problem, i.e. not all heating demands
        # are placed in the first year
        not_placed_in_first_year = any(
            results[f"{d}__asset_is_realized_0"] == 0
            for d in solution.energy_system_components.get("heat_demand", [])
        )
        np.testing.assert_(
            not_placed_in_first_year,
            "Trivial roll-out problem: all heating demands are placed in the first year",
        )

        # Check if all heating demands are placed at the end of the problem
        all_placed_at_end = all(
            results[f"{d}__asset_is_realized_{solution._years - 1}"] == 1
            for d in solution.energy_system_components.get("heat_demand", [])
        )
        np.testing.assert_(
            all_placed_at_end,
            "Not all heating demands are placed at the end of the problem",
        )

        # Check if all producers and ATES are placed at the end of the problem
        all_producers_placed = all(
            results[f"{asset}__asset_is_realized_{solution._years - 1}"] >= 1 - tol
            for asset in [
                *solution.energy_system_components.get("heat_source", []),
                *solution.energy_system_components.get("ates", []),
            ]
        )
        np.testing.assert_(
            all_producers_placed,
            "Not all producers and ATES are placed at the end of the problem",
        )

        # Check fraction is placed, should be between 0 and 1 and increasing
        tol = 1e-6
        for asset in assets_to_check:
            for y in range(solution._years):
                asset_fraction_placed = results[f"{asset}__fraction_placed_{y}"]
                np.testing.assert_(
                    0 - tol <= asset_fraction_placed <= 1 + tol, "Value is not between 0 and 1"
                )
                if y < solution._years - 1:
                    next_asset_fraction_placed = results[f"{asset}__fraction_placed_{y + 1}"]
                    np.testing.assert_(
                        asset_fraction_placed <= next_asset_fraction_placed + tol,
                        f"{asset}__fraction_placed_{y} should be <=\
                            {asset}__fraction_placed_{y + 1}",
                    )
            for y in range(solution._years - 1):
                asset_is_realized = results[f"{asset}__asset_is_realized_{y}"]
                next_asset_is_realized = results[f"{asset}__asset_is_realized_{y + 1}"]
                np.testing.assert_(
                    asset_is_realized <= next_asset_is_realized + tol,
                    f"{asset}__asset_is_realized{y} should be <= {asset}__asset_is_realized{y + 1}",
                )

        # Check yearly_pipe_length_constraints
        allowed_length = solution._yearly_max_pipe_length * solution._horizon / solution._years
        total_length = 0
        for y in range(solution._years):
            cumulative_pipe_length = 0
            for p in solution.energy_system_components.get("heat_pipe", []):
                pipe_is_realized = results[f"{p}__asset_is_realized_{y}"]
                pipe_length = solution.parameters(0)[f"{p}.length"]
                cumulative_pipe_length += pipe_is_realized * pipe_length
            used_length_year = cumulative_pipe_length - total_length
            total_length += used_length_year
            print(used_length_year)
            np.testing.assert_(
                used_length_year <= allowed_length,
                f"Yearly pipe length constraint violated in year {y}:\
                    used {used_length_year}, allowed {allowed_length}",
            )

        # Check if all demands placed
        for d in solution.energy_system_components.get("heat_demand", []):
            np.testing.assert_(
                np.isclose(results[f"{d}__asset_is_realized_{solution._years -1}"], 1, atol=atol),
                f"{d} is not placed at the end of the simulation",
            )

        # Heat buffer peak day constraints
        for b in solution.energy_system_components.get("heat_buffer", {}):
            used_buffer = False
            for year in range(solution._years):
                for i in range(solution._timesteps_per_year):
                    if not (
                        i > solution._RollOutProblem__problem_indx_max_peak - 1
                        and i < (solution._RollOutProblem__problem_indx_max_peak + 23 + 1)
                    ):
                        np.testing.assert_allclose(
                            results[f"{b}.Stored_heat"][i + year * solution._timesteps_per_year],
                            0.0,
                            atol=atol,
                            rtol=rtol,
                        )
                        if not i == 0 and not year == 0:
                            np.testing.assert_allclose(
                                results[f"{b}.Heat_buffer"][
                                    i + year * solution._timesteps_per_year
                                ],
                                0.0,
                                atol=atol,
                                rtol=rtol,
                            )
                    else:
                        if (
                            results[f"{b}.Heat_buffer"][i + year * solution._timesteps_per_year]
                            > 1e3
                        ):
                            used_buffer = True

            np.testing.assert_(
                used_buffer, f"{b} Heat buffer has not been used in the entire problem"
            )

        # rollout_post(solution, results)
