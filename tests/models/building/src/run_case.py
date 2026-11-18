import logging

import esdl
from mesido.demand_insulation_class import DemandInsulationClass  # still to be used below
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.goals.demand_options_goals import TargetDemandAlternativesGoal
from mesido.workflows.io.write_output import ScenarioOutput

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import SinglePassGoalProgrammingMixin
from rtctools.optimization.timeseries import Timeseries
from rtctools.util import run_optimization_problem


class TargetDemandGoal(Goal):
    priority = 1

    order = 1

    def __init__(self, state: str, target: Timeseries):
        self.state = state
        self.target_min = target
        self.target_max = target
        max_target_value = max(target.values)
        self.function_range = (-max_target_value, 2.0 * max_target_value)
        self.function_nominal = np.median(target.values)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class MinimizeProduction(Goal):
    priority = 2

    order = 1

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 1e6)
        self.source = source
        self.function_nominal = 0.5e6

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Heat_source")


class SourcePipeBuilding(
    ScenarioOutput,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):

    def path_goals(self):
        g = super().path_goals().copy()

        # TODO: code under development and to be updated once building parameters
        # The path goals will still be updated once heat and cold demand
        # Currently heat demand matching occurs inheat_physics_mixin via
        # __heat_matching_demand_insulation_constraints

        # Do not delete the code below. Used for manual testing purposes.
        # for demand in self.energy_system_components.get("heat_demand", []):
        #     target = self.get_timeseries(f"{demand}.target_heat_demand")
        #     state = f"{demand}.Heat_demand"
        #     g.append(TargetDemandGoal(state, target))
        for demand in self.energy_system_components.get("cold_demand", []):
            target = self.get_timeseries(f"{demand}.target_cold_demand")
            state = f"{demand}.Cold_demand"
            g.append(TargetDemandGoal(state, target))

        for dmnd in self.energy_system_components.get("heat_demand", []):
            demand_insulation_classes = self._HeatPhysicsMixin__demand_insulation_class_map[dmnd]
            demand_profile_for_this_class = []
            is_insulation_class_active_name_list = []

            for pc, pc_var_name in demand_insulation_classes.items():
                
                new_profile = self._ESDLMixin__profile_reader._profiles[0][f"{pc.demand_scaling_factor}.target_heat_demand"]
                profile_times = self.times()
                new_profile = Timeseries(
                    profile_times,
                    new_profile.to_numpy()[: len(profile_times)],
                )
                demand_profile_for_this_class.append(new_profile) # with profile stored instead of factor
                is_insulation_class_active_name_list.append(pc_var_name)
            
            g.append(
                TargetDemandAlternativesGoal(
                    f"{dmnd}.Heat_demand",
                    demand_profile_for_this_class,
                    is_insulation_class_active_name_list,
                )
            )

        for s in self.energy_system_components["heat_source"]:
            g.append(MinimizeProduction(s))

        return g

    def energy_system_options(self):
        options = super().energy_system_options()
        options["include_demand_insulation_options"] = True
        return options

    # Do not delete:
    # Code under development and might be used when building_parameters are used.
    def insulation_levels(self):
        # Potentially use the building_parameters to get a profile.
        # One now has access to the following:
        # - identify in which building a demand asset (demand_id) is located via:
        #   demand_id = self.energy_system_components.get("heat_demand", [])[0]
        #   building_id = self.esdl_assets[demand_id].attributes["containingBuilding"].id
        # - self.building_parameters: can use building id to access measure info per asset
        # - profile via:
        #   self._ESDLMixin__profile_reader._profiles[0][f"{measure_asset_id}.target_heat_demand"]

        attributes = {
            "insulation_level": [],
            "Tmin_deg": [],
            "scaling_factor": [],
            "insulation_cost_euro": [],
        }

        # attributes = {
        #     "insulation_level": ["A", "B", "C"],
        #     # For now the factor values chosen such that value 1.0 is optimal
        #     "scaling_factor": [1.1, 1.2, 1.0],
        #     "Tmin_deg": [50, 60, 70],
        #     "insulation_cost_euro": [5.0e6, 2.0e6, 1]
        # }

        # for dmnd in self.energy_system_components.get("heat_demand", []):
        #     building_id = self.esdl_assets[dmnd].attributes["containingBuilding"].id
        #     containd_measures = self.building_parameters[building_id].get("contained_measure", {})
        #     for msr_id in containd_measures:
        #         measure_assets = containd_measures[msr_id].get("measure_assets", {})
        #         for measure_asset_id in measure_assets:
        #             if isinstance(measure_assets[measure_asset_id], esdl.HeatingDemand):
        #                 new_profile = self._ESDLMixin__profile_reader._profiles[0][f"{measure_asset_id}.target_heat_demand"].values

        for dmnd in self.energy_system_components.get("heat_demand", []):
            building_id = self.esdl_assets[dmnd].attributes["containingBuilding"].id
            containd_measures = self.building_parameters[building_id].get("contained_measure", {})
            for msr_id in containd_measures:
                measure_assets = containd_measures[msr_id].get("measure_assets", {})
                for measure_asset_id in measure_assets:
                    if isinstance(measure_assets[measure_asset_id], esdl.HeatingDemand):
                        # new_profile = self._ESDLMixin__profile_reader._profiles[0][f"{measure_asset_id}.target_heat_demand"]
                        # profile_times = self.times()
                        # new_profile = Timeseries(
                        #     profile_times,
                        #     new_profile.to_numpy()[: len(profile_times)],
                        # )

                        # attributes["insulation_level"].append(measure_asset_id)  # demand in the measure
                        attributes["insulation_level"].append(msr_id)
                        attributes["Tmin_deg"].append(0)
                        # attributes["scaling_factor"].append(new_profile) # use asset id instead of profile itself
                        attributes["scaling_factor"].append(measure_asset_id)
                        attributes["insulation_cost_euro"].append(0)
            if not containd_measures:
                attributes["insulation_level"].append(["A", "B"]) # measure_id
                attributes["Tmin_deg"].append([0, 0])
                attributes["scaling_factor"].append(["alternaive_asset_1", "alternaive_asset_2"])  # measure_asset_id -> alternavite_asset_id
                attributes["insulation_cost_euro"].append([0, 0])

        return attributes
    
    # Do not delete:
    # Code under development and might be used when building_parameters are used.
    def demand_insulation_classes(self, demand_insulation):
        name_to_id = self.esdl_asset_name_to_id_map
        available_demand_insulation_classes = []
        for dmnd in self.energy_system_components["heat_demand"]:
            for ii in range(len(self.insulation_levels()["insulation_level"])):
                available_demand_insulation_classes.append(
                    DemandInsulationClass(
                        self.insulation_levels()["insulation_level"][ii],
                        dmnd,
                        self.insulation_levels()["Tmin_deg"][ii],
                        self.insulation_levels()["scaling_factor"][ii],
                        self.insulation_levels()["insulation_cost_euro"][ii],
                    )
                )

            # Not working for cold demand yet
            # available_demand_insulation_classes.append(
            #     DemandInsulationClass(
            #         self.insulation_levels()["insulation_level"][ii],
            #         name_to_id["CoolingDemand_1"],
            #         self.insulation_levels()["Tmin_deg"][ii],
            #         self.insulation_levels()["scaling_factor"][ii],
            #         self.insulation_levels()["insulation_cost_euro"][ii],
            #     )
            # )

        return available_demand_insulation_classes

    # def solver_options(self):
    #     options = super().solver_options()
    #     options["expand"] = True
    #     return options
   

if __name__ == "__main__":
    import time

    start_time = time.time()
    # This is a rough case and still to be used
    solution = run_optimization_problem(
        SourcePipeBuilding,
        # log_level=logging.DEBUG,
        esdl_file_name="source buildingsink with multiple demand profiles.esdl",
        esdl_parser=ESDLFileParser,
        # Do not delete: to be used in the next step of development -> specify measure asset
        # profile via csv file
        # profile_reader=ProfileReaderFromFile,
        # input_timeseries_file="timeseries_import.csv",
    )

    results = solution.extract_results()

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
