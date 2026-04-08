import numpy as np

from mesido.workflows import EndScenarioSizingStaged


class EndScenarioSizingStagedEnsemble(
    EndScenarioSizingStaged,
):
    ## currently the goals are as in endscenariosizing, however, goals are ensemble_member
    # independent.

    csv_ensemble_mode = True

    def goals(self):
        goals = super().goals().copy()

        return goals

    def __fixed_max_size(self):
        constraints = []
        for heat_source in self.energy_system_components["heat_source"]:
            max_size_prev = self.extra_variable(f"{heat_source}__max_size", ensemble_member=0)
            for e_m in range(self.ensemble_size - 1):
                max_size = self.extra_variable(f"{heat_source}__max_size", ensemble_member=e_m + 1)
                constraints.append((max_size - max_size_prev, 0.0, 0.0))
                max_size_prev = max_size
        return constraints

    def __update_target_demand_constraint(self, ensemble_member):
        """
        This constraint method adds upper limits to the demand heat production based on the
        target of a specific ensemble. This requires the first ensemble to always have the
        timeseries with the largest values as the goals are only dependt on the first ensemble..
        """
        constraints = []
        for demand in self.energy_system_components["heat_demand"]:
            var = self.state_vector(f"{demand}.Heat_demand", ensemble_member=ensemble_member)
            nom = self.variable_nominal(f"{demand}.Heat_demand")
            target = np.asarray(
                self.get_timeseries(f"{demand}.target_heat_demand", ensemble_member).values
            )

            constraints.append((var * nom / nom, 0.0, target / nom))
        return constraints

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member).copy()
        constraints.extend(self.__fixed_max_size())
        constraints.extend(self.__update_target_demand_constraint(ensemble_member))
        return constraints

    def path_constraints(self, ensemble_member):
        constraints = super().path_constraints(ensemble_member).copy()

        return constraints