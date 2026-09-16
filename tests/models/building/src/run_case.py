import numpy as np

from mesido.demand_insulation_class import DemandInsulationClass
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.io.write_output import ScenarioOutput

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
        self.function_range = (0.0, 2.0 * max(target.values))
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

        # Do not delete the code below. Sused for manual testing purposes.
        # for demand in self.energy_system_components.get("heat_demand", []):
        #     target = self.get_timeseries(f"{demand}.target_heat_demand")
        #     state = f"{demand}.Heat_demand"
        #     g.append(TargetDemandGoal(state, target))
        for demand in self.energy_system_components.get("cold_demand", []):
            target = self.get_timeseries(f"{demand}.target_cold_demand")
            state = f"{demand}.Cold_demand"
            g.append(TargetDemandGoal(state, target))
        

        for s in self.energy_system_components["heat_source"]:
            g.append(MinimizeProduction(s))

        return g

    def energy_system_options(self):
        options = super().energy_system_options()
        options["include_demand_insulation_options"] = True
        return options
    
    def insulation_levels(self):
        # Under development. Plan to use the building_paremeters here 
        attributes = {
            "insulation_level": ["A", "B", "C"],
            "scaling_factor": [0.6, 0.9, 1.0],
            "Tmin_deg": [50, 60, 70],
            "insulation_cost_euro": [5.0e6, 2.0e6, 1.0e6],
        }
        
        # for key, val in self._build_building_parameters().items():
        #     print(key)
        #     print(val)
        
        return attributes

    def demand_insulation_classes(self, demand_insulation):
        name_to_id = self.esdl_asset_name_to_id_map
        available_demand_insulation_classes = []
        for ii in range(len(self.insulation_levels()["insulation_level"])):
            available_demand_insulation_classes.append(
                DemandInsulationClass(
                    self.insulation_levels()["insulation_level"][ii],
                    name_to_id["HeatingDemand_1"],
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

    def post(self):
        super().post()


if __name__ == "__main__":
    import time
    start_time = time.time()

    solution = run_optimization_problem(
        SourcePipeBuilding,
        esdl_file_name="source buildingsink with multiple demand profiles.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.csv",
    )

    results = solution.extract_results()

    heat_demand_id = solution.esdl_asset_name_to_id_map["HeatingDemand_1"]
    cold_demand_id = solution.esdl_asset_name_to_id_map["CoolingDemand_1"]
    print(results[f"{heat_demand_id}.Heat_flow"])
    print(results[f"{cold_demand_id}.Heat_flow"])

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))