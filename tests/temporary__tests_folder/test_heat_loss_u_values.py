from unittest import TestCase

from mesido._heat_loss_u_values_pipe import heat_loss_u_values_pipe

import numpy as np


class TestHeatLossUValues(TestCase):
    def test_scalar_equal_to_single_element_array(self):
        """
        Check if u values give equivalent results when inputs are provided under the
        different allowed types.

        """
        self.assertEqual(
            heat_loss_u_values_pipe(0.15, 0.075, 0.033),
            heat_loss_u_values_pipe(0.15, [0.075], [0.033]),
        )

        self.assertEqual(
            heat_loss_u_values_pipe(0.15, [0.075], [0.033]),
            heat_loss_u_values_pipe(0.15, np.array([0.075]), np.array([0.033])),
        )

    def test_order_of_layers_matters(self):
        """
        Check that the u values actually are different when we provide different inputs to compute
        them.
        """
        self.assertNotEqual(
            heat_loss_u_values_pipe(0.15, [0.075, 0.025], [0.033, 0.25]),
            heat_loss_u_values_pipe(0.15, [0.025, 0.075], [0.25, 0.033]),
        )

    def test_more_insulation_is_less_heat_loss(self):
        """
        Check that the u values are smaller (thus less milp loss) when we increase the thickness
        of the insulation layers. Check that if we increase the conductivity the u values get
        larger.

        """
        # Thicker inner layer
        np.testing.assert_array_less(
            heat_loss_u_values_pipe(0.15, [0.085, 0.025], [0.033, 0.25]),
            heat_loss_u_values_pipe(0.15, [0.075, 0.025], [0.033, 0.25]),
        )

        # Thicker outer layer
        np.testing.assert_array_less(
            heat_loss_u_values_pipe(0.15, [0.075, 0.035], [0.033, 0.25]),
            heat_loss_u_values_pipe(0.15, [0.075, 0.025], [0.033, 0.25]),
        )

        # Lower conductivity
        np.testing.assert_array_less(
            heat_loss_u_values_pipe(0.15, [0.075, 0.025], [0.024, 0.25]),
            heat_loss_u_values_pipe(0.15, [0.075, 0.025], [0.033, 0.25]),
        )

    def test_duplicate_layers_equals_single_layer_of_double_thickness(self):
        """
        Check that we get equivalent u values results for one layer or that one layer composed out
        of two layers.

        """
        np.testing.assert_array_equal(
            heat_loss_u_values_pipe(0.15, [0.05, 0.05], [0.033, 0.033]),
            heat_loss_u_values_pipe(0.15, 0.1, 0.033),
        )
