<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="5" id="c9e01879-71f3-4911-a398-84f711e234bb" name="2a" description="unit test case" esdlVersion="v2102">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="b66ef2e0-2543-43a3-98b4-60f2cad50a9a">
    <carriers xsi:type="esdl:Carriers" id="11edbe28-baa6-44c4-a876-c8f112213a28">
      <carrier xsi:type="esdl:HeatCommodity" id="76160f2d-374c-4df5-9bee-20ff805124f8_ret" returnTemperature="45.0" name="Heat_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" id="76160f2d-374c-4df5-9bee-20ff805124f8" name="Heat" supplyTemperature="75.0"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="c7104449-b5eb-49c7-b064-a2a4b16ae6e4">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATT" multiplier="MEGA" physicalQuantity="POWER" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="9824a796-cf2b-4bdf-a676-294fd5312e3a" name="Untitled instance">
    <area xsi:type="esdl:Area" id="a31b9962-cec8-4ee4-ad06-bebbc33d8ebe" name="Untitled area">
      <asset xsi:type="esdl:Pipe" name="Pipe_96bc" id="96bc0bda-8111-4377-99b2-f46b8e5496e1" innerDiameter="0.1603" length="64.71961535135489" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98704736777082" lon="4.37633514404297"/>
          <point xsi:type="esdl:Point" lat="51.98707379673152" lon="4.377279281616212"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="e1dbf59a-8ac9-4bc1-bbf9-0c367cbda5bf" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="a74f0919-95d5-4eca-826a-b757452cba60"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="ffb016da-8d1a-4522-b800-ca9f27c3e00e" id="a5ffe70b-95fd-4a02-ae60-4a236533cb1f" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_51e4" id="51e4de22-7d65-45ae-ab4b-aae3bc7223c0" innerDiameter="0.1603" length="282.86556498109013" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98716629797122" lon="4.378309249877931"/>
          <point xsi:type="esdl:Point" lat="51.988540579598386" lon="4.381785392761231"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="b0b62b87-f41f-4a13-9806-185d06390d72" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="40f3eac1-4f91-4d7f-8424-2aad687412ed"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="5721f9a7-ac9a-492b-a5ac-aedd8367163a" id="5f124c30-06d9-496a-82f0-d06afcd312e6" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_6b39" id="6b39bb76-cc92-4c35-ad89-81b9f18581fc" innerDiameter="0.1603" length="222.6088250579639" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98695486628545" lon="4.378459453582765"/>
          <point xsi:type="esdl:Point" lat="51.9870341532846" lon="4.381999969482423"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="45b7d4b8-f5ff-49cf-ad67-b5a1a87b0979" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="40f3eac1-4f91-4d7f-8424-2aad687412ed"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="2aa11517-ed66-4c01-8153-5dbb41656d12" id="98806314-ffd0-4630-ae80-e7dcba57d12d" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_f9b0" id="f9b0efe5-be05-4106-b9a5-dbfe320365ee" innerDiameter="0.1603" length="272.73364059156825" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.9866641460877" lon="4.378309249877931"/>
          <point xsi:type="esdl:Point" lat="51.9855937509125" lon="4.381892681121827"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="e5d44b05-ef48-462e-b0a2-8ca4f2056fd2" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="40f3eac1-4f91-4d7f-8424-2aad687412ed"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="efea5685-11f5-49a3-b0c3-f6ccb5722f66" id="48d0f571-420e-494d-afc1-c9157f9ca758" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_2927_ret" id="29276338-9c84-465b-8320-1a63bbbb3a3a" innerDiameter="0.1603" length="284.5424510210789" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98859343574185" lon="4.382836818695069"/>
          <point xsi:type="esdl:Point" lat="51.987470229270784" lon="4.3865704536438"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="ef635a38-22de-4e0a-b708-5b410ae7952f" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="c7ce4f71-bfbe-4168-9ed8-6f2932e53e59"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="97f93925-1b6a-4c69-a718-d111d99fdf87" id="44e9eeb5-1d92-4218-80f3-8b9531be82d3" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_9a6f_ret" id="9a6f55a9-7e11-4dda-8436-4d91aa892ae6" innerDiameter="0.1603" length="236.58901335863" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.9870341532846" lon="4.382944107055665"/>
          <point xsi:type="esdl:Point" lat="51.9870605822531" lon="4.386398792266847"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="5112abf6-a036-467f-bb3b-4ee2db7f237c" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="d024024d-d64e-4512-9aa3-b02de3d0d732"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="97f93925-1b6a-4c69-a718-d111d99fdf87" id="28c1aa2c-df66-4ba4-b813-9c9a3d735c8e" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_a718_ret" id="a71819b2-eff9-48f7-b67f-9311c158d144" innerDiameter="0.1603" length="285.4445187317924" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.985540891228666" lon="4.382858276367188"/>
          <point xsi:type="esdl:Point" lat="51.9867830773058" lon="4.386506080627442"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="559a6328-7fce-4737-9dcf-cae3f34e770d" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="0791747e-cce6-4ab2-ac2f-87cf1b610781"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="97f93925-1b6a-4c69-a718-d111d99fdf87" id="52ee035f-154d-483e-86b0-38f57797c8e4" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_8592_ret" id="8592a065-d8cf-43f8-a4e9-029a3e24e9d1" innerDiameter="0.1603" length="73.4836667788432" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98716629797122" lon="4.387407302856446"/>
          <point xsi:type="esdl:Point" lat="51.987179512418464" lon="4.388480186462403"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="e4e79366-7e9d-408c-837f-59d56c160aa7" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="96249ee7-bc5c-45b8-8859-46193190ec4e"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="10fc289a-2780-4310-a1d6-2414180bdcdb" id="bc9ed99c-ab3a-4fc1-b0fb-9eef40810468" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_f3b9" id="f3b9de9c-85d0-4cbb-8e86-2d0bd3dd6498" innerDiameter="0.1603" length="42.63700468550451" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.987324871080524" lon="4.382514953613282"/>
          <point xsi:type="esdl:Point" lat="51.987708087109915" lon="4.382493495941163"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="1ae4c886-3078-4a01-a126-43e5a5738eac" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="01b0f5de-4f35-496b-88c9-d0ae8c59aec7"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="874dc021-09f4-46ec-bb5a-c3276916fbfd" id="3f7958f8-88e8-47f3-ae8d-b5cd4ce92093" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" minTemperature="70.0" name="HeatingDemand_7484" id="74846440-61d9-4f57-9bce-77e3664ba832" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.9894259117724" lon="4.382386207580567"/>
        <port xsi:type="esdl:InPort" name="In" id="b145eba8-612d-42b7-bea7-7e22a2440509" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="00f134de-804f-4ac4-b829-5e44fc433791">
          <profile xsi:type="esdl:SingleValue" id="5317d120-2e6e-415d-a3bc-bdd6268997d3" value="0.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="acbb3410-c6a6-4495-bf02-2c2f259d40ca" id="a77a0773-d214-40bf-b424-9dfcb7b26667" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" minTemperature="70.0" name="HeatingDemand_c6c8" id="c6c8d8f7-b6ae-4e8b-be9a-72282a5c3f1e" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.988144156533934" CRS="WGS84" lon="4.382386207580567"/>
        <port xsi:type="esdl:InPort" name="In" id="874dc021-09f4-46ec-bb5a-c3276916fbfd" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="3f7958f8-88e8-47f3-ae8d-b5cd4ce92093">
          <profile xsi:type="esdl:SingleValue" id="5317d120-2e6e-415d-a3bc-bdd6268997d3" value="0.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="b43e5090-a0f4-4cfa-877f-c2e75afc2c2f" id="fc3a02e2-fe94-4641-b94b-99161215f0a8" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" minTemperature="70.0" name="HeatingDemand_6f99" id="6f99424a-004e-4fb4-8edb-17c374d5be6b" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.984576191039736" lon="4.382514953613282"/>
        <port xsi:type="esdl:InPort" name="In" id="30713528-878b-46fd-82e2-9da8eb95075e" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="3b1e06ac-9998-4c62-8764-7e582bd478bc">
          <profile xsi:type="esdl:SingleValue" id="5317d120-2e6e-415d-a3bc-bdd6268997d3" value="0.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="c02aa852-9471-480d-a9da-8d794a356285" id="d35984bb-f7da-4313-bfba-0e651dfe3ac6" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_5d92" id="5d926b6c-a5c3-4a84-9fd7-fb2b0a793c53" innerDiameter="0.1603" length="42.639244076735075" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.9853558818439" lon="4.382429122924806"/>
          <point xsi:type="esdl:Point" lat="51.984972645687144" lon="4.382450580596925"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="ff5409f6-79ac-427a-ac8a-697927a33ef2" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="6620ebae-26d8-4a04-8e32-04a244a56144"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="30713528-878b-46fd-82e2-9da8eb95075e" id="3b1e06ac-9998-4c62-8764-7e582bd478bc" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_6604" id="6604187b-1d8f-4f4e-ab60-845ee74b3fa3" innerDiameter="0.1603" length="36.733067324883415" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.9887387898147" lon="4.38232183456421"/>
          <point xsi:type="esdl:Point" lat="51.989069138225666" lon="4.38232183456421"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="471c8497-b34b-449d-bbf9-4ec563090989" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="ae672672-7869-4460-b39b-090ec4e1e96f"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="b145eba8-612d-42b7-bea7-7e22a2440509" id="00f134de-804f-4ac4-b829-5e44fc433791" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" power="100000000.0" name="GeothermalSource_fafd" id="f76693ae-be7f-4246-ba13-c78337ea0e54" minTemperature="65.0" maxTemperature="85.0">
        <geometry xsi:type="esdl:Point" lat="51.9870405822531" CRS="WGS84" lon="4.375349548797608"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="e1dbf59a-8ac9-4bc1-bbf9-0c367cbda5bf" id="a74f0919-95d5-4eca-826a-b757452cba60" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
        <port xsi:type="esdl:InPort" name="In" id="32e53487-903e-425c-a40c-22db341df148" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="dcebb219-1aae-4f7e-9440-b81e6954e279"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" power="100000000.0" name="GeothermalSource_27cb" id="06f4c7dd-2293-48a3-aa04-76e4d2ab2a6e" minTemperature="65.0" maxTemperature="85.0">
        <geometry xsi:type="esdl:Point" lat="51.986925133624595" lon="4.389113187789918"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="22a22cb4-c95a-4a38-a1a4-148b0e1b14fd" id="45cc9a58-c769-471a-88e5-1f5b47a7b3c1" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
        <port xsi:type="esdl:InPort" name="In" id="10fc289a-2780-4310-a1d6-2414180bdcdb" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="bc9ed99c-ab3a-4fc1-b0fb-9eef40810468"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_bfea_ret" id="b060e8a6-cb4e-4f2d-a17f-cb922b2080dd">
        <geometry xsi:type="esdl:Point" lat="51.98725219180846" CRS="WGS84" lon="4.3867743015289316"/>
        <port xsi:type="esdl:InPort" name="In" id="b467ea4f-fa8a-4921-8ce2-aec564614219" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="0fa3e162-c2f1-4851-b55e-d844aa031d23"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="7bff3cae-f595-4e84-a001-0c7cf50fdffd 525800f1-ac51-46d4-be02-b6bfe594676d ade8d4b8-7e71-4828-a484-f7ef9433cd76" id="74f7f26a-1327-4ed4-ac42-12e4fa759ad0" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_bfea" id="bfea62e9-81af-45b1-be77-7910c4466193">
        <geometry xsi:type="esdl:Point" lat="51.98698129530076" CRS="WGS84" lon="4.386785030364991"/>
        <port xsi:type="esdl:InPort" name="In" id="97f93925-1b6a-4c69-a718-d111d99fdf87" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="44e9eeb5-1d92-4218-80f3-8b9531be82d3 28c1aa2c-df66-4ba4-b813-9c9a3d735c8e 52ee035f-154d-483e-86b0-38f57797c8e4"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="e4e79366-7e9d-408c-837f-59d56c160aa7" id="96249ee7-bc5c-45b8-8859-46193190ec4e" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_d637_ret" id="0f8349e8-009c-4adc-a43c-8cfb5cedeb4c">
        <geometry xsi:type="esdl:Point" lat="51.987139869065096" CRS="WGS84" lon="4.382375478744508"/>
        <port xsi:type="esdl:InPort" name="In" id="2aa11517-ed66-4c01-8153-5dbb41656d12" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="98806314-ffd0-4630-ae80-e7dcba57d12d 888bc8f9-0c5d-4534-b3a6-185f7518e218"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="1ae4c886-3078-4a01-a126-43e5a5738eac" id="01b0f5de-4f35-496b-88c9-d0ae8c59aec7" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_d637" id="d63737c3-87c0-4720-b7f7-01de0c102434">
        <geometry xsi:type="esdl:Point" lat="51.98688879367896" CRS="WGS84" lon="4.382514953613282"/>
        <port xsi:type="esdl:InPort" name="In" id="fc3843d8-afcc-4030-b0e5-88a2c19f2f8c" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="595907ec-d7d7-4211-9852-b1bd53d4e9f4"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="5112abf6-a036-467f-bb3b-4ee2db7f237c d500437d-e4cd-4c48-a921-919e175cf5b2" id="d024024d-d64e-4512-9aa3-b02de3d0d732" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_f394" id="f3942dd0-8b7e-45b1-9714-5cc656145179">
        <geometry xsi:type="esdl:Point" lat="51.98570607753357" CRS="WGS84" lon="4.382225275039674"/>
        <port xsi:type="esdl:InPort" name="In" id="e5267f56-bbf4-4852-a25f-d3776fe38d16" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="0e19db7e-1dce-456f-b8e4-add92d7dc229"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="559a6328-7fce-4737-9dcf-cae3f34e770d e4112faf-e3f7-4310-8952-b49f4efe4ea7" id="0791747e-cce6-4ab2-ac2f-87cf1b610781" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_f394_ret" id="d50228b8-e571-477d-9d6e-7593dcbea442">
        <geometry xsi:type="esdl:Point" lat="51.98553428376382" CRS="WGS84" lon="4.382504224777223"/>
        <port xsi:type="esdl:InPort" name="In" id="efea5685-11f5-49a3-b0c3-f6ccb5722f66" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="48d0f571-420e-494d-afc1-c9157f9ca758 926f4acf-acbb-48c9-a1ff-cb732c3c3191"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="ff5409f6-79ac-427a-ac8a-697927a33ef2" id="6620ebae-26d8-4a04-8e32-04a244a56144" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_f54e" id="f54ebdd3-b008-45ec-ad9a-b8fc1d768586">
        <geometry xsi:type="esdl:Point" lat="51.987146476293084" CRS="WGS84" lon="4.377590417861939"/>
        <port xsi:type="esdl:InPort" name="In" id="318839fd-89d8-488e-b4e6-4dcb4a4ced2a" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="0a6a08d6-3271-42e5-814c-74081a0423cc a660e689-f2e4-4052-808f-b9270f987189 005cb3f2-c5a5-4415-8ace-f7602e91b7f2"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="890bc53f-488a-4948-9825-d6481e309dcb" id="cbbb9bd2-4eae-4366-b574-8448f3c03654" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_f54e_ret" id="2fd380b7-206d-4c2a-8db8-6f0466330dab">
        <geometry xsi:type="esdl:Point" lat="51.98687557914596" CRS="WGS84" lon="4.377869367599488"/>
        <port xsi:type="esdl:InPort" name="In" id="ffb016da-8d1a-4522-b800-ca9f27c3e00e" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="a5ffe70b-95fd-4a02-ae60-4a236533cb1f"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="b0b62b87-f41f-4a13-9806-185d06390d72 45b7d4b8-f5ff-49cf-ad67-b5a1a87b0979 e5d44b05-ef48-462e-b0a2-8ca4f2056fd2" id="40f3eac1-4f91-4d7f-8424-2aad687412ed" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4981" id="4981f45b-3f7f-40a1-9ab9-767647333938">
        <geometry xsi:type="esdl:Point" lat="51.98862316729514" CRS="WGS84" lon="4.38206434249878"/>
        <port xsi:type="esdl:InPort" name="In" id="1e88ea92-59da-4509-b575-6ffe6da304f7" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="9a581781-6f74-49c6-8333-bcff43165805"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="ef635a38-22de-4e0a-b708-5b410ae7952f 41ca1e9a-d112-419a-90fc-8fa5e01fc07a" id="c7ce4f71-bfbe-4168-9ed8-6f2932e53e59" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4981_ret" id="82278cef-24cf-4413-9860-8715f95bb007">
        <geometry xsi:type="esdl:Point" lat="51.988487723392524" CRS="WGS84" lon="4.382375478744508"/>
        <port xsi:type="esdl:InPort" name="In" id="5721f9a7-ac9a-492b-a5ac-aedd8367163a" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="5f124c30-06d9-496a-82f0-d06afcd312e6 c0d628fd-5d78-4c15-b6e5-f863abb50137"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="471c8497-b34b-449d-bbf9-4ec563090989" id="ae672672-7869-4460-b39b-090ec4e1e96f" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_96bc_ret" id="25c0ce8d-a7ef-4d87-8538-606d50dea54b" innerDiameter="0.1603" length="64.71961535135489" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98705379673152" lon="4.377259281616212"/>
          <point xsi:type="esdl:Point" lat="51.98702736777082" lon="4.3763151440429695"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="890bc53f-488a-4948-9825-d6481e309dcb" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="cbbb9bd2-4eae-4366-b574-8448f3c03654"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="32e53487-903e-425c-a40c-22db341df148" id="dcebb219-1aae-4f7e-9440-b81e6954e279" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_51e4_ret" id="0f1e9676-8f12-4e7a-8239-cfe836fa6d00" innerDiameter="0.1603" length="282.86556498109013" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98852057959839" lon="4.381765392761231"/>
          <point xsi:type="esdl:Point" lat="51.98714629797122" lon="4.3782892498779304"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="41ca1e9a-d112-419a-90fc-8fa5e01fc07a" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="c7ce4f71-bfbe-4168-9ed8-6f2932e53e59"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="318839fd-89d8-488e-b4e6-4dcb4a4ced2a" id="0a6a08d6-3271-42e5-814c-74081a0423cc" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_6b39_ret" id="8ef48aeb-50af-4f04-baae-ea8ced21ec13" innerDiameter="0.1603" length="222.6088250579639" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.9870141532846" lon="4.381979969482423"/>
          <point xsi:type="esdl:Point" lat="51.98693486628545" lon="4.378439453582764"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="d500437d-e4cd-4c48-a921-919e175cf5b2" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="d024024d-d64e-4512-9aa3-b02de3d0d732"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="318839fd-89d8-488e-b4e6-4dcb4a4ced2a" id="a660e689-f2e4-4052-808f-b9270f987189" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_f9b0_ret" id="d6d374b9-4e25-43e2-9bbd-37c580a1414b" innerDiameter="0.1603" length="272.73364059156825" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.9855737509125" lon="4.381872681121827"/>
          <point xsi:type="esdl:Point" lat="51.9866441460877" lon="4.3782892498779304"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="e4112faf-e3f7-4310-8952-b49f4efe4ea7" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="0791747e-cce6-4ab2-ac2f-87cf1b610781"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="318839fd-89d8-488e-b4e6-4dcb4a4ced2a" id="005cb3f2-c5a5-4415-8ace-f7602e91b7f2" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_6604_ret" id="be98bc9a-55f6-47a5-83b6-f6f9d03ad8f8" innerDiameter="0.1603" length="36.733067324883415" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98904913822567" lon="4.38230183456421"/>
          <point xsi:type="esdl:Point" lat="51.9887187898147" lon="4.38230183456421"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="acbb3410-c6a6-4495-bf02-2c2f259d40ca" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="a77a0773-d214-40bf-b424-9dfcb7b26667"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="1e88ea92-59da-4509-b575-6ffe6da304f7" id="9a581781-6f74-49c6-8333-bcff43165805" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_f3b9_ret" id="3f21c500-7f55-45dd-b8d4-c90b02fcd6f1" innerDiameter="0.1603" length="42.63700468550451" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.987688087109916" lon="4.382473495941163"/>
          <point xsi:type="esdl:Point" lat="51.987304871080525" lon="4.382494953613282"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="b43e5090-a0f4-4cfa-877f-c2e75afc2c2f" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="fc3a02e2-fe94-4641-b94b-99161215f0a8"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="fc3843d8-afcc-4030-b0e5-88a2c19f2f8c" id="595907ec-d7d7-4211-9852-b1bd53d4e9f4" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_2927" id="dec5d7e5-d1d2-4305-bf26-677bf91122ee" innerDiameter="0.1603" length="284.5424510210789" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.987450229270785" lon="4.3865504536438"/>
          <point xsi:type="esdl:Point" lat="51.98857343574185" lon="4.382816818695069"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="7bff3cae-f595-4e84-a001-0c7cf50fdffd" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="74f7f26a-1327-4ed4-ac42-12e4fa759ad0"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="5721f9a7-ac9a-492b-a5ac-aedd8367163a" id="c0d628fd-5d78-4c15-b6e5-f863abb50137" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_9a6f" id="76a64b03-e5af-4a6c-acd3-70e846cd44c2" innerDiameter="0.1603" length="236.58901335863" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.9870405822531" lon="4.3863787922668465"/>
          <point xsi:type="esdl:Point" lat="51.9870141532846" lon="4.382924107055665"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="525800f1-ac51-46d4-be02-b6bfe594676d" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="74f7f26a-1327-4ed4-ac42-12e4fa759ad0"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="2aa11517-ed66-4c01-8153-5dbb41656d12" id="888bc8f9-0c5d-4534-b3a6-185f7518e218" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_a718" id="8fbb7fbc-3433-43c4-96fa-f6fafbddd511" innerDiameter="0.1603" length="285.4445187317924" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.9867630773058" lon="4.386486080627442"/>
          <point xsi:type="esdl:Point" lat="51.98552089122867" lon="4.382838276367188"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="ade8d4b8-7e71-4828-a484-f7ef9433cd76" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="74f7f26a-1327-4ed4-ac42-12e4fa759ad0"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="efea5685-11f5-49a3-b0c3-f6ccb5722f66" id="926f4acf-acbb-48c9-a1ff-cb732c3c3191" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_8592" id="21b1b1d5-0aee-4bc2-9aca-050b374c6898" innerDiameter="0.1603" length="73.4836667788432" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.987159512418465" lon="4.388460186462403"/>
          <point xsi:type="esdl:Point" lat="51.98714629797122" lon="4.387387302856446"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="22a22cb4-c95a-4a38-a1a4-148b0e1b14fd" carrier="76160f2d-374c-4df5-9bee-20ff805124f8" connectedTo="45cc9a58-c769-471a-88e5-1f5b47a7b3c1"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="b467ea4f-fa8a-4921-8ce2-aec564614219" id="0fa3e162-c2f1-4851-b55e-d844aa031d23" carrier="76160f2d-374c-4df5-9bee-20ff805124f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_5d92_ret" id="16ae6491-df96-404a-a466-4a39c67e8e21" innerDiameter="0.1603" length="42.639244076735075" outerDiameter="0.25">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="5d4601b4-12cc-4da9-956a-f58d746f870c" thermalConductivity="52.15" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="74926ea3-65c8-49d4-99e5-4733f851d1c8" thermalConductivity="0.027" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4" thermalConductivity="0.4" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.984952645687144" lon="4.382430580596925"/>
          <point xsi:type="esdl:Point" lat="51.9853358818439" lon="4.3824091229248054"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="c02aa852-9471-480d-a9da-8d794a356285" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret" connectedTo="d35984bb-f7da-4313-bfba-0e651dfe3ac6"/>
        <port xsi:type="esdl:OutPort" name="Out" connectedTo="e5267f56-bbf4-4852-a25f-d3776fe38d16" id="0e19db7e-1dce-456f-b8e4-add92d7dc229" carrier="76160f2d-374c-4df5-9bee-20ff805124f8_ret"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
