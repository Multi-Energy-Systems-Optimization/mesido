<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="b9f8b83d-49e2-4c8b-9992-240ed4643329" description="" esdlVersion="v2211" name="1a" version="6">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="eebe64dd-045f-49d5-9177-1e9a96a030f3">
    <carriers xsi:type="esdl:Carriers" id="823f0f5a-89a9-498e-a6b7-482a08ad95b2">
      <carrier xsi:type="esdl:HeatCommodity" id="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" returnTemperature="45.0" name="Heat_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" id="c362f53a-3eaf-4d96-8ee6-944e77359fed" supplyTemperature="75.0" name="Heat">
        <cost xsi:type="esdl:InfluxDBProfile" field="demand4_MW" measurement="Unittests profiledata" database="energy_profiles" id="30714ab0-98ab-4b50-bc5c-74be3b196552" startDate="2019-01-01T01:00:00.000000+0000" filters="" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-01-03T01:00:00.000000+0000">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" perUnit="WATTHOUR" unit="EURO" id="35d28e97-3058-4855-961e-4348298aa1db" description="Cost in EUR/J"/>
        </cost>
      </carrier>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="c7104449-b5eb-49c7-b064-a2a4b16ae6e4">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="POWER" multiplier="MEGA" unit="WATT" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="ENERGY" multiplier="KILO" unit="WATTHOUR" id="12c481c0-f81e-49b6-9767-90457684d24a" description="Energy in kWh"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="ENERGY" multiplier="MEGA" unit="WATTHOUR" id="93aa23ea-4c5d-4969-97d4-2a4b2720e523" description="Energy in MWh"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="22cf0465-ceef-486a-b8d0-278c131cbece" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="a5845d28-ed01-4f32-91dc-654632ecc997" name="Untitled Area">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_2ab9" id="2ab92324-f86e-4976-9a6e-f7454b77ba3c" state="OPTIONAL" minTemperature="70.0" power="6000000000.0">
        <port xsi:type="esdl:InPort" connectedTo="95f46ccf-bac8-4a44-a854-2bbe2fb3c5e6" id="3f514c6b-fd11-4821-9e6c-4a4d13d46762" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="In">
          <profile xsi:type="esdl:InfluxDBProfile" field="demand1_MW" measurement="Unittests profiledata" database="energy_profiles" id="6ebbcb9b-aafa-4890-bda8-0d3f97ea5d17" startDate="2019-01-01T01:00:00.000000+0000" filters="" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-01-03T01:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="93aa23ea-4c5d-4969-97d4-2a4b2720e523"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="d86d3ed7-77d8-4766-bfa1-ed9209edf0b6" connectedTo="75a9a056-987d-41dc-9ecf-ca3edfef31d8" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.98612564800895" lon="4.38157081604004"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_6662" id="6662aebb-f85e-4df3-9f7e-c58993586fba" state="OPTIONAL" minTemperature="70.0" power="2000000000.0">
        <port xsi:type="esdl:InPort" connectedTo="99e5f517-4fbb-4e1e-89e2-606f1121adeb" id="5f607bc1-31a6-4bc8-8911-aefd4d2cfc4d" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="In">
          <profile xsi:type="esdl:InfluxDBProfile" field="demand3_MW" measurement="Unittests profiledata" database="energy_profiles" id="00f2273a-6e8f-4d92-b61b-8b938367480c" startDate="2019-01-01T01:00:00.000000+0000" filters="" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-01-03T01:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="93aa23ea-4c5d-4969-97d4-2a4b2720e523"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="560eb546-6e19-4fb7-9dce-741ed12310a6" connectedTo="27daf107-0ce8-4870-bb8c-45421a62ed83" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.985484727746204" lon="4.381640553474427" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" name="GenericProducer_8172" maxTemperature="85.0" id="8172d5d3-61a4-4d0b-a26f-5e61c2a22c64" minTemperature="65.0" power="2000000.0">
        <port xsi:type="esdl:OutPort" id="974230fb-e753-4fc1-a762-82de7d960e62" connectedTo="3c182b9c-006d-4ac1-b817-dc884e36c0b0" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="237e32d1-2434-4b23-988b-a0b288f858bb" id="4b5d5d6c-82ef-441b-9e0b-478cf3c8031c" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="In"/>
        <geometry xsi:type="esdl:Point" lat="51.98561687700459" lon="4.379387497901917" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_9580_ret" id="ed9a2b96-2fff-4650-b875-41c6f05a6e44">
        <port xsi:type="esdl:InPort" connectedTo="a4814870-c191-4856-9104-f2206e16b54d" id="adb264b4-2ba0-4a49-9fc7-f57a29fb6346" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="In"/>
        <port xsi:type="esdl:OutPort" id="061f1df2-f724-4b08-aa5f-6f19b06c2f92" connectedTo="a779e3ec-8215-43c9-84ff-baa1c93abfea df318cbd-81f2-467c-a081-7feb4256dbfa 14757d8c-9685-47e2-bf2a-517ee556ab56" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.985749025873034" lon="4.3802350759506234" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_9580" id="95802cf8-61d6-4773-bb99-e275c3bf26cc">
        <port xsi:type="esdl:InPort" connectedTo="388ae7b7-2a05-4b50-acf7-adebf4c24ab4 1f153f2f-adf6-4e3b-94ca-aef1644e8c7d c7ef3ba2-332e-4c8d-bc53-449179a4bc22" id="e3bbc000-98be-43d7-898e-7a503871786f" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="ba6017c5-bedf-411c-9e49-72f0b5053991" connectedTo="1ad8a362-195d-458b-86c2-8c94b3993547" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.98563669935972" lon="4.380224347114564" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.25" name="Pipe_275a" innerDiameter="0.16030000000000003" length="72.13358767664306" id="275a0b40-b6ce-4e7d-b954-efeff0f25734">
        <port xsi:type="esdl:InPort" connectedTo="061f1df2-f724-4b08-aa5f-6f19b06c2f92" id="a779e3ec-8215-43c9-84ff-baa1c93abfea" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="In"/>
        <port xsi:type="esdl:OutPort" id="95f46ccf-bac8-4a44-a854-2bbe2fb3c5e6" connectedTo="3f514c6b-fd11-4821-9e6c-4a4d13d46762" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98579197417133" lon="4.380412101745606"/>
          <point xsi:type="esdl:Point" lat="51.98609261110622" lon="4.381345510482789"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.25" name="Pipe_b5ba" innerDiameter="0.16030000000000003" length="73.56064145043287" id="b5babf87-0530-49b5-914d-008d733ac5bf">
        <port xsi:type="esdl:InPort" connectedTo="061f1df2-f724-4b08-aa5f-6f19b06c2f92" id="14757d8c-9685-47e2-bf2a-517ee556ab56" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="In"/>
        <port xsi:type="esdl:OutPort" id="99e5f517-4fbb-4e1e-89e2-606f1121adeb" connectedTo="5f607bc1-31a6-4bc8-8911-aefd4d2cfc4d" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98563339563447" lon="4.380374550819398"/>
          <point xsi:type="esdl:Point" lat="51.98549794268959" lon="4.381425976753236"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.25" name="Pipe_e6c6" innerDiameter="0.16030000000000003" length="31.412804660774878" id="e6c67c33-ad36-4681-b21e-01b1eabc15c4">
        <port xsi:type="esdl:InPort" connectedTo="974230fb-e753-4fc1-a762-82de7d960e62" id="3c182b9c-006d-4ac1-b817-dc884e36c0b0" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="In"/>
        <port xsi:type="esdl:OutPort" id="a4814870-c191-4856-9104-f2206e16b54d" connectedTo="adb264b4-2ba0-4a49-9fc7-f57a29fb6346" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98563669935972" lon="4.379612803459168"/>
          <point xsi:type="esdl:Point" lat="51.985689558930474" lon="4.38006341457367"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.25" name="Pipe_5871" innerDiameter="0.16030000000000003" length="70.32745329931934" id="5871f6ef-5d92-4a13-8843-6c56c2ac747f">
        <port xsi:type="esdl:InPort" connectedTo="061f1df2-f724-4b08-aa5f-6f19b06c2f92" id="df318cbd-81f2-467c-a081-7feb4256dbfa" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="In"/>
        <port xsi:type="esdl:OutPort" id="c9d98764-3e85-4676-9504-73f7eeb242f5" connectedTo="ee56b88f-a264-4389-ba57-6f2b52a05e1c" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562" name="HDPE"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98571598869247" lon="4.380438923835755"/>
          <point xsi:type="esdl:Point" lat="51.985758937022446" lon="4.381463527679444"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_506c" id="506c41ac-d415-4482-bf10-bf12f17aeac6" minTemperature="70.0" power="2000000000.0">
        <port xsi:type="esdl:InPort" connectedTo="c9d98764-3e85-4676-9504-73f7eeb242f5" id="ee56b88f-a264-4389-ba57-6f2b52a05e1c" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed" name="In">
          <profile xsi:type="esdl:InfluxDBProfile" field="demand2_MW" measurement="Unittests profiledata" database="energy_profiles" id="1b52c372-f877-437d-b2e3-fa9f35ef6093" startDate="2019-01-01T01:00:00.000000+0000" filters="" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-01-03T01:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="93aa23ea-4c5d-4969-97d4-2a4b2720e523"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="a4d4447f-683c-4daf-aafd-f20efc13bd43" connectedTo="e3839971-e5b0-4b3a-9c55-ac2baab8966a" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.98578206302921" lon="4.381629824638368" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.25" name="Pipe_275a_ret" innerDiameter="0.16030000000000003" length="72.13358767664306" id="22771285-490c-42e3-a6be-82c383b5f21e">
        <port xsi:type="esdl:InPort" connectedTo="d86d3ed7-77d8-4766-bfa1-ed9209edf0b6" id="75a9a056-987d-41dc-9ecf-ca3edfef31d8" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="c7ef3ba2-332e-4c8d-bc53-449179a4bc22" connectedTo="e3bbc000-98be-43d7-898e-7a503871786f" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98607261110622" lon="4.381325510482789"/>
          <point xsi:type="esdl:Point" lat="51.98577197417133" lon="4.380392101745606"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.25" name="Pipe_5871_ret" innerDiameter="0.16030000000000003" length="70.32745329931934" id="e68bff9f-422c-4a1b-90b0-80a5bfc1cabf">
        <port xsi:type="esdl:InPort" connectedTo="a4d4447f-683c-4daf-aafd-f20efc13bd43" id="e3839971-e5b0-4b3a-9c55-ac2baab8966a" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="1f153f2f-adf6-4e3b-94ca-aef1644e8c7d" connectedTo="e3bbc000-98be-43d7-898e-7a503871786f" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98573893702245" lon="4.381443527679444"/>
          <point xsi:type="esdl:Point" lat="51.98569598869247" lon="4.380418923835755"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.25" name="Pipe_b5ba_ret" innerDiameter="0.16030000000000003" length="73.56064145043287" id="4605c1d2-62fc-40f3-8451-c6335b8d822a">
        <port xsi:type="esdl:InPort" connectedTo="560eb546-6e19-4fb7-9dce-741ed12310a6" id="27daf107-0ce8-4870-bb8c-45421a62ed83" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="388ae7b7-2a05-4b50-acf7-adebf4c24ab4" connectedTo="e3bbc000-98be-43d7-898e-7a503871786f" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98547794268959" lon="4.381405976753236"/>
          <point xsi:type="esdl:Point" lat="51.98561339563447" lon="4.380354550819398"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.25" name="Pipe_e6c6_ret" innerDiameter="0.16030000000000003" length="31.412804660774878" id="69b66347-386f-48fb-920b-0fa1fe872bf6">
        <port xsi:type="esdl:InPort" connectedTo="ba6017c5-bedf-411c-9e49-72f0b5053991" id="1ad8a362-195d-458b-86c2-8c94b3993547" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="237e32d1-2434-4b23-988b-a0b288f858bb" connectedTo="4b5d5d6c-82ef-441b-9e0b-478cf3c8031c" carrier="c362f53a-3eaf-4d96-8ee6-944e77359fed_ret" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.985669558930475" lon="4.38004341457367"/>
          <point xsi:type="esdl:Point" lat="51.985616699359724" lon="4.379592803459168"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
