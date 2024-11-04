import logging
from pathlib import Path
from unittest import TestCase

from mesido.esdl.esdl_parser import ESDLFileParser
from mesido.esdl.profile_parser import ProfileReaderFromFile
from mesido.util import run_esdl_mesido_optimization
from mesido.workflows.utils.adapt_profiles import (
    adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day,
)

logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)


class HeatColdDemand(TestCase):

    def heating_cooling_case(self):
        """
        In this case we have a network with an air-water hp, a WKO (warm and cold well) and both
        hot and cold demand. The heat and cold demand was balanced such that the seasonal storage
        gets utilized as intended.
        """
        import os
        import sys

        root_folder = os.path.join(Path(__file__).resolve().parent.parent.parent.parent, "tests")
        sys.path.insert(1, root_folder)

        from models.wko.src.example import HeatProblem
        from utils_tests import demand_matching_test, energy_conservation_test

        base_folder = Path(__file__).resolve().parent.parent

        # ------------------------------------------------------------------------------------------
        class HeatingCoolingProblem(HeatProblem):

            def __init__(self, *args, **kwargs):
                super().__init__(*args, **kwargs)
                self._number_of_years = 30.0

                self.__indx_max_peak = None
                self.__day_steps = 5

            def energy_system_options(self):
                options = super().energy_system_options()
                options["neglect_pipe_heat_losses"] = False
                return options

            def parameters(self, ensemble_member):
                parameters = super().parameters(ensemble_member)
                parameters["peak_day_index"] = self.__indx_max_peak
                parameters["time_step_days"] = self.__day_steps
                parameters["number_of_years"] = self._number_of_years
                return parameters

            def read(self):
                super().read()

                # Set the peak of the heating demand since the specified profile is normalized to 1

                for d in self.energy_system_components["heat_demand"]:
                    target = self.get_timeseries(f"{d}.target_heat_demand")
                    for ii in range(len(target.values)):
                        target.values[ii] = target.values[ii] * 7.0e6

                    self.io.set_timeseries(
                        f"{d}.target_heat_demand",
                        self.io._DataStore__timeseries_datetimes,
                        target.values,
                        0,
                    )
                # Cold demand specified profile is not normalized
                # Cold demand value is reduced to get the correct balance between the heat and cold
                # demand such that the seasonal storage is utilized
                for d in self.energy_system_components["cold_demand"]:
                    target = self.get_timeseries(f"{d}.target_cold_demand")
                    for ii in range(len(target.values)):
                        target.values[ii] = target.values[ii] * 0.25

                    self.io.set_timeseries(
                        f"{d}.target_cold_demand",
                        self.io._DataStore__timeseries_datetimes,
                        target.values,
                        0,
                    )

                (
                    self.__indx_max_peak,
                    self.__heat_demand_nominal,
                    self.__cold_demand_nominal,
                ) = adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(
                    self,
                    self.__day_steps,
                )

            def constraints(self, ensemble_member):
                constraints = super().constraints(ensemble_member)

                # TODO: confirm if volume or heat balance is required over year. This will
                # determine if cyclic contraint below is for stored_heat or stored_volume
                # Add stored_heat cyclic constraint, this will also ensure that the total heat
                # change in the wko is 0 over the timeline
                # Note:
                #   - WKO in cooling mode: Hot well is being charged with heat and the cold well is
                # being discharged
                #   - WKO in heating mode: Cold well is being charged and the hot well is being
                #     discharged.
                # for a in self.energy_system_components.get("low_temperature_ates", []):
                #     stored_heat = self.state_vector(f"{a}.Stored_heat")
                #     constraints.append(((stored_heat[-1] - stored_heat[0]), 0.0, 0.0))
                # This code below might be needed
                # Add stored_heat cyclic constraint, this will also ensure that the volume
                # into the lower temp & out of the higher temp is the same as the volume
                # out of the lower temp & into the higher temp over the timeline.
                # Note:
                #   - Volume increase: Hot well is being charged and the cold well is being
                #     discharged. -> WKO in cooling mode
                #   - Volume decrease: Cold well is being charged and the hot well is being
                #     discharged. -> WKO in heating mode

                for ates_id in self.energy_system_components.get("low_temperature_ates", []):
                    stored_volume = self.state_vector(f"{ates_id}.Stored_volume")
                    volume_usage = 0.0
                    volume_usage = stored_volume[0] - stored_volume[-1]
                    constraints.append((volume_usage, 0.0, 0.0))

                return constraints

        heat_problem = run_esdl_mesido_optimization(
            HeatingCoolingProblem,
            base_folder=base_folder,
            esdl_file_name="Heating and cooling network with return network.esdl",
            esdl_parser=ESDLFileParser,
            profile_reader=ProfileReaderFromFile,
            input_timeseries_file="timeseries_4.csv",
        )
        results = heat_problem.extract_results()

        # checks to make sure the run was valid
        demand_matching_test(heat_problem, results)
        energy_conservation_test(heat_problem, results)
        # TODO: check below can be added, once the heat_to_discharge_test have been updated such
        # that a pipe can absorb heat
        # heat_to_discharge_test(heat_problem, results)


if __name__ == "__main__":
    test_cold_demand = HeatColdDemand()
    test_cold_demand.heating_cooling_case()
