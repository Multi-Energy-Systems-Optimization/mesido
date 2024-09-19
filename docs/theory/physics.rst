.. _chp_physics:

Physics
=======

Within MESIDO the physics are approximated utilizing the mixed integer linear constraints.
The goal within MESIDO is to approximate the physics in such a way such that the approximation errors result in conservative estimates of the financial aspects of the system, e.g. overestimating cost and underestimating revenue.
To cater for different design phases different approximation fidelities can be configuration in MESIDO.
Examples include the approximation of head loss which can be ignored or approximated with multiple linear constraints.
MESIDO allows for the integral optimization of energy systems having:

* A heat commodity (closed loop district heating networks where water is used as the medium)
* A gaseous commodity where pipes transport the gas.
* Electricity commodity where cables transport the energy

There are documentation pages for the three respective commodities and the physics that are modelled for each.
This page will focus on the assets, physics and other functionality that involves multiple commodities.

Multi-Commodity Asset Physics
-----------------------------

Electrolyzer
~~~~~~~~~~~~


Water-water Heat Pump Electrical
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



Air-water Heat Pump Electrical
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


Electrical Boiler
~~~~~~~~~~~~~~~~~


Gas Boiler
~~~~~~~~~~


Setpoint Constraints
~~~~~~~~~~~~~~~~~~~~

