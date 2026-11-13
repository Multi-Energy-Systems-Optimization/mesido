HT-ATES
--------------
High-temperature aquifer thermal energy storage (HT-ATES) is used to model underground heat storage doublets.

HT-ATES Asset Attributes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The following table provides an overview of the relevant attributes for this asset, including their configuration in the
front end and their interpretation and use by the optimizer.

.. list-table:: Asset Attributes
   :widths: 35 25 25 25 25 70
   :header-rows: 1

   * - ESDL attribute category
     - ESDL attribute
     - Definition
     - Units
     - Required/Optional
     - Optimizer use
   * - Basic attributes
     - Name
     - Asset unique name
     - \-
     - Required
     - \-
   * - Basic attributes
     - State
     - States if the asset is ENABLED or OPTIONAL
     - \-
     - Required
     - ENABLED:
       use the specific asset with all its specified attributes

       OPTIONAL:
       allows the optimizer to determine if the asset is required
       (if not then it will be removed from the network), else if the asset is
       required then it will be sized appropriately
   * - Basic attributes
     - Technical Lifetime
     - Operational lifetime of the asset (default=30, min=1, max=50)
     - Years
     - Optional
     - \-
   * - Basic attributes
     - Max Charge Rate
     - Maximum amount of heat that can be consumed.
     - W
     - Required
     - \-
   * - Basic attributes
     - Max Discharge Rate
     - Maximum amount of heat that can be delivered.
     - W
     - Required
     - \-
   * - Advanced attributes
     - Aggregation Count
     - Number of installed ATES doublets (default = 1)
     - \-
     - Required
     - By increasing this number one increases the number of installed ATES doublets.
   * - Advanced attributes
     - Discharge Efficiency
     - Efficiency of storing heat over a period of 100 days (default = 0.7, min=0, max=1)
     - \-
     - Optional
     - Discharge efficiency is used to calculate the heat loss coefficient.
   * - Ports
     - Inport and OutPort (1 off each)
     - The in port and the out port for the asset should be connected to 1

       hydraulically coupled network.

       Each port must have a carrier assigned to it.

       Port naming convention required: In & Out.
       :math:`\mathrm{T_{In} > T_{Out}}`
     - \-
     - Required
     - \-
   * - Cost Information
     - Investment Costs
     - CAPEX: Once-off cost linked to the size (charge/discharged heat flow) of the asset
     - EUR/MW or EUR/kW
     - Required
     - \-
   * - Cost Information
     - Installation Costs
     - CAPEX: Once-off cost
     - EUR
     - Required
     - \-
   * - Cost Information
     - Variable Operational Costs
     - OPEX: cost linked to heat produced over time
     - EUR/MWh
     - Required
     - \-
   * - Cost Information
     - Fixed Maintenance Costs
     - OPEX: Cost per year linked to the size (heat produced) of the asset
     - EUR/MW/yr or EUR/kW/yr
     - Optional
     - \-
   * - Cost Information
     - Fixed Operational Costs
     - OPEX: Cost per year linked to the size (heat produced) of the asset
     - EUR/MW/yr or EUR/kW/yr
     - Optional
     - \-

HT-ATES from EDR Assets
^^^^^^^^^^^^^^^^^^^^^^^
The Design Toolkit also provides access to predefined configurations of this asset type, with the required input
settings, including benchmark cost values, already assigned. More information on these configurations is available in
the `ESDL Energy Data Repository (EDR) <https://edr.hesi.energy/>`_.

* `ATES: HT-ATES <https://edr.hesi.energy/cat/Assets/%2Fedr%2FPublic%2FAssets%2FDistrict%20heating%20and%20cooling%20networks%2FHT-ATES.edd>`_

Constraints
^^^^^^^^^^^
No assets specific constraints are defined for HT-ATES.

Assumptions
^^^^^^^^^^^
* The temperature at the inport must be higher than the temperature at the outport (:math:`\mathrm{T_{In} > T_{Out}}`).
* The heat physics described for the storage and tank in :ref:`heat_physics_storage` and :ref:`heat_physics_storage_ates` sections applies to HT-ATES asset.
* Heat loss coefficient is the fraction of stored heat lost per second and calculated by :math:`\mathrm{\frac{1 - \eta^{1/100}}{3600.0 \times 24.0}\ s^{-1}}`, where :math:`\mathrm{\eta}` is the discharge efficiency. Default value of the heat loss coefficient is equivalent to losing 30% of the stored heat per 100 days.
