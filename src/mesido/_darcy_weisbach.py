import math

import CoolProp as cP

from mesido.constants import GRAVITATIONAL_CONSTANT
from mesido.network_common import NetworkSettings

import numpy as np


def _kinematic_viscosity(temperature, network_type=NetworkSettings.NETWORK_TYPE_HEAT, pressure=0.0):
    """
    The kinematic viscosity is determined as a function of the fluid used.
    - If the network type is a milp network, the used fluid is water for which the kinematic
    viscosity barely changes with pressure, thus determined at a fixed pressure (0.5MPa) and a
    temperature [K] based on the network information.
    - If the fluid is hydrogen or gas, the kinematic viscosity is calculated using CoolProp for
    which the pressure [Pa] and temperature [K] are provided as inputs.
    The gas composition is based on Groninger gas.
    """

    # Kinematic viscosity [m2/s] = Dynamic viscosity [Pa-s] / density [kg/m3]
    if network_type == NetworkSettings.NETWORK_TYPE_HEAT:
        return cP.CoolProp.PropsSI(
            "V", "T", 273.15 + temperature, "P", 0.5 * 10**6, "WATER"
        ) / cP.CoolProp.PropsSI("D", "T", 273.15 + temperature, "P", 0.5 * 10**6, "WATER")
    elif network_type == NetworkSettings.NETWORK_TYPE_HYDROGEN:
        pressure = pressure if pressure else 101325
        return cP.CoolProp.PropsSI(
            "V", "T", 273.15 + temperature, "P", pressure, "HYDROGEN"
        ) / cP.CoolProp.PropsSI("D", "T", 273.15 + temperature, "P", pressure, "HYDROGEN")
    elif network_type == NetworkSettings.NETWORK_TYPE_GAS:
        pressure = pressure if pressure else 101325
        return cP.CoolProp.PropsSI(
            "V",
            "T",
            273.15 + temperature,
            "P",
            pressure,
            NetworkSettings.NETWORK_COMPOSITION_GAS,
        ) / cP.CoolProp.PropsSI(
            "D",
            "T",
            273.15 + temperature,
            "P",
            pressure,
            NetworkSettings.NETWORK_COMPOSITION_GAS,
        )
    else:
        raise Exception("Unknown network type for computing dynamic viscosity")


def _colebrook_white(reynolds, relative_roughness, friction_factor=0.015):
    """
    This function return the friction factor for turbulent conditions with the Colebrook-White
    equation.
    """
    for _ in range(1000):
        friction_factor_old = friction_factor

        reynolds_star = (
            1 / math.sqrt(8.0) * reynolds * math.sqrt(friction_factor) * relative_roughness
        )
        friction_factor = (
            1.0
            / (
                -2.0
                * math.log10(
                    2.51 / reynolds / math.sqrt(friction_factor) * (1 + reynolds_star / 3.3)
                )
            )
            ** 2
        )

        if (
            abs(friction_factor - friction_factor_old) / max(friction_factor, friction_factor_old)
            < 1e-6
        ):
            return friction_factor
    else:
        raise Exception("Colebrook-White did not converge")


def friction_factor(
    velocity,
    diameter,
    wall_roughness,
    temperature,
    network_type=NetworkSettings.NETWORK_TYPE_HEAT,
    pressure=0.0,
):
    """
    Darcy-weisbach friction factor calculation from both laminar and turbulent
    flow.
    """

    kinematic_viscosity = _kinematic_viscosity(
        temperature, network_type=network_type, pressure=pressure
    )
    reynolds = velocity * diameter / kinematic_viscosity

    assert velocity >= 0

    if velocity == 0.0 or diameter == 0.0:
        return 0.0
    elif reynolds <= 2000.0:
        friction_factor = 64.0 / reynolds
    elif reynolds >= 4000.0:
        friction_factor = _colebrook_white(reynolds, wall_roughness / diameter)
    else:
        fac_turb = _colebrook_white(4000.0, wall_roughness / diameter)
        fac_laminar = 64.0 / 2000.0
        w = (reynolds - 2000.0) / 2000.0
        friction_factor = w * fac_turb + (1 - w) * fac_laminar

    return friction_factor


def head_loss(
    velocity,
    diameter,
    length,
    wall_roughness,
    temperature,
    network_type=NetworkSettings.NETWORK_TYPE_HEAT,
    pressure=0.0,
):
    """
    Head loss for a circular pipe of given length.
    """

    f = friction_factor(
        velocity,
        diameter,
        wall_roughness,
        temperature,
        network_type=network_type,
        pressure=pressure,
    )

    return length * f / (2 * GRAVITATIONAL_CONSTANT) * velocity**2 / diameter


def get_linear_pipe_dh_vs_q_fit(
    diameter,
    length,
    wall_roughness,
    temperature,
    n_lines=10,
    v_max=2.5,
    network_type=NetworkSettings.NETWORK_TYPE_HEAT,
    pressure=0.0,
):
    """
    This function returns a set of coefficients to approximate a head loss curve with linear
    functions in the form of: head loss = b + (a * Q)
    """
    area = math.pi * diameter**2 / 4

    v_points = np.linspace(0.0, v_max, n_lines + 1)
    q_points = v_points * area

    h_points = np.array(
        [
            head_loss(
                v,
                diameter,
                length,
                wall_roughness,
                temperature,
                network_type=network_type,
                pressure=pressure,
            )
            for v in v_points
        ]
    )

    a = np.diff(h_points) / np.diff(q_points)
    b = h_points[1:] - a * q_points[1:]

    return a, b


def get_linear_pipe_power_hydraulic_vs_q_fit(
    rho,
    diameter,
    length,
    wall_roughness,
    temperature,
    n_lines=10,
    v_max=2.5,
    network_type=NetworkSettings.NETWORK_TYPE_HEAT,
    pressure=0.0,
):
    """
    power_hydraulic = b + (a * Q)
    """
    area = math.pi * diameter**2 / 4.0

    v_points = np.linspace(0.0, v_max, n_lines + 1)
    q_points = v_points * area
    power_hydraulic_points = np.array(
        [
            rho
            * GRAVITATIONAL_CONSTANT
            * abs(
                head_loss(
                    v,
                    diameter,
                    length,
                    wall_roughness,
                    temperature,
                    network_type=network_type,
                    pressure=pressure,
                )
            )
            * v
            * area
            for v in v_points
        ]
    )

    a = np.diff(power_hydraulic_points) / np.diff(q_points)  # calc gradients for n_line segments
    b = power_hydraulic_points[1:] - a * q_points[1:]

    return a, b
