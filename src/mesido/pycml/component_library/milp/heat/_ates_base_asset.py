from mesido.pycml import Variable
from mesido.pycml.component_library.milp.heat._storage_component import _StorageComponent
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class _ATESBaseAsset(_StorageComponent):
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

        self.component_type = "ates"

        self.T_amb = 10

        self.heat_loss_coeff = 0.005 / (24.0 * 3600.0)
        self.single_doublet_power = nan
        self.nr_of_doublets = 1.0
        # The hot/cold tank can have a lower bound on its volume.
        # Meaning that they might always be, for e.g., 5% full.
        self.min_fraction_tank_volume = 0.05

        # Stored_heat is the heat that is contained in the ates.
        # Heat_ates is the amount of heat added to or extracted from the buffer
        # per timestep.
        # Thus Heat_buffer = HeatHot = der(Stored_heat).
        # We connect an ATES as an demand, meaning that flow and Heat_ates are positive under
        # charging and negative under discharge
        self.add_variable(Variable, "Heat_ates", nominal=self.Heat_nominal)  # [W]

        # Assume the storage fills in about 3 months at typical rate
        self._typical_fill_time = 3600.0 * 24.0 * 90.0
        self._nominal_stored_heat = self.Heat_nominal * self._typical_fill_time
        self.add_variable(
            Variable,
            "Stored_heat",
            min=0.0,
            nominal=self._nominal_stored_heat,
        )
        self.add_variable(
            Variable,
            "Stored_volume",
            min=0.0,
            nominal=self._typical_fill_time * self.Q_nominal,
        )


        self._heat_loss_error_to_state_factor = 1
        self._nominal_heat_loss = (
            self.Stored_heat.nominal * self.heat_loss_coeff * self._heat_loss_error_to_state_factor
        )
        self.add_variable(Variable, "Heat_loss", min=0.0, nominal=self._nominal_heat_loss)

        self._heat_loss_eq_nominal_ates = (self.Heat_nominal * self._nominal_heat_loss) ** 0.5

        # # Heat stored in the ates
        self.add_equation(
            (self.der(self.Stored_heat) - self.Heat_flow + self.Heat_loss)
            / self._heat_loss_eq_nominal_ates
        )
        self.add_equation((self.der(self.Stored_volume) - self.Q) / self.Q_nominal)

        self.add_equation((self.Heat_flow - self.Heat_ates) / self.Heat_nominal)
