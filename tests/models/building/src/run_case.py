import numpy as np

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

    def __init__(self):
        self.function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        sum = 0
        for source in optimization_problem.energy_system_components.get("heat_source", []):
            sum = optimization_problem.state(f"{source}.Heat_source")
        return sum

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
        for demand in self.energy_system_components.get("heat_demand", []):
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"
            g.append(TargetDemandGoal(state, target))
        for demand in self.energy_system_components.get("cold_demand", []):
            target = self.get_timeseries(f"{demand}.target_cold_demand")
            state = f"{demand}.Cold_demand"
            g.append(TargetDemandGoal(state, target))
        return g

    def post(self):
        super().post()


if __name__ == "__main__":
    import time
    start_time = time.time()

    solution = run_optimization_problem(
        SourcePipeBuilding,
        esdl_file_name="source buildingsink with multiple demand profiles.esdl",
        # esdl_file_name="sourcesink.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.csv",
        # input_timeseries_file="timeseries_import_orig.csv",
    )

    results = solution.extract_results()

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))