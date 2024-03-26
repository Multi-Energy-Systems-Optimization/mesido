from typing import Dict

from mesido.base_component_type_mixin import BaseComponentTypeMixin
from mesido.heat_network_common import PipeFlowDirection

import numpy as np

from rtctools.optimization.timeseries import Timeseries


class BoundsToPipeFlowDirectionsMixin(BaseComponentTypeMixin):
    """
    This class determines implied flow direction based upon the lower bounds and upper bounds of
    the problem. This method is only applied for the non-linear problem which is currently not used.
    """

    def pre(self):
        """
        In this function a dict is constructed with the implied flow directions based upon bounds
        on flow, Q.
        """
        super().pre()

        bounds = self.bounds()
        components = self.energy_system_components
        pipes = components["pipe"]

        # Determine implied pipe directions from model bounds (that are
        # already available at this time)
        self.__implied_directions = [{} for e in range(self.ensemble_size)]

        for e in range(self.ensemble_size):
            for p in pipes:
                lb, ub = bounds[f"{p}.Q"]

                if not isinstance(lb, float) or not isinstance(ub, float):
                    raise ValueError(
                        "`BoundsToPipeFlowDirectionsMixin` only works for scalar bounds"
                    )

                if lb == ub and lb == 0.0:
                    # Pipe is disabled
                    self.__implied_directions[e][p] = PipeFlowDirection.DISABLED
                elif lb >= 0.0:
                    self.__implied_directions[e][p] = PipeFlowDirection.POSITIVE
                elif ub <= 0.0:
                    self.__implied_directions[e][p] = PipeFlowDirection.NEGATIVE

    def constant_inputs(self, ensemble_member):
        """
        Returns a timeseries object with the lower and upper bound of the direction constraints for
        all the pipes. This object is then used to update the bounds of the problem.
        """
        inputs = super().constant_inputs(ensemble_member)
        for p, d in self.__implied_directions[ensemble_member].items():
            k = self.heat_network_flow_directions[p]
            inputs[k] = Timeseries([-np.inf, np.inf], [d, d])
        return inputs

    @property
    def heat_network_flow_directions(self) -> Dict[str, str]:
        """
        This function returns a dict with the variable name for the implied direction variable.
        """
        pipes = self.energy_system_components["pipe"]
        return {p: f"{p}__implied_direction" for p in pipes}
