from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.physics_mixin import PhysicsMixin
from mesido.qth_not_maintained.qth_mixin import QTHMixin
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.homotopy_mixin import HomotopyMixin
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
        self.function_range = (0.0, 2.0 * max(target.values))
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


class HeatProblem(
    _GoalsAndOptions,
    PhysicsMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def solver_options(self):
        options = super().solver_options()
        options["solver"] = "highs"
        return options


class HeatProblemTvar(HeatProblem):
    def energy_system_options(self):
        options = super().energy_system_options()
        # We set a low maximum velocity to force the optimization to select a dT of more then 20 deg
        # this is to avoid specifying a new demand profile
        self.heat_network_settings["maximum_velocity"] = 0.25
        return options

    def temperature_carriers(self):
        return self.esdl_carriers  # geeft terug de carriers met multiple temperature options

    def temperature_regimes(self, carrier):
        temperatures = []
        if carrier == "c362f53a-3eaf-4d96-8ee6-944e77359fed":
            # supply
            temperatures = [80.0, 85.0]

        if carrier == "c362f53a-3eaf-4d96-8ee6-944e77359fed_ret":
            # return
            temperatures = [60.0, 65.0]

        return temperatures

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)
        # These constraints are added to allow for a quicker solve
        for carrier_id in self.temperature_carriers().keys():
            temperature_regimes = self.temperature_regimes(carrier_id)
            if len(temperature_regimes) > 0:
                for temperature in temperature_regimes:
                    selected_temp_vec = self.state_vector(f"{carrier_id}_{temperature}")
                    for i in range(1, len(self.times())):
                        constraints.append(
                            (selected_temp_vec[i] - selected_temp_vec[i - 1], 0.0, 0.0)
                        )

        return constraints


class HeatProblemTvarWithTechnoEconomicMixin(HeatProblemTvar, TechnoEconomicMixin):

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.base_carrier_name = "Heat"
        self.base_id_number_mapping = self._get_id_number_mapping_from_carrier_name(
            self.base_carrier_name
        )

    def temperature_regimes(self, carrier):
        temperatures = []
        if carrier == self.base_id_number_mapping:
            temperatures = self._get_related_carrier_temperatures(self.base_carrier_name)
        return temperatures

    def _get_id_number_mapping_from_carrier_name(self, carrier_name: str):
        return next(
            (
                carrier.get("id_number_mapping")
                for carrier in self.esdl_carriers.values()
                if carrier.get("name") == carrier_name
            ),
            None,
        )

    def _get_related_carrier_temperatures(self, carrier_name: str):
        return sorted(
            carrier["temperature"]
            for carrier in self.esdl_carriers.values()
            if carrier_name
            and carrier.get("name", "").startswith(f"{carrier_name}_")
            and carrier["name"][len(f"{carrier_name}_") :].isdigit()
        )


class QTHProblem(
    _GoalsAndOptions,
    QTHMixin,
    HomotopyMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    pass


if __name__ == "__main__":
    sol = run_optimization_problem(
        HeatProblem,
        esdl_file_name="1a.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_import.xml",
    )
    results = sol.extract_results()
    a = 1
