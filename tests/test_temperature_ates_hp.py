from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

import numpy as np

from rtctools.util import run_optimization_problem

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestAtesTemperature(TestCase):
    """
    Checks the constraints concerning the temperature changes in the ates as a result of heat
    loss and charging
    """

    def test_ates_temperature(self):
        """
        check if
        - discrete temperature ates is equal to temperature of pipe at inport during discharging
        - discrete temperature ates is equal or lower then temperature ates
        - discrete temperature ates is equal to the set booleans of ates temperature
        - temperature change ates continues is equal to the sum of temperature loss and
        temperature change charging

        - only heatpump or heat exchanger is in operation, solely for charging/discharging ates
        - if ates is charging (heat_ates>0), hex is enabled. if ates is discharging (heat<0),
        hp is enabled
        - Discharge heat and mass flow is corresponding to the temperature regime (flow rate
        remains the same, but heat changes)

        TODO: still have to add checks:
        - temperature loss>= relation of temperature loss
        - temperature addition charging
        - heat loss ates>= relation of heat loss
        """
        import models.ates_temperature.src.run_ates_temperature as run_ates_temperature
        from models.ates_temperature.src.run_ates_temperature import HeatProblem

        basefolder = Path(run_ates_temperature.__file__).resolve().parent.parent

        solution = run_optimization_problem(
            HeatProblem,
            base_folder=basefolder,
            esdl_file_name="HP_ATES with return network.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test_3.csv",
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        times = solution.times()

        tol = 1e-6

        demand_matching_test(solution, results)
        energy_conservation_test(solution, results)
        heat_to_discharge_test(solution, results)

        ates_id = solution.esdl_asset_name_to_id_map.get("ATES_cb47")
        pipe_id = solution.esdl_asset_name_to_id_map.get("Pipe1")
        hex_id = solution.esdl_asset_name_to_id_map.get("HeatExchange_32ba")
        hp_id = solution.esdl_asset_name_to_id_map.get("HeatPump_7f2c")
        geo_id = solution.esdl_asset_name_to_id_map.get("GeothermalSource_4e5b")
        peak_id = solution.esdl_asset_name_to_id_map.get("GenericProducer_4dfe")

        ates_charging = results[f"{pipe_id}__flow_direct_var"]  # =1 if charging
        ates_temperature = results[f"{ates_id}.Temperature_ates"]
        ates_temperature_disc = results[f"{ates_id}__temperature_ates_disc"]
        carrier_temperature = results["41770304791669983859190_temperature"]
        temperature_regimes = solution.temperature_regimes(41770304791669983859190)

        ates_temperature_loss = results[f"{ates_id}.Temperature_loss"]
        ates_temperature_change_charging = results[f"{ates_id}.Temperature_change_charging"]

        # heat_pump_sec = results[f"{hp_id}.Secondary_heat"]
        heat_ates = results[f"{ates_id}.Heat_ates"]
        heat_loss_ates = results[f"{ates_id}.Heat_loss"]
        ates_stored_heat = results[f"{ates_id}.Stored_heat"]
        hex_disabled = results[f"{hex_id}__disabled"]
        hp_disabled = results[f"{hp_id}__disabled"]

        # geo_source = results[f"{geo_id}.Heat_source"]
        objective = solution.objective_value

        objective_calc = (
            sum(
                parameters[f"{geo_id}.variable_operational_cost_coefficient"]
                * results[f"{geo_id}.Heat_source"]
            )
            + sum(
                parameters[f"{hp_id}.variable_operational_cost_coefficient"]
                * results[f"{hp_id}.Power_elec"]
            )
            + sum(
                parameters[f"{peak_id}.variable_operational_cost_coefficient"]
                * results[f"{peak_id}.Heat_source"]
            )
        )

        feasibility = solution.solver_stats["return_status"]

        self.assertTrue((feasibility == "Optimal"))

        np.testing.assert_allclose(objective_calc / 1e4, objective)

        np.testing.assert_array_less(ates_temperature_disc - tol, ates_temperature)
        np.testing.assert_array_less(
            ates_temperature_disc - tol,
            sum(
                [
                    results[f"{ates_id}__temperature_disc_{temp}"] * temp
                    for temp in temperature_regimes
                ]
            ),
        )
        np.testing.assert_allclose(
            (1 - ates_charging) * ates_temperature_disc,
            (1 - ates_charging) * carrier_temperature,
            atol=tol,
        )
        np.testing.assert_allclose(
            ates_temperature[1:] - ates_temperature[:-1],
            (ates_temperature_change_charging[1:] - ates_temperature_loss[1:])
            * (times[1:] - times[:-1]),
            atol=tol,
        )

        np.testing.assert_allclose(
            heat_ates[1:] - heat_loss_ates[1:],
            (ates_stored_heat[1:] - ates_stored_heat[:-1]) / (times[1:] - times[:-1]),
            atol=tol,
        )
        # TODO: potentially update example such that the commented checks will also hold.
        # np.testing.assert_array_less(heat_pump_sec, geo_source)

        charging = np.array([int(val > 0) for val in heat_ates])
        # array less then because ates charging boolean can be either 0 or 1 when there is no flow,
        # or just flow to compensate the heatloss
        np.testing.assert_array_less(np.ones(len(hex_disabled)) - tol, hex_disabled + hp_disabled)
        np.testing.assert_array_less(charging - tol, hp_disabled)
        np.testing.assert_array_less(charging[1:] - tol, 1 - hex_disabled[1:])

        # np.alltrue(
        #     [
        #         True if (g < 6e6 and hp <= 0) or g >= 6e6 - tol else False
        #         for (g, hp) in zip(geo_source, heat_pump_sec)
        #     ]
        # )

    def test_ates_max_flow(self):
        """
        Checks if the maximum flow is limiting due to the decreased temperature and not the
        maximum heat for the ates

        Highs acts slow in solving this problem, already in the first goal 'matching the demand'
        because it cannot be matched.
        """

        import models.ates_temperature.src.run_ates_temperature as run_ates_temperature
        from models.ates_temperature.src.run_ates_temperature import HeatProblemMaxFlow

        basefolder = Path(run_ates_temperature.__file__).resolve().parent.parent

        solution = run_optimization_problem(
            HeatProblemMaxFlow,
            base_folder=basefolder,
            esdl_file_name="HP_ATES with return network.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Warmte_test_3.csv",
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)
        bounds = solution.bounds()

        # energy_conservation_test(solution, results)
        # heat_to_discharge_test(solution, results)

        ates_id = solution.esdl_asset_name_to_id_map.get("ATES_cb47")
        demand_id = solution.esdl_asset_name_to_id_map.get("HeatingDemand_1")
        pipe_id = solution.esdl_asset_name_to_id_map.get("Pipe1")
        hex_id = solution.esdl_asset_name_to_id_map.get("HeatExchange_32ba")
        hp_id = solution.esdl_asset_name_to_id_map.get("HeatPump_7f2c")
        geo_id = solution.esdl_asset_name_to_id_map.get("GeothermalSource_4e5b")
        peak_id = solution.esdl_asset_name_to_id_map.get("GenericProducer_4dfe")

        ates_flow = results[f"{ates_id}.Q"]
        ates_flow_bound = bounds[f"{ates_id}.Q"][1]

        ates_heat = results[f"{ates_id}.Heat_ates"]
        ates_heat_bound = bounds[f"{ates_id}.Heat_ates"][1]

        heat_demand = results[f"{demand_id}.Heat_demand"]
        target = solution.get_timeseries(f"{demand_id}.target_heat_demand").values

        demand_not_matched = (heat_demand - target) < -1

        ates_temperature = results[f"{ates_id}.Temperature_ates"]
        ates_temp_ret = parameters[f"{ates_id}.T_return"]
        cp = parameters[f"{ates_id}.cp"]
        rho = parameters[f"{ates_id}.rho"]

        np.testing.assert_allclose(abs(ates_flow[demand_not_matched]), ates_flow_bound)
        np.testing.assert_array_less(abs(ates_heat[demand_not_matched]), ates_heat_bound)
        np.testing.assert_array_less(
            abs(ates_heat[demand_not_matched]),
            abs(
                ates_flow[demand_not_matched]
                * cp
                * rho
                * (ates_temperature[demand_not_matched] - ates_temp_ret)
            ),
        )
