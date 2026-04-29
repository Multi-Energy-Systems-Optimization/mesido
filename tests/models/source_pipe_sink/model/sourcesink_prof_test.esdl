<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2401" name="sourcesink with return network with return network" version="2" id="5d539f68-f98e-466b-9ff5-b908a211e0ab_with_return_network_with_return_network" description="">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="11f4eafa-7fbc-4d82-b346-e893326d2c30">
    <carriers xsi:type="esdl:Carriers" id="eafbd8f4-1fde-4bb5-8dce-fdb74a1a1097">
      <carrier xsi:type="esdl:HeatCommodity" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11" supplyTemperature="70.0" name="heat"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="heat_ret"/>
      <carrier xsi:type="esdl:ElectricityCommodity" id="355f3a2f-dac4-4484-b3db-a99b086cbe39" voltage="400.0" name="elec"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="90e7e098-038e-4462-89fe-a8852c501753" name="Untitled instance">
    <area xsi:type="esdl:Area" name="Untitled area" id="4fd1adc2-5371-4ab7-806a-b40e49d127e9">
      <asset xsi:type="esdl:HeatProducer" name="source" id="a479e4e6-6f75-460d-aeb2-d0e3e02314e0" power="10000000.0">
        <port xsi:type="esdl:OutPort" id="b0b1a87c-7b5a-4edb-a732-274d1bf69647" connectedTo="3b5636b1-7b14-46bd-bb27-c0718350b418" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="Out"/>
        <port xsi:type="esdl:InPort" id="622d7e19-e360-46af-bfbf-eb35ec14548b" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="In" connectedTo="0f11bb2d-fb28-4f9d-8992-8d5901f579d7"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.08646829489945" lon="4.386527538299561"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="demand" id="f6d5923d-ba9a-409d-80a0-26f73b2a574b" power="10000000.0">
        <port xsi:type="esdl:InPort" id="b8849fb5-fe97-48d9-91a8-9abcbf365738" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="In" connectedTo="76679c8a-43ec-4f6d-81c4-9b43e21696cc"/>
        <port xsi:type="esdl:OutPort" id="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" connectedTo="0f4bf90b-218d-4d45-a83e-97a8a6a187af" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.086586960901776" lon="4.398479461669923"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe1" length="1000.0" related="Pipe1_ret" outerDiameter="0.45" id="Pipe1" diameter="DN300" innerDiameter="0.15">
        <costInformation xsi:type="esdl:CostInformation" id="a5e06a9f-ad3d-4c95-afcf-28ce7f772ec3">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="3b5636b1-7b14-46bd-bb27-c0718350b418" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="In" connectedTo="b0b1a87c-7b5a-4edb-a732-274d1bf69647"/>
        <port xsi:type="esdl:OutPort" id="76679c8a-43ec-4f6d-81c4-9b43e21696cc" connectedTo="b8849fb5-fe97-48d9-91a8-9abcbf365738" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08646829489945" lon="4.386527538299561"/>
          <point xsi:type="esdl:Point" lat="52.086586960901776" lon="4.398479461669923"/>
        </geometry>
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
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe1_ret" length="1000.0" related="Pipe1" outerDiameter="0.45" id="Pipe1_ret" diameter="DN300" innerDiameter="0.15">
        <port xsi:type="esdl:InPort" id="0f4bf90b-218d-4d45-a83e-97a8a6a187af" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="In_ret" connectedTo="eb68d4fe-b361-4e64-9f54-a1e05e5712ee"/>
        <port xsi:type="esdl:OutPort" id="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" connectedTo="622d7e19-e360-46af-bfbf-eb35ec14548b" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.086676960991774" lon="4.39796569977892"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.086558294989445" lon="4.386013537838319"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
