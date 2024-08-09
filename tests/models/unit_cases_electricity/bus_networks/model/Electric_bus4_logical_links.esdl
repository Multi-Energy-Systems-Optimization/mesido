<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="81af5735-c13a-4fa4-aef1-e35676858b7a" description="Test network for the bus" esdlVersion="v2109" name="Electric_bus4" version="5">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="2dda7438-1efd-4c4d-8115-495032858aa9">
    <carriers xsi:type="esdl:Carriers" id="55ef6a87-d7c5-4871-83b3-ee33f5c0e0d6">
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="230.0" name="electricity" id="48c94e57-26f7-4926-bf77-95437cebd000"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="cc5c7fa0-e917-4a2c-b272-074d7969e6d1" name="Untitled instance">
    <area xsi:type="esdl:Area" id="b6f69416-2004-45f3-af7b-b3884edfe599" name="Untitled area">
      <asset xsi:type="esdl:ElectricityProducer" name="ElectricityProducer_17a1" power="1000.0" id="ElectricityProducer_17a1">
        <port xsi:type="esdl:OutPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out" connectedTo="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" id="3c904675-33f6-4d01-8ab0-427f25cb8eb8"/>
        <geometry xsi:type="esdl:Point" lon="5.119628906250001" CRS="WGS84" lat="52.08610776589893"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="ElectricityDemand_e527" power="1000.0" id="ElectricityDemand_e527">
        <port xsi:type="esdl:InPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In" connectedTo="9f455f7a-d82d-4c50-9120-9442ef4af39b" id="d9ad4682-4324-484c-bd3a-ee14f51cdc3f"/>
        <geometry xsi:type="esdl:Point" lon="5.1258301734924325" CRS="WGS84" lat="52.084367319956606"/>
      </asset>
      <asset xsi:type="esdl:Bus" name="Bus_f262" id="f262233c-e1a9-46ca-8c54-812cb64263b8">
        <port xsi:type="esdl:InPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In" connectedTo="3c904675-33f6-4d01-8ab0-427f25cb8eb8 816d5849-dab6-4d8f-a5ed-482659cc8e80" id="2404d6a4-c7a1-433a-b0f9-ba3845ae706b"/>
        <port xsi:type="esdl:OutPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out" connectedTo="d316f24f-6de7-4fb2-9792-28ade7760c75 d9ad4682-4324-484c-bd3a-ee14f51cdc3f" id="9f455f7a-d82d-4c50-9120-9442ef4af39b"/>
        <geometry xsi:type="esdl:Point" lon="5.122611522674561" CRS="WGS84" lat="52.085052958279135"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" name="ElectricityProducer_a215" power="1000.0" id="a2156823-eaaf-4347-bf85-ee0700eb7f18">
        <port xsi:type="esdl:OutPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out" connectedTo="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" id="816d5849-dab6-4d8f-a5ed-482659cc8e80"/>
        <geometry xsi:type="esdl:Point" lon="5.119945406913758" CRS="WGS84" lat="52.08411220459164"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="ElectricityDemand_281a" power="1000.0" id="281a2820-4b07-4220-8c19-2285915e046c">
        <port xsi:type="esdl:InPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In" connectedTo="9f455f7a-d82d-4c50-9120-9442ef4af39b" id="d316f24f-6de7-4fb2-9792-28ade7760c75"/>
        <geometry xsi:type="esdl:Point" lon="5.125368833541871" CRS="WGS84" lat="52.08571093544177"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
