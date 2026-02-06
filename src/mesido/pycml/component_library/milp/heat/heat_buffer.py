import math

from mesido.pycml import Variable
from mesido.pycml.component_library.milp.heat._storage_component import _StorageComponent
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan


@add_variables_documentation_automatically
class HeatBufferModel(_StorageComponent):
    """
    The buffer component is to model milp storage in a tank. This means that we model a tank of hot
    water being filled and radiating milp away (heat loss) over the hot surfaces. We assume that the
    hot surfaces are those in contact with hot water.

    Like all storage assets we enforce that they must be connected as a demand. The heat to
    discharge constraints are set in the HeatPhysicsMixin, where we use a big_m formulation to
    enforce the correct constraints depending on whether the buffer is charging or discharging.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.

    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_type = "heat_buffer"

        self.heat_transfer_coeff = 1.0
        self.height = 5.0
        self.radius = 10.0
        self.volume = math.pi * self.radius**2 * self.height
        self.heat_loss_coeff = 2 * self.heat_transfer_coeff / (self.radius * self.rho * self.cp)
        # The hot/cold tank can have a lower bound on its volume.
        # Meaning that they might always be, for e.g., 5% full.
        self.min_fraction_tank_volume = 0.05
        self._typical_fill_time = 3600.0

        # Initial values
        self.init_V_hot_tank = nan
        self.init_Heat = nan

        # Minimum/maximum values
        self.min_stored_heat = (
            self.volume * self.min_fraction_tank_volume * self.dT * self.cp * self.rho
        )
        self.max_stored_heat = (
            self.volume * (1 - self.min_fraction_tank_volume) * self.dT * self.cp * self.rho
        )
        self._nominal_stored_heat = self.Heat_nominal * self._typical_fill_time

        # Stored_heat is the heat that is contained in the buffer.
        # Heat_buffer is the amount of heat added to or extracted from the buffer
        # per timestep.
        # HeatHot (resp. HeatCold) is the amount of heat added or extracted from
        # the hot (resp. cold) line.
        # As by construction the cold line should have zero heat, we fix HeatCold to zero.
        # Thus Heat_buffer = HeatHot = der(Stored_heat).
        # We connect a buffer as an demand, meaning that flow and Heat_buffer are positive under
        # charging and negative under discharge
        self.add_variable(Variable, "Heat_buffer", nominal=self.Heat_nominal)
        # Assume the storage fills in about an hour at typical rate
        self.add_variable(
            Variable,
            "Stored_heat",
            min=self.min_stored_heat,
            max=self.max_stored_heat,
            nominal=self._nominal_stored_heat,
        )
        # For nicer constraint coefficient scaling, we shift a bit more error into
        # the state vector entry of `Heat_loss`. In other words, with a factor of
        # 10.0, we aim for a state vector entry of ~0.1 (instead of 1.0)
        self._heat_loss_error_to_state_factor = 10.0
        self._nominal_heat_loss = (
            self._nominal_stored_heat * self.heat_loss_coeff * self._heat_loss_error_to_state_factor
        )

        self.add_variable(Variable, "Heat_loss", min=0.0, nominal=self._nominal_heat_loss)

        self._heat_loss_eq_nominal_buf = (self.Heat_nominal * self._nominal_heat_loss) ** 0.5

        # Heat stored in the buffer
        self.add_equation(
            (self.der(self.Stored_heat) - self.Heat_buffer + self.Heat_loss)
            / self._heat_loss_eq_nominal_buf
        )
        self.add_equation(
            (self.Heat_loss - self.Stored_heat * self.heat_loss_coeff) / self._nominal_heat_loss
        )


@add_variables_documentation_automatically
class HeatBuffer(HeatBufferModel):
    """
    The buffer component is to model milp storage in a tank. This means that we model a tank of hot
    water being filled and radiating milp away (heat loss) over the hot surfaces. We assume that the
    hot surfaces are those in contact with hot water.

    Like all storage assets we enforce that they must be connected as a demand. The heat to
    discharge constraints are set in the HeatPhysicsMixin, where we use a big_m formulation to
    enforce the correct constraints depending on whether the buffer is charging or discharging.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.

    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.add_equation((self.Heat_flow - self.Heat_buffer) / self.Heat_nominal)