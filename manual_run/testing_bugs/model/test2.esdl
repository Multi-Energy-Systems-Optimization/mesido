<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="199d1251-4bce-4931-b4f0-dba819e3bbba_with_return_network" description="" esdlVersion="v2401" name="Untitled EnergySystem with return network" version="1">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="7ba6b34a-b453-4823-9434-8904d2d68a7f">
    <carriers xsi:type="esdl:Carriers" id="29170a0c-e188-4979-b5bd-b734507756e4">
      <carrier xsi:type="esdl:HeatCommodity" name="HeatSupply" supplyTemperature="80.0" id="45ff4aee-c932-4363-8e21-4e0fa0ef047e"/>
      <carrier xsi:type="esdl:HeatCommodity" name="HeatReturn" returnTemperature="40.0" id="45ff4aee-c932-4363-8e21-4e0fa0ef047e_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="e7b624d1-ca0a-4b98-923c-fe4ed0953190">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" multiplier="MEGA" physicalQuantity="POWER" description="Power in MW" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="9c811ad9-a694-42de-b249-11c491af8594" name="Untitled Instance">
    <area xsi:type="esdl:Area" name="Untitled Area" id="2ad93526-beaf-499c-8a56-11c669db87c6">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_3f64" power="20000000.0" id="3f64a08f-0198-4102-846a-40cfa5ffade6">
        <port xsi:type="esdl:InPort" name="In" connectedTo="54c90364-5fee-4f85-b603-ec57a18035cb" id="24fc5f49-cbbd-4801-8284-2e8b97d8200c" carrier="45ff4aee-c932-4363-8e21-4e0fa0ef047e">
          <profile xsi:type="esdl:InfluxDBProfile" host="http://influxdb" filters="" startDate="2018-12-31T23:00:00.000000+0000" id="51bac1ba-4cc6-4c32-bafa-b53dcb9f64fb" database="energy_profiles" measurement="Unittests profiledata" field="demand3_MW" endDate="2019-12-31T22:00:00.000000+0000" multiplier="10.0" port="8086">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="8f00da6a-a92a-49de-90dd-3b4dfe903c89" id="3548d754-5cb9-473a-80d4-b75d7af21825" carrier="45ff4aee-c932-4363-8e21-4e0fa0ef047e_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.535910882491767" lat="51.98058502493348" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" name="ResidualHeatSource_7594" id="75944723-e861-4c93-8d54-016d075bd2df" power="20000000.0">
        <costInformation xsi:type="esdl:CostInformation" id="39244ebd-6c58-45bb-9f7d-43570f6cd350">
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="20.0" id="ebbf291c-6965-4d41-b328-567d2bcf1968">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" physicalQuantity="COST" perMultiplier="MEGA" description="Cost in EUR/MWh" id="10d2bbe3-2a6a-4fea-83a4-8bfca5ff3a23" unit="EURO"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="34c3ff46-1b42-46ef-9e31-88d8d604c1e9" id="21f1d386-89ab-4a08-a2b9-ef14428983fc" carrier="45ff4aee-c932-4363-8e21-4e0fa0ef047e"/>
        <port xsi:type="esdl:InPort" name="In" connectedTo="a2ab0baa-504f-45cc-991a-bdbcb88924ab" id="a512b2dc-9790-4061-9681-ad17f91d9e21" carrier="45ff4aee-c932-4363-8e21-4e0fa0ef047e_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.594953164860081" lat="51.989889178462086" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="4173.5" innerDiameter="0.4954" name="Pipe1" related="Pipe1_ret" outerDiameter="0.71" id="Pipe1" diameter="DN500">
        <costInformation xsi:type="esdl:CostInformation" id="d1043b1c-bb4b-4a7a-8f67-b6e8bdfe8bc1">
          <investmentCosts xsi:type="esdl:SingleValue" value="4112.5" name="Combined investment and installation costs" id="63ee766d-d385-4d4d-b2c6-dc22d89cbca6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b2d624e0-37b0-46ea-99d5-ce42c47038f1" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="21f1d386-89ab-4a08-a2b9-ef14428983fc" id="34c3ff46-1b42-46ef-9e31-88d8d604c1e9" carrier="45ff4aee-c932-4363-8e21-4e0fa0ef047e"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="24fc5f49-cbbd-4801-8284-2e8b97d8200c" id="54c90364-5fee-4f85-b603-ec57a18035cb" carrier="45ff4aee-c932-4363-8e21-4e0fa0ef047e"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5212a8a2-833c-4d53-9a10-0d7c95014728"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0944">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="e74bd079-ab42-4dd8-88af-04da5ed03942"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0066">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="63396209-b9c1-4178-b87a-73c763fc33c3"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.594953164860081" lat="51.989889178462086"/>
          <point xsi:type="esdl:Point" lon="4.535910882491767" lat="51.98058502493348"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.4954" length="4173.5" name="Pipe1_ret" related="Pipe1" outerDiameter="0.71" id="Pipe1_ret" diameter="DN500">
        <port xsi:type="esdl:InPort" name="In_ret" connectedTo="3548d754-5cb9-473a-80d4-b75d7af21825" id="8f00da6a-a92a-49de-90dd-3b4dfe903c89" carrier="45ff4aee-c932-4363-8e21-4e0fa0ef047e_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" connectedTo="a512b2dc-9790-4061-9681-ad17f91d9e21" id="a2ab0baa-504f-45cc-991a-bdbcb88924ab" carrier="45ff4aee-c932-4363-8e21-4e0fa0ef047e_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.5350259388765295" lat="51.98067502502348" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.594121437397912" lat="51.98997917855208" CRS="WGS84"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
