<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="7" id="5d539f68-f98e-466b-9ff5-b908a211e0ab_with_return_network_with_return_network" name="sourcesink_withHP_voc" description="" esdlVersion="v2401">
  <instance xsi:type="esdl:Instance" name="Untitled instance" id="90e7e098-038e-4462-89fe-a8852c501753">
    <area xsi:type="esdl:Area" id="4fd1adc2-5371-4ab7-806a-b40e49d127e9" name="Untitled area">
      <asset xsi:type="esdl:HeatingDemand" id="f6d5923d-ba9a-409d-80a0-26f73b2a574b" power="10000000.0" name="demand">
        <port xsi:type="esdl:InPort" id="b8849fb5-fe97-48d9-91a8-9abcbf365738" name="In" connectedTo="76679c8a-43ec-4f6d-81c4-9b43e21696cc" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" id="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" name="Out" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="0f4bf90b-218d-4d45-a83e-97a8a6a187af"/>
        <geometry xsi:type="esdl:Point" lat="52.086586960901776" CRS="WGS84" lon="4.398479461669923"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" id="Pipe1" length="1000.0" diameter="DN300" innerDiameter="0.15" name="Pipe1" related="Pipe1_ret">
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="a5e06a9f-ad3d-4c95-afcf-28ce7f772ec3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="1962.1" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="3b5636b1-7b14-46bd-bb27-c0718350b418" name="In" connectedTo="8c166244-4529-4cb9-82d6-75235ef3c607" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" id="76679c8a-43ec-4f6d-81c4-9b43e21696cc" name="Out" connectedTo="b8849fb5-fe97-48d9-91a8-9abcbf365738" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
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
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" id="Pipe1_ret" length="1000.0" diameter="DN300" innerDiameter="0.15" name="Pipe1_ret" related="Pipe1">
        <port xsi:type="esdl:InPort" id="0f4bf90b-218d-4d45-a83e-97a8a6a187af" name="In_ret" connectedTo="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <port xsi:type="esdl:OutPort" id="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" name="Out_ret" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="af3bd758-cc86-406f-ba52-d65ce1f00e74"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.086676960991774" CRS="WGS84" lon="4.39796569977892"/>
          <point xsi:type="esdl:Point" lat="52.086558294989445" CRS="WGS84" lon="4.386013537838319"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="4dde18cf-fd73-4483-91dc-d502f44c8a67" power="10000000.0" name="ElectricityProducer_4dde">
        <port xsi:type="esdl:OutPort" id="53bc51c4-4ac8-497f-ae55-3ccfc3ae860d" name="Out" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8" connectedTo="16d473f6-c140-4977-9398-4ac82de22c9c"/>
        <geometry xsi:type="esdl:Point" lat="52.08653422049524" CRS="WGS84" lon="4.3792855739593515"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="423.0" capacity="10000000.0" id="ce45d623-9749-42d2-b6e0-de0f09d1884b" name="ElectricityCable_ce45">
        <port xsi:type="esdl:InPort" id="16d473f6-c140-4977-9398-4ac82de22c9c" name="In" connectedTo="53bc51c4-4ac8-497f-ae55-3ccfc3ae860d" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
        <port xsi:type="esdl:OutPort" id="8303c87a-d294-4504-b8b9-17696494ebf3" name="Out" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8" connectedTo="a8ccfce0-0096-4c3a-937b-dac44b498f44"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08653422049524" lon="4.3792855739593515"/>
          <point xsi:type="esdl:Point" lat="52.08646829489945" lon="4.3854761123657235"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="d8fdac8b-ac07-4d2d-a339-e84fb82dca17" power="10000000.0" name="HeatPump_d8fd" COP="4.0">
        <port xsi:type="esdl:InPort" id="af3bd758-cc86-406f-ba52-d65ce1f00e74" name="SecIn" connectedTo="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <port xsi:type="esdl:OutPort" id="8c166244-4529-4cb9-82d6-75235ef3c607" name="SecOut" connectedTo="3b5636b1-7b14-46bd-bb27-c0718350b418" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:InPort" id="a8ccfce0-0096-4c3a-937b-dac44b498f44" name="ElecPort" connectedTo="8303c87a-d294-4504-b8b9-17696494ebf3" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
        <geometry xsi:type="esdl:Point" lat="52.0864617023345" CRS="WGS84" lon="4.385873079299928"/>
        <costInformation xsi:type="esdl:CostInformation" id="dab08f38-53fe-41cd-b738-dc21c1a6c58a">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="56c8689f-150a-49b5-885c-bf8891c3b24c" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="e36a3732-4097-4662-a79b-517a0cb3857c" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
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
