from typing import Dict, List, Tuple

import casadi as ca

from mesido.qth_not_maintained.qth_mixin import HeadLossOption, QTHMixin

import numpy as np

from rtctools._internal.alias_tools import AliasDict
from rtctools.optimization.goal_programming_mixin_base import Goal
from rtctools.optimization.timeseries import Timeseries


class BufferTargetDischargeGoal(Goal):
    def __init__(
        self,
        buffer: str,
        time: float,
        target: float,
        function_range: Tuple[float, float],
        *args,
        priority=2,
        **kwargs,
    ):
        super().__init__(*args, **kwargs)

        self.buffer = buffer

        self.priority = priority

        self._time = time
        self.target_min = target
        self.target_max = target

        self.function_range = function_range
        self.function_nominal = max(np.abs(function_range)) / 2.0

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state_at(
            f"{self.buffer}.Q_hot_pipe", self._time, ensemble_member
        )


class QTHLoopMixin(QTHMixin):
    """
    Alternative to QTHMixin when the assumptions of sufficient hydraulic
    control do not hold for a certain milp network. This Mixin runs 1 timestep
    at a time, and solves with the `CQ2_EQUALITY` head loss option to get to a
    hydraulically feasible result for such milp networks.
    More precisely, the Mixin loops over the time horizon optimizing two
    timesteps at each iteration where the solution of first timestep is de facto
    fixed, using the result of the previous iteration of the loop. As IPOPT does
    not tolerate trivial constraints, we fix the minimum amount of necessary information.
    That is, the temperature of all the sources and buffers and all the discharges
    within the network.
    Moreover, tote that some values and defaults of QTHMixin are overruled that:

    - Do not make sense when optimizing a single time step

    - Can more readily lead to infeasible problems when not optimizing the
      whole horizon at once.

    Not optimizing over the whole horizon also means that some (former)
    control inputs now need to be prescribed, most notably the discharge to
    and from buffers. It is recommendable that these goals are added inbetween
    the goals related to the demands and the ones related to the sources.
    See :class:`buffer_target_discharges` and :class:`BufferTargetDischargeGoal`,
    and the helper method :meth:`buffer_target_discharge_goals`
    """

    def __init__(self, *args, flow_directions=None, buffer_target_discharges=None, **kwargs):
        super().__init__(*args, flow_directions=flow_directions, **kwargs)

        self.__buffer_target_discharges = buffer_target_discharges

        self.__extended_history = None
        self.__expose_all_results = False
        self.__all_results = []

    def pre(self):
        super().pre()

        if self.__tstep == 0:
            homotopy_options = self.homotopy_options()
            self.__homotopy_theta = homotopy_options["homotopy_parameter"]
            self.__extended_history = None
            self.__expose_all_results = False
            self.__all_results = []

    @property
    def buffer_target_discharges(self) -> Dict[str, Timeseries]:
        return self.__buffer_target_discharges

    def buffer_target_discharge_goals(
        self, priority=2, function_range_max_fac=2.0
    ) -> List[BufferTargetDischargeGoal]:
        goals = []
        times = self.times()

        for b, t in self.buffer_target_discharges.items():
            function_range_max = max(np.abs(t.values)) * function_range_max_fac
            target = self.interpolate(times[1], t.times, t.values)
            function_range = (-function_range_max, function_range_max)
            goals.append(
                BufferTargetDischargeGoal(b, times[1], target, function_range, priority=priority)
            )

        return goals

    def goal_programming_options(self):
        options = super().goal_programming_options()

        # The optimization problems only have two timesteps, and issues due to
        # overconstraining it are more likely than leaving too much freedom.
        options["keep_soft_constraints"] = True

        return options

    def heat_network_options(self):
        """
        Returns a dictionary of milp network specific options.

        See :py:meth:`QTHMixin.heat_network_options` for all options. When
        inheriting from QTHLoopMixin, some defaults are changed:

        - `head_loss_option` is CQ2_EQUALITY
        - `max_t_der_bidirect_pipe` is False
        The latter is due to the fact that the loop optimization does not
        allow to control the temperatures within the buffer.
        """

        options = super().heat_network_options()
        self.heat_network_settings["head_loss_option"] = HeadLossOption.CQ2_EQUALITY
        options["max_t_der_bidirect_pipe"] = False
        return options

    def homotopy_options(self):
        options = super().homotopy_options()

        if self.__tstep > 0:
            options["theta_start"] = 1.0

        return options

    def times(self, variable=None):
        times = super().times(variable)
        if self.__expose_all_results:
            return times[: self.__tstep + 2]
        else:
            return times[self.__tstep : self.__tstep + 2]

    def parameters(self, ensemble_member):
        parameters = super().parameters(ensemble_member)

        if self.__tstep > 0:
            parameters[self.__homotopy_theta] = 1.0

        return parameters

    def __check_goals(self):
        if not len(self.times()) == 2:
            raise Exception("QTHLoopMixin is only allowed to run with 2 time steps")

        buffer_goals = {
            g.buffer: g for g in self.goals() if isinstance(g, BufferTargetDischargeGoal)
        }

        for b in self.energy_system_topology.buffers:
            if b not in buffer_goals:
                raise Exception(f"Buffer {b} is missing a corresponding BufferTargetDischargeGoal")

    def __process_results(self):
        """
        We do two things:

        1. We append the t0 of the current solution to the history (it becomes "t-1"
           for the next run)

        2. We store _part of_ the t1 results of the current solution, which will
           become the next t0 history

        Note that we don't want to mess with the original history AliasDict to avoid
        unexpected side-effects, which is why we make a deepcopy.
        """

        if self.__tstep == 0:
            assert self.__extended_history is None

            self.__extended_history = []

            for ensemble_member in range(self.ensemble_size):
                history = self.history(ensemble_member)
                extended_history = history.copy()

                # Make the copy "deep" by reinstantiating the Timeseries
                for k, v in extended_history.items():
                    extended_history[k] = Timeseries(v.times, v.values)

                self.__extended_history.append(extended_history)

        times = self.times()
        self.__prev_t1_solver_output = self.solver_output.copy()
        self.__prev_t1_solution_dict = []

        if self.__all_results is None:
            self.__all_results = []

        for ensemble_member in range(self.ensemble_size):
            results = self.extract_results(ensemble_member)

            if len(self.__all_results) <= ensemble_member:
                self.__all_results.append(AliasDict(self.alias_relation))
            cur_all_results = self.__all_results[ensemble_member]

            extended_history = self.__extended_history[ensemble_member]
            prev_solution = {}

            for k, v in results.items():
                if len(v) == 1:
                    # Initial derivative type of stuff
                    continue

                if self.__tstep == 0:
                    extended_history[k] = Timeseries(times, [v[0], np.nan])
                else:
                    ts = extended_history[k]
                    extended_history[k] = Timeseries(
                        [*ts.times[:-1], *times], [*ts.values[:-1], v[0], np.nan]
                    )

                if self.__tstep == 0:
                    cur_all_results[k] = [v[0], v[1]]
                else:
                    cur_all_results[k].append(v[1])

                prev_solution[k] = v[1]

            self.__prev_t1_solution_dict.append(prev_solution)

    def history(self, ensemble_member):
        if self.__tstep > 0:
            return self.__extended_history[ensemble_member]
        else:
            return super().history(ensemble_member)

    def seed(self, ensemble_member):
        seed = super().seed(ensemble_member)

        if self.__tstep > 0:
            times = self.times()

            for k, v in self.__prev_t1_solution_dict[ensemble_member].items():
                seed[k] = Timeseries(times, [v, v])

        return seed

    def transcribe(self):
        discrete, lbx, ubx, lbg, ubg, x0, nlp = super().transcribe()

        if self.__tstep > 0:
            # We overrule here instead of in bounds(), because bounds() does
            # not support per-ensemble-member bounds. The collocation indices
            # are private for now, but will become part of the public API soon.
            parameters = self.parameters(0)
            assert parameters[self.__homotopy_theta] == 1.0

            lb = np.full_like(lbx, -np.inf)
            ub = np.full_like(ubx, np.inf)

            fix_value_variables = set()

            for s in self.energy_system_components["source"]:
                fix_value_variables.add(self.alias_relation.canonical_signed(f"{s}.QTHOut.T")[0])

            for b in self.energy_system_components.get("buffer", []):
                fix_value_variables.add(self.alias_relation.canonical_signed(f"{b}.T_hot_tank")[0])
                fix_value_variables.add(self.alias_relation.canonical_signed(f"{b}.T_cold_tank")[0])

            for p in self.energy_system_components["pipe"]:
                fix_value_variables.add(self.alias_relation.canonical_signed(f"{p}.Q")[0])

            previous_indices = self.__previous_indices
            current_indices = self._CollocatedIntegratedOptimizationProblem__indices_as_lists

            for ensemble_member in range(self.ensemble_size):
                for v in fix_value_variables:
                    cur_inds = current_indices[ensemble_member][v]
                    prev_inds = previous_indices[ensemble_member][v]

                    assert len(cur_inds) == 2
                    assert len(prev_inds) == 2

                    ub[cur_inds[0]] = lb[cur_inds[0]] = self.__prev_t1_solver_output[prev_inds[1]]

            lbx = np.maximum(lbx, lb)
            ubx = np.minimum(ubx, ub)

            # Sometimes rounding errors can change the ulp, leading to lbx
            # becomes slightly (~1E-15) larger than ubx. Fix by setting
            # equality entries explicitly.
            inds = lb == ub
            lbx[inds] = ubx[inds] = lb[inds]

            assert np.all(lbx <= ubx)

        self.__previous_indices = self._CollocatedIntegratedOptimizationProblem__indices_as_lists

        return discrete, lbx, ubx, lbg, ubg, x0, nlp

    def extract_results(self, ensemble_member=0):
        if self.__expose_all_results:
            return self.__all_results[ensemble_member]
        else:
            return super().extract_results(ensemble_member)

    def optimize(
        self,
        preprocessing: bool = True,
        postprocessing: bool = True,
        log_solver_failure_as_error: bool = True,
    ) -> bool:
        self.__tstep = 0

        if preprocessing:
            self.pre()

        n_times = len(super().times())

        self.__check_goals()

        for self.__tstep in range(n_times - 1):
            success = super().optimize(preprocessing=preprocessing, postprocessing=False)
            self.__process_results()

            if not success:
                break

            if self.__tstep == 0:
                # We will get rid of the initial residual from the next run
                # onwards, so clear the cache.
                self.clear_transcription_cache()

        for results in self.__all_results:
            for k, v in results.items():
                results[k] = np.array(v)

        self.__expose_all_results = True

        if postprocessing:
            self.post()

    @property
    def initial_residual(self):
        if self.__tstep > 0:
            return ca.MX()
        else:
            return super().initial_residual
