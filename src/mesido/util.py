from mesido.esdl.esdl_parser import BaseESDLParser
from mesido.esdl.profile_parser import BaseProfileReader, InfluxDBProfileReader

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.util import run_optimization_problem


def run_esdl_mesido_optimization(
    problem: CollocatedIntegratedOptimizationProblem,
    esdl_parser: BaseESDLParser,
    esdl_file_name: str = "",
    base_folder: str = "",
    esdl_string: str = "",
    profile_reader: BaseProfileReader = InfluxDBProfileReader,
    input_timeseries_file: str = "",
    *args,
    **kwargs,
):
    """
    This function is used to execute an optimization on a MESIDO defined problem. Compared to the
    standard rtc-tools run_optimization_problem() method extra checks can be included here.

    params:
    Problem: The problem defined in the mesido
    esdl_parser: How the ESDL will be provided to the problem, e.g. file or base64 string.
    base_folder: The base folder from where the input, model, output folder are defined
    esdl_file_name: The string of the esdl file in case the ESDLFileParser is used and placed in
    the model folder.
    esdl_string: the base64 string in case the ESDLStringParser is selected
    profile_reader: The way the time-series profiles are read
    input_timeseries_file: The file from which to read the time-series profiles in case the
    FromFileReader is selected.

    Returns:
    The solved full problem object with the solution in it.

    """

    solution = run_optimization_problem(
        problem,
        *args,
        base_folder=base_folder,
        esdl_file_name=esdl_file_name,
        esdl_string=esdl_string,
        esdl_parser=esdl_parser,
        profile_reader=profile_reader,
        input_timeseries_file=input_timeseries_file,
        **kwargs,
    )

    feasibility = solution.solver_stats["return_status"]

    assert feasibility.lower() in ["optimal", "finished", "integer optimal solution"]

    return solution
