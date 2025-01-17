import numpy as np


def flow_direction_path_constraints(
    optimization_problem,
    pipe: str,
    flow_dir_var_name: str,
    maximum_discharge: float = 0.0,
    minimum_discharge: float = 0.0,
    dn_none: float = 0.0,
    is_disconnected_var=None,
):
    constraints = []

    q_pipe = optimization_problem.state(f"{pipe}.Q")
    flow_dir = optimization_problem.state(flow_dir_var_name)

    if is_disconnected_var is None:
        is_disconnected = 0.0
    else:
        is_disconnected = optimization_problem.state(is_disconnected_var)

    if maximum_discharge == 0.0:
        maximum_discharge = 1.0
    big_m = 2.0 * (maximum_discharge + minimum_discharge)

    if minimum_discharge > 0.0:
        constraint_nominal = (minimum_discharge * big_m) ** 0.5
    else:
        constraint_nominal = big_m

    constraints.append(
        (
            (q_pipe - big_m * (flow_dir + dn_none) + (1 - is_disconnected) * minimum_discharge)
            / constraint_nominal,
            -np.inf,
            0.0,
        )
    )
    constraints.append(
        (
            (q_pipe + big_m * (1 - flow_dir + dn_none) - (1 - is_disconnected) * minimum_discharge)
            / constraint_nominal,
            0.0,
            np.inf,
        )
    )

    return constraints


def flow_direction_topology_path_constraints(
    optimization_problem, pipe: str, flow_dir_var_name: str, base_flow_dir_var: str
):
    # see the flow_direction constraints for pipe_series
    pass

def initialization_pipe_head_loss(optimization_problem, cls_name, pipe_name):
    head_loss_var = f"{pipe_name}.__head_loss"
    commodity = optimization_problem.energy_system_components_commodity.get(pipe_name).lower()
    # Note we always use the gas network type for the naming of variables, independent of
    # the gas mixture used.
    network = commodity[0].lower()
    initialized_vars = getattr(optimization_problem,
                               f"_{network}n_head_loss_class").initialize_variables_nominals_and_bounds(
        optimization_problem, commodity, pipe_name, optimization_problem.gas_network_settings)

    head_bounds = getattr(optimization_problem, f"_{cls_name}__{commodity}_pipe_head_bounds")
    head_loss_zero_bounds = getattr(optimization_problem, f"_{cls_name}__{commodity}_pipe_head_loss_zero_bounds")
    network_head_loss_map = getattr(optimization_problem, f"_{network}n_pipe_to_head_loss_map")
    pipe_head_loss_var = getattr(optimization_problem, f"_{cls_name}__{commodity}_pipe_head_loss_var")
    head_loss_nominals = getattr(optimization_problem, f"_{cls_name}__{commodity}_pipe_head_loss_nominals")
    head_loss_bounds = getattr(optimization_problem, f"_{cls_name}__{commodity}_pipe_head_loss_bounds")
    if initialized_vars[0] != {}:
        head_bounds[f"{pipe_name}.{commodity}In.H"] = (initialized_vars)[0]
    if initialized_vars[1] != {}:
        head_bounds[f"{pipe_name}.{commodity}Out.H"] = initialized_vars[1]
    if initialized_vars[2] != {}:
        head_loss_zero_bounds[f"{pipe_name}.dH"] = initialized_vars[2]
    if initialized_vars[3] != {}:
        network_head_loss_map[pipe_name] = initialized_vars[3]
    if initialized_vars[4] != {}:
        pipe_head_loss_var[head_loss_var] = initialized_vars[4]
    if initialized_vars[5] != {}:
        head_loss_nominals[f"{pipe_name}.dH"] = initialized_vars[5]
    if initialized_vars[6] != {}:
        head_loss_nominals[head_loss_var] = initialized_vars[6]
    if initialized_vars[7] != {}:
        head_loss_bounds[head_loss_var] = initialized_vars[7]

    if (
            initialized_vars[8] != {}
            and initialized_vars[9] != {}
            and initialized_vars[10] != {}
    ):  # Variables needed to indicate if a linear line segment is active

        pipe_line_segment_map = getattr(optimization_problem,
                                  f"_{commodity}_pipe_linear_line_segment_map")
        pipe_line_segment_map[pipe_name] = {}
        for ii_line in range(optimization_problem.gas_network_settings["n_linearization_lines"] * 2):
            segment_var_name = initialized_vars[8][ii_line]
            pipe_line_segment_map[pipe_name][ii_line] = segment_var_name
            getattr(optimization_problem,
                    f"_{cls_name}__{commodity}_pipe_linear_line_segment_var")[segment_var_name] = (
                initialized_vars[9][segment_var_name])
            getattr(optimization_problem,
                    f"_{cls_name}__{commodity}_pipe_linear_line_segment_var_bounds")[segment_var_name] = (
                initialized_vars)[10][segment_var_name]