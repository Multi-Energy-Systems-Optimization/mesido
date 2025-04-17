import logging
import math
from typing import List

import casadi as ca

from mesido._heat_loss_u_values_pipe import pipe_heat_loss
from mesido.base_component_type_mixin import BaseComponentTypeMixin
from mesido.demand_insulation_class import DemandInsulationClass
from mesido.head_loss_class import HeadLossClass, HeadLossOption
from mesido.network_common import NetworkSettings

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.timeseries import Timeseries

logger = logging.getLogger("mesido")


class HeatPhysicsMixin(BaseComponentTypeMixin, CollocatedIntegratedOptimizationProblem):
    """
    This class is used to model the physics of a heat district network with its assets. We model
    the different components with a variety of linearization strategies.
    """

    __allowed_head_loss_options = {
        HeadLossOption.NO_HEADLOSS,
        HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY,
        HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY,
    }

    def __init__(self, *args, **kwargs):
        r"""
        In this __init__ we prepare the dicts for the variables added by the HeatMixin class

        Heat network specific settings:

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
        self.heat_network_settings = {
            "network_type": NetworkSettings.NETWORK_TYPE_HEAT,
            "maximum_velocity": 2.5,
            "minimum_velocity": 0.005,
            "head_loss_option": HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY,
            "minimize_head_losses": False,
            "n_linearization_lines": 5,
            "pipe_minimum_pressure": -np.inf,
            "pipe_maximum_pressure": np.inf,
            "heat_exchanger_bypass": False,
        }
        self._hn_head_loss_class = HeadLossClass(self.heat_network_settings)
        self.__pipe_head_bounds = {}
        self.__pipe_head_loss_var = {}
        self.__pipe_head_loss_bounds = {}
        self.__pipe_head_loss_nominals = {}
        self.__pipe_head_loss_zero_bounds = {}
        self._hn_pipe_to_head_loss_map = {}

        # Boolean path-variable for the direction of the flow, inport to outport is positive flow.
        self.__heat_flow_direct_var = {}
        self.__heat_flow_direct_bounds = {}
        self._heat_pipe_to_flow_direct_map = {}

        # Boolean path-variable to determine whether flow is going through a pipe.
        self.__heat_pipe_disconnect_var = {}
        self.__heat_pipe_disconnect_var_bounds = {}
        self._heat_pipe_disconnect_map = {}

        # Boolean path-variable for the status of the check valve
        self.__check_valve_status_var = {}
        self.__check_valve_status_var_bounds = {}
        self.__check_valve_status_map = {}

        # Boolean path-variable for the status of the control valve
        self.__control_valve_direction_var = {}
        self.__control_valve_direction_var_bounds = {}
        self.__control_valve_direction_map = {}

        # Boolean path-variable to disable the hex for certain moments in time
        self.__disabled_hex_map = {}
        self.__disabled_hex_var = {}
        self.__disabled_hex_var_bounds = {}

        # To avoid artificial energy generation at t0
        self.__buffer_t0_bounds = {}

        # Variable for the heat-loss, note that we make the bounds, and nominals not protected as
        # we need to adapt these in case of pipe sizing in the AssetSizingMixin.
        self.__pipe_heat_loss_var = {}
        self.__pipe_heat_loss_path_var = {}
        self._pipe_heat_loss_var_bounds = {}
        self._pipe_heat_loss_map = {}
        self._pipe_heat_loss_nominals = {}
        self._pipe_heat_losses = {}

        # Boolean variables for the insulation options per demand.
        self.__demand_insulation_class_var = {}  # value 0/1: demand insulation - not active/active
        self.__demand_insulation_class_var_bounds = {}
        self.__demand_insulation_class_map = {}
        self.__demand_insulation_class_result = {}

        # Boolean variables for the linear line segment options per pipe.
        self.__pipe_linear_line_segment_var = {}  # value 0/1: line segment - not active/active
        self.__pipe_linear_line_segment_var_bounds = {}
        self._pipe_linear_line_segment_map = {}

        # Variable of selected network temperature
        self.__temperature_regime_var = {}
        self.__temperature_regime_var_bounds = {}

        # Variable of selected ATES discrete temperature
        self.__ates_temperature_disc_var = {}
        self.__ates_temperature_disc_var_bounds = {}

        # Integer variable whether discrete temperature option for ates has been selected
        self.__ates_temperature_selected_var = {}
        self.__ates_temperature_selected_var_bounds = {}

        self.__ates_temperature_ordering_var = {}
        self.__ates_temperature_ordering_var_bounds = {}

        self.__ates_temperature_disc_ordering_var = {}
        self.__ates_temperature_disc_ordering_var_bounds = {}

        self.__ates_max_stored_heat_var = {}
        self.__ates_max_stored_heat_bounds = {}
        self.__ates_max_stored_heat_nominals = {}

        # Integer variable whether discrete temperature option has been selected
        self.__carrier_selected_var = {}
        self.__carrier_selected_var_bounds = {}

        self.__carrier_temperature_disc_ordering_var = {}
        self.__carrier_temperature_disc_ordering_var_bounds = {}

        # Dict to write the heat loss in the parameters
        self.__pipe_heat_loss_parameters = []

        # Part of the physics constraints are inherently linked to the sizing optimization. Since
        # these variables do not exist here, we instead only instantiate the maps to allow the
        # physics mixin to have the logic in place. The creation of the actual variables and filling
        # of these maps is in the AssetSizingMixin.
        self._heat_pipe_topo_pipe_class_map = {}

        # Map for setting node nominals in case of logical links.
        self.__heat_node_variable_nominal = {}

        super().__init__(*args, **kwargs)

    def temperature_carriers(self):
        """
        This function should be overwritten by the problem and should give a dict with the
        carriers as keys and a list of temperatures as values.
        """
        return {}

    def temperature_regimes(self, carrier):
        """
        This function returns a list of temperatures that can be selected for a certain carrier.
        """
        return []

    def pre(self):
        """
        In this pre method we fill the dicts initiated in the __init__. This means that we create
        the Casadi variables and determine the bounds, nominals and create maps for easier
        retrieving of the variables.
        """
        super().pre()

        options = self.energy_system_options()
        parameters = self.parameters(0)

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

        # Set structure used instead of list. Purpose: to make lookup faster when there are many
        # pipes in the network.
        set_self_hot_pipes = set(self.hot_pipes)

        for pipe_name in self.energy_system_components.get("heat_pipe", []):
            commodity = self.energy_system_components_commodity.get(pipe_name)
            head_loss_var = f"{pipe_name}.__head_loss"
            initialized_vars = self._hn_head_loss_class.initialize_variables_nominals_and_bounds(
                self, commodity, pipe_name, self.heat_network_settings
            )
            if initialized_vars[0] != {}:
                self.__pipe_head_bounds[f"{pipe_name}.{commodity}In.H"] = initialized_vars[0]
            if initialized_vars[1] != {}:
                self.__pipe_head_bounds[f"{pipe_name}.{commodity}Out.H"] = initialized_vars[1]
            if initialized_vars[2] != {}:
                self.__pipe_head_loss_zero_bounds[f"{pipe_name}.dH"] = initialized_vars[2]
            if initialized_vars[3] != {}:
                self._hn_pipe_to_head_loss_map[pipe_name] = initialized_vars[3]
            if initialized_vars[4] != {}:
                self.__pipe_head_loss_var[head_loss_var] = initialized_vars[4]
            if initialized_vars[5] != {}:
                self.__pipe_head_loss_nominals[f"{pipe_name}.dH"] = initialized_vars[5]
            if initialized_vars[6] != {}:
                self.__pipe_head_loss_nominals[head_loss_var] = initialized_vars[6]
            if initialized_vars[7] != {}:
                self.__pipe_head_loss_bounds[head_loss_var] = initialized_vars[7]

            if (
                initialized_vars[8] != {}
                and initialized_vars[9] != {}
                and initialized_vars[10] != {}
            ):
                self._pipe_linear_line_segment_map[pipe_name] = {}
                for ii_line in range(self.heat_network_settings["n_linearization_lines"] * 2):
                    pipe_linear_line_segment_var_name = initialized_vars[8][ii_line]
                    self._pipe_linear_line_segment_map[pipe_name][
                        ii_line
                    ] = pipe_linear_line_segment_var_name
                    self.__pipe_linear_line_segment_var[pipe_linear_line_segment_var_name] = (
                        initialized_vars[9][pipe_linear_line_segment_var_name]
                    )
                    self.__pipe_linear_line_segment_var_bounds[
                        pipe_linear_line_segment_var_name
                    ] = initialized_vars[10][pipe_linear_line_segment_var_name]

            neighbour = self.has_related_pipe(pipe_name)
            if neighbour and pipe_name not in set_self_hot_pipes:
                flow_dir_var = f"{self.cold_to_hot_pipe(pipe_name)}__flow_direct_var"
            else:
                flow_dir_var = f"{pipe_name}__flow_direct_var"

            self._heat_pipe_to_flow_direct_map[pipe_name] = flow_dir_var
            self.__heat_flow_direct_var[flow_dir_var] = ca.MX.sym(flow_dir_var)

            # Fix the directions that are already implied by the bounds on heat
            # Nonnegative heat implies that flow direction Boolean is equal to one.
            # Nonpositive heat implies that flow direction Boolean is equal to zero.

            heat_in_lb = _get_min_bound(bounds[f"{pipe_name}.HeatIn.Heat"][0])
            heat_in_ub = _get_max_bound(bounds[f"{pipe_name}.HeatIn.Heat"][1])
            heat_out_lb = _get_min_bound(bounds[f"{pipe_name}.HeatOut.Heat"][0])
            heat_out_ub = _get_max_bound(bounds[f"{pipe_name}.HeatOut.Heat"][1])

            if (heat_in_lb >= 0.0 and heat_in_ub >= 0.0) or (
                heat_out_lb >= 0.0 and heat_out_ub >= 0.0
            ):
                self.__heat_flow_direct_bounds[flow_dir_var] = (1.0, 1.0)
            elif (heat_in_lb <= 0.0 and heat_in_ub <= 0.0) or (
                heat_out_lb <= 0.0 and heat_out_ub <= 0.0
            ):
                self.__heat_flow_direct_bounds[flow_dir_var] = (0.0, 0.0)
            else:
                self.__heat_flow_direct_bounds[flow_dir_var] = (0.0, 1.0)

            if parameters[f"{pipe_name}.disconnectable"]:
                neighbour = self.has_related_pipe(pipe_name)
                if neighbour and pipe_name not in set_self_hot_pipes:
                    disconnected_var = f"{self.cold_to_hot_pipe(pipe_name)}__is_disconnected"
                else:
                    disconnected_var = f"{pipe_name}__is_disconnected"

                self._heat_pipe_disconnect_map[pipe_name] = disconnected_var
                self.__heat_pipe_disconnect_var[disconnected_var] = ca.MX.sym(disconnected_var)
                self.__heat_pipe_disconnect_var_bounds[disconnected_var] = (0.0, 1.0)

            if heat_in_ub <= 0.0 and heat_out_lb >= 0.0:
                raise Exception(f"Heat flow rate in/out of pipe '{pipe_name}' cannot be zero.")

        # Integers for disabling the HEX temperature constraints
        for hex in [
            *self.energy_system_components.get("heat_exchanger", []),
            *self.energy_system_components.get("heat_pump", []),
        ]:
            disabeld_hex_var = f"{hex}__disabled"
            self.__disabled_hex_map[hex] = disabeld_hex_var
            self.__disabled_hex_var[disabeld_hex_var] = ca.MX.sym(disabeld_hex_var)
            self.__disabled_hex_var_bounds[disabeld_hex_var] = (0, 1.0)

        for v in self.energy_system_components.get("check_valve", []):
            status_var = f"{v}__status_var"

            self.__check_valve_status_map[v] = status_var
            self.__check_valve_status_var[status_var] = ca.MX.sym(status_var)
            self.__check_valve_status_var_bounds[status_var] = (0.0, 1.0)

        for v in self.energy_system_components.get("control_valve", []):
            flow_dir_var = f"{v}__flow_direct_var"

            self.__control_valve_direction_map[v] = flow_dir_var
            self.__control_valve_direction_var[flow_dir_var] = ca.MX.sym(flow_dir_var)
            self.__control_valve_direction_var_bounds[flow_dir_var] = (0.0, 1.0)

        for ates, (
            (hot_pipe, _hot_pipe_orientation),
            (_cold_pipe, _cold_pipe_orientation),
        ) in self.energy_system_topology.ates.items():

            if ates in self.energy_system_components.get("low_temperature_ates", []):
                continue

            ates_temp_disc_var_name = f"{ates}__temperature_ates_disc"
            self.__ates_temperature_disc_var[ates_temp_disc_var_name] = ca.MX.sym(
                ates_temp_disc_var_name
            )
            carrier_id = parameters[f"{hot_pipe}.carrier_id"]
            temperatures = self.temperature_regimes(carrier_id)
            if len(temperatures) == 0:
                temperature = parameters[f"{hot_pipe}.temperature"]
                self.__ates_temperature_disc_var_bounds[ates_temp_disc_var_name] = (
                    temperature,
                    temperature,
                )
            elif len(temperatures) == 1:
                temperature = temperatures[0]
                self.__ates_temperature_disc_var_bounds[ates_temp_disc_var_name] = (
                    temperature,
                    temperature,
                )
            else:
                self.__ates_temperature_disc_var_bounds[ates_temp_disc_var_name] = (
                    min(temperatures),
                    max(temperatures),
                )
            for temperature in temperatures:
                ates_temperature_selected_var = f"{ates}__temperature_disc_{temperature}"
                self.__ates_temperature_selected_var[ates_temperature_selected_var] = ca.MX.sym(
                    ates_temperature_selected_var
                )
                self.__ates_temperature_selected_var_bounds[ates_temperature_selected_var] = (
                    0.0,
                    1.0,
                )

                ates_temperature_ordering_var_name = f"{ates}__{temperature}_ordering"
                self.__ates_temperature_ordering_var[ates_temperature_ordering_var_name] = (
                    ca.MX.sym(ates_temperature_ordering_var_name)
                )
                self.__ates_temperature_ordering_var_bounds[ates_temperature_ordering_var_name] = (
                    0.0,
                    1.0,
                )

                ates_temperature_disc_ordering_var_name = f"{ates}__{temperature}_ordering_disc"
                self.__ates_temperature_disc_ordering_var[
                    ates_temperature_disc_ordering_var_name
                ] = ca.MX.sym(ates_temperature_disc_ordering_var_name)
                self.__ates_temperature_disc_ordering_var_bounds[
                    ates_temperature_disc_ordering_var_name
                ] = (0.0, 1.0)

            max_heat = bounds[f"{ates}.Stored_heat"][1]
            ates_max_stored_heat_var_name = f"{ates}__max_stored_heat"
            self.__ates_max_stored_heat_var[ates_max_stored_heat_var_name] = ca.MX.sym(
                ates_max_stored_heat_var_name
            )
            self.__ates_max_stored_heat_bounds[ates_max_stored_heat_var_name] = (0, max_heat)
            self.__ates_max_stored_heat_nominals[ates_max_stored_heat_var_name] = max_heat / 2

        for _carrier, temperatures in self.temperature_carriers().items():
            carrier_id_number_mapping = str(temperatures["id_number_mapping"])
            temp_var_name = carrier_id_number_mapping + "_temperature"
            self.__temperature_regime_var[temp_var_name] = ca.MX.sym(temp_var_name)
            temperature_regimes = self.temperature_regimes(int(carrier_id_number_mapping))
            if len(temperature_regimes) == 0:
                temperature = temperatures["temperature"]
                self.__temperature_regime_var_bounds[temp_var_name] = (temperature, temperature)
            elif len(temperature_regimes) == 1:
                temperature = temperature_regimes[0]
                self.__temperature_regime_var_bounds[temp_var_name] = (temperature, temperature)
            else:
                self.__temperature_regime_var_bounds[temp_var_name] = (
                    min(temperature_regimes),
                    max(temperature_regimes),
                )

            for temperature_regime in temperature_regimes:
                carrier_selected_var = carrier_id_number_mapping + f"_{temperature_regime}"
                self.__carrier_selected_var[carrier_selected_var] = ca.MX.sym(carrier_selected_var)
                self.__carrier_selected_var_bounds[carrier_selected_var] = (0.0, 1.0)

                carrier_temperature_disc_ordering_var_name = (
                    f"{carrier_id_number_mapping}__{temperature_regime}_ordering_disc"
                )
                self.__carrier_temperature_disc_ordering_var[
                    carrier_temperature_disc_ordering_var_name
                ] = ca.MX.sym(carrier_temperature_disc_ordering_var_name)
                self.__carrier_temperature_disc_ordering_var_bounds[
                    carrier_temperature_disc_ordering_var_name
                ] = (0.0, 1.0)

        for _ in range(self.ensemble_size):
            self.__pipe_heat_loss_parameters.append({})

        for pipe in self.energy_system_components.get("heat_pipe", []):
            # For similar reasons as for the diameter, we always make a heat
            # loss symbol, even if the heat loss is fixed. Note that we also
            # override the .Heat_loss parameter for cold pipes, even though
            # it is not actually used in the optimization problem.
            heat_loss_var_name = f"{pipe}__hn_heat_loss"
            carrier_id = parameters[f"{pipe}.carrier_id"]
            if len(self.temperature_regimes(carrier_id)) == 0:
                self.__pipe_heat_loss_var[heat_loss_var_name] = ca.MX.sym(heat_loss_var_name)
            else:
                self.__pipe_heat_loss_path_var[heat_loss_var_name] = ca.MX.sym(heat_loss_var_name)
            self._pipe_heat_loss_map[pipe] = heat_loss_var_name

            if options["neglect_pipe_heat_losses"]:
                # No decision to make for this pipe w.r.t. heat loss
                self._pipe_heat_loss_var_bounds[heat_loss_var_name] = (
                    0.0,
                    0.0,
                )
                self._pipe_heat_loss_nominals[heat_loss_var_name] = max(
                    pipe_heat_loss(self, {"neglect_pipe_heat_losses": False}, parameters, pipe),
                    1.0,
                )

                for ensemble_member in range(self.ensemble_size):
                    h = self.__pipe_heat_loss_parameters[ensemble_member]
                    h[f"{pipe}.Heat_loss"] = 0.0

            else:
                heat_loss = pipe_heat_loss(self, options, parameters, pipe)
                if parameters[f"{pipe}.temperature"] > parameters[f"{pipe}.T_ground"]:
                    lb = 0.0
                else:
                    lb = 2.0 * heat_loss
                self._pipe_heat_loss_var_bounds[heat_loss_var_name] = (
                    lb,
                    2.0 * abs(heat_loss),
                )
                self._pipe_heat_loss_nominals[heat_loss_var_name] = max(
                    abs(heat_loss),
                    1.0,
                )

                for ensemble_member in range(self.ensemble_size):
                    h = self.__pipe_heat_loss_parameters[ensemble_member]
                    h[f"{pipe}.Heat_loss"] = heat_loss

        # Demand insulation link
        for dmnd in self.energy_system_components.get("heat_demand", []):
            demand_insulation_classes = self.demand_insulation_classes(dmnd)
            if not demand_insulation_classes or len(demand_insulation_classes) == 1:
                # No insulation options availabe for the demands
                pass
            else:
                self.__demand_insulation_class_map[dmnd] = {}

                for insl in demand_insulation_classes:
                    if dmnd == insl.name_demand:
                        demand_insulation_class_var_name = (
                            f"{dmnd}__demand_insulation_class_{insl.name_insulation_level}"
                        )

                        if demand_insulation_class_var_name in (
                            self.__demand_insulation_class_map[dmnd].values()
                        ):
                            raise Exception(f"Resolve duplicate insulation: {insl}.")

                        self.__demand_insulation_class_map[dmnd][
                            insl
                        ] = demand_insulation_class_var_name
                        self.__demand_insulation_class_var[demand_insulation_class_var_name] = (
                            ca.MX.sym(demand_insulation_class_var_name)
                        )
                        self.__demand_insulation_class_var_bounds[
                            demand_insulation_class_var_name
                        ] = (0.0, 1.0)

        # Check that buffer information is logical and
        # set the stored heat at t0 in the buffer(s) via bounds
        if len(self.times()) > 2:
            self.__check_buffer_values_and_set_bounds_at_t0()

        self.__maximum_total_head_loss = self.__get_maximum_total_head_loss()

        # Setting the node nominals using the connected assets.
        for node, connected_assets in self.energy_system_topology.nodes.items():
            nominals = {}
            for var in ["Q", "H", "Heat", "Hydraulic_power"]:
                nominals[var] = []
                for _, (asset, _orientation) in connected_assets.items():
                    var_nom = self.variable_nominal(f"{asset}.HeatOut.{var}")
                    if var_nom != 1:
                        nominals[var].append(var_nom)
                    elif self.variable_nominal(f"{asset}.HeatIn.{var}") != 1:
                        nominals[var].append(self.variable_nominal(f"{asset}.HeatIn.{var}"))
                    else:
                        nominals[var].append(1)

                for i in range(len(connected_assets)):
                    if self.variable_nominal(f"{node}.HeatConn[{i + 1}].{var}") == 1:
                        if nominals[var][i] != 1:
                            # Here we set a nominal based directly on the connected asset.
                            self.__heat_node_variable_nominal[f"{node}.HeatConn[{i + 1}].{var}"] = (
                                nominals[var][i]
                            )
                        else:
                            # Here we set a nominal based on median of all the connected assets to
                            # the node. This is specifically done when we have a logical link for
                            # node to node. In this case we cannot set the nominal based on the
                            # connected node, hence we assume a node has at least one not node
                            # asset connected to it.
                            self.__heat_node_variable_nominal[f"{node}.HeatConn[{i + 1}].{var}"] = (
                                np.median([x for x in nominals[var] if x != 1])
                                if np.sum(nominals[var]) != len(nominals[var])
                                else 1.0
                            )

    def energy_system_options(self):
        r"""
        Returns a dictionary of heat network physics specific options.

        +--------------------------------------+-----------+-----------------------------+
        | Option                               | Type      | Default value               |
        +======================================+===========+=============================+
        | ``minimum_pressure_far_point``       | ``float`` | ``1.0`` bar                 |
        +--------------------------------------+-----------+-----------------------------+
        | ``maximum_temperature_der``          | ``float`` | ``2.0`` °C/hour             |
        +--------------------------------------+-----------+-----------------------------+
        | ``maximum_flow_der``                 | ``float`` | ``np.inf`` m3/s/hour        |
        +--------------------------------------+-----------+-----------------------------+
        | ``neglect_pipe_heat_losses``         | ``bool``  | ``False``                   |
        +--------------------------------------+-----------+-----------------------------+
        | ``heat_loss_disconnected_pipe``      | ``bool``  | ``True``                    |
        +--------------------------------------+-----------+-----------------------------+
        | ``include_demand_insulation_options``| ``bool``  | ``False``                   |
        +--------------------------------------+-----------+-----------------------------+

        The ``maximum_temperature_der`` gives the maximum temperature change
        per hour. Similarly, the ``maximum_flow_der`` parameter gives the
        maximum flow change per hour. These options together are used to
        constrain the maximum heat change per hour allowed in the entire
        network. Note the unit for flow is m3/s, but the change is expressed
        on an hourly basis leading to the ``m3/s/hour`` unit.

        The ``heat_loss_disconnected_pipe`` option decides whether a
        disconnectable pipe has heat loss or not when it is disconnected on
        that particular time step. By default, a pipe has heat loss even if
        it is disconnected, as it would still contain relatively hot water in
        reality. We also do not want minimization of heat production to lead
        to overly disconnecting pipes. In some scenarios it is hydraulically
        impossible to supply heat to these disconnected pipes (Q is forced to
        zero), in which case this option can be set to ``False``.

        The ``neglect_pipe_heat_losses`` option sets the heat loss in pipes to
        zero. This can be useful when the insulation properties are unknown.
        Note that other components can still have heat loss, e.g. a buffer.

        The ``include_demand_insulation_options`` options is used, when insulations options per
        demand is specificied, to include heat demand and supply matching via constraints for all
        possible insulation options.
        """

        options = self._hn_head_loss_class.head_loss_network_options()

        options["minimum_pressure_far_point"] = 1.0
        options["maximum_temperature_der"] = 2.0
        options["maximum_flow_der"] = np.inf
        options["neglect_pipe_heat_losses"] = False
        options["heat_loss_disconnected_pipe"] = True
        options["include_demand_insulation_options"] = False
        options["include_ates_temperature_options"] = False

        return options

    def demand_insulation_classes(self, demand_insulation: str) -> List[DemandInsulationClass]:
        """
        If the returned List is:
        - empty: use the demand insulation properties from the model
        - len() == 1: use these demand insulation properties to overrule that of the model
        - len() > 1: decide between the demand insulation class options.

        """
        return []

    def get_optimized_deman_insulation_class(self, demand_insulation: str) -> DemandInsulationClass:
        """
        Return the optimized demand_insulation class for a specific pipe. If no
        optimized demand insulation class is available (yet), a `KeyError` is returned.
        """
        return self.__demand_insulation_class_result[demand_insulation]

    @property
    def extra_variables(self):
        """
        In this function we add all the variables defined in the HeatMixin to the optimization
        problem. Note that these are only the normal variables not path variables.
        """
        variables = super().extra_variables.copy()
        variables.extend(self.__pipe_heat_loss_var.values())
        variables.extend(self.__ates_max_stored_heat_var.values())
        return variables

    @property
    def path_variables(self):
        """
        In this function we add all the path variables defined in the HeatMixin to the
        optimization problem. Note that path_variables are variables that are created for each
        time-step.
        """
        variables = super().path_variables.copy()
        variables.extend(self.__pipe_head_loss_var.values())
        variables.extend(self.__heat_flow_direct_var.values())
        variables.extend(self.__heat_pipe_disconnect_var.values())
        variables.extend(self.__check_valve_status_var.values())
        variables.extend(self.__control_valve_direction_var.values())
        variables.extend(self.__demand_insulation_class_var.values())
        variables.extend(self.__pipe_linear_line_segment_var.values())
        variables.extend(self.__temperature_regime_var.values())
        variables.extend(self.__carrier_selected_var.values())
        variables.extend(self.__ates_temperature_disc_var.values())
        variables.extend(self.__ates_temperature_selected_var.values())
        variables.extend(self.__disabled_hex_var.values())
        variables.extend(self.__pipe_heat_loss_path_var.values())
        variables.extend(self.__ates_temperature_ordering_var.values())
        variables.extend(self.__ates_temperature_disc_ordering_var.values())
        variables.extend(self.__carrier_temperature_disc_ordering_var.values())
        return variables

    def variable_is_discrete(self, variable):
        """
        All variables that only can take integer values should be added to this function.
        """
        if (
            variable in self.__heat_flow_direct_var
            or variable in self.__heat_pipe_disconnect_var
            or variable in self.__check_valve_status_var
            or variable in self.__control_valve_direction_var
            or variable in self.__demand_insulation_class_var
            or variable in self.__pipe_linear_line_segment_var
            or variable in self.__carrier_selected_var
            or variable in self.__ates_temperature_selected_var
            or variable in self.__disabled_hex_var
            or variable in self.__ates_temperature_ordering_var
            or variable in self.__ates_temperature_disc_ordering_var
            or variable in self.__carrier_temperature_disc_ordering_var
        ):
            return True
        else:
            return super().variable_is_discrete(variable)

    def variable_nominal(self, variable):
        """
        In this function we add all the nominals for the variables defined/added in the HeatMixin.
        """
        if variable in self._pipe_heat_loss_nominals:
            return self._pipe_heat_loss_nominals[variable]
        elif variable in self.__pipe_head_loss_nominals:
            return self.__pipe_head_loss_nominals[variable]
        elif variable in self.__ates_max_stored_heat_nominals:
            return self.__ates_max_stored_heat_nominals[variable]
        elif variable in self.__heat_node_variable_nominal:
            return self.__heat_node_variable_nominal[variable]
        else:
            return super().variable_nominal(variable)

    def bounds(self):
        """
        In this function we add the bounds to the problem for all the variables defined/added in
        the HeatMixin.
        """
        bounds = super().bounds()
        bounds.update(self.__heat_flow_direct_bounds)
        bounds.update(self.__heat_pipe_disconnect_var_bounds)
        bounds.update(self.__check_valve_status_var_bounds)
        bounds.update(self.__control_valve_direction_var_bounds)
        bounds.update(self.__buffer_t0_bounds)
        bounds.update(self.__demand_insulation_class_var_bounds)
        bounds.update(self.__pipe_linear_line_segment_var_bounds)
        bounds.update(self._pipe_heat_loss_var_bounds)
        bounds.update(self.__temperature_regime_var_bounds)
        bounds.update(self.__carrier_selected_var_bounds)
        bounds.update(self.__ates_temperature_disc_var_bounds)
        bounds.update(self.__ates_temperature_selected_var_bounds)
        bounds.update(self.__disabled_hex_var_bounds)

        bounds.update(self.__pipe_head_loss_bounds)
        bounds.update(self.__pipe_head_loss_zero_bounds)
        bounds.update(self.__ates_temperature_ordering_var_bounds)
        bounds.update(self.__ates_temperature_disc_ordering_var_bounds)
        bounds.update(self.__carrier_temperature_disc_ordering_var_bounds)
        bounds.update(self.__ates_max_stored_heat_bounds)

        for k, v in self.__pipe_head_bounds.items():
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
            self.heat_network_settings["minimize_head_losses"]
            and self.heat_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS
        ):
            g.append(
                self._hn_head_loss_class._hn_minimization_goal_class(
                    self,
                    self.heat_network_settings,
                )
            )

            if (
                self.heat_network_settings["head_loss_option"]
                == HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
                or self.heat_network_settings["head_loss_option"]
                == HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
            ):
                g.append(
                    self._hn_head_loss_class._hpwr_minimization_goal_class(
                        self,
                        self.heat_network_settings,
                    )
                )

        return g

    def parameters(self, ensemble_member):
        """
        In this function we adapt the parameters object to avoid issues with accidentally using
        variables as constants.
        """
        parameters = super().parameters(ensemble_member)

        if self.__pipe_heat_loss_parameters:
            parameters.update(self.__pipe_heat_loss_parameters[ensemble_member])

        return parameters

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

        if self.heat_network_settings["head_loss_option"] == HeadLossOption.NO_HEADLOSS:
            # Undefined, and all constraints using this methods value should
            # be skipped.
            return np.nan

        # Summing head loss in pipes
        max_sum_dh_pipes = 0.0

        for ensemble_member in range(self.ensemble_size):
            parameters = self.parameters(ensemble_member)

            head_loss = 0.0

            for pipe in components.get("heat_pipe", []):
                area = parameters[f"{pipe}.area"]
                max_discharge = self.heat_network_settings["maximum_velocity"] * area
                head_loss += self._hn_head_loss_class._hn_pipe_head_loss(
                    pipe, self, options, self.heat_network_settings, parameters, max_discharge
                )

            head_loss += options["minimum_pressure_far_point"] * 10.2

            max_sum_dh_pipes = max(max_sum_dh_pipes, head_loss)

        # Maximum pressure difference allowed with user options
        # NOTE: Does not yet take elevation differences into acccount
        max_dh_network_options = (
            self.heat_network_settings["pipe_maximum_pressure"]
            - self.heat_network_settings["pipe_minimum_pressure"]
        ) * 10.2

        return min(max_sum_dh_pipes, max_dh_network_options)

    def __check_buffer_values_and_set_bounds_at_t0(self):
        """
        In this function we force the buffer at t0 to have a certain amount of set energy in it.
        We do this via the bounds, by providing the bounds with a time-series where the first
        element is the initial heat in the buffer.
        """
        t = self.times()
        # We assume that t0 is always equal to self.times()[0]
        assert self.initial_time == self.times()[0]

        parameters = self.parameters(0)
        bounds = self.bounds()
        components = self.energy_system_components
        buffers = components.get("heat_buffer", [])

        for b in buffers:
            min_fract_vol = parameters[f"{b}.min_fraction_tank_volume"]
            if min_fract_vol < 0.0 or min_fract_vol >= 1.0:
                raise Exception(
                    f"Minimum fraction of tank capacity of {b} must be smaller"
                    "than 1.0 and larger or equal to 0.0"
                )

            cp = parameters[f"{b}.cp"]
            rho = parameters[f"{b}.rho"]
            dt = parameters[f"{b}.dT"]
            heat_t0 = parameters[f"{b}.init_Heat"]
            vol_t0 = parameters[f"{b}.init_V_hot_tank"]
            stored_heat = f"{b}.Stored_heat"
            if not np.isnan(vol_t0) and not np.isnan(heat_t0):
                raise Exception(
                    f"At most one between the initial heat and volume of {b} should be prescribed."
                )

            if np.isnan(heat_t0):
                if not np.isnan(vol_t0):
                    # Extract information from volume
                    heat_t0 = vol_t0 * dt * cp * rho
                else:
                    # Set default value
                    volume = parameters[f"{b}.volume"]
                    default_vol_t0 = min_fract_vol * volume
                    heat_t0 = default_vol_t0 * dt * cp * rho

            # Check that volume/initial stored heat at t0 is within bounds
            lb_heat, ub_heat = bounds[stored_heat]
            lb_heat_t0 = np.inf
            ub_heat_t0 = -np.inf
            for bound in [lb_heat, ub_heat]:
                assert not isinstance(
                    bound, np.ndarray
                ), f"{b} stored heat cannot be a vector state"
                if isinstance(bound, Timeseries):
                    bound_t0 = bound.values[0]
                else:
                    bound_t0 = bound
                lb_heat_t0 = min(lb_heat_t0, bound_t0)
                ub_heat_t0 = max(ub_heat_t0, bound_t0)

            if heat_t0 < lb_heat_t0 or heat_t0 > ub_heat_t0:
                raise Exception(f"Initial heat of {b} is not within bounds.")

            # Set heat at t0
            lb = np.full_like(t, -np.inf)
            ub = np.full_like(t, np.inf)
            lb[0] = heat_t0
            ub[0] = heat_t0
            b_t0 = (Timeseries(t, lb), Timeseries(t, ub))
            self.__buffer_t0_bounds[stored_heat] = self.merge_bounds(bounds[stored_heat], b_t0)

    def __heat_matching_demand_insulation_constraints(self, ensemble_member):
        """
        Consider all possible heat demand insulation options (each options has an assosiated unique
        demand profile for the specific demand) and add constraints such that only one insulation
        options is activated per demand. The constraints will then ensure aim to match the supply
        and demand.

        Note:
        - This function is only active when the "include_demand_insulation_options" (False by
        default) has been set to True in the heat network options.
        - Currently this functional requires that all demands have at least one insualtion option is
        specified for every demand in the heat network.
        """

        constraints = []
        for dmnd in self.energy_system_components["heat_demand"]:
            heat_demand = self.__state_vector_scaled(f"{dmnd}.Heat_demand", ensemble_member)
            target_demand = self.get_timeseries(f"{dmnd}.target_heat_demand")

            try:
                demand_insulation_classes = self.__demand_insulation_class_map[dmnd]
                is_insulation_active = []
                demand_profile_for_this_class = []
                big_m = []  # big_m for every insulation class
                nominal = []
                for pc, pc_var_name in demand_insulation_classes.items():
                    # Create a demand profile for every insulation level option for this demand
                    demand_profile_for_this_class.append(
                        pc.demand_scaling_factor * target_demand.values[: (len(self.times()))]
                    )
                    # There might be a large differnece between profiles of different insulation
                    # classes. Therefor create variables below per profile (per insulation class)
                    big_m.append(2.0 * max(demand_profile_for_this_class[-1]))
                    nominal.append(np.median(demand_profile_for_this_class[-1]))

                    # Create integer variable to activated/deactivate (1/0) a demand insulation
                    is_insulation_active_var = self.extra_variable(pc_var_name, ensemble_member)
                    # Demand insulation activation variable for each time step of demand profile
                    is_insulation_active.append(
                        ca.repmat(
                            is_insulation_active_var,
                            len(target_demand.values[: (len(self.times()))]),
                        )
                    )
                # Add constraint to enforce that only 1 demand insulation can be active
                # per time step for a specific demand
                for itstep in range(len(target_demand.values[: (len(self.times()))])):
                    is_insulation_active_sum_per_timestep = 0
                    for iclasses in range(len(demand_profile_for_this_class)):
                        is_insulation_active_sum_per_timestep = (
                            is_insulation_active_sum_per_timestep
                            + is_insulation_active[iclasses][itstep]
                        )
                    constraints.append((is_insulation_active_sum_per_timestep, 1.0, 1.0))

                # Adding constraints for the entire time horizon per demand insulation
                for iclasses in range(len(demand_profile_for_this_class)):
                    for itstep in range(len(demand_profile_for_this_class[iclasses])):
                        constraints.append(
                            (
                                (
                                    heat_demand[itstep]
                                    - demand_profile_for_this_class[iclasses][itstep]
                                    + big_m[iclasses]
                                    * (1.0 - is_insulation_active[iclasses][itstep])
                                )
                                / nominal[iclasses],
                                0.0,
                                np.inf,
                            )
                        )
                        constraints.append(
                            (
                                (
                                    heat_demand[itstep]
                                    - demand_profile_for_this_class[iclasses][itstep]
                                    - big_m[iclasses]
                                    * (1.0 - is_insulation_active[iclasses][itstep])
                                )
                                / nominal[iclasses],
                                -np.inf,
                                0.0,
                            )
                        )
            except KeyError:
                raise Exception(
                    "Add a DemandInsulationClass with a demand_scaling_factor value =1.0 for "
                    "demand: {dmnd}"
                )
        return constraints

    def __pipe_rate_heat_change_constraints(self, ensemble_member):
        """
        To avoid sudden change in heat from a timestep to the next,
        constraints on d(Heat)/dt are introduced.
        Information of restrictions on dQ/dt and dT/dt are used, as d(Heat)/dt is
        proportional to average_temperature * dQ/dt + average_discharge * dT/dt.
        The average discharge is computed using the assumption that the average velocity is 1 m/s.
        """
        constraints = []

        parameters = self.parameters(ensemble_member)
        hn_options = self.energy_system_options()

        t_change = hn_options["maximum_temperature_der"]
        q_change = hn_options["maximum_flow_der"]

        if np.isfinite(t_change) and np.isfinite(q_change):
            assert (
                not self._heat_pipe_topo_pipe_class_map
            ), "heat rate change constraints not allowed with topology optimization"

        for p in self.energy_system_components.get("heat_pipe", []):
            variable = f"{p}.HeatIn.Heat"
            dt = np.diff(self.times(variable))

            canonical, sign = self.alias_relation.canonical_signed(variable)
            source_temperature_out = sign * self.state_vector(canonical, ensemble_member)

            # Maximum differences are expressed per hour. We scale appropriately.
            cp = parameters[f"{p}.cp"]
            rho = parameters[f"{p}.rho"]
            area = parameters[f"{p}.area"]
            avg_t = parameters[f"{p}.temperature"]
            # Assumption: average velocity is 1 m/s
            avg_v = 1
            avg_q = avg_v * area
            heat_change = cp * rho * (t_change / 3600 * avg_q + q_change / 3600 * avg_t)

            if heat_change < 0:
                raise Exception(f"Heat change of pipe {p} should be nonnegative.")
            elif not np.isfinite(heat_change):
                continue

            var_cur = source_temperature_out[1:]
            var_prev = source_temperature_out[:-1]
            variable_nominal = self.variable_nominal(variable)

            constraints.append(
                (
                    var_cur - var_prev,
                    -heat_change * dt / variable_nominal,
                    heat_change * dt / variable_nominal,
                )
            )

        return constraints

    def __node_heat_mixing_path_constraints(self, ensemble_member):
        """
        This function adds constraints for each heat network node/joint to have as much
        thermal power (Heat variable) going in as out. Effectively, it is setting the sum of
        thermal powers to zero.
        """
        constraints = []

        for node, connected_pipes in self.energy_system_topology.nodes.items():
            heat_sum = 0.0
            heat_nominals = []

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                heat_conn = f"{node}.HeatConn[{i_conn + 1}].Heat"
                heat_sum += orientation * self.state(heat_conn)
                heat_nominals.append(self.variable_nominal(heat_conn))

            heat_nominal = np.median(heat_nominals)
            constraints.append((heat_sum / heat_nominal, 0.0, 0.0))

        return constraints

    def __node_discharge_mixing_path_constraints(self, ensemble_member):
        """
        This function adds constraints to ensure that the incoming volumetric flow equals the
        outgoing volumetric flow. We assume constant density throughout a hydraulically coupled
        system and thus these constraints are needed for mass conservation.
        """
        constraints = []

        for node, connected_pipes in self.energy_system_topology.nodes.items():
            q_sum = 0.0
            q_nominals = []

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                q_conn = f"{node}.HeatConn[{i_conn + 1}].Q"
                q_sum += orientation * self.state(q_conn)
                q_nominals.append(self.variable_nominal(q_conn))

            q_nominal = np.median(q_nominals)
            constraints.append((q_sum / q_nominal, 0.0, 0.0))

        return constraints

    def __node_hydraulic_power_mixing_path_constraints(self, ensemble_member):
        """
        This function adds constraints to ensure that the incoming hydraulic power equals the
        outgoing hydraulic power. We assume constant density throughout a hydraulically coupled
        system and thus these constraints are needed for mass conservation.
        """
        constraints = []

        for node, connected_pipes in self.energy_system_topology.nodes.items():
            q_sum = 0.0
            q_nominals = []

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                q_conn = f"{node}.HeatConn[{i_conn + 1}].Hydraulic_power"
                q_sum += orientation * self.state(q_conn)
                q_nominals.append(self.variable_nominal(q_conn))

            q_nominal = np.median(q_nominals)
            constraints.append((q_sum / q_nominal, 0.0, 0.0))

        return constraints

    def __heat_loss_path_constraints(self, ensemble_member):
        """
        This function adds the constraints to subtract the heat losses from the thermal power that
        propagates through the network. Note that this is done only on the thermal power, as such
        only energy losses are accounted for, temperature losses are not considered.

        There are a few cases for the heat loss constraints
        - Heat losses are constant: This is the case when the pipe class is constant and the
        network temperature is constant. In this case the symbol for the heat-loss is fixed by its
        lower and upper bound to a value.
        - Heat losses depend on pipe_class: In this case the heat loss depend on the pipe class
        selected by the optimization. In this case the heat losses can vary due to the varying
        radiation surface and different insulation materials applied to the pipe. Note that the
        influences of varying pipe class are taken into account while setting the heat-loss
        variable in topology constraints.
        - Heat losses depend on varying network temperature: In this case the heat loss varies due
        to the different delta temperature with ambient. Note that the heat loss symbol does not
        account for the varying temperature. Therefore, the big_m formulation is needed in these
        constraints.
        - Heat losses depend both on varying network temperature and pipe classes: In this case
        both pipe class and delta temperature with ambient vary
        - neglect_pipe_heat_losses:
        """
        constraints = []
        options = self.energy_system_options()

        for p in self.energy_system_components.get("heat_pipe", []):
            heat_in = self.state(f"{p}.HeatIn.Heat")
            heat_out = self.state(f"{p}.HeatOut.Heat")
            heat_nominal = self.variable_nominal(f"{p}.HeatIn.Heat")

            big_m = 2.0 * np.max(
                np.abs(
                    (
                        *self.bounds()[f"{p}.HeatIn.Heat"],
                        *self.bounds()[f"{p}.HeatOut.Heat"],
                    )
                )
            )

            is_disconnected_var = self._heat_pipe_disconnect_map.get(p)

            if is_disconnected_var is None:
                is_disconnected = 0.0
            else:
                is_disconnected = self.state(is_disconnected_var)

            if p in self._pipe_heat_loss_map:
                # Heat loss is variable depending on pipe class
                heat_loss_sym_name = self._pipe_heat_loss_map[p]
                try:
                    heat_loss = self.variable(heat_loss_sym_name)
                except KeyError:
                    heat_loss = self.__pipe_heat_loss_path_var[heat_loss_sym_name]
                heat_loss_nominal = self.variable_nominal(heat_loss_sym_name)
                constraint_nominal = (heat_nominal * heat_loss_nominal) ** 0.5

                if options["heat_loss_disconnected_pipe"]:
                    constraints.append(
                        (
                            (heat_in - heat_out - heat_loss) / constraint_nominal,
                            0.0,
                            0.0,
                        )
                    )
                else:
                    # Force heat loss to `heat_loss` when pipe is connected, and zero otherwise.
                    heat_loss_nominal = self._pipe_heat_loss_nominals[heat_loss_sym_name]
                    constraint_nominal = (big_m * heat_loss_nominal) ** 0.5

                    # Force heat loss to `heat_loss` when pipe is connected.
                    constraints.append(
                        (
                            (heat_in - heat_out - heat_loss - is_disconnected * big_m)
                            / constraint_nominal,
                            -np.inf,
                            0.0,
                        )
                    )
                    constraints.append(
                        (
                            (heat_in - heat_out - heat_loss + is_disconnected * big_m)
                            / constraint_nominal,
                            0.0,
                            np.inf,
                        )
                    )
        return constraints

    @staticmethod
    def __get_abs_max_bounds(*bounds):
        """
        This function returns the absolute maximum of the bounds given. Note that bounds can also be
        a timeseries.
        """
        max_ = 0.0

        for b in bounds:
            if isinstance(b, np.ndarray):
                max_ = max(max_, max(abs(b)))
            elif isinstance(b, Timeseries):
                max_ = max(max_, max(abs(b.values)))
            else:
                max_ = max(max_, abs(b))

        return max_

    def __flow_direction_path_constraints(self, ensemble_member):
        """
        This function adds constraints to set the direction in pipes and determine whether a pipe
        is utilized at all (is_disconnected variable).

        Whether a pipe is connected is based upon whether flow passes through that pipe.

        The directions are set based upon the directions of how thermal power propegates. This is
        done based upon the sign of the Heat variable. Where positive Heat means a positive
        direction and negative heat means a negative direction. By default, positive is defined from
        HeatIn to HeatOut.

        Finally, a minimum flow can be set. This can sometimes be useful for numerical stability.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        minimum_velocity = self.heat_network_settings["minimum_velocity"]
        maximum_velocity = self.heat_network_settings["maximum_velocity"]

        # Also ensure that the discharge has the same sign as the heat.
        for p in self.energy_system_components.get("heat_pipe", []):
            flow_dir_var = self._heat_pipe_to_flow_direct_map[p]
            flow_dir = self.state(flow_dir_var)

            is_disconnected_var = self._heat_pipe_disconnect_map.get(p)

            if is_disconnected_var is None:
                is_disconnected = 0.0
            else:
                is_disconnected = self.state(is_disconnected_var)

            q_pipe = self.state(f"{p}.Q")
            heat_in = self.state(f"{p}.HeatIn.Heat")
            heat_out = self.state(f"{p}.HeatOut.Heat")

            try:
                pipe_classes = self._heat_pipe_topo_pipe_class_map[p].keys()
                maximum_discharge = max([c.maximum_discharge for c in pipe_classes])
                var_names = self._heat_pipe_topo_pipe_class_map[p].values()
                dn_none = 0.0
                for i, pc in enumerate(pipe_classes):
                    if pc.inner_diameter == 0.0:
                        dn_none = self.variable(list(var_names)[i])
                minimum_discharge = min(
                    [c.area * minimum_velocity for c in pipe_classes if c.area > 0.0]
                )
            except KeyError:
                maximum_discharge = maximum_velocity * parameters[f"{p}.area"]

                if math.isfinite(minimum_velocity) and minimum_velocity > 0.0:
                    minimum_discharge = minimum_velocity * parameters[f"{p}.area"]
                else:
                    minimum_discharge = 0.0
                dn_none = 0.0

            if maximum_discharge == 0.0:
                maximum_discharge = 1.0
            big_m = 2.0 * (maximum_discharge + minimum_discharge)

            if minimum_discharge > 0.0:
                constraint_nominal = (minimum_discharge * big_m) ** 0.5
            else:
                constraint_nominal = big_m

            # when DN=0 the flow_dir variable can be 0 or 1, thus these constraints then need to be
            # disabled
            constraints.append(
                (
                    (
                        q_pipe
                        - big_m * (flow_dir + dn_none)
                        + (1 - is_disconnected) * minimum_discharge
                    )
                    / constraint_nominal,
                    -np.inf,
                    0.0,
                )
            )
            constraints.append(
                (
                    (
                        q_pipe
                        + big_m * (1 - flow_dir + dn_none)
                        - (1 - is_disconnected) * minimum_discharge
                    )
                    / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )
            big_m = 2.0 * np.max(
                np.abs(
                    (
                        *self.bounds()[f"{p}.HeatIn.Heat"],
                        *self.bounds()[f"{p}.HeatOut.Heat"],
                    )
                )
            )
            # Note we only need one on the heat as the desired behaviour is propegated by the
            # constraints heat_in - heat_out - heat_loss == 0.
            constraints.append(
                (
                    (heat_in - big_m * flow_dir) / big_m,
                    -np.inf,
                    0.0,
                )
            )
            constraints.append(
                (
                    (heat_in + big_m * (1 - flow_dir)) / big_m,
                    0.0,
                    np.inf,
                )
            )

            # If a pipe is disconnected, the discharge should be zero
            if is_disconnected_var is not None:
                big_m = 2.0 * (maximum_discharge + minimum_discharge)
                constraints.append(((q_pipe - (1 - is_disconnected) * big_m) / big_m, -np.inf, 0.0))
                constraints.append(((q_pipe + (1 - is_disconnected) * big_m) / big_m, 0.0, np.inf))
                big_m = 2.0 * np.max(
                    np.abs(
                        (
                            *self.bounds()[f"{p}.HeatIn.Heat"],
                            *self.bounds()[f"{p}.HeatOut.Heat"],
                        )
                    )
                )
                constraints.append(
                    ((heat_in - (1 - is_disconnected) * big_m) / big_m, -np.inf, 0.0)
                )
                constraints.append(((heat_in + (1 - is_disconnected) * big_m) / big_m, 0.0, np.inf))
                constraints.append(
                    ((heat_out - (1 - is_disconnected) * big_m) / big_m, -np.inf, 0.0)
                )
                constraints.append(
                    ((heat_out + (1 - is_disconnected) * big_m) / big_m, 0.0, np.inf)
                )

        # Pipes that are connected in series should have the same heat direction.
        for pipes in self.energy_system_topology.pipe_series:
            if len(pipes) <= 1:
                continue

            assert (
                len({p for p in pipes if self.is_cold_pipe(p)}) == 0
            ), "Pipe series for Heat models should only contain hot pipes"

            base_flow_dir_var = self.state(self._heat_pipe_to_flow_direct_map[pipes[0]])

            for p in pipes[1:]:
                flow_dir_var = self.state(self._heat_pipe_to_flow_direct_map[p])
                constraints.append((base_flow_dir_var - flow_dir_var, 0.0, 0.0))

        return constraints

    def __demand_heat_to_discharge_path_constraints(self, ensemble_member):
        """
        This function adds constraints linking the flow to the thermal power at the demand assets.
        We use an equality constraint on the outgoing flow for every non-pipe asset. Meaning that we
        equate Q * rho * cp * T == Heat for outgoing flows, and inequalities for the heat carried
        in the pipes. This means that the heat can decrease in the network to compensate losses,
        but that the losses and thus flow will always be over-estimated with the temperature for
        which no temperature drops are modelled.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        for d in [
            *self.energy_system_components.get("heat_demand", []),
            *self.energy_system_components.get("airco", []),
        ]:
            heat_nominal = parameters[f"{d}.Heat_nominal"]
            cp = parameters[f"{d}.cp"]
            rho = parameters[f"{d}.rho"]
            discharge = self.state(f"{d}.Q")
            heat_out = self.state(f"{d}.HeatOut.Heat")

            ret_carrier = parameters[f"{d}.T_return_id"]
            return_temperatures = self.temperature_regimes(ret_carrier)
            big_m = 2.0 * self.bounds()[f"{d}.HeatOut.Heat"][1]

            if len(return_temperatures) == 0:
                constraints.append(
                    (
                        (heat_out - discharge * cp * rho * parameters[f"{d}.T_return"])
                        / heat_nominal,
                        0.0,
                        0.0,
                    )
                )
            else:
                for return_temperature in return_temperatures:
                    ret_temperature_is_selected = self.state(f"{ret_carrier}_{return_temperature}")
                    constraints.append(
                        (
                            (
                                heat_out
                                - discharge * cp * rho * return_temperature
                                + (1.0 - ret_temperature_is_selected) * big_m
                            )
                            / heat_nominal,
                            0.0,
                            np.inf,
                        )
                    )
                    constraints.append(
                        (
                            (
                                heat_out
                                - discharge * cp * rho * return_temperature
                                - (1.0 - ret_temperature_is_selected) * big_m
                            )
                            / heat_nominal,
                            -np.inf,
                            0.0,
                        )
                    )

        return constraints

    def __source_heat_to_discharge_path_constraints(self, ensemble_member):
        """
        This function adds constraints linking the flow to the thermal power at the demand assets.
        We use an equality constraint on the outgoing flow for every non-pipe asset. Meaning that we
        equate Q * rho * cp * T == Heat for outgoing flows, and inequalities for the heat carried
        in the pipes. This means that the heat can decrease in the network to compensate losses,
        but that the losses and thus flow will always be over-estimated with the temperature for
        which no temperature drops are modelled.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        for s in self.energy_system_components.get("heat_source", []):
            heat_nominal = parameters[f"{s}.Heat_nominal"]
            q_nominal = self.variable_nominal(f"{s}.Q")
            cp = parameters[f"{s}.cp"]
            rho = parameters[f"{s}.rho"]
            dt = parameters[f"{s}.dT"]

            discharge = self.state(f"{s}.Q")
            heat_out = self.state(f"{s}.HeatOut.Heat")

            constraint_nominal = (heat_nominal * cp * rho * dt * q_nominal) ** 0.5

            sup_carrier = parameters[f"{s}.T_supply_id"]
            supply_temperatures = self.temperature_regimes(sup_carrier)
            big_m = 2.0 * self.bounds()[f"{s}.HeatOut.Heat"][1]
            big_m = (
                big_m
                if big_m != np.inf
                else 2.0 * self.bounds()[f"{s}.Heat_source"][1] * parameters[f"{s}.T_supply"] / dt
            )

            if len(supply_temperatures) == 0:
                constraints.append(
                    (
                        (heat_out - discharge * cp * rho * parameters[f"{s}.T_supply"])
                        / heat_nominal,
                        0.0,
                        0.0,
                    )
                )
            else:
                for supply_temperature in supply_temperatures:
                    sup_temperature_is_selected = self.state(f"{sup_carrier}_{supply_temperature}")

                    constraints.append(
                        (
                            (
                                heat_out
                                - discharge * cp * rho * supply_temperature
                                + (1.0 - sup_temperature_is_selected) * big_m
                            )
                            / constraint_nominal,
                            0.0,
                            np.inf,
                        )
                    )
                    constraints.append(
                        (
                            (
                                heat_out
                                - discharge * cp * rho * supply_temperature
                                - (1.0 - sup_temperature_is_selected) * big_m
                            )
                            / constraint_nominal,
                            -np.inf,
                            0.0,
                        )
                    )

        return constraints

    def __cold_demand_heat_to_discharge_path_constraints(self, ensemble_member):
        """
        This function adds constraints linking the flow to the thermal power at the cold demand
        assets. We use an equality constraint on the outgoing flow for every non-pipe asset.
        Meaning that we equate Q * rho * cp * T == Heat for outgoing flows, and inequalities for
        the heat carried in the pipes. This means that the heat can decrease in the network to
        compensate losses, but that the losses and thus flow will always be over-estimated with the
        temperature for which no temperature drops are modelled.

        In the specific case of cold demand the temperature in the network can be below the ground
        temperature. This causes negative heat losses as the flow is heated up by the ground, we
        therefore constrain the discharge with the theoretical maximum temperature, which is the
        ground temperature.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        for d in self.energy_system_components.get("cold_demand", []):
            heat_nominal = parameters[f"{d}.Heat_nominal"]
            cp = parameters[f"{d}.cp"]
            rho = parameters[f"{d}.rho"]
            discharge = self.state(f"{d}.Q")
            heat_out = self.state(f"{d}.HeatOut.Heat")

            sup_carrier = parameters[f"{d}.T_supply_id"]
            supply_temperatures = self.temperature_regimes(sup_carrier)
            big_m = 2.0 * self.bounds()[f"{d}.HeatOut.Heat"][1]

            if len(supply_temperatures) == 0:
                constraints.append(
                    (
                        (heat_out - discharge * cp * rho * parameters[f"{d}.T_supply"])
                        / heat_nominal,
                        0.0,
                        0.0,
                    )
                )
            else:
                for sup_temperature in supply_temperatures:
                    sup_temperature_is_selected = self.state(f"{sup_carrier}_{sup_temperature}")
                    constraints.append(
                        (
                            (
                                heat_out
                                - discharge * cp * rho * sup_temperature
                                + (1.0 - sup_temperature_is_selected) * big_m
                            )
                            / heat_nominal,
                            0.0,
                            np.inf,
                        )
                    )
                    constraints.append(
                        (
                            (
                                heat_out
                                - discharge * cp * rho * sup_temperature
                                - (1.0 - sup_temperature_is_selected) * big_m
                            )
                            / heat_nominal,
                            -np.inf,
                            0.0,
                        )
                    )

        return constraints

    def __pipe_heat_to_discharge_path_constraints(self, ensemble_member):
        """
        This function adds constraints linking the flow to the thermal power at the pipe assets.
        We use an equality constraint on the outgoing flow for every non-pipe asset. Meaning that we
        equate Q * rho * cp * T == Heat for outgoing flows, and inequalities for the heat carried
        in the pipes. This means that the heat can decrease in the network to compensate losses,
        but that the losses and thus flow will always be over-estimated with the temperature for
        which no temperature drops are modelled.

        There are three cases for the constraint, namely:
        - no heat losses: In this case a single equality constraint can be used.
        - constant network temperature: In this case there is a single set inequality constraints
        - varying network temperature: In this case a set of big_m constraints is used to
        "activate" only the constraints with the selected network temperature.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        sum_heat_losses = 0.0

        for p in self.energy_system_components.get("heat_pipe", []):
            if p in self._pipe_heat_losses:
                sum_heat_losses += max(self._pipe_heat_losses[p])
            else:
                sum_heat_losses += parameters[f"{p}.Heat_loss"]

        assert not np.isnan(sum_heat_losses)

        for p in self.energy_system_components.get("heat_pipe", []):
            cp = parameters[f"{p}.cp"]
            rho = parameters[f"{p}.rho"]

            flow_dir_var = self._heat_pipe_to_flow_direct_map[p]
            flow_dir = self.state(flow_dir_var)
            scaled_heat_in = self.state(f"{p}.HeatIn.Heat")  # * heat_to_discharge_fac
            scaled_heat_out = self.state(f"{p}.HeatOut.Heat")  # * heat_to_discharge_fac
            pipe_q = self.state(f"{p}.Q")
            heat_nominal = self.variable_nominal(f"{p}.HeatIn.Heat")

            # We do not want Big M to be too tight in this case, as it results
            # in a rather hard yes/no constraint as far as feasibility on e.g.
            # a single source system is concerned. Use a factor of 2 to give
            # some slack.
            big_m = 2.0 * np.max(
                np.abs((*self.bounds()[f"{p}.HeatIn.Heat"], *self.bounds()[f"{p}.HeatOut.Heat"]))
            )

            carrier = parameters[f"{p}.carrier_id"]
            temperatures = self.temperature_regimes(carrier)

            for heat in [scaled_heat_in, scaled_heat_out]:
                if self.energy_system_options()["neglect_pipe_heat_losses"]:
                    temp = parameters[f"{p}.temperature"]
                    if len(temperatures) == 0:
                        constraints.append(
                            (
                                (heat - pipe_q * (cp * rho * temp)) / heat_nominal,
                                0.0,
                                0.0,
                            )
                        )
                    else:
                        for temperature in temperatures:
                            temperature_is_selected = self.state(f"{carrier}_{temperature}")
                            constraints.append(
                                (
                                    (
                                        heat
                                        - pipe_q * (cp * rho * temperature)
                                        + (1.0 - temperature_is_selected) * big_m
                                    )
                                    / big_m,
                                    0.0,
                                    np.inf,
                                )
                            )
                            constraints.append(
                                (
                                    (
                                        heat
                                        - pipe_q * (cp * rho * temperature)
                                        - (1.0 - temperature_is_selected) * big_m
                                    )
                                    / big_m,
                                    -np.inf,
                                    0.0,
                                )
                            )
                else:
                    # Note that during cold delivery the line can be colder than the ground
                    # temperature.
                    # In this case we have to bound the heat flowing in the line with the ground
                    # temperature instead, as the line can heat up to at maximum the ground
                    # temperature.
                    temp = max(parameters[f"{p}.temperature"], parameters[f"{p}.T_ground"])
                    assert big_m > 0.0

                    carrier = parameters[f"{p}.carrier_id"]
                    temperatures = self.temperature_regimes(carrier)
                    if len(temperatures) == 0:
                        constraints.append(
                            (
                                (heat - pipe_q * (cp * rho * temp) - big_m * (1 - flow_dir))
                                / big_m,
                                -np.inf,
                                0.0,
                            )
                        )
                        constraints.append(
                            (
                                (heat - pipe_q * (cp * rho * temp) + big_m * flow_dir) / big_m,
                                0.0,
                                np.inf,
                            )
                        )
                    elif len(temperatures) > 0:
                        for temperature in temperatures:
                            temperature_is_selected = self.state(f"{carrier}_{temperature}")
                            temperature = max(temperature, parameters[f"{p}.T_ground"])
                            constraints.append(
                                (
                                    (
                                        heat
                                        - pipe_q * (cp * rho * temperature)
                                        + big_m * flow_dir
                                        + (1.0 - temperature_is_selected) * big_m
                                    )
                                    / big_m,
                                    0.0,
                                    np.inf,
                                )
                            )
                            constraints.append(
                                (
                                    (
                                        heat
                                        - pipe_q * (cp * rho * temperature)
                                        - big_m * (1 - flow_dir)
                                        - (1.0 - temperature_is_selected) * big_m
                                    )
                                    / big_m,
                                    -np.inf,
                                    0.0,
                                )
                            )
        return constraints

    def __ates_temperature_path_constraints(self, ensemble_member):
        """
        This function adds constraints to determine the temperature state of the ATES and the
        requirements for connecting pipes.

        The temperature of the ATES is modelled as a continuous variable which is linked to a
        discretized ates temperature for the linearisation of the equations. This discretized ates
        temperature variable is a continuous variable for which only predefined values can be set.

        The same discretized temperatures for ATES are used as the ones available at the carrier and
        the pipe connected to the inport to ensure compatibility.

        The relation between the continuous and discrete ates temperature is:
         ates_temperature (continuous) >= ates_temperature_disc
        The following reasons are key for this choice:
          - This relation might cause an underestimation of the discrete ates temperature which in
          turn would result in an underestimation of the temperature and heat loss. However,
          assuming that the allowable temperature steps are small enough and the stored heat is an
          important factor, this should not be too big of a difference.
          - Furthermore, due to the setup of the linearisation of the temperature and heat loss,
          there will always be over-estimations at those specific temperatures.
          - Simultaneously there might be an under estimation of the heatloss in the pipe connecting
           the heat pump and the ATES, however due to the small temperature steps available and the
            short pipe length between these two, this underestimation should be small.
          - Since the ATES for the temperature configuration will always be connected to a heat
          pump, the ates discrete temperature will also affect COP of the heat pump. An
          underestimation of the temperature will result in a larger temperature lift the heatpump
          has to provide, thus using more electricity and requiring a larger heatpump capacity.
          Which will thus result in an over-estimation of the electricity used, an overestimation
          in the required heat pump capacity (in case of sizing) or even a lower limit on the heat
          that the heat pump can produce from the ATES.
          - Finally a lower temperature also results in a lower heat transport capacity of the
          pipes and a smaller heat extraction at those time steps due to the limit on the volumetric
           flow in the ATES. This will result in a longer time for the extraction of heat from the
           ATES to empty it, which will again result in more heat losses.

        During discharging of the ATES, the temperature of the pipe should be the same as the
        discretized temperature of the ATES. During charging the temperature of the carrier/pipe
        should be larger or equal to the discretized temperature of the ates, since one does not
        want to reduce the temperature during charging.
        """

        constraints = []
        parameters = self.parameters(ensemble_member)
        options = self.energy_system_options()

        for ates_asset, (
            (hot_pipe, _hot_pipe_orientation),
            (_cold_pipe, _cold_pipe_orientation),
        ) in {**self.energy_system_topology.ates}.items():

            if ates_asset in self.energy_system_components.get("low_temperature_ates", []):
                continue

            flow_dir_var = self._heat_pipe_to_flow_direct_map[hot_pipe]
            is_buffer_charging = self.state(flow_dir_var) * _hot_pipe_orientation

            sup_carrier = parameters[f"{ates_asset}.T_supply_id"]
            supply_temperatures = self.temperature_regimes(sup_carrier)
            ates_temperature = self.state(f"{ates_asset}.Temperature_ates")
            ates_temperature_disc = self.state(f"{ates_asset}__temperature_ates_disc")

            # discretized tempeature should alwyas be smaller or equal to ATES temperature
            constraints.append((ates_temperature - ates_temperature_disc, 0.0, np.inf))

            if options["include_ates_temperature_options"] and len(supply_temperatures) != 0:
                # ensures it selects the closest temperature
                # supplytemperature needs to be reducing
                # TODO: this could use ordering strategy
                big_m = max(supply_temperatures)
                for temperature in supply_temperatures[1:]:
                    temp_selected = self.state(f"{ates_asset}__temperature_disc_{temperature}")
                    prev_temp = supply_temperatures[supply_temperatures.index(temperature) - 1]
                    constraints.append(
                        (
                            ates_temperature
                            - ates_temperature_disc
                            - temp_selected * (prev_temp - temperature)
                            - (1 - temp_selected) * big_m,
                            -np.inf,
                            0.0,
                        )
                    )

                """
                This function adds constraints to ensure that only one temperature level is active
                for the ates temperature. Furthermore, it sets the
                temperature variable to the temperature associated with the temperature of the
                integer variable. Potentially these lines could be a separate function.
                """
                variable_sum = 0.0
                for temperature in supply_temperatures:
                    temp_selected = self.state(f"{ates_asset}__temperature_disc_{temperature}")
                    variable_sum += temp_selected
                    big_m = 2.0 * max(supply_temperatures)
                    constraints.append(
                        (
                            (temperature - ates_temperature_disc + (1.0 - temp_selected) * big_m),
                            0.0,
                            np.inf,
                        )
                    )
                    constraints.append(
                        (
                            (temperature - ates_temperature_disc - (1.0 - temp_selected) * big_m),
                            -np.inf,
                            0.0,
                        )
                    )
                if len(supply_temperatures) > 0:
                    constraints.append((variable_sum, 1.0, 1.0))

                # equality constraint during charging to ensure charging at highest temperature
                big_m = 2.0 * max(supply_temperatures)
                sup_temperature_disc = self.state(f"{sup_carrier}_temperature")

                constraints.append(
                    (
                        (
                            max(supply_temperatures)
                            - sup_temperature_disc
                            + big_m * (1.0 - is_buffer_charging)
                        ),
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (
                            max(supply_temperatures)
                            - sup_temperature_disc
                            - big_m * (1.0 - is_buffer_charging)
                        ),
                        -np.inf,
                        0.0,
                    )
                )

                # Equality constraint if discharging using big_m;
                # discr_temp_carrier == discr_temp_ates
                constraints.append(
                    (
                        ates_temperature_disc - sup_temperature_disc + is_buffer_charging * big_m,
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        ates_temperature_disc - sup_temperature_disc - is_buffer_charging * big_m,
                        -np.inf,
                        0.0,
                    )
                )
                # inequality constraint when charging, carrier temperature>= ates temperature
                constraints.append(
                    (
                        sup_temperature_disc - ates_temperature + (1 - is_buffer_charging) * big_m,
                        0.0,
                        np.inf,
                    )
                )
            else:
                constraints.append(
                    (parameters[f"{ates_asset}.T_supply"] - ates_temperature_disc, 0.0, 0.0)
                )

        return constraints

    def __get_linear_temperature_loss_vs_storedheat(
        self, max_stored_heat, temperature_ates, temperature_ambient=17, n_lines=5
    ):
        """
        Function to linearise the temperature loss based on:
        - the current discrete temperature of the ATES well
        - the current ambient temperature
        - the current stored heat
        The current stored heat is split in segments of equal size to linearise into n_lines
        numbers of lines
        Tloss/dt = a*stored_heat/heat_max + b
        """

        heat_points = np.linspace(1, max_stored_heat, n_lines + 1) / max_stored_heat  # cannot be 0

        def algebraic_temperature_loss_ates(
            heat_factor, max_stored_heat, temperature_ates, temperature_ambient
        ):
            # TODO: function needs to be updated with realistic function
            # coefficient currently based on:
            # 30°C temperature drop over 3 months = 30/(3600*24*30*3)=3.86e-6
            # dTloss/dt = c ((Tates-Tamb)/(Tatesmin-Tamb)-1)*e^(-stored_heat_normalised) # Tatesmin
            # currently hardcoded as 40
            # assuming temperature ates of 70°C and 17°C ambient throughout
            # assuming 50% of max stored heat throughout 7.3e-7
            dtemperature_dt = (
                6.13e-6
                * ((temperature_ates - temperature_ambient) / (40 - temperature_ambient) - 1)
                * np.exp(-heat_factor)
            )
            return dtemperature_dt

        temperature_loss_dt_points = np.array(
            [
                algebraic_temperature_loss_ates(
                    h, max_stored_heat, temperature_ates, temperature_ambient
                )
                for h in heat_points
            ]
        )

        a = np.diff(temperature_loss_dt_points) / np.diff(heat_points)
        b = temperature_loss_dt_points[1:] - a * heat_points[1:]

        return a, b

    def __get_linear_temperature_charging_vs_heatates(
        self, max_heat_ates, temperature_ates, temperature_supply, n_lines=1
    ):
        """
        Function to linearise the temperature loss based on:
        - the current discrete temperature of the ATES well (not yet included)
        - the current temperature of the carrier which will charge the well (not yet included)
        - the current stored heat (not yet included)
        - the added heat during charging
        The current stored heat is split in segments of equal size to linearise into n_lines
        numbers of lines
        Tloss/dt = a*heat_ates/heat_max + b
        """

        heat_points = np.linspace(0, max_heat_ates, n_lines + 1) / max_heat_ates

        def algebraic_temperature_charge_ates(
            heat_ates, max_heat_ates, temperature_ates, temperature_supply
        ):
            # TODO: function needs to be updated with realistic function
            # This coefficient currently results in about a maximum temperature increase of 25°C
            # over a month during maximum charging
            # 1e-5*(temperature_supply-temperature_ates)*heat_ates
            dtemperature_dt = 1e-5 * heat_ates
            return dtemperature_dt

        temperature_loss_dt_points = np.array(
            [
                algebraic_temperature_charge_ates(
                    h, max_heat_ates, temperature_ates, temperature_supply
                )
                for h in heat_points
            ]
        )

        a = np.diff(temperature_loss_dt_points) / np.diff(heat_points)
        b = temperature_loss_dt_points[1:] - a * heat_points[1:]

        return a, b

    def __get_linear_heatloss_vs_storedheat(
        self, heat_stored_max, temperature_ates, temperature_ambient=17, n_lines=1
    ):
        """
        Function to linearise the temperature loss based on:
        - the current discrete temperature of the ATES well
        - the current ambient temperature
        - the current stored heat
        The current stored heat is split in segments of equal size to linearise into n_lines
        numbers of lines
        heatloss/dt = a*stored_heat + b
        """
        # TODO: ensure heatloss and temperature loss linearisation rely on the same equations
        heat_points = np.linspace(1.0, heat_stored_max, n_lines + 1)  # cannot be 0

        def algebraic_heatloss_ates(
            heat_points, heat_stored_max, temperature_ates, temperature_ambient
        ):
            # TODO: function needs to be updated with realistic function, woudl normally non convex
            # coefficient currently based on:
            # 30°C temperature drop: 125 MJ / m3
            # assume over 3 months: 16.2 W/m3 -> xx W/J
            # max_stored_volume = max_stored_heat/(40 (dT assumed) *ro*cp)= 334e3 m3
            # nominal_volume = max_stored_volume/2
            # heatloss = 16.2*max_stored_volume W
            # heatloss = 16.2 / (70-17) * stored_volume * (T_ates - T_amb)
            # stored_volume = stored_heat / (40 (dT assumed) *rho*cp)
            # multiplied coefficient with 1e-1
            heatloss = 1.5e-10 * heat_points * (temperature_ates - temperature_ambient)
            # heatloss = 1e4 * (temperature_ates - temperature_ambient) * (
            #     heat_points / heat_stored_max)**2
            return heatloss

        heatloss_dt_points = np.array(
            [
                algebraic_heatloss_ates(h, heat_stored_max, temperature_ates, temperature_ambient)
                for h in heat_points
            ]
        )

        a = np.diff(heatloss_dt_points) / np.diff(heat_points)
        b = heatloss_dt_points[1:] - a * (heat_points[1:])

        return a, b

    def __ates_temperature_changing_path_constraints(self, ensemble_member):
        """
        Contains constraints for the temperature losses and gains in the ates:
        - If there are different temperatures available for the ates;
        the heat loss which is a function of the current temperature of the ATES, the ambient
        ground temperature and the stored heat, is transformed in a piecewise linear function of
        the stored heat and the equations are selected based on the ates temperature.
        - If there are no other temperatures available for the ates;
        the heat loss is defined as a linear equality constraint based on a given efficiency and a
        function of the stored heat.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)
        bounds = self.bounds()
        options = self.energy_system_options()

        for ates, (
            (hot_pipe, _hot_pipe_orientation),
            (_cold_pipe, _cold_pipe_orientation),
        ) in {**self.energy_system_topology.ates}.items():

            if ates in self.energy_system_components.get("low_temperature_ates", []):
                continue

            ates_dt_charging = self.state(f"{ates}.Temperature_change_charging")
            ates_dt_loss = self.state(f"{ates}.Temperature_loss")

            ates_temperature_loss_nominal = self.variable_nominal(f"{ates}.Temperature_loss")
            ates_dt_charging_nominal = self.variable_nominal(f"{ates}.Temperature_change_charging")

            sup_carrier = parameters[f"{ates}.T_supply_id"]
            supply_temperatures = self.temperature_regimes(sup_carrier)

            if options["include_ates_temperature_options"] and len(supply_temperatures) != 0:
                soil_temperature = parameters[f"{ates}.T_amb"]

                flow_dir_var = self._heat_pipe_to_flow_direct_map[hot_pipe]
                is_buffer_charging = self.state(flow_dir_var) * _hot_pipe_orientation
                heat_stored_max = bounds[f"{ates}.Stored_heat"][1]
                heat_ates_max = bounds[f"{ates}.Heat_ates"][1]
                heat_ates = self.state(f"{ates}.Heat_ates")
                stored_heat = self.state(f"{ates}.Stored_heat")

                big_m = 2.0 * max(bounds[f"{ates}.Temperature_change_charging"][1], 1e-5)

                # ensures no ates temperature change because of charging when discharging
                constraints.append(
                    (
                        (ates_dt_charging - is_buffer_charging * big_m) / ates_dt_charging_nominal,
                        -np.inf,
                        0.0,
                    )
                )

                # TODO temporary: still add relation to bound ates_dt_charging, should also be
                #  piecewise linear as a function of the stored heat, added heat and temperature
                #  difference
                # TODO: later placed inside ates_temperature loop, in which a nested loop for the
                #  supply temperature of the carrier should be located, only needs to create
                #  constraint for carrier_temperatures>ates_temperature.
                a, b = self.__get_linear_temperature_charging_vs_heatates(heat_ates_max, 50, 70)
                # constraint provides upper bound of the temperature change that can occur due to
                # charging
                constraints.append(
                    (
                        (
                            ates_dt_charging
                            - (a * heat_ates / heat_ates_max + b)
                            - (1 - is_buffer_charging) * big_m
                        )
                        / ates_dt_charging_nominal,
                        -np.inf,
                        0.0,
                    )
                )

                big_m = 2.0 * bounds[f"{ates}.Temperature_loss"][1]
                for ates_temperature in supply_temperatures:
                    ates_temperature_is_selected = self.state(
                        f"{ates}__temperature_disc_{ates_temperature}"
                    )
                    # setting temperature losses to zero when lowest discrete temperature is
                    # selected, to ensure temperature does not further drop and requires
                    # ates_dt_charging to cover the difference
                    if ates_temperature == min(supply_temperatures):
                        constraints.append(
                            (
                                (ates_dt_loss + big_m * (1 - ates_temperature_is_selected))
                                / ates_temperature_loss_nominal,
                                0.0,
                                np.inf,
                            )
                        )
                        constraints.append(
                            (
                                (ates_dt_loss - big_m * (1 - ates_temperature_is_selected))
                                / ates_temperature_loss_nominal,
                                -np.inf,
                                0.0,
                            )
                        )
                    else:
                        # if is selected, then specific temperature loss constraint should be
                        # applicable, which will be a function of the stored heat
                        a, b = self.__get_linear_temperature_loss_vs_storedheat(
                            heat_stored_max, ates_temperature, temperature_ambient=soil_temperature
                        )
                        stored_heat_vec = ca.repmat(stored_heat, len(a))
                        is_buffer_charging_vec = ca.repmat(is_buffer_charging, len(a))
                        ates_dt_loss_vec = ca.repmat(ates_dt_loss, len(a))
                        ates_temperature_is_selected_vec = ca.repmat(
                            ates_temperature_is_selected, len(a)
                        )

                        # under discharge
                        constraints.append(
                            (
                                (
                                    ates_dt_loss_vec
                                    - (a * stored_heat_vec / heat_stored_max + b)
                                    + big_m * (1.0 - ates_temperature_is_selected_vec)
                                    + big_m * is_buffer_charging_vec
                                )
                                / ates_temperature_loss_nominal,
                                0.0,
                                np.inf,
                            )
                        )

                        # #under charge dt_loss=0
                        # constraints.append(
                        #     (
                        #         (
                        #                 ates_dt_loss_vec
                        #                 + big_m * (1.0*np.ones(len(a))-is_buffer_charging_vec)
                        #         )
                        #         / ates_temperature_loss_nominal,
                        #         0.0,
                        #         np.inf,
                        #     )
                        # )
                        constraints.append(
                            (
                                (ates_dt_loss - big_m * (1.0 - is_buffer_charging))
                                / ates_temperature_loss_nominal,
                                -np.inf,
                                0.0,
                            )
                        )
            else:
                constraints.append((ates_dt_charging / ates_dt_charging_nominal, 0.0, 0.0))
                constraints.append((ates_dt_loss / ates_temperature_loss_nominal, 0.0, 0.0))
        return constraints

    def __ates_heat_losses_path_constraints(self, ensemble_member):
        """
        Constraints for the heat losses in the ates, either one of the two options is selected:
        - If there are different temperatures available for the ates;
        the heat loss which is a function of the current temperature of the ATES, the ambient
        ground temperature and the stored heat, is transformed in a piecewise linear function of
        the stored heat and the equations are selected based on the ates temperature.
        - If there are no other temperatures available for the ates;
        the heat loss is defined as a linear equality constraint based on a given efficiency and a
        function of the stored heat.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)
        bounds = self.bounds()
        options = self.energy_system_options()

        for ates in [
            *self.energy_system_components.get("ates", []),
            *self.energy_system_components.get("low_temperature_ates", []),
        ]:
            heat_loss_nominal = self.variable_nominal(f"{ates}.Heat_loss")
            soil_temperature = parameters[f"{ates}.T_amb"]
            heat_stored_max = bounds[f"{ates}.Stored_heat"][1]

            stored_heat = self.state(f"{ates}.Stored_heat")
            heat_loss = self.state(f"{ates}.Heat_loss")

            sup_carrier = parameters[f"{ates}.T_supply_id"]
            supply_temperatures = self.temperature_regimes(sup_carrier)

            if (
                options["include_ates_temperature_options"]
                and len(supply_temperatures) != 0
                and ates in self.energy_system_components.get("ates", [])
            ):
                big_m_heatloss = 2 * heat_loss_nominal
                for ates_temperature in supply_temperatures:
                    ates_temperature_is_selected = self.state(
                        f"{ates}__temperature_disc_{ates_temperature}"
                    )
                    # linearisation of heatloss
                    a, b = self.__get_linear_heatloss_vs_storedheat(
                        heat_stored_max, ates_temperature, temperature_ambient=soil_temperature
                    )
                    stored_heat_vec = ca.repmat(stored_heat, len(a))
                    ates_heat_loss_vec = ca.repmat(heat_loss, len(a))
                    ates_temperature_is_selected_vec = ca.repmat(
                        ates_temperature_is_selected, len(a)
                    )
                    constraints.append(
                        (
                            (
                                ates_heat_loss_vec
                                - (a * stored_heat_vec + b)
                                + big_m_heatloss * (1 - ates_temperature_is_selected_vec)
                            )
                            / heat_loss_nominal,
                            0.0,
                            np.inf,
                        )
                    )
                    # TODO: check if needed: add the constraint below incase we want piecewise
                    #  linear equality for the ates heat loss
                    # constraints.append(
                    #     ((ates_heat_loss_vec - (a * stored_heat_vec + b) - big_m_heatloss * (
                    #             1 - ates_temperature_is_selected_vec)) / heat_loss_nominal,
                    #             -np.inf,
                    #      0.0)
                    # )
            else:
                # no temperature states available
                coeff_efficiency_ates = parameters[f"{ates}.heat_loss_coeff"]
                constraints.append(
                    (
                        (heat_loss - stored_heat * coeff_efficiency_ates) / heat_loss_nominal,
                        0.0,
                        0.0,
                    )
                )

        return constraints

    def __storage_heat_to_discharge_path_constraints(self, ensemble_member):
        """
        This function adds constraints linking the flow to the thermal power at the pipe assets.
        We use an equality constraint on the outgoing flow for every non-pipe asset. Meaning that we
        equate Q * rho * cp * T == Heat for outgoing flows, and inequalities for the heat carried
        in the pipes. This means that the heat can decrease in the network to compensate losses,
        but that the losses and thus flow will always be over-estimated with the temperature for
        which no temperature drops are modelled.

        This function adds the constraints relating the discharge to the thermal power at the
        buffer component. This is done following the philosophy described at the heat_to_discharge
        for sources/demands. Where a big_m formulation is used to switch between source and demand
        logic depending on whether the buffer is discharging or charging. For this purpose the
        direction of the connecting supply pipe is used, where a positive direction is charging
        (demand logic) and a negative direction is discharging (source logic). This also means that
        buffers can only be connected with the supply pipe going in positive direction to the
        buffer.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        for b, (
            (hot_pipe, _hot_pipe_orientation),
            (_cold_pipe, _cold_pipe_orientation),
        ) in {**self.energy_system_topology.buffers, **self.energy_system_topology.ates}.items():
            if hot_pipe not in self.energy_system_components.get("heat_pipe", []):
                # We skip the constraints in case their is a logical link to the storage.
                continue

            heat_nominal = parameters[f"{b}.Heat_nominal"]
            q_nominal = self.variable_nominal(f"{b}.Q")
            cp = parameters[f"{b}.cp"]
            rho = parameters[f"{b}.rho"]
            dt = parameters[f"{b}.dT"]

            discharge = self.state(f"{b}.HeatIn.Q")
            # Note that `heat_hot` can be negative for the buffer; in that case we
            # are extracting heat from it.
            heat_out = self.state(f"{b}.HeatOut.Heat")
            heat_in = self.state(f"{b}.HeatIn.Heat")

            # We want an _equality_ constraint between discharge and heat if the buffer is
            # consuming (i.e. behaving like a "demand"). We want an _inequality_
            # constraint (`|heat| >= |f(Q)|`) just like a "heat_source" component if heat is
            # extracted from the buffer. We accomplish this by disabling one of
            # the constraints with a boolean. Note that `discharge` and `heat_hot`
            # are guaranteed to have the same sign.
            flow_dir_var = self._heat_pipe_to_flow_direct_map[hot_pipe]
            is_buffer_charging = self.state(flow_dir_var)

            big_m = 2.0 * np.max(
                np.abs((*self.bounds()[f"{b}.HeatIn.Heat"], *self.bounds()[f"{b}.HeatOut.Heat"]))
            )

            sup_carrier = parameters[f"{b}.T_supply_id"]
            ret_carrier = parameters[f"{b}.T_return_id"]
            supply_temperatures = self.temperature_regimes(sup_carrier)
            return_temperatures = self.temperature_regimes(ret_carrier)

            if len(supply_temperatures) == 0:
                constraint_nominal = (heat_nominal * cp * rho * dt * q_nominal) ** 0.5
                # only when discharging the heat_in should match the heat excactly (like producer)
                constraints.append(
                    (
                        (
                            heat_in
                            - discharge * cp * rho * parameters[f"{b}.T_supply"]
                            + is_buffer_charging * big_m
                        )
                        / constraint_nominal,
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (heat_in - discharge * cp * rho * parameters[f"{b}.T_supply"])
                        / constraint_nominal,
                        -np.inf,
                        0.0,
                    )
                )
            else:
                bounds = self.bounds()
                max_discharge = bounds[f"{b}.Q"][1]
                constraint_nominal = (
                    heat_nominal * cp * rho * max(supply_temperatures) * q_nominal
                ) ** 0.5
                temperature_var = self.state(f"{sup_carrier}_temperature")
                constraints.append(
                    (
                        (heat_in - max_discharge * cp * rho * temperature_var) / constraint_nominal,
                        -np.inf,
                        0.0,
                    )
                )
                constraints.append(
                    (
                        (heat_in + max_discharge * cp * rho * temperature_var) / constraint_nominal,
                        0.0,
                        np.inf,
                    )
                )
                for supply_temperature in supply_temperatures:
                    sup_temperature_is_selected = self.state(f"{sup_carrier}_{supply_temperature}")
                    constraint_nominal = (
                        heat_nominal * cp * rho * supply_temperature * q_nominal
                    ) ** 0.5
                    constraints.append(
                        (
                            (
                                heat_in
                                - discharge * cp * rho * supply_temperature
                                + (1.0 - sup_temperature_is_selected) * big_m
                                + is_buffer_charging * big_m
                            )
                            / constraint_nominal,
                            0.0,
                            np.inf,
                        )
                    )
                    constraints.append(
                        (
                            (
                                heat_in
                                - discharge * cp * rho * supply_temperature
                                - (1.0 - sup_temperature_is_selected) * big_m
                            )
                            / constraint_nominal,
                            -np.inf,
                            0.0,
                        )
                    )

            if len(return_temperatures) == 0:
                constraint_nominal = (heat_nominal * cp * rho * dt * q_nominal) ** 0.5
                # Only when consuming/charging the heatout should match the q rho cp Tret
                constraints.append(
                    (
                        (heat_out - discharge * cp * rho * parameters[f"{b}.T_return"])
                        / constraint_nominal,
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (
                            heat_out
                            - discharge * cp * rho * parameters[f"{b}.T_return"]
                            - (1.0 - is_buffer_charging) * big_m
                        )
                        / constraint_nominal,
                        -np.inf,
                        0.0,
                    )
                )
            else:
                for return_temperature in return_temperatures:
                    ret_temperature_is_selected = self.state(f"{ret_carrier}_{return_temperature}")
                    constraint_nominal = (
                        heat_nominal * cp * rho * return_temperature * q_nominal
                    ) ** 0.5
                    constraints.append(
                        (
                            (
                                heat_out
                                - discharge * cp * rho * return_temperature
                                + (1.0 - ret_temperature_is_selected) * big_m
                            )
                            / constraint_nominal,
                            0.0,
                            np.inf,
                        )
                    )
                    constraints.append(
                        (
                            (
                                heat_out
                                - discharge * cp * rho * return_temperature
                                - (2.0 - ret_temperature_is_selected - is_buffer_charging) * big_m
                            )
                            / constraint_nominal,
                            -np.inf,
                            0.0,
                        )
                    )

        return constraints

    def __network_temperature_path_constraints(self, ensemble_member):
        """
        This function adds constraints to ensure that only one temperature level is active for the
        supply and return network within one hydraulically coupled system. Furthermore, it sets the
        temperature variable to the temperature associated with the temperature of the integer
        variable.
        """
        constraints = []

        for _carrier, temperatures in self.temperature_carriers().items():
            number = temperatures["id_number_mapping"]
            sum = 0.0
            temperature_regimes = self.temperature_regimes(int(number))
            for temperature in temperature_regimes:
                temp_selected = self.state(f"{int(number)}_{temperature}")
                sum += temp_selected
                temperature_var = self.state(f"{int(number)}_temperature")
                big_m = 2.0 * self.bounds()[f"{int(number)}_temperature"][1]
                # Constraints for setting the temperature variable to the chosen temperature
                constraints.append(
                    (temperature - temperature_var + (1.0 - temp_selected) * big_m, 0.0, np.inf)
                )
                constraints.append(
                    (temperature - temperature_var - (1.0 - temp_selected) * big_m, -np.inf, 0.0)
                )
            if len(temperature_regimes) > 0:
                # Constraint to ensure that one single temperature is chosen for every timestep
                constraints.append((sum, 1.0, 1.0))

        return constraints

    def __heat_exchanger_heat_to_discharge_path_constraints(self, ensemble_member):
        """
        This function adds the heat to discharge constraints of components that connect two
        hydraulically decoupled networks. We assume that there is a dedicated primary side and
        secondary side and that Thermal power can only flow from primary to secondary.

        Following this assumption we use the demand logic to relate heat to discharge at the
        primary side and the source logic for relating heat to discharge at the secondary side.

        This function also adds constraints to ensure physically logical temperatures between the
        primary and secondary side when varying temperature is applied to the optimization.
        Assuming a counter flow heat exchanger, this means that the secondary supply temperature
        will always be below the primary supply temperature and that the primary return temperature
        has to be above the secondary return temperature.

        Finally, an is disabled variable is set for when the heat exchanger is not used. This is
        needed to allow disabling of the HEX temperature constraints when no heat is flowing
        through the HEX.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        hn_settings = self.heat_network_settings

        # The primary side of the heat exchanger acts like a heat consumer, and the secondary side
        # acts as a heat producer. Essentially using equality constraints to set the heat leaving
        # the secondary side based on the secondary Supply temperature and the heat leaving the
        # primary side based on the primary Return temperature.

        for heat_exchanger in [
            *self.energy_system_components.get("heat_exchanger", []),
            *self.energy_system_components.get("heat_pump", []),
        ]:
            cp_prim = parameters[f"{heat_exchanger}.Primary.cp"]
            rho_prim = parameters[f"{heat_exchanger}.Primary.rho"]
            cp_sec = parameters[f"{heat_exchanger}.Secondary.cp"]
            rho_sec = parameters[f"{heat_exchanger}.Secondary.rho"]
            dt_prim = parameters[f"{heat_exchanger}.Primary.dT"]
            dt_sec = parameters[f"{heat_exchanger}.Secondary.dT"]
            discharge_primary = self.state(f"{heat_exchanger}.Primary.HeatIn.Q")
            discharge_secondary = self.state(f"{heat_exchanger}.Secondary.HeatOut.Q")
            heat_primary = self.state(f"{heat_exchanger}.Primary_heat")
            heat_out_prim = self.state(f"{heat_exchanger}.Primary.HeatOut.Heat")
            heat_in_prim = self.state(f"{heat_exchanger}.Primary.HeatIn.Heat")
            heat_out_sec = self.state(f"{heat_exchanger}.Secondary.HeatOut.Heat")
            heat_in_sec = self.state(f"{heat_exchanger}.Secondary.HeatIn.Heat")

            constraint_nominal = (
                cp_prim
                * rho_prim
                * dt_prim
                * self.variable_nominal(f"{heat_exchanger}.Primary.HeatIn.Q")
            )

            sup_carrier_prim = parameters[f"{heat_exchanger}.Primary.T_supply_id"]
            ret_carrier_prim = parameters[f"{heat_exchanger}.Primary.T_return_id"]

            supply_temperatures_prim = self.temperature_regimes(sup_carrier_prim)
            return_temperatures_prim = self.temperature_regimes(ret_carrier_prim)

            big_m = 2.0 * self.bounds()[f"{heat_exchanger}.Primary.HeatOut.Heat"][1]

            def __constraints_temperature_heat_to_discharge_bypass(
                heat_out, expr, sum_temp_selec, big_m: float, constraint_nominal: float
            ):
                """
                Generic setup of the constraints for the heat to discharge of a heat exchanger.
                Ensuring that
                - when bypass is allowed, heatout = heatin
                - otherwise heatout = Q*cp*rho*Tout
                - based on the selected temperatures the approriate expression is added.

                Args:
                    heat_out: HeatOut variable
                    exp: expression for heatout
                    sum_temp_selec: sum of two binary variables and or floats (1.0 or 2.0) to
                    identify if the temperature for this constraint is selected
                    big_m: float to activate/deactive this constraint
                    constraint_nominal: nominal to scale the constraint

                Returns:

                """
                constraints = []
                constraints.append(
                    (
                        (heat_out - expr + (2.0 - sum_temp_selec) * big_m) / constraint_nominal,
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (heat_out - expr - (2.0 - sum_temp_selec) * big_m) / constraint_nominal,
                        -np.inf,
                        0.0,
                    )
                )
                return constraints

            def __constraints_temperature_heat_to_discharge_bypass_primary(
                temp_prim_in: float,
                temp_prim_out: float,
                discharge,
                cp: float,
                rho: float,
                heat_in,
                heat_out,
                temp_high_selec,
                temp_low_selec,
                big_m: float,
                constraint_nominal: float,
            ):
                """
                Generic setup of the constraints for the primary side of the heat exchanger for
                heat to discharge.
                Ensuring that
                - when bypass is allowed, heatout = heatin
                - otherwise heatout = Q*cp*rho*Tout
                - based on the selected temperatures

                Args:
                    temp_prim_in: Primary temperature in
                    temp_prim_out: Primary temperature out
                    discharge: Casadi variable for primary volumetric flow
                    cp: specific heat capacity
                    rho: density
                    heat_in: Casadi variable for primary heat in
                    heat_out: Casadi variable for primary heat out
                    temp_high_selec: is_selected variable for the primary in temperature or 1.0
                    if temperature is fixed
                    temp_low_selec: is_selected variable for the primary out temperature or 1.0
                    if temperature is fixed
                    big_m: float to activate/deactive this constraint
                    constraint_nominal: nominal to scale the constraint

                Returns:

                """

                if temp_prim_out >= temp_prim_in:
                    expr = heat_in
                else:
                    expr = discharge * cp * rho * temp_prim_out

                return __constraints_temperature_heat_to_discharge_bypass(
                    heat_out, expr, temp_high_selec + temp_low_selec, big_m, constraint_nominal
                )

            def __constraints_temperature_heat_to_discharge_bypass_secondary(
                temp_sec_in: float,
                temp_sec_out: float,
                discharge,
                cp: float,
                rho: float,
                heat_in,
                heat_out,
                temp_high_selec,
                temp_low_selec,
                big_m: float,
                constraint_nominal: float,
            ):
                """
                Generic setup of the constraints for the primary side of the heat exchanger for
                heat to discharge.
                Ensuring that
                - when bypass is allowed, heatout = heatin
                - otherwise heatout = Q*cp*rho*Tout
                - based on the selected temperatures

                Args:
                    temp_sec_in: Secondary temperature in
                    temp_sec_out: Secondary temperature out
                    discharge: Casadi variable for secondary volumetric flow
                    cp: specific heat capacity
                    rho: density
                    heat_in: Casadi variable for secondary heat in
                    heat_out: Casadi variable for secondary heat out
                    temp_high_selec: is_selected variable for the secondary out temperature or 1.0
                    if temperature is fixed
                    temp_low_selec: is_selected variable for the secondary in temperature or
                    1.0 if temperature is fixed
                    big_m: float to activate/deactive this constraint
                    constraint_nominal: nominal to scale the constraint

                Returns:

                """

                if temp_sec_in >= temp_sec_out:
                    expr = heat_in
                else:
                    expr = discharge * cp * rho * temp_sec_out

                return __constraints_temperature_heat_to_discharge_bypass(
                    heat_out, expr, temp_high_selec + temp_low_selec, big_m, constraint_nominal
                )

            # primary side
            if len(return_temperatures_prim) == 0:
                return_temperature = parameters[f"{heat_exchanger}.Primary.T_return"]
                if len(supply_temperatures_prim) != 0 and hn_settings["heat_exchanger_bypass"]:
                    for sup_temp in supply_temperatures_prim:
                        sup_temperature_is_selected = self.state(f"{sup_carrier_prim}_{sup_temp}")
                        constraints.extend(
                            __constraints_temperature_heat_to_discharge_bypass_primary(
                                sup_temp,
                                return_temperature,
                                discharge_primary,
                                cp_prim,
                                rho_prim,
                                heat_in_prim,
                                heat_out_prim,
                                sup_temperature_is_selected,
                                1.0,
                                big_m,
                                constraint_nominal,
                            )
                        )
                else:
                    sup_temp = parameters[f"{heat_exchanger}.Primary.T_supply"]
                    assert sup_temp >= return_temperature
                    constraints.extend(
                        __constraints_temperature_heat_to_discharge_bypass_primary(
                            sup_temp,
                            return_temperature,
                            discharge_primary,
                            cp_prim,
                            rho_prim,
                            heat_in_prim,
                            heat_out_prim,
                            1.0,
                            1.0,
                            big_m,
                            constraint_nominal,
                        )
                    )

            else:
                for return_temperature in return_temperatures_prim:
                    ret_temperature_is_selected = self.state(
                        f"{ret_carrier_prim}_{return_temperature}"
                    )
                    if hn_settings["heat_exchanger_bypass"] and len(supply_temperatures_prim) != 0:
                        # if bypass of heat exchanger is allowed and the primary in temperature
                        # is also a variable
                        for sup_temp in supply_temperatures_prim:
                            sup_temperature_is_selected = self.state(
                                f"{sup_carrier_prim}_{sup_temp}"
                            )
                            constraints.extend(
                                __constraints_temperature_heat_to_discharge_bypass_primary(
                                    sup_temp,
                                    return_temperature,
                                    discharge_primary,
                                    cp_prim,
                                    rho_prim,
                                    heat_in_prim,
                                    heat_out_prim,
                                    sup_temperature_is_selected,
                                    ret_temperature_is_selected,
                                    big_m,
                                    constraint_nominal,
                                )
                            )

                    else:
                        sup_temp = parameters[(f"{heat_exchanger}.Primary.T_supply")]
                        constraints.extend(
                            __constraints_temperature_heat_to_discharge_bypass_primary(
                                sup_temp,
                                return_temperature,
                                discharge_primary,
                                cp_prim,
                                rho_prim,
                                heat_in_prim,
                                heat_out_prim,
                                1.0,
                                ret_temperature_is_selected,
                                big_m,
                                constraint_nominal,
                            )
                        )

            # Secondary side
            sup_carrier_sec = parameters[f"{heat_exchanger}.Secondary.T_supply_id"]
            ret_carrier_sec = parameters[f"{heat_exchanger}.Secondary.T_return_id"]

            supply_temperatures_sec = self.temperature_regimes(sup_carrier_sec)
            return_temperatures_sec = self.temperature_regimes(ret_carrier_sec)
            big_m = 2.0 * self.bounds()[f"{heat_exchanger}.Secondary.HeatOut.Heat"][1]
            constraint_nominal = (
                cp_sec * rho_sec * dt_sec * self.bounds()[f"{heat_exchanger}.Secondary.HeatIn.Q"][1]
            )

            if len(supply_temperatures_sec) == 0:
                supply_temperature = parameters[f"{heat_exchanger}.Secondary.T_supply"]
                if len(return_temperatures_sec) != 0 and hn_settings["heat_exchanger_bypass"]:
                    for ret_temperature in return_temperatures_sec:
                        ret_temperature_is_selected = self.state(
                            f"{ret_carrier_sec}_{ret_temperature}"
                        )
                        constraints.extend(
                            __constraints_temperature_heat_to_discharge_bypass_secondary(
                                ret_temperature,
                                supply_temperature,
                                discharge_secondary,
                                cp_sec,
                                rho_sec,
                                heat_in_sec,
                                heat_out_sec,
                                ret_temperature_is_selected,
                                1.0,
                                big_m,
                                constraint_nominal,
                            )
                        )
                else:
                    ret_temperature = parameters[f"{heat_exchanger}.Secondary.T_return"]
                    assert supply_temperature >= ret_temperature
                    constraints.extend(
                        __constraints_temperature_heat_to_discharge_bypass_secondary(
                            ret_temperature,
                            supply_temperature,
                            discharge_secondary,
                            cp_sec,
                            rho_sec,
                            heat_in_sec,
                            heat_out_sec,
                            1.0,
                            1.0,
                            big_m,
                            constraint_nominal,
                        )
                    )
            else:
                for supply_temperature in supply_temperatures_sec:
                    sup_temperature_is_selected = self.state(
                        f"{sup_carrier_sec}_{supply_temperature}"
                    )
                    if len(return_temperatures_sec) != 0 and hn_settings["heat_exchanger_bypass"]:
                        for ret_temperature in return_temperatures_sec:
                            ret_temperature_is_selected = self.state(
                                f"{ret_carrier_sec}_{ret_temperature}"
                            )
                            constraints.extend(
                                __constraints_temperature_heat_to_discharge_bypass_secondary(
                                    ret_temperature,
                                    supply_temperature,
                                    discharge_secondary,
                                    cp_sec,
                                    rho_sec,
                                    heat_in_sec,
                                    heat_out_sec,
                                    ret_temperature_is_selected,
                                    sup_temperature_is_selected,
                                    big_m,
                                    constraint_nominal,
                                )
                            )
                    else:
                        ret_temperature = parameters[f"{heat_exchanger}.Secondary.T_return"]
                        constraints.extend(
                            __constraints_temperature_heat_to_discharge_bypass_secondary(
                                ret_temperature,
                                supply_temperature,
                                discharge_secondary,
                                cp_sec,
                                rho_sec,
                                heat_in_sec,
                                heat_out_sec,
                                1.0,
                                sup_temperature_is_selected,
                                big_m,
                                constraint_nominal,
                            )
                        )

            # disconnect HEX
            # Getting var for disabled constraints
            small_m = 0  # 0W
            tol = 1e-5 * big_m  # W
            is_disabled = self.state(self.__disabled_hex_map[heat_exchanger])

            # Constraints to set the disabled integer, note we only set it for the primary
            # side as the secondary side implicetly follows from the energy balance constraints.
            # similar logic in the other blocks
            # This constraints ensures that is_disabled is 0 when heat_primary > 0
            constraints.append(((heat_primary - (1.0 - is_disabled) * big_m) / big_m, -np.inf, 0.0))
            # This constraints ensures that is_disabled is 1 when heat_primary < tol
            constraints.append(
                (
                    (heat_primary - (tol + (small_m - tol) * is_disabled)) / (big_m * tol) ** 0.5,
                    0.0,
                    np.inf,
                )
            )

            if heat_exchanger in self.energy_system_components.get("heat_exchanger", []):
                # Note we don't have to add constraints for the case of no temperature options,
                # as that check is done in the esdl_heat_model
                # Check that secondary supply temperature is lower than that of the primary side
                if len(supply_temperatures_prim) > 0:
                    for t_sup_prim in supply_temperatures_prim:
                        sup_prim_t_is_selected = self.state(f"{sup_carrier_prim}_{t_sup_prim}")
                        if len(supply_temperatures_sec) == 0:
                            t_sup_sec = parameters[f"{heat_exchanger}.Secondary.T_supply"]
                            big_m = 2.0 * t_sup_sec
                            constraints.append(
                                (
                                    (
                                        t_sup_prim
                                        - t_sup_sec
                                        + (is_disabled + (1.0 - sup_prim_t_is_selected)) * big_m
                                    ),
                                    0.0,
                                    np.inf,
                                )
                            )
                        else:
                            for t_sup_sec in supply_temperatures_sec:
                                sup_sec_t_is_selected = self.state(f"{sup_carrier_sec}_{t_sup_sec}")
                                big_m = 2.0 * t_sup_sec
                                constraints.append(
                                    (
                                        (
                                            t_sup_prim
                                            - t_sup_sec
                                            + (
                                                is_disabled
                                                + (1.0 - sup_prim_t_is_selected)
                                                + (1.0 - sup_sec_t_is_selected)
                                            )
                                            * big_m
                                        ),
                                        0.0,
                                        np.inf,
                                    )
                                )
                elif len(supply_temperatures_sec) > 0 and len(supply_temperatures_prim) == 0:
                    for t_sup_sec in supply_temperatures_sec:
                        sup_sec_t_is_selected = self.state(f"{sup_carrier_sec}_{t_sup_sec}")
                        t_sup_prim = parameters[f"{heat_exchanger}.Primary.T_supply"]
                        big_m = 2.0 * t_sup_sec
                        constraints.append(
                            (
                                (
                                    t_sup_prim
                                    - t_sup_sec
                                    + (is_disabled + (1.0 - sup_sec_t_is_selected)) * big_m
                                ),
                                0.0,
                                np.inf,
                            )
                        )
                # The check that the chosen return temperature on the primary side is not lower
                # than that of the secondary side
                if len(return_temperatures_prim) > 0:
                    for t_ret_prim in return_temperatures_prim:
                        ret_prim_t_is_selected = self.state(f"{ret_carrier_prim}_{t_ret_prim}")
                        if len(return_temperatures_sec) == 0:
                            t_ret_sec = parameters[f"{heat_exchanger}.Secondary.T_return"]
                            big_m = 2.0 * t_ret_sec
                            constraints.append(
                                (
                                    (
                                        t_ret_prim
                                        - t_ret_sec
                                        + (is_disabled + (1.0 - ret_prim_t_is_selected)) * big_m
                                    ),
                                    0.0,
                                    np.inf,
                                )
                            )
                        else:
                            for t_ret_sec in return_temperatures_sec:
                                ret_sec_t_is_selected = self.state(f"{ret_carrier_sec}_{t_ret_sec}")
                                big_m = 2.0 * t_ret_sec
                                constraints.append(
                                    (
                                        (
                                            t_ret_prim
                                            - t_ret_sec
                                            + (
                                                is_disabled
                                                + (1.0 - ret_sec_t_is_selected)
                                                + (1.0 - ret_prim_t_is_selected)
                                            )
                                            * big_m
                                        ),
                                        0.0,
                                        np.inf,
                                    )
                                )
                elif len(return_temperatures_sec) > 0 and len(return_temperatures_prim) == 0:
                    for t_ret_sec in return_temperatures_sec:
                        ret_sec_t_is_selected = self.state(f"{ret_carrier_sec}_{t_ret_sec}")
                        t_ret_prim = parameters[f"{heat_exchanger}.Primary.T_return"]
                        big_m = 2.0 * t_ret_sec
                        constraints.append(
                            (
                                (
                                    t_ret_prim
                                    - t_ret_sec
                                    + (is_disabled + (1.0 - ret_sec_t_is_selected)) * big_m
                                ),
                                0.0,
                                np.inf,
                            )
                        )

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

    def _hn_pipe_nominal_discharge(self, energy_system_options, parameters, pipe: str) -> float:
        """
        This functions returns a nominal for the discharge of pipes under topology optimization.
        """
        try:
            pipe_classes = self._heat_pipe_topo_pipe_class_map[pipe].keys()
            area = np.median(c.area for c in pipe_classes)
        except KeyError:
            area = parameters[f"{pipe}.area"]

        return area * energy_system_options["estimated_velocity"]

    @staticmethod
    def _hn_get_pipe_head_loss_option(pipe, heat_network_settings, parameters):
        """
        This function returns the head loss option for a pipe. Note that we assume that we can use
        the more accurate DW linearized approximation when a pipe has a control valve.
        """
        head_loss_option = heat_network_settings["head_loss_option"]

        if (
            head_loss_option == HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
            and parameters[f"{pipe}.has_control_valve"]
        ):
            # If there is a control valve present, we use the more accurate
            # Darcy-Weisbach inequality formulation.
            head_loss_option = HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY

        return head_loss_option

    def __check_valve_head_discharge_path_constraints(self, ensemble_member):
        """
        This function adds constraints for the check valve functionality. Meaning that the flow can
        only go in positive direction of the valve. Depending on the status of the valve the flow is
        set to zero or bounded between zero and the maximum discharge.

        The head loss is also bounded to only act in one direction.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        all_pipes = set(self.energy_system_components.get("heat_pipe", []))
        maximum_velocity = self.heat_network_settings["maximum_velocity"]

        for v in self.energy_system_components.get("check_valve", []):
            status_var = self.__check_valve_status_map[v]
            status = self.state(status_var)

            q = self.state(f"{v}.Q")
            dh = self.state(f"{v}.dH")

            # Determine the maximum discharge that can go through the Valve
            # by looking at connected pipes.
            q_aliases = self.alias_relation.aliases(q.name())
            connected_pipes = {p for p in all_pipes if f"{p}.Q" in q_aliases}

            maximum_discharge = 0.0

            for p in connected_pipes:
                try:
                    pipe_classes = self._heat_pipe_topo_pipe_class_map[p].keys()
                    max_discharge_pipe = max(c.maximum_discharge for c in pipe_classes)
                except KeyError:
                    max_discharge_pipe = maximum_velocity * parameters[f"{p}.area"]

                maximum_discharge = max(maximum_discharge, max_discharge_pipe)

            maximum_head_loss = self.__maximum_total_head_loss

            # (Ideal) check valve status:
            # - 1 means "open", so positive discharge, and dH = 0
            # - 0 means "closed", so Q = 0 and positive dH
            # Note that the Q >= 0 and dH >= 0 constraints are part of the bounds.
            constraints.append((q - status * maximum_discharge, -np.inf, 0.0))

            if self.heat_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS:
                constraints.append((dh - (1 - status) * maximum_head_loss, -np.inf, 0.0))

        return constraints

    def __control_valve_head_discharge_path_constraints(self, ensemble_member):
        """
        This function adds the constraints for the control valve. In this case we allow the valve to
        produce head loss for flow in both directions.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        all_pipes = set(self.energy_system_components.get("heat_pipe", []))
        maximum_velocity = self.heat_network_settings["maximum_velocity"]

        for v in self.energy_system_components.get("control_valve", []):
            flow_dir_var = self.__control_valve_direction_map[v]
            flow_dir = self.state(flow_dir_var)

            q = self.state(f"{v}.Q")
            dh = self.state(f"{v}.dH")

            # Determine the maximum discharge that can go through the Valve
            # by looking at connected pipes.
            q_aliases = self.alias_relation.aliases(q.name())
            connected_pipes = {p for p in all_pipes if f"{p}.Q" in q_aliases}

            maximum_discharge = 0.0

            for p in connected_pipes:
                try:
                    pipe_classes = self._heat_pipe_topo_pipe_class_map[p].keys()
                    max_discharge_pipe = max(c.maximum_discharge for c in pipe_classes)
                except KeyError:
                    max_discharge_pipe = maximum_velocity * parameters[f"{p}.area"]

                maximum_discharge = max(maximum_discharge, max_discharge_pipe)

            maximum_head_loss = self.__maximum_total_head_loss

            # Flow direction:
            # - 1 means positive discharge, and negative dH
            # - 0 means negative discharge, and positive dH
            # It's a control valve, so the dH is of arbitrary magnitude.
            constraints.append((q + (1 - flow_dir) * maximum_discharge, 0.0, np.inf))
            constraints.append((q - flow_dir * maximum_discharge, -np.inf, 0.0))

            if self.heat_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS:
                constraints.append((-dh + (1 - flow_dir) * maximum_head_loss, 0.0, np.inf))
                constraints.append((-dh - flow_dir * maximum_head_loss, -np.inf, 0.0))

        return constraints

    def __heat_loss_variable_constraints(self, ensemble_member):
        """
        Furthermore, the __hn_heat_loss symbol is set, as the heat loss depends on the chosen pipe
        class and the selected temperature in the network.

        Parameters:
            ensemble_member : The ensemble of the optimizaton

        Returns:
            list of the added constraints
        """
        constraints = []

        for p in self.energy_system_components.get("heat_pipe", []):
            pipe_classes = []

            heat_loss_sym_name = self._pipe_heat_loss_map[p]

            constraint_nominal = self.variable_nominal(heat_loss_sym_name)

            carrier = self.parameters(ensemble_member)[f"{p}.carrier_id"]
            temperatures = self.temperature_regimes(carrier)

            if len(temperatures) == 0:
                heat_loss_sym = self.extra_variable(heat_loss_sym_name, ensemble_member)
                try:
                    heat_losses = self._pipe_heat_losses[p]
                    pipe_classes = self._heat_pipe_topo_pipe_class_map[p]
                    variables = [
                        self.extra_variable(var_name, ensemble_member)
                        for pc, var_name in pipe_classes.items()
                    ]
                    heat_loss_expr = 0.0
                    for i in range(len(heat_losses)):
                        heat_loss_expr = heat_loss_expr + variables[i] * heat_losses[i]
                    constraints.append(
                        ((heat_loss_sym - heat_loss_expr) / constraint_nominal, 0.0, 0.0)
                    )
                except KeyError:
                    heat_loss = pipe_heat_loss(
                        self,
                        self.energy_system_options(),
                        self.parameters(ensemble_member),
                        p,
                    )
                    constraints.append(
                        (
                            (heat_loss_sym - heat_loss) / constraint_nominal,
                            0.0,
                            0.0,
                        )
                    )
            else:
                heat_loss_sym = self.__state_vector_scaled(heat_loss_sym_name, ensemble_member)
                for temperature in temperatures:
                    temperature_is_selected = self.state_vector(f"{carrier}_{temperature}")
                    if len(pipe_classes) == 0:
                        heat_loss = pipe_heat_loss(
                            self,
                            self.energy_system_options(),
                            self.parameters(ensemble_member),
                            p,
                            temp=temperature,
                        )
                        big_m = 2.0 * heat_loss
                        constraints.append(
                            (
                                (
                                    heat_loss_sym
                                    - heat_loss * np.ones((len(self.times()), 1))
                                    + (1.0 - temperature_is_selected) * big_m
                                )
                                / constraint_nominal,
                                0.0,
                                np.inf,
                            )
                        )
                        constraints.append(
                            (
                                (
                                    heat_loss_sym
                                    - heat_loss * np.ones((len(self.times()), 1))
                                    - (1.0 - temperature_is_selected) * big_m
                                )
                                / constraint_nominal,
                                -np.inf,
                                0.0,
                            )
                        )
                    else:
                        heat_losses = [
                            pipe_heat_loss(
                                self,
                                self.energy_system_options(),
                                self.parameters(ensemble_member),
                                p,
                                u_values=c.u_values,
                                temp=temperature,
                            )
                            for c in pipe_classes
                        ]
                        count = 0
                        big_m = 2.0 * max(heat_losses)
                        for pc_var_name in pipe_classes.values():
                            pc = self.__pipe_topo_pipe_class_var[pc_var_name]
                            constraints.append(
                                (
                                    (
                                        heat_loss_sym
                                        - heat_losses[count] * np.ones(len(self.times()))
                                        + (1.0 - pc) * big_m * np.ones(len(self.times()))
                                        + (1.0 - temperature_is_selected) * big_m
                                    )
                                    / constraint_nominal,
                                    0.0,
                                    np.inf,
                                )
                            )
                            constraints.append(
                                (
                                    (
                                        heat_loss_sym
                                        - heat_losses[count] * np.ones(len(self.times()))
                                        - (1.0 - pc) * big_m * np.ones(len(self.times()))
                                        - (1.0 - temperature_is_selected) * big_m
                                    )
                                    / constraint_nominal,
                                    -np.inf,
                                    0.0,
                                )
                            )
                            count += 1

        return constraints

    def __ates_max_stored_heat_constriants(self, ensemble_member):
        constraints = []

        for ates in [
            *self.energy_system_components.get("ates", []),
        ]:
            max_var_name = f"{ates}__max_stored_heat"
            max_var = self.extra_variable(max_var_name, ensemble_member)
            stored_heat = self.__state_vector_scaled(f"{ates}.Stored_heat", ensemble_member)
            nominal = self.variable_nominal(max_var_name)

            constraints.append(
                ((stored_heat - np.ones(len(self.times())) * max_var) / nominal, -np.inf, 0.0)
            )

        return constraints

    def __heat_pump_cop_path_constraints(self, ensemble_member):

        constraints = []

        parameters = self.parameters(ensemble_member)

        for hp in [
            *self.energy_system_components.get("heat_pump", []),
        ]:
            sec_sup_carrier = parameters[f"{hp}.Secondary.T_supply_id"]
            sec_ret_carrier = parameters[f"{hp}.Secondary.T_return_id"]
            prim_sup_carrier = parameters[f"{hp}.Primary.T_supply_id"]
            prim_ret_carrier = parameters[f"{hp}.Primary.T_return_id"]

            sec_sup_temps = self.temperature_regimes(sec_sup_carrier)
            sec_ret_temps = self.temperature_regimes(sec_ret_carrier)
            prim_sup_temps = self.temperature_regimes(prim_sup_carrier)
            prim_ret_temps = self.temperature_regimes(prim_ret_carrier)

            sec_heat = self.state(f"{hp}.Secondary_heat")
            elec = self.state(f"{hp}.Power_elec")
            nominal = self.variable_nominal(f"{hp}.Secondary_heat")

            if (
                len(sec_sup_temps) <= 1
                and len(sec_ret_temps) <= 1
                and len(prim_sup_temps) <= 1
                and len(prim_ret_temps) <= 1
            ):
                cop = parameters[f"{hp}.COP"]
                constraints.append(((sec_heat - cop * elec) / nominal, 0.0, 0.0))
            else:
                big_m = 2.0 * self.bounds()[f"{hp}.Secondary_heat"][1]
                for sec_sup_temp in (
                    sec_sup_temps
                    if len(sec_sup_temps) > 0
                    else [parameters[f"{hp}.Secondary.T_supply"]]
                ):
                    sec_sup_not_selected = (
                        1.0 - self.state(f"{sec_sup_carrier}_{sec_sup_temp}")
                        if len(sec_sup_temps) > 0
                        else 0
                    )
                    for sec_ret_temp in (
                        sec_ret_temps
                        if len(sec_ret_temps) > 0
                        else [parameters[f"{hp}.Secondary.T_return"]]
                    ):
                        sec_ret_not_selected = (
                            1.0 - self.state(f"{sec_ret_carrier}_{sec_ret_temp}")
                            if len(sec_ret_temps) > 0
                            else 0
                        )
                        for prim_sup_temp in (
                            prim_sup_temps
                            if len(prim_sup_temps) > 0
                            else [parameters[f"{hp}.Primary.T_supply"]]
                        ):
                            prim_sup_not_selected = (
                                1.0 - self.state(f"{prim_sup_carrier}_{prim_sup_temp}")
                                if len(prim_sup_temps) > 0
                                else 0
                            )
                            for prim_ret_temp in (
                                prim_ret_temps
                                if len(prim_ret_temps) > 0
                                else [parameters[f"{hp}.Primary.T_return"]]
                            ):
                                prim_ret_not_selected = (
                                    1.0 - self.state(f"{prim_ret_carrier}_{prim_ret_temp}")
                                    if len(prim_ret_temps) > 0
                                    else 0
                                )
                                efficiency = parameters[f"{hp}.efficiency"]
                                t_cond = 273.15 + sec_sup_temp
                                t_evap = 273.15 + prim_sup_temp

                                cop_carnot = efficiency * t_cond / (t_cond - t_evap)
                                not_selected = (
                                    prim_ret_not_selected
                                    + prim_sup_not_selected
                                    + sec_ret_not_selected
                                    + sec_sup_not_selected
                                )

                                constraints.append(
                                    (
                                        (sec_heat - cop_carnot * elec + not_selected * big_m)
                                        / nominal,
                                        0.0,
                                        np.inf,
                                    )
                                )
                                constraints.append(
                                    (
                                        (sec_heat - cop_carnot * elec - not_selected * big_m)
                                        / nominal,
                                        -np.inf,
                                        0.0,
                                    )
                                )
        return constraints

    def __ates_temperature_ordering_path_constraints(self, ensemble_member):
        constraints = []

        parameters = self.parameters(ensemble_member)

        for ates in self.energy_system_components.get("ates", []):

            sup_carrier = parameters[f"{ates}.T_supply_id"]
            supply_temperatures = self.temperature_regimes(sup_carrier)
            if len(supply_temperatures) > 1:
                big_m = 2.0 * max(supply_temperatures)
                min_dt = abs(min(np.diff(supply_temperatures)))

                for temperature in supply_temperatures:
                    # TODO: fix the ordering of the ates temperatures

                    # ordering_disc = self.state(f"{ates}__{temperature}_ordering_disc")
                    # ordering = self.state(f"{ates}__{temperature}_ordering")
                    # ates_temp_disc = self.state(f"{ates}__temperature_ates_disc")
                    # ates_temp = self.state(f"{ates}.Temperature_ates")

                    # ordering should be 1. if temperature is larger than temperature selected.
                    # constraints.append(((temperature - ates_temp_disc + big_m * ordering_disc),
                    # min_dt / 2., np.inf))
                    # constraints.append(((temperature - ates_temp_disc - big_m * (
                    # 1. - ordering_disc)), -np.inf, 0.))
                    #
                    # constraints.append(
                    #     ((temperature - ates_temp + big_m * ordering), 0., np.inf))
                    # constraints.append(
                    #     ((temperature - ates_temp - big_m * (1. - ordering)), -np.inf, 0.))

                    # TODO: these variable temperature ordering should be move to a general part for
                    # variable network temperatures
                    temperature_var = self.state(f"{sup_carrier}_temperature")
                    ordering_disc_carr = self.state(f"{sup_carrier}__{temperature}_ordering_disc")

                    constraints.append(
                        (
                            (temperature - temperature_var + big_m * ordering_disc_carr),
                            min_dt / 2.0,
                            np.inf,
                        )
                    )
                    constraints.append(
                        (
                            (temperature - temperature_var - big_m * (1.0 - ordering_disc_carr)),
                            -np.inf,
                            0.0,
                        )
                    )

        return constraints

    def __storage_hydraulic_power_path_constraints(self, ensemble_member):
        """
        This function adds hydraulic power and pump power contraints for a storage assets. If the
        head loss option is not enabled then the hydraulic power and pump power are for forced to
        0.0 but if the head loss option is enabled then:
            - The delta hydraulic power is constrained to be equal to f(minimum pressure drop,
            volumetric flow rate) when the storage is being charged.
            - The pump power is constrained to be equal the delta hydraulic power when the storage
            is not being charged.
        """
        constraints = []

        parameters = self.parameters(ensemble_member)

        for b, (
            (hot_pipe, hot_pipe_orientation),
            (_cold_pipe, _cold_pipe_orientation),
        ) in {**self.energy_system_topology.buffers, **self.energy_system_topology.ates}.items():
            discharge = self.state(f"{b}.HeatIn.Q")
            hp_in = self.state(f"{b}.HeatIn.Hydraulic_power")
            hp_out = self.state(f"{b}.HeatOut.Hydraulic_power")
            pump_power = self.state(f"{b}.Pump_power")
            min_dp = parameters[f"{b}.minimum_pressure_drop"]

            flow_dir_var = self._heat_pipe_to_flow_direct_map[hot_pipe]
            is_buffer_charging = self.state(flow_dir_var) * hot_pipe_orientation

            big_m = (
                2.0
                * self.bounds()[f"{b}.HeatIn.Q"][1]
                * self.__maximum_total_head_loss
                * 10.2
                * 1.0e3
            )
            if self.heat_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS:

                # During charging we want a minimum pressure drop like a demand
                constraints.append(
                    (
                        (min_dp * discharge - (hp_in - hp_out) + (1.0 - is_buffer_charging) * big_m)
                        / big_m,
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (min_dp * discharge - (hp_in - hp_out) - (1.0 - is_buffer_charging) * big_m)
                        / big_m,
                        -np.inf,
                        0.0,
                    )
                )

                constraints.append(
                    (
                        (pump_power - (hp_out - hp_in) + is_buffer_charging * big_m) / big_m,
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (pump_power - (hp_out - hp_in) - is_buffer_charging * big_m) / big_m,
                        -np.inf,
                        0.0,
                    )
                )
            else:
                constraints.append(
                    (
                        (hp_out - hp_in) / self.variable_nominal(f"{b}.HeatIn.Hydraulic_power"),
                        0.0,
                        0.0,
                    )
                )
                constraints.append(
                    (pump_power / self.variable_nominal(f"{b}.Pump_power"), 0.0, 0.0)
                )

        return constraints

    def path_constraints(self, ensemble_member):
        """
        Here we add all the path constraints to the optimization problem. Please note that the
        path constraints are the constraints that are applied to each time-step in the problem.
        """

        constraints = super().path_constraints(ensemble_member)

        # Add source/demand head loss constrains only if head loss is non-zero
        if self.heat_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS:
            constraints.extend(
                self._hn_head_loss_class._pipe_head_loss_path_constraints(self, ensemble_member)
            )
            constraints.extend(
                self._hn_head_loss_class._demand_head_loss_path_constraints(self, ensemble_member)
            )

        constraints.extend(
            self._hn_head_loss_class._pipe_hydraulic_power_path_constraints(
                self, self.__maximum_total_head_loss, ensemble_member
            )
        )
        constraints.extend(self.__flow_direction_path_constraints(ensemble_member))
        constraints.extend(self.__node_heat_mixing_path_constraints(ensemble_member))
        constraints.extend(self.__node_hydraulic_power_mixing_path_constraints(ensemble_member))
        constraints.extend(self.__heat_loss_path_constraints(ensemble_member))
        constraints.extend(self.__node_discharge_mixing_path_constraints(ensemble_member))
        constraints.extend(self.__demand_heat_to_discharge_path_constraints(ensemble_member))
        constraints.extend(self.__cold_demand_heat_to_discharge_path_constraints(ensemble_member))
        constraints.extend(self.__source_heat_to_discharge_path_constraints(ensemble_member))
        constraints.extend(self.__pipe_heat_to_discharge_path_constraints(ensemble_member))
        constraints.extend(self.__storage_heat_to_discharge_path_constraints(ensemble_member))
        constraints.extend(
            self.__heat_exchanger_heat_to_discharge_path_constraints(ensemble_member)
        )
        constraints.extend(self.__check_valve_head_discharge_path_constraints(ensemble_member))
        constraints.extend(self.__control_valve_head_discharge_path_constraints(ensemble_member))
        constraints.extend(self.__network_temperature_path_constraints(ensemble_member))
        constraints.extend(self.__ates_temperature_path_constraints(ensemble_member))
        constraints.extend(self.__ates_temperature_changing_path_constraints(ensemble_member))
        constraints.extend(self.__ates_heat_losses_path_constraints(ensemble_member))
        constraints.extend(self.__ates_temperature_ordering_path_constraints(ensemble_member))
        constraints.extend(self.__heat_pump_cop_path_constraints(ensemble_member))
        constraints.extend(self.__storage_hydraulic_power_path_constraints(ensemble_member))

        return constraints

    def constraints(self, ensemble_member):
        """
        This function adds the normal constraints to the problem. Unlike the path constraints these
        are not applied to every time-step in the problem. Meaning that these constraints either
        consider global variables that are independent of time-step or that the relevant time-steps
        are indexed within the constraint formulation.
        """
        constraints = super().constraints(ensemble_member)

        if self.heat_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS:
            # constraints.extend(self._hn_pipe_head_loss_constraints(ensemble_member))
            constraints.extend(
                self._hn_head_loss_class._pipe_head_loss_constraints(
                    self, self.__maximum_total_head_loss, ensemble_member
                )
            )

        constraints.extend(self.__heat_loss_variable_constraints(ensemble_member))
        constraints.extend(self.__pipe_rate_heat_change_constraints(ensemble_member))

        if self.energy_system_options()["include_demand_insulation_options"]:
            constraints.extend(self.__heat_matching_demand_insulation_constraints(ensemble_member))

        constraints.extend(self.__ates_max_stored_heat_constriants(ensemble_member))
        return constraints

    def history(self, ensemble_member):
        """
        In this history function we avoid the optimization using artificial energy for storage
        assets as the history is not defined.
        """
        history = super().history(ensemble_member)

        initial_time = np.array([self.initial_time])
        empty_timeseries = Timeseries(initial_time, [np.nan])
        buffers = self.energy_system_components.get("heat_buffer", [])

        for b in buffers:
            hist_heat_buffer = history.get(f"{b}.Heat_buffer", empty_timeseries).values
            hist_stored_heat = history.get(f"{b}.Stored_heat", empty_timeseries).values

            # One has to provide information of what Heat_buffer (i.e., the heat
            # added/extracted from the buffer at that timestep) is at t0.
            # Else the solution will always extract heat from the buffer at t0.
            # This information can be passed in two ways:
            # - non-trivial history of Heat_buffer at t0;
            # - non-trivial history of Stored_heat.
            # If not known, we assume that Heat_buffer is 0.0 at t0.

            if (len(hist_heat_buffer) < 1 or np.isnan(hist_heat_buffer[0])) and (
                len(hist_stored_heat) <= 1 or np.any(np.isnan(hist_stored_heat[-2:]))
            ):
                history[f"{b}.Heat_buffer"] = Timeseries(initial_time, [0.0])

        # TODO: add ATES when component is available, also add initial temperature state ates
        # for ates in self.energy_system_components.get("ates", []):

        return history

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
        Here we define the solver options. By default we use the open-source solver highs and casadi
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
            self.heat_network_settings["minimize_head_losses"]
            and self.heat_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS
            and priority == self._hn_head_loss_class._hn_minimization_goal_class.priority
        ):
            components = self.energy_system_components

            rtol = 1e-5
            atol = 1e-4

            for ensemble_member in range(self.ensemble_size):
                parameters = self.parameters(ensemble_member)
                results = self.extract_results(ensemble_member)

                for pipe in components.get("heat_pipe", []):
                    if parameters[f"{pipe}.has_control_valve"]:
                        continue

                    # Just like with a control valve, if pipe is disconnected
                    # there is nothing to check.
                    q_full = results[f"{pipe}.Q"]
                    if parameters[f"{pipe}.disconnectable"]:
                        inds = q_full != 0.0
                    else:
                        inds = np.arange(len(q_full), dtype=int)

                    if parameters[f"{pipe}.diameter"] == 0.0:
                        # Pipe is disconnected. Head loss is free, so nothing to check.
                        continue

                    q = results[f"{pipe}.Q"][inds]
                    head_loss_target = self._hn_head_loss_class._hn_pipe_head_loss(
                        pipe, self, options, self.heat_network_settings, parameters, q, None
                    )
                    if (
                        self.heat_network_settings["head_loss_option"]
                        == HeadLossOption.LINEARIZED_ONE_LINE_EQUALITY
                    ):
                        head_loss = np.abs(results[f"{pipe}.dH"][inds])
                    else:
                        head_loss = results[self._hn_pipe_to_head_loss_map[pipe]][inds]

                    if not np.allclose(head_loss, head_loss_target, rtol=rtol, atol=atol):
                        logger.warning(
                            f"Pipe {pipe} has artificial head loss; "
                            f"at least one more control valve should be added to the network."
                        )

                min_head_loss_target = options["minimum_pressure_far_point"] * 10.2
                min_head_loss = None

                for demand in components.get("heat_demand", []):
                    head_loss = results[f"{demand}.HeatIn.H"] - results[f"{demand}.HeatOut.H"]
                    if min_head_loss is None:
                        min_head_loss = head_loss
                    else:
                        min_head_loss = np.minimum(min_head_loss, head_loss)

                if len(components.get("heat_demand", [])) > 0 and not np.allclose(
                    min_head_loss, min_head_loss_target, rtol=rtol, atol=atol
                ):
                    logger.warning("Minimum head at demands is higher than target minimum.")

        super().priority_completed(priority)

    def post(self):
        """
        In this post function we check the optimization results for accurately solving the
        constraints. We do this for the head losses and check if they are consistent with the flow
        direction. Whether, the minimum velocity is actually met. And whether, the directions of
        heat match the directions of the flow.
        """
        super().post()

        results = self.extract_results()
        parameters = self.parameters(0)
        options = self.energy_system_options()

        if self.heat_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS:
            for p in self.energy_system_components.get("heat_pipe", []):
                head_diff = results[f"{p}.HeatIn.H"] - results[f"{p}.HeatOut.H"]
                if parameters[f"{p}.length"] == 0.0 and not parameters[f"{p}.has_control_valve"]:
                    atol = self.variable_nominal(f"{p}.HeatIn.H") * 1e-5
                    assert np.allclose(head_diff, 0.0, atol=atol)
                else:
                    q = results[f"{p}.Q"]

                    try:
                        is_disconnected = np.round(results[self._heat_pipe_disconnect_map[p]])
                    except KeyError:
                        is_disconnected = np.zeros_like(q)

                    q_nominal = self.variable_nominal(
                        self.alias_relation.canonical_signed(f"{p}.Q")[0]
                    )
                    inds = (np.abs(q) / q_nominal > 1e-4) & (is_disconnected == 0)
                    if not options["heat_loss_disconnected_pipe"]:
                        assert np.all(np.sign(head_diff[inds]) == np.sign(q[inds]))

        minimum_velocity = self.heat_network_settings["minimum_velocity"]
        for p in self.energy_system_components.get("heat_pipe", []):
            area = parameters[f"{p}.area"]

            if area == 0.0:
                continue

            q = results[f"{p}.Q"]
            v = q / area
            flow_dir = np.round(results[self._heat_pipe_to_flow_direct_map[p]])
            try:
                is_disconnected = np.round(results[self._heat_pipe_disconnect_map[p]])
            except KeyError:
                is_disconnected = np.zeros_like(q)

            inds_disconnected = is_disconnected == 1
            inds_positive = (flow_dir == 1) & ~inds_disconnected
            inds_negative = (flow_dir == 0) & ~inds_disconnected

            # We allow a bit of slack in the velocity. If the
            # exceedence/discrepancy is more than 0.1 mm/s, we log a warning,
            # if it's more than 1 cm/s, we log an error message.
            if np.any(inds_positive) or np.any(inds_negative):
                max_exceedence = max(
                    np.hstack(
                        [minimum_velocity - v[inds_positive], v[inds_negative] + minimum_velocity]
                    )
                )

                for criterion, log_level in [(0.01, logging.ERROR), (1e-4, logging.WARNING)]:
                    if max_exceedence > criterion:
                        logger.log(
                            log_level,
                            f"Velocity in {p} lower than minimum velocity {minimum_velocity} "
                            f"by more than {criterion} m/s. ({max_exceedence} m/s)",
                        )

                        break

            # Similar check for disconnected pipes, where we want the velocity
            # to be zero but allow the same amount of slack.
            if np.any(inds_disconnected):
                max_exceedence = max(np.abs(v[inds_disconnected]))

                for criterion, log_level in [(0.01, logging.ERROR), (1e-4, logging.WARNING)]:
                    if max_exceedence > criterion:
                        logger.log(
                            log_level,
                            f"Velocity in disconnected pipe {p} exceeds {criterion} m/s. "
                            f"({max_exceedence} m/s)",
                        )

                        break
