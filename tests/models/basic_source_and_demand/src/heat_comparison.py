from mesido.component_type_mixin import ModelicaComponentTypeMixin
from mesido.esdl.esdl_mixin import ESDLMixin
from mesido.physics_mixin import PhysicsMixin
from mesido.pycml.pycml_mixin import PyCMLMixin

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile

from rtctools.optimization.collocated_integrated_optimization_problem import (
    CollocatedIntegratedOptimizationProblem,
)
from rtctools.optimization.csv_mixin import CSVMixin
from rtctools.optimization.goal_programming_mixin import Goal, GoalProgrammingMixin
from rtctools.optimization.modelica_mixin import ModelicaMixin
from rtctools.util import run_optimization_problem

if __name__ == "__main__":
    from model_heat import Model
else:
    from .model_heat import Model


class TargetDemandGoal(Goal):
    priority = 1

    order = 1

    def __init__(self, optimization_problem):
        self.target_min = optimization_problem.get_timeseries("demand.target_heat_demand")
        self.target_max = optimization_problem.get_timeseries("demand.target_heat_demand")
        self.function_range = (0.0, 2e5)
        self.function_nominal = 1e5

    def function(self, optimization_problem, ensemble_member):
        return optimization_problem.state("demand.Heat_demand")


class _GoalsAndOptions:
    def path_goals(self):
        goals = super().path_goals().copy()
        goals.append(TargetDemandGoal(self))
        return goals


class HeatModelica(
    _GoalsAndOptions,
    PhysicsMixin,
    ModelicaComponentTypeMixin,
    GoalProgrammingMixin,
    CSVMixin,
    ModelicaMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def solver_options(self):
        options = super().solver_options()
        options["solver"] = 'highs'
        # options["solver"] = 'cplex'
        # options["dump_to_file"] = True
        # options["dump_filename"] = "HeatModelica.lp"
        # options["dump_out"] = True
        # options["dump_in"] = True
        # options["dump_dir"] = "HeatModelica_dump_files"
        return options


class HeatPython(
    _GoalsAndOptions,
    PhysicsMixin,
    ModelicaComponentTypeMixin,
    GoalProgrammingMixin,
    CSVMixin,
    PyCMLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    """
    Problem using simple python model for a milp network with a source, pump, pipe and demand.
    """

    def __init__(self, *args, **kwargs):
        self.__model = Model()
        super().__init__(*args, **kwargs)

    def pycml_model(self):
        return self.__model

    def bounds(self):
        bounds = super().bounds()
        bounds["source.Heat_source"] = (75000.0, 125000.0)
        return bounds

    def solver_options(self):
        options = super().solver_options()
        # options["solver"] = 'highs'
        options["solver"] = 'cplex'
        options["dump_to_file"] = True
        options["dump_filename"] = "HeatPython_small.lp"
        # highs_options = options["highs"] = {}
        # highs_options["presolve"] = "off"
        # options["dump_to_file"] = True
        # options["dump_filename"] = "HeatPython.lp"
        return options

class HeatESDL(
    _GoalsAndOptions,
    PhysicsMixin,
    GoalProgrammingMixin,
    ESDLMixin,
    CollocatedIntegratedOptimizationProblem,
):
    def bounds(self):
        bounds = super().bounds()
        bounds["source.Heat_source"] = (75000.0, 125000.0)
        return bounds

    def solver_options(self):
        options = super().solver_options()
        # options["solver"] = 'highs'
        options["solver"] = 'cplex'
        options["dump_to_file"] = True
        options["dump_filename"] = "HeatESDL.lp"
        # options["dump_out"] = True
        # options["dump_in"] = True
        # options["dump_dir"] = "HeatESDL_dump_files"
        return options


if __name__ == "__main__":
    # a = run_optimization_problem(HeatModelica)
    b = run_optimization_problem(HeatPython)
    # c = run_optimization_problem(
    #     HeatESDL,
    #     esdl_file_name="model.esdl",
    #     esdl_parser=ESDLFileParser,
    #     profile_reader=ProfileReaderFromFile,
    #     input_timeseries_file="timeseries.csv",
    # )
    #print summary: feasible or infeasible
    # print("Modelica: ", a.solver_stats["success"])
    print("Python: ", b.solver_stats["success"])
    # print("ESDL: ", c.solver_stats["success"])

