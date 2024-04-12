<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="b9a86f6b-02b4-4ab3-b2f3-608647c28e0e" description="Single source, single sink" esdlVersion="v2107" name="case1_elec" version="3">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="2bb5f647-e4ff-490a-9642-ccf9274d9c40">
    <carriers xsi:type="esdl:Carriers" id="f6672aa2-7723-4945-92fa-b99846f58c92">
      <carrier xsi:type="esdl:ElectricityCommodity" name="Electricity_low" voltage="1000.0" id="a04bdbac-5198-477b-9989-d99c3c001eaf"/>
      <carrier xsi:type="esdl:ElectricityCommodity" name="Electricity_high" voltage="10000.0" id="cbdb7bcd-ec17-44bd-9b7b-6caa50084e4b"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="67052ed2-f139-4936-9cd8-b4c419bf2cfa" name="Untitled instance">
    <area xsi:type="esdl:Area" id="960acb90-32e0-4754-821d-f53e5567974b" name="Untitled area">
      <asset xsi:type="esdl:ElectricityProducer" name="ElectricityProducer_b95d" power="1000.0" id="b95dc1f7-e189-4745-8c12-3d626faf4d44">
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="86f5473a-c2de-488f-9193-7aa8fe14edad" id="ee8afa6b-b78b-42fc-acaa-8b47e8680c19" carrier="cbdb7bcd-ec17-44bd-9b7b-6caa50084e4b"/>
        <geometry xsi:type="esdl:Point" lon="4.416246414184571" lat="51.96451418555131" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="ElectricityDemand_2af6" power="1000.0" id="2af646f3-f6ec-4086-baf6-df08a225c7d9">
        <port xsi:type="esdl:InPort" name="In" connectedTo="d0d25328-6989-4933-ba30-7f9e1b47b8a0" id="3f5a40fd-1a3e-4bd0-a0da-7bca9f891328" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf"/>
        <geometry xsi:type="esdl:Point" lon="4.421074390411378" lat="51.96619321496721" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="111.0" name="ElectricityCable_1fe5" capacity="32660.0" id="1fe55ebc-330d-486e-929b-0ccee1f33482">
        <port xsi:type="esdl:InPort" name="In" connectedTo="ee8afa6b-b78b-42fc-acaa-8b47e8680c19" id="86f5473a-c2de-488f-9193-7aa8fe14edad" carrier="cbdb7bcd-ec17-44bd-9b7b-6caa50084e4b"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="68acf665-555d-4ba2-aeba-61126d66d4ef" id="5254f1ce-075f-4b24-85b5-58fc72b1b5b4" carrier="cbdb7bcd-ec17-44bd-9b7b-6caa50084e4b"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.417126178741456" lat="51.96477860380529"/>
          <point xsi:type="esdl:Point" lon="4.418532326817513" lat="51.965274105099915"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="121.9" name="ElectricityCable_22c9" capacity="32660.0" id="22c974be-c266-48a9-85b8-d8a210248070">
        <port xsi:type="esdl:InPort" name="In" connectedTo="47cfa1c8-faeb-4c5f-bf4d-17979ea6e2a8" id="40852dfa-c95d-46bf-b6bc-0a6e2b6c31e7" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="3f5a40fd-1a3e-4bd0-a0da-7bca9f891328" id="d0d25328-6989-4933-ba30-7f9e1b47b8a0" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.4186919182538995" lat="51.965330293922854"/>
          <point xsi:type="esdl:Point" lon="4.4202589988708505" lat="51.965849481781945"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Transformer" name="Transformer_0185" id="0185f06d-b29c-4d07-8c3e-de550f00cc44">
        <port xsi:type="esdl:InPort" name="PrimIn" connectedTo="5254f1ce-075f-4b24-85b5-58fc72b1b5b4" id="68acf665-555d-4ba2-aeba-61126d66d4ef" carrier="cbdb7bcd-ec17-44bd-9b7b-6caa50084e4b"/>
        <port xsi:type="esdl:OutPort" name="SecOut" connectedTo="40852dfa-c95d-46bf-b6bc-0a6e2b6c31e7" id="47cfa1c8-faeb-4c5f-bf4d-17979ea6e2a8" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf"/>
        <geometry xsi:type="esdl:Point" lon="4.4185973703861245" lat="51.96530178636708" CRS="WGS84"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
