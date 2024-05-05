import fnmatch
import os
import sys
from pathlib import Path
from unittest import TestCase

import esdl
from esdl.esdl_handler import EnergySystemHandler

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStagedHIGHS


import numpy as np


class TestUpdatedESDL(TestCase):

    def test_updated_esdl(self):
        """
        Check that the updated ESDL resulting from the optmizer, is correct by using the PoCTutorial
        and the Grow_workflow. This is done for the actual esdl file and the esdl string created by
        MESIDO. Both these resulting optimized energy systems should be identical and it is only
        the MESIDO esdl saving method that differs.

        Checks:
        - That the esdl saving method (direct ESDL file and ESDL string)
        - That the correct number of KPIs have been added
        - That the correct assets have been removed
        - That all the assets have a state=ENABLED
        - The diameter of all the pipes are as expected
        - The aggregation count of the assets, MESIDO problem vs updated ESDL file
        - That the KPI values are represented in the correct units
        - That assets are connected and that the connections per ports were not changed in the
          updated ESDL
        - That the size of the source has been made small. Not checking the exact
        value - not the purpose of these tests
        - The correct number of polygon sub-areas exist
        """

        root_folder = str(Path(__file__).resolve().parent.parent)
        sys.path.insert(1, root_folder)

        import examples.PoCTutorial.src.run_grow_tutorial

        base_folder = (
            Path(examples.PoCTutorial.src.run_grow_tutorial.__file__).resolve().parent.parent
        )
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"

        problem = EndScenarioSizingStagedHIGHS(
            esdl_file_name="PoC Tutorial.esdl",
            esdl_parser=ESDLFileParser,
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
        )
        problem.pre()

        # Load in optimized esdl in the form of esdl string created by MESIDO
        esh = EnergySystemHandler()
        file = os.path.join(base_folder, "model", "PoC Tutorial_GrowOptimized_esdl_string.esdl")
        optimized_energy_system_esdl_string: esdl.EnergySystem = esh.load_file(file)

        # Load in optimized esdl in the form of the actual optimized esdl file created by MESIDO
        esdl_path = os.path.join(base_folder, "model", "PoC Tutorial_GrowOptimized.esdl")
        optimized_energy_system = problem._ESDLMixin__energy_system_handler.load_file(esdl_path)

        optimized_energy_systems = [optimized_energy_system_esdl_string, optimized_energy_system]

        for energy_system in optimized_energy_systems:
            # Test KPIs in optimized ESDL

            # High level checks of KPIs
            number_of_kpis_top_level_in_esdl = 8
            high_level_kpis_euro = [
                "High level cost breakdown [EUR]",
                "Overall cost breakdown [EUR]",
                "CAPEX breakdown [EUR]",
                "OPEX breakdown [EUR]",
                "Area_76a7: Asset cost breakdown [EUR]",
                "Area_9d0f: Asset cost breakdown [EUR]",
                "Area_a58a: Asset cost breakdown [EUR]",
            ]
            high_level_kpis_wh = [
                "Energy production [Wh]",
            ]
            all_high_level_kpis = []
            all_high_level_kpis = high_level_kpis_euro + high_level_kpis_wh

            np.testing.assert_allclose(
                len(energy_system.instance[0].area.KPIs.kpi), number_of_kpis_top_level_in_esdl
            )
            for ii in range(len(energy_system.instance[0].area.KPIs.kpi)):
                kpi_name = energy_system.instance[0].area.KPIs.kpi[ii].name
                np.testing.assert_array_equal(
                    kpi_name in all_high_level_kpis,
                    True,
                    err_msg=f"KPI name {kpi_name} was not expected in the ESDL",
                )
                if kpi_name in high_level_kpis_euro:
                    np.testing.assert_array_equal(
                        energy_system.instance[0].area.KPIs.kpi[ii].quantityAndUnit.unit.name,
                        "EURO",
                    )
                elif kpi_name in high_level_kpis_wh:
                    np.testing.assert_array_equal(
                        energy_system.instance[0].area.KPIs.kpi[ii].quantityAndUnit.unit.name,
                        "WATTHOUR",
                    )
                else:
                    exit(f"Unexpected KPI name: {kpi_name}")

            # Check the asset quantity
            number_of_assets_in_esdl = 15
            np.testing.assert_allclose(
                len(energy_system.instance[0].area.asset), number_of_assets_in_esdl
            )
            # Check:
            # - that the correct assets were removed
            # - asset state
            # - pipe diameter sizes
            # - asset aggregation count
            # - number of ports
            # - number of connection to a port
            asset_to_be_deleted = ["ResidualHeatSource_76f0", "Pipe_8fa5_ret", "Pipe_8fa5"]
            for ii in range(len(energy_system.instance[0].area.asset)):
                asset_name = energy_system.instance[0].area.asset[ii].name
                # Existance of asset and its state
                np.testing.assert_array_equal(
                    asset_name not in asset_to_be_deleted,
                    True,
                    err_msg=f"Asset name {asset_name} was not expected in the ESDL",
                )
                np.testing.assert_array_equal(
                    energy_system.instance[0].area.asset[ii].state.name == "ENABLED", True
                )

                # Check pipe diameter
                if len(fnmatch.filter([energy_system.instance[0].area.asset[ii].id], "Pipe*")) == 1:
                    if asset_name not in ["Pipe4", "Pipe4_ret", "Pipe5", "Pipe5_ret"]:
                        np.testing.assert_array_equal(
                            energy_system.instance[0].area.asset[ii].diameter.name, "DN400"
                        )
                    else:
                        np.testing.assert_array_equal(
                            energy_system.instance[0].area.asset[ii].diameter.name,
                            "DN300",
                            err_msg=f"Asset name {asset_name} was not expected in the ESDL",
                        )
                    # Check aggregation count
                    np.testing.assert_array_equal(
                        energy_system.instance[0].area.asset[ii].aggregationCount,
                        problem.get_aggregation_count_max(asset_name),
                    )
                    # Check the number of ports of the assets are as expected
                    np.testing.assert_array_equal(
                        len(energy_system.instance[0].area.asset[ii].port),
                        len(problem.esdl_assets[asset_name].in_ports)
                        + len(problem.esdl_assets[asset_name].out_ports),
                    )
                    # Check the number of connection to a port
                    energy_system.instance[0].area.asset[ii].port[1].name
                    for iport in range(len(energy_system.instance[0].area.asset[ii].port)):
                        if energy_system.instance[0].area.asset[ii].port[iport].name == "In":
                            np.testing.assert_array_equal(
                                len(
                                    energy_system.instance[0]
                                    .area.asset[ii]
                                    .port[iport]
                                    .connectedTo.items
                                ),
                                len(problem.esdl_assets[asset_name].in_ports),
                            )
                    if asset_name == "ResidualHeatSource_72d7":
                        asset_id = energy_system.instance[0].area.asset[ii].id
                        np.testing.assert_array_less(
                            energy_system.instance[0].area.asset[ii].power,
                            problem.esdl_assets[asset_id].attributes["power"],
                        )

            # High level check on the polygon areas drawn
            number_of_areas_in_esdl = 3
            np.testing.assert_allclose(
                len(energy_system.instance[0].area.area), number_of_areas_in_esdl
            )


if __name__ == "__main__":
    import time

    start_time = time.time()

    a = TestUpdatedESDL()
    a.test_updated_esdl()

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
