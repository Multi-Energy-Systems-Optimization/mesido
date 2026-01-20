<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2107" version="12" name="pv_heatpump_with_db_profile" id="b9a86f6b-02b4-4ab3-b2f3-608647c28e0e" description="Single source, single sink">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="2bb5f647-e4ff-490a-9642-ccf9274d9c40">
    <carriers xsi:type="esdl:Carriers" id="f6672aa2-7723-4945-92fa-b99846f58c92">
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="230.0" id="a04bdbac-5198-477b-9989-d99c3c001eaf" name="Electricity"/>
      <carrier xsi:type="esdl:HeatCommodity" id="94172a26-b160-4acb-8303-aea0cb378d83" name="Heat" supplyTemperature="60.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="a4df2532-a064-44b9-aa08-f5a1d57314db" name="Heat_ret" returnTemperature="15.0"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="cf2e5d20-b71b-458a-bcea-3f493ab628f0">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="67052ed2-f139-4936-9cd8-b4c419bf2cfa" name="Untitled instance">
    <area xsi:type="esdl:Area" id="960acb90-32e0-4754-821d-f53e5567974b" name="Untitled area">
      <asset xsi:type="esdl:PVInstallation" id="9685bb56-166a-4f4c-8dc9-57ffb858a24b" name="PV_with_upper_profile" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.965714378462316" lon="4.419695336345835"/>
        <port xsi:type="esdl:OutPort" id="2bef42b7-f9d2-4b5a-8475-20021f54203e" name="Out" connectedTo="5c37c9cb-7c8b-495a-9aee-503ede3828eb" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf"/>
        <costInformation xsi:type="esdl:CostInformation" id="fb54192a-ad1e-4f50-a35b-887a57339607"/>
        <constraint xsi:type="esdl:ProfileConstraint" id="d8f46f01-bbbf-49c9-8961-2eeb7d7b0a16" name="Upper Limit Profile 1 MW " description="" attributeReference="power">
          <maximum xsi:type="esdl:InfluxDBProfile" measurement="Space Heat default profiles" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" host="https://profiles.warmingup.info" database="energy_profiles" filters="" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T22:00:00.000000+0000" id="beda8665-728a-477c-a7a9-846e9052fd8d">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </maximum>
        </constraint>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="8c466094-0238-40c0-8e57-7148329d4a8c" name="HeatPump_cheap" COP="2.0" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.96592231190497" lon="4.420693512005722"/>
        <port xsi:type="esdl:InPort" id="da74e62a-94d7-4d85-85e7-d48358307f85" name="SecIn" connectedTo="30f8f6e4-9b14-470e-91e9-d904c7d9d5d1" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db"/>
        <port xsi:type="esdl:OutPort" id="95127c2c-f796-4074-a181-292c720655a0" name="SecOut" connectedTo="2908cd49-9c3d-4586-af5a-868adaeeedbc" carrier="94172a26-b160-4acb-8303-aea0cb378d83"/>
        <port xsi:type="esdl:InPort" id="5c37c9cb-7c8b-495a-9aee-503ede3828eb" name="ElecIn" connectedTo="2bef42b7-f9d2-4b5a-8475-20021f54203e" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf"/>
        <costInformation xsi:type="esdl:CostInformation" id="7840daed-d607-4f40-ada5-35f50a43146e">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="1ff4721f-5978-45c4-8cc5-e26c8d19094c" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="91180241-b693-4b98-a97f-ce9ceb5c4545" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="c1f3acb8-3329-4eb5-82ea-01dbb17d8781" name="HeatingDemand" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.966160310314464" lon="4.421854913234712"/>
        <port xsi:type="esdl:InPort" id="c32261d1-52e9-4c6f-82d9-23508e348f7e" name="In" connectedTo="d91e836e-330d-4355-835e-f6c061772413" carrier="94172a26-b160-4acb-8303-aea0cb378d83">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="6.0" measurement="Space Heat default profiles" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" host="https://profiles.warmingup.info" database="energy_profiles" filters="" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T22:00:00.000000+0000" id="8294cd62-21a5-4eba-9b17-f052de36a71e" profileType="INPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="e82f546a-7023-4b0c-814c-96345a871e3e" name="Out" connectedTo="1abbb604-6ac1-48fe-9988-5431b8c83022" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db"/>
      </asset>
      <asset xsi:type="esdl:PVInstallation" id="83c16f57-02c1-41f9-b2da-c23842f965b7" name="PV_without_upper_profile" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.965301121992354" lon="4.420912808897809"/>
        <port xsi:type="esdl:OutPort" id="8ce79659-165f-4b19-ab05-9e6de0258a94" name="Out" connectedTo="ca02ec46-35b2-4895-91c6-8125dd8e48a6" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf"/>
        <costInformation xsi:type="esdl:CostInformation" id="1ed2129e-b88b-42f9-8428-899400680dd9"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="76b15b92-404c-493e-b871-95173186d0de" name="HeatPump_expensive" COP="2.0" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.96569754954268" lon="4.4211655081833054"/>
        <port xsi:type="esdl:InPort" id="d17d8a4c-1172-4952-a896-ca3c6697065a" name="SecIn" connectedTo="7972f331-8f6d-4011-b2b1-6575a510001e" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db"/>
        <port xsi:type="esdl:OutPort" id="f27b849e-d706-47cf-94f6-878b530f0642" name="SecOut" connectedTo="cf4d49b6-2186-4f7c-89a8-5a4d4333075f" carrier="94172a26-b160-4acb-8303-aea0cb378d83"/>
        <port xsi:type="esdl:InPort" id="ca02ec46-35b2-4895-91c6-8125dd8e48a6" name="ElecIn" connectedTo="8ce79659-165f-4b19-ab05-9e6de0258a94" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf"/>
        <costInformation xsi:type="esdl:CostInformation" id="d688b503-621a-475f-8d45-274e995fdb8d">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="394c07bc-076c-4cc0-88db-3bfd4db1ac24" value="10.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="a6fb6e74-e7b8-43b5-a2a4-160babcf4f9c" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="7f08ab99-b7c6-478d-9e4b-bd3f46231d2b" name="Pipe_7f08" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="43.99">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="a92084f9-abff-44dd-bddc-4a0370e36694">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="9253ae0a-13aa-4128-a6ad-71b6c53a276c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="24bcc1b8-e280-4830-b9b0-e53fff21bdea"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="abf4e229-4dbe-4ab7-ba48-6c0e92a07eb5" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="e9f6802b-ede1-4378-b7a1-e69e6ef25d6b" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="eae69825-7720-4142-ab17-fb287b0febdf" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.966160319028674" lon="4.421854249486215"/>
          <point xsi:type="esdl:Point" lat="51.966190363766756" lon="4.421623330631817"/>
          <point xsi:type="esdl:Point" lat="51.966126952371525" lon="4.421230500274614"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="1abbb604-6ac1-48fe-9988-5431b8c83022" name="In" connectedTo="e82f546a-7023-4b0c-814c-96345a871e3e" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db"/>
        <port xsi:type="esdl:OutPort" id="b9adac04-ab32-4ec6-acce-d77579a75d6c" name="Out" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db" connectedTo="0b2c2bde-a548-4790-b172-f60b5fbcbe0a"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="b0799706-d34a-4854-8739-07c533a368df" name="Pipe_b079" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="47.11">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="a92084f9-abff-44dd-bddc-4a0370e36694">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="9253ae0a-13aa-4128-a6ad-71b6c53a276c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="24bcc1b8-e280-4830-b9b0-e53fff21bdea"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="abf4e229-4dbe-4ab7-ba48-6c0e92a07eb5" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="e9f6802b-ede1-4378-b7a1-e69e6ef25d6b" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="eae69825-7720-4142-ab17-fb287b0febdf" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.966126952371525" lon="4.421230500274614"/>
          <point xsi:type="esdl:Point" lat="51.96605487951059" lon="4.420797149610661"/>
          <point xsi:type="esdl:Point" lat="51.96592231190497" lon="4.420693512005722"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f14791be-c8bd-41ec-975b-b8c0f7b45635" name="In" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db" connectedTo="23909eb5-e9a9-4725-b900-db925530107b"/>
        <port xsi:type="esdl:OutPort" id="30f8f6e4-9b14-470e-91e9-d904c7d9d5d1" name="Out" connectedTo="da74e62a-94d7-4d85-85e7-d48358307f85" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="4591cf1d-3d1c-46c9-853f-27251314a13b" name="Joint_4591">
        <port xsi:type="esdl:InPort" id="0b2c2bde-a548-4790-b172-f60b5fbcbe0a" name="In" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db" connectedTo="b9adac04-ab32-4ec6-acce-d77579a75d6c"/>
        <port xsi:type="esdl:OutPort" id="23909eb5-e9a9-4725-b900-db925530107b" name="Out" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db" connectedTo="f14791be-c8bd-41ec-975b-b8c0f7b45635 956eb4de-745b-45d6-85b6-9748c099362b"/>
        <geometry xsi:type="esdl:Point" lat="51.966126952371525" lon="4.421230500274614"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="9de98c78-0237-42e4-8c2a-1e6bffa1925e" name="Pipe_9de9" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="55.7">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="c2f28801-125f-49fc-8654-7af56e428a2c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7c7fd1b8-e90b-4024-baeb-e0258c01ebff">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="7020351e-2e0a-4ee7-9eb9-c504d111e7d5"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="be43b2bd-418d-47c4-b261-7899f2dff9ae" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="8a167c32-6384-4f09-8b22-5415bc52c362" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="d222c7eb-843f-48df-b04c-9f4cb9ac88cf" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.96592231190497" lon="4.420693512005722"/>
          <point xsi:type="esdl:Point" lat="51.96586982718192" lon="4.420909810658991"/>
          <point xsi:type="esdl:Point" lat="51.96599141277748" lon="4.4214557723467705"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="2908cd49-9c3d-4586-af5a-868adaeeedbc" name="In" connectedTo="95127c2c-f796-4074-a181-292c720655a0" carrier="94172a26-b160-4acb-8303-aea0cb378d83"/>
        <port xsi:type="esdl:OutPort" id="cb22d37a-3621-4151-ae14-99ba4213a2db" name="Out" carrier="94172a26-b160-4acb-8303-aea0cb378d83" connectedTo="97b093fe-5c51-4a2c-a2ec-af3727c01841"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="cacbc20f-52ff-49f7-8012-e5f5c8cdf287" name="Pipe_cacb" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="35.82">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="c2f28801-125f-49fc-8654-7af56e428a2c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7c7fd1b8-e90b-4024-baeb-e0258c01ebff">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="7020351e-2e0a-4ee7-9eb9-c504d111e7d5"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="be43b2bd-418d-47c4-b261-7899f2dff9ae" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="8a167c32-6384-4f09-8b22-5415bc52c362" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="d222c7eb-843f-48df-b04c-9f4cb9ac88cf" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.96599141277748" lon="4.4214557723467705"/>
          <point xsi:type="esdl:Point" lat="51.966058184009526" lon="4.421778910174786"/>
          <point xsi:type="esdl:Point" lat="51.966160319028674" lon="4.421854249486215"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c728fe91-b151-48a2-94f0-0dbcea5961f3" name="In" carrier="94172a26-b160-4acb-8303-aea0cb378d83" connectedTo="6352d62f-c8e1-4bb2-8ba9-d9119108b47a"/>
        <port xsi:type="esdl:OutPort" id="d91e836e-330d-4355-835e-f6c061772413" name="Out" connectedTo="c32261d1-52e9-4c6f-82d9-23508e348f7e" carrier="94172a26-b160-4acb-8303-aea0cb378d83"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="2e3b0e08-3257-40b7-af7b-6be597f2b742" name="Joint_2e3b">
        <port xsi:type="esdl:InPort" id="97b093fe-5c51-4a2c-a2ec-af3727c01841" name="In" carrier="94172a26-b160-4acb-8303-aea0cb378d83" connectedTo="cb22d37a-3621-4151-ae14-99ba4213a2db 4e7619fe-0e8d-4be8-b040-b7dd845b69bd"/>
        <port xsi:type="esdl:OutPort" id="6352d62f-c8e1-4bb2-8ba9-d9119108b47a" name="Out" carrier="94172a26-b160-4acb-8303-aea0cb378d83" connectedTo="c728fe91-b151-48a2-94f0-0dbcea5961f3"/>
        <geometry xsi:type="esdl:Point" lat="51.96599141277748" lon="4.4214557723467705"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="f3cc309e-9747-4e74-bae1-d29f20a53729" name="Pipe_f3cc" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="42.1">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="152c40b8-7bf5-4c17-9e0e-dfe5d9cac97f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="36b8ebf0-4aff-4841-b10a-649e1239da64">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="d0ea9466-be40-421f-a019-7d91d3bc566b"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="8c1dc239-9a04-42c7-ac32-6513ced95d71" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="395dfbc1-dc4b-4717-8410-2beea982203d" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="34563619-b811-45d7-882d-80532835ec69" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.96569754954268" lon="4.4211655081833054"/>
          <point xsi:type="esdl:Point" lat="51.96576661449825" lon="4.421380681656065"/>
          <point xsi:type="esdl:Point" lat="51.96599141277748" lon="4.4214557723467705"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="cf4d49b6-2186-4f7c-89a8-5a4d4333075f" name="In" connectedTo="f27b849e-d706-47cf-94f6-878b530f0642" carrier="94172a26-b160-4acb-8303-aea0cb378d83"/>
        <port xsi:type="esdl:OutPort" id="4e7619fe-0e8d-4be8-b040-b7dd845b69bd" name="Out" connectedTo="97b093fe-5c51-4a2c-a2ec-af3727c01841" carrier="94172a26-b160-4acb-8303-aea0cb378d83"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="dee354cf-114f-4787-ba69-da133b0550ea" name="Pipe_dee3" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="53.3">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="d63ab0d1-92d1-42bc-bde6-d047ece1adf6">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="c517dfed-718c-41b1-8fb7-4af7314a264b">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="dbdbd8c1-ff04-480e-88dc-a6655e5ea48b"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="ffc4ef6c-ed10-440d-ba98-f34b93becd0c" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="227967c5-7063-43f3-9515-a35021e5f7df" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="056c3a0d-767e-4d44-b8df-e5fe4b4518e4" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.966126952371525" lon="4.421230500274614"/>
          <point xsi:type="esdl:Point" lat="51.96578644968591" lon="4.421037409927023"/>
          <point xsi:type="esdl:Point" lat="51.96569754954268" lon="4.4211655081833054"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="956eb4de-745b-45d6-85b6-9748c099362b" name="In" connectedTo="23909eb5-e9a9-4725-b900-db925530107b" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db"/>
        <port xsi:type="esdl:OutPort" id="7972f331-8f6d-4011-b2b1-6575a510001e" name="Out" connectedTo="d17d8a4c-1172-4952-a896-ca3c6697065a" carrier="a4df2532-a064-44b9-aa08-f5a1d57314db"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
