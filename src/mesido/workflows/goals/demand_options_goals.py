import logging

import casadi as ca

import numpy as np

from rtctools.optimization.single_pass_goal_programming_mixin import Goal

from mesido.pycml.component_library.milp.heat import heat_demand

logger = logging.getLogger("mesido")
logger.setLevel(logging.INFO)


class TargetDemandAlternativesGlobalGoal(Goal):
    """Match demand using horizon-wide selectors and registered alternative profile inputs.

    Pass selector names from the demand's global insulation class map as profile_bools.
    Register each profile in constant_inputs under
    ``<selector_name>__alternative_target_profile`` before transcription.
    """

    priority = 1
    order = 2

    target_min = 0.0
    target_max = 0.0

    def __init__(self, state, profiles, profile_bools):
        self.state = state
        self.profiles = profiles
        self.profile_bools = profile_bools

        max_profile = max(np.max(np.abs(profile.values)) for profile in profiles)
        self.function_range = (-1.0e6, max(2.0 * max_profile, 1.0e6))
        self.function_nominal = max(max_profile, 1.0e6)

    def function(self, optimization_problem, ensemble_member) -> ca.MX:
        demand = optimization_problem.state(self.state)
        selected_target = 0.0

        for selector_name in self.profile_bools:
            alternative_target_profile = optimization_problem.variable(
                f"{selector_name}__alternative_target_profile"
            )
            global_profile_selector = optimization_problem.variable(selector_name)
            selected_target += alternative_target_profile * global_profile_selector

        return demand - selected_target