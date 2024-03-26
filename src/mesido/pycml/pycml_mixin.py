import itertools
import logging
from abc import abstractmethod
from typing import Dict, Union

import casadi as ca

import pymoca
from pymoca.backends.casadi.model import Model as _Model

from rtctools._internal.alias_tools import AliasDict
from rtctools._internal.caching import cached
from rtctools.optimization.optimization_problem import OptimizationProblem

from . import ConstantInput, ControlInput, Model, SymbolicParameter, Variable


logger = logging.getLogger("mesido")


class PyCMLMixin(OptimizationProblem):
    def __init__(self, *args, **kwargs):
        logger.debug("Using pymoca {}.".format(pymoca.__version__))

        pycml_model = self.pycml_model()

        self.__flattened_model = pycml_model.flatten()

        self.__pymoca_model = _Model()
        for v in self.__flattened_model.variables.values():
            if isinstance(v, SymbolicParameter):
                self.__pymoca_model.parameters.append(v)
            elif isinstance(v, (ControlInput, ConstantInput)):
                self.__pymoca_model.inputs.append(v)
            elif isinstance(v, Variable) and v.has_derivative:
                self.__pymoca_model.states.append(v)
                self.__pymoca_model.der_states.append(v.der())
            else:
                self.__pymoca_model.alg_states.append(v)

        self.__pymoca_model.equations = self.__flattened_model.equations
        self.__pymoca_model.initial_equations = self.__flattened_model.initial_equations
        self.__pymoca_model.simplify(self.compiler_options())

        if (
            len(self.__flattened_model.inequalities) > 0
            or len(self.__flattened_model.initial_inequalities) > 0
        ):
            raise NotImplementedError("Inequalities are not supported yet")

        # Note that we do not pass the numeric parameters to the Pymoca model
        # in their entirety. That way we can avoid making useless Variable
        # instances, as the parameters do not appear in any equations anyway.
        self.__parameters = {
            k: v
            for k, v in self.__flattened_model.numeric_parameters.items()
            if not isinstance(v, str)
        }
        self.__string_parameters = {
            k: v for k, v in self.__flattened_model.numeric_parameters.items() if isinstance(v, str)
        }

        # Extract the CasADi MX variables used in the model
        self.__mx = {}
        self.__mx["time"] = [self.__pymoca_model.time]
        self.__mx["states"] = [v.symbol for v in self.__pymoca_model.states]
        self.__mx["derivatives"] = [v.symbol for v in self.__pymoca_model.der_states]
        self.__mx["algebraics"] = [v.symbol for v in self.__pymoca_model.alg_states]
        self.__mx["parameters"] = [v.symbol for v in self.__pymoca_model.parameters]
        self.__mx["string_parameters"] = [
            v.name
            for v in (*self.__pymoca_model.string_parameters, *self.__pymoca_model.string_constants)
        ]
        self.__mx["control_inputs"] = []
        self.__mx["constant_inputs"] = []
        self.__mx["lookup_tables"] = []

        for v in self.__pymoca_model.inputs:
            if v.symbol.name() in self.__pymoca_model.delay_states:
                raise NotImplementedError("Delays are not supported yet")
            else:
                if v.symbol.name() in kwargs.get("lookup_tables", []):
                    raise NotImplementedError()
                elif v.fixed:
                    self.__mx["constant_inputs"].append(v.symbol)
                else:
                    self.__mx["control_inputs"].append(v.symbol)

        # Initialize nominals and types
        # These are not in @cached dictionary properties for backwards compatibility.
        self.__python_types = AliasDict(self.alias_relation)
        for v in itertools.chain(
            self.__pymoca_model.states, self.__pymoca_model.alg_states, self.__pymoca_model.inputs
        ):
            self.__python_types[v.symbol.name()] = v.python_type

        # Initialize dae, initial residuals, as well as delay arguments
        # These are not in @cached dictionary properties so that we need to create the list
        # of function arguments only once.
        variable_lists = ["states", "der_states", "alg_states", "inputs", "constants", "parameters"]
        function_arguments = [self.__pymoca_model.time] + [
            ca.veccat(*[v.symbol for v in getattr(self.__pymoca_model, variable_list)])
            for variable_list in variable_lists
        ]

        self.__dae_residual = self.__pymoca_model.dae_residual_function(*function_arguments)
        if self.__dae_residual is None:
            self.__dae_residual = ca.MX()

        self.__initial_residual = self.__pymoca_model.initial_residual_function(*function_arguments)
        if self.__initial_residual is None:
            self.__initial_residual = ca.MX()

        super().__init__(*args, **kwargs)

    @cached
    def compiler_options(self) -> Dict[str, Union[str, bool]]:
        """
        Subclasses can configure the `pymoca <http://github.com/pymoca/pymoca>`_
        compiler options here.

        :returns: A dictionary of pymoca compiler options. See the pymoca documentation
                  for details.
        """
        compiler_options = {}
        compiler_options["detect_aliases"] = True
        compiler_options["replace_parameter_expressions"] = True
        compiler_options["allow_derivative_aliases"] = False
        return compiler_options

    @property
    def dae_residual(self):
        return self.__dae_residual

    @property
    def dae_variables(self):
        return self.__mx

    @property
    def output_variables(self):
        output_variables = super().output_variables.copy()
        output_variables.extend([ca.MX.sym(variable) for variable in self.__pymoca_model.outputs])
        output_variables.extend(self.__mx["control_inputs"])
        return output_variables

    def parameters(self, ensemble_member):
        parameters = super().parameters(ensemble_member)
        parameters.update(self.__parameters)
        parameters.update({v.name: v.value for v in self.__pymoca_model.parameters})
        return parameters

    def string_parameters(self, ensemble_member):
        parameters = super().string_parameters(ensemble_member)
        parameters.update(self.__string_parameters)
        parameters.update({v.name: v.value for v in self.__pymoca_model.string_parameters})
        parameters.update({v.name: v.value for v in self.__pymoca_model.string_constants})
        return parameters

    @property
    def initial_residual(self):
        return self.__initial_residual

    def bounds(self):
        bounds = super().bounds()

        for v in itertools.chain(
            self.__pymoca_model.states, self.__pymoca_model.alg_states, self.__pymoca_model.inputs
        ):
            sym_name = v.symbol.name()

            try:
                bounds[sym_name] = self.merge_bounds(bounds[sym_name], (v.min, v.max))
            except KeyError:
                if self.__python_types.get(sym_name, float) == bool:
                    bounds[sym_name] = (max(0, v.min), min(1, v.max))
                else:
                    bounds[sym_name] = (v.min, v.max)

        return bounds

    def variable_is_discrete(self, variable):
        return self.__python_types.get(variable, float) != float

    @property
    def alias_relation(self):
        return self.__pymoca_model.alias_relation

    def variable_nominal(self, variable):
        try:
            return self.__nominals[variable]
        except AttributeError:
            self.__nominals = AliasDict(self.alias_relation)

            # Iterate over nominalizable states
            for v in itertools.chain(
                self.__pymoca_model.states,
                self.__pymoca_model.alg_states,
                self.__pymoca_model.inputs,
            ):
                sym_name = v.symbol.name()
                nominal = v.nominal
                if nominal == 0.0:
                    nominal = 1.0
                self.__nominals[sym_name] = nominal

            return self.variable_nominal(variable)
        except KeyError:
            return super().variable_nominal(variable)

    @abstractmethod
    def pycml_model(self) -> Model:
        raise NotImplementedError
