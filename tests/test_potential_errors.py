import datetime
import unittest
import unittest.mock
from pathlib import Path
from typing import Dict, Optional, Tuple

import esdl

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import InfluxDBProfileReader
from mesido.exceptions import MesidoAssetIssueError
from mesido.potential_errors import MesidoAssetIssueType, PotentialErrors
from mesido.workflows import EndScenarioSizingStaged
from mesido.workflows.utils.error_types import mesido_issue_type_gen_message

import numpy as np

import pandas as pd

from utils_test_scaling import create_log_list_scaling


class MockInfluxDBProfileReader(InfluxDBProfileReader):
    def __init__(
        self,
        energy_system: esdl.EnergySystem,
        file_path: Optional[Path],
    ):
        super().__init__(
            energy_system=energy_system,
            file_path=file_path,
        )
        self._loaded_profiles = pd.read_csv(
            file_path,
            index_col="DateTime",
            date_parser=lambda x: pd.to_datetime(x).tz_convert(datetime.timezone.utc),
        )

    def _load_profile_timeseries_from_database(self, profile: esdl.InfluxDBProfile) -> pd.Series:
        return self._loaded_profiles[profile.id]


class TestPotentialErrors(unittest.TestCase):
    def test_asset_potential_errors(self):
        """
        This test checks that the error checks in the code for sufficient installed cool/heatig
        capacity of a cold/heat demand is sufficient (grow_workflow)

        Checks:
        1. Correct error is raised
        2. That the error is due to:
            - insufficient heat specified capacities for 3 heating demands
            - incorrect heating demand type being used for 1 heating demand
            - profile cannot be assigned to a specific asset
            - state set to optional for 2 assets, since that is not allowed
        """
        import models.unit_cases.case_1a.src.run_1a as run_1a

        base_folder = Path(run_1a.__file__).resolve().parent.parent
        model_folder = base_folder / "model"
        input_folder = base_folder / "input"

        logger, logs_list = create_log_list_scaling("WarmingUP-MPC")

        with (
            self.assertRaises(MesidoAssetIssueError) as cm,
            unittest.mock.patch("mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()),
        ):
            problem = EndScenarioSizingStaged(
                esdl_parser=ESDLFileParser,
                base_folder=base_folder,
                model_folder=model_folder,
                input_folder=input_folder,
                esdl_file_name="1a_with_influx_profiles_error_check_1.esdl",
                profile_reader=MockInfluxDBProfileReader,
                input_timeseries_file="influx_mock.csv",
            )
            problem.pre()

        # Check that the heat demand had an error
        np.testing.assert_equal(cm.exception.error_type, MesidoAssetIssueType.HEAT_DEMAND_POWER)
        np.testing.assert_equal(
            cm.exception.general_issue,
            mesido_issue_type_gen_message(MesidoAssetIssueType.HEAT_DEMAND_POWER),
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["2ab92324-f86e-4976-9a6e-f7454b77ba3c"],
            "Asset named HeatingDemand_2ab9: The installed capacity of 6.0MW should be larger than"
            " the maximum of the heat demand profile 5175.717MW",
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["506c41ac-d415-4482-bf10-bf12f17aeac6"],
            "Asset named HeatingDemand_506c: The installed capacity of 2.0MW should be larger than"
            " the maximum of the heat demand profile 1957.931MW",
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["6662aebb-f85e-4df3-9f7e-c58993586fba"],
            "Asset named HeatingDemand_6662: The installed capacity of 2.0MW should be larger than"
            " the maximum of the heat demand profile 1957.931MW",
        )
        np.testing.assert_equal(len(cm.exception.message_per_asset_id), 3.0)

        # Check heating demand type error
        with (
            self.assertRaises(MesidoAssetIssueError) as cm,
            unittest.mock.patch("mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()),
        ):
            problem = EndScenarioSizingStaged(
                esdl_parser=ESDLFileParser,
                base_folder=base_folder,
                model_folder=model_folder,
                input_folder=input_folder,
                esdl_file_name="1a_with_influx_profiles_error_check_2.esdl",
                profile_reader=MockInfluxDBProfileReader,
                input_timeseries_file="influx_mock.csv",
            )
            problem.pre()
        # Check that the heat demand had an error
        np.testing.assert_equal(cm.exception.error_type, MesidoAssetIssueType.HEAT_DEMAND_TYPE)
        np.testing.assert_equal(
            cm.exception.general_issue,
            mesido_issue_type_gen_message(MesidoAssetIssueType.HEAT_DEMAND_TYPE),
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["2ab92324-f86e-4976-9a6e-f7454b77ba3c"],
            "Asset named HeatingDemand_2ab9: This asset is currently a GenericConsumer please"
            " change it to a HeatingDemand",
        )
        np.testing.assert_equal(len(cm.exception.message_per_asset_id), 1.0)

        # Check asset profile capability
        with (
            self.assertRaises(MesidoAssetIssueError) as cm,
            unittest.mock.patch("mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()),
        ):
            problem = EndScenarioSizingStaged(
                esdl_parser=ESDLFileParser,
                base_folder=base_folder,
                model_folder=model_folder,
                input_folder=input_folder,
                esdl_file_name="1a_with_influx_profiles_error_check_3.esdl",
                profile_reader=MockInfluxDBProfileReader,
                input_timeseries_file="influx_mock.csv",
            )
            problem.pre()
        # Check that the joint has an error
        np.testing.assert_equal(
            cm.exception.error_type,
            MesidoAssetIssueType.ASSET_PROFILE_CAPABILITY,
        )
        np.testing.assert_equal(
            cm.exception.general_issue,
            mesido_issue_type_gen_message(MesidoAssetIssueType.ASSET_PROFILE_CAPABILITY),
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["95802cf8-61d6-4773-bb99-e275c3bf26cc"],
            "Asset named Joint_9580: The assigment of profile field demand3_MW is not possible for"
            " this asset type <class 'esdl.esdl.Joint'>",
        )
        np.testing.assert_equal(len(cm.exception.message_per_asset_id), 1.0)

        # Check that the heating demand is set to optional
        with (
            self.assertRaises(MesidoAssetIssueError) as cm,
            unittest.mock.patch("mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()),
        ):
            problem = EndScenarioSizingStaged(
                esdl_parser=ESDLFileParser,
                base_folder=base_folder,
                model_folder=model_folder,
                input_folder=input_folder,
                esdl_file_name="1a_with_influx_profiles_error_check_4.esdl",
                profile_reader=MockInfluxDBProfileReader,
                input_timeseries_file="influx_mock.csv",
            )
            problem.pre()
        # Check that the heat demand had an error
        np.testing.assert_equal(cm.exception.error_type, MesidoAssetIssueType.HEAT_DEMAND_STATE)
        np.testing.assert_equal(
            cm.exception.general_issue,
            mesido_issue_type_gen_message(MesidoAssetIssueType.HEAT_DEMAND_STATE),
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["2ab92324-f86e-4976-9a6e-f7454b77ba3c"],
            "Asset named HeatingDemand_2ab9 : The asset should be enabled since there is "
            "no sizing optimization on HeatingDemands",
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["6662aebb-f85e-4df3-9f7e-c58993586fba"],
            "Asset named HeatingDemand_6662 : The asset should be enabled since there is "
            "no sizing optimization on HeatingDemands",
        )
        np.testing.assert_equal(len(cm.exception.message_per_asset_id), 2.0)

        # Check the a new type of potential error which raises when the profile name indicated
        # in esdl is not available in the database
        with (
            self.assertRaises(MesidoAssetIssueError) as cm,
            unittest.mock.patch("mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()),
        ):
            problem = EndScenarioSizingStaged(
                esdl_parser=ESDLFileParser,
                base_folder=base_folder,
                model_folder=model_folder,
                input_folder=input_folder,
                esdl_file_name="1a_with_influx_profiles_wrong_name.esdl",
            )
            problem.pre()
        # Check that the asset profile had an error
        np.testing.assert_equal(
            cm.exception.error_type, MesidoAssetIssueType.ASSET_PROFILE_AVAILABILITY
        )
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["2ab92324-f86e-4976-9a6e-f7454b77ba3c"],
            "Asset named HeatingDemand_2ab9: Input profile "
            "demand1_MW_wrong_name in WarmingUp default profiles is not available in the database.",
        )

        # Check that the ResidualHeatSource multiplier's error is picked up
        with (
            self.assertRaises(MesidoAssetIssueError) as cm,
            unittest.mock.patch("mesido.potential_errors.POTENTIAL_ERRORS", PotentialErrors()),
        ):
            problem = EndScenarioSizingStaged(
                esdl_parser=ESDLFileParser,
                base_folder=base_folder,
                model_folder=model_folder,
                input_folder=input_folder,
                esdl_file_name="1a_with_influx_profiles_error_check_5.esdl",
                profile_reader=InfluxDBProfileReader,
            )
            problem.pre()
        np.testing.assert_equal(
            cm.exception.message_per_asset_id["8172d5d3-61a4-4d0b-a26f-5e61c2a22c64"],
            ", GenericProducer_8172 has unit's multiplier specified incorrectly. "
            "Multiplier should be 1.0, when the unit is specified in Coefficient in %",
        )


if __name__ == "__main__":
    a = TestPotentialErrors()
    a.test_asset_potential_errors()
