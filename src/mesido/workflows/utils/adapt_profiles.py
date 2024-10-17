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

    new_data = list()
    data_timestamps = data.times
    data_datetimes = [
        problem.io.datetimes[0] + datetime.timedelta(seconds=s) for s in data_timestamps
    ]
    assert new_date_times[0] == data_datetimes[0]
    data_values = data.values

    values_for_mean = [0.0]
    for dt, val in zip(data_datetimes, data_values):
        if dt in new_date_times:
            new_data.append(np.mean(values_for_mean))
            values_for_mean = [val]
        else:
            values_for_mean.append(val)

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
        
        total_demand = None
        heat_demand_nominal = dict()
        # Assemble all demands together to get the peak.
        for demand in heat_demands:
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

        idx_max_hot = int(np.argmax(total_demand))
        max_day_hot = idx_max_hot // 24
        new_date_times = list()
        nr_of_days = len(total_demand) // 24
        day_steps = problem_day_steps

        problem_indx_max_peak = max_day_hot // day_steps
        if max_day_hot % day_steps > 0:
            problem_indx_max_peak += 1.0       

        idx_max_cold = int(np.argmax(total_cold_demand))
        max_day_cold = idx_max_cold // 24

        problem_indx_max_peak_cold = max_day_cold // day_steps
        if max_day_cold % day_steps > 0:
            problem_indx_max_peak_cold += 1.0

        # TODO: the approach of picking one peak day was introduced for a network with a tree
        #  layout and all big sources situated at the root of the tree. It is not guaranteed
        #  that an optimal solution is reached in different network topologies.
        
        for day in range(0, nr_of_days, day_steps):
            if day == max_day_hot // day_steps * day_steps or day == max_day_cold // day_steps * day_steps:
                if day == max_day_hot // day_steps * day_steps:
                    peak_day = max_day_hot
                elif day == max_day_cold // day_steps * day_steps: # TODO: might have to fix this if the peak day is the same for heat and cold.
                    peak_day = max_day_cold
                if peak_day > day:
                    new_date_times.append(problem.io.datetimes[day * 24])
                new_date_times.extend(problem.io.datetimes[peak_day * 24 : peak_day * 24 + 24])
                if (day + day_steps - 1) > peak_day:
                    new_date_times.append(problem.io.datetimes[peak_day * 24 + 24])
            else:
                new_date_times.append(problem.io.datetimes[day * 24])
        new_date_times.append(problem.io.datetimes[-1] + datetime.timedelta(hours=1))

        new_date_times = np.asarray(new_date_times)
        parameters["times"] = [x.timestamp() for x in new_date_times]
            
        # heat_flag = False
        # if heat_flag: # Case where there is only heat demands.
        #     for day in range(0, nr_of_days, day_steps):
        #         if day == max_day_hot // day_steps * day_steps: # Stops at the first day in the original discretization before the peak day
        #             peak_day = max_day_hot
        #             if peak_day > day: # Sitting behind the peak day
        #                 new_date_times.append(problem.io.datetimes[day * 24]) # Just append a normal day. Not necessary if already at the peak day because it gets added in the next one if you are.
        #             new_date_times.extend(problem.io.datetimes[peak_day * 24 : peak_day * 24 + 24]) # Appends the 24 hours of the peak day starting at the beginning of that peak day.
        #             if (day + day_steps - 1) > peak_day: # Case where the end of the peak day does not coincide with the next step day. In that case, this "missing" day is added.
        #                 new_date_times.append(problem.io.datetimes[peak_day * 24 + 24]) 
        #         else:
        #             new_date_times.append(problem.io.datetimes[day * 24]) # Normal day addition.
        #     new_date_times.append(problem.io.datetimes[-1] + datetime.timedelta(hours=1)) # Adds one hour at the end of the year for some reason.
            
        #     new_date_times = np.asarray(new_date_times)
        #     parameters["times"] = [x.timestamp() for x in new_date_times]

        # Store the heat and cold target demands in the problem object, together with the now computed
        # time series with both peaks in it.
        for demand in heat_demands:
            try:
                var_name = f"{demand}.target_heat_demand"
            except KeyError:
                break
            set_data_with_averages_and_peak_day(
                datastore=new_datastore,
                variable_name=var_name,
                ensemble_member=ensemble_member,
                new_date_times=new_date_times,
                problem=problem,
            )

        for demand in cold_demands:
            try:
                var_name = f"{demand}.target_cold_demand"
            except KeyError:
                break
            set_data_with_averages_and_peak_day(
                datastore=new_datastore,
                variable_name=var_name,
                ensemble_member=ensemble_member,
                new_date_times=new_date_times,
                problem=problem,
            )

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
