from mesido.pycml import Variable

from numpy import nan, pi

from ._fluid_properties_component import _FluidPropertiesComponent
from ._non_storage_component import _NonStorageComponent


class Pipe(_NonStorageComponent, _FluidPropertiesComponent):
    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.temperature = nan

        super().__init__(
            name,
            **self.merge_modifiers(
                dict(
                    QTHIn=dict(T=dict(nominal=self.temperature)),
                    QTHOut=dict(T=dict(nominal=self.temperature)),
                ),
                modifiers,
            ),
        )

        self.component_type = "pipe"
        self.disconnectable = False
        self.has_control_valve = False

        self.length = 1.0
        self.diameter = 1.0
        assert "area" not in modifiers, "modifying area directly is not allowed"
        self.area = 0.25 * pi * self.diameter**2
        self.temperature = nan

        # Parameters determining the milp loss
        # All of these have default values in the library function
        self.insulation_thickness = nan
        self.conductivity_insulation = nan
        self.conductivity_subsoil = nan
        self.depth = nan
        self.h_surface = nan
        self.pipe_pair_distance = nan

        self.T_ground = 10.0

        self.add_variable(Variable, "dH")

        # Heat loss equation is added in the Python script to allow pipes to be disconnected.
        # It assumes constant ground temparature and constant dT at demand
        # positive negative dT depending on hot/cold pipe.
        # Roughly:
        #   cp * rho * Q * (Out.T - In.T)
        #   + length * (U_1-U_2) * avg_T
        #   - length * (U_1-U_2) * T_ground
        #   + length * U_2 * dT = 0.0
