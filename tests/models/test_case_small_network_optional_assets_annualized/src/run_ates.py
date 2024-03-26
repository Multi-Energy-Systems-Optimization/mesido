from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.techno_economic_mixin import TechnoEconomicMixin

import numpy as np

from rtctools.data.storage import DataStore
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
        self.function_range = (-1.0, 2.0 * max(target.values))
        self.function_nominal = np.median(target.values)

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state(self.state)


class MinimizeSourcesHeatCostGoal(Goal):
    priority = 2

    order = 1

    def __init__(self, source):
        self.target_max = 0.0
        self.function_range = (0.0, 1.0e6)
        self.source = source
        self.function_nominal = 1.0e6

    def function(self, optimization_problem, ensemble_member):
        return (
            optimization_problem.extra_variable(f"{self.source}__variable_operational_cost")
            + optimization_problem.extra_variable(f"{self.source}__investment_cost")
            + optimization_problem.extra_variable(f"{self.source}__installation_cost")
        )


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()

        for demand in self.energy_system_components["heat_demand"]:
            target = self.get_timeseries(f"{demand}.target_heat_demand")
            state = f"{demand}.Heat_demand"

            goals.append(TargetDemandGoal(state, target))

        return goals

    def goals(self):
        goals = super().goals().copy()
        for s in [
            *self.energy_system_components.get("heat_source", []),
            *self.energy_system_components.get("ates", []),
            *self.energy_system_components.get("heat_buffer", []),
        ]:
            goals.append(MinimizeSourcesHeatCostGoal(s))

        return goals


class HeatProblem(
    _GoalsAndOptions,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def path_goals(self):
        goals = super().path_goals().copy()

        return goals

    def energy_system_options(self):
        options = super().energy_system_options()
        self.heat_network_settings["minimum_velocity"] = 0.0
        options["neglect_pipe_heat_losses"] = True
        options["heat_loss_disconnected_pipe"] = False
        return options

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        # By default we do not add any constraints on the cyclic behaviour of the ates, as we
        # might want to do optimization over shorter periods of time where this would lead to
        # infeasibility. In this case we do want the cyclic behaviour, therefore we add it to the
        # problem.
        for a in self.energy_system_components.get("ates", []):
            stored_heat = self.state_vector(f"{a}.Stored_heat")
            constraints.append(((stored_heat[0] - stored_heat[-1]), 0.0, 0.0))

        return constraints

    def solver_options(self):
        options = super().solver_options()
        # options["solver"] = "gurobi"
        options["solver"] = "highs"

        return options

    def read(self):
        """
        Reads the yearly profile with hourly time steps and adapt to a daily averaged profile
        """
        super().read()

        demands = self.energy_system_components.get("heat_demand", [])
        new_datastore = DataStore(self)
        new_datastore.reference_datetime = self.io.datetimes[0]

        for ensemble_member in range(self.ensemble_size):
            nr_of_days = 10
            new_date_times = list()
            for day in range(nr_of_days):
                new_date_times.append(self.io.datetimes[day * 24])
            new_date_times = np.asarray(new_date_times)

            for demand in demands:
                var_name = f"{demand}.target_heat_demand"
                data = self.get_timeseries(
                    variable=var_name, ensemble_member=ensemble_member
                ).values
                new_data = list()
                for day in range(nr_of_days):
                    data_for_day = data[day * 24 : (day + 1) * 24]
                    new_data.append(np.mean(data_for_day))
                new_datastore.set_timeseries(
                    variable=var_name,
                    datetimes=new_date_times,
                    values=np.asarray(new_data),
                    ensemble_member=ensemble_member,
                    check_duplicates=True,
                )

            self.io = new_datastore


if __name__ == "__main__":
    solution = run_optimization_problem(
        HeatProblem,
        esdl_file_name="annualized_test_case_discount5.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="Warmte_test.csv",
    )
    results = solution.extract_results()
    print("Finished")
