from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from ._ates_base_asset import _ATESBaseAsset


@add_variables_documentation_automatically
class LowTemperatureATES(_ATESBaseAsset):
    """
    TODO: This model is still under developement.
    A low temperature ates is a underground aquifier in which heat can be stored.

    Like all storage assets we enforce that they must be connected as a demand. The heat to
    discharge constraints are set in the HeatPhysicsMixin, where we use a big_m formulation to
    enforce the correct constraints depending on whether the ates is charging or discharging.

    Please note that:
    The user is responsible to implement the cyclic behaviour in their workflow constraints.
    Meaning that the milp stored at the 1st and last time step should be equal. Furthermore, due
    to the implicit solving note that the energy out of the ATES should be 0 for the 1st time step.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information..
    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "low_temperature_ates"

        # Stored_heat is the heat that is contained in the ates.
        # Heat_low_temperature_ates is the amount of heat added to or extracted from the buffer
        # per timestep.
        # Thus Heat_buffer = HeatHot = der(Stored_heat).
        # We connect an ATES as an demand, meaning that flow and Heat_low_temperature_ates are
        # positive undercharging and negative under discharge
        self.add_variable(Variable, "Heat_low_temperature_ates", nominal=self.Heat_nominal)  # [W]

        self.add_equation((self.Heat_ates - self.Heat_low_temperature_ates) / self.Heat_nominal)
