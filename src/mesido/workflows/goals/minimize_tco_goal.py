from typing import Any, Dict, Optional, Set

from casadi import MX

from mesido.techno_economic_mixin import TechnoEconomicMixin

from rtctools.optimization.goal_programming_mixin_base import Goal


class MinimizeTCO(Goal):
    """
    Minimize the Total Cost of Ownership (TCO) for a milp network.

    This goal aims to minimize the sum of operational, fixed operational,
    investment, and installation costs over a specified
    number of years.
    """

    order = 1

    def __init__(
        self,
        priority: int = 2,
        number_of_years: float = 25.0,
        custom_asset_type_maps: Optional[Dict[str, Set[str]]] = None,
    ):
        """
        Initialize the MinimizeTCO goal.

        Args:
            priority (int): The priority of this goal.
            number_of_years (float): The number of years over which to calculate the costs.
        """
        self.priority = priority
        self.number_of_years = number_of_years
        self.function_nominal = 1.0e6

        default_asset_type_maps = {
            "operational": {
                "heat_source",
                "ates",
                "heat_pump",
                "pump",
                "heat_exchanger",
                "heat_buffer",
                "gas_source",  # TODO still to add other costs for this asset_type
                "electricity_source",  # TODO still to add other costs for this asset_type
            },
            "fixed_operational": {
                "heat_source",
                "ates",
                "heat_buffer",
                "heat_pump",
                "heat_exchanger",
                "pump",
            },
            "investment": {
                "heat_source",
                "ates",
                "heat_buffer",
                "heat_demand",
                "heat_exchanger",
                "heat_pump",
                "heat_pipe",
                "pump",
            },
            "installation": {
                "heat_source",
                "ates",
                "heat_buffer",
                "heat_demand",
                "heat_exchanger",
                "heat_pump",
                "heat_pipe",
                "pump",
            },
            "annualized": {
                "heat_source",
                "ates",
                "heat_buffer",
                "heat_demand",
                "heat_exchanger",
                "heat_pump",
                "heat_pipe",
                "pump",
            },
        }

        self.asset_type_maps = (
            custom_asset_type_maps
            if custom_asset_type_maps is not None
            else default_asset_type_maps
        )

    def _calculate_cost(
        self,
        optimization_problem: TechnoEconomicMixin,
        cost_type,
        asset_types: Set[str],
        cost_type_map: Dict[str, float],
        options: Dict[str, Any],
    ) -> MX:
        """
        Calculate the cost for given asset types using a specified cost map.
        When `discounted_annualized_cost` option is True, the discounted annualized costs
        are computed in the objective function, and the techinical life of each asset
        is considered in the computation of the annualized _annualized_capex_var.
        If `discounted_annualized_cost` is not defined or False, the operational and
        fixed operational costs are multiplied by the number_of_years.

        Args:
            optimization_problem (TechnoEconomicMixin): The optimization problem instance.
            cost_type (str): The type of cost to calculate ("operational",
                            "fixed_operational", "investment", "installation")
            asset_types (Set[str]): Set of asset types to consider for cost calculation.
            cost_type_map (Dict[str, Any]): Mapping of assets to their respective costs.
            options (Dict[str, Any]): Options dictionary from energy_system_options

        Returns:
            MX object: CasADi expression with total cost for the given asset types.
        """
        obj = 0.0
        for asset_type in asset_types:
            for asset in optimization_problem.energy_system_components.get(asset_type, []):
                extra_var = optimization_problem.extra_variable(cost_type_map[asset])
                if options["discounted_annualized_cost"]:
                    # We only want the operational cost for a single year when we use
                    # annualized CAPEX.
                    obj += extra_var
                elif "operational" in cost_type:
                    obj += extra_var * self.number_of_years
                else:
                    # These are the CAPEX cost under non-annualized condition
                    obj += extra_var
        return obj

    def function(self, optimization_problem: TechnoEconomicMixin, ensemble_member) -> MX:
        """
        Calculate the objective function value for the optimization problem.

        This method sums up the various costs associated with the milp network assets.

        Args:
            optimization_problem (TechnoEconomicMixin): The optimization problem instance.
            ensemble_member: The current ensemble member being considered in the optimization.

        Returns:
            MX object: CasADi expression with the total cost objective function value.
        """

        options = optimization_problem.energy_system_options()

        cost_type_maps = {
            "operational": optimization_problem._asset_variable_operational_cost_map,
            "fixed_operational": optimization_problem._asset_fixed_operational_cost_map,
            "investment": optimization_problem._asset_investment_cost_map,
            "installation": optimization_problem._asset_installation_cost_map,
            "annualized": optimization_problem._annualized_capex_var_map,
        }

        if options["discounted_annualized_cost"]:
            cost_type_list = ["operational", "fixed_operational", "annualized"]
        else:
            cost_type_list = ["operational", "fixed_operational", "investment", "installation"]

        obj = 0.0
        for cost_type in cost_type_list:
            obj += self._calculate_cost(
                optimization_problem,
                cost_type,
                self.asset_type_maps[cost_type],
                cost_type_maps[cost_type],
                options,
            )

        return obj
