from unittest import TestCase
from unittest.mock import MagicMock

from mesido.workflows.grow_workflow import estimate_and_update_progress_status


class TestProgress(TestCase):
    def estimate_progress_hl(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [5.0 / 6.0, "Optimization task 5.0 out of 6.0 has completed"],
        )
        return None

    def estimate_progress_nhl_stg2(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [3.0 / 4.0, "Optimization task 3.0 out of 4.0 has completed"],
        )
        return None

    def estimate_progress_nhl_stg1(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [2.0 / 2.0, "Optimization task 2.0 out of 2.0 has completed"],
        )
        return None


class TestEstimateAndUpdateProgressStatus(TestCase):

    def test_progess(self):
        """
        Test the progress status of the grow workflow for the different scenarios are calculated
        correctly.

        Checks:
        - Priority = 2**31 - 2, total stage = 2, stage = 2, minimize_head_losses = True
        - Priority = 1, total stage = 2, stage = 1, minimize_head_losses = False
        - Priority = 2, total stage = 1, stage = 1, minimize_head_losses = False
        """

        mock_endscenario_class = MagicMock()
        test_progresss = TestProgress()

        priority = 2**31 - 2
        mock_endscenario_class._total_stages = 2
        mock_endscenario_class._stage = 2
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": True}
        mock_endscenario_class._workflow_progress_status = test_progresss.estimate_progress_hl
        estimate_and_update_progress_status(mock_endscenario_class, priority)

        priority = 1
        mock_endscenario_class._total_stages = 2
        mock_endscenario_class._stage = 2
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": False}
        mock_endscenario_class._workflow_progress_status = test_progresss.estimate_progress_nhl_stg2
        estimate_and_update_progress_status(mock_endscenario_class, priority)

        priority = 2
        mock_endscenario_class._total_stages = 1
        mock_endscenario_class._stage = 1
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": False}
        mock_endscenario_class._workflow_progress_status = test_progresss.estimate_progress_nhl_stg1
        estimate_and_update_progress_status(mock_endscenario_class, priority)


if __name__ == "__main__":
    a = TestEstimateAndUpdateProgressStatus()
    a.test_progess()
