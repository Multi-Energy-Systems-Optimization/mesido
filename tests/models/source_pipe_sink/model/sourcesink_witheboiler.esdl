<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="5" id="5d539f68-f98e-466b-9ff5-b908a211e0ab_with_return_network_with_return_network" name="sourcesink with return network with return network" description="" esdlVersion="v2401">
  <instance xsi:type="esdl:Instance" name="Untitled instance" id="90e7e098-038e-4462-89fe-a8852c501753">
    <area xsi:type="esdl:Area" id="4fd1adc2-5371-4ab7-806a-b40e49d127e9" name="Untitled area">
      <asset xsi:type="esdl:HeatingDemand" id="f6d5923d-ba9a-409d-80a0-26f73b2a574b" power="10000000.0" name="demand">
        <port xsi:type="esdl:InPort" connectedTo="76679c8a-43ec-4f6d-81c4-9b43e21696cc" id="b8849fb5-fe97-48d9-91a8-9abcbf365738" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="In"/>
        <port xsi:type="esdl:OutPort" id="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="0f4bf90b-218d-4d45-a83e-97a8a6a187af" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="52.086586960901776" CRS="WGS84" lon="4.398479461669923"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe1_ret" outerDiameter="0.45" id="Pipe1" length="1000.0" diameter="DN300" innerDiameter="0.15" name="Pipe1">
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="a5e06a9f-ad3d-4c95-afcf-28ce7f772ec3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="1962.1" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="25676f69-ff77-47e0-8143-53b58ae4fb44" id="3b5636b1-7b14-46bd-bb27-c0718350b418" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" name="In"/>
        <port xsi:type="esdl:OutPort" id="76679c8a-43ec-4f6d-81c4-9b43e21696cc" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" connectedTo="b8849fb5-fe97-48d9-91a8-9abcbf365738" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08646829489945" lon="4.386527538299561"/>
          <point xsi:type="esdl:Point" lat="52.086586960901776" lon="4.398479461669923"/>
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
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe1" outerDiameter="0.45" id="Pipe1_ret" length="1000.0" diameter="DN300" innerDiameter="0.15" name="Pipe1_ret">
        <port xsi:type="esdl:InPort" connectedTo="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" id="0f4bf90b-218d-4d45-a83e-97a8a6a187af" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="0bd3861f-ee02-42ef-9d4c-2132f33cba03" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.086676960991774" CRS="WGS84" lon="4.39796569977892"/>
          <point xsi:type="esdl:Point" lat="52.086558294989445" CRS="WGS84" lon="4.386013537838319"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="4dde18cf-fd73-4483-91dc-d502f44c8a67" power="10000000.0" name="ElectricityProducer_4dde">
        <port xsi:type="esdl:OutPort" id="53bc51c4-4ac8-497f-ae55-3ccfc3ae860d" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8" connectedTo="16d473f6-c140-4977-9398-4ac82de22c9c" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="52.08653422049524" CRS="WGS84" lon="4.3792855739593515"/>
      </asset>
      <asset xsi:type="esdl:ElectricBoiler" efficiency="0.9" id="9aabc314-27d2-483b-8541-0f50610c24e0" power="10000000.0" name="ElectricBoiler_9aab">
        <port xsi:type="esdl:InPort" connectedTo="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" id="0bd3861f-ee02-42ef-9d4c-2132f33cba03" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="25676f69-ff77-47e0-8143-53b58ae4fb44" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" connectedTo="3b5636b1-7b14-46bd-bb27-c0718350b418" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="8303c87a-d294-4504-b8b9-17696494ebf3" id="f37f31dc-502a-49cd-88b7-5f71671f2200" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8" name="ElecPort"/>
        <geometry xsi:type="esdl:Point" lat="52.08646829489945" CRS="WGS84" lon="4.3854761123657235"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="423.0" capacity="10000000.0" id="ce45d623-9749-42d2-b6e0-de0f09d1884b" name="ElectricityCable_ce45">
        <port xsi:type="esdl:InPort" connectedTo="53bc51c4-4ac8-497f-ae55-3ccfc3ae860d" id="16d473f6-c140-4977-9398-4ac82de22c9c" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8" name="In"/>
        <port xsi:type="esdl:OutPort" id="8303c87a-d294-4504-b8b9-17696494ebf3" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8" connectedTo="f37f31dc-502a-49cd-88b7-5f71671f2200" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08653422049524" lon="4.3792855739593515"/>
          <point xsi:type="esdl:Point" lat="52.08646829489945" lon="4.3854761123657235"/>
        </geometry>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="11f4eafa-7fbc-4d82-b346-e893326d2c30">
    <carriers xsi:type="esdl:Carriers" id="eafbd8f4-1fde-4bb5-8dce-fdb74a1a1097">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="heat" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" name="heat_ret" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="10000.0" name="elec" id="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
