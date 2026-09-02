<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2401" name="sourcesink with return network with return network" version="8" id="5d539f68-f98e-466b-9ff5-b908a211e0ab_with_return_network_with_return_network" description="">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="11f4eafa-7fbc-4d82-b346-e893326d2c30">
    <carriers xsi:type="esdl:Carriers" id="eafbd8f4-1fde-4bb5-8dce-fdb74a1a1097">
      <carrier xsi:type="esdl:HeatCommodity" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11" supplyTemperature="70.0" name="heat"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" name="heat_ret"/>
      <carrier xsi:type="esdl:ElectricityCommodity" id="355f3a2f-dac4-4484-b3db-a99b086cbe39" voltage="400.0" name="elec"/>
      <carrier xsi:type="esdl:EnergyCarrier" id="47213979-189c-4537-8eca-5f79e70810e1" name="CO2 emissions">
        <energyContentUnit xsi:type="esdl:QuantityAndUnitType" id="390087fb-e6c0-46d5-b030-0e4c740c0346" physicalQuantity="ENERGY"/>
        <emissionUnit xsi:type="esdl:QuantityAndUnitType" id="fba0235e-ddb6-4330-aaf1-b2f5d845f951" unit="GRAM" multiplier="KILO" perUnit="JOULE" perMultiplier="GIGA" physicalQuantity="EMISSION"/>
      </carrier>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="90e7e098-038e-4462-89fe-a8852c501753" name="Untitled instance">
    <area xsi:type="esdl:Area" name="Untitled area" id="4fd1adc2-5371-4ab7-806a-b40e49d127e9">
      <asset xsi:type="esdl:HeatProducer" name="source" id="a479e4e6-6f75-460d-aeb2-d0e3e02314e0" power="10000000.0">
        <port xsi:type="esdl:OutPort" id="b0b1a87c-7b5a-4edb-a732-274d1bf69647" name="Out" connectedTo="3b5636b1-7b14-46bd-bb27-c0718350b418" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:InPort" id="622d7e19-e360-46af-bfbf-eb35ec14548b" name="In" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="0f11bb2d-fb28-4f9d-8992-8d5901f579d7"/>
        <port xsi:type="esdl:OutPort" id="417ab7fa-d210-469c-9c40-b7762909e99c" name="EmissionPort" carrier="47213979-189c-4537-8eca-5f79e70810e1"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.08646829489945" lon="4.386527538299561"/>
        <behaviour xsi:type="esdl:InputOutputRelation" id="f64bc866-cf41-48ee-8bd4-ce8920f4b00c" name="NewInputOutputRelation" mainPort="b0b1a87c-7b5a-4edb-a732-274d1bf69647">
          <mainPortRelation xsi:type="esdl:PortRelation" ratio="20.0" port="417ab7fa-d210-469c-9c40-b7762909e99c">
            <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9fe88aa4-4976-45c6-a27d-bf0ea83b8cf0" physicalQuantity="EMISSION" unit="GRAM" multiplier="KILO" perMultiplier="GIGA" perUnit="JOULE"/>
          </mainPortRelation>
          <mainPortQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="f84c981a-0107-46ce-bcfe-aef8483a5d02" physicalQuantity="ENERGY" unit="JOULE" multiplier="GIGA"/>
        </behaviour>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe1" length="1000.0" outerDiameter="0.45" id="Pipe1" diameter="DN300" innerDiameter="0.15" related="Pipe1_ret">
        <costInformation xsi:type="esdl:CostInformation" id="a5e06a9f-ad3d-4c95-afcf-28ce7f772ec3">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="3b5636b1-7b14-46bd-bb27-c0718350b418" name="In" connectedTo="b0b1a87c-7b5a-4edb-a732-274d1bf69647" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" id="76679c8a-43ec-4f6d-81c4-9b43e21696cc" name="Out" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" connectedTo="a91229f6-a3a0-4ee7-a764-7743f63b20a5"/>
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
      <asset xsi:type="esdl:Pipe" name="Pipe1_ret" length="1000.0" outerDiameter="0.45" id="Pipe1_ret" diameter="DN300" innerDiameter="0.15" related="Pipe1">
        <port xsi:type="esdl:InPort" id="0f4bf90b-218d-4d45-a83e-97a8a6a187af" name="In_ret" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="9a3d5f9c-da1a-4d88-b892-9e17247b3f86"/>
        <port xsi:type="esdl:OutPort" id="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" name="Out_ret" connectedTo="622d7e19-e360-46af-bfbf-eb35ec14548b" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.086676960991774" lon="4.39796569977892"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.086558294989445" lon="4.386013537838319"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Building" id="da03450d-dd34-4e88-9f4b-e425a086399b" name="Building_da03" port="a91229f6-a3a0-4ee7-a764-7743f63b20a5 9a3d5f9c-da1a-4d88-b892-9e17247b3f86">
        <geometry xsi:type="esdl:Point" lat="52.08674847800901" lon="4.3985478579998025"/>
        <measures xsi:type="esdl:Measures" id="55a1e74b-6bef-452a-ab1b-c54e4644a40e" name="NewMeasures" description="demands">
          <measure xsi:type="esdl:Measure" id="78de9a50-9a92-4dd9-a730-31824a5da573" name="demand_1">
            <asset xsi:type="esdl:HeatingDemand" id="4f30fa8d-6a77-426a-984a-2b78b4f3471b" name="HeatingDemand_1"/>
            <asset xsi:type="esdl:CoolingDemand" id="779be89f-8cb8-4c99-be39-fcf4d4bfab37" name="CoolingDemand_1"/>
          </measure>
          <measure xsi:type="esdl:Measure" id="def0e39c-ceb7-4190-9e91-f0be557fb0b0" name="demand_2">
            <asset xsi:type="esdl:CoolingDemand" id="8b53cd1a-6beb-4cb8-8c67-9deadb266ff4" name="CoolingDemand_2"/>
            <asset xsi:type="esdl:HeatingDemand" id="ebe5a192-b10c-441a-b212-f54b0814d378" name="HeatingDemand_2"/>
          </measure>
        </measures>
        <asset xsi:type="esdl:HeatingDemand" id="7627b44c-d281-450d-ac57-c13f749b85b6" name="HeatingDemand_7627">
          <geometry xsi:type="esdl:Point" lat="356.78125" lon="246.0" CRS="Simple"/>
          <port xsi:type="esdl:InPort" id="86e2ea2b-bec5-4e43-8ac1-3e1272dbacd5" name="In" connectedTo="520b6cb8-41d6-4527-b08b-a6ed481ba555"/>
          <port xsi:type="esdl:OutPort" id="571616de-29a0-4f08-a6ed-dc8faf1acd58" name="Out" connectedTo="6d54a67b-9577-49b6-91b3-31c8daaecb39"/>
        </asset>
        <asset xsi:type="esdl:CoolingDemand" id="04fc1b98-7d69-423a-9b35-9fecc5dab19b" name="CoolingDemand_04fc">
          <geometry xsi:type="esdl:Point" lat="149.78125" lon="244.0" CRS="Simple"/>
          <port xsi:type="esdl:InPort" id="419b7343-2ea1-43dd-8202-a54ea8e3720f" name="In" connectedTo="9a3d5f9c-da1a-4d88-b892-9e17247b3f86"/>
          <port xsi:type="esdl:OutPort" id="a17a26af-9729-48fb-8ec2-7c3f469e060b" name="Out" connectedTo="a91229f6-a3a0-4ee7-a764-7743f63b20a5"/>
        </asset>
        <asset xsi:type="esdl:HConnection" id="85ea1d58-d6d7-4523-beaf-5c0717862e66" name="HConnection_85ea">
          <geometry xsi:type="esdl:Point" lat="364.78125" lon="85.0" CRS="Simple"/>
          <port xsi:type="esdl:InPort" id="a91229f6-a3a0-4ee7-a764-7743f63b20a5" name="In building" connectedTo="a17a26af-9729-48fb-8ec2-7c3f469e060b 76679c8a-43ec-4f6d-81c4-9b43e21696cc" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
          <port xsi:type="esdl:OutPort" id="520b6cb8-41d6-4527-b08b-a6ed481ba555" name="Out" connectedTo="86e2ea2b-bec5-4e43-8ac1-3e1272dbacd5"/>
        </asset>
        <asset xsi:type="esdl:HConnection" id="0c3981b8-d1d5-4ad0-b3d2-3c0e963c921e" name="HConnection_0c39">
          <geometry xsi:type="esdl:Point" lat="144.78125" lon="90.0" CRS="Simple"/>
          <port xsi:type="esdl:InPort" id="6d54a67b-9577-49b6-91b3-31c8daaecb39" name="Out building" connectedTo="571616de-29a0-4f08-a6ed-dc8faf1acd58"/>
          <port xsi:type="esdl:OutPort" id="9a3d5f9c-da1a-4d88-b892-9e17247b3f86" name="Out" connectedTo="419b7343-2ea1-43dd-8202-a54ea8e3720f 0f4bf90b-218d-4d45-a83e-97a8a6a187af" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        </asset>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
