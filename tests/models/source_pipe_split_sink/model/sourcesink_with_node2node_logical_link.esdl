<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="5d539f68-f98e-466b-9ff5-b908a211e0ab_with_return_network_with_return_network_with_return_network" description="" esdlVersion="v2401" name="sourcesink with return network with return network with return network" version="5">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="11f4eafa-7fbc-4d82-b346-e893326d2c30">
    <carriers xsi:type="esdl:Carriers" id="eafbd8f4-1fde-4bb5-8dce-fdb74a1a1097">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="heat" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" name="heat_ret" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="90e7e098-038e-4462-89fe-a8852c501753" name="Untitled instance">
    <area xsi:type="esdl:Area" name="Untitled area" id="4fd1adc2-5371-4ab7-806a-b40e49d127e9">
      <asset xsi:type="esdl:HeatProducer" name="source" power="10000000.0" id="a479e4e6-6f75-460d-aeb2-d0e3e02314e0">
        <port xsi:type="esdl:OutPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="Out" connectedTo="b639ef7a-58ad-49e5-aff6-65dec0b482db" id="b0b1a87c-7b5a-4edb-a732-274d1bf69647"/>
        <port xsi:type="esdl:InPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="In" connectedTo="72f25aaf-c12b-4d92-b7ff-e8345445f09c" id="622d7e19-e360-46af-bfbf-eb35ec14548b"/>
        <geometry xsi:type="esdl:Point" lon="4.386527538299561" CRS="WGS84" lat="52.08646829489945"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="demand" power="10000000.0" id="f6d5923d-ba9a-409d-80a0-26f73b2a574b">
        <port xsi:type="esdl:InPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="In" connectedTo="fae038d9-ec38-4006-a7e3-dcd27539eea0" id="b8849fb5-fe97-48d9-91a8-9abcbf365738"/>
        <port xsi:type="esdl:OutPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="Out" connectedTo="47457db7-1f8a-4a86-b941-40b3ac0502e3" id="eb68d4fe-b361-4e64-9f54-a1e05e5712ee"/>
        <geometry xsi:type="esdl:Point" lon="4.398479461669923" CRS="WGS84" lat="52.086586960901776"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="284.44" name="Pipe1" innerDiameter="0.3127" related="Pipe1_ret" outerDiameter="0.5" id="Pipe1" diameter="DN300">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="In" connectedTo="b0b1a87c-7b5a-4edb-a732-274d1bf69647" id="b639ef7a-58ad-49e5-aff6-65dec0b482db"/>
        <port xsi:type="esdl:OutPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="Out" connectedTo="8c3d86b1-95da-41ef-938c-1027e451461e" id="b56c1473-5182-4b0a-97ce-551392c2b0a5"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.386527538299561" lat="52.08646829489945"/>
          <point xsi:type="esdl:Point" lon="4.390690326690675" lat="52.086494665149445"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="2668ac25-44a2-4305-bbbf-b10e6c7dd3c3"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.08245">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="4da97fd3-43ae-4cdd-bf85-5c00c0950dee"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="47a862f8-97be-4f97-aa8c-38c940278d33"/>
          </component>
        </material>
        <costInformation xsi:type="esdl:CostInformation" id="7de138f5-f934-4717-87c0-b31cc277f64c">
          <investmentCosts xsi:type="esdl:SingleValue" id="7ffb929c-9640-436c-907a-556e790a6c7d" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" id="b76702e2-0572-4647-bb32-4a94640d714c" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7ef7" id="7ef7856b-e168-4701-8b83-90dbf7627701">
        <port xsi:type="esdl:InPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="In" connectedTo="b56c1473-5182-4b0a-97ce-551392c2b0a5" id="8c3d86b1-95da-41ef-938c-1027e451461e"/>
        <port xsi:type="esdl:OutPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="Out" connectedTo="b9119eab-62b1-4c0d-8820-af4e1b2794da" id="051cf195-18ad-439b-887c-575e7326815c"/>
        <geometry xsi:type="esdl:Point" lon="4.390690326690675" lat="52.086494665149445"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="281.01" name="Pipe3" innerDiameter="0.3127" related="Pipe3_ret" outerDiameter="0.5" id="Pipe3" diameter="DN300">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="In" connectedTo="aa278a36-39b3-4fd3-b2ae-5fd652735895" id="5b77e7e6-dc9c-4f0e-9473-9bfe423b00a8"/>
        <port xsi:type="esdl:OutPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="Out" connectedTo="b8849fb5-fe97-48d9-91a8-9abcbf365738" id="fae038d9-ec38-4006-a7e3-dcd27539eea0"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.394370317459107" lat="52.08648148002641"/>
          <point xsi:type="esdl:Point" lon="4.394381046295167" lat="52.08648148002641"/>
          <point xsi:type="esdl:Point" lon="4.398479461669923" lat="52.086586960901776"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="2668ac25-44a2-4305-bbbf-b10e6c7dd3c3"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.08245">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="4da97fd3-43ae-4cdd-bf85-5c00c0950dee"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="47a862f8-97be-4f97-aa8c-38c940278d33"/>
          </component>
        </material>
        <costInformation xsi:type="esdl:CostInformation" id="7de138f5-f934-4717-87c0-b31cc277f64c">
          <investmentCosts xsi:type="esdl:SingleValue" id="7ffb929c-9640-436c-907a-556e790a6c7d" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" unit="EURO" id="b76702e2-0572-4647-bb32-4a94640d714c" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_44da" id="44da7e93-ed3f-4738-afaf-e152b9ffbf80">
        <port xsi:type="esdl:InPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="In" connectedTo="051cf195-18ad-439b-887c-575e7326815c" id="b9119eab-62b1-4c0d-8820-af4e1b2794da"/>
        <port xsi:type="esdl:OutPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="Out" connectedTo="5b77e7e6-dc9c-4f0e-9473-9bfe423b00a8" id="aa278a36-39b3-4fd3-b2ae-5fd652735895"/>
        <geometry xsi:type="esdl:Point" lon="4.394370317459107" lat="52.08648148002641"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7ef7_ret" id="c7f7f905-2475-4cc1-b045-c10527f79cdf">
        <port xsi:type="esdl:OutPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="ret_port" connectedTo="fb7a7f10-408f-425d-8b52-f8846162d0a1" id="5cb42b39-932b-4429-a629-11b9a6aff9c8"/>
        <port xsi:type="esdl:InPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="ret_port" connectedTo="65f30879-5a89-4034-97bb-c52842fda0ef" id="e4b825f9-bb86-4a60-afca-e73479e488f1"/>
        <geometry xsi:type="esdl:Point" lon="4.390176379264867" CRS="WGS84" lat="52.08658466523944"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_44da_ret" id="4659d15d-dfba-4148-89e2-93fb4f7fd972">
        <port xsi:type="esdl:InPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="ret_port" connectedTo="852b8309-1d05-49fd-b75e-513765e71613" id="ff22fb00-4105-4553-ae79-9bf19216d951"/>
        <port xsi:type="esdl:OutPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="ret_port" connectedTo="e4b825f9-bb86-4a60-afca-e73479e488f1" id="65f30879-5a89-4034-97bb-c52842fda0ef"/>
        <geometry xsi:type="esdl:Point" lon="4.393856343516998" CRS="WGS84" lat="52.086571480116405"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="284.44" name="Pipe1_ret" innerDiameter="0.3127" related="Pipe1" outerDiameter="0.5" id="Pipe1_ret" diameter="DN300">
        <port xsi:type="esdl:InPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="In_ret" connectedTo="5cb42b39-932b-4429-a629-11b9a6aff9c8" id="fb7a7f10-408f-425d-8b52-f8846162d0a1"/>
        <port xsi:type="esdl:OutPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="Out_ret" connectedTo="622d7e19-e360-46af-bfbf-eb35ec14548b" id="72f25aaf-c12b-4d92-b7ff-e8345445f09c"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.390176379264867" CRS="WGS84" lat="52.08658466523944"/>
          <point xsi:type="esdl:Point" lon="4.386013537838319" CRS="WGS84" lat="52.086558294989445"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="281.01" name="Pipe3_ret" innerDiameter="0.3127" related="Pipe3" outerDiameter="0.5" id="Pipe3_ret" diameter="DN300">
        <port xsi:type="esdl:InPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="In_ret" connectedTo="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" id="47457db7-1f8a-4a86-b941-40b3ac0502e3"/>
        <port xsi:type="esdl:OutPort" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="Out_ret" connectedTo="ff22fb00-4105-4553-ae79-9bf19216d951" id="852b8309-1d05-49fd-b75e-513765e71613"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.39796569977892" CRS="WGS84" lat="52.086676960991774"/>
          <point xsi:type="esdl:Point" lon="4.393867072353058" CRS="WGS84" lat="52.086571480116405"/>
          <point xsi:type="esdl:Point" lon="4.393856343516998" CRS="WGS84" lat="52.086571480116405"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
