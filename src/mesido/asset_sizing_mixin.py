import logging
import sys
from typing import List, Set

import casadi as ca

import esdl

from mesido._heat_loss_u_values_pipe import pipe_heat_loss
from mesido.base_component_type_mixin import BaseComponentTypeMixin
from mesido.demand_insulation_class import DemandInsulationClass
from mesido.head_loss_class import HeadLossOption
from mesido.network_common import NetworkSettings
from mesido.pipe_class import CableClass, GasPipeClass, PipeClass

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.timeseries import Timeseries

logger = logging.getLogger("mesido")


class AssetSizingMixin(BaseComponentTypeMixin, CollocatedIntegratedOptimizationProblem):
    """
    This class is used to place and size assets in the energy system. We assume that the maps for
    the asset sizing are already instantiated in the respective PhysicsMixin (see also docstring
    PhysicsMixin).
    """

    def __init__(self, *args, **kwargs):
        """
        In this __init__ we prepare the dicts for the variables added by the HeatMixin class
        """

        # Boolean variable to switch assets on/off or to increment their size for the entire time
        # horizon.
        self.__asset_aggregation_count_var = {}
        self.__asset_aggregation_count_var_bounds = {}
        self._asset_aggregation_count_var_map = {}

        # Variable for the maximum discharge under pipe class optimization
        self.__heat_pipe_topo_max_discharge_var = {}
        self._heat_pipe_topo_max_discharge_map = {}
        self.__heat_pipe_topo_max_discharge_nominals = {}
        self.__heat_pipe_topo_max_discharge_var_bounds = {}

        # Variable for the diameter of a pipe during pipe-class optimization
        self.__heat_pipe_topo_diameter_var = {}
        self.__heat_pipe_topo_diameter_var_bounds = {}
        self._heat_pipe_topo_diameter_map = {}
        self.__heat_pipe_topo_diameter_nominals = {}

        # Variable for the investmentcost in eur/m during pipe-class optimization
        self.__heat_pipe_topo_cost_var = {}
        self.__heat_pipe_topo_cost_var_bounds = {}
        self._heat_pipe_topo_cost_map = {}
        self.__heat_pipe_topo_cost_nominals = {}

        # Boolean variables for the various pipe class options per pipe
        # The self._heat_pipe_topo_pipe_class_map is already initiated in the HeatPhysicsMixin
        self.__heat_pipe_topo_pipe_class_var = {}
        self.__heat_pipe_topo_pipe_class_var_bounds = {}
        self.__heat_pipe_topo_pipe_class_result = {}

        self.__heat_pipe_topo_pipe_class_discharge_ordering_var = {}
        self.__heat_pipe_topo_pipe_class_discharge_ordering_var_bounds = {}
        self.__heat_pipe_topo_pipe_class_discharge_ordering_map = {}

        self.__heat_pipe_topo_pipe_class_cost_ordering_map = {}
        self.__heat_pipe_topo_pipe_class_cost_ordering_var = {}
        self.__heat_pipe_topo_pipe_class_cost_ordering_var_bounds = {}

        self.__heat_pipe_topo_pipe_class_heat_loss_ordering_map = {}
        self.__heat_pipe_topo_pipe_class_heat_loss_ordering_var = {}
        self.__heat_pipe_topo_pipe_class_heat_loss_ordering_var_bounds = {}

        self.__heat_pipe_topo_global_pipe_class_count_var = {}
        self.__heat_pipe_topo_global_pipe_class_count_map = {}
        self.__heat_pipe_topo_global_pipe_class_count_var_bounds = {}

        # Dict to specifically update the discharge bounds under pipe-class optimization
        self.__heat_pipe_topo_heat_discharge_bounds = {}

        # list with entry per ensemble member containing dicts of pipe parameter values for
        # diameter, area and heatloss.
        self.__heat_pipe_topo_diameter_area_parameters = []
        self.__heat_pipe_topo_heat_loss_parameters = []

        # Gas
        # Variable for the maximum discharge under pipe class optimization
        self.__gas_pipe_topo_max_discharge_var = {}
        self._gas_pipe_topo_max_discharge_map = {}
        self.__gas_pipe_topo_max_discharge_nominals = {}
        self.__gas_pipe_topo_max_discharge_var_bounds = {}

        # Variable for the diameter of a pipe during pipe-class optimization
        self.__gas_pipe_topo_diameter_var = {}
        self.__gas_pipe_topo_diameter_var_bounds = {}
        self._gas_pipe_topo_diameter_map = {}
        self.__gas_pipe_topo_diameter_nominals = {}

        # Variable for the investmentcost in eur/m during pipe-class optimization
        self.__gas_pipe_topo_cost_var = {}
        self.__gas_pipe_topo_cost_var_bounds = {}
        self._gas_pipe_topo_cost_map = {}
        self.__gas_pipe_topo_cost_nominals = {}

        # Boolean variables for the various pipe class options per pipe
        # The self._gas_pipe_topo_pipe_class_map is already initiated in the GasPhysicsMixin
        self.__gas_pipe_topo_pipe_class_var = {}
        self.__gas_pipe_topo_pipe_class_var_bounds = {}
        self.__gas_pipe_topo_pipe_class_result = {}

        self.__gas_pipe_topo_pipe_class_discharge_ordering_var = {}
        self.__gas_pipe_topo_pipe_class_discharge_ordering_var_bounds = {}
        self.__gas_pipe_topo_pipe_class_discharge_ordering_map = {}

        self.__gas_pipe_topo_pipe_class_cost_ordering_map = {}
        self.__gas_pipe_topo_pipe_class_cost_ordering_var = {}
        self.__gas_pipe_topo_pipe_class_cost_ordering_var_bounds = {}

        self.__gas_pipe_topo_global_pipe_class_count_var = {}
        self.__gas_pipe_topo_global_pipe_class_count_map = {}
        self.__gas_pipe_topo_global_pipe_class_count_var_bounds = {}

        # Electricity Cable
        # Variable for the maximum current under pipe class optimization
        self.__electricity_cable_topo_max_current_var = {}
        self._electricity_cable_topo_max_current_map = {}
        self.__electricity_cable_topo_max_current_nominals = {}
        self.__electricity_cable_topo_max_current_var_bounds = {}

        # Variable for the resistance under cable class optimization
        self.__electricity_cable_topo_resistance_var = {}
        self._electricity_cable_topo_resistance_map = {}
        self.__electricity_cable_topo_resistance_nominals = {}
        self.__electricity_cable_topo_resistance_var_bounds = {}

        # Variable for the investmentcost in eur/m during pipe-class optimization
        self.__electricity_cable_topo_cost_var = {}
        self.__electricity_cable_topo_cost_var_bounds = {}
        self._electricity_cable_topo_cost_map = {}
        self.__electricity_cable_topo_cost_nominals = {}

        # Boolean variables for the various pipe class options per pipe
        # The self._electricity_cable_topo_cable_class_map is already initiated in the
        # ElectricityPhysicsMixin
        self.__electricity_cable_topo_cable_class_var = {}
        self.__electricity_cable_topo_cable_class_var_bounds = {}
        self.__electricity_cable_topo_cable_class_result = {}

        self.__electricity_cable_topo_cable_class_current_ordering_var = {}
        self.__electricity_cable_topo_cable_class_current_ordering_var_bounds = {}
        self.__electricity_cable_topo_cable_class_current_ordering_map = {}

        self.__electricity_cable_topo_cable_class_cost_ordering_map = {}
        self.__electricity_cable_topo_cable_class_cost_ordering_var = {}
        self.__electricity_cable_topo_cable_class_cost_ordering_var_bounds = {}

        self.__electricity_cable_topo_global_cable_class_count_var = {}
        self.__electricity_cable_topo_global_cable_class_count_map = {}
        self.__electricity_cable_topo_global_cable_class_count_var_bounds = {}

        # Variable for the maximum size of an asset
        self._asset_max_size_map = {}
        self.__asset_max_size_var = {}
        self.__asset_max_size_bounds = {}
        self.__asset_max_size_nominals = {}

        if "timed_setpoints" in kwargs and isinstance(kwargs["timed_setpoints"], dict):
            self._timed_setpoints = kwargs["timed_setpoints"]

        super().__init__(*args, **kwargs)

    def pre(self):
        """
        In this pre method we fill the dicts initiated in the __init__. This means that we create
        the Casadi variables and determine the bounds, nominals and create maps for easier
        retrieving of the variables.
        """
        super().pre()

        options = self.energy_system_options()
        parameters = self.parameters(0)

        bounds = self.bounds()

        # Pipe topology variables

        # In case the user overrides the pipe class of the pipe with a single
        # pipe class we update the diameter/area parameters. If there is more
        # than a single pipe class for a certain pipe, we set the diameter
        # and area to NaN to prevent erroneous constraints.
        for _ in range(self.ensemble_size):
            self.__heat_pipe_topo_diameter_area_parameters.append({})
            self.__heat_pipe_topo_heat_loss_parameters.append({})

        unique_pipe_classes = self.get_unique_pipe_classes()
        for pc in unique_pipe_classes:
            pipe_class_count = f"{pc.name}__global_pipe_class_count"
            self.__heat_pipe_topo_global_pipe_class_count_var[pipe_class_count] = ca.MX.sym(
                pipe_class_count
            )
            self.__heat_pipe_topo_global_pipe_class_count_map[f"{pc.name}"] = pipe_class_count
            self.__heat_pipe_topo_global_pipe_class_count_var_bounds[pipe_class_count] = (
                0.0,
                len(self.energy_system_components.get("heat_pipe", [])),
            )

        unique_pipe_classes = self.get_unique_gas_pipe_classes()
        for pc in unique_pipe_classes:
            pipe_class_count = f"{pc.name}__global_gas_pipe_class_count"
            self.__gas_pipe_topo_global_pipe_class_count_var[pipe_class_count] = ca.MX.sym(
                pipe_class_count
            )
            self.__gas_pipe_topo_global_pipe_class_count_map[f"{pc.name}"] = pipe_class_count
            self.__gas_pipe_topo_global_pipe_class_count_var_bounds[pipe_class_count] = (
                0.0,
                len(self.energy_system_components.get("gas_pipe", [])),
            )

        unique_cable_classes = self.get_unique_cable_classes()
        for cc in unique_cable_classes:
            cable_class_count = f"{cc.name}__global_cable_class_count"
            self.__electricity_cable_topo_global_cable_class_count_var[cable_class_count] = (
                ca.MX.sym(cable_class_count)
            )
            self.__electricity_cable_topo_global_cable_class_count_map[f"{cc.name}"] = (
                cable_class_count
            )
            self.__electricity_cable_topo_global_cable_class_count_var_bounds[cable_class_count] = (
                0.0,
                len(self.energy_system_components.get("electricity_cable", [])),
            )

        for cable in self.energy_system_components.get("electricity_cable", []):
            cable_classes = self.electricity_cable_classes(cable)

            res_var_name = f"{cable}__en_resistance"
            self.__electricity_cable_topo_resistance_var[res_var_name] = ca.MX.sym(res_var_name)
            self._electricity_cable_topo_resistance_map[cable] = res_var_name

            cost_var_name = f"{cable}__en_cost"
            self.__electricity_cable_topo_cost_var[cost_var_name] = ca.MX.sym(cost_var_name)
            self._electricity_cable_topo_cost_map[cable] = cost_var_name

            max_current_var_name = f"{cable}__en_max_current"
            max_currents = [c.maximum_current for c in cable_classes]
            self.__electricity_cable_topo_max_current_var[max_current_var_name] = ca.MX.sym(
                max_current_var_name
            )
            self._electricity_cable_topo_max_current_map[cable] = max_current_var_name

            if len(cable_classes) > 0:
                self.__electricity_cable_topo_max_current_nominals[max_current_var_name] = (
                    np.median(max_currents)
                )
                self.__electricity_cable_topo_max_current_var_bounds[max_current_var_name] = (
                    -max(max_currents),
                    max(max_currents),
                )
            else:
                self.__electricity_cable_topo_max_current_nominals[max_current_var_name] = (
                    parameters[f"{cable}.max_current"]
                )
                self.__electricity_cable_topo_max_current_var_bounds[max_current_var_name] = (
                    -parameters[f"{cable}.max_current"],
                    parameters[f"{cable}.max_current"],
                )

            if not cable_classes:
                # No pipe class decision to make for this pipe w.r.t. diameter
                resistance = parameters[f"{cable}.r"]
                investment_cost = parameters[f"{cable}.investment_cost_coefficient"]
                self.__electricity_cable_topo_resistance_var_bounds[res_var_name] = (
                    resistance,
                    resistance,
                )
                self.__electricity_cable_topo_cost_var_bounds[cost_var_name] = (
                    investment_cost,
                    investment_cost,
                )
                if resistance > 0.0:
                    self.__electricity_cable_topo_resistance_nominals[res_var_name] = resistance
                    self.__electricity_cable_topo_cost_nominals[cost_var_name] = max(
                        investment_cost, 1.0
                    )
            elif len(cable_classes) == 1:
                # No pipe class decision to make for this pipe w.r.t. diameter
                resistance = cable_classes[0].resistance
                investment_cost = cable_classes[0].investment_costs
                self.__electricity_cable_topo_resistance_var_bounds[res_var_name] = (
                    resistance,
                    resistance,
                )
                self.__electricity_cable_topo_cost_var_bounds[cost_var_name] = (
                    investment_cost,
                    investment_cost,
                )
                if resistance > 0.0:
                    self.__electricity_cable_topo_resistance_nominals[res_var_name] = resistance
                    self.__electricity_cable_topo_cost_nominals[cost_var_name] = max(
                        investment_cost, 1.0
                    )
                    if investment_cost == 0.0:
                        RuntimeWarning(f"{cable} has an investment cost of 0. €/m")
            else:
                resistances = [c.resistance for c in cable_classes]
                self.__electricity_cable_topo_resistance_var_bounds[res_var_name] = (
                    min(resistances),
                    max(resistances),
                )
                costs = [c.investment_costs for c in cable_classes]
                self.__electricity_cable_topo_cost_var_bounds[cost_var_name] = (
                    min(costs),
                    max(costs),
                )
                self.__electricity_cable_topo_cost_nominals[cost_var_name] = np.median(costs)

                self.__electricity_cable_topo_resistance_nominals[res_var_name] = min(
                    x for x in resistances if x > 0.0
                )

                # Pipe class variables.
                if not cable_classes or len(cable_classes) == 1:
                    # No pipe class decision to make for this pipe
                    pass
                else:
                    self._electricity_cable_topo_cable_class_map[cable] = {}
                    self.__electricity_cable_topo_cable_class_current_ordering_map[cable] = {}
                    self.__electricity_cable_topo_cable_class_cost_ordering_map[cable] = {}

                    for c in cable_classes:
                        cable_class_var_name = f"{cable}__en_cable_class_{c.name}"
                        cable_class_ordering_name = (
                            f"{cable}__en_cable_class_{c.name}_current_ordering"
                        )
                        cable_class_cost_ordering_name = (
                            f"{cable}__en_cable_class_{c.name}_cost_ordering"
                        )

                        self._electricity_cable_topo_cable_class_map[cable][
                            c
                        ] = cable_class_var_name
                        self.__electricity_cable_topo_cable_class_var[cable_class_var_name] = (
                            ca.MX.sym(cable_class_var_name)
                        )
                        self.__electricity_cable_topo_cable_class_var_bounds[
                            cable_class_var_name
                        ] = (0.0, 1.0)

                        self.__electricity_cable_topo_cable_class_current_ordering_map[cable][
                            c
                        ] = cable_class_ordering_name
                        self.__electricity_cable_topo_cable_class_current_ordering_var[
                            cable_class_ordering_name
                        ] = ca.MX.sym(cable_class_ordering_name)
                        self.__electricity_cable_topo_cable_class_current_ordering_var_bounds[
                            cable_class_ordering_name
                        ] = (0.0, 1.0)

                        self.__electricity_cable_topo_cable_class_cost_ordering_map[cable][
                            c
                        ] = cable_class_cost_ordering_name
                        self.__electricity_cable_topo_cable_class_cost_ordering_var[
                            cable_class_cost_ordering_name
                        ] = ca.MX.sym(cable_class_cost_ordering_name)
                        self.__electricity_cable_topo_cable_class_cost_ordering_var_bounds[
                            cable_class_cost_ordering_name
                        ] = (0.0, 1.0)

        for pipe in self.energy_system_components.get("gas_pipe", []):
            pipe_classes = self.gas_pipe_classes(pipe)

            diam_var_name = f"{pipe}__gn_diameter"
            self.__gas_pipe_topo_diameter_var[diam_var_name] = ca.MX.sym(diam_var_name)
            self._gas_pipe_topo_diameter_map[pipe] = diam_var_name

            cost_var_name = f"{pipe}__gn_cost"
            self.__gas_pipe_topo_cost_var[cost_var_name] = ca.MX.sym(cost_var_name)
            self._gas_pipe_topo_cost_map[pipe] = cost_var_name

            max_discharge_var_name = f"{pipe}__gn_max_discharge"
            max_discharges = [c.maximum_discharge for c in pipe_classes]
            self.__gas_pipe_topo_max_discharge_var[max_discharge_var_name] = ca.MX.sym(
                max_discharge_var_name
            )
            self._gas_pipe_topo_max_discharge_map[pipe] = max_discharge_var_name

            if len(pipe_classes) > 0:
                self.__gas_pipe_topo_max_discharge_nominals[max_discharge_var_name] = np.median(
                    max_discharges
                )
                self.__gas_pipe_topo_max_discharge_var_bounds[max_discharge_var_name] = (
                    -max(max_discharges),
                    max(max_discharges),
                )
            else:
                max_velocity = self.gas_network_settings["maximum_velocity"]
                self.__gas_pipe_topo_max_discharge_nominals[max_discharge_var_name] = (
                    parameters[f"{pipe}.area"] * max_velocity
                )
                self.__gas_pipe_topo_max_discharge_var_bounds[max_discharge_var_name] = (
                    -parameters[f"{pipe}.area"] * max_velocity,
                    parameters[f"{pipe}.area"] * max_velocity,
                )

            if not pipe_classes:
                # No pipe class decision to make for this pipe w.r.t. diameter
                diameter = parameters[f"{pipe}.diameter"]
                investment_cost = parameters[f"{pipe}.investment_cost_coefficient"]
                self.__gas_pipe_topo_diameter_var_bounds[diam_var_name] = (diameter, diameter)
                self.__gas_pipe_topo_cost_var_bounds[cost_var_name] = (
                    investment_cost,
                    investment_cost,
                )
                if diameter > 0.0:
                    self.__gas_pipe_topo_diameter_nominals[diam_var_name] = diameter
                    self.__gas_pipe_topo_cost_nominals[cost_var_name] = max(investment_cost, 1.0)
            elif len(pipe_classes) == 1:
                # No pipe class decision to make for this pipe w.r.t. diameter
                diameter = pipe_classes[0].inner_diameter
                investment_cost = pipe_classes[0].investment_costs
                self.__gas_pipe_topo_diameter_var_bounds[diam_var_name] = (diameter, diameter)
                self.__gas_pipe_topo_cost_var_bounds[cost_var_name] = (
                    investment_cost,
                    investment_cost,
                )
                if diameter > 0.0:
                    self.__gas_pipe_topo_diameter_nominals[diam_var_name] = diameter
                    self.__gas_pipe_topo_cost_nominals[cost_var_name] = max(investment_cost, 1.0)
                    if investment_cost == 0.0:
                        RuntimeWarning(f"{pipe} has an investment cost of 0. €/m")
            else:
                diameters = [c.inner_diameter for c in pipe_classes]
                self.__gas_pipe_topo_diameter_var_bounds[diam_var_name] = (
                    min(diameters),
                    max(diameters),
                )
                costs = [c.investment_costs for c in pipe_classes]
                self.__gas_pipe_topo_cost_var_bounds[cost_var_name] = (
                    min(costs),
                    max(costs),
                )
                self.__gas_pipe_topo_cost_nominals[cost_var_name] = np.median(costs)

                self.__gas_pipe_topo_diameter_nominals[diam_var_name] = min(
                    x for x in diameters if x > 0.0
                )

                # Pipe class variables.
                if not pipe_classes or len(pipe_classes) == 1:
                    # No pipe class decision to make for this pipe
                    pass
                else:
                    self._gas_pipe_topo_pipe_class_map[pipe] = {}
                    self.__gas_pipe_topo_pipe_class_discharge_ordering_map[pipe] = {}
                    self.__gas_pipe_topo_pipe_class_cost_ordering_map[pipe] = {}

                    for c in pipe_classes:
                        pipe_class_var_name = f"{pipe}__gn_pipe_class_{c.name}"
                        pipe_class_ordering_name = (
                            f"{pipe}__gn_pipe_class_{c.name}_discharge_ordering"
                        )
                        pipe_class_cost_ordering_name = (
                            f"{pipe}__gn_pipe_class_{c.name}_cost_ordering"
                        )

                        self._gas_pipe_topo_pipe_class_map[pipe][c] = pipe_class_var_name
                        self.__gas_pipe_topo_pipe_class_var[pipe_class_var_name] = ca.MX.sym(
                            pipe_class_var_name
                        )
                        self.__gas_pipe_topo_pipe_class_var_bounds[pipe_class_var_name] = (0.0, 1.0)

                        self.__gas_pipe_topo_pipe_class_discharge_ordering_map[pipe][
                            c
                        ] = pipe_class_ordering_name
                        self.__gas_pipe_topo_pipe_class_discharge_ordering_var[
                            pipe_class_ordering_name
                        ] = ca.MX.sym(pipe_class_ordering_name)
                        self.__gas_pipe_topo_pipe_class_discharge_ordering_var_bounds[
                            pipe_class_ordering_name
                        ] = (0.0, 1.0)

                        self.__gas_pipe_topo_pipe_class_cost_ordering_map[pipe][
                            c
                        ] = pipe_class_cost_ordering_name
                        self.__gas_pipe_topo_pipe_class_cost_ordering_var[
                            pipe_class_cost_ordering_name
                        ] = ca.MX.sym(pipe_class_cost_ordering_name)
                        self.__gas_pipe_topo_pipe_class_cost_ordering_var_bounds[
                            pipe_class_cost_ordering_name
                        ] = (0.0, 1.0)

        set_self_hot_pipes = set(self.hot_pipes)
        for pipe in self.energy_system_components.get("heat_pipe", []):
            pipe_classes = self.pipe_classes(pipe)
            # cold_pipe = self.hot_to_cold_pipe(pipe)

            if len([c for c in pipe_classes if c.inner_diameter == 0]) > 1:
                raise Exception(
                    f"Pipe {pipe} should not have more than one `diameter = 0` pipe class"
                )

            # Note that we always make a diameter symbol, even if the diameter
            # is fixed. This can be convenient when playing around with
            # different pipe class options, and providing a uniform interface
            # to the user. Contrary to that, the pipe class booleans are very
            # much an internal affair.
            diam_var_name = f"{pipe}__hn_diameter"
            self.__heat_pipe_topo_diameter_var[diam_var_name] = ca.MX.sym(diam_var_name)
            self._heat_pipe_topo_diameter_map[pipe] = diam_var_name

            cost_var_name = f"{pipe}__hn_cost"
            self.__heat_pipe_topo_cost_var[cost_var_name] = ca.MX.sym(cost_var_name)
            self._heat_pipe_topo_cost_map[pipe] = cost_var_name

            max_discharge_var_name = f"{pipe}__hn_max_discharge"
            max_discharges = [c.maximum_discharge for c in pipe_classes]
            self.__heat_pipe_topo_max_discharge_var[max_discharge_var_name] = ca.MX.sym(
                max_discharge_var_name
            )
            self._heat_pipe_topo_max_discharge_map[pipe] = max_discharge_var_name

            if len(pipe_classes) > 0:
                self.__heat_pipe_topo_max_discharge_nominals[max_discharge_var_name] = np.median(
                    max_discharges
                )
                self.__heat_pipe_topo_max_discharge_var_bounds[max_discharge_var_name] = (
                    -max(max_discharges),
                    max(max_discharges),
                )
            else:
                max_velocity = self.heat_network_settings["maximum_velocity"]
                self.__heat_pipe_topo_max_discharge_nominals[max_discharge_var_name] = (
                    parameters[f"{pipe}.area"] * max_velocity
                )
                self.__heat_pipe_topo_max_discharge_var_bounds[max_discharge_var_name] = (
                    -parameters[f"{pipe}.area"] * max_velocity,
                    parameters[f"{pipe}.area"] * max_velocity,
                )

            if not pipe_classes:
                # No pipe class decision to make for this pipe w.r.t. diameter
                diameter = parameters[f"{pipe}.diameter"]
                investment_cost = parameters[f"{pipe}.investment_cost_coefficient"]
                self.__heat_pipe_topo_diameter_var_bounds[diam_var_name] = (diameter, diameter)
                self.__heat_pipe_topo_cost_var_bounds[cost_var_name] = (
                    investment_cost,
                    investment_cost,
                )
                if diameter > 0.0:
                    self.__heat_pipe_topo_diameter_nominals[diam_var_name] = diameter
                    self.__heat_pipe_topo_cost_nominals[cost_var_name] = max(investment_cost, 1.0)
            elif len(pipe_classes) == 1:
                # No pipe class decision to make for this pipe w.r.t. diameter
                diameter = pipe_classes[0].inner_diameter
                investment_cost = pipe_classes[0].investment_costs
                self.__heat_pipe_topo_diameter_var_bounds[diam_var_name] = (diameter, diameter)
                self.__heat_pipe_topo_cost_var_bounds[cost_var_name] = (
                    investment_cost,
                    investment_cost,
                )
                if diameter > 0.0:
                    self.__heat_pipe_topo_diameter_nominals[diam_var_name] = diameter
                    self.__heat_pipe_topo_cost_nominals[cost_var_name] = max(investment_cost, 1.0)
                    if investment_cost == 0.0:
                        RuntimeWarning(f"{pipe} has an investment cost of 0. €/m")

                for ensemble_member in range(self.ensemble_size):
                    d = self.__heat_pipe_topo_diameter_area_parameters[ensemble_member]

                    d[f"{pipe}.diameter"] = diameter
                    d[f"{pipe}.area"] = pipe_classes[0].area
            else:
                diameters = [c.inner_diameter for c in pipe_classes]
                self.__heat_pipe_topo_diameter_var_bounds[diam_var_name] = (
                    min(diameters),
                    max(diameters),
                )
                costs = [c.investment_costs for c in pipe_classes]
                self.__heat_pipe_topo_cost_var_bounds[cost_var_name] = (
                    min(costs),
                    max(costs),
                )
                self.__heat_pipe_topo_cost_nominals[cost_var_name] = np.median(costs)

                self.__heat_pipe_topo_diameter_nominals[diam_var_name] = min(
                    x for x in diameters if x > 0.0
                )

                for ensemble_member in range(self.ensemble_size):
                    d = self.__heat_pipe_topo_diameter_area_parameters[ensemble_member]

                    d[f"{pipe}.diameter"] = np.nan
                    d[f"{pipe}.area"] = np.nan

            # For similar reasons as for the diameter, we always make a milp
            # loss symbol, even if the milp loss is fixed. Note that we also
            # override the .Heat_loss parameter for cold pipes, even though
            # it is not actually used in the optimization problem.
            heat_loss_var_name = f"{pipe}__hn_heat_loss"

            if not pipe_classes or options["neglect_pipe_heat_losses"]:
                # No pipe class decision to make for this pipe w.r.t. milp loss
                heat_loss = pipe_heat_loss(self, options, parameters, pipe)
                if parameters[f"{pipe}.temperature"] > parameters[f"{pipe}.T_ground"]:
                    lb = 0.0
                else:
                    lb = 2.0 * heat_loss
                self._pipe_heat_loss_var_bounds[heat_loss_var_name] = (
                    lb,
                    2.0 * abs(heat_loss),
                )
                if heat_loss > 0:
                    self._pipe_heat_loss_nominals[heat_loss_var_name] = abs(heat_loss)
                else:
                    self._pipe_heat_loss_nominals[heat_loss_var_name] = max(
                        abs(
                            pipe_heat_loss(
                                self, {"neglect_pipe_heat_losses": False}, parameters, pipe
                            )
                        ),
                        1.0,
                    )

                for ensemble_member in range(self.ensemble_size):
                    h = self.__heat_pipe_topo_heat_loss_parameters[ensemble_member]
                    h[f"{pipe}.Heat_loss"] = pipe_heat_loss(self, options, parameters, pipe)

            elif len(pipe_classes) == 1:
                # No pipe class decision to make for this pipe w.r.t. milp loss
                u_values = pipe_classes[0].u_values
                heat_loss = pipe_heat_loss(self, options, parameters, pipe, u_values)

                self._pipe_heat_loss_var_bounds[heat_loss_var_name] = (
                    0.0,
                    2.0 * heat_loss,
                )
                if heat_loss > 0:
                    self._pipe_heat_loss_nominals[heat_loss_var_name] = heat_loss
                else:
                    self._pipe_heat_loss_nominals[heat_loss_var_name] = max(
                        pipe_heat_loss(self, {"neglect_pipe_heat_losses": False}, parameters, pipe),
                        1.0,
                    )

                for ensemble_member in range(self.ensemble_size):
                    h = self.__heat_pipe_topo_heat_loss_parameters[ensemble_member]
                    h[f"{pipe}.Heat_loss"] = heat_loss
            else:
                heat_losses = [
                    pipe_heat_loss(self, options, parameters, pipe, c.u_values)
                    for c in pipe_classes
                ]

                self._pipe_heat_losses[pipe] = heat_losses
                self._pipe_heat_loss_var_bounds[heat_loss_var_name] = (
                    min(heat_losses),
                    max(heat_losses),
                )
                self._pipe_heat_loss_nominals[heat_loss_var_name] = np.median(
                    [x for x in heat_losses if x > 0]
                )

                for ensemble_member in range(self.ensemble_size):
                    h = self.__heat_pipe_topo_heat_loss_parameters[ensemble_member]
                    h[f"{pipe}.Heat_loss"] = max(
                        pipe_heat_loss(self, options, parameters, pipe), 1.0
                    )

            # Pipe class variables.
            if not pipe_classes or len(pipe_classes) == 1:
                # No pipe class decision to make for this pipe
                pass
            else:
                self._heat_pipe_topo_pipe_class_map[pipe] = {}
                self.__heat_pipe_topo_pipe_class_discharge_ordering_map[pipe] = {}
                self.__heat_pipe_topo_pipe_class_cost_ordering_map[pipe] = {}
                self.__heat_pipe_topo_pipe_class_heat_loss_ordering_map[pipe] = {}

                for c in pipe_classes:
                    neighbour = self.has_related_pipe(pipe)
                    if neighbour and pipe not in set_self_hot_pipes:
                        cold_pipe = self.cold_to_hot_pipe(pipe)
                        pipe_class_var_name = f"{cold_pipe}__hn_pipe_class_{c.name}"
                        pipe_class_ordering_name = (
                            f"{cold_pipe}__hn_pipe_class_{c.name}_discharge_ordering"
                        )
                        pipe_class_cost_ordering_name = (
                            f"{cold_pipe}__hn_pipe_class_{c.name}_cost_ordering"
                        )
                        pipe_class_heat_loss_ordering_name = (
                            f"{cold_pipe}__hn_pipe_class_{c.name}_heat_loss_ordering"
                        )
                    else:
                        pipe_class_var_name = f"{pipe}__hn_pipe_class_{c.name}"
                        pipe_class_ordering_name = (
                            f"{pipe}__hn_pipe_class_{c.name}_discharge_ordering"
                        )
                        pipe_class_cost_ordering_name = (
                            f"{pipe}__hn_pipe_class_{c.name}_cost_ordering"
                        )
                        pipe_class_heat_loss_ordering_name = (
                            f"{pipe}__hn_pipe_class_{c.name}_heat_loss_ordering"
                        )

                    self._heat_pipe_topo_pipe_class_map[pipe][c] = pipe_class_var_name
                    self.__heat_pipe_topo_pipe_class_var[pipe_class_var_name] = ca.MX.sym(
                        pipe_class_var_name
                    )
                    self.__heat_pipe_topo_pipe_class_var_bounds[pipe_class_var_name] = (0.0, 1.0)

                    self.__heat_pipe_topo_pipe_class_discharge_ordering_map[pipe][
                        c
                    ] = pipe_class_ordering_name
                    self.__heat_pipe_topo_pipe_class_discharge_ordering_var[
                        pipe_class_ordering_name
                    ] = ca.MX.sym(pipe_class_ordering_name)
                    self.__heat_pipe_topo_pipe_class_discharge_ordering_var_bounds[
                        pipe_class_ordering_name
                    ] = (0.0, 1.0)

                    self.__heat_pipe_topo_pipe_class_cost_ordering_map[pipe][
                        c
                    ] = pipe_class_cost_ordering_name
                    self.__heat_pipe_topo_pipe_class_cost_ordering_var[
                        pipe_class_cost_ordering_name
                    ] = ca.MX.sym(pipe_class_cost_ordering_name)
                    self.__heat_pipe_topo_pipe_class_cost_ordering_var_bounds[
                        pipe_class_cost_ordering_name
                    ] = (0.0, 1.0)

                    self.__heat_pipe_topo_pipe_class_heat_loss_ordering_map[pipe][
                        c
                    ] = pipe_class_heat_loss_ordering_name
                    self.__heat_pipe_topo_pipe_class_heat_loss_ordering_var[
                        pipe_class_heat_loss_ordering_name
                    ] = ca.MX.sym(pipe_class_heat_loss_ordering_name)
                    self.__heat_pipe_topo_pipe_class_heat_loss_ordering_var_bounds[
                        pipe_class_heat_loss_ordering_name
                    ] = (0.0, 1.0)

        # Update the bounds of the pipes that will have their diameter
        # optimized. Note that the flow direction may have already been fixed
        # based on the original bounds, if that was desired. We can therefore
        # naively override the bounds without taking this into account.
        for pipe in self._heat_pipe_topo_pipe_class_map:
            pipe_classes = self._heat_pipe_topo_pipe_class_map[pipe]
            max_discharge = max([c.maximum_discharge for c in pipe_classes])

            self.__heat_pipe_topo_heat_discharge_bounds[f"{pipe}.Q"] = (
                -max_discharge,
                max_discharge,
            )

            # Heat on cold side is zero, so no change needed
            cp = parameters[f"{pipe}.cp"]
            rho = parameters[f"{pipe}.rho"]
            temperature = parameters[f"{pipe}.temperature"]

            # TODO: if temperature is variable these bounds should be set differently
            max_heat = 2.0 * cp * rho * temperature * max_discharge

            self.__heat_pipe_topo_heat_discharge_bounds[f"{pipe}.HeatIn.Heat"] = (
                -max_heat,
                max_heat,
            )
            self.__heat_pipe_topo_heat_discharge_bounds[f"{pipe}.HeatOut.Heat"] = (
                -max_heat,
                max_heat,
            )

        # When optimizing for pipe size, we do not yet support all options
        if self._heat_pipe_topo_pipe_class_map:
            if np.isfinite(options["maximum_temperature_der"]) and np.isfinite(
                options["maximum_flow_der"]
            ):
                raise Exception(
                    "When optimizing pipe diameters, "
                    "the `maximum_temperature_der` or `maximum_flow_der` should be infinite."
                )
        # still to delete because it is not used
        self.__maximum_total_head_loss = self.__get_maximum_total_head_loss()

        # Making the variables for max size

        def _make_max_size_var(name, lb, ub, nominal):
            asset_max_size_var = f"{name}__max_size"
            self._asset_max_size_map[name] = asset_max_size_var
            self.__asset_max_size_var[asset_max_size_var] = ca.MX.sym(asset_max_size_var)
            self.__asset_max_size_bounds[asset_max_size_var] = (lb, ub)
            self.__asset_max_size_nominals[asset_max_size_var] = nominal

        for asset_name in self.energy_system_components.get("heat_source", []):
            ub = bounds[f"{asset_name}.Heat_source"][1]

            # Update bound to account for profile constraint being used instead of 1 value
            esdl_asset_attributes = self.esdl_assets[
                self.esdl_asset_name_to_id_map[asset_name]
            ].attributes["constraint"]
            if (
                len(esdl_asset_attributes) > 0
                and hasattr(esdl_asset_attributes.items[0], "maximum")
                and esdl_asset_attributes.items[0].maximum.profileQuantityAndUnit.reference.unit
                == esdl.UnitEnum.WATT
                and parameters[f"{asset_name}.state"] == 2  # Optional asset
            ):
                max_profile = max(self.get_timeseries(f"{asset_name}.maximum_heat_source").values)
                if ub > max_profile:
                    ub = max_profile

            lb = 0.0 if parameters[f"{asset_name}.state"] != 1 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("heat_demand", []):
            ub = (
                bounds[f"{asset_name}.Heat_demand"][1]
                if not np.isinf(bounds[f"{asset_name}.Heat_demand"][1])
                else bounds[f"{asset_name}.HeatIn.Heat"][1]
            )
            # Note that we only enforce the upper bound in state enabled if it was explicitly
            # specified for the demand
            lb = 0.0 if np.isinf(bounds[f"{asset_name}.Heat_demand"][1]) else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("airco", []):
            ub = bounds[f"{asset_name}.Heat_airco"][1]
            # Note that we only enforce the upper bound in state enabled if it was explicitly
            # specified for the demand
            lb = 0.0 if np.isinf(bounds[f"{asset_name}.Heat_airco"][1]) else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("cold_demand", []):
            ub = (
                bounds[f"{asset_name}.Cold_demand"][1]
                if not np.isinf(bounds[f"{asset_name}.Cold_demand"][1])
                else bounds[f"{asset_name}.HeatIn.Heat"][1]
            )
            # Note that we only enforce the upper bound in state enabled if it was explicitly
            # specified for the demand
            lb = 0.0 if np.isinf(bounds[f"{asset_name}.Cold_demand"][1]) else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in [
            *self.energy_system_components.get("ates", []),
            *self.energy_system_components.get("low_temperature_ates", []),
        ]:
            if asset_name in self.energy_system_components.get("ates", []):
                ub = bounds[f"{asset_name}.Heat_ates"][1]
            else:
                ub = bounds[f"{asset_name}.Heat_low_temperature_ates"][1]
            lb = 0.0 if parameters[f"{asset_name}.state"] != 1 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("heat_buffer", []):
            ub = (
                max(bounds[f"{asset_name}.Stored_heat"][1].values)
                if isinstance(bounds[f"{asset_name}.Stored_heat"][1], Timeseries)
                else bounds[f"{asset_name}.Stored_heat"][1]
            )
            lb = 0.0 if parameters[f"{asset_name}.state"] != 1 else ub
            _make_max_size_var(
                name=asset_name,
                lb=lb,
                ub=ub,
                nominal=self.variable_nominal(f"{asset_name}.Stored_heat"),
            )

        for asset_name in [
            *self.energy_system_components.get("heat_exchanger", []),
            *self.energy_system_components.get("heat_pump", []),
        ]:
            ub = bounds[f"{asset_name}.Secondary_heat"][1]
            lb = 0.0 if parameters[f"{asset_name}.state"] != 1 else ub
            _make_max_size_var(
                name=asset_name,
                lb=lb,
                ub=ub,
                nominal=self.variable_nominal(f"{asset_name}.Secondary_heat"),
            )

        for asset_name in self.energy_system_components.get("gas_demand", []):
            # TODO: add bound value for mass flow rate, used 1.0 for now instead of 0.0 which
            # Note that we set the nominal to one to avoid division by zero
            ub = 0.0
            lb = 0.0 if parameters[f"{asset_name}.state"] == 2 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=1.0)

        for asset_name in self.energy_system_components.get("gas_source", []):
            # TODO: add bound value for mass flow rate, used 1.0 for now instead of 0.0 which
            # Note that we set the nominal to one to avoid division by zero
            ub = 0.0
            lb = 0.0 if parameters[f"{asset_name}.state"] == 2 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=1.0)

        for asset_name in self.energy_system_components.get("gas_tank_storage", []):
            ub = bounds[f"{asset_name}.Stored_gas_mass"][1]
            ub = ub if isinstance(ub, float) else max(ub.values)
            lb = 0.0 if parameters[f"{asset_name}.state"] == 2 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("gas_substation", []):
            ub = bounds[f"{asset_name}.GasIn.Q"][1]
            ub = ub if isinstance(ub, float) else max(ub.values)
            lb = 0.0 if parameters[f"{asset_name}.state"] == 2 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("compressor", []):
            ub = bounds[f"{asset_name}.GasIn.Q"][1]
            ub = ub if isinstance(ub, float) else max(ub.values)
            lb = 0.0 if parameters[f"{asset_name}.state"] == 2 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("electrolyzer", []):
            ub = bounds[f"{asset_name}.ElectricityIn.Power"][1]
            ub = ub if isinstance(ub, float) else max(ub.values)
            lb = 0.0 if parameters[f"{asset_name}.state"] == 2 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("electricity_demand", []):
            v = bounds[f"{asset_name}.Electricity_demand"][1]
            ub = v if not np.isinf(v) else bounds[f"{asset_name}.ElectricityIn.Power"][1]
            ub = ub if isinstance(ub, float) else max(ub.values)
            lb = 0.0 if parameters[f"{asset_name}.state"] == 2 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("transformer", []):
            ub = bounds[f"{asset_name}.ElectricityIn.Power"][1]
            ub = ub if isinstance(ub, float) else max(ub.values)
            lb = 0.0 if parameters[f"{asset_name}.state"] == 2 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("electricity_source", []):
            ub = (
                bounds[f"{asset_name}.Electricity_source"][1]
                if not isinstance(bounds[f"{asset_name}.Electricity_source"][1], Timeseries)
                else np.max(bounds[f"{asset_name}.Electricity_source"][1].values)
            )
            lb = 0.0 if parameters[f"{asset_name}.state"] == 2 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        for asset_name in self.energy_system_components.get("electricity_storage", []):
            ub = (
                bounds[f"{asset_name}.Stored_electricity"][1]
                if not isinstance(bounds[f"{asset_name}.Stored_electricity"][1], Timeseries)
                else np.max(bounds[f"{asset_name}.Stored_electricity"][1].values)
            )
            lb = 0.0 if parameters[f"{asset_name}.state"] == 2 else ub
            _make_max_size_var(name=asset_name, lb=lb, ub=ub, nominal=ub / 2.0)

        # Making the __aggregation_count variable for each asset
        for asset_list in self.energy_system_components.values():
            for asset in asset_list:
                aggr_count_var = f"{asset}_aggregation_count"
                self._asset_aggregation_count_var_map[asset] = aggr_count_var
                self.__asset_aggregation_count_var[aggr_count_var] = ca.MX.sym(aggr_count_var)
                try:
                    aggr_count_max = parameters[f"{asset}.nr_of_doublets"]
                except KeyError:
                    aggr_count_max = 1.0
                if parameters[f"{asset}.state"] == 0:
                    aggr_count_max = 0.0
                self.__asset_aggregation_count_var_bounds[aggr_count_var] = (0.0, aggr_count_max)

    def energy_system_options(self):
        r"""
        Returns a dictionary of milp network specific options.
        """

        options = super().energy_system_options()

        return options

    def pipe_classes(self, pipe: str) -> List[PipeClass]:
        """
        This method gives the pipe class options for a given pipe.

        If the returned List is:
        - empty: use the pipe properties from the model
        - len() == 1: use these pipe properties to overrule that of the model
        - len() > 1: decide between the pipe class options.

        A pipe class with diameter 0 is interpreted as there being _no_ pipe.
        """
        return []

    def gas_pipe_classes(self, pipe: str) -> List[GasPipeClass]:
        """
        This method gives the pipe class options for a given pipe.

        If the returned List is:
        - empty: use the pipe properties from the model
        - len() == 1: use these pipe properties to overrule that of the model
        - len() > 1: decide between the pipe class options.

        A pipe class with diameter 0 is interpreted as there being _no_ pipe.
        """
        return []

    def electricity_cable_classes(self, cable: str) -> List[CableClass]:
        """
        This method gives the cable class options for a given cable.

        If the returned List is:
        - empty: use the cable properties from the model
        - len() == 1: use these pipe properties to overrule that of the model
        - len() > 1: decide between the cable class options.

        A cable class with max_current 0 is interpreted as there being _no_ cable.
        """
        return []

    def get_unique_pipe_classes(self) -> Set[PipeClass]:
        """
        Method queries all pipes and returns the set of unique pipe classes defined
        for the network.
        """
        unique_pipe_classes = set()
        for p in self.energy_system_components.get("heat_pipe", []):
            unique_pipe_classes.update(self.pipe_classes(p))
        return unique_pipe_classes

    def get_unique_gas_pipe_classes(self) -> Set[PipeClass]:
        """
        Method queries all hot pipes and returns the set of unique pipe classes defined
        for the network.
        """
        unique_pipe_classes = set()
        for p in self.energy_system_components.get("gas_pipe", []):
            unique_pipe_classes.update(self.gas_pipe_classes(p))
        return unique_pipe_classes

    def get_unique_cable_classes(self) -> Set[CableClass]:
        """
        Method queries all cables and returns the set of unique cable classes defined
        for the network.
        """
        unique_cable_classes = set()
        for p in self.energy_system_components.get("electricity_cable", []):
            unique_cable_classes.update(self.electricity_cable_classes(p))
        return unique_cable_classes

    def get_optimized_pipe_class(self, pipe: str) -> PipeClass:
        """
        Return the optimized pipe class for a specific pipe. If no
        optimized pipe class is available (yet), a `KeyError` is returned.
        """
        return self.__heat_pipe_topo_pipe_class_result[pipe]

    def get_optimized_deman_insulation_class(self, demand_insulation: str) -> DemandInsulationClass:
        """
        Return the optimized demand_insulation class for a specific pipe. If no
        optimized demand insulation class is available (yet), a `KeyError` is returned.
        """
        return self.__demand_insulation_class_result[demand_insulation]

    def pipe_diameter_symbol_name(self, pipe: str) -> str:
        """
        Return the symbol name for the pipe diameter
        """
        return self._heat_pipe_topo_diameter_map[pipe]

    def pipe_cost_symbol_name(self, pipe: str) -> str:
        """
        Return the symbol name for the pipe investment cost per meter
        """
        return self._heat_pipe_topo_cost_map[pipe]

    @property
    def extra_variables(self):
        """
        In this function we add all the variables defined in the HeatMixin to the optimization
        problem. Note that these are only the normal variables not path variables.
        """
        variables = super().extra_variables.copy()
        variables.extend(self.__heat_pipe_topo_diameter_var.values())
        variables.extend(self.__heat_pipe_topo_cost_var.values())
        variables.extend(self.__heat_pipe_topo_pipe_class_var.values())
        variables.extend(self.__gas_pipe_topo_diameter_var.values())
        variables.extend(self.__gas_pipe_topo_cost_var.values())
        variables.extend(self.__gas_pipe_topo_pipe_class_var.values())
        variables.extend(self.__asset_max_size_var.values())
        variables.extend(self.__asset_aggregation_count_var.values())
        variables.extend(self.__gas_pipe_topo_max_discharge_var.values())
        variables.extend(self.__heat_pipe_topo_max_discharge_var.values())
        variables.extend(self.__heat_pipe_topo_global_pipe_class_count_var.values())
        variables.extend(self.__gas_pipe_topo_global_pipe_class_count_var.values())
        variables.extend(self.__heat_pipe_topo_pipe_class_discharge_ordering_var.values())
        variables.extend(self.__heat_pipe_topo_pipe_class_cost_ordering_var.values())
        variables.extend(self.__heat_pipe_topo_pipe_class_heat_loss_ordering_var.values())
        variables.extend(self.__gas_pipe_topo_pipe_class_discharge_ordering_var.values())
        variables.extend(self.__gas_pipe_topo_pipe_class_cost_ordering_var.values())
        variables.extend(self.__electricity_cable_topo_max_current_var.values())
        variables.extend(self.__electricity_cable_topo_resistance_var.values())
        variables.extend(self.__electricity_cable_topo_cost_var.values())
        variables.extend(self.__electricity_cable_topo_cable_class_var.values())
        variables.extend(self.__electricity_cable_topo_cable_class_current_ordering_var.values())
        variables.extend(self.__electricity_cable_topo_cable_class_cost_ordering_var.values())
        variables.extend(self.__electricity_cable_topo_global_cable_class_count_var.values())
        return variables

    @property
    def path_variables(self):
        """
        In this function we add all the path variables defined in the HeatMixin to the
        optimization problem. Note that path_variables are variables that are created for each
        time-step.
        """
        variables = super().path_variables.copy()

        return variables

    def variable_is_discrete(self, variable):
        """
        All variables that only can take integer values should be added to this function.
        """
        if (
            variable in self.__heat_pipe_topo_pipe_class_var
            or variable in self.__asset_aggregation_count_var
            or variable in self.__heat_pipe_topo_pipe_class_discharge_ordering_var
            or variable in self.__heat_pipe_topo_pipe_class_cost_ordering_var
            or variable in self.__heat_pipe_topo_pipe_class_heat_loss_ordering_var
            or variable in self.__gas_pipe_topo_pipe_class_discharge_ordering_var
            or variable in self.__gas_pipe_topo_pipe_class_cost_ordering_var
            or variable in self.__gas_pipe_topo_pipe_class_var
            or variable in self.__electricity_cable_topo_cable_class_var
            or variable in self.__electricity_cable_topo_cable_class_current_ordering_var
            or variable in self.__electricity_cable_topo_cable_class_cost_ordering_var
        ):
            return True
        else:
            return super().variable_is_discrete(variable)

    def variable_nominal(self, variable):
        """
        In this function we add all the nominals for the variables defined/added in the HeatMixin.
        """
        if variable in self.__heat_pipe_topo_diameter_nominals:
            return self.__heat_pipe_topo_diameter_nominals[variable]
        elif variable in self._pipe_heat_loss_nominals:
            return self._pipe_heat_loss_nominals[variable]
        elif variable in self.__heat_pipe_topo_cost_nominals:
            return self.__heat_pipe_topo_cost_nominals[variable]
        elif variable in self.__asset_max_size_nominals:
            return self.__asset_max_size_nominals[variable]
        elif variable in self.__heat_pipe_topo_max_discharge_nominals:
            return self.__heat_pipe_topo_max_discharge_nominals[variable]
        elif variable in self.__gas_pipe_topo_diameter_nominals:
            return self.__gas_pipe_topo_diameter_nominals[variable]
        elif variable in self.__gas_pipe_topo_cost_nominals:
            return self.__gas_pipe_topo_cost_nominals[variable]
        elif variable in self.__gas_pipe_topo_max_discharge_nominals:
            return self.__gas_pipe_topo_max_discharge_nominals[variable]
        elif variable in self.__electricity_cable_topo_resistance_nominals:
            return self.__electricity_cable_topo_resistance_nominals[variable]
        elif variable in self.__electricity_cable_topo_max_current_nominals:
            return self.__electricity_cable_topo_max_current_nominals[variable]
        elif variable in self.__electricity_cable_topo_cost_nominals:
            return self.__electricity_cable_topo_cost_nominals[variable]
        else:
            return super().variable_nominal(variable)

    def bounds(self):
        """
        In this function we add the bounds to the problem for all the variables defined/added in
        the HeatMixin.
        """
        bounds = super().bounds()
        bounds.update(self.__heat_pipe_topo_pipe_class_var_bounds)
        bounds.update(self.__heat_pipe_topo_diameter_var_bounds)
        bounds.update(self.__heat_pipe_topo_cost_var_bounds)
        bounds.update(self._pipe_heat_loss_var_bounds)
        bounds.update(self.__heat_pipe_topo_heat_discharge_bounds)
        bounds.update(self.__gas_pipe_topo_pipe_class_var_bounds)
        bounds.update(self.__gas_pipe_topo_diameter_var_bounds)
        bounds.update(self.__gas_pipe_topo_cost_var_bounds)
        bounds.update(self.__asset_max_size_bounds)
        bounds.update(self.__asset_aggregation_count_var_bounds)
        bounds.update(self.__heat_pipe_topo_max_discharge_var_bounds)
        bounds.update(self.__gas_pipe_topo_max_discharge_var_bounds)
        bounds.update(self.__heat_pipe_topo_global_pipe_class_count_var_bounds)
        bounds.update(self.__gas_pipe_topo_global_pipe_class_count_var_bounds)
        bounds.update(self.__heat_pipe_topo_pipe_class_discharge_ordering_var_bounds)
        bounds.update(self.__heat_pipe_topo_pipe_class_cost_ordering_var_bounds)
        bounds.update(self.__heat_pipe_topo_pipe_class_heat_loss_ordering_var_bounds)
        bounds.update(self.__gas_pipe_topo_pipe_class_discharge_ordering_var_bounds)
        bounds.update(self.__gas_pipe_topo_pipe_class_cost_ordering_var_bounds)
        bounds.update(self.__electricity_cable_topo_max_current_var_bounds)
        bounds.update(self.__electricity_cable_topo_resistance_var_bounds)
        bounds.update(self.__electricity_cable_topo_cost_var_bounds)
        bounds.update(self.__electricity_cable_topo_cable_class_var_bounds)
        bounds.update(self.__electricity_cable_topo_cable_class_current_ordering_var_bounds)
        bounds.update(self.__electricity_cable_topo_cable_class_cost_ordering_var_bounds)
        bounds.update(self.__electricity_cable_topo_global_cable_class_count_var_bounds)
        return bounds

    def parameters(self, ensemble_member):
        """
        In this function we adapt the parameters object to avoid issues with accidentally using
        variables as constants.
        """
        parameters = super().parameters(ensemble_member)

        # To avoid mistakes by accidentally using the `diameter`, `area` and `Heat_loss`
        # parameters in e.g. constraints when those are variable, we set them
        # to NaN in that case. In post(), they are set to their resulting
        # values once again.
        if self.__heat_pipe_topo_diameter_area_parameters:
            parameters.update(self.__heat_pipe_topo_diameter_area_parameters[ensemble_member])
        if self.__heat_pipe_topo_heat_loss_parameters:
            parameters.update(self.__heat_pipe_topo_heat_loss_parameters[ensemble_member])

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
            # TODO: asset sizing is currently hard coded to use only the milp network settings
            for pipe in components.get("heat_pipe", []):
                try:
                    pipe_classes = self._heat_pipe_topo_pipe_class_map[pipe].keys()
                    head_loss += max(
                        self._hn_head_loss_class._hn_pipe_head_loss(
                            pipe,
                            self,
                            options,
                            self.heat_network_settings,
                            parameters,
                            pc.maximum_discharge,
                            pipe_class=pc,
                        )
                        for pc in pipe_classes
                        if pc.maximum_discharge > 0.0
                    )
                except KeyError:
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

    def __state_vector_scaled(self, variable, ensemble_member):
        """
        This functions returns the casadi symbols scaled with their nominal for the entire time
        horizon.
        """
        canonical, sign = self.alias_relation.canonical_signed(variable)
        return (
            self.state_vector(canonical, ensemble_member) * self.variable_nominal(canonical) * sign
        )

    def __pipe_topology_constraints(self, ensemble_member):
        """
        This function adds the constraints needed for the optimization of pipe classes (referred to
        as topology optimization). We ensure that only one pipe_class can be selected.
        Additionally,, we set the diameter and cost variable to those associated with the optimized
        pipe_class. Note that the cost symbol is the investment cost in EUR/meter, the actual
        investment cost of the pipe is set in the __investment_cost variable.

        Furthermore, ordering variables are set in this function. This is to give the optimization
        insight in the ordering of all the possible boolean choices in pipe classes and as such
        quicker find a feasible and optimal solution. The ordering are 0 or 1 depending on whether
        the variable is larger compared to the selected pipe-class. For example is the pipe class
        variable for DN200 is 1, then all discharge ordering variables for the pipe classes >=DN200
        are 1.
        """
        constraints = []

        # These are the constraints to count the amount of a certain pipe class
        unique_pipe_classes = self.get_unique_pipe_classes()
        pipe_class_count_sum = {pc.name: 0 for pc in unique_pipe_classes}

        set_self_hot_pipes = set(self.hot_pipes)
        for p in self.energy_system_components.get("heat_pipe", []):
            try:
                pipe_classes = self._heat_pipe_topo_pipe_class_map[p]
            except KeyError:
                pass
            else:
                for pc in pipe_classes:
                    neighbour = self.has_related_pipe(p)
                    if neighbour and p not in set_self_hot_pipes:
                        var_name = f"{self.cold_to_hot_pipe(p)}__hn_pipe_class_{pc.name}"
                    else:
                        var_name = f"{p}__hn_pipe_class_{pc.name}"
                    pipe_class_count_sum[pc.name] += self.extra_variable(var_name, ensemble_member)

        for pc in unique_pipe_classes:
            var = self.extra_variable(
                self.__heat_pipe_topo_global_pipe_class_count_map[pc.name], ensemble_member
            )
            constraints.append(((pipe_class_count_sum[pc.name] - var), 0.0, 0.0))

        # These are the constraints to order the discharge capabilities of the pipe classes
        for p, pipe_classes in self.__heat_pipe_topo_pipe_class_discharge_ordering_map.items():
            max_discharge = self.extra_variable(self._heat_pipe_topo_max_discharge_map[p])
            max_discharges = {
                pc.name: pc.maximum_discharge for pc in self._heat_pipe_topo_pipe_class_map[p]
            }
            median_discharge = np.median(list(max_discharges.values()))

            big_m = 2.0 * max(max_discharges.values())
            for pc, var_name in pipe_classes.items():
                pipe_class_discharge_ordering = self.extra_variable(var_name, ensemble_member)

                constraints.append(
                    (
                        (
                            max_discharge
                            - max_discharges[pc.name]
                            + pipe_class_discharge_ordering * big_m
                        )
                        / median_discharge,
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (
                            max_discharge
                            - max_discharges[pc.name]
                            - (1.0 - pipe_class_discharge_ordering) * big_m
                        )
                        / median_discharge,
                        -np.inf,
                        0.0,
                    )
                )

        # These are the constraints to order the costs of the pipe classes
        for p, pipe_classes in self.__heat_pipe_topo_pipe_class_cost_ordering_map.items():
            cost_sym_name = self._heat_pipe_topo_cost_map[p]
            cost_sym = self.extra_variable(cost_sym_name, ensemble_member)
            costs = {pc.name: pc.investment_costs for pc in self._heat_pipe_topo_pipe_class_map[p]}

            big_m = 2.0 * max(costs.values())
            for pc, var_name in pipe_classes.items():
                pipe_class_cost_ordering = self.extra_variable(var_name, ensemble_member)

                # should be one if >= than cost_symbol
                constraints.append(
                    (
                        (cost_sym - costs[pc.name] + pipe_class_cost_ordering * big_m)
                        / self.variable_nominal(cost_sym_name),
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (cost_sym - costs[pc.name] - (1.0 - pipe_class_cost_ordering) * big_m)
                        / self.variable_nominal(cost_sym_name),
                        -np.inf,
                        0.0,
                    )
                )

        # These are the constraints to order the milp loss of the pipe classes.
        if not self.energy_system_options()["neglect_pipe_heat_losses"]:
            for (
                pipe,
                pipe_classes,
            ) in self.__heat_pipe_topo_pipe_class_heat_loss_ordering_map.items():
                if pipe in set_self_hot_pipes and self.has_related_pipe(pipe):
                    heat_loss_sym_name = self._pipe_heat_loss_map[pipe]
                    heat_loss_sym = self.extra_variable(heat_loss_sym_name, ensemble_member)
                    cold_name = self._pipe_heat_loss_map[self.hot_to_cold_pipe(pipe)]
                    heat_loss_sym += self.extra_variable(cold_name, ensemble_member)
                    heat_losses = [
                        h1 + h2
                        for h1, h2 in zip(
                            self._pipe_heat_losses[pipe],
                            self._pipe_heat_losses[self.hot_to_cold_pipe(pipe)],
                        )
                    ]
                elif pipe in set_self_hot_pipes and not self.has_related_pipe(pipe):
                    heat_loss_sym_name = self._pipe_heat_loss_map[pipe]
                    heat_loss_sym = self.extra_variable(heat_loss_sym_name, ensemble_member)

                    heat_losses = self._pipe_heat_losses[pipe]
                else:  # cold pipe
                    continue

                big_m = 2.0 * max(heat_losses)
                for var_name, heat_loss in zip(pipe_classes.values(), heat_losses):
                    pipe_class_heat_loss_ordering = self.extra_variable(var_name, ensemble_member)

                    # should be one if >= than heat_loss_symbol
                    constraints.append(
                        (
                            (heat_loss_sym - heat_loss + pipe_class_heat_loss_ordering * big_m)
                            / self.variable_nominal(heat_loss_sym_name),
                            0.0,
                            np.inf,
                        )
                    )
                    constraints.append(
                        (
                            (
                                heat_loss_sym
                                - heat_loss
                                - (1.0 - pipe_class_heat_loss_ordering) * big_m
                            )
                            / self.variable_nominal(heat_loss_sym_name),
                            -np.inf,
                            0.0,
                        )
                    )

        for p, pipe_classes in self._heat_pipe_topo_pipe_class_map.items():
            variables = {
                pc.name: self.extra_variable(var_name, ensemble_member)
                for pc, var_name in pipe_classes.items()
            }

            # Make sure exactly one indicator is true
            constraints.append((sum(variables.values()), 1.0, 1.0))

            # set the max discharge
            max_discharge = self.extra_variable(self._heat_pipe_topo_max_discharge_map[p])
            max_discharges = {pc.name: pc.maximum_discharge for pc in pipe_classes}
            max_discharge_expr = sum(
                variables[pc_name] * max_discharges[pc_name] for pc_name in variables
            )

            constraints.append(
                (
                    (max_discharge - max_discharge_expr)
                    / self.variable_nominal(self._heat_pipe_topo_max_discharge_map[p]),
                    0.0,
                    0.0,
                )
            )

            # Match the indicators to the diameter symbol
            diam_sym_name = self._heat_pipe_topo_diameter_map[p]
            diam_sym = self.extra_variable(diam_sym_name, ensemble_member)

            diameters = {pc.name: pc.inner_diameter for pc in pipe_classes}

            diam_expr = sum(variables[pc_name] * diameters[pc_name] for pc_name in variables)

            constraint_nominal = self.variable_nominal(diam_sym_name)
            constraints.append(((diam_sym - diam_expr) / constraint_nominal, 0.0, 0.0))

            # match the indicators to the cost symbol
            cost_sym_name = self._heat_pipe_topo_cost_map[p]
            cost_sym = self.extra_variable(cost_sym_name, ensemble_member)

            investment_costs = {pc.name: pc.investment_costs for pc in pipe_classes}

            costs_expr = sum(
                variables[pc_name] * investment_costs[pc_name] for pc_name in variables
            )
            costs_constraint_nominal = self.variable_nominal(cost_sym_name)

            constraints.append(((cost_sym - costs_expr) / costs_constraint_nominal, 0.0, 0.0))

        return constraints

    def __gas_pipe_topology_constraints(self, ensemble_member):
        constraints = []

        # These are the constraints to count the amount of a certain pipe class
        unique_pipe_classes = self.get_unique_gas_pipe_classes()
        pipe_class_count_sum = {pc.name: 0 for pc in unique_pipe_classes}

        for p in self.energy_system_components.get("gas_pipe", []):
            try:
                pipe_classes = self._gas_pipe_topo_pipe_class_map[p]
            except KeyError:
                pass
            else:
                for pc in pipe_classes:
                    var_name = f"{p}__gn_pipe_class_{pc.name}"
                    pipe_class_count_sum[pc.name] += self.extra_variable(var_name, ensemble_member)

        for pc in unique_pipe_classes:
            var = self.extra_variable(
                self.__gas_pipe_topo_global_pipe_class_count_map[pc.name], ensemble_member
            )
            constraints.append(((pipe_class_count_sum[pc.name] - var), 0.0, 0.0))

        # These are the constraints to order the discharge capabilities of the pipe classes
        for p, pipe_classes in self.__gas_pipe_topo_pipe_class_discharge_ordering_map.items():
            max_discharge = self.extra_variable(self._gas_pipe_topo_max_discharge_map[p])
            max_discharges = {
                pc.name: pc.maximum_discharge for pc in self._gas_pipe_topo_pipe_class_map[p]
            }
            median_discharge = np.median(list(max_discharges.values()))

            big_m = 2.0 * max(max_discharges.values())
            for pc, var_name in pipe_classes.items():
                pipe_class_discharge_ordering = self.extra_variable(var_name, ensemble_member)

                constraints.append(
                    (
                        (
                            max_discharge
                            - max_discharges[pc.name]
                            + pipe_class_discharge_ordering * big_m
                        )
                        / median_discharge,
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (
                            max_discharge
                            - max_discharges[pc.name]
                            - (1.0 - pipe_class_discharge_ordering) * big_m
                        )
                        / median_discharge,
                        -np.inf,
                        0.0,
                    )
                )

        # These are the constraints to order the costs of the pipe classes
        for p, pipe_classes in self.__gas_pipe_topo_pipe_class_cost_ordering_map.items():
            cost_sym_name = self._gas_pipe_topo_cost_map[p]
            cost_sym = self.extra_variable(cost_sym_name, ensemble_member)
            costs = {pc.name: pc.investment_costs for pc in self._gas_pipe_topo_pipe_class_map[p]}

            big_m = 2.0 * max(costs.values())
            for pc, var_name in pipe_classes.items():
                pipe_class_cost_ordering = self.extra_variable(var_name, ensemble_member)

                # should be one if >= than cost_symbol
                constraints.append(
                    (
                        (cost_sym - costs[pc.name] + pipe_class_cost_ordering * big_m)
                        / self.variable_nominal(cost_sym_name),
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (cost_sym - costs[pc.name] - (1.0 - pipe_class_cost_ordering) * big_m)
                        / self.variable_nominal(cost_sym_name),
                        -np.inf,
                        0.0,
                    )
                )

        for p, pipe_classes in self._gas_pipe_topo_pipe_class_map.items():
            variables = {
                pc.name: self.extra_variable(var_name, ensemble_member)
                for pc, var_name in pipe_classes.items()
            }

            # Make sure exactly one indicator is true
            constraints.append((sum(variables.values()), 1.0, 1.0))

            # set the max discharge
            max_discharge = self.extra_variable(self._gas_pipe_topo_max_discharge_map[p])
            max_discharges = {pc.name: pc.maximum_discharge for pc in pipe_classes}
            max_discharge_expr = sum(
                variables[pc_name] * max_discharges[pc_name] for pc_name in variables
            )

            constraints.append(
                (
                    (max_discharge - max_discharge_expr)
                    / self.variable_nominal(self._gas_pipe_topo_max_discharge_map[p]),
                    0.0,
                    0.0,
                )
            )

            # Match the indicators to the diameter symbol
            diam_sym_name = self._gas_pipe_topo_diameter_map[p]
            diam_sym = self.extra_variable(diam_sym_name, ensemble_member)

            diameters = {pc.name: pc.inner_diameter for pc in pipe_classes}

            diam_expr = sum(variables[pc_name] * diameters[pc_name] for pc_name in variables)

            constraint_nominal = self.variable_nominal(diam_sym_name)
            constraints.append(((diam_sym - diam_expr) / constraint_nominal, 0.0, 0.0))

            # match the indicators to the cost symbol
            cost_sym_name = self._gas_pipe_topo_cost_map[p]
            cost_sym = self.extra_variable(cost_sym_name, ensemble_member)

            investment_costs = {pc.name: pc.investment_costs for pc in pipe_classes}

            costs_expr = sum(
                variables[pc_name] * investment_costs[pc_name] for pc_name in variables
            )
            costs_constraint_nominal = self.variable_nominal(cost_sym_name)

            constraints.append(((cost_sym - costs_expr) / costs_constraint_nominal, 0.0, 0.0))

        return constraints

    def __electricity_cable_topology_constraints(self, ensemble_member):
        constraints = []

        # These are the constraints to count the amount of a certain pipe class
        unique_cable_classes = self.get_unique_cable_classes()
        cable_class_count_sum = {cc.name: 0 for cc in unique_cable_classes}

        for c in self.energy_system_components.get("electricity_cable", []):
            try:
                cable_classes = self._electricity_cable_topo_cable_class_map[c]
            except KeyError:
                pass
            else:
                for cc in cable_classes:
                    var_name = f"{c}__en_cable_class_{cc.name}"
                    cable_class_count_sum[cc.name] += self.extra_variable(var_name, ensemble_member)

        for cc in unique_cable_classes:
            var = self.extra_variable(
                self.__electricity_cable_topo_global_cable_class_count_map[cc.name], ensemble_member
            )
            constraints.append(((cable_class_count_sum[cc.name] - var), 0.0, 0.0))

        # These are the constraints to order the discharge capabilities of the pipe classes
        for (
            c,
            cable_classes,
        ) in self.__electricity_cable_topo_cable_class_current_ordering_map.items():
            max_current = self.extra_variable(self._electricity_cable_topo_max_current_map[c])
            max_currents = {
                cc.name: cc.maximum_current
                for cc in self._electricity_cable_topo_cable_class_map[c]
            }
            median_current = np.median(list(max_currents.values()))

            big_m = 2.0 * max(max_currents.values())
            for cc, var_name in cable_classes.items():
                cable_class_current_ordering = self.extra_variable(var_name, ensemble_member)

                constraints.append(
                    (
                        (max_current - max_currents[cc.name] + cable_class_current_ordering * big_m)
                        / median_current,
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (
                            max_current
                            - max_currents[cc.name]
                            - (1.0 - cable_class_current_ordering) * big_m
                        )
                        / median_current,
                        -np.inf,
                        0.0,
                    )
                )

        # These are the constraints to order the costs of the pipe classes
        for c, cable_classes in self.__electricity_cable_topo_cable_class_cost_ordering_map.items():
            cost_sym_name = self._electricity_cable_topo_cost_map[c]
            cost_sym = self.extra_variable(cost_sym_name, ensemble_member)
            costs = {
                pc.name: pc.investment_costs
                for pc in self._electricity_cable_topo_cable_class_map[c]
            }

            big_m = 2.0 * max(costs.values())
            for cc, var_name in cable_classes.items():
                pipe_class_cost_ordering = self.extra_variable(var_name, ensemble_member)

                # should be one if >= than cost_symbol
                constraints.append(
                    (
                        (cost_sym - costs[cc.name] + pipe_class_cost_ordering * big_m)
                        / self.variable_nominal(cost_sym_name),
                        0.0,
                        np.inf,
                    )
                )
                constraints.append(
                    (
                        (cost_sym - costs[cc.name] - (1.0 - pipe_class_cost_ordering) * big_m)
                        / self.variable_nominal(cost_sym_name),
                        -np.inf,
                        0.0,
                    )
                )

        for c, cable_classes in self._electricity_cable_topo_cable_class_map.items():
            variables = {
                cc.name: self.extra_variable(var_name, ensemble_member)
                for cc, var_name in cable_classes.items()
            }

            # Make sure exactly one indicator is true
            constraints.append((sum(variables.values()), 1.0, 1.0))

            # set the max discharge
            max_current = self.extra_variable(self._electricity_cable_topo_max_current_map[c])
            max_currents = {cc.name: cc.maximum_current for cc in cable_classes}
            max_current_expr = sum(
                variables[cc_name] * max_currents[cc_name] for cc_name in variables
            )

            constraints.append(
                (
                    (max_current - max_current_expr)
                    / self.variable_nominal(self._electricity_cable_topo_max_current_map[c]),
                    0.0,
                    0.0,
                )
            )

            # Match the indicators to the diameter symbol
            res_sym_name = self._electricity_cable_topo_resistance_map[c]
            res_sym = self.extra_variable(res_sym_name, ensemble_member)

            resistances = {cc.name: cc.resistance for cc in cable_classes}

            res_expr = sum(variables[cc_name] * resistances[cc_name] for cc_name in variables)

            constraint_nominal = self.variable_nominal(res_sym_name)
            constraints.append(((res_sym - res_expr) / constraint_nominal, 0.0, 0.0))

            # match the indicators to the cost symbol
            cost_sym_name = self._electricity_cable_topo_cost_map[c]
            cost_sym = self.extra_variable(cost_sym_name, ensemble_member)

            investment_costs = {cc.name: cc.investment_costs for cc in cable_classes}

            costs_expr = sum(
                variables[cc_name] * investment_costs[cc_name] for cc_name in variables
            )
            costs_constraint_nominal = self.variable_nominal(cost_sym_name)

            constraints.append(((cost_sym - costs_expr) / costs_constraint_nominal, 0.0, 0.0))

        return constraints

    def __pipe_topology_path_constraints(self, ensemble_member):
        """
        This function adds constraints to limit the discharge that can flow through a pipe when the
        pipe class is being optimized. This is needed as the different pipe classes have different
        diameters and maximum velocities.
        """
        constraints = []

        # Clip discharge based on pipe class
        for p in self.energy_system_components.get("heat_pipe", []):
            # Match the indicators to the discharge symbol(s)
            discharge_sym = self.state(f"{p}.Q")
            nominal = self.variable_nominal(f"{p}.Q")

            max_discharge = self.__heat_pipe_topo_max_discharge_var[
                self._heat_pipe_topo_max_discharge_map[p]
            ]

            constraints.append(((max_discharge - discharge_sym) / nominal, 0.0, np.inf))
            constraints.append(((-max_discharge - discharge_sym) / nominal, -np.inf, 0.0))

        return constraints

    def __gas_pipe_topology_path_constraints(self, ensemble_member):
        """
        This function adds constraints to limit the discharge that can flow through a pipe when the
        pipe class is being optimized. This is needed as the different pipe classes have different
        diameters and maximum velocities.
        """
        constraints = []

        # Clip discharge based on pipe class
        for p in self.energy_system_components.get("gas_pipe", []):
            # Match the indicators to the discharge symbol(s)
            discharge_sym = self.state(f"{p}.Q")
            nominal = self.variable_nominal(f"{p}.Q")

            max_discharge = self.__gas_pipe_topo_max_discharge_var[
                self._gas_pipe_topo_max_discharge_map[p]
            ]

            constraints.append(((max_discharge - discharge_sym) / nominal, 0.0, np.inf))
            constraints.append(((-max_discharge - discharge_sym) / nominal, -np.inf, 0.0))

        return constraints

    def __electricity_cable_topology_path_constraints(self, ensemble_member):
        """
        This function adds constraints to limit the discharge that can flow through a pipe when the
        pipe class is being optimized. This is needed as the different pipe classes have different
        diameters and maximum velocities.
        """
        constraints = []

        # Clip current based on pipe class
        for cable in self.energy_system_components.get("electricity_cable", []):
            # Match the indicators to the discharge symbol(s)
            current_sym = self.state(f"{cable}.I")
            nominal = self.variable_nominal(f"{cable}.I")

            max_current_var = self.__electricity_cable_topo_max_current_var[
                self._electricity_cable_topo_max_current_map[cable]
            ]

            constraints.append(((max_current_var - current_sym) / nominal, 0.0, np.inf))
            constraints.append(((-max_current_var - current_sym) / nominal, -np.inf, 0.0))

        return constraints

    def __max_size_constraints(self, ensemble_member):
        """
        This function makes sure that the __max_size variable is at least as large as needed. For
        most assets the __max_size is related to the thermal Power it can produce or consume, there
        are a few exceptions like tank storage that sizes with volume.

        Since it are inequality constraints are inequality the __max_size variable can be larger
        than what is the actual needed size. In combination with the objectives, e.g. cost
        minimization, we can drag down the __max_size to the minimum required.
        """
        constraints = []
        bounds = self.bounds()
        np_ones = np.ones(len(self.times()))

        energy_system_component_types = list(self.energy_system_components.keys())

        max_var_types = set()
        for b in self.energy_system_components.get("heat_buffer", []):
            max_var_types.add("heat_buffer")
            max_var = self._asset_max_size_map[b]
            max_heat = self.extra_variable(max_var, ensemble_member)
            stored_heat = self.__state_vector_scaled(f"{b}.Stored_heat", ensemble_member)
            constraint_nominal = self.variable_nominal(max_var)

            constraints.append(
                (
                    (np_ones * max_heat - stored_heat) / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )

        for s in self.energy_system_components.get("heat_source", []):
            max_var_types.add("heat_source")
            max_var = self._asset_max_size_map[s]
            max_heat = self.extra_variable(max_var, ensemble_member)
            heat_source = self.__state_vector_scaled(f"{s}.Heat_source", ensemble_member)
            constraint_nominal = self.variable_nominal(f"{s}.Heat_source")

            if f"{s}.maximum_heat_source" in self.io.get_timeseries_names():
                profile_non_scaled = self.get_timeseries(f"{s}.maximum_heat_source").values
                max_profile_non_scaled = max(profile_non_scaled)
                profile_scaled = profile_non_scaled / max_profile_non_scaled

                # Cap the heat produced via a profile. Two profile options below.
                # Option 1: Profile specified in absolute values [W] via a ProfileConstraint
                esdl_asset_attributes = self.esdl_assets[
                    self.esdl_asset_name_to_id_map[s]
                ].attributes["constraint"]
                if (
                    len(esdl_asset_attributes) > 0
                    and hasattr(esdl_asset_attributes.items[0], "maximum")
                    and esdl_asset_attributes.items[0].maximum.profileQuantityAndUnit.reference.unit
                    == esdl.UnitEnum.WATT
                ):
                    parameters = self.parameters(ensemble_member)

                    if parameters[f"{s}.state"] == 1:  # Enabled asset
                        constraints.append(
                            (
                                (max_heat - max_profile_non_scaled) / constraint_nominal,
                                0.0,
                                np.inf,
                            )
                        )
                        max_heat_var = max_profile_non_scaled

                    elif parameters[f"{s}.state"] == 2:  # Optional asset
                        max_heat_var = max_heat

                    else:
                        state_val = parameters[f"{s}.state"]
                        logger.error(f"Unexpected state: {state_val}")
                        sys.exit(1)

                    for i in range(0, len(self.times())):
                        constraints.append(
                            (
                                (profile_scaled[i] * max_heat_var - heat_source[i])
                                / constraint_nominal,
                                0.0,
                                np.inf,
                            )
                        )
                # Option 2: Normalised profile (0.0-1.0) shape that scales with maximum size of the
                # producer
                # Note: If the asset is not optional then the profile will be scaled to the
                # installed capacity
                elif (
                    # profile is specified without units (xlm/csv)
                    len(esdl_asset_attributes) == 0
                    or (
                        esdl_asset_attributes.items[
                            0
                        ].maximum.profileQuantityAndUnit.reference.physicalQuantity
                        == esdl.PhysicalQuantityEnum.COEFFICIENT
                        and (
                            esdl_asset_attributes.items[
                                0
                            ].maximum.profileQuantityAndUnit.reference.unit
                            == esdl.UnitEnum.PERCENT
                            or esdl_asset_attributes.items[
                                0
                            ].maximum.profileQuantityAndUnit.reference.unit
                            == esdl.UnitEnum.NONE
                        )
                    )  # profile from esdl
                ):
                    # TODO: currently this can only be used with a csv file since units must be set
                    # for ProfileContraint. Future addition can be to use a different unit/quantity
                    # etc. so that the profile is used in a normalised way and scale to max_size

                    for i in range(0, len(self.times())):
                        constraints.append(
                            (
                                (profile_scaled[i] * max_heat - heat_source[i])
                                / constraint_nominal,
                                0.0,
                                np.inf,
                            )
                        )
                else:
                    RuntimeError(f"{s}: Unforeseen error in adding a profile contraint")
            else:
                constraints.append(
                    (
                        (np_ones * max_heat - heat_source) / constraint_nominal,
                        0.0,
                        np.inf,
                    )
                )

        for hx in [
            *self.energy_system_components.get("heat_exchanger", []),
            *self.energy_system_components.get("heat_pump", []),
        ]:
            max_var_types.update(["heat_pump", "heat_exchanger"])
            max_var = self._asset_max_size_map[hx]
            max_heat = self.extra_variable(max_var, ensemble_member)
            heat_secondary = self.__state_vector_scaled(f"{hx}.Secondary_heat", ensemble_member)
            constraint_nominal = self.variable_nominal(f"{hx}.Secondary_heat")

            constraints.append(
                (
                    (np_ones * max_heat - heat_secondary) / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )

        for d in self.energy_system_components.get("heat_demand", []):
            max_var_types.add("heat_demand")
            max_var = self._asset_max_size_map[d]
            max_heat = self.extra_variable(max_var, ensemble_member)
            heat_demand = self.__state_vector_scaled(f"{d}.Heat_demand", ensemble_member)
            constraint_nominal = max(
                self.variable_nominal(f"{d}.Heat_demand"), self.variable_nominal(f"{d}.HeatIn.Heat")
            )
            constraints.append(
                (
                    (np_ones * max_heat - heat_demand) / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )

        for a in [
            *self.energy_system_components.get("ates", []),
            *self.energy_system_components.get("low_temperature_ates", []),
        ]:
            max_var_types.update(["ates", "low_temperature_ates"])
            max_var = self._asset_max_size_map[a]
            max_heat = self.extra_variable(max_var, ensemble_member)
            if a in self.energy_system_components.get("ates", []):
                heat_ates = self.__state_vector_scaled(f"{a}.Heat_ates", ensemble_member)
                constraint_nominal = bounds[f"{a}.Heat_ates"][1]
            else:
                heat_ates = self.__state_vector_scaled(
                    f"{a}.Heat_low_temperature_ates", ensemble_member
                )
                constraint_nominal = bounds[f"{a}.Heat_low_temperature_ates"][1]

            constraints.append(
                (
                    (np_ones * max_heat - heat_ates) / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )
            constraints.append(
                (
                    (np_ones * max_heat + heat_ates) / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )

        for d in self.energy_system_components.get("electricity_demand", []):
            max_var_types.add("electricity_demand")
            max_var = self._asset_max_size_map[d]
            max_power = self.extra_variable(max_var, ensemble_member)
            electricity_demand = self.__state_vector_scaled(
                f"{d}.Electricity_demand", ensemble_member
            )
            constraint_nominal = self.variable_nominal(f"{d}.Electricity_demand")

            constraints.append(
                (
                    (np_ones * max_power - electricity_demand) / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )

        for d in self.energy_system_components.get("electricity_source", []):
            max_var_types.add("electricity_source")
            max_var = self._asset_max_size_map[d]
            max_power = self.extra_variable(max_var, ensemble_member)
            electricity_source = self.__state_vector_scaled(
                f"{d}.Electricity_source", ensemble_member
            )
            constraint_nominal = self.variable_nominal(f"{d}.Electricity_source")

            constraints.append(
                (
                    (np_ones * max_power - electricity_source) / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )

        for d in self.energy_system_components.get("electricity_storage", []):
            max_var_types.add("electricity_storage")
            max_var = self._asset_max_size_map[d]
            max_stored_energy = self.extra_variable(max_var, ensemble_member)
            electricity_stored = self.__state_vector_scaled(
                f"{d}.Stored_electricity", ensemble_member
            )
            constraint_nominal = self.variable_nominal(f"{d}.Stored_electricity")

            constraints.append(
                (
                    (np_ones * max_stored_energy - electricity_stored) / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )

        for d in self.energy_system_components.get("electrolyzer", []):
            max_var_types.add("electrolyzer")
            max_var = self._asset_max_size_map[d]
            max_power = self.extra_variable(max_var, ensemble_member)
            electricity_electrolyzer = self.__state_vector_scaled(
                f"{d}.Power_consumed", ensemble_member
            )
            constraint_nominal = self.variable_nominal(f"{d}.Power_consumed")

            constraints.append(
                (
                    (np_ones * max_power - electricity_electrolyzer) / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )

        for d in self.energy_system_components.get("gas_tank_storage", []):
            max_var_types.add("gas_tank_storage")
            max_var = self._asset_max_size_map[d]
            max_size = self.extra_variable(max_var, ensemble_member)
            gas_mass = self.__state_vector_scaled(f"{d}.Stored_gas_mass", ensemble_member)
            constraint_nominal = self.variable_nominal(f"{d}.Stored_gas_mass")

            constraints.append(
                (
                    (np_ones * max_size - gas_mass) / constraint_nominal,
                    0.0,
                    np.inf,
                )
            )

        max_var_assets_not_included = [
            a for a in energy_system_component_types if a not in max_var_types
        ]
        if len(max_var_assets_not_included) >= 0:
            logger.warning(
                f"The following asset types are not included in the maximum sizing "
                f"constraints {max_var_assets_not_included}"
            )

        return constraints

    def __add_optional_asset_path_constraints(
        self, constraints, asset_name, nominal_value, nominal_var, single_power, state_var
    ):
        aggregation_count = self.__asset_aggregation_count_var[
            self._asset_aggregation_count_var_map[asset_name]
        ]
        constraint_nominal = (nominal_value * nominal_var) ** 0.5

        constraints.append(
            (
                (single_power * aggregation_count - state_var) / constraint_nominal,
                0.0,
                np.inf,
            )
        )
        constraints.append(
            (
                (-single_power * aggregation_count - state_var) / constraint_nominal,
                -np.inf,
                0.0,
            )
        )
        return constraints

    def __optional_asset_path_constraints(self, ensemble_member):
        """
        This function adds constraints that set the _aggregation_count variable. This variable is
        used for most assets (except geo and ates) to turn on/off the asset. Which effectively mean
        that assets cannot exchange thermal power with the network when _aggregation_count == 0.

        Specifically for the geo and ATES we use the _aggregation_count for modelling the amount of
        doublets. Where the _aggregation_count allows increments in the upper limit for the thermal
        power that can be exchanged with the network.
        """
        constraints = []

        parameters = self.parameters(ensemble_member)
        bounds = self.bounds()

        for asset_name in [
            asset_name
            for asset_name_list in self.energy_system_components.values()
            for asset_name in asset_name_list
        ]:
            if parameters[f"{asset_name}.state"] == 0 or parameters[f"{asset_name}.state"] == 2:
                if asset_name in [
                    *self.energy_system_components.get("geothermal", []),
                    *self.energy_system_components.get("ates", []),
                ]:
                    # changing flow bounds as a result of different aggregation count, additional
                    # step for geothermal and ates as they have subsurface flow limits.
                    state_var = self.state(f"{asset_name}.Q")
                    single_flow = (
                        bounds[f"{asset_name}.Q"][1] / parameters[f"{asset_name}.nr_of_doublets"]
                    )
                    nominal_value = 2.0 * bounds[f"{asset_name}.Q"][1]
                    nominal_var = self.variable_nominal(f"{asset_name}.Q")
                    constraints = self.__add_optional_asset_path_constraints(
                        constraints, asset_name, nominal_value, nominal_var, single_flow, state_var
                    )
                    state_var = self.state(f"{asset_name}.Heat_flow")
                    single_power = parameters[f"{asset_name}.single_doublet_power"]
                    nominal_value = 2.0 * bounds[f"{asset_name}.Heat_flow"][1]
                    nominal_var = self.variable_nominal(f"{asset_name}.Heat_flow")
                elif asset_name in [*self.energy_system_components.get("heat_buffer", [])]:
                    state_var = self.state(f"{asset_name}.HeatIn.Q")
                    single_power = parameters[f"{asset_name}.volume"]
                    nominal_value = single_power
                    nominal_var = self.variable_nominal(f"{asset_name}.HeatIn.Q")
                elif asset_name in [
                    *self.energy_system_components.get("node", []),
                    *self.energy_system_components.get("gas_node", []),
                    *self.energy_system_components.get("gas_pipe", []),
                ]:
                    # TODO: can we generalize to all possible components to avoid having to skip
                    #  joints and other components in the future?
                    continue
                elif (
                    self.energy_system_components_commodity.get(asset_name)
                    == NetworkSettings.NETWORK_TYPE_HEAT
                ):
                    state_var = self.state(f"{asset_name}.Heat_flow")
                    single_power = bounds[f"{asset_name}.Heat_flow"][1]
                    nominal_value = single_power
                    nominal_var = self.variable_nominal(f"{asset_name}.Heat_flow")
                else:
                    logger.warning(
                        f"{asset_name} is not yet included in the optional asset path "
                        f"constraints"
                    )
                    continue

                constraints = self.__add_optional_asset_path_constraints(
                    constraints, asset_name, nominal_value, nominal_var, single_power, state_var
                )

            elif parameters[f"{asset_name}.state"] == 1:
                aggregation_count = self.__asset_aggregation_count_var[
                    self._asset_aggregation_count_var_map[asset_name]
                ]
                aggr_bound = self.__asset_aggregation_count_var_bounds[
                    asset_name + "_aggregation_count"
                ][1]
                constraints.append(((aggregation_count - aggr_bound), 0.0, 0.0))

        return constraints

    def path_constraints(self, ensemble_member):
        """
        Here we add all the path constraints to the optimization problem. Please note that the
        path constraints are the constraints that are applied to each time-step in the problem.
        """

        constraints = super().path_constraints(ensemble_member)

        constraints.extend(self.__pipe_topology_path_constraints(ensemble_member))
        constraints.extend(self.__gas_pipe_topology_path_constraints(ensemble_member))
        constraints.extend(self.__electricity_cable_topology_path_constraints(ensemble_member))
        constraints.extend(self.__optional_asset_path_constraints(ensemble_member))

        return constraints

    def constraints(self, ensemble_member):
        """
        This function adds the normal constraints to the problem. Unlike the path constraints these
        are not applied to every time-step in the problem. Meaning that these constraints either
        consider global variables that are independent of time-step or that the relevant time-steps
        are indexed within the constraint formulation.
        """
        constraints = super().constraints(ensemble_member)

        constraints.extend(self.__pipe_topology_constraints(ensemble_member))
        constraints.extend(self.__gas_pipe_topology_constraints(ensemble_member))
        constraints.extend(self.__electricity_cable_topology_constraints(ensemble_member))
        constraints.extend(self.__max_size_constraints(ensemble_member))

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

    def __pipe_class_to_results(self):
        """
        This functions writes all resulting pipe class results to a dict.
        """
        for ensemble_member in range(self.ensemble_size):
            results = self.extract_results(ensemble_member)

            for pipe in self.energy_system_components.get("heat_pipe", []):
                pipe_classes = self.pipe_classes(pipe)

                if not pipe_classes:
                    continue
                elif len(pipe_classes) == 1:
                    pipe_class = pipe_classes[0]
                else:
                    pipe_class = next(
                        c
                        for c, s in self._heat_pipe_topo_pipe_class_map[pipe].items()
                        if round(results[s][0]) == 1.0
                    )

                for p in [pipe, self.hot_to_cold_pipe(pipe)]:
                    self.__heat_pipe_topo_pipe_class_result[p] = pipe_class

    def _pipe_heat_loss_to_parameters(self):
        """
        This function is used to set the optimized milp losses in the parameters object.
        """
        options = self.energy_system_options()

        for ensemble_member in range(self.ensemble_size):
            parameters = self.parameters(ensemble_member)

            h = self.__heat_pipe_topo_heat_loss_parameters[ensemble_member]
            for pipe in self._pipe_heat_losses:
                pipe_class = self.get_optimized_pipe_class(pipe)

                h[f"{pipe}.Heat_loss"] = pipe_heat_loss(
                    self, options, parameters, pipe, pipe_class.u_values
                )

    def __pipe_diameter_to_parameters(self):
        """
        This function is used to update the parameters object with the results of the pipe class
        optimization
        """
        for ensemble_member in range(self.ensemble_size):
            d = self.__heat_pipe_topo_diameter_area_parameters[ensemble_member]
            for pipe in self._heat_pipe_topo_pipe_class_map:
                pipe_class = self.get_optimized_pipe_class(pipe)

                for p in [pipe, self.hot_to_cold_pipe(pipe)]:
                    d[f"{p}.diameter"] = pipe_class.inner_diameter
                    d[f"{p}.area"] = pipe_class.area

    def priority_completed(self, priority):
        """
        This function is called after a priority of goals is completed. This function is used to
        specify operations between consecutive goals. Here we set some parameter attributes after
        the optimization is completed.
        """

        self.__pipe_class_to_results()

        # The head loss mixin wants to do some check for the head loss
        # minimization priority that involves the diameter/area. We assume
        # that we're sort of done minimizing/choosing the pipe diameter, and
        # that we can set the parameters to the optimized values.
        if (
            self.heat_network_settings["minimize_head_losses"]
            and self.heat_network_settings["head_loss_option"] != HeadLossOption.NO_HEADLOSS
            and priority == self._hn_head_loss_class._hn_minimization_goal_class.priority
        ):
            self.__pipe_diameter_to_parameters()

        super().priority_completed(priority)

    def post(self):
        super().post()

        self.__pipe_class_to_results()
        self.__pipe_diameter_to_parameters()
        self._pipe_heat_loss_to_parameters()
