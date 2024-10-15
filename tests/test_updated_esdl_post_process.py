import fnmatch
import os
import sys
from pathlib import Path
from unittest import TestCase

import esdl
from esdl.esdl_handler import EnergySystemHandler

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStaged


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
        - Check that the OPEX costs for an asset with a 15 year lifetime == OPEX over optim time
        horizon
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

        problem = EndScenarioSizingStaged(
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
            number_of_kpis_top_level_in_esdl = 11
            high_level_kpis_euro = [
                "High level cost breakdown [EUR] (yearly averaged)",
                "High level cost breakdown [EUR] (30.0 year period)",
                "Overall cost breakdown [EUR] (yearly averaged)",
                "Overall cost breakdown [EUR] (30.0 year period)",
                "CAPEX breakdown [EUR] (30.0 year period)",
                "OPEX breakdown [EUR] (yearly averaged)",
                "OPEX breakdown [EUR] (30.0 year period)",
                "Area_76a7: Asset cost breakdown [EUR]",
                "Area_9d0f: Asset cost breakdown [EUR]",
                "Area_a58a: Asset cost breakdown [EUR]",
            ]
            high_level_kpis_wh = [
                "Energy production [Wh] (yearly averaged)",
            ]
            all_high_level_kpis = []
            all_high_level_kpis = high_level_kpis_euro + high_level_kpis_wh

            np.testing.assert_allclose(
                len(energy_system.instance[0].area.KPIs.kpi), number_of_kpis_top_level_in_esdl
            )
            np.testing.assert_allclose(
                len(energy_system.instance[0].area.KPIs.kpi), len(all_high_level_kpis)
            )

            # Assign kpi info that has to be used for compairing optim time horizon vs yearly values
            # kpi_name_list and kpi_label_list should be the same length and in the same order of
            # which the comparison is done
            compare_yearly_lifetime_kpis = {
                # lists of 2 kpis that have to be compared
                "kpi_name_list": [
                    [
                        "High level cost breakdown [EUR] (yearly averaged)",
                        "High level cost breakdown [EUR] (30.0 year period)",
                    ],
                    [
                        "Overall cost breakdown [EUR] (yearly averaged)",
                        "Overall cost breakdown [EUR] (30.0 year period)",
                    ],
                    [
                        "Overall cost breakdown [EUR] (yearly averaged)",
                        "Overall cost breakdown [EUR] (30.0 year period)",
                    ],
                    [
                        "OPEX breakdown [EUR] (yearly averaged)",
                        "OPEX breakdown [EUR] (30.0 year period)",
                    ],
                ],
                # lists of which kpi label has to be compared for kpi_name_list
                "kpi_label_list": [
                    ["OPEX"],
                    ["Variable OPEX"],
                    ["Fixed OPEX"],
                    ["ResidualHeatSource"],
                ],
                "index_high_level_cost_list": [],  # leave this empty, this list length is set below
            }
            for _ in range(len(compare_yearly_lifetime_kpis["kpi_name_list"])):
                compare_yearly_lifetime_kpis["index_high_level_cost_list"].append([])
            if len(compare_yearly_lifetime_kpis["kpi_name_list"]) != len(
                compare_yearly_lifetime_kpis["kpi_label_list"]
            ):
                print("List should be the same length")
                exit(1)

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

                # Check optim time horizon vs yearly cost when the lifetime value is
                # 15 years
                for il in range(len(compare_yearly_lifetime_kpis["kpi_name_list"])):

                    if kpi_name in compare_yearly_lifetime_kpis["kpi_name_list"][il]:
                        compare_yearly_lifetime_kpis["index_high_level_cost_list"][il].append(ii)
                        if len(compare_yearly_lifetime_kpis["index_high_level_cost_list"][il]) == 2:
                            for iitem in range(
                                len(
                                    energy_system.instance[0]
                                    .area.KPIs.kpi[ii]
                                    .distribution.stringItem.items
                                )
                            ):
                                if (
                                    energy_system.instance[0]
                                    .area.KPIs.kpi[
                                        compare_yearly_lifetime_kpis["index_high_level_cost_list"][
                                            il
                                        ][0]
                                    ]
                                    .distribution.stringItem.items[iitem]
                                    .label
                                    in compare_yearly_lifetime_kpis["kpi_label_list"][il]
                                ):

                                    max_value = max(
                                        energy_system.instance[0]
                                        .area.KPIs.kpi[
                                            compare_yearly_lifetime_kpis[
                                                "index_high_level_cost_list"
                                            ][il][0]
                                        ]
                                        .distribution.stringItem.items[iitem]
                                        .value,
                                        energy_system.instance[0]
                                        .area.KPIs.kpi[
                                            compare_yearly_lifetime_kpis[
                                                "index_high_level_cost_list"
                                            ][il][1]
                                        ]
                                        .distribution.stringItem.items[iitem]
                                        .value,
                                    )
                                    min_value = min(
                                        energy_system.instance[0]
                                        .area.KPIs.kpi[
                                            compare_yearly_lifetime_kpis[
                                                "index_high_level_cost_list"
                                            ][il][0]
                                        ]
                                        .distribution.stringItem.items[iitem]
                                        .value,
                                        energy_system.instance[0]
                                        .area.KPIs.kpi[
                                            compare_yearly_lifetime_kpis[
                                                "index_high_level_cost_list"
                                            ][il][1]
                                        ]
                                        .distribution.stringItem.items[iitem]
                                        .value,
                                    )
                                    # Lifetime of 15 years and the optim time horizon is 30 years
                                    np.testing.assert_allclose(min_value * 15.0 * 2.0, max_value)
            # make ssure that all the items in kpi_name_list was checked
            for il in range(len(compare_yearly_lifetime_kpis["kpi_name_list"])):
                np.testing.assert_equal(
                    len(compare_yearly_lifetime_kpis["index_high_level_cost_list"][il]), 2
                )

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
                    if asset_name in ["Pipe1", "Pipe1_ret"]:
                        np.testing.assert_array_equal(
                            energy_system.instance[0].area.asset[ii].diameter.name, "DN250"
                        )  # original pipe DN400 being sized
                    elif asset_name in ["Pipe4", "Pipe4_ret"]:
                        np.testing.assert_array_equal(
                            energy_system.instance[0].area.asset[ii].diameter.name, "DN200"
                        )  # original pipe DN900 being sized
                    elif asset_name not in ["Pipe5", "Pipe5_ret"]:
                        np.testing.assert_array_equal(
                            energy_system.instance[0].area.asset[ii].diameter.name, "DN400"
                        )  # pipe DN was not sized and should be the same as specified in the ESDL
                    else:
                        np.testing.assert_array_equal(
                            energy_system.instance[0].area.asset[ii].diameter.name,
                            "DN300",
                            err_msg=f"Asset name {asset_name} was not expected in the ESDL",
                        )  # pipe DN was not sized and should be the same as specified in the ESDL
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
