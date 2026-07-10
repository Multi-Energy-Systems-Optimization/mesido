from mesido.pycml import Variable
from mesido.pycml.pycml_mixin import add_variables_documentation_automatically

from numpy import nan

from .heat_source import HeatSource


@add_variables_documentation_automatically
class GeothermalSource(HeatSource):
    """
    The geothermal source component is used to model geothermal doublets. It is equivilent to a
    normal source with the only difference being the modelling of doublets and power consumption.
    The main reason for this component instead of using just a regular source is that to have the
    integer behaviour of increasing the amount of doublets. In the HeatMixin an integer is created
    _aggregation_count to model the amount of doublets and the maximum power will scale with this
    integer instead of continuous. This will also ensure that the cost will scale with this integer.
    The power consumption is computed through a COP calculation, directly linked to the heat source
    production. COP is set to a default value of 0 in order to ensure power and its associated costs
    are only inlcuded in the computations intentionally.

    Variables created:
        {add_variable_names_for_documentation_here}

    Parameters:
        name : The name of the asset. \n
        modifiers : Dictionary with asset information.

    """

    def __init__(self, name, **modifiers):
        super().__init__(name, **modifiers)

        self.component_subtype = "geothermal"

        self.target_flow_rate = nan
        self.single_doublet_power = nan
        self.cop = nan
        self.elec_power_nominal = nan
        self.nr_of_doublets = 1.0

        self.add_variable(Variable, "Power_elec", min=0.0, nominal=self.elec_power_nominal)

        if self.cop == 0.0:
            self.add_equation((self.Power_elec))
        else:
            self.add_equation(((self.Power_elec * self.cop - self.Heat_source) / self.Heat_nominal))
