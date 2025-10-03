from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal.heat_component import BaseAsset
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from ._ates_base_asset import _ATESBaseAsset
from .heat_two_port import HeatTwoPort


@add_variables_documentation_automatically
class ATES(_ATESBaseAsset):
    """
    An Ates is a storage component that is used to model heat storage underground. Typically, this
    is done by storing hot water in an underground aquifier. We model this with an energy storage
    where the energy loss is modelled as a fraction of the Stored energy for each time-step.

    Like all storage assets we enforce that they must be connected as a demand. The heat to
    discharge constraints are set in the HeatPhysicsMixin, where we use a big_m formulation to
    enforce the correct constraints depending on whether the ates is charging or discharging.

    Please note that:
    The user is responsible to implement the cyclic behaviour in their workflow constraints.
    Meaning that the heat stored at the 1st and last time step should be equal. Furthermore, due
    to the implicit solving note that the energy out of the ATES should be 0 for the 1st time step.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        max_temp_change = self.T_supply / (3600 * 24)  # loses full temperature in a day
        nom_temp_change = max_temp_change / 100  # loses full temperature in 100 days.
        self.add_variable(Variable, "Temperature_ates", nominal=self.T_return)
        self.add_variable(
            Variable, "Temperature_loss", min=0, max=max_temp_change, nominal=nom_temp_change
        )
        self.add_variable(
            Variable,
            "Temperature_change_charging",
            min=0,
            max=max_temp_change,
            nominal=nom_temp_change,
        )

        self.add_equation(
            (
                (
                    self.der(self.Temperature_ates)
                    - self.Temperature_change_charging
                    + self.Temperature_loss
                )
                / nom_temp_change
            )
        )
