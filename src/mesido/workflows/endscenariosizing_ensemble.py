import numpy as np

from mesido.workflows import EndScenarioSizingStaged


class EndScenarioSizingStagedEnsemble(
    EndScenarioSizingStaged,
):
    ## currently the goals are as in endscenariosizing, however, goals are ensemble_member
    # independent.

    csv_ensemble_mode = True

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def goals(self):
        goals = super().goals().copy()

        return goals

    def __fixed_max_size_producer(self):
        constraints = []
        for heat_source in [*self.energy_system_components.get("heat_source", []),
                            *self.energy_system_components.get("ates", []),
                            *self.energy_system_components.get("heat_buffer", [])]:
                max_size_prev = self.extra_variable(f"{heat_source}__max_size", ensemble_member=0)
                aggregation_prev = self.get_aggregation_count_var(heat_source, 0)
                for e_m in range(self.ensemble_size - 1):
                    max_size = self.extra_variable(f"{heat_source}__max_size", ensemble_member=e_m + 1)
                    constraints.append((max_size - max_size_prev, 0.0, 0.0))
                    max_size_prev = max_size
                    aggregation = self.get_aggregation_count_var(heat_source, e_m+1)
                    constraints.append((aggregation - aggregation_prev, 0.0, 0.0))
        return constraints

    def __fixed_max_size_pipes(self):
        constraints = []
        set_self_hot_pipes = set(self.hot_pipes)
        for heat_pipe in self.energy_system_components["heat_pipe"]:
            if heat_pipe in self._heat_pipe_topo_pipe_class_map.keys():
                pipe_classes = self._heat_pipe_topo_pipe_class_map[heat_pipe]
                for pc in pipe_classes:
                    neighbour = self.has_related_pipe(heat_pipe)
                    if neighbour and heat_pipe not in set_self_hot_pipes:
                        var_name = f"{self.cold_to_hot_pipe(heat_pipe)}__hn_pipe_class_{pc.name}"
                    else:
                        var_name = f"{heat_pipe}__hn_pipe_class_{pc.name}"
                    max_size_prev = self.extra_variable(var_name, ensemble_member=0)
                    for e_m in range(self.ensemble_size - 1):
                        max_size = self.extra_variable(var_name, ensemble_member=e_m + 1)
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
        constraints.extend(self.__fixed_max_size_producer())
        constraints.extend(self.__fixed_max_size_pipes())
        constraints.extend(self.__update_target_demand_constraint(ensemble_member))

        return constraints

    def path_constraints(self, ensemble_member):
        constraints = super().path_constraints(ensemble_member).copy()

        return constraints
