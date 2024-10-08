import logging
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.head_loss_class import HeadLossOption
from mesido.techno_economic_mixin import TechnoEconomicMixin
from mesido.workflows.goals.minimize_tco_goal import MinimizeTCO
from mesido.workflows.io.write_output import ScenarioOutput
from mesido.workflows.gas_elect_workflow import GasElectProblem

import numpy as np

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.goal_programming_mixin import Goal
from rtctools.optimization.linearized_order_goal_programming_mixin import (
    LinearizedOrderGoalProgrammingMixin,
)
from rtctools.optimization.single_pass_goal_programming_mixin import SinglePassGoalProgrammingMixin
from rtctools.util import run_optimization_problem


if __name__ == "__main__":
    import time

    start_time = time.time()
    solution = run_optimization_problem(
        GasElectProblem,
        esdl_parser=ESDLFileParser,
        esdl_file_name="Kapelle_gas_elec_efvc_.esdl",
        profile_reader=ProfileReaderFromFile,
        input_timeseries_file="gas_demand_nom_m3_s_efvc_.csv",
    )

    print("Execution time: " + time.strftime("%M:%S", time.gmtime(time.time() - start_time)))
