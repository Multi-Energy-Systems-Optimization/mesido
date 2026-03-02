<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="03386224-685c-4f3b-bcc0-3c9dc63110de_with_return_network_with_return_network" description="" esdlVersion="v2401" name="LT_wko_heating_and_cooling_v2" version="5">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="ad1a8ca8-b21b-4ad3-aa3e-756cf321bd4d">
    <carriers xsi:type="esdl:Carriers" id="553fa302-8878-4fa9-b0ca-6ee6123bf2c9">
      <carrier xsi:type="esdl:HeatCommodity" name="LT" supplyTemperature="25.0" id="13db0822-98da-4ca8-9d48-868653ae06af"/>
      <carrier xsi:type="esdl:HeatCommodity" name="LT_ret" returnTemperature="6.0" id="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" id="54a8aca4-2ed6-4622-87de-d1a87950a7f3" name="VLT" supplyTemperature="15.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="d316c659-fde0-48c2-b689-351048075414" name="VLT_ret" returnTemperature="5.0"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="632648b0-a234-4e0c-b3a2-f18a6dee2700">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" multiplier="MEGA" physicalQuantity="POWER" description="Power in MW" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="d1a23619-2ef0-4172-8bab-25dfc28a64e1" name="Untitled Instance">
    <area xsi:type="esdl:Area" name="Untitled Area" id="4f36ae5d-6dc1-465d-8fc0-f5459d5c3e27">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_9b90" power="1000000.0" id="9b904958-feed-40d0-934e-fe4e4420d916">
        <port xsi:type="esdl:InPort" name="In" id="62f09402-d0ef-455c-86e7-e1b8f39a5542" connectedTo="8fc5dd57-acc8-4de5-8a00-2df5da7a57c1" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" id="8e360471-beba-4bcf-bbd3-466259c51b5b" connectedTo="5d7d8d7e-9009-404d-bdac-cbbc1c8fab40" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.41802740097046" lat="52.079796120944025" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" name="HeatPump_b97e" COP="4.0" id="b97e7c4f-fff5-4e4a-bc64-830563f94e4c" power="1000000.0">
        <port xsi:type="esdl:InPort" name="SecIn" id="2083140e-6ddb-4d26-a788-a36ebcf65b80" connectedTo="1edf7d57-4146-4087-8b38-f45fb56a63eb" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="SecOut" id="ad87a98f-e6a7-4688-9989-ea8a17a85afc" connectedTo="5f8fe6d0-24eb-4427-b47e-1bf4972e7c56" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:InPort" id="de779747-9b8c-4664-8fd9-5b9818104111" name="PrimIn" connectedTo="1c5e6def-a9d7-4598-8a97-b68c335babcf" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3"/>
        <port xsi:type="esdl:OutPort" id="23d6ca54-f00c-4be5-be39-1d97ddb8085a" name="PrimOut" connectedTo="63d5f753-dd3b-4336-b615-16f4a43616d1" carrier="d316c659-fde0-48c2-b689-351048075414"/>
        <geometry xsi:type="esdl:Point" lat="52.07816089056798" lon="4.413939712837239"/>
        <costInformation xsi:type="esdl:CostInformation" id="7ac03c84-ec32-4256-8ac9-a2ac5a43729c">
          <investmentCosts xsi:type="esdl:SingleValue" id="161113ad-4990-45e6-aa18-3974d8b15474" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="dfe043ec-8368-4cbc-9b48-bfb2451af6f9" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="34d292ef-85e5-4901-a4c1-40fee097664e" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="c8030591-41a4-43b9-ba41-eb39b0239b1d" unit="EURO"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="678667c6-4b5d-4b43-999a-9528ab5f6c7b" value="2.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="146ab489-8c3a-4b68-9ff8-c0259aa074cd" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_913e" id="913edda0-8cf9-4291-9ade-011751929a4b">
        <port xsi:type="esdl:InPort" name="In" id="58635b77-b097-459d-995d-58eedde3a267" connectedTo="cebfd2bb-36c6-4283-aa12-0072778d2e95" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" id="2925bc5d-077c-4603-9d9e-1f452926f504" connectedTo="f7e9711a-68dc-4a2a-b4da-e5df4b654231 09db6bab-d5f2-4002-8d0f-bc959d690380" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <geometry xsi:type="esdl:Point" lon="4.417941570281983" lat="52.078371891401986" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="275.2" name="Pipe1" innerDiameter="0.3127" outerDiameter="0.45" id="Pipe1" diameter="DN300" related="Pipe1_ret">
        <costInformation xsi:type="esdl:CostInformation" id="fce3b21d-38df-4e01-b967-ea4e55b3855b">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" id="5f8fe6d0-24eb-4427-b47e-1bf4972e7c56" connectedTo="ad87a98f-e6a7-4688-9989-ea8a17a85afc" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" id="cebfd2bb-36c6-4283-aa12-0072778d2e95" connectedTo="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
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
      <asset xsi:type="esdl:Pipe" length="144.6" name="Pipe2" innerDiameter="0.3127" outerDiameter="0.45" id="Pipe2" diameter="DN300" related="Pipe2_ret">
        <costInformation xsi:type="esdl:CostInformation" id="78685bc9-6a50-4416-a072-99471d45aa7d">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" id="f7e9711a-68dc-4a2a-b4da-e5df4b654231" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" id="75bbfd0f-ddc3-4f9b-aae3-92146fe1d3ae" connectedTo="fa536f12-5261-49bc-83b2-d5501f9b7beb" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
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
      <asset xsi:type="esdl:Pipe" length="158.5" name="Pipe4" innerDiameter="0.3127" outerDiameter="0.45" id="Pipe4" diameter="DN300" related="Pipe4_ret">
        <costInformation xsi:type="esdl:CostInformation" id="52fdab92-700f-4526-bde2-77e3b258e161">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" id="09db6bab-d5f2-4002-8d0f-bc959d690380" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" name="Out" id="8fc5dd57-acc8-4de5-8a00-2df5da7a57c1" connectedTo="62f09402-d0ef-455c-86e7-e1b8f39a5542" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
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
      <asset xsi:type="esdl:Joint" name="Joint_913e_ret" id="c61783ce-a103-4e8e-891b-ddfe38de058c">
        <port xsi:type="esdl:OutPort" name="ret_port" id="b277a00f-e86a-4883-9144-5b1babedcbce" connectedTo="fbfe6e62-f704-4464-979a-eb216355f77a" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:InPort" name="ret_port" id="593e5e00-ff2e-432b-8bea-e6912b18be74" connectedTo="3c9adef3-edd3-432c-968d-36965d175403 4413213a-dd86-4504-9211-7053b9199c05" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.417410734103896" lat="52.07846189149198" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="275.2" name="Pipe1_ret" innerDiameter="0.3127" outerDiameter="0.45" id="Pipe1_ret" diameter="DN300" related="Pipe1">
        <port xsi:type="esdl:InPort" name="In_ret" id="fbfe6e62-f704-4464-979a-eb216355f77a" connectedTo="b277a00f-e86a-4883-9144-5b1babedcbce" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="1edf7d57-4146-4087-8b38-f45fb56a63eb" connectedTo="2083140e-6ddb-4d26-a788-a36ebcf65b80" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
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
      <asset xsi:type="esdl:Pipe" length="144.6" name="Pipe2_ret" innerDiameter="0.3127" outerDiameter="0.45" id="Pipe2_ret" diameter="DN300" related="Pipe2">
        <port xsi:type="esdl:InPort" name="In_ret" id="28ea57f1-1acd-419c-9c3f-4cb24f58aa60" connectedTo="04d7f87b-1449-4f3a-88da-ad7f8d2fc4f3" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="3c9adef3-edd3-432c-968d-36965d175403" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
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
      <asset xsi:type="esdl:Pipe" length="158.5" name="Pipe4_ret" innerDiameter="0.3127" outerDiameter="0.45" id="Pipe4_ret" diameter="DN300" related="Pipe4">
        <port xsi:type="esdl:InPort" name="In_ret" id="5d7d8d7e-9009-404d-bdac-cbbc1c8fab40" connectedTo="8e360471-beba-4bcf-bbd3-466259c51b5b" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="4413213a-dd86-4504-9211-7053b9199c05" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
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
      <asset xsi:type="esdl:ATES" id="d7619a65-4c95-483d-a318-8f2b8d2dddef" name="ATES_d761" maxChargeRate="2900000.0" maxDischargeRate="2900000.0" aquiferTopDepth="300.0" aquiferThickness="15.0" aquiferMidTemperature="17.0" aquiferNetToGross="1.0" aquiferPorosity="0.3" aquiferPermeability="7500.0" aquiferAnisotropy="4.0" salinity="10000.0" wellCasingSize="13.0" wellDistance="150.0">
        <dataSource xsi:type="esdl:DataSource" name="WarmingUp factsheet: HT-ATES (low)" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution=""/>
        <costInformation xsi:type="esdl:CostInformation">
          <investmentCosts xsi:type="esdl:SingleValue" value="2103153.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" description="Cost in EUR" id="e5806b53-c950-48e8-b976-3de60a78503d"/>
          </investmentCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="17416.67">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" description="Cost in EUR/yr" perTimeUnit="YEAR" id="550599db-b435-4c2d-aa17-fd547c2c1aa3"/>
          </variableOperationalCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="58868.06">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" description="Cost in EUR/yr" perTimeUnit="YEAR" id="c9d122e5-ba01-4781-940e-2fab6d95f799"/>
          </fixedMaintenanceCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="30000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" description="Cost in EUR/yr" perTimeUnit="YEAR" id="80fc32f7-3ed2-4989-ba74-f16f6a7ceee5"/>
          </fixedOperationalCosts>
        </costInformation>
        <geometry xsi:type="esdl:Point" lat="52.07684217192819" lon="4.417909235482745"/>
        <port xsi:type="esdl:InPort" id="fa536f12-5261-49bc-83b2-d5501f9b7beb" name="In" connectedTo="75bbfd0f-ddc3-4f9b-aae3-92146fe1d3ae" carrier="13db0822-98da-4ca8-9d48-868653ae06af"/>
        <port xsi:type="esdl:OutPort" id="04d7f87b-1449-4f3a-88da-ad7f8d2fc4f3" name="Out" connectedTo="28ea57f1-1acd-419c-9c3f-4cb24f58aa60" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatProducer" id="e88b889e-16d2-4162-8505-f13ab99b05f7" name="HeatProducer_e88b" power="1000000.0">
        <geometry xsi:type="esdl:Point" lat="52.07729049082708" lon="4.413456932754368"/>
        <port xsi:type="esdl:OutPort" id="44585e6f-c295-463c-a460-465ec56bec4a" name="Out" connectedTo="c702ff28-0334-4e49-9954-bb7c5f496dcc" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3"/>
        <port xsi:type="esdl:InPort" id="1608c324-531c-45d9-bcb1-d129c4b44add" name="In" connectedTo="b6643219-0418-4b45-af94-703b39fc0c63" carrier="d316c659-fde0-48c2-b689-351048075414"/>
        <costInformation xsi:type="esdl:CostInformation" id="98d2622d-34bc-46ce-b403-cd3acb46b972">
          <investmentCosts xsi:type="esdl:SingleValue" id="e2b31aa5-e42c-4795-b907-5ff3d97efb26" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="8c7debf3-5d64-40f9-8107-7e1fdb496181" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="48303f7a-63d6-4478-863c-9b0931a8feea" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="fa24a705-798e-4c7d-a64d-6011ddf2a964" unit="EURO"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="3b21a473-98d0-41b3-a287-abdfbc083de8" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="cea48b24-2cec-4bff-85d6-2da60845e9fc" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="5322f350-e503-4c1e-a501-4b8f9b8d3f8d" name="Pipe_5322" innerDiameter="0.3127" outerDiameter="0.45" diameter="DN300" length="39.67">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="e2dce99b-64c8-46a0-8f0e-584af320e241">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="32865a16-7fbb-4461-ac03-0ab962b8417e" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="345fb79b-4963-43cc-8f2d-67873c3a1d07"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" id="82b1392b-3608-409e-a8ee-0feade61bb0c" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" id="7e756391-73cf-43b3-8c95-dee3dc44377f" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" id="f344da71-782e-4d53-a975-9271f13262f0" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.077420930156826" lon="4.413597476753127"/>
          <point xsi:type="esdl:Point" lat="52.077763394333616" lon="4.413760080373814"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c702ff28-0334-4e49-9954-bb7c5f496dcc" name="In" connectedTo="44585e6f-c295-463c-a460-465ec56bec4a" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3"/>
        <port xsi:type="esdl:OutPort" id="47853740-8d44-4744-ba6b-71847f01921a" name="Out" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3" connectedTo="e93edd49-0ee6-4ce8-8027-a3e8bdb8febe"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="39169dc3-d240-42e8-9e8a-e594e1edfe18" name="Pipe_3916" innerDiameter="0.3127" outerDiameter="0.45" diameter="DN300" length="21.6">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="e2dce99b-64c8-46a0-8f0e-584af320e241">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="32865a16-7fbb-4461-ac03-0ab962b8417e" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="345fb79b-4963-43cc-8f2d-67873c3a1d07"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" id="82b1392b-3608-409e-a8ee-0feade61bb0c" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" id="7e756391-73cf-43b3-8c95-dee3dc44377f" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" id="f344da71-782e-4d53-a975-9271f13262f0" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.077763394333616" lon="4.413760080373814"/>
          <point xsi:type="esdl:Point" lat="52.077948654272994" lon="4.413854930549888"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="be16a487-bf63-4bff-9d62-eae50dcbca43" name="In" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3" connectedTo="0c5f000a-a509-49a0-879d-d0781278e234"/>
        <port xsi:type="esdl:OutPort" id="1c5e6def-a9d7-4598-8a97-b68c335babcf" name="Out" connectedTo="de779747-9b8c-4664-8fd9-5b9818104111" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="eaf0f0cf-5171-4d4f-9fb8-0815da96e917" name="Joint_eaf0">
        <port xsi:type="esdl:InPort" id="e93edd49-0ee6-4ce8-8027-a3e8bdb8febe" name="In" connectedTo="47853740-8d44-4744-ba6b-71847f01921a fc7d9a4d-a97e-4b39-9f88-03757a5c8092" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3"/>
        <port xsi:type="esdl:OutPort" id="0c5f000a-a509-49a0-879d-d0781278e234" name="Out" connectedTo="be16a487-bf63-4bff-9d62-eae50dcbca43" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3"/>
        <geometry xsi:type="esdl:Point" lat="52.077763394333616" lon="4.413760080373814"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="1f99fc98-9057-4888-bd32-cef2850b2104" name="Pipe_5eb6_ret_a" innerDiameter="0.3127" outerDiameter="0.45" diameter="DN300" length="22.74">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="61a24995-ba24-41cc-8eea-aaa73811ceed">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="32865a16-7fbb-4461-ac03-0ab962b8417e" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="345fb79b-4963-43cc-8f2d-67873c3a1d07"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" id="82b1392b-3608-409e-a8ee-0feade61bb0c" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" id="7e756391-73cf-43b3-8c95-dee3dc44377f" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" id="f344da71-782e-4d53-a975-9271f13262f0" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.07789865427299" lon="4.4138049305498885"/>
          <point xsi:type="esdl:Point" lat="52.07770414713449" lon="4.4137023812885054"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="63d5f753-dd3b-4336-b615-16f4a43616d1" name="In" connectedTo="23d6ca54-f00c-4be5-be39-1d97ddb8085a" carrier="d316c659-fde0-48c2-b689-351048075414"/>
        <port xsi:type="esdl:OutPort" id="01cbb644-e229-4619-9129-d43d17bd7f87" name="Out" carrier="d316c659-fde0-48c2-b689-351048075414" connectedTo="d19c0916-a328-4262-b627-e600accb97ce"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="68e093ce-f4ae-4476-b27e-435a296a43ad" name="Pipe_5eb6_ret_b" innerDiameter="0.3127" outerDiameter="0.45" diameter="DN300" length="38.53">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="61a24995-ba24-41cc-8eea-aaa73811ceed">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="32865a16-7fbb-4461-ac03-0ab962b8417e" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="345fb79b-4963-43cc-8f2d-67873c3a1d07"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" id="82b1392b-3608-409e-a8ee-0feade61bb0c" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" id="7e756391-73cf-43b3-8c95-dee3dc44377f" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" id="f344da71-782e-4d53-a975-9271f13262f0" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.07770414713449" lon="4.4137023812885054"/>
          <point xsi:type="esdl:Point" lat="52.077370930156825" lon="4.413547476753127"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="037c02e3-3a06-4172-a4a5-bfeb5cec36e1" name="In" carrier="d316c659-fde0-48c2-b689-351048075414" connectedTo="7ad8a0ad-e056-4e9c-b412-dfda10887f2d"/>
        <port xsi:type="esdl:OutPort" id="b6643219-0418-4b45-af94-703b39fc0c63" name="Out" connectedTo="1608c324-531c-45d9-bcb1-d129c4b44add" carrier="d316c659-fde0-48c2-b689-351048075414"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="dcff6649-7f4d-448b-bae9-b438ec067088" name="Joint_dcff">
        <port xsi:type="esdl:InPort" id="d19c0916-a328-4262-b627-e600accb97ce" name="In" connectedTo="01cbb644-e229-4619-9129-d43d17bd7f87" carrier="d316c659-fde0-48c2-b689-351048075414"/>
        <port xsi:type="esdl:OutPort" id="7ad8a0ad-e056-4e9c-b412-dfda10887f2d" name="Out" connectedTo="037c02e3-3a06-4172-a4a5-bfeb5cec36e1 bf4ec5a4-fc17-4e25-9d1a-eb47d67c5c00" carrier="d316c659-fde0-48c2-b689-351048075414"/>
        <geometry xsi:type="esdl:Point" lat="52.07770414713449" lon="4.4137023812885054"/>
      </asset>
      <asset xsi:type="esdl:CoolingDemand" id="c2de63b0-0581-49e4-8776-c4705dc02db4" name="CoolingDemand_15e8" power="1000000.0">
        <geometry xsi:type="esdl:Point" lat="52.07732673921941" lon="4.41405773202706"/>
        <port xsi:type="esdl:InPort" id="4639dcf5-da89-4905-8f03-79b709f3be72" name="In" connectedTo="cd923117-4116-42d4-baa7-cf9ac539efa9" carrier="d316c659-fde0-48c2-b689-351048075414"/>
        <port xsi:type="esdl:OutPort" id="977b42c8-4b49-44ec-9488-604fec9aff5b" name="Out" connectedTo="237b90cb-f01d-4f27-8a3a-108542cf2cde" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="0d081387-beaa-41e6-a01e-bcbc98f42a39" name="Pipe_0d08" innerDiameter="0.3127" outerDiameter="0.45" diameter="DN300" length="52.6">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="9531f866-f9ee-40a4-8dda-453501533aa4">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="fbc62699-7217-4e33-9c6f-beae29914f68" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="211218a2-d08f-433f-b0f6-19ea7473ec01"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" id="2b0e4650-9aea-4bad-8a0a-56e43a4756ab" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" id="c31c04ee-5aa7-4a92-b624-cc876dfec9c2" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" id="97d963e1-ab01-406b-8a21-b5d8bbfcdd1f" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.07732673921941" lon="4.41405773202706"/>
          <point xsi:type="esdl:Point" lat="52.077763394333616" lon="4.413760080373814"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="237b90cb-f01d-4f27-8a3a-108542cf2cde" name="In" connectedTo="977b42c8-4b49-44ec-9488-604fec9aff5b" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3"/>
        <port xsi:type="esdl:OutPort" id="fc7d9a4d-a97e-4b39-9f88-03757a5c8092" name="Out" connectedTo="e93edd49-0ee6-4ce8-8027-a3e8bdb8febe" carrier="54a8aca4-2ed6-4622-87de-d1a87950a7f3"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="59872472-d520-49b1-ba30-577c56e6f938" name="Pipe_5987" innerDiameter="0.3127" outerDiameter="0.45" diameter="DN300" length="48.5">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="3cebf7c3-bc56-442b-a9df-a043d97050f1">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="03f7b7c5-7f9c-4a7c-853d-25210264820a" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="1432443e-691d-400f-b031-0e306ed498de"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" id="617f6f0b-0e9c-4714-af0e-b708592f533e" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" id="f1919bee-7399-4fe4-b5ad-630e2cafd58e" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" id="1244c50c-90f5-4158-8933-83fefa370800" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.07770414713449" lon="4.4137023812885054"/>
          <point xsi:type="esdl:Point" lat="52.07732673921941" lon="4.41405773202706"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="bf4ec5a4-fc17-4e25-9d1a-eb47d67c5c00" name="In" connectedTo="7ad8a0ad-e056-4e9c-b412-dfda10887f2d" carrier="d316c659-fde0-48c2-b689-351048075414"/>
        <port xsi:type="esdl:OutPort" id="cd923117-4116-42d4-baa7-cf9ac539efa9" name="Out" connectedTo="4639dcf5-da89-4905-8f03-79b709f3be72" carrier="d316c659-fde0-48c2-b689-351048075414"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
