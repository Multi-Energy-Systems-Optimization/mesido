<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="03386224-685c-4f3b-bcc0-3c9dc63110de_with_return_network_with_return_network" description="" esdlVersion="v2401" name="Untitled EnergySystem with return network with return network" version="4">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="ad1a8ca8-b21b-4ad3-aa3e-756cf321bd4d">
    <carriers xsi:type="esdl:Carriers" id="553fa302-8878-4fa9-b0ca-6ee6123bf2c9">
      <carrier xsi:type="esdl:HeatCommodity" id="13db0822-98da-4ca8-9d48-868653ae06af" supplyTemperature="25.0" name="LT"/>
      <carrier xsi:type="esdl:HeatCommodity" id="13db0822-98da-4ca8-9d48-868653ae06af_ret" returnTemperature="6.0" name="LT_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="632648b0-a234-4e0c-b3a2-f18a6dee2700">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="POWER" multiplier="MEGA" unit="WATT" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="d1a23619-2ef0-4172-8bab-25dfc28a64e1" name="Untitled Instance">
    <area xsi:type="esdl:Area" name="Untitled Area" id="4f36ae5d-6dc1-465d-8fc0-f5459d5c3e27">
      <asset xsi:type="esdl:CoolingDemand" name="CoolingDemand_15e8" id="15e803b4-1224-4cac-979f-87747a656741" power="5000000.0">
        <port xsi:type="esdl:InPort" id="4e4b0784-2205-4937-af8c-35f33f7c20b8" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In" connectedTo="3dbef4b6-db6a-4523-839c-230ae726ecb3"/>
        <port xsi:type="esdl:OutPort" id="167a5468-c9b4-46c4-9815-1fbdeeb50420" connectedTo="3936b21e-4331-4761-9ca0-331f15e50fbc" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="52.07984886931361" lon="4.4191861152648935" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ATES" maxChargeRate="5000000.0" name="ATES_226d" maxStorageTemperature="30.0" minStorageTemperature="6.0" id="226d58d1-28e5-4d73-9e72-3aaf3a5c67ff" maxDischargeRate="5000000.0">
        <port xsi:type="esdl:InPort" id="39616896-fb2c-470e-9567-25233db228af" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="75bbfd0f-ddc3-4f9b-aae3-92146fe1d3ae"/>
        <port xsi:type="esdl:OutPort" id="316be022-cc67-4336-9d1b-6898bda3cd96" connectedTo="28ea57f1-1acd-419c-9c3f-4cb24f58aa60" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="52.077079495639495" lon="4.418177604675294" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" name="HeatPump_b97e" power="200000.0" id="b97e7c4f-fff5-4e4a-bc64-830563f94e4c" COP="4.0">
        <port xsi:type="esdl:InPort" id="2083140e-6ddb-4d26-a788-a36ebcf65b80" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="SecIn" connectedTo="1edf7d57-4146-4087-8b38-f45fb56a63eb"/>
        <port xsi:type="esdl:OutPort" id="ad87a98f-e6a7-4688-9989-ea8a17a85afc" connectedTo="5f8fe6d0-24eb-4427-b47e-1bf4972e7c56" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="SecOut"/>
        <geometry xsi:type="esdl:Point" lat="52.07816089056798" lon="4.413928985595704"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_913e" id="913edda0-8cf9-4291-9ade-011751929a4b">
        <port xsi:type="esdl:InPort" id="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="cebfd2bb-36c6-4283-aa12-0072778d2e95 a645be6e-33b1-4419-bafe-6da887ee76d8"/>
        <port xsi:type="esdl:OutPort" id="2925bc5d-077c-4603-9d9e-1f452926f504" connectedTo="f7e9711a-68dc-4a2a-b4da-e5df4b654231" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" name="Pipe1" diameter="DN300" length="275.2" id="Pipe1" innerDiameter="0.3127" related="Pipe1_ret">
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="fce3b21d-38df-4e01-b967-ea4e55b3855b">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" perUnit="METRE" unit="EURO" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="5f8fe6d0-24eb-4427-b47e-1bf4972e7c56" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="ad87a98f-e6a7-4688-9989-ea8a17a85afc"/>
        <port xsi:type="esdl:OutPort" id="cebfd2bb-36c6-4283-aa12-0072778d2e95" connectedTo="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
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
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.07816089056798" lon="4.413928985595704"/>
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" name="Pipe2" diameter="DN300" length="144.6" id="Pipe2" innerDiameter="0.3127" related="Pipe2_ret">
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="78685bc9-6a50-4416-a072-99471d45aa7d">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" perUnit="METRE" unit="EURO" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="f7e9711a-68dc-4a2a-b4da-e5df4b654231" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504"/>
        <port xsi:type="esdl:OutPort" id="75bbfd0f-ddc3-4f9b-aae3-92146fe1d3ae" connectedTo="39616896-fb2c-470e-9567-25233db228af" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
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
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
          <point xsi:type="esdl:Point" lat="52.077079495639495" lon="4.418177604675294"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" name="Pipe5" diameter="DN300" length="184.9" id="Pipe5" innerDiameter="0.3127" related="Pipe5_ret">
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="04255a0d-80bb-4a2a-bfe9-4872ae3b5c78">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" perUnit="METRE" unit="EURO" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="3936b21e-4331-4761-9ca0-331f15e50fbc" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In" connectedTo="167a5468-c9b4-46c4-9815-1fbdeeb50420"/>
        <port xsi:type="esdl:OutPort" id="a645be6e-33b1-4419-bafe-6da887ee76d8" connectedTo="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
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
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.07984886931361" lon="4.4191861152648935"/>
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_913e_ret" id="c61783ce-a103-4e8e-891b-ddfe38de058c">
        <port xsi:type="esdl:OutPort" id="b277a00f-e86a-4883-9144-5b1babedcbce" connectedTo="fbfe6e62-f704-4464-979a-eb216355f77a d49c2f1a-3aa5-4da9-9e09-557a19b250e7" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="ret_port"/>
        <port xsi:type="esdl:InPort" id="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="ret_port" connectedTo="3c9adef3-edd3-432c-968d-36965d175403"/>
        <geometry xsi:type="esdl:Point" lat="52.07846189149198" lon="4.417410734103896" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" name="Pipe1_ret" diameter="DN300" length="275.2" id="Pipe1_ret" innerDiameter="0.3127" related="Pipe1">
        <port xsi:type="esdl:InPort" id="fbfe6e62-f704-4464-979a-eb216355f77a" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret" connectedTo="b277a00f-e86a-4883-9144-5b1babedcbce"/>
        <port xsi:type="esdl:OutPort" id="1edf7d57-4146-4087-8b38-f45fb56a63eb" connectedTo="2083140e-6ddb-4d26-a788-a36ebcf65b80" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
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
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.07846189149198" lon="4.417410734103896" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.078250890657976" lon="4.413397695431759" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" name="Pipe2_ret" diameter="DN300" length="144.6" id="Pipe2_ret" innerDiameter="0.3127" related="Pipe2">
        <port xsi:type="esdl:InPort" id="28ea57f1-1acd-419c-9c3f-4cb24f58aa60" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret" connectedTo="316be022-cc67-4336-9d1b-6898bda3cd96"/>
        <port xsi:type="esdl:OutPort" id="3c9adef3-edd3-432c-968d-36965d175403" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
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
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.07716949572949" lon="4.417643975184299" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.07846189149198" lon="4.417410734103896" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" name="Pipe5_ret" diameter="DN300" length="184.9" id="Pipe5_ret" innerDiameter="0.3127" related="Pipe5">
        <port xsi:type="esdl:InPort" id="d49c2f1a-3aa5-4da9-9e09-557a19b250e7" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret" connectedTo="b277a00f-e86a-4883-9144-5b1babedcbce"/>
        <port xsi:type="esdl:OutPort" id="3dbef4b6-db6a-4523-839c-230ae726ecb3" connectedTo="4e4b0784-2205-4937-af8c-35f33f7c20b8" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
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
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.07846189149198" lon="4.417410734103896" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.079938869403605" lon="4.418658434678616" CRS="WGS84"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
