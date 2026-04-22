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

        Notes regarding the esdl files:
        - testing_network_1_all_enabled: All the assets are enabled.
        - testing_network_1_all_optional_excluding_pipes:
            - All assets OPTIONAL and pipes are ENABLED
            - Pipe 1 and 2 have PipeDiameterConstraint values
            - All pipes (including pipe 1 & 2) have a Diameter specified that is smaller than
            PipeDiameterConstraint value
        - testing_network_1_all_optional:
            - All the assets, including the pipes are OPTIONAL
            - Pipe 1 & 2 have a PipeDiameterConstraint values.
            - All the pipes (including pipe 1 & 2) have a Diameter attribute value specified. The
            PipeDiameterConstraint value is larger than the pipe Diameter specified.

        Checks:
        * Heat assets (excluding the pipes)
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

        * Pipes:
        - Pipe DN size:
            - OPTIONAL with PipeDiameterConstraint value and Diameter specified: Check that the
            available pipe classes go up to PipeDiameterConstraint value and that this value is
            larger than the Diameter specified
            - OPTIONAL with only a Diameter specified: Check that the available pipe classes go up
            to the Diameter specified
            - ENABLED pipes: Check that the pipe has a diameter as specified in the attribute
            Diameter value

        """
        import models.esdl_constraints.src.run_1 as run_1
        from models.esdl_constraints.src.run_1 import NetworkProblem

        base_folder = Path(run_1.__file__).resolve().parent.parent
        model_folder = base_folder / "model"

        kwargs = {"use_esdl_ranged_constraint": True}

        # the esdl version must be >= "v2602"
        esdl_files = {
            "testing_network_1_all_enabled.esdl",
            "testing_network_1_all_optional_excluding_pipes.esdl",
            "testing_network_1_all_optional.esdl",
        }

        for esdl_file in esdl_files:
            problem = NetworkProblem(
                base_folder=base_folder,
                model_folder=model_folder,
                esdl_parser=ESDLFileParser,
                esdl_file_name=esdl_file,
                **kwargs,
            )

            problem.pre()
            name_to_id_map = problem.esdl_asset_name_to_id_map

            all_optional = False
            if "all_optional" in esdl_file:
                all_optional = True

            # -------------------------------------------------------------------------------------
            # Check the assets exlcuding the pipes

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
                    asset_id = name_to_id_map[asset_name]
                    esdl_asset = problem._esdl_assets[asset_id]
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
                                problem.bounds()[f"{asset_id}__max_size"][1],
                                range_contraint_max,
                            )
                            np.testing.assert_array_less(
                                asset_input_max,
                                problem.bounds()[f"{asset_id}__max_size"][1],
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
                                problem.bounds()[f"{asset_id}__max_size"][1],
                                asset_input_max,
                            )
                            np.testing.assert_array_less(
                                problem.bounds()[f"{asset_id}__max_size"][1],
                                range_contraint_max,
                            )

                        asset_variable = ""
                        if asset_name == "HeatPump_6e86":
                            asset_variable = "Secondary_heat"
                        else:
                            asset_variable = "Heat_flow"
                        # Check that the correct value is used for heat flow variable bound
                        np.testing.assert_equal(
                            problem.bounds()[f"{asset_id}__max_size"][1],
                            problem.bounds()[f"{asset_id}.{asset_variable}"][1],
                        )

                    if "aggregation_assets" == key:

                        range_contraint_max = esdl_asset.attributes["constraint"][0].range.maxValue
                        asset_input_max = esdl_asset.attributes["aggregationCount"]

                        if all_optional:
                            # Check that the RangedContraint value is used for aggregation count,
                            # and that this values is larger than the asset attribute input value
                            np.testing.assert_equal(
                                problem.bounds()[f"{asset_id}_aggregation_count"][1],
                                range_contraint_max,
                            )
                            np.testing.assert_array_less(
                                asset_input_max,
                                problem.bounds()[f"{asset_id}_aggregation_count"][1],
                            )
                        else:
                            # Check that the asset attribute input value is used for aggregation
                            # count, and that this values is smaller than the RangedContraint value
                            np.testing.assert_equal(
                                problem.bounds()[f"{asset_id}_aggregation_count"][1],
                                asset_input_max,
                            )
                            np.testing.assert_array_less(
                                problem.bounds()[f"{asset_id}_aggregation_count"][1],
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
                                problem.parameters(0)[f"{asset_id}.rho"]
                                * range_contraint_max
                                * problem.parameters(0)[f"{asset_id}.cp"]
                                * problem.parameters(0)[f"{asset_id}.dT"]
                            )
                            np.testing.assert_equal(
                                asset_max_capacity,
                                problem.bounds()[f"{asset_id}__max_size"][1],
                            )
                            np.testing.assert_array_less(
                                asset_input_max,
                                problem.parameters(0)[f"{asset_id}.volume"],
                            )
                            np.testing.assert_almost_equal(
                                problem.parameters(0)[f"{asset_id}.volume"],
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
                                problem.parameters(0)[f"{asset_id}.rho"]
                                * asset_input_max
                                * problem.parameters(0)[f"{asset_id}.cp"]
                                * problem.parameters(0)[f"{asset_id}.dT"]
                            )
                            np.testing.assert_equal(
                                asset_max_capacity,
                                problem.bounds()[f"{asset_id}__max_size"][1],
                            )
                            np.testing.assert_array_less(
                                problem.parameters(0)[f"{asset_id}.volume"],
                                range_contraint_max,
                            )
                            np.testing.assert_almost_equal(
                                problem.parameters(0)[f"{asset_id}.volume"],
                                asset_input_max,
                            )

            # -------------------------------------------------------------------------------------
            # Check the pipes with and without PipeDiameterConstraint
            pipes_with_ranged_constraint = [""]

            if esdl_file == "testing_network_1_all_optional.esdl":
                pipes_with_ranged_constraint = ["Pipe1", "Pipe1_ret", "Pipe2", "Pipe2_ret"]

                for pipe_id in problem.energy_system_components.get("heat_pipe", []):
                    esdl_asset = problem._esdl_assets[pipe_id]
                    pipe_name = esdl_asset.name

                    pipe_classes = list(problem._heat_pipe_topo_pipe_class_map[f"{pipe_id}"])
                    pipe_input_size = esdl_asset.attributes["diameter"].name

                    if pipe_name in pipes_with_ranged_constraint:
                        range_contraint_max = esdl_asset.attributes["constraint"][0].maximum.name
                        np.testing.assert_equal(pipe_classes[-1].name, range_contraint_max)
                        np.testing.assert_array_less(
                            int(pipe_input_size.replace("DN", "")),
                            int(range_contraint_max.replace("DN", "")),
                        )
                    else:
                        np.testing.assert_equal(pipe_classes[-1].name, pipe_input_size)
            elif esdl_file == "testing_network_1_all_optional_excluding_pipes.esdl":
                for pipe_id in problem.energy_system_components.get("heat_pipe", []):
                    (problem.parameters(0)[f"{pipe_id}.diameter"], 0.695)  # DN700


if __name__ == "__main__":

    a = TestRangedConstraints()
    a.test_asset_max_capacity()
