import sys
from pathlib import Path
from typing import Dict
from unittest import TestCase

from mesido._heat_loss_u_values_pipe import pipe_heat_loss
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.pipe_class import PipeClass
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.util import run_esdl_mesido_optimization

import numpy as np
import numpy.testing

MIP_TOLERANCE = 1e-8


class TestTopoConstraintsOnPipeDiameterSizingExample(TestCase):
    """
    Tests the topo variables and constraints of heat_mixin on the Pipe Diameter Sizing example.
    """

    problem: TechnoEconomicMixin
    results: Dict[str, np.ndarray]

    @classmethod
    def setUpClass(cls) -> None:
        root_folder = str(Path(__file__).resolve().parent.parent)
        sys.path.insert(1, root_folder)

        import examples.pipe_diameter_sizing.src.example  # noqa: E402, I100
        from examples.pipe_diameter_sizing.src.example import (
            PipeDiameterSizingProblem,
        )  # noqa: E402, I100

        base_folder = (
            Path(examples.pipe_diameter_sizing.src.example.__file__).resolve().parent.parent
        )

        del root_folder
        sys.path.pop(1)

        cls.problem = run_esdl_mesido_optimization(
            PipeDiameterSizingProblem,
            base_folder=base_folder,
            esdl_file_name="2a.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.xml",
        )
        cls.results = cls.problem.extract_results()

    def test_pipe_class_var(self):
        """
        This test is to check whether all variables associated to pipe class optimization are set
        as expected.

        Tests the variables stored in:
        - pipe_topo_pipe_class_var check that only one is selected
        - pipe_topo_max_discharge_var is that of the selected pipe class
        - pipe_topo_cost_var is that of the selected pipe class
        - pipe_diameter_var is that of the selected pipe class
        - pipe_heat_loss_var is that of the selected pipe class
        """
        for p in self.problem.energy_system_components.get("heat_pipe", []):
            # If there is nothing to choose for the optimizer, no pipe class binaries are made
            if self.problem.pipe_classes(p) is None or len(self.problem.pipe_classes(p)) == 1:
                continue

            class_vars = self.get_pipe_class_vars(p)
            chosen_pc = self.get_chosen_pipe_class(p, class_vars)

            for var_name, value in class_vars.items():
                self.assertTrue(var_name in self.results, msg=f"{var_name} not in results")
                self.assertTrue(
                    abs(value - 0.0) < MIP_TOLERANCE or abs(value - 1.0) < MIP_TOLERANCE,
                    msg=f"Binary {var_name} isn't either 0.0 or 1.0, it is {value}",
                )
            np.testing.assert_almost_equal(
                1.0,
                np.sum(val for val in class_vars.values()),
                err_msg=f"Not exactly 1 pipe class selected for {p}",
            )

            np.testing.assert_array_almost_equal(
                chosen_pc.inner_diameter,
                self.results[f"{p}__hn_diameter"],
                err_msg=f"{p} inner diameter doesn't match expected",
            )
            np.testing.assert_array_almost_equal(
                chosen_pc.investment_costs,
                self.results[f"{p}__hn_cost"],
                err_msg=f"{p} investment costs doesn't match expected",
            )
            np.testing.assert_array_almost_equal(
                chosen_pc.maximum_discharge,
                self.results[f"{p}__hn_max_discharge"],
                err_msg=f"{p} maximum discharge doesn't match expected",
            )

            expected_heat_losses = self.get_heat_losses(p, chosen_pc)
            np.testing.assert_almost_equal(
                self.results[f"{p}__hn_heat_loss"], expected_heat_losses, 5
            )

    def test_pipe_class_ordering_vars(self):
        """
        This test is to check if the pipe class ordering variables are set as expected. The pipe
        class ordering variables are there to help the optimizer in seeing the relation between
        mulitple integer variables.

        Tests the variables stored in:
        - pipe_topo_global_pipe_clas_count_var
        - pipe_topo_pipe_class_discharge_ordering_var
        - pipe_topo_pipe_class_cost_ordering_var
        - pipe_topo_pipe_class_heat_loss_ordering_var
        """
        pc_sums = {pc.name: 0 for pc in self.problem.get_unique_pipe_classes()}
        total_pipes_to_optimize = 0
        for p in self.problem.energy_system_components.get("heat_pipe", []):
            # If there is nothing to choose for the optimizer, no pipe class binaries are made,
            if self.problem.pipe_classes(p) is None or len(self.problem.pipe_classes(p)) == 1:
                continue
            pipe_class_vars = self.get_pipe_class_vars(p)
            chosen_pc = self.get_chosen_pipe_class(p, pipe_class_vars)
            pc_sums[chosen_pc.name] += 1
            total_pipes_to_optimize += 1
            for pc in self.problem.pipe_classes(p):
                if p in self.problem.cold_pipes:
                    base_name = f"{self.problem.cold_to_hot_pipe(p)}__hn_pipe_class_{pc.name}"
                else:
                    base_name = f"{p}__hn_pipe_class_{pc.name}"
                cost_ordering_var_name = base_name + "_cost_ordering"
                cost_ordering_var = self.results[cost_ordering_var_name]
                if pc.investment_costs < chosen_pc.investment_costs:
                    np.testing.assert_almost_equal(
                        cost_ordering_var,
                        0.0,
                        err_msg=f"expected the cost order var for {p} and {pc=} to be 0.0, since"
                        f"{chosen_pc=} with higher investment costs",
                    )
                elif pc.investment_costs > chosen_pc.investment_costs:
                    np.testing.assert_almost_equal(
                        cost_ordering_var,
                        1.0,
                        err_msg=f"Expected the cost order var for {p} and {pc=} to be 1.0, since"
                        f"{chosen_pc=} with lower investment costs",
                    )

                discharge_ordering_var_name = base_name + "_discharge_ordering"
                discharge_ordering_var = self.results[discharge_ordering_var_name]
                if pc.maximum_discharge < chosen_pc.maximum_discharge:
                    np.testing.assert_almost_equal(
                        discharge_ordering_var,
                        0.0,
                        err_msg=f"expected the discharge order var for {p} and {pc=} to be 0.0, "
                        f"since {chosen_pc=} with higher max discharge",
                    )
                elif pc.maximum_discharge > chosen_pc.maximum_discharge:
                    np.testing.assert_almost_equal(
                        discharge_ordering_var,
                        1.0,
                        err_msg=f"Expected the discharge order var for {p} and {pc=} to be 1.0, "
                        f"since {chosen_pc=} with lower max discharge",
                    )

                heat_loss_ordering_var_name = base_name + "_heat_loss_ordering"
                heat_loss_ordering_var = self.results[heat_loss_ordering_var_name]
                pc_heat_loss = self.get_heat_losses(p, pc)
                chosen_pc_heat_loss = self.get_heat_losses(p, chosen_pc)
                if pc_heat_loss < chosen_pc_heat_loss:
                    np.testing.assert_almost_equal(
                        heat_loss_ordering_var,
                        0.0,
                        err_msg=f"expected the heat loss order var for {p} and {pc=} to be 0.0, "
                        f"since {chosen_pc=} with higher heat losses",
                    )
                elif pc_heat_loss > chosen_pc_heat_loss:
                    np.testing.assert_almost_equal(
                        discharge_ordering_var,
                        1.0,
                        err_msg=f"Expected the heat loss order var for {p} and {pc=} to be 1.0, "
                        f"since {chosen_pc=} with lower heat losses",
                    )

        for pc_name, total_count in pc_sums.items():
            count_var_value = self.results[f"{pc_name}__global_pipe_class_count"]
            np.testing.assert_almost_equal(
                count_var_value,
                total_count,
                err_msg=f"Pipe count for {pc_name} doesn't match the expected {total_count}",
            )
        total_pipe_count = sum(pc_sums.values())
        np.testing.assert_equal(
            total_pipe_count,
            total_pipes_to_optimize,
            err_msg=f"Found {total_pipe_count} total selected pipe classes, "
            f"but {total_pipes_to_optimize=}",
        )

    def get_pipe_class_vars(self, pipe: str) -> Dict[str, np.ndarray]:
        """
        This function returns the pipe class results.

        Parameters
        ----------
        pipe : str with pipe name

        Returns
        -------
        Dict with variable name as key and result as value.
        """
        given_pipe_classes = self.problem.pipe_classes(pipe)
        if pipe in self.problem.cold_pipes:
            expected_class_vars = [
                f"{self.problem.cold_to_hot_pipe(pipe)}__hn_pipe_class_{pc.name}"
                for pc in given_pipe_classes
            ]
        else:
            expected_class_vars = [f"{pipe}__hn_pipe_class_{pc.name}" for pc in given_pipe_classes]
        class_vars = {
            var_name: value
            for var_name, value in self.results.items()
            if var_name in expected_class_vars
        }
        return class_vars

    def get_chosen_pipe_class(self, pipe: str, pipe_class_vars: Dict[str, np.ndarray]) -> PipeClass:
        """
        This function retrieves the selected pipe class optimization result for a pipe.

        Parameters
        ----------
        pipe : string with pipe name
        pipe_class_vars : dict from get_pipe_class_vars() method

        Returns
        -------
        The selected pipe class
        """
        chosen_var = None
        given_pipe_classes = self.problem.pipe_classes(pipe)
        for var_name, value in pipe_class_vars.items():
            if abs(value - 1.0) < MIP_TOLERANCE:
                chosen_var = var_name
        self.assertIsNotNone(chosen_var, msg=f"No pipe class selected for {pipe}")
        class_name = chosen_var.split("_")[-1]
        chosen_pc = [pc for pc in given_pipe_classes if pc.name == class_name]
        self.assertEqual(len(chosen_pc), 1, msg=f"Found multiple chosen pipe classes for {pipe}")
        return chosen_pc[0]

    def get_heat_losses(self, pipe: str, pipe_class: PipeClass):
        """
        This function computes the expected heat loss for a pipe class.

        Parameters
        ----------
        pipe : string with pipe name
        pipe_class : the selected pipe class optimized result for that pie

        Returns
        -------
        Pipe heat loss value.
        """
        return pipe_heat_loss(
            self.problem,
            options=self.problem.energy_system_options(),
            parameters=self.problem.parameters(0),
            p=pipe,
            u_values=pipe_class.u_values,
        )
