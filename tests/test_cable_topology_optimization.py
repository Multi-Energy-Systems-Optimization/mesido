from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np


class TestElectricityTopo(TestCase):
    def test_electricity_network_topology(self):
        """
        This test checks the functioning of topology optimization of electricity cables. It uses
        a symmetrical network where the left side should stay in as those cables are shorter.

        Checks:
        1. Demand is matched
        2. That intended cables are removed

        """
        import models.electricity_cable_topology.src.example as example
        from models.electricity_cable_topology.src.example import HeatProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        heat_problem = run_esdl_mesido_optimization(
            HeatProblem,
            base_folder=base_folder,
            esdl_file_name="enettopology.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )

        results = heat_problem.extract_results()

        for demand in heat_problem.energy_system_components.get("electricity_demand", []):
            target = heat_problem.get_timeseries(f"{demand}.target_electricity_demand").values
            np.testing.assert_allclose(target, results[f"{demand}.Electricity_demand"])

        removed_cables = [
            "ElectricityCable_6dce",
            "ElectricityCable_6aeb",
            "ElectricityCable_fbfd",
            "ElectricityCable_ef84",
        ]

        for cable in removed_cables:
            np.testing.assert_allclose(results[f"{cable}__investment_cost"], 0.0)
            np.testing.assert_allclose(results[f"{cable}__en_max_current"], 0.0)
