.. _chp_philosophy:


Modelling Philosophy
====================

The conceptual design including operational strategy for energy systems starts simultaneously with the initial feasibility studies.
This early phase is challenging as it comes with many uncertainties, such as the expected demand profiles and many possible design choices. Examples of the latter being network routing, asset sizing, and multiple optional locations for the placement of assets such as sources and storage options.

Nevertheless, in practice it is seen that the decisions made in these early phases are crucial for the eventual system performance, as they set the boundaries for interactions between assets and sub-parts of the overall energy system.
Later design phases can therefore be limited by decisions made during the initial feasibility phases.
Good trade-offs take into account the interaction between assets, but also trade-offs between design and operational strategy are key in reducing the overall system cost.

MESIDO applies a Mixed Integer Linear Problem (MILP) formulation to address these challenges. The main reasons are:

* In the early phases of designing an energy system, decision makers are typically not looking for high accuracy physical insight, but rather for directions in investment choices. Hence MILP approximation methods that are conservative and feasible, whilst staying within accuracy bounds of the available input data, will suffice. This allows the decision makers to make plans in this early phase with lower financial risk, as these plans will become more detailed over time.
* Part of the decisions for designing an energy system have an integer nature, e.g. placing a source or options for a pipe size. These design choices cannot be modelled with continuous formulation in a representative manner.
* Due to the large number of uncertainties it is key to have the ability to iterate quickly over input data variations. The computational speed of the optimization is therefore of vital importance.
