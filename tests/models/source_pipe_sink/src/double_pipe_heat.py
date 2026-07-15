from mesido.esdl.esdl_additional_vars_mixin import ESDLAdditionalVarsMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_profile_averages_timestep_size,
)

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import SinglePassGoalProgrammingMixin
from rtctools.util import run_optimization_problem


class TargetDemandGoal(Goal):
    priority = 1

    order = 1

    def __init__(self, optimization_problem):
        demand_id = optimization_problem.esdl_asset_name_to_id_map["demand"]
        self.target_min = optimization_problem.get_timeseries(f"{demand_id}.target_heat_demand")
        self.target_max = optimization_problem.get_timeseries(f"{demand_id}.target_heat_demand")
        self.function_range = (0.0, 2e5)
        self.function_nominal = 1e5

    def function(self, optimization_problem, ensemble_member):
        demand_id = optimization_problem.esdl_asset_name_to_id_map["demand"]
        return optimization_problem.state(f"{demand_id}.Heat_demand")


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


class SourcePipeSink(
    ScenarioOutput,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def energy_system_options(self):
        options = super().energy_system_options()
        self.gas_network_settings["maximum_velocity"] = 20.0
        return options

    def path_goals(self):
        g = super().path_goals().copy()
        g.append(TargetDemandGoal(self))
        g.append(MinimizeProduction())
        return g

    def post(self):
        super().post()


class SourcePipeSinkDayAveraged(SourcePipeSink):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.__day_steps = kwargs.get("_day_steps", 1)

    def parameters(self, ensemble_member):
        parameters = super().parameters(ensemble_member)
        parameters["time_step_days"] = self.__day_steps
        return parameters

    # TODO: adapt_hourly_profile_averages_timestep_size has to be modified
    def read(self):
        super().read()

        adapt_hourly_profile_averages_timestep_size(self, self.__day_steps)


class HeatProblemESDLVarsMixin(ESDLAdditionalVarsMixin, SourcePipeSink):
    pass


if __name__ == "__main__":
    sol = run_optimization_problem(
        SourcePipeSink,
        esdl_file_name="sourcesink_with_eboiler.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.csv",
    )
    results = sol.extract_results()
    a = 1
