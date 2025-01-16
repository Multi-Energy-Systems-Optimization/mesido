import copy
import logging

import casadi as ca

from mesido.base_component_type_mixin import BaseComponentTypeMixin
from mesido.head_loss_class import HeadLossClass, HeadLossOption
from mesido.network_common import NetworkSettings

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.timeseries import Timeseries

logger = logging.getLogger("mesido")


class GasPhysicsMixin(BaseComponentTypeMixin, CollocatedIntegratedOptimizationProblem):
    __allowed_head_loss_options = {
        HeadLossOption.NO_HEADLOSS,
        HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY,
        HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY,
    }
    """
    This class is used to model the physics of a gas network with its assets. We model
    the different components with variety of linearization strategies.
    """

    def __init__(self, *args, **kwargs):
        r"""
        In this __init__ we prepare the dicts for the variables added by the HeatMixin class

        Gas network specific settings:

        The ``network_type`` is the network type identifier.

        The ``maximum_velocity`` is the maximum absolute value of the velocity in every pipe. This
        velocity is also used in the head loss / hydraulic power to calculate the maximum discharge
        if no maximum velocity per pipe class is not specified.

        The ``minimum_velocity`` is the minimum absolute value of the velocity
        in every pipe. It is mostly an option to improve the stability of the
        solver in a possibly subsequent QTH problem: the default value of
        `0.005` m/s helps the solver by avoiding the difficult case where
        discharges get close to zero.

        To model the head loss in pipes, the ``head_loss_option`` refers to
        one of the ways this can be done. See :class:`HeadLossOption` for more
        explanation on what each option entails. Note that some options model
        the head loss as an inequality, i.e. :math:`\Delta H \ge f(Q)`, whereas
        others model it as an equality.

        When ``HeadLossOption.CQ2_INEQUALITY`` is used, the wall roughness at
        ``estimated_velocity`` determines the `C` in :math:`\Delta H \ge C
        \cdot Q^2`.

        When ``HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY`` is used, the
        ``maximum_velocity`` needs to be set. The Darcy-Weisbach head loss
        relationship from :math:`v = 0` until :math:`v = \text{maximum_velocity}`
        will then be linearized using ``n_linearization`` lines.

        When ``HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY`` is used, the wall roughness at
        ``estimated_velocity`` determines the `C` in :math:`\Delta H = C \cdot
        Q`. For pipes that contain a control valve, the formulation of
        ``HeadLossOption.CQ2_INEQUALITY`` is used.

        When ``HeadLossOption.CQ2_EQUALITY`` is used, the wall roughness at
        ``estimated_velocity`` determines the `C` in :math:`\Delta H = C \cdot
        Q^2`. Note that this formulation is non-convex. At `theta < 1` we
        therefore use the formulation ``HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY``. For pipes
        that contain a control valve, the formulation of
        ``HeadLossOption.CQ2_INEQUALITY`` is used.

        When ``minimize_head_losses`` is set to True (default), a last
        priority is inserted where the head losses and hydraulic power in the system are
        minimized if the ``head_loss_option`` is not `NO_HEADLOSS`.
        This is related to the assumption that control valves are
        present in the system to steer water in the right direction the case
        of multiple routes. If such control valves are not present, enabling
        this option will give warnings in case the found solution is not
        feasible. In case the option is False, both the minimization and
        checks are skipped.

        Note that the inherited options ``head_loss_option`` and
        ``minimize_head_losses`` are changed from their default values to
        ``HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY`` and ``False`` respectively.

        The ``n_linearization_lines`` is the number of lines used when a curve is approximated by
        multiple linear lines.

        The ``pipe_minimum_pressure`` is the global minimum pressured allowed
        in the network. Similarly, ``pipe_maximum_pressure`` is the maximum
        one.
        """
        self.gas_network_settings = {
            "network_type": NetworkSettings.NETWORK_TYPE_GAS,
            "maximum_velocity": 15.0,
            "minimum_velocity": 0.005,
            "head_loss_option": HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY,
            "minimize_head_losses": False,
            "n_linearization_lines": 5,
            "pipe_minimum_pressure": -np.inf,
            "pipe_maximum_pressure": np.inf,
        }
        self._gn_head_loss_class = HeadLossClass(self.gas_network_settings)
        self.__gas_pipe_head_bounds = {}
        self.__gas_pipe_head_loss_var = {}
        self.__gas_pipe_head_loss_bounds = {}
        self.__gas_pipe_head_loss_nominals = {}
        self.__gas_pipe_head_loss_zero_bounds = {}
        self._gn_pipe_to_head_loss_map = {}

        # Boolean path-variable for the direction of the flow, inport to outport is positive flow.
        self.__gas_flow_direct_var = {}
        self.__gas_flow_direct_bounds = {}
        self._gas_pipe_to_flow_direct_map = {}

        # Still to be implemented
        # Boolean path-variable to determine whether flow is going through a pipe.
        # self.__gas_pipe_disconnect_var = {}
        # self.__gas_pipe_disconnect_var_bounds = {}
        # self._gas_pipe_disconnect_map = {}

        # Boolean variables for the linear line segment options per pipe.
        # TDOD: change name to _gas_pipe_...
        self.__gas_pipe_linear_line_segment_var = {}  # value 0/1: line segment - not active/active
        self.__gas_pipe_linear_line_segment_var_bounds = {}
        self._gas_pipe_linear_line_segment_map = {}

        super().__init__(*args, **kwargs)

        self._gas_pipe_topo_pipe_class_map = {}

        # self.__gas_pipe_disconnect_var = {}
        # self.__gas_pipe_disconnect_var_bounds = {}
        self._gas_pipe_disconnect_map = {}

        self.__gas_storage_discharge_var = {}
        self.__gas_storage_discharge_bounds = {}
        self.__gas_storage_discharge_nominals = {}
        self.__gas_storage_discharge_map = {}

        # Map for setting port variable nominals in the case they were not set during the model
        # parsing (logical links).
        self.__gas_node_variable_nominal = {}

    def gas_carriers(self):
        """
        This function should be overwritten by the problem and should give a dict with the
        carriers as keys and a list of temperatures as values.
        """
        return {}

    def pre(self):
        """
        In this pre method we fill the dicts initiated in the __init__. This means that we create
        the Casadi variables and determine the bounds, nominals and create maps for easier
        retrieving of the variables.
        """
        super().pre()

        options = self.energy_system_options()

        def _get_max_bound(bound):
            if isinstance(bound, np.ndarray):
                return max(bound)
            elif isinstance(bound, Timeseries):
                return max(bound.values)
            else:
                return bound

        def _get_min_bound(bound):
            if isinstance(bound, np.ndarray):
                return min(bound)
            elif isinstance(bound, Timeseries):
                return min(bound.values)
            else:
                return bound

        bounds = self.bounds()

        for pipe_name in self.energy_system_components.get("gas_pipe", []):
            head_loss_var = f"{pipe_name}.__head_loss"
            commodity = self.energy_system_components_commodity.get(pipe_name)
            # Note we always use the gas network type for the naming of variables, independent of
            # the gas mixture used.
            initialized_vars = self._gn_head_loss_class.initialize_variables_nominals_and_bounds(
                self,
                commodity,
                pipe_name,
                self.gas_network_settings,
            )
            if initialized_vars[0] != {}:
                self.__gas_pipe_head_bounds[f"{pipe_name}.{commodity}In.H"] = initialized_vars[0]
            if initialized_vars[1] != {}:
                self.__gas_pipe_head_bounds[f"{pipe_name}.{commodity}Out.H"] = initialized_vars[1]
            if initialized_vars[2] != {}:
                self.__gas_pipe_head_loss_zero_bounds[f"{pipe_name}.dH"] = initialized_vars[2]
            if initialized_vars[3] != {}:
                self._gn_pipe_to_head_loss_map[pipe_name] = initialized_vars[3]
            if initialized_vars[4] != {}:
                self.__gas_pipe_head_loss_var[head_loss_var] = initialized_vars[4]
            if initialized_vars[5] != {}:
                self.__gas_pipe_head_loss_nominals[f"{pipe_name}.dH"] = initialized_vars[5]
            if initialized_vars[6] != {}:
                self.__gas_pipe_head_loss_nominals[head_loss_var] = initialized_vars[6]
            if initialized_vars[7] != {}:
                self.__gas_pipe_head_loss_bounds[head_loss_var] = initialized_vars[7]

            if (
                initialized_vars[8] != {}
                and initialized_vars[9] != {}
                and initialized_vars[10] != {}
            ):  # Variables needed to indicate if a linear line segment is active
                self._gas_pipe_linear_line_segment_map[pipe_name] = {}
                for ii_line in range(self.gas_network_settings["n_linearization_lines"] * 2):
                    pipe_linear_line_segment_var_name = initialized_vars[8][ii_line]
                    self._gas_pipe_linear_line_segment_map[pipe_name][
                        ii_line
                    ] = pipe_linear_line_segment_var_name
                    self.__gas_pipe_linear_line_segment_var[pipe_linear_line_segment_var_name] = (
                        initialized_vars[9][pipe_linear_line_segment_var_name]
                    )
                    self.__gas_pipe_linear_line_segment_var_bounds[
                        pipe_linear_line_segment_var_name
                    ] = initialized_vars[10][pipe_linear_line_segment_var_name]

            # Integer variables
            flow_dir_var = f"{pipe_name}__gas_flow_direct_var"

            self._gas_pipe_to_flow_direct_map[pipe_name] = flow_dir_var
            self.__gas_flow_direct_var[flow_dir_var] = ca.MX.sym(flow_dir_var)

            # Fix the directions that are already implied by the bounds on milp
            # Nonnegative milp implies that flow direction Boolean is equal to one.
            # Nonpositive milp implies that flow direction Boolean is equal to zero.

            q_in_lb = _get_min_bound(bounds[f"{pipe_name}.GasIn.Q"][0])
            q_in_ub = _get_max_bound(bounds[f"{pipe_name}.GasIn.Q"][1])
            q_out_lb = _get_min_bound(bounds[f"{pipe_name}.GasOut.Q"][0])
            q_out_ub = _get_max_bound(bounds[f"{pipe_name}.GasOut.Q"][1])

            if (q_in_lb >= 0.0 and q_in_ub >= 0.0) or (q_out_lb >= 0.0 and q_out_ub >= 0.0):
                self.__gas_flow_direct_bounds[flow_dir_var] = (1.0, 1.0)
            elif (q_in_lb <= 0.0 and q_in_ub <= 0.0) or (q_out_lb <= 0.0 and q_out_ub <= 0.0):
                self.__gas_flow_direct_bounds[flow_dir_var] = (0.0, 0.0)
            else:
                self.__gas_flow_direct_bounds[flow_dir_var] = (0.0, 1.0)

            # # Still to be added in the future
            # if parameters[f"{pipe_name}.disconnectable"]:
            #     disconnected_var = f"{pipe_name}__is_disconnected"
            #     self._gas_pipe_disconnect_map[pipe_name] = disconnected_var
            #     self.__gas_pipe_disconnect_var[disconnected_var] = ca.MX.sym(disconnected_var)
            #     self.__gas_pipe_disconnect_var_bounds[disconnected_var] = (0.0, 1.0)

        self.__maximum_total_head_loss = self.__get_maximum_total_head_loss()

        if options["gas_storage_discharge_variables"]:
            for storage in self.energy_system_components.get("gas_tank_storage", []):
                bound_storage_q = -self.bounds()[f"{storage}.GasIn.Q"][0]
                if isinstance(bound_storage_q, Timeseries):
                    bound_storage_q = copy.deepcopy(bound_storage_q)
                    bound_storage_q.values[bound_storage_q.values < 0] = 0.0
                var_name = f"{storage}__Q_discharge"
                self.__gas_storage_discharge_map[storage] = var_name
                self.__gas_storage_discharge_var[var_name] = ca.MX.sym(var_name)
                self.__gas_storage_discharge_bounds[var_name] = (0, bound_storage_q)
                self.__gas_storage_discharge_nominals[var_name] = self.variable_nominal(
                    f"{storage}.GasIn.Q"
                )

        # Setting the node nominals using the connected assets.
        for node, connected_assets in self.energy_system_topology.gas_nodes.items():
            nominals = {}
            for var in ["Q", "H", "Hydraulic_power"]:
                nominals[var] = []
                for _, (asset, _orientation) in connected_assets.items():
                    var_nom = self.variable_nominal(f"{asset}.GasOut.{var}")
                    if var_nom != 1:
                        nominals[var].append(var_nom)
                    elif self.variable_nominal(f"{asset}.GasIn.{var}") != 1:
                        nominals[var].append(self.variable_nominal(f"{asset}.GasIn.{var}"))
                    else:
                        nominals[var].append(1)

                for i in range(len(connected_assets)):
                    if self.variable_nominal(f"{node}.GasConn[{i + 1}].{var}") == 1:
                        if nominals[var][i] != 1:
                            # Here we set a nominal based directly on the connected asset.
                            self.__gas_node_variable_nominal[f"{node}.GasConn[{i + 1}].{var}"] = (
                                nominals[var][i]
                            )
                        else:
                            # Here we set a nominal based on median of all the connected assets to
                            # the node. This is specifically done when we have a logical link for
                            # node to node. In this case we cannot set the nominal based on the
                            # connected node, hence we assume a node has at least one not node
                            # asset connected to it.
                            self.__gas_node_variable_nominal[f"{node}.GasConn[{i + 1}].{var}"] = (
                                np.median([x for x in nominals[var] if x != 1])
                                if np.sum(nominals[var]) != len(nominals[var])
                                else 1.0
                            )

    def energy_system_options(self):
        r"""
        Returns a dictionary of milp network specific options.

        gas_storage_discharge_variables: creates separate variables for the discharge of the
        gas_storages, only required when using the multicommodity simulator as this requires
        separate variables to create goals with.
        """

        options = self._gn_head_loss_class.head_loss_network_options()

        options["minimum_pressure_far_point"] = 1.0
        options["gas_storage_discharge_variables"] = False

        return options

    @property
    def extra_variables(self):
        """
        In this function we add all the variables defined in the HeatMixin to the optimization
        problem. Note that these are only the normal variables not path variables.
        """
        variables = super().extra_variables.copy()

        return variables

    @property
    def path_variables(self):
        """
        In this function we add all the path variables defined in the HeatMixin to the
        optimization problem. Note that path_variables are variables that are created for each
        time-step.
        """
        variables = super().path_variables.copy()
        variables.extend(self.__gas_pipe_head_loss_var.values())
        variables.extend(self.__gas_flow_direct_var.values())
        # variables.extend(self.__gas_pipe_disconnect_var.values())  # still to be implemented
        variables.extend(self.__gas_pipe_linear_line_segment_var.values())
        variables.extend(self.__gas_storage_discharge_var.values())

        return variables

    def variable_is_discrete(self, variable):
        """
        All variables that only can take integer values should be added to this function.
        """
        if (
            variable in self.__gas_flow_direct_var
            or variable in self.__gas_pipe_linear_line_segment_var
        ):
            return True
        else:
            return super().variable_is_discrete(variable)

    def variable_nominal(self, variable):
        """
        In this function we add all the nominals for the variables defined/added in the HeatMixin.
        """

        if variable in self.__gas_pipe_head_loss_nominals:
            return self.__gas_pipe_head_loss_nominals[variable]
        elif variable in self.__gas_storage_discharge_nominals:
            return self.__gas_storage_discharge_nominals[variable]
        elif variable in self.__gas_node_variable_nominal:
            return self.__gas_node_variable_nominal[variable]
        else:
            return super().variable_nominal(variable)

    def bounds(self):
        """
        In this function we add the bounds to the problem for all the variables defined/added in
        the HeatMixin.
        """
        bounds = super().bounds()

        bounds.update(self.__gas_flow_direct_bounds)
        # bounds.update(self.__gas_pipe_disconnect_var_bounds)  # still to be implemented
        bounds.update(self.__gas_pipe_head_loss_bounds)
        bounds.update(self.__gas_pipe_head_loss_zero_bounds)
        bounds.update(self.__gas_pipe_linear_line_segment_var_bounds)
        bounds.update(self.__gas_storage_discharge_bounds)

        for k, v in self.__gas_pipe_head_bounds.items():
            bounds[k] = self.merge_bounds(bounds[k], v)

        return bounds

    def path_goals(self):
        """
        Here we add the goals for minimizing the head loss and hydraulic power depending on the
        configuration. Please note that we only do hydraulic power for the MILP problem thus only
        for the linearized head_loss options.
        """
        g = super().path_goals().copy()

        if (
            self.gas_network_settings["minimize_head_losses"]
            and self.gas_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS
        ):
            g.append(
                self._gn_head_loss_class._hn_minimization_goal_class(
                    self, self.gas_network_settings
                )
            )
            if (
                self.gas_network_settings["head_loss_option"]
                == HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
                or self.gas_network_settings["head_loss_option"]
                == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
            ):
                g.append(
                    self._gn_head_loss_class._hpwr_minimization_goal_class(
                        self,
                        self.gas_network_settings,
                    )
                )

        return g

    def __get_maximum_total_head_loss(self):
        """
        Get an upper bound on the maximum total head loss that can be used in
        big-M formulations of e.g. check valves and disconnectable pipes.

        There are multiple ways to calculate this upper bound, depending on
        what options are set. We compute all these upper bounds, and return
        the lowest one of them.
        """

        options = self.energy_system_options()
        components = self.energy_system_components

        if self.gas_network_settings["head_loss_option"] == HeadLossOption.NO_HEADLOSS:
            # Undefined, and all constraints using this methods value should
            # be skipped.
            return np.nan

        # Summing head loss in pipes
        max_sum_dh_pipes = 0.0

        for ensemble_member in range(self.ensemble_size):
            parameters = self.parameters(ensemble_member)

            head_loss = 0.0

            for pipe in components.get("gas_pipe", []):
                area = parameters[f"{pipe}.area"]
                max_discharge = self.gas_network_settings["maximum_velocity"] * area
                head_loss += self._gn_head_loss_class._hn_pipe_head_loss(
                    pipe,
                    self,
                    options,
                    self.gas_network_settings,
                    parameters,
                    max_discharge,
                    # network_type=self.gas_network_settings["network_type"],
                    pressure=parameters[f"{pipe}.pressure"],
                )

            head_loss += options["minimum_pressure_far_point"] * 10.2

            max_sum_dh_pipes = max(max_sum_dh_pipes, head_loss)

        # Maximum pressure difference allowed with user options
        # NOTE: Does not yet take elevation differences into acccount
        max_dh_network_options = (
            self.gas_network_settings["pipe_maximum_pressure"]
            - self.gas_network_settings["pipe_minimum_pressure"]
        ) * 10.2

        return min(max_sum_dh_pipes, max_dh_network_options)

    def __gas_node_mixing_path_constraints(self, ensemble_member):
        """
        This function adds constraints for each gas network node/joint to have as much
        flow going in as out. Effectively, it is setting the sum of flow to zero.
        """
        constraints = []

        for node, connected_pipes in self.energy_system_topology.gas_nodes.items():
            q_sum = 0.0
            q_nominals = []

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                gas_conn = f"{node}.GasConn[{i_conn + 1}].Q"
                q_sum += orientation * self.state(gas_conn)
                q_nominals.append(self.variable_nominal(gas_conn))

            q_nominal = np.median(q_nominals)
            constraints.append((q_sum / q_nominal, 0.0, 0.0))

        return constraints

    def __gas_node_hydraulic_power_mixing_path_constraints(self, ensemble_member):
        """
        This function adds constraints to ensure that the incoming hydraulic power equals the
        outgoing hydraulic power. We assume constant density throughout a hydraulically coupled
        system and thus these constraints are needed for mass conservation.
        """
        constraints = []

        for node, connected_pipes in self.energy_system_topology.gas_nodes.items():
            q_sum = 0.0
            q_nominals = []

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                q_conn = f"{node}.GasConn[{i_conn + 1}].Hydraulic_power"
                q_sum += orientation * self.state(q_conn)
                q_nominals.append(self.variable_nominal(q_conn))

            q_nominal = np.median(q_nominals)
            constraints.append((q_sum / q_nominal, 0.0, 0.0))

        return constraints

    def __state_vector_scaled(self, variable, ensemble_member):
        """
        This functions returns the casadi symbols scaled with their nominal for the entire time
        horizon.
        """
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )

    def __flow_direction_path_constraints(self, ensemble_member):
        """
        This function adds constraints to set the direction in pipes and determine whether a pipe
        is utilized at all (is_disconnected variable).

        Whether a pipe is connected is based upon whether flow passes through that pipe.

        The directions are set based upon the directions of how thermal power propegates. This is
        done based upon the sign of the Heat variable. Where positive Heat means a positive
        direction and negative milp means a negative direction. By default, positive is defined from
        HeatIn to HeatOut.

        Finally, a minimum flow can be set. This can sometimes be useful for numerical stability.
        """
        constraints = []

        # Also ensure that the discharge has the same sign as the milp.
        for p in self.energy_system_components.get("gas_pipe", []):
            flow_dir_var = self._gas_pipe_to_flow_direct_map[p]
            flow_dir = self.state(flow_dir_var)

            q_in = self.state(f"{p}.GasIn.Q")

            big_m = 2.0 * np.max(
                np.abs(
                    (
                        *self.bounds()[f"{p}.GasIn.Q"],
                        *self.bounds()[f"{p}.GasOut.Q"],
                    )
                )
            )

            # Note we only need one on the milp as the desired behaviour is propegated by the
            # constraints heat_in - heat_out - heat_loss == 0.
            constraints.append(
                (
                    (q_in - big_m * flow_dir) / big_m,
                    -np.inf,
                    0.0,
                )
            )
            constraints.append(
                (
                    (q_in + big_m * (1 - flow_dir)) / big_m,
                    0.0,
                    np.inf,
                )
            )

        # Pipes that are connected in series should have the same milp direction.
        for pipes in self.energy_system_topology.pipe_series:
            if len(pipes) <= 1:
                continue

            base_flow_dir_var = self.state(self._gas_pipe_to_flow_direct_map[pipes[0]])

            for p in pipes[1:]:
                flow_dir_var = self.state(self._gas_pipe_to_flow_direct_map[p])
                constraints.append((base_flow_dir_var - flow_dir_var, 0.0, 0.0))

        return constraints

    def __gas_storage_discharge_path_constraints(self, ensemble_member):
        """
        The discharge variables are added such that two separate goals for charging and discharging
        can be created. The discharging variable has a lower bound of 0 and should always be larger
        or equal to the negative of the inflow variable. This allows for first a minimization of
        the discharging and afterwards an maximisation of the charging without conflicting goals or
        constraints.
        """
        constraints = []
        options = self.energy_system_options()

        if options["gas_storage_discharge_variables"]:
            for storage in self.energy_system_components.get("gas_tank_storage", []):
                storage_charge_var = self.state(f"{storage}.GasIn.Q")
                storage_discharge_var_name = f"{storage}__Q_discharge"
                storage_discharge_var = self.state(storage_discharge_var_name)
                nominal = self.variable_nominal(storage_discharge_var_name)

                # Q_discharge >= -Q
                constraints.append(
                    ((storage_discharge_var + storage_charge_var) / nominal, 0.0, np.inf)
                )

        return constraints

    def path_constraints(self, ensemble_member):
        """
        Here we add all the path constraints to the optimization problem. Please note that the
        path constraints are the constraints that are applied to each time-step in the problem.
        """

        constraints = super().path_constraints(ensemble_member)

        constraints.extend(self.__gas_node_mixing_path_constraints(ensemble_member))

        # Add source/demand head loss constrains only if head loss is non-zero
        if self.gas_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS:
            constraints.extend(
                self._gn_head_loss_class._pipe_head_loss_path_constraints(self, ensemble_member)
            )
            constraints.extend(
                self._gn_head_loss_class._pipe_hydraulic_power_path_constraints(
                    self, self.__maximum_total_head_loss, ensemble_member
                )
            )
        constraints.extend(self.__flow_direction_path_constraints(ensemble_member))
        constraints.extend(self.__gas_node_hydraulic_power_mixing_path_constraints(ensemble_member))
        constraints.extend(self.__gas_storage_discharge_path_constraints(ensemble_member))

        return constraints

    def constraints(self, ensemble_member):
        """
        This function adds the normal constraints to the problem. Unlike the path constraints these
        are not applied to every time-step in the problem. Meaning that these constraints either
        consider global variables that are independent of time-step or that the relevant time-steps
        are indexed within the constraint formulation.
        """
        constraints = super().constraints(ensemble_member)

        if self.gas_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS:
            constraints.extend(
                self._gn_head_loss_class._pipe_head_loss_constraints(
                    self, self.__maximum_total_head_loss, ensemble_member
                )
            )

        return constraints

    def goal_programming_options(self):
        """
        Here we set the goal programming configuration. We use soft constraints for consecutive
        goals.
        """
        options = super().goal_programming_options()
        options["keep_soft_constraints"] = True
        return options

    def solver_options(self):
        """
        Here we define the solver options. By default we use the open-source solver cbc and casadi
        solver qpsol.
        """
        options = super().solver_options()
        options["casadi_solver"] = "qpsol"
        options["solver"] = "highs"
        return options

    def compiler_options(self):
        """
        In this function we set the compiler configuration.
        """
        options = super().compiler_options()
        options["resolve_parameter_values"] = True
        return options

    def priority_completed(self, priority):
        """
        This function is called after a priority of goals is completed. This function is used to
        specify operations between consecutive goals. Here we set some parameter attributes after
        the optimization is completed.
        """
        options = self.energy_system_options()

        if (
            self.gas_network_settings["minimize_head_losses"]
            and self.gas_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS
            and priority == self._gn_head_loss_class._hn_minimization_goal_class.priority
        ):
            components = self.energy_system_components

            rtol = 1e-5
            atol = 1e-4

            for ensemble_member in range(self.ensemble_size):
                parameters = self.parameters(ensemble_member)
                results = self.extract_results(ensemble_member)

                for pipe in components.get("gas_pipe", []):
                    # if parameters[f"{pipe}.has_control_valve"]: # not used at all
                    #     continue

                    # Just like with a control valve, if pipe is disconnected
                    # there is nothing to check.
                    q_full = results[f"{pipe}.Q"]
                    # if parameters[f"{pipe}.disconnectable"]: # not used yet
                    #     inds = q_full != 0.0
                    # else:
                    #     inds = np.arange(len(q_full), dtype=int)
                    inds = np.arange(len(q_full), dtype=int)

                    if parameters[f"{pipe}.diameter"] == 0.0:
                        # Pipe is disconnected. Head loss is free, so nothing to check.
                        continue

                    q = results[f"{pipe}.Q"][inds]
                    head_loss_target = self._gn_head_loss_class._hn_pipe_head_loss(
                        pipe,
                        self,
                        options,
                        self.gas_network_settings,
                        parameters,
                        q,
                        None,
                        # network_type=self.gas_network_settings["network_type"],
                        pressure=parameters[f"{pipe}.pressure"],
                    )
                    if (
                        self.gas_network_settings["head_loss_option"]
                        == HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
                    ):
                        head_loss = np.abs(results[f"{pipe}.dH"][inds])
                    else:
                        head_loss = results[self._gn_pipe_to_head_loss_map[pipe]][inds]

                    if not np.allclose(head_loss, head_loss_target, rtol=rtol, atol=atol):
                        logger.warning(
                            f"Pipe {pipe} has artificial head loss; "
                            f"at least one more control valve should be added to the network."
                        )

        super().priority_completed(priority)
