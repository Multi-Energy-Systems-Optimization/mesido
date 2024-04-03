<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="testabsoluteheat" id="b6b11ed7-92be-4b77-9425-8ceb7586aae1" description="" esdlVersion="v2207" version="8">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="c0c896cf-92ed-4cc1-8ade-f90cea50796a">
    <carriers xsi:type="esdl:Carriers" id="191b191f-7f71-4647-ac80-22e81955b850">
      <carrier xsi:type="esdl:HeatCommodity" id="3b1b4141-7f46-44d6-9c87-6b0c467aebcf" name="hot" supplyTemperature="80.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="f69e76e0-9810-4445-8330-38d97a57f2f8" name="medium" supplyTemperature="60.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="d49c7d21-b28c-4a36-a543-890c064d9acf" name="low" supplyTemperature="40.0"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="6bb64b24-4ca5-4270-8a2c-1e48f0ce1804" name="testabsoluteheat">
    <area xsi:type="esdl:Area" id="404d31fe-801c-4edf-917d-87e22114e0b4" name="testabsoluteheat">
      <asset xsi:type="esdl:HeatProducer" power="1000000.0" name="HeatProducer_2ec2" id="2ec26ab3-110b-477f-944b-623c332c523c">
        <geometry xsi:type="esdl:Point" lon="4.383990168571473" lat="51.984830583175274" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="9ba296fc-0130-47e9-99dd-55bd0919392b" connectedTo="d861f1de-aa92-45e1-ac46-882ea6b0b9b5" carrier="3b1b4141-7f46-44d6-9c87-6b0c467aebcf" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="e176abfd-3921-4a11-b212-335063326008" id="30c16db1-ab68-4e0c-90c9-39603150e1d3" carrier="d49c7d21-b28c-4a36-a543-890c064d9acf" name="In"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_907a" id="HeatingDemand_907a" power="1000000.0">
        <geometry xsi:type="esdl:Point" lon="4.385529756546021" lat="51.98539883051918" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="ad71e637-3cb2-487f-a593-179c5c467011" id="1b1bd6d5-2d10-4a29-b669-037a2e5a4e3e" carrier="3b1b4141-7f46-44d6-9c87-6b0c467aebcf" name="In"/>
        <port xsi:type="esdl:OutPort" id="5369a83e-8cc6-4a6e-8694-3878d5c80729" connectedTo="e03e86d3-6793-4006-9cdc-8e4cc305ed25" carrier="d49c7d21-b28c-4a36-a543-890c064d9acf" name="Out"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_6c8a" id="HeatingDemand_6c8a" power="1000000.0">
        <geometry xsi:type="esdl:Point" lon="4.385513663291932" lat="51.984040971699166" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="1a96cb87-db5d-4bb8-8aa4-9a5a11799128" id="6af2dacb-546a-4747-ae8e-e63258b3fde9" carrier="3b1b4141-7f46-44d6-9c87-6b0c467aebcf" name="In"/>
        <port xsi:type="esdl:OutPort" id="ce3f606c-ed11-4584-b899-e8980ef9dab9" connectedTo="e222c7fd-5720-447e-87f3-c7a98018b044" carrier="d49c7d21-b28c-4a36-a543-890c064d9acf" name="Out"/>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="1000000.0" name="HeatProducer_d3b2" id="d3b2d1d4-3407-4a28-93e4-7beb56e79007">
        <geometry xsi:type="esdl:Point" lon="4.387133717536927" lat="51.984774418802104" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="76205311-cb6d-45b4-b2bb-3248fde173b6" connectedTo="1c907049-3343-489d-80cd-55d423d4aa26" carrier="3b1b4141-7f46-44d6-9c87-6b0c467aebcf" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="6e8bda92-0d35-43b2-906c-243ee57d7433" id="547a6e08-432d-42f6-a29e-1352918696cb" carrier="d49c7d21-b28c-4a36-a543-890c064d9acf" name="In"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN400" name="Pipe_8a2e" outerDiameter="0.56" id="8a2e46e7-8250-4b19-b5c7-6a1fdef220e0" innerDiameter="0.3938" length="136.4">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.383990168571473" lat="51.984830583175274"/>
          <point xsi:type="esdl:Point" lon="4.3844783306121835" lat="51.984830583175274"/>
          <point xsi:type="esdl:Point" lon="4.385529756546021" lat="51.98539883051918"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="74d84321-1767-4cec-b6e7-b90c06020400" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" connectedTo="9ba296fc-0130-47e9-99dd-55bd0919392b" id="d861f1de-aa92-45e1-ac46-882ea6b0b9b5" carrier="3b1b4141-7f46-44d6-9c87-6b0c467aebcf" name="In"/>
        <port xsi:type="esdl:OutPort" id="ad71e637-3cb2-487f-a593-179c5c467011" connectedTo="1b1bd6d5-2d10-4a29-b669-037a2e5a4e3e" carrier="3b1b4141-7f46-44d6-9c87-6b0c467aebcf" name="Out"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="15adcbee-b97b-48fc-a816-80430013a850">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN400" name="Pipe_848a" outerDiameter="0.56" id="848a3f74-d312-4d10-95bd-4f97e2a04acb" innerDiameter="0.3938" length="129.9">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.385513663291932" lat="51.984040971699166"/>
          <point xsi:type="esdl:Point" lon="4.383990168571473" lat="51.984830583175274"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="74d84321-1767-4cec-b6e7-b90c06020400" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" connectedTo="ce3f606c-ed11-4584-b899-e8980ef9dab9" id="e222c7fd-5720-447e-87f3-c7a98018b044" carrier="d49c7d21-b28c-4a36-a543-890c064d9acf" name="In"/>
        <port xsi:type="esdl:OutPort" id="e176abfd-3921-4a11-b212-335063326008" connectedTo="30c16db1-ab68-4e0c-90c9-39603150e1d3" carrier="d49c7d21-b28c-4a36-a543-890c064d9acf" name="Out"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="dd01a6d7-553d-4ddb-9fdb-0673d9140adc">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN400" name="Pipe_e33a" outerDiameter="0.56" id="e33a059b-0e1a-4ecd-a944-d220daa11d1b" innerDiameter="0.3938" length="136.4">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.984774418802104" lon="4.387133717536927"/>
          <point xsi:type="esdl:Point" lat="51.984040971699166" lon="4.385513663291932"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" connectedTo="76205311-cb6d-45b4-b2bb-3248fde173b6" id="1c907049-3343-489d-80cd-55d423d4aa26" carrier="3b1b4141-7f46-44d6-9c87-6b0c467aebcf" name="In"/>
        <port xsi:type="esdl:OutPort" id="1a96cb87-db5d-4bb8-8aa4-9a5a11799128" connectedTo="6af2dacb-546a-4747-ae8e-e63258b3fde9" carrier="3b1b4141-7f46-44d6-9c87-6b0c467aebcf" name="Out"/>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="b26f6bde-c434-4599-bb2e-d0a28371c450">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN400" name="Pipe_234f" outerDiameter="0.56" id="234f3355-cb0c-4906-bcad-fa4a1c1c8c14" innerDiameter="0.3938" length="129.9">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98539883051918" lon="4.385529756546021"/>
          <point xsi:type="esdl:Point" lat="51.984774418802104" lon="4.387133717536927"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" connectedTo="5369a83e-8cc6-4a6e-8694-3878d5c80729" id="e03e86d3-6793-4006-9cdc-8e4cc305ed25" carrier="d49c7d21-b28c-4a36-a543-890c064d9acf" name="In"/>
        <port xsi:type="esdl:OutPort" id="6e8bda92-0d35-43b2-906c-243ee57d7433" connectedTo="547a6e08-432d-42f6-a29e-1352918696cb" carrier="d49c7d21-b28c-4a36-a543-890c064d9acf" name="Out"/>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="0f7c49c4-d3ab-4f3d-9c15-18282aa03717">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
