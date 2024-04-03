<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="81af5735-c13a-4fa4-aef1-e35676858b7a" description="Test network for the bus" esdlVersion="v2109" version="4" name="Electric_bus4">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="2dda7438-1efd-4c4d-8115-495032858aa9">
    <carriers xsi:type="esdl:Carriers" id="55ef6a87-d7c5-4871-83b3-ee33f5c0e0d6">
      <carrier xsi:type="esdl:ElectricityCommodity" name="electricity" id="48c94e57-26f7-4926-bf77-95437cebd000" voltage="230.0"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="cc5c7fa0-e917-4a2c-b272-074d7969e6d1" name="Untitled instance">
    <area xsi:type="esdl:Area" id="b6f69416-2004-45f3-af7b-b3884edfe599" name="Untitled area">
      <asset xsi:type="esdl:ElectricityProducer" name="ElectricityProducer_17a1" id="ElectricityProducer_17a1" power="1000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.08610776589893" lon="5.119628906250001"/>
        <port xsi:type="esdl:OutPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="a9f61f0f-960b-432d-a880-a56acd2f013e" name="Out" id="3c904675-33f6-4d01-8ab0-427f25cb8eb8"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="ElectricityDemand_e527" id="ElectricityDemand_e527" power="1000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.084367319956606" lon="5.1258301734924325"/>
        <port xsi:type="esdl:InPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="75f03edd-149a-4bdb-adda-39e1f6e5ca7a" name="In" id="d9ad4682-4324-484c-bd3a-ee14f51cdc3f"/>
      </asset>
      <asset xsi:type="esdl:Bus" name="Bus_f262" id="f262233c-e1a9-46ca-8c54-812cb64263b8">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.085052958279135" lon="5.122611522674561"/>
        <port xsi:type="esdl:InPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="589a97da-a84f-4614-819d-ab123d66f5f1 dedac52d-e23c-4e0a-b3a0-025ed3c4537e" name="In" id="2404d6a4-c7a1-433a-b0f9-ba3845ae706b"/>
        <port xsi:type="esdl:OutPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="a2d49319-d387-49e3-aa58-2d159314e7d8 c9f38195-7bdc-420a-83b5-e437a21764b9" name="Out" id="9f455f7a-d82d-4c50-9120-9442ef4af39b"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_1ad0" id="1ad063bc-0e08-4570-8c1e-839bc6f591e3" length="2000.1" capacity="32660">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08610776589893" lon="5.119628906250001"/>
          <point xsi:type="esdl:Point" lat="52.085052958279135" lon="5.122611522674561"/>
        </geometry>
        <port xsi:type="esdl:InPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="3c904675-33f6-4d01-8ab0-427f25cb8eb8" name="In" id="a9f61f0f-960b-432d-a880-a56acd2f013e"/>
        <port xsi:type="esdl:OutPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" name="Out" id="589a97da-a84f-4614-819d-ab123d66f5f1"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_de9a" id="de9a9562-dbca-462c-95a1-4e03cb6fabc2" length="4000.8" capacity="32660">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.085052958279135" lon="5.122611522674561"/>
          <point xsi:type="esdl:Point" lat="52.084367319956606" lon="5.1258301734924325"/>
        </geometry>
        <port xsi:type="esdl:InPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="9f455f7a-d82d-4c50-9120-9442ef4af39b" name="In" id="a2d49319-d387-49e3-aa58-2d159314e7d8"/>
        <port xsi:type="esdl:OutPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="d9ad4682-4324-484c-bd3a-ee14f51cdc3f" name="Out" id="75f03edd-149a-4bdb-adda-39e1f6e5ca7a"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" name="ElectricityProducer_a215" id="a2156823-eaaf-4347-bf85-ee0700eb7f18" power="1000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lon="5.119945406913758" lat="52.08411220459164"/>
        <port xsi:type="esdl:OutPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="a31a4a0c-faa5-4466-a633-13a541086169" name="Out" id="816d5849-dab6-4d8f-a5ed-482659cc8e80"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_9b55" id="9b55f67e-0b8c-4cd2-b3bc-a3d441e968c4" length="10000.1" capacity="32660">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="5.119945406913758" lat="52.08411220459164"/>
          <point xsi:type="esdl:Point" lon="5.122611522674561" lat="52.085052958279135"/>
        </geometry>
        <port xsi:type="esdl:InPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="816d5849-dab6-4d8f-a5ed-482659cc8e80" name="In" id="a31a4a0c-faa5-4466-a633-13a541086169"/>
        <port xsi:type="esdl:OutPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" name="Out" id="dedac52d-e23c-4e0a-b3a0-025ed3c4537e"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="ElectricityDemand_281a" id="ElectricityDemand_281a" power="1000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lon="5.125368833541871" lat="52.08571093544177"/>
        <port xsi:type="esdl:InPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="bf605d50-4031-4ea3-9b5b-e05073428f59" name="In" id="d316f24f-6de7-4fb2-9792-28ade7760c75"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_5843" id="58430b5f-0565-4e33-b636-7c6e8e4c34ab" length="202.1" capacity="32660">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="5.122611522674561" lat="52.085052958279135"/>
          <point xsi:type="esdl:Point" lon="5.125368833541871" lat="52.08571093544177"/>
        </geometry>
        <port xsi:type="esdl:InPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="9f455f7a-d82d-4c50-9120-9442ef4af39b" name="In" id="c9f38195-7bdc-420a-83b5-e437a21764b9"/>
        <port xsi:type="esdl:OutPort" carrier="48c94e57-26f7-4926-bf77-95437cebd000" connectedTo="d316f24f-6de7-4fb2-9792-28ade7760c75" name="Out" id="bf605d50-4031-4ea3-9b5b-e05073428f59"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
