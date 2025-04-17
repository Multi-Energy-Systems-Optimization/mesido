if __name__ == "__main__":
    import unittest
    import time
    import os

    # Create a test suite
    # Discover all test files
    start_dir = os.path.dirname(os.path.abspath(__file__))  # Current directory
    suite = unittest.TestLoader().discover(
        start_dir=start_dir,
        pattern='test_*.py'  # This will find all Python files that start with "test_"
    )

    # Run tests and collect results
    start_time = time.time()
    result = unittest.TextTestRunner(verbosity=2).run(suite)
    
    # Print summary
    print("\nTest Summary:")
    print(f"Tests run: {result.testsRun}")
    print(f"Failures: {len(result.failures)}")
    print(f"Errors: {len(result.errors)}")
    print(f"Skipped: {len(result.skipped)}")
    print(f"All tests passed: {result.wasSuccessful()}")
    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
    
    if result.failures:
        print("\nFailed Tests:")
        for failure in result.failures:
            test_case = failure[0]
            print(f"- {test_case.id()}")

    # List error tests
    if result.errors:
        print("\nTests with Errors:")
        for error in result.errors:
            test_case = error[0]
            print(f"- {test_case.id()}")

    # Optional: exit with appropriate code for CI/CD
    exit_code = 0 if result.wasSuccessful() else 1
    exit(exit_code)
