from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.physics_mixin import PhysicsMixin
from mesido.workflows.io.write_output import ScenarioOutput

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.util import run_optimization_problem


class TargetDemandGoal(Goal):
    priority = 1

    order = 2

    def __init__(self, state, target):
        self.state = state

        self.target_min = target
        self.target_max = target
        self.function_range = (-1.0e6, 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        return options


class MinimizeSourcesHeatGoal(Goal):
    priority = 2

    order = 1

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 20e6)
        self.source = source
        self.function_nominal = 1e6

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(f"{self.source}.Heat_source")


class HeatProblem(
    ScenarioOutput,
    _GoalsAndOptions,
    PhysicsMixin,
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
        self.heat_network_settings["minimum_velocity"] = 0.001
        options["heat_loss_disconnected_pipe"] = False

        return options

    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        return options


class HeatProblemTvarSecondary(
    _GoalsAndOptions,
    PhysicsMixin,
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

    def temperature_carriers(self):
        return self.esdl_carriers  # geeft terug de carriers met multiple temperature options

    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.0001
        options["heat_loss_disconnected_pipe"] = True
        self.heat_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS

        return options

    def times(self, variable=None) -> np.ndarray:
        return super().times(variable)[:5]

    def temperature_regimes(self, carrier):
        temperatures = []
        if carrier == 7212673879469902607010:
            # supply
            temperatures = [70.0, 90.0]

        return temperatures

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)
        # These constraints are added to allow for a quicker solve
        for _carrier, temperatures in self.temperature_carriers().items():
            carrier_id_number_mapping = str(temperatures["id_number_mapping"])
            temperature_regimes = self.temperature_regimes(int(carrier_id_number_mapping))
            if len(temperature_regimes) > 0:
                for temperature in temperature_regimes:
                    selected_temp_vec = self.state_vector(
                        f"{int(carrier_id_number_mapping)}_{temperature}"
                    )
                    for i in range(1, len(self.times())):
                        constraints.append(
                            (selected_temp_vec[i] - selected_temp_vec[i - 1], 0.0, 0.0)
                        )

        return constraints


class HeatProblemTvar(
    _GoalsAndOptions,
    PhysicsMixin,
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

    def temperature_carriers(self):
        return self.esdl_carriers  # geeft terug de carriers met multiple temperature options

    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.0001
        options["heat_loss_disconnected_pipe"] = False
        return options

    def temperature_regimes(self, carrier):
        temperatures = []
        if carrier == 33638164429859421:  # 7212673879469902607010:
            # supply
            temperatures = [69.0, 80.0, 90.0]

        return temperatures

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)
        # These constraints are added to allow for a quicker solve
        for _carrier, temperatures in self.temperature_carriers().items():
            carrier_id_number_mapping = str(temperatures["id_number_mapping"])
            temperature_regimes = self.temperature_regimes(int(carrier_id_number_mapping))
            if len(temperature_regimes) > 0:
                for temperature in temperature_regimes:
                    selected_temp_vec = self.state_vector(
                        f"{int(carrier_id_number_mapping)}_{temperature}"
                    )
                    for i in range(1, len(self.times())):
                        constraints.append(
                            (selected_temp_vec[i] - selected_temp_vec[i - 1], 0.0, 0.0)
                        )

        return constraints


class HeatProblemTvarDisableHEX(
    _GoalsAndOptions,
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def temperature_carriers(self):
        return self.esdl_carriers  # geeft terug de carriers met multiple temperature options

    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.0001
        options["heat_loss_disconnected_pipe"] = False
        return options

    @property
    def esdl_assets(self):
        assets = super().esdl_assets
        # we increase the max power of the source to maintain demand matching
        asset = next(a for a in assets.values() if a.name == "ResidualHeatSource_aec9")
        asset.attributes["power"] = 1.0e6

        return assets

    def temperature_regimes(self, carrier):
        temperatures = []
        if carrier == 33638164429859421:  # 7212673879469902607010:
            # supply
            temperatures = [69.0]

        return temperatures

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)
        # These constraints are added to allow for a quicker solve
        for _carrier, temperatures in self.temperature_carriers().items():
            carrier_id_number_mapping = str(temperatures["id_number_mapping"])
            temperature_regimes = self.temperature_regimes(int(carrier_id_number_mapping))
            if len(temperature_regimes) > 0:
                for temperature in temperature_regimes:
                    selected_temp_vec = self.state_vector(
                        f"{int(carrier_id_number_mapping)}_{temperature}"
                    )
                    for i in range(1, len(self.times())):
                        constraints.append(
                            (selected_temp_vec[i] - selected_temp_vec[i - 1], 0.0, 0.0)
                        )

        return constraints


# class HeatProblemTvar(
#     _GoalsAndOptions,
#     HeatMixin,
#     LinearizedOrderGoalProgrammingMixin,
#     GoalProgrammingMixin,
#     ESDLMixin,
#     CollocatedIntegratedOptimizationProblem,
# ):
#     def path_goals(self):
#         goals = super().path_goals().copy()
#
#         for s in self.energy_system_components["heat_source"]:
#             goals.append(MinimizeSourcesHeatGoal(s))
#
#         return goals
#
#     def temperature_carriers(self):
#         return self.esdl_carriers  # geeft terug de carriers met multiple temperature options
#
#     def temperature_regimes(self, carrier):
#         temperatures = []
#         if carrier == 7212673879469902607010:
#             # supply
#             temperatures = [70.0, 90.0]
#
#         return temperatures
#
#     def constraints(self, ensemble_member):
#         constraints = super().constraints(ensemble_member)
#         # These constraints are added to allow for a quicker solve
#         for carrier, temperatures in self.temperature_carriers().items():
#             number_list = [int(s) for s in carrier if s.isdigit()]
#             number = ""
#             for nr in number_list:
#                 number = number + str(nr)
#             carrier_type = temperatures["__rtc_type"]
#             if carrier_type == "return":
#                 number = number + "000"
#             carrier_id_number_mapping = number
#             temperature_regimes = self.temperature_regimes(int(carrier_id_number_mapping))
#             if len(temperature_regimes) > 0:
#                 for temperature in temperature_regimes:
#                     selected_temp_vec = self.state_vector(
#                         f"{int(carrier_id_number_mapping)}__{carrier_type}_{temperature}"
#                     )
#                     for i in range(1, len(self.times())):
#                         constraints.append(
#                             (selected_temp_vec[i] - selected_temp_vec[i - 1], 0.0, 0.0)
#                         )
#
#         return constraints


if __name__ == "__main__":
    solution = run_optimization_problem(
        HeatProblem,
        esdl_file_name="heat_exchanger.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.xml",
    )
    results = solution.extract_results()
