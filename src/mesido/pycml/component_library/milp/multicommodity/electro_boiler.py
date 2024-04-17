from mesido.pycml import Variable
from mesido.pycml.component_library.milp.electricity.electricity_base import ElectricityPort
from mesido.pycml.component_library.milp.heat.heat_source import HeatSource

from numpy import nan


class ElecBoiler(HeatSource):
    """
    The e-boiler component is there to insert thermal power (Heat) into the network.

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

        self.component_subtype = "elec_boiler"

        self.id_mapping_carrier = -1

        self.min_voltage = nan
        self.elec_power_nominal = nan
        self.efficiency = nan

        # Assumption: heat in/out and added is nonnegative
        # Heat in the return (i.e. cold) line is zero
        self.add_variable(ElectricityPort, "ElectricityIn")
        self.add_variable(Variable, "Power_consumed", min=0.0, nominal=self.elec_power_nominal)

        self.add_equation(
            ((self.ElectricityIn.Power - self.Power_consumed) / self.elec_power_nominal)
        )

        self.add_equation(
            ((self.Power_consumed * self.efficiency - self.Heat_source) / self.Heat_nominal)
        )
