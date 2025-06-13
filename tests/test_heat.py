from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestHeat(TestCase):
    def test_heat_loss(self):
        """
        This is a test to check whether the network (pipes) are dissipating milp as we expect.

        Checks:
        - Check that the produced heat is strictly higher than the consumed heat
        - Check for energy conservation in the network

        """
        import models.source_pipe_sink.src.double_pipe_heat as double_pipe_heat
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        base_folder = Path(double_pipe_heat.__file__).resolve().parent.parent

        case = run_esdl_mesido_optimization(
            SourcePipeSink,
            base_folder=base_folder,
            esdl_file_name="sourcesink.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results = case.extract_results()

        source = results["source.Heat_source"]
        demand = results["demand.Heat_demand"]

        # With non-zero milp losses in pipes, the demand should always be
        # strictly lower than what is produced.
        np.testing.assert_array_less(demand, source)

        demand_matching_test(case, results)
        energy_conservation_test(case, results)
        heat_to_discharge_test(case, results)

    def test_zero_heat_loss(self):
        """
        Check the optimiziation function when the zero heat loss is used.

        Checks:
        - Should check that produced equals consumed.
        - Should check the heat loss variable being zero

        """
        import models.source_pipe_sink.src.double_pipe_heat as double_pipe_heat
        from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

        class Model(SourcePipeSink):
            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = True

                return options

        base_folder = Path(double_pipe_heat.__file__).resolve().parent.parent

        case = run_esdl_mesido_optimization(
            Model,
            base_folder=base_folder,
            esdl_file_name="sourcesink.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )

        results = case.extract_results()
        parameters = case.parameters(0)

        for pipe in case.energy_system_components.get("heat_pipe", []):
            np.testing.assert_allclose(results[f"{pipe}__hn_heat_loss"], 0.0)
            np.testing.assert_allclose(parameters[f"{pipe}.Heat_loss"], 0.0)

        demand_matching_test(case, results)
        energy_conservation_test(case, results)
        heat_to_discharge_test(case, results)


class TestMinMaxPressureOptions(TestCase):
    import models.source_pipe_sink.src.double_pipe_heat as double_pipe_heat
    from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

    base_folder = Path(double_pipe_heat.__file__).resolve().parent.parent
    min_pressure = 5.0
    max_pressure = 12.0
    esdl_file = "sourcesink.esdl"
    input_time_series_file = "timeseries_import.csv"

    class SmallerPipes(SourcePipeSink):
        # We want to force the dynamic pressure in the system to be higher
        # than 12 - 4 = 8 bar (typical upper and lower bounds). We make the
        # pipes smaller in diameter/area to accomplish this. We also adjust
        # the minimum milp delivered by the source, such that a maximum
        # pressure range can force this to go lower than usual.
        def parameters(self, ensemble_member):
            parameters = super().parameters(ensemble_member)
            for p in self.energy_system_components["heat_pipe"]:
                parameters[f"{p}.diameter"] = 0.04
                parameters[f"{p}.area"] = 0.25 * 3.14159265 * parameters[f"{p}.diameter"] ** 2
            return parameters

        def bounds(self):
            bounds = super().bounds()
            bounds["source.Heat_source"] = (0.0, 125_000.0)
            return bounds

        def goals(self):
            return []

    class MinPressure(SmallerPipes):
        def energy_system_options(self):
            options = super().energy_system_options()
            assert "pipe_minimum_pressure" in self.heat_network_settings
            self.heat_network_settings["pipe_minimum_pressure"] = (
                TestMinMaxPressureOptions.min_pressure
            )
            return options

    class MaxPressure(SmallerPipes):
        def energy_system_options(self):
            options = super().energy_system_options()
            assert "pipe_maximum_pressure" in self.heat_network_settings
            options["pipe_maximum_pressure"] = TestMinMaxPressureOptions.max_pressure
            return options

    class MinMaxPressure(SmallerPipes):
        def energy_system_options(self):
            options = super().energy_system_options()
            self.heat_network_settings["pipe_minimum_pressure"] = (
                TestMinMaxPressureOptions.min_pressure
            )
            self.heat_network_settings["pipe_maximum_pressure"] = (
                TestMinMaxPressureOptions.max_pressure
            )
            return options

    def test_min_max_pressure_options(self):
        """
        Check if the min and max pressure options are correctly enforced on the
        optimization. This is achieved by creating a problem where the pressure drop needed
        to match demands is infeasible under the desired pressured range.

        Checks:
        - unbounded problem has requires more pressure drop than allowed by the min and max pressure
        - min pressure
        - max pressure

        """
        case_default = run_esdl_mesido_optimization(
            self.SmallerPipes,
            base_folder=self.base_folder,
            esdl_file_name=self.esdl_file,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file=self.input_time_series_file,
        )
        case_min_pressure = run_esdl_mesido_optimization(
            self.MinPressure,
            base_folder=self.base_folder,
            esdl_file_name=self.esdl_file,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file=self.input_time_series_file,
        )
        case_max_pressure = run_esdl_mesido_optimization(
            self.MaxPressure,
            base_folder=self.base_folder,
            esdl_file_name=self.esdl_file,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file=self.input_time_series_file,
        )
        case_min_max_pressure = run_esdl_mesido_optimization(
            self.MinMaxPressure,
            base_folder=self.base_folder,
            esdl_file_name=self.esdl_file,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file=self.input_time_series_file,
        )

        def _get_min_max_pressure(case):
            min_head = np.inf
            max_head = -np.inf

            results = case.extract_results()
            for p in case.energy_system_components["heat_pipe"]:
                min_head_in = min(results[f"{p}.HeatIn.H"])
                min_head_out = min(results[f"{p}.HeatOut.H"])
                min_head = min([min_head, min_head_in, min_head_out])

                max_head_in = max(results[f"{p}.HeatIn.H"])
                max_head_out = max(results[f"{p}.HeatOut.H"])
                max_head = max([max_head, max_head_in, max_head_out])

            return min_head / 10.2, max_head / 10.2

        min_, max_ = _get_min_max_pressure(case_default)
        self.assertGreater(max_ - min_, self.max_pressure - self.min_pressure)
        base_objective_value = case_default.objective_value

        min_, max_ = _get_min_max_pressure(case_min_pressure)
        self.assertGreater(min_, self.min_pressure * 0.99)
        self.assertGreater(max_, self.max_pressure)
        self.assertAlmostEqual(case_min_pressure.objective_value, base_objective_value, 4)

        min_, max_ = _get_min_max_pressure(case_max_pressure)
        self.assertLess(min_, self.min_pressure)
        self.assertLess(max_, self.max_pressure * 1.01)
        self.assertAlmostEqual(case_max_pressure.objective_value, base_objective_value, 4)

        min_, max_ = _get_min_max_pressure(case_min_max_pressure)
        self.assertGreater(min_, self.min_pressure * 0.99)
        self.assertLess(max_, self.max_pressure * 1.01)
        target = case_default.get_timeseries("demand.target_heat_demand").values
        self.assertLess(
            np.sum((case_default.extract_results()["demand.Heat_demand"] - target) ** 2),
            np.sum((case_min_max_pressure.extract_results()["demand.Heat_demand"] - target) ** 2),
        )


class TestDisconnectablePipe(TestCase):
    import models.source_pipe_sink.src.double_pipe_heat as double_pipe_heat
    from models.source_pipe_sink.src.double_pipe_heat import SourcePipeSink

    base_folder = Path(double_pipe_heat.__file__).resolve().parent.parent

    class ModelConnected(SourcePipeSink):
        # We allow the pipe to be disconnectable. We need to be sure that
        # the solution is still feasible (source delivering no heat), so we
        # lower the lower bound.

        def parameters(self, ensemble_member):
            parameters = super().parameters(ensemble_member)
            for p in self.energy_system_components["heat_pipe"]:
                parameters[f"{p}.disconnectable"] = True
            return parameters

        def bounds(self):
            bounds = super().bounds()
            bounds["source.Heat_source"] = (0.0, 125_000.0)
            return bounds

    class ModelDisconnected(ModelConnected):
        def constraints(self, ensemble_member):
            constraints = super().constraints(ensemble_member)

            # Note that we still enforce a _minimum_ velocity in the pipe, if it
            # is connected. So if we force the discharge to zero, that means we
            # force it to be disconnected.
            times = self.times()
            q = self.state_at("Pipe1.Q", times[1], ensemble_member)
            constraints.append((q, 0.0, 0.0))

            return constraints

        def energy_system_options(self):
            options = super().energy_system_options()
            options["heat_loss_disconnected_pipe"] = False
            return options

    class ModelDisconnectedNoHeatLoss(ModelDisconnected):
        def energy_system_options(self):
            options = super().energy_system_options()
            options["heat_loss_disconnected_pipe"] = False
            return options

    def test_disconnected_network_pipe(self):
        """
        Check whether the is_disconnected variable behaves as expected. This variable should be
        True=1 when the flow through the pipe is zero. This is done by running two problems, one
        where the flow is forced to zero and it is expected that the optimization should make the
        pipe disconnected, and one where it is expected for the pipe to stay connected to match
        demand although the pipe is allowed to be disconnected.

        Checks:
        - Sanity check that min velocity is >0
        - Check that pipe stays connected when flow is not forced to zero
        - Check that pipe becomes disconnected when flow is forced to zero

        """
        case_connected = run_esdl_mesido_optimization(
            self.ModelConnected,
            base_folder=self.base_folder,
            esdl_file_name="sourcesink.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results_connected = case_connected.extract_results()
        q_connected = results_connected["Pipe1.Q"]

        case_disconnected = run_esdl_mesido_optimization(
            self.ModelDisconnected,
            base_folder=self.base_folder,
            esdl_file_name="sourcesink.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results_disconnected = case_disconnected.extract_results()
        q_disconnected = results_disconnected["Pipe1.Q"]

        # Sanity check, as we rely on the minimum velocity being strictly
        # larger than zero for the discharge constraint to disconnect the
        # pipe.
        self.assertGreater(case_connected.heat_network_settings["minimum_velocity"], 0.0)

        self.assertLess(q_disconnected[1], q_connected[1])
        self.assertAlmostEqual(q_disconnected[1], 0.0, 5)
        np.testing.assert_allclose(results_connected["Pipe1__is_disconnected"], 0.0)
        np.testing.assert_allclose(results_disconnected["Pipe1__is_disconnected"][1], 1.0)

        np.testing.assert_allclose(q_connected[2:], q_disconnected[2:])

    class ModelDisconnectedDarcyWeisbach(ModelDisconnected):
        def energy_system_options(self):
            options = super().energy_system_options()
            self.heat_network_settings["head_loss_option"] = (
                HeadLossOption.LINEARIZED_N_LINES_WEAK_INEQUALITY
            )
            return options

    def test_disconnected_pipe_darcy_weisbach(self):
        """
        Just a sanity check that the head loss constraints for disconnectable
        pipes works with LINEARIZED_ONE_LINE_EQUALITY as well as LINEARIZED_N_LINES_WEAK_INEQUALITY.

        Checks:
        - That the flow is equal for both types of head loss constraint settings.
        - Check that is_disconnected is set correctly.

        """

        case_linear = run_esdl_mesido_optimization(
            self.ModelDisconnected,
            base_folder=self.base_folder,
            esdl_file_name="sourcesink.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results_linear = case_linear.extract_results()
        q_linear = results_linear["Pipe1.Q"]

        case_dw = run_esdl_mesido_optimization(
            self.ModelDisconnectedDarcyWeisbach,
            base_folder=self.base_folder,
            esdl_file_name="sourcesink.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )
        results_dw = case_dw.extract_results()
        q_dw = results_dw["Pipe1.Q"]

        # Without any constraints on the maximum or minimum head/pressure
        # (loss) in the system, we expect equal results.
        np.testing.assert_allclose(q_linear, q_dw)
        np.testing.assert_allclose(results_dw["Pipe1__is_disconnected"][1], 1.0)


if __name__ == "__main__":

    a = TestHeat()
    a.test_heat_loss()
