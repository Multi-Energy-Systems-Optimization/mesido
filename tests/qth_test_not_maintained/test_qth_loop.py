# import logging
# from pathlib import Path
# from unittest import TestCase
#
# import numpy as np
#
# from rtctools.util import run_optimization_problem
#
# from mesido.qth_loop_mixin import QTHLoopMixin
# from mesido.util import run_heat_network_optimization
#
#
# logger = logging.getLogger("mesido")
#
#
# class TestQTHLoop(TestCase):
#     def test_basic_buffer_example(self):
#         from models.basic_buffer.src.compare import (
#             HeatProblemPyCML,
#             QTHLoopProblemPyCML,
#             base_folder,
#         )
#
#         # Just a "problem is not infeasible" test
#         _heat_problem, _qth_problem = run_heat_network_optimization(
#             HeatProblemPyCML, QTHLoopProblemPyCML, base_folder=base_folder
#         )
#
#     def test_double_pipe_unequal_length(self):
#         import models.double_pipe_qth.src.cq2_inequality_vs_equality as cq2_inequality_vs_equality
#         from models.double_pipe_qth.src.cq2_inequality_vs_equality import (
#             UnequalLengthQuadraticEquality,
#             UnequalLengthQuadraticEqualityLoop,
#         )
#
#         base_folder = Path(cq2_inequality_vs_equality.__file__).resolve().parent.parent
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             equal_length_quadratic_equality = run_optimization_problem(
#                 UnequalLengthQuadraticEquality, base_folder=base_folder
#             )
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#         with self.assertLogs(logger, level="WARNING") as cm:
#             equal_length_quadratic_equality_loop = run_optimization_problem(
#                 UnequalLengthQuadraticEqualityLoop, base_folder=base_folder
#             )
#
#             self.assertIsInstance(equal_length_quadratic_equality_loop, QTHLoopMixin)
#
#             self.assertNotIn("artificial head loss", str(cm.output))
#
#             if not cm.output:
#                 # Prevent __exit__ from failing on AssertionError
#                 logger.warning("Test succeeded")
#
#         results_quadratic = equal_length_quadratic_equality.extract_results()
#         results_quadratic_loop = equal_length_quadratic_equality_loop.extract_results()
#
#         quadratic_q_1 = results_quadratic["pipe_1_hot.Q"]
#         quadratic_q_2 = results_quadratic["pipe_2_hot.Q"]
#         quadratic_ratio = quadratic_q_1 / quadratic_q_2
#
#         quadratic_loop_q_1 = results_quadratic_loop["pipe_1_hot.Q"]
#         quadratic_loop_q_2 = results_quadratic_loop["pipe_2_hot.Q"]
#         quadratic_loop_ratio = quadratic_loop_q_1 / quadratic_loop_q_2
#
#         # Check that both have a ratio of 2.0
#         np.testing.assert_allclose(quadratic_ratio, 2.0, rtol=1e-6, atol=1e-6)
#         np.testing.assert_allclose(quadratic_loop_ratio, 2.0, rtol=1e-6, atol=1e-6)
