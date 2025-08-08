from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.rollout_workflow import RollOutProblem
from rtctools.util import run_optimization_problem
from utils_tests import energy_conservation_test, heat_to_discharge_test
import numpy as np


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


        Missing:
        - Link ATES t0 utilization to state of charge at end of year for optimizations over one
        year.
        """
        
        #TODO: update location of model also update model & inputfile in run.
        import models.test_case_small_network_with_ates_with_buffer.src.run_ates \
            as run_ates

        base_folder = Path(run_ates.__file__).resolve().parent.parent

        # This is an optimization done over a full year with timesteps of 5 days and hour timesteps
        # for the peak day
        class RollOutTimeStep(RollOutProblem):
            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)

                self._timestep_size = 20 * 24

        solution = run_optimization_problem(
            RollOutTimeStep,
            base_folder=base_folder,
            esdl_file_name="test_case_small_network_with_ates_with_buffer.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test.csv",
        )
        results = solution.extract_results()

        # Demand matching if placed else demand zero (is_realized variable)
        for d in solution.energy_system_components.get("heat_demand", []):
            for y in range(solution._years):
                is_realized = results[f"{d}__asset_is_realized_{y}"] 
                if is_realized == 0:
                    # If not placed, demand should be zero
                    np.testing.assert_allclose(results[f"{d}.Heat_demand"][solution._days * y : solution._days * (y + 1)], 0.0, atol=1.0e-3, rtol=1.0e-6)
                else:
                    # If placed, demand should match the target heat demand
                    if len(solution.times()) > 0:
                        len_times = len(solution.times())
                    else:
                        len_times = len(solution.get_timeseries(f"{d}.target_heat_demand").values)
                    target = solution.get_timeseries(f"{d}.target_heat_demand").values[solution._days * y : len_times]
                    np.testing.assert_allclose(target, results[f"{d}.Heat_demand"][solution._days * y : len_times], atol=1.0e-3, rtol=1.0e-6)
                    break # once an asset is placed it remains placed in the future 

        # heat_to_discharge_test(solution, results)
        energy_conservation_test(solution, results)
     
        for asset in [
            *solution.energy_system_components.get("heat_source", []),                
            *solution.energy_system_components.get("heat_demand", []), 
            *solution.hot_pipes,
            *solution.energy_system_components.get("ates", []), 
        ]:  
            # Check if integer variables are 0 or 1
            for y in range(solution._years):
                is_placed = results[f"{asset}__is_placed_{y}"] # is this variable used?
                asset_is_realized = results[f"{asset}__asset_is_realized_{y}"]
                # this fales variables are not integers
                # np.testing.assert_(is_placed in [0, 1], f"{asset}__is_placed_{y} should be 0 or 1")
                # np.testing.assert_(asset_is_realized in [0, 1], f"{asset}__asset_is_realized_{y} should be 0 or 1")
                
                np.testing.assert_(np.isclose(is_placed, 0, atol=1.0e-6) or np.isclose(is_placed, 1, atol=1.0e-6),
                                   f"{asset}__is_placed_{y} should be 0 or 1")
                np.testing.assert_(np.isclose(asset_is_realized , 0, atol=1.0e-6) or np.isclose(asset_is_realized , 1, atol=1.0e-6),
                                   f"{asset}__asset_is_realized_{y} should be 0 or 1")


            # If asset placed, also placed for future
            for y in range(solution._years - 1):
                asset_is_realized = results[f"{asset}__asset_is_realized_{y}"]
                next_asset_is_realized = results[f"{asset}__asset_is_realized_{y + 1}"]
                tol = 1E-6
                np.testing.assert_(asset_is_realized <= next_asset_is_realized + tol,
                                   f"{asset}__asset_is_realized_{y} should be <= {asset}__asset_is_realized_{y + 1}")  

        # Check yearly max investment constraint      
        for y in range(solution._years):
            cumulative_capex = 0        
            cumulative_capex +=sum(results[f"{asset}__cumulative_investments_made_in_eur_year_{y}"] 
                                   for asset in [
                                        *solution.energy_system_components.get("heat_source", []),
                                        *solution.energy_system_components.get("heat_demand", []),
                                        *solution.hot_pipes,
                                        *solution.energy_system_components.get("ates", [])
                                        ]
                                    )
            np.testing.assert_(cumulative_capex <= solution._yearly_max_capex, 
                               f"yearly capex {cumulative_capex} should be <= maximum yearly investment {solution._yearly_max_capex} for year {y}") 
    
        # check number of timesteps in timeseries.
        np.testing.assert_equal(len(solution.times()), solution._days * solution._years + 1,
                                "Number of timesteps in timeseries is not correct")
            
       
        # Yearly periodicity of ATES 
        for ates in solution.energy_system_components.get("ates", []):
            times = solution.times() / 3600 / 24
            for i in range(len(times) - 1):
                if i % solution._days == 0:
                    print(i, times[i], i + solution._days - 1, times[i + solution._days - 1])
                    np.testing.assert_allclose(
                        results[f"{ates}.Stored_heat"][i],
                        results[f"{ates}.Stored_heat"][i + solution._days - 1],
                        atol=1.0e-3,
                        rtol=1.0e-6,
                    )

        #  Storage_yearly_change variable should be 0 when not first timestep of year
        for ates in solution.energy_system_components.get("ates", []):
            times = solution.times() / 3600 / 24
            for i in range(len(times)):
                if i % solution._days != 0:
                    np.testing.assert_allclose(
                        results[f"{ates}.Storage_yearly_change"][i],
                        0.0,
                        atol=1.0e-3,
                        rtol=1.0e-6,
                    )

        # Check if it is not a trivial roll-out problem, i.e. not all heating demands are placed in the first year
        not_placed_in_first_year = any(
            results[f"{d}__asset_is_realized_0"] == 0 for d in solution.energy_system_components.get("heat_demand", [])
        )       
        np.testing.assert_(not_placed_in_first_year, "Trivial roll-out problem: all heating demands are placed in the first year")   
        
        # Check if all heating demands are placed at the end of the problem
        all_placed_at_end = all(
            results[f"{d}__asset_is_realized_{solution._years - 1}"] == 1 for d in solution.energy_system_components.get("heat_demand", [])
        )               
        np.testing.assert_(all_placed_at_end, "Not all heating demands are placed at the end of the problem")   
        
        # Check if all producers and ATES are placed at the end of the problem
        all_producers_placed = all(
            results[f"{asset}__asset_is_realized_{solution._years - 1}"] == 1
            for asset in [
                *solution.energy_system_components.get("heat_source", []),
                *solution.energy_system_components.get("ates", []),
            ]
        )
        np.testing.assert_(all_producers_placed, "Not all producers and ATES are placed at the end of the problem")


        # Check fraction is placed, should be between 0 and 1 and increasing
        for asset in [
            *solution.energy_system_components.get("heat_demand", []),
            *solution.energy_system_components.get("heat_source", []),
            *solution.hot_pipes,
        ]:
            for y in range(solution._years):
                asset_fraction_placed = results[f"{asset}__fraction_placed_{y}"]
                np.testing.assert_(0 <= asset_fraction_placed <= 1, "Value is not between 0 and 1") 
                tol = 1E-6
                if y < solution._years - 1:
                    next_asset_fraction_placed = results[f"{asset}__fraction_placed_{y + 1}"]
                    np.testing.assert_(asset_fraction_placed <= next_asset_fraction_placed + tol,
                                   f"{asset}__fraction_placed_{y} should be <= {asset}__fraction_placed_{y + 1}")  

            for y in range(solution._years - 1):
                asset_is_realized = results[f"{asset}__asset_is_realized_{y}"]
                next_asset_is_realized = results[f"{asset}__asset_is_realized_{y + 1}"]
                tol = 1E-6
                np.testing.assert_(asset_is_realized <= next_asset_is_realized + tol,
                                   f"{asset}__asset_is_realized{y} should be <= {asset}__asset_is_realized{y + 1}")  


        for asset in [
                *solution.energy_system_components.get("heat_source", []),
                *solution.energy_system_components.get("heat_demand", []),
                *solution.hot_pipes,
        ]:
                print(
                    f"{asset} is placed over time: {[results[f'{asset}__is_placed_{year}'] for year in range(solution._years)]}"
                )
                try:
                    print(
                        f"{asset} is placed over time: {[results[f'{asset}__asset_is_realized_{year}']for year in range(solution._years)]}"
                    )
                except:
                    pass
                print(
                    f"{asset} has a cumulative investment over time of: {[results[f'{asset}__cumulative_investments_made_in_eur_year_{year}']for year in range(solution._years)]}"
                )
        print(
            f"Yearly capex spent: "
            f"{[results[f'yearly_capex_{year}'] for year in range(solution._years)]}"
        )

        print("Done")


        import matplotlib.pyplot as plt

        solution.times()
        for ates in solution.energy_system_components.get("ates", []):
            print(results[f"{ates}.Stored_heat"])

        figure, ax = plt.subplots()
        times = solution.times()
        for ates in solution.energy_system_components.get("ates", []):
            # stored_heat = [results.get(f"{ates}.Stored_heat", 0) for t in range(times)]
            plt.plot(times / 3600 / 24, results[f"{ates}.Stored_heat"] / 1e9, label=str(ates))

        plt.xlabel("Time [days]")
        plt.ylabel("Stored Heat [GJ]")
        plt.title("Heat Storage vs Time")
        plt.legend()
        plt.xticks(range(0, int(times[-1] / 3600 / 24) + 1, 20), minor=True)
        coarse_ticks = [0, 365, 730, 1095]
        plt.xticks(coarse_ticks, [str(t) for t in coarse_ticks])
        plt.grid()
        plt.tight_layout()
        plt.show()
        savefig = base_folder / "heat_storage_vs_time.png"
        plt.savefig(savefig)
        plt.close()

        figure, ax = plt.subplots()
        times = solution.times()
        for heatsource in solution.energy_system_components.get("heat_source", []):
            # stored_heat = [results.get(f"{ates}.Stored_heat", 0) for t in range(times)]
            plt.plot(
                times / 3600 / 24, results[f"{heatsource}.Heat_source"] / 1e6, label=str(heatsource)
            )

        plt.xlabel("Time [days]")
        plt.ylabel("Heat produced [MW]")
        plt.title("Heat [produced] vs Time")
        plt.legend()
        plt.xticks(range(0, int(times[-1] / 3600 / 24) + 1, 20), minor=True)
        coarse_ticks = [0, 365, 730, 1095]
        plt.xticks(coarse_ticks, [str(t) for t in coarse_ticks])
        plt.grid()
        plt.tight_layout()
        plt.show()
        savefig = base_folder / "heat_produced_vs_time.png"
        plt.savefig(savefig)
        plt.close()

        figure, ax = plt.subplots()
        for ates in solution.energy_system_components.get("ates", []):
            # stored_heat = [results.get(f"{ates}.Stored_heat", 0) for t in range(times)]
            plt.plot(
                times / 3600 / 24, results[f"{ates}.Heat_ates"] / 1e6, label=str(ates) + " Heat_ates"
            )
            plt.plot(
                times / 3600 / 24, results[f"{ates}.Heat_loss"] / 1e6, label=str(ates) + " Heat_loss"
            )
            plt.plot(
                times / 3600 / 24,
                results[f"{ates}.Storage_yearly_change"] / 1e6,
                label=str(ates) + " Storage_yearly_change",
            )

        plt.xlabel("Time [days]")
        plt.ylabel("Heat [MW]")
        plt.title("Heat  vs Time")
        plt.legend()
        plt.xticks(range(0, int(times[-1] / 3600 / 24) + 1, 20), minor=True)
        coarse_ticks = [0, 365, 730, 1095]
        plt.xticks(coarse_ticks, [str(t) for t in coarse_ticks])
        plt.grid()
        plt.tight_layout()
        plt.show()
        savefig = base_folder / "heat_ates_vs_time.png"
        plt.savefig(savefig)
        plt.close()