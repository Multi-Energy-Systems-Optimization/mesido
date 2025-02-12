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

Installation cost is part of the CAPEX and is the fixed amount of cost required to place :math:`\delta^{a}_{aggr\_count}` units (aggregation count) of the asset :math:`a`.
This cost component helps the optimizer make asset placement decisions when several equivalent asset options are available.

.. math::
    :label: eq:installation

    Cost_{installation} = C^{a}_{install} \delta^{a}_{aggr\_count}

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


.. _discounted-cost-section:

Discounted Costs Calculation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Discounted cost calculations account for the time value of money, which reflects the principle that money available today is worth more than the same amount in the future due to its potential earning capacity. Discounted costs are commonly used for evaluating investment decisions.

Since assets may have different depreciation periods, an Equivalent Annual Cost (EAC) provides a standardized comparison by converting the total cost of ownership to an annualized figure that accounts for both the time value of money and the different lifetimes of assets.

Assuming that the OPEX is already calculated on an annual basis, the annualized CAPEX is calculated using an EAC factor :math:`F_{a}`. This factor is computed as based on a discount rate (as an annual percentage) and the technical life (in years) of the asset, as follows:

.. math::

   F_{a} = 
   \begin{cases} 
   \frac{1}{n} & \text{if } r = 0 \\ 
   \frac{r}{1 - (1 + r)^{-n}} & \text{if } r > 0 
   \end{cases}

See this `link <https://www.investopedia.com/terms/e/eac.asp>`_ for more details.

This EAC factor, :math:`F_{a}`, is then applied to the asset's CAPEX to calculate the AEC of the initial investment or installation cost.

Note that the annual discount rate is a real number with a value between 0 and 1. For instance, a discount rate of 5% should be specified as 0.05. 
The technical life is a real number, and its value should be greater than 0. Both the discount rate and the technical life of assets can significantly affect the EAC of an asset, as shown below, where the inverse :math:`F_{a}` factor is plotted.
.. image:: /images/Discount_factor.png
