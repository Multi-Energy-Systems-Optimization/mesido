from unittest import TestCase
from unittest.mock import MagicMock

from mesido.workflows.grow_workflow import estimate_and_update_progress_status


class TestProgress(TestCase):

    # 1
    def estimate_progress_nhl_ts1_s1_p1(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [1.0 / 2.0, "Optimization task 1.0 out of 2.0 has completed"],
        )

    # 2
    def estimate_progress_nhl_ts1_s1_p2(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [2.0 / 2.0, "Optimization task 2.0 out of 2.0 has completed"],
        )
        return None

    # 3
    def estimate_progress_hl_ts2_s1_phl(self, task_quantity_perc_completed: float, msg: str):
        return None

    # 4.1
    def estimate_progress_nhl_ts2_s1_p1(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [1.0 / 4.0, "Optimization task 1.0 out of 4.0 has completed"],
        )
        return None

    # 4.2
    def estimate_progress_nhl_ts2_s1_p2(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [2.0 / 4.0, "Optimization task 2.0 out of 4.0 has completed"],
        )
        return None

    # 5.1
    def estimate_progress_nhl_ts2_s2_p1(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [3.0 / 4.0, "Optimization task 3.0 out of 4.0 has completed"],
        )
        return None

    # 5.2
    def estimate_progress_nhl_ts2_s2_p2(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [4.0 / 4.0, "Optimization task 4.0 out of 4.0 has completed"],
        )
        return None

    # 6
    def estimate_progress_hl_ts2_s2_phl(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [5.0 / 6.0, "Optimization task 5.0 out of 6.0 has completed"],
        )
        return None

    # 7
    def estimate_progress_hl_ts2_s2_php(self, task_quantity_perc_completed: float, msg: str):
        self.assertEqual(
            [task_quantity_perc_completed, msg],
            [6.0 / 6.0, "Optimization task 6.0 out of 6.0 has completed"],
        )
        return None


class TestEstimateAndUpdateProgressStatus(TestCase):

    def test_progess(self):
        """
        Test the progress status of the grow workflow for the different scenarios are calculated
        correctly.

        Checks:
        - #1: Priority = 1, total stages = 1, stage = 1, minimize_head_losses = False -> macth heat
        demand
        - #2: Priority = 2, total stages = 1, stage = 1, minimize_head_losses = False -> minimize
        TCO

        - #3: Priority = 2**31 - 2, total stages = 2, stage = 1, minimize_head_losses = True -> give
        error since the function does not cater for this scenario

        - #4.1: Priority = 1, total stages = 2, stage = 1 -> match heating demand
        - #4.2: Priority = 1, total stages = 2, stage 1 = -> minimize TCO
        - #5.1: Priority = 1, total stages = 2, stage = 2 -> match heating demand
        - #5.2: Priority = 2, total stages = 2, stage = 2 -> minimize TCO

        - #6 Priority = 2**31 - 2, total stages = 2, stage = 2, minimize_head_losses = True -> head
        loss optimization
        - #7 Priority = 2**31 - 1, total stages = 2, stage = 2, minimize_head_losses = True ->
        hydraulic power optimization


        """

        mock_endscenario_class = MagicMock()
        test_progresss = TestProgress()

        # 1
        priority = 1
        mock_endscenario_class._total_stages = 1
        mock_endscenario_class._stage = 1
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": False}
        mock_endscenario_class._workflow_progress_status = (
            test_progresss.estimate_progress_nhl_ts1_s1_p1
        )
        estimate_and_update_progress_status(mock_endscenario_class, priority)

        # 2
        priority = 2
        mock_endscenario_class._total_stages = 1
        mock_endscenario_class._stage = 1
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": False}
        mock_endscenario_class._workflow_progress_status = (
            test_progresss.estimate_progress_nhl_ts1_s1_p2
        )
        estimate_and_update_progress_status(mock_endscenario_class, priority)

        # 3
        priority = 2**31 - 2
        mock_endscenario_class._total_stages = 2
        mock_endscenario_class._stage = 1
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": True}
        mock_endscenario_class._workflow_progress_status = (
            test_progresss.estimate_progress_hl_ts2_s1_phl
        )
        with self.assertRaises(SystemExit) as cm:
            estimate_and_update_progress_status(mock_endscenario_class, priority)
        self.assertEqual(
            cm.exception.args[0],
            "The function does not cater for stage number:1 & priority:2147483646",
        )

        # 4.1
        priority = 1
        mock_endscenario_class._total_stages = 2
        mock_endscenario_class._stage = 1
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": False}
        mock_endscenario_class._workflow_progress_status = (
            test_progresss.estimate_progress_nhl_ts2_s1_p1
        )
        estimate_and_update_progress_status(mock_endscenario_class, priority)

        # 4.2
        priority = 2
        mock_endscenario_class._total_stages = 2
        mock_endscenario_class._stage = 1
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": False}
        mock_endscenario_class._workflow_progress_status = (
            test_progresss.estimate_progress_nhl_ts2_s1_p2
        )
        estimate_and_update_progress_status(mock_endscenario_class, priority)

        # 5.1
        priority = 1
        mock_endscenario_class._total_stages = 2
        mock_endscenario_class._stage = 2
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": False}
        mock_endscenario_class._workflow_progress_status = (
            test_progresss.estimate_progress_nhl_ts2_s2_p1
        )
        estimate_and_update_progress_status(mock_endscenario_class, priority)

        # 5.2
        priority = 2
        mock_endscenario_class._total_stages = 2
        mock_endscenario_class._stage = 2
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": False}
        mock_endscenario_class._workflow_progress_status = (
            test_progresss.estimate_progress_nhl_ts2_s2_p2
        )
        estimate_and_update_progress_status(mock_endscenario_class, priority)

        # 6
        priority = 2**31 - 2
        mock_endscenario_class._total_stages = 2
        mock_endscenario_class._stage = 2
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": True}
        mock_endscenario_class._workflow_progress_status = (
            test_progresss.estimate_progress_hl_ts2_s2_phl
        )
        estimate_and_update_progress_status(mock_endscenario_class, priority)

        # 7
        priority = 2**31 - 1
        mock_endscenario_class._total_stages = 2
        mock_endscenario_class._stage = 2
        mock_endscenario_class.heat_network_settings = {"minimize_head_losses": True}
        mock_endscenario_class._workflow_progress_status = (
            test_progresss.estimate_progress_hl_ts2_s2_php
        )
        estimate_and_update_progress_status(mock_endscenario_class, priority)


if __name__ == "__main__":
    a = TestEstimateAndUpdateProgressStatus()
    a.test_progess()
