import math
from dataclasses import dataclass
from typing import Tuple


@dataclass(frozen=True)
class PipeClass:
    """
    This class defines a certain pipe. The optimization can select different pipe classes for each
    pipe, depending on the available pipe classes.
    - name: Name of the pipe class e.g. DN200-S1
    - maximum_velocity: Maximum velocity magnitude in the pipe in m/s.
    - u_values: Insulative properties.
    - investment_costs: Cost for the pipe in euro/meter
    """

    name: str
    inner_diameter: float
    maximum_velocity: float
    u_values: Tuple[float, float]
    investment_costs: float

    @property
    def maximum_discharge(self):
        return self.area * self.maximum_velocity

    @property
    def area(self):
        return 0.25 * math.pi * self.inner_diameter**2


@dataclass(frozen=True)
class GasPipeClass:
    """
    This class defines a certain pipe. The optimization can select different pipe classes for each
    pipe, depending on the available pipe classes.
    - name: Name of the pipe class e.g. DN200-S1
    - maximum_velocity: Maximum velocity magnitude in the pipe in m/s.
    - investment_costs: Cost for the pipe in euro/meter
    """

    name: str
    inner_diameter: float
    maximum_velocity: float
    investment_costs: float

    @property
    def maximum_discharge(self):
        return self.area * self.maximum_velocity

    @property
    def area(self):
        return 0.25 * math.pi * self.inner_diameter**2


@dataclass(frozen=True)
class CableClass:
    """
    This class defines a certain electricity cable. The optimization can select different cable
    classes for each  cable, depending on the available cable classes.
    - name: Name of the cable class
    - maximum_current: Maximum current magnitude in the pipe in A.
    - investment_costs: Cost for the pipe in euro/meter
    """

    name: str
    maximum_current: float
    resistance: float
    investment_costs: float

    @property
    def maximum_discharge(self):
        return self.area * self.maximum_velocity
