<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2401" name="Untitled EnergySystem with return network with return network" version="2" id="03386224-685c-4f3b-bcc0-3c9dc63110de_with_return_network_with_return_network" description="">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="ad1a8ca8-b21b-4ad3-aa3e-756cf321bd4d">
    <carriers xsi:type="esdl:Carriers" id="553fa302-8878-4fa9-b0ca-6ee6123bf2c9">
      <carrier xsi:type="esdl:HeatCommodity" id="13db0822-98da-4ca8-9d48-868653ae06af" name="LT" supplyTemperature="25.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="LT_ret" returnTemperature="6.0"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="632648b0-a234-4e0c-b3a2-f18a6dee2700">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" unit="WATT" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="d1a23619-2ef0-4172-8bab-25dfc28a64e1" name="Untitled Instance">
    <area xsi:type="esdl:Area" name="Untitled Area" id="4f36ae5d-6dc1-465d-8fc0-f5459d5c3e27">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_9b90" id="9b904958-feed-40d0-934e-fe4e4420d916" power="5000000.0">
        <port xsi:type="esdl:InPort" id="62f09402-d0ef-455c-86e7-e1b8f39a5542" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="8fc5dd57-acc8-4de5-8a00-2df5da7a57c1"/>
        <port xsi:type="esdl:OutPort" id="8e360471-beba-4bcf-bbd3-466259c51b5b" connectedTo="5d7d8d7e-9009-404d-bdac-cbbc1c8fab40" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.079796120944025" lon="4.41802740097046"/>
      </asset>
      <asset xsi:type="esdl:CoolingDemand" name="CoolingDemand_15e8" id="15e803b4-1224-4cac-979f-87747a656741" power="5000000.0">
        <port xsi:type="esdl:InPort" id="4e4b0784-2205-4937-af8c-35f33f7c20b8" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In" connectedTo="3dbef4b6-db6a-4523-839c-230ae726ecb3"/>
        <port xsi:type="esdl:OutPort" id="167a5468-c9b4-46c4-9815-1fbdeeb50420" connectedTo="3936b21e-4331-4761-9ca0-331f15e50fbc" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.07984886931361" lon="4.4191861152648935"/>
      </asset>
      <asset xsi:type="esdl:Losses" name="Losses_109f" id="109f946b-373c-4510-bedb-30752a0cd576" power="100000.0">
        <port xsi:type="esdl:InPort" id="52a0a5b2-8798-4fcd-a2e2-361720ff6d11" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="a5c86ba6-ddb2-4c0c-85b6-f5ffa552998d"/>
        <port xsi:type="esdl:OutPort" id="44332191-50e2-4e34-b318-2090863ae0d6" connectedTo="a93f7048-f55b-4046-bc21-74ee9f955b81" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="52.07975655962592" lon="4.416847229003907"/>
      </asset>
      <asset xsi:type="esdl:ATES" name="ATES_226d" id="226d58d1-28e5-4d73-9e72-3aaf3a5c67ff" maxStorageTemperature="30.0" maxChargeRate="1000000.0" minStorageTemperature="6.0" maxDischargeRate="1000000.0">
        <port xsi:type="esdl:InPort" id="39616896-fb2c-470e-9567-25233db228af" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="75bbfd0f-ddc3-4f9b-aae3-92146fe1d3ae"/>
        <port xsi:type="esdl:OutPort" id="316be022-cc67-4336-9d1b-6898bda3cd96" connectedTo="28ea57f1-1acd-419c-9c3f-4cb24f58aa60" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.077079495639495" lon="4.418177604675294"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" name="HeatPump_b97e" COP="4.0" id="b97e7c4f-fff5-4e4a-bc64-830563f94e4c" power="200000.0">
        <port xsi:type="esdl:InPort" id="2083140e-6ddb-4d26-a788-a36ebcf65b80" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="SecIn" connectedTo="1edf7d57-4146-4087-8b38-f45fb56a63eb"/>
        <port xsi:type="esdl:OutPort" id="ad87a98f-e6a7-4688-9989-ea8a17a85afc" connectedTo="5f8fe6d0-24eb-4427-b47e-1bf4972e7c56" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="SecOut"/>
        <geometry xsi:type="esdl:Point" lat="52.07816089056798" lon="4.413928985595704"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_913e" id="913edda0-8cf9-4291-9ade-011751929a4b">
        <port xsi:type="esdl:InPort" id="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="cebfd2bb-36c6-4283-aa12-0072778d2e95 a645be6e-33b1-4419-bafe-6da887ee76d8"/>
        <port xsi:type="esdl:OutPort" id="2925bc5d-077c-4603-9d9e-1f452926f504" connectedTo="f7e9711a-68dc-4a2a-b4da-e5df4b654231 a8124853-afd9-4277-aea2-a95eb0f5e5ed 09db6bab-d5f2-4002-8d0f-bc959d690380" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.078371891401986" lon="4.417941570281983"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe1" length="275.2" related="Pipe1_ret" outerDiameter="0.45" id="Pipe1" diameter="DN300" innerDiameter="0.3127">
        <costInformation xsi:type="esdl:CostInformation" id="fce3b21d-38df-4e01-b967-ea4e55b3855b">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="5f8fe6d0-24eb-4427-b47e-1bf4972e7c56" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="ad87a98f-e6a7-4688-9989-ea8a17a85afc"/>
        <port xsi:type="esdl:OutPort" id="cebfd2bb-36c6-4283-aa12-0072778d2e95" connectedTo="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.07816089056798" lon="4.413928985595704"/>
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe2" length="144.6" related="Pipe2_ret" outerDiameter="0.45" id="Pipe2" diameter="DN300" innerDiameter="0.3127">
        <costInformation xsi:type="esdl:CostInformation" id="78685bc9-6a50-4416-a072-99471d45aa7d">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="f7e9711a-68dc-4a2a-b4da-e5df4b654231" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504"/>
        <port xsi:type="esdl:OutPort" id="75bbfd0f-ddc3-4f9b-aae3-92146fe1d3ae" connectedTo="39616896-fb2c-470e-9567-25233db228af" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
          <point xsi:type="esdl:Point" lat="52.077079495639495" lon="4.418177604675294"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe3" length="171.2" related="Pipe3_ret" outerDiameter="0.45" id="Pipe3" diameter="DN300" innerDiameter="0.3127">
        <costInformation xsi:type="esdl:CostInformation" id="deb1fe8f-cf15-4f9b-a9e0-b03daa93497f">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="a8124853-afd9-4277-aea2-a95eb0f5e5ed" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504"/>
        <port xsi:type="esdl:OutPort" id="a5c86ba6-ddb2-4c0c-85b6-f5ffa552998d" connectedTo="52a0a5b2-8798-4fcd-a2e2-361720ff6d11" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
          <point xsi:type="esdl:Point" lat="52.07975655962592" lon="4.416847229003907"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe4" length="158.5" related="Pipe4_ret" outerDiameter="0.45" id="Pipe4" diameter="DN300" innerDiameter="0.3127">
        <costInformation xsi:type="esdl:CostInformation" id="52fdab92-700f-4526-bde2-77e3b258e161">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="09db6bab-d5f2-4002-8d0f-bc959d690380" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504"/>
        <port xsi:type="esdl:OutPort" id="8fc5dd57-acc8-4de5-8a00-2df5da7a57c1" connectedTo="62f09402-d0ef-455c-86e7-e1b8f39a5542" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
          <point xsi:type="esdl:Point" lat="52.079796120944025" lon="4.41802740097046"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe5" length="184.9" related="Pipe5_ret" outerDiameter="0.45" id="Pipe5" diameter="DN300" innerDiameter="0.3127">
        <costInformation xsi:type="esdl:CostInformation" id="04255a0d-80bb-4a2a-bfe9-4872ae3b5c78">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="3936b21e-4331-4761-9ca0-331f15e50fbc" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="167a5468-c9b4-46c4-9815-1fbdeeb50420"/>
        <port xsi:type="esdl:OutPort" id="a645be6e-33b1-4419-bafe-6da887ee76d8" connectedTo="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.07984886931361" lon="4.4191861152648935"/>
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_913e_ret" id="c61783ce-a103-4e8e-891b-ddfe38de058c">
        <port xsi:type="esdl:OutPort" id="b277a00f-e86a-4883-9144-5b1babedcbce" connectedTo="fbfe6e62-f704-4464-979a-eb216355f77a d49c2f1a-3aa5-4da9-9e09-557a19b250e7" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="ret_port"/>
        <port xsi:type="esdl:InPort" id="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="ret_port" connectedTo="3c9adef3-edd3-432c-968d-36965d175403 a485f69e-5216-40ed-a55a-0e0025ffb7cd 4413213a-dd86-4504-9211-7053b9199c05"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.07846189149198" lon="4.417410734103896"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe1_ret" length="275.2" related="Pipe1" outerDiameter="0.45" id="Pipe1_ret" diameter="DN300" innerDiameter="0.3127">
        <port xsi:type="esdl:InPort" id="fbfe6e62-f704-4464-979a-eb216355f77a" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret" connectedTo="b277a00f-e86a-4883-9144-5b1babedcbce"/>
        <port xsi:type="esdl:OutPort" id="1edf7d57-4146-4087-8b38-f45fb56a63eb" connectedTo="2083140e-6ddb-4d26-a788-a36ebcf65b80" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.07846189149198" lon="4.417410734103896"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.078250890657976" lon="4.413397695431759"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe2_ret" length="144.6" related="Pipe2" outerDiameter="0.45" id="Pipe2_ret" diameter="DN300" innerDiameter="0.3127">
        <port xsi:type="esdl:InPort" id="28ea57f1-1acd-419c-9c3f-4cb24f58aa60" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret" connectedTo="316be022-cc67-4336-9d1b-6898bda3cd96"/>
        <port xsi:type="esdl:OutPort" id="3c9adef3-edd3-432c-968d-36965d175403" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.07716949572949" lon="4.417643975184299"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.07846189149198" lon="4.417410734103896"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe3_ret" length="171.2" related="Pipe3" outerDiameter="0.45" id="Pipe3_ret" diameter="DN300" innerDiameter="0.3127">
        <port xsi:type="esdl:InPort" id="a93f7048-f55b-4046-bc21-74ee9f955b81" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret" connectedTo="44332191-50e2-4e34-b318-2090863ae0d6"/>
        <port xsi:type="esdl:OutPort" id="a485f69e-5216-40ed-a55a-0e0025ffb7cd" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.07984655971592" lon="4.41631935232941"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.07846189149198" lon="4.417410734103896"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe4_ret" length="158.5" related="Pipe4" outerDiameter="0.45" id="Pipe4_ret" diameter="DN300" innerDiameter="0.3127">
        <port xsi:type="esdl:InPort" id="5d7d8d7e-9009-404d-bdac-cbbc1c8fab40" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret" connectedTo="8e360471-beba-4bcf-bbd3-466259c51b5b"/>
        <port xsi:type="esdl:OutPort" id="4413213a-dd86-4504-9211-7053b9199c05" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.07988612103402" lon="4.417499608352213"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.07846189149198" lon="4.417410734103896"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe5_ret" length="184.9" related="Pipe5" outerDiameter="0.45" id="Pipe5_ret" diameter="DN300" innerDiameter="0.3127">
        <port xsi:type="esdl:InPort" id="d49c2f1a-3aa5-4da9-9e09-557a19b250e7" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret" connectedTo="b277a00f-e86a-4883-9144-5b1babedcbce"/>
        <port xsi:type="esdl:OutPort" id="3dbef4b6-db6a-4523-839c-230ae726ecb3" connectedTo="4e4b0784-2205-4937-af8c-35f33f7c20b8" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.07846189149198" lon="4.417410734103896"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.079938869403605" lon="4.418658434678616"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
