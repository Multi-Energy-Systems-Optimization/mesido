<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="8" id="5d539f68-f98e-466b-9ff5-b908a211e0ab_with_return_network_with_return_network" name="sourcesink_with_chp" description="" esdlVersion="v2401">
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
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="3b5636b1-7b14-46bd-bb27-c0718350b418" name="In" connectedTo="25676f69-ff77-47e0-8143-53b58ae4fb44" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
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
        <port xsi:type="esdl:OutPort" id="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" name="Out_ret" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="0bd3861f-ee02-42ef-9d4c-2132f33cba03"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.086676960991774" CRS="WGS84" lon="4.39796569977892"/>
          <point xsi:type="esdl:Point" lat="52.086558294989445" CRS="WGS84" lon="4.386013537838319"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" id="4dde18cf-fd73-4483-91dc-d502f44c8a67" power="10000000.0" name="ElectricityDemand_4dde">
        <port xsi:type="esdl:InPort" id="53bc51c4-4ac8-497f-ae55-3ccfc3ae860d" name="In" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8" connectedTo="8303c87a-d294-4504-b8b9-17696494ebf3"/>
        <geometry xsi:type="esdl:Point" lat="52.08653422049524" CRS="WGS84" lon="4.3792855739593515"/>
      </asset>
      <asset xsi:type="esdl:CHP" efficiency="0.9" HERatio="1.0" id="9aabc314-27d2-483b-8541-0f50610c24e0" power="10000000.0" name="CHP_9aab">
        <port xsi:type="esdl:InPort" id="0bd3861f-ee02-42ef-9d4c-2132f33cba03" name="In" connectedTo="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <port xsi:type="esdl:OutPort" id="25676f69-ff77-47e0-8143-53b58ae4fb44" name="Out" connectedTo="3b5636b1-7b14-46bd-bb27-c0718350b418" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" id="f37f31dc-502a-49cd-88b7-5f71671f2200" name="ElectricityOut" connectedTo="16d473f6-c140-4977-9398-4ac82de22c9c" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
        <port xsi:type="esdl:InPort" id="484fdfac-aa5d-407d-b040-ae372a821d5e" name="GasPort" connectedTo="28918f0e-4dc1-4924-879d-c34264a44fff" carrier="bd3b2995-710a-4c30-b335-3057041ff65b"/>
        <geometry xsi:type="esdl:Point" lat="52.08646829489945" CRS="WGS84" lon="4.3854761123657235"/>
        <costInformation xsi:type="esdl:CostInformation" id="e388f4f0-4845-4e50-ba33-7db3acfe68c9">
          <investmentCosts xsi:type="esdl:SingleValue" id="daf580c2-6972-4e23-bfb8-76833f65eb56" value="10.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="e3ce42cb-d013-4779-9913-676c03b8fb75" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="eb43c7a2-5d58-4bd7-b0bf-a954a512f1f4" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="6648f27b-e040-4fbb-9d02-452140f9f76a" unit="EURO"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="ad538082-4731-48e3-a2c9-03d9c17af10e" value="2.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="7a4be60a-b3d3-4700-ae0c-0e9dc5c383d8" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="423.0" capacity="10000000.0" id="ce45d623-9749-42d2-b6e0-de0f09d1884b" name="ElectricityCable_ce45">
        <port xsi:type="esdl:InPort" id="16d473f6-c140-4977-9398-4ac82de22c9c" name="In" connectedTo="f37f31dc-502a-49cd-88b7-5f71671f2200" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
        <port xsi:type="esdl:OutPort" id="8303c87a-d294-4504-b8b9-17696494ebf3" name="Out" connectedTo="53bc51c4-4ac8-497f-ae55-3ccfc3ae860d" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08653422049524" lon="4.3792855739593515"/>
          <point xsi:type="esdl:Point" lat="52.08646829489945" lon="4.3854761123657235"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:GasProducer" name="GasProducer_82ec" id="82ecb457-b196-42c4-a049-afb695fed860" power="30000000.0">
        <port xsi:type="esdl:OutPort" name="Out" id="96b5a55c-d4e7-4018-a965-5d88ee205add" connectedTo="b113c25f-a960-4471-a8c7-56f7d591e206" carrier="bd3b2995-710a-4c30-b335-3057041ff65b"/>
        <geometry xsi:type="esdl:Point" lon="4.378888607025147" lat="52.08642873949524" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.263" name="Pipe_a7b5" length="467.7" outerDiameter="0.4" id="a7b5a335-c872-4066-91f5-3a810ecad571" diameter="DN250">
        <costInformation xsi:type="esdl:CostInformation" id="99faff2e-e003-4e00-941c-cb611ae329e2">
          <investmentCosts xsi:type="esdl:SingleValue" id="8dad1cd1-95ff-4c6e-b644-a1d38cfe4b1f" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="eca952d5-fbd9-4efd-a72c-2eb773445f25" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" id="b113c25f-a960-4471-a8c7-56f7d591e206" connectedTo="96b5a55c-d4e7-4018-a965-5d88ee205add" carrier="bd3b2995-710a-4c30-b335-3057041ff65b"/>
        <port xsi:type="esdl:OutPort" name="Out" id="28918f0e-4dc1-4924-879d-c34264a44fff" connectedTo="484fdfac-aa5d-407d-b040-ae372a821d5e" carrier="bd3b2995-710a-4c30-b335-3057041ff65b"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.005">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="faac539b-4b7c-43f8-abcd-f08fa2652b7b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0587">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="d23b4eeb-a419-4c16-bc7e-280a76116f04"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0048">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="a2b91e8d-471d-4276-a8f6-4efb01054b4e"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.378888607025147" lat="52.08642873949524"/>
          <point xsi:type="esdl:Point" lon="4.385733604431153" lat="52.086441924633874"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="11f4eafa-7fbc-4d82-b346-e893326d2c30">
    <carriers xsi:type="esdl:Carriers" id="eafbd8f4-1fde-4bb5-8dce-fdb74a1a1097">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="heat" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" name="heat_ret" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="10000.0" name="elec" id="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
      <carrier xsi:type="esdl:GasCommodity" name="Gas" id="bd3b2995-710a-4c30-b335-3057041ff65b" pressure="8.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
