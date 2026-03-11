<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="testing" description="" id="9435f4dc-37bd-4f06-b597-c4bf6384dd60" esdlVersion="v2602" version="6">
  <instance xsi:type="esdl:Instance" id="7e76f9af-9ce6-446c-8b40-4eedf486c50f" name="Untitled instance">
    <area xsi:type="esdl:Area" id="3012ea70-48a2-4f0a-a96f-d15ebe709fef" name="Untitled area">
      <asset xsi:type="esdl:HeatStorage" id="50b63767-3642-40b6-9fdb-1e1ee40540cf" name="HeatStorage_50b6" volume="0.9" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lat="51.99813748912993" lon="4.368895366787911"/>
        <port xsi:type="esdl:InPort" id="5e009d62-de8b-4e45-b98b-b183ee08681a" name="In" connectedTo="e67afbb4-4f85-4949-8502-5a495fefb68c" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:OutPort" id="721c8298-f97a-4ba9-992b-333242a86037" name="Out"/>
        <constraint xsi:type="esdl:RangedConstraint" id="aca73a12-2a40-438f-b310-cdcd55b40e87" name="New Ranged Constraint" description="" attributeReference="volume">
          <range xsi:type="esdl:Range" name="New Range" id="5cf38062-9931-46bb-b137-5cd15eeaa652" maxValue="1000.0"/>
        </constraint>
      </asset>
      <asset xsi:type="esdl:HeatExchange" id="1cf594d9-9b06-4e5a-b1fc-d86481573cde" name="HeatExchange_1cf5" state="OPTIONAL" capacity="0.9">
        <geometry xsi:type="esdl:Point" lat="51.998194875294075" lon="4.368541985750199"/>
        <port xsi:type="esdl:InPort" id="ca8fedfc-5351-4b2c-8f52-ff5fca08e007" name="PrimIn" connectedTo="931e225e-b71a-421b-a7be-ac9e773ec6b1" carrier="989e6cd5-a4e2-430a-bde4-af73b417b958"/>
        <port xsi:type="esdl:OutPort" id="1e5d38e3-cdf4-490e-b129-fcef35713c9a" name="PrimOut"/>
        <port xsi:type="esdl:OutPort" id="372cf6cb-de40-4115-89e5-c597d9d0e465" name="SecOut" connectedTo="67f633e0-8671-4620-b722-8fa3d3d23a94" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:InPort" id="3e9d37b9-14d9-47c2-8793-65d0b8259f02" name="SecIn"/>
        <constraint xsi:type="esdl:RangedConstraint" id="44bf38f5-5fe6-43da-9ed0-785435ef8fad" name="New Ranged Constraint" description="" attributeReference="capacity">
          <range xsi:type="esdl:Range" name="New Range" id="abfda31c-9fb1-41a3-b4b8-8f65251e4499" maxValue="12000000.0"/>
        </constraint>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="6e86dbe9-3ff5-46d9-b9dd-84b15b78ac47" name="HeatPump_6e86" COP="3.0" state="OPTIONAL" power="0.9">
        <geometry xsi:type="esdl:Point" lat="51.99827414239261" lon="4.368875920772553"/>
        <port xsi:type="esdl:InPort" id="3fd37d49-d7f3-41a8-99ec-d6b028126a0c" name="PrimIn" connectedTo="c86f1037-777d-428b-84f0-3828f83ba883" carrier="e48b6832-449b-4871-882f-ec8d2024831a"/>
        <port xsi:type="esdl:OutPort" id="f49e529b-ab24-4029-a6a1-b377b293a9b9" name="PrimOut"/>
        <port xsi:type="esdl:InPort" id="64e4ba2b-c4df-4cfc-9697-ebf04b148f7c" name="SecIn"/>
        <port xsi:type="esdl:OutPort" id="0142df73-8263-4c48-9e3e-8adcadbb25b3" name="SecOut" connectedTo="7a9a4ed8-113a-41c9-8a3a-2cd88acbdd61" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <constraint xsi:type="esdl:RangedConstraint" id="6c4ad5c3-dcc8-453e-b28c-e89873390813" name="New Ranged Constraint" description="" attributeReference="power">
          <range xsi:type="esdl:Range" name="New Range" id="2938d331-f9f3-4515-a694-628392a25961" maxValue="15000000.0"/>
        </constraint>
      </asset>
      <asset xsi:type="esdl:HeatProducer" id="1c317dbf-8039-480c-9360-e983dc198730" name="HeatProducer_1c31" power="0.9" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lat="51.99836662049688" lon="4.368438720703126"/>
        <port xsi:type="esdl:OutPort" id="5fbb9a75-657b-4780-b720-96db429f7e2e" name="Out" connectedTo="1742912c-df91-4b39-b561-533bb38ed663" carrier="989e6cd5-a4e2-430a-bde4-af73b417b958"/>
        <port xsi:type="esdl:InPort" id="9d10221d-33b9-4469-a031-2730e536b931" name="In"/>
        <constraint xsi:type="esdl:RangedConstraint" id="62837f28-c0f3-46c1-8a54-2cc72ed2e8cf" name="New Ranged Constraint" description="" attributeReference="power">
          <range xsi:type="esdl:Range" name="New Range" id="85541018-a437-44e0-992f-3b100ed018b2" maxValue="13000000.0"/>
        </constraint>
      </asset>
      <asset xsi:type="esdl:GeothermalSource" id="0a384daf-2539-4f92-89c8-54db1b94a82b" name="GeothermalSource_0a38" power="0.9" aggregationCount="3" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lat="51.99844423590121" lon="4.368765950202943"/>
        <port xsi:type="esdl:OutPort" id="c211a51e-a61a-4b4c-8eee-5f6a95494d3c" name="Out" connectedTo="af7e6902-5650-4794-9a9b-e8f68fbd6105" carrier="e48b6832-449b-4871-882f-ec8d2024831a"/>
        <port xsi:type="esdl:InPort" id="25560e96-b264-438d-9744-928c5f792546" name="In"/>
        <constraint xsi:type="esdl:RangedConstraint" id="027c1f04-037f-40bb-947d-fa87b5c42d4e" name="New Ranged Constraint" description="" attributeReference="aggregationCount">
          <range xsi:type="esdl:Range" name="New Range" id="bc4e28ec-2fae-46d0-b9b0-59ab774ec5d7" maxValue="9.0"/>
        </constraint>
      </asset>
      <asset xsi:type="esdl:ATES" id="49ac1e95-076e-4bed-a765-64c7b589765f" name="ATES_49ac" maxChargeRate="0.9" maxDischargeRate="0.9" aggregationCount="3" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lat="51.998208499336634" lon="4.369006678462029"/>
        <port xsi:type="esdl:InPort" id="3fc389da-b91a-4f22-8d47-c7c0b6f1ec67" name="In" connectedTo="d5dde6e8-7c1d-4211-b107-ff32c4140440" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:OutPort" id="c0dd73bd-3195-45c7-8935-e17e270ef507" name="Out"/>
        <constraint xsi:type="esdl:RangedConstraint" id="3f468ebb-8807-4786-805b-46efdb9dffb7" name="New Ranged Constraint" description="" attributeReference="aggregationCount">
          <range xsi:type="esdl:Range" name="New Range" id="eea497f2-2bd1-477d-9256-b3a43d6357bb" maxValue="9.0"/>
        </constraint>
      </asset>
      <asset xsi:type="esdl:GasHeater" id="11d9b04a-83c3-4277-a915-2b6cbaa17957" name="GasHeater_11d9" state="OPTIONAL" power="0.9">
        <geometry xsi:type="esdl:Point" lat="51.998120562261704" lon="4.368276447057725"/>
        <port xsi:type="esdl:InPort" id="5275fbe3-eeb1-4c6f-9a6a-4a9b4693251d" name="In"/>
        <port xsi:type="esdl:OutPort" id="9f93a86a-1503-4e69-a13e-45c968c53e94" name="Out" connectedTo="c52bd022-f5bc-4ddc-b357-ff71363362f3" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <constraint xsi:type="esdl:RangedConstraint" id="29ece6f8-62f5-4a56-aedc-7eb0e24a359d" name="New Ranged Constraint" description="" attributeReference="power">
          <range xsi:type="esdl:Range" name="New Range" id="a5b54e48-dcb6-47b3-9e68-7ff0c165b5b3" maxValue="11000000.0"/>
        </constraint>
      </asset>
      <asset xsi:type="esdl:ElectricBoiler" id="ac4cd54a-c2b8-4587-bea3-8dae6c3e657c" name="ElectricBoiler_ac4c" power="0.9" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lat="51.997947164706495" lon="4.368415921926499"/>
        <port xsi:type="esdl:InPort" id="a06f4198-8254-4213-a381-b53df7312930" name="In"/>
        <port xsi:type="esdl:OutPort" id="45a8afe4-5884-4d0c-9ded-0ff8d10bf9a0" name="Out" connectedTo="6fb4a33f-a18e-4e5e-9a30-b250cce6c9b4" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <constraint xsi:type="esdl:RangedConstraint" id="430a8c22-3958-40ff-a775-de51b0406960" name="New Ranged Constraint" description="" attributeReference="power">
          <range xsi:type="esdl:Range" name="New Range" id="d87ca35a-8770-4a70-af60-33e517aeb35a" maxValue="10000000.0"/>
        </constraint>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="8fc7bde7-c06a-4b8d-9e47-ee4952aff6a5" name="HeatingDemand_8fc7" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.99797606434566" lon="4.368150383234025"/>
        <port xsi:type="esdl:InPort" id="65b0afc1-b35a-4dc5-96dd-363df7c3ca48" name="In" connectedTo="c141802e-37b1-47df-aa7b-b93d9b73ed93" carrier="876b17e3-3231-426c-9070-5a7de59571ad">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="5.0" measurement="Space Heat default profiles" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" host="https://profiles.warmingup.info" database="energy_profiles" filters="" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T22:00:00.000000+0000" id="8f4006e8-2347-4a78-8c3b-0415f80c4818" profileType="INPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="a2c97ce1-78c8-4b0b-98c1-868597c6b98f" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="cf4d7e2c-ab1c-4043-a630-c9e906143787" name="Pipe_cf4d" length="20.4">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.99836662049688" lon="4.368438720703126"/>
          <point xsi:type="esdl:Point" lat="51.998194875294075" lon="4.368541985750199"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="1742912c-df91-4b39-b561-533bb38ed663" name="In" connectedTo="5fbb9a75-657b-4780-b720-96db429f7e2e" carrier="989e6cd5-a4e2-430a-bde4-af73b417b958"/>
        <port xsi:type="esdl:OutPort" id="931e225e-b71a-421b-a7be-ac9e773ec6b1" name="Out" connectedTo="ca8fedfc-5351-4b2c-8f52-ff5fca08e007" carrier="989e6cd5-a4e2-430a-bde4-af73b417b958"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="d81d8d42-e961-41c0-8f9d-9414fb9d1235" name="Pipe_d81d" length="20.4">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.99844423590121" lon="4.368765950202943"/>
          <point xsi:type="esdl:Point" lat="51.99827414239261" lon="4.368875920772553"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="af7e6902-5650-4794-9a9b-e8f68fbd6105" name="In" connectedTo="c211a51e-a61a-4b4c-8eee-5f6a95494d3c" carrier="e48b6832-449b-4871-882f-ec8d2024831a"/>
        <port xsi:type="esdl:OutPort" id="c86f1037-777d-428b-84f0-3828f83ba883" name="Out" connectedTo="3fd37d49-d7f3-41a8-99ec-d6b028126a0c" carrier="e48b6832-449b-4871-882f-ec8d2024831a"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="e4eba237-003e-406c-9d75-14f6c53350ce" name="Pipe_e4eb" length="4.88">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99827414239261" lon="4.368875920772553"/>
          <point xsi:type="esdl:Point" lat="51.99824565579524" lon="4.368930235505105"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="7a9a4ed8-113a-41c9-8a3a-2cd88acbdd61" name="In" connectedTo="0142df73-8263-4c48-9e3e-8adcadbb25b3" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:OutPort" id="d6874b14-f8a3-4e3c-a047-0aaf7192235e" name="Out" carrier="876b17e3-3231-426c-9070-5a7de59571ad" connectedTo="9eec696e-c673-441b-a30b-56664dbfdf7b"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="242a177a-b572-4140-a56f-38341bc76ac2" name="Pipe_242a" length="6.67">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99824565579524" lon="4.368930235505105"/>
          <point xsi:type="esdl:Point" lat="51.998208499336634" lon="4.369006678462029"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="94bd0ca6-f2fb-49b9-9ddf-4bd89c321f1f" name="In" carrier="876b17e3-3231-426c-9070-5a7de59571ad" connectedTo="9050f692-fd11-43bb-b307-479ea89499bb"/>
        <port xsi:type="esdl:OutPort" id="d5dde6e8-7c1d-4211-b107-ff32c4140440" name="Out" connectedTo="3fc389da-b91a-4f22-8d47-c7c0b6f1ec67" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="3fba4c15-2979-48f6-af80-e548f640982e" name="Joint_3fba">
        <port xsi:type="esdl:InPort" id="9eec696e-c673-441b-a30b-56664dbfdf7b" name="In" connectedTo="d6874b14-f8a3-4e3c-a047-0aaf7192235e" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:OutPort" id="9050f692-fd11-43bb-b307-479ea89499bb" name="Out" connectedTo="94bd0ca6-f2fb-49b9-9ddf-4bd89c321f1f 328d7a19-fc2c-499b-9da6-f8cef43b50d5" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <geometry xsi:type="esdl:Point" lat="51.99824565579524" lon="4.368930235505105"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="b6451624-6461-46dd-b12b-796f7ff88230" name="Pipe_b645" length="14.91">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99804542340358" lon="4.36833679676056"/>
          <point xsi:type="esdl:Point" lat="51.99797606434566" lon="4.368150383234025"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="1ccf97f4-49ff-4c88-8695-45d1a2397240" name="In" carrier="876b17e3-3231-426c-9070-5a7de59571ad" connectedTo="4f49ee13-e7ad-4fb8-b3c7-1100353f2b3d"/>
        <port xsi:type="esdl:OutPort" id="c141802e-37b1-47df-aa7b-b93d9b73ed93" name="Out" connectedTo="65b0afc1-b35a-4dc5-96dd-363df7c3ca48" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="8a535339-aa81-4956-8995-e88a40d1cc24" name="Joint_8a53">
        <port xsi:type="esdl:InPort" id="c76a7463-1006-4a17-91b7-c4f2c6b8a26b" name="In" carrier="876b17e3-3231-426c-9070-5a7de59571ad" connectedTo="6b5e03f1-7a6f-4af6-a4dd-7ea5942bf3fb 21f1019f-21b6-4fe3-a6c7-8eae698c9e34 6a0277a1-3fc5-4338-b718-29b08b2af2fe"/>
        <port xsi:type="esdl:OutPort" id="4f49ee13-e7ad-4fb8-b3c7-1100353f2b3d" name="Out" connectedTo="1ccf97f4-49ff-4c88-8695-45d1a2397240" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <geometry xsi:type="esdl:Point" lat="51.99804542340358" lon="4.36833679676056"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="98d1fe34-6140-4af7-b761-7f9b82e8caf1" name="Pipe_98d1" length="19.94">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99813377347649" lon="4.368590265512467"/>
          <point xsi:type="esdl:Point" lat="51.99804542340358" lon="4.36833679676056"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c543b77b-946b-4f02-b768-1bd80c20d8f2" name="In" carrier="876b17e3-3231-426c-9070-5a7de59571ad" connectedTo="e7aee73d-2fdb-4983-baa0-ec544e057c42"/>
        <port xsi:type="esdl:OutPort" id="6b5e03f1-7a6f-4af6-a4dd-7ea5942bf3fb" name="Out" connectedTo="c76a7463-1006-4a17-91b7-c4f2c6b8a26b" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="4bc72f5f-6c90-4e84-a4b1-403a4ea0d222" name="Joint_4bc7">
        <port xsi:type="esdl:InPort" id="44176c99-d0d8-480e-81bb-df7f11911c8e" name="In" carrier="876b17e3-3231-426c-9070-5a7de59571ad" connectedTo="3c188079-4566-4810-81e6-689c78b72c01 1ae42ac0-48cd-4e62-b82d-741af5897048"/>
        <port xsi:type="esdl:OutPort" id="e7aee73d-2fdb-4983-baa0-ec544e057c42" name="Out" connectedTo="c543b77b-946b-4f02-b768-1bd80c20d8f2" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <geometry xsi:type="esdl:Point" lat="51.99813377347649" lon="4.368590265512467"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="f0f61284-389f-4bf5-b7c2-c0b6df6d8b0f" name="Pipe_f0f6" length="9.88">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99824565579524" lon="4.368930235505105"/>
          <point xsi:type="esdl:Point" lat="51.998204783689076" lon="4.368802160024644"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="328d7a19-fc2c-499b-9da6-f8cef43b50d5" name="In" connectedTo="9050f692-fd11-43bb-b307-479ea89499bb" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:OutPort" id="d32e6306-614f-4074-9491-3ed67fe10629" name="Out" carrier="876b17e3-3231-426c-9070-5a7de59571ad" connectedTo="b5fead09-350d-4294-b2bd-9471000ba76a"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="f439e6e3-bc4d-41ec-a64c-3f26ee5ac1ba" name="Pipe_f439" length="16.52">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.998204783689076" lon="4.368802160024644"/>
          <point xsi:type="esdl:Point" lat="51.99813377347649" lon="4.368590265512467"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="2ef5a5e2-1651-4ff2-b8f2-54e8c48c20b6" name="In" carrier="876b17e3-3231-426c-9070-5a7de59571ad" connectedTo="e8440837-da3e-4831-8155-d030dd917efd"/>
        <port xsi:type="esdl:OutPort" id="3c188079-4566-4810-81e6-689c78b72c01" name="Out" connectedTo="44176c99-d0d8-480e-81bb-df7f11911c8e" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="f41c2ea8-a4ff-4722-bb99-b6674fe4e15e" name="Joint_f41c">
        <port xsi:type="esdl:InPort" id="b5fead09-350d-4294-b2bd-9471000ba76a" name="In" connectedTo="d32e6306-614f-4074-9491-3ed67fe10629" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:OutPort" id="e8440837-da3e-4831-8155-d030dd917efd" name="Out" connectedTo="2ef5a5e2-1651-4ff2-b8f2-54e8c48c20b6 a81ef0a1-3dde-436b-bb5c-493be4bd10b8" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <geometry xsi:type="esdl:Point" lat="51.998204783689076" lon="4.368802160024644"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="9d94bfcc-a17f-4c99-85e6-9d7a023f4574" name="Pipe_9d94" length="9.3">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.998120562261704" lon="4.368276447057725"/>
          <point xsi:type="esdl:Point" lat="51.99804542340358" lon="4.36833679676056"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c52bd022-f5bc-4ddc-b357-ff71363362f3" name="In" connectedTo="9f93a86a-1503-4e69-a13e-45c968c53e94" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:OutPort" id="21f1019f-21b6-4fe3-a6c7-8eae698c9e34" name="Out" connectedTo="c76a7463-1006-4a17-91b7-c4f2c6b8a26b" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="6f129d0c-5632-43f6-b13b-b7f5545ca768" name="Pipe_6f12" length="7.6">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.998194875294075" lon="4.368541985750199"/>
          <point xsi:type="esdl:Point" lat="51.99813377347649" lon="4.368590265512467"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="67f633e0-8671-4620-b722-8fa3d3d23a94" name="In" connectedTo="372cf6cb-de40-4115-89e5-c597d9d0e465" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:OutPort" id="1ae42ac0-48cd-4e62-b82d-741af5897048" name="Out" connectedTo="44176c99-d0d8-480e-81bb-df7f11911c8e" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="80293eb7-0ac7-4b9e-8ae8-f06106f37fe0" name="Pipe_8029" length="9.8">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.998204783689076" lon="4.368802160024644"/>
          <point xsi:type="esdl:Point" lat="51.99813748912993" lon="4.368895366787911"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a81ef0a1-3dde-436b-bb5c-493be4bd10b8" name="In" connectedTo="e8440837-da3e-4831-8155-d030dd917efd" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:OutPort" id="e67afbb4-4f85-4949-8502-5a495fefb68c" name="Out" connectedTo="5e009d62-de8b-4e45-b98b-b183ee08681a" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="b158575d-ffcd-477a-866a-7953dc36ba7c" name="Pipe_b158" length="12.2">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.997947164706495" lon="4.368415921926499"/>
          <point xsi:type="esdl:Point" lat="51.99804542340358" lon="4.36833679676056"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="6fb4a33f-a18e-4e5e-9a30-b250cce6c9b4" name="In" connectedTo="45a8afe4-5884-4d0c-9ded-0ff8d10bf9a0" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
        <port xsi:type="esdl:OutPort" id="6a0277a1-3fc5-4338-b718-29b08b2af2fe" name="Out" connectedTo="c76a7463-1006-4a17-91b7-c4f2c6b8a26b" carrier="876b17e3-3231-426c-9070-5a7de59571ad"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="a072dd70-602a-4c4a-a82a-7f4cd5338569">
    <carriers xsi:type="esdl:Carriers" id="28c5cb97-fe82-4ebd-9f82-3cc6e3760abb">
      <carrier xsi:type="esdl:HeatCommodity" id="876b17e3-3231-426c-9070-5a7de59571ad" name="Supply" supplyTemperature="70.0" returnTemperature="40.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="989e6cd5-a4e2-430a-bde4-af73b417b958" name="Supply_2" supplyTemperature="75.0" returnTemperature="45.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="e48b6832-449b-4871-882f-ec8d2024831a" name="Supply_3" supplyTemperature="75.0" returnTemperature="45.0"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="df9a63f5-84f1-4930-93c7-d4c754f24666">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
</esdl:EnergySystem>
