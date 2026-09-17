<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="e9149356-35f5-438e-ab49-227b81e6033d" name="sourcesinkpump" description="">
  <instance xsi:type="esdl:Instance" id="bf32dd63-663c-4dc9-b3b4-1e89e0839607" name="Untitled instance">
    <area xsi:type="esdl:Area" id="276b0282-d062-447b-87f7-6348766c8ada" name="Untitled area">
      <asset xsi:type="esdl:ResidualHeatSource" power="180000.0" name="source" id="a0f6ddac-c2a7-41e3-8499-bbbafb9efb9b" minTemperature="65.0" maxTemperature="85.0">
        <geometry xsi:type="esdl:Point" lat="51.98871401358563" lon="4.382870346307755" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="2c613379-d423-4f8c-a536-2d7e9c66cf0d" name="In" id="22f71e37-2e23-42c0-bc0e-fdf43be5c4cf" carrier="bec60746-19e4-4011-bf4b-9a322cbea396_ret"/>
        <port xsi:type="esdl:OutPort" name="Out" id="de0609e4-6af5-4540-9e64-70a4289b67e3" connectedTo="c0a56342-010a-4dff-a3b9-b39452fa9443" carrier="bec60746-19e4-4011-bf4b-9a322cbea396"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.15" outerDiameter="0.2425" name="pipe" id="51c44578-5f62-4a77-b29a-ee829a3c2e8c" length="1000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.988682263499136" lon="4.383287429809571"/>
          <point xsi:type="esdl:Point" lat="51.98870868792912" lon="4.386441707611085"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="de0609e4-6af5-4540-9e64-70a4289b67e3" name="In" id="c0a56342-010a-4dff-a3b9-b39452fa9443" carrier="bec60746-19e4-4011-bf4b-9a322cbea396"/>
        <port xsi:type="esdl:OutPort" name="Out" id="e2a32df1-d5df-4be6-a212-589eb9cf112c" connectedTo="8b8909b9-1388-409b-bec4-f8a491b88208" carrier="bec60746-19e4-4011-bf4b-9a322cbea396"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="demand" id="demand" power="200000.0" minTemperature="70.0">
        <geometry xsi:type="esdl:Point" lat="51.98863216136771" lon="4.386720657348634" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" carrier="bec60746-19e4-4011-bf4b-9a322cbea396" connectedTo="e2a32df1-d5df-4be6-a212-589eb9cf112c" name="In" id="8b8909b9-1388-409b-bec4-f8a491b88208">
          <profile xsi:type="esdl:SingleValue" value="0.1" id="5317d120-2e6e-415d-a3bc-bdd6268997d3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" name="Out" id="75ddd94c-cc82-4967-8444-b8a7b1e5611e" connectedTo="ec06d9f1-df98-4125-b288-e9a290809d85" carrier="bec60746-19e4-4011-bf4b-9a322cbea396_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="1000.0" innerDiameter="0.15" name="pipe_ret" outerDiameter="0.2425" id="0007ad4d-feb6-43b8-a819-9ca5d71b7c86">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98868868792912" lon="4.386421707611085"/>
          <point xsi:type="esdl:Point" lat="51.98866226349914" lon="4.383267429809571"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="75ddd94c-cc82-4967-8444-b8a7b1e5611e" name="In" id="ec06d9f1-df98-4125-b288-e9a290809d85" carrier="bec60746-19e4-4011-bf4b-9a322cbea396_ret"/>
        <port xsi:type="esdl:OutPort" name="Out" id="400bcc06-999b-4caf-9443-fb2b0fd5c51c" connectedTo="c6366adf-653c-4525-b8ea-7abc28a05efe" carrier="bec60746-19e4-4011-bf4b-9a322cbea396_ret"/>
      </asset>
      <asset xsi:type="esdl:Pump" name="pump" id="ed1a5711-9b98-4659-896b-b0ade8633e33" pumpCapacity="5000.0">
        <geometry xsi:type="esdl:Point" lat="51.98867189396475" lon="4.382712095975877" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="400bcc06-999b-4caf-9443-fb2b0fd5c51c" name="In" id="c6366adf-653c-4525-b8ea-7abc28a05efe" carrier="bec60746-19e4-4011-bf4b-9a322cbea396_ret"/>
        <port xsi:type="esdl:OutPort" name="Out" id="2c613379-d423-4f8c-a536-2d7e9c66cf0d" connectedTo="22f71e37-2e23-42c0-bc0e-fdf43be5c4cf" carrier="bec60746-19e4-4011-bf4b-9a322cbea396_ret"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="b2603da2-16bc-4d29-b4b8-475ae296a23c">
    <carriers xsi:type="esdl:Carriers" id="988bd9bf-ecad-4d0e-89b5-90ab19e5e78d">
      <carrier xsi:type="esdl:HeatCommodity" id="bec60746-19e4-4011-bf4b-9a322cbea396_ret" returnTemperature="45.0" name="heat_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" id="bec60746-19e4-4011-bf4b-9a322cbea396" supplyTemperature="75.0" name="heat"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="c7104449-b5eb-49c7-b064-a2a4b16ae6e4">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Power in MW" unit="WATT" physicalQuantity="POWER" multiplier="MEGA" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
    </quantityAndUnits>
  </energySystemInformation>
</esdl:EnergySystem>
