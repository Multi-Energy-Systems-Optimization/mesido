<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2401" name="Untitled EnergySystem" version="1" id="c2ee7f8b-0757-4c15-ab84-e80fe9edf722" description="">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="8cdabb23-8b95-43c4-b5fa-f58b9d03f064">
    <carriers xsi:type="esdl:Carriers" id="8ddef9d2-41c0-44cd-b49e-0e761ba5b1f8">
      <carrier xsi:type="esdl:GasCommodity" id="565813de-1f47-49f4-b464-af1feb868001" pressure="3.0" name="gas_medium"/>
      <carrier xsi:type="esdl:GasCommodity" id="1121d0b5-c794-412e-93e3-d6c9c6c1b62a" pressure="8.0" name="gas_high"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="4ab8e9fb-6f04-4cf3-ae56-75703c8e158f" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="e862de75-4b83-4ef1-80bb-d3eca41ec215" name="Untitled Area">
      <asset xsi:type="esdl:GasProducer" name="GasProducer_7549" id="75495551-62b9-4f4a-8749-3a591016701a" power="10000000.0">
        <port xsi:type="esdl:OutPort" id="97eceb85-714d-4d1e-81a3-ba1101279b48" connectedTo="e780c5a0-b7c2-4f21-807a-78d5303d417a" carrier="565813de-1f47-49f4-b464-af1feb868001" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.14007316994703" lon="4.34062957763672"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="demand" id="5433e88e-d740-428d-bf85-5359c501e2bf" power="10000000.0">
        <port xsi:type="esdl:InPort" id="0c4316aa-4bf4-4f48-8dc8-44707b67def6" carrier="1121d0b5-c794-412e-93e3-d6c9c6c1b62a" name="In" connectedTo="31a21a10-b39d-473a-95a5-f11b00cb1812"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.14181148162585" lon="4.381227493286134"/>
      </asset>
      <asset xsi:type="esdl:Compressor" name="GasConversion_6fd8" efficiency="1.0" id="6fd8495b-400c-4a94-b9ba-c99c2d7376bf">
        <port xsi:type="esdl:InPort" id="93d83c97-8fe1-4a16-8950-578d6914f635" carrier="565813de-1f47-49f4-b464-af1feb868001" name="In" connectedTo="214d045f-39b2-4848-b8ae-475364580154"/>
        <port xsi:type="esdl:OutPort" id="46bb1765-69a3-41ec-b414-c79b3c28213c" connectedTo="fde55987-40e9-4be1-9719-77de0fe939f9" carrier="1121d0b5-c794-412e-93e3-d6c9c6c1b62a" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.14083698191968" lon="4.357624053955079"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe1" id="f38891c7-a72c-4c08-ba66-5144e56239a0" diameter="DN200" length="1162.9">
        <port xsi:type="esdl:InPort" id="e780c5a0-b7c2-4f21-807a-78d5303d417a" carrier="565813de-1f47-49f4-b464-af1feb868001" name="In" connectedTo="97eceb85-714d-4d1e-81a3-ba1101279b48"/>
        <port xsi:type="esdl:OutPort" id="214d045f-39b2-4848-b8ae-475364580154" connectedTo="93d83c97-8fe1-4a16-8950-578d6914f635" carrier="565813de-1f47-49f4-b464-af1feb868001" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.14007316994703" lon="4.34062957763672"/>
          <point xsi:type="esdl:Point" lat="52.14083698191968" lon="4.357624053955079"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe2" id="6a6d199a-4484-496b-a724-c739a950aae4" diameter="DN200" length="1614.4">
        <port xsi:type="esdl:InPort" id="fde55987-40e9-4be1-9719-77de0fe939f9" carrier="1121d0b5-c794-412e-93e3-d6c9c6c1b62a" name="In" connectedTo="46bb1765-69a3-41ec-b414-c79b3c28213c"/>
        <port xsi:type="esdl:OutPort" id="31a21a10-b39d-473a-95a5-f11b00cb1812" connectedTo="0c4316aa-4bf4-4f48-8dc8-44707b67def6" carrier="1121d0b5-c794-412e-93e3-d6c9c6c1b62a" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.14083698191968" lon="4.357624053955079"/>
          <point xsi:type="esdl:Point" lat="52.14181148162585" lon="4.381227493286134"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
