DTK Assets
==========

Energy assets can be subdivided into 5 different types, the so called ESDL capabilities.

The following table shows some examples of each capability with its icon:

.. |icon_heat_producer| image:: images_dtk_assets/asset_icon_HeatProducer.png
   :width: 24px

.. |icon_geothermal_source| image:: images_dtk_assets/asset_icon_GeothermalSource.png
   :width: 24px

.. |icon_residual_heat_source| image:: images_dtk_assets/asset_icon_ResidualHeatSource.png
   :width: 24px

.. |icon_heating_demand| image:: images_dtk_assets/asset_icon_HeatingDemand.png
   :width: 24px

.. |icon_heat_pump| image:: images_dtk_assets/asset_icon_HeatPump.png
   :width: 24px

.. |icon_gas_heater| image:: images_dtk_assets/asset_icon_GasHeater.png
   :width: 24px

.. |icon_electric_boiler| image:: images_dtk_assets/asset_icon_ElectricBoiler.png
   :width: 24px

.. |icon_heat_storage| image:: images_dtk_assets/asset_icon_HeatStorage.png
   :width: 24px

.. |icon_ates| image:: images_dtk_assets/asset_icon_HT-ATES.png
   :width: 24px

.. |icon_heat_exchange| image:: images_dtk_assets/asset_icon_HeatExchange.png
   :width: 24px

.. |icon_pipe| image:: images_dtk_assets/asset_icon_Pipe.png
   :width: 24px

.. list-table:: DTK Supported Asset Icons
   :widths: 2 1 20
   :header-rows: 1

   * - ESDL Asset Types
     - Example Icons
     - ESDL Asset Class
   * - Producer
     - |icon_geothermal_source| |icon_residual_heat_source| |icon_heat_producer|
     - GeothermalSource, ResidualHeatSource, HeatProducer
   * - Consumer
     - |icon_heating_demand|
     - HeatingDemand
   * - Conversion
     - |icon_heat_pump| |icon_gas_heater| |icon_electric_boiler|
     - HeatPump, GasHeater, ElectricBoiler
   * - Storage
     - |icon_heat_storage| |icon_ates|
     - HeatStorage, HT-ATES
   * - Transport
     - |icon_heat_exchange| |icon_pipe|
     - HeatExchange, Pipe


The following sections provide an overview of all assets supported by DTK, grouped according to their ESDL capability.

.. toctree::
   :maxdepth: 2

   conversion_assets/conversion_index
   production_assets/production_index
   consumer_assets/consumer_index
   storage_assets/storage_index
   transport_assets/transport_index