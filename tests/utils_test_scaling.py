import csv
import inspect
import logging
import math
import os
import re
from typing import Dict, List
from unittest import TestCase

from rtctools._internal.debug_check_helpers import DebugLevel


def create_log_list_scaling(logger_name):
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
    logger.setLevel(logging.INFO)

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
        rtc_logs_list (List[logging.LogRecord]): A list of log entries to process. Each entry is expected
                               to have 'funcName' and 'msg' attributes.
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
            range_data["matrix"] = [float(data_str[1]), float(data_str[0])]
            range_data["rhs"] = [float(data_str[3]), float(data_str[2])]
        elif ("Statistics of objective: max & min of abs(jac(f,") in log.msg:
            data = linear_coeff_log[linear_coeff_log.index(log) + 1]
            data_str = re.findall(r"[-+]?\d*\.\d+|\d+", data.msg)
            if len(data_str) > 2:
                range_data["objective_matrix"] = [
                    float(data_str[1]),
                    float(data_str[0]),
                ]
                range_data["objective"] = [float(data_str[3]), float(data_str[2])]
            else:
                range_data["objective"] = [float(data_str[1]), float(data_str[0])]
    for k, v in range_data.items():
        rtc_logger.info(f"{k,v}")
    return range_data


def check_scale_range(test_name: str, range_data: dict, relative_tol: float) -> None:
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
        check_element_range(element, range_data[element], expected_values[element], relative_tol)


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
    actual_range: List[float],
    expected_range: Dict[str, float],
    relative_tol: float,
) -> None:
    """Check if the actual range falls within the expected range,
    considering the relative tolerance.
    """
    actual_min, actual_max = actual_range
    expected_min, expected_max = expected_range["min"], expected_range["max"]

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
    maximum_order_diff: float = 1e6,
    relative_tol: float = 0.1,
) -> None:
    """
    Helper function to check scaling for a test instance.

    Args:
        test_instance (TestCase): The test instance object.
        logger (logging.Logger): The logger object.
        logs_list (List[logging.LogRecord]): A list of log records.

    Returns:
        None
    """
    range_data = get_scaling_range(rtc_logs_list, rtc_logger)
    test_instance.range_data = range_data
    test_name = inspect.currentframe().f_back.f_code.co_name
    check_scale_order(range_data, maximum_order_diff)
    check_scale_range(test_name, range_data, relative_tol)
