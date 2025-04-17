<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="3" id="03386224-685c-4f3b-bcc0-3c9dc63110de_with_return_network_with_return_network" description="" esdlVersion="v2401" name="Untitled EnergySystem with return network with return network">
  <instance xsi:type="esdl:Instance" id="d1a23619-2ef0-4172-8bab-25dfc28a64e1" name="Untitled Instance">
    <area xsi:type="esdl:Area" name="Untitled Area" id="4f36ae5d-6dc1-465d-8fc0-f5459d5c3e27">
      <asset xsi:type="esdl:HeatingDemand" power="5000000.0" name="HeatingDemand_9b90" id="9b904958-feed-40d0-934e-fe4e4420d916">
        <geometry xsi:type="esdl:Point" lat="52.079796120944025" lon="4.41802740097046" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="8fc5dd57-acc8-4de5-8a00-2df5da7a57c1" id="62f09402-d0ef-455c-86e7-e1b8f39a5542" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In"/>
        <port xsi:type="esdl:OutPort" id="8e360471-beba-4bcf-bbd3-466259c51b5b" connectedTo="5d7d8d7e-9009-404d-bdac-cbbc1c8fab40" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out"/>
      </asset>
      <asset xsi:type="esdl:CoolingDemand" power="5000000.0" name="CoolingDemand_15e8" id="15e803b4-1224-4cac-979f-87747a656741">
        <geometry xsi:type="esdl:Point" lat="52.07984886931361" lon="4.4191861152648935" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="3dbef4b6-db6a-4523-839c-230ae726ecb3" id="4e4b0784-2205-4937-af8c-35f33f7c20b8" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="167a5468-c9b4-46c4-9815-1fbdeeb50420" connectedTo="3936b21e-4331-4761-9ca0-331f15e50fbc" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" name="HeatPump_b97e" power="6000000.0" id="b97e7c4f-fff5-4e4a-bc64-830563f94e4c" COP="15.0">
        <geometry xsi:type="esdl:Point" lat="52.07816089056798" lon="4.413928985595704"/>
        <port xsi:type="esdl:InPort" connectedTo="1edf7d57-4146-4087-8b38-f45fb56a63eb" id="2083140e-6ddb-4d26-a788-a36ebcf65b80" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="SecIn"/>
        <port xsi:type="esdl:OutPort" id="ad87a98f-e6a7-4688-9989-ea8a17a85afc" connectedTo="5f8fe6d0-24eb-4427-b47e-1bf4972e7c56" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="SecOut"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_913e" id="913edda0-8cf9-4291-9ade-011751929a4b">
        <geometry xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="cebfd2bb-36c6-4283-aa12-0072778d2e95 a645be6e-33b1-4419-bafe-6da887ee76d8" id="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In"/>
        <port xsi:type="esdl:OutPort" id="2925bc5d-077c-4603-9d9e-1f452926f504" connectedTo="f7e9711a-68dc-4a2a-b4da-e5df4b654231 09db6bab-d5f2-4002-8d0f-bc959d690380" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe1_ret" outerDiameter="0.45" name="Pipe1" innerDiameter="0.3127" diameter="DN300" length="275.2" id="Pipe1">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.07816089056798" lon="4.413928985595704"/>
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="fce3b21d-38df-4e01-b967-ea4e55b3855b">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="ad87a98f-e6a7-4688-9989-ea8a17a85afc" id="5f8fe6d0-24eb-4427-b47e-1bf4972e7c56" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In"/>
        <port xsi:type="esdl:OutPort" id="cebfd2bb-36c6-4283-aa12-0072778d2e95" connectedTo="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe2_ret" outerDiameter="0.45" name="Pipe2" innerDiameter="0.3127" diameter="DN300" length="144.6" id="Pipe2">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
          <point xsi:type="esdl:Point" lat="52.077079495639495" lon="4.418177604675294"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="78685bc9-6a50-4416-a072-99471d45aa7d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504" id="f7e9711a-68dc-4a2a-b4da-e5df4b654231" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In"/>
        <port xsi:type="esdl:OutPort" id="75bbfd0f-ddc3-4f9b-aae3-92146fe1d3ae" connectedTo="1bb039c9-11d1-44a6-946e-ab6a81a03857" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe4_ret" outerDiameter="0.45" name="Pipe4" innerDiameter="0.3127" diameter="DN300" length="158.5" id="Pipe4">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
          <point xsi:type="esdl:Point" lat="52.079796120944025" lon="4.41802740097046"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="52fdab92-700f-4526-bde2-77e3b258e161">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="2925bc5d-077c-4603-9d9e-1f452926f504" id="09db6bab-d5f2-4002-8d0f-bc959d690380" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In"/>
        <port xsi:type="esdl:OutPort" id="8fc5dd57-acc8-4de5-8a00-2df5da7a57c1" connectedTo="62f09402-d0ef-455c-86e7-e1b8f39a5542" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe5_ret" outerDiameter="0.45" name="Pipe5" innerDiameter="0.3127" diameter="DN300" length="184.9" id="Pipe5">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.07984886931361" lon="4.4191861152648935"/>
          <point xsi:type="esdl:Point" lat="52.078371891401986" lon="4.417941570281983"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="04255a0d-80bb-4a2a-bfe9-4872ae3b5c78">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="167a5468-c9b4-46c4-9815-1fbdeeb50420" id="3936b21e-4331-4761-9ca0-331f15e50fbc" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In"/>
        <port xsi:type="esdl:OutPort" id="a645be6e-33b1-4419-bafe-6da887ee76d8" connectedTo="58635b77-b097-459d-995d-58eedde3a267" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_913e_ret" id="c61783ce-a103-4e8e-891b-ddfe38de058c">
        <geometry xsi:type="esdl:Point" lat="52.07846189149198" lon="4.417410734103896" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="b277a00f-e86a-4883-9144-5b1babedcbce" connectedTo="fbfe6e62-f704-4464-979a-eb216355f77a d49c2f1a-3aa5-4da9-9e09-557a19b250e7" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="ret_port"/>
        <port xsi:type="esdl:InPort" connectedTo="3c9adef3-edd3-432c-968d-36965d175403 4413213a-dd86-4504-9211-7053b9199c05" id="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="ret_port"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe1" outerDiameter="0.45" name="Pipe1_ret" innerDiameter="0.3127" diameter="DN300" length="275.2" id="Pipe1_ret">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.07846189149198" lon="4.417410734103896" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.078250890657976" lon="4.413397695431759" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="b277a00f-e86a-4883-9144-5b1babedcbce" id="fbfe6e62-f704-4464-979a-eb216355f77a" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="1edf7d57-4146-4087-8b38-f45fb56a63eb" connectedTo="2083140e-6ddb-4d26-a788-a36ebcf65b80" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe2" outerDiameter="0.45" name="Pipe2_ret" innerDiameter="0.3127" diameter="DN300" length="144.6" id="Pipe2_ret">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.07716949572949" lon="4.417643975184299" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.07846189149198" lon="4.417410734103896" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="7b6957df-f153-409f-8360-925237d913e1" id="28ea57f1-1acd-419c-9c3f-4cb24f58aa60" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="3c9adef3-edd3-432c-968d-36965d175403" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe4" outerDiameter="0.45" name="Pipe4_ret" innerDiameter="0.3127" diameter="DN300" length="158.5" id="Pipe4_ret">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.07988612103402" lon="4.417499608352213" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.07846189149198" lon="4.417410734103896" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="8e360471-beba-4bcf-bbd3-466259c51b5b" id="5d7d8d7e-9009-404d-bdac-cbbc1c8fab40" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="4413213a-dd86-4504-9211-7053b9199c05" connectedTo="593e5e00-ff2e-432b-8bea-e6912b18be74" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe5" outerDiameter="0.45" name="Pipe5_ret" innerDiameter="0.3127" diameter="DN300" length="184.9" id="Pipe5_ret">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.07846189149198" lon="4.417410734103896" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.079938869403605" lon="4.418658434678616" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="b277a00f-e86a-4883-9144-5b1babedcbce" id="d49c2f1a-3aa5-4da9-9e09-557a19b250e7" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="3dbef4b6-db6a-4523-839c-230ae726ecb3" connectedTo="4e4b0784-2205-4937-af8c-35f33f7c20b8" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Airco" name="Airco_e5f3" power="6000000.0" id="e5f353c2-6471-45a2-8015-6555776d8ddd">
        <geometry xsi:type="esdl:Point" lat="52.07697728927605" lon="4.417882561683656" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="75bbfd0f-ddc3-4f9b-aae3-92146fe1d3ae" id="1bb039c9-11d1-44a6-946e-ab6a81a03857" carrier="13db0822-98da-4ca8-9d48-868653ae06af" name="In"/>
        <port xsi:type="esdl:OutPort" id="7b6957df-f153-409f-8360-925237d913e1" connectedTo="28ea57f1-1acd-419c-9c3f-4cb24f58aa60" carrier="13db0822-98da-4ca8-9d48-868653ae06af_ret" name="Out"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="ad1a8ca8-b21b-4ad3-aa3e-756cf321bd4d">
    <carriers xsi:type="esdl:Carriers" id="553fa302-8878-4fa9-b0ca-6ee6123bf2c9">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="25.0" name="LT" id="13db0822-98da-4ca8-9d48-868653ae06af"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="6.0" name="LT_ret" id="13db0822-98da-4ca8-9d48-868653ae06af_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="632648b0-a234-4e0c-b3a2-f18a6dee2700">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Power in MW" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" physicalQuantity="POWER" multiplier="MEGA" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
</esdl:EnergySystem>
