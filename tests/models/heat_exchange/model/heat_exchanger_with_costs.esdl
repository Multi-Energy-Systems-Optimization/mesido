<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="hex" id="0735d19f-39a4-463d-bf28-cf0b28b88bef_with_return_network" description="" esdlVersion="v2207" version="11">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="b7ebaafe-597c-4055-bc88-b47cdfa84e34">
    <carriers xsi:type="esdl:Carriers" id="5d5909a4-18ec-4aa3-a08a-1e9539a20be2">
      <carrier xsi:type="esdl:HeatCommodity" id="d336e381-ca6f-442e-985e-9f4c2bec1efe" name="heat1" supplyTemperature="90.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="72126c73-87e9-4bf6-99cf-d02a6c07010c" name="heat2" supplyTemperature="70.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" returnTemperature="50.0" name="heat1_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" id="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" returnTemperature="40.0" name="heat2_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="96aea40e-c755-466e-b100-9870ffd07202">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" name="MultipleCarrierTest" id="82399ebf-5e52-465d-830a-b502d6c1012b">
    <area xsi:type="esdl:Area" id="e91b7896-ae7a-4136-8e96-d98d40c49fc2" name="MultipleCarrierTest">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_3322" id="3322fe41-f73b-4ba4-b87b-bf8315aa69e4" power="1100000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.09026545046112" lon="4.37633514404297"/>
        <port xsi:type="esdl:InPort" id="06b6b748-d052-4fd5-a017-ff76321284a9" name="In" connectedTo="43e98a06-8db5-43a1-913b-e8e7f255fc3f" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe">
          <profile xsi:type="esdl:InfluxDBProfile" measurement="Space Heat default profiles" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" host="https://profiles.warmingup.info" database="energy_profiles" filters="" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T22:00:00.000000+0000" id="a893e0f0-534a-4161-ab0e-3e64fe39adaa" profileType="INPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="01ea44bf-6f10-4913-bd41-5e5b210d3b40" name="Out" connectedTo="46e659aa-0e2b-43af-b38c-242cb7fdc480" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_18aa" id="18aabae2-c92a-4f55-ad80-4dce8be795e0" power="1100000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.08245983569832" lon="4.375905990600587"/>
        <port xsi:type="esdl:InPort" id="eb6769ba-4a7d-4e1a-8f89-0e1f60d86f32" name="In" connectedTo="9b760b7c-1e69-4653-b322-1aa3d4040be2" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c">
          <profile xsi:type="esdl:InfluxDBProfile" measurement="Space Heat default profiles" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" host="https://profiles.warmingup.info" database="energy_profiles" filters="" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T22:00:00.000000+0000" id="9bbecbba-77c0-421d-8783-2f15ad1b056a" profileType="INPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="a79a74b2-6ca2-4098-827b-7895d4ebb631" name="Out" connectedTo="48427c64-4346-46db-989a-d75df7faff3e" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" power="10000000.0" name="ResidualHeatSource_61b8" id="61b8d7e1-aa99-439e-86b2-ea596e728932">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.09084554299605" lon="4.400968551635743"/>
        <port xsi:type="esdl:OutPort" id="c932c77b-d5e5-40eb-b9c8-c67b8d0e25e9" name="Out" connectedTo="309f0881-e58e-4a63-a3c2-c9ca971d2150" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:InPort" id="7c3e792b-9c73-49af-9845-1ee16dcb2a27" name="In" connectedTo="167022d9-0487-4acf-80ae-c7268c44724a" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" power="200000.0" name="ResidualHeatSource_aec9" id="aec9bf5f-ce40-4a6e-b2d6-d64e566ce147">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.08245983569832" lon="4.400711059570313"/>
        <port xsi:type="esdl:OutPort" id="b466eb33-ed48-4685-bd88-63499e8e36db" name="Out" connectedTo="5692ae05-f9c4-4f28-8a53-21bcafedf9a9" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:InPort" id="12e2b556-699f-497e-aa86-2284936c3658" name="In" connectedTo="5f1b694c-4562-469e-a8b8-531cc9ea143b" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7ffe" id="7ffe304e-0363-4634-aef5-a5da3343d7f5">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.082407090414286" lon="4.388008117675782"/>
        <port xsi:type="esdl:InPort" id="5d0f5b7b-53b9-4999-82d1-0eee38a37791" name="In" connectedTo="28a0d33d-8b5e-431c-8e2a-c78a6fca3c31 1fb45b83-fc31-475f-9ced-0f9f17a2c454" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" id="2950515a-1a1e-4e7b-a53b-65af13db7a45" name="Out" connectedTo="dd5fcdd7-6779-4743-bee1-439e3df7d5ab" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_8581" id="8581fd27-994d-4848-a458-1dd8c8f1f684">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.09084554299605" lon="4.387664794921876"/>
        <port xsi:type="esdl:InPort" id="b0954a57-c90f-4601-837f-e593b3e90b51" name="In" connectedTo="1eac327d-7ab8-48b8-8d33-6445416dd352" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:OutPort" id="76930ec6-55eb-4a0e-8880-3ea0ef74a327" name="Out" connectedTo="c5ff5fe1-8e51-4292-b51a-599d10d1683d 7206613a-713e-42af-8c0e-ff16195ec3ad" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe1" length="908.9" id="Pipe1" innerDiameter="0.3127" outerDiameter="0.45" related="Pipe1_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.09084554299605" lon="4.400968551635743"/>
          <point xsi:type="esdl:Point" lat="52.09084554299605" lon="4.387664794921876"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="309f0881-e58e-4a63-a3c2-c9ca971d2150" name="In" connectedTo="c932c77b-d5e5-40eb-b9c8-c67b8d0e25e9" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:OutPort" id="1eac327d-7ab8-48b8-8d33-6445416dd352" name="Out" connectedTo="b0954a57-c90f-4601-837f-e593b3e90b51" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="febeba99-31d3-4dd3-bfad-0b95be773496">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe2" length="776.7" id="Pipe2" innerDiameter="0.3127" outerDiameter="0.45" related="Pipe2_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.09084554299605" lon="4.387664794921876"/>
          <point xsi:type="esdl:Point" lat="52.09026545046112" lon="4.37633514404297"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c5ff5fe1-8e51-4292-b51a-599d10d1683d" name="In" connectedTo="76930ec6-55eb-4a0e-8880-3ea0ef74a327" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:OutPort" id="43e98a06-8db5-43a1-913b-e8e7f255fc3f" name="Out" connectedTo="06b6b748-d052-4fd5-a017-ff76321284a9" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="1def15d6-d08b-488a-9448-51abda40cba3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe3" length="868.0" id="Pipe3" innerDiameter="0.3127" outerDiameter="0.45" related="Pipe3_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08245983569832" lon="4.400711059570313"/>
          <point xsi:type="esdl:Point" lat="52.082407090414286" lon="4.388008117675782"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="5692ae05-f9c4-4f28-8a53-21bcafedf9a9" name="In" connectedTo="b466eb33-ed48-4685-bd88-63499e8e36db" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" id="28a0d33d-8b5e-431c-8e2a-c78a6fca3c31" name="Out" connectedTo="5d0f5b7b-53b9-4999-82d1-0eee38a37791" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="56ae609b-7db1-4709-a514-6b3457f3509d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe4" length="827.0" id="Pipe4" innerDiameter="0.3127" outerDiameter="0.45" related="Pipe4_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.082407090414286" lon="4.388008117675782"/>
          <point xsi:type="esdl:Point" lat="52.08245983569832" lon="4.375905990600587"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="dd5fcdd7-6779-4743-bee1-439e3df7d5ab" name="In" connectedTo="2950515a-1a1e-4e7b-a53b-65af13db7a45" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" id="9b760b7c-1e69-4653-b322-1aa3d4040be2" name="Out" connectedTo="eb6769ba-4a7d-4e1a-8f89-0e1f60d86f32" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="47ce9c1a-2eaa-4905-9fd5-00f1ce0c5413">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7ffe_ret" id="0554c01f-71e6-4736-abc0-31cda8d834a7">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.08249709050428" lon="4.387485812242726"/>
        <port xsi:type="esdl:InPort" id="e9e1badb-a5a2-4637-8ce2-94a7b1564a54" name="ret_port" connectedTo="dee6c805-0d6e-40cc-ac57-836481b371e7" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" id="616137cf-6758-4091-abf1-220d21169b7a" name="ret_port" connectedTo="bd02ded1-f0ea-4192-b304-7d8c128eee0b f7beb290-c113-4f55-ad8b-7a3a6d096b23" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_8581_ret" id="cea5d37b-7edd-488f-a1d7-b37b9451459a">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.09093554308605" lon="4.38715944579282"/>
        <port xsi:type="esdl:OutPort" id="6f5b062b-a1e9-4d70-b743-1e43501a59fe" name="ret_port" connectedTo="3a4a6955-9073-46ee-bbc7-52b894bc21d1" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <port xsi:type="esdl:InPort" id="17cc66e1-5c3f-48d6-8aa3-3a19fb9b0c8e" name="ret_port" connectedTo="d4c09201-f88b-4c3a-99cf-594d5e188605 b7e1cb61-6809-4a3e-8053-3eac95fadcd4" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe1_ret" length="908.9" outerDiameter="0.45" innerDiameter="0.3127" id="Pipe1_ret" related="Pipe1">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.09093554308605" lon="4.38715944579282"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.09093554308605" lon="4.400463202506687"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="3a4a6955-9073-46ee-bbc7-52b894bc21d1" name="In_ret" connectedTo="6f5b062b-a1e9-4d70-b743-1e43501a59fe" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <port xsi:type="esdl:OutPort" id="167022d9-0487-4acf-80ae-c7268c44724a" name="Out_ret" connectedTo="7c3e792b-9c73-49af-9845-1ee16dcb2a27" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe2_ret" length="776.7" outerDiameter="0.45" innerDiameter="0.3127" id="Pipe2_ret" related="Pipe2">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.090355450551115" lon="4.375828665733543"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.09093554308605" lon="4.38715944579282"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="46e659aa-0e2b-43af-b38c-242cb7fdc480" name="In_ret" connectedTo="01ea44bf-6f10-4913-bd41-5e5b210d3b40" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <port xsi:type="esdl:OutPort" id="d4c09201-f88b-4c3a-99cf-594d5e188605" name="Out_ret" connectedTo="17cc66e1-5c3f-48d6-8aa3-3a19fb9b0c8e" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe3_ret" length="868.0" outerDiameter="0.45" innerDiameter="0.3127" id="Pipe3_ret" related="Pipe3">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.08249709050428" lon="4.387485812242726"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.08254983578832" lon="4.400188863774152"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="bd02ded1-f0ea-4192-b304-7d8c128eee0b" name="In_ret" connectedTo="616137cf-6758-4091-abf1-220d21169b7a" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" id="5f1b694c-4562-469e-a8b8-531cc9ea143b" name="Out_ret" connectedTo="12e2b556-699f-497e-aa86-2284936c3658" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe4_ret" length="827.0" outerDiameter="0.45" innerDiameter="0.3127" id="Pipe4_ret" related="Pipe4">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.08254983578832" lon="4.375383794804425"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.08249709050428" lon="4.387485812242726"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="48427c64-4346-46db-989a-d75df7faff3e" name="In_ret" connectedTo="a79a74b2-6ca2-4098-827b-7895d4ebb631" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" id="dee6c805-0d6e-40cc-ac57-836481b371e7" name="Out_ret" connectedTo="e9e1badb-a5a2-4637-8ce2-94a7b1564a54" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_ce68" length="455.2" id="ce6861d7-f06f-4391-adcf-bb1284c24718" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.387664794921876" lat="52.09084554299605"/>
          <point xsi:type="esdl:Point" lon="4.387589693069459" lat="52.08675177427041"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="7206613a-713e-42af-8c0e-ff16195ec3ad" name="In" connectedTo="76930ec6-55eb-4a0e-8880-3ea0ef74a327" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:OutPort" id="22daf91b-d674-4fe9-b35b-360a731c173b" name="Out" connectedTo="230bf10b-c2f5-4ef9-b865-2863133a8156" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="5888dfba-51d2-4562-b1f4-6b3965f20eba">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_408e" length="404.9" id="408e117a-809b-458e-bd9f-1ead868fc84a" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.387664794921876" lat="52.08633644341566"/>
          <point xsi:type="esdl:Point" lon="4.387879371643067" lat="52.08269718870518"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="5a64ebd4-90d9-471e-b413-5948c25cf9c8" name="In" connectedTo="e150e40b-4c79-4f88-8118-be593084f286" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" id="1fb45b83-fc31-475f-9ced-0f9f17a2c454" name="Out" connectedTo="5d0f5b7b-53b9-4999-82d1-0eee38a37791" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="3efcdead-3f3b-4972-b7e9-dd3dbebabb81">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_408e_ret" length="413.5" id="9a7df578-3001-4e0b-a902-fca2665bef9c" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3873000144958505" lat="52.08268400246011"/>
          <point xsi:type="esdl:Point" lon="4.387278556823731" lat="52.086402369206255"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="f7beb290-c113-4f55-ad8b-7a3a6d096b23" name="In" connectedTo="616137cf-6758-4091-abf1-220d21169b7a" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" id="96a5a980-06b9-4519-bc9b-c61e2f86537d" name="Out" connectedTo="3386f229-42cb-4bc5-9824-de3f2dc7cd7f" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="0970189c-8baa-4c65-83ab-d13e0b7c03c0">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_ce68_ret" length="436.9" id="71ef008d-7412-4db6-9d42-adba1a7f59d1" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.38732147216797" lat="52.0867319966983"/>
          <point xsi:type="esdl:Point" lon="4.387235641479493" lat="52.09066096891663"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="ef6d471c-ead8-4541-853e-f85dea09e2be" name="In" connectedTo="861b1adf-1050-48b7-821e-58eea67d479b" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <port xsi:type="esdl:OutPort" id="b7e1cb61-6809-4a3e-8053-3eac95fadcd4" name="Out" connectedTo="17cc66e1-5c3f-48d6-8aa3-3a19fb9b0c8e" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="52bf58f4-7c46-48f7-9f28-4590b6719641">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatExchange" name="HeatExchange_39ed" id="39ed1de8-8c7a-4e3c-8e52-45a0b209a176" heatTransferCoefficient="400000.0" efficiency="0.9" capacity="10000000.0" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.387479722499848" lat="52.086540813049496"/>
        <port xsi:type="esdl:InPort" id="230bf10b-c2f5-4ef9-b865-2863133a8156" name="PrimIn" connectedTo="22daf91b-d674-4fe9-b35b-360a731c173b" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:OutPort" id="861b1adf-1050-48b7-821e-58eea67d479b" name="PrimOut" connectedTo="ef6d471c-ead8-4541-853e-f85dea09e2be" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <port xsi:type="esdl:OutPort" id="e150e40b-4c79-4f88-8118-be593084f286" name="SecOut" connectedTo="5a64ebd4-90d9-471e-b413-5948c25cf9c8" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:InPort" id="3386f229-42cb-4bc5-9824-de3f2dc7cd7f" name="SecIn" connectedTo="96a5a980-06b9-4519-bc9b-c61e2f86537d" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="c989e997-8fd9-4c1e-b07c-c0ffdbc21ad7">
          <investmentCosts xsi:type="esdl:SingleValue" id="bcb4965f-6f3d-4b00-b72d-55c614f697c9" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="c868ecd4-4bba-4bb2-841a-b21e787c0292" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="98d42b1e-9f96-419b-a152-ff2bb026c4bd" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="78c91416-fa89-4d66-a506-920d3543fde1" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
