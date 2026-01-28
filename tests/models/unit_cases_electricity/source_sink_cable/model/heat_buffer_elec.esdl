<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2107" version="4" name="heat_buffer_elec" id="b9a86f6b-02b4-4ab3-b2f3-608647c28e0e" description="Single source, single sink">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="2bb5f647-e4ff-490a-9642-ccf9274d9c40">
    <carriers xsi:type="esdl:Carriers" id="f6672aa2-7723-4945-92fa-b99846f58c92">
      <carrier xsi:type="esdl:HeatCommodity" id="61648667-0e75-4ba0-83ed-7f2f85ce52b4" name="heat" supplyTemperature="60.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="6b411434-803a-4b8d-acc4-04540a8d9d2c" name="heat_ret" returnTemperature="20.0"/>
      <carrier xsi:type="esdl:ElectricityCommodity" id="2e36ba41-d789-4616-9dd3-bea287fe93dd" name="electricity" voltage="230.0"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="67052ed2-f139-4936-9cd8-b4c419bf2cfa" name="Untitled instance">
    <area xsi:type="esdl:Area" id="960acb90-32e0-4754-821d-f53e5567974b" name="Untitled area">
      <asset xsi:type="esdl:ElectricityProducer" name="ElectricityProducer" id="b95dc1f7-e189-4745-8c12-3d626faf4d44" power="1000.0">
        <geometry xsi:type="esdl:Point" lat="51.964489525013285" lon="4.416375169668406"/>
        <port xsi:type="esdl:OutPort" name="Out" id="ee8afa6b-b78b-42fc-acaa-8b47e8680c19" carrier="2e36ba41-d789-4616-9dd3-bea287fe93dd" connectedTo="95ffe271-8f70-454f-8241-32064da202b4"/>
      </asset>
      <asset xsi:type="esdl:HeatStorage" id="08fde5ad-2f2a-4c8e-827b-462169dcb857" name="HeatStorage" volume="300.0">
        <geometry xsi:type="esdl:Point" lat="51.96481888597907" lon="4.417175984325393" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="649b7974-2f0e-4262-a6a1-bbf82e6a8bb6" name="In" connectedTo="b7746c8c-d181-4022-8035-55e37f2d11c7" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
        <port xsi:type="esdl:OutPort" id="b68e03f0-d114-46dc-9c3c-07e3ffb0d32a" name="Out" connectedTo="ce37a39e-ff8c-4adc-a5ce-c8bdc6b224f4" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
        <port xsi:type="esdl:InPort" id="a2dbf403-13e9-4ec2-a837-94243cd33d83" name="ElecIn" connectedTo="fe4e639c-dbc2-4578-b6a9-22806eb5a891" carrier="2e36ba41-d789-4616-9dd3-bea287fe93dd"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="a17f07bd-864b-4164-bc22-0a6638089d7c" name="HeatingDemand" power="2000.0">
        <geometry xsi:type="esdl:Point" lat="51.96523693699031" lon="4.418153458591881"/>
        <port xsi:type="esdl:InPort" id="4c123d6c-8d8a-4bb4-ae1a-8e3c47edb9a5" name="In" connectedTo="c81011c4-41dc-423f-9b87-0ff4cf3355b0" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
        <port xsi:type="esdl:OutPort" id="897f5514-e932-4969-84e0-142875a77a64" name="Out" connectedTo="b5ce5f45-b45a-4f1c-a953-0f1308ef5b91" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="86283c96-3246-40ab-9ff9-3e2ec594b2be" name="Pipe" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="86.2">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="3e46b9d7-3f55-4122-b29b-d0d035f83566">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="fb340208-224c-4c70-8516-55eb99e66861">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="96f4baa3-7000-4c7e-8452-9f59b95e315d"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="276440ea-e895-4191-a6a9-a56f9922fc93" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="d0d07900-17ee-494d-bc3f-4c6c603ce85b" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="be725a0f-c435-40b0-abdd-146e50369be4" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.96481888597907" lon="4.417175984325393"/>
          <point xsi:type="esdl:Point" lat="51.96482189695884" lon="4.417322783865157"/>
          <point xsi:type="esdl:Point" lat="51.96515565930151" lon="4.418138235262684"/>
          <point xsi:type="esdl:Point" lat="51.96523693699031" lon="4.418153458591881"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ce37a39e-ff8c-4adc-a5ce-c8bdc6b224f4" name="In" connectedTo="b68e03f0-d114-46dc-9c3c-07e3ffb0d32a" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
        <port xsi:type="esdl:OutPort" id="c81011c4-41dc-423f-9b87-0ff4cf3355b0" name="Out" connectedTo="4c123d6c-8d8a-4bb4-ae1a-8e3c47edb9a5" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="4b4cf205-c8ae-49ee-ac9c-d2c99beaf2c1" name="Pipe_ret" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="85.4">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="5b6cb04b-a604-43a0-8131-45677e2a523d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="5c1fc987-2cdc-47b1-91b9-120deed61881">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="6773c9f6-63ca-4d76-b2a6-cb10a4b5805c"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="5ae4543c-941e-4c42-b858-4efc88b6b7dd" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="41c25476-5d7d-406f-b16c-5e356fd43cb0" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="f28d824a-f5e7-4b13-8f28-df3145d76a78" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.96523693699031" lon="4.418153458591881"/>
          <point xsi:type="esdl:Point" lat="51.96524653475641" lon="4.418022891808456"/>
          <point xsi:type="esdl:Point" lat="51.96490285933959" lon="4.417231582064126"/>
          <point xsi:type="esdl:Point" lat="51.96481888597907" lon="4.417175984325393"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="b5ce5f45-b45a-4f1c-a953-0f1308ef5b91" name="In" connectedTo="897f5514-e932-4969-84e0-142875a77a64" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
        <port xsi:type="esdl:OutPort" id="b7746c8c-d181-4022-8035-55e37f2d11c7" name="Out" connectedTo="649b7974-2f0e-4262-a6a1-bbf82e6a8bb6" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="9188fef8-84fe-45c4-a75f-032f6e012914" name="ElectricityCable_9188" length="66.0" capacity="2000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.964489525013285" lon="4.416375169668406"/>
          <point xsi:type="esdl:Point" lat="51.96481888597907" lon="4.417175984325393"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="95ffe271-8f70-454f-8241-32064da202b4" name="In" connectedTo="ee8afa6b-b78b-42fc-acaa-8b47e8680c19" carrier="2e36ba41-d789-4616-9dd3-bea287fe93dd"/>
        <port xsi:type="esdl:OutPort" id="fe4e639c-dbc2-4578-b6a9-22806eb5a891" name="Out" connectedTo="a2dbf403-13e9-4ec2-a837-94243cd33d83" carrier="2e36ba41-d789-4616-9dd3-bea287fe93dd"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
