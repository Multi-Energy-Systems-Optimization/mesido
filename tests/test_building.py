from pathlib import Path
from unittest import TestCase

import esdl

from mesido.esdl.esdl_parser import ESDLFileParser

# Do not delete: to be used in the next step of development -> specify measure asset profile via
# csv file
# from mesido.esdl.profile_parser import ProfileReaderFromFile

# Do not delete: to be used in the next step of development -> building parameters usage and tests
# from mesido.util import run_optimization_problem

import models.building.src.run_case as run_case
from models.building.src.run_case import SourcePipeBuilding

import numpy as np

# Do not delete: to be used in the next step of development -> building parameters usage and tests
# from utils_tests import demand_matching_test, energy_conservation_test, heat_to_discharge_test


class TestBuilding(TestCase):

    # TODO: add testing with less timesteps when csv functionality is functional for measure assets.
    # Currently using database specified profiles (8760 timesteps) for measure assets since this
    # functionality is not functional yet for csv specified profiles.
    def test_building_parameters(self):
        """Test the building_parameters.

        Checks:
        - Structure of the building_parameters.
        - Assets (with profiles specified via a measure) profile consistency.
        """
        base_folder = Path(run_case.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"

        problem = SourcePipeBuilding(
            base_folder=base_folder,
            model_folder=model_folder,
            input_folder=input_folder,
            esdl_file_name="source buildingsink with multiple demand profiles.esdl",
            esdl_parser=ESDLFileParser,
        )

        problem.pre()

        self._test_building_parameters_structure(problem.building_parameters)

        self._test_building_parameters_asset_profiles_consistency(problem)

    def _test_building_parameters_structure(self, building_parameters):
        """Test the complete structure of building_parameters dictionary.

        Checks:
        - The root structure.
        - The building hierarchy structure and content.
        - The measure and its assets.
        - The asset properties and cost information.
        """

        # Define expected values and IDs for validation
        expected_num_buildings = 1
        expected_num_building_dict_keys = 1
        expected_num_measures = 2
        expected_num_assets_per_measure = 2
        measure_with_cost_id = "78de9a50-9a92-4dd9-a730-31824a5da573"
        # A non-zero value to check against input cost information (larger than this value).
        non_zero_cost_value = 1.0

        # Validate root structure
        np.testing.assert_equal(isinstance(building_parameters, dict), True)
        np.testing.assert_equal(len(building_parameters), expected_num_buildings)

        # Iterate through each building and validate complete hierarchy
        for building_id, building_dict in building_parameters.items():
            # Validate building hierarchy structure and content
            np.testing.assert_equal(isinstance(building_id, str), True)
            np.testing.assert_equal(isinstance(building_dict, dict), True)
            np.testing.assert_equal(len(building_dict), expected_num_building_dict_keys)
            contained_measure = building_dict["contained_measure"]
            np.testing.assert_equal(len(contained_measure), expected_num_measures)

            # Validate measure and its assets
            for measure_id, measure_dict in contained_measure.items():
                np.testing.assert_equal(isinstance(measure_id, str), True)
                np.testing.assert_equal(isinstance(measure_dict, dict), True)
                np.testing.assert_equal("measure_assets" in measure_dict, True)
                measure_assets = measure_dict["measure_assets"]
                np.testing.assert_equal(isinstance(measure_assets, dict), True)
                np.testing.assert_equal(len(measure_assets), expected_num_assets_per_measure)

                # Validate asset properties and cost information
                for asset_id, asset_obj in measure_assets.items():
                    np.testing.assert_equal(isinstance(asset_id, str), True)
                    np.testing.assert_equal(hasattr(asset_obj, "id"), True)
                    np.testing.assert_equal(hasattr(asset_obj, "name"), True)
                    cost_info = asset_obj.costInformation
                    if measure_id == measure_with_cost_id:
                        np.testing.assert_equal(
                            cost_info.installationCosts.value > non_zero_cost_value,
                            True,
                        )
                        np.testing.assert_equal(
                            cost_info.investmentCosts.value > non_zero_cost_value,
                            True,
                        )
                    else:
                        cost_info = asset_obj.costInformation
                        np.testing.assert_equal(cost_info is None, True)

    def _test_building_parameters_asset_profiles_consistency(self, problem=None):
        """
        Test that the measure asset profile is parsed correctly and available for use.

        Checks:
        - Each measure asset's profile is present in the profile reader.
        - Each measure asset profile has 8760 data points.
        - That the profile contains at least 1 sensible heat/cold demand value
        - The average of the measure asset profile data matches the average of the manually loaded
          profile data from the database
        """

        building_parameters = problem.building_parameters

        profile_reader = problem._ESDLMixin__profile_reader
        profile_reader_dict = profile_reader._profiles[0]
        for building_dict in building_parameters.values():
            contained_measure = building_dict.get("contained_measure", {})
            for measure_dict in contained_measure.values():
                measure_assets = measure_dict.get("measure_assets", {})
                for measure_asset_id, measure_asset_obj in measure_assets.items():
                    for port in measure_asset_obj.port:
                        if isinstance(port, esdl.InPort):
                            measure_asset_profile = port.profile[0]
                            np.testing.assert_equal(len(port.profile), 1)

                    if isinstance(measure_asset_obj, esdl.HeatingDemand):
                        profile_key = f"{measure_asset_id}.target_heat_demand"
                    elif isinstance(measure_asset_obj, esdl.CoolingDemand):
                        profile_key = f"{measure_asset_id}.target_cold_demand"
                    else:
                        exit("Unknown esdl asset type for profile consistency check.")

                    measure_asset_profile_data = profile_reader_dict[profile_key]
                    np.testing.assert_equal(len(measure_asset_profile_data), 8760)
                    np.testing.assert_equal(
                        1e5 < max(measure_asset_profile_data),
                        True,
                    )
                    loaded_profile_data = profile_reader._load_profile_timeseries_from_database(
                        measure_asset_profile
                    )
                    loaded_profile_data_converted = profile_reader._convert_profile_to_correct_unit(
                        profile_time_series=loaded_profile_data,
                        profile=measure_asset_profile,
                        asset=measure_asset_obj,
                    )
                    # Check that profile specified via a measure asset, which ended up in the
                    # profile_reader, is as expected. By comparing it to a manually loaded version
                    # of the profile.
                    np.testing.assert_equal(
                        np.average(loaded_profile_data_converted),
                        np.average(measure_asset_profile_data),
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
    a.test_building_parameters()
