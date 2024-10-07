import argparse
import logging
import re
import sys
import time
from pathlib import Path

import esdl

from mesido import __version__

from rtctools.util import run_optimization_problem


MULTI_ENUM_NAME_TO_FACTOR = {
    esdl.MultiplierEnum.ATTO: 1e-18,
    esdl.MultiplierEnum.FEMTO: 1e-15,
    esdl.MultiplierEnum.PICO: 1e-12,
    esdl.MultiplierEnum.NANO: 1e-9,
    esdl.MultiplierEnum.MICRO: 1e-6,
    esdl.MultiplierEnum.MILLI: 1e-3,
    esdl.MultiplierEnum.CENTI: 1e-2,
    esdl.MultiplierEnum.DECI: 1e-1,
    esdl.MultiplierEnum.NONE: 1e0,
    esdl.MultiplierEnum.DEKA: 1e1,
    esdl.MultiplierEnum.HECTO: 1e2,
    esdl.MultiplierEnum.KILO: 1e3,
    esdl.MultiplierEnum.MEGA: 1e6,
    esdl.MultiplierEnum.GIGA: 1e9,
    esdl.MultiplierEnum.TERA: 1e12,
    esdl.MultiplierEnum.TERRA: 1e12,
    esdl.MultiplierEnum.PETA: 1e15,
    esdl.MultiplierEnum.EXA: 1e18,
}


def _sort_numbered(list_):
    """
    If there are any integers in the string, we want to parse it as a
    number. That way, "Pipe2" comes before "Pipe10".
    """
    return sorted(
        list_, key=lambda x: tuple(int(y) if y.isdigit() else y for y in re.split(r"(\d+)$", x))
    )


def main_decorator(func):
    def main(runinfo_path=None, log_level=None, run_remote=None):
        logger = logging.getLogger("WarmingUP-MPC")
        logger.setLevel(logging.INFO)

        def handle_exception(exc_type, exc_value, exc_traceback):
            if issubclass(exc_type, KeyboardInterrupt):
                sys.__excepthook__(exc_type, exc_value, exc_traceback)
                return

            import traceback

            fmt_tb = "".join(traceback.format_exception(exc_type, exc_value, exc_traceback))
            logging.exception(f"Uncaught exception: {fmt_tb}")

        sys.excepthook = handle_exception

        start_time = time.time()

        if func.__module__ == "__main__":
            parser = argparse.ArgumentParser(description="Run ESDL model")
            parser.add_argument(
                "-l",
                "--log",
                default="WARN",
                dest="log_level",
                choices=["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],
                help="Set the logging level (default: %(default)s)",
            )

            remote_parser = parser.add_mutually_exclusive_group(required=False)
            remote_parser.add_argument(
                "--remote", dest="remote", action="store_true", help="Run the workflow remotely"
            )
            remote_parser.add_argument(
                "--local",
                dest="remote",
                action="store_false",
                help="Run the workflow locally (default)",
            )
            parser.set_defaults(remote=False)

            arguments = parser.parse_args()

            if runinfo_path is None:
                runinfo_path = Path(arguments.runinfo_path)
            if log_level is None:
                log_level = logging.getLevelName(arguments.log_level)
            if run_remote is None:
                run_remote = arguments.remote

        logging.basicConfig(
            format="%(asctime)s %(levelname)s %(message)s",
            level=log_level,
            handlers=[logging.StreamHandler()],
        )

        logger.info(f"Using WarmingUP-MPC {__version__}.")

        if run_remote:
            import inspect
            from warmingup_mpc.amqp_client import AMQPClient

            workflow_name = Path(inspect.getfile(func)).stem

            mpc_rpc = AMQPClient()

            # Effectively calling "func" remotely
            mpc_rpc.run_runinfo_workflow(workflow_name, runinfo_path, log_level)
        else:
            func(runinfo_path, log_level)

        print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))

    return main


def get_cost_value_and_unit(cost_info: esdl.SingleValue):
    cost_value = cost_info.value
    unit_info = cost_info.profileQuantityAndUnit
    unit = unit_info.unit
    per_time_uni = unit_info.perTimeUnit
    per_unit = unit_info.perUnit
    multiplier = unit_info.multiplier
    per_multiplier = unit_info.perMultiplier

    cost_value *= MULTI_ENUM_NAME_TO_FACTOR[multiplier]
    cost_value /= MULTI_ENUM_NAME_TO_FACTOR[per_multiplier]

    return cost_value, unit, per_unit, per_time_uni


def run_optimization_problem_solver(
    scenario_problem_class,
    solver_class=None,
    **kwargs,
):
    """
    This method runs the optimisation problem based on the scenario_problem_class. An additional
    solver_class can be added to substitute the default solver options of the problem definition
    class.
    :param scenario_problem_class: Class defining the optimization problem
    :param solver_class: Class defining the solver settings.
    :param kwargs:
    :return:
    """

    new_solver = False
    if solver_class:

        if not issubclass(scenario_problem_class, solver_class):
            # if solver_class is already a subclass of the problem class, then these settings are
            # already used and it should not be added to the inheritance structure.
            class ProblemSolverClass(solver_class, scenario_problem_class):
                pass

            solution = run_optimization_problem(ProblemSolverClass, **kwargs)

            new_solver = True

    if not new_solver:
        solution = run_optimization_problem(scenario_problem_class, **kwargs)

    return solution
