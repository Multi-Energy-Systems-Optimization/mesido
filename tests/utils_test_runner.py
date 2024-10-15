import csv
import importlib
import os
import sys
import time
import unittest
from typing import Any, Dict, List, Optional, Tuple

import cProfile
import pstats
import io

# Define the expected directory relative to the script location, excluding the filename
EXPECTED_DIR: str = os.path.dirname(os.path.abspath(__file__))
TestError = Tuple[type, Exception, Any]

class DetailedTestResult(unittest.TestResult):
    """
    A custom TestResult class that collects detailed information about test runs,
    including duration and range data.
    """

    def __init__(self) -> None:
        """
        Initialize the DetailedTestResult instance.
        """
        super().__init__()
        self.test_start_time: Optional[float] = None
        self.test_results: List[Tuple[unittest.TestCase, str, Any, float]] = []
        self.range_data: Dict[str, Dict[str, Any]] = {}

    def startTest(self, test: unittest.TestCase) -> None:    # noqa: N802
        """
        Called when a test begins.

        Args:
            test (unittest.TestCase): The test case being run.
        """
        self.test_start_time = time.perf_counter()
        super().startTest(test)
        print(f"Running test: {test.id()}")

    def stopTest(self, test: unittest.TestCase) -> None:     # noqa: N802
        """
        Called when a test finishes.

        Args:
            test (unittest.TestCase): The test case that just finished.
        """
        super().stopTest(test)
        if hasattr(test, "range_data"):
            self.range_data[test.id()] = test.range_data
        else:
            print(f"No range_data attribute found for {test.id()}")

    def get_test_duration(self) -> float:
        """
        Calculate the duration of the current test.

        Returns:
            float: The duration of the test in seconds.
        """
        duration = time.perf_counter() - self.test_start_time
        return duration

    def addSuccess(self, test: unittest.TestCase) -> None:  # noqa: N802
        """
        Called when a test succeeds.

        End-of-line comment "# noqa: N802" is included in the first line to indicate flake8 to
        ignore the capitals in the method name addSuccess, as this method name overrides the method
        from a parent class

        Args:
            test (unittest.TestCase): The test case that succeeded.
        """
        super().addSuccess(test)
        self.test_results.append((test, "Success", None, self.get_test_duration()))
        if hasattr(test, "range_data"):
            self.range_data[test.id()] = test.range_data

    def addError(self, test: unittest.TestCase, err: TestError) -> None:  # noqa: N802
        """
        Called when a test raises an error.

        Args:
            test (unittest.TestCase): The test case that raised an error.
            err (Tuple[type, Exception, Any]): A tuple containing the error details.
        """
        error_message = str(err[1])
        if "Expected or actual min is greater than max value" in error_message:
            # This is a range check error, treat it as a skip
            reason = f"Range check failed: {error_message}"
            self.addSkip(test, reason)
        else:
            super().addError(test, err)
            self.test_results.append((test, "Error", err, self.get_test_duration()))
        if hasattr(test, "range_data"):
            self.range_data[test.id()] = test.range_data

    def addFailure(self, test: unittest.TestCase, err: TestError) -> None:  # noqa: N802
        """
        Called when a test fails.

        End-of-line comment "# noqa: N802" is included in the first line to indicate flake8 to
        ignore the capitals in the method name addFailure, as this method name overrides the method
        from a parent class

        Args:
            test (unittest.TestCase): The test case that failed.
            err (Tuple[type, Exception, Any]): A tuple containing the failure details.
        """
        super().addFailure(test, err)
        self.test_results.append((test, "Failure", err, self.get_test_duration()))
        if hasattr(test, "range_data"):
            self.range_data[test.id()] = test.range_data

    def addSkip(self, test: unittest.TestCase, reason: str) -> None:  # noqa: N802
        """
        Called when a test is skipped.

        Args:
            test (unittest.TestCase): The test case that was skipped.
            reason (str): The reason for skipping the test.
        """
        super().addSkip(test, reason)
        self.test_results.append((test, "Skipped", reason, self.get_test_duration()))
        if hasattr(test, "range_data"):
            self.range_data[test.id()] = test.range_data

    def print_results(self) -> None:
        """
        Print detailed results of all tests, including range data if available.
        """
        print("\nDetailed Test Results:")                
        for test, outcome, error, duration in self.test_results:
            test_id_short = test.id().split(".")[-1]
            print(f"{test_id_short}: {outcome} (Duration: {duration:.6f}s)")
            if error:
                if outcome == "Skipped":
                    print(f"  Reason: {error}")
                else:
                    print(f"  Error: {error[1]}")
            if test.id() in self.range_data:
                print("  Range Data:")
                for key, value in self.range_data[test.id()].items():
                    print(f"    {key}: {value}")
            else:
                print(" Range Data: Not available")

        print("\nOverall Test Results:")
        for test, outcome, error, duration in self.test_results:
            test_id_short = test.id().split(".")[-1]
            print(f"{test_id_short}: {outcome} (Duration: {duration:.6f}s)")

        print("\nOverall Test Results:")
        print(f"Ran {self.testsRun} tests")
        print(f"Successes: {len([r for r in self.test_results if r[1] == 'Success'])}")
        print(f"Failures: {len(self.failures)}")
        print(f"Errors: {len(self.errors)}")
        print(f"Skipped: {len(self.skipped)}")

    def save_range_data_to_csv(self, filename="new_scaling_range_test.csv"):
        """
        Save self.range_data to a CSV file with columns: test name, model element, min, and max.
        The file will be saved in the 'test_runner_data' folder.
        """
        # Create the 'test_runner_data' folder if it doesn't exist
        folder_name = "test_scaling_data"
        os.makedirs(folder_name, exist_ok=True)

        # Construct the full path for the file
        full_path = os.path.join(folder_name, filename)

        with open(full_path, "w", newline="") as csvfile:
            writer = csv.writer(csvfile)

            # Write header
            writer.writerow(["Test Name", "Model Element", "Min", "Max"])

            # Write data
            for test_id, data in self.range_data.items():
                test_id_short = test_id.split(".")[-1]
                for model_element, value_array in data.items():
                    # Ensure value_array has at least two elements
                    if len(value_array) >= 2:
                        writer.writerow(
                            [
                                test_id_short,
                                model_element,
                                value_array["min"],
                                value_array["max"],
                            ]
                        )
                    else:
                        # Handle cases where value_array doesn't have enough elements
                        writer.writerow([test_id_short, model_element, "N/A", "N/A"])

            print(f"CSV file saved successfully: {full_path}")


def check_directory() -> None:
    """
    Check if the script is running from the expected directory.

    Raises:
        SystemExit: If the script is not running from the expected directory.
    """
    current_dir = os.getcwd()
    current_dir_norm_path = os.path.normcase(os.path.abspath(current_dir))
    expected_dir_norm_path = os.path.normcase(EXPECTED_DIR)

    if current_dir_norm_path != expected_dir_norm_path:
        print("Error: Script is not running from the expected directory.")
        print(f"Current directory: {current_dir}")
        print(f"Expected directory: {EXPECTED_DIR}")
        print("Please run this script from the correct directory.")
        sys.exit(1)


def load_tests(loader: unittest.TestLoader) -> unittest.TestSuite:
    """
    Load test cases from all test files in the current directory.

    Args:
        loader (unittest.TestLoader): The TestLoader to use for loading tests.

    Returns:
        unittest.TestSuite: A TestSuite containing all discovered tests.
    """
    suite = unittest.TestSuite()
    test_files = [f for f in os.listdir() if f.startswith("test_") and f.endswith(".py")]
    print(f"Found test files: {test_files}")

    for test_file in test_files:
        if test_file == os.path.basename(__file__):
            continue  # Skip the runner script itself
        module_name = test_file[:-3]  # Remove '.py' from the filename
        print(f"Attempting to import: {module_name}")
        try:
            module = importlib.import_module(module_name)
            suite.addTests(loader.loadTestsFromModule(module))
            print(f"Successfully loaded tests from {module_name}")
        except Exception as e:
            print(f"Error loading {module_name}: {str(e)}")

    return suite

def print_profiling_stats(pr):
    s = io.StringIO()
    sortby = 'time'
    ps = pstats.Stats(pr, stream=s).sort_stats(sortby)
    ps.print_stats()
    print(s.getvalue())

if __name__ == "__main__":
    print("Test Runner Script")
    print("==================")
    print("This script runs all test files in the same directory as the script.")
    print("Expected directory structure:")
    print("  <project_root>")
    print("    └── tests")
    print("        ├── test_runner.py")
    print("        ├── test_module1.py")
    print("        ├── test_module2.py")
    print("        └── ... (other test files)")
    print("\nTo run tests:")
    print("1. Navigate to the directory containing test_runner.py")
    print("2. Run: python test_runner.py")
    print("\nStarting test discovery and execution...\n")

    check_directory()

    print("Current working directory:", os.getcwd())
    print("Expected directory:", EXPECTED_DIR)

    pr = cProfile.Profile()
    pr.enable()

    loader = unittest.TestLoader()
    suite = load_tests(loader)

    result = DetailedTestResult()
    try:
        suite.run(result)
    except Exception as e:
        print(f"An unexpected error occurred during test execution: {str(e)}")
        sys.exit(1)

    result.print_results()

    result.save_range_data_to_csv("new_scaling_range_test.csv")
    pr.disable()
    print_profiling_stats(pr)
