<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="5" id="81af5735-c13a-4fa4-aef1-e35676858b7a" description="Two buses with local producers and consumers connected exclusively by logical links" esdlVersion="v2109" name="Electric_bus4_two_busses_logical_links">
  <instance xsi:type="esdl:Instance" id="cc5c7fa0-e917-4a2c-b272-074d7969e6d1" name="Untitled instance">
    <area xsi:type="esdl:Area" id="b6f69416-2004-45f3-af7b-b3884edfe599" name="Untitled area">
      <asset xsi:type="esdl:ElectricityProducer" power="750.0" name="ElectricityProducer_17a1" id="ElectricityProducer_17a1">
        <geometry xsi:type="esdl:Point" lat="52.08610776589893" lon="5.119628906250001" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="3c904675-33f6-4d01-8ab0-427f25cb8eb8" connectedTo="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" power="1000.0" name="ElectricityDemand_e527" id="ElectricityDemand_e527">
        <geometry xsi:type="esdl:Point" lat="52.084367319956606" lon="5.1258301734924325" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="d9ad4682-4324-484c-bd3a-ee14f51cdc3f" connectedTo="03167037-1cc1-4595-9207-e61a15275f0c" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
      </asset>
      <asset xsi:type="esdl:Bus" name="Bus_f262" id="f262233c-e1a9-46ca-8c54-812cb64263b8">
        <geometry xsi:type="esdl:Point" lat="52.085052958279135" lon="5.122611522674561" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" connectedTo="3c904675-33f6-4d01-8ab0-427f25cb8eb8 03167037-1cc1-4595-9207-e61a15275f0c" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
        <port xsi:type="esdl:OutPort" id="9f455f7a-d82d-4c50-9120-9442ef4af39b" connectedTo="d316f24f-6de7-4fb2-9792-28ade7760c75" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" power="750.0" name="ElectricityProducer_a215" id="a2156823-eaaf-4347-bf85-ee0700eb7f18">
        <geometry xsi:type="esdl:Point" lat="52.08411220459164" lon="5.119945406913758" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="816d5849-dab6-4d8f-a5ed-482659cc8e80" connectedTo="6be74ba7-71f0-4d34-8092-b759ccb99625" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" power="1000.0" name="ElectricityDemand_281a" id="281a2820-4b07-4220-8c19-2285915e046c">
        <geometry xsi:type="esdl:Point" lat="52.08571093544177" lon="5.125368833541871" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="d316f24f-6de7-4fb2-9792-28ade7760c75" connectedTo="9f455f7a-d82d-4c50-9120-9442ef4af39b" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
      </asset>
      <asset xsi:type="esdl:Bus" name="Bus_bae4" id="bae40711-9105-4d8b-9d09-b0af1fb9d124">
        <geometry xsi:type="esdl:Point" lat="52.08455641025498" lon="5.122713446617127" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="6be74ba7-71f0-4d34-8092-b759ccb99625" connectedTo="816d5849-dab6-4d8f-a5ed-482659cc8e80" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
        <port xsi:type="esdl:OutPort" id="03167037-1cc1-4595-9207-e61a15275f0c" connectedTo="d9ad4682-4324-484c-bd3a-ee14f51cdc3f 2404d6a4-c7a1-433a-b0f9-ba3845ae706b" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="2dda7438-1efd-4c4d-8115-495032858aa9">
    <carriers xsi:type="esdl:Carriers" id="55ef6a87-d7c5-4871-83b3-ee33f5c0e0d6">
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="230.0" name="electricity" id="48c94e57-26f7-4926-bf77-95437cebd000"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
