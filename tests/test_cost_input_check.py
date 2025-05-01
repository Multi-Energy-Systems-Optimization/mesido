import time
from pathlib import Path
from unittest import TestCase
from typing import Optional

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.workflows import EndScenarioSizingStaged
from mesido.workflows.utils.error_types import HEAT_NETWORK_ERRORS, NO_POTENTIAL_ERRORS_CHECK

class TestCostInformationErrors(TestCase):
    """Test suite for checking cost information errors in ESDL files.
    
    This test suite validates the behavior of cost information processing
    in ESDL files under different scenarios.
    """
    
    @classmethod
    def setUpClass(cls) -> None:
        """Set up test fixtures once for all test methods in the class."""
        from models.cost_information_errors import test_check_cost_information
        cls.model_folder = Path(test_check_cost_information.__file__).resolve().parent / "model"
        cls.esdl_parser = ESDLFileParser
        cls.valid_esdl_file = "graph_HDemands_incl_demand_4.esdl"
        cls.invalid_esdl_file = "graph_HDemands_incl_demand_4_fail.esdl"

    def setUp(self) -> None:
        """Set up test fixtures before each test method."""
        self.start_time = time.time()

    def tearDown(self) -> None:
        """Clean up after each test method."""
        elapsed_time = time.time() - self.start_time
        print(f"Test {self._testMethodName} took: {time.strftime('%M:%S', time.gmtime(elapsed_time))}")

    def create_instance(self, file_name: str, error_check: Optional[dict] = HEAT_NETWORK_ERRORS) -> EndScenarioSizingStaged:
        """Create a test instance with specified parameters.
        
        Args:
            file_name: Name of the ESDL file to test
            error_check: Type of error checking to perform (default: HEAT_NETWORK_ERRORS)
            
        Returns:
            EndScenarioSizingStaged: Configured instance for testing
        """
        return EndScenarioSizingStaged(
            model_folder=self.model_folder,
            esdl_file_name=file_name,
            esdl_parser=self.esdl_parser,
            error_type_check=error_check
        )

    def run_preprocess(self, instance: EndScenarioSizingStaged) -> None:
        """Run preprocess function from parent class.
        
        Args:
            instance: The EndScenarioSizingStaged instance to preprocess
            
        Raises:
            Any exceptions from the pre() method
        """
        try:
            instance.pre()
        except Exception as e:
            print(f"Preprocessing failed: {str(e)}")
            raise

    def test_valid_esdl(self) -> None:
        """Test that valid ESDL file passes preprocessing."""
        instance = self.create_instance(self.valid_esdl_file)
        self.run_preprocess(instance)

    def test_invalid_esdl_with_error_check(self) -> None:
        """Test that invalid ESDL file fails cost information check."""
        instance = self.create_instance(self.invalid_esdl_file)
        with self.assertRaises(Exception) as context:
            self.run_preprocess(instance)
        self.assertTrue(len(str(context.exception)) > 0, "Exception message should not be empty")

    def test_invalid_esdl_without_error_check(self) -> None:
        """Test that invalid ESDL file passes when error checking is disabled."""
        instance = self.create_instance(
            self.invalid_esdl_file,
            error_check=NO_POTENTIAL_ERRORS_CHECK
        )
        self.run_preprocess(instance)

if __name__ == "__main__":
    from unittest import main
    main(verbosity=2)
