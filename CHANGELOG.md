# [Unreleased-main] - 2025-11-24

## Added
- ATES variable cost calculation utilizing a split ates charging and discharging variable.

## Changed
- xx

## Fixed
- Include GenericProducer in producer profile reading from influx


# [0.1.15] - 2025-11-19

## Added
- xx

## Changed
- Reduce computational effort stage 2 grow_workflow -> options["heat_loss_disconnected_pipe"] setting

## Fixed
- xx


# [0.1.14] - 2025-11-07

## Added
- Elect test for air_to_water_heat_pump_elec
- Timelimit for testing in pipeline
- Potential error checks if heating demand state is not set to enabled.
- Potential error checks if the heat exchanger capacity is set correctly.
- Generic modifier functions for consistency across assets.
- Discrete charge/discharge variable for an ATES asset.
- Checks if a timelimit is reached in the GROW workflow at each stage.
- Optimized esdl is re-usabled
- Pipe costs are updated based on the asset templates if they are provided 
- AssetStateEnums of IntEnum type to describe the state of an asset i.e disabled/enabled/optional
- A new type of potential error is added if the profile name indicated in esdl is not available in the database.
- Parsing of emission factors for specific sources not related to carriers.
- Capability of ResidualHeatSource and GeothermalHeatSource to also have profile constraints that can be read from InfluxDB
- Writing KPIs back for discounted CAPEX
- Roll out workflow setup.
- Improved error handling for asset cost information to prevent potential failures and ensure more robust processing of asset-related data.

## Changed
- Removed support of python versions 3.9 and older.
- Previously variable operational cost of air-to-water heat pump was based on  the thermal power usage. Now it is based on the electrical power usage
- TCO cost calculation objective now used the technical lifetime to determine the frequency of the re-investment costs.
- TCO cost calculation objective to now exclude heating demand costs in the grow workflow
- Hydraulic power calculation at "sink" assets is set to 0.0 if headloss calculation is turned off
- Updated pyESDL to v25.7
- Allowing 2 additional pipe sizes (instead of 1) in stage 2 compared to the result of stage 1 of the grow_workflow.
- Calculation of capex for TCO optimization KPI is changed to make it the same as in the TCO calc in the code

## Fixed
- Bug: Add 3 port heat pump to elect demand path constraint
- Error exit when priority 1 reaches time limit in grow workflow for all settings and solvers.
- Bug: Replaced one pipe with all pipes in head loss testing in test_end_scenario_sizing.py 
- Bug: Geothermal being placed when not used. General added aggregation_count=0 constraint for heat buffer, ates and goethermal when not being used.
- Bug: Ensure ATES and Geothermal max_size cannot be smaller than the single_doublet_power if placed.
- Bug: Upper limit of available pipe classes when using producer profiles
- Bug: Removed the parsing of is_disconnected pipe between stage 1 and 2 of the grow_workflow. 


# [0.1.13] - 2025-06-25

## Added
- xx

## Changed
- README update mesido install command for dev

## Fixed
- Bug: Producer profiles specified in Watts and asset state=ENABLED


# [0.1.12] - 2025-06-12

## Added
- Maximum profile contraint (specified in Watts) to some heat producers

## Changed
- xx

## Fixed
- xx


# [0.1.11] - 2025-05-21

## Added
- xx

## Changed
- Updated pyESDL to v25.5.1

## Fixed
- xx


# [0.1.10] - 2025-05-20

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
- Error check for NaN values in profile data (csv & influxDB)
- Specify package (deepdiff used in pandapipes validation test) version number in test environment
- Reset POTENTIAL_ERRORS class instance (Singleton) in grow_workflow due to it being persistent
- Estimate grow worlfow progress status and update OMOTES progress status 

## Changed
- Updated the Financial section of the documentation to explain the annualized discounted costs calculation.
- Write output to json also saves the solver statistics.
- Updates in asset conversion from ESDL to pycml; gas and heat pipe split, generic conversion better specified.
- Adapt profiles for heating and cooling peak day separately & add test case
- For gas: Use energy content (heating value) instead of internal energy 
- Option was added to allow a bypass of the heat exchanger, possible on both sides of the heat exchanger
- Option for electricity cables to be unidirectional
- Upgraded rtctools to v 2.6.1
- Updated Casadi to 3.6.7 with gil fixes (see https://github.com/casadi/casadi/releases/tag/nightly-gil_release)
- Definition of power attribute of water-to-water heat pump is changed from electrical power to secondary heat power
- Enforce water-to-water heat pump upper bound heat capacity to conform to elect_power*cop

## Fixed
- Bugfix: gas boiler mass flow constraint units
- Bugfix: same mip gap settings for all solvers in grow_workflow.
- Bugfix: head loss test case when minimum_velocity = 0.0
- Bugs: state update of heat pump, heat buffer volume & ates charge rates update in ESDL, heat storage asset data output to influxDB  
- Bugfix: get_density + get_internal_energy updated to ensure it checks commodity type for heat instead of the carrier name
- Bug: pipe class bounds when pipe DN none results from stage 1 in the grow_workflow


# [0.1.8.5] - 2025-02-12

## Added
- xx

## Changed
- Updated Casadi to 3.6.7 with gil fixes (see https://github.com/casadi/casadi/releases/tag/nightly-gil_release)
- Upgraded rtctools to version 2.6.1

## Fixed
- Bug: pipe class bounds when pipe DN none results from stage 1 in the grow_workflow


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


