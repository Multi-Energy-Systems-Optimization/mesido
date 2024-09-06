<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="2a" version="7" id="c9e01879-71f3-4911-a398-84f711e234bb" description="unit test case" esdlVersion="v2102">
  <instance xsi:type="esdl:Instance" id="9824a796-cf2b-4bdf-a676-294fd5312e3a" name="Untitled instance">
    <area xsi:type="esdl:Area" id="a31b9962-cec8-4ee4-ad06-bebbc33d8ebe" name="Untitled area">
      <asset xsi:type="esdl:Pipe" length="64.71961535135489" state="OPTIONAL" id="96bc0bda-8111-4377-99b2-f46b8e5496e1" diameter="DN300" name="Pipe_96bc">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="e1dbf59a-8ac9-4bc1-bbf9-0c367cbda5bf" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="4935c26a-82ec-4ea6-b445-e3061e247b08"/>
        <port xsi:type="esdl:OutPort" id="a5ffe70b-95fd-4a02-ae60-4a236533cb1f" connectedTo="ffb016da-8d1a-4522-b800-ca9f27c3e00e" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.37633514404297" lat="51.98704736777082"/>
          <point xsi:type="esdl:Point" lon="4.377279281616212" lat="51.98707379673152"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="282.86556498109013" state="OPTIONAL" id="51e4de22-7d65-45ae-ab4b-aae3bc7223c0" diameter="DN300" name="Pipe_51e4">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="b0b62b87-f41f-4a13-9806-185d06390d72" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="40f3eac1-4f91-4d7f-8424-2aad687412ed"/>
        <port xsi:type="esdl:OutPort" id="5f124c30-06d9-496a-82f0-d06afcd312e6" connectedTo="5721f9a7-ac9a-492b-a5ac-aedd8367163a" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.378309249877931" lat="51.98716629797122"/>
          <point xsi:type="esdl:Point" lon="4.381785392761231" lat="51.988540579598386"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="222.6088250579639" state="OPTIONAL" id="6b39bb76-cc92-4c35-ad89-81b9f18581fc" diameter="DN300" name="Pipe_6b39">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="45b7d4b8-f5ff-49cf-ad67-b5a1a87b0979" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="40f3eac1-4f91-4d7f-8424-2aad687412ed"/>
        <port xsi:type="esdl:OutPort" id="98806314-ffd0-4630-ae80-e7dcba57d12d" connectedTo="2aa11517-ed66-4c01-8153-5dbb41656d12" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.378459453582765" lat="51.98695486628545"/>
          <point xsi:type="esdl:Point" lon="4.381999969482423" lat="51.9870341532846"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="272.73364059156825" state="OPTIONAL" id="f9b0efe5-be05-4106-b9a5-dbfe320365ee" diameter="DN300" name="Pipe_f9b0">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="e5d44b05-ef48-462e-b0a2-8ca4f2056fd2" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="40f3eac1-4f91-4d7f-8424-2aad687412ed"/>
        <port xsi:type="esdl:OutPort" id="48d0f571-420e-494d-afc1-c9157f9ca758" connectedTo="efea5685-11f5-49a3-b0c3-f6ccb5722f66" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.378309249877931" lat="51.9866641460877"/>
          <point xsi:type="esdl:Point" lon="4.381892681121827" lat="51.9855937509125"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="42.63700468550451" outerDiameter="0.25" id="f3b9de9c-85d0-4cbb-8e86-2d0bd3dd6498" innerDiameter="0.1603" name="Pipe_f3b9">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="1ae4c886-3078-4a01-a126-43e5a5738eac" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="01b0f5de-4f35-496b-88c9-d0ae8c59aec7"/>
        <port xsi:type="esdl:OutPort" id="3f7958f8-88e8-47f3-ae8d-b5cd4ce92093" connectedTo="4a4495e9-a65c-4580-ba2a-e75523b6ee30" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.382514953613282" lat="51.987324871080524"/>
          <point xsi:type="esdl:Point" lon="4.382493495941163" lat="51.987708087109915"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="42.639244076735075" outerDiameter="0.25" id="5d926b6c-a5c3-4a84-9fd7-fb2b0a793c53" innerDiameter="0.1603" name="Pipe_5d92">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="ff5409f6-79ac-427a-ac8a-697927a33ef2" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="6620ebae-26d8-4a04-8e32-04a244a56144"/>
        <port xsi:type="esdl:OutPort" id="3b1e06ac-9998-4c62-8764-7e582bd478bc" connectedTo="3582f331-ef46-4dda-ac78-c6e75eeee95e" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.382429122924806" lat="51.9853558818439"/>
          <point xsi:type="esdl:Point" lon="4.382450580596925" lat="51.984972645687144"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="36.733067324883415" outerDiameter="0.25" id="6604187b-1d8f-4f4e-ab60-845ee74b3fa3" innerDiameter="0.1603" name="Pipe_6604">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="471c8497-b34b-449d-bbf9-4ec563090989" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="ae672672-7869-4460-b39b-090ec4e1e96f"/>
        <port xsi:type="esdl:OutPort" id="00f134de-804f-4ac4-b829-5e44fc433791" connectedTo="d859af60-f9f2-4dce-a12b-ac488c081769" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.38232183456421" lat="51.9887387898147"/>
          <point xsi:type="esdl:Point" lon="4.38232183456421" lat="51.989069138225666"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="b060e8a6-cb4e-4f2d-a17f-cb922b2080dd" name="Joint_bfea_ret">
        <port xsi:type="esdl:InPort" id="b467ea4f-fa8a-4921-8ce2-aec564614219" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="0fa3e162-c2f1-4851-b55e-d844aa031d23"/>
        <port xsi:type="esdl:OutPort" id="74f7f26a-1327-4ed4-ac42-12e4fa759ad0" connectedTo="7bff3cae-f595-4e84-a001-0c7cf50fdffd 525800f1-ac51-46d4-be02-b6bfe594676d ade8d4b8-7e71-4828-a484-f7ef9433cd76" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.3867743015289316" lat="51.98725219180846" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="0f8349e8-009c-4adc-a43c-8cfb5cedeb4c" name="Joint_d637_ret">
        <port xsi:type="esdl:InPort" id="2aa11517-ed66-4c01-8153-5dbb41656d12" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="98806314-ffd0-4630-ae80-e7dcba57d12d 888bc8f9-0c5d-4534-b3a6-185f7518e218"/>
        <port xsi:type="esdl:OutPort" id="01b0f5de-4f35-496b-88c9-d0ae8c59aec7" connectedTo="1ae4c886-3078-4a01-a126-43e5a5738eac" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.382375478744508" lat="51.987139869065096" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="d50228b8-e571-477d-9d6e-7593dcbea442" name="Joint_f394_ret">
        <port xsi:type="esdl:InPort" id="efea5685-11f5-49a3-b0c3-f6ccb5722f66" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="48d0f571-420e-494d-afc1-c9157f9ca758 926f4acf-acbb-48c9-a1ff-cb732c3c3191"/>
        <port xsi:type="esdl:OutPort" id="6620ebae-26d8-4a04-8e32-04a244a56144" connectedTo="ff5409f6-79ac-427a-ac8a-697927a33ef2" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.382504224777223" lat="51.98553428376382" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="2fd380b7-206d-4c2a-8db8-6f0466330dab" name="Joint_f54e_ret">
        <port xsi:type="esdl:InPort" id="ffb016da-8d1a-4522-b800-ca9f27c3e00e" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="a5ffe70b-95fd-4a02-ae60-4a236533cb1f"/>
        <port xsi:type="esdl:OutPort" id="40f3eac1-4f91-4d7f-8424-2aad687412ed" connectedTo="b0b62b87-f41f-4a13-9806-185d06390d72 45b7d4b8-f5ff-49cf-ad67-b5a1a87b0979 e5d44b05-ef48-462e-b0a2-8ca4f2056fd2" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.377869367599488" lat="51.98687557914596" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="82278cef-24cf-4413-9860-8715f95bb007" name="Joint_4981_ret">
        <port xsi:type="esdl:InPort" id="5721f9a7-ac9a-492b-a5ac-aedd8367163a" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="5f124c30-06d9-496a-82f0-d06afcd312e6 c0d628fd-5d78-4c15-b6e5-f863abb50137"/>
        <port xsi:type="esdl:OutPort" id="ae672672-7869-4460-b39b-090ec4e1e96f" connectedTo="471c8497-b34b-449d-bbf9-4ec563090989" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.382375478744508" lat="51.988487723392524" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="284.5424510210789" state="OPTIONAL" id="dec5d7e5-d1d2-4305-bf26-677bf91122ee" diameter="DN300" name="Pipe_2927">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="7bff3cae-f595-4e84-a001-0c7cf50fdffd" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="74f7f26a-1327-4ed4-ac42-12e4fa759ad0"/>
        <port xsi:type="esdl:OutPort" id="c0d628fd-5d78-4c15-b6e5-f863abb50137" connectedTo="5721f9a7-ac9a-492b-a5ac-aedd8367163a" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3865504536438" lat="51.987450229270785"/>
          <point xsi:type="esdl:Point" lon="4.382816818695069" lat="51.98857343574185"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="236.58901335863" state="OPTIONAL" id="76a64b03-e5af-4a6c-acd3-70e846cd44c2" diameter="DN300" name="Pipe_9a6f">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="525800f1-ac51-46d4-be02-b6bfe594676d" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="74f7f26a-1327-4ed4-ac42-12e4fa759ad0"/>
        <port xsi:type="esdl:OutPort" id="888bc8f9-0c5d-4534-b3a6-185f7518e218" connectedTo="2aa11517-ed66-4c01-8153-5dbb41656d12" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3863787922668465" lat="51.9870405822531"/>
          <point xsi:type="esdl:Point" lon="4.382924107055665" lat="51.9870141532846"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="285.4445187317924" state="OPTIONAL" id="8fbb7fbc-3433-43c4-96fa-f6fafbddd511" diameter="DN300" name="Pipe_a718">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="ade8d4b8-7e71-4828-a484-f7ef9433cd76" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="74f7f26a-1327-4ed4-ac42-12e4fa759ad0"/>
        <port xsi:type="esdl:OutPort" id="926f4acf-acbb-48c9-a1ff-cb732c3c3191" connectedTo="efea5685-11f5-49a3-b0c3-f6ccb5722f66" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.386486080627442" lat="51.9867630773058"/>
          <point xsi:type="esdl:Point" lon="4.382838276367188" lat="51.98552089122867"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="73.4836667788432" state="OPTIONAL" id="21b1b1d5-0aee-4bc2-9aca-050b374c6898" diameter="DN300" name="Pipe_8592">
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="5d4601b4-12cc-4da9-956a-f58d746f870c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="74926ea3-65c8-49d4-99e5-4733f851d1c8"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="497f5bca-482e-4e23-9daf-ea5a9ba73bd4"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="22a22cb4-c95a-4a38-a1a4-148b0e1b14fd" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="926ddf07-fe71-4112-b306-1afacf1e66cc"/>
        <port xsi:type="esdl:OutPort" id="0fa3e162-c2f1-4851-b55e-d844aa031d23" connectedTo="b467ea4f-fa8a-4921-8ce2-aec564614219" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.388460186462403" lat="51.987159512418465"/>
          <point xsi:type="esdl:Point" lon="4.387387302856446" lat="51.98714629797122"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:GasProducer" power="10000000.0" id="17aadcf4-c16d-497e-aae3-f0e52042d171" name="GasProducer_17aa">
        <port xsi:type="esdl:OutPort" id="4935c26a-82ec-4ea6-b445-e3061e247b08" connectedTo="e1dbf59a-8ac9-4bc1-bbf9-0c367cbda5bf" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.375948905944825" lat="51.98708040396927" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" power="10000000.0" id="c92eca6d-9afd-470d-b931-4507906ed226" name="GasProducer_c92e">
        <port xsi:type="esdl:OutPort" id="926ddf07-fe71-4112-b306-1afacf1e66cc" connectedTo="22a22cb4-c95a-4a38-a1a4-148b0e1b14fd" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="Out"/>
        <geometry xsi:type="esdl:Point" lon="4.388769865036012" lat="51.98719272686177" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" id="02fe11ce-2dc1-4b7e-9a6c-424ea7fd6424" power="10000000.0" name="GasDemand_02fe">
        <port xsi:type="esdl:InPort" id="d859af60-f9f2-4dce-a12b-ac488c081769" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="00f134de-804f-4ac4-b829-5e44fc433791"/>
        <geometry xsi:type="esdl:Point" lon="4.382278919219972" lat="51.98930698757264" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" id="53824519-06d6-4042-b0f8-8da5ae6b638d" power="10000000.0" name="GasDemand_5382">
        <port xsi:type="esdl:InPort" id="4a4495e9-a65c-4580-ba2a-e75523b6ee30" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="3f7958f8-88e8-47f3-ae8d-b5cd4ce92093"/>
        <geometry xsi:type="esdl:Point" lon="4.382396936416627" lat="51.98794594368575" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" id="6d2c958c-d8c8-4413-9822-163acf84ca15" power="10000000.0" name="GasDemand_6d2c">
        <port xsi:type="esdl:InPort" id="3582f331-ef46-4dda-ac78-c6e75eeee95e" carrier="9d2ad352-0fbd-458a-ae96-9b0307103f8f" name="In" connectedTo="3b1e06ac-9998-4c62-8764-7e582bd478bc"/>
        <geometry xsi:type="esdl:Point" lon="4.382461309432984" lat="51.98484049452794" CRS="WGS84"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="b66ef2e0-2543-43a3-98b4-60f2cad50a9a">
    <carriers xsi:type="esdl:Carriers" id="11edbe28-baa6-44c4-a876-c8f112213a28">
      <carrier xsi:type="esdl:GasCommodity" name="gas" id="9d2ad352-0fbd-458a-ae96-9b0307103f8f" pressure="8.0"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="c7104449-b5eb-49c7-b064-a2a4b16ae6e4">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Power in MW" physicalQuantity="POWER" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" multiplier="MEGA" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
</esdl:EnergySystem>
