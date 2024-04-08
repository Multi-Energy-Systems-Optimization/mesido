.. _chp_code_structure:

Code Structure
==============

Rtc-tools is used as the framework to define optimization problems, https://gitlab.com/deltares/rtc-tools.
Rtc-tools is a tool-box in which time-horizon optimization problems can be defined. It utilizes the Casadi package to parse the problems in formats that allow solvers such as Highs and Gurobi to solve the problem.
Internally rtc-tools makes heavy use of the python mixin (inheritance) structure, which results that MESIDO also adheres to the mixin structure that rtc-tools uses.

Although the full structure is even more elaborate, the basic methods in the mixin are:

* read: In this method all parsing of data files containing relevant information for the problem should be done, e.g. price profiles.
* times: In this function the time horizon is defined/adapted, note varying timestep size is supported.
* pre: In this method all variables and other operations needed before constraints and goals can be defined should be done.
* (path) constraints: In this method the constraints should be added to the problem, the path constraints are those applied to states which exist in every timestep.
* (path) goals: In this method the goals should be added to the problem, the path goals are those applied to states which exist in every timestep.
* optimize: Here the problem is transcribed and parsed to the solver (this method is never modified in MESIDO).
* post: In this method optional post processing including checks on the outcome of the optimization can be preformed.

MESIDO offers a toolbox for optimization of multi energy systems with the following mixins:

* PyCMLMixin: This mixin allows users to define component models with easy functions for adding variables and parameters.
* ESDLMixin: This mixin reads ESDL files and constructs a network model using the asset models defined in PyCML
* PhysicsMixin: This mixin adds constraints for the modelling of physics in asset components or interaction between assets. The PhysicsMixin inherits the individual commodity mixins and adds physics where interaction between the commodities exists.
    * HeatPhysicsMixin: Adds physics for the modelling of district heating systems.
    * ElectricityPhysicsMixin: Adds physics for the modelling of electricity grids.
    * GasPhysicsMixin: Adds physics for the modelling of networks with gaseous mediums, e.g. natural gas or hydrogen.
* AssetSizingMixin: Adds variables and constraints allowing for the sizing and placement of assets in the energy system.
* FinancialMixin: Adds variables and constraints for financial computations, like OPEX, CAPEX and revenues.

There are also workflows (which technically are also mixins) next to these toolbox mixins that MESIDO offers. The default workflows available are:

* EndScenarioSizing: This workflow will optimize the energy system for total tost of ownership.
* GROWSimulator: This workflow allows one to do operational analysis with a source merit order usage strategy, where the use of sources is minimized in the reverse merit order to mimick simulator like behaviour.
