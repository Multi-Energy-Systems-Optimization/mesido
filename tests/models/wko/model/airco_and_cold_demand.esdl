<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="03386224-685c-4f3b-bcc0-3c9dc63110de_with_return_network_with_return_network" description="" esdlVersion="v2401" name="airco_and_cold_demand" version="10">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="ad1a8ca8-b21b-4ad3-aa3e-756cf321bd4d">
    <carriers xsi:type="esdl:Carriers" id="553fa302-8878-4fa9-b0ca-6ee6123bf2c9">
      <carrier xsi:type="esdl:HeatCommodity" name="LT" supplyTemperature="25.0" id="13db0822-98da-4ca8-9d48-868653ae06af"/>
      <carrier xsi:type="esdl:HeatCommodity" name="LT_ret" returnTemperature="6.0" id="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="632648b0-a234-4e0c-b3a2-f18a6dee2700">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" multiplier="MEGA" physicalQuantity="POWER" description="Power in MW" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="d1a23619-2ef0-4172-8bab-25dfc28a64e1" name="Untitled Instance">
    <area xsi:type="esdl:Area" name="Untitled Area" id="4f36ae5d-6dc1-465d-8fc0-f5459d5c3e27">
      <asset xsi:type="esdl:CoolingDemand" name="CoolingDemand_15e8" power="5000000.0" id="15e803b4-1224-4cac-979f-87747a656741">
        <port xsi:type="esdl:InPort" name="In" id="4e4b0784-2205-4937-af8c-35f33f7c20b8" connectedTo="3dbef4b6-db6a-4523-839c-230ae726ecb3" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out" id="167a5468-c9b4-46c4-9815-1fbdeeb50420" connectedTo="3936b21e-4331-4761-9ca0-331f15e50fbc" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <geometry xsi:type="esdl:Point" lat="52.079848869313636" lon="4.419180750846864"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="184.9" name="Pipe1" innerDiameter="0.3127" outerDiameter="0.45" id="Pipe1" diameter="DN300" related="Pipe1_ret">
        <costInformation xsi:type="esdl:CostInformation" id="04255a0d-80bb-4a2a-bfe9-4872ae3b5c78">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" id="3936b21e-4331-4761-9ca0-331f15e50fbc" connectedTo="167a5468-c9b4-46c4-9815-1fbdeeb50420" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" id="a645be6e-33b1-4419-bafe-6da887ee76d8" connectedTo="733e8687-330f-46db-8879-9020b7b80a67" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.4191861152648935" lat="52.07984886931361"/>
          <point xsi:type="esdl:Point" lon="4.417941570281983" lat="52.078371891401986"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="184.9" name="Pipe1_ret" innerDiameter="0.3127" outerDiameter="0.45" id="Pipe1_ret" diameter="DN300" related="Pipe1">
        <port xsi:type="esdl:InPort" name="In_ret" id="d49c2f1a-3aa5-4da9-9e09-557a19b250e7" connectedTo="30531768-8713-4d8c-9c5c-29a89e239eb9" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="3dbef4b6-db6a-4523-839c-230ae726ecb3" connectedTo="4e4b0784-2205-4937-af8c-35f33f7c20b8" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.417410734103896" lat="52.07846189149198" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.418658434678616" lat="52.079938869403605" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Airco" name="Airco_23d6" power="5000000.0" id="23d6ef31-45e6-46e0-b669-edc306e2ca9c">
        <port xsi:type="esdl:InPort" name="In" id="733e8687-330f-46db-8879-9020b7b80a67" connectedTo="a645be6e-33b1-4419-bafe-6da887ee76d8" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" id="30531768-8713-4d8c-9c5c-29a89e239eb9" connectedTo="d49c2f1a-3aa5-4da9-9e09-557a19b250e7" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <geometry xsi:type="esdl:Point" lat="52.078424641454646" lon="4.417389035224915"/>
        <costInformation xsi:type="esdl:CostInformation" id="245e6b56-c37e-4c55-9f7e-52d4603d4277">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="a44957ec-6a01-4145-90f9-c1aac617b2ad" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/kWh" id="ffdb790d-f225-48b9-b4e7-f588612b418f" unit="EURO" perMultiplier="KILO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="1ff41860-e95a-441f-83e9-b3b52b07bc11" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="7c08a501-8656-435a-aafb-24136ab4ef4c" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
        </costInformation>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
