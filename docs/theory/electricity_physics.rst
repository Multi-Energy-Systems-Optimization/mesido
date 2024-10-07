.. _chp_electricity_physics:

Electricity Physics
===================

MESIDO models the electric power (:math:`\dot{P}`), the voltage (:math:`V`) and the current
(:math:`I`).
These variables are modelled over all timesteps :math:`K` and for each asset in the system
:math:`A`.
An asset :math:`a \in A` in the system is modelled using a set of in-ports, denoted by
:math:`I^a_{in} \neq \emptyset`, and a set of out-ports, denoted by
:math:`I^a_{out} \neq \emptyset`, with :math:`I^a` denoting the union of these two sets.
For an asset :math:`a` the variables :math:`\dot{P}_i, V_i` and
:math:`I_i` denote the electrical power, voltage and current for port :math:`i \in I^a`.
For readability, the variables and equations of the model, given below, are defined without
indexing the variables and sets for each timestep.
The equations below are assumed to hold for every timestep, unless otherwise specified.

By modelling these variables the electrical power system can be approximated.

General Physics
---------------

For all assets energy conservation should be guaranteed.

.. math::
    :label: eq:Q_balance

    \sum_{i \in I} \dot{P}_i + \dot{P}^a_{consumed} = 0 \;\; \forall a \in A

Where :math:`\dot{P}^a_{consumed}` is the electrical power consumed by asset :math:`a`.

Network Physics
---------------

Electricity Cable
~~~~~~~~~~~~~~~~~

The main function of an electricity cable is to transport electrical power over the network.
Whilst doing so the cable dissepates part of this energy due to the resistance of the cable.
Within MESIDO the user can select whether or not to model this power loss (energy_system_options -> include_electric_cable_power_loss). When power loss is included it is represented with a DC (direct current) approximation as follows.

.. math::
    :label: eq:V_drop

    V^a_{out} = V^a_{in} - r^a I \;\; \forall a \in A_{cables}

.. math::
    :label: eq:P_drop

    P^a_{out} = P^a_{in} - r^a I^a_{max} I^a \;\; \forall a \in A_{cables}

Where :math:`r^a` denotes the resistance of the cable and :math:`I_{max}` denotes the max current
of the cable. The linearization of the power loss is done using the max current to ensure a
conservative approximation of the power throughout the network.

Bus
~~~

A bus is a point in the network where multiple electricity cables come together to ensure an
electrically feasible solution. The voltages of all these ports should be equal (similar with head at a node).

.. math::
    :label: eq:bus_V

    V_i = V^a \;\; \forall i \in I^a \;\; a \in A_{busses}


Asset Physics
-------------

Electricity Source
~~~~~~~~~~~~~~~~~~

The function of an electricity source is to add electrical power to the network.
The power balance is given by :eq:`eq:Q_balance` where :math:`\dot{P}_{consumed}` is equal to the
(negative) produced power of the source.

Electricity Demand
~~~~~~~~~~~~~~~~~~

The function of an electricity demand is to subtract electrical power from the network.
The power balance is given by :eq:`eq:Q_balance` where :math:`\dot{P}_{consumed}` is equal to the
consumed power of the demand.

Furthermore, demands typically consume their power at a prescribed voltage.

.. math::
    :label: eq:V_min

    V^a_i = V_min \;\; \forall i \in I^a \;\; a \in A_{electricity demands}

Electricity storage
~~~~~~~~~~~~~~~~~~~

Storage assets add time flexibility with the production and consumption of electrical power.
Batteries are typically used for the storage of electrical energy.

:math:`\dot{P}^{a}_{consumed}` can be defined by the electical power substracted from or added to the
network, where the internal losses of the storage are subtracted:

.. math::
    :label: eq:change_stored_gas

    \dot{P}^{a}_{consumed} =  \sum_{i \in I^a_{in}} \dot{P}^{a}_{i} -  \sum_{i \in I^a_{out}} \dot{P}^{a}_{i} - \dot{P}^{a}_{loss} \;\; \forall a \in A_{storage}.

The consumed power of the storage assets is equated to the change in stored energy, :math:`\dot{P}^{a}_{stored}`:

.. math::
    :label: eq:stored_gas

    \dot{P}^{a}_{consumed} = \dot{P}^{a}_{stored} \;\; \forall a \in A_{storage}

Upcoming: ADD THE ENERGY LOSS MODEL

