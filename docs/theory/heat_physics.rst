.. _chp_heat_physics:

Heat Physics
============

MESIDO models thermal power (:math:`\dot{Q}`), volumetric flow (:math:`\dot{V}`), and head (:math:`H`) for DHS systems.
These variables are modelled over all timesteps :math:`K` and for each asset in the system :math:`A`.
An asset :math:`a \in A` in the system is modelled using a set of in-ports, denoted by :math:`I^a_{in} \neq \emptyset`, and a set of out-ports, denoted by :math:`I^a_{out} \neq \emptyset`, with :math:`I^a` denoting the union of these two sets.
For an asset :math:`a` the three variables :math:`\dot{Q}_i, \dot{V}_i`, and :math:`H_i` denote the thermal power, volumetric flow and head for port :math:`i \in I^a`. For readability, the variables and equations of the model, given below, are defined without indexing the variables and sets for each timestep.
The equations below are assumed to hold for every timestep, unless otherwise specified.

Modelling specifically these three variables allows to ensure a hydraulically feasible solution whilst linearizing the physics.
Energy changes are modelled with the assumption of a constant temperature throughout the network.
Although this assumption is not realistic, the linearizations made will show that the effects of these assumptions are relatively small and conservative to the objective function outcome.

General Physics
---------------

The DHS is modelled as a closed loop system and thus at every timestep and for every asset, mass balance should hold.
The system is modelled with constant temperature and thus constant density and specific heat.
The mass balance is provided as a volumetric flow balance in :eq:`eq:flow_balance`.

.. math::
    :label: eq:flow_balance

    \sum_{i \in I^a} \dot{V}_{i} = 0 \;\; \forall a \in A


The energy balance is guaranteed by :eq:`eq:general_energy_balance`.

.. math::
    :label: eq:general_energy_balance

    \sum_{i \in I} \dot{Q}_i + \dot{Q}^a_{consumed} = 0 \;\; \forall a \in A

:math:`\dot{Q}^a_{consumed}` is the thermal power consumed by asset :math:`a`.
The power losses for the asset are included in this variable. 

Network Physics
---------------

Pipe
~~~~
The main function of a pipe is to transport thermal power.
It loses part of this thermal power to the surroundings as the ambient temperature is lower, thus :math:`\dot{Q}^a_{consumed}` equals the (negative) losses incurred in the pipe in :eq:`eq:general_energy_balance`.

The thermal power losses are approximated with :eq:`eq:heat_loss`, utilizing the Bohm model, :cite:`bohm`.

.. math::
    :label: eq:heat_loss

    \dot{Q}^a_{consumed} = L^a( (U_2 - U_1)T_{amb} + U_1 T_{sup} - U_2 T_{ret})\delta^a_{discon} \forall a \in A_{pipes}

where

.. math::
    :label: eq:pipe_heat_loss_U1

    U_1 = \frac{R_{subsoil} + R_{ins}}{(R_{subsoil} + R_{ins})^2 - R_{neighbour}^2}

.. math::
    :label: eq:pipe_heat_loss_U2

    U_2 = \frac{R_{neighbour}}{(R_{subsoil} + R_{ins})^2 - R_{neighbour}^2}

.. math::
    :label: eq:pipe_heat_loss_Rins

    R_{ins} = \sum_i \frac{ln(\frac{d^a_{outer}}{d^a_{inner}})}{2\pi k}

.. math::
    :label: eq:pipe_heat_loss_Rneigh

    R_{neighbour} = \frac{ln(1 + (2H/2d^a_{outer})^2)}{4 \pi k_{subsoil}},

.. math::

    R_{subsoil} = \frac{ln(\frac{4H}{d^a_{outer}})}{2 \pi k_{subsoil} }.

.. math::

    \delta^a_{discon} \in \{0, 1\} \;\; \forall a \in A_{pipes}

:math:`T_{sup}, T_{ret}`, and :math:`T_{amb}` represent the supply, return and ambient temperatures.
:math:`A_{pipes}` define the set of pipes with :math:`L^a` being the length of pipe :math:`a`.
:math:`\delta^a_{discon}` is a boolean variable to model if pipe :math:`a` is in use for a specific timestep.
:math:`d^a_{inner}` and :math:`d^a_{outer}` are the inner and outer diameters of pipe :math:`a` and :math:`k_{subsoil}` is a constant used to model the resistance of the subsoil.
:math:`\delta^a_{discon}` is modelled by:

.. math::

    \dot{Q}_{i} + \delta_{discon}M \geq 0 \;\; \forall i \in I^{a} \;\; \forall a \in A_{pipes},

.. math::

    \dot{Q}_{i} - \delta_{discon}M \leq 0 \;\; \forall i \in I^a \;\; \forall a \in A_{pipes}.

Here :math:`M` is a sufficiently large constant used in a method called the big-M method :cite:`vielma2015mixed` to enable or disable a constraint.

The thermal power loss is assumed to be constant as the pipe temperature is assumed to be constant.
The outgoing temperatures at the assets (e.g. supply at the source and return at the demand) are used to ensure an overestimation of the thermal loss. In reality the temperature w.r.t. the ambient decreases as the temperature drops over the pipe with the energy loss.

Typical temperature drops in the primary network are up to 3 degrees, this implies that for medium temperature networks, operating at 75°C and with an ambient of 15°C, the error for the heat loss estimation is less than :math:`\frac{3}{75-15} \approx 5\%`.

Inequality constraints are used to relate the volumetric flow :math:`\dot{V}` and the heat flow :math:`\dot{Q}` through pipes as a compensation of heat losses is required.
Please note that the :math:`\dot{V}` and the heat flow :math:`\dot{Q}` will be related by equality constraints for the outgoing flow at the assets, ensuring that the thermal power propagates correctly through the network.

.. math::
    :label: eq:pipe_heat2discharge1

    \dot{Q}_{i} - c_p \rho T^a \dot{V} - (1 - \delta^a_{dir})M \leq 0  \;\; \forall i \in I^a \;\; \forall a \in A_{pipes},

.. math::
    :label: eq:pipe_heat2discharge2

    \dot{Q}_{i} - c_p \rho T^{a} \dot{V} + \delta^a_{dir}M \geq 0 \;\; \forall i \in I^a
    \;\; \forall a \in A_{pipes},

.. math::
    :label: eq:pipe_flow_dir

    \delta^a_{dir} \in \{ 0, 1 \} \;\; \forall a \in A_{pipes}.

Here :math:`T^a` is the temperature inside pipe :math:`a`, :math:`c_p` and :math:`\rho` are the specific heat capacity and density of water and :math:`M` is a sufficiently large constant number.
:math:`\delta^a_{dir}` is the variable for  flow direction in the pipe, where a value of :math:`1` indicates a positive flow (from in-port to out-port). This is modelled using:

.. math::
    :label: eq:flowdir1

    \dot{Q}^a_{i} - \delta^a_{dir}M \leq 0 \;\; \forall i \in I^a \;\; \forall a \in A_{pipes},

.. math::
    :label: eq:flowdir2

    \dot{Q}_{i} + (1 - \delta_{dir})M \geq 0 \;\; \forall i \in I^{a} \;\; \forall a \in A_{pipes}.

The head loss, :math:`dH` must be compensated by pumps which are assumed to be located at sources and storage assets:

.. math::
    :label: eq:pipe_head

    H^a_{in} - dH = H^a_{out} \;\; \forall a \in A_{pipes}.

Steady-state head losses can be closely modelled with a quadratic relation w.r.t. :math:`\dot{V}`.
A set of linear inequalities is used, see :numref:`inequalitydH`, to approximate the quadratic curve.
The general form of the inequalities is given below in :eq:`eq:pipe_head_loss1`-:eq:`eq:pipe_head_loss2`. Note that the big M method is used with the flow direction and disconnected integers to allow for modelling of bi-directional flow and the ability to disconnect pipes.

.. math::
    :label: eq:pipe_head_loss1

    dH - (\alpha_j \dot{V} + \beta_j) + (\delta^a_{discon} + \delta^a_{dir})M\geq 0 \\ \forall (\alpha_j, \beta_j) \;\; \forall a \in A_{pipes},

.. math::
    :label: eq:pipe_head_loss2

    dH + (\alpha_j\dot{V} + \beta_j) - (\delta^a_{discon} + (1-\delta^a_{dir}))M\leq 0 \\  \forall (\alpha_j, \beta_j) \;\; \forall a \in A_{pipes}.

Where :math:`(\alpha_j, \beta_j)` are the coefficients and constants of the linear equations used to approximate the quadratic equation.

These inequalities force the head loss to be greater or equal to the approximated quadratic curve.
Although the constraints by themselves will not guarantee a physically feasible answer, the optimization will in drag the solution to an equality constraint as the objective function will minimize cost which reduces with lower pressure drop.

.. _inequalitydH:

.. figure:: ../images/linearlines.png
    :figwidth: 6.94792in
    :align: center

    Schematic visualization of how the linear constraints are fitted to the head loss curve.

Furthermore, this head loss approximation has been validated against pandapipes as shown in :numref:`validation1dH`. This validation work has also been incorprated into a test case, for more information see the test folder.

.. _validation1dH:

.. figure:: ../images/dH_MESIDO_10_vs_pandapipes.png
    :figwidth: 6.94792in
    :align: center

    Head loss approximation with 10 linear lines against pandapipes.  

Similar as with head loss the hydraulic power, :math:`HP^a`, required to overcome the head losses is modelled with a set of linear inequalities:

.. math::
    :label: eq:pipe_hp1

    HP^a - (c_j\dot{V} + d_j)  + (\delta^a_{discon} + 1-\delta^a_{dir})M \geq 0 \\
    \forall (c_j, d_j) \;\; \forall a \in A_{pipes},

.. math::
    :label: eq:pipe_hp2

    HP^a - (c_j\dot{V} + d_j)  - (\delta_{discon}(k) - 1-\delta_{dir})M\geq 0 \\
    \forall (c_j, d_j) \;\; \forall a \in A_{pipes}.

Here :math:`(c_j, d_j)` are the coefficients and constants of the linear equations used to approximate the quadratic equation.

The method with linear inequalities, as represented above, is only valid when each possible unique flow path route in the network has a control valve to compensate non-physical head loss induced by the optimizer. Alternatively a (piece-wise) linear equality constraint between min and max flow rate can be configured for cases where this assumption is invalid, with the general form represented by :eq:`eq:pipe_head_loss3`-:eq:`eq:pipe_head_loss6`.

.. math::
    :label: eq:pipe_head_loss3

    dH - (\alpha_j \dot{V} + \beta_j) + (\delta^a_{discon} + \delta^a_{dir} + (1 - \delta^a_{line\_seg_{k}}))M\geq 0 \\ \delta^a_{line\_seg_{k}} \in \{ 0, 1 \}, (\alpha_j, \beta_j) \;\; \forall a \in A_{pipes},

.. math::
    :label: eq:pipe_head_loss4

    dH - (\alpha_j\dot{V} + \beta_j) - (\delta^a_{discon} + \delta^a_{dir} + (1 - \delta^a_{line\_seg_{k}}))M\leq 0 \\  \delta^a_{line\_seg_{k}} \in \{ 0, 1 \}, (\alpha_j, \beta_j) \;\; \forall a \in A_{pipes},

.. math::
    :label: eq:pipe_head_loss5

    dH + (\alpha_j \dot{V} + \beta_j) - (\delta^a_{discon} + (1 - \delta^a_{dir}) + (1 - \delta^a_{line\_seg_{k}}))M\leq 0 \\ \delta^a_{line\_seg_{k}} \in \{ 0, 1 \}, (\alpha_j, \beta_j) \;\; \forall a \in A_{pipes},

.. math::
    :label: eq:pipe_head_loss6

    dH + (\alpha_j\dot{V} + \beta_j) + (\delta^a_{discon} + (1-\delta^a_{dir}) + (1 - \delta^a_{line\_seg_{k}}))M\geq 0 \\  \delta^a_{line\_seg_{k}} \in \{ 0, 1 \}, (\alpha_j, \beta_j) \;\; \forall a \in A_{pipes}.

Where :math:`(\alpha_j, \beta_j)` are the coefficients and constants of the linear equations used to approximate the quadratic equation. Variable :math:`\delta^a_{line\_seg_{k}}` reperesents an integer, for pipe :math:`a`, value indicating if a linear line segment :math:`k` is active (value = 1) or not (value = 0). This would imply that if a quadratic curve is represented by 3 linear lines for instance, then only 1 of the linear lines are appplicable at a specific timestep.    


Node
~~~~

The node conserves the flow with :eq:`eq:flow_balance` and the energy with :eq:`eq:general_energy_balance`.

The head of all pipes connected to the node must be equal to ensure a hydraulically feasible solution:

.. math::
    :label: eq:node_head

    H_i = H^a \;\; \forall i \in I^a \;\; a \in A_{nodes},

where :math:`A_{nodes}` is the set of all nodes and :math:`H^a` is the headloss for node :math:`a`.

Asset Physics
-------------

Source
~~~~~~

The source adds thermal power to the network.
The energy balance is given by :eq:`eq:general_energy_balance` where :math:`\dot{Q}^a_{consumed}` is equal to the (negative) value of the produced heat.

The addition of energy is executed by increasing the temperature of the incoming water (the return network) to the outgoing supply temperature.
Therefore, the volumetric flow rate is linked to the outgoing thermal power with the outgoing supply temperature with equality constraints:


.. math::
    :label: eq:source_heat2discharge

    \sum_{i \in I^a_{out}} \dot{Q}^a_i = c_p \rho \dot{V}^a T_{sup} \;\; \forall a \in A_{prod},

where :math:`A_{prod}` is the set of all producers.

The equality constraints ensure that the thermal power equals what can be physically transported by the flow.
No constraints are set on the returning flow at the in port, as this is already implied by the constraints on pipes.

The modelling errors from not modelling temperature are present in various parts of the costs.
The heat losses will be overestimated giving an overestimate w.r.t. the cost of the thermal energy produced.
The overestimation of the thermal power required will induce an overestimation of the flow and thereby of the transportation and pipe sizing.

The source is assumed to act within one hydraulically coupled network, :eq:`eq:flow_balance`.

A source is modelled with a pump to reach its desired flow rate and head:

.. math::
    :label: eq:source_pump_dh

    H^a_{in} + dH_{pump} = H^a_{out} \;\; \forall a \in A_{prod}.

Demand
~~~~~~

A demand extracts thermal power from the network, defined by :eq:`eq:general_energy_balance` where :math:`\dot{Q}^a_{consumed}` is the consumed thermal power.

Similar to the source, no constraints are required at the in-going supply side of the demand, and
an equality constraint relates outgoing thermal power with volumetric flow:

.. math::
    :label: eq:consumer_heat2discharge

    \sum_{i \in I^a_{out}} \dot{Q}^a_i = c_p \rho \dot{V}^a T_{ret} \;\; \forall a \in A_{demand},

where :math:`A_{demand}` is the set of demand assets.

The combination of constraints at the producers and demands, results in a smaller achieved temperature difference at the demand than the difference between the given temperatures for the supply and return side, and a larger achieved temperature difference at the producer due to pipe heat losses.

Similar as for the source, the demand acts within one hydraulically coupled system under the same assumptions, see :eq:`eq:flow_balance`.

Every demand is modelled with a control valve to regulate its flow. In reality a minimum head loss is often maintained:

.. math::
    :label: eq:demand_head

    H^a_{in} - dH_{valve} = H^a_{out} \;\; \forall a \in A_{demand}.

Storage
~~~~~~~

Storage assets add time flexibility with the production and consumption of thermal power. For shorter intra-day periods this capability is provided by tanks, alternatively storage over seasons is done with underground thermal energy storage like HT-ATES, :cite:`drijver2019state`.

:math:`\dot{Q}^{a}_{consumed}` can be defined by the thermal power substracted from or added to the network, where the internal losses of the storage are subtracted:

.. math::
    :label: eq:change_stored_heat

    \dot{Q}^{a}_{consumed} =  \sum_{i \in I^a_{in}} \dot{Q}^{a}_{i} -  \sum_{i \in I^a_{out}} \dot{Q}^{a}_{i} - \dot{Q}^{a}_{loss} \;\; \forall a \in A_{storage}.

The consumed heat of the storage assets is equated to the change in stored heat, :math:`\dot{Q}^{a}_{stored}`:

.. math::
    :label: eq:stored_heat

    \dot{Q}^{a}_{consumed} = \dot{Q}^{a}_{stored} \;\; \forall a \in A_{storage}

Like the source and demand assets, the storage needs equality constraints relating the outgoing flow to the thermal power.
Unlike the demand and source the outgoing flow can be either on the in or out port depending whether the storage is charging or discharging.
The default convention is that charging indicates positive flow, therefore :math:`\delta_{dir}` can be used as an integer for charging/discharging.
Equations :eq:`eq:storage_heat2discharge1` and :eq:`eq:storage_heat2discharge2` are active during charging, and during discharging,
:eq:`eq:storage_heat2discharge3` and :eq:`eq:storage_heat2discharge4` are activated by the big M method.

.. math::
    :label: eq:storage_heat2discharge1

     \sum_{i \in I^a_{in}} \dot{Q}^{a}_{i} - c_p \rho \dot{V}^{a} T_{sup} \leq 0 \;\; \forall a \in A_{storage}

.. math::
    :label: eq:storage_heat2discharge2

     \sum_{i \in I^a_{in}} \dot{Q}^{a}_{i} - c_p \rho \dot{V}^{a} T_{sup} + \delta^{a}_{dir} M \geq 0 \;\; \forall a \in A_{storage}

.. math::
    :label: eq:storage_heat2discharge3

     \sum_{i \in I^a_{out}} \dot{Q}^{a}_{i} - c_p \rho \dot{V}^{a} T_{ret} \geq 0 \;\; \forall a \in A_{storage}

.. math::
    :label: eq:storage_heat2discharge4

     \sum_{i \in I^a_{out}} \dot{Q}^{a}_{i} - c_p \rho \dot{V}^{a} T_{ret} - (1-\delta^{a}_{dir}) M \leq 0 \;\; \forall a \in A_{storage}

Tank
^^^^

Heat loss in a tank is modelled as linear with the stored heat:

.. math::
    :label: eq:storage_loss

    \dot{Q}^{a}_{loss} = \beta^{a} Q^{a}_{stored} \;\; \forall a \in A_{storage},

where :math:`Q^{a}_{stored}` is the heat stored in the storage asset and :math:`\beta` is the efficiency factor.

The efficiency factor is approximated assuming that tanks are cylindrical and lose heat over their surface area, see :eq:`eq:etatank`.
For cylindrical tanks their surface area approximately increases linearly with the stored heat.
A radiation coefficient, :math:`c_r`, of 1 :math:`W/m^2` is used as an approximation.

HT-ATES
^^^^^^^

Two HT-ATES modelling methods are available. The first approximation for heat loss is based on an efficiency that is reached in a period of time. In this research a value of 70\% over 100 days is used.

.. math::

    \beta_{HTATES} = \eta^{\frac{1}{time}}

The second method: COMING SOON...


Similarly as for the other assets, the storage assets are assumed to act within the hydraulically coupled system;
nonetheless, the volumetric flow balance requires additional equations.
The storage is modelled as an asset with a hot and cold volume.
The total volume will be conserved by the in- and outflow at the storage.

.. math::
    :label: eq:storage_volume_constant

    \dot{V}^{a}_{warm}-\dot{V}^{a}_{cold}=0 \;\; \forall a \in A_{storage},

where :math:`\dot{V}^{a}_{warm}` and :math:`\dot{V}^{a}_{cold}`, respectively denote the change in the hot and cold volume.
The warm volume will increase and decrease with the volumetric flow passing the storage:

.. math::
    :label: eq:storage_volume_change

    \dot{V}^{a}-\dot{V}^{a}_{warm}=0 \;\; \forall a \in A_{storage}.

The storage assets are assumed to have both a pump and a valve, as they fulfill both the source and demand role:

.. math::
    :label: eq:source_pump

    H^{a}_{in} + dH^{a}_{pump} - dH^{a}_{valve} = H^{a}_{out} \;\; \forall a \in A_{storage},



