import logging

import esdl
from mesido.demand_insulation_class import DemandInsulationClass  # still to be used below
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.goals.demand_options_goals import TargetDemandAlternativesGlobalGoal
from mesido.workflows.io.write_output import ScenarioOutput

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import (
    CachingQPSol,
    SinglePassGoalProgrammingMixin,
)
from rtctools.optimization.timeseries import Timeseries
from rtctools.util import run_optimization_problem


class TargetDemandGoal(Goal):
    priority = 1

    order = 2

    def __init__(self, state: str, target: Timeseries):
        self.state = state
        self.target_min = target
        self.target_max = target
        max_target_value = max(target.values)
        self.function_range = (-max_target_value, max(2.0 * max_target_value, 1.0e6))
        self.function_nominal = max(np.median(target.values), 1.0e6)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class MinimizeProduction(Goal):
    priority = 2

    order = 1

    def __init__(self, source):
        # self.target_max = 0.0
        # self.function_range = (0.0, 15.0e6)
        self.source = source
        self.function_nominal = 5.0e6

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

    def solver_options(self):
        options = super().solver_options()
        # Reusing the constraint matrix between priorities to speed up the optimization
        if not hasattr(self, "_building_qpsol"):
            self._building_qpsol = CachingQPSol()
        options["casadi_solver"] = self._building_qpsol
        return options

    def update_heat_network_settings(self):
            settings = super().update_heat_network_settings()
            settings["minimum_velocity"] = 1e-5
            return settings

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

        alternative_profiles = self.constant_inputs(0)
        for dmnd in self.energy_system_components.get("heat_demand", []):
            demand_insulation_classes = (
                self._HeatPhysicsMixin__demand_insulation_class_global_map.get(dmnd, {})
            )
            demand_profile_for_this_class = []
            is_insulation_class_active_name_list = []

            for pc_var_name in demand_insulation_classes.values():
                demand_profile_for_this_class.append(
                    alternative_profiles[f"{pc_var_name}__alternative_target_profile"]
                )
                is_insulation_class_active_name_list.append(pc_var_name)
            
            g.append(
                TargetDemandAlternativesGlobalGoal(
                    f"{dmnd}.Heat_demand",
                    demand_profile_for_this_class,
                    is_insulation_class_active_name_list,
                )
            )

        for s in self.energy_system_components["heat_source"]:
            g.append(MinimizeProduction(s))

        return g

    def constant_inputs(self, ensemble_member):
        inputs = super().constant_inputs(ensemble_member).copy()
        global_map = getattr(self, "_HeatPhysicsMixin__demand_insulation_class_global_map", {})

        for alternatives in global_map.values():
            for alternative, selector_name in alternatives.items():
                profile_key = f"{alternative.demand_scaling_factor}.target_heat_demand"
                profile = self._ESDLMixin__profile_reader._profiles[ensemble_member][profile_key]
                profile_times = self.times()
                inputs[f"{selector_name}__alternative_target_profile"] = Timeseries(
                    profile_times,
                    profile.to_numpy()[: len(profile_times)],
                )

        return inputs

    def energy_system_options(self):
        options = super().energy_system_options()
        options["include_demand_insulation_options"] = True
        options["neglect_pipe_heat_losses"] = True
        return options

    # Do not delete:
    # Code under development and might be used when building_parameters are used.
    def insulation_levels(self, demand_name=None):
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

        for dmnd in self.energy_system_components.get("heat_demand", []):
            if demand_name is not None and dmnd != demand_name:
                continue
            containing_building = self.esdl_assets[dmnd].attributes.get("containingBuilding")
            if containing_building is None:
                continue
            building_id = containing_building.id
            containd_measures = self.building_parameters.get(building_id, {}).get(
                "contained_measure", {}
            )
            for msr_id in containd_measures:
                measure_assets = containd_measures[msr_id].get("measure_assets", {})
                for measure_asset_id in measure_assets:
                    if isinstance(measure_assets[measure_asset_id], esdl.HeatingDemand):
                        attributes["insulation_level"].append(msr_id)
                        attributes["Tmin_deg"].append(0)
                        attributes["scaling_factor"].append(measure_asset_id)
                        attributes["insulation_cost_euro"].append(0)

        return attributes
    
    # Do not delete:
    # Code under development and might be used when building_parameters are used.
    def demand_insulation_classes(self, demand_insulation):
        attributes = self.insulation_levels(demand_insulation)
        available_demand_insulation_classes = []
        for ii in range(len(attributes["insulation_level"])):
            available_demand_insulation_classes.append(
                DemandInsulationClass(
                    attributes["insulation_level"][ii],
                    demand_insulation,
                    attributes["Tmin_deg"][ii],
                    attributes["scaling_factor"][ii],
                    attributes["insulation_cost_euro"][ii],
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
