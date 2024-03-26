import logging

import casadi as ca

from mesido.base_component_type_mixin import BaseComponentTypeMixin
from mesido.control_variables import map_comp_type_to_control_variable
from mesido.electricity_physics_mixin import ElectricityPhysicsMixin
from mesido.gas_physics_mixin import GasPhysicsMixin
from mesido.heat_physics_mixin import HeatPhysicsMixin

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)


logger = logging.getLogger("mesido")


class PhysicsMixin(
    HeatPhysicsMixin,
    ElectricityPhysicsMixin,
    GasPhysicsMixin,
    BaseComponentTypeMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    This class is to combine the physics of multiple commodities into a single mixin and add
    functionalities that span multiple commodities.

    Part of the physics constraints are dependent upon the asset size. What we have decided is to
    keep all logic concerning the physics in the respective PhysicsMixin, this avoids the need to
    overwrite constraints in the AssetSizingMixin with duplicate code. To allow for this principle
    to work, we do instantiate empty maps in the respective PhysicsMixins, this allows all logic for
    the constraints to be implemented in the PhysicsMixin utilizing some try/except and/or if
    statements. The AssetSizingMixin instantiates all sizing variables and the maps will be
    populated, resulting in that the correct constraints in the PhysicsMixin will be applied. This
    also enables the user to run the PhysicsMixin separately.
    """

    def __init__(self, *args, **kwargs):
        """
        In this __init__ we prepare the dicts for the variables added by the HeatMixin class
        """

        # Boolean variable for determining when a asset switches from setpoint
        self._timed_setpoints = {}
        self._change_setpoint_var = {}
        self._change_setpoint_bounds = {}
        self._component_to_change_setpoint_map = {}

        if "timed_setpoints" in kwargs and isinstance(kwargs["timed_setpoints"], dict):
            self._timed_setpoints = kwargs["timed_setpoints"]

        super().__init__(*args, **kwargs)

    def energy_system_options(self):
        r"""
        Returns a dictionary of milp network specific options.
        """

        # options = super().heat_network_options()

        options = HeatPhysicsMixin.energy_system_options(self)
        options.update(ElectricityPhysicsMixin.energy_system_options(self))
        options.update(GasPhysicsMixin.energy_system_options(self))

        return options

    def pre(self):
        """
        In this pre method we fill the dicts initiated in the __init__. This means that we create
        the Casadi variables and determine the bounds, nominals and create maps for easier
        retrieving of the variables.
        """
        super().pre()

        # Mixed-interger formulation of component setpoint
        for component_name in self._timed_setpoints.keys():
            # Make 1 variable per component (so not per control
            # variable) which represents if the setpoint of the component
            # is changed (1) is not changed (0) in a timestep
            change_setpoint_var = f"{component_name}._change_setpoint_var"
            self._component_to_change_setpoint_map[component_name] = change_setpoint_var
            self._change_setpoint_var[change_setpoint_var] = ca.MX.sym(change_setpoint_var)
            self._change_setpoint_bounds[change_setpoint_var] = (0, 1.0)

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
        variables.extend(self._change_setpoint_var.values())

        return variables

    def variable_is_discrete(self, variable):
        """
        All variables that only can take integer values should be added to this function.
        """
        if variable in self._change_setpoint_var:
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
        bounds.update(self._change_setpoint_bounds)
        return bounds

    def __setpoint_constraint(
        self, ensemble_member, component_name, windowsize_hr, setpointchanges
    ):
        r"""Constraints that can switch only every n time steps of setpoint.
        A component can only switch setpoint every <windowsize_hr> hours.
        Apply the constraint every timestep from after the first time step onwards [from i=1].

        Inspect example curve below for understanding of dHeat/dt for
        windowsize_hr 12 with a time domain of 35 hourly timesteps.

        Heat
        d                               *-------*
        c                   *-------*
        b   *
        a       *---*---*                           *-------*


        i   0   1   2   3   4       16  17      29  30      35
        """
        assert windowsize_hr > 0
        assert windowsize_hr % 1 == 0
        assert component_name in sum(self.energy_system_components.values(), [])

        # Find the component type
        comp_type = next(
            iter(
                [
                    comptype
                    for comptype, compnames in self.energy_system_components.items()
                    for compname in compnames
                    if compname == component_name
                ]
            )
        )

        constraints = []
        times = self.times()
        control_vars = map_comp_type_to_control_variable[comp_type]
        if not isinstance(control_vars, list):
            control_vars = [control_vars]

        for var_name in control_vars:
            # Retrieve the relevant variable names
            variable_name = f"{component_name}{var_name}"
            var_name_setpoint = self._component_to_change_setpoint_map[component_name]

            # Get the timewise symbolic variables of Heat_source
            sym_var = self.__state_vector_scaled(variable_name, ensemble_member)

            # Get the timewise symbolic variables of the setpoint
            canonical, sign = self.alias_relation.canonical_signed(var_name_setpoint)
            setpoint_is_free = sign * self.state_vector(canonical, ensemble_member)

            # d<variable>/dt expression, forward Euler
            backward_heat_rate_expression = sym_var[:-1] - sym_var[1:]

            # Compute threshold for what is considered a change in setpoint
            big_m = 2.0 * max(self.bounds()[variable_name])
            nominal = self.variable_nominal(variable_name)

            # Constraint which fixes if the variable is allowed to switch or not.
            # With a dynamic sliding window, shifting one timestep.
            # Sum the binairy variables in the window. The sum should be <=1 as only on of the
            # binairy variable is allowed to represent a switch in operations.
            duration_s = 3600 * windowsize_hr

            # Number of elements to be included in a sliding window over time elements
            # Definition of elements: 23 time steps between 24 elements in the times object
            windowsize_dynamic = []
            # TODO: Better/improved/faster search function to be written
            for ij in range(0, len(times)):
                for ii in range(0 + ij, len(times)):
                    if (times[ii] - times[0 + ij]) >= duration_s:
                        windowsize_dynamic.append(ii - (0 + ij) - 1)
                        break
                else:
                    windowsize_dynamic.append(len(times) - 1 - (0 + ij))
                    break

            if len(windowsize_dynamic) == 0:
                windowsize_dynamic.append(len(times))

            for iw in range(0, len(windowsize_dynamic)):
                start_idx = iw
                if windowsize_dynamic[iw] > (len(times) - 1):
                    end_idx = len(times) - 1
                else:
                    end_idx = start_idx + windowsize_dynamic[iw]

                expression = 0.0
                for j in range(start_idx, end_idx + 1):
                    expression += setpoint_is_free[j]
                # This constraint forces that only 1 timestep in the sliding
                # window can have setpoint_is_free=1. In combination with the
                # constraints lower in this function we ensure the desired
                # behavior of limited setpoint changes.
                constraints.append(((setpointchanges - expression), 0.0, np.inf))

            # Constraints for the allowed milp rate of the component.
            # Made 2 constraints which each do or do not constrain the value
            # of the setpoint_is_free var the value of the
            # backward_heat_expression. So the discrete variable does or does
            # not have an influence on making the constrained uphold or not.

            # Note: the equations are not apply at t0

            # NOTE: we start from 2 this is to not constrain the derivative at t0
            for i in range(2, len(times)):
                # Constraining setpoint_is_free to 1 when value of
                # backward_heat_rate_expression < 0, otherwise
                # setpoint_is_free's value can be 0 and 1
                constraints.append(
                    (
                        (backward_heat_rate_expression[i - 1] + setpoint_is_free[i] * big_m)
                        / nominal,
                        0.0,
                        np.inf,
                    )
                )
                # Constraining setpoint_is_free to 1 when value of
                # backward_heat_rate_expression > 0, otherwise
                # setpoint_is_free's value can be 0 and 1
                constraints.append(
                    (
                        (backward_heat_rate_expression[i - 1] - setpoint_is_free[i] * big_m)
                        / nominal,
                        -np.inf,
                        0.0,
                    )
                )

        return constraints

    def path_constraints(self, ensemble_member):
        """
        Here we add all the path constraints to the optimization problem. Please note that the
        path constraints are the constraints that are applied to each time-step in the problem.
        """

        constraints = super().path_constraints(ensemble_member)

        return constraints

    def constraints(self, ensemble_member):
        """
        This function adds the normal constraints to the problem. Unlike the path constraints these
        are not applied to every time-step in the problem. Meaning that these constraints either
        consider global variables that are independent of time-step or that the relevant time-steps
        are indexed within the constraint formulation.
        """
        constraints = super().constraints(ensemble_member)

        for component_name, params in self._timed_setpoints.items():
            constraints.extend(
                self.__setpoint_constraint(ensemble_member, component_name, params[0], params[1])
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

    def __state_vector_scaled(self, variable, ensemble_member):
        """
        This functions returns the casadi symbols scaled with their nominal for the entire time
        horizon.
        """
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )
