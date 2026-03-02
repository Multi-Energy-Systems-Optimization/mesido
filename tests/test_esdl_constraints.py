from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser

import numpy as np


class TestRangedConstraints(TestCase):
    """
    Check that RangedConstraint are correctly handled.

    """

    def test_asset_max_capacity(self):
        """
        Test that RangeConstraints or asset attribute input values are used as upper limits for
        assets variables, depending if the asset is ENABLED or OPTIONAL.
        OPTIONAL: use RangeConstraint specified at the asset, instead of the asset input attribute
        ENABLED: use asset attribute input values

        In the esdl files the asset input value (power, volume or aggregation) count has been
        specified to be smaller than the values specified in the RangedCosntraints

        Checks:
        - Power and capacity:
            - OPTIONAL assets: Check that the RangedContraint value is used for max size, and that
            this values is larger than the asset attribute input value
            - ENABLED assets: Check that the asset attribute input value is used for max size, and
            that this values is smaller than the RangedContraint value
        - Aggregation count assets:
            - OPTIONAL assets: Check that the RangedContraint value is used for aggregation count
            and that this values is larger than the asset attribute input value
            - ENABLED assets: Check that the asset attribute input value is used for aggregation
            count, and that this values is smaller than the RangedContraint value
        - Volume assets:
            - OPTIONAL assets: Check that the RangedContraint value is used for volume and the max
            capacity of a buffer tank, and that this volume is larger than the asset attribute
            input value
            - ENABLED assets: # Check that the asset attribute input value is used for volume and
            the max capacity of a buffer tank, and that this volume is smaler than the
            RangedContraint value
        - All OPTIONAL assets: Check the range contraint name

        """
        import models.esdl_constraints.src.run_1 as run_1
        from models.esdl_constraints.src.run_1 import NetworkProblem

        base_folder = Path(run_1.__file__).resolve().parent.parent
        model_folder = base_folder / "model"

        kwargs = {"use_esdl_ranged_constraint": True}

        # the esdl version must be >= "v2602"
        esdl_files = {"testing_network_1_all_optional.esdl", "testing_network_1_all_enabled.esdl"}

        for esdl_file in esdl_files:
            problem = NetworkProblem(
                base_folder=base_folder,
                model_folder=model_folder,
                esdl_parser=ESDLFileParser,
                esdl_file_name=esdl_file,
                **kwargs,
            )

            problem.pre()

            all_optional = False
            if "all_optional" in esdl_file:
                all_optional = True

            asset_tested = {
                # assets where power or capcicity is used for upper limit of size
                "power_assets": [
                    "HeatPump_6e86",
                    "HeatProducer_1c31",
                    "GasHeater_11d9",
                    "ElectricBoiler_ac4c",
                    "HeatExchange_1cf5",
                ],
                # assets where aggregation count is used for upper limit
                "aggregation_assets": ["GeothermalSource_0a38", "ATES_49ac"],
                # assets where volume is used for upper limit of size
                "volume_assets": ["HeatStorage_50b6"],
            }

            for key, asset_names in asset_tested.items():

                for asset_name in asset_names:
                    esdl_asset = problem._esdl_assets[
                        problem.esdl_asset_name_to_id_map[f"{asset_name}"]
                    ]
                    range_contraint_max = None
                    asset_input_max = None

                    if "power_assets" == key:
                        power_or_capacity = ""
                        if asset_name == "HeatExchange_1cf5":
                            power_or_capacity = "capacity"
                        else:
                            power_or_capacity = "power"

                        range_contraint_max = esdl_asset.attributes["constraint"][0].range.maxValue
                        asset_input_max = esdl_asset.attributes[power_or_capacity]

                        if all_optional:
                            # Check that the RangedContraint value is used for max size, and that
                            # this values is larger than the asset attribute input value
                            np.testing.assert_equal(
                                problem.bounds()[f"{asset_name}__max_size"][1],
                                range_contraint_max,
                            )
                            np.testing.assert_array_less(
                                asset_input_max,
                                problem.bounds()[f"{asset_name}__max_size"][1],
                            )
                            # Check the range contraint name
                            np.testing.assert_equal(
                                esdl_asset.attributes["constraint"][0].attributeReference,
                                power_or_capacity,
                            )
                        else:
                            # Check that the asset attribute input value is used for max size, and
                            # that this values is smaller than the RangedContraint value
                            np.testing.assert_equal(
                                problem.bounds()[f"{asset_name}__max_size"][1],
                                asset_input_max,
                            )
                            np.testing.assert_array_less(
                                problem.bounds()[f"{asset_name}__max_size"][1],
                                range_contraint_max,
                            )

                        asset_variable = ""
                        if asset_name == "HeatPump_6e86":
                            asset_variable = "Secondary_heat"
                        else:
                            asset_variable = "Heat_flow"
                        # Check that the correct value is used for heat flow variable bound
                        np.testing.assert_equal(
                            problem.bounds()[f"{asset_name}__max_size"][1],
                            problem.bounds()[f"{asset_name}.{asset_variable}"][1],
                        )

                    if "aggregation_assets" == key:

                        range_contraint_max = esdl_asset.attributes["constraint"][0].range.maxValue
                        asset_input_max = esdl_asset.attributes["aggregationCount"]

                        if all_optional:
                            # Check that the RangedContraint value is used for aggregation count,
                            # and that this values is larger than the asset attribute input value
                            np.testing.assert_equal(
                                problem.bounds()[f"{asset_name}_aggregation_count"][1],
                                range_contraint_max,
                            )
                            np.testing.assert_array_less(
                                asset_input_max,
                                problem.bounds()[f"{asset_name}_aggregation_count"][1],
                            )
                        else:
                            # Check that the asset attribute input value is used for aggregation
                            # count, and that this values is smaller than the RangedContraint value
                            np.testing.assert_equal(
                                problem.bounds()[f"{asset_name}_aggregation_count"][1],
                                asset_input_max,
                            )
                            np.testing.assert_array_less(
                                problem.bounds()[f"{asset_name}_aggregation_count"][1],
                                range_contraint_max,
                            )
                        # Check the range contraint name
                        np.testing.assert_equal(
                            esdl_asset.attributes["constraint"][0].attributeReference,
                            "aggregationCount",
                        )

                    if "volume_assets" == key:
                        range_contraint_max = esdl_asset.attributes["constraint"][0].range.maxValue
                        asset_input_max = esdl_asset.attributes["volume"]

                        if all_optional:
                            # Check that the RangedContraint value is used for volume and the max
                            # capacity of a buffer tank, and that this volume is larger than the
                            # asset attribute input value
                            asset_max_capacity = (
                                problem.parameters(0)[f"{asset_name}.rho"]
                                * range_contraint_max
                                * problem.parameters(0)[f"{asset_name}.cp"]
                                * problem.parameters(0)[f"{asset_name}.dT"]
                            )
                            np.testing.assert_equal(
                                asset_max_capacity,
                                problem.bounds()[f"{asset_name}__max_size"][1],
                            )
                            np.testing.assert_array_less(
                                asset_input_max,
                                problem.parameters(0)[f"{asset_name}.volume"],
                            )
                            np.testing.assert_almost_equal(
                                problem.parameters(0)[f"{asset_name}.volume"],
                                range_contraint_max,
                            )
                            # Check the range contraint name
                            np.testing.assert_equal(
                                esdl_asset.attributes["constraint"][0].attributeReference,
                                "volume",
                            )
                        else:
                            # Check that the asset attribute input value is used for volume and the
                            # max capacity of a buffer tank, and that this volume is smaler than the
                            # RangedContraint
                            asset_max_capacity = (
                                problem.parameters(0)[f"{asset_name}.rho"]
                                * asset_input_max
                                * problem.parameters(0)[f"{asset_name}.cp"]
                                * problem.parameters(0)[f"{asset_name}.dT"]
                            )
                            np.testing.assert_equal(
                                asset_max_capacity,
                                problem.bounds()[f"{asset_name}__max_size"][1],
                            )
                            np.testing.assert_array_less(
                                problem.parameters(0)[f"{asset_name}.volume"],
                                range_contraint_max,
                            )
                            np.testing.assert_almost_equal(
                                problem.parameters(0)[f"{asset_name}.volume"],
                                asset_input_max,
                            )


if __name__ == "__main__":

    a = TestRangedConstraints()
    a.test_asset_max_capacity()
