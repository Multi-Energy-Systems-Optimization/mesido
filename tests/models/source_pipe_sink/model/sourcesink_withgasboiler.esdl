<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="5d539f68-f98e-466b-9ff5-b908a211e0ab_with_return_network_with_return_network" description="" esdlVersion="v2401" name="sourcesink with return network with return network" version="4">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="11f4eafa-7fbc-4d82-b346-e893326d2c30">
    <carriers xsi:type="esdl:Carriers" id="eafbd8f4-1fde-4bb5-8dce-fdb74a1a1097">
      <carrier xsi:type="esdl:HeatCommodity" name="heat" supplyTemperature="70.0" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
      <carrier xsi:type="esdl:HeatCommodity" name="heat_ret" returnTemperature="40.0" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
      <carrier xsi:type="esdl:GasCommodity" name="gas" id="bd3b2995-710a-4c30-b335-3057041ff65b" pressure="8.0"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="90e7e098-038e-4462-89fe-a8852c501753" name="Untitled instance">
    <area xsi:type="esdl:Area" name="Untitled area" id="4fd1adc2-5371-4ab7-806a-b40e49d127e9">
      <asset xsi:type="esdl:HeatingDemand" name="demand" power="10000000.0" id="f6d5923d-ba9a-409d-80a0-26f73b2a574b">
        <port xsi:type="esdl:InPort" name="In" connectedTo="76679c8a-43ec-4f6d-81c4-9b43e21696cc" id="b8849fb5-fe97-48d9-91a8-9abcbf365738" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="0f4bf90b-218d-4d45-a83e-97a8a6a187af" id="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <geometry xsi:type="esdl:Point" lon="4.398479461669923" lat="52.086586960901776" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="1000.0" name="Pipe1" innerDiameter="0.15" related="Pipe1_ret" outerDiameter="0.45" id="Pipe1" diameter="DN300">
        <costInformation xsi:type="esdl:CostInformation" id="a5e06a9f-ad3d-4c95-afcf-28ce7f772ec3">
          <investmentCosts xsi:type="esdl:SingleValue" value="1962.1" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="57c72fb7-1430-4141-81ef-794da3426a71" id="3b5636b1-7b14-46bd-bb27-c0718350b418" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="b8849fb5-fe97-48d9-91a8-9abcbf365738" id="76679c8a-43ec-4f6d-81c4-9b43e21696cc" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.386527538299561" lat="52.08646829489945"/>
          <point xsi:type="esdl:Point" lon="4.398479461669923" lat="52.086586960901776"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="1000.0" name="Pipe1_ret" innerDiameter="0.15" related="Pipe1" outerDiameter="0.45" id="Pipe1_ret" diameter="DN300">
        <port xsi:type="esdl:InPort" name="In_ret" connectedTo="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" id="0f4bf90b-218d-4d45-a83e-97a8a6a187af" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" connectedTo="d1d72f1c-cd8f-4ba9-a96e-73d66eaad2c0" id="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.39796569977892" lat="52.086676960991774" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.386013537838319" lat="52.086558294989445" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:GasHeater" name="GasHeater_f713" power="10000000.0" efficiency="0.9" id="f713b386-71a0-48b8-8910-01644dc46cf1">
        <port xsi:type="esdl:InPort" name="In" connectedTo="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" id="d1d72f1c-cd8f-4ba9-a96e-73d66eaad2c0" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="3b5636b1-7b14-46bd-bb27-c0718350b418" id="57c72fb7-1430-4141-81ef-794da3426a71" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:InPort" name="GasPort" connectedTo="28918f0e-4dc1-4924-879d-c34264a44fff" id="484fdfac-aa5d-407d-b040-ae372a821d5e" carrier="bd3b2995-710a-4c30-b335-3057041ff65b"/>
        <geometry xsi:type="esdl:Point" lon="4.385733604431153" lat="52.086441924633874" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" name="GasProducer_82ec" id="82ecb457-b196-42c4-a049-afb695fed860" power="10000000.0">
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="b113c25f-a960-4471-a8c7-56f7d591e206" id="96b5a55c-d4e7-4018-a965-5d88ee205add" carrier="bd3b2995-710a-4c30-b335-3057041ff65b"/>
        <geometry xsi:type="esdl:Point" lon="4.378888607025147" lat="52.08642873949524" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.263" name="Pipe_a7b5" length="467.7" outerDiameter="0.4" id="a7b5a335-c872-4066-91f5-3a810ecad571" diameter="DN250">
        <costInformation xsi:type="esdl:CostInformation" id="99faff2e-e003-4e00-941c-cb611ae329e2">
          <investmentCosts xsi:type="esdl:SingleValue" id="8dad1cd1-95ff-4c6e-b644-a1d38cfe4b1f" value="1630.7" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" description="Costs in EUR/m" id="eca952d5-fbd9-4efd-a72c-2eb773445f25" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" connectedTo="96b5a55c-d4e7-4018-a965-5d88ee205add" id="b113c25f-a960-4471-a8c7-56f7d591e206" carrier="bd3b2995-710a-4c30-b335-3057041ff65b"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="484fdfac-aa5d-407d-b040-ae372a821d5e" id="28918f0e-4dc1-4924-879d-c34264a44fff" carrier="bd3b2995-710a-4c30-b335-3057041ff65b"/>
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
</esdl:EnergySystem>
