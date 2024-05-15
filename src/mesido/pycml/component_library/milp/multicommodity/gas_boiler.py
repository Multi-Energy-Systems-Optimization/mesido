from mesido.pycml import Variable
from mesido.pycml.component_library.milp.gas.gas_base import GasPort
from mesido.pycml.component_library.milp.heat.heat_source import HeatSource

from numpy import nan


class GasBoiler(HeatSource):
    """
    The source component is there to insert thermal power (Heat) into the network.

    The heat to discharge constraints are set in the HeatMixin. We enforce that the outgoing
    temperature of the source matches the absolute thermal power, Q * cp * rho * T_sup == Heat,
    similar as with the demands. This allows us to guarantee that the flow can always carry, as
    the heat losses further downstream in the network are over-estimated with T_ret where in
    reality this temperature drops. It also implicitly assumes that the temperature drops in the
    network are small and thus satisfy minimum temperature requirements.
    """

    def __init__(self, name, **modifiers):
        super().__init__(
            name,
            **modifiers,
        )

        self.Q_nominal_gas = nan

        self.component_subtype = "gas_boiler"

        self.internal_energy = nan
        self.density = 2.5e3  # H2 density [g/m3] at 30bar

        self.id_mapping_carrier = -1

        # Assumption: heat in/out and added is nonnegative
        # Heat in the return (i.e. cold) line is zero
        self.add_variable(GasPort, "GasIn")
        self.add_variable(
            Variable, "Gas_demand_mass_flow", min=0.0, nominal=self.Q_nominal_gas * self.density
        )

        self.add_equation(
            (
                (self.GasIn.mass_flow - self.Gas_demand_mass_flow)
                / (self.Q_nominal_gas * self.density)
            )
        )

        self.add_equation(
            ((self.GasIn.mass_flow * self.internal_energy - self.Heat_source) / self.Heat_nominal)
        )
