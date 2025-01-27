# [Unreleased-main] - 2024-12-12

## Added
- Default database for gas pipe dimensions based on the ASA pipe schedule with thicknesses from the standard class
- Gas and electricity workflow has been added. Still a work in progress
- Internal energy content function added for natural gas and hydrogen
- OPEX added for gas and electricity source
- Commodity annotation for assets, to allow for easier postprocessing
- Added function to make pickle usable (exceptions) in the OMOTES back end
- More of the existing classes added to __init_ for local runs using the grow_workflow
- Generic functions for postprocessing are added.
- Generic function to adapt timeseries from hourly timesteps to user-defined timesteps by averaging.

## Changed
- Write output to json also saves the solver statistics.
- Updates in asset conversion from ESDL to pycml; gas and heat pipe split, generic conversion better specified.
- Adapt profiles for heating and cooling peak day separately & add test case
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
- Bugs: state update of heat pump, heat buffer volume & ates charge rates update in ESDL, heat storage asset data output to influxDB   


# [0.1.8.3] - 2024-12-02

## Added
- Added function to make pickle usable (exceptions) in the OMOTES back end 

## Changed
- xx

## Fixed
- xx


# [0.1.8.2] - 2024-11-15

## Added
- xx

## Changed
- xx

## Fixed
- Bugfix: same mip gap settings for all solvers in grow_workflow.
- Bugfix: head loss test case when minimum_velocity = 0.0


# [0.1.8 & 0.1.8.1] - 2024-11-07

## Added
- Added MESIDO error exception class to raise applicable potential errors in a workflow & include required info for feedback in the mapeditor
- Limit the available pipe classes connetced to heat/gas demand/producers
- Add demands and sources to the topology object to have easy access to the connected pipes/cables later on
- Heating and cooling example case added (2 heating demands, 1 cold demand, hot and cold producer, WKO as seasonal storage)
- Gas physics documentation
- Gas & electricity 1st version of physics documentation
- Test case: Head loss validation with pandapipes.
- Example on ESDL file creation using pyESDL for the PoC Tutorial.
- Electrolyzer specific power curve valley location specified optionally specified in ESDL.
- Grow_workflow: Solver class created to allow the use of CPLEX as a solver for EndScenarioSizing classes. 

## Changed
- Cooling demand added to adapt_hourly_year_profile_to_day_averaged_with_hourly_peak_day (peak cooling day not used yet)
- Impact on the way EndScenarioSizing problems in MESIDO are run: The calling of the different optimization problem classes has been split from the solver classes. In EndScenarioSizing classes, the HIGHS solver is the default and the calling functions also cather for other solvers by adding the keyword "solver_class" with the respective solver class.
- Bugfix: No longer required to provide a power at the heating demands when a profile has been added.
- Bugfix: Scaling fix on ATES temperature variable when temperature modelling not used.
- Bugfix: Fix on nominals in electricity cables and gas pipes. Fix on nominals for nodes with logical links.
- Pipeline is only run when pull request is ready for review and synchronized or when opened, as well as when a pull request is merged to main.
- Speedup: Changed the way daily average profiles are created from hourly profiles to speed up the conversion.
 
## Fixed
- Bug fix: Logical links: e_boiler & gas boiler update to use energy values 
- Bug fix: Q max and nominal calculation update when reference energy value    
- Bug fix: e-boiler expected order of inports while setting nominal values
- Bug fix: setting nominals while using logical links when all values are 1.0
- Bug fix: machine error/rounding with updating lower bound values in the grow_workflow after stage 1
- documentation: heat physics tank storage
- bug fix in grow_workflow (heat networks), changed minimum velocity from 0 to default value
- addition to tests checking the minimum velocity setting in a workflow


# [0.1.7] - 2024-08-23
 
## Added
- User feedback regarding demand type to be used in heat networks 
- Functionality to connect assets with logical links 

## Changed
- Increased time limit for stage 1, priority 1
- Replaced Retry loop to connect all assets and apply the correct modifiers of the linked assets
 
## Fixed
- Error exit when stage 1, priority 1 was not successful


