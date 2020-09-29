import logging

import casadi as ca

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.timeseries import Timeseries

from .base_component_type_mixin import BaseComponentTypeMixin


logger = logging.getLogger("rtctools_heat_network")


class HeatMixin(BaseComponentTypeMixin, CollocatedIntegratedOptimizationProblem):
    def __init__(self, *args, **kwargs):
        # Prepare dicts for additional variables
        self.__flow_direct_var = {}
        self.__flow_direct_bounds = {}
        self.__pipe_to_flow_direct_map = {}

        super().__init__(*args, **kwargs)

    def pre(self):
        super().pre()

        # Mixed-integer formulation applies only to hot pipes.
        for p in self.__hot_pipes:
            flow_dir_var = f"{p}__flow_direct_var"

            self.__pipe_to_flow_direct_map[p] = flow_dir_var
            self.__flow_direct_var[flow_dir_var] = ca.MX.sym(flow_dir_var)
            self.__flow_direct_bounds[flow_dir_var] = (0.0, 1.0)

    def heat_network_options(self):
        r"""
        Returns a dictionary of heat network specific options.

        +--------------------------------+-----------+-----------------------------+
        | Option                         | Type      | Default value               |
        +================================+===========+========================-----+
        | ``maximum_temperature_der``    | ``float`` | ``2.0`` °C/hour             |
        +--------------------------------+-----------+-----------------------------+
        | ``maximum_flow_der``           | ``float`` | ``np.inf`` m3/s/hour        |
        +--------------------------------+-----------+-----------------------------+

        The ``maximum_temperature_der`` gives the maximum temperature change
        per hour. Similarly, the ``maximum_flow_der`` parameter gives the
        maximum flow change per hour. These options together are used to
        constrain the maximum heat change per hour allowed in the entire
        network. Note the unit for flow is m3/s, but the change is expressed
        on an hourly basis leading to the ``m3/s/hour`` unit."""

        options = {}

        options["maximum_temperature_der"] = 2.0
        options["maximum_flow_der"] = np.inf

        return options

    @property
    def __cold_pipes(self):
        return [p for p in self.heat_network_components["pipe"] if p.endswith("_cold")]

    @property
    def __hot_pipes(self):
        return [p for p in self.heat_network_components["pipe"] if p.endswith("_hot")]

    @property
    def path_variables(self):
        variables = super().path_variables.copy()
        variables.extend(self.__flow_direct_var.values())
        return variables

    def variable_is_discrete(self, variable):
        if variable in self.__flow_direct_var:
            return True
        else:
            return super().variable_is_discrete(variable)

    def bounds(self):
        bounds = super().bounds()
        bounds.update(self.__flow_direct_bounds)
        return bounds

    def parameters(self, ensemble_member):
        parameters = super().parameters(ensemble_member)

        for p in self.heat_network_components["pipe"]:
            length = parameters[f"{p}.length"]
            u_1 = parameters[f"{p}.U_1"]
            u_2 = parameters[f"{p}.U_2"]
            temperature = parameters[f"{p}.temperature"]
            temperature_ground = parameters[f"{p}.T_g"]
            sign_dtemp = 1 if p.endswith("_hot") else -1
            dtemp = sign_dtemp * (parameters[f"{p}.T_supply"] - parameters[f"{p}.T_return"])

            heat_loss = (
                length * (u_1 - u_2) * temperature
                - (length * (u_1 - u_2) * temperature_ground)
                + (length * u_2 * dtemp)
            )

            if heat_loss < 0:
                raise Exception(f"Heat loss of pipe {p} should be nonnegative.")

            parameters[f"{p}.Heat_loss"] = heat_loss

        return parameters

    def __pipe_rate_heat_change_path_constraints(self, ensemble_member):
        constraints = []

        parameters = self.parameters(ensemble_member)
        hn_options = self.heat_network_options()

        t_change = hn_options["maximum_temperature_der"]
        q_change = hn_options["maximum_flow_der"]

        for p in self.__hot_pipes:
            der_heat_in = self.der(f"{p}.HeatIn.Heat") * 3600.0

            cp = parameters[f"{p}.cp"]
            rho = parameters[f"{p}.rho"]
            heat_change = t_change * q_change * cp * rho

            if heat_change < 0:
                raise Exception(f"Heat change of pipe {p} should be nonnegative.")
            elif not np.isfinite(heat_change):
                continue

            heat_nominal = self.variable_nominal(f"{p}.HeatIn.Heat")

            constraints.append(
                (
                    der_heat_in / heat_nominal,
                    -heat_change / heat_nominal,
                    heat_change / heat_nominal,
                )
            )

        return constraints

    def __node_mixing_path_constraints(self, ensemble_member):
        constraints = []

        for node, connected_pipes in self.heat_network_topology.nodes.items():
            heat_sum = 0.0
            heat_nominals = []

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                heat_conn = f"{node}.HeatConn[{i_conn + 1}].Heat"
                heat_sum += orientation * self.state(heat_conn)
                heat_nominals.append(self.variable_nominal(heat_conn))

            heat_nominal = np.median(heat_nominals)
            constraints.append((heat_sum / heat_nominal, 0.0, 0.0))

        return constraints

    def __heat_loss_path_constraints(self, ensemble_member):
        constraints = []
        parameters = self.parameters(ensemble_member)

        for p in self.__cold_pipes:
            heat_in = self.state(f"{p}.HeatIn.Heat")
            heat_out = self.state(f"{p}.HeatOut.Heat")

            constraints.append((heat_in - heat_out, 0.0, 0.0))

        for p in self.__hot_pipes:
            heat_loss = parameters[f"{p}.Heat_loss"]
            heat_nominal = self.variable_nominal(f"{p}.HeatIn.Heat")

            flow_dir_var = self.__pipe_to_flow_direct_map[p]

            heat_in = self.state(f"{p}.HeatIn.Heat")
            heat_out = self.state(f"{p}.HeatOut.Heat")
            flow_dir = self.state(flow_dir_var)

            # Heat loss constraint
            constraints.append(
                ((heat_in - heat_out + (1 - 2 * flow_dir) * heat_loss) / heat_nominal, 0.0, 0.0)
            )

        return constraints

    def __flow_direction_path_constraints(self, ensemble_member):
        constraints = []

        def _get_abs_max_bounds(*bounds):
            max_ = 0.0

            for b in bounds:
                if isinstance(b, np.ndarray):
                    max_ = max(max_, max(abs(b)))
                elif isinstance(b, Timeseries):
                    max_ = max(max_, max(abs(b.values)))
                else:
                    max_ = max(max_, abs(b))

            return max_

        bounds = self.bounds()

        for p in self.__hot_pipes:
            flow_dir_var = self.__pipe_to_flow_direct_map[p]

            heat_in = self.state(f"{p}.HeatIn.Heat")
            heat_out = self.state(f"{p}.HeatOut.Heat")
            flow_dir = self.state(flow_dir_var)

            big_m = _get_abs_max_bounds(
                *self.merge_bounds(bounds[f"{p}.HeatIn.Heat"], bounds[f"{p}.HeatOut.Heat"])
            )

            if not np.isfinite(big_m):
                raise Exception(f"Heat in pipe {p} must be bounded")

            # Fix flow direction
            constraints.append(((heat_in - big_m * flow_dir) / big_m, -np.inf, 0.0))
            constraints.append(((heat_in + big_m * (1 - flow_dir)) / big_m, 0.0, np.inf))

            # Flow direction is the same for In and Out. Note that this
            # ensures that the heat going in and/or out of a pipe is more than
            # its heat losses.
            constraints.append(((heat_out - big_m * flow_dir) / big_m, -np.inf, 0.0))
            constraints.append(((heat_out + big_m * (1 - flow_dir)) / big_m, 0.0, np.inf))

        # Pipes that are connected in series should have the same heat direction.
        for pipes in self.heat_network_topology.pipe_series:
            if len(pipes) <= 1:
                continue

            assert (
                len({p for p in pipes if p.endswith("_cold")}) == 0
            ), "Pipe series for Heat models should only contain hot pipes"

            base_flow_dir_var = self.state(self.__pipe_to_flow_direct_map[pipes[0]])

            for p in pipes[1:]:
                flow_dir_var = self.state(self.__pipe_to_flow_direct_map[p])
                constraints.append((base_flow_dir_var - flow_dir_var, 0.0, 0.0))

        return constraints

    def path_constraints(self, ensemble_member):
        constraints = super().path_constraints(ensemble_member)

        constraints.extend(self.__pipe_rate_heat_change_path_constraints(ensemble_member))
        constraints.extend(self.__node_mixing_path_constraints(ensemble_member))
        constraints.extend(self.__heat_loss_path_constraints(ensemble_member))
        constraints.extend(self.__flow_direction_path_constraints(ensemble_member))

        return constraints

    def solver_options(self):
        options = super().solver_options()
        options["casadi_solver"] = "qpsol"
        options["solver"] = "cbc"
        return options

    def post(self):
        super().post()

        results = self.extract_results()

        # The flow directions are the same as the heat directions if the
        # return (i.e. cold) line has zero heat throughout. Here we check that
        # this is indeed the case.
        for p in self.__cold_pipes:
            heat_in = results[f"{p}.HeatIn.Heat"]
            heat_out = results[f"{p}.HeatOut.Heat"]
            if np.any(heat_in > 1.0) or np.any(heat_out > 1.0):
                logger.warning(f"Heat directions of pipes might be wrong. Check {p}.")