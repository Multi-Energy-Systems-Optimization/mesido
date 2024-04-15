<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="03386224-685c-4f3b-bcc0-3c9dc63110de_with_return_network_with_return_network" description="" esdlVersion="v2401" name="Untitled EnergySystem with return network with return network" version="3">
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
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_9b90" power="5000000.0" id="9b904958-feed-40d0-934e-fe4e4420d916">
        <port xsi:type="esdl:InPort" name="In" connectedTo="8fc5dd57-acc8-4de5-8a00-2df5da7a57c1" id="62f09402-d0ef-455c-86e7-e1b8f39a5542" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="5d7d8d7e-9009-404d-bdac-cbbc1c8fab40" id="8e360471-beba-4bcf-bbd3-466259c51b5b" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.41802740097046" lat="52.079796120944025" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:CoolingDemand" name="CoolingDemand_15e8" power="5000000.0" id="15e803b4-1224-4cac-979f-87747a656741">
        <port xsi:type="esdl:InPort" name="In" connectedTo="3dbef4b6-db6a-4523-839c-230ae726ecb3" id="4e4b0784-2205-4937-af8c-35f33f7c20b8" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="3936b21e-4331-4761-9ca0-331f15e50fbc" id="167a5468-c9b4-46c4-9815-1fbdeeb50420" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <geometry xsi:type="esdl:Point" lon="4.4191861152648935" lat="52.07984886931361" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Losses" name="Losses_109f" power="100000.0" id="109f946b-373c-4510-bedb-30752a0cd576">
        <port xsi:type="esdl:InPort" name="In" connectedTo="a5c86ba6-ddb2-4c0c-85b6-f5ffa552998d" id="52a0a5b2-8798-4fcd-a2e2-361720ff6d11" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="a93f7048-f55b-4046-bc21-74ee9f955b81" id="44332191-50e2-4e34-b318-2090863ae0d6" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.416847229003907" lat="52.07975655962592"/>
      </asset>
      <asset xsi:type="esdl:ATES" name="ATES_226d" maxChargeRate="1000000.0" maxStorageTemperature="30.0" id="226d58d1-28e5-4d73-9e72-3aaf3a5c67ff" maxDischargeRate="1000000.0" minStorageTemperature="6.0">
        <port xsi:type="esdl:InPort" name="In" connectedTo="75bbfd0f-ddc3-4f9b-aae3-92146fe1d3ae" id="39616896-fb2c-470e-9567-25233db228af" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="28ea57f1-1acd-419c-9c3f-4cb24f58aa60" id="316be022-cc67-4336-9d1b-6898bda3cd96" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.418177604675294" lat="52.077079495639495" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" name="HeatPump_b97e" COP="4.0" id="b97e7c4f-fff5-4e4a-bc64-830563f94e4c" power="200000.0">
        <port xsi:type="esdl:InPort" name="SecIn" connectedTo="1edf7d57-4146-4087-8b38-f45fb56a63eb" id="2083140e-6ddb-4d26-a788-a36ebcf65b80" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="SecOut" connectedTo="5f8fe6d0-24eb-4427-b47e-1bf4972e7c56" id="ad87a98f-e6a7-4688-9989-ea8a17a85afc" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <geometry xsi:type="esdl:Point" lon="4.413928985595704" lat="52.07816089056798"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_913e" id="913edda0-8cf9-4291-9ade-011751929a4b">
        <port xsi:type="esdl:InPort" name="In" connectedTo="cebfd2bb-36c6-4283-aa12-0072778d2e95 a645be6e-33b1-4419-bafe-6da887ee76d8" id="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="f7e9711a-68dc-4a2a-b4da-e5df4b654231 a8124853-afd9-4277-aea2-a95eb0f5e5ed 09db6bab-d5f2-4002-8d0f-bc959d690380 63d2a3ce-4254-44c9-8f37-f34df892c505" id="2925bc5d-077c-4603-9d9e-1f452926f504" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <geometry xsi:type="esdl:Point" lon="4.417941570281983" lat="52.078371891401986" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="275.2" name="Pipe1" innerDiameter="0.3127" related="Pipe1_ret" outerDiameter="0.45" id="Pipe1" diameter="DN300">
        <costInformation xsi:type="esdl:CostInformation" id="fce3b21d-38df-4e01-b967-ea4e55b3855b">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="ad87a98f-e6a7-4688-9989-ea8a17a85afc" id="5f8fe6d0-24eb-4427-b47e-1bf4972e7c56" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="58635b77-b097-459d-995d-58eedde3a267" id="cebfd2bb-36c6-4283-aa12-0072778d2e95" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
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
          <point xsi:type="esdl:Point" lon="4.413928985595704" lat="52.07816089056798"/>
          <point xsi:type="esdl:Point" lon="4.417941570281983" lat="52.078371891401986"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="144.6" name="Pipe2" innerDiameter="0.3127" related="Pipe2_ret" outerDiameter="0.45" id="Pipe2" diameter="DN300">
        <costInformation xsi:type="esdl:CostInformation" id="78685bc9-6a50-4416-a072-99471d45aa7d">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504" id="f7e9711a-68dc-4a2a-b4da-e5df4b654231" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="39616896-fb2c-470e-9567-25233db228af" id="75bbfd0f-ddc3-4f9b-aae3-92146fe1d3ae" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
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
          <point xsi:type="esdl:Point" lon="4.417941570281983" lat="52.078371891401986"/>
          <point xsi:type="esdl:Point" lon="4.418177604675294" lat="52.077079495639495"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="171.2" name="Pipe3" innerDiameter="0.3127" related="Pipe3_ret" outerDiameter="0.45" id="Pipe3" diameter="DN300">
        <costInformation xsi:type="esdl:CostInformation" id="deb1fe8f-cf15-4f9b-a9e0-b03daa93497f">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504" id="a8124853-afd9-4277-aea2-a95eb0f5e5ed" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="52a0a5b2-8798-4fcd-a2e2-361720ff6d11" id="a5c86ba6-ddb2-4c0c-85b6-f5ffa552998d" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
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
          <point xsi:type="esdl:Point" lon="4.417941570281983" lat="52.078371891401986"/>
          <point xsi:type="esdl:Point" lon="4.416847229003907" lat="52.07975655962592"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="158.5" name="Pipe4" innerDiameter="0.3127" related="Pipe4_ret" outerDiameter="0.45" id="Pipe4" diameter="DN300">
        <costInformation xsi:type="esdl:CostInformation" id="52fdab92-700f-4526-bde2-77e3b258e161">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504" id="09db6bab-d5f2-4002-8d0f-bc959d690380" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="62f09402-d0ef-455c-86e7-e1b8f39a5542" id="8fc5dd57-acc8-4de5-8a00-2df5da7a57c1" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
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
          <point xsi:type="esdl:Point" lon="4.417941570281983" lat="52.078371891401986"/>
          <point xsi:type="esdl:Point" lon="4.41802740097046" lat="52.079796120944025"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="184.9" name="Pipe5" innerDiameter="0.3127" related="Pipe5_ret" outerDiameter="0.45" id="Pipe5" diameter="DN300">
        <costInformation xsi:type="esdl:CostInformation" id="04255a0d-80bb-4a2a-bfe9-4872ae3b5c78">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="167a5468-c9b4-46c4-9815-1fbdeeb50420" id="3936b21e-4331-4761-9ca0-331f15e50fbc" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="58635b77-b097-459d-995d-58eedde3a267" id="a645be6e-33b1-4419-bafe-6da887ee76d8" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
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
      <asset xsi:type="esdl:Joint" name="Joint_913e_ret" id="c61783ce-a103-4e8e-891b-ddfe38de058c">
        <port xsi:type="esdl:OutPort" name="ret_port" connectedTo="fbfe6e62-f704-4464-979a-eb216355f77a d49c2f1a-3aa5-4da9-9e09-557a19b250e7" id="b277a00f-e86a-4883-9144-5b1babedcbce" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:InPort" name="ret_port" connectedTo="3c9adef3-edd3-432c-968d-36965d175403 a485f69e-5216-40ed-a55a-0e0025ffb7cd 4413213a-dd86-4504-9211-7053b9199c05 e356f966-3b2c-4720-b4fa-421b957ae56f" id="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.417410734103896" lat="52.07846189149198" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="275.2" name="Pipe1_ret" innerDiameter="0.3127" related="Pipe1" outerDiameter="0.45" id="Pipe1_ret" diameter="DN300">
        <port xsi:type="esdl:InPort" name="In_ret" connectedTo="b277a00f-e86a-4883-9144-5b1babedcbce" id="fbfe6e62-f704-4464-979a-eb216355f77a" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" connectedTo="2083140e-6ddb-4d26-a788-a36ebcf65b80" id="1edf7d57-4146-4087-8b38-f45fb56a63eb" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
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
          <point xsi:type="esdl:Point" lon="4.413397695431759" lat="52.078250890657976" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="144.6" name="Pipe2_ret" innerDiameter="0.3127" related="Pipe2" outerDiameter="0.45" id="Pipe2_ret" diameter="DN300">
        <port xsi:type="esdl:InPort" name="In_ret" connectedTo="316be022-cc67-4336-9d1b-6898bda3cd96" id="28ea57f1-1acd-419c-9c3f-4cb24f58aa60" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" id="3c9adef3-edd3-432c-968d-36965d175403" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
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
          <point xsi:type="esdl:Point" lon="4.417643975184299" lat="52.07716949572949" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.417410734103896" lat="52.07846189149198" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="171.2" name="Pipe3_ret" innerDiameter="0.3127" related="Pipe3" outerDiameter="0.45" id="Pipe3_ret" diameter="DN300">
        <port xsi:type="esdl:InPort" name="In_ret" connectedTo="44332191-50e2-4e34-b318-2090863ae0d6" id="a93f7048-f55b-4046-bc21-74ee9f955b81" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" id="a485f69e-5216-40ed-a55a-0e0025ffb7cd" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
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
          <point xsi:type="esdl:Point" lon="4.41631935232941" lat="52.07984655971592" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.417410734103896" lat="52.07846189149198" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="158.5" name="Pipe4_ret" innerDiameter="0.3127" related="Pipe4" outerDiameter="0.45" id="Pipe4_ret" diameter="DN300">
        <port xsi:type="esdl:InPort" name="In_ret" connectedTo="8e360471-beba-4bcf-bbd3-466259c51b5b" id="5d7d8d7e-9009-404d-bdac-cbbc1c8fab40" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" id="4413213a-dd86-4504-9211-7053b9199c05" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
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
          <point xsi:type="esdl:Point" lon="4.417499608352213" lat="52.07988612103402" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.417410734103896" lat="52.07846189149198" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="184.9" name="Pipe5_ret" innerDiameter="0.3127" related="Pipe5" outerDiameter="0.45" id="Pipe5_ret" diameter="DN300">
        <port xsi:type="esdl:InPort" name="In_ret" connectedTo="b277a00f-e86a-4883-9144-5b1babedcbce" id="d49c2f1a-3aa5-4da9-9e09-557a19b250e7" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" connectedTo="4e4b0784-2205-4937-af8c-35f33f7c20b8" id="3dbef4b6-db6a-4523-839c-230ae726ecb3" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
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
      <asset xsi:type="esdl:Airco" name="Airco_23d6" power="1000000.0" id="23d6ef31-45e6-46e0-b669-edc306e2ca9c">
        <port xsi:type="esdl:InPort" name="In" connectedTo="751dd976-7e12-4363-aea2-f2e068e306ac" id="733e8687-330f-46db-8879-9020b7b80a67" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="a564025e-1ec7-4091-8e1f-6711a8ab8eb1" id="30531768-8713-4d8c-9c5c-29a89e239eb9" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.419829845428468" lat="52.07849717267527" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.3127" name="Pipe_1e91" length="129.8" outerDiameter="0.45" id="1e91bc33-c10f-42e3-b49a-058fad456ec3" diameter="DN300">
        <costInformation xsi:type="esdl:CostInformation" id="684fb7e9-00c8-42a9-a708-06bb6b329153">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504" id="63d2a3ce-4254-44c9-8f37-f34df892c505" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="733e8687-330f-46db-8879-9020b7b80a67" id="751dd976-7e12-4363-aea2-f2e068e306ac" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
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
          <point xsi:type="esdl:Point" lon="4.417941570281983" lat="52.078371891401986"/>
          <point xsi:type="esdl:Point" lon="4.419829845428468" lat="52.07849717267527"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.3127" name="Pipe_ccd1" length="165.4" outerDiameter="0.45" id="ccd128de-dca2-4dad-9165-6ec76b9871f9" diameter="DN300">
        <costInformation xsi:type="esdl:CostInformation" id="e3d158ca-ea52-424f-a52b-1a8676c2c909">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="30531768-8713-4d8c-9c5c-29a89e239eb9" id="a564025e-1ec7-4091-8e1f-6711a8ab8eb1" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" id="e356f966-3b2c-4720-b4fa-421b957ae56f" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
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
          <point xsi:type="esdl:Point" lon="4.419829845428468" lat="52.07849717267527"/>
          <point xsi:type="esdl:Point" lon="4.417410734103896" lat="52.07846189149198"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
