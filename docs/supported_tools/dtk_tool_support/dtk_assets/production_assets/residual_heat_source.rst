Residual Heat Source: Industrial Waste Heat
-------------------------------------------
Residual heat source is used to model residual heat production assets such as data centers or industry. It is used to transfer heat to heat network.

Residual Heat Source Asset Attributes
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The following table provides an overview of the relevant attributes for this asset, including their configuration in the
front end and their interpretation and use by the optimizer.

.. list-table:: Asset Attributes
   :widths: 35 25 60 25 25 70
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

       (if not then it will be removed from the network), else if

       the asset is required then it will be sized appropriately"

   * - Basic attributes
     - Technical Lifetime
     - Operational lifetime of the asset (default=30, min=1, max 50)
     - Years
     - Optional
     - Once-off costs occur once per lifetime span
   * - Basic attributes
     - Power
     - Size of the asset in heat producing capacity.

       Must be > 0.0
     - Watts
     - Required
     - \-

   * - Ports
     - Inport and OutPort (1 of each)
     - The in port and the out port for the asset should be connected to

       1 hydraulically coupled network.

       Each port must have a carrier assigned to it.

       Port naming convention required: In & Out.

       Required carrier temperatures are :math:`T_{Out} > T_{In}`
     - \-
     - Required
     - \-

   * - Cost Information
     - Investment Costs
     - CAPEX: Once-off cost linked to the size (secondary heat produced) of the asset
     - EUR/MW or

       EUR/kW
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
     - OPEX: cost linked to electrical power consumption over time of the asset
     - EUR/MWh
     - Required
     - \-
   * - Cost Information
     - Fixed Maintenance Costs
     - OPEX: Cost per year linked to the size (secondary heat produced)  of the asset
     - EUR/MW or EUR/MW/yr or

       EUR/kW or EUR/kW/yr
     - Optional
     - \-
   * - Cost Information
     - Fixed Operational Costs
     - OPEX: Cost per year linked to the size  (secondary heat produced)  of the asset
     - EUR/MW or EUR/MW/yr or

       EUR/kW or EUR/kW/yr
     - Optional
     - \-

Residual Heat Source from EDR Assets
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The Design Toolkit also provides access to predefined configurations of this asset type, with the required input
settings, including benchmark cost values, already assigned. More information on these configurations is available in
the `ESDL Energy Data Repository (EDR) <https://edr.hesi.energy/>`_.

* `ResidualHeatSource: Residual heat source T>80 <https://edr.hesi.energy/cat/Assets/%2Fedr%2FPublic%2FAssets%2FDistrict%20heating%20and%20cooling%20networks%2FResidual%20heat%20source%20T%3E80.edd>`_
* `ResidualHeatSource: Residual heat source T~45 <https://edr.hesi.energy/cat/Assets/%2Fedr%2FPublic%2FAssets%2FDistrict%20heating%20and%20cooling%20networks%2FResidual%20heat%20source%20T~45.edd>`_
* `ResidualHeatSource: Residual heat source T~25 <https://edr.hesi.energy/cat/Assets/%2Fedr%2FPublic%2FAssets%2FDistrict%20heating%20and%20cooling%20networks%2FResidual%20heat%20source%20T~25.edd>`_

Constraints
^^^^^^^^^^^
* Profile constraints:
    * Profile constraints includes a profile that defines the maximum heat production over time. The profile is defined as a time series of values that represent the maximum heat production at each time step.
    * If a profile constraint is defined while State attribute of residual heat source is set to "Optional", the optimizer will scale the profile given in the profile constraint with Power attribute value so that the resulting heat power produced by the asset does not exceed the scaled profile at any given time step.
    * If a profile constraint is defined while State attribute of residual heat source is set as "Enabled", the optimizer will ensure that the resulting heat power produced by the asset does not exceed the profile defined in the profile constraint at any given time step.
* Range constraints:
    * UPCOMING: Range constraints are not yet implemented for residual heat source asset.

Assumptions
^^^^^^^^^^
* The physics described for source assets in the :ref:`heat_physics_source` section applies to the residual heat source.