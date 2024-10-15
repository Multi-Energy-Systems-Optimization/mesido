.. _chp_asset_sizing:

Asset Sizing
============

MESIDO supports both the placing and sizing decisions.
Where placement is the integer decision if an optional location is selected or not.
The integer for whether or not an asset is placed is governed based on whether or not power is exchanged between the asset and other assets over the time horizon, see:

.. math::
    :label: eq:max_placed_power

    \dot{Q}^{a}_{max}-q^{a}_{max}\delta^{a}_{placed} \leq 0 \;\;

.. math::
    :label: eq:min_placed_power

    -\dot{Q}^{a}_{max}-q^{a}_{min}\delta^{a}_{placed} \leq 0 \;\;

.. math::
    :label: eq:placement_variable

    \delta^{a}_{placed} \in \{0,1\} \;\;

Where :math:`(q^{a}_{min}, q^{a}_{max})` are the lower and upper bounds of the power.

For the sizing MESIDO supports three general methods, which can be applied to different assets depending on the physics.

Continious Sizing
-----------------

If an asset is continuously sized then the max size variable, :math:`x^{a}_{max}`, must be larger than the state, :math:`x^{a}`, (e.g. power) for every time step.

.. math::
    :label: eq:limit_power_ates

    -x^{a}_{max}\leq x^{a} \leq x^{a}_{max}

Sizing With Aggregation
-----------------------

If an asset is sized based on its aggregation count, then the max size variable, :math:`x^{a}_{max}`,
will be bounded based on the amount of aggregations that exist for that asset.
Examples include the sizing of geothermal sources by their amount of wells, with the power per well.

.. math::
    :label: eq:aggregationcount

    x^{a} \leq \delta^{a}_{aggr,count} X^{a}_{single,max}

Sizing With Integer Modelling
-----------------------------

The integer method can be used if the size of the asset is determined by a number of predefined sizes, :math:`\delta_{j,a}`.
Of all the availabe options a single option should be selected.

.. math::
    :label: eq:pipe_size_selection

    \sum_{j\in S^{a}}  \delta_{j,a} = 1 \;\;

where:

.. math::
    :label: eq:pipe_size_variable

    \delta_{j,a} \in \{0,1\} \;\; \forall j \in S^{a}

The sizing integer can then be used to limit the max size variable, e.g. max flow for a pipe.

.. math::
    :label: eq:flow_restric_pipe

    x^{a}_{max} - \sum_{j\in S^{a}} \bar{e_j}\delta_{j,a} \leq 0 \;\;

where :math:`\bar{e_j}` denotes the max value for the state at that sizing option.

Asset sizing methods employed
-----------------------------

.. list-table:: Asset Sizing Model
   :widths: 25 25 25 25 50
   :header-rows: 1

   * - Asset
     - Sizing Constraints type
     - Max Size variable
     - Unit
     - Notes
   * - Heat source
     - Continuous
     - Max thermal power produced
     - Watt
     - ~
   * - Heat demand
     - Continuous
     - Max thermal power consumed
     - Watt
     - ~
   * - Heat storage: Tank
     - Continuous
     - tank size
     - m3
     - ~
   * - Heat Storage: HT-ATES
     - Aggregation Count
     - Max thermal power produced
     - [-]
     - ~
   * - Geothermal (extension source)
     - Aggregation Count
     - Max thermal power produced
     - [-]
     - ~
   * - Heat Exchanger
     - Continuous
     - Max thermal Secondary Power
     - Watt
     - ~
   * - Heat Pump
     - Continuous
     - Max thermal Secondary Power
     - Watt
     - ~
   * - Heat Exchanger
     - Continuous
     - Max thermal Secondary Power
     - Watt
     - ~
   * - Heat/Gas Pipe
     - Integer
     - Diameter
     - [-]
     - Constraints on max flow and insulation materials.
   * - Electricity source
     - Continuous
     - Max electrical power produced
     - Watt
     - ~
   * - Electricity demand
     - Continuous
     - Max electrical power consumed
     - Watt
     - ~
   * - Gas source
     - Continuous
     - Max max flow produced
     - Watt
     - ~
   * - Gas demand
     - Continuous
     - Max mass flow consumed
     - Watt
     - ~
