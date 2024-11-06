from __future__ import annotations

import datetime
import logging

import numpy as np

from rtctools.data.storage import DataStore


logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)


def set_data_with_averages_and_peak_day(
    datastore: DataStore,
    variable_name: str,
    ensemble_member: int,
    new_date_times: np.array,
    problem: object,
):
    try:
        data = problem.get_timeseries(variable=variable_name, ensemble_member=ensemble_member)
    except KeyError:
        datastore.set_timeseries(
            variable=variable_name,
            datetimes=new_date_times,
            values=np.asarray([0.0] * len(new_date_times)),
            ensemble_member=ensemble_member,
            check_duplicates=True,
        )
        return

    new_data = []
    data_timestamps = data.times
    new_date_timestamps = [
        (new_dt - problem.io.datetimes[0]).total_seconds() for new_dt in new_date_times
    ]

    values_for_mean = [0.0]
    for dt, val in zip(data_timestamps, data.values):
        if dt in new_date_timestamps:
            new_data.append(np.mean(values_for_mean))
            values_for_mean = [val]
        else:
            values_for_mean.append(val)

    # At this point new_data[0] = 0.0. This value is not utilized. The heat demand value
    # new_data[1] at new_date_times[1] is active from new_date_times[0] up to new_date_times[1]. To
    # ensure a no 0.0 heat demand values end up in the optimization, new_data[0] is forced to have
    # an artificial value below
    new_data[0] = new_data[1]

    # last datetime is not in input data, so we need to take the mean of the last bit
    new_data.append(np.mean(values_for_mean))

    datastore.set_timeseries(
        variable=variable_name,
        datetimes=new_date_times,
        values=np.asarray(new_data),
        ensemble_member=ensemble_member,
        check_duplicates=True,
    )


def adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day(problem, problem_day_steps: int):
    """
    Adapt yearly porifle with hourly time steps to a common profile (daily averaged profile except
    for the day with the peak demand).

    Return the following:
        - problem_indx_max_peak: index of the maximum of the peak values
        - heat_demand_nominal: max demand value found for a specific heating demand
        - cold_demand_nominal: max cold demand value found for a specific cold demand
    """

    demands = problem.energy_system_components.get("heat_demand", [])
    new_datastore = DataStore(problem)
    new_datastore.reference_datetime = problem.io.datetimes[0]

    cold_demands = problem.energy_system_components.get("cold_demand", [])

    for ensemble_member in range(problem.ensemble_size):
        parameters = problem.parameters(ensemble_member)
        total_demand = None
        heat_demand_nominal = dict()

        for demand in demands:
            try:
                demand_values = problem.get_timeseries(
                    f"{demand}.target_heat_demand", ensemble_member
                ).values
            except KeyError:
                continue
            if total_demand is None:
                total_demand = demand_values
            else:
                total_demand += demand_values
            heat_demand_nominal[f"{demand}.Heat_demand"] = max(demand_values)
            heat_demand_nominal[f"{demand}.Heat_flow"] = max(demand_values)

        # TODO: the approach of picking one peak day was introduced for a network with a tree
        #  layout and all big sources situated at the root of the tree. It is not guaranteed
        #  that an optimal solution is reached in different network topologies.
        idx_max = int(np.argmax(total_demand))
        max_day = idx_max // 24
        nr_of_days = len(total_demand) // 24
        new_date_times = list()
        day_steps = problem_day_steps

        problem_indx_max_peak = max_day // day_steps
        if max_day % day_steps > 0:
            problem_indx_max_peak += 1.0

        for day in range(0, nr_of_days, day_steps):
            if day == max_day // day_steps * day_steps:
                if max_day > day:
                    new_date_times.append(problem.io.datetimes[day * 24])
                new_date_times.extend(problem.io.datetimes[max_day * 24 : max_day * 24 + 24])
                if (day + day_steps - 1) > max_day:
                    new_date_times.append(problem.io.datetimes[max_day * 24 + 24])
            else:
                new_date_times.append(problem.io.datetimes[day * 24])
        new_date_times.append(problem.io.datetimes[-1] + datetime.timedelta(hours=1))

        new_date_times = np.asarray(new_date_times)
        parameters["times"] = [x.timestamp() for x in new_date_times]

        for demand in demands:
            var_name = f"{demand}.target_heat_demand"
            set_data_with_averages_and_peak_day(
                datastore=new_datastore,
                variable_name=var_name,
                ensemble_member=ensemble_member,
                new_date_times=new_date_times,
                problem=problem,
            )
        # ------------------------------------------------------------------------------------------
        # cooling demands
        total_cold_demand = None
        cold_demand_nominal = dict()

        for demand in cold_demands:
            try:
                cold_demand_values = problem.get_timeseries(
                    f"{demand}.target_cold_demand", ensemble_member
                ).values
            except KeyError:
                continue
            if total_cold_demand is None:
                total_cold_demand = cold_demand_values
            else:
                total_cold_demand += cold_demand_values
            cold_demand_nominal[f"{demand}.Cold_demand"] = max(cold_demand_values)
            cold_demand_nominal[f"{demand}.Heat_flow"] = max(cold_demand_values)

        # TODO: find the peak cooling day and adapt to hourly

        for demand in cold_demands:
            var_name = f"{demand}.target_cold_demand"
            set_data_with_averages_and_peak_day(
                datastore=new_datastore,
                variable_name=var_name,
                ensemble_member=ensemble_member,
                new_date_times=new_date_times,
                problem=problem,
            )
        # end cooling demands
        # ------------------------------------------------------------------------------------------

        # TODO: this has not been tested but is required if a production profile is included
        #  in the data
        for source in problem.energy_system_components.get("heat_source", []):
            var_name = f"{source}.maximum_heat_source"
            try:
                problem.get_timeseries(variable=var_name, ensemble_member=ensemble_member)
            except KeyError:
                logger.debug(
                    f"Source {source} has no production profile, thus it also will "
                    f"not be adapted to a different time scales."
                )
                continue

            set_data_with_averages_and_peak_day(
                datastore=new_datastore,
                variable_name=var_name,
                ensemble_member=ensemble_member,
                new_date_times=new_date_times,
                problem=problem,
            )

        for carrier_properties in problem.esdl_carriers.values():
            carrier_name = carrier_properties["name"]
            var_name = f"{carrier_name}.price_profile"
            try:
                problem.get_timeseries(variable=var_name, ensemble_member=ensemble_member)
            except KeyError:
                logger.debug(
                    f"Carrier {carrier_name} has no price profile, thus it also will "
                    f"not be adapted to different time scales."
                )
            set_data_with_averages_and_peak_day(
                datastore=new_datastore,
                variable_name=var_name,
                ensemble_member=ensemble_member,
                new_date_times=new_date_times,
                problem=problem,
            )

    problem.io = new_datastore

    logger.info("Profile data has been adapted to a common format")

    return problem_indx_max_peak, heat_demand_nominal, cold_demand_nominal
