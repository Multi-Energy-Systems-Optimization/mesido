<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="Delft_T_GrowOptimized" id="b9b08f3e-d2c4-4d0b-84bb-5566c876cedc" esdlVersion="v2401" description="" version="24">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="9d77d097-2ad4-4028-8b65-a3f136507a07">
    <carriers xsi:type="esdl:Carriers" id="82fb7d85-2f43-484a-8730-0c65ea567781">
      <carrier xsi:type="esdl:HeatCommodity" id="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" name="Supply" supplyTemperature="80.0"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="50.0" name="Supply_ret" id="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="25075c4d-b03e-4395-8e2b-20dc3d31282e">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="POWER" multiplier="MEGA" unit="WATT" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="ENERGY" multiplier="KILO" unit="WATTHOUR" id="12c481c0-f81e-49b6-9767-90457684d24a" description="Energy in kWh"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="FLOW" unit="CUBIC_METRE" perTimeUnit="SECOND"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="POWER" unit="WATT"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="SPEED" unit="METRE" perTimeUnit="SECOND"/>
    </quantityAndUnits>
    <dataconfigurations xsi:type="esdl:DataConfigurations" id="292e3cef-5169-42bd-a699-f4b66f38118d">
      <configurations xsi:type="esdl:DatabaseConfiguration" id="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" database="b9b08f3e-d2c4-4d0b-84bb-5566c876cedc" type="POSTGRESQL" host="postgres" port="5432"/>
    </dataconfigurations>
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
        <port xsi:type="esdl:OutPort" id="2de34c49-31dd-4583-a4f4-3ea83b486fe0" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="29a9bc48-88e3-4ba1-98e6-7c3beda1ccec">
          <profile xsi:type="esdl:DataTableProfile" id="23da8ef2-7bd2-47d1-b18a-0636fbd8380c" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='a11c72f9-a5e8-4e33-9504-7a44a29b9861'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="a7dc8957-99aa-4759-a277-62b9da13d4f5" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="19fe6126-54f4-407c-85b8-9f2e5d266a00" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='a11c72f9-a5e8-4e33-9504-7a44a29b9861'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="324d5d70-401e-44af-b6d7-f3a4c55b6c2b" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="Voorhof" power="12500000.0" id="8cf7ab21-57c6-4cbe-bb09-c85dad625d58">
        <geometry xsi:type="esdl:Point" lon="4.360003173351289" CRS="WGS84" lat="51.9963708675561"/>
        <port xsi:type="esdl:InPort" id="f2a3d85d-8ffd-417f-8318-44733cde25ac" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="2ad472b1-9206-4cdb-8868-773a8c17e010">
          <profile xsi:type="esdl:InfluxDBProfile" profileType="INPUT" multiplier="11.0" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T22:00:00.000000+0000" host="omotes_influxdb" port="8096" database="omotes_timeseries" measurement="standard_profiles" field="E1A" id="e3d647e5-75a8-4b81-b2b9-79f075d5da33">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="2cdce875-65f6-4ce9-b7dd-c6438b24da2e" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="8312b1b6-b753-4caa-8dfe-9dc834067484">
          <profile xsi:type="esdl:DataTableProfile" id="6c480e4d-17a5-492d-84d6-97b0c91de03a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='8cf7ab21-57c6-4cbe-bb09-c85dad625d58'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="b81f2b6b-c47e-40ab-80ab-a141314ebc9e" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="6be7feeb-6050-432d-9648-e9f0250263ae" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='8cf7ab21-57c6-4cbe-bb09-c85dad625d58'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="8c081f77-7ed3-44c2-8373-29fc453a5149" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="Tanthof Oost" power="10000000.0" id="5c8d8519-4f57-475f-977d-103eb34a05f4">
        <geometry xsi:type="esdl:Point" lon="4.359710812568665" lat="51.988831287615405"/>
        <port xsi:type="esdl:InPort" id="e80fdb9d-52ee-4410-8097-0ae5df11f0ef" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="204913ef-b187-4738-8470-e59e7f6a9714">
          <profile xsi:type="esdl:InfluxDBProfile" field="SpaceHeat_and_HotWater_PowerProfile_1900_2000" measurement="Space Heat default profiles" id="de3378f7-4d12-4d9c-911b-db515083e2a4" database="energy_profiles" filters="" host="https://profiles.warmingup.info" multiplier="9.0" endDate="2019-12-31T22:00:00.000000+0000" startDate="2018-12-31T23:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="f0fbe6cf-7439-4a57-9137-c4452e3c7dda" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="e900287d-ee43-41c8-8553-4adf0ba258b7">
          <profile xsi:type="esdl:DataTableProfile" id="270b2dbf-8159-4106-a3fd-cca4f0f4c962" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='5c8d8519-4f57-475f-977d-103eb34a05f4'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="b95d374b-3180-4fb0-b475-34d1bc294914" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="e30d296f-0a00-426c-9b05-8c4deab995e1" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='5c8d8519-4f57-475f-977d-103eb34a05f4'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="8b062e4d-fd4d-480f-87c1-62fcd2ba7764" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="Tanthof West" power="15000000.0" id="9a85a5a3-d9e6-46a5-ad93-b82bae94a610">
        <geometry xsi:type="esdl:Point" lon="4.34485673904419" CRS="WGS84" lat="51.98550455015984"/>
        <port xsi:type="esdl:InPort" id="9de82a78-c855-4870-83e8-eb0b1e14ebfb" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="f9a34d85-09b6-4027-bfa0-460e81c71af6">
          <profile xsi:type="esdl:InfluxDBProfile" field="SpaceHeat_and_HotWater_PowerProfile_1900_2000" measurement="Space Heat default profiles" id="ba1039b5-a536-4eeb-8b67-7c298ce85e47" database="energy_profiles" filters="" host="https://profiles.warmingup.info" multiplier="12.0" endDate="2019-12-31T22:00:00.000000+0000" startDate="2018-12-31T23:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="2554a536-e0fc-47ba-af67-94be7eaeb643" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="e0c29235-31bf-47b7-851f-1c09449aba2b">
          <profile xsi:type="esdl:DataTableProfile" id="1df272d8-e57e-406f-afaa-31114e67f2bd" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='9a85a5a3-d9e6-46a5-ad93-b82bae94a610'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="47aa0b34-90b4-4c37-9cef-231939ab91d6" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="f832c931-e2da-443a-9bcc-a8c0be95f5a0" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='9a85a5a3-d9e6-46a5-ad93-b82bae94a610'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="524f30bb-2206-4bb1-a3d3-0f5523997daa" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="TUDelft" power="10000000.0" id="79d559de-54f2-40b9-af9a-c62f499db523">
        <geometry xsi:type="esdl:Point" lon="4.372908622026444" lat="51.99928395991665"/>
        <port xsi:type="esdl:InPort" id="009d4384-b264-4b8c-9b1b-6526e17b065b" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="94f97ff2-e7d4-4282-a64d-2e096030a85f">
          <profile xsi:type="esdl:InfluxDBProfile" field="SpaceHeat_and_HotWater_PowerProfile_2000_2010" measurement="Space Heat default profiles" id="812bdd68-4c7f-4157-ace4-cabeba622024" database="energy_profiles" filters="" host="https://profiles.warmingup.info" endDate="2019-12-31T22:00:00.000000+0000" multiplier="10.0" startDate="2018-12-31T23:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="6a4e4835-ddee-4652-9cfa-2c8d49821d6f" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="3e844e19-0eff-47e7-af3b-d95e29d0c7f8">
          <profile xsi:type="esdl:DataTableProfile" id="a910d578-5504-4b66-81e9-7f83c5506270" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='79d559de-54f2-40b9-af9a-c62f499db523'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="9b6faf8e-64a3-4d43-9e6b-ea26adc43eaa" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="102bce9c-4de8-40ba-8c1f-60be2f6e82db" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='79d559de-54f2-40b9-af9a-c62f499db523'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="7adc4c98-bed8-456b-8e68-e9821d745cab" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
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
        <port xsi:type="esdl:OutPort" id="fa77af71-df5c-4ad8-9a1b-c6a68c6d87de" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="2b78d35e-c5f0-4248-9e5b-d2e88bc02985">
          <profile xsi:type="esdl:DataTableProfile" id="b2037519-ca26-4852-8bb2-43616200cc24" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='9684c4fc-df93-4ead-8c10-b7b84eef895b'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="2423eb63-ecdf-425c-9241-0c1ffa69b88d" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="d62d4432-56d2-4a78-b277-2035d1dea12d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='9684c4fc-df93-4ead-8c10-b7b84eef895b'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="355f78e6-9045-4d91-aebf-69df12a7690f" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
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
        <port xsi:type="esdl:OutPort" id="577714a4-c560-4b64-a70e-09bf12a65b1c" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="479a2393-d053-4a67-bc54-ea7ee755df37">
          <profile xsi:type="esdl:DataTableProfile" id="0dfb1068-c328-41cf-9450-60694d37e7ee" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='49c218d4-f760-4ec5-87ac-025edb5b7ade'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="dc26d3e9-0879-4dc0-9cea-3b9d2b067bdd" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="f9c51d23-efd0-4115-ac32-323f4c576a09" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='49c218d4-f760-4ec5-87ac-025edb5b7ade'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="4ed2c88a-48bc-4a16-a69b-3a22b8c72395" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <port xsi:type="esdl:InPort" id="3bef437b-1f74-4920-be2c-14d60e9d5e79" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="6631bbc0-4696-4426-88af-82a79f8ecbe8"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_0602" id="0602f235-45dc-47f7-9e7b-7ca06a04cbef">
        <geometry xsi:type="esdl:Point" lon="4.350956082344056" CRS="WGS84" lat="51.99483002267327"/>
        <port xsi:type="esdl:InPort" id="52ab4605-e440-4362-8b6a-1da389276935" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="f67a61ad-623d-4280-b28a-936e51978630"/>
        <port xsi:type="esdl:OutPort" id="149aacff-a165-4d36-af77-fbb1c5c93ae4" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="1dcbfe8e-c388-46f4-b247-ad34ecbf7c42 bbf4b6d0-6840-48b2-825c-dd606c2be162"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.3127" name="Pipe1" id="Pipe1" diameter="DN300" length="63.9" outerDiameter="0.45" related="Pipe1_ret">
        <costInformation xsi:type="esdl:CostInformation" id="e133f20c-69af-493a-8284-37f8c6a3de0d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.350041449069978" lat="51.994716067408795"/>
          <point xsi:type="esdl:Point" lon="4.350956082344056" lat="51.99483002267327"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="479a2393-d053-4a67-bc54-ea7ee755df37" name="In" connectedTo="577714a4-c560-4b64-a70e-09bf12a65b1c" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="f67a61ad-623d-4280-b28a-936e51978630" name="Out" connectedTo="52ab4605-e440-4362-8b6a-1da389276935" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772">
          <profile xsi:type="esdl:DataTableProfile" id="d49a5fad-d591-439b-8da3-e416ccf348c2" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe1'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="d8008a04-d0b7-4573-987e-89647271ea27" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="bedda6c8-8ca2-409e-9e7a-3b69031c96a0" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe1'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="6b019d1f-a0c4-4ab5-b7a2-a74eab841620" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="fe6dce50-fef3-4431-9b09-3d88a4a6861a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe1'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="b0b76b45-c521-42d4-b1b2-aa476a7a8711" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="4aaa2e7a-b920-481f-82d2-d548d89d8d59" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe1'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="078df720-6b86-47eb-b270-1c4ef6d120ad" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.263" name="Pipe2" id="Pipe2" diameter="DN250" length="1358.7" outerDiameter="0.4" related="Pipe2_ret">
        <costInformation xsi:type="esdl:CostInformation" id="0d01156b-596d-4998-a6c6-e58416fc9213">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="1630.7">
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
        <port xsi:type="esdl:OutPort" id="7e5de7de-014a-42a2-846a-b7f5814043a4" name="Out" connectedTo="abcec1a4-5a73-460f-bec5-a8a4eaf6e210" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772">
          <profile xsi:type="esdl:DataTableProfile" id="a0826815-3984-4b8e-b25c-2ee14ea89003" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe2'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="944c8398-7d65-48d6-a43a-899cf0a22658" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="8737ce43-dd5f-4990-83c9-150e9e701b9d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe2'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="b413e7f6-38ae-41ad-8f23-870c6d5b06f3" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="67cfd92e-e641-4b38-a86d-d8a832c39d60" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe2'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="38bfc49c-b125-4260-8ebb-5ad2dc8d2b6d" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="8ecc49a9-acd1-488d-9b58-9326422f39de" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe2'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="2660d70e-410a-435e-861b-e5d4e03af261" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.005">
            <matter xsi:type="esdl:Material" id="faac539b-4b7c-43f8-abcd-f08fa2652b7b" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0587">
            <matter xsi:type="esdl:Material" id="d23b4eeb-a419-4c16-bc7e-280a76116f04" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0048">
            <matter xsi:type="esdl:Material" id="a2b91e8d-471d-4276-a8f6-4efb01054b4e" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.1603" name="Pipe3" id="Pipe3" diameter="DN150" length="393.93" outerDiameter="0.25" related="Pipe3_ret">
        <costInformation xsi:type="esdl:CostInformation" id="526493c7-72b6-40fc-a63c-acb830ceb630">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="1126.4">
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
        <port xsi:type="esdl:OutPort" id="0dd107f2-c1fd-4288-baeb-2f3c8271d781" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="6c855627-c430-48d7-a6c5-fd9743525713">
          <profile xsi:type="esdl:DataTableProfile" id="5471f90b-e4d0-40a6-9a08-606c133eb89b" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe3'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="c68508ef-81a1-4402-b5c8-e3ad510c64f4" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="118a83bf-257a-48be-815a-9dcd9b30afa8" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe3'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="2cac2070-e4e7-4221-9130-13659a8708a5" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="1165f51c-fb4e-4c91-9f02-07133d157898" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe3'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="0ad80bf7-1429-48db-9313-c6975d3592a2" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="a0439023-5339-475e-904f-78d977af3d02" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe3'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="1cea4b1b-7bb7-47ec-9fbf-48a062f6aba4" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="fa85538e-ebfa-4bce-8386-04980e793e18" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="3bafa031-f40f-42fc-b409-e35fffe5f457" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="893337e3-58f1-4fb4-8c25-68d71b11fb71" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.1603" name="Pipe4" id="Pipe4" diameter="DN150" length="484.9" outerDiameter="0.25" related="Pipe4_ret">
        <costInformation xsi:type="esdl:CostInformation" id="526493c7-72b6-40fc-a63c-acb830ceb630">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="1126.4">
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
        <port xsi:type="esdl:OutPort" id="2ad472b1-9206-4cdb-8868-773a8c17e010" name="Out" connectedTo="f2a3d85d-8ffd-417f-8318-44733cde25ac" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772">
          <profile xsi:type="esdl:DataTableProfile" id="d78e7751-2952-4e0f-a5f6-ebb098357f1a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe4'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="7ace9028-aa69-4a46-ba89-94037f913957" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="45d604dc-f071-4935-84d4-9d32b3321aaa" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe4'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="24784269-ac2a-40e2-bcf1-bc2f533fc6bb" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="b25d4bd3-8977-438d-aae9-688265f204b7" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe4'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="c8ee2207-207b-420c-88a1-117a0486059b" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="24ab1daf-699b-4064-956b-6d60ffb20a7d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe4'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="464eaf41-fd07-4f94-ae3a-bab47b6780fe" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="fa85538e-ebfa-4bce-8386-04980e793e18" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="3bafa031-f40f-42fc-b409-e35fffe5f457" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="893337e3-58f1-4fb4-8c25-68d71b11fb71" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_6a29" id="6a29891f-6712-4675-af74-72a2da1ae999">
        <geometry xsi:type="esdl:Point" lon="4.355617761611939" lat="51.99460541491795"/>
        <port xsi:type="esdl:InPort" id="6c855627-c430-48d7-a6c5-fd9743525713" name="In" connectedTo="0dd107f2-c1fd-4288-baeb-2f3c8271d781" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="49117fc6-1ec2-4a7c-b432-78fabbe33029" name="Out" connectedTo="964df08b-9382-4fdf-8702-20f76758b8df 52d841d7-c0d3-45bf-adb9-e26d81b0f49d" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.1603" name="Pipe5" id="Pipe5" diameter="DN150" length="223.2" outerDiameter="0.25" related="Pipe5_ret">
        <costInformation xsi:type="esdl:CostInformation" id="439a7891-9620-4d6f-9634-9a68cbdf226c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.355617761611939" lat="51.99460541491795"/>
          <point xsi:type="esdl:Point" lon="4.356776475906373" lat="51.99272923553559"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="52d841d7-c0d3-45bf-adb9-e26d81b0f49d" name="In" connectedTo="49117fc6-1ec2-4a7c-b432-78fabbe33029" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="b53856b1-ed70-4798-b319-6d19285faf0b" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="b70e4357-f83c-411c-9398-5788de26844b">
          <profile xsi:type="esdl:DataTableProfile" id="503cc179-6cc9-4edc-b70a-f75d8a20dc51" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe5'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="aba264c8-03ca-4c05-8a03-e91bd1296f0c" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="dc0b6e48-2b6e-4cfe-8b13-e8ee32180993" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe5'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="0f9e863c-6af3-47c8-ae70-3c7fdb461458" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="082a324c-2926-47d0-b3ae-4e15a3f283f3" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe5'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="26e45c4a-0598-488f-8c31-0c6cd069deee" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="f2202a93-5ab0-4f56-8fad-baad114e4c49" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe5'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="8a9ff70e-f058-4a6a-a4eb-8f5daefd064d" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="fa85538e-ebfa-4bce-8386-04980e793e18" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="3bafa031-f40f-42fc-b409-e35fffe5f457" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="893337e3-58f1-4fb4-8c25-68d71b11fb71" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_dff9" id="dff991c2-f10a-4f0b-a96c-eac64ffc9fa5">
        <geometry xsi:type="esdl:Point" lon="4.356776475906373" lat="51.99272923553559"/>
        <port xsi:type="esdl:InPort" id="b70e4357-f83c-411c-9398-5788de26844b" name="In" connectedTo="b53856b1-ed70-4798-b319-6d19285faf0b" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="722edfd1-7ad4-473c-aba3-134b5b59a729" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="a3e6d19a-77fb-4de9-82c4-8f699fb96e65 edd0ab42-3adc-4d41-9c7e-f40f9ae1c079"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.263" name="Pipe6" id="Pipe6" diameter="DN250" length="1690.3" outerDiameter="0.4" related="Pipe6_ret">
        <costInformation xsi:type="esdl:CostInformation" id="f5f69d21-ea71-4559-b777-4bd90df73f82">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="1630.7">
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
        <port xsi:type="esdl:OutPort" id="f9a34d85-09b6-4027-bfa0-460e81c71af6" name="Out" connectedTo="9de82a78-c855-4870-83e8-eb0b1e14ebfb" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772">
          <profile xsi:type="esdl:DataTableProfile" id="11865cf1-6371-47f7-8826-bec397ad5965" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe6'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="d8fdfbe1-6a17-490d-a24a-601868c6847b" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="921a67f9-1d42-4ecc-ad4b-5d733fdfe240" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe6'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="dc248f21-42ed-4d27-a934-b72945d2a319" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="dab678b1-c408-43a3-a40c-03cd18d74ff7" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe6'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="da036f58-64cd-427f-beb5-ace0de8005c6" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="31a1346f-66ae-45ec-bf5d-40916554fb05" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe6'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="830ac551-f91d-4845-91b8-bd76afc61b73" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.005">
            <matter xsi:type="esdl:Material" id="faac539b-4b7c-43f8-abcd-f08fa2652b7b" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0587">
            <matter xsi:type="esdl:Material" id="d23b4eeb-a419-4c16-bc7e-280a76116f04" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0048">
            <matter xsi:type="esdl:Material" id="a2b91e8d-471d-4276-a8f6-4efb01054b4e" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.3127" name="Pipe7" id="Pipe7" diameter="DN300" length="403.93" outerDiameter="0.45" related="Pipe7_ret">
        <costInformation xsi:type="esdl:CostInformation" id="439a7891-9620-4d6f-9634-9a68cbdf226c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="1962.1">
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
        <port xsi:type="esdl:OutPort" id="3f4cfc75-908d-4cbd-a268-3e455ccbfc2a" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="c37bb2ed-d06d-454b-863e-a899b063f965">
          <profile xsi:type="esdl:DataTableProfile" id="236513fe-0242-47d5-a72f-0cb438a6cccb" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe7'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="33385040-62ca-48df-b218-e3406186d6bf" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="1a3f7833-7301-4734-b636-229aeead5f24" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe7'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="abcc2592-ce38-43fd-a9c6-aa028155d6f4" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="ff1c5d4e-6875-432d-a6d0-1f3f938ee521" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe7'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="fa371eb1-ec45-44e8-bddb-25e14df2c9f6" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="0155752a-76ed-4f64-97a2-1278514cb482" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe7'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="dc0de95c-3411-4949-a54f-1d08e92e6434" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.2101" name="Pipe8" id="Pipe8" diameter="DN200" length="104.18" outerDiameter="0.315" related="Pipe8_ret">
        <costInformation xsi:type="esdl:CostInformation" id="439a7891-9620-4d6f-9634-9a68cbdf226c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="1355.3">
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
        <port xsi:type="esdl:OutPort" id="204913ef-b187-4738-8470-e59e7f6a9714" name="Out" connectedTo="e80fdb9d-52ee-4410-8097-0ae5df11f0ef" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772">
          <profile xsi:type="esdl:DataTableProfile" id="8bed527b-11bd-4f5f-91f5-f72df39029f2" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe8'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="38742893-3a12-4130-9ab0-6c37b19db739" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="d8e2c938-27cb-4dc8-bf96-18cd5969072c" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe8'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="32f6b4c4-a2c8-403e-8f02-4e90818f5e49" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="1c861464-677a-4e16-8503-76ad2d9c7533" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe8'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="87d23ee5-d22b-4b75-8e5e-ad3dc0e11257" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="9d4a47dd-36c5-45ae-a7df-3066f9b71cee" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe8'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="ec942ac7-adee-4176-8e9d-3b51cd72e2e1" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" id="930aa5cf-b76e-4049-afa7-ea79445faf55" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_35aa" id="35aaffb9-9664-49ca-ac6e-230e4c5a2ef7">
        <geometry xsi:type="esdl:Point" lon="4.358868598937989" lat="51.989333415199866"/>
        <port xsi:type="esdl:InPort" id="c37bb2ed-d06d-454b-863e-a899b063f965" name="In" connectedTo="3f4cfc75-908d-4cbd-a268-3e455ccbfc2a fd13043b-7aa5-42ee-9804-fde0d8380177" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="7c3ee187-3368-4672-bf37-f890454abf1b" name="Out" connectedTo="c525a3e2-b021-484d-9e45-062e371b4d03" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.3444" name="Pipe9" id="Pipe9" diameter="DN350" length="53.2" outerDiameter="0.5" related="Pipe9_ret">
        <costInformation xsi:type="esdl:CostInformation" id="2b31fbcd-64ee-421c-b50e-ef95d8369821">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="2360.9">
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
        <port xsi:type="esdl:OutPort" id="5229a3e7-7b3d-483e-8860-b81d703356dc" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="2ff91621-5f74-4bf1-baf2-e843907ee452">
          <profile xsi:type="esdl:DataTableProfile" id="97819f1b-f269-43dd-9fa2-81d0e59c4984" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe9'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="6005e5b8-4324-4654-974f-72f00d81dfaa" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="4dcc07d1-232f-4099-bf40-2fc64e4f91a4" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe9'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="37f448dc-95ce-4294-ac3e-c72c27c216b9" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="9eb7fe0f-f2ee-4203-b9ca-8d4c919df829" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe9'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="1f0a53ae-22f4-42e7-b2c9-eb9825ee55a7" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="3be810de-4fea-4970-b8e4-6c97fda2d74a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe9'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="84a3e6f4-aedb-4788-8adb-11194b7032fc" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="d2298eee-877b-45e1-8b67-cc63fc2f6c69" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0666">
            <matter xsi:type="esdl:Material" id="cd3d98cc-58f2-4683-8523-7e4183c7e685" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="3979c7f7-6acf-4a32-81bb-8ed118357c6b" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.3444" name="Pipe11" id="Pipe11" diameter="DN350" length="102.7" outerDiameter="0.5" related="Pipe11_ret">
        <costInformation xsi:type="esdl:CostInformation" id="2b31fbcd-64ee-421c-b50e-ef95d8369821">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="2360.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" physicalQuantity="COST" unit="EURO" id="6be7a1d2-545f-4d47-9138-818cc03c63f1" description="Costs in EUR/m"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.368712976574899" lat="51.99907010839291"/>
          <point xsi:type="esdl:Point" lon="4.369195103645326" lat="51.998195700993726"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" id="1343b0ed-fafc-4677-9e5f-e38b13a73017" name="In" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="0def0a64-c010-4ef8-9834-b152e7e85884"/>
        <port xsi:type="esdl:OutPort" id="978d0d30-b56b-4b2b-85d1-187585acc6c0" name="Out" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" connectedTo="8cc49167-e8ac-4063-ace2-7715b7e4c7e9">
          <profile xsi:type="esdl:DataTableProfile" id="30b6e1bc-f312-4dbd-b928-f72792a7aa11" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe11'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="b200c0f7-64b3-49f1-871b-370082a60c0b" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="5c396345-4064-4509-aa49-c5e44902999d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe11'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="6fbf4c3a-6574-4447-8135-d8aacb298628" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="0a0c5ae8-e6aa-4646-9819-1a7322e88ec3" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe11'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="8eaa5a00-a107-454e-9c11-29323e17db44" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="efbffd0c-3b3d-4b7a-8b23-432fe96e038e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe11'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="1db7772f-5e03-434d-a6da-8d6c752aa217" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="d2298eee-877b-45e1-8b67-cc63fc2f6c69" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0666">
            <matter xsi:type="esdl:Material" id="cd3d98cc-58f2-4683-8523-7e4183c7e685" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="3979c7f7-6acf-4a32-81bb-8ed118357c6b" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.263" name="Pipe12" id="Pipe12" diameter="DN250" length="1695.06" outerDiameter="0.4" related="Pipe12_ret">
        <costInformation xsi:type="esdl:CostInformation" id="2b31fbcd-64ee-421c-b50e-ef95d8369821">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="1630.7">
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
        <port xsi:type="esdl:OutPort" id="fd13043b-7aa5-42ee-9804-fde0d8380177" name="Out" connectedTo="c37bb2ed-d06d-454b-863e-a899b063f965" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772">
          <profile xsi:type="esdl:DataTableProfile" id="6e4cbd3d-df0f-46b9-b25f-935cb9361fe5" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe12'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="70267f41-531a-4351-9393-9689d8b9be21" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="da680076-6c69-4a82-9677-4cf5c8c709b3" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe12'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="0cc2250f-1bcd-4770-9889-45965bd14b64" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="1b808241-f3ee-49ef-b201-7e56c8222a32" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe12'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="da1a89e1-64f2-46d7-b795-63f7ebb0ebd1" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="e0e381c0-3709-441f-b2aa-28d3fa80435e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe12'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="c7968554-73c8-48f6-a41b-3dcc04b6ad01" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.005">
            <matter xsi:type="esdl:Material" id="faac539b-4b7c-43f8-abcd-f08fa2652b7b" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0587">
            <matter xsi:type="esdl:Material" id="d23b4eeb-a419-4c16-bc7e-280a76116f04" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0048">
            <matter xsi:type="esdl:Material" id="a2b91e8d-471d-4276-a8f6-4efb01054b4e" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_b463" id="b4633ecb-cda5-4343-9d51-af350a9c331b">
        <geometry xsi:type="esdl:Point" lon="4.369195103645326" lat="51.998195700993726"/>
        <port xsi:type="esdl:InPort" id="8cc49167-e8ac-4063-ace2-7715b7e4c7e9" name="In" connectedTo="978d0d30-b56b-4b2b-85d1-187585acc6c0" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="c264080b-5f9b-4bad-bd85-9f963dae742b" name="Out" connectedTo="8d148f66-5ee2-4b70-9d2c-e6038be94ada dae970c0-5471-4ff2-8da5-802856320750" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.2101" name="Pipe13" id="Pipe13" diameter="DN200" length="285.9" outerDiameter="0.315" related="Pipe13_ret">
        <costInformation xsi:type="esdl:CostInformation" id="5ab69aac-efed-4ade-8dd3-96720cd2a96f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1b0e8f56-b993-4135-ab6b-7e96da963344" value="1355.3">
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
        <port xsi:type="esdl:OutPort" id="94f97ff2-e7d4-4282-a64d-2e096030a85f" name="Out" connectedTo="009d4384-b264-4b8c-9b1b-6526e17b065b" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772">
          <profile xsi:type="esdl:DataTableProfile" id="2fd0a2ca-bb06-4349-8db5-f28e6876f311" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe13'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="f3d93a64-0367-489c-9077-8de5e5f9154f" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="11e0ebf5-b777-4a89-abe3-80f4a7c17acb" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe13'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="ba2cf3c2-04c3-4bb3-888a-ed89293f5711" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="deca7176-9ad1-4fee-a6bd-5e00f110f71e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe13'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="d2b30c40-5965-4721-80bf-8d6e1178fee7" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="b8e64f5e-5622-4796-b8f5-535518247f33" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe13'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="fbf44067-1fef-4385-8b2c-6467c2431698" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" id="930aa5cf-b76e-4049-afa7-ea79445faf55" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_c2e0" id="c2e017f0-3abb-40c5-8407-cfbe0ec2c947">
        <geometry xsi:type="esdl:Point" lon="4.368709498085082" CRS="WGS84" lat="51.99907274025906"/>
        <port xsi:type="esdl:InPort" id="2ff91621-5f74-4bf1-baf2-e843907ee452" name="In" connectedTo="5229a3e7-7b3d-483e-8860-b81d703356dc" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
        <port xsi:type="esdl:OutPort" id="0def0a64-c010-4ef8-9834-b152e7e85884" name="Out" connectedTo="1343b0ed-fafc-4677-9e5f-e38b13a73017" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_0602_ret" id="bcf07b56-c3ee-42a6-9c42-9845f5bf0d33">
        <geometry xsi:type="esdl:Point" lon="4.350150066040208" CRS="WGS84" lat="51.99492002276327"/>
        <port xsi:type="esdl:OutPort" id="e74f13f2-c63e-4717-b237-6499c9488eac" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="0091722b-9afb-4475-b559-380e270cca80"/>
        <port xsi:type="esdl:InPort" id="8411ac81-9c78-4d11-8a69-f95c26f71033" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="d7de09b1-6d03-4d7e-87da-1896af9f05ad 51c50f83-1e9f-4db1-b8d4-7db3d01807e6"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_6a29_ret" id="8b6a23bf-e9c8-48e2-9984-6184ea7eaae4">
        <geometry xsi:type="esdl:Point" lon="4.3548106114555685" CRS="WGS84" lat="51.994695415007946"/>
        <port xsi:type="esdl:InPort" id="e6a7a2e5-acb6-4084-b3ec-f0df5bbab853" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="f2d10d3d-0064-4cb8-bd02-ae507bd5f3df 8a29b3c1-cd96-43e0-b918-22551a2d139d"/>
        <port xsi:type="esdl:OutPort" id="588fd953-2a7d-4549-a89c-80b27e24ab2c" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="d8daa8a8-f473-4a23-8732-a8ff6379cd67"/>
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
        <port xsi:type="esdl:InPort" id="81a1bb4a-1701-4491-86d4-2c2f0b858aa2" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="1207cf4b-308c-4466-b1c8-9e997e988fff"/>
        <port xsi:type="esdl:OutPort" id="c0bdb043-c1ec-455f-92f2-eabbbcb8580a" name="ret_port" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" connectedTo="3c52ca3a-e59e-4fff-a451-fc110907d9aa"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe1_ret" diameter="DN300" length="63.9" innerDiameter="0.3127" name="Pipe1_ret" outerDiameter="0.45" related="Pipe1">
        <port xsi:type="esdl:InPort" id="0091722b-9afb-4475-b559-380e270cca80" name="In_ret" connectedTo="e74f13f2-c63e-4717-b237-6499c9488eac" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="6631bbc0-4696-4426-88af-82a79f8ecbe8" name="Out_ret" connectedTo="3bef437b-1f74-4920-be2c-14d60e9d5e79" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="c3a62a18-22e4-4590-8203-040a83acfb65" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe1_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="6ec690fa-7787-40bf-8dec-722821574d72" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="2f374bb4-16fd-4c37-8a0b-fa297dbf12b9" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe1_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="2d609a58-bb56-45f9-a19b-6e934e107fce" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="3e88fefd-ff8a-4444-9bf9-bbd5f860fe59" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe1_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="aa3999ea-d566-4574-a8d4-a42e2fe72412" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="bbc22145-4db7-488b-873e-c85c0a376f26" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe1_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="2a892ecb-d421-45dc-b1ba-0a6db8f6d50a" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.350150066040208" CRS="WGS84" lat="51.99492002276327"/>
          <point xsi:type="esdl:Point" lon="4.349234857906909" CRS="WGS84" lat="51.99480606749879"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe2_ret" diameter="DN250" length="1358.7" innerDiameter="0.263" name="Pipe2_ret" outerDiameter="0.4" related="Pipe2">
        <port xsi:type="esdl:InPort" id="29a9bc48-88e3-4ba1-98e6-7c3beda1ccec" name="In_ret" connectedTo="2de34c49-31dd-4583-a4f4-3ea83b486fe0" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="d7de09b1-6d03-4d7e-87da-1896af9f05ad" name="Out_ret" connectedTo="8411ac81-9c78-4d11-8a69-f95c26f71033" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="0055ed49-a7ac-4691-b23a-f02b426029cd" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe2_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="dc386e0f-33dc-4d77-a4cc-8bf4e8026a4d" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="beba200c-fdf5-4f47-b809-76da1f7833c4" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe2_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="5fe28f64-dfd0-41c6-a715-460769281f8b" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="26504e26-aac8-4ef8-b2ca-21cd4e50ffe7" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe2_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="bce8f775-0ba8-4446-b857-40d0baa90dc7" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="abb20e48-968b-42fa-9399-b361d9a7387e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe2_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="9b0978af-39d0-4734-a1e1-af9b5e683914" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
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
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.005">
            <matter xsi:type="esdl:Material" id="faac539b-4b7c-43f8-abcd-f08fa2652b7b" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0587">
            <matter xsi:type="esdl:Material" id="d23b4eeb-a419-4c16-bc7e-280a76116f04" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0048">
            <matter xsi:type="esdl:Material" id="a2b91e8d-471d-4276-a8f6-4efb01054b4e" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe3_ret" diameter="DN150" length="393.93" innerDiameter="0.1603" name="Pipe3_ret" outerDiameter="0.25" related="Pipe3">
        <port xsi:type="esdl:InPort" id="d8daa8a8-f473-4a23-8732-a8ff6379cd67" name="In_ret" connectedTo="588fd953-2a7d-4549-a89c-80b27e24ab2c" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="51c50f83-1e9f-4db1-b8d4-7db3d01807e6" name="Out_ret" connectedTo="8411ac81-9c78-4d11-8a69-f95c26f71033" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="f904f2db-1419-462a-a39c-8fe62ae37dae" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe3_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="3e3167ad-ba56-465d-adb0-1080929c4113" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="e2cc38ef-1065-4ddb-9c2f-4a47d54adc39" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe3_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="acd59968-2010-43d2-bb50-b1e6503704d8" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="bd2e8e2f-e7bc-415c-834e-cd863fd52975" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe3_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="602ebcba-74b7-4f5c-9787-1538f0d75810" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="65c08c18-5a78-4b78-9b37-133510432e1d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe3_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="7084e851-cd0f-4f17-baf8-16be0bfa3eee" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3548106114555685" CRS="WGS84" lat="51.994695415007946"/>
          <point xsi:type="esdl:Point" lon="4.3546064294682" CRS="WGS84" lat="51.994629353688985"/>
          <point xsi:type="esdl:Point" lon="4.353487421528576" CRS="WGS84" lat="51.994525306914014"/>
          <point xsi:type="esdl:Point" lon="4.350767918332793" CRS="WGS84" lat="51.994048009879315"/>
          <point xsi:type="esdl:Point" lon="4.350572848784311" CRS="WGS84" lat="51.99419169498909"/>
          <point xsi:type="esdl:Point" lon="4.35049010343325" CRS="WGS84" lat="51.99427096933502"/>
          <point xsi:type="esdl:Point" lon="4.350150066040208" CRS="WGS84" lat="51.99492002276327"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="fa85538e-ebfa-4bce-8386-04980e793e18" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="3bafa031-f40f-42fc-b409-e35fffe5f457" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="893337e3-58f1-4fb4-8c25-68d71b11fb71" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe4_ret" diameter="DN150" length="484.9" innerDiameter="0.1603" name="Pipe4_ret" outerDiameter="0.25" related="Pipe4">
        <port xsi:type="esdl:InPort" id="8312b1b6-b753-4caa-8dfe-9dc834067484" name="In_ret" connectedTo="2cdce875-65f6-4ce9-b7dd-c6438b24da2e" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="f2d10d3d-0064-4cb8-bd02-ae507bd5f3df" name="Out_ret" connectedTo="e6a7a2e5-acb6-4084-b3ec-f0df5bbab853" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="a3bed848-3da4-4094-93d7-29623f290df4" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe4_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="91d07033-429a-4fdd-8af9-ddd67beeba04" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="817e5403-13a0-4ec9-9831-edfc83bbafce" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe4_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="e13413b5-a09f-496f-9a47-19e07c8e34ee" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="78c71d26-d3fd-430c-a4a6-0523e064bbf1" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe4_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="9443da34-78cf-4f54-a22d-ef1dc01a92f8" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="5c517320-1377-4632-8117-7f4491af8057" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe4_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="09bcd5b0-4e0e-463e-b487-56d67aebbf6d" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.359204849310848" CRS="WGS84" lat="51.9964608676461"/>
          <point xsi:type="esdl:Point" lon="4.358874341118289" CRS="WGS84" lat="51.99634031041962"/>
          <point xsi:type="esdl:Point" lon="4.357662636276866" CRS="WGS84" lat="51.99647242791106"/>
          <point xsi:type="esdl:Point" lon="4.356760662275853" CRS="WGS84" lat="51.99632049276227"/>
          <point xsi:type="esdl:Point" lon="4.357388559599185" CRS="WGS84" lat="51.995296568531046"/>
          <point xsi:type="esdl:Point" lon="4.3548106114555685" CRS="WGS84" lat="51.994695415007946"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="fa85538e-ebfa-4bce-8386-04980e793e18" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="3bafa031-f40f-42fc-b409-e35fffe5f457" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="893337e3-58f1-4fb4-8c25-68d71b11fb71" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe5_ret" diameter="DN150" length="223.2" innerDiameter="0.1603" name="Pipe5_ret" outerDiameter="0.25" related="Pipe5">
        <port xsi:type="esdl:InPort" id="ab88819c-46a1-423b-8db8-6b3019fe592f" name="In_ret" connectedTo="525a8a13-4931-4d8d-bb60-adb555b02401" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="8a29b3c1-cd96-43e0-b918-22551a2d139d" name="Out_ret" connectedTo="e6a7a2e5-acb6-4084-b3ec-f0df5bbab853" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="9a2e18d1-1669-45eb-ad31-255c533f474c" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe5_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="04178c57-e165-4349-a17a-65d0880d1aae" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="f13b78d5-40e8-4947-afe4-419c82e68e8a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe5_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="dea7bdbd-a1e8-4fd8-8691-13c280032653" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="3d5183d4-ab87-4310-9e4a-58c9083a8af6" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe5_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="4a594dea-9642-4183-b4a5-24aa58eaf79c" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="e2e4a7af-9073-442b-a5f6-87031194f10f" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe5_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="c9a5638a-eaff-4db7-b4f4-53af0bbe3fb1" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.355959726802834" CRS="WGS84" lat="51.99281923562559"/>
          <point xsi:type="esdl:Point" lon="4.3548106114555685" CRS="WGS84" lat="51.994695415007946"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" id="fa85538e-ebfa-4bce-8386-04980e793e18" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" id="3bafa031-f40f-42fc-b409-e35fffe5f457" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" id="893337e3-58f1-4fb4-8c25-68d71b11fb71" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe6_ret" diameter="DN250" length="1690.3" innerDiameter="0.263" name="Pipe6_ret" outerDiameter="0.4" related="Pipe6">
        <port xsi:type="esdl:InPort" id="e0c29235-31bf-47b7-851f-1c09449aba2b" name="In_ret" connectedTo="2554a536-e0fc-47ba-af67-94be7eaeb643" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="95aaf0a1-5641-48ad-bc84-23e0e189c8bf" name="Out_ret" connectedTo="c97aaf10-6edc-4518-9339-d8ca7cc0d795" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="b78b3cf8-c0c8-4fc5-8749-04587613a9c6" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe6_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="55fceb3b-75f7-46d7-9ca9-23cbea0a69ee" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="6f3fed96-5b0e-4800-85f9-9d7231dd043b" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe6_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="dd81b3cb-2a6b-4492-973f-5b0e4d94b2a4" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="81df368e-3d4b-480d-95ae-5a1ce357d772" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe6_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="586c9df1-6099-4eb7-adb9-5334fc22d446" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="cef13af3-2353-48a9-892f-4b3f3f9d16ba" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe6_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="761b2df1-09a8-4ff1-99a0-cff60340fbb8" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
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
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.005">
            <matter xsi:type="esdl:Material" id="faac539b-4b7c-43f8-abcd-f08fa2652b7b" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0587">
            <matter xsi:type="esdl:Material" id="d23b4eeb-a419-4c16-bc7e-280a76116f04" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0048">
            <matter xsi:type="esdl:Material" id="a2b91e8d-471d-4276-a8f6-4efb01054b4e" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe7_ret" diameter="DN300" length="403.93" innerDiameter="0.3127" name="Pipe7_ret" outerDiameter="0.45" related="Pipe7">
        <port xsi:type="esdl:InPort" id="1a0c09e4-00da-40fd-a96f-6def4dc207d9" name="In_ret" connectedTo="ba357584-609f-4cf2-aedd-0fac5c8ceade" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="53bf9474-b529-4831-bee0-5bdfa44c8635" name="Out_ret" connectedTo="c97aaf10-6edc-4518-9339-d8ca7cc0d795" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="e3792a53-95fc-4777-8343-3f23a5fd6ade" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe7_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="98ca736e-b14a-49e4-96a9-11f28bf9f098" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="7f8000fa-46ae-4000-9c06-9357ca3b8a3c" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe7_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="fbe179e8-bced-4bb4-b193-83e5ceea6379" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="1303c0b2-afad-492d-971d-3b346e95811b" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe7_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="e8c9a111-4454-48ae-83c1-c9afb7abfa58" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="3cf26f16-b176-43f9-9b22-c3b67eb57b92" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe7_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="b46a0196-19a8-4f11-9ae3-e4c6bd17eacd" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.358033875102766" CRS="WGS84" lat="51.98942341528986"/>
          <point xsi:type="esdl:Point" lon="4.357225150280455" CRS="WGS84" lat="51.990665496177705"/>
          <point xsi:type="esdl:Point" lon="4.35612974289599" CRS="WGS84" lat="51.99250212711829"/>
          <point xsi:type="esdl:Point" lon="4.355959726802834" CRS="WGS84" lat="51.99281923562559"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe8_ret" diameter="DN200" length="104.18" innerDiameter="0.2101" name="Pipe8_ret" outerDiameter="0.315" related="Pipe8">
        <port xsi:type="esdl:InPort" id="e900287d-ee43-41c8-8553-4adf0ba258b7" name="In_ret" connectedTo="f0fbe6cf-7439-4a57-9137-c4452e3c7dda" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="309cd564-3412-4022-a6d0-ae705f25be6f" name="Out_ret" connectedTo="f786a7bf-f26b-4a30-9e21-3fec05412c64" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="d3ed33cb-a17d-47de-b69b-ced067f4a9c8" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe8_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="86273d23-1ecc-49bd-8001-6240e943030e" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="1c06ed07-0e54-4d1f-97e8-f603b0bd2b24" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe8_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="4ed3e173-0a83-4bc5-bfba-e10df83f6a5c" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="70dfc7c5-d2ad-4c0c-929d-049d1e4036e5" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe8_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="dfd032d0-5194-402b-8cee-547ead9fc712" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="41a85378-6994-4113-afa6-d326ae03d39a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe8_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="b0252c7c-0c81-4405-8818-b8b32d8429c0" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3588733626863565" CRS="WGS84" lat="51.9889212877054"/>
          <point xsi:type="esdl:Point" lon="4.358438304656425" CRS="WGS84" lat="51.98882218291161"/>
          <point xsi:type="esdl:Point" lon="4.358033875102766" CRS="WGS84" lat="51.98942341528986"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" id="930aa5cf-b76e-4049-afa7-ea79445faf55" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe9_ret" diameter="DN350" length="53.2" innerDiameter="0.3444" name="Pipe9_ret" outerDiameter="0.5" related="Pipe9">
        <port xsi:type="esdl:InPort" id="3c52ca3a-e59e-4fff-a451-fc110907d9aa" name="In_ret" connectedTo="c0bdb043-c1ec-455f-92f2-eabbbcb8580a" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="c52483a0-d143-4106-a43b-746311baefe2" name="Out_ret" connectedTo="8b9b3b28-f224-4642-8b37-f84fcf540c2e" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="fff80ff7-84a0-4f2a-98db-2ebc9486489f" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe9_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="4ca13366-6c6f-4926-ae2f-57e91fb924c7" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="cae7fcbb-d426-46da-9da4-7cfe2a7a1c1d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe9_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="f3662759-a800-4140-acd9-f7f0beaa610c" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="7aea681f-bc1a-4b49-9859-a3a64e6acb04" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe9_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="3591362c-42f6-494b-b59e-8d81c9fd8e35" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="4fc0c1fe-b5d9-45c3-8cde-e0158a83bb5e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe9_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="21ef30bb-5f0f-4431-94d0-e7f0513e7d3d" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.367928468290946" CRS="WGS84" lat="51.99916480455774"/>
          <point xsi:type="esdl:Point" lon="4.367938710740932" CRS="WGS84" lat="51.999168262107005"/>
          <point xsi:type="esdl:Point" lon="4.368502661385395" CRS="WGS84" lat="51.9994879036446"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="d2298eee-877b-45e1-8b67-cc63fc2f6c69" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0666">
            <matter xsi:type="esdl:Material" id="cd3d98cc-58f2-4683-8523-7e4183c7e685" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="3979c7f7-6acf-4a32-81bb-8ed118357c6b" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe11_ret" diameter="DN350" length="102.7" innerDiameter="0.3444" name="Pipe11_ret" outerDiameter="0.5" related="Pipe11">
        <port xsi:type="esdl:InPort" id="03f16a92-b24d-4e11-b730-83b703517cad" name="In_ret" connectedTo="b57116bc-1f78-402c-84c0-fc6e5846cf8a" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="1207cf4b-308c-4466-b1c8-9e997e988fff" name="Out_ret" connectedTo="81a1bb4a-1701-4491-86d4-2c2f0b858aa2" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="b88a32b5-e160-45e6-afae-941f90123545" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe11_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="0a3b9d9b-1f0a-4259-a127-ece5735e2984" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="32398850-5825-4ad0-88ed-2a4bc9d1d461" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe11_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="2569578d-3609-49c7-a178-557131378b15" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="8cd5a19e-e5dc-4705-9cd3-5edc188b8092" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe11_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="49ba91b2-dfcc-42f1-b22f-9f442049d2c9" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="af73883a-2e53-46d2-9afb-2c40b83fc793" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe11_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="4163f313-7a12-4f7d-a54c-ef6a3c962b1f" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.368405699422867" CRS="WGS84" lat="51.998285701083724"/>
          <point xsi:type="esdl:Point" lon="4.3679277752889245" CRS="WGS84" lat="51.999160108482904"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="d2298eee-877b-45e1-8b67-cc63fc2f6c69" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0666">
            <matter xsi:type="esdl:Material" id="cd3d98cc-58f2-4683-8523-7e4183c7e685" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" id="3979c7f7-6acf-4a32-81bb-8ed118357c6b" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe12_ret" diameter="DN250" length="1695.06" innerDiameter="0.263" name="Pipe12_ret" outerDiameter="0.4" related="Pipe12">
        <port xsi:type="esdl:InPort" id="15cec74a-ff3d-4349-99c1-b63e54984020" name="In_ret" connectedTo="ba357584-609f-4cf2-aedd-0fac5c8ceade" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="a2336831-a837-4c16-8b13-5ccaf7ad4b28" name="Out_ret" connectedTo="9499403a-8dcf-4c77-944d-a56829b8ff7e" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="58ce3cb6-65af-4f18-adcd-8e86453f2760" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe12_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="23e3c03d-3743-4ca1-8c0e-3b0d7b5ca140" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="e9d509d2-9059-4296-ab9c-307a9cb16702" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe12_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="aa330082-fbcb-4f79-9fff-075735f34a96" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="3f19860a-d3c6-45bc-b7f9-3edf1ad2efac" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe12_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="1515e906-e08d-4c9f-b0e8-b162f3f62c23" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="35680d63-b05a-4e81-a4d8-3167707c629e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe12_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="a8229be2-0f3b-4aaa-bc8f-59911928f2f3" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
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
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.005">
            <matter xsi:type="esdl:Material" id="faac539b-4b7c-43f8-abcd-f08fa2652b7b" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0587">
            <matter xsi:type="esdl:Material" id="d23b4eeb-a419-4c16-bc7e-280a76116f04" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0048">
            <matter xsi:type="esdl:Material" id="a2b91e8d-471d-4276-a8f6-4efb01054b4e" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe13_ret" diameter="DN200" length="285.9" innerDiameter="0.2101" name="Pipe13_ret" outerDiameter="0.315" related="Pipe13">
        <port xsi:type="esdl:InPort" id="3e844e19-0eff-47e7-af3b-d95e29d0c7f8" name="In_ret" connectedTo="6a4e4835-ddee-4652-9cfa-2c8d49821d6f" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret"/>
        <port xsi:type="esdl:OutPort" id="b60cdb49-a624-4274-8daf-c769bc46d984" name="Out_ret" connectedTo="9499403a-8dcf-4c77-944d-a56829b8ff7e" carrier="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret">
          <profile xsi:type="esdl:DataTableProfile" id="9547035a-cf00-43c7-a20e-0916f2db0b39" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe13_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="5cea4af4-b408-446a-b43f-0fd030b8929a" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="2b971fc2-9f6d-446e-973e-f5a845635601" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe13_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="8ff8ab32-8b16-45ee-828d-064e18d53998" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="e85e6805-9042-4f0b-9fe4-e9d71fe42aed" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe13_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="041fa597-e7ac-4198-a7d4-5ac7cf3c25a9" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="0c57a0b0-f4a3-4054-8cb3-cdec98051049" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe13_ret'" configuration="d07c1b5b-db46-4bc0-83b6-c132fcdd65d8" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="47162470-62dd-4dea-be60-b52de8708c43" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3721244417482765" CRS="WGS84" lat="51.99937396000665"/>
          <point xsi:type="esdl:Point" lon="4.371998986068785" CRS="WGS84" lat="51.99922038334009"/>
          <point xsi:type="esdl:Point" lon="4.368405699422867" CRS="WGS84" lat="51.998285701083724"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" id="930aa5cf-b76e-4049-afa7-ea79445faf55" name="steel" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b" name="PUR" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3" name="HDPE" thermalConductivity="0.4"/>
          </component>
        </material>
      </asset>
      <KPIs xsi:type="esdl:KPIs" id="689feea5-e952-406b-b16d-2ace07b48543">
        <kpi xsi:type="esdl:DistributionKPI" name="High level cost breakdown [EUR] (yearly averaged)">
          <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO"/>
          <distribution xsi:type="esdl:StringLabelDistribution">
            <stringItem xsi:type="esdl:StringItem" label="CAPEX" value="3582808.947400001"/>
            <stringItem xsi:type="esdl:StringItem" label="OPEX" value="4767486.5443137875"/>
          </distribution>
        </kpi>
        <kpi xsi:type="esdl:DistributionKPI" name="High level cost breakdown [EUR] (30.0 year period)">
          <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO"/>
          <distribution xsi:type="esdl:StringLabelDistribution">
            <stringItem xsi:type="esdl:StringItem" label="CAPEX" value="107484268.42200002"/>
            <stringItem xsi:type="esdl:StringItem" label="OPEX" value="143024596.32941362"/>
          </distribution>
        </kpi>
        <kpi xsi:type="esdl:DistributionKPI" name="Overall cost breakdown [EUR] (yearly averaged)">
          <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO"/>
          <distribution xsi:type="esdl:StringLabelDistribution">
            <stringItem xsi:type="esdl:StringItem" label="Installation" value="3333.3333333333335"/>
            <stringItem xsi:type="esdl:StringItem" label="Investment" value="3579475.6140666674"/>
            <stringItem xsi:type="esdl:StringItem" label="Variable OPEX" value="117486.54431378772"/>
            <stringItem xsi:type="esdl:StringItem" label="Fixed OPEX" value="4650000.0"/>
          </distribution>
        </kpi>
        <kpi xsi:type="esdl:DistributionKPI" name="Overall cost breakdown [EUR] (30.0 year period)">
          <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO"/>
          <distribution xsi:type="esdl:StringLabelDistribution">
            <stringItem xsi:type="esdl:StringItem" label="Installation" value="100000.0"/>
            <stringItem xsi:type="esdl:StringItem" label="Investment" value="107384268.42200002"/>
            <stringItem xsi:type="esdl:StringItem" label="Variable OPEX" value="3524596.329413632"/>
            <stringItem xsi:type="esdl:StringItem" label="Fixed OPEX" value="139500000.0"/>
          </distribution>
        </kpi>
        <kpi xsi:type="esdl:DistributionKPI" name="CAPEX breakdown [EUR] (30.0 year period)">
          <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO"/>
          <distribution xsi:type="esdl:StringLabelDistribution">
            <stringItem xsi:type="esdl:StringItem" label="HeatingDemand"/>
            <stringItem xsi:type="esdl:StringItem" label="GeothermalSource" value="40800000.0"/>
            <stringItem xsi:type="esdl:StringItem" label="ResidualHeatSource" value="45100000.0"/>
            <stringItem xsi:type="esdl:StringItem" label="Pipe" value="21584268.422"/>
          </distribution>
        </kpi>
        <kpi xsi:type="esdl:DistributionKPI" name="OPEX breakdown [EUR] (yearly averaged)">
          <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO"/>
          <distribution xsi:type="esdl:StringLabelDistribution">
            <stringItem xsi:type="esdl:StringItem" label="GeothermalSource" value="2845633.498763232"/>
            <stringItem xsi:type="esdl:StringItem" label="ResidualHeatSource" value="1921853.045550556"/>
          </distribution>
        </kpi>
        <kpi xsi:type="esdl:DistributionKPI" name="OPEX breakdown [EUR] (30.0 year period)">
          <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO"/>
          <distribution xsi:type="esdl:StringLabelDistribution">
            <stringItem xsi:type="esdl:StringItem" label="GeothermalSource" value="85369004.96289696"/>
            <stringItem xsi:type="esdl:StringItem" label="ResidualHeatSource" value="57655591.36651668"/>
          </distribution>
        </kpi>
        <kpi xsi:type="esdl:DistributionKPI" name="Energy production [Wh] (yearly averaged)">
          <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="ENERGY" unit="WATTHOUR"/>
          <distribution xsi:type="esdl:StringLabelDistribution">
            <stringItem xsi:type="esdl:StringItem" label="9684c4fc-df93-4ead-8c10-b7b84eef895b" value="57816749381.61591"/>
            <stringItem xsi:type="esdl:StringItem" label="49c218d4-f760-4ec5-87ac-025edb5b7ade" value="231630693.81948748"/>
          </distribution>
        </kpi>
      </KPIs>
    </area>
  </instance>
</esdl:EnergySystem>
