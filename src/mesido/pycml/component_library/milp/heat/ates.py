from mesido.pycml import Variable
from mesido.pycml.component_library.milp._internal.heat_component import BaseAsset
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .heat_two_port import HeatTwoPort


@add_variables_documentation_automatically
class ATES(HeatTwoPort, BaseAsset):
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

        self.Q_nominal = 1.0
        self.T_amb = 10
        self.T_supply = nan
        self.T_return = nan
        self.T_supply_id = -1
        self.T_return_id = -1
        self.dT = self.T_supply - self.T_return
        self.cp = 4200.0
        self.rho = 988.0
        self.Heat_nominal = self.cp * self.rho * self.dT * self.Q_nominal
        self.nominal_pressure = 16.0e5
        self.minimum_pressure_drop = 1.0e5  # 1 bar of pressure drop
        self.pump_efficiency = 0.5

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
        self.add_variable(Variable, "Heat_flow", nominal=self.Heat_nominal)  # [W]
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
        self.add_variable(Variable, "Q", nominal=self.Q_nominal)
        self.add_variable(
            Variable, "Pump_power", min=0.0, nominal=self.Q_nominal * self.nominal_pressure
        )

        self.add_variable(Variable, "dH")
        self.add_equation(self.dH - (self.HeatOut.H - self.HeatIn.H))

        self._heat_loss_error_to_state_factor = 1
        self._nominal_heat_loss = (
            self.Stored_heat.nominal * self.heat_loss_coeff * self._heat_loss_error_to_state_factor
        )
        self.add_variable(Variable, "Heat_loss", min=0.0, nominal=self._nominal_heat_loss)

        self._heat_loss_eq_nominal_ates = (self.Heat_nominal * self._nominal_heat_loss) ** 0.5

        self.add_equation(self.HeatIn.Q - self.HeatOut.Q)
        self.add_equation(self.Q - self.HeatOut.Q)

        # # Heat stored in the ates
        self.add_equation(
            (self.der(self.Stored_heat) - self.Heat_ates + self.Heat_loss)
            / self._heat_loss_eq_nominal_ates
        )
        self.add_equation((self.der(self.Stored_volume) - self.Q) / self.Q_nominal)

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

        self.add_equation(
            (self.HeatIn.Heat - (self.HeatOut.Heat + self.Heat_ates)) / self.Heat_nominal
        )
        self.add_equation((self.Heat_flow - self.Heat_ates) / self.Heat_nominal)
