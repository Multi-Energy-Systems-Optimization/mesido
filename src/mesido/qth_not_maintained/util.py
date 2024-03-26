import logging

from rtctools.optimization.timeseries import Timeseries
from rtctools.util import run_optimization_problem

from .. import __version__


def run_heat_network_optimization(heat_class, qht_class, *args, log_level=logging.INFO, **kwargs):
    """
    This function is meant to run the milp milp class and qth non-linear class sequentially. Both
    solve the same network, but the qth class is constrained with the flow direction found in the
    milp optimization. This allows to approximate the full mixed integer non-linear optimization
    with much faster computational times. Note that this does not guarantee optimality, however
    given that the milp milp optimization is reasonably close and conservative it can guarantee
    feasibility.
    """
    logger = logging.getLogger("mesido")
    logger.setLevel(log_level)
    logger.info(f"Using RTC-Tools Heat Network {__version__}.")

    heat_problem = run_optimization_problem(heat_class, *args, log_level=log_level, **kwargs)
    results = heat_problem.extract_results()
    times = heat_problem.times()

    directions = {}

    for p in heat_problem.hot_pipes:
        q_in = results[p + ".HeatIn.Q"]
        q_out = results[p + ".HeatOut.Q"]

        if not heat_problem.parameters(0)[p + ".disconnectable"]:
            # Flow direction is directly related to the sign of the milp
            direction_pipe = (q_in >= 0.0).astype(int) * 2 - 1
        elif heat_problem.parameters(0)[p + ".disconnectable"]:
            direction_pipe = (q_in >= 0.0).astype(int) * 2 - 1
            # Disconnect a pipe when the milp entering the component is only used
            # to account for its milp losses. There are three cases in which this
            # can happen.
            direction_pipe[((q_in > 0.0) & (q_out < 0.0))] = 0
            direction_pipe[((q_in < 0.0) & (q_out > 0.0))] = 0
            direction_pipe[((q_in == 0.0) | (q_out == 0.0))] = 0
        directions[p] = Timeseries(times, direction_pipe)

        # NOTE: The assumption is that the orientation of the cold pipes is such that the flow
        # is always in the same direction as its "hot" pipe companion.
        cold_pipe = heat_problem.hot_to_cold_pipe(p)
        directions[cold_pipe] = directions[p]

    for v in heat_problem.energy_system_components.get("check_valve", []):
        status_valve = (results[f"{v}__status_var"]).round().astype(int)
        directions[v] = Timeseries(times, status_valve)

    for v in heat_problem.energy_system_components.get("control_valve", []):
        directions_valve = (results[f"{v}__flow_direct_var"]).round().astype(int) * 2 - 1
        directions[v] = Timeseries(times, directions_valve)

    buffer_target_discharges = {}
    parameters = heat_problem.parameters(0)

    for b in heat_problem.energy_system_components.get("buffer", []):
        cp = parameters[f"{b}.cp"]
        rho = parameters[f"{b}.rho"]
        heat_flow_rate_to_discharge = 1 / (cp * rho * parameters[f"{b}.dT"])
        buffer_target_discharges[b] = Timeseries(
            times, results[f"{b}.Heat_buffer"] * heat_flow_rate_to_discharge
        )

    qth_problem = run_optimization_problem(
        qht_class,
        *args,
        log_level=log_level,
        flow_directions=directions,
        buffer_target_discharges=buffer_target_discharges,
        **kwargs,
    )

    return heat_problem, qth_problem
