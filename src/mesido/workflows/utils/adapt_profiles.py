from __future__ import annotations

import datetime
import logging
import operator
import sys

import numpy as np

from rtctools.data.storage import DataStore


logger = logging.getLogger("WarmingUP-MPC")
logger.setLevel(logging.INFO)


def set_data_with_averages(
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

    # Extract heat and cold demand assets
    heat_demands = problem.energy_system_components.get("heat_demand", [])
    cold_demands = problem.energy_system_components.get("cold_demand", [])
    new_datastore = DataStore(problem)
    new_datastore.reference_datetime = problem.io.datetimes[0]

    for ensemble_member in range(problem.ensemble_size):
        parameters = problem.parameters(ensemble_member)

        total_heat_demand = None
        heat_demand_nominal = dict()
        # Assemble all demands together to get the peaks.
        for demand in heat_demands:
            try:
                demand_values = problem.get_timeseries(
                    f"{demand}.target_heat_demand", ensemble_member
                ).values
            except KeyError:
                continue
            if total_heat_demand is None:
                total_heat_demand = demand_values
            else:
                total_heat_demand += demand_values
            heat_demand_nominal[f"{demand}.Heat_demand"] = max(demand_values)
            heat_demand_nominal[f"{demand}.Heat_flow"] = max(demand_values)

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

        new_date_times = list()
        nr_of_days = len(total_heat_demand) // 24
        day_steps = problem_day_steps

        peak_days = []
        if total_heat_demand is not None:
            idx_max_hot = int(np.argmax(total_heat_demand))
            max_day_hot = idx_max_hot // 24

            problem_indx_max_peak = max_day_hot // day_steps
            if max_day_hot % day_steps > 0:
                problem_indx_max_peak += 1.0

            peak_days.append(max_day_hot)
        else:
            max_day_hot = None

        if total_cold_demand is not None:
            idx_max_cold = int(np.argmax(total_cold_demand))
            max_day_cold = idx_max_cold // 24

            problem_indx_max_peak_cold = max_day_cold // day_steps
            if max_day_cold % day_steps > 0:
                problem_indx_max_peak_cold += 1.0

            peak_days.append(max_day_cold)
        else:
            max_day_cold = None

        # TODO: the approach of picking one peak day was introduced for a network with a tree
        #  layout and all big sources situated at the root of the tree. It is not guaranteed
        #  that an optimal solution is reached in different network topologies.

        peak_days = sorted(peak_days)
        peak_check_days = np.array(peak_days) // day_steps * day_steps

        current_peak_idx = 0
        for day in range(0, nr_of_days, day_steps):
            if day in peak_check_days:
                peak_day = peak_days[current_peak_idx]
                if peak_day > day:
                    new_date_times.append(problem.io.datetimes[day * 24])
                new_date_times.extend(problem.io.datetimes[peak_day * 24 : peak_day * 24 + 24])
                if (day + day_steps - 1) > peak_day:
                    new_date_times.append(problem.io.datetimes[peak_day * 24 + 24])
                current_peak_idx += 1
            else:
                new_date_times.append(problem.io.datetimes[day * 24])

        new_date_times.append(problem.io.datetimes[-1] + datetime.timedelta(hours=1))

        new_date_times = np.asarray(new_date_times)
        parameters["times"] = [x.timestamp() for x in new_date_times]

        select_profiles_for_update(problem, new_datastore, new_date_times, ensemble_member)

    problem.io = new_datastore

    logger.info("Profile data has been adapted to a common format")

    return problem_indx_max_peak, heat_demand_nominal, cold_demand_nominal


def adapt_hourly_profile_averages_timestep_size(problem, problem_step_size_hours: int):
    """
    Adapt yearly porifle with hourly time steps to a common profile with average over a given
    stepsize in hours.

    Return the following:

    """

    new_datastore = DataStore(problem)
    new_datastore.reference_datetime = problem.io.datetimes[0]

    org_timeseries = problem.io.datetimes
    org_dt = list(map(operator.sub, org_timeseries[1:], org_timeseries[0:-1]))
    assert all(dt.seconds == 3600 for dt in org_dt)  # checks that the orginal timeseries has
    # homogenous horizon with equispaced timesteps of 3600s (1hr).

    for ensemble_member in range(problem.ensemble_size):
        parameters = problem.parameters(ensemble_member)

        new_date_times = list()

        for hour in range(0, len(org_timeseries), problem_step_size_hours):
            new_date_times.append(problem.io.datetimes[hour])

        new_date_times.append(problem.io.datetimes[-1] + datetime.timedelta(hours=1))

        new_date_times = np.asarray(new_date_times)
        parameters["times"] = [x.timestamp() for x in new_date_times]

        select_profiles_for_update(problem, new_datastore, new_date_times, ensemble_member)

    problem.io = new_datastore

    logger.info("Profile data has been adapted to a common format")


def adapt_profile_to_copy_for_number_of_years(problem, number_of_years: int):
    """
    Adapt yearly profile to a multi-year profile.
    Copying the profile for the given number of years, where the timeline is updated with the
    sequential years.

    """

    new_datastore = DataStore(problem)
    new_datastore.reference_datetime = problem.io.datetimes[0]

    org_timeseries = problem.io.datetimes

    # If a problem has already been modified, the last timestamp should be exactly 1 year after
    # the first timestamp.

    skip_last_day = False
    if org_timeseries[-1] == org_timeseries[0] + datetime.timedelta(days=365):
        skip_last_day = True
    elif org_timeseries[0] + datetime.timedelta(days=365) - org_timeseries[
        -1
    ] <= datetime.timedelta(hours=1):
        skip_last_day = False
    else:
        sys.exit("The profile should be a year profile.")

    for ensemble_member in range(problem.ensemble_size):
        parameters = problem.parameters(ensemble_member)

        new_date_times = list()
        if skip_last_day is False:
            new_date_times = org_timeseries.copy()
        else:
            new_date_times = org_timeseries[:-1].copy()

        for year in range(1, number_of_years):
            if year == number_of_years - 1 or skip_last_day is False:
                new_date_times.extend(
                    [i + year * datetime.timedelta(days=365) for i in org_timeseries]
                )
            else:
                new_date_times.extend(
                    [i + year * datetime.timedelta(days=365) for i in org_timeseries[:-1]]
                )

        new_date_times = np.asarray(new_date_times)
        parameters["times"] = [x.timestamp() for x in new_date_times]

        for var_name in problem.io.get_timeseries_names():
            old_data = problem.io.get_timeseries(var_name)[1]
            if skip_last_day:
                new_data = np.append(np.tile(old_data[:-1], number_of_years), old_data[-1])
            else:
                new_data = np.tile(old_data, number_of_years)
            new_datastore.set_timeseries(
                variable=var_name,
                datetimes=new_date_times,
                values=np.asarray(new_data),
                ensemble_member=ensemble_member,
                check_duplicates=True,
            )

    problem.io = new_datastore

    logger.info("Profile data has been adapted to a common format")


def select_profiles_for_update(
    problem, new_datastore: DataStore, new_date_times: np.array, ensemble_member: int
):
    """
    Selects all the profiles that are relevant for the problem and runs the method to set the new
    updated timeseries.

    Args:
        problem: optimization problem class
        new_datastore: the new datastore object that should be filled
        new_date_times: the new date time entries that are required
        ensemble_member:

    Returns:

    """

    timeseries_names = problem.io.get_timeseries_names()
    for var_name in timeseries_names:
        set_data_with_averages(
            datastore=new_datastore,
            variable_name=var_name,
            ensemble_member=ensemble_member,
            new_date_times=new_date_times,
            problem=problem,
        )
