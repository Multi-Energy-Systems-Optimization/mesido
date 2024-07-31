from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization

import numpy as np


class TestLogicalLinks(TestCase):
    def test_logical_links_electricity(self):
        """
        This test checks if the logic implemented for logically linked energy system, Meaning an
        energy system where assets are directly connected to each other without a network
        (transport asset(s)) in between.

        Checks:
        1. Check that energy is conserved

        """
        import models.unit_cases_electricity.bus_networks.src.example as example
        from models.unit_cases_electricity.bus_networks.src.example import ElectricityProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        problem = run_esdl_mesido_optimization(
            ElectricityProblem,
            esdl_file_name="Electric_bus4_logical_links.esdl",
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = problem.extract_results()

        np.testing.assert_allclose(
            results["ElectricityDemand_281a.Electricity_demand"]
            + results["ElectricityDemand_e527.Electricity_demand"],
            results["ElectricityProducer_17a1.Electricity_source"]
            + results["ElectricityProducer_a215.Electricity_source"],
        )

    def test_logical_links_gas(self):
        """
        This test checks if the logic implemented for logically linked energy system, Meaning an
        energy system where assets are directly connected to each other without a network
        (transport asset(s)) in between.

        Checks:
        1. Check that energy is conserved

        """
        import models.unit_cases_gas.multi_demand_source_node.src.run_test as example
        from models.unit_cases_gas.multi_demand_source_node.src.run_test import GasProblem

        base_folder = Path(example.__file__).resolve().parent.parent

        problem = run_esdl_mesido_optimization(
            GasProblem,
            esdl_file_name="test_logical_links.esdl",
            base_folder=base_folder,
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries.csv",
        )
        results = problem.extract_results()

        np.testing.assert_allclose(
            results["GasDemand_47d0.Gas_demand_mass_flow"]
            + results["GasDemand_7978.Gas_demand_mass_flow"],
            results["GasProducer_a977.Gas_source_mass_flow"]
            + results["GasProducer_3573.Gas_source_mass_flow"],
        )
