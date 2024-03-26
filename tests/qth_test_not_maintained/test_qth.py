# import logging
# from pathlib import Path
# from unittest import TestCase
#
# import numpy as np
#
# from rtctools.util import run_optimization_problem
#
# from mesido.util import run_heat_network_optimization
#
#
# logger = logging.getLogger("mesido")
#
#
# class TestArtificalHeadLoss(TestCase):
#     @classmethod
#     def setUpClass(cls):
#         import models.double_pipe_qth.src.double_pipe_qth as double_pipe_qth
#
#         cls.base_folder = Path(double_pipe_qth.__file__).resolve().parent.parent
#
#     def test_single_pipe(self):
#         from models.double_pipe_qth.src.double_pipe_qth import SinglePipeQTH
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             run_optimization_problem(SinglePipeQTH, base_folder=self.base_folder)
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#     def test_double_pipe_unequal(self):
#         from models.double_pipe_qth.src.double_pipe_qth import DoublePipeUnequalQTH
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             run_optimization_problem(DoublePipeUnequalQTH, base_folder=self.base_folder)
#
#             self.assertIn("Pipe pipe_2_hot has artificial head loss", str(cm.output))
#             self.assertIn("Pipe pipe_2_cold has artificial head loss", str(cm.output))
#
#             self.assertNotIn("Pipe pipe_1_hot has artificial head loss", str(cm.output))
#             self.assertNotIn("Pipe pipe_1_cold has artificial head loss", str(cm.output))
#
#     def test_double_pipe_unequal_with_valve(self):
#         from models.double_pipe_qth.src.double_pipe_qth import DoublePipeUnequalWithValveQTH
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             run_optimization_problem(DoublePipeUnequalWithValveQTH, base_folder=self.base_folder)
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#
# class TestNoHeadLoss(TestCase):
#     @classmethod
#     def setUpClass(cls):
#         import models.double_pipe_qth.src.double_pipe_qth as double_pipe_qth
#
#         cls.base_folder = Path(double_pipe_qth.__file__).resolve().parent.parent
#
#     def test_single_pipe_no_headloss(self):
#         from mesido.qth_mixin import _MinimizeHeadLosses
#
#         from models.double_pipe_qth.src.single_pipe_no_headloss import SinglePipeQTHNoHeadLoss
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             problem = run_optimization_problem(
#                 SinglePipeQTHNoHeadLoss, base_folder=self.base_folder
#             )
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#             priorities = {g.priority for g in [*problem.path_goals(), *problem.goals()]}
#
#             self.assertNotIn(_MinimizeHeadLosses.priority, priorities)
#
#
# class TestHeadLossEqualities(TestCase):
#     @classmethod
#     def setUpClass(cls):
#         import models.double_pipe_qth.src.cq2_inequality_vs_equality as cq2_inequality_vs_equality
#
#         cls.base_folder = Path(cq2_inequality_vs_equality.__file__).resolve().parent.parent
#
#     def test_equal_length(self):
#         from models.double_pipe_qth.src.cq2_inequality_vs_equality import (
#             EqualLengthLinearEquality,
#             EqualLengthQuadraticEquality,
#         )
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             equal_length_linear_equality = run_optimization_problem(
#                 EqualLengthLinearEquality, base_folder=self.base_folder
#             )
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             equal_length_quadratic_equality = run_optimization_problem(
#                 EqualLengthQuadraticEquality, base_folder=self.base_folder
#             )
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#         # Check results of linear head loss equation
#         results_linear = equal_length_linear_equality.extract_results()
#
#         linear_q_1 = results_linear["pipe_1_hot.Q"]
#         linear_q_2 = results_linear["pipe_2_hot.Q"]
#         linear_ratio = linear_q_1 / linear_q_2
#
#         np.testing.assert_allclose(linear_ratio, 1.0)
#
#         # Check results of quadratic head loss equation
#         results_quadratic = equal_length_quadratic_equality.extract_results()
#
#         quadratic_q_1 = results_quadratic["pipe_1_hot.Q"]
#         quadratic_q_2 = results_quadratic["pipe_2_hot.Q"]
#         quadratic_ratio = quadratic_q_1 / quadratic_q_2
#
#         np.testing.assert_allclose(quadratic_ratio, 1.0)
#
#     def test_unequal_length(self):
#         from models.double_pipe_qth.src.cq2_inequality_vs_equality import (
#             UnequalLengthLinearEquality,
#             UnequalLengthQuadraticEquality,
#         )
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             equal_length_linear_equality = run_optimization_problem(
#                 UnequalLengthLinearEquality, base_folder=self.base_folder
#             )
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             equal_length_quadratic_equality = run_optimization_problem(
#                 UnequalLengthQuadraticEquality, base_folder=self.base_folder
#             )
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#         # Check results of linear head loss equation
#         results_linear = equal_length_linear_equality.extract_results()
#
#         linear_q_1 = results_linear["pipe_1_hot.Q"]
#         linear_q_2 = results_linear["pipe_2_hot.Q"]
#         linear_ratio = linear_q_1 / linear_q_2
#
#         np.testing.assert_allclose(linear_ratio, 4.0)
#
#         # Check results of quadratic head loss equation
#         results_quadratic = equal_length_quadratic_equality.extract_results()
#
#         quadratic_q_1 = results_quadratic["pipe_1_hot.Q"]
#         quadratic_q_2 = results_quadratic["pipe_2_hot.Q"]
#         quadratic_ratio = quadratic_q_1 / quadratic_q_2
#
#         np.testing.assert_allclose(quadratic_ratio, 2.0)
#
#     def test_unequal_length_valve(self):
#         from models.double_pipe_qth.src.cq2_inequality_vs_equality import (
#             UnequalLengthValveLinearEquality,
#             UnequalLengthValveQuadraticEquality,
#         )
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             equal_length_linear_equality = run_optimization_problem(
#                 UnequalLengthValveLinearEquality, base_folder=self.base_folder
#             )
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             equal_length_quadratic_equality = run_optimization_problem(
#                 UnequalLengthValveQuadraticEquality, base_folder=self.base_folder
#             )
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#         # Check results of linear head loss equation
#         results_linear = equal_length_linear_equality.extract_results()
#
#         linear_q_1 = results_linear["pipe_1_hot.Q"]
#         linear_q_2 = results_linear["pipe_2_hot.Q"]
#         linear_ratio = linear_q_1 / linear_q_2
#
#         # The optimization should prefer the shorter pipe much more than would
#         # follow from hydraulic equality
#         np.testing.assert_array_less(10.0, linear_ratio)
#
#         # Check results of quadratic head loss equation
#         results_quadratic = equal_length_quadratic_equality.extract_results()
#
#         quadratic_q_1 = results_quadratic["pipe_1_hot.Q"]
#         quadratic_q_2 = results_quadratic["pipe_2_hot.Q"]
#         quadratic_ratio = quadratic_q_1 / quadratic_q_2
#
#         # The optimization should prefer the shorter pipe much more than would
#         # follow from hydraulic equality
#         np.testing.assert_array_less(10.0, quadratic_ratio)
#
#         # Because the hydraulics (equality constraints) no longer determine
#         # the results with the presence of the control valve, we expect the
#         # quadratic and linear formulations to have the same result.
#         np.testing.assert_allclose(linear_q_1, quadratic_q_1)
#         np.testing.assert_allclose(linear_q_2, quadratic_q_2)
#
#
# class TestDemandTemperatureOptions(TestCase):
#     def test_demand_temperature_options(self):
#         import models.basic_source_and_demand.src.qth_minimize_temperatures as qth_minimize_temperatures  # noqa: E501
#         from models.basic_source_and_demand.src.qth_minimize_temperatures import (
#             QTHFixedDeltaTemperature,
#             QTHMinReturnMaxDeltaT,
#         )
#
#         base_folder = Path(qth_minimize_temperatures.__file__).resolve().parent.parent
#
#         fixed_dt = run_optimization_problem(QTHFixedDeltaTemperature, base_folder=base_folder)
#         min_return_max_dt = run_optimization_problem(QTHMinReturnMaxDeltaT,
#         base_folder=base_folder)
#
#         results_fixed_dt = fixed_dt.extract_results()
#         results_min_return_max_dt = min_return_max_dt.extract_results()
#
#         eps = 1e-4
#
#         # Check that the minimum supply temperature is met.
#         demand_tin_fixed_dt = results_fixed_dt["demand.QTHIn.T"]
#         demand_tin_min_return_max_dt = results_min_return_max_dt["demand.QTHIn.T"]
#
#         np.testing.assert_array_less(70.0 - eps, demand_tin_fixed_dt)
#         np.testing.assert_array_less(70.0 - eps, demand_tin_min_return_max_dt)
#
#         # Check that the minimum return temperature is matched for the
#         # MIN_RETURN_MAX_DT case.
#         demand_tout_fixed_dt = results_fixed_dt["demand.QTHOut.T"]
#         demand_tout_min_return_max_dt = results_min_return_max_dt["demand.QTHOut.T"]
#
#         np.testing.assert_array_less(45.0 - eps, demand_tout_min_return_max_dt)
#
#         # Check that the dT is either exactly, or at most 30.0 depending on
#         # the option.
#         demand_dt_fixed_dt = demand_tin_fixed_dt - demand_tout_fixed_dt
#         demand_dt_min_return_max_dt = demand_tin_min_return_max_dt - demand_tout_min_return_max_dt
#
#         np.testing.assert_allclose(demand_dt_fixed_dt, 30.0, atol=eps)
#         np.testing.assert_array_less(demand_dt_min_return_max_dt, 30.0 + eps)
#
#
# class TestSourcesEqualTemperature(TestCase):
#     def test_sources_equal_temperature(self):
#         import models.unit_cases.case_2a.src.equal_temperatures as equal_temperatures
#         from models.unit_cases.case_2a.src.equal_temperatures import (
#             HeatProblem,
#             QTHEqualTempSources,
#         )
#
#         base_folder = Path(equal_temperatures.__file__).resolve().parent.parent
#
#         equal_temperatures = run_heat_network_optimization(
#             HeatProblem, QTHEqualTempSources, base_folder=base_folder
#         )
#         results_eq_temp = equal_temperatures[1].extract_results()
#
#         eps = 1e-4
#
#         # Check that sources operate at the same temperature
#         source1_temp = results_eq_temp["GeothermalSource_fafd.QTHOut.T"]
#         source2_temp = results_eq_temp["GeothermalSource_27cb.QTHOut.T"]
#
#         np.testing.assert_allclose(source1_temp, source2_temp, atol=eps)
