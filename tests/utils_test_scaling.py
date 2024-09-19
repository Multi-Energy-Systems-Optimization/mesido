import logging
import math
import re

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
    logger, logs_list = create_log_list_scaling("rtctools")

    class ProblemClassScaling(problem_class):
        _debug_check_level = DebugLevel.VERYHIGH

    return ProblemClassScaling, logger, logs_list


def check_order(dict_values, maximum_order_diff):
    """
    Checks the difference in order between the lower and upperbound of several problem settings;
    objective, matrix and right hand side.
    :param dict_values: dictionary with the different problem settings and their respective lower
    and upperbound
    :param maximum_order_diff: the maximum difference that is allowed.
    :return:
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


def problem_scaling_check(logs_list, logger, order_diff=1e6):
    """
     Checks the difference in order between the lower and upperbound of several problem settings;
    objective, matrix and rhs.
    These settings are first to be extracted from the logging information.
    :param logs_list: The list containing all the logs.
    :param logger: The logger that logs information, warnings and errors depending on the level set.
    :param order_diff: The maximum difference between the lower and upperbound.
    :return:
    """
    linear_coeff_log = [
        log for log in logs_list if "__debug_check_transcribe_linear_coefficients" in log.funcName
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
                range_data["objective_matrix"] = [float(data_str[1]), float(data_str[0])]
                range_data["objective"] = [float(data_str[3]), float(data_str[2])]
            else:
                range_data["objective"] = [float(data_str[1]), float(data_str[0])]
    for k, v in range_data.items():
        logger.info(f"{k,v}")
    check_order(range_data, order_diff)
