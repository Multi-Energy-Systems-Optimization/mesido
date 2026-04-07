<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="Delft_T" id="aa418379-5722-4f3c-838c-b0a97fdf883c_with_return_network" esdlVersion="v2401" description="" version="22">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="9d77d097-2ad4-4028-8b65-a3f136507a07">
    <carriers xsi:type="esdl:Carriers" id="82fb7d85-2f43-484a-8730-0c65ea567781">
      <carrier xsi:type="esdl:HeatCommodity" id="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" name="Supply" supplyTemperature="80.0"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="50.0" name="Supply_ret" id="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="25075c4d-b03e-4395-8e2b-20dc3d31282e">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="POWER" multiplier="MEGA" unit="WATT" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="ENERGY" multiplier="KILO" unit="WATTHOUR" id="12c481c0-f81e-49b6-9767-90457684d24a" description="Energy in kWh"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="b5d2f9ba-899f-4ed3-a1a6-468083080c29" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="ab5cb07c-1842-4bb1-872f-480a19feabb5" name="Untitled Area">
      <asset xsi:type="esdl:HeatingDemand" name="Buitenhof" power="15000000.0" id="a11c72f9-a5e8-4e33-9504-7a44a29b9861">
        <geometry xsi:type="esdl:Point" lon="4.336284399032594" CRS="WGS84" lat="51.99287787937531"/>
        <port xsi:type="esdl:InPort" id="abcec1a4-5a73-460f-bec5-a8a4eaf6e210" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="7e5de7de-014a-42a2-846a-b7f5814043a4">
          <profile xsi:type="esdl:InfluxDBProfile" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" measurement="Space Heat default profiles" id="b874a903-cf1d-430d-84d1-0d37f7f732da" database="energy_profiles" filters="" host="https://profiles.warmingup.info" multiplier="14.0" endDate="2019-12-31T22:00:00.000000+0000" startDate="2018-12-31T23:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="2de34c49-31dd-4583-a4f4-3ea83b486fe0" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="29a9bc48-88e3-4ba1-98e6-7c3beda1ccec"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="Voorhof" power="12500000.0" id="8cf7ab21-57c6-4cbe-bb09-c85dad625d58">
        <geometry xsi:type="esdl:Point" lon="4.360003173351289" CRS="WGS84" lat="51.9963708675561"/>
        <port xsi:type="esdl:InPort" id="f2a3d85d-8ffd-417f-8318-44733cde25ac" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="2ad472b1-9206-4cdb-8868-773a8c17e010">
          <profile xsi:type="esdl:InfluxDBProfile" field="SpaceHeat_and_HotWater_PowerProfile_1900_2000" measurement="Space Heat default profiles" id="c818b979-ec9d-4308-af6d-da31725fdb87" database="energy_profiles" filters="" host="https://profiles.warmingup.info" multiplier="11.0" endDate="2019-12-31T22:00:00.000000+0000" startDate="2018-12-31T23:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="2cdce875-65f6-4ce9-b7dd-c6438b24da2e" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="8312b1b6-b753-4caa-8dfe-9dc834067484"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="Tanthof Oost" power="10000000.0" id="5c8d8519-4f57-475f-977d-103eb34a05f4">
        <geometry xsi:type="esdl:Point" lon="4.359710812568665" lat="51.988831287615405"/>
        <port xsi:type="esdl:InPort" id="e80fdb9d-52ee-4410-8097-0ae5df11f0ef" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="204913ef-b187-4738-8470-e59e7f6a9714">
          <profile xsi:type="esdl:InfluxDBProfile" field="SpaceHeat_and_HotWater_PowerProfile_1900_2000" measurement="Space Heat default profiles" id="de3378f7-4d12-4d9c-911b-db515083e2a4" database="energy_profiles" filters="" host="https://profiles.warmingup.info" multiplier="9.0" endDate="2019-12-31T22:00:00.000000+0000" startDate="2018-12-31T23:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="f0fbe6cf-7439-4a57-9137-c4452e3c7dda" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="e900287d-ee43-41c8-8553-4adf0ba258b7"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="Tanthof West" power="15000000.0" id="9a85a5a3-d9e6-46a5-ad93-b82bae94a610">
        <geometry xsi:type="esdl:Point" lon="4.34485673904419" CRS="WGS84" lat="51.98550455015984"/>
        <port xsi:type="esdl:InPort" id="9de82a78-c855-4870-83e8-eb0b1e14ebfb" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="f9a34d85-09b6-4027-bfa0-460e81c71af6">
          <profile xsi:type="esdl:InfluxDBProfile" field="SpaceHeat_and_HotWater_PowerProfile_1900_2000" measurement="Space Heat default profiles" id="ba1039b5-a536-4eeb-8b67-7c298ce85e47" database="energy_profiles" filters="" host="https://profiles.warmingup.info" multiplier="12.0" endDate="2019-12-31T22:00:00.000000+0000" startDate="2018-12-31T23:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="2554a536-e0fc-47ba-af67-94be7eaeb643" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="e0c29235-31bf-47b7-851f-1c09449aba2b"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="TUDelft" power="10000000.0" id="79d559de-54f2-40b9-af9a-c62f499db523">
        <geometry xsi:type="esdl:Point" lon="4.372908622026444" lat="51.99928395991665"/>
        <port xsi:type="esdl:InPort" id="009d4384-b264-4b8c-9b1b-6526e17b065b" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="94f97ff2-e7d4-4282-a64d-2e096030a85f">
          <profile xsi:type="esdl:InfluxDBProfile" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" measurement="Space Heat default profiles" id="812bdd68-4c7f-4157-ace4-cabeba622024" database="energy_profiles" filters="" host="https://profiles.warmingup.info" endDate="2019-12-31T22:00:00.000000+0000" multiplier="10.0" startDate="2018-12-31T23:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="6a4e4835-ddee-4652-9cfa-2c8d49821d6f" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="3e844e19-0eff-47e7-af3b-d95e29d0c7f8"/>
      </asset>
      <asset xsi:type="esdl:GeothermalSource" name="GeothermalSource_9684" id="9684c4fc-df93-4ead-8c10-b7b84eef895b" power="30000000.0">
        <costInformation xsi:type="esdl:CostInformation" id="1a7f44ed-9928-4018-ae89-93fc26006857">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="cc9a45bd-ad00-46b6-98de-2f49b2bd4ca9" value="2.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO" id="06dcc290-0b6e-4a29-893a-8fea9b6c621c" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="deeec39b-f982-47d7-94d8-506a1369832d" value="1360000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO" id="c27d23a2-65ea-46d8-af4e-23dbb5aa31a1" description="Cost in EUR/MW"/>
          </investmentCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="d972b87e-38aa-41f4-9ab1-f491d318a659" value="91000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO" id="ab1c001c-e780-40df-9ae1-cc861bce471e" description="Cost in EUR/MW"/>
          </fixedMaintenanceCosts>
        </costInformation>
        <geometry xsi:type="esdl:Point" lon="4.369286298751832" CRS="WGS84" lat="51.9993979035546"/>
        <port xsi:type="esdl:OutPort" id="fa77af71-df5c-4ad8-9a1b-c6a68c6d87de" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="2b78d35e-c5f0-4248-9e5b-d2e88bc02985"/>
        <port xsi:type="esdl:InPort" id="8b9b3b28-f224-4642-8b37-f84fcf540c2e" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="c52483a0-d143-4106-a43b-746311baefe2"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" name="WarmteLinQ" id="49c218d4-f760-4ec5-87ac-025edb5b7ade" power="30000000.0">
        <costInformation xsi:type="esdl:CostInformation" id="4e42c17c-099f-4502-97a5-f61a1eb85fff">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="2b0e678f-609e-4c81-840b-570238b136be" value="8.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO" id="49989bd5-6da8-4c63-8335-05999f98cb40" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="27925fa4-a569-47ab-bd3c-96582aced86e" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" unit="EURO" id="f3841943-2eac-4042-a9e1-0cab7c53634b"/>
          </installationCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="274b51a2-dd25-4ecd-827e-1ce54ab7ce6a" value="1500.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" perMultiplier="KILO" physicalQuantity="COST" unit="EURO" id="57e7bc0d-d812-4be8-ad02-d6bee030285c" description="Cost in EUR/kW"/>
          </investmentCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="a2ccb243-24ff-4e8f-b9eb-231061a5dc6c" value="35.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" perMultiplier="KILO" physicalQuantity="COST" unit="EURO" id="cccd7a17-cf1b-42ab-968d-4a08245b7691" description="Cost in EUR/kW"/>
          </fixedOperationalCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="6d342795-0063-4460-802d-249c4603d8d4" value="29000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO" id="a813d44f-0121-4e1d-a4c3-3368f09b57e4" description="Cost in EUR/MW"/>
          </fixedMaintenanceCosts>
        </costInformation>
        <geometry xsi:type="esdl:Point" lon="4.350060224533082" lat="51.99471771893644"/>
        <port xsi:type="esdl:OutPort" id="577714a4-c560-4b64-a70e-09bf12a65b1c" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="479a2393-d053-4a67-bc54-ea7ee755df37"/>
        <port xsi:type="esdl:InPort" id="3bef437b-1f74-4920-be2c-14d60e9d5e79" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="6631bbc0-4696-4426-88af-82a79f8ecbe8"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_0602" id="0602f235-45dc-47f7-9e7b-7ca06a04cbef">
        <geometry xsi:type="esdl:Point" lon="4.350956082344056" CRS="WGS84" lat="51.99483002267327"/>
        <port xsi:type="esdl:InPort" id="52ab4605-e440-4362-8b6a-1da389276935" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="f67a61ad-623d-4280-b28a-936e51978630"/>
        <port xsi:type="esdl:OutPort" id="149aacff-a165-4d36-af77-fbb1c5c93ae4" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="1dcbfe8e-c388-46f4-b247-ad34ecbf7c42 bbf4b6d0-6840-48b2-825c-dd606c2be162"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe1" id="Pipe1" diameter="DN500" length="63.9" outerDiameter="0.8" related="Pipe1_ret">
        <costInformation xsi:type="esdl:CostInformation" id="e133f20c-69af-493a-8284-37f8c6a3de0d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.350041449069978" lat="51.994716067408795"/>
          <point xsi:type="esdl:Point" lon="4.350956082344056" lat="51.99483002267327"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="479a2393-d053-4a67-bc54-ea7ee755df37" name="In" connectedTo="577714a4-c560-4b64-a70e-09bf12a65b1c" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="f67a61ad-623d-4280-b28a-936e51978630" name="Out" connectedTo="52ab4605-e440-4362-8b6a-1da389276935" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe2" id="Pipe2" diameter="DN500" length="1358.7" outerDiameter="0.8" related="Pipe2_ret">
        <costInformation xsi:type="esdl:CostInformation" id="0d01156b-596d-4998-a6c6-e58416fc9213">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.350956082344056" lat="51.99483002267327"/>
          <point xsi:type="esdl:Point" lon="4.350264072418214" lat="51.99644188056501"/>
          <point xsi:type="esdl:Point" lon="4.345843791961671" lat="51.9957020185738"/>
          <point xsi:type="esdl:Point" lon="4.3448781967163095" lat="51.99586716739971"/>
          <point xsi:type="esdl:Point" lon="4.344298839569093" lat="51.994327956723374"/>
          <point xsi:type="esdl:Point" lon="4.340769052505494" lat="51.99383249138507"/>
          <point xsi:type="esdl:Point" lon="4.337282180786134" lat="51.993218106751065"/>
          <point xsi:type="esdl:Point" lon="4.3360376358032235" lat="51.99313883070034"/>
          <point xsi:type="esdl:Point" lon="4.336284399032594" lat="51.99287787937531"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="1dcbfe8e-c388-46f4-b247-ad34ecbf7c42" name="In" connectedTo="149aacff-a165-4d36-af77-fbb1c5c93ae4" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="7e5de7de-014a-42a2-846a-b7f5814043a4" name="Out" connectedTo="abcec1a4-5a73-460f-bec5-a8a4eaf6e210" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe3" id="Pipe3" diameter="DN500" length="393.93" outerDiameter="0.8" related="Pipe3_ret">
        <costInformation xsi:type="esdl:CostInformation" id="526493c7-72b6-40fc-a63c-acb830ceb630">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.350956082344056" lat="51.99483002267327"/>
          <point xsi:type="esdl:Point" lon="4.351299405097962" lat="51.99418096924502"/>
          <point xsi:type="esdl:Point" lon="4.351382553577424" lat="51.99410169489909"/>
          <point xsi:type="esdl:Point" lon="4.351578354835511" lat="51.99395800978932"/>
          <point xsi:type="esdl:Point" lon="4.354295432567597" lat="51.994435306824016"/>
          <point xsi:type="esdl:Point" lon="4.3554139137268075" lat="51.99453935359899"/>
          <point xsi:type="esdl:Point" lon="4.355617761611939" lat="51.99460541491795"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="bbf4b6d0-6840-48b2-825c-dd606c2be162" name="In" connectedTo="149aacff-a165-4d36-af77-fbb1c5c93ae4" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="0dd107f2-c1fd-4288-baeb-2f3c8271d781" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="6c855627-c430-48d7-a6c5-fd9743525713"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe4" id="Pipe4" diameter="DN500" length="484.9" outerDiameter="0.8" related="Pipe4_ret">
        <costInformation xsi:type="esdl:CostInformation" id="526493c7-72b6-40fc-a63c-acb830ceb630">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.355617761611939" lat="51.99460541491795"/>
          <point xsi:type="esdl:Point" lon="4.358192682266236" lat="51.99520656844105"/>
          <point xsi:type="esdl:Point" lon="4.357559680938722" lat="51.996230492672275"/>
          <point xsi:type="esdl:Point" lon="4.3584609031677255" lat="51.99638242782106"/>
          <point xsi:type="esdl:Point" lon="4.359673261642457" lat="51.99625031032962"/>
          <point xsi:type="esdl:Point" lon="4.360003173351289" lat="51.9963708675561"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="964df08b-9382-4fdf-8702-20f76758b8df" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="49117fc6-1ec2-4a7c-b432-78fabbe33029"/>
        <port xsi:type="esdl:OutPort" id="2ad472b1-9206-4cdb-8868-773a8c17e010" name="Out" connectedTo="f2a3d85d-8ffd-417f-8318-44733cde25ac" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_6a29" id="6a29891f-6712-4675-af74-72a2da1ae999">
        <geometry xsi:type="esdl:Point" lon="4.355617761611939" lat="51.99460541491795"/>
        <port xsi:type="esdl:InPort" id="6c855627-c430-48d7-a6c5-fd9743525713" name="In" connectedTo="0dd107f2-c1fd-4288-baeb-2f3c8271d781 394b3c40-76dc-4674-b0ca-56d7be0b4f91" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="49117fc6-1ec2-4a7c-b432-78fabbe33029" name="Out" connectedTo="964df08b-9382-4fdf-8702-20f76758b8df 52d841d7-c0d3-45bf-adb9-e26d81b0f49d" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe5" id="Pipe5" diameter="DN500" length="223.2" outerDiameter="0.8" related="Pipe5_ret">
        <costInformation xsi:type="esdl:CostInformation" id="439a7891-9620-4d6f-9634-9a68cbdf226c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.355617761611939" lat="51.99460541491795"/>
          <point xsi:type="esdl:Point" lon="4.356776475906373" lat="51.99272923553559"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="52d841d7-c0d3-45bf-adb9-e26d81b0f49d" name="In" connectedTo="49117fc6-1ec2-4a7c-b432-78fabbe33029" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="b53856b1-ed70-4798-b319-6d19285faf0b" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="b70e4357-f83c-411c-9398-5788de26844b"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_dff9" id="dff991c2-f10a-4f0b-a96c-eac64ffc9fa5">
        <geometry xsi:type="esdl:Point" lon="4.356776475906373" lat="51.99272923553559"/>
        <port xsi:type="esdl:InPort" id="b70e4357-f83c-411c-9398-5788de26844b" name="In" connectedTo="b53856b1-ed70-4798-b319-6d19285faf0b" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="722edfd1-7ad4-473c-aba3-134b5b59a729" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="a3e6d19a-77fb-4de9-82c4-8f699fb96e65 edd0ab42-3adc-4d41-9c7e-f40f9ae1c079"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe6" id="Pipe6" diameter="DN500" length="1690.3" outerDiameter="0.8" related="Pipe6_ret">
        <costInformation xsi:type="esdl:CostInformation" id="f5f69d21-ea71-4559-b777-4bd90df73f82">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.356776475906373" lat="51.99272923553559"/>
          <point xsi:type="esdl:Point" lon="4.355274438858033" lat="51.992372488306984"/>
          <point xsi:type="esdl:Point" lon="4.352710247039796" lat="51.99189682091413"/>
          <point xsi:type="esdl:Point" lon="4.352324008941651" lat="51.992412127028295"/>
          <point xsi:type="esdl:Point" lon="4.349373579025269" lat="51.99191003396547"/>
          <point xsi:type="esdl:Point" lon="4.349910020828248" lat="51.99094547096928"/>
          <point xsi:type="esdl:Point" lon="4.346058368682862" lat="51.990251765558796"/>
          <point xsi:type="esdl:Point" lon="4.34612274169922" lat="51.99004695524001"/>
          <point xsi:type="esdl:Point" lon="4.345049858093263" lat="51.989921425871884"/>
          <point xsi:type="esdl:Point" lon="4.3442773818969735" lat="51.99002052803386"/>
          <point xsi:type="esdl:Point" lon="4.344288110733033" lat="51.98775433709859"/>
          <point xsi:type="esdl:Point" lon="4.344545602798463" lat="51.987106832910484"/>
          <point xsi:type="esdl:Point" lon="4.344073534011842" lat="51.98591751511481"/>
          <point xsi:type="esdl:Point" lon="4.343891143798829" lat="51.985435171673814"/>
          <point xsi:type="esdl:Point" lon="4.34485673904419" lat="51.98550455015984"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="edd0ab42-3adc-4d41-9c7e-f40f9ae1c079" name="In" connectedTo="722edfd1-7ad4-473c-aba3-134b5b59a729" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="f9a34d85-09b6-4027-bfa0-460e81c71af6" name="Out" connectedTo="9de82a78-c855-4870-83e8-eb0b1e14ebfb" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe7" id="Pipe7" diameter="DN500" length="403.93" outerDiameter="0.8" related="Pipe7_ret">
        <costInformation xsi:type="esdl:CostInformation" id="439a7891-9620-4d6f-9634-9a68cbdf226c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.356776475906373" lat="51.99272923553559"/>
          <point xsi:type="esdl:Point" lon="4.356948137283326" lat="51.992412127028295"/>
          <point xsi:type="esdl:Point" lon="4.358053207397462" lat="51.99057549608771"/>
          <point xsi:type="esdl:Point" lon="4.358868598937989" lat="51.989333415199866"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="a3e6d19a-77fb-4de9-82c4-8f699fb96e65" name="In" connectedTo="722edfd1-7ad4-473c-aba3-134b5b59a729" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="3f4cfc75-908d-4cbd-a268-3e455ccbfc2a" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="c37bb2ed-d06d-454b-863e-a899b063f965"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe8" id="Pipe8" diameter="DN500" length="104.18" outerDiameter="0.8" related="Pipe8_ret">
        <costInformation xsi:type="esdl:CostInformation" id="439a7891-9620-4d6f-9634-9a68cbdf226c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.358868598937989" lat="51.989333415199866"/>
          <point xsi:type="esdl:Point" lon="4.359276294708253" lat="51.988732182821614"/>
          <point xsi:type="esdl:Point" lon="4.359710812568665" lat="51.988831287615405"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="c525a3e2-b021-484d-9e45-062e371b4d03" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="7c3ee187-3368-4672-bf37-f890454abf1b"/>
        <port xsi:type="esdl:OutPort" id="204913ef-b187-4738-8470-e59e7f6a9714" name="Out" connectedTo="e80fdb9d-52ee-4410-8097-0ae5df11f0ef" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_35aa" id="35aaffb9-9664-49ca-ac6e-230e4c5a2ef7">
        <geometry xsi:type="esdl:Point" lon="4.358868598937989" lat="51.989333415199866"/>
        <port xsi:type="esdl:InPort" id="c37bb2ed-d06d-454b-863e-a899b063f965" name="In" connectedTo="3f4cfc75-908d-4cbd-a268-3e455ccbfc2a fd13043b-7aa5-42ee-9804-fde0d8380177" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="7c3ee187-3368-4672-bf37-f890454abf1b" name="Out" connectedTo="c525a3e2-b021-484d-9e45-062e371b4d03" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe9" id="Pipe9" diameter="DN500" length="53.2" outerDiameter="0.8" related="Pipe9_ret">
        <costInformation xsi:type="esdl:CostInformation" id="2b31fbcd-64ee-421c-b50e-ef95d8369821">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.369286298751832" lat="51.9993979035546"/>
          <point xsi:type="esdl:Point" lon="4.368723873049022" lat="51.99907826201701"/>
          <point xsi:type="esdl:Point" lon="4.368713647127152" lat="51.999074804467746"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="2b78d35e-c5f0-4248-9e5b-d2e88bc02985" name="In" connectedTo="fa77af71-df5c-4ad8-9a1b-c6a68c6d87de" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="5229a3e7-7b3d-483e-8860-b81d703356dc" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="2ff91621-5f74-4bf1-baf2-e843907ee452"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe10" id="Pipe10" diameter="DN500" length="1823.8" outerDiameter="0.8" related="Pipe10_ret">
        <costInformation xsi:type="esdl:CostInformation" id="c5831ec2-2c74-4575-87dd-0a354428f5dd">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.368705768138171" lat="51.999075217309446"/>
          <point xsi:type="esdl:Point" lon="4.36734437942505" lat="52.00129031634894"/>
          <point xsi:type="esdl:Point" lon="4.366765022277833" lat="52.00195082553958"/>
          <point xsi:type="esdl:Point" lon="4.36607837677002" lat="52.00175267380578"/>
          <point xsi:type="esdl:Point" lon="4.365262985229493" lat="52.00193761545127"/>
          <point xsi:type="esdl:Point" lon="4.363117218017579" lat="52.00136957796644"/>
          <point xsi:type="esdl:Point" lon="4.359748363494874" lat="52.000735481096655"/>
          <point xsi:type="esdl:Point" lon="4.359726905822755" lat="52.0004712714165"/>
          <point xsi:type="esdl:Point" lon="4.35884714126587" lat="52.000418429293354"/>
          <point xsi:type="esdl:Point" lon="4.354877471923829" lat="51.99948047122696"/>
          <point xsi:type="esdl:Point" lon="4.354426860809327" lat="51.99937478457907"/>
          <point xsi:type="esdl:Point" lon="4.354963302612306" lat="51.99734026797414"/>
          <point xsi:type="esdl:Point" lon="4.354534149169923" lat="51.99645509227514"/>
          <point xsi:type="esdl:Point" lon="4.355617761611939" lat="51.99460541491795"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="303f510d-a86d-4fb5-9746-5a7253780512" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="0def0a64-c010-4ef8-9834-b152e7e85884"/>
        <port xsi:type="esdl:OutPort" id="394b3c40-76dc-4674-b0ca-56d7be0b4f91" name="Out" connectedTo="6c855627-c430-48d7-a6c5-fd9743525713" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe11" id="Pipe11" diameter="DN500" length="102.7" outerDiameter="0.8" related="Pipe11_ret">
        <costInformation xsi:type="esdl:CostInformation" id="2b31fbcd-64ee-421c-b50e-ef95d8369821">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.368712976574899" lat="51.99907010839291"/>
          <point xsi:type="esdl:Point" lon="4.369195103645326" lat="51.998195700993726"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="1343b0ed-fafc-4677-9e5f-e38b13a73017" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="0def0a64-c010-4ef8-9834-b152e7e85884"/>
        <port xsi:type="esdl:OutPort" id="978d0d30-b56b-4b2b-85d1-187585acc6c0" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="8cc49167-e8ac-4063-ace2-7715b7e4c7e9"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe12" id="Pipe12" diameter="DN500" length="1695.06" outerDiameter="0.8" related="Pipe12_ret">
        <costInformation xsi:type="esdl:CostInformation" id="2b31fbcd-64ee-421c-b50e-ef95d8369821">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.369195103645326" lat="51.998195700993726"/>
          <point xsi:type="esdl:Point" lon="4.369930028915406" lat="51.99689107652307"/>
          <point xsi:type="esdl:Point" lon="4.370251893997193" lat="51.9963626102222"/>
          <point xsi:type="esdl:Point" lon="4.372708797454835" lat="51.99252443654816"/>
          <point xsi:type="esdl:Point" lon="4.369876384735108" lat="51.991962886131965"/>
          <point xsi:type="esdl:Point" lon="4.36783790588379" lat="51.991665591884065"/>
          <point xsi:type="esdl:Point" lon="4.3664753437042245" lat="51.99131544279403"/>
          <point xsi:type="esdl:Point" lon="4.364136457443238" lat="51.99050942882292"/>
          <point xsi:type="esdl:Point" lon="4.359169006347657" lat="51.9895514425295"/>
          <point xsi:type="esdl:Point" lon="4.358868598937989" lat="51.989333415199866"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="8d148f66-5ee2-4b70-9d2c-e6038be94ada" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="c264080b-5f9b-4bad-bd85-9f963dae742b"/>
        <port xsi:type="esdl:OutPort" id="fd13043b-7aa5-42ee-9804-fde0d8380177" name="Out" connectedTo="c37bb2ed-d06d-454b-863e-a899b063f965" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_b463" id="b4633ecb-cda5-4343-9d51-af350a9c331b">
        <geometry xsi:type="esdl:Point" lon="4.369195103645326" lat="51.998195700993726"/>
        <port xsi:type="esdl:InPort" id="8cc49167-e8ac-4063-ace2-7715b7e4c7e9" name="In" connectedTo="978d0d30-b56b-4b2b-85d1-187585acc6c0" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="c264080b-5f9b-4bad-bd85-9f963dae742b" name="Out" connectedTo="8d148f66-5ee2-4b70-9d2c-e6038be94ada dae970c0-5471-4ff2-8da5-802856320750" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" innerDiameter="0.4954" name="Pipe13" id="Pipe13" diameter="DN500" length="285.9" outerDiameter="0.8" related="Pipe13_ret">
        <costInformation xsi:type="esdl:CostInformation" id="5ab69aac-efed-4ade-8dd3-96720cd2a96f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="4112.5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.369195103645326" lat="51.998195700993726"/>
          <point xsi:type="esdl:Point" lon="4.372783899307252" lat="51.99913038325009"/>
          <point xsi:type="esdl:Point" lon="4.372908622026444" lat="51.99928395991665"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="dae970c0-5471-4ff2-8da5-802856320750" name="In" connectedTo="c264080b-5f9b-4bad-bd85-9f963dae742b" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="94f97ff2-e7d4-4282-a64d-2e096030a85f" name="Out" connectedTo="009d4384-b264-4b8c-9b1b-6526e17b065b" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" id="0cd8175f-14b0-4f30-a18f-937a32c41297" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1381">
            <matter xsi:type="esdl:Material" id="21e5d784-94ab-44f0-a05e-74991b1afe1d" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0079">
            <matter xsi:type="esdl:Material" id="a05c66fe-c101-4b70-afc6-411c72ef58f1" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_c2e0" id="c2e017f0-3abb-40c5-8407-cfbe0ec2c947">
        <geometry xsi:type="esdl:Point" lon="4.368709498085082" CRS="WGS84" lat="51.99907274025906"/>
        <port xsi:type="esdl:InPort" id="2ff91621-5f74-4bf1-baf2-e843907ee452" name="In" connectedTo="5229a3e7-7b3d-483e-8860-b81d703356dc" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="0def0a64-c010-4ef8-9834-b152e7e85884" name="Out" connectedTo="303f510d-a86d-4fb5-9746-5a7253780512 1343b0ed-fafc-4677-9e5f-e38b13a73017" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_0602_ret" id="bcf07b56-c3ee-42a6-9c42-9845f5bf0d33">
        <geometry xsi:type="esdl:Point" lon="4.350150066040208" CRS="WGS84" lat="51.99492002276327"/>
        <port xsi:type="esdl:OutPort" id="e74f13f2-c63e-4717-b237-6499c9488eac" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="0091722b-9afb-4475-b559-380e270cca80"/>
        <port xsi:type="esdl:InPort" id="8411ac81-9c78-4d11-8a69-f95c26f71033" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="d7de09b1-6d03-4d7e-87da-1896af9f05ad 51c50f83-1e9f-4db1-b8d4-7db3d01807e6"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_6a29_ret" id="8b6a23bf-e9c8-48e2-9984-6184ea7eaae4">
        <geometry xsi:type="esdl:Point" lon="4.3548106114555685" CRS="WGS84" lat="51.994695415007946"/>
        <port xsi:type="esdl:InPort" id="e6a7a2e5-acb6-4084-b3ec-f0df5bbab853" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="f2d10d3d-0064-4cb8-bd02-ae507bd5f3df 8a29b3c1-cd96-43e0-b918-22551a2d139d"/>
        <port xsi:type="esdl:OutPort" id="588fd953-2a7d-4549-a89c-80b27e24ab2c" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="d8daa8a8-f473-4a23-8732-a8ff6379cd67 545640d8-bd2d-4532-8e23-a1900c53321e"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_dff9_ret" id="9569e5ad-87e3-4393-82b2-0dd82f2ac12c">
        <geometry xsi:type="esdl:Point" lon="4.355959726802834" CRS="WGS84" lat="51.99281923562559"/>
        <port xsi:type="esdl:InPort" id="c97aaf10-6edc-4518-9339-d8ca7cc0d795" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="95aaf0a1-5641-48ad-bc84-23e0e189c8bf 53bf9474-b529-4831-bee0-5bdfa44c8635"/>
        <port xsi:type="esdl:OutPort" id="525a8a13-4931-4d8d-bb60-adb555b02401" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="ab88819c-46a1-423b-8db8-6b3019fe592f"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_35aa_ret" id="1ff5e86e-3d8f-4ca5-96d6-039ee51938d8">
        <geometry xsi:type="esdl:Point" lon="4.358033875102766" CRS="WGS84" lat="51.98942341528986"/>
        <port xsi:type="esdl:InPort" id="f786a7bf-f26b-4a30-9e21-3fec05412c64" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="309cd564-3412-4022-a6d0-ae705f25be6f"/>
        <port xsi:type="esdl:OutPort" id="ba357584-609f-4cf2-aedd-0fac5c8ceade" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="1a0c09e4-00da-40fd-a96f-6def4dc207d9 15cec74a-ff3d-4349-99c1-b63e54984020"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_b463_ret" id="6c7199eb-9b16-462c-b713-d06d9d9af554">
        <geometry xsi:type="esdl:Point" lon="4.368405699422867" CRS="WGS84" lat="51.998285701083724"/>
        <port xsi:type="esdl:InPort" id="9499403a-8dcf-4c77-944d-a56829b8ff7e" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="a2336831-a837-4c16-8b13-5ccaf7ad4b28 b60cdb49-a624-4274-8daf-c769bc46d984"/>
        <port xsi:type="esdl:OutPort" id="b57116bc-1f78-402c-84c0-fc6e5846cf8a" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="03f16a92-b24d-4e11-b730-83b703517cad"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_c2e0_ret" id="6f4114b7-8755-464f-9de3-e215e1e08ae6">
        <geometry xsi:type="esdl:Point" lon="4.367924309381006" CRS="WGS84" lat="51.99916274034906"/>
        <port xsi:type="esdl:InPort" id="81a1bb4a-1701-4491-86d4-2c2f0b858aa2" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="2db65ceb-047b-4385-9648-6c9ddc684681 1207cf4b-308c-4466-b1c8-9e997e988fff"/>
        <port xsi:type="esdl:OutPort" id="c0bdb043-c1ec-455f-92f2-eabbbcb8580a" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="3c52ca3a-e59e-4fff-a451-fc110907d9aa"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe1_ret" diameter="DN500" length="63.9" innerDiameter="0.4954" state="OPTIONAL" name="Pipe1_ret" outerDiameter="0.8" related="Pipe1">
        <port xsi:type="esdl:InPort" id="0091722b-9afb-4475-b559-380e270cca80" name="In_ret" connectedTo="e74f13f2-c63e-4717-b237-6499c9488eac" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="6631bbc0-4696-4426-88af-82a79f8ecbe8" name="Out_ret" connectedTo="3bef437b-1f74-4920-be2c-14d60e9d5e79" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.350150066040208" CRS="WGS84" lat="51.99492002276327"/>
          <point xsi:type="esdl:Point" lon="4.349234857906909" CRS="WGS84" lat="51.99480606749879"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe2_ret" diameter="DN500" length="1358.7" innerDiameter="0.4954" state="OPTIONAL" name="Pipe2_ret" outerDiameter="0.8" related="Pipe2">
        <port xsi:type="esdl:InPort" id="29a9bc48-88e3-4ba1-98e6-7c3beda1ccec" name="In_ret" connectedTo="2de34c49-31dd-4583-a4f4-3ea83b486fe0" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="d7de09b1-6d03-4d7e-87da-1896af9f05ad" name="Out_ret" connectedTo="8411ac81-9c78-4d11-8a69-f95c26f71033" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.335468418848538" CRS="WGS84" lat="51.992967879465304"/>
          <point xsi:type="esdl:Point" lon="4.335223001954349" CRS="WGS84" lat="51.993228830790336"/>
          <point xsi:type="esdl:Point" lon="4.336467955058524" CRS="WGS84" lat="51.99330810684106"/>
          <point xsi:type="esdl:Point" lon="4.339957975709468" CRS="WGS84" lat="51.99392249147507"/>
          <point xsi:type="esdl:Point" lon="4.343490284295128" CRS="WGS84" lat="51.99441795681337"/>
          <point xsi:type="esdl:Point" lon="4.344077374497806" CRS="WGS84" lat="51.995957167489706"/>
          <point xsi:type="esdl:Point" lon="4.3450421472109175" CRS="WGS84" lat="51.9957920186638"/>
          <point xsi:type="esdl:Point" lon="4.349466099308366" CRS="WGS84" lat="51.996531880655006"/>
          <point xsi:type="esdl:Point" lon="4.350150066040208" CRS="WGS84" lat="51.99492002276327"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe3_ret" diameter="DN500" length="393.93" innerDiameter="0.4954" state="OPTIONAL" name="Pipe3_ret" outerDiameter="0.8" related="Pipe3">
        <port xsi:type="esdl:InPort" id="d8daa8a8-f473-4a23-8732-a8ff6379cd67" name="In_ret" connectedTo="588fd953-2a7d-4549-a89c-80b27e24ab2c" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="51c50f83-1e9f-4db1-b8d4-7db3d01807e6" name="Out_ret" connectedTo="8411ac81-9c78-4d11-8a69-f95c26f71033" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3548106114555685" CRS="WGS84" lat="51.994695415007946"/>
          <point xsi:type="esdl:Point" lon="4.3546064294682" CRS="WGS84" lat="51.994629353688985"/>
          <point xsi:type="esdl:Point" lon="4.353487421528576" CRS="WGS84" lat="51.994525306914014"/>
          <point xsi:type="esdl:Point" lon="4.350767918332793" CRS="WGS84" lat="51.994048009879315"/>
          <point xsi:type="esdl:Point" lon="4.350572848784311" CRS="WGS84" lat="51.99419169498909"/>
          <point xsi:type="esdl:Point" lon="4.35049010343325" CRS="WGS84" lat="51.99427096933502"/>
          <point xsi:type="esdl:Point" lon="4.350150066040208" CRS="WGS84" lat="51.99492002276327"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe4_ret" diameter="DN500" length="484.9" innerDiameter="0.4954" state="OPTIONAL" name="Pipe4_ret" outerDiameter="0.8" related="Pipe4">
        <port xsi:type="esdl:InPort" id="8312b1b6-b753-4caa-8dfe-9dc834067484" name="In_ret" connectedTo="2cdce875-65f6-4ce9-b7dd-c6438b24da2e" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="f2d10d3d-0064-4cb8-bd02-ae507bd5f3df" name="Out_ret" connectedTo="e6a7a2e5-acb6-4084-b3ec-f0df5bbab853" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.359204849310848" CRS="WGS84" lat="51.9964608676461"/>
          <point xsi:type="esdl:Point" lon="4.358874341118289" CRS="WGS84" lat="51.99634031041962"/>
          <point xsi:type="esdl:Point" lon="4.357662636276866" CRS="WGS84" lat="51.99647242791106"/>
          <point xsi:type="esdl:Point" lon="4.356760662275853" CRS="WGS84" lat="51.99632049276227"/>
          <point xsi:type="esdl:Point" lon="4.357388559599185" CRS="WGS84" lat="51.995296568531046"/>
          <point xsi:type="esdl:Point" lon="4.3548106114555685" CRS="WGS84" lat="51.994695415007946"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe5_ret" diameter="DN500" length="223.2" innerDiameter="0.4954" state="OPTIONAL" name="Pipe5_ret" outerDiameter="0.8" related="Pipe5">
        <port xsi:type="esdl:InPort" id="ab88819c-46a1-423b-8db8-6b3019fe592f" name="In_ret" connectedTo="525a8a13-4931-4d8d-bb60-adb555b02401" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="8a29b3c1-cd96-43e0-b918-22551a2d139d" name="Out_ret" connectedTo="e6a7a2e5-acb6-4084-b3ec-f0df5bbab853" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.355959726802834" CRS="WGS84" lat="51.99281923562559"/>
          <point xsi:type="esdl:Point" lon="4.3548106114555685" CRS="WGS84" lat="51.994695415007946"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe6_ret" diameter="DN500" length="1690.3" innerDiameter="0.4954" state="OPTIONAL" name="Pipe6_ret" outerDiameter="0.8" related="Pipe6">
        <port xsi:type="esdl:InPort" id="e0c29235-31bf-47b7-851f-1c09449aba2b" name="In_ret" connectedTo="2554a536-e0fc-47ba-af67-94be7eaeb643" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="95aaf0a1-5641-48ad-bc84-23e0e189c8bf" name="Out_ret" connectedTo="c97aaf10-6edc-4518-9339-d8ca7cc0d795" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3440007630795785" CRS="WGS84" lat="51.985594550249836"/>
          <point xsi:type="esdl:Point" lon="4.343034772645288" CRS="WGS84" lat="51.98552517176381"/>
          <point xsi:type="esdl:Point" lon="4.343219902738562" CRS="WGS84" lat="51.986007515204804"/>
          <point xsi:type="esdl:Point" lon="4.343698652108816" CRS="WGS84" lat="51.98719683300048"/>
          <point xsi:type="esdl:Point" lon="4.343444752901676" CRS="WGS84" lat="51.98784433718859"/>
          <point xsi:type="esdl:Point" lon="4.343446359422575" CRS="WGS84" lat="51.99011052812386"/>
          <point xsi:type="esdl:Point" lon="4.34421830382353" CRS="WGS84" lat="51.99001142596188"/>
          <point xsi:type="esdl:Point" lon="4.345291860920478" CRS="WGS84" lat="51.99013695533001"/>
          <point xsi:type="esdl:Point" lon="4.345228584386799" CRS="WGS84" lat="51.99034176564879"/>
          <point xsi:type="esdl:Point" lon="4.349083928725807" CRS="WGS84" lat="51.99103547105928"/>
          <point xsi:type="esdl:Point" lon="4.348552565812081" CRS="WGS84" lat="51.992000034055465"/>
          <point xsi:type="esdl:Point" lon="4.351505614554315" CRS="WGS84" lat="51.99250212711829"/>
          <point xsi:type="esdl:Point" lon="4.35188916468059" CRS="WGS84" lat="51.991986821004126"/>
          <point xsi:type="esdl:Point" lon="4.354455838337416" CRS="WGS84" lat="51.99246248839698"/>
          <point xsi:type="esdl:Point" lon="4.355959726802834" CRS="WGS84" lat="51.99281923562559"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe7_ret" diameter="DN500" length="403.93" innerDiameter="0.4954" state="OPTIONAL" name="Pipe7_ret" outerDiameter="0.8" related="Pipe7">
        <port xsi:type="esdl:InPort" id="1a0c09e4-00da-40fd-a96f-6def4dc207d9" name="In_ret" connectedTo="ba357584-609f-4cf2-aedd-0fac5c8ceade" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="53bf9474-b529-4831-bee0-5bdfa44c8635" name="Out_ret" connectedTo="c97aaf10-6edc-4518-9339-d8ca7cc0d795" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.358033875102766" CRS="WGS84" lat="51.98942341528986"/>
          <point xsi:type="esdl:Point" lon="4.357225150280455" CRS="WGS84" lat="51.990665496177705"/>
          <point xsi:type="esdl:Point" lon="4.35612974289599" CRS="WGS84" lat="51.99250212711829"/>
          <point xsi:type="esdl:Point" lon="4.355959726802834" CRS="WGS84" lat="51.99281923562559"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe8_ret" diameter="DN500" length="104.18" innerDiameter="0.4954" state="OPTIONAL" name="Pipe8_ret" outerDiameter="0.8" related="Pipe8">
        <port xsi:type="esdl:InPort" id="e900287d-ee43-41c8-8553-4adf0ba258b7" name="In_ret" connectedTo="f0fbe6cf-7439-4a57-9137-c4452e3c7dda" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="309cd564-3412-4022-a6d0-ae705f25be6f" name="Out_ret" connectedTo="f786a7bf-f26b-4a30-9e21-3fec05412c64" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3588733626863565" CRS="WGS84" lat="51.9889212877054"/>
          <point xsi:type="esdl:Point" lon="4.358438304656425" CRS="WGS84" lat="51.98882218291161"/>
          <point xsi:type="esdl:Point" lon="4.358033875102766" CRS="WGS84" lat="51.98942341528986"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe9_ret" diameter="DN500" length="53.2" innerDiameter="0.4954" state="OPTIONAL" name="Pipe9_ret" outerDiameter="0.8" related="Pipe9">
        <port xsi:type="esdl:InPort" id="3c52ca3a-e59e-4fff-a451-fc110907d9aa" name="In_ret" connectedTo="c0bdb043-c1ec-455f-92f2-eabbbcb8580a" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="c52483a0-d143-4106-a43b-746311baefe2" name="Out_ret" connectedTo="8b9b3b28-f224-4642-8b37-f84fcf540c2e" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.367928468290946" CRS="WGS84" lat="51.99916480455774"/>
          <point xsi:type="esdl:Point" lon="4.367938710740932" CRS="WGS84" lat="51.999168262107005"/>
          <point xsi:type="esdl:Point" lon="4.368502661385395" CRS="WGS84" lat="51.9994879036446"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe10_ret" diameter="DN500" length="1823.8" innerDiameter="0.4954" state="OPTIONAL" name="Pipe10_ret" outerDiameter="0.8" related="Pipe10">
        <port xsi:type="esdl:InPort" id="545640d8-bd2d-4532-8e23-a1900c53321e" name="In_ret" connectedTo="588fd953-2a7d-4549-a89c-80b27e24ab2c" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="2db65ceb-047b-4385-9648-6c9ddc684681" name="Out_ret" connectedTo="81a1bb4a-1701-4491-86d4-2c2f0b858aa2" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3548106114555685" CRS="WGS84" lat="51.994695415007946"/>
          <point xsi:type="esdl:Point" lon="4.3537362413149445" CRS="WGS84" lat="51.99654509236514"/>
          <point xsi:type="esdl:Point" lon="4.354169742296313" CRS="WGS84" lat="51.997430268064136"/>
          <point xsi:type="esdl:Point" lon="4.35364311334862" CRS="WGS84" lat="51.999464784669065"/>
          <point xsi:type="esdl:Point" lon="4.354094227494968" CRS="WGS84" lat="51.99957047131696"/>
          <point xsi:type="esdl:Point" lon="4.358068332678131" CRS="WGS84" lat="52.00050842938335"/>
          <point xsi:type="esdl:Point" lon="4.358948345623886" CRS="WGS84" lat="52.0005612715065"/>
          <point xsi:type="esdl:Point" lon="4.358971042830645" CRS="WGS84" lat="52.00082548118665"/>
          <point xsi:type="esdl:Point" lon="4.362342855945026" CRS="WGS84" lat="52.00145957805644"/>
          <point xsi:type="esdl:Point" lon="4.364491254204381" CRS="WGS84" lat="52.002027615541266"/>
          <point xsi:type="esdl:Point" lon="4.365305791120924" CRS="WGS84" lat="52.00184267389578"/>
          <point xsi:type="esdl:Point" lon="4.365993352223803" CRS="WGS84" lat="52.00204082562958"/>
          <point xsi:type="esdl:Point" lon="4.36656964878008" CRS="WGS84" lat="52.00138031643894"/>
          <point xsi:type="esdl:Point" lon="4.367920591275508" CRS="WGS84" lat="51.999165217399444"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe11_ret" diameter="DN500" length="102.7" innerDiameter="0.4954" state="OPTIONAL" name="Pipe11_ret" outerDiameter="0.8" related="Pipe11">
        <port xsi:type="esdl:InPort" id="03f16a92-b24d-4e11-b730-83b703517cad" name="In_ret" connectedTo="b57116bc-1f78-402c-84c0-fc6e5846cf8a" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="1207cf4b-308c-4466-b1c8-9e997e988fff" name="Out_ret" connectedTo="81a1bb4a-1701-4491-86d4-2c2f0b858aa2" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.368405699422867" CRS="WGS84" lat="51.998285701083724"/>
          <point xsi:type="esdl:Point" lon="4.3679277752889245" CRS="WGS84" lat="51.999160108482904"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe12_ret" diameter="DN500" length="1695.06" innerDiameter="0.4954" state="OPTIONAL" name="Pipe12_ret" outerDiameter="0.8" related="Pipe12">
        <port xsi:type="esdl:InPort" id="15cec74a-ff3d-4349-99c1-b63e54984020" name="In_ret" connectedTo="ba357584-609f-4cf2-aedd-0fac5c8ceade" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="a2336831-a837-4c16-8b13-5ccaf7ad4b28" name="Out_ret" connectedTo="9499403a-8dcf-4c77-944d-a56829b8ff7e" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.358033875102766" CRS="WGS84" lat="51.98942341528986"/>
          <point xsi:type="esdl:Point" lon="4.358335460597678" CRS="WGS84" lat="51.9896414426195"/>
          <point xsi:type="esdl:Point" lon="4.363308048432978" CRS="WGS84" lat="51.990599428912915"/>
          <point xsi:type="esdl:Point" lon="4.3656512071836415" CRS="WGS84" lat="51.99140544288403"/>
          <point xsi:type="esdl:Point" lon="4.367015611554548" CRS="WGS84" lat="51.99175559197406"/>
          <point xsi:type="esdl:Point" lon="4.369055647987936" CRS="WGS84" lat="51.99205288622196"/>
          <point xsi:type="esdl:Point" lon="4.371890986540468" CRS="WGS84" lat="51.992614436638156"/>
          <point xsi:type="esdl:Point" lon="4.369453529130539" CRS="WGS84" lat="51.9964526103122"/>
          <point xsi:type="esdl:Point" lon="4.369134268411443" CRS="WGS84" lat="51.99698107661307"/>
          <point xsi:type="esdl:Point" lon="4.368405699422867" CRS="WGS84" lat="51.998285701083724"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe13_ret" diameter="DN500" length="285.9" innerDiameter="0.4954" state="OPTIONAL" name="Pipe13_ret" outerDiameter="0.8" related="Pipe13">
        <port xsi:type="esdl:InPort" id="3e844e19-0eff-47e7-af3b-d95e29d0c7f8" name="In_ret" connectedTo="6a4e4835-ddee-4652-9cfa-2c8d49821d6f" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="b60cdb49-a624-4274-8daf-c769bc46d984" name="Out_ret" connectedTo="9499403a-8dcf-4c77-944d-a56829b8ff7e" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3721244417482765" CRS="WGS84" lat="51.99937396000665"/>
          <point xsi:type="esdl:Point" lon="4.371998986068785" CRS="WGS84" lat="51.99922038334009"/>
          <point xsi:type="esdl:Point" lon="4.368405699422867" CRS="WGS84" lat="51.998285701083724"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
