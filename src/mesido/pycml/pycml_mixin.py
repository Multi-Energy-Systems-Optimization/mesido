import ast
import inspect
import itertools
import logging
from abc import abstractmethod
from typing import Dict, List, Type, Union

import casadi as ca

import pymoca
from pymoca.backends.casadi.model import Model as _Model

from rtctools._internal.alias_tools import AliasDict
from rtctools._internal.caching import cached
from rtctools.optimization.optimization_problem import OptimizationProblem

from . import ConstantInput, ControlInput, Model, SymbolicParameter, Variable


logger = logging.getLogger("mesido")


DYNAMIC_NAME_CACHE = {}


def add_variables_documentation_automatically(class_: Type):
    """
    This function can be added as a decorator to asset classes. It will update the documentation
    of that class with the variables that are created in it and the classes from which it inherits,
    based on the self.add_variable() function. The string
    "{add_variable_names_for_documentation_here}" in the asset documentation is then replaced by
    a list of the variable names.

    Note: This decorator must be added to any class which may be referenced by `class_`.

    Note: This function will not work properly if 2 two port classes have the same name due to
    the use of `DYNAMIC_NAME_CACHE`.

    Args:
        class_: The asset class it is documenting

    Returns: updated documentation of the class.

    """

    def get_names_for_class(current_class_: Type) -> List[str]:
        """
        This function checks for the variables that are added using the add_variable function.
        Using the cache the variable names that are created by inheritance and port names,
        are tracked to recreate the full variable name.

        It will follow any classes up the inheritance tree and it will follow any Port classes
        recursively. The variable name of port classes are added to the variable path while classes
        up the inheritance tree only add their variable paths to the set of this class.

        Args:
            current_class_: The class which is currently checked

        Returns: List of variable names

        """
        dynamic_names = []
        for class__ in inspect.getmro(current_class_):
            if inspect.getmodule(class__).__name__ == "builtins":
                break
            ast_of_init: ast.Module = ast.parse(inspect.getsource(class__))
            for node in ast.walk(ast_of_init):
                # Look for any function calls that fit self.add_variable
                if (
                    isinstance(node, ast.Call)
                    and isinstance(node.func, ast.Attribute)
                    and isinstance(node.func.value, ast.Name)
                    and node.func.value.id == "self"
                    and node.func.attr == "add_variable"
                ):
                    # Now extract the first and second argument
                    # First argument decides if it is a port or variable name
                    # Second argument is the string name
                    if isinstance(node.args[0], ast.Name):
                        port_class_name = node.args[0].id
                        if port_class_name in [
                            "HeatPort",
                            "ElectricityPort",
                            "GasPort",
                            "Primary",
                            "Secondary",
                            "_NonStorageComponent",
                        ]:
                            # Follow the port and retrieve all variable names for that port
                            port_name = node.args[1].value

                            # We leverage Python's import structure here. If there is a reference
                            # to a class in another file, that file will already have imported
                            # the necessary class as well as run this function.
                            dynamic_names_of_port = DYNAMIC_NAME_CACHE[port_class_name]
                            for dynamic_name_of_port in dynamic_names_of_port:
                                dynamic_names.append(f"{port_name}.{dynamic_name_of_port}")
                        elif node.args[0].id == "Variable":
                            # This is a variable for this component, save its name.
                            dynamic_names.append(node.args[1].value)
                        else:
                            raise RuntimeError(f"Unknown case:\n{ast.dump(node)}")
                    else:
                        raise RuntimeError(f"Unknown case:\n{ast.dump(node)}")

        dynamic_names = sorted(dynamic_names)
        if current_class_.__name__ in DYNAMIC_NAME_CACHE:
            raise RuntimeError(
                f"Unsupported situation. Already generated documentation for "
                f"{current_class_.__name__} before. Possibly that 2 classes "
                f"(in different modules) have the same class name? This is not "
                f"supported by this function."
            )
        DYNAMIC_NAME_CACHE[current_class_.__name__] = dynamic_names
        return dynamic_names

    all_dynamic_names = get_names_for_class(class_)

    # Format the dynamic names properly
    formatted_dynamic_names = [
        f"* {{name}}.{dynamic_name}" for dynamic_name in sorted(all_dynamic_names)
    ]

    # Find the indent that should be used
    line_with_hook = next(
        (
            line
            for line in class_.__doc__.splitlines()
            if "{" "add_variable_names_for_documentation_here}" in line
        ),
        None,
    )
    if line_with_hook is None:
        indent = ""
    else:
        (indent, _) = line_with_hook.split("{add_variable_names_for_documentation_here}")

        # Insert the dynamic names into the documentation
        class_.__doc__ = class_.__doc__.replace(
            "{add_variable_names_for_documentation_here}",
            f"\n{indent}".join(formatted_dynamic_names),
        )
    return class_


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
