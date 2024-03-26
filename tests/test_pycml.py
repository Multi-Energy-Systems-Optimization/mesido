from unittest import TestCase

from mesido.pycml import Model, Variable

import numpy as np


class TestPyCML(TestCase):
    def test_merge_modifiers_function(self):
        """
        Check that the modifiers are merged correctly by the merge modifiers method, meaning
        that the limiting bounds are selected out of the two dicts that are merged.
        """
        x = dict(V=10.0, OutPort=dict(Q=dict(min=0, nominal=1.0)))
        y = dict(OutPort=dict(Q=dict(min=0.5)))

        normal_merge = {**x, **y}
        self.assertEqual(normal_merge, dict(V=10.0, OutPort=dict(Q=dict(min=0.5))))

        recursive_merge = Model.merge_modifiers(x, y)

        self.assertEqual(recursive_merge, dict(V=10.0, OutPort=dict(Q=dict(min=0.5, nominal=1.0))))

    def test_merge_modifiers_models(self):
        """
        Check when models are constructed that the correct limiting modifiers are imposed as the
        bounds for the problem. This is done by creating a model where the connected assets both
        have modifiers on a variable, for example on Q.
        """

        class Port(Model):
            def __init__(self, name, **modifiers):
                super().__init__(name, **modifiers)

                self.add_variable(Variable, "Q", min=1.0, nominal=2.0, max=3.0)

        class TwoPort(Model):
            def __init__(self, name, **modifiers):
                super().__init__(name, **modifiers)

                self.add_variable(Port, "InPort", Q=dict(min=1.5))
                self.add_variable(Port, "OutPort", Q=dict(min=0.5, max=2.5))

        class Storage(TwoPort):
            def __init__(self, name, **modifiers):
                super().__init__(name, **modifiers)

                self.add_variable(Variable, "V", min=0.0)

        class A(Model):
            """
            No additional modifiers
            """

            def __init__(self):
                super().__init__(None)

                self.add_variable(Storage, "storage")

        class B(Model):
            """
            Additional modifiers on all variables
            """

            def __init__(self):
                super().__init__(None)

                self.add_variable(
                    Storage, "storage", V=dict(min=10.0), OutPort=dict(Q=dict(nominal=1.5, max=4.0))
                )

        # We testing/comparing with min, max and nominals
        def _var_min_max_nominal(v):
            return dict(min=v.min, nominal=v.nominal, max=v.max)

        a = A()
        a_flat = a.flatten()

        self.assertEqual(
            _var_min_max_nominal(a_flat.variables["storage.InPort.Q"]),
            dict(min=1.5, nominal=2.0, max=3.0),
        )
        self.assertEqual(
            _var_min_max_nominal(a_flat.variables["storage.OutPort.Q"]),
            dict(min=0.5, nominal=2.0, max=2.5),
        )
        self.assertEqual(
            _var_min_max_nominal(a_flat.variables["storage.V"]),
            dict(min=0.0, nominal=0, max=np.inf),
        )

        b = B()
        b_flat = b.flatten()

        self.assertEqual(
            _var_min_max_nominal(b_flat.variables["storage.InPort.Q"]),
            dict(min=1.5, nominal=2.0, max=3.0),
        )
        self.assertEqual(
            _var_min_max_nominal(b_flat.variables["storage.OutPort.Q"]),
            dict(min=0.5, nominal=1.5, max=4.0),
        )
        self.assertEqual(
            _var_min_max_nominal(b_flat.variables["storage.V"]),
            dict(min=10.0, nominal=0, max=np.inf),
        )
