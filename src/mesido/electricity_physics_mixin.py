import logging
from math import isclose
from typing import Tuple

import casadi as ca

from mesido.base_component_type_mixin import BaseComponentTypeMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.timeseries import Timeseries


logger = logging.getLogger("mesido")


class ElectricityPhysicsMixin(BaseComponentTypeMixin, CollocatedIntegratedOptimizationProblem):
    """
    This class is used to model the physics of an electricity network with its assets. We model
    the different components with variety of linearization strategies.
    """

    def __init__(self, *args, **kwargs):
        """
        In this __init__ we prepare the dicts for the variables added by the HeatMixin class
        """

        super().__init__(*args, **kwargs)

        # Variable for when in time an asset switched on due to meeting a requirement
        self.__asset_is_switched_on_map = {}
        self.__asset_is_switched_on_var = {}
        self.__asset_is_switched_on_bounds = {}

        self.__electricity_producer_upper_bounds = {}

        self._electricity_cable_topo_cable_class_map = {}

        # Boolean path-variable for the charging of storage assets
        self.__storage_charging_var = {}
        self.__storage_charging_bounds = {}
        self.__storage_charging_map = {}

        self.__set_point_var = {}
        self.__set_point_bounds = {}
        self.__set_point_map = {}

    def energy_system_options(self):
        r"""
        Returns a dictionary of milp network specific options.
        """

        options = {}

        options["include_asset_is_switched_on"] = False
        options["include_electric_cable_power_loss"] = False

        return options

    def electricity_carriers(self):
        """
        This function should be overwritten by the problem and should give a dict with the
        carriers as keys and a list of voltage values.
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

        self.__update_electricity_producer_upper_bounds()

        if options["include_asset_is_switched_on"]:
            for asset in [
                *self.energy_system_components.get("electrolyzer", []),
            ]:
                var_name = f"{asset}__asset_is_switched_on"
                self.__asset_is_switched_on_map[asset] = var_name
                self.__asset_is_switched_on_var[var_name] = ca.MX.sym(var_name)
                self.__asset_is_switched_on_bounds[var_name] = (0.0, 1.0)

        for asset in [*self.energy_system_components.get("electricity_storage", [])]:
            var_name = f"{asset}__is_charging"
            self.__storage_charging_map[asset] = var_name
            self.__storage_charging_var[var_name] = ca.MX.sym(var_name)
            self.__storage_charging_bounds[var_name] = (0.0, 1.0)

        for asset in [*self.energy_system_components.get("electricity_source", [])]:
            if isinstance(self.bounds()[f"{asset}.Electricity_source"][1], Timeseries):
                var_name = f"{asset}__set_point"
                self.__set_point_map[asset] = var_name
                self.__set_point_var[var_name] = ca.MX.sym(var_name)
                self.__set_point_bounds[var_name] = (0.0, 1.0)

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

        variables.extend(self.__asset_is_switched_on_var.values())
        variables.extend(self.__storage_charging_var.values())
        variables.extend(self.__set_point_var.values())

        return variables

    def variable_is_discrete(self, variable):
        """
        All variables that only can take integer values should be added to this function.
        """

        if variable in self.__asset_is_switched_on_var:
            return True
        if variable in self.__storage_charging_var:
            return True
        else:
            return super().variable_is_discrete(variable)

    def variable_nominal(self, variable):
        """
        In this function we add all the nominals for the variables defined/added in the HeatMixin.
        """

        return super().variable_nominal(variable)

    def bounds(self):
        """
        In this function we add the bounds to the problem for all the variables defined/added in
        the HeatMixin.
        """
        bounds = super().bounds()

        bounds.update(self.__asset_is_switched_on_bounds)
        bounds.update(self.__storage_charging_bounds)
        bounds.update(self.__electricity_producer_upper_bounds)
        bounds.update(self.__set_point_bounds)

        return bounds

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

    def __state_vector_scaled(self, variable, ensemble_member):
        """
        This functions returns the casadi symbols scaled with their nominal for the entire time
        horizon.
        """
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )

    def __update_electricity_producer_upper_bounds(self):
        t = self.times()
        for asset in [
            *self.energy_system_components.get("wind_park", []),
            *self.energy_system_components.get("solar_pv", []),
        ]:
            lb = Timeseries(t, np.zeros(len(self.times())))
            ub = self.get_timeseries(f"{asset}.maximum_electricity_source")
            self.__electricity_producer_upper_bounds[f"{asset}.Electricity_source"] = (lb, ub)

    def __electricity_producer_set_point_constraints(self, ensemble_member):
        """
        This function adds constraints for wind parks which generates electrical power. The
        produced electrical power is capped with a user specified percentage value of the maximum
        value.
        """
        constraints = []

        for asset in [*self.energy_system_components.get("electricity_source", [])]:
            if asset in self.__set_point_map.keys():
                var_name = self.__set_point_map[asset]
                set_point = self.__state_vector_scaled(var_name, ensemble_member)
                electricity_source = self.__state_vector_scaled(
                    f"{asset}.Electricity_source", ensemble_member
                )
                # TODO: [: len(self.times())] should be removed once the emerge test is properly
                # time-sampled.
                max = self.bounds()[f"{asset}.Electricity_source"][1].values[: len(self.times())]
                nominal = (
                    self.variable_nominal(f"{asset}.Electricity_source") * np.median(max)
                ) ** 0.5

                constraints.append(((set_point * max - electricity_source) / nominal, 0.0, 0.0))

        return constraints

    def __electricity_node_mixing_path_constraints(self, ensemble_member):
        """
        This function adds constraints for power/energy and current conservation at nodes/busses.
        """
        constraints = []

        for bus, connected_cables in self.energy_system_topology.busses.items():
            power_sum = 0.0
            i_sum = 0.0
            power_nominal = []
            i_nominal = []

            for i_conn, (_cable, orientation) in connected_cables.items():
                power_con = f"{bus}.ElectricityConn[{i_conn + 1}].Power"
                i_port = f"{bus}.ElectricityConn[{i_conn + 1}].I"
                power_sum += orientation * self.state(power_con)
                i_sum += orientation * self.state(i_port)
                power_nominal.append(self.variable_nominal(power_con))
                i_nominal.append(self.variable_nominal(i_port))

            power_nominal = np.median(power_nominal)
            constraints.append((power_sum / power_nominal, 0.0, 0.0))

            i_nominal = np.median(i_nominal)
            constraints.append((i_sum / i_nominal, 0.0, 0.0))

        return constraints

    def __electricity_cable_mixing_path_constraints(self, ensemble_member):
        """
        This function adds constraints relating the electrical power to the current flowing through
        the cable. The power through the cable is limited by the maximum voltage and the actual
        current variable with an inequality constraint. This is done to allow power losses through
        the network. As the current and power are related with an equality constraint at the
        demands exactly matching the P = U*I equation, we allow the inequalities for the lines. By
        overestimating the power losses and voltage drops, together we ensure that U*I>P.


        Furthermore, the power loss is estimated by linearizing with the maximum current, meaning
        that we are always overestimating the power loss in the cable.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        for cable in self.energy_system_components.get("electricity_cable", []):
            current = self.state(f"{cable}.ElectricityIn.I")
            power_in = self.state(f"{cable}.ElectricityIn.Power")
            power_out = self.state(f"{cable}.ElectricityOut.Power")
            power_loss = self.state(f"{cable}.Power_loss")
            # v_loss = self.state(f"{cable}.V_loss")
            r = parameters[f"{cable}.r"]
            i_max = parameters[f"{cable}.max_current"]
            v_nom = parameters[f"{cable}.nominal_voltage"]
            v_max = parameters[f"{cable}.max_voltage"]
            # v_loss_nom = parameters[f"{cable}.nominal_voltage_loss"]
            length = parameters[f"{cable}.length"]

            # Ensure that the current is sufficient to transport the power
            constraints.append(((power_in - current * v_max) / (i_max * v_max), -np.inf, 0.0))
            constraints.append(((power_out - current * v_max) / (i_max * v_max), -np.inf, 0.0))
            # Power loss constraint
            options = self.energy_system_options()
            if options["include_electric_cable_power_loss"]:
                if cable in self._electricity_cable_topo_cable_class_map.keys():
                    cable_classes = self._electricity_cable_topo_cable_class_map[cable]
                    max_res = max([cc.resistance for cc in cable_classes])
                    max_i_max = max([cc.maximum_current for cc in cable_classes])
                    big_m = max_i_max**2 * max_res * length
                    constraint_nominal = max_i_max * v_nom * max_res * length
                    for cc_data, cc_name in cable_classes.items():
                        if cc_name != "None":
                            i_max = cc_data.maximum_current
                            res = cc_data.resistance
                            exp = current * res * length * i_max
                            is_selected = self.variable(cc_name)
                            constraints.append(
                                (
                                    (power_loss - exp + big_m * (1 - is_selected))
                                    / constraint_nominal,
                                    0.0,
                                    np.inf,
                                )
                            )
                            constraints.append(
                                (
                                    (power_loss - exp - big_m * (1 - is_selected))
                                    / (constraint_nominal),
                                    -np.inf,
                                    0.0,
                                )
                            )
                else:
                    constraints.append(
                        ((power_loss - current * r * i_max) / (i_max * v_nom * r), 0.0, 0.0)
                    )
            else:
                constraints.append(((power_loss) / (i_max * v_nom * r), 0.0, 0.0))

        return constraints

    def __voltage_loss_path_constraints(self, ensemble_member):
        """
        Furthermore, the voltage_loss symbol is set, as it depends on the chosen pipe
        class, e.g. the related resistance and the current through the cable.

        Parameters
        ----------
        ensemble_member : The ensemble of the optimization

        Returns
        -------
        list of the added constraints
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        for cable in self.energy_system_components.get("electricity_cable", []):
            cable_classes = []

            current = self.state(f"{cable}.ElectricityIn.I")
            v_loss = self.state(f"{cable}.V_loss")
            r = parameters[f"{cable}.r"]
            # v_loss_nom = parameters[f"{cable}.nominal_voltage_loss"]
            v_nom = parameters[f"{cable}.nominal_voltage"]
            c_length = parameters[f"{cable}.length"]

            constraint_nominal = self.variable_nominal(v_loss)

            # TODO: still have to check for proper scaling
            if cable in self._electricity_cable_topo_cable_class_map.keys():
                cable_classes = self._electricity_cable_topo_cable_class_map[cable]
                variables = {
                    cc.name: self.variable(var_name) for cc, var_name in cable_classes.items()
                }
                resistances = {cc.name: cc.resistance for cc in cable_classes}

                # to be updated for a better value, but it should also cover the gap between two
                # nodes when no cable is placed, so should be able to reach v_max
                big_m = v_nom

                for var_size, variable in variables.items():
                    if var_size != "None":
                        expr = resistances[var_size] * c_length * current
                        constraints.append(
                            (
                                (v_loss - expr + big_m * (1 - variable)) / constraint_nominal,
                                0.0,
                                np.inf,
                            )
                        )
                        constraints.append(
                            (
                                (v_loss - expr - big_m * (1 - variable)) / constraint_nominal,
                                -np.inf,
                                0.0,
                            )
                        )

            else:
                constraints.append(((v_loss - r * current) / constraint_nominal, 0.0, 0.0))

        return constraints

    def __electricity_demand_path_constraints(self, ensemble_member):
        """
        This function adds the constraints for the electricity commodity at the demand assets. We
        enforce that a minimum voltage is exactly met together with the power that is carried by
        the current. By fixing the voltage at the demand we ensure that at the demands
        P = U * I is met exactly at this point in the network and the power is conservatively
        in the cables at all locations in the network.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        for elec_demand in [
            *self.energy_system_components.get("electricity_demand", []),
            *self.energy_system_components.get("heat_pump_elec", []),
            *self.energy_system_components.get("electrolyzer", []),
            *self.energy_system_components.get("transformer", []),
        ]:
            min_voltage = parameters[f"{elec_demand}.min_voltage"]
            voltage = self.state(f"{elec_demand}.ElectricityIn.V")
            # to ensure that voltage entering is equal or larger than the minimum voltage
            constraints.append(((voltage - min_voltage) / min_voltage, 0.0, np.inf))

            power_nom = self.variable_nominal(f"{elec_demand}.ElectricityIn.Power")
            curr_nom = self.variable_nominal(f"{elec_demand}.ElectricityIn.I")
            power_in = self.state(f"{elec_demand}.ElectricityIn.Power")
            current_in = self.state(f"{elec_demand}.ElectricityIn.I")

            constraints.append(
                (
                    (power_in - min_voltage * current_in)
                    / (power_nom * curr_nom * min_voltage) ** 0.5,
                    0,
                    0,
                )
            )

        return constraints

    def __electricity_storage_path_constraints(self, ensemble_member):
        """
        This function adds the constraints for the electricity commodity at the storage assets.
        When charging the electricity_storage acts as an electrcicity demand and during discharging
        it acts as a electricity producer. The constraints are selected using the bigM method using
        the boolean for charging and using a charging efficiency during charging.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)

        for asset in [
            *self.energy_system_components.get("electricity_storage", []),
        ]:
            min_voltage = parameters[f"{asset}.min_voltage"]
            voltage = self.state(f"{asset}.ElectricityIn.V")

            # when charging act like a demand, when discharging act like a source
            # to ensure that voltage is equal or larger than the minimum voltage
            constraints.append(((voltage - min_voltage) / min_voltage, 0.0, np.inf))

            power_nom = self.variable_nominal(f"{asset}.ElectricityIn.Power")
            curr_nom = self.variable_nominal(f"{asset}.ElectricityIn.I")
            power_in = self.state(f"{asset}.ElectricityIn.Power")
            current_in = self.state(f"{asset}.ElectricityIn.I")

            # is_charging is 1 if charging and powerin>0
            big_m = 2 * max(abs(self.bounds()[f"{asset}.ElectricityIn.Power"]))
            is_charging = self.state(f"{asset}__is_charging")
            constraints.append(((power_in + (1 - is_charging) * big_m) / power_nom, 0.0, np.inf))
            constraints.append(((power_in - is_charging * big_m) / power_nom, -np.inf, 0.0))

            constraints.append(
                (
                    (power_in - min_voltage * current_in + (1 - is_charging) * big_m)
                    / (power_nom * curr_nom * min_voltage) ** 0.5,
                    0,
                    np.inf,
                )
            )
            constraints.append(
                (
                    (power_in - min_voltage * current_in - (1 - is_charging) * big_m)
                    / (power_nom * curr_nom * min_voltage) ** 0.5,
                    -np.inf,
                    0,
                )
            )

            # power charging using discharge/charge efficiency, needs boolean
            eff_power = self.state(f"{asset}.Effective_power_charging")
            discharge_eff = parameters[f"{asset}.discharge_efficiency"]
            charge_eff = parameters[f"{asset}.charge_efficiency"]
            # charging
            constraints.append(
                (
                    (eff_power - charge_eff * power_in + (1 - is_charging) * big_m) / power_nom,
                    0,
                    np.inf,
                )
            )
            constraints.append(
                (
                    (eff_power - charge_eff * power_in - (1 - is_charging) * big_m) / power_nom,
                    -np.inf,
                    0,
                )
            )
            # discharging
            constraints.append(
                (
                    (eff_power - discharge_eff * power_in + is_charging * big_m) / power_nom,
                    0,
                    np.inf,
                )
            )
            constraints.append(
                (
                    (eff_power - discharge_eff * power_in - is_charging * big_m) / power_nom,
                    -np.inf,
                    0,
                )
            )

        return constraints

    def __get_electrolyzer_gas_mass_flow_out(
        self, coef_a, coef_b, coef_c, electrical_power_input
    ) -> float:
        """
        This function returns the gas mass flow rate [kg/s] out of an electrolyzer based on the
        theoretical efficiency curve:
        energy [Ws] / gas mass [kg] =
        (coef_a / electrical_power_input) + (b * electrical_power_input) + coef_c

        Parameters
        ----------
        coef_a: electrolyzer efficience curve coefficent
        coef_b: electrolyzer efficience curve coefficent
        coef_c: electrolyzer efficience curve coefficent
        electrical_power_input: electrical power consumed [W]

        Returns
        -------
        gas mass flow rate produced by the electrolyzer [kg/s]
        """

        if not isclose(electrical_power_input, 0.0):
            eff = (coef_a / electrical_power_input) + (coef_b * electrical_power_input) + coef_c
            gas_mass_flow_out = (1.0 / eff) * electrical_power_input
        else:
            gas_mass_flow_out = 0.0

        return gas_mass_flow_out

    def _get_linear_coef_electrolyzer_mass_vs_epower_fit(
        self, coef_a, coef_b, coef_c, n_lines, electrical_power_min, electrical_power_max
    ) -> Tuple[np.array, np.array]:
        """
        This function returns a set of coefficients to approximate a gas mass flow rate curve with
        linear functions in the form of: gass mass flow rate [kg/s] = b + (a * electrical_power)

        Parameters
        ----------
        coef_a: electrolyzer efficience curve coefficent
        coef_b: electrolyzer efficience curve coefficent
        coef_c: electrolyzer efficience curve coefficent
        n_lines: numebr of linear lines used to approximate the non-linear curve
        electrical_power_min: minimum electrical power consumed [W]
        electrical_power_max: maximum electrical power consumed [W]

        Returns
        -------
        coefficients for linear curve fit(s) to the theoretical non-linear electrolyzer curve
        """

        electrical_power_points = np.linspace(
            electrical_power_min, electrical_power_max, n_lines + 1
        )

        gas_mass_flow_points = np.array(
            [
                self.__get_electrolyzer_gas_mass_flow_out(coef_a, coef_b, coef_c, ep)
                for ep in electrical_power_points
            ]
        )

        a_vals = np.diff(gas_mass_flow_points) / np.diff(electrical_power_points)
        b_vals = gas_mass_flow_points[1:] - a_vals * electrical_power_points[1:]

        return a_vals, b_vals

    def __electrolyzer_path_constaint(self, ensemble_member):
        """
        This functions add the constraints for the gas mass flow production based as a functions of
        electrical power input. This production is approximated by an electrolyzer efficience curve
        (energy/gas mass vs electrical power input, [Ws/kg] vs [W]) which is then linearized. If
        the load becomes lower than the minimum load both the gass_mass_flow and the electricity
        power should be 0.
        """
        constraints = []
        parameters = self.parameters(ensemble_member)
        for asset in self.energy_system_components.get("electrolyzer", []):
            gas_mass_flow_out = self.state(f"{asset}.Gas_mass_flow_out")
            power_consumed = self.state(f"{asset}.Power_consumed")

            # Multiple linear lines
            curve_fit_number_of_lines = 3
            linear_coef_a, linear_coef_b = self._get_linear_coef_electrolyzer_mass_vs_epower_fit(
                parameters[f"{asset}.a_eff_coefficient"],
                parameters[f"{asset}.b_eff_coefficient"],
                parameters[f"{asset}.c_eff_coefficient"],
                n_lines=curve_fit_number_of_lines,
                electrical_power_min=max(
                    parameters[f"{asset}.minimum_load"],
                    0.01 * self.bounds()[f"{asset}.ElectricityIn.Power"][1],
                ),
                electrical_power_max=self.bounds()[f"{asset}.ElectricityIn.Power"][1],
            )
            power_consumed_vect = ca.repmat(power_consumed, len(linear_coef_a))
            gas_mass_flow_out_vect = ca.repmat(gas_mass_flow_out, len(linear_coef_a))
            gass_mass_out_linearized_vect = linear_coef_a * power_consumed_vect + linear_coef_b
            var_name = self.__asset_is_switched_on_map[asset]
            asset_is_switched_on = self.state(var_name)

            gass_mass_out_max = (
                linear_coef_a[-1] * self.bounds()[f"{asset}.Power_consumed"][1] + linear_coef_b[-1]
            )
            big_m = gass_mass_out_max * 2
            nominal = (
                self.variable_nominal(f"{asset}.Gas_mass_flow_out")
                * min(linear_coef_a)
                * self.variable_nominal(f"{asset}.Power_consumed")
            ) ** 0.5
            constraints.extend(
                [
                    (
                        (
                            gas_mass_flow_out_vect
                            - gass_mass_out_linearized_vect
                            - (1 - asset_is_switched_on) * big_m
                        )
                        / nominal,
                        -np.inf,
                        0.0,
                    ),
                ]
            )
            constraints.append(
                ((gas_mass_flow_out + asset_is_switched_on * big_m) / big_m, 0.0, np.inf)
            )
            constraints.append(
                ((gas_mass_flow_out - asset_is_switched_on * big_m) / big_m, -np.inf, 0.0)
            )

            # Add constraints to ensure the electrolyzer is switched off when it reaches a power
            # input below the minimum operating value

            big_m = self.bounds()[f"{asset}.ElectricityIn.Power"][1] * 1.5 * 10.0
            constraints.append(
                (
                    (
                        power_consumed
                        - parameters[f"{asset}.minimum_load"]
                        + (1.0 - asset_is_switched_on) * big_m
                    )
                    / self.variable_nominal(f"{asset}.Power_consumed"),
                    0.0,
                    np.inf,
                )
            )
            constraints.append(
                ((power_consumed + asset_is_switched_on * big_m) / big_m, 0.0, np.inf)
            )
            constraints.append(
                ((power_consumed - asset_is_switched_on * big_m) / big_m, -np.inf, 0.0)
            )

        return constraints

    def path_constraints(self, ensemble_member):
        """
        Here we add all the path constraints to the optimization problem. Please note that the
        path constraints are the constraints that are applied to each time-step in the problem.
        """

        constraints = super().path_constraints(ensemble_member)

        constraints.extend(self.__electricity_demand_path_constraints(ensemble_member))
        constraints.extend(self.__electricity_node_mixing_path_constraints(ensemble_member))
        constraints.extend(self.__electricity_cable_mixing_path_constraints(ensemble_member))
        constraints.extend(self.__voltage_loss_path_constraints(ensemble_member))
        constraints.extend(self.__electrolyzer_path_constaint(ensemble_member))
        constraints.extend(self.__electricity_storage_path_constraints(ensemble_member))

        return constraints

    def constraints(self, ensemble_member):
        """
        This function adds the normal constraints to the problem. Unlike the path constraints these
        are not applied to every time-step in the problem. Meaning that these constraints either
        consider global variables that are independent of time-step or that the relevant time-steps
        are indexed within the constraint formulation.
        """
        constraints = super().constraints(ensemble_member)

        constraints.extend(self.__electricity_producer_set_point_constraints(ensemble_member))

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
