<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="3a_with_res_heat_source with return network" description="" id="bd3c1a07-1fda-4dfe-8265-982137a3faa1_with_return_network" esdlVersion="v2507" version="3">
  <instance xsi:type="esdl:Instance" id="3f3fad59-5279-4649-a6eb-82c40254f6bd" name="Untitled instance">
    <area xsi:type="esdl:Area" id="45ac79cf-868f-44a0-8d3b-eb8a74ce9f81" name="Untitled area">
      <asset xsi:type="esdl:HeatProducer" id="4095c98d-d0e0-4e26-b994-19039c280f7b" name="HeatProducer_4095" power="1000000.0">
        <geometry xsi:type="esdl:Point" lat="51.99190838233426" lon="4.352023601531983" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="03ae5f7a-7ef0-4287-add3-710c8ac8457d" name="Out" connectedTo="036dd60e-0d4f-4cff-badd-baaf63aa0de2" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:InPort" id="afb49296-6367-4918-a8e5-74c2674140a4" name="ret_port" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret" connectedTo="97d96865-dfad-454c-8db7-3b7475a40c88"/>
        <constraint xsi:type="esdl:ProfileConstraint" id="0d3e5324-4563-4216-a762-55f9b4e8daf1" name="New Profile Constraint 1" description="" attributeReference="power">
          <maximum xsi:type="esdl:InfluxDBProfile" id="293584f5-28ca-475c-92ab-64c996b57466" measurement="Space Heat default profiles" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" host="https://profiles.warmingup.info" database="energy_profiles" filters="" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </maximum>
        </constraint>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" id="29d4dd00-2766-4241-918b-60021fb802ee" name="ResidualHeatSource_29d4" power="1000000.0">
        <geometry xsi:type="esdl:Point" lat="51.99209831952381" lon="4.352232813835145" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="0b62d971-9240-42dd-a63c-4d55e9c56fca" name="Out" connectedTo="7295263f-1cce-44ab-a900-4aa0492cf63f" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:InPort" id="b34cffe4-f6e2-4f38-90eb-5cf2d716705a" name="ret_port" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret" connectedTo="12f57923-d5c4-4dac-960f-03b8a8cbb7b4"/>
        <constraint xsi:type="esdl:ProfileConstraint" id="54cc7454-0bd2-431e-b93f-f968e820d668" name="Const 3 " description="" attributeReference="power">
          <maximum xsi:type="esdl:InfluxDBProfile" id="ed97c5e0-2878-440b-acae-2e918df4673a" measurement="Space Heat default profiles" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" host="https://profiles.warmingup.info" database="energy_profiles" filters="" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </maximum>
        </constraint>
      </asset>
      <asset xsi:type="esdl:GeothermalSource" id="7f5ff143-476c-450e-921b-2e8156459b97" name="GeothermalSource_7f5f" power="1000000.0">
        <geometry xsi:type="esdl:Point" lat="51.992286604290435" lon="4.352425932884217" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="ac1c7efd-b3b4-4fd5-b9b2-16b86bd425a3" name="Out" connectedTo="f2cbd679-acab-4101-a7b9-fea303c4a083" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:InPort" id="b9a300a8-d8e9-4c4a-83d9-739eb54caa90" name="ret_port" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret" connectedTo="f74cc672-38b6-416e-93b3-289336ef5755"/>
        <constraint xsi:type="esdl:ProfileConstraint" id="186a4721-1f5c-4712-857b-fc1747dd7154" name="New Profile Constraint 3 " description="" attributeReference="power">
          <maximum xsi:type="esdl:InfluxDBProfile" id="c8ca47be-df0b-4709-9e2e-f0da8ff4956b" measurement="Space Heat default profiles" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" host="https://profiles.warmingup.info" database="energy_profiles" filters="" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </maximum>
        </constraint>
      </asset>
      <asset xsi:type="esdl:HeatStorage" id="ff11c897-d2ee-454d-8ad8-c3ff06f8dadf" name="HeatStorage_ff11" capacity="100000000000.0">
        <geometry xsi:type="esdl:Point" lat="51.991331959322075" lon="4.35223549604416" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="c407512e-632c-4bd0-b085-cf82d519de4d" name="In" connectedTo="738ed2e3-f0d0-4581-88e3-6822b4cf0b2b" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="f594b52c-e8be-48e1-a8b1-491540adea87" name="ret_port" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret" connectedTo="ef8d0f38-2030-4048-b077-f7837356cf20"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="682f94e1-14b8-45f6-b093-1cf68d4a79cf" name="HeatingDemand_682f" power="1000000.0">
        <geometry xsi:type="esdl:Point" lat="51.99223870736347" lon="4.354375898838044" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="a57b1c40-ec8d-46ae-a0c0-25c3a33fa3c5" name="In" connectedTo="5a794ee7-fa1b-4acd-bb25-b8fe9eae1e2b" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="5e6d19ba-85ae-4f5e-94dc-bc7e4b5c4cf3" name="ret_port" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret" connectedTo="67d8cb1d-5ad3-444f-a193-79159102abbc"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="b11607a8-3056-4882-b9a6-22f4da408c3e" name="HeatingDemand_b116" power="1000000.0">
        <geometry xsi:type="esdl:Point" lat="51.99177460000412" lon="4.354601204395295" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="84004b22-b904-4097-820c-225f3ae03ef5" name="In" connectedTo="2d7c730c-96a9-4984-ade2-29bee4e292c7" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="b8643442-b5fd-4c86-abb9-0de0ea175703" name="ret_port" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret" connectedTo="06cbdde4-306c-41ed-9dec-ddf15635ba09"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="127fecbd-7cbb-453f-94e8-4dbc2892b831" name="HeatingDemand_127f" power="1000000.0">
        <geometry xsi:type="esdl:Point" lat="51.99134186923596" lon="4.3544912338256845" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="77326703-7bb5-4f04-89da-c5ef0ffde0cf" name="In" connectedTo="981c806e-0613-48ed-af66-378320c04b6b" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="a1bac2fd-c8b6-4e82-9ee3-7acfae96e2ba" name="ret_port" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret" connectedTo="ad20fe48-032c-4d30-93f2-8c08f47f977b"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="0bab09c1-3413-4b36-a412-ff71d87fd4b5" name="Joint_0bab">
        <geometry xsi:type="esdl:Point" lat="51.991786161455856" lon="4.353308379650117" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="e7bf42b1-f847-4865-984d-aa7e6ad51bc9" name="In" connectedTo="88470105-cdd2-4eee-8342-c8755f762838 ffb8782e-6620-4d58-ad36-9511e2c093fa 0e5a9762-0862-4ba2-ad13-936f6da1dbb1" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="19056fd2-11f1-4d8c-b105-a78417fc452f" name="Out" connectedTo="9b039fbb-ff22-4a52-8562-01199e7d8633 97bacfc5-0d5b-44a9-9148-f769739e274d ff521e57-225d-4c3e-9dad-26b725df99c4 97c2535b-eb31-484f-9b6b-2de3d76b5d3b" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe1" name="Pipe1" innerDiameter="0.2101" outerDiameter="0.315" diameter="DN200" length="82.1" related="Pipe1_ret">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="42839b42-0e74-4601-bfdf-278c55b6c5a7">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="ddfaac7c-bfa7-47aa-9f10-7e34d5c6bbca" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="de4807e7-f91c-4b5b-b55f-7014c69739f1"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" name="steel" id="620dc350-9752-4fbc-992e-98791da86035" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" name="PUR" id="09bb8aee-1afe-4023-9cf2-21543a16a4cd" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" name="HDPE" id="d7fee01b-2a27-4594-8ed9-a934dbf46ba0" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.992286604290435" lon="4.352425932884217"/>
          <point xsi:type="esdl:Point" lat="51.991786161455856" lon="4.353308379650117"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f2cbd679-acab-4101-a7b9-fea303c4a083" name="In" connectedTo="ac1c7efd-b3b4-4fd5-b9b2-16b86bd425a3" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="88470105-cdd2-4eee-8342-c8755f762838" name="Out" connectedTo="e7bf42b1-f847-4865-984d-aa7e6ad51bc9" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe2" name="Pipe2" innerDiameter="0.2101" outerDiameter="0.315" diameter="DN200" length="81.4" related="Pipe2_ret">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="4f2b01f5-d3bd-4d11-a408-f1c20791fb50">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="9405793d-4c06-4666-b9a1-23c6b6e13d61" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="c93759b0-bb38-4394-b78c-bd5da691a7ae"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" name="steel" id="c4a9ecc8-3b83-49d3-ba92-769e43a8a8aa" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" name="PUR" id="7b6d6841-ee43-4fc2-bccb-548d359d2faf" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" name="HDPE" id="91fb3201-6697-4807-949c-8045c8fce02b" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.99209831952381" lon="4.352232813835145"/>
          <point xsi:type="esdl:Point" lat="51.991786161455856" lon="4.353308379650117"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="7295263f-1cce-44ab-a900-4aa0492cf63f" name="In" connectedTo="0b62d971-9240-42dd-a63c-4d55e9c56fca" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="ffb8782e-6620-4d58-ad36-9511e2c093fa" name="Out" connectedTo="e7bf42b1-f847-4865-984d-aa7e6ad51bc9" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe3" name="Pipe3" innerDiameter="0.2101" outerDiameter="0.315" diameter="DN200" length="89.0" related="Pipe3_ret">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="806af135-b331-4278-9f13-aef060ccdf27">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ff314ad-c6a1-44a4-b8a7-1eb78f97f5bc" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="a0082dfb-ec9c-44ef-914c-84a0dc9d2eb4"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" name="steel" id="c18e9317-d035-4906-adda-a51b4bbd2d1a" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" name="PUR" id="d576de3e-6c10-44e6-b378-a26e3f514838" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" name="HDPE" id="59adda59-e4c2-4a51-a8e0-0c62a568f62e" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.99190838233426" lon="4.352023601531983"/>
          <point xsi:type="esdl:Point" lat="51.991786161455856" lon="4.353308379650117"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="036dd60e-0d4f-4cff-badd-baaf63aa0de2" name="In" connectedTo="03ae5f7a-7ef0-4287-add3-710c8ac8457d" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="0e5a9762-0862-4ba2-ad13-936f6da1dbb1" name="Out" connectedTo="e7bf42b1-f847-4865-984d-aa7e6ad51bc9" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe4" name="Pipe4" innerDiameter="0.2101" outerDiameter="0.315" diameter="DN200" length="89.1" related="Pipe4_ret">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="b0a8f5c8-7e50-4f3a-a6b6-3afe1a6c2bba">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="43589b0f-d0ce-4c19-821c-71df7ac941b4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="02954cd3-7d12-4213-9f5b-e6f1ec2c9c00"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" name="steel" id="677f113e-ef8f-4eea-8dc0-93d6208af228" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" name="PUR" id="6da20b92-92a6-4285-8f8b-eca61326a453" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" name="HDPE" id="cb09bba7-a04c-4fde-8a7f-38ea24fb8f0d" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.991786161455856" lon="4.353308379650117"/>
          <point xsi:type="esdl:Point" lat="51.991331959322075" lon="4.35223549604416"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9b039fbb-ff22-4a52-8562-01199e7d8633" name="In" connectedTo="19056fd2-11f1-4d8c-b105-a78417fc452f" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="738ed2e3-f0d0-4581-88e3-6822b4cf0b2b" name="Out" connectedTo="c407512e-632c-4bd0-b085-cf82d519de4d" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe5" name="Pipe5" innerDiameter="0.2101" outerDiameter="0.315" diameter="DN200" length="88.7" related="Pipe5_ret">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="fbe57c55-66be-4ccb-8ddb-3ca641552eb2">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="d1de9fe1-cf18-4c4a-be13-d3f6bd2b91ef" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="4ecb1a2a-46ef-4315-a8ea-01e0ee9008e8"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" name="steel" id="f296ad91-84c4-4ee4-8884-070abf2e7fd3" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" name="PUR" id="612addce-3fe7-4077-9aab-3e608dc9eaa2" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" name="HDPE" id="5d952d07-a0ac-408a-942f-4658bbbfb90d" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.991786161455856" lon="4.353308379650117"/>
          <point xsi:type="esdl:Point" lat="51.99223870736347" lon="4.354375898838044"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="97bacfc5-0d5b-44a9-9148-f769739e274d" name="In" connectedTo="19056fd2-11f1-4d8c-b105-a78417fc452f" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="5a794ee7-fa1b-4acd-bb25-b8fe9eae1e2b" name="Out" connectedTo="a57b1c40-ec8d-46ae-a0c0-25c3a33fa3c5" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe6" name="Pipe6" innerDiameter="0.2101" outerDiameter="0.315" diameter="DN200" length="88.5" related="Pipe6_ret">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="122f4cf9-940f-4c23-9cc3-6f3689bde8f4">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="78370941-3c61-4987-9265-ce04e368b3df" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="9be738ad-cf0e-4091-8a8d-43a71d26bfa6"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" name="steel" id="943a7ee7-a4e0-4d97-994d-ea24a4038ea2" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" name="PUR" id="d4926dd3-9b69-40d2-87e7-e6aac5d82304" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" name="HDPE" id="027e4431-00fa-4063-acd6-e4172039bc47" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.991786161455856" lon="4.353308379650117"/>
          <point xsi:type="esdl:Point" lat="51.99177460000412" lon="4.354601204395295"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ff521e57-225d-4c3e-9dad-26b725df99c4" name="In" connectedTo="19056fd2-11f1-4d8c-b105-a78417fc452f" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="2d7c730c-96a9-4984-ade2-29bee4e292c7" name="Out" connectedTo="84004b22-b904-4097-820c-225f3ae03ef5" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe7" name="Pipe7" innerDiameter="0.2101" outerDiameter="0.315" diameter="DN200" length="94.9" related="Pipe7_ret">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="bccf4c8a-48a5-42a1-b1fd-ee0e934787bb">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="c8913536-a899-412f-85c8-9f4ffd90254d" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="87531389-bcb9-4acd-93cd-b05845c2379d"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" name="steel" id="521f51f8-22b2-4210-8e08-c7e3ddae026b" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" name="PUR" id="36ab69e9-6aaf-4f94-ac9b-112773d74a88" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" name="HDPE" id="3e9c6047-2683-404b-b004-f87aa1e089d0" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.991786161455856" lon="4.353308379650117"/>
          <point xsi:type="esdl:Point" lat="51.99134186923596" lon="4.3544912338256845"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="97c2535b-eb31-484f-9b6b-2de3d76b5d3b" name="In" connectedTo="19056fd2-11f1-4d8c-b105-a78417fc452f" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
        <port xsi:type="esdl:OutPort" id="981c806e-0613-48ed-af66-378320c04b6b" name="Out" connectedTo="77326703-7bb5-4f04-89da-c5ef0ffde0cf" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="b80723f1-27a5-49b3-9a68-6f5ee3f9985f" name="Joint_0bab_ret">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="51.991876161545854" lon="4.352486717729013"/>
        <port xsi:type="esdl:OutPort" id="f1f02594-c486-48b1-a641-e863e01b7c37" name="ret_port" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret" connectedTo="f1149f43-911a-42ba-bb00-13b9aae28141 a54c64b0-fc23-4569-ab89-e800a6094b0f 187041d1-4cf0-46a3-9f75-b8bd62cd772d"/>
        <port xsi:type="esdl:InPort" id="4fd68837-6f50-40f2-927b-b3c324e419da" name="ret_port" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret" connectedTo="2cb469ae-ab95-47b1-8b31-4b9b53830d19 183f73d6-c8d2-48d9-ae1f-0c5d00f28a98 280649d2-2cb8-48bd-8bc3-68132a162dc2 9b1a734f-3711-4481-bac6-9e406de32586"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.2101" outerDiameter="0.315" length="82.1" diameter="DN200" id="Pipe1_ret" name="Pipe1_ret" related="Pipe1">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.991876161545854" lon="4.352486717729013"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99237660438043" lon="4.351606885380026"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f1149f43-911a-42ba-bb00-13b9aae28141" name="In_ret" connectedTo="f1f02594-c486-48b1-a641-e863e01b7c37" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
        <port xsi:type="esdl:OutPort" id="f74cc672-38b6-416e-93b3-289336ef5755" name="Out_ret" connectedTo="b9a300a8-d8e9-4c4a-83d9-739eb54caa90" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.2101" outerDiameter="0.315" length="81.4" diameter="DN200" id="Pipe2_ret" name="Pipe2_ret" related="Pipe2">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.991876161545854" lon="4.352486717729013"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99218831961381" lon="4.351412784671066"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a54c64b0-fc23-4569-ab89-e800a6094b0f" name="In_ret" connectedTo="f1f02594-c486-48b1-a641-e863e01b7c37" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
        <port xsi:type="esdl:OutPort" id="12f57923-d5c4-4dac-960f-03b8a8cbb7b4" name="Out_ret" connectedTo="b34cffe4-f6e2-4f38-90eb-5cf2d716705a" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.2101" outerDiameter="0.315" length="89.0" diameter="DN200" id="Pipe3_ret" name="Pipe3_ret" related="Pipe3">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.991876161545854" lon="4.352486717729013"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.991998382424256" lon="4.351202579676189"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="187041d1-4cf0-46a3-9f75-b8bd62cd772d" name="In_ret" connectedTo="f1f02594-c486-48b1-a641-e863e01b7c37" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
        <port xsi:type="esdl:OutPort" id="97d96865-dfad-454c-8db7-3b7475a40c88" name="Out_ret" connectedTo="afb49296-6367-4918-a8e5-74c2674140a4" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.2101" outerDiameter="0.315" length="89.1" diameter="DN200" id="Pipe4_ret" name="Pipe4_ret" related="Pipe4">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99142195941207" lon="4.351411446607462"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.991876161545854" lon="4.352486717729013"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ef8d0f38-2030-4048-b077-f7837356cf20" name="In_ret" connectedTo="f594b52c-e8be-48e1-a8b1-491540adea87" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
        <port xsi:type="esdl:OutPort" id="2cb469ae-ab95-47b1-8b31-4b9b53830d19" name="Out_ret" connectedTo="4fd68837-6f50-40f2-927b-b3c324e419da" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.2101" outerDiameter="0.315" length="88.7" diameter="DN200" id="Pipe5_ret" name="Pipe5_ret" related="Pipe5">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99232870745347" lon="4.353556601839463"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.991876161545854" lon="4.352486717729013"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="67d8cb1d-5ad3-444f-a193-79159102abbc" name="In_ret" connectedTo="5e6d19ba-85ae-4f5e-94dc-bc7e4b5c4cf3" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
        <port xsi:type="esdl:OutPort" id="183f73d6-c8d2-48d9-ae1f-0c5d00f28a98" name="Out_ret" connectedTo="4fd68837-6f50-40f2-927b-b3c324e419da" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.2101" outerDiameter="0.315" length="88.5" diameter="DN200" id="Pipe6_ret" name="Pipe6_ret" related="Pipe6">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99186460009412" lon="4.353779481875075"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.991876161545854" lon="4.352486717729013"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="06cbdde4-306c-41ed-9dec-ddf15635ba09" name="In_ret" connectedTo="b8643442-b5fd-4c86-abb9-0de0ea175703" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
        <port xsi:type="esdl:OutPort" id="280649d2-2cb8-48bd-8bc3-68132a162dc2" name="Out_ret" connectedTo="4fd68837-6f50-40f2-927b-b3c324e419da" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.2101" outerDiameter="0.315" length="94.9" diameter="DN200" id="Pipe7_ret" name="Pipe7_ret" related="Pipe7">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.99143186932596" lon="4.353667236630361"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="51.991876161545854" lon="4.352486717729013"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ad20fe48-032c-4d30-93f2-8c08f47f977b" name="In_ret" connectedTo="a1bac2fd-c8b6-4e82-9ee3-7acfae96e2ba" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
        <port xsi:type="esdl:OutPort" id="9b1a734f-3711-4481-bac6-9e406de32586" name="Out_ret" connectedTo="4fd68837-6f50-40f2-927b-b3c324e419da" carrier="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="ccc533dd-6712-42d4-8750-ffebb0b4f7f8">
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="cf069588-fb25-4774-a711-9e41a974647d">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA" unit="WATT"/>
    </quantityAndUnits>
    <carriers xsi:type="esdl:Carriers" id="563c217c-dfe1-49af-a741-33ff59f08371">
      <carrier xsi:type="esdl:HeatCommodity" name="HeatSupply" id="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6" supplyTemperature="80.0"/>
      <carrier xsi:type="esdl:HeatCommodity" name="HeatReturn" id="c4871b1b-9dab-4371-acd2-8da9aaa2fdd6_ret" returnTemperature="40.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
