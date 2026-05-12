<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="Delft_T_GrowOptimized" id="95d4a3e3-3834-4ab1-91aa-c4b0342ff5b6" esdlVersion="v2401" description="" version="24">
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
    <dataconfigurations xsi:type="esdl:DataConfigurations" id="2a443ccd-6d6f-451b-b890-124e03a508c9">
      <configurations xsi:type="esdl:DatabaseConfiguration" id="236951ed-9307-4903-80ee-af0da59e2eb9" database="95d4a3e3-3834-4ab1-91aa-c4b0342ff5b6" type="POSTGRESQL" host="postgres" port="5432"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="d60e179c-91ee-445f-976f-619c154c95c0" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='a11c72f9-a5e8-4e33-9504-7a44a29b9861'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="974b8687-9dce-4746-a3b4-4a7c73e0314c" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="a5c541ec-ef23-434b-813d-317c18e91217" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='a11c72f9-a5e8-4e33-9504-7a44a29b9861'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="f44cfbe9-27a8-4ec8-a0bc-b09e92f44df8" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="7dc00c5f-f653-45a1-b68e-764b0e842994" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='8cf7ab21-57c6-4cbe-bb09-c85dad625d58'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="705b6754-c296-498a-a05a-c77230587651" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="d457be19-d8b3-4deb-96b2-647067ee276a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='8cf7ab21-57c6-4cbe-bb09-c85dad625d58'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="65494117-7982-4de1-9c01-b747a6325381" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="e7fb3529-9e12-4afa-b3fc-3b948edd9744" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='5c8d8519-4f57-475f-977d-103eb34a05f4'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="a78ba509-5687-4d9c-981e-cc42956101ed" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="c4c66560-07f6-4b67-9f25-fb2a6ab2e2f5" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='5c8d8519-4f57-475f-977d-103eb34a05f4'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="fd5f0370-fdf0-4fda-be0e-522ca699e2fc" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="fbed221d-f2b2-4056-8489-0053a8e28a1a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='9a85a5a3-d9e6-46a5-ad93-b82bae94a610'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="3e74e4b0-ee6d-4b82-86cf-4567fbcc0f98" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="e5f6ac93-8a85-41fc-96e0-9bccb773e64a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='9a85a5a3-d9e6-46a5-ad93-b82bae94a610'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="3e13fd93-f098-4442-a78c-fb645507e71d" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="fdd2fc45-4901-4da0-8634-442e0bfd7c1e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='79d559de-54f2-40b9-af9a-c62f499db523'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="5421a51a-abcc-4d81-8352-f6828b57661e" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="bf9729d3-e351-488f-bd20-708602f08d84" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='79d559de-54f2-40b9-af9a-c62f499db523'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="9b22d5b2-a302-43c0-a624-6e023d209435" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="bf687833-5691-428f-bc93-e09ef174cbcc" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='9684c4fc-df93-4ead-8c10-b7b84eef895b'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="33559b8b-81d2-4a87-b3a2-a6fee43a93f9" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="bc75645d-ccc3-4c20-9614-a35e623e5036" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='9684c4fc-df93-4ead-8c10-b7b84eef895b'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="f7c0e3e5-5a3c-4867-89fd-ed05acd4d78c" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="cce7145e-2531-48d3-9cf5-ee571dc2d951" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='49c218d4-f760-4ec5-87ac-025edb5b7ade'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="034e1b7f-65ca-434d-9d8c-325a3d21ab36" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="bc493a55-3de0-4ad8-8781-9bdd2739afc6" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='49c218d4-f760-4ec5-87ac-025edb5b7ade'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="4dc47c18-6d6f-4243-8447-925204517bd4" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="df2c650a-c567-42c2-94d4-d3318d15f218" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe1'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="012b2cee-fcec-41f2-b74e-a0a59ed4173e" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="cfdd719b-7691-4dc1-b1f3-17baee24cf67" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe1'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="ad26c75d-c4bd-4c50-b424-6f1e5db2837b" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="c6c3b35d-d7bd-44c1-86e3-76955a25e744" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe1'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="6ebe3d79-feb0-4f0c-9f9d-5e2c1182cbfd" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="045d3d24-7184-480c-b52f-477c32f2e523" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe1'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="a5590f53-9b95-4a7e-af5b-7d432a539bc0" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="d6e1a7f9-76d8-4ccb-b17c-04ba60797d9f" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe2'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="76419981-7e6c-43d4-ae03-e30e53ccd9ee" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="f50cf1d7-2a65-472b-ad2c-2d133367d9ef" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe2'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="0d0f11a0-7b88-4f7e-8f6b-4835c4e6fd94" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="212f318e-f153-44b9-b04c-6e4b41ce4f16" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe2'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="79a471e5-3f4d-4e66-a862-865909f941c2" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="c07282b9-b27d-4b4a-90ed-eee629739d7b" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe2'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="3ec7262e-c998-4f69-995d-8bd63b18ab38" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="06c4c9b6-5e60-4bd1-b71b-bf01f4c712e9" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe3'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="2002974d-d27c-4185-8cba-ecc44a84b343" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="21c87a93-b5a7-4db8-b58c-2f8bc2802b34" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe3'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="02c53534-7036-4873-82ff-d52f1333158d" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="4c5b1cf5-bf5a-4c56-8875-5d23973dabad" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe3'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="04070172-89f7-41ac-83a1-70c2bb356657" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="a9aac24c-1344-4a64-a194-cca54daaf7e2" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe3'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="304b6a9f-45c0-4465-861c-4a97141545e9" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="b114cecf-3aee-4a6e-bfb2-9c760521426a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe4'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="17f812b1-0ca9-4c7e-94e4-9604a2882803" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="d1766183-1d5b-49e0-ac3e-3c2198a7b83a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe4'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="b73e0f82-9557-40c1-b813-de601a5bbdec" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="c30ffd96-83df-473b-8f71-7a43cdf7972b" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe4'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="4f186216-407b-4143-b9a0-f2b5f6bf97c3" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="3f86906e-6e9d-43db-be4a-0f37caddc837" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe4'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="1dd91324-df98-408c-998c-9d00699f9696" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="a03e5502-0ae6-4a7e-9e49-8dd13f06bc32" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe5'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="a6e77c63-b52d-48b6-9f64-9ecb7b52b3b1" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="5bb662d5-b154-4b47-af31-226959b119e1" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe5'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="0183c8bb-0add-4374-98e3-f49068ad4138" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="3f2e56f5-6de8-49c0-89f4-9e3c1f0c51bc" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe5'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="f2f61399-315c-4cb7-8861-164be45896dd" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="e7cccc33-4b1a-4a48-9aa9-74c10ecdfb29" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe5'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="5e908210-17d4-4719-8741-8d82a20e8517" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="3e93ea22-1767-436c-8e98-eeac07958f06" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe6'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="4cafa489-b034-4896-8c18-b643b643e07e" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="78a43041-9b09-4055-8261-04bc797ced4b" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe6'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="d62cb779-4b5e-4e71-9a14-f277bb056e3d" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="355435af-2a1f-4648-9ce0-aeeccd84d2c0" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe6'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="d7252832-0f62-4670-9394-d90ee4dab071" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="fb61c1d4-ce71-4b13-8db4-de0125eee7fe" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe6'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="c76bc696-25a8-42e9-9896-6123e8d52d92" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="16768593-167f-4e19-9662-54cf0c9dab06" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe7'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="a164ddb9-4864-4642-b672-138dacbd5360" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="fa05aec5-4226-489f-9fd5-c921cd553a1a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe7'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="9f98b0cd-bf57-44e6-bfbe-5fba7469bbc5" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="2a3475a1-656f-4b7d-8c91-b8e765b4445b" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe7'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="c76df512-8126-470f-8d0b-4a813efa83f3" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="b2f57172-3df1-4d35-92bc-153dd7d949b0" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe7'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="2ff63e76-9e77-4b68-9e5d-569ff0a1f942" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="f8c68059-e1c9-402c-810a-3187c4ebf58e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe8'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="e8825702-2da6-459d-8945-6b61784e5dbb" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="2ca0421f-5247-46a6-bf97-4b5798e6fa4a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe8'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="95e28b65-b666-4977-81d9-a7a04ba1d736" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="a1206d0c-acf6-4ce4-bc7a-300189aa000d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe8'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="a39cb429-814a-4b6b-a2a4-055c8dc4f6ab" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="018557fc-6f38-40e4-8b4e-cfa64638870f" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe8'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="4fab380b-8d97-40d6-a36f-71f9e4fa1419" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="f4ddd056-4580-4095-9d9a-a88b86c91d8c" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe9'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="d903c27d-14f2-4e63-ba03-5b51dbed6491" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="9db333de-35ca-4ce8-9a07-4b4a32dcd14a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe9'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="e56246ec-ce1d-4055-a141-4b5b5391e51f" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="ba54dc5a-8a91-443c-85cf-60715d42b56f" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe9'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="fa18af96-d519-48a4-bafd-7eb4e08fa99a" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="c9d15efc-d450-4f1e-94db-c7cbec800435" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe9'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="a165592e-80c0-4cf0-a9ea-77020416515a" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="f972317d-da16-45a9-99c4-afb211cb4230" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe11'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="9da336b0-9476-4655-a824-99f047192315" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="128c9dc5-5224-486f-bd53-0141ab57bfff" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe11'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="3cc18181-821c-4c7b-bc7e-8d0723dda8f6" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="9bf8dbab-5fda-4ecd-a898-072b2da3e2a2" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe11'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="7f0a5972-cf10-4064-bc6e-841c82b348d9" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="2b21ffab-e8c4-493b-b13b-ba8a73eb14be" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe11'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="8b53edbf-a9ad-486b-a316-c7525a542b6f" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="597c2ac2-3412-4611-a9fb-9e2c3c97b8f0" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe12'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="bda808eb-2aa2-4908-a758-c6e9a76169ab" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="128525f9-2b04-4cc8-b1e2-33e2fe45ad7d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe12'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="fc1ea5ac-eb22-4a2b-b226-8e69e666f6a3" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="5adc1b5e-dd84-4adc-a153-f88d0b1b0282" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe12'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="0381f5a2-6d1d-472f-b24d-c39912366717" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="26f7323e-3b2d-43a5-945d-f7a4267aaafb" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe12'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="d0595f19-c389-4a01-880a-81863056fded" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="2ac2e3e6-f9ba-4caa-9cba-269e19ebd213" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe13'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="6dc98606-95b7-464e-9aa5-1cc10d6a5b94" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="c007899f-9eef-4cdb-8ad7-88349a4cd151" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe13'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="4ebb3579-265b-499d-8cf4-aef81329b161" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="4b7260d0-ae95-4daa-919e-ab3fcade07df" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe13'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="e5516704-92ba-41e8-adbf-ed8c3e32faf5" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="690a3291-8f3d-4c02-81eb-8b4238ae6889" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe13'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="95570da3-5f12-4407-bcd6-367b3756451e" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="de76fb7b-9174-4f7f-b63b-08f1d7e2a70e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe1_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="43db2ad0-c07e-49ad-b722-ec83c7e0367b" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="0f035754-b586-4d8b-af26-a6c24306a30e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe1_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="8b24c884-741b-49bf-b21e-29bec722eb42" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="34c29371-00a8-4c86-9d85-4d63e65b43b7" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe1_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="13176312-c3cb-467c-b203-8b49386ec166" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="bc6ac2b4-c543-459e-81f1-b5683b937909" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe1_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="b344495f-2acf-40ac-a585-cf540b5bf663" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="c57e0d59-1548-4344-845b-742b8c22368c" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe2_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="565c068e-3430-4a96-b87e-d6e2c4da0524" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="b43e382a-9f67-4b96-9b24-5a9b3f7e8451" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe2_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="6fc6741d-e328-4a8b-a26e-8e377ef923ea" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="2c265c6b-6347-4919-aea1-da0f3687bcfd" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe2_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="71f5f557-fc46-4816-9bae-2455b1164f17" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="0ed22a64-b321-4d9c-bba0-554efc6d2eae" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe2_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="dec55050-fb2b-42c7-b758-9bf989a7390c" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="9d76f596-ae15-437d-b7dd-074b165c17f9" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe3_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="9e7e197c-5f8f-46c6-a48c-b06c2871a798" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="b530bf6d-7533-4630-8542-1f95aed5b39c" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe3_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="78383ce0-92d7-42cb-b7d8-26f6979a2dfc" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="ce1bc054-1a70-4731-bdef-b66bf14abb17" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe3_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="60a3ca21-8b00-426d-8371-8e6f8b2f5e31" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="bba9982e-5e7a-47d3-87f1-8ca3cabaaac6" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe3_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="2c9bde02-a8a2-467b-9cc5-7adc73951cf8" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="1b6e08ee-dfa4-4972-9bc6-f7ce6cdd828d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe4_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="5cbaeb0a-940b-4a0d-bfd0-d5bc27f99972" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="6bcc41d3-8db1-4e15-b216-9d79e44a2447" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe4_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="1547c984-24c8-4472-b7c1-fe5d364f2814" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="0db32991-465a-462c-860f-f39a52fa77e4" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe4_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="dc5b589e-3428-4b3a-b1ee-587d78937fc2" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="15471161-e7f3-4569-89bb-2364f696ca4d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe4_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="ded4df6f-c94c-4963-9dd3-09fb20754b68" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="db33a338-35fc-41f4-99cc-740c861db731" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe5_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="190d3763-5e77-431e-9b39-cee03561292c" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="46c9ad04-6c13-4ad8-b7bd-e0eb45b8e806" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe5_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="90d7d910-2fad-4490-9ca1-be6971d0ff26" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="38991a63-af65-40b0-9abc-aee5b6002f38" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe5_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="3b9f6305-9f92-43b8-8846-d976a1614de3" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="be406ce9-48e1-4d9e-956f-4957c1e43984" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe5_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="8f328e07-b4ae-4530-8e18-02f0227ef2b7" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="2f4de7e6-09b9-4a77-952f-60c7f9ddd3c9" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe6_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="fb10205e-40e4-4814-ad1e-08150021dfe0" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="523bebd3-b082-4465-aa4e-b3a1d6889b43" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe6_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="6bbdec0c-e83b-495c-80be-77672f458a40" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="0a2f76ef-c8db-4616-b0c9-1a1384cb5739" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe6_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="bdd08a10-56f4-449f-b71e-124191d06de4" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="c34a0b5b-4686-41d2-aded-5e0100ddacbc" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe6_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="4170a161-e6c8-4f56-9776-8dcd085260d9" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="d614ed30-e660-4932-922b-924707ba99fa" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe7_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="87be71ab-a34b-43ef-a160-b36caa1624c1" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="ebe99cb0-8ab2-4481-bccb-5fd8c338100b" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe7_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="bea3436f-bc89-418b-b821-d8a94576dc3d" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="8137de06-a603-4374-82fa-5709dbbb7e80" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe7_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="e5c62043-fa7b-406c-b3bf-807689645cd0" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="1328eb7c-f10c-4157-a606-8e1d7bb80db5" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe7_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="5ece43cc-c8aa-479f-9114-a51f19c078dd" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="b5481c89-d4ec-49e6-8466-278766f496ae" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe8_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="3f2723b7-8c7d-4224-af6d-52d7a3f98780" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="d7d92c17-3e08-4171-a716-17351ad68a4c" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe8_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="400a3350-d00c-43b6-bdff-aa2e1cf15591" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="750902a9-5ff8-4325-a2bd-7bdc0e749b2c" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe8_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="ac50e9df-f764-493d-8032-e0689a7f381b" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="eaf0d968-592f-4470-95bb-577ee1c1e403" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe8_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="69826121-7597-4908-9804-6a93b09e5117" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="641ebf0f-980c-4f9a-b735-a1bb091a1aaa" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe9_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="d7804eae-6732-441d-8ac2-b27295290ef6" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="d3c087a8-c124-456e-b2a8-a7a6e1f5fa52" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe9_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="641bb76f-941d-4aae-b48e-d1e68b70fdc2" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="7348c649-8cf4-4309-9c42-6b7f57a8ca7d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe9_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="c34e356f-6fde-411a-81f0-44f29309509c" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="b77d2540-7a9d-4707-b40a-f04bb1cae09d" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe9_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="e1adb885-e52c-4359-97ac-105a1ffc9d41" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="e0c706b7-78fc-4f0e-a364-476a22192bbe" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe11_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="89c8a8b2-d8c5-4535-817d-26d0420d8ee4" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="09e9db12-fb0b-4b82-a155-7f806904c0fd" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe11_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="c869c88d-6f60-4205-881b-2387c3988e0e" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="af676acb-232c-40c4-aee7-0427afbaebea" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe11_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="a863e0cc-121f-4dcc-a48a-cf6e4628c863" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="403614b9-75c1-4e83-aa5e-9e9423c2f405" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe11_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="204da84a-f3ac-4722-a182-1375010b5904" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="0ba6f3c9-c7dd-4e2b-981b-ccf156c96cbd" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe12_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="38b34bf0-32f1-4798-9a85-45323698e93f" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="a7470536-495f-41e4-9a05-fada6cbe63c7" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe12_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="da15aa47-6b2f-435e-92ff-9fcfabfb0fa7" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="5b1343f0-00fb-4d42-b658-30c6df32e4a8" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe12_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="66c3d46e-85bb-43b1-bda3-bcbf6c88e25b" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="96115a17-c645-4226-ad88-fdf74130a94e" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe12_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="9304842c-dab5-4855-afd0-2245b4ce9619" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
          <profile xsi:type="esdl:DataTableProfile" id="cd54ff43-3549-40b7-9ae2-c8691c8428c4" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="HeatIn.Q" filter="&quot;assetId&quot;='Pipe13_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.2"/>
            <dataSource xsi:type="esdl:DataSource" id="86723ae0-1c90-4f9a-b94f-18b1fb521f7f" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="fdc8139b-e5b0-40d7-bf0e-0f595d293f5a" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="Heat_flow" filter="&quot;assetId&quot;='Pipe13_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.3"/>
            <dataSource xsi:type="esdl:DataSource" id="b8bcec65-db0e-49a1-8cc3-ad7d6f3aed30" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="ddcbe448-b716-42fb-86cd-f64c5333cf63" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Velocity" filter="&quot;assetId&quot;='Pipe13_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="85b42b5d-7cc8-443c-92c3-ea187f0d9e66" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
          </profile>
          <profile xsi:type="esdl:DataTableProfile" id="e76bd9da-dd35-4dfe-add1-c1b714ec4712" startDate="2018-12-31T23:00:00.000000+0000" endDate="2019-12-31T23:00:00.000000+0000" tableName="58d6d5fc-8a6a-4a4d-9a9e-5992e18fe772_ret" columnName="PostProc.Pressure" filter="&quot;assetId&quot;='Pipe13_ret'" configuration="236951ed-9307-4903-80ee-af0da59e2eb9" profileType="OUTPUT">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="//@energySystemInformation/@quantityAndUnits/@quantityAndUnit.4"/>
            <dataSource xsi:type="esdl:DataSource" id="53bfd260-a680-4c82-93c4-9b39665dc194" name="Optimizer" description="This was created in the optimizer" type="MODEL"/>
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
      <KPIs xsi:type="esdl:KPIs" id="06609bf9-d949-4f26-9daa-30a70d90cd2e">
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
