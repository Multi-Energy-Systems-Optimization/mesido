from typing import Dict, List, Tuple, Union

import casadi as ca

import numpy as np

from pymoca.backends.casadi.model import Variable as _Variable


MATHEMATICAL_OPERATORS = [
    "__add__",
    "__radd__",
    "__sub__",
    "__rsub__",
    "__mul__",
    "__rmul__",
    "__floordiv__",
    "__truediv__",
    "__mod__",
    "__pow__",
    "__lshift__",
    "__rshift__",
    "__and__",
    "__xor__",
    "__or__",
    "__iadd__",
    "__isub__",
    "__imul__",
    "__idiv__",
    "__ifloordiv__",
    "__imod__",
    "__ipow__",
    "__ilshift__",
    "__irshift__",
    "__iand__",
    "__ixor__",
    "__ior__",
    "__neg__",
    "__pos__",
    "__abs__",
    "__invert__",
    "__complex__",
    "__int__",
    "__long__",
    "__float__",
    "__oct__",
    "__hex__",
    "__lt__",
    "__le__",
    "__eq__",
    "__ne__",
    "__ge__",
    "__gt__",
]


class BaseVariable(_Variable):
    _attr_set = {"value", "start", "min", "max", "nominal", "fixed"}

    def __new__(cls, *args, **kwargs):
        if not hasattr(cls, MATHEMATICAL_OPERATORS[0]):
            for attr in MATHEMATICAL_OPERATORS:

                def _f(self, *args, attr=attr, **kwargs):
                    return getattr(self.symbol, attr)(*args, **kwargs)

                setattr(cls, attr, _f)

        return super().__new__(cls)

    def __init__(self, name, dimensions=None, **kwargs):
        update_attrs = {}

        for k, v in kwargs.items():
            if k in Variable._attr_set:
                if "k" == "start":
                    raise NotImplementedError("Setting 'start' attribute is not supported yet")
                update_attrs[k] = v

        for k in update_attrs:
            kwargs.pop(k)

        if dimensions is None:
            dimensions = []

        super().__init__(ca.MX.sym(name, *dimensions), **kwargs)

        for k, v in update_attrs.items():
            setattr(self, k, v)

    def __MX__(self):  # noqa: N802
        return self.symbol

    def __getitem__(self, key):
        return self.symbol.__getitem__(key)


class Variable(BaseVariable):
    def der(self):
        try:
            return self._derivative
        except AttributeError:
            self._derivative = Variable(f"der({self.symbol.name()})")
            return self._derivative

    @property
    def has_derivative(self):
        return hasattr(self, "_derivative")


class ControlInput(BaseVariable):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fixed = False


class ConstantInput(BaseVariable):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fixed = True


class SymbolicParameter(BaseVariable):
    def __init__(self, name, *args, **kwargs):
        if args and "value" not in kwargs:
            kwargs["value"] = args[0]
        super().__init__(name, *args, **kwargs)

    @property
    def name(self):
        return self.symbol.name()


class Array:
    def __init__(self, type_, var_name, dimensions, **modifiers):
        self._array = np.empty(dimensions, dtype=object)
        self._names = np.empty(dimensions, dtype=object)

        for index in np.ndindex(dimensions):
            str_suffix = "[{}]".format(",".join(str(x + 1) for x in index))
            self._array[index] = type_(f"{var_name}{str_suffix}", **modifiers)
            self._names[index] = str_suffix

    def __getitem__(self, key):
        if isinstance(key, int):
            return self._array[key - 1]
        else:
            return self._array[tuple(x - 1 for x in key)]


class Model:
    _modifiers = {}
    _variables: Dict[str, Union[Array, BaseVariable, "Model"]] = {}
    _numeric_parameters: Dict[str, Union[float, int, bool, str]] = {}
    _derivatives: Dict[str, Variable] = {}
    _equations: List[ca.MX] = []
    _initial_equations: List[ca.MX] = []
    _inequalities: List[Tuple[ca.MX, float, float]] = []
    _initial_inequalities: List[Tuple[ca.MX, float, float]] = []
    _skip_variables = None

    def __init__(self, name, **modifiers):
        # Note that this method should be such that it's allowed to be called
        # multiple times, e.g. when a (modifiable) parameter is passed as a
        # modifier to its super class.
        self._variables = {}
        self._numeric_parameters = {}
        self._derivatives = {}
        self._equations = []
        self._initial_equations = []

        self.name = name
        # Value assignment can be done directly, but we move it to the value attribute to
        # make sure that all modifiers are a dictionary
        for k, v in modifiers.items():
            if not isinstance(v, dict):
                modifiers[k] = dict(value=v)

        self._modifiers = modifiers

        self.__prefix = "" if name is None else f"{self.name}."

        if Model._skip_variables is None:
            Model._skip_variables = dir(self)

    def add_variable(self, type_, var_name, *dimensions, **kwargs):
        if var_name in self._variables:
            raise Exception(f"Variable with name '{var_name}' already exists")

        if var_name in self._modifiers:
            kwargs = self.merge_modifiers(kwargs, self._modifiers.pop(var_name))
            # Explicit conversion to MX for our wrapper classes
            for k, v in kwargs.items():
                if isinstance(v, BaseVariable):
                    kwargs[k] = ca.MX(v)

        if dimensions:
            var = self._variables[var_name] = Array(
                type_, f"{self.__prefix}{var_name}", dimensions, **kwargs
            )
        else:
            var = self._variables[var_name] = type_(f"{self.__prefix}{var_name}", **kwargs)

        if isinstance(var, (Variable, ControlInput, ConstantInput)) and (
            isinstance(var.value, (ca.MX, BaseVariable)) or not np.isnan(var.value)
        ):
            # For states and algebraic states, we move the "value" part to an equation
            self.add_equation(var - var.value)
            var.value = np.nan

    def add_equation(self, equation, lb=None, ub=None):
        if lb is None and ub is None:
            self._equations.append(equation)
        elif lb is not None and ub is not None and lb == ub:
            self._equations.append(equation - lb)
        else:
            self._inequalities.append((equation, lb, ub))

    def add_initial_equation(self, equation, lb=None, ub=None):
        if lb is None and ub is None:
            self._initial_equations.append(equation)
        elif lb is not None and ub is not None and lb == ub:
            self._initial_equations.append(equation - lb)
        else:
            self._initial_inequalities.append((equation, lb, ub))

    def connect(self, a: "Connector", b: "Connector"):
        """
        This function sets equality constraints to the variables of the two (connected) ports.

        Params:
        a: port 1
        b: port 2

        Return:
        None
        """
        if not a.variables.keys() == b.variables.keys():
            raise Exception(
                f"Cannot connect port {a} of type {type(a)} to port {b} "
                f"of type {type(b)} as they have different variables."
            )

        self._equations.extend([a.variables[k] - b.variables[k] for k in a.variables.keys()])

    def connect_logical_links(self, a: "Connector", b: "Connector"):
        """
        This function sets equality constraints to the variables of the two (connected) ports. Note
        that this function is used for logical links, meaning that we only use this function for
        models where the user defined direct connection between assets without the use of
        "transport" assets in between. For that purpose we do not make equality constraints for
        head, voltage and hydrualic power as these are inherent for the transport modelling.

        Params:
        a: port 1
        b: port 2

        Return:
        None
        """
        if not a.variables.keys() == b.variables.keys():
            raise Exception(
                f"Cannot connect port {a} of type {type(a)} to port {b} "
                f"of type {type(b)} as they have different variables."
            )

        self._equations.extend(
            [
                a.variables[k] - b.variables[k]
                for k in a.variables.keys()
                if (k != "H" and k != "Hydraulic_power" and k != "V")
            ]
        )

    def der(self, var: Variable):
        return var.der()

    @property
    def variables(self):
        return self._variables.copy()

    @property
    def numeric_parameters(self):
        return self._numeric_parameters.copy()

    @property
    def equations(self):
        return self._equations.copy()

    @property
    def initial_equations(self):
        return self._initial_equations.copy()

    @property
    def inequalities(self):
        return self._inequalities.copy()

    @property
    def initial_inequalities(self):
        return self._initial_inequalities.copy()

    @staticmethod
    def merge_modifiers(a: dict, b: dict):
        """
        Recursive (not in place) merge of dictionaries.

        :param a: Base dictionary to merge.
        :param b: Dictionary to merge on top of base dictionary.
        :return: Merged dictionary
        """
        b = b.copy()

        for k, v in a.items():
            if isinstance(v, dict):
                b_node = b.setdefault(k, {})
                b[k] = Model.merge_modifiers(v, b_node)
            else:
                if k not in b:
                    b[k] = v

        return b

    def __MX__(self):  # noqa: N802
        return self.symbol

    def __getattr__(self, attr):
        try:
            return self._variables[attr]
        except KeyError:
            pass

        try:
            return self._numeric_parameters[attr]
        except KeyError:
            raise AttributeError(f"Attribute '{attr}' not found")

    def __setattr__(self, key, value):
        if self._skip_variables is None or key in self._skip_variables:
            super().__setattr__(key, value)
        else:
            try:
                value = self._modifiers.pop(key)["value"]
            except KeyError:
                pass
            self._numeric_parameters[key] = value

    def __repr__(self):
        return self.name

    def __str__(self):
        return self.name

    def flatten(self):
        if self._modifiers:
            raise Exception("Cannot flatten a model with remaining modifiers")

        m = FlattenedModel()

        all_variables = {}
        all_parameters = {}

        all_equations = []
        all_initial_equations = []

        all_inequalities = []
        all_initial_inequalities = []

        # First we expand arrays
        variables = {}
        for k, var in self._variables.items():
            if isinstance(var, Array):
                for el, suff in zip(var._array.ravel(), var._names.ravel()):
                    variables[f"{k}{suff}"] = el
            else:
                variables[k] = var

        # Move variables to flattened model
        for k, var in variables.items():
            if isinstance(var, Model):
                flatten_var = var.flatten()
                all_variables.update(flatten_var._variables)
                all_parameters.update(flatten_var._numeric_parameters)

                all_equations.extend(flatten_var._equations)
                all_initial_equations.extend(flatten_var._initial_equations)

                all_inequalities.extend(flatten_var._inequalities)
                all_initial_inequalities.extend(flatten_var._initial_inequalities)
            else:
                all_variables[f"{self.__prefix}{k}"] = var

        all_parameters.update(
            {f"{self.__prefix}{p}": v for p, v in self._numeric_parameters.items()}
        )
        all_equations.extend(self.equations)
        all_initial_equations.extend(self.initial_equations)

        all_inequalities.extend(self.inequalities)
        all_initial_inequalities.extend(self.initial_inequalities)

        m._variables = all_variables
        m._numeric_parameters = all_parameters

        m._equations = all_equations
        m._initial_equations = all_initial_equations

        m._inequalities = all_inequalities
        m._initial_inequalities = all_initial_inequalities

        return m


class FlattenedModel(Model):
    def __init__(self):
        super().__init__(None)


class Component(Model):
    pass


class Connector(Component):
    pass
