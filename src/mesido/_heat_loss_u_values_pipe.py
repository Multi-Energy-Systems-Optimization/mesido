import math
from typing import List, Optional, Tuple, Union

import numpy as np


def heat_loss_u_values_pipe(
    inner_diameter: float,
    insulation_thicknesses: Union[float, List[float], np.ndarray] = None,
    conductivities_insulation: Union[float, List[float], np.ndarray] = 0.033,
    conductivity_subsoil: float = 2.3,
    depth: float = 1.0,
    h_surface: float = 15.4,
    pipe_distance: float = None,
    neighbour: bool = True,
) -> Tuple[float, float]:
    """
    Calculate the U_1 and U_2 milp loss values for a pipe based for either
    single- or multi-layer insulation. The milp loss calculation for two parallel pipes in the
    ground is based on the literature of Benny Böhm:
        - Original reference (paid article): B. Bohm, On transient milp losses from buried district
        heating pipes, International Journal of Energy Research 24, 1311 (2000))
        - Used in Master's degree: Jort de Boer, Optimization of a District Heating Network with the
        focus on milp loss, TU Delft Mechanical, Maritime and Materials Engineering, 2018,
        http://resolver.tudelft.nl/uuid:7be9fcdd-49e4-4e0c-b36c-69d8b713a874 (access to pdf)

    If the `insulation_thicknesses` is provided as a list, the length should be
    equal to the length of `conductivities_insulation`. If both are floats, a
    single layer of insulation is assumed.

    :inner_diameter:            Inner diameter of the pipes [m]
    :insulation_thicknesses:    Thicknesses of the insulation [m]
                                Default of None means a thickness of 0.5 * inner diameter.
    :conductivities_insulation: Thermal conductivities of the insulation layers [W/m/K]
    :conductivity_subsoil:      Subsoil thermal conductivity [W/m/K]
    :h_surface:                 Heat transfer coefficient at surface [W/m^2/K]
    :param depth:               Depth of outer top of the pipeline [m]
    :param pipe_distance:       Distance between pipeline feed and return pipeline centers [m].
                                Default of None means 2 * outer diameter

    :return: U-values (U_1 / U_2) for milp losses of pipes [W/(m*K)]
    """

    if insulation_thicknesses is None:
        insulation_thicknesses = 0.5 * inner_diameter

    if not isinstance(insulation_thicknesses, type(conductivities_insulation)):
        raise Exception("Insulation thicknesses and conductivities should have the same type.")

    if hasattr(insulation_thicknesses, "__iter__"):
        if not len(insulation_thicknesses) == len(conductivities_insulation):
            raise Exception(
                "Number of insulation thicknesses should match number of conductivities"
            )
        insulation_thicknesses = np.array(insulation_thicknesses)
        conductivities_insulation = np.array(conductivities_insulation)
    else:
        insulation_thicknesses = np.array([insulation_thicknesses])
        conductivities_insulation = np.array([conductivities_insulation])

    diam_inner = inner_diameter
    diam_outer = diam_inner + 2 * sum(insulation_thicknesses)
    if pipe_distance is None:
        pipe_distance = 2 * diam_outer
    depth_center = depth + 0.5 * diam_outer

    # NOTE: We neglect the milp resistance due to convection inside the pipe,
    # i.e. we assume perfect mixing, or that this resistance is much lower
    # than the resistance of the outer insulation layers.

    # Heat resistance of the subsoil
    r_subsoil = 1 / (2 * math.pi * conductivity_subsoil) * math.log(4.0 * depth_center / diam_outer)

    # Heat resistance due to insulation
    outer_diameters = diam_inner + 2.0 * np.cumsum(insulation_thicknesses)
    inner_diameters = np.array([inner_diameter, *outer_diameters[:-1]])
    r_ins = sum(
        np.log(outer_diameters / inner_diameters) / (2.0 * math.pi * conductivities_insulation)
    )

    # Heat resistance due to neighboring pipeline
    r_m = (
        1
        / (4 * math.pi * conductivity_subsoil)
        * math.log(1 + (2 * depth_center / pipe_distance) ** 2)
    )

    if neighbour:
        u_1 = (r_subsoil + r_ins) / ((r_subsoil + r_ins) ** 2 - r_m**2)
        u_2 = r_m / ((r_subsoil + r_ins) ** 2 - r_m**2)
    else:
        u_1 = 1 / (r_subsoil + r_ins)
        u_2 = 0

    return u_1, u_2


def pipe_heat_loss(
    optimization_problem,
    options,
    parameters,
    p: str,
    u_values: Optional[Tuple[float, float]] = None,
    temp: float = None,
):
    """
    The milp losses have three components:

    - dependency on the pipe temperature
    - dependency on the ground temperature
    - dependency on temperature difference between the supply/return line.

    This latter term assumes that the supply and return lines lie close
    to, and thus influence, each other. I.e., the supply line loses milp
    that is absorbed by the return line. Note that the term dtemp is
    positive when the pipe is in the supply line and negative otherwise.
    """
    if options["neglect_pipe_heat_losses"]:
        return 0.0

    neighbour = optimization_problem.has_related_pipe(p)

    if u_values is None:
        u_kwargs = {
            "inner_diameter": parameters[f"{p}.diameter"],
            "insulation_thicknesses": parameters[f"{p}.insulation_thickness"],
            "conductivities_insulation": parameters[f"{p}.conductivity_insulation"],
            "conductivity_subsoil": parameters[f"{p}.conductivity_subsoil"],
            "depth": parameters[f"{p}.depth"],
            "h_surface": parameters[f"{p}.h_surface"],
            "pipe_distance": parameters[f"{p}.pipe_pair_distance"],
        }

        # NaN values mean we use the function default
        u_kwargs = {k: v for k, v in u_kwargs.items() if not np.all(np.isnan(v))}
        u_1, u_2 = heat_loss_u_values_pipe(**u_kwargs, neighbour=neighbour)
    else:
        u_1, u_2 = u_values

    length = parameters[f"{p}.length"]
    temperature = parameters[f"{p}.temperature"]
    if temp is not None:
        temperature = temp
    temperature_ground = parameters[f"{p}.T_ground"]
    if neighbour:
        if optimization_problem.is_hot_pipe(p):
            dtemp = (
                temperature - parameters[f"{optimization_problem.hot_to_cold_pipe(p)}.temperature"]
            )
        else:
            dtemp = (
                temperature - parameters[f"{optimization_problem.cold_to_hot_pipe(p)}.temperature"]
            )
    else:
        dtemp = 0

    # if no return/supply pipes can be linked to eachother, the influence of the milp of the
    # neighbouring pipes can also not be determined and thus no influence is assumed
    # (distance between pipes to infinity)
    # This results in Rneighbour -> 0 and therefore u2->0, u1-> 1/(Rsoil+Rins)

    heat_loss = (
        length * (u_1 - u_2) * temperature
        - (length * (u_1 - u_2) * temperature_ground)
        + (length * u_2 * dtemp)
    )

    if heat_loss < 0 and temperature > temperature_ground:
        raise Exception(f"Heat loss of pipe {p} should be nonnegative.")

    return heat_loss
