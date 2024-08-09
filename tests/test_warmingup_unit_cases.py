from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np

from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestWarmingUpUnitCases(TestCase):
    def test_1a(self):
        """
        This is the most basic check where we have a simple network and check for the basic physics.
        This simple network includes one source, pipes, a node, and 3 demands.

        Checks;
        - Demand matching
        - Energy conservation
        - Heat to discharge
        - Checks for conservation of flow and heat at the node
        - Check for equal head at all node connections
        - Checks that the minimum pressure-drop constraints at the demand are satisfied
        - Check that Heat_demand & Heat_source are set correctly and are linked to the Heat_flow
        variable

        """
        import models.unit_cases.case_1a.src.run_1a as run_1a
        from models.unit_cases.case_1a.src.run_1a import HeatProblem

        base_folder = Path(run_1a.__file__).resolve().parent.parent

        # Just a "problem is not infeasible"
        heat_problem = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="1a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )

        results = heat_problem.extract_results()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)

        for node, connected_pipes in heat_problem.energy_system_topology.nodes.items():
            discharge_sum = 0.0
            heat_sum = 0.0

            for i_conn, (_pipe, orientation) in connected_pipes.items():
                discharge_sum += results[f"{node}.HeatConn[{i_conn+1}].Q"] * orientation
                heat_sum += results[f"{node}.HeatConn[{i_conn+1}].Heat"] * orientation
                np.testing.assert_allclose(
                    results[f"{node}.HeatConn[{i_conn+1}].H"], results[f"{node}.H"], atol=1.0e-6
                )

            np.testing.assert_allclose(discharge_sum, 0.0, atol=1.0e-12)
            np.testing.assert_allclose(0.0, heat_sum, atol=1.0e-6)

        for demand in heat_problem.energy_system_components.get("heat_demand", []):
            np.testing.assert_array_less(
                10.2 - 1.0e-6, results[f"{demand}.HeatIn.H"] - results[f"{demand}.HeatOut.H"]
            )
            np.testing.assert_allclose(
                results[f"{demand}.HeatIn.Heat"] - results[f"{demand}.HeatOut.Heat"],
                results[f"{demand}.Heat_demand"],
                atol=1.0e-6,
            )
            np.testing.assert_allclose(
                results[f"{demand}.Heat_demand"], results[f"{demand}.Heat_flow"], atol=1.0e-6
            )

        for source in heat_problem.energy_system_components.get("heat_source", []):
            np.testing.assert_allclose(
                results[f"{source}.HeatOut.Heat"] - results[f"{source}.HeatIn.Heat"],
                results[f"{source}.Heat_source"],
                atol=1.0e-6,
            )
            np.testing.assert_allclose(
                results[f"{source}.Heat_source"], results[f"{source}.Heat_flow"], atol=1.0e-6
            )

    def test_2a(self):
        """
        This is the most basic check where we have a simple network and check for the basic physics.
        This simple network includes two source, pipes, nodes, and 3 demands.

        Checks;
        - Demand matching
        - Energy conservation
        - Heat to discharge

        """
        import models.unit_cases.case_2a.src.run_2a as run_2a
        from models.unit_cases.case_2a.src.run_2a import HeatProblem

        base_folder = Path(run_2a.__file__).resolve().parent.parent

        # Just a "problem is not infeasible"
        heat_problem = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="2a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )

        demand_matching_test(heat_problem, heat_problem.extract_results())
        energy_conservation_test(heat_problem, heat_problem.extract_results())
        heat_to_discharge_test(heat_problem, heat_problem.extract_results())

    def test_3a(self):
        """
        This is the most basic check where we have a simple network and check for the basic physics.
        This simple network includes one source, pipes, node, a tank storage and 3 demands.

        Checks;
        - Demand matching
        - Energy conservation
        - Heat to discharge
        - Check the flow direction variable (this problem should always have a switching flow
        direction for the pipe connected to the buffer tank)
        - Check that the Heat_buffer & Heat_flow variable are set correctly
        - Check that the history for the buffer is set correctly at t=0
        - Check that the heat loss is positive and as expected
        - Check that the Stored heat is the sum of (dis)charge and losses

        """
        import models.unit_cases.case_3a.src.run_3a as run_3a
        from models.unit_cases.case_3a.src.run_3a import HeatProblem

        base_folder = Path(run_3a.__file__).resolve().parent.parent

        # Just a "problem is not infeasible"
        heat_problem = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="3a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )

        results = heat_problem.extract_results()
        parameters = heat_problem.parameters(0)
        bounds = heat_problem.bounds()

        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        heat_to_discharge_test(heat_problem, results)

        # We only check the flow directions for the time-steps that there is flow in the pipe.
        inds = np.round(1 - results["Pipe_e53a__is_disconnected"]).astype(bool)
        np.testing.assert_allclose(
            np.round(results["Pipe_e53a__flow_direct_var"][inds]) * 2.0 - 1.0,
            np.sign(results["Pipe_e53a.Q"][inds]),
        )

        for buffer in heat_problem.energy_system_components.get("heat_buffer", []):
            np.testing.assert_allclose(
                results[f"{buffer}.Heat_buffer"], results[f"{buffer}.Heat_flow"]
            )
            np.testing.assert_allclose(
                results[f"{buffer}.HeatIn.Heat"] - results[f"{buffer}.HeatOut.Heat"],
                results[f"{buffer}.Heat_buffer"],
            )
            # buffer should have positive heat loss
            assert parameters[f"{buffer}.heat_loss_coeff"] > 0.0
            np.testing.assert_allclose(
                results[f"{buffer}.Stored_heat"] * parameters[f"{buffer}.heat_loss_coeff"],
                results[f"{buffer}.Heat_loss"],
            )
            np.testing.assert_allclose(
                results[f"{buffer}.Stored_heat"][0], bounds[f"{buffer}.Stored_heat"][0].values[0]
            )
            np.testing.assert_allclose(
                results[f"{buffer}.Stored_heat"][-1] - results[f"{buffer}.Stored_heat"][0],
                np.sum(results[f"{buffer}.Heat_buffer"][1:] * 3600.0)
                - np.sum(results[f"{buffer}.Heat_loss"][1:] * 3600.0),
                atol=1.0,
            )
            np.testing.assert_allclose(results[f"{buffer}.Heat_buffer"][0], 0.0, atol=1.0e-6)

            np.testing.assert_allclose(
                results[f"{buffer}.dH"][inds],
                results[f"{buffer}.HeatOut.H"][inds] - results[f"{buffer}.HeatIn.H"][inds],
                atol=1.0e-6,
            )
