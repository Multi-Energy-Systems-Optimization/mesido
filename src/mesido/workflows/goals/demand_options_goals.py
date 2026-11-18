import logging

import casadi as ca

import numpy as np

from rtctools.optimization.single_pass_goal_programming_mixin import Goal

logger = logging.getLogger("mesido")
logger.setLevel(logging.INFO)


class TargetDemandAlternativesGoal(Goal):
    priority = 1
    order = 2

    target_min = 0.0
    target_max = 0.0

    def __init__(self, state, profiles, profile_bools):
        self.state = state
        self.profiles = profiles
        self.profile_bools = profile_bools

        max_profile = max(
            np.max(np.abs(profile.values))
            for profile in profiles
        )
        self.function_range = (-max_profile, max_profile)
        self.function_nominal = max(max_profile, 1.0)

    def function(self, optimization_problem, ensemble_member) -> ca.MX:
        y = optimization_problem.state(self.state)

        selected_target = 0.0
            
        for profile, selector_name in zip(self.profiles, self.profile_bools):
            is_insulation_active_var = optimization_problem.state(selector_name)
            selected_target += ca.times(
                ca.DM(profile.values),
                is_insulation_active_var,
            )

        # y - x_t*b_t
        return y - selected_target 