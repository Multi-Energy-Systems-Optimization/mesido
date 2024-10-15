import csv
import inspect
import logging
import math
import os
import re
from typing import Dict, List, Optional
from unittest import TestCase

from pytest import skip

from rtctools._internal.debug_check_helpers import DebugLevel


def create_log_list_scaling(logger_name, level=logging.CRITICAL):
    """
    Creation of a list for the logs which will be filled with the logging information of the
    problem.
    :return:
    """

    class LogRecordsListHandler(logging.Handler):
        """
        Handler class to store log entries in a list
        """

        def __init__(self, records_list):
            self.records_list = records_list
            super().__init__()

        def emit(self, record):
            self.records_list.append(record)

    logs_list = []

    logger = logging.getLogger(logger_name)
    logger.setLevel(level)
    logger.addHandler(LogRecordsListHandler(logs_list))

    return logger, logs_list


def create_problem_with_debug_info(problem_class):
    """
    The problem class that needs to be executed is updated with a debuglevel to
    ensure that the information about the scaling is logged. Furthermore, the logging list is
    created to allow for backtracking and check scaling information.
    :param problem_class: The problem class that should be executed
    :return:
    The problem class including its debuglevel and the logging list and logger.
    """
    # TODO: currently only the default settings can be used to check the scaling.
    rtc_logger, rtc_logs_list = create_log_list_scaling("rtctools")

    class ProblemClassScaling(problem_class):
        _debug_check_level = DebugLevel.VERYHIGH

    return ProblemClassScaling, rtc_logger, rtc_logs_list


def check_scale_order(dict_values, maximum_order_diff):
    """
    Checks the difference in order between the lower and upperbound of several problem settings;
    objective, matrix and right hand side.
    :param dict_values: dictionary with the different problem settings and their respective lower
    and upperbound
    :param maximum_order_diff: the maximum difference that is allowed.
    """
    msg_order = {}
    for key, value in dict_values.items():
        if value[0] != 0.0:
            order = value[1] / value[0]
        else:
            order = value[1]
        if order > maximum_order_diff:
            order_wrong = math.floor(math.log(order, 10))
            msg_order[key] = (
                f"The scaling of this problem is not great, for the {key}, the values are {value} "
                f"which is of the order {order_wrong}, {maximum_order_diff} is the maximum allowed "
                f"order difference."
            )
    assert len(msg_order) == 0, msg_order


def check_element_scale_order(
    element: str,
    actual_range: Dict[str, float],
    expected_range_values: Dict[str, float],
    maximum_order_diff: Optional[float] = None,
) -> None:
    """
    Check if the scaling order of the actual range is within the expected range.

    This function calculates the order of magnitude for both the actual and expected
    ranges, and compares them. If the actual order exceeds the expected order, it
    raises an AssertionError with a detailed message.

    Args:
        element (str): The name or identifier of the element being checked.
        actual_range (Dict[str, float]): A dictionary containing 'min' and 'max' values
                                         of the actual range.
        expected_range_values (Dict[str, float]): A dictionary containing 'min' and 'max'
                                                  values of the expected range.
        maximum_order_diff (Optional[float]): The maximum allowed order difference.
                                              If None, it's calculated from expected_range_values.

    Raises:
        AssertionError: If the actual scaling order exceeds the expected order.

    Note:
        The order is calculated as max/min if min is non-zero, otherwise it's just max.
    """

    def calculate_order(element):
        return element["max"] / element["min"] if element["min"] != 0.0 else element["max"]

    msg_order = {}
    order = calculate_order(actual_range)
    maximum_order_diff = calculate_order(expected_range_values)

    if order > maximum_order_diff:
        order_wrong = math.floor(math.log(order, 10))
        msg_order[element] = (
            f"The scaling order difference of the {element} elements in this problem, "
            f"is of the order {order_wrong}, which is greather than the expected scaled "
            f"order difference ({maximum_order_diff})"
        )
    assert len(msg_order) == 0, msg_order


def get_scaling_range(
    rtc_logs_list: List[logging.LogRecord], rtc_logger: logging.Logger
) -> Dict[str, List[float]]:
    """
    Extract scaling range data from an  optimization problem.

    This function processes a list of log entries to extract scaling range data
    for constraints, objectives and rhs in an optimization problem. It looks for specific
    debug messages related to linear coefficients and extracts numerical values
    to determine the ranges for various components.

    Args:
        rtc_logs_list (List[logging.LogRecord]): A list of log entries to process. Each entry
                               is expected to have 'funcName' and 'msg' attributes.
        rtc_logger (logging.Logger): A logger object to record the extracted range data.

    Returns:
        Dict[str, List[float]]: A dictionary containing the extracted range data.
                                Possible keys are 'matrix', 'rhs', 'objective_matrix',
                                and 'objective'. Each value is a list of two floats
                                representing the minimum and maximum of the range.

    Note:
        The function assumes specific formats for the log messages and may need
        adjustment if the log format changes.
    """
    linear_coeff_log = [
        log
        for log in rtc_logs_list
        if "__debug_check_transcribe_linear_coefficients" in log.funcName
    ]
    range_data = {}
    for log in linear_coeff_log:
        if (
            "Statistics of constraints: max & min of abs(jac(g, x0))), " "max & min of abs(g(x0))"
        ) == log.msg:
            data = linear_coeff_log[linear_coeff_log.index(log) + 1]
            data_str = re.findall(r"[-+]?\d*\.\d+|\d+", data.msg)
            range_data["matrix"] = {"min": float(data_str[1]), "max": float(data_str[0])}
            range_data["rhs"] = {"min": float(data_str[3]), "max": float(data_str[2])}
        elif ("Statistics of objective: max & min of abs(jac(f,") in log.msg:
            data = linear_coeff_log[linear_coeff_log.index(log) + 1]
            data_str = re.findall(r"[-+]?\d*\.\d+|\d+", data.msg)
            if len(data_str) > 2:
                range_data["objective_matrix"] = {
                    "min": float(data_str[1]),
                    "max": float(data_str[0]),
                }
                range_data["objective"] = {"min": float(data_str[3]), "max": float(data_str[2])}
            else:
                range_data["objective"] = {"min": float(data_str[1]), "max": float(data_str[0])}
    for k, v in range_data.items():
        rtc_logger.info(f"{k,v}")
    logging.info(f"Extracted range data: {range_data}")  # Add this line for debugging
    return range_data


def check_scale_range(
    test_name: str, range_data: dict, relative_tol: float, maximum_order_diff: float
) -> None:
    """
    Perform scaling tests by comparing actual range data against expected values.

    This function reads expected scaling ranges from a CSV file and compares them
    against the provided actual range data. It checks if the actual minimum and
    maximum values for each element (objective, matrix, rhs) fall within the
    expected ranges, considering a relative tolerance.

    Args:
        test_name (str): The name of the test case to look up in the CSV file.
        range_data (dict): A dictionary containing the actual range data for each element.
                           Expected format: {
                               'objective': [min, max],
                               'matrix': [min, max],
                               'rhs': [min, max]
                           }
        relative_tol (float, optional): The relative tolerance for comparing actual and
                                        expected values.

    Raises:
        FileNotFoundError: If the scaling_range_test.csv file is not found.
        ValueError: If expected values for the test_name or any element are not found in the CSV.
        AssertionError: If any actual value falls outside the expected range, considering the
        relative tolerance.

    Returns:
        None: The function doesn't return a value, but raises exceptions for any failed checks.
    """
    elements = ["objective", "matrix", "rhs"]
    folder_name = "test_scaling_data"
    file_name = "scaling_range_test.csv"
    csv_file_path = get_csv_file_path(folder_name, file_name)
    expected_values = read_expected_values(csv_file_path, test_name, elements)

    for element in elements:
        test_range_values = range_data[element]
        expected_range_values = expected_values[element]
        if (test_range_values["min"] <= test_range_values["max"]) and (
            expected_range_values["min"] <= expected_range_values["max"]
        ):
            check_element_range(element, test_range_values, expected_range_values, relative_tol)
            check_element_scale_order(
                element, test_range_values, expected_range_values, maximum_order_diff
            )
        else:
            skip(
                f"Expected or actual min is greater than max value for {element}. "
                f"Actual: ({test_range_values['min']}, {test_range_values['max']}), "
                f"expected: ({expected_range_values['min']}, {expected_range_values['max']}). "
                "Skipped check_element_range."
            )


def get_csv_file_path(folder_name: str, file_name: str) -> str:
    """Get the path to the CSV file containing expected values."""
    csv_file_path = os.path.join(os.path.dirname(__file__), folder_name, file_name)

    if not os.path.exists(csv_file_path):
        raise FileNotFoundError(f"The file {csv_file_path} does not exist.")

    return csv_file_path


def read_expected_values(
    csv_file_path: str, test_name: str, elements: List[str]
) -> Dict[str, Dict[str, float]]:
    """Read and return the expected values from the CSV file for the given test name."""
    expected_values = {}

    with open(csv_file_path, "r") as csvfile:
        csv_reader = csv.reader(csvfile)
        next(csv_reader)  # Skip the header row
        for row in csv_reader:
            if row[0] == test_name:
                element = row[1]
                if element in elements:
                    min_value, max_value = float(row[2]), float(row[3])
                    expected_values.setdefault(element, {})["min"] = min_value
                    expected_values.setdefault(element, {})["max"] = max_value

    if not expected_values:
        raise ValueError(
            f"Could not find expected values for {test_name} in scaling_range_test.csv"
        )

    for element in elements:
        if element not in expected_values:
            raise ValueError(
                f"Could not find expected values for {element} in scaling_range_test.csv"
            )

    return expected_values


def check_element_range(
    element: str,
    actual_range: Dict[str, float],
    expected_range: Dict[str, float],
    relative_tol: float,
) -> None:
    """Check if the actual range falls within the expected range,
    considering the relative tolerance.

    Note: this function assumes that actual_range["max"] is non-negative.
    """
    actual_min, actual_max = (
        actual_range["min"],
        actual_range["max"],
    )
    expected_min, expected_max = (
        expected_range["min"],
        expected_range["max"],
    )

    if actual_min < expected_min * (1 - relative_tol):
        raise AssertionError(
            f"The actual min for {element} ({actual_min}) "
            f"is smaller than the expected min ({expected_min})"
        )

    if actual_max > expected_max * (1 + relative_tol):
        raise AssertionError(
            f"The actual max for {element} ({actual_max}) is "
            f"greater than the expected max ({expected_max})"
        )


def check_scaling(
    test_instance: TestCase,
    rtc_logger: logging.Logger,
    rtc_logs_list: List[logging.LogRecord],
    test_name_suffix: Optional[str] = None,
    maximum_order_diff: float = None,
    relative_tol: float = 0.1,
) -> None:
    """
    Helper function to check scaling for a test instance.

    This function performs scaling checks on the provided test instance using the
    given logger and log records. It retrieves the range data, checks the scale
    order, and verifies the scale range.

    Args:
        test_instance (TestCase): The test instance object to be checked.
        rtc_logger (logging.Logger): The logger object used for logging information.
        rtc_logs_list (List[logging.LogRecord]): A list of log records to be analyzed.
        test_name_suffix (str, optional): An optional suffix to be added to the test name.
            Defaults to None.
        maximum_order_diff (float, optional): The maximum allowed order difference
            for scale checking. Defaults to None.
        relative_tol (float, optional): The relative tolerance for scale range
            checking. Defaults to 0.1.

    Returns:
        None

    Note:
        This function modifies the test_instance by adding a 'range_data' attribute.
        It also logs the range data for debugging purposes.
    """
    test_name = inspect.currentframe().f_back.f_code.co_name
    if test_name_suffix is not None:
        test_name += "_" + test_name_suffix
    range_data = get_scaling_range(rtc_logs_list, rtc_logger)
    test_instance.range_data = range_data
    test_instance.test_name = test_name
    logging.info(f"Range data in check_scaling: {range_data}")  # Add this line for debugging
    check_scale_range(test_name, range_data, relative_tol, maximum_order_diff)
