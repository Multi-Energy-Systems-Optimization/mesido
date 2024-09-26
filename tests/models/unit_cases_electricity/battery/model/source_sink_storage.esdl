<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2107" id="b9a86f6b-02b4-4ab3-b2f3-608647c28e0e" version="4" description="Single source, single sink" name="case1_elec">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="2bb5f647-e4ff-490a-9642-ccf9274d9c40">
    <carriers xsi:type="esdl:Carriers" id="f6672aa2-7723-4945-92fa-b99846f58c92">
      <carrier xsi:type="esdl:ElectricityCommodity" name="Electricity" voltage="230.0" id="a04bdbac-5198-477b-9989-d99c3c001eaf"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="67052ed2-f139-4936-9cd8-b4c419bf2cfa" name="Untitled instance">
    <area xsi:type="esdl:Area" id="960acb90-32e0-4754-821d-f53e5567974b" name="Untitled area">
      <asset xsi:type="esdl:PVInstallation" name="ElectricityProducer_b95d" power="1500.0" id="b95dc1f7-e189-4745-8c12-3d626faf4d44">
        <port xsi:type="esdl:OutPort" name="Out" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="86f5473a-c2de-488f-9193-7aa8fe14edad" id="ee8afa6b-b78b-42fc-acaa-8b47e8680c19"/>
        <geometry xsi:type="esdl:Point" lon="4.416246414184571" lat="51.96451418555131" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="ElectricityDemand_2af6" power="10000.0" id="2af646f3-f6ec-4086-baf6-df08a225c7d9">
        <port xsi:type="esdl:InPort" name="In" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="d0d25328-6989-4933-ba30-7f9e1b47b8a0" id="3f5a40fd-1a3e-4bd0-a0da-7bca9f891328"/>
        <geometry xsi:type="esdl:Point" lon="4.421074390411378" lat="51.96619321496721" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Battery" capacity="10000000.0" dischargeEfficiency="0.85" name="Battery_71a6" chargeEfficiency="0.9" maxChargeRate="10000.0" maxDischargeRate="10000.0" id="71a6d2a3-cf73-42b7-96b7-3397ee687b37">
        <port xsi:type="esdl:InPort" name="In" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="ce2d54c4-b890-4cab-a81e-44438a6264c1" id="d5fa2830-fadb-4217-a6be-542c88ce5c2d"/>
        <geometry xsi:type="esdl:Point" lon="4.418842792510987" lat="51.96480186831168" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_7f2f" length="104.1" id="7f2fd4d7-85a1-4e10-baf6-723a80235c3a" capacity="32660.0">
        <port xsi:type="esdl:InPort" name="In" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="ee8afa6b-b78b-42fc-acaa-8b47e8680c19" id="86f5473a-c2de-488f-9193-7aa8fe14edad"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="a65bcaf0-1a11-407f-bdd5-b82239b59c17" id="0063d70c-16a5-4ece-81c9-f6ae44497e51"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.417126178741456" lat="51.96477860380529"/>
          <point xsi:type="esdl:Point" lon="4.418455213308335" lat="51.96523155028275"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_9a8a" length="134.5" id="9a8adfda-9065-4168-847f-a2de7f2899d7" capacity="32660.0">
        <port xsi:type="esdl:InPort" name="In" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="b41cfc57-f9d4-4aec-8b4e-a532fde4c57a" id="093222a6-f0c7-47ad-91f8-4542eec0405f"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="3f5a40fd-1a3e-4bd0-a0da-7bca9f891328" id="d0d25328-6989-4933-ba30-7f9e1b47b8a0"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.418546408414842" lat="51.965258818422676"/>
          <point xsi:type="esdl:Point" lon="4.4202589988708505" lat="51.965849481781945"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_91c1" length="51.0" id="91c1143a-e47d-4eee-b930-1ac096263f92" capacity="3600.0">
        <port xsi:type="esdl:InPort" name="In" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="b41cfc57-f9d4-4aec-8b4e-a532fde4c57a" id="27ad1d6f-d986-4ac3-83cd-12e35971552a"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="d5fa2830-fadb-4217-a6be-542c88ce5c2d" id="ce2d54c4-b890-4cab-a81e-44438a6264c1"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.418514221906663" lat="51.96521337151357"/>
          <point xsi:type="esdl:Point" lon="4.418842792510987" lat="51.96480186831168"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Bus" name="Bus_822f" id="822f6e65-9769-48e2-adc2-40cca64f7ddf">
        <port xsi:type="esdl:InPort" name="In" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="0063d70c-16a5-4ece-81c9-f6ae44497e51" id="a65bcaf0-1a11-407f-bdd5-b82239b59c17"/>
        <port xsi:type="esdl:OutPort" name="Out" carrier="a04bdbac-5198-477b-9989-d99c3c001eaf" connectedTo="093222a6-f0c7-47ad-91f8-4542eec0405f 27ad1d6f-d986-4ac3-83cd-12e35971552a" id="b41cfc57-f9d4-4aec-8b4e-a532fde4c57a"/>
        <geometry xsi:type="esdl:Point" lon="4.418508857488633" lat="51.965243118586564"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
