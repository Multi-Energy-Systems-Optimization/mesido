import os
import time

import casadi as ca

from mesido.esdl.esdl_additional_vars_mixin import ESDLAdditionalVarsMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.io.write_output import ScenarioOutput

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin_base import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import SinglePassGoalProgrammingMixin
from rtctools.util import run_optimization_problem


class MaxRevenue(Goal):

    priority = 1

    order = 1

    def __init__(self, asset_name: str):
        """
        The constructor of the goal.

        Parameters
        ----------
        source : string of the source name that is going to be minimized
        """

        self.asset_name = asset_name

    def function(
        self, optimization_problem: CollocatedIntegratedOptimizationProblem, ensemble_member: int
    ) -> ca.MX:
        """
        This function returns the state variable to be minimized.

        Parameters
        ----------
        optimization_problem : The optimization class containing the variables'.
        ensemble_member : the ensemble member.

        Returns
        -------
        The negative revenue var of the optimization problem.
        """
        return -optimization_problem.extra_variable(f"{self.asset_name}__revenue", ensemble_member)


class MinCost(Goal):

    priority = 1

    order = 1

    def __init__(self, asset_name: str):
        # self.target_max = 0.0
        # self.function_range = (0.0, 1.0e9)
        # self.function_nominal = 1.0e7

        self.asset_name = asset_name

    def function(
        self, optimization_problem: CollocatedIntegratedOptimizationProblem, ensemble_member: int
    ) -> ca.MX:

        return optimization_problem.extra_variable(
            f"{self.asset_name}__fixed_operational_cost", ensemble_member
        ) + optimization_problem.extra_variable(
            f"{self.asset_name}__variable_operational_cost", ensemble_member
        )


class EmergeWorkFlow(
    ScenarioOutput,
    ESDLAdditionalVarsMixin,
    TechnoEconomicMixin,
    LinearizedOrderGoalProgrammingMixin,
    SinglePassGoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    This problem class is for the absolute heat tests. Meaning that this problem class
    is applied to an esdl where there is no dedicated supply or return line. For this test case
    we just match heating demand (_GoalsAndOptions) and minimize the energy production to have a
    representative result.
    """

    # TODO: this workflow is still work in progress and this part of code still needs to be
    #  finalised

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

        self.gas_network_settings["head_loss_option"] = HeadLossOption.NO_HEADLOSS

    def goals(self):

        goals = super().goals().copy()

        for asset_name in [
            *self.energy_system_components.get("electricity_demand", []),
            *self.energy_system_components.get("gas_demand", []),
        ]:
            goals.append(MaxRevenue(asset_name))
            goals.append(MinCost(asset_name))

        for asset_name in [
            *self.energy_system_components.get("electricity_source", []),
            *self.energy_system_components.get("gas_tank_storage", []),
            *self.energy_system_components.get("electricity_storage", []),
            *self.energy_system_components.get("electrolyzer", []),
            *self.energy_system_components.get("heat_pump_elec", []),
        ]:
            goals.append(MinCost(asset_name))

        return goals

    def constraints(self, ensemble_member):
        constraints = super().constraints(ensemble_member)

        for gs in self.energy_system_components.get("gas_tank_storage", []):
            canonical, sign = self.alias_relation.canonical_signed(f"{gs}.Stored_gas_mass")
            storage_t0 = sign * self.state_vector(canonical, ensemble_member)[0]
            constraints.append((storage_t0, 0.0, 0.0))
            canonical, sign = self.alias_relation.canonical_signed(f"{gs}.Gas_tank_flow")
            gas_flow_t0 = sign * self.state_vector(canonical, ensemble_member)[0]
            constraints.append((gas_flow_t0, 0.0, 0.0))

        for es in self.energy_system_components.get("electricity_storage", []):
            canonical, sign = self.alias_relation.canonical_signed(f"{es}.Stored_electricity")
            storage_t0 = sign * self.state_vector(canonical, ensemble_member)[0]
            constraints.append((storage_t0, 0.0, 0.0))

        return constraints

    def solver_options(self):
        """
        This function does not add anything at the moment but during debugging we use this.

        Returns
        -------
        solver options dict
        """
        options = super().solver_options()
        options["solver"] = "highs"
        highs_options = options["highs"] = {}
        highs_options["presolve"] = "off"

        return options

    def times(self, variable=None):
        return super().times(variable)[:25]

    def energy_system_options(self):
        """
        This function does not add anything at the moment but during debugging we use this.

        Returns
        -------
        Options dict for the physics modelling
        """
        options = super().energy_system_options()
        options["minimum_velocity"] = 0.0
        options["heat_loss_disconnected_pipe"] = False
        options["neglect_pipe_heat_losses"] = False
        options["include_asset_is_switched_on"] = True
        options["include_electric_cable_power_loss"] = False
        return options

    def post(self):
        # In case the solver fails, we do not get in priority_completed(). We
        # append this last priority's statistics here in post().
        # TODO: check if we still need this small part of code below
        success, _ = self.solver_success(self.solver_stats, False)
        # if not success:
        #     time_taken = time.time() - self.__priority_timer
        #     self._priorities_output.append(
        #         (
        #             self.__priority,
        #             time_taken,
        #             False,
        #             self.objective_value,
        #             self.solver_stats,
        #         )
        #     )

        super().post()

        # Optimized ESDL
        self._write_updated_esdl(
            self._ESDLMixin__energy_system_handler.energy_system, add_kpis=False
        )

        self._save_json = False

        results = self.extract_results()

        if os.path.exists(self.output_folder) and self._save_json:
            parameters = self.parameters(0)
            bounds = self.bounds()
            aliases = self.alias_relation._canonical_variables_map
            solver_stats = self.solver_stats
            self._write_json_output(results, parameters, bounds, aliases, solver_stats)

        for _type, assets in self.energy_system_components.items():
            for asset in assets:
                print("----------------------------------")
                print(f"{asset} financials:")
                try:
                    print(f"revenue of {asset} in MEUR/day: ", results[f"{asset}__revenue"] / 1e6)
                except KeyError:
                    print(f"{asset} does not have a revenue")
                    pass
                try:
                    print(
                        f"fixed operational costs of {asset} in MEUR/yr : ",
                        results[f"{asset}__fixed_operational_cost"] / 1e6,
                    )
                    print(
                        f"variable operational costs of {asset} : ",
                        results[f"{asset}__variable_operational_cost"] / 1e6,
                    )  # not yet all included in financialmixin
                    print(f"max size of {asset} : ", results[f"{asset}__max_size"])
                except KeyError:
                    print(f"{asset} does not have a costs")
                    pass


if __name__ == "__main__":

    tic = time.time()
    elect = run_optimization_problem(
        EmergeWorkFlow,
        esdl_file_name="emerge_solar_battery.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="timeseries_with_PV.csv",
    )
    print(time.time() - tic)
    results = elect.extract_results()
    a = 1
