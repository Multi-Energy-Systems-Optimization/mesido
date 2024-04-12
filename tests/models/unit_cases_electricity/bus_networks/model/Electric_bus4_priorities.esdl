<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="5" name="Electric_bus4" esdlVersion="v2109" description="Test network for the bus" id="81af5735-c13a-4fa4-aef1-e35676858b7a">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="2dda7438-1efd-4c4d-8115-495032858aa9">
    <carriers xsi:type="esdl:Carriers" id="55ef6a87-d7c5-4871-83b3-ee33f5c0e0d6">
      <carrier xsi:type="esdl:ElectricityCommodity" name="electricity" voltage="230.0" id="48c94e57-26f7-4926-bf77-95437cebd000"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="cc5c7fa0-e917-4a2c-b272-074d7969e6d1" name="Untitled instance">
    <area xsi:type="esdl:Area" name="Untitled area" id="b6f69416-2004-45f3-af7b-b3884edfe599">
      <asset xsi:type="esdl:Import" id="ElectricityProducer_17a1" name="ElectricityProducer_17a1" power="1500.0">
        <costInformation xsi:type="esdl:CostInformation">
          <marginalCosts xsi:type="esdl:SingleValue" id="eda111ea-4312-4ad8-8059-c4cb7a17d1d9" value="5.4" name="ElectricityProducer_17a1-MarginalCosts"/>
        </costInformation>
        <port xsi:type="esdl:OutPort" connectedTo="a9f61f0f-960b-432d-a880-a56acd2f013e" name="Out" id="3c904675-33f6-4d01-8ab0-427f25cb8eb8" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <geometry xsi:type="esdl:Point" lon="5.119628906250001" CRS="WGS84" lat="52.08610776589893"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" id="ElectricityDemand_e527" name="ElectricityDemand_e527" power="1500.0">
        <port xsi:type="esdl:InPort" connectedTo="75f03edd-149a-4bdb-adda-39e1f6e5ca7a" name="In" id="d9ad4682-4324-484c-bd3a-ee14f51cdc3f" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <geometry xsi:type="esdl:Point" lon="5.1258301734924325" CRS="WGS84" lat="52.084367319956606"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="f262233c-e1a9-46ca-8c54-812cb64263b8" name="Bus_f262">
        <port xsi:type="esdl:InPort" connectedTo="589a97da-a84f-4614-819d-ab123d66f5f1 dedac52d-e23c-4e0a-b3a0-025ed3c4537e" name="In" id="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <port xsi:type="esdl:OutPort" connectedTo="a2d49319-d387-49e3-aa58-2d159314e7d8 c9f38195-7bdc-420a-83b5-e437a21764b9" name="Out" id="9f455f7a-d82d-4c50-9120-9442ef4af39b" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <geometry xsi:type="esdl:Point" lon="5.122611522674561" CRS="WGS84" lat="52.085052958279135"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="2000.1" capacity="32660.0" id="1ad063bc-0e08-4570-8c1e-839bc6f591e3" name="ElectricityCable_1ad0">
        <port xsi:type="esdl:InPort" connectedTo="3c904675-33f6-4d01-8ab0-427f25cb8eb8" name="In" id="a9f61f0f-960b-432d-a880-a56acd2f013e" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <port xsi:type="esdl:OutPort" connectedTo="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" name="Out" id="589a97da-a84f-4614-819d-ab123d66f5f1" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="5.119628906250001" lat="52.08610776589893"/>
          <point xsi:type="esdl:Point" lon="5.122611522674561" lat="52.085052958279135"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="4000.8" capacity="32660.0" id="de9a9562-dbca-462c-95a1-4e03cb6fabc2" name="ElectricityCable_de9a">
        <port xsi:type="esdl:InPort" connectedTo="9f455f7a-d82d-4c50-9120-9442ef4af39b" name="In" id="a2d49319-d387-49e3-aa58-2d159314e7d8" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <port xsi:type="esdl:OutPort" connectedTo="d9ad4682-4324-484c-bd3a-ee14f51cdc3f" name="Out" id="75f03edd-149a-4bdb-adda-39e1f6e5ca7a" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="5.122611522674561" lat="52.085052958279135"/>
          <point xsi:type="esdl:Point" lon="5.1258301734924325" lat="52.084367319956606"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="a2156823-eaaf-4347-bf85-ee0700eb7f18" name="ElectricityProducer_a215" power="1000.0">
        <costInformation xsi:type="esdl:CostInformation">
          <marginalCosts xsi:type="esdl:SingleValue" id="d18bb16f-094c-451d-bb74-943b7d6ddad0" value="2.0" name="ElectricityProducer_a215-MarginalCosts"/>
        </costInformation>
        <port xsi:type="esdl:OutPort" connectedTo="a31a4a0c-faa5-4466-a633-13a541086169" name="Out" id="816d5849-dab6-4d8f-a5ed-482659cc8e80" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <geometry xsi:type="esdl:Point" lat="52.08411220459164" CRS="WGS84" lon="5.119945406913758"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="10000.1" capacity="32660.0" id="9b55f67e-0b8c-4cd2-b3bc-a3d441e968c4" name="ElectricityCable_9b55">
        <port xsi:type="esdl:InPort" connectedTo="816d5849-dab6-4d8f-a5ed-482659cc8e80" name="In" id="a31a4a0c-faa5-4466-a633-13a541086169" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <port xsi:type="esdl:OutPort" connectedTo="2404d6a4-c7a1-433a-b0f9-ba3845ae706b" name="Out" id="dedac52d-e23c-4e0a-b3a0-025ed3c4537e" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="5.119945406913758" lat="52.08411220459164"/>
          <point xsi:type="esdl:Point" lon="5.122611522674561" lat="52.085052958279135"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" id="281a2820-4b07-4220-8c19-2285915e046c" name="ElectricityDemand_281a" power="1500.0">
        <port xsi:type="esdl:InPort" connectedTo="bf605d50-4031-4ea3-9b5b-e05073428f59" name="In" id="d316f24f-6de7-4fb2-9792-28ade7760c75" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <geometry xsi:type="esdl:Point" lat="52.08571093544177" CRS="WGS84" lon="5.125368833541871"/>
        <costInformation xsi:type="esdl:CostInformation">
          <marginalCosts xsi:type="esdl:SingleValue" id="eda111ea-4312-4ad8-8059-c4cb7a17eed9" value="4.0" name="ElectricityDemand_281a-MarginalCosts"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="202.1" capacity="32660.0" id="58430b5f-0565-4e33-b636-7c6e8e4c34ab" name="ElectricityCable_5843">
        <port xsi:type="esdl:InPort" connectedTo="9f455f7a-d82d-4c50-9120-9442ef4af39b" name="In" id="c9f38195-7bdc-420a-83b5-e437a21764b9" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <port xsi:type="esdl:OutPort" connectedTo="d316f24f-6de7-4fb2-9792-28ade7760c75" name="Out" id="bf605d50-4031-4ea3-9b5b-e05073428f59" carrier="48c94e57-26f7-4926-bf77-95437cebd000"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="5.122611522674561" lat="52.085052958279135"/>
          <point xsi:type="esdl:Point" lon="5.125368833541871" lat="52.08571093544177"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
