<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="enettopology" version="1" id="fffa60a1-a848-4cb8-bc67-0244ecb08ed7" description="" esdlVersion="v2401">
  <instance xsi:type="esdl:Instance" id="4826ac7c-6a64-4206-a725-84c2bfa07862" name="Untitled instance">
    <area xsi:type="esdl:Area" id="d5b54bf0-0d2a-43a1-9088-3f09075457df" name="Untitled area">
      <asset xsi:type="esdl:ElectricityDemand" name="demand3" id="demand3" power="1000000.0">
        <port xsi:type="esdl:InPort" id="c43006e7-fc35-42f3-88e8-5b247d025db9" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="9d931928-e054-4799-baee-7e69f40ed443"/>
        <geometry xsi:type="esdl:Point" lon="4.380025863647462" lat="51.9899016054132" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="demand1" id="demand1" power="1000000.0">
        <port xsi:type="esdl:InPort" id="cf578b10-bb8a-4514-8020-a0997d7da2ac" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="e16d09c3-6bc4-477e-8528-0e803b575576"/>
        <geometry xsi:type="esdl:Point" lon="4.379918575286866" lat="51.987860051179105" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="demand2" id="demand2" power="1000000.0">
        <port xsi:type="esdl:InPort" id="7ad4b512-df57-4f06-bbfa-3463732a0080" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="d208ce36-eb4c-4a32-9cfa-6670578af79a"/>
        <geometry xsi:type="esdl:Point" lon="4.379768371582032" lat="51.98570607753357" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" power="1000000.0" id="66fd9050-5d87-43d1-a938-7ce3d22f598e" name="ElectricityProducer_66fd" state="OPTIONAL">
        <port xsi:type="esdl:OutPort" id="cba3ab47-04d6-4fc8-abc0-25b16cd6fa37" connectedTo="24623eb7-eb9c-4424-a0bb-29753f69ae98" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.3884479999542245" lat="51.9877741585077" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" power="1000000.0" id="4d65c1cd-533e-4b5d-9ae4-0410d692e917" name="ElectricityProducer_4d65">
        <port xsi:type="esdl:OutPort" id="a87e300c-3633-443a-82a7-08abfa1c9081" connectedTo="c99765c9-ee46-4296-a081-e2f6840598ea" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.375283718109132" lat="51.98784022980801" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="8de8e677-ffb8-49ed-ad4a-ecd62fba0076" name="Bus_8de8">
        <port xsi:type="esdl:InPort" id="23f3b62c-c3e7-4102-a4f8-04b0551d73a5" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="0801219a-c8e5-47dd-9c3d-219c3838dfe9"/>
        <port xsi:type="esdl:OutPort" id="1f9d4992-f1a8-49c1-a2e9-918fbdcf7a90" connectedTo="60ade188-4578-4a4b-b8ca-de8779bf7ba8 6fd8cfbd-f52b-43ad-860c-6dc20eadfb06 03a42319-4c72-41a1-9b22-f59bd35925ed" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.387203454971314" lat="51.987741122820985" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="77a077f7-b0aa-4963-9dbc-04fe09918bdb" name="Bus_77a0">
        <port xsi:type="esdl:InPort" id="c8110277-fa0c-43b0-857d-81a305289dbd" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="3e61cd78-0f64-44d6-bac9-7d5b9616a9ba"/>
        <port xsi:type="esdl:OutPort" id="5921d666-a81a-427f-99c1-f3e5fdfe2708" connectedTo="636bb7be-da4e-46e7-b70b-8e74e6ecc1eb 4577efd8-740f-4211-8654-6a9b9f642165 588808eb-ba7b-4c73-81f8-914652e26e53" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.375991821289063" lat="51.987853444056356" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="a6f86cda-6df9-4689-b633-32c272711aa6" name="Bus_a6f8">
        <port xsi:type="esdl:InPort" id="b31f114b-8312-4fa4-8155-9aaccbd69f0c" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="11e5113d-e1f7-4027-b0b6-3ca6a3348809 3a9eac0a-13b7-430a-b55a-af8ce3592146"/>
        <port xsi:type="esdl:OutPort" id="4a4672e0-3715-4434-86aa-94fb0a22d3e3" connectedTo="0e76850d-a0aa-4d4d-ac39-10ad7f90837a" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.379929304122926" lat="51.98943912555285" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="df1b21d1-bf2b-47bb-b9dc-66fc5d90ad84" name="Bus_df1b">
        <port xsi:type="esdl:InPort" id="f62fe4c9-6939-4c92-a2ae-eb524282e970" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="d12b3440-55b3-4420-8561-febf279f87bd 2f5df2ce-acc2-4313-b6ae-33eda528dc2d"/>
        <port xsi:type="esdl:OutPort" id="f028744a-ca4f-455c-bd8b-a2bbb1c0bd87" connectedTo="0d85a6d0-634d-4f8d-96c6-60d56e547e57" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.379864931106568" lat="51.98735129987746" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="1262f01e-3f87-49cd-acea-d50f7d1548a7" name="Bus_1262">
        <port xsi:type="esdl:InPort" id="e7facf5e-8216-4ec6-a780-106d955105b2" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="8e2ad88e-fce6-4009-8055-65649c0ea82c 22ea9acc-c406-4621-94f3-9ec15bf0d3f4"/>
        <port xsi:type="esdl:OutPort" id="be90eee2-9e4e-4435-b718-3a6eb6ac6dfe" connectedTo="6ed4b22c-583d-40b6-8719-983e05a947ba" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.379725456237794" lat="51.98517747921337" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="48.5" id="de75b4eb-1674-4bf3-bc08-ad106b7751db" name="ElectricityCable_de75">
        <port xsi:type="esdl:InPort" id="c99765c9-ee46-4296-a081-e2f6840598ea" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="a87e300c-3633-443a-82a7-08abfa1c9081"/>
        <port xsi:type="esdl:OutPort" id="3e61cd78-0f64-44d6-bac9-7d5b9616a9ba" connectedTo="c8110277-fa0c-43b0-857d-81a305289dbd" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.375283718109132" lat="51.98784022980801"/>
          <point xsi:type="esdl:Point" lon="4.375991821289063" lat="51.987853444056356"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="322.2" id="26ab2ba0-6e23-409f-b02d-18fb5f6ca530" name="ElectricityCable_26ab">
        <port xsi:type="esdl:InPort" id="636bb7be-da4e-46e7-b70b-8e74e6ecc1eb" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="5921d666-a81a-427f-99c1-f3e5fdfe2708"/>
        <port xsi:type="esdl:OutPort" id="11e5113d-e1f7-4027-b0b6-3ca6a3348809" connectedTo="b31f114b-8312-4fa4-8155-9aaccbd69f0c" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.375991821289063" lat="51.987853444056356"/>
          <point xsi:type="esdl:Point" lon="4.379929304122926" lat="51.98943912555285"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="271.0" id="bee63d43-0fe6-4ac4-8e70-e060bab63cda" name="ElectricityCable_bee6">
        <port xsi:type="esdl:InPort" id="4577efd8-740f-4211-8654-6a9b9f642165" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="5921d666-a81a-427f-99c1-f3e5fdfe2708"/>
        <port xsi:type="esdl:OutPort" id="d12b3440-55b3-4420-8561-febf279f87bd" connectedTo="f62fe4c9-6939-4c92-a2ae-eb524282e970" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.375991821289063" lat="51.987853444056356"/>
          <point xsi:type="esdl:Point" lon="4.379864931106568" lat="51.98735129987746"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="392.3" id="2623c764-4e43-44bd-be44-f6a9b564c6cc" name="ElectricityCable_2623">
        <port xsi:type="esdl:InPort" id="588808eb-ba7b-4c73-81f8-914652e26e53" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="5921d666-a81a-427f-99c1-f3e5fdfe2708"/>
        <port xsi:type="esdl:OutPort" id="8e2ad88e-fce6-4009-8055-65649c0ea82c" connectedTo="e7facf5e-8216-4ec6-a780-106d955105b2" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.375991821289063" lat="51.987853444056356"/>
          <point xsi:type="esdl:Point" lon="4.379725456237794" lat="51.98517747921337"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="85.3" id="ef84a652-2c00-4595-bea8-25e0c27a3bf8" name="ElectricityCable_ef84">
        <port xsi:type="esdl:InPort" id="24623eb7-eb9c-4424-a0bb-29753f69ae98" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="cba3ab47-04d6-4fc8-abc0-25b16cd6fa37"/>
        <port xsi:type="esdl:OutPort" id="0801219a-c8e5-47dd-9c3d-219c3838dfe9" connectedTo="23f3b62c-c3e7-4102-a4f8-04b0551d73a5" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3884479999542245" lat="51.9877741585077"/>
          <point xsi:type="esdl:Point" lon="4.387203454971314" lat="51.987741122820985"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="532.7" id="6dced99f-6e0e-40a4-a705-85abb3a49119" name="ElectricityCable_6dce">
        <port xsi:type="esdl:InPort" id="60ade188-4578-4a4b-b8ca-de8779bf7ba8" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="1f9d4992-f1a8-49c1-a2e9-918fbdcf7a90"/>
        <port xsi:type="esdl:OutPort" id="3a9eac0a-13b7-430a-b55a-af8ce3592146" connectedTo="b31f114b-8312-4fa4-8155-9aaccbd69f0c" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.387203454971314" lat="51.987741122820985"/>
          <point xsi:type="esdl:Point" lon="4.379929304122926" lat="51.98943912555285"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="504.4" id="6aeb9380-c066-47ef-933f-4ed439b52011" name="ElectricityCable_6aeb">
        <port xsi:type="esdl:InPort" id="6fd8cfbd-f52b-43ad-860c-6dc20eadfb06" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="1f9d4992-f1a8-49c1-a2e9-918fbdcf7a90"/>
        <port xsi:type="esdl:OutPort" id="2f5df2ce-acc2-4313-b6ae-33eda528dc2d" connectedTo="f62fe4c9-6939-4c92-a2ae-eb524282e970" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.387203454971314" lat="51.987741122820985"/>
          <point xsi:type="esdl:Point" lon="4.379864931106568" lat="51.98735129987746"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="586.1" id="fbfd2ba0-ebeb-4d33-bb22-86c8fc14de93" name="ElectricityCable_fbfd">
        <port xsi:type="esdl:InPort" id="03a42319-4c72-41a1-9b22-f59bd35925ed" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="1f9d4992-f1a8-49c1-a2e9-918fbdcf7a90"/>
        <port xsi:type="esdl:OutPort" id="22ea9acc-c406-4621-94f3-9ec15bf0d3f4" connectedTo="e7facf5e-8216-4ec6-a780-106d955105b2" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.387203454971314" lat="51.987741122820985"/>
          <point xsi:type="esdl:Point" lon="4.379725456237794" lat="51.98517747921337"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="51.8" id="2409d0bd-d6c5-40a9-b0e4-2d3c843aecd2" name="ElectricityCable_2409">
        <port xsi:type="esdl:InPort" id="0e76850d-a0aa-4d4d-ac39-10ad7f90837a" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="4a4672e0-3715-4434-86aa-94fb0a22d3e3"/>
        <port xsi:type="esdl:OutPort" id="9d931928-e054-4799-baee-7e69f40ed443" connectedTo="c43006e7-fc35-42f3-88e8-5b247d025db9" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.379929304122926" lat="51.98943912555285"/>
          <point xsi:type="esdl:Point" lon="4.380025863647462" lat="51.9899016054132"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="58.9" id="6bc2ca4e-7603-440e-9f71-3cac1ece11b3" name="ElectricityCable_6bc2">
        <port xsi:type="esdl:InPort" id="6ed4b22c-583d-40b6-8719-983e05a947ba" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="be90eee2-9e4e-4435-b718-3a6eb6ac6dfe"/>
        <port xsi:type="esdl:OutPort" id="d208ce36-eb4c-4a32-9cfa-6670578af79a" connectedTo="7ad4b512-df57-4f06-bbfa-3463732a0080" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.379725456237794" lat="51.98517747921337"/>
          <point xsi:type="esdl:Point" lon="4.379768371582032" lat="51.98570607753357"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="10000000.0" length="56.7" id="b68272b8-9451-47b1-830b-5db00fcd3750" name="ElectricityCable_b682">
        <port xsi:type="esdl:InPort" id="0d85a6d0-634d-4f8d-96c6-60d56e547e57" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="In" connectedTo="f028744a-ca4f-455c-bd8b-a2bbb1c0bd87"/>
        <port xsi:type="esdl:OutPort" id="e16d09c3-6bc4-477e-8528-0e803b575576" connectedTo="cf578b10-bb8a-4514-8020-a0997d7da2ac" carrier="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.379864931106568" lat="51.98735129987746"/>
          <point xsi:type="esdl:Point" lon="4.379918575286866" lat="51.987860051179105"/>
        </geometry>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="290a5d76-44ea-4a7e-9ccc-4e602d6852a4">
    <carriers xsi:type="esdl:Carriers" id="04a5d067-7e1b-45fc-90c1-dfbaa668c325">
      <carrier xsi:type="esdl:ElectricityCommodity" name="elec" voltage="15000.0" id="e3716bdc-b30e-4dbb-ac96-1c8e86c29a79"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
