import datetime
import json
import logging
import math
import numbers
import os
import sys
import traceback
import uuid
from collections import OrderedDict
from pathlib import Path
from typing import Dict, Union

import esdl
from esdl.profiles.influxdbprofilemanager import ConnectionSettings
from esdl.profiles.influxdbprofilemanager import InfluxDBProfileManager
from esdl.profiles.profilemanager import ProfileManager

import mesido.esdl.esdl_parser
from mesido.constants import GRAVITATIONAL_CONSTANT
from mesido.esdl.edr_pipe_class import EDRPipeClass
from mesido.network_common import NetworkSettings
from mesido.post_processing.post_processing_utils import pipe_pressure, pipe_velocity
from mesido.workflows.utils.helpers import _sort_numbered

import numpy as np

import pandas as pd

from rtctools._internal.alias_tools import AliasDict
from rtctools.optimization.timeseries import Timeseries

logger = logging.getLogger("mesido")


class ScenarioOutput:
    __optimized_energy_system_handler = None

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        self.model_folder = kwargs.get("model_folder")
        self.output_folder = kwargs.get("output_folder")
        self.esdl_file_name = kwargs.get("esdl_file_name", "ESDL_file.esdl")
        # Settings for influxdb when writing out result profile data to it
        # Default settings
        self.write_result_db_profiles = False
        self.influxdb_username = None
        self.influxdb_password = None

        base_error_string = "Missing influxdb setting for writing result profile data:"
        try:
            self.write_result_db_profiles = kwargs["write_result_db_profiles"]

            if self.write_result_db_profiles not in [True, False]:
                logger.error(
                    "Current setting of write_result_db_profiles is: "
                    f"{self.write_result_db_profiles} and it should be set to True or False"
                )
                sys.exit(1)

            if self.write_result_db_profiles:
                try:
                    self.influxdb_host = kwargs["influxdb_host"]
                    if len(self.influxdb_host) == 0:
                        logger.error(
                            "Current setting of influxdb_host is an empty string and it should"
                            " be the name of the host"
                        )
                        sys.exit(1)
                except KeyError:
                    logger.error(f"{base_error_string} host")
                    sys.exit(1)
                try:
                    self.influxdb_port = kwargs["influxdb_port"]
                    if not isinstance(self.influxdb_port, int):
                        logger.error(
                            "Current setting of influxdb_port is: "
                            f"{self.influxdb_port} and it should be set to int value (port number)"
                        )
                        sys.exit(1)
                except KeyError:
                    logger.error(f"{base_error_string} port")
                    sys.exit(1)
                try:
                    self.influxdb_username = kwargs["influxdb_username"]
                except KeyError:
                    logger.error(f"{base_error_string} username")
                    sys.exit(1)
                try:
                    self.influxdb_password = kwargs["influxdb_password"]
                except KeyError:
                    logger.error(f"{base_error_string} password")
                    sys.exit(1)
                try:
                    self.influxdb_ssl = kwargs["influxdb_ssl"]
                    if self.influxdb_ssl not in [True, False]:
                        logger.error(
                            "Current setting of influxdb_ssl is: "
                            f"{self.influxdb_ssl} and it should be set to True or False"
                        )
                        sys.exit(1)
                except KeyError:
                    logger.error(f"{base_error_string} ssl")
                    sys.exit(1)
                try:
                    self.influxdb_verify_ssl = kwargs["influxdb_verify_ssl"]
                    if self.influxdb_verify_ssl not in [True, False]:
                        logger.error(
                            "Current setting of influxdb_verify_ssl is: "
                            f"{self.influxdb_verify_ssl} and it should be set to True or False"
                        )
                        sys.exit(1)
                except KeyError:
                    logger.error("f{base_string} verify_ssl")
                    sys.exit(1)
        except KeyError:
            # Not writing out to a influxdb, so no settings are requried
            pass

    def get_optimized_esh(self):
        return self.__optimized_energy_system_handler

    def _write_html_output(self, template_name="mpc_buffer_sizing_output"):
        from jinja2 import Environment, FileSystemLoader

        assert self.ensemble_size == 1

        results = self.extract_results()
        parameters = self.parameters(0)

        # Format the priority results
        priority_results = [
            dict(
                number=number,
                success=success,
                pretty_time=f"{int(seconds // 60):02d}:{seconds % 60:06.3f}",
                objective_value=objective_value,
                return_status=stats["return_status"],
                secondary_return_status=stats.get("secondary_return_status", ""),
            )
            for (
                number,
                seconds,
                success,
                objective_value,
                stats,
            ) in self._priorities_output
        ]

        # Format the buffer results
        results_buffers_placed = {}
        results_buffers_size = {}
        results_sources_placed = {}
        results_sources_size = {}
        results_max_charging_rate = {}
        results_max_discharging_rate = {}

        for buffer in _sort_numbered(self.energy_system_components.get("heat_buffer", [])):
            if buffer in self._minimize_size_buffers:
                max_size_var = self._max_buffer_heat_map[buffer]
                results_buffers_size[buffer] = float(results[max_size_var][0]) / (
                    parameters[f"{buffer}.cp"]
                    * parameters[f"{buffer}.rho"]
                    * (parameters[f"{buffer}.T_supply"] - parameters[f"{buffer}.T_return"])
                )
            else:
                results_buffers_size[buffer] = "-"

            if buffer in self._optional_buffers:
                buffer_placement_var = self._buffer_placement_map[buffer]
                results_buffers_placed[buffer] = np.round(results[buffer_placement_var][0]) == 1.0
            else:
                results_buffers_placed[buffer] = "-"

            (_, hot_orient), _ = self.energy_system_topology.buffers[buffer]
            q = hot_orient * results[f"{buffer}.HeatIn.Q"]
            inds_charging = q > 0
            inds_discharging = q < 0

            results_max_charging_rate[buffer] = max(q[inds_charging]) if any(inds_charging) else 0.0
            results_max_discharging_rate[buffer] = (
                max(-1 * q[inds_discharging]) if any(inds_discharging) else 0.0
            )

        buffer_results = [
            dict(
                name=buffer,
                tune_size=buffer in self._minimize_size_buffers,
                tune_placement=buffer in self._optional_buffers,
                maximum_size=self._override_buffer_size[buffer],
                result_placed=results_buffers_placed[buffer],
                result_size=results_buffers_size[buffer],
                max_charging_rate=results_max_charging_rate[buffer],
                max_discharging_rate=results_max_discharging_rate[buffer],
            )
            for buffer in self.energy_system_components.get("heat_buffer", [])
        ]

        for source in _sort_numbered(self.energy_system_components["heat_source"]):
            if source in self._minimize_size_sources:
                max_size_var = self._max_source_heat_map[source]
                results_sources_size[source] = float(results[max_size_var][0]) / 10.0**3
            else:
                results_sources_size[source] = "-"

            if source in self._optional_sources:
                source_placement_var = self._source_placement_map[source]
                results_sources_placed[source] = np.round(results[source_placement_var][0]) == 1.0
            else:
                results_sources_placed[source] = "-"

        source_results = [
            dict(
                name=source,
                tune_size=source in self._minimize_size_sources,
                tune_placement=source in self._optional_sources,
                maximum_size=self._override_max_power[source],
                result_placed=results_sources_placed[source],
                result_size=results_sources_size[source],
            )
            for source in self.energy_system_components["heat_source"]
        ]

        # Format the pipe results
        # Note that we do not distinguish between routing and sizing
        # internally, but for the sake of the output we do.
        pipe_results = []

        for p in _sort_numbered(self.hot_pipes):
            pipe_classes = self.pipe_classes(p)
            tune_routing = len([pc for pc in pipe_classes if pc.inner_diameter == 0.0]) == 1
            inner_diameter = parameters[f"{p}.diameter"]
            asset = next(a for a in self.esdl_assets.values() if a.name == p)
            esdl_diameter = asset.attributes["innerDiameter"]

            if len(pipe_classes) <= 1:
                tune_size = False
                min_dn_size = "-"
                max_dn_size = "-"
                result_placed = "-"
                result_dn_size = "-"
            elif len(pipe_classes) == 2 and tune_routing:
                tune_size = False
                min_dn_size = "-"
                max_dn_size = "-"
                result_placed = "Yes" if inner_diameter > 0 else "No"
                result_dn_size = "-"
            else:
                sorted_pipe_classes = sorted(
                    [pc for pc in pipe_classes if pc.inner_diameter > 0],
                    key=lambda pc: pc.inner_diameter,
                )

                tune_size = True
                min_dn_size = sorted_pipe_classes[0].name
                max_dn_size = sorted_pipe_classes[-1].name
                result_placed = "Yes" if inner_diameter > 0 else "No"
                result_pipe_class = self.get_optimized_pipe_class(p)
                result_dn_size = (
                    result_pipe_class.name if result_pipe_class is not None else inner_diameter
                )

            pipe_results.append(
                dict(
                    name=p,
                    tune_size=tune_size,
                    tune_routing=tune_routing,
                    esdl_diameter=esdl_diameter,
                    min_dn_size=min_dn_size,
                    max_dn_size=max_dn_size,
                    result_placed=result_placed,
                    result_dn_size=result_dn_size,
                )
            )

        input_csv_tables = {
            os.path.basename(x): pd.read_csv(x).to_dict("records")
            for x in self._csv_input_parameter_files
        }

        # Actually write out the html file based on the template
        templates_dir = Path(__file__).parent / "templates"

        env = Environment(loader=FileSystemLoader(templates_dir))
        template = env.get_template(template_name + ".html")

        os.makedirs(self._html_output_dir, exist_ok=True)

        filename = self._html_output_dir / (template_name + ".html")

        with open(filename, "w", encoding="utf-8") as fh:
            fh.write(
                template.render(
                    buffer_results=buffer_results,
                    source_results=source_results,
                    pipe_results=pipe_results,
                    priority_results=priority_results,
                    input_csv_tables=input_csv_tables,
                )
            )

    def _add_kpis_to_energy_system(self, energy_system, optimizer_sim: bool = False):

        results = self.extract_results()
        parameters = self.parameters(0)

        # ------------------------------------------------------------------------------------------
        # KPIs
        # General cost breakdowns
        # ------------------------------------------------------------------------------------------
        kpis_top_level = esdl.KPIs(id=str(uuid.uuid4()))
        heat_source_energy_wh = {}
        asset_opex_breakdown = {}  # yearly cost
        tot_variable_opex_cost_euro = 0.0  # yearly cost
        tot_fixed_opex_cost_euro = 0.0  # yearly cost

        # cost over the total time horizon (number of year) being optimized:
        #   - parameters["number_of_years"]
        #   - these kpis are not created for the newtwork simualtor->optimizer_sim
        asset_timehorizon_opex_breakdown = {}
        tot_timehorizon_variable_opex_cost_euro = 0.0
        tot_timehorizon_fixed_opex_cost_euro = 0.0
        asset_timehorizon_capex_breakdown = {}
        tot_timehorizon_install_cost_euro = 0.0
        tot_timehorizon_invest_cost_euro = 0.0

        # Specify the correct time horizon:
        # Optimization=number of year: since it is taken into account in TCO minimization
        # Simulator=1: since 30 years of optimization is not applicable for the network simulator
        if not optimizer_sim:  # optimization mode
            optim_time_horizon = parameters["number_of_years"]
        elif optimizer_sim:  # network simulator mode
            optim_time_horizon = 1.0
        else:
            logger.error("Variable optimizer_sim has not been set")

        for _key, asset in self.esdl_assets.items():
            asset_placement_var = self._asset_aggregation_count_var_map[asset.name]
            placed = np.round(results[asset_placement_var][0]) >= 1.0

            if np.isnan(parameters[f"{asset.name}.technical_life"]) or np.isclose(
                parameters[f"{asset.name}.technical_life"], 0.0
            ):
                capex_factor = 1.0
            else:
                capex_factor = math.ceil(
                    optim_time_horizon / parameters[f"{asset.name}.technical_life"]
                )

            if placed:
                try:
                    asset_timehorizon_capex_breakdown[asset.asset_type] += (
                        results[f"{asset.name}__installation_cost"][0]
                        + results[f"{asset.name}__investment_cost"][0]
                    ) * capex_factor
                    tot_timehorizon_install_cost_euro += (
                        results[f"{asset.name}__installation_cost"][0]
                    ) * capex_factor
                    tot_timehorizon_invest_cost_euro += (
                        results[f"{asset.name}__investment_cost"][0]
                    ) * capex_factor

                    if (
                        results[f"{asset.name}__variable_operational_cost"][0] > 0.0
                        or results[f"{asset.name}__fixed_operational_cost"][0] > 0.0
                    ):
                        asset_opex_breakdown[asset.asset_type] += (
                            results[f"{asset.name}__variable_operational_cost"][0]
                            + results[f"{asset.name}__fixed_operational_cost"][0]
                        )
                        asset_timehorizon_opex_breakdown[asset.asset_type] += (
                            results[f"{asset.name}__variable_operational_cost"][0]
                            + results[f"{asset.name}__fixed_operational_cost"][0]
                        ) * optim_time_horizon

                        tot_variable_opex_cost_euro += results[
                            f"{asset.name}__variable_operational_cost"
                        ][0]
                        tot_fixed_opex_cost_euro += results[
                            f"{asset.name}__fixed_operational_cost"
                        ][0]
                        tot_timehorizon_variable_opex_cost_euro += (
                            results[f"{asset.name}__variable_operational_cost"][0]
                            * optim_time_horizon
                        )
                        tot_timehorizon_fixed_opex_cost_euro += (
                            results[f"{asset.name}__fixed_operational_cost"][0] * optim_time_horizon
                        )

                except KeyError:
                    try:
                        asset_timehorizon_capex_breakdown[asset.asset_type] = (
                            results[f"{asset.name}__installation_cost"][0]
                            + results[f"{asset.name}__investment_cost"][0]
                        ) * capex_factor
                        tot_timehorizon_install_cost_euro += (
                            results[f"{asset.name}__installation_cost"][0]
                        ) * capex_factor
                        tot_timehorizon_invest_cost_euro += (
                            results[f"{asset.name}__investment_cost"][0]
                        ) * capex_factor

                        if (
                            results[f"{asset.name}__variable_operational_cost"][0] > 0.0
                            or results[f"{asset.name}__fixed_operational_cost"][0] > 0.0
                        ):
                            asset_opex_breakdown[asset.asset_type] = (
                                results[f"{asset.name}__variable_operational_cost"][0]
                                + results[f"{asset.name}__fixed_operational_cost"][0]
                            )
                            asset_timehorizon_opex_breakdown[asset.asset_type] = (
                                asset_opex_breakdown[asset.asset_type] * optim_time_horizon
                            )

                            tot_variable_opex_cost_euro += results[
                                f"{asset.name}__variable_operational_cost"
                            ][0]
                            tot_fixed_opex_cost_euro += results[
                                f"{asset.name}__fixed_operational_cost"
                            ][0]
                            tot_timehorizon_variable_opex_cost_euro += (
                                results[f"{asset.name}__variable_operational_cost"][0]
                                * optim_time_horizon
                            )
                            tot_timehorizon_fixed_opex_cost_euro += (
                                results[f"{asset.name}__fixed_operational_cost"][0]
                                * optim_time_horizon
                            )

                    except KeyError:
                        # Do not add any costs. Items like joint
                        pass

                # TODO: show discharge energy (current display) and charge energy
                # (new display to be added for ATES etc)
                if (
                    asset.asset_type == "HeatProducer"
                    or asset.asset_type == "GenericProducer"
                    or asset.asset_type == "ResidualHeatSource"
                    or asset.asset_type == "GeothermalSource"
                    or asset.asset_type == "ResidualHeatSource"
                    or asset.asset_type == "GasHeater"
                ):
                    heat_source_energy_wh[asset.name] = np.sum(
                        results[f"{asset.name}.Heat_source"][1:]
                        * (self.times()[1:] - self.times()[0:-1])
                        / 3600
                    )
                # TODO: ATES, HEAT pump show Secondary_heat and Primary_heat and tank storage
                # elif ATES:
                #  summed_charge = np.sum(np.clip(heat_ates, 0.0, np.inf))
                #  summed_discharge = np.abs(np.sum(np.clip(heat_ates, -np.inf, 0.0)))
                # elif Heat pump
                # elif asset.asset_type == "HeatStorage":  # Heat discharged
                #     heat_source_energy_wh[asset.name] = np.sum(
                #         np.clip(results[f"{asset.name}.Heat_buffer"][1:], -np.inf, 0.0)
                #         * (self.times()[1:] - self.times()[0:-1])
                #         / 3600
                #     )

        kpis_top_level.kpi.append(
            esdl.DistributionKPI(
                name="High level cost breakdown [EUR] (yearly averaged)",
                distribution=esdl.StringLabelDistribution(
                    stringItem=[
                        esdl.StringItem(
                            label="CAPEX",
                            value=(
                                tot_timehorizon_install_cost_euro + tot_timehorizon_invest_cost_euro
                            )
                            / optim_time_horizon,
                        ),
                        esdl.StringItem(
                            label="OPEX",
                            value=tot_variable_opex_cost_euro + tot_fixed_opex_cost_euro,
                        ),
                    ]
                ),
                quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                    physicalQuantity=esdl.PhysicalQuantityEnum.COST, unit=esdl.UnitEnum.EURO
                ),
            )
        )

        if not optimizer_sim:
            kpis_top_level.kpi.append(
                esdl.DistributionKPI(
                    name=f"High level cost breakdown [EUR] ({optim_time_horizon} year period)",
                    distribution=esdl.StringLabelDistribution(
                        stringItem=[
                            esdl.StringItem(
                                label="CAPEX",
                                value=tot_timehorizon_install_cost_euro
                                + tot_timehorizon_invest_cost_euro,
                            ),
                            esdl.StringItem(
                                label="OPEX",
                                value=(
                                    tot_timehorizon_variable_opex_cost_euro
                                    + tot_timehorizon_fixed_opex_cost_euro
                                ),
                            ),
                        ]
                    ),
                    quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                        physicalQuantity=esdl.PhysicalQuantityEnum.COST, unit=esdl.UnitEnum.EURO
                    ),
                )
            )

        kpis_top_level.kpi.append(
            esdl.DistributionKPI(
                name="Overall cost breakdown [EUR] (yearly averaged)",
                distribution=esdl.StringLabelDistribution(
                    stringItem=[
                        esdl.StringItem(
                            label="Installation",
                            value=(tot_timehorizon_install_cost_euro / optim_time_horizon),
                        ),
                        esdl.StringItem(
                            label="Investment",
                            value=(tot_timehorizon_invest_cost_euro / optim_time_horizon),
                        ),
                        esdl.StringItem(label="Variable OPEX", value=tot_variable_opex_cost_euro),
                        esdl.StringItem(label="Fixed OPEX", value=tot_fixed_opex_cost_euro),
                    ]
                ),
                quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                    physicalQuantity=esdl.PhysicalQuantityEnum.COST, unit=esdl.UnitEnum.EURO
                ),
            )
        )
        if not optimizer_sim:
            kpis_top_level.kpi.append(
                esdl.DistributionKPI(
                    name=f"Overall cost breakdown [EUR] ({optim_time_horizon} year period)",
                    distribution=esdl.StringLabelDistribution(
                        stringItem=[
                            esdl.StringItem(
                                label="Installation", value=tot_timehorizon_install_cost_euro
                            ),
                            esdl.StringItem(
                                label="Investment", value=tot_timehorizon_invest_cost_euro
                            ),
                            esdl.StringItem(
                                label="Variable OPEX",
                                value=tot_timehorizon_variable_opex_cost_euro,
                            ),
                            esdl.StringItem(
                                label="Fixed OPEX",
                                value=tot_timehorizon_fixed_opex_cost_euro,
                            ),
                        ]
                    ),
                    quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                        physicalQuantity=esdl.PhysicalQuantityEnum.COST, unit=esdl.UnitEnum.EURO
                    ),
                )
            )

            kpis_top_level.kpi.append(
                esdl.DistributionKPI(
                    name=f"CAPEX breakdown [EUR] ({optim_time_horizon} year period)",
                    distribution=esdl.StringLabelDistribution(
                        stringItem=[
                            esdl.StringItem(label=key, value=value)
                            for key, value in asset_timehorizon_capex_breakdown.items()
                        ]
                    ),
                    quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                        physicalQuantity=esdl.PhysicalQuantityEnum.COST, unit=esdl.UnitEnum.EURO
                    ),
                )
            )

        kpis_top_level.kpi.append(
            esdl.DistributionKPI(
                name="OPEX breakdown [EUR] (yearly averaged)",
                distribution=esdl.StringLabelDistribution(
                    stringItem=[
                        esdl.StringItem(label=key, value=value)
                        for key, value in asset_opex_breakdown.items()
                    ]
                ),
                quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                    physicalQuantity=esdl.PhysicalQuantityEnum.COST, unit=esdl.UnitEnum.EURO
                ),
            )
        )
        if not optimizer_sim:
            kpis_top_level.kpi.append(
                esdl.DistributionKPI(
                    name=f"OPEX breakdown [EUR] ({optim_time_horizon} year period)",
                    distribution=esdl.StringLabelDistribution(
                        stringItem=[
                            esdl.StringItem(label=key, value=value)
                            for key, value in asset_timehorizon_opex_breakdown.items()
                        ]
                    ),
                    quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                        physicalQuantity=esdl.PhysicalQuantityEnum.COST, unit=esdl.UnitEnum.EURO
                    ),
                )
            )

        kpis_top_level.kpi.append(
            esdl.DistributionKPI(
                name="Energy production [Wh] (yearly averaged)",
                distribution=esdl.StringLabelDistribution(
                    stringItem=[
                        esdl.StringItem(label=key, value=value)
                        for key, value in heat_source_energy_wh.items()
                    ]
                ),
                quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                    physicalQuantity=esdl.PhysicalQuantityEnum.ENERGY, unit=esdl.UnitEnum.WATTHOUR
                ),
            )
        )
        energy_system.instance[0].area.KPIs = kpis_top_level
        # ------------------------------------------------------------------------------------------
        # Cost breakdowns per polygon areas (can consist of several assets of differents types)
        # Notes:
        # - OPEX KPIs are taken into account for energy sources only.
        # - We assume that all energy produced outside of the the subarea comes in via a milp
        #   exchanger that is part of the subarea.
        # TODO: Investigate if no cost in the ESDL then this breaks ESDL visibility
        total_energy_produced_locally_wh = {}
        total_energy_consumed_locally_wh = {}
        estimated_energy_from_local_source_perc = {}
        estimated_energy_from_regional_source_perc = {}

        for subarea in energy_system.instance[0].area.area:
            area_investment_cost = 0.0
            area_installation_cost = 0.0
            area_variable_opex_cost = 0.0
            area_fixed_opex_cost = 0.0

            kpis = esdl.KPIs(id=str(uuid.uuid4()))
            # Here we make a breakdown of the produced energy in the subarea. Where we assume that
            # all energy produced outside of the the subarea comes in via a milp exchanger that is
            # part of the subarea.
            energy_breakdown = {}
            for asset in subarea.asset:
                asset_name = asset.name
                asset_type = self.get_asset_from_asset_name(asset_name).asset_type

                asset_placement_var = self._asset_aggregation_count_var_map[asset.name]
                placed = np.round(results[asset_placement_var][0]) >= 1.0

                if placed:
                    if asset_type == "Joint":
                        continue
                    try:
                        energy_breakdown[asset_type] += np.sum(results[f"{asset_name}.Heat_source"])
                    except KeyError:
                        try:
                            energy_breakdown[asset_type] = np.sum(
                                results[f"{asset_name}.Heat_source"]
                            )
                        except KeyError:
                            try:
                                energy_breakdown[asset_type] += np.sum(
                                    results[f"{asset_name}.Secondary_heat"]
                                )
                            except KeyError:
                                try:
                                    energy_breakdown[asset_type] = np.sum(
                                        results[f"{asset_name}.Secondary_heat"]
                                    )
                                except KeyError:
                                    pass

                    # Create KPIs by using applicable costs for the specific asset
                    area_investment_cost += results[self._asset_investment_cost_map[asset_name]][0]
                    area_installation_cost += results[
                        self._asset_installation_cost_map[asset_name]
                    ][0]
                    area_variable_opex_cost += results[
                        self._asset_variable_operational_cost_map[asset_name]
                    ][0]
                    area_fixed_opex_cost += results[
                        self._asset_fixed_operational_cost_map[asset_name]
                    ][0]

                    # Calculate the total energy [Wh] consumed/produced in an are.
                    # Note: milp losses of buffers, ATES' and pipes are included in the area energy
                    # consumption
                    if asset_name in self.energy_system_components.get("heat_source", []):
                        try:
                            total_energy_produced_locally_wh[subarea.name] += np.sum(
                                results[f"{asset_name}.Heat_source"][1:]
                                * (self.times()[1:] - self.times()[0:-1])
                                / 3600.0
                            )
                        except KeyError:
                            total_energy_produced_locally_wh[subarea.name] = np.sum(
                                results[f"{asset_name}.Heat_source"][1:]
                                * (self.times()[1:] - self.times()[0:-1])
                                / 3600.0
                            )
                    if asset_name in self.energy_system_components.get("heat_demand", []):
                        flow_variable = results[f"{asset_name}.Heat_demand"][1:]
                    elif asset_name in self.energy_system_components.get("heat_buffer", []):
                        flow_variable = results[f"{asset_name}.Heat_buffer"][1:]
                    elif asset_name in self.energy_system_components.get("ates", []):
                        flow_variable = results[f"{asset_name}.Heat_ates"][1:]
                    elif asset_name in self.energy_system_components.get("heat_pipe", []):
                        flow_variable = (
                            np.ones(len(self.times())) * results[f"{asset_name}__hn_heat_loss"]
                        )
                    else:
                        flow_variable = ""
                    if (
                        asset_name in self.energy_system_components.get("heat_demand", [])
                        or asset_name in self.energy_system_components.get("heat_buffer", [])
                        or asset_name in self.energy_system_components.get("ates", [])
                        or asset_name in self.energy_system_components.get("heat_pipe", [])
                    ):
                        try:
                            total_energy_consumed_locally_wh[subarea.name] += np.sum(
                                flow_variable * (self.times()[1:] - self.times()[0:-1]) / 3600.0
                            )
                        except KeyError:
                            total_energy_consumed_locally_wh[subarea.name] = np.sum(
                                flow_variable * (self.times()[1:] - self.times()[0:-1]) / 3600.0
                            )
                    # end Calculate the total energy consumed/produced in an area
                # end if placed loop
            # end asset loop

            # Calculate the estimated energy source [%] for an area
            try:
                if not np.isnan(total_energy_produced_locally_wh[subarea.name]):
                    total_energy_produced_locally_wh_area = total_energy_produced_locally_wh[
                        subarea.name
                    ]
                else:
                    total_energy_produced_locally_wh_area = 0.0
            except KeyError:
                total_energy_produced_locally_wh_area = 0.0

            try:
                if not np.isnan(total_energy_consumed_locally_wh[subarea.name]) and np.isclose(
                    total_energy_consumed_locally_wh[subarea.name], 0.0
                ):
                    estimated_energy_from_local_source_perc[subarea.name] = min(
                        total_energy_produced_locally_wh_area
                        / total_energy_consumed_locally_wh[subarea.name]
                        * 100.0,
                        100.0,
                    )
                    estimated_energy_from_regional_source_perc[subarea.name] = min(
                        (100.0 - estimated_energy_from_local_source_perc[subarea.name]), 100.0
                    )
                else:
                    estimated_energy_from_local_source_perc[subarea.name] = 0.0
                    estimated_energy_from_regional_source_perc[subarea.name] = 0.0
                    logger.warning(
                        f"KPI estimated energy from local & regional source have been set to 0.0"
                        f" in area {subarea.name}. Reason: area local energy"
                        f" consumption value is: {total_energy_consumed_locally_wh[subarea.name]}"
                    )
            except KeyError:
                # Nothing to do, go on to next section of code
                pass

            # Here we add KPIs to the polygon area which allows to visualize them by hovering over
            # it with the mouse
            # Only update kpis if one of the costs > 0, else esdl file will be corrupted
            # TODO: discuss strange behaviour with Edwin - temporarily use of "True" in line below
            if area_investment_cost > 0.0 or area_installation_cost > 0.0 or True:
                kpis.kpi.append(
                    esdl.DoubleKPI(
                        value=area_investment_cost / 1.0e6,
                        name="Investment",
                        quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                            physicalQuantity=esdl.PhysicalQuantityEnum.COST,
                            unit=esdl.UnitEnum.EURO,
                            multiplier=esdl.MultiplierEnum.MEGA,
                        ),
                    )
                )
                kpis.kpi.append(
                    esdl.DoubleKPI(
                        value=area_installation_cost / 1.0e6,
                        name="Installation",
                        quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                            physicalQuantity=esdl.PhysicalQuantityEnum.COST,
                            unit=esdl.UnitEnum.EURO,
                            multiplier=esdl.MultiplierEnum.MEGA,
                        ),
                    )
                )
            # Only update kpis if one of the costs > 0, else esdl file will be corrupted
            # TODO: discuss strange behaviour with Edwin - temporarily use of "True" in line below
            if area_variable_opex_cost > 0.0 or area_fixed_opex_cost > 0.0 or True:
                kpis.kpi.append(
                    esdl.DoubleKPI(
                        value=area_variable_opex_cost / 1.0e6,
                        name="Variable OPEX (year 1)",
                        quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                            physicalQuantity=esdl.PhysicalQuantityEnum.COST,
                            unit=esdl.UnitEnum.EURO,
                            multiplier=esdl.MultiplierEnum.MEGA,
                        ),
                    )
                )
                kpis.kpi.append(
                    esdl.DoubleKPI(
                        value=area_fixed_opex_cost / 1.0e6,
                        name="Fixed OPEX (year 1)",
                        quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                            physicalQuantity=esdl.PhysicalQuantityEnum.COST,
                            unit=esdl.UnitEnum.EURO,
                            multiplier=esdl.MultiplierEnum.MEGA,
                        ),
                    )
                )

            try:
                if total_energy_consumed_locally_wh[subarea.name] >= 0.0:
                    kpis.kpi.append(
                        esdl.DoubleKPI(
                            value=round(estimated_energy_from_local_source_perc[subarea.name], 1),
                            name="Estimated energy from local source(s) [%]",
                            quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                                unit=esdl.UnitEnum.PERCENT,
                                multiplier=esdl.MultiplierEnum.NONE,
                            ),
                        )
                    )
                    kpis.kpi.append(
                        esdl.DoubleKPI(
                            value=round(
                                estimated_energy_from_regional_source_perc[subarea.name], 1
                            ),
                            name="Estimated energy from regional source(s) [%]",
                            quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                                unit=esdl.UnitEnum.PERCENT,
                                multiplier=esdl.MultiplierEnum.NONE,
                            ),
                        )
                    )
                    kpis.kpi.append(
                        esdl.DoubleKPI(
                            value=round(total_energy_consumed_locally_wh[subarea.name] / 1.0e9, 1),
                            name="Total energy consumed [GWh]",
                            quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                                physicalQuantity=esdl.PhysicalQuantityEnum.ENERGY,
                                unit=esdl.UnitEnum.WATTHOUR,
                                multiplier=esdl.MultiplierEnum.GIGA,
                            ),
                        )
                    )
            except KeyError:
                # Do nothing because this area does not have any energy consumption
                pass

            # Create plots in the dashboard
            # Top level KPIs: Cost breakdown in a polygon area (for all assest grouped together)
            kpi_name = f"{subarea.name}: Asset cost breakdown [EUR]"
            if (area_installation_cost > 0.0 or area_investment_cost > 0.0) and (
                area_variable_opex_cost > 0.0 or area_fixed_opex_cost > 0.0
            ):
                polygon_area_string_item = [
                    esdl.StringItem(label="Installation", value=area_installation_cost),
                    esdl.StringItem(label="Investment", value=area_investment_cost),
                    esdl.StringItem(label="Variable OPEX", value=area_variable_opex_cost),
                    esdl.StringItem(label="Fixed OPEX", value=area_fixed_opex_cost),
                ]
            elif area_installation_cost > 0.0 or area_investment_cost > 0.0:
                polygon_area_string_item = [
                    esdl.StringItem(label="Installation", value=area_installation_cost),
                    esdl.StringItem(label="Investment", value=area_investment_cost),
                ]
            elif area_variable_opex_cost > 0.0 or area_fixed_opex_cost > 0.0:
                polygon_area_string_item = [
                    esdl.StringItem(label="Variable OPEX", value=area_variable_opex_cost),
                    esdl.StringItem(label="Fixed OPEX", value=area_fixed_opex_cost),
                ]
            if (
                area_installation_cost > 0.0
                or area_investment_cost > 0.0
                or area_variable_opex_cost > 0.0
                or area_fixed_opex_cost > 0.0
            ):
                kpis_top_level.kpi.append(
                    esdl.DistributionKPI(
                        name=kpi_name,
                        distribution=esdl.StringLabelDistribution(
                            stringItem=polygon_area_string_item
                        ),
                        quantityAndUnit=esdl.esdl.QuantityAndUnitType(
                            physicalQuantity=esdl.PhysicalQuantityEnum.COST, unit=esdl.UnitEnum.EURO
                        ),
                    )
                )

            # Here we add a distribution KPI to the subarea to which gives a piechart
            # !!!!!!!!!!!!!!! This will only work if the source is in the area?
            # TODO: Still to be resolved since piecharts are still a work in progress in mapeditor
            # kpis.kpi.append(
            #     esdl.DistributionKPI(
            #         name="Energy breakdown ?",
            #         distribution=esdl.StringLabelDistribution(
            #             stringItem=[
            #                 esdl.StringItem(label=key, value=value) for key,
            #                 value in energy_breakdown.items()
            #             ]
            #         )
            #     )
            # )
            subarea.KPIs = kpis
        # ebd sub-area loop

        # end KPIs

    def _write_updated_esdl(
        self,
        energy_system,
        optimizer_sim: bool = False,
        add_kpis: bool = True,
    ):
        from esdl.esdl_handler import EnergySystemHandler

        results = self.extract_results()
        parameters = self.parameters(0)

        _ = energy_system.id  # input energy system id. Kept here as not sure if still needed
        energy_system.id = str(uuid.uuid4())  # output energy system id
        output_energy_system_id = energy_system.id
        # Currently the simulation_id is created here, but in the future this will probably move
        # to account for 1 simulation/optimization/run potentialy generating more than 1 output
        # energy system (ESDL)
        simulation_id = str(uuid.uuid4())  # simulation (optimization/simulator etc) id

        if optimizer_sim:  # network simulator
            energy_system.name = energy_system.name + "_Simulation"
        else:  # network optimization
            energy_system.name = energy_system.name + "_GrowOptimized"

        def _name_to_asset(name):
            return next(
                (x for x in energy_system.eAllContents() if hasattr(x, "name") and x.name == name)
            )

        if add_kpis:
            self._add_kpis_to_energy_system(energy_system, optimizer_sim)

        # ------------------------------------------------------------------------------------------
        # Placement
        heat_pipes = set(self.energy_system_components.get("heat_pipe", []))
        for _, attributes in self.esdl_assets.items():
            name = attributes.name
            if name in [
                *self.energy_system_components.get("heat_source", []),
                *self.energy_system_components.get("ates", []),
                *self.energy_system_components.get("heat_buffer", []),
                *self.energy_system_components.get("heat_pump", []),
            ]:
                asset = _name_to_asset(name)
                asset_placement_var = self._asset_aggregation_count_var_map[name]
                placed = np.round(results[asset_placement_var][0]) >= 1.0
                max_size = results[self._asset_max_size_map[name]][0]

                if asset.name in self.energy_system_components.get("ates", []):
                    asset.maxChargeRate = results[f"{name}__max_size"][0]
                    asset.maxDischargeRate = results[f"{name}__max_size"][0]
                elif asset.name in self.energy_system_components.get("heat_buffer", []):
                    asset.capacity = max_size
                    asset.volume = max_size / (
                        parameters[f"{name}.cp"]
                        * parameters[f"{name}.rho"]
                        * parameters[f"{name}.dT"]
                    )
                elif asset.name in self.energy_system_components.get("heat_pump", []):
                    # Note: The heat capacity and not the electrical capacity
                    # TODO: in the future we need to cater for varying COP as well
                    asset.power = results[f"{name}__max_size"][0]
                else:
                    asset.power = max_size
                if not placed:
                    asset.delete(recursive=True)
                else:
                    asset.state = esdl.AssetStateEnum.ENABLED
            elif name not in heat_pipes:  # because heat pipes are updated below
                logger.warning(f"ESDL update: asset {name} has not been updated")

        # Pipes:
        edr_pipe_properties_to_copy = ["innerDiameter", "outerDiameter", "diameter", "material"]

        esh_edr = EnergySystemHandler()

        for pipe in self.energy_system_components.get("heat_pipe", []):

            pipe_classes = self.pipe_classes(pipe)
            # When a pipe has not been optimized, enforce pipe to be shown in the simulator
            # ESDL.
            if not pipe_classes:
                if not optimizer_sim:
                    continue
                else:
                    asset.state = esdl.AssetStateEnum.ENABLED

            if not optimizer_sim:
                pipe_class = self.get_optimized_pipe_class(pipe)

            if parameters[f"{pipe}.diameter"] != 0.0 or any(np.abs(results[f"{pipe}.Q"]) > 1.0e-9):
                # if not isinstance(pipe_class, EDRPipeClass):
                #     assert pipe_class.name == f"{pipe}_orig"
                #     continue
                # print(results[f"{pipe}.Q"])
                # print(pipe + " has pipeclass: " + pipe_class.name )
                # print(pipe + f" has diameter: " + pipe_class.name)

                if not optimizer_sim:
                    assert isinstance(pipe_class, EDRPipeClass)
                    asset_edr = esh_edr.load_from_string(pipe_class.xml_string)

                asset = _name_to_asset(pipe)
                asset.state = esdl.AssetStateEnum.ENABLED

                try:
                    asset.costInformation.investmentCosts.value = pipe_class.investment_costs
                except AttributeError:
                    pass
                    # do nothing, in the case that no costs have been specified for the return
                    # pipe in the mapeditor
                except UnboundLocalError:
                    pass

                if not optimizer_sim:
                    for prop in edr_pipe_properties_to_copy:
                        setattr(asset, prop, getattr(asset_edr, prop))
            else:
                asset = _name_to_asset(pipe)
                asset.delete(recursive=True)

        # ------------------------------------------------------------------------------------------
        # Important: This code below must be placed after the "Placement" code. Reason: it relies
        # on unplaced assets being deleted.
        # ------------------------------------------------------------------------------------------
        # Write asset result profile data to database. The database is setup as follows:
        #   - The each time step is represented by a row of data, with columns; datetime, field
        #     values
        #   - The database contains columns based on the carrier connected for visualisation
        #   purposes
        #   - Assets with more than 1 carrier are looped over the time steps as many times as there
        #   are different carriers connected, to ensure the correct data is written to each carrier.
        #   - Database name: input esdl id
        #   - Measurment: carrier id
        #   - Fields: profile value for the specific variable
        #   - Tags used as filters: simulationRun, assetClass, assetName, assetId, capability

        if self.write_result_db_profiles:
            logger.info("Writing asset result profile data to influxDB")
            results = self.extract_results()

            influxdb_conn_settings = ConnectionSettings(
                host=self.influxdb_host,
                port=self.influxdb_port,
                username=self.influxdb_username,
                password=self.influxdb_password,
                database=output_energy_system_id,
                ssl=self.influxdb_ssl,
                verify_ssl=self.influxdb_verify_ssl,
            )

            capabilities = [
                esdl.Transport,
                esdl.Conversion,
                esdl.Consumer,
                esdl.Producer,
                esdl.Storage,
            ]

            for asset_name in [
                *self.energy_system_components.get("heat_source", []),
                *self.energy_system_components.get("heat_demand", []),
                *self.energy_system_components.get("heat_pipe", []),
                *self.energy_system_components.get("heat_buffer", []),
                *self.energy_system_components.get("ates", []),
                *self.energy_system_components.get("heat_exchanger", []),
                *self.energy_system_components.get("heat_pump", []),
            ]:
                try:
                    # If the asset has been placed
                    asset = _name_to_asset(asset_name)
                    asset_class = asset.__class__.__name__
                    asset_id = asset.id
                    capability = [c for c in capabilities if c in asset.__class__.__mro__][
                        0
                    ].__name__

                    # Generate three empty variables,
                    # For transport and consumer assets, 'port' is filled with the inport
                    # For producer assets, 'port' is filled with outport as this is linked to the
                    # same carrier as the inport of consumers (thus all info in one carrier)
                    # For conversion assets, the primary side is acting like a consumer, the
                    # secondary side as a producer, thus a similar port structure is assumed, but
                    # now port_prim and port_sec variable are set, such that data can be saved for
                    # both carriers.
                    port, port_prim, port_sec = 3 * [None]
                    if isinstance(asset, esdl.Transport) or isinstance(asset, esdl.Consumer):
                        port = [port for port in asset.port if isinstance(port, esdl.InPort)][0]
                    elif isinstance(asset, esdl.Producer):
                        port = [port for port in asset.port if isinstance(port, esdl.OutPort)][0]
                    elif isinstance(asset, esdl.Conversion):
                        port_prim = [
                            port
                            for port in asset.port
                            if isinstance(port, esdl.InPort) and "Prim" in port.name
                        ][0]
                        port_sec = [
                            port
                            for port in asset.port
                            if isinstance(port, esdl.OutPort) and "Sec" in port.name
                        ][0]
                    else:
                        NotImplementedError(
                            f"influxdb not included for assets of type {type(asset)}"
                        )

                    # Note: when adding new variables to variables_one_hydraulic_system or"
                    # variables_two_hydraulic_system also add quantity and units to the ESDL for
                    # the new variables in the code lower down
                    # These variables exist for all the assets. Variables that only exist for
                    # specific
                    # assets are only added later, like Pump_power
                    commodity = self.energy_system_components_commodity.get(asset_name)

                    variables_one_hydraulic_system = [f"{commodity}In.Q"]
                    variables_two_hydraulic_system = [
                        f"Primary.{commodity}In.Q",
                        f"Secondary.{commodity}In.Q",
                    ]
                    if commodity == NetworkSettings.NETWORK_TYPE_HEAT:
                        variables_one_hydraulic_system.append("Heat_flow")
                        variables_two_hydraulic_system.append("Heat_flow")
                    elif commodity == NetworkSettings.NETWORK_TYPE_GAS:
                        variables_one_hydraulic_system.append(f"{commodity}In.mass_flow")
                        variables_two_hydraulic_system.append(f"{commodity}In.mass_flow")

                    post_processed = {}

                    # Update/overwrite each asset variable list due to:
                    # - the addition of head loss minimization: head variable and pump power
                    # - only a specific variable required for a specific asset: pump power
                    # - addition of post processed variables: pipe velocity
                    if self.heat_network_settings["minimize_head_losses"]:
                        variables_one_hydraulic_system.append(f"{commodity}In.H")
                        variables_two_hydraulic_system.append(f"Primary.{commodity}In.H")
                        variables_two_hydraulic_system.append(f"Secondary.{commodity}In.H")
                        if asset_name in [
                            *self.energy_system_components.get("heat_source", []),
                            *self.energy_system_components.get("heat_buffer", []),
                            *self.energy_system_components.get("ates", []),
                            *self.energy_system_components.get("heat_exchanger", []),
                            *self.energy_system_components.get("heat_pump", []),
                        ]:
                            variables_one_hydraulic_system.append("Pump_power")
                            variables_two_hydraulic_system.append("Pump_power")
                        elif asset_name in [*self.energy_system_components.get("pump", [])]:
                            variables_one_hydraulic_system = ["Pump_power"]
                            variables_two_hydraulic_system = ["Pump_power"]
                    if asset_name in [
                        *self.energy_system_components.get("heat_pipe", []),
                        *self.energy_system_components.get("gas_pipe", []),
                    ]:
                        variables_one_hydraulic_system.append("PostProc.Velocity")
                        variables_two_hydraulic_system.append("PostProc.Velocity")
                        # Velocity at the pipe outlet [m/s]
                        post_processed["PostProc.Velocity"] = pipe_velocity(
                            asset_name, commodity, results, parameters
                        )
                        variables_one_hydraulic_system.append("PostProc.Pressure")
                        # TODO: seems unnecessary, pipes always only have 1 hydraulic system
                        variables_two_hydraulic_system.append("PostProc.Pressure")
                        post_processed["PostProc.Pressure"] = pipe_pressure(
                            asset_name, commodity, results, parameters
                        )  # Pa

                    # Depending on the port set, different carriers are assigned
                    if port:
                        carrier_id_dict = {"single_carrier_id": port.carrier.id}
                    elif port_prim and port_sec:
                        carrier_id_dict = {
                            "primary_carrier_id": port_prim.carrier.id,
                            "secondary_carrier_id": port_sec.carrier.id,
                        }
                    else:
                        NotImplementedError(
                            "Unsuported types for the different port carrier combinations"
                        )

                    # Looping over the carrier_ids relevant for the asset
                    # If primary or secondary port are set, variables_to_hydraulic_system will be
                    # used, variable names linking to the secondary port are popped from the list
                    # when the primary port is selected and vice versa
                    variables_two_hydraulic_system_org = variables_two_hydraulic_system.copy()
                    for asset_side, carrier_id in carrier_id_dict.items():
                        variables_two_hydraulic_system = variables_two_hydraulic_system_org.copy()
                        var_pops = []
                        if asset_side == "primary_carrier_id":
                            var_pops = [
                                v for v in variables_two_hydraulic_system if "Secondary" in v
                            ]
                        elif asset_side == "secondary_carrier_id":
                            var_pops = [v for v in variables_two_hydraulic_system if "Primary" in v]
                        for v in var_pops:
                            variables_two_hydraulic_system.remove(v)

                        profiles = ProfileManager()
                        profiles.profile_type = "DATETIME_LIST"
                        profiles.profile_header = ["datetime"]  # + general_headers

                        # Get index of outport which will be used to assign the profile data to
                        index_outport = -1
                        for ip in range(len(asset.port)):
                            if isinstance(asset.port[ip], esdl.OutPort):
                                if index_outport == -1:
                                    index_outport = ip
                                else:
                                    logger.warning(
                                        f"Asset {asset_name} has more than 1 OutPort, and the "
                                        "profile data has been assigned to the 1st OutPort"
                                    )
                                    break

                        if index_outport == -1:
                            logger.error(
                                f"Variable {index_outport} has not been assigned to the asset "
                                f"OutPort"
                            )
                            sys.exit(1)

                        for ii in range(len(self.times())):
                            if not self.io.datetimes[ii].tzinfo:
                                data_row = [
                                    self.io.datetimes[ii].replace(tzinfo=datetime.timezone.utc)
                                ]
                            else:
                                data_row = [self.io.datetimes[ii]]

                            try:
                                # For all components dealing with one hydraulic system
                                if isinstance(
                                    results[f"{asset_name}." + variables_one_hydraulic_system[0]][
                                        ii
                                    ],
                                    numbers.Number,
                                ):
                                    variables_names = variables_one_hydraulic_system
                            except KeyError:
                                # For all components dealing with two hydraulic system
                                if isinstance(
                                    results[f"{asset_name}." + variables_two_hydraulic_system[0]][
                                        ii
                                    ],
                                    numbers.Number,
                                ):
                                    variables_names = variables_two_hydraulic_system
                            except Exception:
                                logger.error(
                                    f"During the influxDB profile writing for asset: {asset_name},"
                                    f" the following error occured:"
                                )
                                traceback.print_exc()
                                sys.exit(1)

                            for variable in variables_names:
                                if ii == 0:
                                    # Set header for each column
                                    profiles.profile_header.append(variable)
                                    # Set profile database attributes for the esdl asset
                                    if not self.io.datetimes[0].tzinfo:
                                        start_date_time = self.io.datetimes[0].replace(
                                            tzinfo=datetime.timezone.utc
                                        )
                                        logger.warning(
                                            f"No timezone specified for the output profile: "
                                            f"default UTC has been used for asset {asset_name} "
                                            f"variable {variable}"
                                        )
                                    else:
                                        start_date_time = self.io.datetimes[0]
                                    if not self.io.datetimes[-1].tzinfo:
                                        end_date_time = self.io.datetimes[-1].replace(
                                            tzinfo=datetime.timezone.utc
                                        )
                                    else:
                                        end_date_time = self.io.datetimes[-1]

                                    profile_attributes = esdl.InfluxDBProfile(
                                        database=output_energy_system_id,
                                        measurement=carrier_id,
                                        field=profiles.profile_header[-1],
                                        port=self.influxdb_port,
                                        host=self.influxdb_host,
                                        startDate=start_date_time,
                                        endDate=end_date_time,
                                        id=str(uuid.uuid4()),
                                        filters='"assetId"=' + f"'{str(asset_id)}'",
                                    )
                                    # Assign quantity and units variable
                                    if variable in ["Heat_flow", "Pump_power"]:
                                        profile_attributes.profileQuantityAndUnit = (
                                            esdl.esdl.QuantityAndUnitType(
                                                physicalQuantity=esdl.PhysicalQuantityEnum.POWER,
                                                unit=esdl.UnitEnum.WATT,
                                                multiplier=esdl.MultiplierEnum.NONE,
                                            )
                                        )
                                    elif variable in [
                                        f"{commodity}In.H",
                                        f"Primary.{commodity}In.H",
                                        f"Secondary.{commodity}In.H",
                                    ]:
                                        profile_attributes.profileQuantityAndUnit = (
                                            esdl.esdl.QuantityAndUnitType(
                                                physicalQuantity=esdl.PhysicalQuantityEnum.PRESSURE,
                                                unit=esdl.UnitEnum.PASCAL,
                                                multiplier=esdl.MultiplierEnum.NONE,
                                            )
                                        )
                                    elif variable in [
                                        f"{commodity}In.Q",
                                        f"Primary.{commodity}In.Q",
                                        f"Secondary.{commodity}In.Q",
                                    ]:
                                        profile_attributes.profileQuantityAndUnit = (
                                            esdl.esdl.QuantityAndUnitType(
                                                physicalQuantity=esdl.PhysicalQuantityEnum.FLOW,
                                                unit=esdl.UnitEnum.CUBIC_METRE,
                                                perTimeUnit=esdl.TimeUnitEnum.SECOND,
                                                multiplier=esdl.MultiplierEnum.NONE,
                                            )
                                        )
                                    elif variable in ["PostProc.Velocity"]:
                                        profile_attributes.profileQuantityAndUnit = (
                                            esdl.esdl.QuantityAndUnitType(
                                                physicalQuantity=esdl.PhysicalQuantityEnum.SPEED,
                                                unit=esdl.UnitEnum.METRE,
                                                perTimeUnit=esdl.TimeUnitEnum.SECOND,
                                                multiplier=esdl.MultiplierEnum.NONE,
                                            )
                                        )
                                    else:
                                        logger.warning(
                                            f"No profile units will be written to the ESDL for: "
                                            f"{asset_name}. + {variable}"
                                        )

                                    asset.port[index_outport].profile.append(profile_attributes)

                                # Add variable values in new column
                                conversion_factor = 0.0
                                if variable in [
                                    f"{commodity}In.H",
                                    f"Primary.{commodity}In.H",
                                    f"Secondary.{commodity}In.H",
                                ]:
                                    conversion_factor = GRAVITATIONAL_CONSTANT * 988.0
                                else:
                                    conversion_factor = 1.0
                                if variable not in ["PostProc.Velocity", "PostProc.Pressure"]:
                                    data_row.append(
                                        results[f"{asset_name}." + variable][ii] * conversion_factor
                                    )
                                # The variable evaluation below seems unnecessary, but it would be
                                # used we expand the list of post process type variables
                                elif variable in ["PostProc.Velocity", "PostProc.Pressure"]:
                                    data_row.append(post_processed[variable][ii])

                            profiles.profile_data_list.append(data_row)
                        # end time steps
                        profiles.num_profile_items = len(profiles.profile_data_list)
                        profiles.start_datetime = profiles.profile_data_list[0][0]
                        profiles.end_datetime = profiles.profile_data_list[-1][0]

                        influxdb_profile_manager = InfluxDBProfileManager(
                            influxdb_conn_settings, profiles
                        )

                        optim_simulation_tag = {
                            "simulationRun": simulation_id,
                            "simulation_type": type(self).__name__,
                            "assetId": asset_id,
                            "assetName": asset_name,
                            "assetClass": asset_class,
                            "capability": capability,
                        }
                        _ = influxdb_profile_manager.save_influxdb(
                            measurement=carrier_id,
                            field_names=influxdb_profile_manager.profile_header[1:],
                            tags=optim_simulation_tag,
                        )

                    # -- Test tags -- # do not delete - to be used in test case
                    # prof_loaded_from_influxdb = InfluxDBProfileManager(influxdb_conn_settings)
                    # dicts = [{"tag": "output_esdl_id", "value": energy_system.id}]
                    # prof_loaded_from_influxdb.load_influxdb(
                    #     # '"' + "ResidualHeatSource_72d7" + '"' ,
                    #     asset_name,
                    #     variables_one_hydraulic_system,
                    #     # ["HeatIn.Q"],
                    #     # ["HeatIn.H"],
                    #     # ["Heat_flow"],
                    #     profiles.start_datetime,
                    #     profiles.end_datetime,
                    #     dicts,
                    # )
                    # test = 0.0

                    # ------------------------------------------------------------------------------
                    # Do not delete the code below: is used in the development of profile viewer in
                    # mapeditor
                    # Write database to excel file and read in to recreate the database
                    # database name: input esdl id
                    # tags when saving to database: optim_simulation_tag = {"output_esdl_id":
                    # output_esdl_id}

                    # print("Save ESDL profile data to excel")
                    # excel_prof_saved = ExcelProfileManager(
                    #     source_profile=prof_loaded_from_influxdb
                    # )
                    # file_path_setting = (
                    #     f"C:\\Projects_gitlab\\NWN_dev\\rtc-tools-milp-network\\{asset_name}.xlsx"
                    # )
                    # excel_prof_saved.save_excel(
                    #     file_path=file_path_setting,
                    #     sheet_name=input_energy_system_id
                    # )
                    # print("Read data from Excel")
                    # excel_prof_read = ExcelProfileManager()
                    # excel_prof_read.load_excel(file_path_setting)
                    # print("Create database")
                    # influxdb_profile_manager_create_new = InfluxDBProfileManager(
                    #     influxdb_conn_settings, excel_prof_read
                    # )
                    # optim_simulation_tag = {"output_esdl_id": energy_system.id}
                    # _ = influxdb_profile_manager_create_new.save_influxdb(
                    #     measurement=asset_name,
                    #     field_names=influxdb_profile_manager_create_new.profile_header[1:],
                    #     tags=optim_simulation_tag,
                    # )
                    # ------------------------------------------------------------------------------
                except StopIteration:
                    # If the asset has been deleted, thus also not placed
                    pass
                except Exception:  # TODO fix other places in the where try/except end with pass
                    logger.error(
                        f"During the influxDB profile writing for asset: {asset_name}, the "
                        "following error occured:"
                    )
                    traceback.print_exc()
                    sys.exit(1)

            # TODO: create test case
            # Code that can be used to remove a specific measurment from the database
            # try:
            #     influxdb_profile_manager.influxdb_client.drop_measurement(energy_system.id)
            # except:
            #     pass
            # Code that can be used to check if a specific measurement exists in the database
            # influxdb_profile_manager.influxdb_client.get_list_measurements()

            # Do not delete: Test code still to be used in test case
            # try:
            #     esdl_infl_prof = profs[0]
            #     np.any(isinstance(esdl_infl_prof, esdl.InfluxDBProfile))
            # except:
            #     np.any(isinstance(profs, esdl.InfluxDBProfile))
            # print("Reading InfluxDB profile from test...")
            # prof3 = InfluxDBProfileManager(conn_settings)
            # # prof3.load_influxdb("test", ["Heat_flow"])
            # prof3.load_influxdb('"' + energy_system.id + '"', profiles.profile_header[1:4])
            # # can access values via
            # # prof3.profile_data_list[0-row][0/1-date/value],
            # # .strftime("%Y-%m-%dT%H:%M:%SZ")
            # # prof3.profile_data_list[3][0].strftime("%Y-%m-%dT%H:%M:%SZ")
            # ts_prof = prof3.get_esdl_timeseries_profile("Heat_flow")
            # # np.testing.assert_array_equal(ts_prof.values[0], 45)
            # # np.testing.assert_array_equal(ts_prof.values[1], 900)
            # # np.testing.assert_array_equal(ts_prof.values[2], 5.6)
            # # np.testing.assert_array_equal(ts_prof.values[3], 1.2)
            # # np.testing.assert_array_equal(len(ts_prof.values), 4)
            # # -- Test tags --
            # prof3 = InfluxDBProfileManager(influxdb_conn_settings)
            # dicts = [{"tag": "output_esdl_id", "value": energy_system.id}]
            # prof3.load_influxdb(
            #     '"' + "ResidualHeatSource_72d7" + '"' , ["HeatIn.Q"],
            #     profiles.start_datetime,
            #     profiles.end_datetime,
            #     dicts,
            # )
            # test = 0.0
        # ------------------------------------------------------------------------------------------
        # Save esdl file
        # Edwin_marker_esdl_string - line 1224
        if self.esdl_parser_class == mesido.esdl.esdl_parser.ESDLFileParser:
            extension = "_Simulation.esdl" if optimizer_sim else "_GrowOptimized.esdl"
            file_path = Path(self.model_folder) / (Path(self.esdl_file_name).stem + extension)
            self.save_energy_system_to_file(energy_system, file_path=file_path)
        self.optimized_esdl_string = self.convert_energy_system_to_string(
            energy_system=energy_system
        )

        # self.__optimized_energy_system_handler = esh
        # self.optimized_esdl_string = esh.to_string()
        #
        # if self.esdl_string is None:
        #     if optimizer_sim:
        #         filename = run_info.esdl_file.with_name(
        #             f"{run_info.esdl_file.stem}_Simulation.esdl"
        #         )
        #     else:
        #         filename = run_info.esdl_file.with_name(
        #             f"{run_info.esdl_file.stem}_GrowOptimized.esdl"
        #         )
        #     esh.save(str(filename))

    def _write_json_output(
        self,
        results: Union[AliasDict, Dict],
        parameters: Union[AliasDict, Dict],
        bounds: Union[AliasDict, Dict],
        aliases: OrderedDict,
        solver_stats: Dict,
    ):
        """
        The results, parameters, bounds are saved as json files which can be used for further
        processing. Aliases are also saved as this allows us to only save the necessary variables.
        :param results: dictionary or Alias dictionary with the results of the optimization problem
        :param parameters: dictionary or Alias dictionary with the parameters of the optimization
        problem
        :param bounds: dictionary or Alias dictionary with the bounds of the optimization problem
        :param aliases: Alias dictionary describing all the aliases for the variables used
        :param solver_stats: solver statistics provided by the solver
        :return:
        """

        workdir = self.output_folder

        parameters_dict = dict()
        parameter_path = os.path.join(workdir, "parameters.json")
        for key, value in parameters.items():
            new_value = value  # [x for x in value]
            parameters_dict[key] = new_value
        with open(parameter_path, "w") as file:
            json.dump(parameters_dict, fp=file)

        bounds_dict = dict()
        bounds_path = os.path.join(workdir, "bounds.json")
        for key, value in bounds.items():
            if "Stored_heat" not in key:
                new_value = value  # [x for x in value]
                if isinstance(value[0], Timeseries) or isinstance(value[1], Timeseries):
                    new_value = (value[0].values.tolist(), value[1].values.tolist())
                bounds_dict[key] = new_value
        with open(bounds_path, "w") as file:
            json.dump(bounds_dict, fp=file)

        results_dict = dict()
        for key, values in results.items():
            new_value = values.tolist()
            if len(new_value) == 1:
                new_value = new_value[0]
            results_dict[key] = new_value

        results_path = os.path.join(workdir, "results.json")
        with open(results_path, "w") as file:
            json.dump(results_dict, fp=file)

        # save aliases
        alias_dict = {}
        for key, values in aliases.items():
            new_value = values
            alias_dict[key] = new_value

        aliases_path = os.path.join(workdir, "aliases.json")
        with open(aliases_path, "w") as file:
            json.dump(alias_dict, fp=file)

        # save solver_stats
        solver_stats_dict = solver_stats
        solver_stats_path = os.path.join(workdir, "solver_stats.json")
        with open(solver_stats_path, "w") as file:
            json.dump(solver_stats_dict, fp=file)
