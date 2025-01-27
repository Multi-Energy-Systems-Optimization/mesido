# [Unreleased] - 2024-08-23

## Added
- Default database for gas pipe dimensions based on the ASA pipe schedule with thicknesses from the standard class
- Gas and electricity workflow has been added. Still a work in progress
- Internal energy content function added for natural gas and hydrogen
- OPEX added for gas and electricity source
- Commodity annotation for assets, to allow for easier postprocessing
- Added function to make pickle usable (exceptions) in the OMOTES back end
- More of the existing classes added to __init_ for local runs using the grow_workflow
- Generic function to adapt timeseries from hourly timesteps to user-defined timesteps by averaging.

## Changed
- Write output to json also saves the solver statistics.
- Updates in asset conversion from ESDL to pycml; gas and heat pipe split, generic conversion better specified.
- Adapt profiles for heating and cooling peak day seperately & add test case
- For gas: Use energy content (heating value) instead of internal energy 
- Option was added to allow a bypass of the heat exchanger 
- Option for electricity cables to be unidirectional

## Fixed
- Bugfix: gas boiler mass flow constraint units
- Bugfix: same mip gap settings for all solvers in grow_workflow.
- Bugfix: head loss test case when minimum_velocity = 0.0
- Bugs: state update of heat pump, heat buffer volume & ates charge rates update in ESDL, heat storage asset data output to influxDB  
- Bugfix: get_density + get_internal_energy updated to ensure it checks commodity type for heat instead of the carrier name


# [0.1.8.4] - 2024-12-11

## Added
- More of the existing classes added to __init_ for local runs using the grow_workflow

## Changed
- xxx
 
## Fixed
- xxx


# [0.1.7] - 2024-08-23
 
## Added
- User feedback regarding demand type to be used in heat networks 
- Functionality to connect assets with logical links 

## Changed
- Increased time limit for stage 1, priority 1
- Replaced Retry loop to connect all assets and apply the correct modifiers of the linked assets
 
## Fixed
- Error exit when stage 1, priority 1 was not successful


