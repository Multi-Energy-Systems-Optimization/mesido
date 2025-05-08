import time
from pathlib import Path
from unittest import TestCase
from typing import Optional

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStaged
from mesido.workflows.utils.error_types import HEAT_NETWORK_ERRORS, NO_POTENTIAL_ERRORS_CHECK
from mesido.exceptions import MesidoAssetIssueError
from mesido.potential_errors import MesidoAssetIssueType

class TestCostInformationErrors(TestCase):
    """Test suite for checking cost information errors in ESDL files."""
    
    @classmethod
    def setUpClass(cls) -> None:
        """Set up test fixtures once for all test methods in the class."""
        from models.cost_information_errors import test_check_cost_information
        cls.model_folder = Path(test_check_cost_information.__file__).resolve().parent / "model"
        cls.esdl_parser = ESDLFileParser
        cls.valid_esdl_file = "graph_HDemands_incl_demand_4.esdl"
        cls.incorrect_cost_esdl_file = "graph_HDemands_incl_demand_4_incorrect.esdl"
        cls.missing_cost_esdl_file = "graph_HDemands_incl_demand_4_missing.esdl"

    def setUp(self) -> None:
        """Set up test fixtures before each test method."""
        self.start_time = time.time()

    def tearDown(self) -> None:
        """Clean up after each test method."""
        elapsed_time = time.time() - self.start_time
        print(f"Test {self._testMethodName} took: {time.strftime('%M:%S', time.gmtime(elapsed_time))}")

    def create_instance(self, file_name: str, error_check: Optional[dict] = HEAT_NETWORK_ERRORS) -> EndScenarioSizingStaged:
        """Create a test instance with specified parameters."""
        esdl_file_path = self.model_folder / file_name
        if not esdl_file_path.exists():
            raise FileNotFoundError(f"ESDL file not found: {esdl_file_path}")
            
        return EndScenarioSizingStaged(
            model_folder=self.model_folder,
            esdl_file_name=file_name,
            esdl_parser=self.esdl_parser,
            error_type_check=error_check
        )

    # def run_read(self, instance: EndScenarioSizingStaged) -> None:
    #     """Run preprocess function and handle exceptions appropriately."""
    #     instance.read()


    def assert_error_raised(self, file_name: str, expected_issue: MesidoAssetIssueType) -> None:
        """Helper method to assert that a specific error is raised during preprocessing."""
        instance = self.create_instance(file_name)
        try:
            print(f"Running preprocess for {file_name}, expecting {expected_issue}")
            instance.read()
            print("No exception was raised!")
        except MesidoAssetIssueError as e:
            print("Full error")
            print(e)
            print(f"Exception raised: {e.error_type}")
            self.assertEqual(
                e.error_type,
                expected_issue,
                f"Expected {expected_issue} error, got {e.error_type}"
            )
            return
        except Exception as e:
            print(f"Unexpected exception type: {type(e).__name__}: {e}")
            raise
        
        self.fail(f"Expected {MesidoAssetIssueError.__name__} with issue type {expected_issue}, but no exception was raised")


    def test_valid_esdl(self) -> None:
        """Test that valid ESDL file passes preprocessing."""
        instance = self.create_instance(self.valid_esdl_file)
        instance.read(instance)

    def test_missing_cost_attribute(self) -> None:
        """Test that ESDL file with missing cost attributes raises appropriate error."""
        self.assert_error_raised(self.missing_cost_esdl_file, MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_MISSING)

    def test_incorrect_cost_attribute(self) -> None:
        """Test that ESDL file with incorrect cost attributes raises appropriate error."""
        self.assert_error_raised(self.incorrect_cost_esdl_file, MesidoAssetIssueType.ASSET_COST_ATTRIBUTE_INCORRECT)

    def test_invalid_esdl_without_error_check(self) -> None:
        """Test that invalid ESDL file passes when error checking is disabled."""
        instance = self.create_instance(
            self.incorrect_cost_esdl_file,
            error_check=NO_POTENTIAL_ERRORS_CHECK
        )
        try:
            instance.read()
        except Exception as e:
            self.fail(f"Unexpected exception raised: {e}")

if __name__ == "__main__":
    from unittest import main
    main(verbosity=2)