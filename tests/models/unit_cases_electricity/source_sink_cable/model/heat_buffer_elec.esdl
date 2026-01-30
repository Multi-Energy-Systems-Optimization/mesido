<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2107" version="8" name="heat_buffer_elec" id="b9a86f6b-02b4-4ab3-b2f3-608647c28e0e" description="Single source, single sink">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="2bb5f647-e4ff-490a-9642-ccf9274d9c40">
    <carriers xsi:type="esdl:Carriers" id="f6672aa2-7723-4945-92fa-b99846f58c92">
      <carrier xsi:type="esdl:HeatCommodity" id="61648667-0e75-4ba0-83ed-7f2f85ce52b4" name="Heat" supplyTemperature="70.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="6b411434-803a-4b8d-acc4-04540a8d9d2c" name="Heat_ret" returnTemperature="40.0"/>
      <carrier xsi:type="esdl:ElectricityCommodity" id="2e36ba41-d789-4616-9dd3-bea287fe93dd" name="Electricity" voltage="230.0"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="67052ed2-f139-4936-9cd8-b4c419bf2cfa" name="Untitled instance">
    <area xsi:type="esdl:Area" id="960acb90-32e0-4754-821d-f53e5567974b" name="Untitled area">
      <asset xsi:type="esdl:ElectricityProducer" name="ElectricityProducer" id="b95dc1f7-e189-4745-8c12-3d626faf4d44" power="3000.0">
        <geometry xsi:type="esdl:Point" lat="51.964489525013285" lon="4.416375169668406"/>
        <port xsi:type="esdl:OutPort" name="Out" id="ee8afa6b-b78b-42fc-acaa-8b47e8680c19" carrier="2e36ba41-d789-4616-9dd3-bea287fe93dd" connectedTo="95ffe271-8f70-454f-8241-32064da202b4"/>
      </asset>
      <asset xsi:type="esdl:HeatStorage" id="08fde5ad-2f2a-4c8e-827b-462169dcb857" name="HeatStorage" volume="3000.0">
        <geometry xsi:type="esdl:Point" lat="51.96481888597907" lon="4.417175984325393" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="8b727b9c-1f4b-4706-84d8-f62356a0d8da" name="In" connectedTo="739f607a-8017-4793-9216-a1bdf5fd0901" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
        <port xsi:type="esdl:OutPort" id="35b5a55a-3de9-4253-8186-4ffad77d0e83" name="Out" connectedTo="551cb1ac-3470-464e-bdbe-7384e91060fd" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
        <port xsi:type="esdl:InPort" id="3c117d01-b957-4495-883b-35b06bc1431c" name="Elec" connectedTo="fe4e639c-dbc2-4578-b6a9-22806eb5a891" carrier="2e36ba41-d789-4616-9dd3-bea287fe93dd"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="a17f07bd-864b-4164-bc22-0a6638089d7c" name="HeatingDemand" power="2000.0">
        <geometry xsi:type="esdl:Point" lat="51.965234854837995" lon="4.4181668734474275"/>
        <port xsi:type="esdl:InPort" id="4c123d6c-8d8a-4bb4-ae1a-8e3c47edb9a5" name="In" connectedTo="271a63a4-992b-4315-9365-33bfaa3a6ae5" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
        <port xsi:type="esdl:OutPort" id="897f5514-e932-4969-84e0-142875a77a64" name="Out" connectedTo="b1e584a7-9155-4a87-90fd-f185c03b87b0" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="9188fef8-84fe-45c4-a75f-032f6e012914" name="ElectricityCable" length="66.0" capacity="3000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.964489525013285" lon="4.416375169668406"/>
          <point xsi:type="esdl:Point" lat="51.96481888597907" lon="4.417175984325393"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="95ffe271-8f70-454f-8241-32064da202b4" name="In" connectedTo="ee8afa6b-b78b-42fc-acaa-8b47e8680c19" carrier="2e36ba41-d789-4616-9dd3-bea287fe93dd"/>
        <port xsi:type="esdl:OutPort" id="fe4e639c-dbc2-4578-b6a9-22806eb5a891" name="Out" connectedTo="3c117d01-b957-4495-883b-35b06bc1431c" carrier="2e36ba41-d789-4616-9dd3-bea287fe93dd"/>
      </asset>
      <asset xsi:type="esdl:HeatProducer" id="4414abf4-a832-44db-9950-00671dd05358" name="HeatProducer" power="1000.0">
        <geometry xsi:type="esdl:Point" lat="51.96535066525414" lon="4.41721738022606"/>
        <port xsi:type="esdl:OutPort" id="7b592172-d7c4-428d-8945-ffb4698326cd" name="Out" connectedTo="f1c5e35f-eed1-4302-a47b-1de3605ac65e" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
        <port xsi:type="esdl:InPort" id="5d8e9d0e-666c-4217-aa8f-c841fb688f11" name="In" connectedTo="ee0c742b-1436-4f60-8375-11828db452cf" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="bc640d96-b4e7-4f8e-90de-9ad5f84c99be" name="Pipe_bc64" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="43.97">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="1e8a051e-21d7-45d6-9a87-e032f57868d2">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="eeb758bf-7bcc-4ae0-9fee-0b394caddc65">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="699dad63-fc6d-4515-858b-937105542073"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="353efd8e-3411-48cb-9384-058083292f80" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="37f4f7da-8a1d-4649-ae88-05ba879c34e0" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="bb43e727-2d8d-48f0-a526-afc7e5f2250b" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.96535066525414" lon="4.41721738022606"/>
          <point xsi:type="esdl:Point" lat="51.96533425563013" lon="4.417438959341475"/>
          <point xsi:type="esdl:Point" lat="51.965112850087294" lon="4.417648187002673"/>
          <point xsi:type="esdl:Point" lat="51.96511263071894" lon="4.417650965236596"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f1c5e35f-eed1-4302-a47b-1de3605ac65e" name="In" connectedTo="7b592172-d7c4-428d-8945-ffb4698326cd" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
        <port xsi:type="esdl:OutPort" id="bcd65e9b-517f-42d5-b786-12f804a55d33" name="Out" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4" connectedTo="ac6d7c88-016d-47cf-9470-6ada7b3f453c"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="fcec388f-fb82-457a-8e06-fd6a6499f744" name="Pipe_fcec" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="38.64">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="1e8a051e-21d7-45d6-9a87-e032f57868d2">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="eeb758bf-7bcc-4ae0-9fee-0b394caddc65">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="699dad63-fc6d-4515-858b-937105542073"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="353efd8e-3411-48cb-9384-058083292f80" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="37f4f7da-8a1d-4649-ae88-05ba879c34e0" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="bb43e727-2d8d-48f0-a526-afc7e5f2250b" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.96511263071894" lon="4.417650965236596"/>
          <point xsi:type="esdl:Point" lat="51.965228509835676" lon="4.4179968997713335"/>
          <point xsi:type="esdl:Point" lat="51.965234854837995" lon="4.4181668734474275"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="42bb74e8-221b-4a97-9e99-77d30e7b8db4" name="In" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4" connectedTo="227639dc-bec2-401a-8e6d-90366127053e"/>
        <port xsi:type="esdl:OutPort" id="271a63a4-992b-4315-9365-33bfaa3a6ae5" name="Out" connectedTo="4c123d6c-8d8a-4bb4-ae1a-8e3c47edb9a5" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c2d7592f-d28b-4839-80fa-0d0d9823f979" name="Joint_c2d7">
        <port xsi:type="esdl:InPort" id="ac6d7c88-016d-47cf-9470-6ada7b3f453c" name="In" connectedTo="bcd65e9b-517f-42d5-b786-12f804a55d33" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
        <port xsi:type="esdl:OutPort" id="227639dc-bec2-401a-8e6d-90366127053e" name="Out" connectedTo="42bb74e8-221b-4a97-9e99-77d30e7b8db4 56aa3660-f080-4002-8dbd-5a2974c03b20" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
        <geometry xsi:type="esdl:Point" lat="51.96511263071894" lon="4.417650965236596"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="cc2b0ba8-25e6-46c9-9f3e-7732e7699db9" name="Pipe_cc2b" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="50.6">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="18fc2032-2991-4238-8c6d-d4427809379f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="742e0acb-d202-46de-ae3c-9f9badfe7dfd">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="fd92714d-ce88-43df-8873-2bb1a54c37b4"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="4aafda81-3da7-479a-861c-03660798f200" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="e4a2c933-3596-48b5-a9ab-16ddd7649f8b" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="664f9ef1-039f-4738-a5d4-b2cf5eccab5b" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.96511263071894" lon="4.417650965236596"/>
          <point xsi:type="esdl:Point" lat="51.964908573148385" lon="4.417160084954532"/>
          <point xsi:type="esdl:Point" lat="51.96481888597907" lon="4.417175984325393"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="56aa3660-f080-4002-8dbd-5a2974c03b20" name="In" connectedTo="227639dc-bec2-401a-8e6d-90366127053e" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
        <port xsi:type="esdl:OutPort" id="739f607a-8017-4793-9216-a1bdf5fd0901" name="Out" connectedTo="8b727b9c-1f4b-4706-84d8-f62356a0d8da" carrier="61648667-0e75-4ba0-83ed-7f2f85ce52b4"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="8d7e7343-f034-4001-8709-53a0ab276355" name="Pipe_cc2b_ret" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="32.16">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="fdbc6b73-e687-42ec-9995-09fc1682407e">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="8d6fb114-ffa6-4e73-9a77-b698645c61bc">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="0768362a-ebb6-490b-a4d2-0d2b2a89bfa3"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="5414213d-5a1e-4a2b-adf7-af6795003ccb" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="ef55aef9-a250-44ef-9b35-3e88e35c69a3" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="0d5520f2-f84a-4177-939d-b57aaf759db7" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.96481888597907" lon="4.417175984325393"/>
          <point xsi:type="esdl:Point" lat="51.96478960798222" lon="4.417298228859049"/>
          <point xsi:type="esdl:Point" lat="51.96490692085659" lon="4.41757451666808"/>
          <point xsi:type="esdl:Point" lat="51.964908573148385" lon="4.41757451666808"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="551cb1ac-3470-464e-bdbe-7384e91060fd" name="In" connectedTo="35b5a55a-3de9-4253-8186-4ffad77d0e83" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
        <port xsi:type="esdl:OutPort" id="b6cf2465-b609-4126-aa3b-f4f17c24fe28" name="Out" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c" connectedTo="a0218c58-32cc-4e64-9730-33695c2daa0f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="8799fb8f-eef4-4a81-aaa5-39add38caea0" name="Pipe_bc64_ret" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="58.47">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="fdbc6b73-e687-42ec-9995-09fc1682407e">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="8d6fb114-ffa6-4e73-9a77-b698645c61bc">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="0768362a-ebb6-490b-a4d2-0d2b2a89bfa3"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="5414213d-5a1e-4a2b-adf7-af6795003ccb" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="ef55aef9-a250-44ef-9b35-3e88e35c69a3" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="0d5520f2-f84a-4177-939d-b57aaf759db7" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.964908573148385" lon="4.41757451666808"/>
          <point xsi:type="esdl:Point" lat="51.965277858840324" lon="4.417166790969317"/>
          <point xsi:type="esdl:Point" lat="51.96535066525414" lon="4.41721738022606"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="dab6af61-0878-4f9d-99c4-a8cdb53ee30b" name="In" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c" connectedTo="90778e62-1d23-44f9-958b-5099a5eb7f85"/>
        <port xsi:type="esdl:OutPort" id="ee0c742b-1436-4f60-8375-11828db452cf" name="Out" connectedTo="5d8e9d0e-666c-4217-aa8f-c841fb688f11" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="1d6224ef-9b86-4c6e-a680-d05417b0623a" name="Joint_1d62">
        <port xsi:type="esdl:InPort" id="a0218c58-32cc-4e64-9730-33695c2daa0f" name="In" connectedTo="b6cf2465-b609-4126-aa3b-f4f17c24fe28 27e10ce6-d39e-4fe4-b1c2-d9858b47ff58" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
        <port xsi:type="esdl:OutPort" id="90778e62-1d23-44f9-958b-5099a5eb7f85" name="Out" connectedTo="dab6af61-0878-4f9d-99c4-a8cdb53ee30b" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
        <geometry xsi:type="esdl:Point" lat="51.964908573148385" lon="4.41757451666808"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="0af24275-1703-42af-9dc5-ac19da01bc39" name="Pipe_fcec_ret" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="57.6">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="8692b0a6-48ee-4412-b5cd-10d0a93aa4c5">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="e917f0f5-a4b6-4814-83ad-691da9950b07">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="ebc46b12-ee7e-4875-b306-17fa9c2444b6"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="af441d27-dcac-4c78-98ba-803db58c4628" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="a80f985f-d3e5-416c-bf16-9cba483dc78b" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="7645146c-f559-4da5-a6f2-f68144705312" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.965234854837995" lon="4.4181668734474275"/>
          <point xsi:type="esdl:Point" lat="51.96510602158142" lon="4.418109656647729"/>
          <point xsi:type="esdl:Point" lat="51.964908573148385" lon="4.41757451666808"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="b1e584a7-9155-4a87-90fd-f185c03b87b0" name="In" connectedTo="897f5514-e932-4969-84e0-142875a77a64" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
        <port xsi:type="esdl:OutPort" id="27e10ce6-d39e-4fe4-b1c2-d9858b47ff58" name="Out" connectedTo="a0218c58-32cc-4e64-9730-33695c2daa0f" carrier="6b411434-803a-4b8d-acc4-04540a8d9d2c"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
