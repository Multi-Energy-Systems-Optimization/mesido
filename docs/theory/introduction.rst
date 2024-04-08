Introduction
============

MESIDO is the abbreviation for Multi Energy System Integrated Design and Operation. This documentation is meant to give the user of the MESIDO package insight in how to use the different functionalities available.

Why MESIDO?
-----------

MESIDO aims to fill the gap between available tools used in early feasibility studies and the more detailed tools (typically simulators).
Tools for feasibilty studies like EnergyPlan, https://www.energyplan.eu, provide a good framework for initial feasibility of high level system concepts.
These tools often have little to no physics included in their models, typically energy balancing with efficiencies and capacity limits.
On the other hand there are more detailed tools, examples include detailed simulators like pandapower and pandapipes.
These simulators include more detailed modelling of physics allowing one to analyze networks and/or assets close to real life operational conditions.

The high level system concept that comes out of the initial feasibility is typically still subjected to many uncertainties. Therefore, many design choices are still to be made like placement and exact sizing of assets, optimal routing of the network, etc.
Although, the more detailed simulators can analyze various energy system designs by running different design options, it typically becomes infeasible in practice as the amount of open design choices after initial feasibility is too high.
The increased complexity of the new and future energy systems plays a significant part. New energy systems consists out of networks which have multiple producers and consumers, often extended with storages (possibly seasonal). Most notably the interconnections between these different energy commodities resulting in a larger possible solution space than ever.

MESIDO aims to play the connecting role between the initial feasibility and the detailed analyses. This is achieved by offering a techno-economic optimization framework that allows one to make design choices, resulting in an (limited set of) energy system design(s) that can be refined (more detail) with simulators.

What is MESIDO?
---------------

MESIDO is a python package that allows users to define techno-economic optimization workflows (or use the available ones). Users can define which KPIs they wish to optimize for, e.g. cost or business case optimization.
Furthermore, the users can select which physics fidelity level they need for their analyses. Where the physics are typically approximations of steady-state conditions, the modelling is done such that the solutions are close and conservative.
The inclusion of the physics approximations allows the user to make more design choices compared to the tools used in initial feasibility analyses.
However, this comes at the cost of the user needing to provide more information of the energy system in order to use MESIDO in an effective way, hence MESIDO is proposed as a sequential tool for analysis.

Under the hood, MESIDO is a Mixed Integer Linear Problem (MILP) formulation. This means that the physics and financial models are limited to linear constraints.
The computational power advantages of MILP optimizations allows MESIDO to optimize Multi Energy/Multi Commodity networks in an integral manner.
Nevertheless, the modelling limitations of MILP will in the vast majority of cases, require optimized networks to be refined with simulation tools before closing business cases and going to implementation.







