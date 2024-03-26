from dataclasses import dataclass


@dataclass(frozen=True)
class DemandInsulationClass:
    """
    This class defines the properties for an insulation level/standard. The optimizer can
    select out of a list of insulation levels for each demand. There is a cost associated to
    changing a demand from its existing insulation level to another insulation level. Once the
    insulation is installed it will affect the demand profile and thus the amount of energy that is
    consumed. It will also affect the required temperature at the demand which can have an impact
    on the feasible network temperature selected. For these reasons this class consists out of the
    following variables:
    - name_insulation_level: Defines the name of the insulation level
    - name_demand: Demand asset to which the insulation level can apply
    - minimum_temperature_deg: Is the minimum temperature needed at the demand in unit deg.
    - demand_scaling_factor: A scalar that is used to re-scale the demand to represent the demand
    at that insulation level
    - investment_cost_euro: Is the amount of cost associated with reaching this insulation level.
    """

    name_insulation_level: str
    name_demand: str
    minimum_temperature_deg: float
    demand_scaling_factor: float  # value between 0.0 and 1.0
    investment_cost_euro: float
