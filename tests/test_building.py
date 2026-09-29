from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

# from mesido.util import run_optimization_problem

import numpy as np

# from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestBuilding(TestCase):
    def test_building_parameters_are_parsed(self):
        import models.building.src.run_case as run_case
        from models.building.src.run_case import SourcePipeBuilding

        base_folder = Path(run_case.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"

        problem = SourcePipeBuilding(
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="source buildingsink with multiple demand profiles.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_import.csv",
        )

        problem.pre()

        # Check that the building parameters are parsed correctly
        building_parameters = problem.building_parameters
        # Ensure only 1 building is present
        np.testing.assert_equal(
            len(building_parameters), 1, "There should be only 1 building in the test case"
        )
        # Check the expected building parameters are present
        expect_building_parameters = {
            "name",
            "attributes",
            "contained_assets",
            "contained_measures",
        }
        for building_id, params in building_parameters.items():
            for expected_param_name in expect_building_parameters:
                np.testing.assert_equal(
                    expected_param_name in params,
                    True,
                )
            # Check that building attributes are present
            params_attributes = params.get("attributes", {})
            np.testing.assert_equal(
                len(params_attributes) > 0,
                True,
            )
            for attribute_name in params_attributes:
                np.testing.assert_equal(
                    attribute_name in problem._esdl_assets[building_id].attributes,
                    True,
                )
            # Check that there is a heat demand and a cold demand in the contained assets
            params_contained_assets = params.get("contained_assets", [])
            np.testing.assert_equal(
                len(params_contained_assets) == 2,
                True,
            )
            np.testing.assert_equal(
                any(
                    asset_info["type"] == "HeatingDemand"
                    for asset_info in params_contained_assets.values()
                ),
                True,
            )
            np.testing.assert_equal(
                any(
                    asset_info["type"] == "CoolingDemand"
                    for asset_info in params_contained_assets.values()
                ),
                True,
            )
            # Check that there are contained measures
            contained_measures = params.get("contained_measures", [])
            np.testing.assert_equal(
                len(contained_measures) == 2,
                True,
                f"Building {building_id} should have 2 contained measures",
            )
            # Check that each measure contains exactly one heating and one cooling demand
            # profile name.
            for measure_info in contained_measures.values():
                if measure_info["name"] == "demand_1":
                    np.testing.assert_equal(
                        next(iter(measure_info["HeatingDemand"].values()))["name"],
                        "HeatingDemandProf_1",
                    )
                    np.testing.assert_equal(
                        next(iter(measure_info["CoolingDemand"].values()))["name"],
                        "CoolingDemandProf_1",
                    )

                elif measure_info["name"] == "demand_2":
                    np.testing.assert_equal(
                        next(iter(measure_info["HeatingDemand"].values()))["name"],
                        "HeatingDemandProf_2",
                    )
                    np.testing.assert_equal(
                        next(iter(measure_info["CoolingDemand"].values()))["name"],
                        "CoolingDemandProf_2",
                    )
                else:
                    raise AssertionError(
                        f"Building {building_id} has an unexpected contained measure"
                        f" {measure_info['name']}"
                    )

    # Do not delete this test is still to be developed
    # def test_building_heat_cold_measures(self):
    #     import models.building.src.run_case as run_case
    #     from models.building.src.run_case import SourcePipeBuilding

    #     base_folder = Path(run_case.__file__).resolve().parent.parent

    #     problem = run_optimization_problem(
    #         SourcePipeBuilding
    #         base_folder=base_folder,
    #         esdl_file_name="source buildingsink with multiple demand profiles.esdl",
    #         esdl_parser=ESDLFileParser,
    #         # csv profiles do not cater for profiles via measures but influx profiles do.
    #         # Is csv proflies even need for measures? TBC
    #         # profile_reader=ProfileReaderFromFile,
    #         # input_timeseries_file="timeseries_import.csv",
    #     )

    #     results = problem.extract_results()

    #     # TODO: demand_matching_test still to be updated to cater for reduced demand due to
    #     # insulation measures. The minimum heat demand has factor 1.0 currently.
    #     demand_matching_test(problem, results)
    #     energy_conservation_test(problem, results)
    #     heat_to_discharge_test(problem, results)

    #     # Check that the heating and cooling demand have specified base input profiles and
    #     profiles via measures available

    #     # Check that the optimal profile is selected for the heating and cooling demand.


if __name__ == "__main__":
    a = TestBuilding()
    a.test_building_parameters_are_parsed()
