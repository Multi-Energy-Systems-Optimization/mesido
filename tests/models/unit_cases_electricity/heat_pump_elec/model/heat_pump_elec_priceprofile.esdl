<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2207" id="0735d19f-39a4-463d-bf28-cf0b28b88bef_with_return_network" version="11" description="" name="Untitled EnergySystem with return network">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="b7ebaafe-597c-4055-bc88-b47cdfa84e34">
    <carriers xsi:type="esdl:Carriers" id="5d5909a4-18ec-4aa3-a08a-1e9539a20be2">
      <carrier xsi:type="esdl:HeatCommodity" name="heat1" supplyTemperature="70.0" id="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
      <carrier xsi:type="esdl:HeatCommodity" name="heat2" supplyTemperature="90.0" id="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
      <carrier xsi:type="esdl:HeatCommodity" name="heat1_ret" returnTemperature="40.0" id="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" name="heat2_ret" returnTemperature="50.0" id="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      <carrier xsi:type="esdl:ElectricityCommodity" name="Electr" voltage="10000.0" id="3f149631-f5b5-48b4-934c-bb0faf3711b1">
        <cost xsi:type="esdl:InfluxDBProfile" filters="" host="http://influxdb" measurement="standard_profiles" field="E1A" port="8086" endDate="2019-12-31T22:00:00.000000+0000" database="energy_profiles" startDate="2018-12-31T23:00:00.000000+0000">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="3099d937-c42a-457d-9d51-1559e6559914" unit="EURO" description="Cost in EUR/kWh" physicalQuantity="COST" perMultiplier="KILO"/>
        </cost>
      </carrier>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="82399ebf-5e52-465d-830a-b502d6c1012b" name="MultipleCarrierTest">
    <area xsi:type="esdl:Area" id="e91b7896-ae7a-4136-8e96-d98d40c49fc2" name="MultipleCarrierTest">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_3322" power="10000000.0" id="3322fe41-f73b-4ba4-b87b-bf8315aa69e4">
        <port xsi:type="esdl:InPort" name="In" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="43e98a06-8db5-43a1-913b-e8e7f255fc3f" id="06b6b748-d052-4fd5-a017-ff76321284a9"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="46e659aa-0e2b-43af-b38c-242cb7fdc480" id="01ea44bf-6f10-4913-bd41-5e5b210d3b40"/>
        <geometry xsi:type="esdl:Point" lon="4.37633514404297" lat="52.09026545046112" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_18aa" power="10000000.0" id="18aabae2-c92a-4f55-ad80-4dce8be795e0">
        <port xsi:type="esdl:InPort" name="In" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="9b760b7c-1e69-4653-b322-1aa3d4040be2" id="eb6769ba-4a7d-4e1a-8f89-0e1f60d86f32"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="48427c64-4346-46db-989a-d75df7faff3e" id="a79a74b2-6ca2-4098-827b-7895d4ebb631"/>
        <geometry xsi:type="esdl:Point" lon="4.375905990600587" lat="52.08245983569832" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" name="ResidualHeatSource_61b8" power="10000000.0" id="61b8d7e1-aa99-439e-86b2-ea596e728932">
        <port xsi:type="esdl:OutPort" name="Out" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="309f0881-e58e-4a63-a3c2-c9ca971d2150" id="c932c77b-d5e5-40eb-b9c8-c67b8d0e25e9"/>
        <port xsi:type="esdl:InPort" name="In" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="167022d9-0487-4acf-80ae-c7268c44724a" id="7c3e792b-9c73-49af-9845-1ee16dcb2a27"/>
        <geometry xsi:type="esdl:Point" lon="4.400968551635743" lat="52.09084554299605" CRS="WGS84"/>
        <costInformation xsi:type="esdl:CostInformation" id="1648b6b8-c0de-4cbb-a2b5-8ddd82af3892">
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="100.0" id="d5fd9cc9-c7e3-4a47-850b-c32b12a96d04">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="73f099b4-80c1-4824-8b95-7f0b44c3ef16" unit="EURO" description="Cost in EUR/MWh" physicalQuantity="COST" perMultiplier="MEGA"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" name="ResidualHeatSource_aec9" power="10000000.0" id="aec9bf5f-ce40-4a6e-b2d6-d64e566ce147">
        <port xsi:type="esdl:OutPort" name="Out" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="5692ae05-f9c4-4f28-8a53-21bcafedf9a9" id="b466eb33-ed48-4685-bd88-63499e8e36db"/>
        <port xsi:type="esdl:InPort" name="In" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="5f1b694c-4562-469e-a8b8-531cc9ea143b" id="12e2b556-699f-497e-aa86-2284936c3658"/>
        <geometry xsi:type="esdl:Point" lon="4.400711059570313" lat="52.08245983569832" CRS="WGS84"/>
        <costInformation xsi:type="esdl:CostInformation" id="9050657d-1544-486c-9bf8-12859688c085">
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="300.0" id="4d5a57e1-016e-4577-9026-4fe1d4e95ce6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="4db62a39-e2af-4c76-8b73-f2f7f4cdb225" unit="EURO" description="Cost in EUR/MWh" physicalQuantity="COST" perMultiplier="MEGA"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7ffe" id="7ffe304e-0363-4634-aef5-a5da3343d7f5">
        <port xsi:type="esdl:InPort" name="In" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="28a0d33d-8b5e-431c-8e2a-c78a6fca3c31 1fb45b83-fc31-475f-9ced-0f9f17a2c454" id="5d0f5b7b-53b9-4999-82d1-0eee38a37791"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="dd5fcdd7-6779-4743-bee1-439e3df7d5ab" id="2950515a-1a1e-4e7b-a53b-65af13db7a45"/>
        <geometry xsi:type="esdl:Point" lon="4.388008117675782" lat="52.082407090414286" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_8581" id="8581fd27-994d-4848-a458-1dd8c8f1f684">
        <port xsi:type="esdl:InPort" name="In" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="1eac327d-7ab8-48b8-8d33-6445416dd352" id="b0954a57-c90f-4601-837f-e593b3e90b51"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="c5ff5fe1-8e51-4292-b51a-599d10d1683d 7206613a-713e-42af-8c0e-ff16195ec3ad" id="76930ec6-55eb-4a0e-8880-3ea0ef74a327"/>
        <geometry xsi:type="esdl:Point" lon="4.387664794921876" lat="52.09084554299605" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" innerDiameter="0.3127" name="Pipe1" length="908.9" related="Pipe1_ret" outerDiameter="0.45" id="Pipe1">
        <port xsi:type="esdl:InPort" name="In" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="c932c77b-d5e5-40eb-b9c8-c67b8d0e25e9" id="309f0881-e58e-4a63-a3c2-c9ca971d2150"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="b0954a57-c90f-4601-837f-e593b3e90b51" id="1eac327d-7ab8-48b8-8d33-6445416dd352"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.400968551635743" lat="52.09084554299605"/>
          <point xsi:type="esdl:Point" lon="4.387664794921876" lat="52.09084554299605"/>
        </geometry>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="febeba99-31d3-4dd3-bfad-0b95be773496">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" innerDiameter="0.3127" name="Pipe2" length="776.7" related="Pipe2_ret" outerDiameter="0.45" id="Pipe2">
        <port xsi:type="esdl:InPort" name="In" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="76930ec6-55eb-4a0e-8880-3ea0ef74a327" id="c5ff5fe1-8e51-4292-b51a-599d10d1683d"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="06b6b748-d052-4fd5-a017-ff76321284a9" id="43e98a06-8db5-43a1-913b-e8e7f255fc3f"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.387664794921876" lat="52.09084554299605"/>
          <point xsi:type="esdl:Point" lon="4.37633514404297" lat="52.09026545046112"/>
        </geometry>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="1def15d6-d08b-488a-9448-51abda40cba3">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" innerDiameter="0.3127" name="Pipe3" length="868.0" related="Pipe3_ret" outerDiameter="0.45" id="Pipe3">
        <port xsi:type="esdl:InPort" name="In" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="b466eb33-ed48-4685-bd88-63499e8e36db" id="5692ae05-f9c4-4f28-8a53-21bcafedf9a9"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="5d0f5b7b-53b9-4999-82d1-0eee38a37791" id="28a0d33d-8b5e-431c-8e2a-c78a6fca3c31"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.400711059570313" lat="52.08245983569832"/>
          <point xsi:type="esdl:Point" lon="4.388008117675782" lat="52.082407090414286"/>
        </geometry>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="56ae609b-7db1-4709-a514-6b3457f3509d">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" innerDiameter="0.3127" name="Pipe4" length="827.0" related="Pipe4_ret" outerDiameter="0.45" id="Pipe4">
        <port xsi:type="esdl:InPort" name="In" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="2950515a-1a1e-4e7b-a53b-65af13db7a45" id="dd5fcdd7-6779-4743-bee1-439e3df7d5ab"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="eb6769ba-4a7d-4e1a-8f89-0e1f60d86f32" id="9b760b7c-1e69-4653-b322-1aa3d4040be2"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.388008117675782" lat="52.082407090414286"/>
          <point xsi:type="esdl:Point" lon="4.375905990600587" lat="52.08245983569832"/>
        </geometry>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="47ce9c1a-2eaa-4905-9fd5-00f1ce0c5413">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7ffe_ret" id="0554c01f-71e6-4736-abc0-31cda8d834a7">
        <port xsi:type="esdl:InPort" name="ret_port" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="dee6c805-0d6e-40cc-ac57-836481b371e7" id="e9e1badb-a5a2-4637-8ce2-94a7b1564a54"/>
        <port xsi:type="esdl:OutPort" name="ret_port" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="bd02ded1-f0ea-4192-b304-7d8c128eee0b f7beb290-c113-4f55-ad8b-7a3a6d096b23" id="616137cf-6758-4091-abf1-220d21169b7a"/>
        <geometry xsi:type="esdl:Point" lon="4.387485812242726" lat="52.08249709050428" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_8581_ret" id="cea5d37b-7edd-488f-a1d7-b37b9451459a">
        <port xsi:type="esdl:OutPort" name="ret_port" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="3a4a6955-9073-46ee-bbc7-52b894bc21d1" id="6f5b062b-a1e9-4d70-b743-1e43501a59fe"/>
        <port xsi:type="esdl:InPort" name="ret_port" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="d4c09201-f88b-4c3a-99cf-594d5e188605 b7e1cb61-6809-4a3e-8053-3eac95fadcd4" id="17cc66e1-5c3f-48d6-8aa3-3a19fb9b0c8e"/>
        <geometry xsi:type="esdl:Point" lon="4.38715944579282" lat="52.09093554308605" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" innerDiameter="0.3127" name="Pipe1_ret" length="908.9" related="Pipe1" outerDiameter="0.45" id="Pipe1_ret">
        <port xsi:type="esdl:InPort" name="In_ret" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="6f5b062b-a1e9-4d70-b743-1e43501a59fe" id="3a4a6955-9073-46ee-bbc7-52b894bc21d1"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="7c3e792b-9c73-49af-9845-1ee16dcb2a27" id="167022d9-0487-4acf-80ae-c7268c44724a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.38715944579282" lat="52.09093554308605" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.400463202506687" lat="52.09093554308605" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" innerDiameter="0.3127" name="Pipe2_ret" length="776.7" related="Pipe2" outerDiameter="0.45" id="Pipe2_ret">
        <port xsi:type="esdl:InPort" name="In_ret" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="01ea44bf-6f10-4913-bd41-5e5b210d3b40" id="46e659aa-0e2b-43af-b38c-242cb7fdc480"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="17cc66e1-5c3f-48d6-8aa3-3a19fb9b0c8e" id="d4c09201-f88b-4c3a-99cf-594d5e188605"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.375828665733543" lat="52.090355450551115" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.38715944579282" lat="52.09093554308605" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" innerDiameter="0.3127" name="Pipe3_ret" length="868.0" related="Pipe3" outerDiameter="0.45" id="Pipe3_ret">
        <port xsi:type="esdl:InPort" name="In_ret" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="616137cf-6758-4091-abf1-220d21169b7a" id="bd02ded1-f0ea-4192-b304-7d8c128eee0b"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="12e2b556-699f-497e-aa86-2284936c3658" id="5f1b694c-4562-469e-a8b8-531cc9ea143b"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.387485812242726" lat="52.08249709050428" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.400188863774152" lat="52.08254983578832" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" innerDiameter="0.3127" name="Pipe4_ret" length="827.0" related="Pipe4" outerDiameter="0.45" id="Pipe4_ret">
        <port xsi:type="esdl:InPort" name="In_ret" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="a79a74b2-6ca2-4098-827b-7895d4ebb631" id="48427c64-4346-46db-989a-d75df7faff3e"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="e9e1badb-a5a2-4637-8ce2-94a7b1564a54" id="dee6c805-0d6e-40cc-ac57-836481b371e7"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.375383794804425" lat="52.08254983578832" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.387485812242726" lat="52.08249709050428" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" length="455.2" name="Pipe_ce68" innerDiameter="0.3127" outerDiameter="0.45" id="ce6861d7-f06f-4391-adcf-bb1284c24718">
        <port xsi:type="esdl:InPort" name="In" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="76930ec6-55eb-4a0e-8880-3ea0ef74a327" id="7206613a-713e-42af-8c0e-ff16195ec3ad"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="59f661b5-9a21-4054-8af9-3ee8858f9960" id="22daf91b-d674-4fe9-b35b-360a731c173b"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.387664794921876" lat="52.09084554299605"/>
          <point xsi:type="esdl:Point" lon="4.387589693069459" lat="52.08675177427041"/>
        </geometry>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="5888dfba-51d2-4562-b1f4-6b3965f20eba">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" length="404.9" name="Pipe_408e" innerDiameter="0.3127" outerDiameter="0.45" id="408e117a-809b-458e-bd9f-1ead868fc84a">
        <port xsi:type="esdl:InPort" name="In" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="80cfef3d-79d3-4d2c-b78d-701264cf3313" id="5a64ebd4-90d9-471e-b413-5948c25cf9c8"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="5d0f5b7b-53b9-4999-82d1-0eee38a37791" id="1fb45b83-fc31-475f-9ced-0f9f17a2c454"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.387664794921876" lat="52.08633644341566"/>
          <point xsi:type="esdl:Point" lon="4.387879371643067" lat="52.08269718870518"/>
        </geometry>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="3efcdead-3f3b-4972-b7e9-dd3dbebabb81">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" length="413.5" name="Pipe_408e_ret" innerDiameter="0.3127" outerDiameter="0.45" id="9a7df578-3001-4e0b-a902-fca2665bef9c">
        <port xsi:type="esdl:InPort" name="In" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="616137cf-6758-4091-abf1-220d21169b7a" id="f7beb290-c113-4f55-ad8b-7a3a6d096b23"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="0500e037-457c-418b-9a55-d7ed0d34a98a" id="96a5a980-06b9-4519-bc9b-c61e2f86537d"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3873000144958505" lat="52.08268400246011"/>
          <point xsi:type="esdl:Point" lon="4.387278556823731" lat="52.086402369206255"/>
        </geometry>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="0970189c-8baa-4c65-83ab-d13e0b7c03c0">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" length="436.9" name="Pipe_ce68_ret" innerDiameter="0.3127" outerDiameter="0.45" id="71ef008d-7412-4db6-9d42-adba1a7f59d1">
        <port xsi:type="esdl:InPort" name="In" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="76ab7560-39a3-4095-81a2-6afd87603fcd" id="ef6d471c-ead8-4541-853e-f85dea09e2be"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="17cc66e1-5c3f-48d6-8aa3-3a19fb9b0c8e" id="b7e1cb61-6809-4a3e-8053-3eac95fadcd4"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.38732147216797" lat="52.0867319966983"/>
          <point xsi:type="esdl:Point" lon="4.387235641479493" lat="52.09066096891663"/>
        </geometry>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="52bf58f4-7c46-48f7-9f28-4590b6719641">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatPump" power="10000000.0" name="GenericConversion_3d3f" COP="4.0" id="3d3f6e8e-a8cb-48c4-9c6a-fc0d7848e549">
        <geometry xsi:type="esdl:Point" lon="4.387439489364625" lat="52.08654740560273" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" name="HeatInPrimary" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe" connectedTo="22daf91b-d674-4fe9-b35b-360a731c173b" id="59f661b5-9a21-4054-8af9-3ee8858f9960"/>
        <port xsi:type="esdl:InPort" name="HeatInSecondary" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" connectedTo="96a5a980-06b9-4519-bc9b-c61e2f86537d" id="0500e037-457c-418b-9a55-d7ed0d34a98a"/>
        <port xsi:type="esdl:OutPort" name="HeatOutPrimary" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" connectedTo="ef6d471c-ead8-4541-853e-f85dea09e2be" id="76ab7560-39a3-4095-81a2-6afd87603fcd"/>
        <port xsi:type="esdl:OutPort" name="HeatOutSecondary" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c" connectedTo="5a64ebd4-90d9-471e-b413-5948c25cf9c8" id="80cfef3d-79d3-4d2c-b78d-701264cf3313"/>
        <costInformation xsi:type="esdl:CostInformation" id="5ea5b708-df14-4b4a-a50b-d7761bdc208a">
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="1.0" id="38971794-4d8d-46db-9cda-31e865fb9484">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="dc9d53c1-7160-410c-8871-6d1933cd781f" unit="EURO" description="Cost in EUR/MWh" physicalQuantity="COST" perMultiplier="MEGA"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
