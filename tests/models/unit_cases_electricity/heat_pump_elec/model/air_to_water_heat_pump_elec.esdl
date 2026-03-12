<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="Untitled EnergySystem with return network" id="0735d19f-39a4-463d-bf28-cf0b28b88bef_with_return_network" description="" esdlVersion="v2207" version="10">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="b7ebaafe-597c-4055-bc88-b47cdfa84e34">
    <carriers xsi:type="esdl:Carriers" id="5d5909a4-18ec-4aa3-a08a-1e9539a20be2">
      <carrier xsi:type="esdl:HeatCommodity" id="72126c73-87e9-4bf6-99cf-d02a6c07010c" name="heat2" supplyTemperature="90.0"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="50.0" id="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" name="heat2_ret"/>
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="10000.0" id="3f149631-f5b5-48b4-934c-bb0faf3711b1" name="Electr"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" name="MultipleCarrierTest" id="82399ebf-5e52-465d-830a-b502d6c1012b">
    <area xsi:type="esdl:Area" id="e91b7896-ae7a-4136-8e96-d98d40c49fc2" name="MultipleCarrierTest">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_18aa" id="18aabae2-c92a-4f55-ad80-4dce8be795e0" power="10000000.0">
        <geometry xsi:type="esdl:Point" lon="4.375905990600587" lat="52.08245983569832" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="eb6769ba-4a7d-4e1a-8f89-0e1f60d86f32" name="In" connectedTo="9b760b7c-1e69-4653-b322-1aa3d4040be2" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" id="a79a74b2-6ca2-4098-827b-7895d4ebb631" name="Out" connectedTo="48427c64-4346-46db-989a-d75df7faff3e" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7ffe" id="7ffe304e-0363-4634-aef5-a5da3343d7f5">
        <geometry xsi:type="esdl:Point" lon="4.388008117675782" lat="52.082407090414286" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="5d0f5b7b-53b9-4999-82d1-0eee38a37791" name="In" connectedTo="1fb45b83-fc31-475f-9ced-0f9f17a2c454" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" id="2950515a-1a1e-4e7b-a53b-65af13db7a45" name="Out" connectedTo="dd5fcdd7-6779-4743-bee1-439e3df7d5ab" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe4" length="827.0" id="Pipe4" innerDiameter="0.3127" outerDiameter="0.45" related="Pipe4_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.388008117675782" lat="52.082407090414286"/>
          <point xsi:type="esdl:Point" lon="4.375905990600587" lat="52.08245983569832"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="dd5fcdd7-6779-4743-bee1-439e3df7d5ab" name="In" connectedTo="2950515a-1a1e-4e7b-a53b-65af13db7a45" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" id="9b760b7c-1e69-4653-b322-1aa3d4040be2" name="Out" connectedTo="eb6769ba-4a7d-4e1a-8f89-0e1f60d86f32" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="47ce9c1a-2eaa-4905-9fd5-00f1ce0c5413">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7ffe_ret" id="0554c01f-71e6-4736-abc0-31cda8d834a7">
        <geometry xsi:type="esdl:Point" lon="4.387485812242726" lat="52.08249709050428" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="e9e1badb-a5a2-4637-8ce2-94a7b1564a54" name="ret_port" connectedTo="dee6c805-0d6e-40cc-ac57-836481b371e7" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" id="616137cf-6758-4091-abf1-220d21169b7a" name="ret_port" connectedTo="f7beb290-c113-4f55-ad8b-7a3a6d096b23" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe4_ret" length="827.0" outerDiameter="0.45" innerDiameter="0.3127" id="Pipe4_ret" related="Pipe4">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.375383794804425" lat="52.08254983578832" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.387485812242726" lat="52.08249709050428" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="48427c64-4346-46db-989a-d75df7faff3e" name="In_ret" connectedTo="a79a74b2-6ca2-4098-827b-7895d4ebb631" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" id="dee6c805-0d6e-40cc-ac57-836481b371e7" name="Out_ret" connectedTo="e9e1badb-a5a2-4637-8ce2-94a7b1564a54" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_408e" length="404.9" id="408e117a-809b-458e-bd9f-1ead868fc84a" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08633644341566" lon="4.387664794921876"/>
          <point xsi:type="esdl:Point" lat="52.08269718870518" lon="4.387879371643067"/>
        </geometry>
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
        <port xsi:type="esdl:InPort" id="5a64ebd4-90d9-471e-b413-5948c25cf9c8" name="In" connectedTo="acb3d7ae-a298-440a-8e53-19a945b8a21c" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" id="1fb45b83-fc31-475f-9ced-0f9f17a2c454" name="Out" connectedTo="5d0f5b7b-53b9-4999-82d1-0eee38a37791" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="3efcdead-3f3b-4972-b7e9-dd3dbebabb81">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_408e_ret" length="413.5" id="9a7df578-3001-4e0b-a902-fca2665bef9c" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08268400246011" lon="4.3873000144958505"/>
          <point xsi:type="esdl:Point" lat="52.086402369206255" lon="4.387278556823731"/>
        </geometry>
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
        <port xsi:type="esdl:InPort" id="f7beb290-c113-4f55-ad8b-7a3a6d096b23" name="In" connectedTo="616137cf-6758-4091-abf1-220d21169b7a" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" id="96a5a980-06b9-4519-bc9b-c61e2f86537d" name="Out" connectedTo="4db5e40d-25ea-4f12-b03d-fc9f998b1042" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="0970189c-8baa-4c65-83ab-d13e0b7c03c0">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" power="1000000.0" name="ElectricityProducer_ac2e" id="ac2e9d27-fd81-4661-8487-642ef930d33c">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.08654042953765" lon="4.385293722152711"/>
        <port xsi:type="esdl:OutPort" id="7f499c86-9c84-409b-8cff-68180b0e55b5" name="Out" connectedTo="a7c8326f-36a3-4040-a37c-406685e438be" carrier="3f149631-f5b5-48b4-934c-bb0faf3711b1"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_9d3b" id="9d3befbb-16a9-416c-8ffc-215b4aab7f40" length="146.6" capacity="1420000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08654042953765" lon="4.385293722152711"/>
          <point xsi:type="esdl:Point" lat="52.08654740560273" lon="4.387439489364625"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a7c8326f-36a3-4040-a37c-406685e438be" name="In" connectedTo="7f499c86-9c84-409b-8cff-68180b0e55b5" carrier="3f149631-f5b5-48b4-934c-bb0faf3711b1"/>
        <port xsi:type="esdl:OutPort" id="b876ee97-9035-418c-bcaa-23d478872951" name="Out" connectedTo="1f85da0c-30cc-448b-8100-008c9539d7d1" carrier="3f149631-f5b5-48b4-934c-bb0faf3711b1"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="0ce62048-e054-4ad2-a75a-b114a077ad22" name="HeatPump_0ce6" power="10000000.0" COP="4.0">
        <geometry xsi:type="esdl:Point" lat="52.08658815670365" lon="4.388050741571075" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="4db5e40d-25ea-4f12-b03d-fc9f998b1042" name="SecIn" connectedTo="96a5a980-06b9-4519-bc9b-c61e2f86537d" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" id="acb3d7ae-a298-440a-8e53-19a945b8a21c" name="SecOut" connectedTo="5a64ebd4-90d9-471e-b413-5948c25cf9c8" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:InPort" id="1f85da0c-30cc-448b-8100-008c9539d7d1" name="ElectIn" connectedTo="b876ee97-9035-418c-bcaa-23d478872951" carrier="3f149631-f5b5-48b4-934c-bb0faf3711b1"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
