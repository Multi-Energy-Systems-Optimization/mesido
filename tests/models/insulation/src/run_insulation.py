import esdl

from mesido.demand_insulation_class import DemandInsulationClass
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.techno_economic_mixin import TechnoEconomicMixin

import casadi as ca
import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
    logger,
)
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.timeseries import Timeseries
from rtctools.util import run_optimization_problem


# class TargetHeatGoal(Goal):
#     priority = 1

#     order = 2

#     def __init__(self, state, target):
#         self.state = state

#         self.target_min = target
#         self.target_max = target
#         try:
#             self.function_range = (-1.0e6, max(2.0 * max(target.values), 1.0e6))
#             self.function_nominal = max(np.median(target.values), 1.0e6)
#         except Exception:
#             self.function_range = (-1.0e6, max(2.0 * target, 1.0e6))
#             self.function_nominal = max(target, 1.0e6)

#     def function(self, optimization_problem, ensemble_member):
#         return optimization_problem.state(self.state)

class TargetHeatGoal(Goal):
    priority = 1
    order = 1

    target_min = 0.0
    target_max = 0.0

    def __init__(self, state, profiles, profile_bools):
        self.state = state
        self.profiles = profiles
        self.profile_bools = profile_bools

        max_profile = max(
            np.max(np.abs(profile.values))
            for profile in profiles
        )
        self.function_range = (-max_profile, max_profile)
        self.function_nominal = max(max_profile, 1.0)

        # self.function_range = (-1.0e6, 1.0e6)
        # self.function_nominal = 1.0e6

    def function(self, optimization_problem, ensemble_member):
        y = optimization_problem.state(self.state)

        selected_target = 0.0

        # for profile, bool_state in zip(
        #     self.profiles, self.profile_bools
        # ):
        #     selected_target += ca.times(
        #         ca.DM(profile.values),
        #         bool_state,
        #     )

            
        for profile, selector_name in zip(self.profiles, self.profile_bools):
            is_insulation_active_var = optimization_problem.state(selector_name)
            selected_target += ca.times(
                ca.DM(profile.values),
                is_insulation_active_var,
            )

        # y - x_t*b_t
        return y - selected_target 


class MinimizeSourcesHeatGoal(Goal):
    priority = 2

    order = 1

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 10e6)
        self.source = source
        self.function_nominal = 1.0e6

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Heat_source")


class MinimizeSourcesFlowGoal(Goal):  # or pipediametersizingproblem
    priority = 3

    order = 1

    def __init__(self, source):
        self.source = source

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Q")


# test 1. selecting the lowest heating demands passed on minimising the source milp production
class HeatProblem(
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesHeatGoal(s))

        bounds = self.bounds()
        demand_type = ["heat_demand", "cold_demand"]
        for dtype in demand_type:
            for demand in self.energy_system_components.get(dtype, []):
                # target = self.get_timeseries(f"{demand}.target_{dtype}")
                # if bounds[f"{demand}.HeatIn.Heat"][1] < max(target.values):
                #     logger.warning(
                #         f"{demand} has a flow limit, {bounds[f'{demand}.HeatIn.Heat'][1]}, "
                #         f"lower than what is required for the maximum demand {max(target.values)}"
                #     )
                # TODO:
                # update this caclulation to bounds[f"{demand}.HeatIn.Heat"][1]/ dT * Tsup & move
                # to potential_errors variable
                state = f"{demand}.{dtype[0].upper() + dtype[1:]}"

                # goals.append(TargetHeatGoal(state, target))

                # Adding constraints for the entire time horizon per demand insulation
                # for iclasses in range(len(self.demand_profile_for_this_class)):
                demand_insulation_classes = self._HeatPhysicsMixin__demand_insulation_class_map[demand]
                target = None
                # ins_class_to_variable = self._HeatPhysicsMixin__demand_insulation_class_map[demand]
                # self._HeatPhysicsMixin__demand_insulation_class_var["e6b37a73-ebb4-4deb-80b4-80e8ceafe16f__demand_insulation_class_A"]
                is_insulation_class_active_list = []
                demand_profile_for_this_class = []
                is_insulation_class_active_name_list = []
                for pc, pc_var_name in demand_insulation_classes.items():
                    target_demand = self.get_timeseries(f"{demand}.target_heat_demand")
                    
                    demand_profile_for_this_class.append(
                        Timeseries(
                            target_demand.times[: len(self.times())],
                            pc.demand_scaling_factor * target_demand.values[: len(self.times())],
                        )
                    )
                    target = demand_profile_for_this_class[-1]
                    # target += demand_profile_for_this_class[-1]

                    if bounds[f"{demand}.HeatIn.Heat"][1] < max(target.values):
                        logger.warning(
                            f"{demand} has a flow limit, {bounds[f'{demand}.HeatIn.Heat'][1]}, "
                            f"lower than what is required for the maximum demand {max(target.values)}"
                        )

                    # for itstep in range(len(demand_profile_for_this_class[iclasses])):
                    #     constraints.extend(
                    #         self._symmetric_big_m_constraints(
                    #             heat_demand[itstep]
                    #             - demand_profile_for_this_class[iclasses][itstep],
                    #             big_m[iclasses] * (1.0 - is_insulation_active[iclasses][itstep]),
                    #             nominal[iclasses],
                    #         )
                    #     )

                    # is_insulation_class_active = self._HeatPhysicsMixin__demand_insulation_class_var[pc_var_name]
                    # is_insulation_class_active_list.append(
                    #     ca.repmat(
                    #         is_insulation_class_active,
                    #         len(target_demand.values[: (len(self.times()))]),
                    #     )
                    # )
                    # still to multilpy by the normol self.variable_nominal(f"{asset}.Power_consumed"), to replicate is_insulation_active_var = self.extra_variable(pc_var_name, ensemble_member)

                    is_insulation_class_active_name_list.append(pc_var_name)

                    # goals.append(TargetHeatGoal(state, demand_profile_for_this_class[-1]))
                goals.append(TargetHeatGoal(state, demand_profile_for_this_class, is_insulation_class_active_name_list))

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        options["heat_loss_disconnected_pipe"] = True
        options["include_demand_insulation_options"] = True
        # options["neglect_pipe_heat_losses"] = True

        return options

    def times(self, variable=None) -> np.ndarray:
        return super().times(variable)[:5]

    # This is the demand values read from the input file "timeseries_import.xml"
    def base_demand_load(self, demand_name):
        base_target_profile = self.get_timeseries(f"{demand_name}.target_heat_demand")
        return base_target_profile.values

    def insulation_levels(self):
        attributes = {
            "insulation_level": ["A", "B", "C"],
            "scaling_factor": [0.5, 0.1, 1.0],
            "Tmin_deg": [50, 60, 70],
            "insulation_cost_euro": [5.0e6, 2.0e6, 1.0e6],
        }
        return attributes

    def demand_insulation_classes(self, demand_insualtion):
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
        return available_demand_insulation_classes

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        return options

    @property
    def esdl_assets(self):
        assets = super().esdl_assets

        asset = next(a for a in assets.values() if a.name == "Pipe6")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe6_ret")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe5")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe5_ret")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe21")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe21_ret")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe22")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe22_ret")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe8")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe8_ret")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL

        return assets

    def pipe_classes(self, p):
        return self._override_pipe_classes.get(p, [])


# test 1b. ensure that the milp problem works when specifying only 1 insulation level for 1 demand
class HeatProblemB(
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        for s in self.energy_system_components["heat_source"]:
            goals.append(MinimizeSourcesHeatGoal(s))

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        options["heat_loss_disconnected_pipe"] = True
        options["include_demand_insulation_options"] = True

        return options

    def times(self, variable=None) -> np.ndarray:
        return super().times(variable)[:5]

    def insulation_levels(self):
        attributes = {
            "insulation_level": ["A", "B", "C"],
            "scaling_factor": [0.6, 0.9, 1.0],
            "Tmin_deg": [50, 60, 70],
            "insulation_cost_euro": [5.0e6, 2.0e6, 1.0e6],
        }
        return attributes

    def demand_insulation_classes(self, demand_insualtion):
        name_to_id = self.esdl_asset_name_to_id_map
        available_demand_insulation_classes = []
        for ii in range(len(self.insulation_levels()["insulation_level"])):
            available_demand_insulation_classes.append(
                DemandInsulationClass(
                    self.insulation_levels()["insulation_level"][ii],
                    name_to_id["HeatingDemand_e6b3"],
                    self.insulation_levels()["Tmin_deg"][ii],
                    self.insulation_levels()["scaling_factor"][ii],
                    self.insulation_levels()["insulation_cost_euro"][ii],
                )
            )
        # Only make insulation level C available for HeatingDemand_f15e
        available_demand_insulation_classes.append(
            DemandInsulationClass(
                self.insulation_levels()["insulation_level"][2],
                name_to_id["HeatingDemand_f15e"],
                self.insulation_levels()["Tmin_deg"][2],
                self.insulation_levels()["scaling_factor"][2],
                self.insulation_levels()["insulation_cost_euro"][2],
            )
        )

        return available_demand_insulation_classes

    def solver_options(self):
        options = super().solver_options()
        options["highs"] = {}
        return options

    @property
    def esdl_assets(self):
        assets = super().esdl_assets

        asset = next(a for a in assets.values() if a.name == "Pipe6")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe6_ret")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe5")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe5_ret")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe21")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe21_ret")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe22")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe22_ret")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe8")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL
        asset = next(a for a in assets.values() if a.name == "Pipe8_ret")
        asset.attributes["state"] = esdl.AssetStateEnum.OPTIONAL

        return assets

    def pipe_classes(self, p):
        return self._override_pipe_classes.get(p, [])


# TODO: add test code below in future work:
# # test 2. Insulating specific demands to either ensure Tmin is low enough add specific LT
# sources and thus ensuring enough production capacity or to reduce milp demand enough such that
# total demand is below total production capacity, but not cost effective, thus trying to insulate
# as minimal as possible.
# class HeatProblemSources(
#     HeatMixin,
#     LinearizedOrderGoalProgrammingMixin,
#     GoalProgrammingMixin,
#     ESDLMixin,
#     CollocatedIntegratedOptimizationProblem,
# ):
#     def path_goals(self):
#         goals = super().path_goals().copy()

#         for s in self.energy_system_components["heat_source"]:
#             goals.append(MinimizeSourcesFlowGoal(s))

#         return goals

#     def temperature_carriers(self):
#         return self.esdl_carriers

#     def temperature_regimes(self, carrier):
#         # TODO: these temperatures still need to be decided upon based on the tests
#         temperatures = []
#         if carrier == 1:
#             # primsupply
#             temperatures = [90.0, 80.0]
#         elif carrier == 2:
#             # primreturn
#             temperatures = [60.0, 65.0]
#         elif carrier == 3:
#             # secsupply
#             temperatures = [70.0, 60.0]
#         elif carrier == 4:
#             # secreturn
#             temperatures = [50.0, 40.0]

#         return temperatures


if __name__ == "__main__":
    import time

    start_time = time.time()
    heat_problem = run_optimization_problem(
        HeatProblemB,
        esdl_file_name="Insulation.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.xml",
    )
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
