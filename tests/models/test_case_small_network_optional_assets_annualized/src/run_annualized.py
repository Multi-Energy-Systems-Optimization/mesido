from typing import Any, Dict, List

import esdl

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.workflows.goals.minimize_tco_goal import MinimizeTCO

from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.util import run_optimization_problem

try:
    from models.test_case_small_network_optional_assets_annualized.src.run_ates import (
        HeatProblem,
    )
except ModuleNotFoundError:
    from run_ates import HeatProblem


class HeatProblemDiscAnnualizedCost(HeatProblem):
    def energy_system_options(self) -> Dict[str, Any]:
        options = super().energy_system_options()
        options["discounted_annualized_cost"] = True
        return options

    def goals(self) -> List[Goal]:
        goals = []

        custom_asset_type_maps = {
            "operational": {"heat_source"},
            "fixed_operational": {"heat_source"},
            "annualized": {"heat_source"},
        }
        goals.append(MinimizeTCO(priority=2, custom_asset_type_maps=custom_asset_type_maps))
        return goals

    def modify_discount_rate(self, assets):
        for asset in assets.values():
            if asset.asset_type == "HeatProducer":
                if "costInformation" in asset.attributes and (
                    asset.attributes["costInformation"].discountRate is not None
                    and asset.attributes["costInformation"].discountRate.value is not None
                ):
                    asset.attributes["costInformation"].discountRate.value = 0.0
                else:
                    asset.attributes["costInformation"].discountRate = esdl.SingleValue(value=0.0)
        return assets


class HeatProblemDiscAnnualizedCostModifiedParam(HeatProblemDiscAnnualizedCost):
    @property
    def esdl_assets(self):
        assets = super().esdl_assets
        for asset in assets.values():
            if asset.asset_type == "HeatProducer":
                asset.attributes["technicalLifetime"] = 1.0
        assets = self.modify_discount_rate(assets)
        return assets


class HeatProblemDiscAnnualizedCostModifiedDiscountRate(HeatProblemDiscAnnualizedCost):
    @property
    def esdl_assets(self):
        assets = super().esdl_assets
        assets = self.modify_discount_rate(assets)
        return assets


if __name__ == "__main__":
    solution = run_optimization_problem(
        HeatProblemDiscAnnualizedCostModifiedParam,
        esdl_file_name="annualized_test_case_discount5.esdl",
        esdl_parser=ESDLFileParser,
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="Warmte_test.csv",
    )
    results = solution.extract_results()
    print("\n HeatProblemAnnualized Completed \n \n")
