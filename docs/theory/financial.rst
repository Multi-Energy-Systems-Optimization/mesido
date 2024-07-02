.. _chp_financial:

Financial
=========

MESIDO offers the posibility to model the cost and revenues based on the design and operation of the energy system.
The asset cost modelling includes both the CAPEX and OPEX over the time-horizon of the optimization.

Asset Cost Modelling
--------------------

The asset cost modelling breaks down in four categories in which both the CAPEX and OPEX aspects are captured.
The four categories help the optimizer in making both continuous and integer sizing decisions.

Installation Cost
~~~~~~~~~~~~~~~~~

Installation cost is part of the CAPEX and is the fixed amount of cost required to place a(n) (aggregation count) of the asset.
This cost component helps the optimization to make decision in placing assets when multiple equivalent asset options are available.

.. math::
    :label: eq:installation

    Cost_{installation} = C^{a}_{install} \delta^{a}_{aggr,count}

Investment Cost
~~~~~~~~~~~~~~~

The investment cost is the CAPEX required that scales with the asset size.
The investment cost is the cost component that helps to find the minimum asset sizes.

.. math::
    :label: eq:invest

    Cost_{investment} = C^{a}_{invest} x^{a}_{max}


Variable Operational Cost
~~~~~~~~~~~~~~~~~~~~~~~~~

The variable operational cost is the cost component that depends on the usage of the asset over the time horizon.
Typically this is a power consumption or production, which is represented by :math:`x^{a}_{use}`.

.. math::
    :label: eq:varopex

    Cost_{variable_{OPEX}} = \sum_{K} C^{a}_{variable_{OPEX}} x^{a}_{use} \Delta T_K


Fixed Operational Cost
~~~~~~~~~~~~~~~~~~~~~~

The fixed operational cost is the cost component that returns every X time (typically every calendar year) based on the size of the asset.

.. math::
    :label: eq:fixedopex

    Cost_{fixed_{OPEX}} = C^{a}_{fixed_{OPEX}} x^{a}_{max}
