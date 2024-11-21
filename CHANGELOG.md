# [Unreleased-main] - 2024-11-21

## Added
- Default database for gas pipe dimensions based on the ASA pipe schedule with thicknesses from the standard class

## Changed
- Adapt profiles for heating and cooling peak day seperately & add test case

## Fixed
- Bugfix: same mip gap settings for all solvers in grow_workflow.
- Bugfix: head loss test case when minimum_velocity = 0.0

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


