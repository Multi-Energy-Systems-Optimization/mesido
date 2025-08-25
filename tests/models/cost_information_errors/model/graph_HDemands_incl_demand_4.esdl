<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="98996ecd-be08-4d89-bd54-4c63c057c3db_with_return_network" description="" esdlVersion="v2401" name="shapefile test with return network" version="2">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="f43f4f64-436f-437a-b693-6f42a6d1669a">
    <carriers xsi:type="esdl:Carriers" id="carrs">
      <carrier xsi:type="esdl:HeatCommodity" id="fe62784e-9752-463f-b6b1-e3077c760627" supplyTemperature="80.0" name="Heatcarrier"/>
      <carrier xsi:type="esdl:HeatCommodity" id="fe62784e-9752-463f-b6b1-e3077c760627_ret" returnTemperature="40.0" name="Heatcarrier_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="6476e616-5a4a-4b33-997c-3a6a36e0d101">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="POWER" description="POWER in MEGAWATT" unit="WATT" id="4c029946-7ca6-404f-9153-4c6d5bf68033"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="POWER" multiplier="MEGA" unit="WATT" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="bee0dc58-0632-47dd-b836-d9cdd001d48b" name="instance">
	  <area xsi:type="esdl:Area" name="area" id="edaf485c-91c5-47b5-a9e9-9991e782fc4c">
      <asset xsi:type="esdl:HeatProducer" name="Producer_2" id="f4fd7ca1-3f10-4bdb-88b3-daf8c456d959" state="OPTIONAL" power="4000000.0">
        <costInformation xsi:type="esdl:CostInformation" id="8be54ab3-7189-4fad-9825-1900b6433ed4">
          <investmentCosts xsi:type="esdl:SingleValue" id="c5d7401d-5eb1-478e-9789-2d5460b79756" value="1000000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perMultiplier="MEGA" physicalQuantity="COST" perUnit="WATT" unit="EURO" id="c5241482-1819-4858-8483-68d2cf5c72ff" description="Cost in EUR/MW"/>
          </investmentCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="d1b1594a-8490-4332-98ab-a5843cd94fb2" value="0.1">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perMultiplier="KILO" physicalQuantity="COST" perUnit="WATTHOUR" unit="EURO" id="7c6459a9-f4cc-4b10-9716-3aa19716c9ba" description="Cost in EUR/kWh"/>
          </variableOperationalCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="d5247295-9c46-4dd5-a0cf-a245a03f15f1" value="1000000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO" id="5b75854e-330b-4a95-adf7-11d1ece8de12" description="Cost in EUR"/>
          </installationCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="d4d3d53c-0ef6-4ebd-b1e6-8c9d49552179" carrier="fe62784e-9752-463f-b6b1-e3077c760627_ret" name="InPort" connectedTo="6f2fe3f8-6901-4679-bee9-fef1b99cbe80"/>
        <port xsi:type="esdl:OutPort" id="9131f55e-1846-4224-b419-43228e32e239" connectedTo="aa383430-4ce1-44af-9347-7e4d786cb13f" carrier="fe62784e-9752-463f-b6b1-e3077c760627" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="52.35463941317419" lon="4.846966974291103"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe18_ret" diameter="DN500" length="762.8770728903005" id="Pipe18_ret" related="Pipe18">
        <port xsi:type="esdl:InPort" id="f3b791c7-b2c1-4c9b-95dd-5ff5b88eb1d7" carrier="fe62784e-9752-463f-b6b1-e3077c760627_ret" name="InPort_ret" connectedTo="b59b99b6-f3cb-42b1-858a-017c7060d545"/>
        <port xsi:type="esdl:OutPort" id="6f2fe3f8-6901-4679-bee9-fef1b99cbe80" connectedTo="d4d3d53c-0ef6-4ebd-b1e6-8c9d49552179" carrier="fe62784e-9752-463f-b6b1-e3077c760627_ret" name="OutPort_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.35156420421955" lon="4.840571812444751" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.35160580421953" lon="4.843421931423054" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.35159410421951" lon="4.843685126086796" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.351590747346414" lon="4.843676853519289" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.35166140421955" lon="4.84368485677969" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.351678504219585" lon="4.845770364579066" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.35178650421966" lon="4.8457642138125" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.35183690421967" lon="4.845778836780664" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.35294590422033" lon="4.845756640973437" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.35295130422036" lon="4.846642343423772" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.35295130422036" lon="4.846642343423772" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.35441560422122" lon="4.846609405642427" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.35472941326419" lon="4.846710120153626" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe18" diameter="DN500" length="762.8770728903005" id="Pipe18" related="Pipe18_ret">
        <port xsi:type="esdl:InPort" id="aa383430-4ce1-44af-9347-7e4d786cb13f" carrier="fe62784e-9752-463f-b6b1-e3077c760627" name="InPort" connectedTo="9131f55e-1846-4224-b419-43228e32e239"/>
        <port xsi:type="esdl:OutPort" id="cc91880f-099c-4bcd-911c-12324fbe9d5d" connectedTo="a8d3b032-a099-4411-aa7d-68470ca78ccd" carrier="fe62784e-9752-463f-b6b1-e3077c760627" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.35463941317419" lon="4.846966974291103"/>
          <point xsi:type="esdl:Point" lat="52.35432560413122" lon="4.846866401183428"/>
          <point xsi:type="esdl:Point" lat="52.352861304130364" lon="4.846900001183393"/>
          <point xsi:type="esdl:Point" lat="52.352861304130364" lon="4.846900001183393"/>
          <point xsi:type="esdl:Point" lat="52.35285590413033" lon="4.846014301182506"/>
          <point xsi:type="esdl:Point" lat="52.35174690412967" lon="4.846037001182475"/>
          <point xsi:type="esdl:Point" lat="52.35169650412966" lon="4.846022401182459"/>
          <point xsi:type="esdl:Point" lat="52.35158850412959" lon="4.846028601182458"/>
          <point xsi:type="esdl:Point" lat="52.35157140412955" lon="4.843943101180373"/>
          <point xsi:type="esdl:Point" lat="52.351500747256416" lon="4.843935130144025"/>
          <point xsi:type="esdl:Point" lat="52.35150410412951" lon="4.843943401180372"/>
          <point xsi:type="esdl:Point" lat="52.351515804129534" lon="4.843680201180112"/>
          <point xsi:type="esdl:Point" lat="52.35147420412955" lon="4.8408301011772625"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="Consumer_19" id="ca8a62f9-8925-457d-8461-aa6aad827302" power="3000000.0">
        <port xsi:type="esdl:InPort" id="a8d3b032-a099-4411-aa7d-68470ca78ccd" carrier="fe62784e-9752-463f-b6b1-e3077c760627" name="InPort" connectedTo="cc91880f-099c-4bcd-911c-12324fbe9d5d">
          <profile xsi:type="esdl:InfluxDBProfile" field="demand1_MW" measurement="WarmingUp default profiles" database="energy_profiles" id="39c0c463-717a-4352-bbe4-830879a93438" startDate="2018-12-31T23:00:00.000000+0000" filters="" host="profiles.warmingup.info" port="443" endDate="2019-01-03T00:00:00.000000+0000">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="b59b99b6-f3cb-42b1-858a-017c7060d545" connectedTo="f3b791c7-b2c1-4c9b-95dd-5ff5b88eb1d7" carrier="fe62784e-9752-463f-b6b1-e3077c760627_ret" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="52.35147420412955" lon="4.8408301011772625"/>
      </asset>
  	</area>
  </instance>
</esdl:EnergySystem>
