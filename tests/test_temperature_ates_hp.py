from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

from mesido.workflows.utils.helpers import run_optimization_problem_solver
from models.ates_temperature.src.run_ates_temperature import SolverCPLEX

from utils_tests import (
    demand_matching_test,
    energy_conservation_test,
    heat_to_discharge_test,
    feasibility_test,
    _get_component_temperatures,
)

import numpy as np


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

        solution = run_esdl_mesido_optimization(
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

        ates_charging = results[f"ATES_cb47__is_charging"] # =1 if charging
        ates_temperature = results["ATES_cb47.Temperature_ates"]
        ates_temperature_disc = results["ATES_cb47__temperature_ates_disc"]
        carrier_temperature = results["41770304791669983859190_temperature"]
        temperature_regimes = solution.temperature_regimes(41770304791669983859190)

        ates_temperature_loss = results["ATES_cb47.Temperature_loss"]
        ates_temperature_change_charging = results["ATES_cb47.Temperature_change_charging"]

        # heat_pump_sec = results["HeatPump_7f2c.Secondary_heat"]
        heat_ates = results["ATES_cb47.Heat_ates"]
        heat_loss_ates = results["ATES_cb47.Heat_loss"]
        ates_stored_heat = results["ATES_cb47.Stored_heat"]
        hex_disabled = results["HeatExchange_32ba__disabled"]
        hp_disabled = results["HeatPump_7f2c__disabled"]

        # geo_source = results["GeothermalSource_4e5b.Heat_source"]
        objective = solution.objective_value

        objective_calc = (
            sum(
                parameters["GeothermalSource_4e5b.variable_operational_cost_coefficient"]
                * results["GeothermalSource_4e5b.Heat_source"]
            )
            + sum(
                parameters["HeatPump_7f2c.variable_operational_cost_coefficient"]
                * results["HeatPump_7f2c.Power_elec"]
            )
            + sum(
                parameters["GenericProducer_4dfe.variable_operational_cost_coefficient"]
                * results["GenericProducer_4dfe.Heat_source"]
            )
        )

        np.testing.assert_allclose(objective_calc / 1e4, objective)

        np.testing.assert_array_less(ates_temperature_disc - tol, ates_temperature)
        np.testing.assert_array_less(
            ates_temperature_disc - tol,
            sum(
                [
                    results[f"ATES_cb47__temperature_disc_{temp}"] * temp
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

        charging = np.array([int(val > tol) for val in heat_ates])
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

        solution = run_esdl_mesido_optimization(
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

        ates_flow = results["ATES_cb47.Q"]
        ates_flow_bound = bounds["ATES_cb47.Q"][1]

        ates_heat = results["ATES_cb47.Heat_ates"]
        ates_heat_bound = bounds["ATES_cb47.Heat_ates"][1]

        heat_demand = results["HeatingDemand_1.Heat_demand"]
        target = solution.get_timeseries("HeatingDemand_1.target_heat_demand").values

        demand_not_matched = (heat_demand - target) < -1

        ates_temperature = results["ATES_cb47.Temperature_ates"]
        ates_temp_ret = parameters["ATES_cb47.T_return"]
        cp = parameters["ATES_cb47.cp"]
        rho = parameters["ATES_cb47.rho"]

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

    def test_ates_multi_port(self):
        """
        check if
        -
        """
        import models.ates_temperature.src.run_ates_temperature as run_ates_temperature
        from models.ates_temperature.src.run_ates_temperature import HeatProblemATESMultiPort

        basefolder = Path(run_ates_temperature.__file__).resolve().parent.parent

        class HeatProblemATESMultiPortFixedTemperature(HeatProblemATESMultiPort):
            def energy_system_options(self):
                options = super().energy_system_options()
                options["include_ates_temperature_options"] = False
                return options

        solution = run_optimization_problem_solver(
            HeatProblemATESMultiPortFixedTemperature,
            # solver_class=SolverCPLEX,
            base_folder=basefolder,
            esdl_file_name="ATES_6port_HP_simplified_ATES_temperatures.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Heatdemand_eprice.csv",
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        feasibility_test(solution)
        demand_matching_test(solution, results)

        epsilon = 1e-6
        dt = np.diff(solution.times())

        ates = solution.energy_system_components.get("ates")[0]
        heat_producer = "HeatProducer_4e19"
        peak_producer = "HeatProducer_Peak"
        heatpump = "HeatPump_5e09"
        heatdemand = "HeatingDemand_bf07"

        ates_temp = results[f"{ates}.Temperature_ates"]
        ates_heat = results[f"{ates}.Heat_ates"]
        ates_flow = results[f"{ates}.Q"]
        ates_temp_disc = results[f"{ates}__temperature_ates_disc"]
        ates_cold_return_temp = parameters[f"{ates}.T_return"]
        cp = parameters[f"{ates}.cp"]
        rho = parameters[f"{ates}.rho"]
        ates_charging = results[f"{ates}__is_charging"].astype(bool)
        ates_discharging = (1 - ates_charging).astype(bool)

        # temperatures from port groups (supply_t, return_t, dt)
        temp_discharge_hot = _get_component_temperatures(
            solution, results, ates, side="DischargeHot"
        )
        temp_discharge_cold = _get_component_temperatures(
            solution, results, ates, side="DischargeCold"
        )
        temp_charge_hot = _get_component_temperatures(solution, results, ates, side="ChargeHot")

        # ensuring enough ates is charged for this problem to be be realistic.
        np.testing.assert_array_less(1e10, sum(ates_heat[1:] * dt))

        ates_discharge_hot_heat = results[f"{ates}.DischargeHot.Heat_flow"]
        ates_discharge_cold_heat = results[f"{ates}.DischargeCold.Heat_flow"]
        ates_charge_hot_heat = results[f"{ates}.ChargeHot.Heat_flow"]

        ates_discharge_hot_out_heat = results[f"{ates}.DischargeHot.HeatOut.Heat"]
        ates_discharge_cold_out_heat = results[f"{ates}.DischargeCold.HeatOut.Heat"]
        ates_charge_hot_out_heat = results[f"{ates}.ChargeHot.HeatOut.Heat"]

        # check flows charging discharging only active when charging/discharging
        ates_discharge_hot_flow = results[f"{ates}.DischargeHot.Q"]
        ates_discharge_cold_flow = results[f"{ates}.DischargeCold.Q"]
        ates_charge_hot_flow = results[f"{ates}.ChargeHot.Q"]

        # Since pipe heatlosses are turned off the heatflow should be equal to the calculated
        np.testing.assert_allclose(
            -ates_discharge_hot_heat, ates_discharge_hot_flow * temp_discharge_hot[2] * cp * rho
        )
        np.testing.assert_allclose(
            ates_discharge_hot_out_heat, ates_discharge_hot_flow * temp_discharge_hot[0] * cp * rho
        )
        np.testing.assert_allclose(
            ates_discharge_cold_flow * temp_discharge_cold[2] * cp * rho, -ates_discharge_cold_heat
        )
        np.testing.assert_allclose(
            ates_discharge_cold_out_heat,
            ates_discharge_cold_flow * temp_discharge_cold[0] * cp * rho,
        )
        np.testing.assert_allclose(
            ates_charge_hot_flow * temp_charge_hot[2] * cp * rho, ates_charge_hot_heat
        )
        np.testing.assert_allclose(
            ates_charge_hot_out_heat, ates_charge_hot_flow * temp_charge_hot[1] * cp * rho
        )

        # checks that heatflow of different ports is positive or negative and that the sum is equal
        # to Heat_ates
        np.testing.assert_allclose(
            ates_discharge_hot_heat + ates_discharge_cold_heat + ates_charge_hot_heat, ates_heat
        )
        np.testing.assert_array_less(ates_discharge_cold_heat, epsilon)
        np.testing.assert_array_less(ates_discharge_hot_heat, epsilon)
        np.testing.assert_array_less(-epsilon, ates_charge_hot_heat)

        ates_discharge_hot_in_heat = results[f"{ates}.DischargeHot.HeatIn.Heat"]
        ates_discharge_hot_out_heat = results[f"{ates}.DischargeHot.HeatOut.Heat"]
        ates_discharge_cold_in_heat = results[f"{ates}.DischargeCold.HeatIn.Heat"]
        ates_discharge_cold_out_heat = results[f"{ates}.DischargeCold.HeatOut.Heat"]
        ates_charge_hot_in_heat = results[f"{ates}.ChargeHot.HeatIn.Heat"]
        ates_charge_hot_out_heat = results[f"{ates}.ChargeHot.HeatOut.Heat"]

        # Checks that heatflow is each port group is calculated correctly on their in and out ports
        np.testing.assert_allclose(
            ates_discharge_hot_in_heat - ates_discharge_hot_out_heat,
            ates_discharge_hot_heat,
            atol=1e-6,
        )
        np.testing.assert_allclose(
            ates_discharge_cold_in_heat - ates_discharge_cold_out_heat,
            ates_discharge_cold_heat,
            atol=1e-6,
        )
        np.testing.assert_allclose(
            ates_charge_hot_in_heat - ates_charge_hot_out_heat, ates_charge_hot_heat, atol=1e-6
        )

        # Checks that ates__is_charging discrete variable is indeed discrete (0 or 1)
        np.testing.assert_allclose(ates_charging, ates_charging.astype(int))

    def test_ates_multi_port_varying_ates_temperature(self):
        """
        check if
        -
        """
        import models.ates_temperature.src.run_ates_temperature as run_ates_temperature
        from models.ates_temperature.src.run_ates_temperature import HeatProblemATESMultiPort

        basefolder = Path(run_ates_temperature.__file__).resolve().parent.parent

        solution = run_optimization_problem_solver(
            HeatProblemATESMultiPort,
            # solver_class=SolverCPLEX,
            base_folder=basefolder,
            esdl_file_name="ATES_6port_HP_simplified_ATES_temperatures.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Heatdemand_eprice.csv",
        )

        results = solution.extract_results()
        parameters = solution.parameters(0)

        feasibility_test(solution)
        demand_matching_test(solution, results)

        epsilon = 1e-6
        dt = np.diff(solution.times())

        ates = solution.energy_system_components.get("ates")[0]
        heat_producer = "HeatProducer_4e19"
        peak_producer = "HeatProducer_Peak"
        heatpump = "HeatPump_5e09"
        heatdemand = "HeatingDemand_bf07"

        ates_temp = results[f"{ates}.Temperature_ates"]
        ates_heat = results[f"{ates}.Heat_ates"]
        ates_flow = results[f"{ates}.Q"]
        ates_temp_disc = results[f"{ates}__temperature_ates_disc"]
        ates_cold_return_temp = parameters[f"{ates}.T_return"]
        cp = parameters[f"{ates}.cp"]
        rho = parameters[f"{ates}.rho"]
        ates_charging = results[f"{ates}__is_charging"].astype(bool)
        ates_discharging = (1 - ates_charging).astype(bool)

        # temperatures from port groups (supply_t, return_t, dt)
        temp_discharge_hot = _get_component_temperatures(
            solution, results, ates, side="DischargeHot"
        )
        temp_discharge_cold = _get_component_temperatures(
            solution, results, ates, side="DischargeCold"
        )
        temp_charge_hot = _get_component_temperatures(solution, results, ates, side="ChargeHot")

        ates_discharge_hot_heat = results[f"{ates}.DischargeHot.Heat_flow"]
        ates_discharge_cold_heat = results[f"{ates}.DischargeCold.Heat_flow"]
        ates_charge_hot_heat = results[f"{ates}.ChargeHot.Heat_flow"]

        ates_discharge_hot_in_heat = results[f"{ates}.DischargeHot.HeatIn.Heat"]
        ates_discharge_hot_out_heat = results[f"{ates}.DischargeHot.HeatOut.Heat"]
        ates_discharge_cold_in_heat = results[f"{ates}.DischargeCold.HeatIn.Heat"]
        ates_discharge_cold_out_heat = results[f"{ates}.DischargeCold.HeatOut.Heat"]
        ates_charge_hot_in_heat = results[f"{ates}.ChargeHot.HeatIn.Heat"]
        ates_charge_hot_out_heat = results[f"{ates}.ChargeHot.HeatOut.Heat"]

        # check flows charging discharging only active when charging/discharging
        ates_discharge_hot_flow = results[f"{ates}.DischargeHot.Q"]
        ates_discharge_cold_flow = results[f"{ates}.DischargeCold.Q"]
        ates_charge_hot_flow = results[f"{ates}.ChargeHot.Q"]

        # ensuring enough ates is charged for this problem to be be realistic.
        np.testing.assert_array_less(1e10, sum(ates_heat[1:] * dt))
        np.testing.assert_allclose(
            ates_heat[ates_discharging],
            ates_flow[ates_discharging]
            * cp
            * rho
            * (ates_temp_disc[ates_discharging] - ates_cold_return_temp),
        )
        # checks that heatflow of different ports is positive or negative and that the sum is equal
        # to Heat_ates
        np.testing.assert_allclose(
            ates_discharge_hot_heat + ates_discharge_cold_heat + ates_charge_hot_heat, ates_heat,
            atol=1e-6
        )
        np.testing.assert_array_less(ates_discharge_cold_heat, 1)
        np.testing.assert_array_less(ates_discharge_hot_heat, 1)
        np.testing.assert_array_less(-1, ates_charge_hot_heat)

        # Since pipe heatlosses are turned off the heatflow should be equal to the calculated
        np.testing.assert_allclose(
            -ates_discharge_hot_heat, ates_discharge_hot_flow * temp_discharge_hot[2] * cp * rho
        )
        np.testing.assert_allclose(
            ates_discharge_hot_out_heat, ates_discharge_hot_flow * temp_discharge_hot[0] * cp * rho
        )
        np.testing.assert_allclose(
            ates_discharge_cold_flow * temp_discharge_cold[2] * cp * rho, -ates_discharge_cold_heat
        )
        np.testing.assert_allclose(
            ates_discharge_cold_out_heat,
            ates_discharge_cold_flow * temp_discharge_cold[0] * cp * rho,
        )
        np.testing.assert_allclose(
            ates_charge_hot_flow * temp_charge_hot[2] * cp * rho, ates_charge_hot_heat
        )
        np.testing.assert_allclose(
            ates_charge_hot_out_heat, ates_charge_hot_flow * temp_charge_hot[1] * cp * rho
        )

        # Checks that heatflow is each port group is calculated correctly on their in and out ports
        np.testing.assert_allclose(
            ates_discharge_hot_in_heat - ates_discharge_hot_out_heat,
            ates_discharge_hot_heat,
            atol=1e-6,
        )
        np.testing.assert_allclose(
            ates_discharge_cold_in_heat - ates_discharge_cold_out_heat,
            ates_discharge_cold_heat,
            atol=1e-6,
        )
        np.testing.assert_allclose(
            ates_charge_hot_in_heat - ates_charge_hot_out_heat, ates_charge_hot_heat, atol=1e-6
        )

        # Checks that ates__is_charging discrete variable is indeed discrete (0 or 1)
        np.testing.assert_allclose(ates_charging, ates_charging.astype(int))

        # TODO: still add tests where the temperatures of the carriers are also changing.
        # TODO: check if it works iwht heatlosses turned on.

    def test_ates_multi_port_varying_carrier_temperatures(self):
        """
        check if
        -
        """
        import models.ates_temperature.src.run_ates_temperature as run_ates_temperature
        from models.ates_temperature.src.run_ates_temperature import HeatProblemATESMultiPort

        basefolder = Path(run_ates_temperature.__file__).resolve().parent.parent

        class HeatProblemATESMultiPortVaryingTemperature(HeatProblemATESMultiPort):

            def temperature_regimes(self, carrier):
                temperatures = []
                if carrier == 311534455427482369:
                    # supply
                    # temperatures = np.linspace(50, 70, 9).tolist()[::-1]
                    # temperatures = np.linspace(52.5, 65, 6).tolist()[::-1]
                    # temperatures.extend(np.linspace(45, 50, 6).tolist()[::-1])

                    temperatures = np.linspace(60, 65, 3).tolist()[::-1]

                return temperatures

            def _heat_exchanger_charge_discharge_path_constraints(self, ensemble_member):
                """
                These constraints tell the system when it should be in charge and discharge mode
                and what hexes to turn on or off depending on this.
                """

                constraints = []
                for ates in self.energy_system_components.get("ates", []):
                    is_charging_var = self.variable(f"{ates}__is_charging")
                    hex_d1_disabled = self.state("Hex_D1__disabled")
                    hex_c1_disabled = self.state("Hex_C1__disabled")

                    #### Heat exchanger constraints
                    # TODO: These constraints are driven by the state of C1 (charge or
                    # discharge). Once the Ates is introduced, the cycle type will probably be
                    # controlled by a variable coming from the Ates instead of C1 and these constraints
                    # will probably need reformulating.

                    # Only charge or discharge at the same time, based on the state of C1.
                    constraints.append((hex_c1_disabled + hex_d1_disabled, 1.0, 1.0))
                    constraints.append((hex_c1_disabled + is_charging_var, 1.0, 1.0))
                    # Both charge hexes need to be on or off together.
                    constraints.append((hex_c1_disabled - (1-is_charging_var), 0.0, 0.0))
                    # D1 and D3 are on or off together.
                    constraints.append((hex_d1_disabled - is_charging_var, 0.0, 0.0))

                return constraints

            def path_constraints(self, ensemble_member):
                constraints = super().path_constraints(ensemble_member)

                for ates in self.energy_system_components.get("ates", []):
                    is_charging_var = self.variable(f"{ates}__is_charging")
                    carrier_var = self.variable(f"311534455427482369_temperature")
                    temp_options = self.temperature_regimes(311534455427482369)
                    constraints.append((carrier_var-temp_options[-1] + 100*(1-is_charging_var),
                                        0.0, np.inf))
                    constraints.append((carrier_var - temp_options[-1] - 100*(1-is_charging_var),
                                       -np.inf, 0.0))
                #
                #     #if ates discharging specific hex disabled

                constraints.extend(self._heat_exchanger_charge_discharge_path_constraints(ensemble_member))

                return constraints

        solution = run_optimization_problem_solver(
            HeatProblemATESMultiPortVaryingTemperature,
            # solver_class=SolverCPLEX,
            base_folder=basefolder,
            esdl_file_name="ATES_6port_HP_simplified_ATES_temperatures.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="Heatdemand_eprice.csv",
        )

        tol=1e-6
        dt = np.diff(solution.times())

        results = solution.extract_results()
        parameters = solution.parameters(0)

        feasibility_test(solution)
        demand_matching_test(solution, results)

        carrier_temperature = results[f"311534455427482369_temperature"]

        heat_producer = "HeatProducer_4e19"
        peak_producer = "HeatProducer_Peak"
        heatpump = "HeatPump_5e09"
        heatdemand = "HeatingDemand_bf07"

        ates = solution.energy_system_components.get("ates")[0]
        temperature_options = parameters[f"{ates}.ates_temperature_options"]
        ates_temp = results[f"{ates}.Temperature_ates"]
        ates_heat = results[f"{ates}.Heat_ates"]
        ates_heat_loss = results[f"{ates}.Heat_loss"]
        ates_flow = results[f"{ates}.Q"]
        ates_temp_disc = results[f"{ates}__temperature_ates_disc"]
        ates_cold_return_temp = parameters[f"{ates}.T_return"]
        cp = parameters[f"{ates}.cp"]
        rho = parameters[f"{ates}.rho"]
        ates_charging = results[f"{ates}__is_charging"].astype(bool)
        ates_discharging = (1 - ates_charging).astype(bool)

        ates_discharge_hot_in_heat = results[f"{ates}.DischargeHot.HeatIn.Heat"]
        ates_discharge_hot_out_heat = results[f"{ates}.DischargeHot.HeatOut.Heat"]
        ates_discharge_hot_heat_flow = results[f"{ates}.DischargeHot.Heat_flow"]
        ates_discharge_cold_heat_flow = results[f"{ates}.DischargeCold.Heat_flow"]
        ates_charge_hot_heat_flow = results[f"{ates}.ChargeHot.Heat_flow"]
        peak_producer_heat = results[f"{peak_producer}.Heat_flow"]

        temp_discharge_hot = _get_component_temperatures(
            solution, results, ates, side="DischargeHot"
        )
        temp_discharge_cold = _get_component_temperatures(
            solution, results, ates, side="DischargeCold"
        )
        temp_charge_hot = _get_component_temperatures(solution, results, ates, side="ChargeHot")

        #peak producer not to be used, ates used including partial discharge on hot side.
        np.testing.assert_array_less(peak_producer_heat[1:]-tol,0.0)
        np.testing.assert_array_less(1, sum(ates_heat<-1e5))
        np.testing.assert_array_less(1, sum(ates_discharge_hot_heat_flow < -1e5))

        ates_discharge_hot_in_heat = results[f"{ates}.DischargeHot.HeatIn.Heat"]
        ates_discharge_hot_out_heat = results[f"{ates}.DischargeHot.HeatOut.Heat"]
        ates_discharge_cold_in_heat = results[f"{ates}.DischargeCold.HeatIn.Heat"]
        ates_discharge_cold_out_heat = results[f"{ates}.DischargeCold.HeatOut.Heat"]
        ates_charge_hot_in_heat = results[f"{ates}.ChargeHot.HeatIn.Heat"]
        ates_charge_hot_out_heat = results[f"{ates}.ChargeHot.HeatOut.Heat"]

        # check flows charging discharging only active when charging/discharging
        ates_discharge_hot_flow = results[f"{ates}.DischargeHot.Q"]
        ates_discharge_cold_flow = results[f"{ates}.DischargeCold.Q"]
        ates_charge_hot_flow = results[f"{ates}.ChargeHot.Q"]

        # ensuring enough ates is charged for this problem to be be realistic.
        np.testing.assert_array_less(1e10, sum(ates_heat[1:] * dt))
        np.testing.assert_allclose(
            ates_heat[ates_discharging],
            ates_flow[ates_discharging]
            * cp
            * rho
            * (ates_temp_disc[ates_discharging] - ates_cold_return_temp), atol=tol
        )
        # checks that heatflow of different ports is positive or negative and that the sum is equal
        # to Heat_ates
        np.testing.assert_allclose(
            ates_discharge_hot_heat_flow + ates_discharge_cold_heat_flow +
            ates_charge_hot_heat_flow, ates_heat,
            atol=tol
        )

        # Since pipe heatlosses are turned off the heatflow should be equal to the calculated
        np.testing.assert_allclose(
            -ates_discharge_hot_heat_flow, ates_discharge_hot_flow * temp_discharge_hot[2] * cp *
                                           rho, atol=tol
        )
        np.testing.assert_allclose(
            ates_discharge_hot_out_heat, ates_discharge_hot_flow * temp_discharge_hot[0] * cp *
                                         rho, atol=tol
        )
        np.testing.assert_allclose(
            ates_discharge_cold_flow * temp_discharge_cold[2] * cp * rho,
            -ates_discharge_cold_heat_flow, atol=tol
        )
        np.testing.assert_allclose(
            ates_discharge_cold_out_heat,
            ates_discharge_cold_flow * temp_discharge_cold[0] * cp * rho,
        )
        np.testing.assert_allclose(
            ates_charge_hot_flow * temp_charge_hot[2] * cp * rho, ates_charge_hot_heat_flow,
            atol=tol
        )
        np.testing.assert_allclose(
            ates_charge_hot_out_heat, ates_charge_hot_flow * temp_charge_hot[1] * cp * rho, atol=tol
        )

        #if ates is discharging, only deltaT can be achieved over hotdischarge if ates
        # temperature is larger than ates dischargehot out.
        ates_discharge_hot_not60 = np.array((1-ates_charging)*(temp_discharge_hot[0]>60+tol)).astype(bool)
        np.testing.assert_array_less(temp_discharge_hot[0][ates_discharge_hot_not60],
                            ates_temp_disc[ates_discharge_hot_not60])
        np.testing.assert_allclose(60, temp_discharge_hot[0][np.array(1 -
                                                                      ates_discharge_hot_not60).astype(bool)])

        # ensuring atleast once the carrier temperature on hot side is higher than default
        np.testing.assert_array_less(0.5, np.sum(carrier_temperature>60.5))
        np.testing.assert_array_less(0.5, np.sum(ates_temp_disc > 70))
        np.testing.assert_array_less(0.5, np.sum(ates_temp_disc < 60))
        np.testing.assert_allclose(ates_discharge_hot_heat_flow[ates_temp_disc <= 60], 0.0,
                                   atol=tol)

        #TODO still add changing temperatures for discharge cold temperature out

