<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="5" id="81af5735-c13a-4fa4-aef1-e35676858b7a" description="Test network for the bus" esdlVersion="v2109" name="Electric_bus4">
  <instance xsi:type="esdl:Instance" id="cc5c7fa0-e917-4a2c-b272-074d7969e6d1" name="Untitled instance">
    <area xsi:type="esdl:Area" id="b6f69416-2004-45f3-af7b-b3884edfe599" name="Untitled area">
      <asset xsi:type="esdl:ElectricityProducer" power="750.0" name="ElectricityProducer_17a1" id="ElectricityProducer_17a1">
        <geometry xsi:type="esdl:Point" lat="52.08610776589893" lon="5.119628906250001" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="3c904675-33f6-4d01-8ab0-427f25cb8eb8" connectedTo="a9f61f0f-960b-432d-a880-a56acd2f013e" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" power="1000.0" name="ElectricityDemand_e527" id="ElectricityDemand_e527">
        <geometry xsi:type="esdl:Point" lat="52.084367319956606" lon="5.1258301734924325" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="117e6462-207a-48ae-a2b2-4f5467f7e29e" id="d9ad4682-4324-484c-bd3a-ee14f51cdc3f" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
      </asset>
      <asset xsi:type="esdl:Bus" name="Bus_f262" id="f262233c-e1a9-46ca-8c54-812cb64263b8">
        <geometry xsi:type="esdl:Point" lat="52.085052958279135" lon="5.122611522674561" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="589a97da-a84f-4614-819d-ab123d66f5f1 6efba680-a9e8-4abe-a106-a232c7a5d62d" id="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
        <port xsi:type="esdl:OutPort" id="9f455f7a-d82d-4c50-9120-9442ef4af39b" connectedTo="c9f38195-7bdc-420a-83b5-e437a21764b9" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="2000.1" name="ElectricityCable_1ad0" capacity="32660.0" id="1ad063bc-0e08-4570-8c1e-839bc6f591e3">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08610776589893" lon="5.119628906250001"/>
          <point xsi:type="esdl:Point" lat="52.085052958279135" lon="5.122611522674561"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="3c904675-33f6-4d01-8ab0-427f25cb8eb8" id="a9f61f0f-960b-432d-a880-a56acd2f013e" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
        <port xsi:type="esdl:OutPort" id="589a97da-a84f-4614-819d-ab123d66f5f1" connectedTo="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" power="750.0" name="ElectricityProducer_a215" id="a2156823-eaaf-4347-bf85-ee0700eb7f18">
        <geometry xsi:type="esdl:Point" lat="52.08411220459164" lon="5.119945406913758" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="816d5849-dab6-4d8f-a5ed-482659cc8e80" connectedTo="fbedb076-7424-4d70-b6a2-00cb803da6d9" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" power="1000.0" name="ElectricityDemand_281a" id="281a2820-4b07-4220-8c19-2285915e046c">
        <geometry xsi:type="esdl:Point" lat="52.08571093544177" lon="5.125368833541871" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="bf605d50-4031-4ea3-9b5b-e05073428f59" id="d316f24f-6de7-4fb2-9792-28ade7760c75" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="202.1" name="ElectricityCable_5843" capacity="32660.0" id="58430b5f-0565-4e33-b636-7c6e8e4c34ab">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.085052958279135" lon="5.122611522674561"/>
          <point xsi:type="esdl:Point" lat="52.08571093544177" lon="5.125368833541871"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="9f455f7a-d82d-4c50-9120-9442ef4af39b" id="c9f38195-7bdc-420a-83b5-e437a21764b9" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
        <port xsi:type="esdl:OutPort" id="bf605d50-4031-4ea3-9b5b-e05073428f59" connectedTo="d316f24f-6de7-4fb2-9792-28ade7760c75" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Bus" name="Bus_bae4" id="bae40711-9105-4d8b-9d09-b0af1fb9d124">
        <geometry xsi:type="esdl:Point" lat="52.08455641025498" lon="5.122713446617127" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="980a58a4-f9d3-49ef-9164-fc7c99c78784" id="6be74ba7-71f0-4d34-8092-b759ccb99625" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
        <port xsi:type="esdl:OutPort" id="03167037-1cc1-4595-9207-e61a15275f0c" connectedTo="483db42a-a091-4d97-899a-f5e572c85a88 eeadf377-dcf6-4ede-9ce5-e1abcaca6eab" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="195.5" name="ElectricityCable_4ca3" capacity="3226.0" id="4ca37b6c-ddff-4a09-944a-7b7a25e5cf20">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08411220459164" lon="5.119945406913758"/>
          <point xsi:type="esdl:Point" lat="52.08455641025498" lon="5.122713446617127"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="816d5849-dab6-4d8f-a5ed-482659cc8e80" id="fbedb076-7424-4d70-b6a2-00cb803da6d9" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
        <port xsi:type="esdl:OutPort" id="980a58a4-f9d3-49ef-9164-fc7c99c78784" connectedTo="6be74ba7-71f0-4d34-8092-b759ccb99625" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="214.0" name="ElectricityCable_9c2d" capacity="3226.0" id="9c2d0267-d003-4c3a-abc2-640e964feda9">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08455641025498" lon="5.122713446617127"/>
          <point xsi:type="esdl:Point" lat="52.084367319956606" lon="5.1258301734924325"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="03167037-1cc1-4595-9207-e61a15275f0c" id="483db42a-a091-4d97-899a-f5e572c85a88" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
        <port xsi:type="esdl:OutPort" id="117e6462-207a-48ae-a2b2-4f5467f7e29e" connectedTo="d9ad4682-4324-484c-bd3a-ee14f51cdc3f" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="55.7" name="ElectricityCable_d16c" assetType="unidirectional" capacity="3226.0" id="d16c9aa5-5bf0-4888-be39-77402d08bdc3">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08455641025498" lon="5.122713446617127"/>
          <point xsi:type="esdl:Point" lat="52.085052958279135" lon="5.122611522674561"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="03167037-1cc1-4595-9207-e61a15275f0c" id="eeadf377-dcf6-4ede-9ce5-e1abcaca6eab" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="In"/>
        <port xsi:type="esdl:OutPort" id="6efba680-a9e8-4abe-a106-a232c7a5d62d" connectedTo="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" carrier="48c94e57-26f7-4926-bf77-95437cebd000" name="Out"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="2dda7438-1efd-4c4d-8115-495032858aa9">
    <carriers xsi:type="esdl:Carriers" id="55ef6a87-d7c5-4871-83b3-ee33f5c0e0d6">
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="230.0" name="electricity" id="48c94e57-26f7-4926-bf77-95437cebd000"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
