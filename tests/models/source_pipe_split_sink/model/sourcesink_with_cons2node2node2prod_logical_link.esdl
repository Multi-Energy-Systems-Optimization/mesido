<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="5d539f68-f98e-466b-9ff5-b908a211e0ab_with_return_network_with_return_network_with_return_network" description="" esdlVersion="v2401" name="sourcesink with return network with return network with return network" version="7">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="11f4eafa-7fbc-4d82-b346-e893326d2c30">
    <carriers xsi:type="esdl:Carriers" id="eafbd8f4-1fde-4bb5-8dce-fdb74a1a1097">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="heat" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" name="heat_ret" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="90e7e098-038e-4462-89fe-a8852c501753" name="Untitled instance">
    <area xsi:type="esdl:Area" name="Untitled area" id="4fd1adc2-5371-4ab7-806a-b40e49d127e9">
      <asset xsi:type="esdl:HeatProducer" name="source" power="10000000.0" id="a479e4e6-6f75-460d-aeb2-d0e3e02314e0">
        <port xsi:type="esdl:OutPort" name="Out" id="b0b1a87c-7b5a-4edb-a732-274d1bf69647" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" connectedTo="8c3d86b1-95da-41ef-938c-1027e451461e"/>
        <port xsi:type="esdl:InPort" name="In" id="622d7e19-e360-46af-bfbf-eb35ec14548b" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="5cb42b39-932b-4429-a629-11b9a6aff9c8"/>
        <geometry xsi:type="esdl:Point" lon="4.386527538299561" CRS="WGS84" lat="52.08646829489945"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="demand" power="10000000.0" id="f6d5923d-ba9a-409d-80a0-26f73b2a574b">
        <port xsi:type="esdl:InPort" name="In" id="b8849fb5-fe97-48d9-91a8-9abcbf365738" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" connectedTo="aa278a36-39b3-4fd3-b2ae-5fd652735895"/>
        <port xsi:type="esdl:OutPort" name="Out" id="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="ff22fb00-4105-4553-ae79-9bf19216d951"/>
        <geometry xsi:type="esdl:Point" lon="4.398479461669923" CRS="WGS84" lat="52.086586960901776"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7ef7" id="7ef7856b-e168-4701-8b83-90dbf7627701">
        <port xsi:type="esdl:InPort" name="In" id="8c3d86b1-95da-41ef-938c-1027e451461e" connectedTo="b0b1a87c-7b5a-4edb-a732-274d1bf69647" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" name="Out" id="051cf195-18ad-439b-887c-575e7326815c" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" connectedTo="b9119eab-62b1-4c0d-8820-af4e1b2794da"/>
        <geometry xsi:type="esdl:Point" lon="4.390690326690675" lat="52.086494665149445"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_44da" id="44da7e93-ed3f-4738-afaf-e152b9ffbf80">
        <port xsi:type="esdl:InPort" name="In" id="b9119eab-62b1-4c0d-8820-af4e1b2794da" connectedTo="051cf195-18ad-439b-887c-575e7326815c" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" name="Out" id="aa278a36-39b3-4fd3-b2ae-5fd652735895" connectedTo="b8849fb5-fe97-48d9-91a8-9abcbf365738" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <geometry xsi:type="esdl:Point" lon="4.394370317459107" lat="52.08648148002641"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7ef7_ret" id="c7f7f905-2475-4cc1-b045-c10527f79cdf">
        <port xsi:type="esdl:OutPort" name="ret_port" id="5cb42b39-932b-4429-a629-11b9a6aff9c8" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="622d7e19-e360-46af-bfbf-eb35ec14548b"/>
        <port xsi:type="esdl:InPort" name="ret_port" id="e4b825f9-bb86-4a60-afca-e73479e488f1" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="65f30879-5a89-4034-97bb-c52842fda0ef"/>
        <geometry xsi:type="esdl:Point" lon="4.390176379264867" CRS="WGS84" lat="52.08658466523944"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_44da_ret" id="4659d15d-dfba-4148-89e2-93fb4f7fd972">
        <port xsi:type="esdl:InPort" name="ret_port" id="ff22fb00-4105-4553-ae79-9bf19216d951" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="eb68d4fe-b361-4e64-9f54-a1e05e5712ee"/>
        <port xsi:type="esdl:OutPort" name="ret_port" id="65f30879-5a89-4034-97bb-c52842fda0ef" connectedTo="e4b825f9-bb86-4a60-afca-e73479e488f1" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.393856343516998" CRS="WGS84" lat="52.086571480116405"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
