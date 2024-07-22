<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="68d4018a-f6bb-4d61-9a56-c112c67222d8" name="NorthSeaEnergy" description="">
  <instance xsi:type="esdl:Instance" id="b7cfb436-0bd8-4ed4-8e9b-abd65a4e75dd" name="instance">
    <area xsi:type="esdl:Area" id="80076d07-1cc1-4f1d-9b27-4195b8e8c48b" name="NorthSea">
      <area xsi:type="esdl:Area" id="3ff7ce8e-be47-4235-9d31-6319456e8f1b" name="Hub_East">
        <geometry xsi:type="esdl:Polygon">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="54.541311" lon="5.16169"/>
            <point xsi:type="esdl:Point" lat="54.116186" lon="4.790348"/>
            <point xsi:type="esdl:Point" lat="53.662194" lon="5.271091"/>
            <point xsi:type="esdl:Point" lat="53.87281" lon="6.176204"/>
            <point xsi:type="esdl:Point" lat="53.876739" lon="6.213526"/>
            <point xsi:type="esdl:Point" lat="53.994596" lon="6.109419"/>
            <point xsi:type="esdl:Point" lat="54.187096" lon="6.001383"/>
            <point xsi:type="esdl:Point" lat="54.541311" lon="5.16169"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:WindTurbine" name="WF_DDW1" id="WF_DDW1" description="Hub_East" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="eef7410b-f948-4df0-91f9-093b71be6c20" id="dc0183f9-75e6-4dca-afd6-ad7a99147bc3" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="771c8c12-e306-439a-a88d-a5673f895eff" measurement="NS_OFWprofile_HE_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HE">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="c6db8799-ead5-4e22-87e0-c72fad288e63" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.3196331898551" lon="5.46688724627309"/>
          <costInformation xsi:type="esdl:CostInformation" id="c92d9e21-eb45-471f-a320-8668a3573ea4">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="1b7b3300-3ccd-45a1-881a-cdff99783239" name="WF_DDW1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_DDW2" id="WF_DDW2" description="Hub_East" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="aaba5184-c42e-4e24-a3f3-c45ebb329caa" id="affea88c-bb5f-4ed0-88fb-46c8ad15e027" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="03715097-8592-42b9-8d8c-0b23235e4b46" measurement="NS_OFWprofile_HE_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HE">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="2fe6701e-4276-48bc-a4ca-df77c201620b" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.3196331898551" lon="5.50688724627309"/>
          <costInformation xsi:type="esdl:CostInformation" id="0e03ebb2-2721-4beb-a8ef-f333c22c534c">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="15a6eb1a-1aec-49cd-ad6f-4065c49f3683" name="WF_DDW2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_DDW-West" id="WF_DDW-West" description="Hub_East" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="4d6cfbb0-7ad0-4c14-94eb-32be694615d0" id="68915d05-303f-45ef-958b-c6ff06dd4ccc" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="c266861e-7d23-4d2e-84eb-d2dbd92108c1" measurement="NS_OFWprofile_HE_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HE">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="8f9de92e-882c-4350-baa5-96118d309ffc" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.3606331898551" lon="5.44688724627309"/>
          <costInformation xsi:type="esdl:CostInformation" id="4bbad8ce-8df7-465e-8166-476d1bd73060">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="ed43007b-f6e1-4ac4-a2f7-ba56cfed1d36" name="WF_DDW-West_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA4_1" id="WF_WA4_1" description="Hub_East" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="07301e84-3006-4e7c-afca-e3d1190da58c" id="45805114-b2a8-4f87-b509-0c6835176ce6" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="6dd3324a-ffd8-4d6f-8dad-54774ce5ca0a" measurement="NS_OFWprofile_HE_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HE">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d44dc199-fd40-4a04-8672-e10030449d00" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="53.8430686888668" lon="5.51582580431392"/>
          <costInformation xsi:type="esdl:CostInformation" id="083f4222-2353-4df2-a933-002f0644c520">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="eec3ccc3-6613-4288-a08d-699f8e347ad9" name="WF_WA4_1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA4_2" id="WF_WA4_2" description="Hub_East" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="5b3bf1ac-486e-4570-87c8-00c10f394ff5" id="a4f4807f-6c72-4776-b428-a95b5b1b59d7" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="7c44d59d-0846-40d0-a9e5-c05746462eb8" measurement="NS_OFWprofile_HE_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HE">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="f61f2761-f98c-4007-877e-b643153e98b3" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="53.8530686888668" lon="5.61582580431392"/>
          <costInformation xsi:type="esdl:CostInformation" id="3526b887-d5dd-4063-82c6-f523c3ea0918">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="2e9192a4-11a5-4771-9282-3bde7a90cfd6" name="WF_WA4_2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA4_3" id="WF_WA4_3" description="Hub_East" power="1000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="97d3f5d3-061a-4a64-a117-7377b513a064" id="23c1f88e-196e-4ba9-9b4b-0caeafefd54d" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" host="http://influxdb" port="8086" id="602713fa-8105-4d14-9101-19edbea3813f" measurement="NS_OFWprofile_HE_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HE">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="0661c36e-9fa1-4d89-903a-d01cd65daf2e" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="53.8630686888668" lon="5.71582580431392"/>
          <costInformation xsi:type="esdl:CostInformation" id="0e00771d-211f-477a-8a0a-c9a35c3255e5">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="b9230c67-42b5-40f3-9f78-219f41ba91ce" name="WF_WA4_3_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_TNW" id="WF_TNW" description="Hub_East" power="700000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="8b6ca6ed-3572-4ee0-a54b-607faafe3062" id="a6fbc9df-cd1a-4f1e-b432-8a72139882c8" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="0.7" host="http://influxdb" port="8086" id="1545a741-8aa5-42ad-87aa-d0ec79d75f5c" measurement="NS_OFWprofile_HE_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HE">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="7770f623-ae6a-441c-96f0-12e3ae084dc5" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.0379496646664" lon="5.64306597749276"/>
          <costInformation xsi:type="esdl:CostInformation" id="6973d5f5-2e01-4219-aa74-e697a40a4cd4">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="7e1dba82-8df4-499e-a51e-bdb7dc3040f4" name="WF_TNW_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_Gemini" id="WF_Gemini" description="Hub_East" power="600000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="d205567c-e630-4dcb-8be1-b7e6deeb82f5" id="ec275309-ce97-4a2a-9436-f9b94c72d098" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="0.6" host="http://influxdb" port="8086" id="79cea8bf-e2de-46b6-a9a0-470c12a8c5b5" measurement="NS_OFWprofile_HE_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HE">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d47cc82c-5a23-4b29-9bb2-6c66235415e2" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.0389496646664" lon="5.97306597749276"/>
          <costInformation xsi:type="esdl:CostInformation" id="35e4525d-bb40-484c-8e86-f62d4dfb0693">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="c658dcb1-15c8-42ad-80b0-03c502b2480a" name="WF_Gemini_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="340000000.0" controlStrategy="cc7b3897-c91b-4709-9552-9155a90c78c0" name="EL_TNW" effMinLoad="67.0" id="EL_TNW" description="Hub_East">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="ca282c57-8af1-41bb-9ff8-7e2d087996ca" name="InPort" connectedTo="c83f5326-a14c-4aa1-85c1-ca07701c709d"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="ce2dea55-7b95-4072-855c-fa50c5a98a52" id="40cfc20a-1352-4441-9923-c28bc39b2ab5" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.0389496646664" lon="5.64306597749276"/>
          <costInformation xsi:type="esdl:CostInformation" id="9f4108b5-f76f-42be-91fc-dd2b974986e0">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_TNW_marginalcosts" id="5f2d619d-0234-48ea-abd6-59f2c023d968"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="1360000000.0" controlStrategy="efa1bad6-17b1-4d22-ab4f-dfcd68aa685a" name="EL_DDW-West" effMinLoad="67.0" id="EL_DDW-West" description="Hub_East">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="eb61df44-0588-42ba-9837-01797255e1c8" name="InPort" connectedTo="f5a88aa3-0be1-4087-8d90-8cc480cbedad"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="197fee08-cdd5-4083-9344-54aac48d14a6" id="98bf4b7f-c432-42ec-8f23-b1394bda20c1" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.3596331898551" lon="5.44688724627309"/>
          <costInformation xsi:type="esdl:CostInformation" id="b066e307-2be8-4dd5-8640-6cfcb36b07c0">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_DDW-West_marginalcosts" id="e06e1a8d-fc2d-4534-951c-3ef7a1459bb4"/>
          </costInformation>
        </asset>
      </area>
      <area xsi:type="esdl:Area" id="ef598e59-1246-47a8-bd30-261bf6120a81" name="Hub_West">
        <geometry xsi:type="esdl:Polygon">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="52.905596" lon="3.165978"/>
            <point xsi:type="esdl:Point" lat="52.90404" lon="3.1666"/>
            <point xsi:type="esdl:Point" lat="52.907412" lon="3.167069"/>
            <point xsi:type="esdl:Point" lat="53.893407" lon="2.891568"/>
            <point xsi:type="esdl:Point" lat="53.875984" lon="4.529313"/>
            <point xsi:type="esdl:Point" lat="53.230096" lon="4.504423"/>
            <point xsi:type="esdl:Point" lat="53.235074" lon="3.361984"/>
            <point xsi:type="esdl:Point" lat="53.161649" lon="3.330872"/>
            <point xsi:type="esdl:Point" lat="52.93453" lon="3.193045"/>
            <point xsi:type="esdl:Point" lat="52.905596" lon="3.165978"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:WindTurbine" name="WF_NDW1" id="WF_NDW1" description="Hub_West" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="b8d57a5f-ff48-4b5b-a68b-2e1d855d9975" id="e4baa182-bf81-4a89-a93e-c02f79148a95" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="8834cca2-43a8-42d3-bc43-412bbde8981a" measurement="NS_OFWprofile_HW_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HW">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b52b1235-97bf-4f0f-8b47-68135bffeec6" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="53.0771607197844" lon="3.31421897392904"/>
          <costInformation xsi:type="esdl:CostInformation" id="8f1f1060-7e97-44b3-ac40-3a1ed02ecac4">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="bfb68c7f-627a-425f-a4b9-9596878f44d8" name="WF_NDW1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_NDW2" id="WF_NDW2" description="Hub_West" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="6f7e2234-7ee2-4068-a08a-6b9318421cbc" id="b35bd1e6-2635-4293-b979-f4d4c6e3251f" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="a3600a1e-5b78-4aa4-9ab8-462121233e6d" measurement="NS_OFWprofile_HW_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HW">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="8a0df6e7-bea4-4810-9e1c-01f6a760312f" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="53.4253612135523" lon="3.44225466303724"/>
          <costInformation xsi:type="esdl:CostInformation" id="7efd41d9-184e-4626-8908-e53879044ffb">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="071a5267-3551-49cd-9406-c53ecbdf8a85" name="WF_NDW2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_NDW3" id="WF_NDW3" description="Hub_West" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="e2c046d4-cc85-48a1-927b-73d4dbc7371d" id="18558581-8d07-47ef-a9e3-7eebf5fec1e9" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="15a44414-56f5-45d0-8210-d1ca1eda7b26" measurement="NS_OFWprofile_HW_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HW">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="528fe804-4396-450c-9e95-9fb6a973c08d" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="53.463502235067" lon="3.48062008113859"/>
          <costInformation xsi:type="esdl:CostInformation" id="37f3d868-14c1-44f9-80fe-83e4d1590e76">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="ed259823-64a5-43cd-be53-dc01ca760d1a" name="WF_NDW3_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_NDW-Noord" id="WF_NDW-Noord" description="Hub_West" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="f8e7d38b-d3c6-4067-9226-631dedd6c318" id="4a715f29-2c5b-4bcb-b49b-47d28ce26d06" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="7ec0706b-bcd1-4d67-9650-2e8dda69767e" measurement="NS_OFWprofile_HW_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HW">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="37bcb8ab-97a0-41b3-9fe8-50cd9d5b291f" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="53.5053612135523" lon="3.44225466303724"/>
          <costInformation xsi:type="esdl:CostInformation" id="a2dd6640-49ae-48cd-8dad-b7d84dca2a83">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="101aa37a-dc71-47a0-90fe-c3faedabe642" name="WF_NDW-Noord_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA3" id="WF_WA3" description="Hub_West" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="e422661c-6267-4c66-ba52-cbae0f7cfe71" id="0215fba3-6ad0-41ca-8c93-9d6072f0a0dd" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="854489d5-d77c-4755-a5cb-ac13416bc298" measurement="NS_OFWprofile_HW_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HW">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="18be7b2a-fdb4-43fa-b7e2-a64aed91d4cd" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="53.941124165846" lon="3.7148881087642"/>
          <costInformation xsi:type="esdl:CostInformation" id="1a20ff98-218a-4e86-b3ad-65acda10ac5d">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="ab16e401-0b17-449e-ab13-d25c229aa1e8" name="WF_WA3_marginalcost"/>
          </costInformation>
        </asset>
      </area>
      <area xsi:type="esdl:Area" id="444a4cae-3d3c-4568-aa6a-e9be0baaef17" name="Hub_North">
        <geometry xsi:type="esdl:Polygon">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="54.068175" lon="4.341879"/>
            <point xsi:type="esdl:Point" lat="54.64385" lon="4.997591"/>
            <point xsi:type="esdl:Point" lat="54.809326" lon="4.997527"/>
            <point xsi:type="esdl:Point" lat="54.949957" lon="4.295701"/>
            <point xsi:type="esdl:Point" lat="54.488521" lon="4.169358"/>
            <point xsi:type="esdl:Point" lat="54.483983" lon="3.756379"/>
            <point xsi:type="esdl:Point" lat="54.027891" lon="3.57485"/>
            <point xsi:type="esdl:Point" lat="54.068175" lon="4.341879"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA6_1" id="WF_WA6_1" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="eab956bc-c68a-4e72-ab80-ef54a9856051" id="dcc545a0-0d2c-42ba-b775-a900e9975e4b" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="8b141771-a2fa-423e-aab3-e2a9410cdab6" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="c23aa7e0-c707-4ac0-bf6b-f6c291e9bbfc" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.2348242457071" lon="4.51296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="d3f6bb3d-1e35-4e4d-8a38-72ead20afbd5">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="5d7fa2de-619a-4b1c-9aea-b68462b11c3f" name="WF_WA6_1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA6_2" id="WF_WA6_2" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="ef6bdb5d-1068-4251-b168-64c4668f2c85" id="1e65b863-f486-41b0-8049-5e6b643636e7" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="8ecca5bf-99f8-4df2-8c60-537b653a94fa" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="cd158ee5-c0c6-43ac-8166-d21d0f46bb3c" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.3848242457071" lon="4.61296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="c8ea77eb-0113-4e46-bfff-5c9ebf0b1a59">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="95a52847-feae-4f31-9772-22314014df89" name="WF_WA6_2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA6_3" id="WF_WA6_3" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="65667b23-f57f-413b-947d-18cd49d2b3ff" id="02017b92-d205-4f83-80cb-e66214d7611e" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="3b671545-2a3b-44c4-a87b-116736962d82" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="4333b348-f585-4844-83a8-de9fa7ce681c" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.5358242457071" lon="4.71296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="0a32ec89-5f77-4262-ba3b-7d7a38a02ac4">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="d620cdc0-5b97-4b4a-8946-28db674182a1" name="WF_WA6_3_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA6_4" id="WF_WA6_4" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="7502d0c7-c0b9-498f-a58b-ea671c13dc87" id="ccbeb16a-00cf-485b-a150-312ef2261739" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="f546c7c6-ac51-4727-a35a-99f6c697da1d" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="67d0b672-eddf-497c-b77d-e03295b58051" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.6858242457071" lon="4.81296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="4fdd97f7-bd02-4132-883f-15d1582f59d2">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="85c68ebe-3c81-4fcc-828c-c1b06492c0a8" name="WF_WA6_4_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA6_5" id="WF_WA6_5" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="2f5a175b-927b-4c42-b55b-2bc4d61ce67c" id="be9cc073-fb16-4a96-9541-5dcb1e331159" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="34380206-01b8-4f57-aeae-51d2cdd580fb" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="6af2cf35-3991-41f2-8900-5129cf423c68" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.8358242457071" lon="4.91296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="1b0e3aae-731b-450c-a0c3-2b40c0a78cb8">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="eba18579-ee03-4216-b74c-c261f05398f7" name="WF_WA6_5_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA7_1" id="WF_WA7_1" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="d442f2e2-2c75-47b2-877f-5911fb4694f0" id="1ff8369a-6c90-4644-b113-ded220e0e743" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="abd4541e-f7f0-43a0-81ab-48f0cf2ee6cc" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="1107a82f-0838-4c4b-a7da-eb0319311500" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.1368242457071" lon="4.01296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="8273bfb1-6a6b-49d7-bafe-bf3e5f476fae">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="68161777-9a95-424b-9ff8-3f21495a73d8" name="WF_WA7_1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA7_2" id="WF_WA7_2" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="9c2c85d4-6714-4bb0-b440-ce157dec5e21" id="f7e8fb62-4d12-46a2-9b11-d63c36c201ba" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="02052ad1-814e-467e-a1d3-6086fec254bf" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fd335509-0a8d-4b95-a179-ee626ff11f2a" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.2368242457071" lon="4.01296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="678e86cd-deab-408c-b532-97b756fa00d4">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="ae7c3f2a-220b-4dc6-812d-e34bfac8a163" name="WF_WA7_2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA7_3" id="WF_WA7_3" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="051c90dd-181f-4621-b962-7242d6fde9a8" id="4503eeb3-e820-45c7-8d75-648af982b1e1" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="c7a5eead-cd1a-4183-8090-f9f3d4860de6" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a34dfa71-db89-4d3f-91b2-5ee082684bcc" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.3358242457071" lon="4.01296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="8eef7685-3905-48fa-88ce-4e413b964abc">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="e6b84d56-1f00-418d-a1f9-e202d8d6c69f" name="WF_WA7_3_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA7_4" id="WF_WA7_4" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="e227a5fe-5bfd-44e7-ae77-b3eb46323c08" id="0ec2352b-e1f4-4b00-8b9a-eb9275c399e5" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="58297a7f-69da-47ce-8770-777b8418bfe0" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e277968c-16ec-4736-b9ae-767643d24f17" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.4358242457071" lon="4.01296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="69add76a-5a42-46fd-a994-294888f2050a">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="9eb8595e-ec30-42af-af8f-f43f90c119a2" name="WF_WA7_4_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA67_1" id="WF_WA67_1" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="63ac9c9f-8500-4a4c-ac1c-1545f5fbc5ca" id="77aa7a91-417a-4d96-9dcf-81dae0adba69" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="eca5f8f3-8f69-48f2-b9b6-49a951044345" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="1a841c17-9460-49fb-9fe2-cbeed148137f" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.4358242457071" lon="4.36296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="f477630f-6caa-4f10-bc4b-9569a77d5113">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="390171bc-a120-4c9b-a845-00de789d04b2" name="WF_WA67_1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA67_2" id="WF_WA67_2" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="e005d189-eade-4db1-b5ce-2cd7b05e257c" id="efbf6d1e-2edc-4019-83ef-3da04f755170" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="9c49e2a5-ff8e-4dda-9d7b-2bbe3a9af070" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a19ad6f0-7580-4d82-8c6c-769bf3a9c5cb" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.434824245707105" lon="4.36296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="39d90888-f600-4793-b7d7-342b6c9cb119">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="a7a5a1c6-b7e6-4786-ac63-36f05c8ccd7d" name="WF_WA67_2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA67_3" id="WF_WA67_3" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="21f2fe6e-bc46-4b8e-ad09-20d5407bf787" id="e45f3010-e4e6-45b5-83bf-9db0d040ca57" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="b62a3454-1b3e-43ed-9c87-b4d182dc461e" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="27fb18e9-c931-460d-a940-802122de2c1f" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.43382424570711" lon="4.36296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="47f56905-30f5-4912-ba40-dde769c56847">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="5c67b84d-2aac-4997-9fc1-0a8b3c590492" name="WF_WA67_3_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA67_4" id="WF_WA67_4" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="3f107009-d59c-4455-b7be-f36b35ff06c6" id="e300be1d-20ed-4694-b53b-76e5e8d7e845" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="40b66548-7d79-4085-9ed0-9c1f3f04893b" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="be61282b-cdd3-4039-b024-1e521dd52672" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.43282424570711" lon="4.36296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="ae0fba55-3144-48f8-8ac5-6e7dab66cb6a">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="3480dd38-6bc5-4764-aa55-08c452693bc0" name="WF_WA67_4_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA67_5" id="WF_WA67_5" description="Hub_North" power="2000000000.0">
          <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="f42e3eb8-13d6-4a2e-916a-67774710ebf8" id="b9874468-07ef-4d1e-9991-88183896e078" name="OutPort">
            <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="2.0" host="http://influxdb" port="8086" id="d4ac91a4-64da-4c45-a98e-8c4cb48f64d7" measurement="NS_OFWprofile_HN_CY2009_med-wind" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="MWh_normalized_HN">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="4830100a-ef2f-4870-b3ae-1d9608db472b" multiplier="GIGA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lat="54.43182424570711" lon="4.36296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="a0b207e4-6beb-4cd1-8bb6-c04c51753fdf">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="63358248-3f06-4a66-83f1-daaf103dba03" name="WF_WA67_5_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="1360000000.0" controlStrategy="39e0f3de-b84c-4a15-8c08-b66021eeda98" name="EL_WA6_1" effMinLoad="67.0" id="EL_WA6_1" description="Hub_North">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="0e45bc4a-075d-4369-9f56-58d5ba4b4387" name="InPort" connectedTo="7ddad3dd-be7d-4b46-9c4a-b2e26e025ee6"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="bbf18bde-a0ea-43f1-b2e8-eb6283d6ce45" id="35d5b2eb-e471-4480-89b8-fd37c0fc434c" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.2358242457071" lon="4.51296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="2a09c898-8644-4bfe-86db-9abc157e7e3f">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_WA6_1_marginalcosts" id="8003929c-5c5a-4d69-82eb-7f1093a02a00"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="1360000000.0" controlStrategy="43aeba42-1b4c-4cc9-b781-fd835b0b5688" name="EL_WA6_2" effMinLoad="67.0" id="EL_WA6_2" description="Hub_North">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="a644a0da-2945-4790-94c0-9567ba8c4c22" name="InPort" connectedTo="d1dc2825-7726-4b2a-9b79-7d7810e8dd05"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="4dc33e7c-144c-494a-b038-5e43e1af5647" id="1d3d7488-d22d-42a5-a3f7-8581480d896f" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.3858242457071" lon="4.61296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="a422ca20-7a1d-4576-8ea6-55ded0a14b51">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_WA6_2_marginalcosts" id="a0ed402c-6e5f-49aa-a926-346218ff8f62"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="1360000000.0" controlStrategy="3ff815cf-4296-49b9-8f59-01ac423bbc05" name="EL_WA7_1" effMinLoad="67.0" id="EL_WA7_1" description="Hub_North">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="2456b3e8-8111-46d7-8156-b5ef092a06c9" name="InPort" connectedTo="5a3eb304-cc11-40ca-983f-dfe7fb1629bf"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="e64ba077-a319-41ae-8094-c9ddd101d1f8" id="c20d1878-0918-402c-88a2-57718891a311" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.1358242457071" lon="4.01296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="08c87478-e253-46ec-97ea-bc4f1c6f66f4">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_WA7_1_marginalcosts" id="e28cfd13-203c-42ea-9ddc-2b0d83a143c2"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="1360000000.0" controlStrategy="8e52cd0a-0859-42ff-8f77-4b522ba9b471" name="EL_WA7_2" effMinLoad="67.0" id="EL_WA7_2" description="Hub_North">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="f4887be0-43a6-48f2-a2bc-f939db9f513b" name="InPort" connectedTo="fcd1f843-1e47-401e-a203-32cacd518b9a"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="a0d2cc66-12ce-4547-b3ee-fb3b118560bb" id="d7830f7f-5633-4003-970b-8826640d8428" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.2358242457071" lon="4.01296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="ea184e0f-a999-4cbe-895e-c6cce3087fd3">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_WA7_2_marginalcosts" id="5207b45d-d2ca-4591-bc39-b9487d56a461"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="1360000000.0" controlStrategy="f53abdf6-46f4-4619-8823-7b5b90960865" name="EL_WA67_1" effMinLoad="67.0" id="EL_WA67_1" description="Hub_North">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="291428fb-d911-49af-bd9a-a57f473b8a12" name="InPort" connectedTo="a87527bb-d2ba-4076-a92b-77f2c3b3a11e"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="131d016c-b25b-47c5-a547-1c02ef45040a" id="a4b0bc09-cb61-4b1e-8066-4abc055ac393" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.4358242457071" lon="4.35296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="7f911842-6477-41a5-b49a-ef2b5ac48a18">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_WA67_1_marginalcosts" id="a2af891e-bfcf-49c2-ad92-a247b4efd911"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="1360000000.0" controlStrategy="84663f5c-4c74-4f2c-9aab-1acd18714af0" name="EL_WA67_2" effMinLoad="67.0" id="EL_WA67_2" description="Hub_North">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="bb1e57ea-5c1c-425a-83a5-e21c753a92c9" name="InPort" connectedTo="d92d40a4-5006-4819-9241-0e44a6aa012e"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="2191949e-5e2a-49ec-a3ea-82470511e183" id="b9789ad4-64a4-4a4c-ac9b-9a48d6264284" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.434824245707105" lon="4.35296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="b9387a9e-cc2c-4d2b-911b-e3cbac86de08">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_WA67_2_marginalcosts" id="8be34e10-be05-4f95-83c3-0a714562fe7f"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="1360000000.0" controlStrategy="9b4ec5a4-82ae-46cb-8a76-c986ce8ffe09" name="EL_WA67_3" effMinLoad="67.0" id="EL_WA67_3" description="Hub_North">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="71f31b2d-0035-4053-9fbf-5dd425a0241d" name="InPort" connectedTo="1c3cf73a-9956-4de3-8523-d563a335b89e"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="59f37df5-5379-4705-aea0-ad89f69b8c36" id="7dad5443-1a72-4e97-9b79-9eed5b4b3923" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.43382424570711" lon="4.35296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="babc73cb-478e-4e40-8d35-5250f41be5d8">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_WA67_3_marginalcosts" id="f67bdfe4-95a4-4c85-b7b9-2e9570617eb0"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="1360000000.0" controlStrategy="1452787a-7ed1-46a9-b5e8-5790c1c11f76" name="EL_WA67_4" effMinLoad="67.0" id="EL_WA67_4" description="Hub_North">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="96616355-a423-41b8-8be9-504ab81b718d" name="InPort" connectedTo="adbe185f-3991-4acb-a703-ebd9ed8cefd1"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="4cfd2d56-5d3d-4fbc-951e-061ccdd7dbbe" id="136af978-dd06-43bf-91f2-5a0d6cf7ddcc" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.43282424570711" lon="4.35296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="7aecb1c6-32f7-46ab-bb59-b8df22085e35">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_WA67_4_marginalcosts" id="a1f34b0b-f5f3-41cf-9f17-8599088e8098"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" efficiency="63.0" effMaxLoad="68.0" power="1360000000.0" controlStrategy="3b85d482-8927-4f74-bd12-79dcba87d71d" name="EL_WA67_5" effMinLoad="67.0" id="EL_WA67_5" description="Hub_North">
          <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="afe1b481-7cc3-45aa-94cb-36776529f348" name="InPort" connectedTo="66d89a15-411a-433d-a607-8e44b377245f"/>
          <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="a2e0032a-cb43-4e8b-a9b2-ddc045505b9f" id="aaf3bc8b-6906-4a04-baeb-199910e9d726" name="OutPort"/>
          <geometry xsi:type="esdl:Point" lat="54.43182424570711" lon="4.35296592482482"/>
          <costInformation xsi:type="esdl:CostInformation" id="c89eca70-4dbd-4576-96a7-e0e335ad6a96">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" name="EL_WA67_5_marginalcosts" id="b38a4416-a18e-495e-8fc4-2bc3e6442107"/>
          </costInformation>
        </asset>
      </area>
      <asset xsi:type="esdl:Pipe" length="85796.33160936175" name="Pipe_Wintershall Noordzee B_V__0" capacity="10000000000.0" id="Pipe_Wintershall Noordzee B_V__0" diameter="DN500">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="08207a3d-8025-49ac-b684-d0c46a8dbaa0" connectedTo="d5cb0a75-71d3-4e2b-b8c1-4e6ef4dc4111"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="77427ca6-a5f7-47de-9f95-4fb5fc323a80" id="57d28c16-00a5-4461-a883-ed4c898a7e3d" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.21751306865999" lon="3.2177011169605856"/>
          <point xsi:type="esdl:Point" lat="53.21782787811185" lon="3.217597880187599"/>
          <point xsi:type="esdl:Point" lat="53.21816953174424" lon="3.2175546807266087"/>
          <point xsi:type="esdl:Point" lat="53.21828639907123" lon="3.217555272869095"/>
          <point xsi:type="esdl:Point" lat="53.218403269457276" lon="3.2175408914792"/>
          <point xsi:type="esdl:Point" lat="53.21850217130035" lon="3.217541392568448"/>
          <point xsi:type="esdl:Point" lat="53.21861005443088" lon="3.217526973036086"/>
          <point xsi:type="esdl:Point" lat="53.218834777560595" lon="3.2175281115339276"/>
          <point xsi:type="esdl:Point" lat="53.221244664670465" lon="3.2170760045521107"/>
          <point xsi:type="esdl:Point" lat="53.22134362492433" lon="3.2170315722072913"/>
          <point xsi:type="esdl:Point" lat="53.22342972260774" lon="3.2166826573342244"/>
          <point xsi:type="esdl:Point" lat="53.22354665714244" lon="3.21663831104801"/>
          <point xsi:type="esdl:Point" lat="53.24081139573477" lon="3.2134289183490847"/>
          <point xsi:type="esdl:Point" lat="53.24103611808245" lon="3.213430036302456"/>
          <point xsi:type="esdl:Point" lat="53.242115135957185" lon="3.2132406257881807"/>
          <point xsi:type="esdl:Point" lat="53.24220508409254" lon="3.2132110837108985"/>
          <point xsi:type="esdl:Point" lat="53.2425467302346" lon="3.213167858261647"/>
          <point xsi:type="esdl:Point" lat="53.242654590141406" lon="3.2131683942145117"/>
          <point xsi:type="esdl:Point" lat="53.24420116748302" lon="3.2129213178238096"/>
          <point xsi:type="esdl:Point" lat="53.24463284864738" lon="3.212788602744943"/>
          <point xsi:type="esdl:Point" lat="53.244740755073295" lon="3.2127741313079246"/>
          <point xsi:type="esdl:Point" lat="53.24483070747896" lon="3.2127446269509012"/>
          <point xsi:type="esdl:Point" lat="53.244947550947494" lon="3.2127452064361246"/>
          <point xsi:type="esdl:Point" lat="53.24616141372923" lon="3.212556389447741"/>
          <point xsi:type="esdl:Point" lat="53.246296400834325" lon="3.212467139210166"/>
          <point xsi:type="esdl:Point" lat="53.249911131780976" lon="3.211825604915578"/>
          <point xsi:type="esdl:Point" lat="53.25009100367433" lon="3.211766544404672"/>
          <point xsi:type="esdl:Point" lat="53.25178144420364" lon="3.211490129530864"/>
          <point xsi:type="esdl:Point" lat="53.25188037445931" lon="3.2114606214727823"/>
          <point xsi:type="esdl:Point" lat="53.252204053205794" lon="3.2114172524907145"/>
          <point xsi:type="esdl:Point" lat="53.25231191384396" lon="3.2114177842394636"/>
          <point xsi:type="esdl:Point" lat="53.25275255110078" lon="3.211315060853662"/>
          <point xsi:type="esdl:Point" lat="53.25287841037387" lon="3.2113156810415515"/>
          <point xsi:type="esdl:Point" lat="53.253399928144404" lon="3.2112283169157303"/>
          <point xsi:type="esdl:Point" lat="53.25352575864093" lon="3.2112289367263265"/>
          <point xsi:type="esdl:Point" lat="53.25364269511448" lon="3.2111845297139987"/>
          <point xsi:type="esdl:Point" lat="53.253759573934616" lon="3.2111701269172506"/>
          <point xsi:type="esdl:Point" lat="53.2538585260954" lon="3.2111256474468113"/>
          <point xsi:type="esdl:Point" lat="53.253957422891894" lon="3.2111261343606454"/>
          <point xsi:type="esdl:Point" lat="53.254065340210154" lon="3.2110966682269373"/>
          <point xsi:type="esdl:Point" lat="53.25418219789385" lon="3.2110972434900784"/>
          <point xsi:type="esdl:Point" lat="53.25482966538269" lon="3.2109505698223892"/>
          <point xsi:type="esdl:Point" lat="53.25493752597369" lon="3.210951100448244"/>
          <point xsi:type="esdl:Point" lat="53.25504543873424" lon="3.2109216346738627"/>
          <point xsi:type="esdl:Point" lat="53.25515332269634" lon="3.2109221653446336"/>
          <point xsi:type="esdl:Point" lat="53.25548601565532" lon="3.210863852896798"/>
          <point xsi:type="esdl:Point" lat="53.2556029375592" lon="3.210819450295198"/>
          <point xsi:type="esdl:Point" lat="53.256807865434695" lon="3.210600537409176"/>
          <point xsi:type="esdl:Point" lat="53.25690673791505" lon="3.2106010230384188"/>
          <point xsi:type="esdl:Point" lat="53.25843537721618" lon="3.2103087063042324"/>
          <point xsi:type="esdl:Point" lat="53.25866015628816" lon="3.2102798411973485"/>
          <point xsi:type="esdl:Point" lat="53.25876809522627" lon="3.2102353971923967"/>
          <point xsi:type="esdl:Point" lat="53.26476564403363" lon="3.209155345063671"/>
          <point xsi:type="esdl:Point" lat="53.26487352783" lon="3.2091558714764274"/>
          <point xsi:type="esdl:Point" lat="53.2655388792434" lon="3.2090541910706034"/>
          <point xsi:type="esdl:Point" lat="53.265655820110716" lon="3.209009750802643"/>
          <point xsi:type="esdl:Point" lat="53.26806564043135" lon="3.208571702293326"/>
          <point xsi:type="esdl:Point" lat="53.26816452172314" lon="3.208572183493874"/>
          <point xsi:type="esdl:Point" lat="53.27015176722881" lon="3.2081770167114305"/>
          <point xsi:type="esdl:Point" lat="53.270268628208626" lon="3.208177584374825"/>
          <point xsi:type="esdl:Point" lat="53.27148248606826" lon="3.207973543870884"/>
          <point xsi:type="esdl:Point" lat="53.27158136281546" lon="3.207974023732942"/>
          <point xsi:type="esdl:Point" lat="53.27181515058194" lon="3.207930172732859"/>
          <point xsi:type="esdl:Point" lat="53.27192310729458" lon="3.2078857093422632"/>
          <point xsi:type="esdl:Point" lat="53.273874398900624" lon="3.207490303958298"/>
          <point xsi:type="esdl:Point" lat="53.2742250428359" lon="3.207447004739395"/>
          <point xsi:type="esdl:Point" lat="53.274314918002084" lon="3.207447439847386"/>
          <point xsi:type="esdl:Point" lat="53.274431804968174" lon="3.2074330201173953"/>
          <point xsi:type="esdl:Point" lat="53.274548671266444" lon="3.2074335858583947"/>
          <point xsi:type="esdl:Point" lat="53.28072602638081" lon="3.2063086120275983"/>
          <point xsi:type="esdl:Point" lat="53.28082497633069" lon="3.2062640844972914"/>
          <point xsi:type="esdl:Point" lat="53.28833316588438" lon="3.2048751799407023"/>
          <point xsi:type="esdl:Point" lat="53.28845011160531" lon="3.2048157367924013"/>
          <point xsi:type="esdl:Point" lat="53.28856694650774" lon="3.2048312860999633"/>
          <point xsi:type="esdl:Point" lat="53.29490615772356" lon="3.2036613658364774"/>
          <point xsi:type="esdl:Point" lat="53.295023000270234" lon="3.2036619215971944"/>
          <point xsi:type="esdl:Point" lat="53.30331335088011" lon="3.202155756083813"/>
          <point xsi:type="esdl:Point" lat="53.303430491818176" lon="3.201991210334731"/>
          <point xsi:type="esdl:Point" lat="53.30354714886999" lon="3.2021118008252585"/>
          <point xsi:type="esdl:Point" lat="53.30365503848448" lon="3.2020973459262234"/>
          <point xsi:type="esdl:Point" lat="53.30374498298009" lon="3.202067738325825"/>
          <point xsi:type="esdl:Point" lat="53.30516565486479" lon="3.2018193223853375"/>
          <point xsi:type="esdl:Point" lat="53.3052735137061" lon="3.2018198309665356"/>
          <point xsi:type="esdl:Point" lat="53.30537243622744" lon="3.201790271506853"/>
          <point xsi:type="esdl:Point" lat="53.30548930195328" lon="3.2017908224885323"/>
          <point xsi:type="esdl:Point" lat="53.30614563475163" lon="3.20170388859285"/>
          <point xsi:type="esdl:Point" lat="53.30625354433893" lon="3.2016743721175533"/>
          <point xsi:type="esdl:Point" lat="53.30637041004718" lon="3.201674922793806"/>
          <point xsi:type="esdl:Point" lat="53.306595180783134" lon="3.2016459866840825"/>
          <point xsi:type="esdl:Point" lat="53.306703044993576" lon="3.2016464948790047"/>
          <point xsi:type="esdl:Point" lat="53.3069278157605" lon="3.2016175283882577"/>
          <point xsi:type="esdl:Point" lat="53.30704465718635" lon="3.2016180788129818"/>
          <point xsi:type="esdl:Point" lat="53.30726044526398" lon="3.201589101156176"/>
          <point xsi:type="esdl:Point" lat="53.307368328341056" lon="3.201589609306183"/>
          <point xsi:type="esdl:Point" lat="53.307467225440426" lon="3.2015750374375154"/>
          <point xsi:type="esdl:Point" lat="53.30757508424336" lon="3.2015755454437915"/>
          <point xsi:type="esdl:Point" lat="53.30769197526574" lon="3.2015610987463754"/>
          <point xsi:type="esdl:Point" lat="53.3078088175794" lon="3.2015616490273695"/>
          <point xsi:type="esdl:Point" lat="53.3079167017614" lon="3.201547128281824"/>
          <point xsi:type="esdl:Point" lat="53.30823132069301" lon="3.2015486099450876"/>
          <point xsi:type="esdl:Point" lat="53.308339223694006" lon="3.201534120622611"/>
          <point xsi:type="esdl:Point" lat="53.30855496103828" lon="3.2015351365632987"/>
          <point xsi:type="esdl:Point" lat="53.30866284515443" lon="3.2015206470162436"/>
          <point xsi:type="esdl:Point" lat="53.308779666604714" lon="3.2015361947517538"/>
          <point xsi:type="esdl:Point" lat="53.308887551618355" lon="3.201521705132834"/>
          <point xsi:type="esdl:Point" lat="53.30911227155262" lon="3.2015227633302725"/>
          <point xsi:type="esdl:Point" lat="53.30921112237632" lon="3.2015382266061794"/>
          <point xsi:type="esdl:Point" lat="53.3093280088712" lon="3.2015237792350266"/>
          <point xsi:type="esdl:Point" lat="53.31295908880666" lon="3.2017810503274107"/>
          <point xsi:type="esdl:Point" lat="53.31363302948577" lon="3.201919296108903"/>
          <point xsi:type="esdl:Point" lat="53.31375892392981" lon="3.20188988993774"/>
          <point xsi:type="esdl:Point" lat="53.31386668101699" lon="3.2019504290845866"/>
          <point xsi:type="esdl:Point" lat="53.3141722099766" lon="3.2020119097826316"/>
          <point xsi:type="esdl:Point" lat="53.31427108695202" lon="3.2020123766101354"/>
          <point xsi:type="esdl:Point" lat="53.31528645438436" lon="3.2022423225505774"/>
          <point xsi:type="esdl:Point" lat="53.31539418575708" lon="3.20231790362753"/>
          <point xsi:type="esdl:Point" lat="53.31550209624217" lon="3.202288373381061"/>
          <point xsi:type="esdl:Point" lat="53.31585254128053" lon="3.2023650714142544"/>
          <point xsi:type="esdl:Point" lat="53.318233311577444" lon="3.2031269059806515"/>
          <point xsi:type="esdl:Point" lat="53.31833211177737" lon="3.2031724185855324"/>
          <point xsi:type="esdl:Point" lat="53.318556733581964" lon="3.2032335211467418"/>
          <point xsi:type="esdl:Point" lat="53.31864652146014" lon="3.203278999031737"/>
          <point xsi:type="esdl:Point" lat="53.320676927973935" lon="3.203919158885974"/>
          <point xsi:type="esdl:Point" lat="53.320802699034665" lon="3.203964773009465"/>
          <point xsi:type="esdl:Point" lat="53.320901446608175" lon="3.2040403253582954"/>
          <point xsi:type="esdl:Point" lat="53.321009306047976" lon="3.204040839841425"/>
          <point xsi:type="esdl:Point" lat="53.32198853374218" lon="3.204375787456925"/>
          <point xsi:type="esdl:Point" lat="53.322078331028784" lon="3.204421263940549"/>
          <point xsi:type="esdl:Point" lat="53.33569723178353" lon="3.2091868129312924"/>
          <point xsi:type="esdl:Point" lat="53.33956013605494" lon="3.2104973365238854"/>
          <point xsi:type="esdl:Point" lat="53.33967697451436" lon="3.2105129518755873"/>
          <point xsi:type="esdl:Point" lat="53.34086276371219" lon="3.2109242991308946"/>
          <point xsi:type="esdl:Point" lat="53.34119509823287" lon="3.2110761417945604"/>
          <point xsi:type="esdl:Point" lat="53.3415095049404" lon="3.2111828303080934"/>
          <point xsi:type="esdl:Point" lat="53.34160835481936" lon="3.211198336855848"/>
          <point xsi:type="esdl:Point" lat="53.342380911715864" lon="3.2114725326214097"/>
          <point xsi:type="esdl:Point" lat="53.342596594470336" lon="3.211503627742087"/>
          <point xsi:type="esdl:Point" lat="53.34270434697536" lon="3.211564239661455"/>
          <point xsi:type="esdl:Point" lat="53.342920007536854" lon="3.2116103675224736"/>
          <point xsi:type="esdl:Point" lat="53.34302775906909" lon="3.2116709876704093"/>
          <point xsi:type="esdl:Point" lat="53.34311762542081" lon="3.2116864439035253"/>
          <point xsi:type="esdl:Point" lat="53.346594076079406" lon="3.212950423517493"/>
          <point xsi:type="esdl:Point" lat="53.34670190728865" lon="3.2129659807931112"/>
          <point xsi:type="esdl:Point" lat="53.347034270005274" lon="3.213087829212498"/>
          <point xsi:type="esdl:Point" lat="53.34714202522277" lon="3.213148443952575"/>
          <point xsi:type="esdl:Point" lat="53.34724987618557" lon="3.213163993008609"/>
          <point xsi:type="esdl:Point" lat="53.34820211496516" lon="3.2134842181888175"/>
          <point xsi:type="esdl:Point" lat="53.34832790315126" lon="3.2135149011624433"/>
          <point xsi:type="esdl:Point" lat="53.348426698903495" lon="3.213560430952095"/>
          <point xsi:type="esdl:Point" lat="53.3487501357448" lon="3.2136521969485723"/>
          <point xsi:type="esdl:Point" lat="53.34883994343644" lon="3.2136977140989287"/>
          <point xsi:type="esdl:Point" lat="53.349729305372584" lon="3.2140026197426583"/>
          <point xsi:type="esdl:Point" lat="53.349917893131035" lon="3.214093684738804"/>
          <point xsi:type="esdl:Point" lat="53.35014250354481" lon="3.214154891765097"/>
          <point xsi:type="esdl:Point" lat="53.35024129805176" lon="3.2142004625269096"/>
          <point xsi:type="esdl:Point" lat="53.35035810436039" lon="3.2142311055704207"/>
          <point xsi:type="esdl:Point" lat="53.35046588594007" lon="3.2142766827462044"/>
          <point xsi:type="esdl:Point" lat="53.350681540640174" lon="3.2143228417697802"/>
          <point xsi:type="esdl:Point" lat="53.35209194310729" lon="3.2147956523497148"/>
          <point xsi:type="esdl:Point" lat="53.35218173593033" lon="3.2148411754109856"/>
          <point xsi:type="esdl:Point" lat="53.353376541352254" lon="3.215237794787209"/>
          <point xsi:type="esdl:Point" lat="53.353466352857595" lon="3.2152833202559647"/>
          <point xsi:type="esdl:Point" lat="53.35369992244634" lon="3.2153596047497177"/>
          <point xsi:type="esdl:Point" lat="53.35379871734112" lon="3.215405174604232"/>
          <point xsi:type="esdl:Point" lat="53.353906535372964" lon="3.215435754154819"/>
          <point xsi:type="esdl:Point" lat="53.354113111192" lon="3.215526949218034"/>
          <point xsi:type="esdl:Point" lat="53.35422095626136" lon="3.215542538383845"/>
          <point xsi:type="esdl:Point" lat="53.35508332639205" lon="3.2158473607537483"/>
          <point xsi:type="esdl:Point" lat="53.35538866390623" lon="3.2159991575763853"/>
          <point xsi:type="esdl:Point" lat="53.355819867332116" lon="3.2161515513295287"/>
          <point xsi:type="esdl:Point" lat="53.35593659878257" lon="3.2162122708221514"/>
          <point xsi:type="esdl:Point" lat="53.35603542056556" lon="3.2162428009025157"/>
          <point xsi:type="esdl:Point" lat="53.35612522712247" lon="3.2162883463318366"/>
          <point xsi:type="esdl:Point" lat="53.361712902577445" lon="3.2181498874287575"/>
          <point xsi:type="esdl:Point" lat="53.36191947601661" lon="3.218241112387906"/>
          <point xsi:type="esdl:Point" lat="53.36203628109978" lon="3.2182717418758395"/>
          <point xsi:type="esdl:Point" lat="53.36224284454954" lon="3.218362968065679"/>
          <point xsi:type="esdl:Point" lat="53.36235069903564" lon="3.2183785359144688"/>
          <point xsi:type="esdl:Point" lat="53.36906094274244" lon="3.220772460106009"/>
          <point xsi:type="esdl:Point" lat="53.36915080749011" lon="3.220787943558078"/>
          <point xsi:type="esdl:Point" lat="53.373893992166565" lon="3.222360634780005"/>
          <point xsi:type="esdl:Point" lat="53.37398379611642" lon="3.2224061971874858"/>
          <point xsi:type="esdl:Point" lat="53.38250864287866" lon="3.2253521797163582"/>
          <point xsi:type="esdl:Point" lat="53.38262539337423" lon="3.2254129386001065"/>
          <point xsi:type="esdl:Point" lat="53.39034159538695" lon="3.2281302494487676"/>
          <point xsi:type="esdl:Point" lat="53.39044046558092" lon="3.22814580439775"/>
          <point xsi:type="esdl:Point" lat="53.39097945559881" lon="3.2283140909652364"/>
          <point xsi:type="esdl:Point" lat="53.39109629068319" lon="3.228329751744742"/>
          <point xsi:type="esdl:Point" lat="53.392946774707944" lon="3.228956214545668"/>
          <point xsi:type="esdl:Point" lat="53.39305460294579" lon="3.2289718204560764"/>
          <point xsi:type="esdl:Point" lat="53.39636021489432" lon="3.230147575456996"/>
          <point xsi:type="esdl:Point" lat="53.396476957278345" lon="3.2302083522262013"/>
          <point xsi:type="esdl:Point" lat="53.39905497305531" lon="3.2311246263869355"/>
          <point xsi:type="esdl:Point" lat="53.399144817018176" lon="3.23114018171321"/>
          <point xsi:type="esdl:Point" lat="53.40301643590885" lon="3.232454707884299"/>
          <point xsi:type="esdl:Point" lat="53.40314222338977" lon="3.2324854626333153"/>
          <point xsi:type="esdl:Point" lat="53.40420207084964" lon="3.232912405252809"/>
          <point xsi:type="esdl:Point" lat="53.40431886674519" lon="3.2329431131007844"/>
          <point xsi:type="esdl:Point" lat="53.404417653064236" lon="3.2329887870880056"/>
          <point xsi:type="esdl:Point" lat="53.404651238477655" lon="3.2330502217024772"/>
          <point xsi:type="esdl:Point" lat="53.40475002564228" lon="3.233095896300553"/>
          <point xsi:type="esdl:Point" lat="53.40485785759103" lon="3.233111524632911"/>
          <point xsi:type="esdl:Point" lat="53.408423909697326" lon="3.234379588967324"/>
          <point xsi:type="esdl:Point" lat="53.408522695405765" lon="3.234425261678938"/>
          <point xsi:type="esdl:Point" lat="53.40873831499963" lon="3.2344866188676145"/>
          <point xsi:type="esdl:Point" lat="53.408837096149206" lon="3.234532301164253"/>
          <point xsi:type="esdl:Point" lat="53.4089538959791" lon="3.234563040920387"/>
          <point xsi:type="esdl:Point" lat="53.409052686100765" lon="3.2346087161562664"/>
          <point xsi:type="esdl:Point" lat="53.40917846839396" lon="3.234639481640151"/>
          <point xsi:type="esdl:Point" lat="53.40927725397261" lon="3.2346851647901884"/>
          <point xsi:type="esdl:Point" lat="53.41014865191789" lon="3.2349457134487687"/>
          <point xsi:type="esdl:Point" lat="53.410256420716266" lon="3.234991438846574"/>
          <point xsi:type="esdl:Point" lat="53.41038220739635" lon="3.235022198841752"/>
          <point xsi:type="esdl:Point" lat="53.4104720103658" lon="3.2350678346505735"/>
          <point xsi:type="esdl:Point" lat="53.419077330547076" lon="3.2380494240796556"/>
          <point xsi:type="esdl:Point" lat="53.41919411487064" lon="3.238080182368034"/>
          <point xsi:type="esdl:Point" lat="53.419283916521515" lon="3.2381258326037994"/>
          <point xsi:type="esdl:Point" lat="53.423937053195736" lon="3.239641620026088"/>
          <point xsi:type="esdl:Point" lat="53.42478141143094" lon="3.239932285270507"/>
          <point xsi:type="esdl:Point" lat="53.42489815355926" lon="3.239993144666752"/>
          <point xsi:type="esdl:Point" lat="53.43497621320761" lon="3.2436023174282957"/>
          <point xsi:type="esdl:Point" lat="53.43507505631087" lon="3.243617924740076"/>
          <point xsi:type="esdl:Point" lat="53.43735653059019" lon="3.244428797116124"/>
          <point xsi:type="esdl:Point" lat="53.43744632499167" lon="3.244474489312196"/>
          <point xsi:type="esdl:Point" lat="53.4394135402276" lon="3.245118025080187"/>
          <point xsi:type="esdl:Point" lat="53.43961119491926" lon="3.2451643342930954"/>
          <point xsi:type="esdl:Point" lat="53.439844679833215" lon="3.245271049369811"/>
          <point xsi:type="esdl:Point" lat="53.43996149278673" lon="3.2452867733996964"/>
          <point xsi:type="esdl:Point" lat="53.44028485315938" lon="3.245409092437476"/>
          <point xsi:type="esdl:Point" lat="53.44040167958561" lon="3.2454248095682994"/>
          <point xsi:type="esdl:Point" lat="53.440509474713586" lon="3.2454555277648676"/>
          <point xsi:type="esdl:Point" lat="53.44059926870218" lon="3.245501208974544"/>
          <point xsi:type="esdl:Point" lat="53.44126398592405" lon="3.245715806443772"/>
          <point xsi:type="esdl:Point" lat="53.44137171801538" lon="3.2457766850100653"/>
          <point xsi:type="esdl:Point" lat="53.44158732597166" lon="3.245838147445361"/>
          <point xsi:type="esdl:Point" lat="53.441686081104336" lon="3.2458989282839346"/>
          <point xsi:type="esdl:Point" lat="53.442548306467614" lon="3.2462351164638594"/>
          <point xsi:type="esdl:Point" lat="53.44276394964732" lon="3.246281538352454"/>
          <point xsi:type="esdl:Point" lat="53.44288066480296" lon="3.2463424242939163"/>
          <point xsi:type="esdl:Point" lat="53.444883660685065" lon="3.247061638336573"/>
          <point xsi:type="esdl:Point" lat="53.445000473310536" lon="3.2470773616478064"/>
          <point xsi:type="esdl:Point" lat="53.44510828679683" lon="3.2471080874980203"/>
          <point xsi:type="esdl:Point" lat="53.44522509393588" lon="3.2471238501374957"/>
          <point xsi:type="esdl:Point" lat="53.44639274196107" lon="3.247552216523833"/>
          <point xsi:type="esdl:Point" lat="53.446832937999645" lon="3.2476752178680037"/>
          <point xsi:type="esdl:Point" lat="53.44703953567923" lon="3.247751691780518"/>
          <point xsi:type="esdl:Point" lat="53.447362779598556" lon="3.247919221759923"/>
          <point xsi:type="esdl:Point" lat="53.451144251904395" lon="3.2492512703072465"/>
          <point xsi:type="esdl:Point" lat="53.451359874700366" lon="3.2492977168635786"/>
          <point xsi:type="esdl:Point" lat="53.451458685294305" lon="3.2493284243432448"/>
          <point xsi:type="esdl:Point" lat="53.451683340784214" lon="3.2493598359493805"/>
          <point xsi:type="esdl:Point" lat="53.45369541182123" lon="3.250034247891665"/>
          <point xsi:type="esdl:Point" lat="53.453803241502484" lon="3.2500499299342933"/>
          <point xsi:type="esdl:Point" lat="53.454261335985336" lon="3.250203222344081"/>
          <point xsi:type="esdl:Point" lat="53.45456664738012" lon="3.250355619501839"/>
          <point xsi:type="esdl:Point" lat="53.45466535851427" lon="3.250431485731012"/>
          <point xsi:type="esdl:Point" lat="53.45565340025999" lon="3.2507686118239594"/>
          <point xsi:type="esdl:Point" lat="53.45574325969894" lon="3.2507841905872796"/>
          <point xsi:type="esdl:Point" lat="53.45791691501024" lon="3.251550031055939"/>
          <point xsi:type="esdl:Point" lat="53.45801575216456" lon="3.251565666880246"/>
          <point xsi:type="esdl:Point" lat="53.45811453036588" lon="3.2516114330076666"/>
          <point xsi:type="esdl:Point" lat="53.458878123024775" lon="3.2518268076633454"/>
          <point xsi:type="esdl:Point" lat="53.4590847250539" lon="3.2518882654902836"/>
          <point xsi:type="esdl:Point" lat="53.45919247341877" lon="3.251949177896114"/>
          <point xsi:type="esdl:Point" lat="53.45972250419364" lon="3.252087854042492"/>
          <point xsi:type="esdl:Point" lat="53.46231819493945" lon="3.253052126185987"/>
          <point xsi:type="esdl:Point" lat="53.4624079591383" lon="3.253112907590499"/>
          <point xsi:type="esdl:Point" lat="53.46284810179414" lon="3.25325109800882"/>
          <point xsi:type="esdl:Point" lat="53.46295584854516" lon="3.253311995170239"/>
          <point xsi:type="esdl:Point" lat="53.46337795788162" lon="3.253480186219863"/>
          <point xsi:type="esdl:Point" lat="53.46348568563953" lon="3.253541077075109"/>
          <point xsi:type="esdl:Point" lat="53.46392591505877" lon="3.253649138286262"/>
          <point xsi:type="esdl:Point" lat="53.46457260906681" lon="3.253878935887901"/>
          <point xsi:type="esdl:Point" lat="53.46468043796368" lon="3.253894663403249"/>
          <point xsi:type="esdl:Point" lat="53.464779242710236" lon="3.2539253580998886"/>
          <point xsi:type="esdl:Point" lat="53.464878083912794" lon="3.253941008072662"/>
          <point xsi:type="esdl:Point" lat="53.465120593964635" lon="3.254032845350457"/>
          <point xsi:type="esdl:Point" lat="53.46522841750689" lon="3.2540485417930793"/>
          <point xsi:type="esdl:Point" lat="53.46586609525288" lon="3.254293381782966"/>
          <point xsi:type="esdl:Point" lat="53.46600984567175" lon="3.25432438004729"/>
          <point xsi:type="esdl:Point" lat="53.4660906535538" lon="3.254370022180251"/>
          <point xsi:type="esdl:Point" lat="53.466288303691215" lon="3.254416403779405"/>
          <point xsi:type="esdl:Point" lat="53.467896043419145" lon="3.254998470087275"/>
          <point xsi:type="esdl:Point" lat="53.46800377123016" lon="3.255059362254062"/>
          <point xsi:type="esdl:Point" lat="53.47522533725973" lon="3.257543481243732"/>
          <point xsi:type="esdl:Point" lat="53.47534202697055" lon="3.2576195025221235"/>
          <point xsi:type="esdl:Point" lat="53.47544981819728" lon="3.2576503072534027"/>
          <point xsi:type="esdl:Point" lat="53.475539611413886" lon="3.257696053474156"/>
          <point xsi:type="esdl:Point" lat="53.47899772732578" lon="3.258862170010218"/>
          <point xsi:type="esdl:Point" lat="53.47941993450564" lon="3.2589852833204054"/>
          <point xsi:type="esdl:Point" lat="53.4795276591447" lon="3.2590462036853096"/>
          <point xsi:type="esdl:Point" lat="53.479644479328286" lon="3.2590619806169814"/>
          <point xsi:type="esdl:Point" lat="53.4829767113116" lon="3.2602426513159166"/>
          <point xsi:type="esdl:Point" lat="53.48308448787483" lon="3.260288488086851"/>
          <point xsi:type="esdl:Point" lat="53.48320125968648" lon="3.260319354208996"/>
          <point xsi:type="esdl:Point" lat="53.48330898893829" lon="3.2603802909681536"/>
          <point xsi:type="esdl:Point" lat="53.48341682565456" lon="3.2603960179894282"/>
          <point xsi:type="esdl:Point" lat="53.484997527006016" lon="3.260993433334451"/>
          <point xsi:type="esdl:Point" lat="53.48510535457117" lon="3.2610091866044986"/>
          <point xsi:type="esdl:Point" lat="53.48651537600988" lon="3.2615603935814863"/>
          <point xsi:type="esdl:Point" lat="53.48659616640838" lon="3.261606079040194"/>
          <point xsi:type="esdl:Point" lat="53.488132085735934" lon="3.2621279633354416"/>
          <point xsi:type="esdl:Point" lat="53.488365685590935" lon="3.262174602966678"/>
          <point xsi:type="esdl:Point" lat="53.4910423225145" lon="3.263080392539389"/>
          <point xsi:type="esdl:Point" lat="53.49114106252134" lon="3.263141284418715"/>
          <point xsi:type="esdl:Point" lat="53.49201227997229" lon="3.263448147949589"/>
          <point xsi:type="esdl:Point" lat="53.49211102517093" lon="3.2635090406104497"/>
          <point xsi:type="esdl:Point" lat="53.49229963640486" lon="3.2635705088308953"/>
          <point xsi:type="esdl:Point" lat="53.49241636051031" lon="3.263631513691334"/>
          <point xsi:type="esdl:Point" lat="53.49305404865719" lon="3.263861561231235"/>
          <point xsi:type="esdl:Point" lat="53.49361097130246" lon="3.264030823557767"/>
          <point xsi:type="esdl:Point" lat="53.49370971167776" lon="3.264091719847821"/>
          <point xsi:type="esdl:Point" lat="53.49402408078585" lon="3.264199194971132"/>
          <point xsi:type="esdl:Point" lat="53.4946887865952" lon="3.2643992849629324"/>
          <point xsi:type="esdl:Point" lat="53.494805609327464" lon="3.264415091440194"/>
          <point xsi:type="esdl:Point" lat="53.4949043828116" lon="3.2644609272948464"/>
          <point xsi:type="esdl:Point" lat="53.49513794809206" lon="3.264522667004138"/>
          <point xsi:type="esdl:Point" lat="53.495236682774284" lon="3.264583575646027"/>
          <point xsi:type="esdl:Point" lat="53.497805408783705" lon="3.265504055090101"/>
          <point xsi:type="esdl:Point" lat="53.498119843393056" lon="3.2655813895886565"/>
          <point xsi:type="esdl:Point" lat="53.49853296496785" lon="3.265734722090255"/>
          <point xsi:type="esdl:Point" lat="53.49864968691018" lon="3.2657957509357125"/>
          <point xsi:type="esdl:Point" lat="53.49970953115111" lon="3.2661641977342715"/>
          <point xsi:type="esdl:Point" lat="53.49982633919613" lon="3.266179994303115"/>
          <point xsi:type="esdl:Point" lat="53.508107444939775" lon="3.2690515313513187"/>
          <point xsi:type="esdl:Point" lat="53.50819728215601" lon="3.26906720895627"/>
          <point xsi:type="esdl:Point" lat="53.51015535644109" lon="3.269712907633903"/>
          <point xsi:type="esdl:Point" lat="53.51024519362757" lon="3.269728548210298"/>
          <point xsi:type="esdl:Point" lat="53.51048768405243" lon="3.2698205804584424"/>
          <point xsi:type="esdl:Point" lat="53.51057754009706" lon="3.2698362200017743"/>
          <point xsi:type="esdl:Point" lat="53.510793079914606" lon="3.2699130059171524"/>
          <point xsi:type="esdl:Point" lat="53.51090990700572" lon="3.2699288171465017"/>
          <point xsi:type="esdl:Point" lat="53.51123325212738" lon="3.2700364289574675"/>
          <point xsi:type="esdl:Point" lat="53.511340990219544" lon="3.270097430871433"/>
          <point xsi:type="esdl:Point" lat="53.517681709075816" lon="3.272400025782471"/>
          <point xsi:type="esdl:Point" lat="53.51801412143881" lon="3.2724775648992823"/>
          <point xsi:type="esdl:Point" lat="53.5204750702941" lon="3.273322900081194"/>
          <point xsi:type="esdl:Point" lat="53.520915253801896" lon="3.2734313055087965"/>
          <point xsi:type="esdl:Point" lat="53.52101407127032" lon="3.2734621275506113"/>
          <point xsi:type="esdl:Point" lat="53.52112189654941" lon="3.273477894475051"/>
          <point xsi:type="esdl:Point" lat="53.52683394276166" lon="3.275520992888269"/>
          <point xsi:type="esdl:Point" lat="53.52693279888921" lon="3.2755367165947606"/>
          <point xsi:type="esdl:Point" lat="53.52823511277985" lon="3.2759826555192584"/>
          <point xsi:type="esdl:Point" lat="53.528333881134536" lon="3.276028578762022"/>
          <point xsi:type="esdl:Point" lat="53.52921415074717" lon="3.276290747559166"/>
          <point xsi:type="esdl:Point" lat="53.529303936790576" lon="3.27633658997152"/>
          <point xsi:type="esdl:Point" lat="53.529528477332725" lon="3.276413477585172"/>
          <point xsi:type="esdl:Point" lat="53.529959426327" lon="3.27662748213038"/>
          <point xsi:type="esdl:Point" lat="53.535590872039805" lon="3.2785200632093865"/>
          <point xsi:type="esdl:Point" lat="53.53568962758567" lon="3.278581053876444"/>
          <point xsi:type="esdl:Point" lat="53.53622846143497" lon="3.27878071838121"/>
          <point xsi:type="esdl:Point" lat="53.536327298085055" lon="3.2787964531010463"/>
          <point xsi:type="esdl:Point" lat="53.53665063906706" lon="3.2789041960840097"/>
          <point xsi:type="esdl:Point" lat="53.5367494007846" lon="3.278950120162206"/>
          <point xsi:type="esdl:Point" lat="53.53752188443183" lon="3.2791815197025422"/>
          <point xsi:type="esdl:Point" lat="53.53762972211281" lon="3.2791973075217955"/>
          <point xsi:type="esdl:Point" lat="53.54010843733681" lon="3.28010393568979"/>
          <point xsi:type="esdl:Point" lat="53.540207273759115" lon="3.280119667418237"/>
          <point xsi:type="esdl:Point" lat="53.54095267759247" lon="3.280396206457184"/>
          <point xsi:type="esdl:Point" lat="53.54106039539342" lon="3.2804572775414256"/>
          <point xsi:type="esdl:Point" lat="53.54335045832704" lon="3.2813175112104584"/>
          <point xsi:type="esdl:Point" lat="53.54358406712235" lon="3.2813643424343786"/>
          <point xsi:type="esdl:Point" lat="53.54507486281405" lon="3.281917528974859"/>
          <point xsi:type="esdl:Point" lat="53.54519165202983" lon="3.281948467213756"/>
          <point xsi:type="esdl:Point" lat="53.54529934467533" lon="3.282009548215398"/>
          <point xsi:type="esdl:Point" lat="53.547733587054616" lon="3.2827199881162317"/>
          <point xsi:type="esdl:Point" lat="53.549987826256384" lon="3.2835198782106385"/>
          <point xsi:type="esdl:Point" lat="53.55007760383012" lon="3.283565735840454"/>
          <point xsi:type="esdl:Point" lat="53.550302210388786" lon="3.283612525319663"/>
          <point xsi:type="esdl:Point" lat="53.55085909906415" lon="3.283782277767014"/>
          <point xsi:type="esdl:Point" lat="53.55096684085252" lon="3.2838282797471114"/>
          <point xsi:type="esdl:Point" lat="53.5510656765845" lon="3.2838440242765508"/>
          <point xsi:type="esdl:Point" lat="53.55444228117468" lon="3.2851497038656707"/>
          <point xsi:type="esdl:Point" lat="53.56416859901557" lon="3.288597156600724"/>
          <point xsi:type="esdl:Point" lat="53.564267433879714" lon="3.2886129172639067"/>
          <point xsi:type="esdl:Point" lat="53.56623434632181" lon="3.2892755397523343"/>
          <point xsi:type="esdl:Point" lat="53.566333181886016" lon="3.289291334488616"/>
          <point xsi:type="esdl:Point" lat="53.568156225931574" lon="3.2899530687767897"/>
          <point xsi:type="esdl:Point" lat="53.56825497051181" lon="3.290014134659786"/>
          <point xsi:type="esdl:Point" lat="53.5729159721043" lon="3.2916769874691267"/>
          <point xsi:type="esdl:Point" lat="53.57323040781402" lon="3.2917395489213077"/>
          <point xsi:type="esdl:Point" lat="53.573248318195624" lon="3.291769893652279"/>
          <point xsi:type="esdl:Point" lat="53.579229699577674" lon="3.2938047388207736"/>
          <point xsi:type="esdl:Point" lat="53.57933752993317" lon="3.2938206114499726"/>
          <point xsi:type="esdl:Point" lat="53.585031200767325" lon="3.2958691688353414"/>
          <point xsi:type="esdl:Point" lat="53.58514789185951" lon="3.295930405901298"/>
          <point xsi:type="esdl:Point" lat="53.585911311570634" lon="3.2961774224462363"/>
          <point xsi:type="esdl:Point" lat="53.58601912717534" lon="3.296193271862968"/>
          <point xsi:type="esdl:Point" lat="53.587330350398034" lon="3.2966405276817397"/>
          <point xsi:type="esdl:Point" lat="53.587429188199756" lon="3.296656347678647"/>
          <point xsi:type="esdl:Point" lat="53.5895935412165" lon="3.297411750011165"/>
          <point xsi:type="esdl:Point" lat="53.594038959949025" lon="3.2989689718935566"/>
          <point xsi:type="esdl:Point" lat="53.594128810713165" lon="3.298984736437461"/>
          <point xsi:type="esdl:Point" lat="53.5962931507586" lon="3.2997403785572783"/>
          <point xsi:type="esdl:Point" lat="53.59640985842691" lon="3.299801666988903"/>
          <point xsi:type="esdl:Point" lat="53.60063060473246" lon="3.3013275608174637"/>
          <point xsi:type="esdl:Point" lat="53.600747383134554" lon="3.301358625413388"/>
          <point xsi:type="esdl:Point" lat="53.600756251127336" lon="3.301404000297553"/>
          <point xsi:type="esdl:Point" lat="53.60095392145851" lon="3.3014356410998498"/>
          <point xsi:type="esdl:Point" lat="53.60290274170463" lon="3.3020993426356147"/>
          <point xsi:type="esdl:Point" lat="53.60301057594101" lon="3.302115221346408"/>
          <point xsi:type="esdl:Point" lat="53.61406540254175" lon="3.306048739186632"/>
          <point xsi:type="esdl:Point" lat="53.61449633355437" lon="3.3062483852400018"/>
          <point xsi:type="esdl:Point" lat="53.614613105961546" lon="3.3062794419577015"/>
          <point xsi:type="esdl:Point" lat="53.614720847646595" lon="3.306325572630447"/>
          <point xsi:type="esdl:Point" lat="53.61483762357868" lon="3.30635664639817"/>
          <point xsi:type="esdl:Point" lat="53.61494536073673" lon="3.3064027759659878"/>
          <point xsi:type="esdl:Point" lat="53.61539454604576" lon="3.3064967375707837"/>
          <point xsi:type="esdl:Point" lat="53.619723150397846" lon="3.307994552282402"/>
          <point xsi:type="esdl:Point" lat="53.62375535221369" lon="3.3093997796858443"/>
          <point xsi:type="esdl:Point" lat="53.62430353748862" lon="3.3094340392927903"/>
          <point xsi:type="esdl:Point" lat="53.62397086103328" lon="3.3094769743436605"/>
          <point xsi:type="esdl:Point" lat="53.62670095630383" lon="3.3104041910805004"/>
          <point xsi:type="esdl:Point" lat="53.62679978811229" lon="3.3104200038369855"/>
          <point xsi:type="esdl:Point" lat="53.62917939700978" lon="3.3113145497362737"/>
          <point xsi:type="esdl:Point" lat="53.62930515432034" lon="3.31134569753416"/>
          <point xsi:type="esdl:Point" lat="53.6294039063033" lon="3.311391789597315"/>
          <point xsi:type="esdl:Point" lat="53.62995176062237" lon="3.3115621625379816"/>
          <point xsi:type="esdl:Point" lat="53.63005051248775" lon="3.311608264886847"/>
          <point xsi:type="esdl:Point" lat="53.630167287570465" lon="3.311639379788427"/>
          <point xsi:type="esdl:Point" lat="53.63057127785531" lon="3.311823808470715"/>
          <point xsi:type="esdl:Point" lat="53.638491730199796" lon="3.314634953372385"/>
          <point xsi:type="esdl:Point" lat="53.63925506824295" lon="3.3148977446391394"/>
          <point xsi:type="esdl:Point" lat="53.63991980904709" lon="3.3150539503123424"/>
          <point xsi:type="esdl:Point" lat="53.64241606676244" lon="3.316010381708509"/>
          <point xsi:type="esdl:Point" lat="53.642523798720134" lon="3.3160565677354423"/>
          <point xsi:type="esdl:Point" lat="53.643296274827236" lon="3.316259006471368"/>
          <point xsi:type="esdl:Point" lat="53.64342207044757" lon="3.316275063695375"/>
          <point xsi:type="esdl:Point" lat="53.65188093502984" lon="3.319379430671341"/>
          <point xsi:type="esdl:Point" lat="53.652752169600745" lon="3.3196129539188397"/>
          <point xsi:type="esdl:Point" lat="53.65555387244674" lon="3.320617651184368"/>
          <point xsi:type="esdl:Point" lat="53.65566170757873" lon="3.320633630766985"/>
          <point xsi:type="esdl:Point" lat="53.65577842044939" lon="3.3206798856318187"/>
          <point xsi:type="esdl:Point" lat="53.655877249341756" lon="3.320695780467372"/>
          <point xsi:type="esdl:Point" lat="53.655993980967324" lon="3.3207420691807252"/>
          <point xsi:type="esdl:Point" lat="53.656209582125975" lon="3.320789067886547"/>
          <point xsi:type="esdl:Point" lat="53.65741290564256" lon="3.3212067832809367"/>
          <point xsi:type="esdl:Point" lat="53.65762849217646" lon="3.32125378737665"/>
          <point xsi:type="esdl:Point" lat="53.66143567671085" lon="3.322705268593898"/>
          <point xsi:type="esdl:Point" lat="53.66152552330081" lon="3.32272107752356"/>
          <point xsi:type="esdl:Point" lat="53.66315096140139" lon="3.3232631883306607"/>
          <point xsi:type="esdl:Point" lat="53.66324968168599" lon="3.323324470015938"/>
          <point xsi:type="esdl:Point" lat="53.666410654948386" lon="3.3244080950589594"/>
          <point xsi:type="esdl:Point" lat="53.66651836185251" lon="3.3244694940821793"/>
          <point xsi:type="esdl:Point" lat="53.6670481234393" lon="3.324670296968005"/>
          <point xsi:type="esdl:Point" lat="53.667155851541395" lon="3.324716532249566"/>
          <point xsi:type="esdl:Point" lat="53.66800913257401" lon="3.3249501208225523"/>
          <point xsi:type="esdl:Point" lat="53.6681169426981" lon="3.3249660828251395"/>
          <point xsi:type="esdl:Point" lat="53.668574963178756" lon="3.325105839150731"/>
          <point xsi:type="esdl:Point" lat="53.66941887230174" lon="3.3254755745645985"/>
          <point xsi:type="esdl:Point" lat="53.66951757234754" lon="3.3255369097804834"/>
          <point xsi:type="esdl:Point" lat="53.67092736923118" lon="3.3260472432593304"/>
          <point xsi:type="esdl:Point" lat="53.6710441619582" lon="3.3260633042742276"/>
          <point xsi:type="esdl:Point" lat="53.67340584936819" lon="3.326898960234717"/>
          <point xsi:type="esdl:Point" lat="53.67470818313034" lon="3.327257198326859"/>
          <point xsi:type="esdl:Point" lat="53.67546239910365" lon="3.327550656101119"/>
          <point xsi:type="esdl:Point" lat="53.67556110246172" lon="3.3276120050342786"/>
          <point xsi:type="esdl:Point" lat="53.676539819360684" lon="3.327982899499441"/>
          <point xsi:type="esdl:Point" lat="53.676656588260336" lon="3.3280140944139642"/>
          <point xsi:type="esdl:Point" lat="53.67676431574692" lon="3.328060356429388"/>
          <point xsi:type="esdl:Point" lat="53.676764274311665" lon="3.3280754841845366"/>
          <point xsi:type="esdl:Point" lat="53.67698889955885" lon="3.3281075191855463"/>
          <point xsi:type="esdl:Point" lat="53.67709664596855" lon="3.328153748646024"/>
          <point xsi:type="esdl:Point" lat="53.677518797325924" lon="3.328263002298851"/>
          <point xsi:type="esdl:Point" lat="53.677626483211" lon="3.3283244015376656"/>
          <point xsi:type="esdl:Point" lat="53.67815626050011" lon="3.3285253305739078"/>
          <point xsi:type="esdl:Point" lat="53.67837163098637" lon="3.328648149209733"/>
          <point xsi:type="esdl:Point" lat="53.679116898200405" lon="3.328926425644338"/>
          <point xsi:type="esdl:Point" lat="53.68012299566635" lon="3.3291462211430924"/>
          <point xsi:type="esdl:Point" lat="53.681209363904955" lon="3.3295937530321176"/>
          <point xsi:type="esdl:Point" lat="53.68142475661949" lon="3.3297165544562217"/>
          <point xsi:type="esdl:Point" lat="53.68173905083232" lon="3.3298249909296014"/>
          <point xsi:type="esdl:Point" lat="53.68183779915191" lon="3.329871193027395"/>
          <point xsi:type="esdl:Point" lat="53.682852704925054" lon="3.330151656311745"/>
          <point xsi:type="esdl:Point" lat="53.68523217880608" lon="3.331033351388686"/>
          <point xsi:type="esdl:Point" lat="53.68556454703172" lon="3.331111679334114"/>
          <point xsi:type="esdl:Point" lat="53.68588782714516" lon="3.331220183253005"/>
          <point xsi:type="esdl:Point" lat="53.68600461797764" lon="3.331236255362096"/>
          <point xsi:type="esdl:Point" lat="53.686543372322284" lon="3.331437348448675"/>
          <point xsi:type="esdl:Point" lat="53.68674979870102" lon="3.3315449319357593"/>
          <point xsi:type="esdl:Point" lat="53.687198833322796" lon="3.3316847516105446"/>
          <point xsi:type="esdl:Point" lat="53.68742349465193" lon="3.331701656610618"/>
          <point xsi:type="esdl:Point" lat="53.68969520635441" lon="3.332552404402627"/>
          <point xsi:type="esdl:Point" lat="53.6898030150313" lon="3.3325683957621575"/>
          <point xsi:type="esdl:Point" lat="53.69260451019297" lon="3.3336051206894597"/>
          <point xsi:type="esdl:Point" lat="53.69270321561488" lon="3.333666468014635"/>
          <point xsi:type="esdl:Point" lat="53.6937000998283" lon="3.333962095049627"/>
          <point xsi:type="esdl:Point" lat="53.69381689010322" lon="3.3339781853765516"/>
          <point xsi:type="esdl:Point" lat="53.69402346477793" lon="3.3340403983722333"/>
          <point xsi:type="esdl:Point" lat="53.69574702328497" lon="3.3348264452664154"/>
          <point xsi:type="esdl:Point" lat="53.696707956456706" lon="3.3351218751840848"/>
          <point xsi:type="esdl:Point" lat="53.697040345746615" lon="3.335185090043853"/>
          <point xsi:type="esdl:Point" lat="53.69747134481334" lon="3.335339950983992"/>
          <point xsi:type="esdl:Point" lat="53.697579157388766" lon="3.335355975248811"/>
          <point xsi:type="esdl:Point" lat="53.700740020624494" lon="3.3364413937603308"/>
          <point xsi:type="esdl:Point" lat="53.701503802355994" lon="3.336523235160566"/>
          <point xsi:type="esdl:Point" lat="53.70162064012407" lon="3.3365241672255554"/>
          <point xsi:type="esdl:Point" lat="53.70313880449916" lon="3.336839217552772"/>
          <point xsi:type="esdl:Point" lat="53.70323758327458" lon="3.336870322402204"/>
          <point xsi:type="esdl:Point" lat="53.7033543784203" lon="3.336886400341361"/>
          <point xsi:type="esdl:Point" lat="53.703462149093404" lon="3.3369175363713173"/>
          <point xsi:type="esdl:Point" lat="53.706445582600224" lon="3.337168636971947"/>
          <point xsi:type="esdl:Point" lat="53.70656246288978" lon="3.3371544234771786"/>
          <point xsi:type="esdl:Point" lat="53.70746123877693" lon="3.337176756538373"/>
          <point xsi:type="esdl:Point" lat="53.70767704454622" lon="3.337148162596941"/>
          <point xsi:type="esdl:Point" lat="53.708890348408694" lon="3.3371881822553875"/>
          <point xsi:type="esdl:Point" lat="53.708989193082296" lon="3.337204112197102"/>
          <point xsi:type="esdl:Point" lat="53.70945656688218" lon="3.3372078492515658"/>
          <point xsi:type="esdl:Point" lat="53.709555477888905" lon="3.337193500299836"/>
          <point xsi:type="esdl:Point" lat="53.70966328557891" lon="3.337209502178638"/>
          <point xsi:type="esdl:Point" lat="53.70978018466345" lon="3.3371952969932863"/>
          <point xsi:type="esdl:Point" lat="53.70988803585472" lon="3.3371961593490096"/>
          <point xsi:type="esdl:Point" lat="53.7130804909922" lon="3.3366307605356345"/>
          <point xsi:type="esdl:Point" lat="53.713323374207846" lon="3.3365569617611213"/>
          <point xsi:type="esdl:Point" lat="53.715158148411454" lon="3.3361473336027903"/>
          <point xsi:type="esdl:Point" lat="53.71526612618554" lon="3.336102720283374"/>
          <point xsi:type="esdl:Point" lat="53.71549096116865" lon="3.336059053303177"/>
          <point xsi:type="esdl:Point" lat="53.715580970560715" lon="3.3360143128721482"/>
          <point xsi:type="esdl:Point" lat="53.71690350121397" lon="3.335570277100445"/>
          <point xsi:type="esdl:Point" lat="53.71711954639101" lon="3.3354507743709125"/>
          <point xsi:type="esdl:Point" lat="53.718829112853946" lon="3.3348127722520213"/>
          <point xsi:type="esdl:Point" lat="53.720332176570366" lon="3.3340972828131776"/>
          <point xsi:type="esdl:Point" lat="53.72044909393997" lon="3.3340679219171054"/>
          <point xsi:type="esdl:Point" lat="53.7218982560166" lon="3.333336808152391"/>
          <point xsi:type="esdl:Point" lat="53.722951579578655" lon="3.332723791774812"/>
          <point xsi:type="esdl:Point" lat="53.72305958020839" lon="3.33267916929258"/>
          <point xsi:type="esdl:Point" lat="53.72601316950251" lon="3.3307170202165874"/>
          <point xsi:type="esdl:Point" lat="53.7261122931335" lon="3.3306268490172"/>
          <point xsi:type="esdl:Point" lat="53.726301377528806" lon="3.3305071003109763"/>
          <point xsi:type="esdl:Point" lat="53.72902204019881" lon="3.328254816032515"/>
          <point xsi:type="esdl:Point" lat="53.72910319365671" lon="3.3281645018033683"/>
          <point xsi:type="esdl:Point" lat="53.729490574514834" lon="3.327834079747555"/>
          <point xsi:type="esdl:Point" lat="53.72957172315695" lon="3.327743763667879"/>
          <point xsi:type="esdl:Point" lat="53.72967978498523" lon="3.3276687959965345"/>
          <point xsi:type="esdl:Point" lat="53.73035572170926" lon="3.3270071138465798"/>
          <point xsi:type="esdl:Point" lat="53.7340698704777" lon="3.322958118133537"/>
          <point xsi:type="esdl:Point" lat="53.734151101545805" lon="3.3228374770858258"/>
          <point xsi:type="esdl:Point" lat="53.73461095648751" lon="3.3222952603314204"/>
          <point xsi:type="esdl:Point" lat="53.73470120950777" lon="3.3221595289972905"/>
          <point xsi:type="esdl:Point" lat="53.734971704658065" lon="3.3218432490920464"/>
          <point xsi:type="esdl:Point" lat="53.736342683200284" lon="3.320064837875922"/>
          <point xsi:type="esdl:Point" lat="53.73643284830393" lon="3.3199593960443403"/>
          <point xsi:type="esdl:Point" lat="53.73752457761561" lon="3.318406157534463"/>
          <point xsi:type="esdl:Point" lat="53.737605820960425" lon="3.3182703404561398"/>
          <point xsi:type="esdl:Point" lat="53.73768700707186" lon="3.3181648298944553"/>
          <point xsi:type="esdl:Point" lat="53.74062036407743" lon="3.313547569912962"/>
          <point xsi:type="esdl:Point" lat="53.74069266331781" lon="3.313396484124839"/>
          <point xsi:type="esdl:Point" lat="53.74122534613453" lon="3.312490729990666"/>
          <point xsi:type="esdl:Point" lat="53.74142414979661" lon="3.312082851732542"/>
          <point xsi:type="esdl:Point" lat="53.741740178108195" lon="3.3115242153557776"/>
          <point xsi:type="esdl:Point" lat="53.74307750100912" lon="3.308804837582463"/>
          <point xsi:type="esdl:Point" lat="53.743158737907216" lon="3.3086689992859317"/>
          <point xsi:type="esdl:Point" lat="53.74423442751399" lon="3.306296302733713"/>
          <point xsi:type="esdl:Point" lat="53.74428874476729" lon="3.3061450927175686"/>
          <point xsi:type="esdl:Point" lat="53.74462319719963" lon="3.3054045328801807"/>
          <point xsi:type="esdl:Point" lat="53.74469544300009" lon="3.305268602721929"/>
          <point xsi:type="esdl:Point" lat="53.74541882355134" lon="3.3035755675970204"/>
          <point xsi:type="esdl:Point" lat="53.74547311856058" lon="3.303424325421189"/>
          <point xsi:type="esdl:Point" lat="53.74554540502695" lon="3.303273204823348"/>
          <point xsi:type="esdl:Point" lat="53.74620583656023" lon="3.3015796506518678"/>
          <point xsi:type="esdl:Point" lat="53.746278078098975" lon="3.3014436769792246"/>
          <point xsi:type="esdl:Point" lat="53.74639569651882" lon="3.301141261824788"/>
          <point xsi:type="esdl:Point" lat="53.74661303377868" lon="3.300490781675409"/>
          <point xsi:type="esdl:Point" lat="53.74668536887778" lon="3.300324506723304"/>
          <point xsi:type="esdl:Point" lat="53.7481702004024" lon="3.295998104037054"/>
          <point xsi:type="esdl:Point" lat="53.74821554138669" lon="3.295831618043739"/>
          <point xsi:type="esdl:Point" lat="53.748269854428585" lon="3.295680380269653"/>
          <point xsi:type="esdl:Point" lat="53.74943018383482" lon="3.291669879001469"/>
          <point xsi:type="esdl:Point" lat="53.7494756015707" lon="3.2914730437317075"/>
          <point xsi:type="esdl:Point" lat="53.74952091824136" lon="3.2913217335983256"/>
          <point xsi:type="esdl:Point" lat="53.751065611931125" lon="3.284371559145616"/>
          <point xsi:type="esdl:Point" lat="53.751110936792955" lon="3.2842050400404004"/>
          <point xsi:type="esdl:Point" lat="53.751647493439826" lon="3.2815546946525656"/>
          <point xsi:type="esdl:Point" lat="53.75183827522809" lon="3.2806915305802615"/>
          <point xsi:type="esdl:Point" lat="53.751865666644974" lon="3.2805097390641866"/>
          <point xsi:type="esdl:Point" lat="53.752501766473216" lon="3.277541500199228"/>
          <point xsi:type="esdl:Point" lat="53.75254708633306" lon="3.2773749756502206"/>
          <point xsi:type="esdl:Point" lat="53.75724340663875" lon="3.25514006759089"/>
          <point xsi:type="esdl:Point" lat="53.75728868999544" lon="3.25497350157565"/>
          <point xsi:type="esdl:Point" lat="53.75934949997908" lon="3.245156969024047"/>
          <point xsi:type="esdl:Point" lat="53.75943105101133" lon="3.2448389114696363"/>
          <point xsi:type="esdl:Point" lat="53.76244355560387" lon="3.2305062413358594"/>
          <point xsi:type="esdl:Point" lat="53.762488814629755" lon="3.230339628212966"/>
          <point xsi:type="esdl:Point" lat="53.76318736153706" lon="3.2269606185506006"/>
          <point xsi:type="esdl:Point" lat="53.76323261112695" lon="3.226794006227208"/>
          <point xsi:type="esdl:Point" lat="53.76325991993253" lon="3.2266121287154106"/>
          <point xsi:type="esdl:Point" lat="53.76491918485715" lon="3.218853878413998"/>
          <point xsi:type="esdl:Point" lat="53.76494648700104" lon="3.2186719975694515"/>
          <point xsi:type="esdl:Point" lat="53.76524565290591" lon="3.217262700528277"/>
          <point xsi:type="esdl:Point" lat="53.76528193997312" lon="3.2170808484208355"/>
          <point xsi:type="esdl:Point" lat="53.76533617983713" lon="3.2168990703255913"/>
          <point xsi:type="esdl:Point" lat="53.76553545158377" lon="3.2160505708101255"/>
          <point xsi:type="esdl:Point" lat="53.765717106460876" lon="3.2150047385109444"/>
          <point xsi:type="esdl:Point" lat="53.765843891478816" lon="3.2144744176697397"/>
          <point xsi:type="esdl:Point" lat="53.76602523095219" lon="3.213595435190546"/>
          <point xsi:type="esdl:Point" lat="53.76607049345046" lon="3.213413637251517"/>
          <point xsi:type="esdl:Point" lat="53.76617033375876" lon="3.21286799555331"/>
          <point xsi:type="esdl:Point" lat="53.76620658186016" lon="3.212701301725771"/>
          <point xsi:type="esdl:Point" lat="53.766233896239584" lon="3.2125042026836925"/>
          <point xsi:type="esdl:Point" lat="53.77004832717392" lon="3.194605269093526"/>
          <point xsi:type="esdl:Point" lat="53.77007558722475" lon="3.1944233016963017"/>
          <point xsi:type="esdl:Point" lat="53.771451925891974" lon="3.188072373939069"/>
          <point xsi:type="esdl:Point" lat="53.7714971358357" lon="3.1879056703468427"/>
          <point xsi:type="esdl:Point" lat="53.77204957036959" lon="3.185237727043441"/>
          <point xsi:type="esdl:Point" lat="53.772076826062886" lon="3.1850406220994314"/>
          <point xsi:type="esdl:Point" lat="53.772321401859244" lon="3.1838126826970328"/>
          <point xsi:type="esdl:Point" lat="53.773172429091034" lon="3.1797651616044624"/>
          <point xsi:type="esdl:Point" lat="53.77319964923424" lon="3.1795983821944263"/>
          <point xsi:type="esdl:Point" lat="53.77332628142982" lon="3.1790526806863877"/>
          <point xsi:type="esdl:Point" lat="53.77335351946501" lon="3.1788858926974406"/>
          <point xsi:type="esdl:Point" lat="53.77339874749194" lon="3.1786888220241587"/>
          <point xsi:type="esdl:Point" lat="53.773425965253345" lon="3.1785220334243576"/>
          <point xsi:type="esdl:Point" lat="53.7734711430282" lon="3.178355320750164"/>
          <point xsi:type="esdl:Point" lat="53.774394568371754" lon="3.1738374887657015"/>
          <point xsi:type="esdl:Point" lat="53.774421774891195" lon="3.1736706915330903"/>
          <point xsi:type="esdl:Point" lat="53.77466593393998" lon="3.1726550482509093"/>
          <point xsi:type="esdl:Point" lat="53.77605965177513" lon="3.1658930873882074"/>
          <point xsi:type="esdl:Point" lat="53.776674641509786" lon="3.163133753063094"/>
          <point xsi:type="esdl:Point" lat="53.77670181342659" lon="3.1629821037078942"/>
          <point xsi:type="esdl:Point" lat="53.77682834680913" lon="3.162466684578763"/>
          <point xsi:type="esdl:Point" lat="53.7775701558493" lon="3.158903478206066"/>
          <point xsi:type="esdl:Point" lat="53.77759736709439" lon="3.1587214717590757"/>
          <point xsi:type="esdl:Point" lat="53.778058572203584" lon="3.156583543510356"/>
          <point xsi:type="esdl:Point" lat="53.77808579971505" lon="3.1563863599727426"/>
          <point xsi:type="esdl:Point" lat="53.77816716001153" lon="3.1560224785112725"/>
          <point xsi:type="esdl:Point" lat="53.77929836612426" lon="3.1500020279484446"/>
          <point xsi:type="esdl:Point" lat="53.782091018574036" lon="3.137233459067371"/>
          <point xsi:type="esdl:Point" lat="53.782127122283896" lon="3.1370970018944915"/>
          <point xsi:type="esdl:Point" lat="53.782163299671524" lon="3.1368998234503254"/>
          <point xsi:type="esdl:Point" lat="53.78220842406179" lon="3.136733023792263"/>
          <point xsi:type="esdl:Point" lat="53.782280756245754" lon="3.136369047082423"/>
          <point xsi:type="esdl:Point" lat="53.78240716173848" lon="3.1358534626453127"/>
          <point xsi:type="esdl:Point" lat="53.78387104558755" lon="3.1288008579809787"/>
          <point xsi:type="esdl:Point" lat="53.78419630742156" lon="3.1272234146262825"/>
          <point xsi:type="esdl:Point" lat="53.784358828480904" lon="3.1265105814518352"/>
          <point xsi:type="esdl:Point" lat="53.78438600940252" lon="3.1263285489537025"/>
          <point xsi:type="esdl:Point" lat="53.78521695794742" lon="3.1224304086109136"/>
          <point xsi:type="esdl:Point" lat="53.785244093848" lon="3.1222635290656724"/>
          <point xsi:type="esdl:Point" lat="53.785361460208534" lon="3.1217630144783084"/>
          <point xsi:type="esdl:Point" lat="53.78569563186662" lon="3.1201551596298485"/>
          <point xsi:type="esdl:Point" lat="53.785740752644" lon="3.119973136555043"/>
          <point xsi:type="esdl:Point" lat="53.785767869057075" lon="3.119821435663495"/>
          <point xsi:type="esdl:Point" lat="53.78581296966865" lon="3.1196546109514194"/>
          <point xsi:type="esdl:Point" lat="53.78599363413848" lon="3.118759642188177"/>
          <point xsi:type="esdl:Point" lat="53.78605691098073" lon="3.1183955460383372"/>
          <point xsi:type="esdl:Point" lat="53.78613815988942" lon="3.1180466969219487"/>
          <point xsi:type="esdl:Point" lat="53.78616528571545" lon="3.1178646495926308"/>
          <point xsi:type="esdl:Point" lat="53.78782663042486" lon="3.1099461503997357"/>
          <point xsi:type="esdl:Point" lat="53.78787173707047" lon="3.1097793069577864"/>
          <point xsi:type="esdl:Point" lat="53.788133537623935" lon="3.108520169362014"/>
          <point xsi:type="esdl:Point" lat="53.788160654156904" lon="3.1083532768181517"/>
          <point xsi:type="esdl:Point" lat="53.78820573883863" lon="3.1081863969046024"/>
          <point xsi:type="esdl:Point" lat="53.793339623322396" lon="3.0836680316250784"/>
          <point xsi:type="esdl:Point" lat="53.7933667052571" lon="3.0835011023670704"/>
          <point xsi:type="esdl:Point" lat="53.79344784335987" lon="3.0831369232398473"/>
          <point xsi:type="esdl:Point" lat="53.793474935073256" lon="3.082954791379061"/>
          <point xsi:type="esdl:Point" lat="53.79355607633086" lon="3.082605812150687"/>
          <point xsi:type="esdl:Point" lat="53.79358317620442" lon="3.082423702262692"/>
          <point xsi:type="esdl:Point" lat="53.79564769477003" lon="3.072772457037405"/>
          <point xsi:type="esdl:Point" lat="53.795674775214486" lon="3.072590340843237"/>
          <point xsi:type="esdl:Point" lat="53.79582800918111" lon="3.0718770469138974"/>
          <point xsi:type="esdl:Point" lat="53.795873037650836" lon="3.071710129289072"/>
          <point xsi:type="esdl:Point" lat="53.796197565778996" lon="3.070101468427224"/>
          <point xsi:type="esdl:Point" lat="53.796332686941525" lon="3.069585528886082"/>
          <point xsi:type="esdl:Point" lat="53.796594031521444" lon="3.0683866111759044"/>
          <point xsi:type="esdl:Point" lat="53.79673836883021" lon="3.0674759407867604"/>
          <point xsi:type="esdl:Point" lat="53.7986936771106" lon="3.0581571131348584"/>
          <point xsi:type="esdl:Point" lat="53.79872073086919" lon="3.0579749500127003"/>
          <point xsi:type="esdl:Point" lat="53.79895493621672" lon="3.0568973054318174"/>
          <point xsi:type="esdl:Point" lat="53.799018013478864" lon="3.056548198579791"/>
          <point xsi:type="esdl:Point" lat="53.79906304486916" lon="3.056381253412619"/>
          <point xsi:type="esdl:Point" lat="53.79909908682906" lon="3.0561991223423495"/>
          <point xsi:type="esdl:Point" lat="53.79914408726957" lon="3.0560473575626186"/>
          <point xsi:type="esdl:Point" lat="53.79982872154928" lon="3.0526624958343187"/>
          <point xsi:type="esdl:Point" lat="53.80044117461055" lon="3.0497177617480955"/>
          <point xsi:type="esdl:Point" lat="53.80052222982889" lon="3.049353456102148"/>
          <point xsi:type="esdl:Point" lat="53.8005672278244" lon="3.0491864956995487"/>
          <point xsi:type="esdl:Point" lat="53.80133269925848" lon="3.0454674829997077"/>
          <point xsi:type="esdl:Point" lat="53.80195391433239" lon="3.042644036685318"/>
          <point xsi:type="esdl:Point" lat="53.802043975199744" lon="3.042097474124113"/>
          <point xsi:type="esdl:Point" lat="53.80427626512224" lon="3.031592127884507"/>
          <point xsi:type="esdl:Point" lat="53.804321257763014" lon="3.0314403089633135"/>
          <point xsi:type="esdl:Point" lat="53.804402234601824" lon="3.031091141726534"/>
          <point xsi:type="esdl:Point" lat="53.80446524059979" lon="3.0307267526540462"/>
          <point xsi:type="esdl:Point" lat="53.805158157071126" lon="3.0273562708154547"/>
          <point xsi:type="esdl:Point" lat="53.80520312891481" lon="3.0271892380715255"/>
          <point xsi:type="esdl:Point" lat="53.80533810655711" lon="3.026490851181269"/>
          <point xsi:type="esdl:Point" lat="53.80538307179956" lon="3.0263238410928515"/>
          <point xsi:type="esdl:Point" lat="53.80544609085346" lon="3.025944269674595"/>
          <point xsi:type="esdl:Point" lat="53.80549105868554" lon="3.0258076466637314"/>
          <point xsi:type="esdl:Point" lat="53.80638176884569" lon="3.0213741009882793"/>
          <point xsi:type="esdl:Point" lat="53.80640874692749" lon="3.0211918960405613"/>
          <point xsi:type="esdl:Point" lat="53.80840541889535" lon="3.011716892036467"/>
          <point xsi:type="esdl:Point" lat="53.808450373427156" lon="3.0115498691290905"/>
          <point xsi:type="esdl:Point" lat="53.80986198127801" lon="3.004625278417195"/>
          <point xsi:type="esdl:Point" lat="53.81022155414039" lon="3.0030610858058284"/>
          <point xsi:type="esdl:Point" lat="53.81024852937996" lon="3.002848477610881"/>
          <point xsi:type="esdl:Point" lat="53.810859758216054" lon="2.999871916914827"/>
          <point xsi:type="esdl:Point" lat="53.81094064317738" lon="2.9995529946690724"/>
          <point xsi:type="esdl:Point" lat="53.81103950832144" lon="2.9990062621735656"/>
          <point xsi:type="esdl:Point" lat="53.81109344127718" lon="2.9988240310219902"/>
          <point xsi:type="esdl:Point" lat="53.81144395220018" lon="2.9970774878100648"/>
          <point xsi:type="esdl:Point" lat="53.811470913122484" lon="2.9968952544306675"/>
          <point xsi:type="esdl:Point" lat="53.81155178258359" lon="2.9965003907308185"/>
          <point xsi:type="esdl:Point" lat="53.81157875161535" lon="2.996318154988852"/>
          <point xsi:type="esdl:Point" lat="53.81165063520612" lon="2.9959688272321148"/>
          <point xsi:type="esdl:Point" lat="53.81169558216843" lon="2.9958017669817716"/>
          <point xsi:type="esdl:Point" lat="53.81178544948677" lon="2.9952854034268324"/>
          <point xsi:type="esdl:Point" lat="53.81183037661605" lon="2.9951183495006286"/>
          <point xsi:type="esdl:Point" lat="53.81186632096652" lon="2.9949361120967795"/>
          <point xsi:type="esdl:Point" lat="53.81191124761132" lon="2.9947690483699563"/>
          <point xsi:type="esdl:Point" lat="53.811983148447965" lon="2.9944045385459277"/>
          <point xsi:type="esdl:Point" lat="53.81207300541697" lon="2.9940704117031354"/>
          <point xsi:type="esdl:Point" lat="53.812207781285714" lon="2.993311025971152"/>
          <point xsi:type="esdl:Point" lat="53.81229764328926" lon="2.992976893477957"/>
          <point xsi:type="esdl:Point" lat="53.81266604249087" lon="2.991032826500487"/>
          <point xsi:type="esdl:Point" lat="53.81300745523279" lon="2.989468458708656"/>
          <point xsi:type="esdl:Point" lat="53.81308832550576" lon="2.9891342820722473"/>
          <point xsi:type="esdl:Point" lat="53.81492976265798" lon="2.980279057681843"/>
          <point xsi:type="esdl:Point" lat="53.814956688158766" lon="2.9800967984040168"/>
          <point xsi:type="esdl:Point" lat="53.81511836867506" lon="2.9793676899305446"/>
          <point xsi:type="esdl:Point" lat="53.81514528379224" lon="2.9791853958430004"/>
          <point xsi:type="esdl:Point" lat="53.81703988262182" lon="2.9701773971730985"/>
          <point xsi:type="esdl:Point" lat="53.81710270945577" lon="2.969797637863217"/>
          <point xsi:type="esdl:Point" lat="53.81752464289552" lon="2.9678531026478883"/>
          <point xsi:type="esdl:Point" lat="53.81756953176176" lon="2.9676859813929544"/>
          <point xsi:type="esdl:Point" lat="53.81883497514943" lon="2.9613205281560546"/>
          <point xsi:type="esdl:Point" lat="53.81944529909639" lon="2.9587225094897907"/>
          <point xsi:type="esdl:Point" lat="53.819481201714936" lon="2.9585250270467487"/>
          <point xsi:type="esdl:Point" lat="53.820064552016795" lon="2.9561092005631417"/>
          <point xsi:type="esdl:Point" lat="53.82011841520224" lon="2.9559268752321923"/>
          <point xsi:type="esdl:Point" lat="53.82015431093886" lon="2.9557597479765123"/>
          <point xsi:type="esdl:Point" lat="53.82020818393073" lon="2.9556077810488928"/>
          <point xsi:type="esdl:Point" lat="53.82074668549511" lon="2.953510958162473"/>
          <point xsi:type="esdl:Point" lat="53.821222232636735" lon="2.951459720114465"/>
          <point xsi:type="esdl:Point" lat="53.82165253507112" lon="2.9487248699832747"/>
          <point xsi:type="esdl:Point" lat="53.82175108942217" lon="2.9479956117067463"/>
          <point xsi:type="esdl:Point" lat="53.82241457691888" lon="2.9443793427934466"/>
          <point xsi:type="esdl:Point" lat="53.822459437777496" lon="2.944181790308763"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="61669.36039619275" name="Pipe_Noordgastransport B_V__1" capacity="14000000000.0" id="Pipe_Noordgastransport B_V__1" diameter="DN800">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="213a5e17-4364-4546-9355-bdc4fa14c3b2" connectedTo="41829d65-271e-4f8f-90ae-3281dc305c20"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="d6d8796d-94db-4624-bd8e-ccf69251cb85" id="971a5f2c-d76a-4d03-bb6c-63bcf03ce116" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.943742686207486" lon="3.6192539856492467"/>
          <point xsi:type="esdl:Point" lat="53.94444098216007" lon="3.6180454949793623"/>
          <point xsi:type="esdl:Point" lat="53.944441025462304" lon="3.6180454636281585"/>
          <point xsi:type="esdl:Point" lat="53.94785175179025" lon="3.6119402760535757"/>
          <point xsi:type="esdl:Point" lat="53.947851770664045" lon="3.6119402763230704"/>
          <point xsi:type="esdl:Point" lat="53.95196072401323" lon="3.604564150946025"/>
          <point xsi:type="esdl:Point" lat="53.95196072413483" lon="3.6045641265657475"/>
          <point xsi:type="esdl:Point" lat="53.95541574026774" lon="3.5984573763807117"/>
          <point xsi:type="esdl:Point" lat="53.95541575465045" lon="3.598457376587324"/>
          <point xsi:type="esdl:Point" lat="53.958145605904015" lon="3.5935280551083117"/>
          <point xsi:type="esdl:Point" lat="53.95814562477843" lon="3.5935280553778064"/>
          <point xsi:type="esdl:Point" lat="53.96224422039815" lon="3.5861939061539636"/>
          <point xsi:type="esdl:Point" lat="53.96224424466666" lon="3.586193906495324"/>
          <point xsi:type="esdl:Point" lat="53.96428447612236" lon="3.5825033282230705"/>
          <point xsi:type="esdl:Point" lat="53.96428449511555" lon="3.5825033040943213"/>
          <point xsi:type="esdl:Point" lat="53.96839147391732" lon="3.575151910477909"/>
          <point xsi:type="esdl:Point" lat="53.96839149279239" lon="3.57515191073842"/>
          <point xsi:type="esdl:Point" lat="53.9704673538951" lon="3.5714607098618094"/>
          <point xsi:type="esdl:Point" lat="53.97046735404833" lon="3.571460677854836"/>
          <point xsi:type="esdl:Point" lat="53.97181812090105" lon="3.56902466000147"/>
          <point xsi:type="esdl:Point" lat="53.97181814531721" lon="3.5690246283178904"/>
          <point xsi:type="esdl:Point" lat="53.97391149377724" lon="3.565394107048703"/>
          <point xsi:type="esdl:Point" lat="53.97391151276604" lon="3.565394082910972"/>
          <point xsi:type="esdl:Point" lat="53.97528019622282" lon="3.5629426413524867"/>
          <point xsi:type="esdl:Point" lat="53.97528021060397" lon="3.5629426415501158"/>
          <point xsi:type="esdl:Point" lat="53.97663109483506" lon="3.5604450926032176"/>
          <point xsi:type="esdl:Point" lat="53.976631094982984" lon="3.5604450605872615"/>
          <point xsi:type="esdl:Point" lat="53.98209620118721" lon="3.5506369609254724"/>
          <point xsi:type="esdl:Point" lat="53.98209621482117" lon="3.550636927562043"/>
          <point xsi:type="esdl:Point" lat="53.985521392477104" lon="3.5445514508663396"/>
          <point xsi:type="esdl:Point" lat="53.98552140685471" lon="3.544551451054986"/>
          <point xsi:type="esdl:Point" lat="53.988910619814675" lon="3.5384034778732643"/>
          <point xsi:type="esdl:Point" lat="53.988910619957274" lon="3.538403445848324"/>
          <point xsi:type="esdl:Point" lat="53.9909495442789" lon="3.5346776832523537"/>
          <point xsi:type="esdl:Point" lat="53.99094954438451" lon="3.534677658845128"/>
          <point xsi:type="esdl:Point" lat="53.99234429520077" lon="3.532285593788933"/>
          <point xsi:type="esdl:Point" lat="53.992344309581306" lon="3.532285593968596"/>
          <point xsi:type="esdl:Point" lat="53.99575086274272" lon="3.5261358685690136"/>
          <point xsi:type="esdl:Point" lat="53.99575086284833" lon="3.5261358441617867"/>
          <point xsi:type="esdl:Point" lat="54.001231148528476" lon="3.5163189468672296"/>
          <point xsi:type="esdl:Point" lat="54.001231167404505" lon="3.516318947100791"/>
          <point xsi:type="esdl:Point" lat="54.006706064315566" lon="3.5065185086490382"/>
          <point xsi:type="esdl:Point" lat="54.0067060841869" lon="3.506518484475374"/>
          <point xsi:type="esdl:Point" lat="54.011500979002875" lon="3.497951076600942"/>
          <point xsi:type="esdl:Point" lat="54.01150097914013" lon="3.4979510445580364"/>
          <point xsi:type="esdl:Point" lat="54.01562072957227" lon="3.490598476493204"/>
          <point xsi:type="esdl:Point" lat="54.01562072970423" lon="3.4905984444413147"/>
          <point xsi:type="esdl:Point" lat="54.01903431228296" lon="3.4843961913041515"/>
          <point xsi:type="esdl:Point" lat="54.01903433205341" lon="3.4843961915377135"/>
          <point xsi:type="esdl:Point" lat="54.023805230908806" lon="3.47581198759292"/>
          <point xsi:type="esdl:Point" lat="54.02380524988014" lon="3.475811963383323"/>
          <point xsi:type="esdl:Point" lat="54.0279147510605" lon="3.4684244184157738"/>
          <point xsi:type="esdl:Point" lat="54.02791476556595" lon="3.4684243865165985"/>
          <point xsi:type="esdl:Point" lat="54.03620471399006" lon="3.4535387663148565"/>
          <point xsi:type="esdl:Point" lat="54.03620473736084" lon="3.4535387665663846"/>
          <point xsi:type="esdl:Point" lat="54.04304518056794" lon="3.4412739336851823"/>
          <point xsi:type="esdl:Point" lat="54.04304519953049" lon="3.4412739094486358"/>
          <point xsi:type="esdl:Point" lat="54.048500683964456" lon="3.431403997134355"/>
          <point xsi:type="esdl:Point" lat="54.04850069834668" lon="3.4314039972870685"/>
          <point xsi:type="esdl:Point" lat="54.05397319442773" lon="3.421577475119164"/>
          <point xsi:type="esdl:Point" lat="54.05397319453848" lon="3.4215774430493084"/>
          <point xsi:type="esdl:Point" lat="54.060078232032964" lon="3.41051719409177"/>
          <point xsi:type="esdl:Point" lat="54.060078232112055" lon="3.410517171175747"/>
          <point xsi:type="esdl:Point" lat="54.063505406104674" lon="3.4043782950801935"/>
          <point xsi:type="esdl:Point" lat="54.06350542958663" lon="3.404378261689814"/>
          <point xsi:type="esdl:Point" lat="54.06830650958759" lon="3.395791324845348"/>
          <point xsi:type="esdl:Point" lat="54.06830652845956" lon="3.395791325025011"/>
          <point xsi:type="esdl:Point" lat="54.07232137129662" lon="3.3883412680216054"/>
          <point xsi:type="esdl:Point" lat="54.072321391068094" lon="3.3883412682102514"/>
          <point xsi:type="esdl:Point" lat="54.075783288274614" lon="3.382229666359113"/>
          <point xsi:type="esdl:Point" lat="54.075783288353676" lon="3.382229641906971"/>
          <point xsi:type="esdl:Point" lat="54.077157225559965" lon="3.379766294383137"/>
          <point xsi:type="esdl:Point" lat="54.077157225665374" lon="3.379766262286332"/>
          <point xsi:type="esdl:Point" lat="54.07854900792634" lon="3.3773334772720442"/>
          <point xsi:type="esdl:Point" lat="54.078549022308714" lon="3.3773334773978085"/>
          <point xsi:type="esdl:Point" lat="54.096252276155845" lon="3.345291453331925"/>
          <point xsi:type="esdl:Point" lat="54.0962522950309" lon="3.345291453493622"/>
          <point xsi:type="esdl:Point" lat="54.1058096528775" lon="3.3280116912768487"/>
          <point xsi:type="esdl:Point" lat="54.10580967175347" lon="3.328011691420579"/>
          <point xsi:type="esdl:Point" lat="54.1092057449475" lon="3.3218284762073673"/>
          <point xsi:type="esdl:Point" lat="54.109205745031765" lon="3.3218284440836126"/>
          <point xsi:type="esdl:Point" lat="54.11124685600973" lon="3.3181119553981917"/>
          <point xsi:type="esdl:Point" lat="54.11124685607818" lon="3.3181119309280835"/>
          <point xsi:type="esdl:Point" lat="54.12011403520359" lon="3.302099864071704"/>
          <point xsi:type="esdl:Point" lat="54.12011405407832" lon="3.3020998642154344"/>
          <point xsi:type="esdl:Point" lat="54.12147740377194" lon="3.2996158595992666"/>
          <point xsi:type="esdl:Point" lat="54.12147740385091" lon="3.2996158274665284"/>
          <point xsi:type="esdl:Point" lat="54.12423072016371" lon="3.2947240467808685"/>
          <point xsi:type="esdl:Point" lat="54.124230734619736" lon="3.2947240147469463"/>
          <point xsi:type="esdl:Point" lat="54.1255849405612" lon="3.29223946767411"/>
          <point xsi:type="esdl:Point" lat="54.12558495943344" lon="3.2922394678088573"/>
          <point xsi:type="esdl:Point" lat="54.12762504282344" lon="3.288550634549976"/>
          <point xsi:type="esdl:Point" lat="54.127625057204575" lon="3.2885506346577738"/>
          <point xsi:type="esdl:Point" lat="54.132381978613594" lon="3.2799062263862067"/>
          <point xsi:type="esdl:Point" lat="54.13238197867149" lon="3.279906201898132"/>
          <point xsi:type="esdl:Point" lat="54.13375390477276" lon="3.277405494789105"/>
          <point xsi:type="esdl:Point" lat="54.1337539048254" lon="3.2774054703010305"/>
          <point xsi:type="esdl:Point" lat="54.13649736872649" lon="3.2724954088184903"/>
          <point xsi:type="esdl:Point" lat="54.13649736880017" lon="3.272495375149634"/>
          <point xsi:type="esdl:Point" lat="54.13786898889458" lon="3.2700554055624176"/>
          <point xsi:type="esdl:Point" lat="54.13786900327742" lon="3.270055405661232"/>
          <point xsi:type="esdl:Point" lat="54.14398695487216" lon="3.25898129735176"/>
          <point xsi:type="esdl:Point" lat="54.1439869693213" lon="3.2589812652908874"/>
          <point xsi:type="esdl:Point" lat="54.14668479023441" lon="3.2540378369111984"/>
          <point xsi:type="esdl:Point" lat="54.14668481360093" lon="3.2540378370549288"/>
          <point xsi:type="esdl:Point" lat="54.14805609063953" lon="3.251581325620576"/>
          <point xsi:type="esdl:Point" lat="54.14805610501885" lon="3.2515813257014248"/>
          <point xsi:type="esdl:Point" lat="54.15623802788277" lon="3.2367161239815117"/>
          <point xsi:type="esdl:Point" lat="54.156238027930115" lon="3.2367160994844535"/>
          <point xsi:type="esdl:Point" lat="54.17195564873119" lon="3.2084814442538003"/>
          <point xsi:type="esdl:Point" lat="54.171955663165306" lon="3.2084814121569947"/>
          <point xsi:type="esdl:Point" lat="54.175318647133324" lon="3.2022478106730587"/>
          <point xsi:type="esdl:Point" lat="54.175318660614586" lon="3.202247810744924"/>
          <point xsi:type="esdl:Point" lat="54.182737654254716" lon="3.1885548294607147"/>
          <point xsi:type="esdl:Point" lat="54.18273767852084" lon="3.1885548295685124"/>
          <point xsi:type="esdl:Point" lat="54.18409867521875" lon="3.186063333811358"/>
          <point xsi:type="esdl:Point" lat="54.18409867525555" lon="3.1860633108324534"/>
          <point xsi:type="esdl:Point" lat="54.186117483326484" lon="3.182394636226688"/>
          <point xsi:type="esdl:Point" lat="54.18611750309629" lon="3.18239463631652"/>
          <point xsi:type="esdl:Point" lat="54.19436289220984" lon="3.1673950970794884"/>
          <point xsi:type="esdl:Point" lat="54.19436291198095" lon="3.167395097160337"/>
          <point xsi:type="esdl:Point" lat="54.20651593225091" lon="3.145198177659612"/>
          <point xsi:type="esdl:Point" lat="54.20651593228244" lon="3.145198153135605"/>
          <point xsi:type="esdl:Point" lat="54.214684562882596" lon="3.1303983057300906"/>
          <point xsi:type="esdl:Point" lat="54.214684577265025" lon="3.130398305775006"/>
          <point xsi:type="esdl:Point" lat="54.2357598013138" lon="3.0919554231719304"/>
          <point xsi:type="esdl:Point" lat="54.23575982018307" lon="3.091955423216846"/>
          <point xsi:type="esdl:Point" lat="54.23710982541561" lon="3.089442184456892"/>
          <point xsi:type="esdl:Point" lat="54.23710982544186" lon="3.089442150707187"/>
          <point xsi:type="esdl:Point" lat="54.3171447470089" lon="2.9430685365369667"/>
          <point xsi:type="esdl:Point" lat="54.31862659997304" lon="2.940852751446303"/>
          <point xsi:type="esdl:Point" lat="54.32031528889381" lon="2.9389747297403983"/>
          <point xsi:type="esdl:Point" lat="54.32484314715173" lon="2.9355546553195855"/>
          <point xsi:type="esdl:Point" lat="54.32485214075063" lon="2.935542648293768"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="78900.35801386733" name="Pipe_Noordgastransport B_V__2" capacity="14000000000.0" id="Pipe_Noordgastransport B_V__2" diameter="DN800">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="3ce888c0-e1fc-4529-9597-6d05683be3ea" name="InPort" connectedTo="41829d65-271e-4f8f-90ae-3281dc305c20"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="51d6770d-910a-4c74-9edb-eb3e8f7de13a" id="d897984f-840b-4f6e-88e2-876b7027e8d8" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.943742686207486" lon="3.6192539856492467"/>
          <point xsi:type="esdl:Point" lat="53.941002801336005" lon="3.624179761962923"/>
          <point xsi:type="esdl:Point" lat="53.94100278156021" lon="3.624179761675462"/>
          <point xsi:type="esdl:Point" lat="53.93959722217883" lon="3.626565717145679"/>
          <point xsi:type="esdl:Point" lat="53.939597203100355" lon="3.626565756464939"/>
          <point xsi:type="esdl:Point" lat="53.93885420468143" lon="3.6277123301430114"/>
          <point xsi:type="esdl:Point" lat="53.938854190134364" lon="3.6277123619074403"/>
          <point xsi:type="esdl:Point" lat="53.937324014464636" lon="3.6298524540269987"/>
          <point xsi:type="esdl:Point" lat="53.937323995591356" lon="3.629852453739538"/>
          <point xsi:type="esdl:Point" lat="53.9356779773179" lon="3.6317926404261724"/>
          <point xsi:type="esdl:Point" lat="53.93567794393274" lon="3.6317926642944096"/>
          <point xsi:type="esdl:Point" lat="53.93483749848603" lon="3.632663403545094"/>
          <point xsi:type="esdl:Point" lat="53.934837479611645" lon="3.6326634032576335"/>
          <point xsi:type="esdl:Point" lat="53.933970041080954" lon="3.6335337155749974"/>
          <point xsi:type="esdl:Point" lat="53.93397002656921" lon="3.633533739721712"/>
          <point xsi:type="esdl:Point" lat="53.93309400727903" lon="3.6343277162425363"/>
          <point xsi:type="esdl:Point" lat="53.933094007109794" lon="3.6343277482315437"/>
          <point xsi:type="esdl:Point" lat="53.93220031892341" lon="3.635060500172994"/>
          <point xsi:type="esdl:Point" lat="53.93220030004781" lon="3.635060499885533"/>
          <point xsi:type="esdl:Point" lat="53.931288966545566" lon="3.6357320306073078"/>
          <point xsi:type="esdl:Point" lat="53.93128894749502" lon="3.6357320638270068"/>
          <point xsi:type="esdl:Point" lat="53.93037793288782" lon="3.636342657376399"/>
          <point xsi:type="esdl:Point" lat="53.930377895140275" lon="3.6363426568014776"/>
          <point xsi:type="esdl:Point" lat="53.929431190525285" lon="3.6369069747349525"/>
          <point xsi:type="esdl:Point" lat="53.9294311517085" lon="3.6369070061310715"/>
          <point xsi:type="esdl:Point" lat="53.926557252373705" lon="3.6381729175361257"/>
          <point xsi:type="esdl:Point" lat="53.926557210131946" lon="3.638172916889338"/>
          <point xsi:type="esdl:Point" lat="53.92266668675411" lon="3.63962109828912"/>
          <point xsi:type="esdl:Point" lat="53.922666672375975" lon="3.639621098064542"/>
          <point xsi:type="esdl:Point" lat="53.91974882028586" lon="3.640688059080565"/>
          <point xsi:type="esdl:Point" lat="53.91974880680078" lon="3.6406880588739527"/>
          <point xsi:type="esdl:Point" lat="53.912975895837796" lon="3.6432790371109594"/>
          <point xsi:type="esdl:Point" lat="53.9129758769641" lon="3.6432790368234973"/>
          <point xsi:type="esdl:Point" lat="53.911012535200086" lon="3.644010037418454"/>
          <point xsi:type="esdl:Point" lat="53.9110125163255" lon="3.6440100371309927"/>
          <point xsi:type="esdl:Point" lat="53.9080947274575" lon="3.645061159384303"/>
          <point xsi:type="esdl:Point" lat="53.90809471307964" lon="3.645061159159724"/>
          <point xsi:type="esdl:Point" lat="53.90614935517159" lon="3.6457922383572665"/>
          <point xsi:type="esdl:Point" lat="53.906149336125466" lon="3.64579227002288"/>
          <point xsi:type="esdl:Point" lat="53.90032220136254" lon="3.6479853084949423"/>
          <point xsi:type="esdl:Point" lat="53.90032218788178" lon="3.6479853082883293"/>
          <point xsi:type="esdl:Point" lat="53.89450399473788" lon="3.6501779066937003"/>
          <point xsi:type="esdl:Point" lat="53.89450397586112" lon="3.6501779063972557"/>
          <point xsi:type="esdl:Point" lat="53.8867403779041" lon="3.6530851145482623"/>
          <point xsi:type="esdl:Point" lat="53.88674036352418" lon="3.6530851143236833"/>
          <point xsi:type="esdl:Point" lat="53.88287631943635" lon="3.6545766197268867"/>
          <point xsi:type="esdl:Point" lat="53.882876300559644" lon="3.654576619430442"/>
          <point xsi:type="esdl:Point" lat="53.8789854201109" lon="3.656037028859568"/>
          <point xsi:type="esdl:Point" lat="53.878985401105346" lon="3.6560370529074686"/>
          <point xsi:type="esdl:Point" lat="53.872167698127996" lon="3.658531103122948"/>
          <point xsi:type="esdl:Point" lat="53.87216768362125" lon="3.658531125706594"/>
          <point xsi:type="esdl:Point" lat="53.86826768550023" lon="3.660005859123268"/>
          <point xsi:type="esdl:Point" lat="53.86826766662751" lon="3.6600058588268247"/>
          <point xsi:type="esdl:Point" lat="53.86148532378009" lon="3.6625904348426657"/>
          <point xsi:type="esdl:Point" lat="53.861485285853725" lon="3.6625904661759026"/>
          <point xsi:type="esdl:Point" lat="53.85855806906616" lon="3.663684547986124"/>
          <point xsi:type="esdl:Point" lat="53.85855804569629" lon="3.663684547617815"/>
          <point xsi:type="esdl:Point" lat="53.849812453245896" lon="3.6669360569844196"/>
          <point xsi:type="esdl:Point" lat="53.84981243886918" lon="3.6669360567598406"/>
          <point xsi:type="esdl:Point" lat="53.84592147921528" lon="3.668378965956203"/>
          <point xsi:type="esdl:Point" lat="53.845921454948005" lon="3.668378965569928"/>
          <point xsi:type="esdl:Point" lat="53.84203057983039" lon="3.669806431531797"/>
          <point xsi:type="esdl:Point" lat="53.84203056077624" lon="3.669806463143511"/>
          <point xsi:type="esdl:Point" lat="53.836211864959395" lon="3.6720082067218685"/>
          <point xsi:type="esdl:Point" lat="53.83621184608283" lon="3.672008206425424"/>
          <point xsi:type="esdl:Point" lat="53.83427519527182" lon="3.672752178755964"/>
          <point xsi:type="esdl:Point" lat="53.834275152851895" lon="3.672752209990386"/>
          <point xsi:type="esdl:Point" lat="53.83038400145915" lon="3.6742244322654987"/>
          <point xsi:type="esdl:Point" lat="53.83038398708106" lon="3.674224432031937"/>
          <point xsi:type="esdl:Point" lat="53.828465550012204" lon="3.6749229270793524"/>
          <point xsi:type="esdl:Point" lat="53.82846553113745" lon="3.6749229267739256"/>
          <point xsi:type="esdl:Point" lat="53.825547292163904" lon="3.6760002395800244"/>
          <point xsi:type="esdl:Point" lat="53.82554727778415" lon="3.676000239346463"/>
          <point xsi:type="esdl:Point" lat="53.82166500699905" lon="3.6774720690577953"/>
          <point xsi:type="esdl:Point" lat="53.82166498812653" lon="3.677472068752368"/>
          <point xsi:type="esdl:Point" lat="53.81876460520035" lon="3.6785645021720095"/>
          <point xsi:type="esdl:Point" lat="53.81876458609319" lon="3.6785645428746743"/>
          <point xsi:type="esdl:Point" lat="53.812017971183224" lon="3.6810981453371925"/>
          <point xsi:type="esdl:Point" lat="53.81201797094984" lon="3.681098186336302"/>
          <point xsi:type="esdl:Point" lat="53.80910863808004" lon="3.6821747942972793"/>
          <point xsi:type="esdl:Point" lat="53.809108619201865" lon="3.682174793991852"/>
          <point xsi:type="esdl:Point" lat="53.80234387110704" lon="3.6847222089142453"/>
          <point xsi:type="esdl:Point" lat="53.80234385133454" lon="3.6847222085908515"/>
          <point xsi:type="esdl:Point" lat="53.80137109150671" lon="3.68508595031938"/>
          <point xsi:type="esdl:Point" lat="53.801371052862706" lon="3.6850859496815755"/>
          <point xsi:type="esdl:Point" lat="53.797488858496365" lon="3.686525706321297"/>
          <point xsi:type="esdl:Point" lat="53.797488835124234" lon="3.686525705935021"/>
          <point xsi:type="esdl:Point" lat="53.7936244289987" lon="3.687995865148235"/>
          <point xsi:type="esdl:Point" lat="53.79362441012416" lon="3.6879958648428084"/>
          <point xsi:type="esdl:Point" lat="53.79169672939473" lon="3.6887233328218914"/>
          <point xsi:type="esdl:Point" lat="53.79169671501398" lon="3.6887233325883297"/>
          <point xsi:type="esdl:Point" lat="53.78492292022275" lon="3.69125330799509"/>
          <point xsi:type="esdl:Point" lat="53.784922901163846" lon="3.691253339552906"/>
          <point xsi:type="esdl:Point" lat="53.776221685867164" lon="3.694448727040444"/>
          <point xsi:type="esdl:Point" lat="53.776221666990104" lon="3.694448726726034"/>
          <point xsi:type="esdl:Point" lat="53.76944747511551" lon="3.697022390699507"/>
          <point xsi:type="esdl:Point" lat="53.76944745604426" lon="3.697022423766492"/>
          <point xsi:type="esdl:Point" lat="53.76073709071622" lon="3.7002153211150803"/>
          <point xsi:type="esdl:Point" lat="53.760737071656955" lon="3.70021535265493"/>
          <point xsi:type="esdl:Point" lat="53.75688128147118" lon="3.7017134603790276"/>
          <point xsi:type="esdl:Point" lat="53.75688126709443" lon="3.701713460145465"/>
          <point xsi:type="esdl:Point" lat="53.750098172040616" lon="3.7042391482437167"/>
          <point xsi:type="esdl:Point" lat="53.75009815316775" lon="3.704239147929307"/>
          <point xsi:type="esdl:Point" lat="53.747215658863325" lon="3.7052979494847227"/>
          <point xsi:type="esdl:Point" lat="53.74721564448327" lon="3.7052979492421776"/>
          <point xsi:type="esdl:Point" lat="53.74335985557682" lon="3.70677997011583"/>
          <point xsi:type="esdl:Point" lat="53.743359836700925" lon="3.706779969801419"/>
          <point xsi:type="esdl:Point" lat="53.7394683006436" lon="3.7082307880979193"/>
          <point xsi:type="esdl:Point" lat="53.73946828158" lon="3.708230819619803"/>
          <point xsi:type="esdl:Point" lat="53.73556788572219" lon="3.709650923618424"/>
          <point xsi:type="esdl:Point" lat="53.73556787133815" lon="3.7096509233758796"/>
          <point xsi:type="esdl:Point" lat="53.72492934304178" lon="3.713548795320027"/>
          <point xsi:type="esdl:Point" lat="53.724929309785864" lon="3.713548794763072"/>
          <point xsi:type="esdl:Point" lat="53.72397406951711" lon="3.713972104721321"/>
          <point xsi:type="esdl:Point" lat="53.72397405499621" lon="3.7139721287243055"/>
          <point xsi:type="esdl:Point" lat="53.72202868682148" lon="3.7146211490664323"/>
          <point xsi:type="esdl:Point" lat="53.722028653568586" lon="3.714621148500493"/>
          <point xsi:type="esdl:Point" lat="53.71813690303242" lon="3.7160856973305156"/>
          <point xsi:type="esdl:Point" lat="53.718136884155825" lon="3.7160856970071228"/>
          <point xsi:type="esdl:Point" lat="53.70749762304012" lon="3.720071272864849"/>
          <point xsi:type="esdl:Point" lat="53.70749759877244" lon="3.7200712724516234"/>
          <point xsi:type="esdl:Point" lat="53.70266893517026" lon="3.7218671872691935"/>
          <point xsi:type="esdl:Point" lat="53.70266891629205" lon="3.7218671869458"/>
          <point xsi:type="esdl:Point" lat="53.69691243388181" lon="3.723995168149378"/>
          <point xsi:type="esdl:Point" lat="53.69691238151021" lon="3.723995208142375"/>
          <point xsi:type="esdl:Point" lat="53.69496654194664" lon="3.7247190601149787"/>
          <point xsi:type="esdl:Point" lat="53.69496654180304" lon="3.724719084351525"/>
          <point xsi:type="esdl:Point" lat="53.688200656792084" lon="3.7272831331714222"/>
          <point xsi:type="esdl:Point" lat="53.68820060446816" lon="3.727283164073468"/>
          <point xsi:type="esdl:Point" lat="53.6872457141432" lon="3.727630148143595"/>
          <point xsi:type="esdl:Point" lat="53.68724570066294" lon="3.7276301479100336"/>
          <point xsi:type="esdl:Point" lat="53.67856135100302" lon="3.7308262483724475"/>
          <point xsi:type="esdl:Point" lat="53.67856129418695" lon="3.7308262791846607"/>
          <point xsi:type="esdl:Point" lat="53.67567834340045" lon="3.7319117667676434"/>
          <point xsi:type="esdl:Point" lat="53.675678324526096" lon="3.73191176644425"/>
          <point xsi:type="esdl:Point" lat="53.67083125363926" lon="3.733750116579897"/>
          <point xsi:type="esdl:Point" lat="53.67083124015907" lon="3.733750116337352"/>
          <point xsi:type="esdl:Point" lat="53.652425743064924" lon="3.740541675907131"/>
          <point xsi:type="esdl:Point" lat="53.6524256999233" lon="3.740541675152546"/>
          <point xsi:type="esdl:Point" lat="53.64661450097092" lon="3.7427392938737305"/>
          <point xsi:type="esdl:Point" lat="53.646614481897174" lon="3.7427393253057826"/>
          <point xsi:type="esdl:Point" lat="53.63990243204302" lon="3.74523814343743"/>
          <point xsi:type="esdl:Point" lat="53.63990241316861" lon="3.745238143105053"/>
          <point xsi:type="esdl:Point" lat="53.63796558431927" lon="3.7459299890832476"/>
          <point xsi:type="esdl:Point" lat="53.63796554656872" lon="3.745929988418495"/>
          <point xsi:type="esdl:Point" lat="53.62339718360412" lon="3.7513278862952992"/>
          <point xsi:type="esdl:Point" lat="53.623397144956115" lon="3.751327885603596"/>
          <point xsi:type="esdl:Point" lat="53.622424069844215" lon="3.751703696790855"/>
          <point xsi:type="esdl:Point" lat="53.62242405097263" lon="3.751703696458478"/>
          <point xsi:type="esdl:Point" lat="53.62145102540811" lon="3.752064391919029"/>
          <point xsi:type="esdl:Point" lat="53.621451006536105" lon="3.7520643915866523"/>
          <point xsi:type="esdl:Point" lat="53.61950490118787" lon="3.752800790490527"/>
          <point xsi:type="esdl:Point" lat="53.61950483442946" lon="3.7528008286150274"/>
          <point xsi:type="esdl:Point" lat="53.61661275683334" lon="3.7538680721242588"/>
          <point xsi:type="esdl:Point" lat="53.61661273795918" lon="3.7538680717828985"/>
          <point xsi:type="esdl:Point" lat="53.61563072925013" lon="3.7542285076752484"/>
          <point xsi:type="esdl:Point" lat="53.61563071037553" lon="3.7542285073428716"/>
          <point xsi:type="esdl:Point" lat="53.61270257804005" lon="3.755310021794133"/>
          <point xsi:type="esdl:Point" lat="53.61270255916414" lon="3.755310021461757"/>
          <point xsi:type="esdl:Point" lat="53.611747752174374" lon="3.7556405943626725"/>
          <point xsi:type="esdl:Point" lat="53.61174769984075" lon="3.755640625165903"/>
          <point xsi:type="esdl:Point" lat="53.60884678989792" lon="3.756677086545468"/>
          <point xsi:type="esdl:Point" lat="53.6088467519934" lon="3.7566771100453953"/>
          <point xsi:type="esdl:Point" lat="53.6030531885707" lon="3.7588706254240583"/>
          <point xsi:type="esdl:Point" lat="53.60305313083727" lon="3.758870657637645"/>
          <point xsi:type="esdl:Point" lat="53.59918790882874" lon="3.76031243096823"/>
          <point xsi:type="esdl:Point" lat="53.59918789424879" lon="3.7603124624451967"/>
          <point xsi:type="esdl:Point" lat="53.59628656996032" lon="3.7614087127974973"/>
          <point xsi:type="esdl:Point" lat="53.59628655542202" lon="3.7614087367106497"/>
          <point xsi:type="esdl:Point" lat="53.5943675242456" lon="3.762114543945664"/>
          <point xsi:type="esdl:Point" lat="53.59436746720939" lon="3.76211460789673"/>
          <point xsi:type="esdl:Point" lat="53.5934033798976" lon="3.76247498355704"/>
          <point xsi:type="esdl:Point" lat="53.593403323275965" lon="3.7624749825419435"/>
          <point xsi:type="esdl:Point" lat="53.58952035927372" lon="3.763870527543928"/>
          <point xsi:type="esdl:Point" lat="53.58952030265221" lon="3.763870526519848"/>
          <point xsi:type="esdl:Point" lat="53.58857437866993" lon="3.764216028765016"/>
          <point xsi:type="esdl:Point" lat="53.588574322047144" lon="3.764216027740936"/>
          <point xsi:type="esdl:Point" lat="53.57887924584136" lon="3.7678473114192874"/>
          <point xsi:type="esdl:Point" lat="53.5788792124327" lon="3.767847334982098"/>
          <point xsi:type="esdl:Point" lat="53.576942021893835" lon="3.7685674061702494"/>
          <point xsi:type="esdl:Point" lat="53.576942003017926" lon="3.76856740582889"/>
          <point xsi:type="esdl:Point" lat="53.57500491028623" lon="3.7692723051995287"/>
          <point xsi:type="esdl:Point" lat="53.575004872538045" lon="3.769272304516809"/>
          <point xsi:type="esdl:Point" lat="53.5730498313704" lon="3.7699767901324113"/>
          <point xsi:type="esdl:Point" lat="53.5730497882276" lon="3.769976789341894"/>
          <point xsi:type="esdl:Point" lat="53.56917548285739" lon="3.771401333632116"/>
          <point xsi:type="esdl:Point" lat="53.56917545949157" lon="3.7714013332099077"/>
          <point xsi:type="esdl:Point" lat="53.56627408543601" lon="3.7724961002729938"/>
          <point xsi:type="esdl:Point" lat="53.566274052028064" lon="3.7724961238178367"/>
          <point xsi:type="esdl:Point" lat="53.56434581356928" lon="3.773215896944978"/>
          <point xsi:type="esdl:Point" lat="53.5643457946931" lon="3.7732158966036184"/>
          <point xsi:type="esdl:Point" lat="53.56239070906975" lon="3.773920051693095"/>
          <point xsi:type="esdl:Point" lat="53.56239069019269" lon="3.7739200513427513"/>
          <point xsi:type="esdl:Point" lat="53.560462558903055" lon="3.7746246182558867"/>
          <point xsi:type="esdl:Point" lat="53.560462525442496" lon="3.7746246493465794"/>
          <point xsi:type="esdl:Point" lat="53.559489307887844" lon="3.7749993890233666"/>
          <point xsi:type="esdl:Point" lat="53.55948928901483" lon="3.7749993886820064"/>
          <point xsi:type="esdl:Point" lat="53.555587949697454" lon="3.7764225289593387"/>
          <point xsi:type="esdl:Point" lat="53.555587930619915" lon="3.7764225603105417"/>
          <point xsi:type="esdl:Point" lat="53.55365967621598" lon="3.7771419858794992"/>
          <point xsi:type="esdl:Point" lat="53.55365963287196" lon="3.777142016781545"/>
          <point xsi:type="esdl:Point" lat="53.55065023509933" lon="3.7782490880600945"/>
          <point xsi:type="esdl:Point" lat="53.550650220721465" lon="3.7782490877906008"/>
          <point xsi:type="esdl:Point" lat="53.549677113280985" lon="3.778608577433562"/>
          <point xsi:type="esdl:Point" lat="53.54967705665947" lon="3.7786085764005"/>
          <point xsi:type="esdl:Point" lat="53.546800685750426" lon="3.779989549929075"/>
          <point xsi:type="esdl:Point" lat="53.54680065228975" lon="3.779989581010784"/>
          <point xsi:type="esdl:Point" lat="53.54587102719631" lon="3.7805761481836546"/>
          <point xsi:type="esdl:Point" lat="53.54587100832256" lon="3.780576147842295"/>
          <point xsi:type="esdl:Point" lat="53.544959132422996" lon="3.7811932334443803"/>
          <point xsi:type="esdl:Point" lat="53.54495911264675" lon="3.781193233085054"/>
          <point xsi:type="esdl:Point" lat="53.544046838915975" lon="3.78187065153588"/>
          <point xsi:type="esdl:Point" lat="53.5440468200414" lon="3.7818706511945206"/>
          <point xsi:type="esdl:Point" lat="53.54227530288928" lon="3.783362150965287"/>
          <point xsi:type="esdl:Point" lat="53.54227525974713" lon="3.783362150165787"/>
          <point xsi:type="esdl:Point" lat="53.540573902510836" lon="3.785111401403035"/>
          <point xsi:type="esdl:Point" lat="53.540573883426525" lon="3.785111432736272"/>
          <point xsi:type="esdl:Point" lat="53.53975866540968" lon="3.786062088522118"/>
          <point xsi:type="esdl:Point" lat="53.53975863194342" lon="3.786062119594843"/>
          <point xsi:type="esdl:Point" lat="53.53819008963363" lon="3.7881153911142436"/>
          <point xsi:type="esdl:Point" lat="53.53819006985956" lon="3.7881153907459346"/>
          <point xsi:type="esdl:Point" lat="53.53670118227151" lon="3.7903510581769164"/>
          <point xsi:type="esdl:Point" lat="53.53670116339901" lon="3.79035105781759"/>
          <point xsi:type="esdl:Point" lat="53.53468170533682" lon="3.7939647862234"/>
          <point xsi:type="esdl:Point" lat="53.53468168588146" lon="3.793964873368966"/>
          <point xsi:type="esdl:Point" lat="53.53345055590996" lon="3.7966273324485753"/>
          <point xsi:type="esdl:Point" lat="53.533450512347706" lon="3.7966273949982683"/>
          <point xsi:type="esdl:Point" lat="53.53289324779014" lon="3.7979747295569446"/>
          <point xsi:type="esdl:Point" lat="53.53289321416363" lon="3.7979747847494356"/>
          <point xsi:type="esdl:Point" lat="53.531822502334315" lon="3.800821228869347"/>
          <point xsi:type="esdl:Point" lat="53.53182250212073" lon="3.800821260552927"/>
          <point xsi:type="esdl:Point" lat="53.528133359567455" lon="3.8107083406514506"/>
          <point xsi:type="esdl:Point" lat="53.528133359407256" lon="3.8107083647801994"/>
          <point xsi:type="esdl:Point" lat="53.5270803333059" lon="3.8135544871864577"/>
          <point xsi:type="esdl:Point" lat="53.527080309035746" lon="3.8135544867193336"/>
          <point xsi:type="esdl:Point" lat="53.52495656520406" lon="3.8191705658852095"/>
          <point xsi:type="esdl:Point" lat="53.52495654611271" lon="3.8191705972004804"/>
          <point xsi:type="esdl:Point" lat="53.52441647839956" lon="3.8205931676135454"/>
          <point xsi:type="esdl:Point" lat="53.52441644021637" lon="3.8205932302261214"/>
          <point xsi:type="esdl:Point" lat="53.52335440137025" lon="3.8234084605579044"/>
          <point xsi:type="esdl:Point" lat="53.523354381840264" lon="3.8234085552133865"/>
          <point xsi:type="esdl:Point" lat="53.52231016017085" lon="3.82623904000769"/>
          <point xsi:type="esdl:Point" lat="53.522310159941206" lon="3.826239073191456"/>
          <point xsi:type="esdl:Point" lat="53.517556187665726" lon="3.83898147290863"/>
          <point xsi:type="esdl:Point" lat="53.51755618737731" lon="3.8389815136292613"/>
          <point xsi:type="esdl:Point" lat="53.51543146799443" lon="3.8445648827101904"/>
          <point xsi:type="esdl:Point" lat="53.51543145316659" lon="3.844564945762941"/>
          <point xsi:type="esdl:Point" lat="53.51385517798409" lon="3.84883151444391"/>
          <point xsi:type="esdl:Point" lat="53.51385517758881" lon="3.8488315702382723"/>
          <point xsi:type="esdl:Point" lat="53.502214875031186" lon="3.8798681775330004"/>
          <point xsi:type="esdl:Point" lat="53.50221485166579" lon="3.87986817704791"/>
          <point xsi:type="esdl:Point" lat="53.49620802840367" lon="3.8959037503449077"/>
          <point xsi:type="esdl:Point" lat="53.496208008877204" lon="3.8959038373647097"/>
          <point xsi:type="esdl:Point" lat="53.49437345933443" lon="3.9007943448142184"/>
          <point xsi:type="esdl:Point" lat="53.494373459099286" lon="3.900794376470849"/>
          <point xsi:type="esdl:Point" lat="53.492795273927406" lon="3.90504176409031"/>
          <point xsi:type="esdl:Point" lat="53.492795273745706" lon="3.9050417882100747"/>
          <point xsi:type="esdl:Point" lat="53.4912260298711" lon="3.909273992872912"/>
          <point xsi:type="esdl:Point" lat="53.4912260296306" lon="3.9092740245205593"/>
          <point xsi:type="esdl:Point" lat="53.487501051723484" lon="3.9191415514753847"/>
          <point xsi:type="esdl:Point" lat="53.487501012593036" lon="3.9191416139262634"/>
          <point xsi:type="esdl:Point" lat="53.48643633903834" lon="3.9219971328092074"/>
          <point xsi:type="esdl:Point" lat="53.48643633879247" lon="3.9219971644478724"/>
          <point xsi:type="esdl:Point" lat="53.48484874968504" lon="3.926197565578599"/>
          <point xsi:type="esdl:Point" lat="53.48484873468616" lon="3.9261976451244176"/>
          <point xsi:type="esdl:Point" lat="53.483784103616294" lon="3.929022668745699"/>
          <point xsi:type="esdl:Point" lat="53.483784103370404" lon="3.929022700384363"/>
          <point xsi:type="esdl:Point" lat="53.482728514513035" lon="3.931832713148263"/>
          <point xsi:type="esdl:Point" lat="53.482728495450765" lon="3.931832736845821"/>
          <point xsi:type="esdl:Point" lat="53.46875994744457" lon="3.969083780570956"/>
          <point xsi:type="esdl:Point" lat="53.46875989460769" lon="3.9690838667463413"/>
          <point xsi:type="esdl:Point" lat="53.467703389263136" lon="3.971891854312332"/>
          <point xsi:type="esdl:Point" lat="53.46770338893159" lon="3.9718918949790654"/>
          <point xsi:type="esdl:Point" lat="53.4666379160864" lon="3.9746845405417126"/>
          <point xsi:type="esdl:Point" lat="53.46448858553698" lon="3.980299106711088"/>
          <point xsi:type="esdl:Point" lat="53.46392885568722" lon="3.9816871395874416"/>
          <point xsi:type="esdl:Point" lat="53.46392881748161" lon="3.9816871944385728"/>
          <point xsi:type="esdl:Point" lat="53.45813686711941" lon="3.99724739693911"/>
          <point xsi:type="esdl:Point" lat="53.458136852538956" lon="3.997247420690566"/>
          <point xsi:type="esdl:Point" lat="53.456528315264514" lon="4.001486981720147"/>
          <point xsi:type="esdl:Point" lat="53.4565282960514" lon="4.001487021937722"/>
          <point xsi:type="esdl:Point" lat="53.45547999568928" lon="4.004293627472598"/>
          <point xsi:type="esdl:Point" lat="53.45547999542184" lon="4.004293659093297"/>
          <point xsi:type="esdl:Point" lat="53.452271876724744" lon="4.0126962682710285"/>
          <point xsi:type="esdl:Point" lat="53.45227187645728" lon="4.012696299891727"/>
          <point xsi:type="esdl:Point" lat="53.450672032154635" lon="4.016904805299553"/>
          <point xsi:type="esdl:Point" lat="53.450671989373895" lon="4.016904867525852"/>
          <point xsi:type="esdl:Point" lat="53.44961436746148" lon="4.019710465600138"/>
          <point xsi:type="esdl:Point" lat="53.44961434832014" lon="4.019710496762696"/>
          <point xsi:type="esdl:Point" lat="53.44802313110334" lon="4.023933671353684"/>
          <point xsi:type="esdl:Point" lat="53.448023111955926" lon="4.023933702516241"/>
          <point xsi:type="esdl:Point" lat="53.4448399566526" lon="4.032409298184858"/>
          <point xsi:type="esdl:Point" lat="53.44483993218018" lon="4.032409321684785"/>
          <point xsi:type="esdl:Point" lat="53.44433340165701" lon="4.033812344586588"/>
          <point xsi:type="esdl:Point" lat="53.444333386445834" lon="4.03381244058056"/>
          <point xsi:type="esdl:Point" lat="53.443257123671394" lon="4.036646876452944"/>
          <point xsi:type="esdl:Point" lat="53.44325708536158" lon="4.036646940260279"/>
          <point xsi:type="esdl:Point" lat="53.43902384511101" lon="4.047910058147948"/>
          <point xsi:type="esdl:Point" lat="53.43902382595955" lon="4.047910089292539"/>
          <point xsi:type="esdl:Point" lat="53.43739540537688" lon="4.052160344163707"/>
          <point xsi:type="esdl:Point" lat="53.43739538622468" lon="4.052160375299314"/>
          <point xsi:type="esdl:Point" lat="53.43208407959892" lon="4.066208322077153"/>
          <point xsi:type="esdl:Point" lat="53.432084079235" lon="4.066208362707953"/>
          <point xsi:type="esdl:Point" lat="53.4288976584863" lon="4.074707668177802"/>
          <point xsi:type="esdl:Point" lat="53.428897639330266" lon="4.074707699304426"/>
          <point xsi:type="esdl:Point" lat="53.42622754213097" lon="4.0817138560559725"/>
          <point xsi:type="esdl:Point" lat="53.426227541542175" lon="4.081713920761622"/>
          <point xsi:type="esdl:Point" lat="53.42302260495301" lon="4.090150224191576"/>
          <point xsi:type="esdl:Point" lat="53.42302260474424" lon="4.09015024676624"/>
          <point xsi:type="esdl:Point" lat="53.41243400120515" lon="4.118269833216854"/>
          <point xsi:type="esdl:Point" lat="53.412434000610816" lon="4.118269896386385"/>
          <point xsi:type="esdl:Point" lat="53.41032258700369" lon="4.123901354314667"/>
          <point xsi:type="esdl:Point" lat="53.41032254776461" lon="4.123901416469102"/>
          <point xsi:type="esdl:Point" lat="53.404985076768604" lon="4.137915829478744"/>
          <point xsi:type="esdl:Point" lat="53.40498503759421" lon="4.137915884096313"/>
          <point xsi:type="esdl:Point" lat="53.40126847997321" lon="4.147728936700269"/>
          <point xsi:type="esdl:Point" lat="53.40126843599658" lon="4.147729022758873"/>
          <point xsi:type="esdl:Point" lat="53.40024299172413" lon="4.150604269319194"/>
          <point xsi:type="esdl:Point" lat="53.40024296805619" lon="4.150604300266155"/>
          <point xsi:type="esdl:Point" lat="53.39933356464923" lon="4.153557710281393"/>
          <point xsi:type="esdl:Point" lat="53.39933352605879" lon="4.153557796474744"/>
          <point xsi:type="esdl:Point" lat="53.39824562671437" lon="4.158220944538941"/>
          <point xsi:type="esdl:Point" lat="53.3982456257931" lon="4.158221039266287"/>
          <point xsi:type="esdl:Point" lat="53.39746179779389" lon="4.163027519966003"/>
          <point xsi:type="esdl:Point" lat="53.39746177861298" lon="4.163027551029746"/>
          <point xsi:type="esdl:Point" lat="53.39709714492519" lon="4.166311333666506"/>
          <point xsi:type="esdl:Point" lat="53.397097143998536" lon="4.166311428393853"/>
          <point xsi:type="esdl:Point" lat="53.39696428862562" lon="4.167947071053574"/>
          <point xsi:type="esdl:Point" lat="53.397010451736065" lon="4.177889784608162"/>
          <point xsi:type="esdl:Point" lat="53.39716516870586" lon="4.179518320471092"/>
          <point xsi:type="esdl:Point" lat="53.39716518253592" lon="4.179518376499017"/>
          <point xsi:type="esdl:Point" lat="53.39779993810108" lon="4.184408819916611"/>
          <point xsi:type="esdl:Point" lat="53.398388677249706" lon="4.187583769141418"/>
          <point xsi:type="esdl:Point" lat="53.39838867693369" lon="4.1875838007172"/>
          <point xsi:type="esdl:Point" lat="53.40067005149278" lon="4.198567147005323"/>
          <point xsi:type="esdl:Point" lat="53.400670064679" lon="4.198567266202779"/>
          <point xsi:type="esdl:Point" lat="53.40070435516059" lon="4.198733682253265"/>
          <point xsi:type="esdl:Point" lat="53.4007043695358" lon="4.198733682657506"/>
          <point xsi:type="esdl:Point" lat="53.400747315743686" lon="4.198930349933327"/>
          <point xsi:type="esdl:Point" lat="53.400747333985834" lon="4.198930413623881"/>
          <point xsi:type="esdl:Point" lat="53.40085003874326" lon="4.199444692135146"/>
          <point xsi:type="esdl:Point" lat="53.40091847138482" lon="4.199792555646954"/>
          <point xsi:type="esdl:Point" lat="53.40091847106346" lon="4.199792587222736"/>
          <point xsi:type="esdl:Point" lat="53.40096156597489" lon="4.199974196713185"/>
          <point xsi:type="esdl:Point" lat="53.401063972387384" lon="4.200518685899833"/>
          <point xsi:type="esdl:Point" lat="53.401063995358605" lon="4.200518725650284"/>
          <point xsi:type="esdl:Point" lat="53.4012262682375" lon="4.201365535156222"/>
          <point xsi:type="esdl:Point" lat="53.40122626799649" lon="4.201365559222088"/>
          <point xsi:type="esdl:Point" lat="53.401269927870786" lon="4.2014927550248995"/>
          <point xsi:type="esdl:Point" lat="53.40127422677787" lon="4.201511675134802"/>
          <point xsi:type="esdl:Point" lat="53.40127422655292" lon="4.201511697691498"/>
          <point xsi:type="esdl:Point" lat="53.40128306036454" lon="4.201526979157376"/>
          <point xsi:type="esdl:Point" lat="53.401291951112015" lon="4.201537585799497"/>
          <point xsi:type="esdl:Point" lat="53.40130535439968" lon="4.201543560422587"/>
          <point xsi:type="esdl:Point" lat="53.401305373268215" lon="4.201543560952593"/>
          <point xsi:type="esdl:Point" lat="53.40131886521715" lon="4.201542065410358"/>
          <point xsi:type="esdl:Point" lat="53.401318884085676" lon="4.201542065940363"/>
          <point xsi:type="esdl:Point" lat="53.40164440215422" lon="4.201352888323309"/>
          <point xsi:type="esdl:Point" lat="53.40165791313181" lon="4.201349500991969"/>
          <point xsi:type="esdl:Point" lat="53.40167137654053" lon="4.201350841431086"/>
          <point xsi:type="esdl:Point" lat="53.401671447295584" lon="4.201350867491213"/>
          <point xsi:type="esdl:Point" lat="53.40168476955951" lon="4.201358730579642"/>
          <point xsi:type="esdl:Point" lat="53.40169363665766" lon="4.201372135887099"/>
          <point xsi:type="esdl:Point" lat="53.40169365578846" lon="4.201372199604602"/>
          <point xsi:type="esdl:Point" lat="53.4017024479469" lon="4.201389300069098"/>
          <point xsi:type="esdl:Point" lat="53.40182340562555" lon="4.2018759238275605"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="31899.49913925324" name="Pipe_Wintershall Noordzee B_V__3" capacity="10000000000.0" id="Pipe_Wintershall Noordzee B_V__3" diameter="DN500">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="1aaad9fd-a888-4877-b634-3311c239fcef" name="InPort" connectedTo="a3c5edd6-6081-4f7f-a852-29f1f6eb4111"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="455a7611-d5a3-492e-81d0-338f680f8b78" id="b4d8d75c-e83d-4b6e-9922-0b741de4f603" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.11523933863713" lon="4.010460700885419"/>
          <point xsi:type="esdl:Point" lat="54.08688074426048" lon="3.946107861450469"/>
          <point xsi:type="esdl:Point" lat="54.086834677447534" lon="3.94597534327333"/>
          <point xsi:type="esdl:Point" lat="53.942729758750616" lon="3.6217343068673227"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="64526.90370524039" name="Pipe_Noordgastransport B_V__4" capacity="6000000000.0" id="Pipe_Noordgastransport B_V__4" diameter="DN800">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="c1eeb675-bbac-42ae-9253-0d5b3f2ef854" name="InPort" connectedTo="895f1148-4200-458a-8698-b95eba4ad949"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" id="2e73e37b-3796-41cb-bf0e-2a554d220e04" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.048902189771546" lon="5.438708615226464"/>
          <point xsi:type="esdl:Point" lat="54.04883416371717" lon="5.438755961616232"/>
          <point xsi:type="esdl:Point" lat="54.048977652106586" lon="5.439278470267553"/>
          <point xsi:type="esdl:Point" lat="53.93022610928613" lon="5.56578684460204"/>
          <point xsi:type="esdl:Point" lat="53.92777561352812" lon="5.567690738219318"/>
          <point xsi:type="esdl:Point" lat="53.55523437892454" lon="5.949881067970367"/>
          <point xsi:type="esdl:Point" lat="53.55522544893675" lon="5.949885728663623"/>
          <point xsi:type="esdl:Point" lat="53.555198313738096" lon="5.949888523996208"/>
          <point xsi:type="esdl:Point" lat="53.55519186701637" lon="5.949887078535051"/>
          <point xsi:type="esdl:Point" lat="53.55518716309042" lon="5.949884389266551"/>
          <point xsi:type="esdl:Point" lat="53.55518336272238" lon="5.949878937498889"/>
          <point xsi:type="esdl:Point" lat="53.55517986133799" lon="5.949872556675595"/>
          <point xsi:type="esdl:Point" lat="53.55517778019009" lon="5.949865796026632"/>
          <point xsi:type="esdl:Point" lat="53.555176590252174" lon="5.949858011648588"/>
          <point xsi:type="esdl:Point" lat="53.555138767073004" lon="5.949339232613682"/>
          <point xsi:type="esdl:Point" lat="53.55513754563302" lon="5.949333051306212"/>
          <point xsi:type="esdl:Point" lat="53.555135080516045" lon="5.949330516422177"/>
          <point xsi:type="esdl:Point" lat="53.55513225861568" lon="5.949329722006039"/>
          <point xsi:type="esdl:Point" lat="53.55512098767271" lon="5.949331044128506"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="39500.08082431462" name="Pipe_Noordgastransport B_V__5" capacity="14000000000.0" id="Pipe_Noordgastransport B_V__5" diameter="DN800">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="807b01a9-8445-4b34-bd92-54d8ea7d0a81" name="InPort" connectedTo="6b368901-7cfb-4a28-ae30-272a209477b3"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="bbd74c33-142e-4cf5-aab5-eebbfd8108be" id="f17e5722-26dc-46cb-82e4-e8bedb50532e" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.402006313670235" lon="4.2021020197054755"/>
          <point xsi:type="esdl:Point" lat="53.4013649224219" lon="4.205445716647921"/>
          <point xsi:type="esdl:Point" lat="53.399798244539994" lon="4.210139341953576"/>
          <point xsi:type="esdl:Point" lat="53.398186529388774" lon="4.216942117708331"/>
          <point xsi:type="esdl:Point" lat="53.39800282193413" lon="4.218736603764423"/>
          <point xsi:type="esdl:Point" lat="53.39807699791765" lon="4.220125756795021"/>
          <point xsi:type="esdl:Point" lat="53.39828071305577" lon="4.22145183577677"/>
          <point xsi:type="esdl:Point" lat="53.40048246769667" lon="4.230268902734279"/>
          <point xsi:type="esdl:Point" lat="53.40584138875145" lon="4.245752509852109"/>
          <point xsi:type="esdl:Point" lat="53.406472439842396" lon="4.248162848824089"/>
          <point xsi:type="esdl:Point" lat="53.40706592890452" lon="4.251580077130554"/>
          <point xsi:type="esdl:Point" lat="53.40822680084306" lon="4.260008732447908"/>
          <point xsi:type="esdl:Point" lat="53.40951348665739" lon="4.271766427858416"/>
          <point xsi:type="esdl:Point" lat="53.41068362872383" lon="4.277518412128528"/>
          <point xsi:type="esdl:Point" lat="53.41084224823626" lon="4.280703073057839"/>
          <point xsi:type="esdl:Point" lat="53.411692723178824" lon="4.28651564901726"/>
          <point xsi:type="esdl:Point" lat="53.414105849559945" lon="4.31340078949601"/>
          <point xsi:type="esdl:Point" lat="53.41503178221062" lon="4.319180705011387"/>
          <point xsi:type="esdl:Point" lat="53.41425714174515" lon="4.36722775561219"/>
          <point xsi:type="esdl:Point" lat="53.41346729754579" lon="4.376182073709558"/>
          <point xsi:type="esdl:Point" lat="53.41276362923958" lon="4.412105160219414"/>
          <point xsi:type="esdl:Point" lat="53.41239227810776" lon="4.418172406873052"/>
          <point xsi:type="esdl:Point" lat="53.4133132893113" lon="4.433145368437305"/>
          <point xsi:type="esdl:Point" lat="53.41324976996459" lon="4.436164942050198"/>
          <point xsi:type="esdl:Point" lat="53.413009676544974" lon="4.439142441117414"/>
          <point xsi:type="esdl:Point" lat="53.4128703162626" lon="4.454147188472052"/>
          <point xsi:type="esdl:Point" lat="53.41268015230065" lon="4.457210078542518"/>
          <point xsi:type="esdl:Point" lat="53.41260420856118" lon="4.473652712621747"/>
          <point xsi:type="esdl:Point" lat="53.412453458991195" lon="4.476729813860344"/>
          <point xsi:type="esdl:Point" lat="53.41266322558807" lon="4.482682358507091"/>
          <point xsi:type="esdl:Point" lat="53.41250508859999" lon="4.487446421908933"/>
          <point xsi:type="esdl:Point" lat="53.41261939880951" lon="4.490534848037639"/>
          <point xsi:type="esdl:Point" lat="53.412589594119005" lon="4.491481703114399"/>
          <point xsi:type="esdl:Point" lat="53.41174153038979" lon="4.497470314760475"/>
          <point xsi:type="esdl:Point" lat="53.4116590053832" lon="4.499032166182549"/>
          <point xsi:type="esdl:Point" lat="53.41164643843376" lon="4.5043771543311655"/>
          <point xsi:type="esdl:Point" lat="53.411582382901834" lon="4.505122966824632"/>
          <point xsi:type="esdl:Point" lat="53.411227338085574" lon="4.508196872594068"/>
          <point xsi:type="esdl:Point" lat="53.41118415681495" lon="4.509607517251898"/>
          <point xsi:type="esdl:Point" lat="53.411278521878906" lon="4.511386245456537"/>
          <point xsi:type="esdl:Point" lat="53.411217268153905" lon="4.514092265137847"/>
          <point xsi:type="esdl:Point" lat="53.4108067591493" lon="4.518618847557593"/>
          <point xsi:type="esdl:Point" lat="53.410784064774695" lon="4.524505315159362"/>
          <point xsi:type="esdl:Point" lat="53.410962057339106" lon="4.529180448240652"/>
          <point xsi:type="esdl:Point" lat="53.410738605361594" lon="4.538178030774155"/>
          <point xsi:type="esdl:Point" lat="53.41057041443636" lon="4.54006767712001"/>
          <point xsi:type="esdl:Point" lat="53.41066592680773" lon="4.5458937089171245"/>
          <point xsi:type="esdl:Point" lat="53.41042731886393" lon="4.549044580920763"/>
          <point xsi:type="esdl:Point" lat="53.410362054075776" lon="4.560958122399882"/>
          <point xsi:type="esdl:Point" lat="53.410484203312635" lon="4.5631652413891"/>
          <point xsi:type="esdl:Point" lat="53.41046212895897" lon="4.564301863018416"/>
          <point xsi:type="esdl:Point" lat="53.41003691686038" lon="4.569808470716959"/>
          <point xsi:type="esdl:Point" lat="53.41016887834555" lon="4.5772986773829984"/>
          <point xsi:type="esdl:Point" lat="53.40969164024435" lon="4.584554449056442"/>
          <point xsi:type="esdl:Point" lat="53.40976376848459" lon="4.590886193362647"/>
          <point xsi:type="esdl:Point" lat="53.409682636638806" lon="4.595356556229508"/>
          <point xsi:type="esdl:Point" lat="53.40968617642976" lon="4.599795018061115"/>
          <point xsi:type="esdl:Point" lat="53.4093245894561" lon="4.602624969184275"/>
          <point xsi:type="esdl:Point" lat="53.409201518012644" lon="4.604425741345301"/>
          <point xsi:type="esdl:Point" lat="53.40920654367242" lon="4.608728815187863"/>
          <point xsi:type="esdl:Point" lat="53.409094594806255" lon="4.61036450074214"/>
          <point xsi:type="esdl:Point" lat="53.40916836340649" lon="4.613556835080606"/>
          <point xsi:type="esdl:Point" lat="53.40878387414844" lon="4.619379706892011"/>
          <point xsi:type="esdl:Point" lat="53.40890393807143" lon="4.623777403193992"/>
          <point xsi:type="esdl:Point" lat="53.40876621120703" lon="4.626630686673251"/>
          <point xsi:type="esdl:Point" lat="53.408562936180054" lon="4.62835309547726"/>
          <point xsi:type="esdl:Point" lat="53.40823425577536" lon="4.645115450305716"/>
          <point xsi:type="esdl:Point" lat="53.40812740942312" lon="4.646344999012997"/>
          <point xsi:type="esdl:Point" lat="53.40812483921546" lon="4.647834333044428"/>
          <point xsi:type="esdl:Point" lat="53.4082734344832" lon="4.650743718352356"/>
          <point xsi:type="esdl:Point" lat="53.407888138696926" lon="4.661449647112066"/>
          <point xsi:type="esdl:Point" lat="53.40796886140734" lon="4.666197902141202"/>
          <point xsi:type="esdl:Point" lat="53.40752466300259" lon="4.670964719400413"/>
          <point xsi:type="esdl:Point" lat="53.40761279961585" lon="4.674939951975109"/>
          <point xsi:type="esdl:Point" lat="53.40747744470323" lon="4.677537347524977"/>
          <point xsi:type="esdl:Point" lat="53.40728220661892" lon="4.679486051596961"/>
          <point xsi:type="esdl:Point" lat="53.407016910564245" lon="4.6885937372302235"/>
          <point xsi:type="esdl:Point" lat="53.40710000663639" lon="4.690103584740325"/>
          <point xsi:type="esdl:Point" lat="53.4068649010754" lon="4.697531315357019"/>
          <point xsi:type="esdl:Point" lat="53.407007334853745" lon="4.7018607689016365"/>
          <point xsi:type="esdl:Point" lat="53.405795127933885" lon="4.7348642393255425"/>
          <point xsi:type="esdl:Point" lat="53.40589565910655" lon="4.737983976116693"/>
          <point xsi:type="esdl:Point" lat="53.405693972533825" lon="4.742427300178592"/>
          <point xsi:type="esdl:Point" lat="53.405881514589666" lon="4.747095499568446"/>
          <point xsi:type="esdl:Point" lat="53.405477816064376" lon="4.767411764248454"/>
          <point xsi:type="esdl:Point" lat="53.405393545887186" lon="4.768233739433105"/>
          <point xsi:type="esdl:Point" lat="53.40502159895008" lon="4.771013321632009"/>
          <point xsi:type="esdl:Point" lat="53.40491282051896" lon="4.7727215492446655"/>
          <point xsi:type="esdl:Point" lat="53.40508209660298" lon="4.7763565952291245"/>
          <point xsi:type="esdl:Point" lat="53.40504836027513" lon="4.777077140637915"/>
          <point xsi:type="esdl:Point" lat="53.40471519079541" lon="4.781335712875551"/>
          <point xsi:type="esdl:Point" lat="53.40471854340059" lon="4.785041600838747"/>
          <point xsi:type="esdl:Point" lat="53.40501696863106" lon="4.788270048924873"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="79467.51651055354" name="Pipe_Noordgastransport B_V__6" capacity="14000000000.0" id="Pipe_Noordgastransport B_V__6" diameter="DN800">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="a770de95-d2ea-417f-8cdb-59ee45f3621f" name="InPort" connectedTo="1f7025c6-e9fb-4eea-a716-98a284654c6d"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" id="0b5222fd-99fe-4280-927d-77252f7e49e7" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.40501696863106" lon="4.788270048924873"/>
          <point xsi:type="esdl:Point" lat="53.405019542673486" lon="4.791036744539497"/>
          <point xsi:type="esdl:Point" lat="53.40495353984059" lon="4.793636575826342"/>
          <point xsi:type="esdl:Point" lat="53.40502795997733" lon="4.795264456053863"/>
          <point xsi:type="esdl:Point" lat="53.404951439732464" lon="4.79676563227924"/>
          <point xsi:type="esdl:Point" lat="53.404517754908674" lon="4.799612899202052"/>
          <point xsi:type="esdl:Point" lat="53.40444595808867" lon="4.801076947365034"/>
          <point xsi:type="esdl:Point" lat="53.40448252405291" lon="4.80282357084143"/>
          <point xsi:type="esdl:Point" lat="53.40483602642899" lon="4.805606604762915"/>
          <point xsi:type="esdl:Point" lat="53.411739622024115" lon="4.835165414954659"/>
          <point xsi:type="esdl:Point" lat="53.418286229210494" lon="4.870931416798792"/>
          <point xsi:type="esdl:Point" lat="53.41884857237401" lon="4.875199940537212"/>
          <point xsi:type="esdl:Point" lat="53.42095559961158" lon="4.883555031127117"/>
          <point xsi:type="esdl:Point" lat="53.42159861308113" lon="4.888100135200038"/>
          <point xsi:type="esdl:Point" lat="53.42221004441134" lon="4.890894528542869"/>
          <point xsi:type="esdl:Point" lat="53.423381484510514" lon="4.897840060592021"/>
          <point xsi:type="esdl:Point" lat="53.42561147546902" lon="4.906277954102911"/>
          <point xsi:type="esdl:Point" lat="53.42691518201647" lon="4.913576314113455"/>
          <point xsi:type="esdl:Point" lat="53.42726958779924" lon="4.91502219351744"/>
          <point xsi:type="esdl:Point" lat="53.42991451935497" lon="4.931097407258071"/>
          <point xsi:type="esdl:Point" lat="53.434546104259134" lon="4.952007773074626"/>
          <point xsi:type="esdl:Point" lat="53.43810107771264" lon="4.970930644298605"/>
          <point xsi:type="esdl:Point" lat="53.439024158822605" lon="4.974704210329194"/>
          <point xsi:type="esdl:Point" lat="53.4469727041226" lon="5.016805527938555"/>
          <point xsi:type="esdl:Point" lat="53.447597641694465" lon="5.019320877586713"/>
          <point xsi:type="esdl:Point" lat="53.45471505229848" lon="5.056770952064165"/>
          <point xsi:type="esdl:Point" lat="53.45510515635337" lon="5.059696849925168"/>
          <point xsi:type="esdl:Point" lat="53.45704867130218" lon="5.068058752332075"/>
          <point xsi:type="esdl:Point" lat="53.46018920150107" lon="5.08070900733203"/>
          <point xsi:type="esdl:Point" lat="53.46419798280462" lon="5.102320979241494"/>
          <point xsi:type="esdl:Point" lat="53.46611164245437" lon="5.11055143708379"/>
          <point xsi:type="esdl:Point" lat="53.46739922809262" lon="5.119392549219558"/>
          <point xsi:type="esdl:Point" lat="53.48325318229643" lon="5.199441722832366"/>
          <point xsi:type="esdl:Point" lat="53.48783892892453" lon="5.2252394013209695"/>
          <point xsi:type="esdl:Point" lat="53.489261695970946" lon="5.230807083364637"/>
          <point xsi:type="esdl:Point" lat="53.49703819216908" lon="5.271074659860513"/>
          <point xsi:type="esdl:Point" lat="53.49739459084806" lon="5.273919784310356"/>
          <point xsi:type="esdl:Point" lat="53.501825351606065" lon="5.293760485981383"/>
          <point xsi:type="esdl:Point" lat="53.504579077070936" lon="5.308100092797986"/>
          <point xsi:type="esdl:Point" lat="53.50542730909664" lon="5.3139825298567045"/>
          <point xsi:type="esdl:Point" lat="53.51854757210766" lon="5.379762566199114"/>
          <point xsi:type="esdl:Point" lat="53.518959375572265" lon="5.382685183789991"/>
          <point xsi:type="esdl:Point" lat="53.52193224359884" lon="5.396885340876009"/>
          <point xsi:type="esdl:Point" lat="53.53127928247645" lon="5.445887453409293"/>
          <point xsi:type="esdl:Point" lat="53.5346791005022" lon="5.511905821447357"/>
          <point xsi:type="esdl:Point" lat="53.534599955032526" lon="5.517760603510728"/>
          <point xsi:type="esdl:Point" lat="53.53753291446297" lon="5.556611003204266"/>
          <point xsi:type="esdl:Point" lat="53.540281898253006" lon="5.619889564422997"/>
          <point xsi:type="esdl:Point" lat="53.54063911040415" lon="5.622870156425669"/>
          <point xsi:type="esdl:Point" lat="53.55512637524054" lon="5.949309530160172"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="57414.97987701351" name="Pipe_Noordgastransport B_V__7" capacity="14000000000.0" id="Pipe_Noordgastransport B_V__7" diameter="DN800">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="324ecaa9-c9b6-4ad7-a209-036ca42bf923" name="InPort" connectedTo="3e73f2c5-5936-4950-be17-3aecf5cfcac9"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="24bbeb1d-cee8-49cd-beaf-9a85219355af" id="71f64b37-a1e2-4966-a2f6-e543b8e714ca" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.55512637524054" lon="5.949309530160172"/>
          <point xsi:type="esdl:Point" lat="53.56005382886746" lon="6.0528710277366296"/>
          <point xsi:type="esdl:Point" lat="53.56054977661937" lon="6.058886918244461"/>
          <point xsi:type="esdl:Point" lat="53.56077784453837" lon="6.071031428027664"/>
          <point xsi:type="esdl:Point" lat="53.56317174063936" lon="6.124725655987258"/>
          <point xsi:type="esdl:Point" lat="53.56143208495749" lon="6.271420146068295"/>
          <point xsi:type="esdl:Point" lat="53.56181740397432" lon="6.276026174584471"/>
          <point xsi:type="esdl:Point" lat="53.567441304749806" lon="6.310989013798565"/>
          <point xsi:type="esdl:Point" lat="53.571152708617554" lon="6.337422853793976"/>
          <point xsi:type="esdl:Point" lat="53.57288414831567" lon="6.405781246594491"/>
          <point xsi:type="esdl:Point" lat="53.57261690151535" lon="6.409003524943448"/>
          <point xsi:type="esdl:Point" lat="53.57195675528364" lon="6.412744829067568"/>
          <point xsi:type="esdl:Point" lat="53.57151217634097" lon="6.418554275071962"/>
          <point xsi:type="esdl:Point" lat="53.56641488142687" lon="6.450713571602057"/>
          <point xsi:type="esdl:Point" lat="53.56553929275689" lon="6.459334695020436"/>
          <point xsi:type="esdl:Point" lat="53.56540188298691" lon="6.4624143307208595"/>
          <point xsi:type="esdl:Point" lat="53.56616171668192" lon="6.4836113721750115"/>
          <point xsi:type="esdl:Point" lat="53.56586076697671" lon="6.49282597329913"/>
          <point xsi:type="esdl:Point" lat="53.56613041559553" lon="6.507735075174938"/>
          <point xsi:type="esdl:Point" lat="53.563388728287954" lon="6.570971190268857"/>
          <point xsi:type="esdl:Point" lat="53.562675618253635" lon="6.576884717184125"/>
          <point xsi:type="esdl:Point" lat="53.560666314995856" lon="6.587215588586832"/>
          <point xsi:type="esdl:Point" lat="53.56047569784368" lon="6.587914846968677"/>
          <point xsi:type="esdl:Point" lat="53.55899350194431" lon="6.591746827046561"/>
          <point xsi:type="esdl:Point" lat="53.55249206915339" lon="6.6025388497951285"/>
          <point xsi:type="esdl:Point" lat="53.54691405913971" lon="6.609539195246288"/>
          <point xsi:type="esdl:Point" lat="53.546518429539574" lon="6.6099467297461025"/>
          <point xsi:type="esdl:Point" lat="53.5457079927627" lon="6.610598428217619"/>
          <point xsi:type="esdl:Point" lat="53.54426786195789" lon="6.611230716242819"/>
          <point xsi:type="esdl:Point" lat="53.54377205462635" lon="6.611355004531433"/>
          <point xsi:type="esdl:Point" lat="53.54302557287859" lon="6.611414302808428"/>
          <point xsi:type="esdl:Point" lat="53.54090950310465" lon="6.611352188250135"/>
          <point xsi:type="esdl:Point" lat="53.54014637797323" lon="6.6113878686145675"/>
          <point xsi:type="esdl:Point" lat="53.53978714525603" lon="6.6113795961279305"/>
          <point xsi:type="esdl:Point" lat="53.53920831486118" lon="6.611394134633169"/>
          <point xsi:type="esdl:Point" lat="53.538687821336595" lon="6.611359148989845"/>
          <point xsi:type="esdl:Point" lat="53.53781493385165" lon="6.611375351848725"/>
          <point xsi:type="esdl:Point" lat="53.522981090741055" lon="6.610881638801636"/>
          <point xsi:type="esdl:Point" lat="53.5215690439359" lon="6.610882147301985"/>
          <point xsi:type="esdl:Point" lat="53.5136097295045" lon="6.6106163694782705"/>
          <point xsi:type="esdl:Point" lat="53.51229562384723" lon="6.610625834783874"/>
          <point xsi:type="esdl:Point" lat="53.50950745396651" lon="6.610586946328949"/>
          <point xsi:type="esdl:Point" lat="53.50683004108711" lon="6.610683472156758"/>
          <point xsi:type="esdl:Point" lat="53.50276586330175" lon="6.610488825605237"/>
          <point xsi:type="esdl:Point" lat="53.500967920000136" lon="6.610610249777264"/>
          <point xsi:type="esdl:Point" lat="53.50009979742362" lon="6.610864332371412"/>
          <point xsi:type="esdl:Point" lat="53.497530898209746" lon="6.6122909216224794"/>
          <point xsi:type="esdl:Point" lat="53.473091826811476" lon="6.636097032790571"/>
          <point xsi:type="esdl:Point" lat="53.47202875970701" lon="6.63748665740076"/>
          <point xsi:type="esdl:Point" lat="53.471040798517954" lon="6.639040613763362"/>
          <point xsi:type="esdl:Point" lat="53.469426975801" lon="6.64256781229079"/>
          <point xsi:type="esdl:Point" lat="53.46896722241708" lon="6.644214052169306"/>
          <point xsi:type="esdl:Point" lat="53.46796848771502" lon="6.648936680086965"/>
          <point xsi:type="esdl:Point" lat="53.46786799180627" lon="6.655694017752092"/>
          <point xsi:type="esdl:Point" lat="53.46955291851841" lon="6.688384907344446"/>
          <point xsi:type="esdl:Point" lat="53.46951717109312" lon="6.68846470573318"/>
          <point xsi:type="esdl:Point" lat="53.46907811407812" lon="6.688615012196863"/>
          <point xsi:type="esdl:Point" lat="53.46682970924358" lon="6.68890215143701"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="120999.14810173953" name="Pipe_Wintershall Noordzee B_V__8" capacity="14000000000.0" id="Pipe_Wintershall Noordzee B_V__8" diameter="DN500">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="c7dccfbf-5abc-4b8e-afc7-98c8999723ce" name="InPort" connectedTo="d5cb0a75-71d3-4e2b-b8c1-4e6ef4dc4111"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="ad2e264c-42a9-486e-8b62-18e9bf02f1e1" name="OutPort" id="a9d5c219-ce78-435d-9859-422104f6ac5f"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.21788938148056" lon="3.218376973169268"/>
          <point xsi:type="esdl:Point" lat="53.21830943775387" lon="3.219697012346171"/>
          <point xsi:type="esdl:Point" lat="53.219479498811616" lon="3.2284644261211084"/>
          <point xsi:type="esdl:Point" lat="53.21982454396574" lon="3.235924791085787"/>
          <point xsi:type="esdl:Point" lat="53.219983410423765" lon="3.2373934061489265"/>
          <point xsi:type="esdl:Point" lat="53.22003435746154" lon="3.2388913979364533"/>
          <point xsi:type="esdl:Point" lat="53.22054368264189" lon="3.244825194177281"/>
          <point xsi:type="esdl:Point" lat="53.22113113140537" lon="3.247644291819246"/>
          <point xsi:type="esdl:Point" lat="53.22163426820549" lon="3.2520506073216304"/>
          <point xsi:type="esdl:Point" lat="53.22175374571518" lon="3.2550468094478098"/>
          <point xsi:type="esdl:Point" lat="53.222712071980126" lon="3.2608190185229775"/>
          <point xsi:type="esdl:Point" lat="53.22322030435963" lon="3.2667534816101904"/>
          <point xsi:type="esdl:Point" lat="53.224189020755915" lon="3.2755818016464815"/>
          <point xsi:type="esdl:Point" lat="53.22434389186057" lon="3.278563518232092"/>
          <point xsi:type="esdl:Point" lat="53.22543763520119" lon="3.2873632294418673"/>
          <point xsi:type="esdl:Point" lat="53.226565401044375" lon="3.293047924228831"/>
          <point xsi:type="esdl:Point" lat="53.226696615712406" lon="3.2945167861040945"/>
          <point xsi:type="esdl:Point" lat="53.22745894255533" lon="3.2988361840601357"/>
          <point xsi:type="esdl:Point" lat="53.228191403117684" lon="3.3077243322806247"/>
          <point xsi:type="esdl:Point" lat="53.22870529981721" lon="3.310604208641139"/>
          <point xsi:type="esdl:Point" lat="53.22934201024729" lon="3.3179940921210016"/>
          <point xsi:type="esdl:Point" lat="53.22958082996851" lon="3.3194489647209924"/>
          <point xsi:type="esdl:Point" lat="53.23020254072006" lon="3.322239959278962"/>
          <point xsi:type="esdl:Point" lat="53.230667581625134" lon="3.3296888790781005"/>
          <point xsi:type="esdl:Point" lat="53.23088827962541" lon="3.3311437223750464"/>
          <point xsi:type="esdl:Point" lat="53.231455669912464" lon="3.3339795335771134"/>
          <point xsi:type="esdl:Point" lat="53.23238338797516" lon="3.3428257488353985"/>
          <point xsi:type="esdl:Point" lat="53.23301350920708" lon="3.345632305313277"/>
          <point xsi:type="esdl:Point" lat="53.233400513030944" lon="3.3485568864776356"/>
          <point xsi:type="esdl:Point" lat="53.23372455460357" lon="3.3545072978771104"/>
          <point xsi:type="esdl:Point" lat="53.23484012891378" lon="3.360194764200288"/>
          <point xsi:type="esdl:Point" lat="53.23634127549759" lon="3.371908894248022"/>
          <point xsi:type="esdl:Point" lat="53.236879967317606" lon="3.377831831914207"/>
          <point xsi:type="esdl:Point" lat="53.237904407333076" lon="3.3835644796603694"/>
          <point xsi:type="esdl:Point" lat="53.238083589469575" lon="3.3865327779938"/>
          <point xsi:type="esdl:Point" lat="53.23832155662367" lon="3.3879883255250123"/>
          <point xsi:type="esdl:Point" lat="53.23868955000826" lon="3.3909134485351844"/>
          <point xsi:type="esdl:Point" lat="53.239264503062266" lon="3.3937506409329337"/>
          <point xsi:type="esdl:Point" lat="53.2394304232345" lon="3.395220577256159"/>
          <point xsi:type="esdl:Point" lat="53.23956430885419" lon="3.398203584154894"/>
          <point xsi:type="esdl:Point" lat="53.240097881067584" lon="3.4025988909831355"/>
          <point xsi:type="esdl:Point" lat="53.240609546021155" lon="3.405465691520272"/>
          <point xsi:type="esdl:Point" lat="53.24142922463809" lon="3.4128308443713804"/>
          <point xsi:type="esdl:Point" lat="53.24175698640386" lon="3.414227573263078"/>
          <point xsi:type="esdl:Point" lat="53.241994686754566" lon="3.415668407108589"/>
          <point xsi:type="esdl:Point" lat="53.242363965055" lon="3.4231194730098906"/>
          <point xsi:type="esdl:Point" lat="53.24333782650556" lon="3.4273099424387015"/>
          <point xsi:type="esdl:Point" lat="53.24356636610363" lon="3.4287508185499465"/>
          <point xsi:type="esdl:Point" lat="53.24454441565386" lon="3.439115649082119"/>
          <point xsi:type="esdl:Point" lat="53.24555105505166" lon="3.446409189038277"/>
          <point xsi:type="esdl:Point" lat="53.24634398995057" lon="3.4506885293910345"/>
          <point xsi:type="esdl:Point" lat="53.24687876136079" lon="3.456613814732349"/>
          <point xsi:type="esdl:Point" lat="53.2478663005207" lon="3.46392289701616"/>
          <point xsi:type="esdl:Point" lat="53.24860142560859" lon="3.4713045018020283"/>
          <point xsi:type="esdl:Point" lat="53.24943221479005" lon="3.477128718633958"/>
          <point xsi:type="esdl:Point" lat="53.249911689572414" lon="3.483069128721065"/>
          <point xsi:type="esdl:Point" lat="53.252778216921286" lon="3.504999708097624"/>
          <point xsi:type="esdl:Point" lat="53.252918417159954" lon="3.5079691107210498"/>
          <point xsi:type="esdl:Point" lat="53.25401317241635" lon="3.5167806292970876"/>
          <point xsi:type="esdl:Point" lat="53.25419802504175" lon="3.5197506837740162"/>
          <point xsi:type="esdl:Point" lat="53.255744334358624" lon="3.5299174041294097"/>
          <point xsi:type="esdl:Point" lat="53.256066041538475" lon="3.534373341606892"/>
          <point xsi:type="esdl:Point" lat="53.257483091699655" lon="3.5430403630523255"/>
          <point xsi:type="esdl:Point" lat="53.258649284436814" lon="3.5533387352945143"/>
          <point xsi:type="esdl:Point" lat="53.2587142202053" lon="3.5548386505277776"/>
          <point xsi:type="esdl:Point" lat="53.258860186227686" lon="3.556309628240963"/>
          <point xsi:type="esdl:Point" lat="53.259749873610176" lon="3.562107711302613"/>
          <point xsi:type="esdl:Point" lat="53.26016212076825" lon="3.56806460748741"/>
          <point xsi:type="esdl:Point" lat="53.26036198004838" lon="3.569506426111051"/>
          <point xsi:type="esdl:Point" lat="53.261013787951185" lon="3.572303521783885"/>
          <point xsi:type="esdl:Point" lat="53.26145828214553" lon="3.5752028221373098"/>
          <point xsi:type="esdl:Point" lat="53.26181424196066" lon="3.5796601740301734"/>
          <point xsi:type="esdl:Point" lat="53.26297442349441" lon="3.586887090316505"/>
          <point xsi:type="esdl:Point" lat="53.2636928636621" lon="3.5942881992878886"/>
          <point xsi:type="esdl:Point" lat="53.2643812769036" lon="3.5986306599617137"/>
          <point xsi:type="esdl:Point" lat="53.26473773539621" lon="3.604587773978984"/>
          <point xsi:type="esdl:Point" lat="53.26582428924209" lon="3.6118598058148406"/>
          <point xsi:type="esdl:Point" lat="53.26594250223488" lon="3.6133458358606227"/>
          <point xsi:type="esdl:Point" lat="53.26597081175913" lon="3.6148305530994658"/>
          <point xsi:type="esdl:Point" lat="53.26609806632368" lon="3.616301721255491"/>
          <point xsi:type="esdl:Point" lat="53.266884767277865" lon="3.6206012162458947"/>
          <point xsi:type="esdl:Point" lat="53.26772818793842" lon="3.6294748177505443"/>
          <point xsi:type="esdl:Point" lat="53.26870435665246" lon="3.635246949372968"/>
          <point xsi:type="esdl:Point" lat="53.27056771524278" lon="3.6514240618100375"/>
          <point xsi:type="esdl:Point" lat="53.27061352777517" lon="3.65290924173515"/>
          <point xsi:type="esdl:Point" lat="53.27055137820561" lon="3.654407793846835"/>
          <point xsi:type="esdl:Point" lat="53.27021227363224" lon="3.658856082555949"/>
          <point xsi:type="esdl:Point" lat="53.269972326274925" lon="3.664835246036278"/>
          <point xsi:type="esdl:Point" lat="53.269417366522184" lon="3.669235038404261"/>
          <point xsi:type="esdl:Point" lat="53.26833486712344" lon="3.6825929189191973"/>
          <point xsi:type="esdl:Point" lat="53.26826372872791" lon="3.6855906275829895"/>
          <point xsi:type="esdl:Point" lat="53.265958770729625" lon="3.715300523697605"/>
          <point xsi:type="esdl:Point" lat="53.26466378041091" lon="3.733150446319781"/>
          <point xsi:type="esdl:Point" lat="53.26314233483532" lon="3.7494211442729686"/>
          <point xsi:type="esdl:Point" lat="53.260924797215424" lon="3.7866665758452314"/>
          <point xsi:type="esdl:Point" lat="53.259912158103674" lon="3.7970219762049107"/>
          <point xsi:type="esdl:Point" lat="53.25964620441895" lon="3.804497634295599"/>
          <point xsi:type="esdl:Point" lat="53.25814945679561" lon="3.822293529002653"/>
          <point xsi:type="esdl:Point" lat="53.25798352183447" lon="3.8267875406032723"/>
          <point xsi:type="esdl:Point" lat="53.25763954576048" lon="3.829719033773736"/>
          <point xsi:type="esdl:Point" lat="53.25720832875574" lon="3.8386749755580145"/>
          <point xsi:type="esdl:Point" lat="53.25557129817855" lon="3.863990769323487"/>
          <point xsi:type="esdl:Point" lat="53.255172604219595" lon="3.8669057380651477"/>
          <point xsi:type="esdl:Point" lat="53.255062811727015" lon="3.8684024875545027"/>
          <point xsi:type="esdl:Point" lat="53.25470263191205" lon="3.875860022134333"/>
          <point xsi:type="esdl:Point" lat="53.25438430605348" lon="3.8788064219306553"/>
          <point xsi:type="esdl:Point" lat="53.254005377310406" lon="3.8862783484645687"/>
          <point xsi:type="esdl:Point" lat="53.253529570169476" lon="3.8922192052569167"/>
          <point xsi:type="esdl:Point" lat="53.25343531608912" lon="3.8952000811002705"/>
          <point xsi:type="esdl:Point" lat="53.252449105350735" lon="3.905566753771663"/>
          <point xsi:type="esdl:Point" lat="53.252298137287674" lon="3.910045204108143"/>
          <point xsi:type="esdl:Point" lat="53.25077665846941" lon="3.92783394290751"/>
          <point xsi:type="esdl:Point" lat="53.250577174733415" lon="3.9338099225249104"/>
          <point xsi:type="esdl:Point" lat="53.24898926166076" lon="3.951595655758966"/>
          <point xsi:type="esdl:Point" lat="53.24854888848825" lon="3.9605484529905906"/>
          <point xsi:type="esdl:Point" lat="53.24838426910736" lon="3.9620135272452237"/>
          <point xsi:type="esdl:Point" lat="53.24831823522343" lon="3.9635107983233806"/>
          <point xsi:type="esdl:Point" lat="53.24828441297105" lon="3.971003738526898"/>
          <point xsi:type="esdl:Point" lat="53.248137506722856" lon="3.972484176533088"/>
          <point xsi:type="esdl:Point" lat="53.24761068277562" lon="3.975349770614832"/>
          <point xsi:type="esdl:Point" lat="53.247289903352666" lon="3.978294935191706"/>
          <point xsi:type="esdl:Point" lat="53.24718449508562" lon="3.981274953808716"/>
          <point xsi:type="esdl:Point" lat="53.2465694213423" lon="3.9871806980886717"/>
          <point xsi:type="esdl:Point" lat="53.24655907476968" lon="3.9916765066073197"/>
          <point xsi:type="esdl:Point" lat="53.24630066259757" lon="3.9946379442014988"/>
          <point xsi:type="esdl:Point" lat="53.24413303188284" lon="4.007625514865875"/>
          <point xsi:type="esdl:Point" lat="53.24339080167988" lon="4.010350477393446"/>
          <point xsi:type="esdl:Point" lat="53.24216099196084" lon="4.017544427898368"/>
          <point xsi:type="esdl:Point" lat="53.241454248077474" lon="4.020299930270991"/>
          <point xsi:type="esdl:Point" lat="53.23987480820643" lon="4.030436906652743"/>
          <point xsi:type="esdl:Point" lat="53.23916789332092" lon="4.033177043845487"/>
          <point xsi:type="esdl:Point" lat="53.23780678308628" lon="4.041864851543027"/>
          <point xsi:type="esdl:Point" lat="53.236897727197146" lon="4.0460981139361785"/>
          <point xsi:type="esdl:Point" lat="53.23665764996815" lon="4.047845346146944"/>
          <point xsi:type="esdl:Point" lat="53.2361228089637" lon="4.050394407178197"/>
          <point xsi:type="esdl:Point" lat="53.235737421039296" lon="4.05332166092934"/>
          <point xsi:type="esdl:Point" lat="53.23544119004239" lon="4.054288312799854"/>
          <point xsi:type="esdl:Point" lat="53.23363997560217" lon="4.064776703967293"/>
          <point xsi:type="esdl:Point" lat="53.23272124852821" lon="4.068993868613435"/>
          <point xsi:type="esdl:Point" lat="53.23048289397455" lon="4.081941933563506"/>
          <point xsi:type="esdl:Point" lat="53.22983601450104" lon="4.087828183521448"/>
          <point xsi:type="esdl:Point" lat="53.22840139784244" lon="4.093319693315857"/>
          <point xsi:type="esdl:Point" lat="53.226106765349385" lon="4.106233788680071"/>
          <point xsi:type="esdl:Point" lat="53.22577377845591" lon="4.109176236670677"/>
          <point xsi:type="esdl:Point" lat="53.22344164586681" lon="4.1220727602423315"/>
          <point xsi:type="esdl:Point" lat="53.222369104005956" lon="4.126178826374532"/>
          <point xsi:type="esdl:Point" lat="53.22115929851007" lon="4.133366587828506"/>
          <point xsi:type="esdl:Point" lat="53.220831344544074" lon="4.134765859311783"/>
          <point xsi:type="esdl:Point" lat="53.22043219221942" lon="4.136088323041639"/>
          <point xsi:type="esdl:Point" lat="53.21834779427519" lon="4.149093326502249"/>
          <point xsi:type="esdl:Point" lat="53.21748322304662" lon="4.159464162748203"/>
          <point xsi:type="esdl:Point" lat="53.217235569263444" lon="4.160895263653038"/>
          <point xsi:type="esdl:Point" lat="53.21690729004353" lon="4.162294199858103"/>
          <point xsi:type="esdl:Point" lat="53.21642769205522" lon="4.163539263117126"/>
          <point xsi:type="esdl:Point" lat="53.21459466756908" lon="4.167128736138899"/>
          <point xsi:type="esdl:Point" lat="53.210600351018996" lon="4.170179824403674"/>
          <point xsi:type="esdl:Point" lat="53.20977956512918" lon="4.170456921485058"/>
          <point xsi:type="esdl:Point" lat="53.20896145265848" lon="4.171378000330006"/>
          <point xsi:type="esdl:Point" lat="53.20317665322634" lon="4.1754872565504595"/>
          <point xsi:type="esdl:Point" lat="53.20082665957856" lon="4.177683593824891"/>
          <point xsi:type="esdl:Point" lat="53.199161459290025" lon="4.178805670705676"/>
          <point xsi:type="esdl:Point" lat="53.18302930439038" lon="4.191936451322653"/>
          <point xsi:type="esdl:Point" lat="53.182228559237195" lon="4.192004039208174"/>
          <point xsi:type="esdl:Point" lat="53.18141566707685" lon="4.19328340328885"/>
          <point xsi:type="esdl:Point" lat="53.17906564818815" lon="4.1954477379734865"/>
          <point xsi:type="esdl:Point" lat="53.16940449809361" lon="4.2032128454927555"/>
          <point xsi:type="esdl:Point" lat="53.168596173859264" lon="4.204027997002642"/>
          <point xsi:type="esdl:Point" lat="53.16451058975558" lon="4.207114754968847"/>
          <point xsi:type="esdl:Point" lat="53.162195055893804" lon="4.209398161631855"/>
          <point xsi:type="esdl:Point" lat="53.15654770854212" lon="4.213995363059504"/>
          <point xsi:type="esdl:Point" lat="53.154864969763935" lon="4.2150396442826"/>
          <point xsi:type="esdl:Point" lat="53.151742409845596" lon="4.21798715886124"/>
          <point xsi:type="esdl:Point" lat="53.148515148267016" lon="4.220617268816951"/>
          <point xsi:type="esdl:Point" lat="53.14053412572376" lon="4.227432554168991"/>
          <point xsi:type="esdl:Point" lat="53.13639571639739" lon="4.230349215049187"/>
          <point xsi:type="esdl:Point" lat="53.13403604631965" lon="4.232509033777125"/>
          <point xsi:type="esdl:Point" lat="53.13235330142575" lon="4.233537091444156"/>
          <point xsi:type="esdl:Point" lat="53.12194215098562" lon="4.2422799949650445"/>
          <point xsi:type="esdl:Point" lat="53.121187335694046" lon="4.243110026016585"/>
          <point xsi:type="esdl:Point" lat="53.110636260115086" lon="4.251411044269678"/>
          <point xsi:type="esdl:Point" lat="53.108250190026716" lon="4.253478073182228"/>
          <point xsi:type="esdl:Point" lat="53.10570862676495" lon="4.254942815159019"/>
          <point xsi:type="esdl:Point" lat="53.09139952881296" lon="4.267413828061676"/>
          <point xsi:type="esdl:Point" lat="53.090549487822095" lon="4.267881632779689"/>
          <point xsi:type="esdl:Point" lat="53.08973382920136" lon="4.2684997600951275"/>
          <point xsi:type="esdl:Point" lat="53.07537100714107" lon="4.280810914154798"/>
          <point xsi:type="esdl:Point" lat="53.07452061127448" lon="4.281308143684016"/>
          <point xsi:type="esdl:Point" lat="53.05118980621729" lon="4.300548275306406"/>
          <point xsi:type="esdl:Point" lat="53.049549631517344" lon="4.301737157451455"/>
          <point xsi:type="esdl:Point" lat="53.04644243198696" lon="4.304716581410696"/>
          <point xsi:type="esdl:Point" lat="53.04318712379696" lon="4.3072585178944465"/>
          <point xsi:type="esdl:Point" lat="53.042414720884196" lon="4.308010793568752"/>
          <point xsi:type="esdl:Point" lat="53.03752739683762" lon="4.311800369877393"/>
          <point xsi:type="esdl:Point" lat="53.035973679425425" lon="4.313289355793684"/>
          <point xsi:type="esdl:Point" lat="53.031867809099175" lon="4.316311204857158"/>
          <point xsi:type="esdl:Point" lat="53.0295067912966" lon="4.318446273283238"/>
          <point xsi:type="esdl:Point" lat="53.025490657270595" lon="4.321469913317894"/>
          <point xsi:type="esdl:Point" lat="53.024726648984505" lon="4.322266653074498"/>
          <point xsi:type="esdl:Point" lat="53.02392816196327" lon="4.32292810197689"/>
          <point xsi:type="esdl:Point" lat="53.01747766784394" lon="4.328187013168706"/>
          <point xsi:type="esdl:Point" lat="53.01579426813332" lon="4.329193740321348"/>
          <point xsi:type="esdl:Point" lat="53.01345014966602" lon="4.3314023726574105"/>
          <point xsi:type="esdl:Point" lat="53.00700809887996" lon="4.33667396450371"/>
          <point xsi:type="esdl:Point" lat="53.00449976535184" lon="4.338280579299785"/>
          <point xsi:type="esdl:Point" lat="53.00140032802881" lon="4.341284367761421"/>
          <point xsi:type="esdl:Point" lat="52.99406374994069" lon="4.346912651178235"/>
          <point xsi:type="esdl:Point" lat="52.99097257103088" lon="4.349960083757944"/>
          <point xsi:type="esdl:Point" lat="52.9853113880571" lon="4.354476047453228"/>
          <point xsi:type="esdl:Point" lat="52.982141679809715" lon="4.357296466552909"/>
          <point xsi:type="esdl:Point" lat="52.97321560868467" lon="4.364269464493058"/>
          <point xsi:type="esdl:Point" lat="52.97247758131527" lon="4.365124855802535"/>
          <point xsi:type="esdl:Point" lat="52.97188943514211" lon="4.3662381602393125"/>
          <point xsi:type="esdl:Point" lat="52.970488045234255" lon="4.370050889456591"/>
          <point xsi:type="esdl:Point" lat="52.969311446969684" lon="4.3722920656623225"/>
          <point xsi:type="esdl:Point" lat="52.967552507164655" lon="4.377463018501739"/>
          <point xsi:type="esdl:Point" lat="52.966517305742265" lon="4.379901901711367"/>
          <point xsi:type="esdl:Point" lat="52.965302298387535" lon="4.383883465477439"/>
          <point xsi:type="esdl:Point" lat="52.96476701936798" lon="4.385072455034046"/>
          <point xsi:type="esdl:Point" lat="52.96358998662482" lon="4.387327806565128"/>
          <point xsi:type="esdl:Point" lat="52.960670306316" lon="4.39482739590075"/>
          <point xsi:type="esdl:Point" lat="52.959668734562385" lon="4.398963824900907"/>
          <point xsi:type="esdl:Point" lat="52.959239918013104" lon="4.40026013872674"/>
          <point xsi:type="esdl:Point" lat="52.958115634588054" lon="4.402590924145816"/>
          <point xsi:type="esdl:Point" lat="52.956284189427905" lon="4.407697402956932"/>
          <point xsi:type="esdl:Point" lat="52.95413271792788" lon="4.412480438031974"/>
          <point xsi:type="esdl:Point" lat="52.95373936689513" lon="4.413807356372574"/>
          <point xsi:type="esdl:Point" lat="52.953443943403656" lon="4.415211882793651"/>
          <point xsi:type="esdl:Point" lat="52.95297936487906" lon="4.416476894913241"/>
          <point xsi:type="esdl:Point" lat="52.95127510593606" lon="4.419919223397402"/>
          <point xsi:type="esdl:Point" lat="52.94929174795149" lon="4.4248852303388695"/>
          <point xsi:type="esdl:Point" lat="52.94771730037823" lon="4.43022151474663"/>
          <point xsi:type="esdl:Point" lat="52.94721679748055" lon="4.431470109839992"/>
          <point xsi:type="esdl:Point" lat="52.94600383340796" lon="4.433647685593102"/>
          <point xsi:type="esdl:Point" lat="52.94326763238758" lon="4.441340786108539"/>
          <point xsi:type="esdl:Point" lat="52.942551416628106" lon="4.444055307086372"/>
          <point xsi:type="esdl:Point" lat="52.942264462841415" lon="4.445474425570245"/>
          <point xsi:type="esdl:Point" lat="52.94176415866214" lon="4.446692985501065"/>
          <point xsi:type="esdl:Point" lat="52.941192867690724" lon="4.447834678299822"/>
          <point xsi:type="esdl:Point" lat="52.94070115728581" lon="4.449083220203936"/>
          <point xsi:type="esdl:Point" lat="52.9403429601719" lon="4.450440337964029"/>
          <point xsi:type="esdl:Point" lat="52.93994787460478" lon="4.453343885884493"/>
          <point xsi:type="esdl:Point" lat="52.93958964815979" lon="4.454700937259086"/>
          <point xsi:type="esdl:Point" lat="52.93904485691871" lon="4.4558731804311495"/>
          <point xsi:type="esdl:Point" lat="52.9385886629107" lon="4.457152496613654"/>
          <point xsi:type="esdl:Point" lat="52.936845150264475" lon="4.463685908640759"/>
          <point xsi:type="esdl:Point" lat="52.93657225604164" lon="4.465402795159355"/>
          <point xsi:type="esdl:Point" lat="52.93588209279501" lon="4.468147178445903"/>
          <point xsi:type="esdl:Point" lat="52.93308741431968" lon="4.4774710057883"/>
          <point xsi:type="esdl:Point" lat="52.93257780576202" lon="4.478688605995003"/>
          <point xsi:type="esdl:Point" lat="52.92905586367509" lon="4.490738545115646"/>
          <point xsi:type="esdl:Point" lat="52.92853730880376" lon="4.491940664098103"/>
          <point xsi:type="esdl:Point" lat="52.9273758625801" lon="4.494221550366902"/>
          <point xsi:type="esdl:Point" lat="52.925771556620624" lon="4.499536767044445"/>
          <point xsi:type="esdl:Point" lat="52.92474288522623" lon="4.501970674871989"/>
          <point xsi:type="esdl:Point" lat="52.92457149045967" lon="4.503437504012479"/>
          <point xsi:type="esdl:Point" lat="52.92428402219652" lon="4.504840754017368"/>
          <point xsi:type="esdl:Point" lat="52.923370350963744" lon="4.507412343187962"/>
          <point xsi:type="esdl:Point" lat="52.92264366483314" lon="4.510124199511133"/>
          <point xsi:type="esdl:Point" lat="52.92210409755443" lon="4.512961483123817"/>
          <point xsi:type="esdl:Point" lat="52.921279380975506" lon="4.515595389018558"/>
          <point xsi:type="esdl:Point" lat="52.920991770313115" lon="4.516998449577738"/>
          <point xsi:type="esdl:Point" lat="52.92061284090507" lon="4.519915570161797"/>
          <point xsi:type="esdl:Point" lat="52.92026265134028" lon="4.521286627448462"/>
          <point xsi:type="esdl:Point" lat="52.91929567690504" lon="4.523781373741506"/>
          <point xsi:type="esdl:Point" lat="52.918586389327025" lon="4.526508216757377"/>
          <point xsi:type="esdl:Point" lat="52.917749681546184" lon="4.530747606981291"/>
          <point xsi:type="esdl:Point" lat="52.91738157527144" lon="4.53210300018265"/>
          <point xsi:type="esdl:Point" lat="52.916299094748155" lon="4.534474278187237"/>
          <point xsi:type="esdl:Point" lat="52.91461290846191" lon="4.5397242734471455"/>
          <point xsi:type="esdl:Point" lat="52.91433397592173" lon="4.541127311988617"/>
          <point xsi:type="esdl:Point" lat="52.913965776427226" lon="4.542482531824109"/>
          <point xsi:type="esdl:Point" lat="52.91150240917457" lon="4.548700625727228"/>
          <point xsi:type="esdl:Point" lat="52.910557842804295" lon="4.552875569051961"/>
          <point xsi:type="esdl:Point" lat="52.91014495674499" lon="4.55419922824183"/>
          <point xsi:type="esdl:Point" lat="52.90917730309942" lon="4.5566926443814655"/>
          <point xsi:type="esdl:Point" lat="52.90775697181583" lon="4.562158695291903"/>
          <point xsi:type="esdl:Point" lat="52.90747781039798" lon="4.563561333508152"/>
          <point xsi:type="esdl:Point" lat="52.90709175628828" lon="4.564885759221469"/>
          <point xsi:type="esdl:Point" lat="52.90650155255959" lon="4.566009469410122"/>
          <point xsi:type="esdl:Point" lat="52.90599985507211" lon="4.567240471537633"/>
          <point xsi:type="esdl:Point" lat="52.9031493785652" lon="4.5781406618668665"/>
          <point xsi:type="esdl:Point" lat="52.89575619393451" lon="4.598536450374526"/>
          <point xsi:type="esdl:Point" lat="52.89153357045165" lon="4.611625835383535"/>
          <point xsi:type="esdl:Point" lat="52.889648917073515" lon="4.619969188927299"/>
          <point xsi:type="esdl:Point" lat="52.88916136802538" lon="4.627353417224987"/>
          <point xsi:type="esdl:Point" lat="52.88917693736473" lon="4.628840441472227"/>
          <point xsi:type="esdl:Point" lat="52.88908486939066" lon="4.630308573780733"/>
          <point xsi:type="esdl:Point" lat="52.88856044075886" lon="4.633142791955391"/>
          <point xsi:type="esdl:Point" lat="52.888032813910314" lon="4.637507818237288"/>
          <point xsi:type="esdl:Point" lat="52.8857730806858" lon="4.648778127875425"/>
          <point xsi:type="esdl:Point" lat="52.88502377759683" lon="4.656106867076318"/>
          <point xsi:type="esdl:Point" lat="52.88436115444786" lon="4.660421518792538"/>
          <point xsi:type="esdl:Point" lat="52.88298945354963" lon="4.673596530971884"/>
          <point xsi:type="esdl:Point" lat="52.88101557489764" lon="4.716143743685924"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="72745.91570260194" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__9" capacity="10000000000.0" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__9" diameter="DN500">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="df628259-42cd-4887-8627-06422ea4278a" name="InPort" connectedTo="c2c4b3ca-bf1b-4095-aef1-cd4b75ee0c39"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="28e508a7-e7a5-419e-ac6f-2de2432c1e6e" id="ee4358d3-64e7-44ea-ae9d-913ccdae8344" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.85287124425952" lon="4.696464640068138"/>
          <point xsi:type="esdl:Point" lat="54.832082641809926" lon="4.700671528750999"/>
          <point xsi:type="esdl:Point" lat="54.831180815527674" lon="4.700694350720286"/>
          <point xsi:type="esdl:Point" lat="54.20986608594392" lon="4.823256216650277"/>
          <point xsi:type="esdl:Point" lat="54.208968407305925" lon="4.823293336295458"/>
          <point xsi:type="esdl:Point" lat="54.20717577943206" lon="4.823071767693012"/>
          <point xsi:type="esdl:Point" lat="54.20541537501273" lon="4.822442234944519"/>
          <point xsi:type="esdl:Point" lat="54.20370853414505" lon="4.821480839440125"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="35289.45766966107" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__10" capacity="10000000000.0" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__10" diameter="DN500">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="839bd07d-1610-431e-bb46-fef52519fe46" name="InPort" connectedTo="9f00e816-b71b-45dd-8a63-98a89f22722c"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="0e95b210-95b6-40fa-b67f-d920431a02e7" id="44d73b0f-6196-4b15-b061-579411da7fd4" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.20370853414505" lon="4.821480839440125"/>
          <point xsi:type="esdl:Point" lat="54.202077664339555" lon="4.820190193651358"/>
          <point xsi:type="esdl:Point" lat="54.200571083434625" lon="4.818524847774559"/>
          <point xsi:type="esdl:Point" lat="54.14669793768842" lon="4.737412833547257"/>
          <point xsi:type="esdl:Point" lat="54.082454220524475" lon="4.617687364889209"/>
          <point xsi:type="esdl:Point" lat="54.08175358278189" lon="4.616715338137838"/>
          <point xsi:type="esdl:Point" lat="54.07864835365657" lon="4.613604653220648"/>
          <point xsi:type="esdl:Point" lat="54.03699364625817" lon="4.589330168674018"/>
          <point xsi:type="esdl:Point" lat="53.9676229144216" lon="4.524876426325122"/>
          <point xsi:type="esdl:Point" lat="53.96619664302509" lon="4.523013281474907"/>
          <point xsi:type="esdl:Point" lat="53.963800190586035" lon="4.518470078659336"/>
          <point xsi:type="esdl:Point" lat="53.96209235583419" lon="4.513123167271595"/>
          <point xsi:type="esdl:Point" lat="53.961452239457564" lon="4.510275407802512"/>
          <point xsi:type="esdl:Point" lat="53.960915227186334" lon="4.505792897889432"/>
          <point xsi:type="esdl:Point" lat="53.96077446515716" lon="4.502749924430012"/>
          <point xsi:type="esdl:Point" lat="53.96079882908048" lon="4.5013758856079695"/>
          <point xsi:type="esdl:Point" lat="53.96064608233263" lon="4.496977455085957"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="17879.367958192797" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__11" capacity="10000000000.0" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__11" diameter="DN500">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="7cec8f23-3130-4357-8045-ebf8cd929059" name="InPort" connectedTo="558ea8ce-86e5-4473-bfc4-22f3f6bf822b"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="d58eff17-c715-4cd9-9267-0254b2a93593" id="840b9842-6472-465c-a287-1e2286334ded" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.96064497886619" lon="4.4969775695043746"/>
          <point xsi:type="esdl:Point" lat="53.959999786700514" lon="4.496760500114029"/>
          <point xsi:type="esdl:Point" lat="53.949716337622874" lon="4.484463125438268"/>
          <point xsi:type="esdl:Point" lat="53.94892995327127" lon="4.483723734524658"/>
          <point xsi:type="esdl:Point" lat="53.83694217010657" lon="4.351286579890362"/>
          <point xsi:type="esdl:Point" lat="53.83448702548336" lon="4.349396276453826"/>
          <point xsi:type="esdl:Point" lat="53.83102694790746" lon="4.347739863945234"/>
          <point xsi:type="esdl:Point" lat="53.82744151856819" lon="4.347239250273694"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="56014.931698001674" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__12" capacity="10000000000.0" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__12" diameter="DN500">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="7bc7c809-fd94-4259-8966-c5bd6604780c" name="InPort" connectedTo="aaee02c4-d5f8-4f98-920f-48451f1ddf98"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="bbd74c33-142e-4cf5-aab5-eebbfd8108be" id="4b28789c-1c0a-4a0f-90fd-cae8499bb8ec" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.82744151856819" lon="4.347239250273694"/>
          <point xsi:type="esdl:Point" lat="53.82386288442111" lon="4.347734962826876"/>
          <point xsi:type="esdl:Point" lat="53.820380731379785" lon="4.34924203879178"/>
          <point xsi:type="esdl:Point" lat="53.81709036939507" lon="4.35167499376732"/>
          <point xsi:type="esdl:Point" lat="53.81556195691837" lon="4.353295757379463"/>
          <point xsi:type="esdl:Point" lat="53.80848503120156" lon="4.362660388474802"/>
          <point xsi:type="esdl:Point" lat="53.807711925331404" lon="4.363456333527807"/>
          <point xsi:type="esdl:Point" lat="53.728524706717295" lon="4.468335812681025"/>
          <point xsi:type="esdl:Point" lat="53.721382024776354" lon="4.477540509771338"/>
          <point xsi:type="esdl:Point" lat="53.72071768384778" lon="4.478563929238928"/>
          <point xsi:type="esdl:Point" lat="53.66689331367457" lon="4.549415388375108"/>
          <point xsi:type="esdl:Point" lat="53.66612332299835" lon="4.550218699487679"/>
          <point xsi:type="esdl:Point" lat="53.66257527306561" lon="4.554859810773029"/>
          <point xsi:type="esdl:Point" lat="53.661918985182055" lon="4.555902636384005"/>
          <point xsi:type="esdl:Point" lat="53.63925231810788" lon="4.585698918026719"/>
          <point xsi:type="esdl:Point" lat="53.54616163013035" lon="4.706820534096982"/>
          <point xsi:type="esdl:Point" lat="53.54381549015188" lon="4.709011789601852"/>
          <point xsi:type="esdl:Point" lat="53.44005774118385" lon="4.768437116315614"/>
          <point xsi:type="esdl:Point" lat="53.43917243268462" lon="4.768725949724488"/>
          <point xsi:type="esdl:Point" lat="53.40514792406354" lon="4.788171538592838"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="74747.15399347262" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__13" capacity="10000000000.0" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__13" diameter="DN500">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="0493f79e-9884-4a5f-b577-c172aa462a53" name="InPort" connectedTo="1f7025c6-e9fb-4eea-a716-98a284654c6d"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="4bbab8d2-9fc5-4f4a-be67-fb829963f2ec" id="66482701-4935-405e-a995-d30d40a614fd" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.40514792406354" lon="4.788171538592838"/>
          <point xsi:type="esdl:Point" lat="53.40176424189254" lon="4.790199571737718"/>
          <point xsi:type="esdl:Point" lat="53.40088287021102" lon="4.790522649329466"/>
          <point xsi:type="esdl:Point" lat="53.352390782448616" lon="4.818146676425588"/>
          <point xsi:type="esdl:Point" lat="53.34901889486501" lon="4.82024931042375"/>
          <point xsi:type="esdl:Point" lat="53.340429523494024" lon="4.824616984265369"/>
          <point xsi:type="esdl:Point" lat="53.339539885925404" lon="4.824885032473165"/>
          <point xsi:type="esdl:Point" lat="53.337748842848185" lon="4.825016043304207"/>
          <point xsi:type="esdl:Point" lat="53.335049110000135" lon="4.824897960128419"/>
          <point xsi:type="esdl:Point" lat="53.33415429112243" lon="4.824916997594229"/>
          <point xsi:type="esdl:Point" lat="53.33325554125399" lon="4.824899268848024"/>
          <point xsi:type="esdl:Point" lat="53.33235646492368" lon="4.824903107546862"/>
          <point xsi:type="esdl:Point" lat="53.32709694114619" lon="4.824627920553267"/>
          <point xsi:type="esdl:Point" lat="53.32696203457168" lon="4.824630621859191"/>
          <point xsi:type="esdl:Point" lat="53.32068538450362" lon="4.824141334928288"/>
          <point xsi:type="esdl:Point" lat="53.31806224445566" lon="4.82312958121654"/>
          <point xsi:type="esdl:Point" lat="53.31556618907548" lon="4.821447796700047"/>
          <point xsi:type="esdl:Point" lat="53.127192151288206" lon="4.655874739972466"/>
          <point xsi:type="esdl:Point" lat="53.11709237659396" lon="4.646098658243697"/>
          <point xsi:type="esdl:Point" lat="53.116273945840774" lon="4.645472508460732"/>
          <point xsi:type="esdl:Point" lat="53.115544369257286" lon="4.64459573210913"/>
          <point xsi:type="esdl:Point" lat="53.10311943930053" lon="4.632546532409762"/>
          <point xsi:type="esdl:Point" lat="53.10230069584029" lon="4.631936681246088"/>
          <point xsi:type="esdl:Point" lat="52.95363238056736" lon="4.489536795637216"/>
          <point xsi:type="esdl:Point" lat="52.95281303971902" lon="4.488917874507511"/>
          <point xsi:type="esdl:Point" lat="52.95195096643435" lon="4.488479837182218"/>
          <point xsi:type="esdl:Point" lat="52.9511269805735" lon="4.487872876356953"/>
          <point xsi:type="esdl:Point" lat="52.948511071683036" lon="4.486773761393993"/>
          <point xsi:type="esdl:Point" lat="52.945834329771934" lon="4.486227087217114"/>
          <point xsi:type="esdl:Point" lat="52.944935938059025" lon="4.486175811048319"/>
          <point xsi:type="esdl:Point" lat="52.94135280699003" lon="4.486574792158307"/>
          <point xsi:type="esdl:Point" lat="52.93787328088984" lon="4.488033848607834"/>
          <point xsi:type="esdl:Point" lat="52.93379760902935" lon="4.491147000649138"/>
          <point xsi:type="esdl:Point" lat="52.93091667839674" lon="4.494688531266918"/>
          <point xsi:type="esdl:Point" lat="52.92904233565574" lon="4.497889610219585"/>
          <point xsi:type="esdl:Point" lat="52.926892127215794" lon="4.502638298380418"/>
          <point xsi:type="esdl:Point" lat="52.893337863720774" lon="4.612825361819098"/>
          <point xsi:type="esdl:Point" lat="52.891392686063284" lon="4.624275407879469"/>
          <point xsi:type="esdl:Point" lat="52.887845656007215" lon="4.650378457294204"/>
          <point xsi:type="esdl:Point" lat="52.88777331160405" lon="4.650732450855612"/>
          <point xsi:type="esdl:Point" lat="52.88774121189986" lon="4.65110098016443"/>
          <point xsi:type="esdl:Point" lat="52.88767783226556" lon="4.651456223641723"/>
          <point xsi:type="esdl:Point" lat="52.887023406917315" lon="4.65616263439034"/>
          <point xsi:type="esdl:Point" lat="52.88699578167089" lon="4.656531316772083"/>
          <point xsi:type="esdl:Point" lat="52.88687336720288" lon="4.657251264962906"/>
          <point xsi:type="esdl:Point" lat="52.88469435156198" lon="4.673193068463387"/>
          <point xsi:type="esdl:Point" lat="52.88467115328817" lon="4.673562833961834"/>
          <point xsi:type="esdl:Point" lat="52.884310106259406" lon="4.6768512373078375"/>
          <point xsi:type="esdl:Point" lat="52.883134657051954" lon="4.691583722583445"/>
          <point xsi:type="esdl:Point" lat="52.883084498369925" lon="4.691949589330677"/>
          <point xsi:type="esdl:Point" lat="52.8816771968297" lon="4.709402738524541"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="95437.32987174026" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__14" capacity="8000000000.0" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__14" diameter="DN500">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="8305327c-cbf6-4540-83c9-550d4bbe040c" connectedTo="c2c4b3ca-bf1b-4095-aef1-cd4b75ee0c39"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="986bf6f0-516c-4799-85a4-7d61715ea2c0" id="098cf51b-110e-4249-905b-974371312acb" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.8507424542925" lon="4.698444433700228"/>
          <point xsi:type="esdl:Point" lat="54.872681125788" lon="4.706809337064089"/>
          <point xsi:type="esdl:Point" lat="54.90284341827223" lon="4.708538156533425"/>
          <point xsi:type="esdl:Point" lat="54.902849723150545" lon="4.7085495429221975"/>
          <point xsi:type="esdl:Point" lat="55.132529327525205" lon="4.71757810450506"/>
          <point xsi:type="esdl:Point" lat="55.132541170579934" lon="4.7176035395028295"/>
          <point xsi:type="esdl:Point" lat="55.1331547161427" lon="4.717633809026845"/>
          <point xsi:type="esdl:Point" lat="55.16431403937511" lon="4.725024991874851"/>
          <point xsi:type="esdl:Point" lat="55.17329313288188" lon="4.725517720736698"/>
          <point xsi:type="esdl:Point" lat="55.209102328189395" lon="4.720604160055616"/>
          <point xsi:type="esdl:Point" lat="55.339345916347234" lon="4.725747388630594"/>
          <point xsi:type="esdl:Point" lat="55.37976778004514" lon="4.724314627360636"/>
          <point xsi:type="esdl:Point" lat="55.59525296426202" lon="4.736157850731541"/>
          <point xsi:type="esdl:Point" lat="55.69792768551515" lon="4.756470928826725"/>
          <point xsi:type="esdl:Point" lat="55.70241190839362" lon="4.756380390351134"/>
          <point xsi:type="esdl:Point" lat="55.70613029568726" lon="4.75507353963736"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="117929.55932284273" name="Pipe_Wintershall Noordzee B_V__15" capacity="10000000000.0" id="Pipe_Wintershall Noordzee B_V__15" diameter="DN500">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="847b4479-83d9-4ccc-82d5-b5e1b9b860f5" connectedTo="c2c4b3ca-bf1b-4095-aef1-cd4b75ee0c39"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="b5983290-319d-4fcf-b7d4-579580049c4c" id="8c53cd42-cbad-4760-9781-c7c7aa172116" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.853122457656646" lon="4.694934635126629"/>
          <point xsi:type="esdl:Point" lat="55.30463810616633" lon="4.087567265179179"/>
          <point xsi:type="esdl:Point" lat="55.79063767887756" lon="3.9928878168373534"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="43880.01476109635" capacity="10000000000.0" name="New_Pipe_1_16" id="New_Pipe_1_16" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="614a369d-e4e9-4f93-901b-dca7502c0127" name="InPort" connectedTo="895f1148-4200-458a-8698-b95eba4ad949"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="28e508a7-e7a5-419e-ac6f-2de2432c1e6e" id="b25d47e1-559e-44ce-a7e8-2a51896b6cd9" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.04887" lon="5.43873"/>
          <point xsi:type="esdl:Point" lat="54.20372" lon="4.82149"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="75803.13056153244" capacity="10000000000.0" name="New_Pipe_2_17" id="New_Pipe_2_17" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="88d96411-fd0b-4a9a-a2b4-831063ea0892" name="InPort" connectedTo="895f1148-4200-458a-8698-b95eba4ad949"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="d58eff17-c715-4cd9-9267-0254b2a93593" id="8b4e181f-b106-410c-9672-4b452d4deaac" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.04887" lon="5.43873"/>
          <point xsi:type="esdl:Point" lat="53.82733" lon="4.34724"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="83784.68069724849" capacity="10000000000.0" name="New_Pipe_3_18" id="New_Pipe_3_18" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="d70264e7-f873-4e1e-8935-4f49f6489b11" name="InPort" connectedTo="895f1148-4200-458a-8698-b95eba4ad949"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="bacdf919-3092-49a5-97c9-2b5e69e4263b" name="OutPort" id="ef38bb26-ef73-4ddd-b906-e815b4c9ff43"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.04887" lon="5.43873"/>
          <point xsi:type="esdl:Point" lat="54.38696" lon="6.5863"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="19384.613940850842" capacity="10000000000.0" name="New_Pipe_4_19" id="New_Pipe_4_19" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="896ea0ad-0d8c-4b3f-8cf0-91627c74ba47" name="InPort" connectedTo="aaee02c4-d5f8-4f98-920f-48451f1ddf98"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="58a73ee7-f694-4821-a8d8-8dc329938006" name="OutPort" id="fd40c2fc-9366-4062-9133-01f9e410e6a5"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.82733" lon="4.34724"/>
          <point xsi:type="esdl:Point" lat="53.8428" lon="4.05396"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="17891.97068906917" capacity="10000000000.0" name="New_Pipe_5_20" id="New_Pipe_5_20" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="752d5719-1c4a-4750-897a-ea04672e3214" name="InPort" connectedTo="aaee02c4-d5f8-4f98-920f-48451f1ddf98"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="849ed0bd-e6ab-43db-bd3e-a6201cf35300" name="OutPort" id="d788f0cc-ffbc-4802-970e-c4586eec1d0c"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.82733" lon="4.34724"/>
          <point xsi:type="esdl:Point" lat="53.93275" lon="4.14185"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="13611.863393130661" capacity="10000000000.0" name="New_Pipe_6_21" id="New_Pipe_6_21" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="eb744c6c-ed13-4cf4-b686-e3490974d1be" name="InPort" connectedTo="aaee02c4-d5f8-4f98-920f-48451f1ddf98"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="e0bdf85f-09b9-45e9-a4f0-102012c4ca13" name="OutPort" id="fa4565d1-4841-4cf6-9753-7bbefc0077e8"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.82733" lon="4.34724"/>
          <point xsi:type="esdl:Point" lat="53.94962" lon="4.34525"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_0" id="Joint_0">
        <geometry xsi:type="esdl:Point" lat="53.21751306865999" lon="3.2177011169605856"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="cb7481ab-4afb-4a27-88dc-d660eff7e4ff" name="InPort"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="c7dccfbf-5abc-4b8e-afc7-98c8999723ce 08207a3d-8025-49ac-b684-d0c46a8dbaa0" id="d5cb0a75-71d3-4e2b-b8c1-4e6ef4dc4111" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1" id="Joint_1">
        <geometry xsi:type="esdl:Point" lat="53.943742686207486" lon="3.6192539856492467"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="455a7611-d5a3-492e-81d0-338f680f8b78" name="InPort"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="3ce888c0-e1fc-4529-9597-6d05683be3ea 7e8234fa-8b72-4bf5-aef7-d860e4feb3e4 213a5e17-4364-4546-9355-bdc4fa14c3b2" id="41829d65-271e-4f8f-90ae-3281dc305c20" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_2" id="Joint_2">
        <geometry xsi:type="esdl:Point" lat="53.40182340562555" lon="4.2018759238275605"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="51d6770d-910a-4c74-9edb-eb3e8f7de13a" name="InPort" connectedTo="d897984f-840b-4f6e-88e2-876b7027e8d8 f9c822e5-d0a1-47d6-92eb-8b195ea77be4"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="807b01a9-8445-4b34-bd92-54d8ea7d0a81 780755d7-4e58-4389-a447-ac7375882494" id="6b368901-7cfb-4a28-ae30-272a209477b3" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_3" id="Joint_3">
        <geometry xsi:type="esdl:Point" lat="54.048902189771546" lon="5.438708615226464"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="d4b4fd92-39e2-45f0-ae93-2d063017ec20" name="InPort" connectedTo="c7376b98-8a91-4f67-b9f7-f8295fe24a68 a0cd4417-48dd-491b-b816-769d224e53fe 4e8d7496-29b5-4c75-9a16-e4be70427615"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="c1eeb675-bbac-42ae-9253-0d5b3f2ef854 614a369d-e4e9-4f93-901b-dca7502c0127 88d96411-fd0b-4a9a-a2b4-831063ea0892 d70264e7-f873-4e1e-8935-4f49f6489b11" id="895f1148-4200-458a-8698-b95eba4ad949" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4" id="Joint_4">
        <geometry xsi:type="esdl:Point" lat="53.55512098767271" lon="5.949331044128506"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" name="InPort" connectedTo="2e73e37b-3796-41cb-bf0e-2a554d220e04 0b5222fd-99fe-4280-927d-77252f7e49e7 5585cabb-c443-46d9-bf22-995d99517849 d0dd14e7-aeed-41ca-a3ea-6b457d77a07a 1fa00c80-e559-4280-a6e9-f203a664d43c"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="324ecaa9-c9b6-4ad7-a209-036ca42bf923 1f667ad9-187c-4c8a-8b9d-1cbf5222baf3 d9de5591-8807-4933-b7f8-a1c17618a881 4ba2a6aa-70e6-45ed-949a-40edec05acdc" id="3e73f2c5-5936-4950-be17-3aecf5cfcac9" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_5" id="Joint_5">
        <geometry xsi:type="esdl:Point" lat="53.40501696863106" lon="4.788270048924873"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="bbd74c33-142e-4cf5-aab5-eebbfd8108be" name="InPort" connectedTo="f17e5722-26dc-46cb-82e4-e8bedb50532e 4b28789c-1c0a-4a0f-90fd-cae8499bb8ec 654ed160-0251-4135-bac6-43e24af3a238 970d8056-3e04-4bf8-a670-d8cbd60bbab1"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="a770de95-d2ea-417f-8cdb-59ee45f3621f 0493f79e-9884-4a5f-b577-c172aa462a53 cd05622c-a30c-4100-8e78-6f9bacf67340 a60af722-5bd2-4c07-8089-4bd54f7f96c1" id="1f7025c6-e9fb-4eea-a716-98a284654c6d" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_6" id="Joint_6">
        <geometry xsi:type="esdl:Point" lat="54.85287124425952" lon="4.696464640068138"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="c5e20e4d-5de1-4557-b9b1-007903b99d8b" name="InPort"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="df628259-42cd-4887-8627-06422ea4278a 8305327c-cbf6-4540-83c9-550d4bbe040c 847b4479-83d9-4ccc-82d5-b5e1b9b860f5" id="c2c4b3ca-bf1b-4095-aef1-cd4b75ee0c39" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7" id="Joint_7">
        <geometry xsi:type="esdl:Point" lat="54.20370853414505" lon="4.821480839440125"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="28e508a7-e7a5-419e-ac6f-2de2432c1e6e" name="InPort" connectedTo="ee4358d3-64e7-44ea-ae9d-913ccdae8344 b25d47e1-559e-44ce-a7e8-2a51896b6cd9 88c9bcc4-1169-47ef-ba72-ef3b5d36ab4f 7e7fe984-943e-43cf-8e05-0ab6676f66c4"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="839bd07d-1610-431e-bb46-fef52519fe46 814c95a3-f68a-4a3e-903a-16cd15abaf88" id="9f00e816-b71b-45dd-8a63-98a89f22722c" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_8" id="Joint_8">
        <geometry xsi:type="esdl:Point" lat="53.96064608233263" lon="4.496977455085957"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="0e95b210-95b6-40fa-b67f-d920431a02e7" name="InPort" connectedTo="44d73b0f-6196-4b15-b061-579411da7fd4 fe89871a-d4e2-4f59-99ca-a9cefa2ea886 b0e8a50d-78c8-4154-b2cb-8017d34ed860"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="7cec8f23-3130-4357-8045-ebf8cd929059 503dbe3c-87b2-4aaf-a620-c442e80cff7d" id="558ea8ce-86e5-4473-bfc4-22f3f6bf822b" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_9" id="Joint_9">
        <geometry xsi:type="esdl:Point" lat="53.82744151856819" lon="4.347239250273694"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="d58eff17-c715-4cd9-9267-0254b2a93593" name="InPort" connectedTo="840b9842-6472-465c-a287-1e2286334ded 8b4e181f-b106-410c-9672-4b452d4deaac 9cd8b8c4-e253-4c87-b590-b69252497a2f"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="7bc7c809-fd94-4259-8966-c5bd6604780c 896ea0ad-0d8c-4b3f-8cf0-91627c74ba47 752d5719-1c4a-4750-897a-ea04672e3214 eb744c6c-ed13-4cf4-b686-e3490974d1be 7071e28f-4a7b-46e9-8fbd-1e59502da5f9" id="aaee02c4-d5f8-4f98-920f-48451f1ddf98" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Import" controlStrategy="ef2d4880-b7ad-4410-adb3-06dab2a20acf" name="H2-Import" id="H2-Import" description="Hub_NL" power="100000000000.0">
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="f53d7843-13cc-4730-99e5-926703d0a28c" id="050d00ac-d6f6-4a40-82bd-71219b1ab894" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="52.2465469088849" lon="5.58133421552437"/>
        <costInformation xsi:type="esdl:CostInformation" id="7f014631-ecfe-49d4-bef0-2f07cc040551">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.4" name="H2-Import_marginalcosts" id="632b0db5-bd43-4e84-be1d-05e71ae0d580"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="100000000000.0" name="H2_Demand" id="H2_Demand" description="Hub_NL">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="1b9ed795-35a4-430e-aa0c-8b4c8b4e943a" name="InPort" connectedTo="e82b7e08-d7d1-4ba3-a692-8ec47bc0f27c">
          <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="186.0" host="http://influxdb" port="8086" id="b138f8c7-bcb3-4d42-a647-991bccb42561" measurement="H2_Demand_profile_inflex_II3050" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="normalized_curve_H2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e1c41bd3-2b51-41e3-a669-3eecdac8b59f" multiplier="TERA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in TERAWATTHOUR"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Point" lat="52.2485469088849" lon="5.58033421552437"/>
        <costInformation xsi:type="esdl:CostInformation" id="2022c35c-e618-440d-a1d6-30b71acb296f">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="82d96f37-f3c8-40b9-a9f0-d9e141c1d3dc" name="H2_Demand_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" power="100000000000.0" name="EL_Demand" id="EL_Demand" description="Hub_NL">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="d003ad2a-4aef-4177-a572-b0d62f26768b" name="InPort" connectedTo="6b4c1614-6f67-42bb-83bc-21519014cb1d">
          <profile xsi:type="esdl:InfluxDBProfile" endDate="2050-12-31T23:00:00.000000+0000" multiplier="193.0" host="http://influxdb" port="8086" id="08520fa4-4717-43d1-aa5e-31cc293231da" measurement="Demand_profile_CY2015" database="energy_profiles" startDate="2050-01-01T00:00:00.000000" field="normalized_curve">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="2cfcdc99-4a94-4a89-af9d-56aa3fe44f72" multiplier="TERA" physicalQuantity="ENERGY" unit="WATTHOUR" description="ENERGY in TERAWATTHOUR"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Point" lat="52.2445469088849" lon="5.57933421552437"/>
        <costInformation xsi:type="esdl:CostInformation" id="9573e847-29ed-4b16-ba2b-3ced1148d698">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="09f31ff2-9120-449f-8158-1df2add3b025" name="EL_Demand_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="100000000000.0" controlStrategy="85199725-81aa-48a6-994f-70c95831d20c" name="Hydrogen export" id="Hydrogen export" description="Hub_NL">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="ad541129-c483-47ee-a933-e1153863faa0" name="InPort" connectedTo="0d4e6a93-1832-4fdf-9f6e-791affb55a90"/>
        <geometry xsi:type="esdl:Point" lat="52.2485469088849" lon="5.57933421552437"/>
        <costInformation xsi:type="esdl:CostInformation" id="fcf26e6f-d804-4e35-8b8b-6a8af1648264">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.1" name="Hydrogen export_marginalcosts" id="38ce06f8-5b84-4e56-a191-7096558674a8"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" power="100000000000.0" controlStrategy="82fbf2ea-fe2b-48b6-9292-c2358363dbe0" name="Electricity export" id="Electricity export" description="Hub_NL">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="c30b0d56-208e-40a3-8192-754012432fd3" name="InPort" connectedTo="dc9f3802-31fb-4e9f-bc24-3ceeffc3d2c7"/>
        <geometry xsi:type="esdl:Point" lat="52.2445469088849" lon="5.58033421552437"/>
        <costInformation xsi:type="esdl:CostInformation" id="b68e1870-93ba-42c8-95b8-edeaf21a7b91">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.1" name="Electricity export_marginalcosts" id="5d72ec05-c05e-4816-adfd-a42071563cbd"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_NL" id="EL_HUB_NL">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="663b1149-997e-4c50-bfa5-d8539841205a" name="InPort" connectedTo="7f983f6d-97e9-4c5a-bc08-8133bf184d95 57157d59-876a-4951-9b4b-6a34f7fd0cf3 d1a30fe8-7610-4b24-9e86-9270c238b43c 06461582-7c22-4cd2-9c1b-4eafcb05890a 0d1d3ea3-f647-4233-9f35-2e66bee5c388 c2d4be73-48fd-4f30-815c-f741a645db09 d81dc4e4-00dd-44c6-b224-ea3320235871"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="2b2e1eb7-5d98-43a1-af0e-64d0b406dfde e01ac45a-56d6-4a54-ba48-e6edc88ef99e" id="2ea57f1a-e4ed-43d7-9c75-57ca2cb530d7" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57833421552437"/>
      </asset>
      <asset xsi:type="esdl:Joint" capacity="100000000000.0" name="Joint_10" id="Joint_10">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="c2893771-352a-4445-97af-48e952142f52" name="InPort" connectedTo="848902ef-4f4e-4635-8997-c47122a883ed 3774a468-078a-4374-87e9-103025995b1a 7a952945-9b3e-4a37-bcb4-0b960607b4d8"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="be9c9746-2ea3-4375-90fd-469ae6e7f287" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="52.246546908884895" lon="5.57933421552437"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_BSL" id="EL_HUB_BSL">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="b0567a7f-3c5a-4ccf-bf9d-4406f51d0060" name="InPort" connectedTo="84ef44a7-baae-462f-bdb5-2285f3132b2e"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="9bb7127b-9fce-4da1-aa3e-b58515557676" id="e456d921-1e4e-4613-a4da-bf1043c6f645" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="51.4249245845624" lon="3.73640092624319"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_MVL" id="EL_HUB_MVL">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="65add1bf-b293-4668-88cd-58f511ee9c8d" name="InPort" connectedTo="5657c071-8783-4f05-8816-d03b95034050"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="0f20d0bc-6e25-4960-aa9c-fadafbb719a6" id="7da7c050-fe3a-4691-b581-5aa461240877" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="51.9670419650243" lon="4.00765977271238"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_EEM" id="EL_HUB_EEM">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="097776dd-5da1-4a91-ac65-eaaf387a56a9" name="InPort" connectedTo="83b58229-2400-46eb-8946-bd90d65effba b59ef7de-1246-4a3f-9dc4-4298fc71c9ac 1f495e25-c980-4199-be1c-0548e3335a6e"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="d78a30fc-550b-4a79-87e2-494e07132a60" id="20000b88-ed2c-46ca-97e9-7bae2615212c" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="53.4412004792261" lon="6.8329384440276"/>
      </asset>
      <asset xsi:type="esdl:Joint" capacity="100000000000.0" name="Joint_11" id="Joint_11">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="d983e894-c523-40fc-9ee6-3eab7a40cefb" name="InPort" connectedTo="78358c98-b6e7-457d-b219-efe06cf84d46 d6eb76e1-4fe1-4728-944e-8554d2efc7ce"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="80787752-e15e-4bf5-a9f2-fe33cc136dc6" id="e200f7ec-1b15-4b6d-beec-95384be1c48f" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="53.442200479226095" lon="6.8339384440276"/>
      </asset>
      <asset xsi:type="esdl:Joint" capacity="100000000000.0" name="Joint_12" id="Joint_12">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="70c760fe-a161-439f-b9dd-d6d9d30779e8" name="InPort" connectedTo="46583104-b837-438b-90a1-ac0c67eb3b4e 71a057e8-9922-41e9-967e-204fd5993201 34aabc6b-6c04-482a-bbbc-23ae914bd5c9 570f19cd-1b9f-48c0-97d1-a975f81340ab dfcff336-b5a0-487f-897f-ae09f5735870"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="708bda88-0762-46ca-95ae-82a0d207c81f" id="7c9a6009-603c-465d-9e34-47b9115f3cbc" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="54.536824245707095" lon="4.4539659248248205"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_GTB" id="EL_HUB_GTB">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="1359b581-f569-4ce3-b0fa-4cbfefb93850" name="InPort" connectedTo="9fe50f6f-ea79-49ad-91a8-97eb2a8eebc0"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="787697ec-0701-4a8d-a252-2b895370c900" id="51005509-1e15-40ec-b8e9-0a0d15269a6b" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="51.7029849705477" lon="4.83367631576912"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_West" id="EL_HUB_West">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="e12e9c36-04b3-45de-8934-565c9610076e" name="InPort" connectedTo="fcc4287a-52d2-485d-b6ab-b13935c9531f 6c0f1ffb-75b2-4ae7-ba25-65834e396d73"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="e5fcd4fd-74fd-48d4-beb9-e72e0b734e87" id="804e3b7e-f03c-4c99-b0f2-cbde7b0b1344" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="53.512674" lon="3.503093"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_North" id="EL_HUB_North">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="6da7647d-d0c0-4a34-86ee-02e0a9618618" name="InPort" connectedTo="829025f5-d165-4fec-afc7-985a1b431360 240ec5e3-50b0-41e2-a723-9ebe5baf542c c9421584-4ed8-4252-b6af-e0232ad2c22b 42107817-35f5-41f0-907e-049e9ed33b71 04b25823-8ce8-49de-a522-0a81f1605f0a"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="55efd42d-32de-4c8e-9854-baebeeaa70ec e1af0404-7344-41c0-8e41-51216d262338" id="0f9a8562-5571-47c5-a285-e10b6acfed76" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="54.0471" lon="4.412403"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_East" id="EL_HUB_East">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="df2b7f4e-b729-4799-937c-171608abddfb" name="InPort" connectedTo="2a269ec0-be5a-46e4-94ac-bdd7313c3348 28e80fb4-b261-474b-80ff-81786fe4b913 bccd349d-6086-45da-a1df-c02eb86df038 66c4b0e4-c4e0-49a3-84c2-e47a347d55c3 fe2355d8-1bc0-4872-b101-0c1711a68b2a"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="3df5861c-468c-440d-a7c9-8ad715a80364" id="1b095bb2-e21c-4d49-8073-e704fea2f287" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="53.866123" lon="5.628928"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_DH" id="EL_HUB_DH">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="76b608fd-6fab-4007-bf4a-dbe7a04f525b" name="InPort" connectedTo="1c1cb738-0db5-407e-ba4b-fd9073b71796"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="f54ccb29-2b5f-4f19-b274-99f788babf22" id="b574991d-2cd3-476a-be9d-28df17f8b5db" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="52.88167" lon="4.70947"/>
      </asset>
      <asset xsi:type="esdl:Joint" capacity="100000000000.0" name="Joint_13" id="Joint_13">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="3c8f54e4-2ead-43ac-a3ae-dba1a7ded678" name="InPort" connectedTo="59cf3bc0-9096-43ba-8206-0db3a4dfe3e4"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="97a66417-099a-4915-a5d8-253cc4803c91" id="5fd303ba-6e43-4ade-a48f-849f95e12865" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="52.88267" lon="4.71047"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_IJVER" id="EL_HUB_IJVER">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="ac377413-0431-4d63-8a4a-475e5faba1bb" name="InPort" connectedTo="f798f861-23ed-46d5-a234-2ac65f534567 517efaa7-2504-48df-af37-12e5eac491d7"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="c7c10fb8-f00f-4cac-ac64-ee105d6ffb01" id="5021fc2e-78da-4b93-8173-8c34be115726" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="52.453695" lon="4.572916"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="CBL_WF_NDW1" capacity="2000000000.0" id="CBL_WF_NDW1" length="208366.40712540146">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="b8d57a5f-ff48-4b5b-a68b-2e1d855d9975" name="InPort" connectedTo="e4baa182-bf81-4a89-a93e-c02f79148a95"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="b0567a7f-3c5a-4ccf-bf9d-4406f51d0060" id="84ef44a7-baae-462f-bdb5-2285f3132b2e" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.10544888316223" lon="3.191426075413588"/>
          <point xsi:type="esdl:Point" lat="53.09549453994145" lon="3.2466295516186694"/>
          <point xsi:type="esdl:Point" lat="53.09522099855387" lon="3.2476061355467816"/>
          <point xsi:type="esdl:Point" lat="53.09070660579104" lon="3.2583494885848188"/>
          <point xsi:type="esdl:Point" lat="53.09043296825273" lon="3.2593258910592056"/>
          <point xsi:type="esdl:Point" lat="53.08812010203952" lon="3.2720466142802636"/>
          <point xsi:type="esdl:Point" lat="53.087839414898326" lon="3.27312132817034"/>
          <point xsi:type="esdl:Point" lat="53.08746095625155" lon="3.2741098606811394"/>
          <point xsi:type="esdl:Point" lat="53.08699404886846" lon="3.2749878682025777"/>
          <point xsi:type="esdl:Point" lat="53.08645019137366" lon="3.275733729584816"/>
          <point xsi:type="esdl:Point" lat="53.08584277802503" lon="3.2763290790185327"/>
          <point xsi:type="esdl:Point" lat="53.085186768324995" lon="3.276759263587807"/>
          <point xsi:type="esdl:Point" lat="53.08449831735103" lon="3.277013697217941"/>
          <point xsi:type="esdl:Point" lat="53.083794376698414" lon="3.2770861215876836"/>
          <point xsi:type="esdl:Point" lat="53.08309228136406" lon="3.276974763734558"/>
          <point xsi:type="esdl:Point" lat="52.95857084123278" lon="3.220445766861459"/>
          <point xsi:type="esdl:Point" lat="52.9576365022722" lon="3.2203059206334825"/>
          <point xsi:type="esdl:Point" lat="52.956701664005514" lon="3.220436286575723"/>
          <point xsi:type="esdl:Point" lat="52.94511141537663" lon="3.225760678806183"/>
          <point xsi:type="esdl:Point" lat="52.94471303028144" lon="3.225795934566493"/>
          <point xsi:type="esdl:Point" lat="52.944315862710845" lon="3.225733509452606"/>
          <point xsi:type="esdl:Point" lat="52.92752758086859" lon="3.2182381517048366"/>
          <point xsi:type="esdl:Point" lat="52.926425429921935" lon="3.2181150041974766"/>
          <point xsi:type="esdl:Point" lat="52.92620435726148" lon="3.218124091724859"/>
          <point xsi:type="esdl:Point" lat="52.92510726022365" lon="3.2183376258092298"/>
          <point xsi:type="esdl:Point" lat="52.924042866622834" lon="3.2188266516996453"/>
          <point xsi:type="esdl:Point" lat="52.89635103522503" lon="3.240300960374051"/>
          <point xsi:type="esdl:Point" lat="52.89569133839787" lon="3.2406223449859115"/>
          <point xsi:type="esdl:Point" lat="52.87664344723048" lon="3.2449608527954097"/>
          <point xsi:type="esdl:Point" lat="52.8759826574721" lon="3.245384548654714"/>
          <point xsi:type="esdl:Point" lat="52.87537037672235" lon="3.245974646389765"/>
          <point xsi:type="esdl:Point" lat="52.874821827292855" lon="3.246716470435579"/>
          <point xsi:type="esdl:Point" lat="52.86570968604618" lon="3.2635922141844915"/>
          <point xsi:type="esdl:Point" lat="52.86521944759038" lon="3.264321806184917"/>
          <point xsi:type="esdl:Point" lat="52.864669852049936" lon="3.2649249383260757"/>
          <point xsi:type="esdl:Point" lat="52.79149397338295" lon="3.321822644898002"/>
          <point xsi:type="esdl:Point" lat="52.79056028036827" lon="3.3230116136107863"/>
          <point xsi:type="esdl:Point" lat="52.78974129463648" lon="3.324411839682106"/>
          <point xsi:type="esdl:Point" lat="52.7890544156321" lon="3.3259935650361903"/>
          <point xsi:type="esdl:Point" lat="52.78851423671076" lon="3.3277231761450685"/>
          <point xsi:type="esdl:Point" lat="52.76748792690752" lon="3.433496315931828"/>
          <point xsi:type="esdl:Point" lat="52.76307199035493" lon="3.448061448452013"/>
          <point xsi:type="esdl:Point" lat="52.74835246654482" lon="3.5189644533346627"/>
          <point xsi:type="esdl:Point" lat="52.74814401490919" lon="3.5196679166447766"/>
          <point xsi:type="esdl:Point" lat="52.74788110804321" lon="3.5203199496175257"/>
          <point xsi:type="esdl:Point" lat="52.747568335765145" lon="3.5209091729568174"/>
          <point xsi:type="esdl:Point" lat="52.74721115704125" lon="3.521425301678327"/>
          <point xsi:type="esdl:Point" lat="52.746815808292624" lon="3.521859329239934"/>
          <point xsi:type="esdl:Point" lat="52.74638918846553" lon="3.5222036802046803"/>
          <point xsi:type="esdl:Point" lat="52.74593874507153" lon="3.5224523480241006"/>
          <point xsi:type="esdl:Point" lat="52.745472340624865" lon="3.5226009954827053"/>
          <point xsi:type="esdl:Point" lat="52.74499811470623" lon="3.5226470313316147"/>
          <point xsi:type="esdl:Point" lat="52.60471380650547" lon="3.5209755216559975"/>
          <point xsi:type="esdl:Point" lat="52.60404091812738" lon="3.5210506464524096"/>
          <point xsi:type="esdl:Point" lat="52.60338244691445" lon="3.521290284600084"/>
          <point xsi:type="esdl:Point" lat="52.60275321700121" lon="3.5216890353944987"/>
          <point xsi:type="esdl:Point" lat="52.58237325853425" lon="3.540725510075378"/>
          <point xsi:type="esdl:Point" lat="52.58173917511127" lon="3.5411255307029306"/>
          <point xsi:type="esdl:Point" lat="52.58107561236866" lon="3.541364113587722"/>
          <point xsi:type="esdl:Point" lat="52.58039772753794" lon="3.541435814640764"/>
          <point xsi:type="esdl:Point" lat="52.58005824890655" lon="3.541408426221776"/>
          <point xsi:type="esdl:Point" lat="52.56858002378199" lon="3.5383908926419134"/>
          <point xsi:type="esdl:Point" lat="52.53948409142036" lon="3.537846681466067"/>
          <point xsi:type="esdl:Point" lat="52.47920925293862" lon="3.5218077233320835"/>
          <point xsi:type="esdl:Point" lat="52.47582082630797" lon="3.5215253402350464"/>
          <point xsi:type="esdl:Point" lat="52.47564983345537" lon="3.5215278916684154"/>
          <point xsi:type="esdl:Point" lat="52.474970161244606" lon="3.5216443215995863"/>
          <point xsi:type="esdl:Point" lat="52.4743091210977" lon="3.5219281294775544"/>
          <point xsi:type="esdl:Point" lat="52.45867855992464" lon="3.533453441886219"/>
          <point xsi:type="esdl:Point" lat="52.45149587330466" lon="3.5362804349637322"/>
          <point xsi:type="esdl:Point" lat="52.434072090688524" lon="3.5395540134515446"/>
          <point xsi:type="esdl:Point" lat="52.42586817139984" lon="3.539365977938185"/>
          <point xsi:type="esdl:Point" lat="52.42410688897144" lon="3.53860011105086"/>
          <point xsi:type="esdl:Point" lat="52.42342111911466" lon="3.5384165600768616"/>
          <point xsi:type="esdl:Point" lat="52.41928032752231" lon="3.5383383924552603"/>
          <point xsi:type="esdl:Point" lat="52.40946903658651" lon="3.536336421608162"/>
          <point xsi:type="esdl:Point" lat="52.39206604959321" lon="3.5361025348439017"/>
          <point xsi:type="esdl:Point" lat="52.391776512578105" lon="3.536114278983447"/>
          <point xsi:type="esdl:Point" lat="52.379059890712284" lon="3.539221440394594"/>
          <point xsi:type="esdl:Point" lat="52.37353477298286" lon="3.538934313528206"/>
          <point xsi:type="esdl:Point" lat="52.372850096209234" lon="3.538681659759717"/>
          <point xsi:type="esdl:Point" lat="52.367534150474015" lon="3.5353027772558914"/>
          <point xsi:type="esdl:Point" lat="52.3668733568512" lon="3.5350939885680326"/>
          <point xsi:type="esdl:Point" lat="52.29952460738674" lon="3.530541140127138"/>
          <point xsi:type="esdl:Point" lat="52.29615222869747" lon="3.529755311458577"/>
          <point xsi:type="esdl:Point" lat="52.28608970023873" lon="3.524414055057994"/>
          <point xsi:type="esdl:Point" lat="52.285073962427845" lon="3.5242631271064613"/>
          <point xsi:type="esdl:Point" lat="52.25349915048575" lon="3.5253969226122845"/>
          <point xsi:type="esdl:Point" lat="52.253085385957434" lon="3.525381111388844"/>
          <point xsi:type="esdl:Point" lat="52.212037393041854" lon="3.517310183377731"/>
          <point xsi:type="esdl:Point" lat="52.1857824658507" lon="3.5067718081392"/>
          <point xsi:type="esdl:Point" lat="52.16614556326941" lon="3.504351559748431"/>
          <point xsi:type="esdl:Point" lat="52.16265020932089" lon="3.504897200593514"/>
          <point xsi:type="esdl:Point" lat="52.1516099495042" lon="3.503573450221154"/>
          <point xsi:type="esdl:Point" lat="52.14890833810615" lon="3.5023346107149815"/>
          <point xsi:type="esdl:Point" lat="52.11027792847409" lon="3.49783988124088"/>
          <point xsi:type="esdl:Point" lat="52.10972757390797" lon="3.497864124714639"/>
          <point xsi:type="esdl:Point" lat="52.108091088125704" lon="3.4982093972435675"/>
          <point xsi:type="esdl:Point" lat="52.10650616453716" lon="3.4989559317800674"/>
          <point xsi:type="esdl:Point" lat="52.105009878009746" lon="3.5000862227463796"/>
          <point xsi:type="esdl:Point" lat="52.10363722466205" lon="3.501573796862502"/>
          <point xsi:type="esdl:Point" lat="52.102420308585494" lon="3.503383833812774"/>
          <point xsi:type="esdl:Point" lat="52.101387585529444" lon="3.50547398033389"/>
          <point xsi:type="esdl:Point" lat="52.083931324809164" lon="3.554479795588747"/>
          <point xsi:type="esdl:Point" lat="52.07982184331045" lon="3.5640573380940532"/>
          <point xsi:type="esdl:Point" lat="52.074788994467816" lon="3.5723925185878125"/>
          <point xsi:type="esdl:Point" lat="52.06897278960638" lon="3.5792539094107148"/>
          <point xsi:type="esdl:Point" lat="51.937248404699325" lon="3.6847098072128017"/>
          <point xsi:type="esdl:Point" lat="51.93400439239228" lon="3.6862994031225775"/>
          <point xsi:type="esdl:Point" lat="51.89821122564066" lon="3.69316377814691"/>
          <point xsi:type="esdl:Point" lat="51.89794200136392" lon="3.6931569825667894"/>
          <point xsi:type="esdl:Point" lat="51.896336472261005" lon="3.692888828400387"/>
          <point xsi:type="esdl:Point" lat="51.89477365576881" lon="3.6922365559241626"/>
          <point xsi:type="esdl:Point" lat="51.88925068959294" lon="3.6882665754941835"/>
          <point xsi:type="esdl:Point" lat="51.88678085852684" lon="3.685960294117729"/>
          <point xsi:type="esdl:Point" lat="51.88287394526118" lon="3.6811396615947634"/>
          <point xsi:type="esdl:Point" lat="51.869385275784104" lon="3.6574936538558798"/>
          <point xsi:type="esdl:Point" lat="51.86403515010777" lon="3.650826698153683"/>
          <point xsi:type="esdl:Point" lat="51.75751283524017" lon="3.58256736948057"/>
          <point xsi:type="esdl:Point" lat="51.75458821688412" lon="3.580174603733493"/>
          <point xsi:type="esdl:Point" lat="51.74129925052511" lon="3.5642393850511818"/>
          <point xsi:type="esdl:Point" lat="51.73343582960317" lon="3.552630954698301"/>
          <point xsi:type="esdl:Point" lat="51.73117895495016" lon="3.5500975810073006"/>
          <point xsi:type="esdl:Point" lat="51.72879078738416" lon="3.5482380911169793"/>
          <point xsi:type="esdl:Point" lat="51.72160525519137" lon="3.5448287749000045"/>
          <point xsi:type="esdl:Point" lat="51.71886547777591" lon="3.544465188733303"/>
          <point xsi:type="esdl:Point" lat="51.718177630698435" lon="3.5444856206641977"/>
          <point xsi:type="esdl:Point" lat="51.70968218107938" lon="3.546083518298567"/>
          <point xsi:type="esdl:Point" lat="51.70701781063022" lon="3.547226627278721"/>
          <point xsi:type="esdl:Point" lat="51.6943498143697" lon="3.55673024658313"/>
          <point xsi:type="esdl:Point" lat="51.68259549955467" lon="3.5688568037333552"/>
          <point xsi:type="esdl:Point" lat="51.68176269349908" lon="3.5695057148370237"/>
          <point xsi:type="esdl:Point" lat="51.68087320024755" lon="3.5699161111592743"/>
          <point xsi:type="esdl:Point" lat="51.67456846663974" lon="3.5711264725574896"/>
          <point xsi:type="esdl:Point" lat="51.67365048237218" lon="3.5709815932721454"/>
          <point xsi:type="esdl:Point" lat="51.65900030934326" lon="3.564122928420834"/>
          <point xsi:type="esdl:Point" lat="51.65877787430361" lon="3.564087246402316"/>
          <point xsi:type="esdl:Point" lat="51.65866605218926" lon="3.564086141387342"/>
          <point xsi:type="esdl:Point" lat="51.65844336025678" lon="3.5641174225438044"/>
          <point xsi:type="esdl:Point" lat="51.65822480351525" lon="3.5641928842915576"/>
          <point xsi:type="esdl:Point" lat="51.65801375752622" lon="3.564311360798283"/>
          <point xsi:type="esdl:Point" lat="51.657813485026324" lon="3.564471018468142"/>
          <point xsi:type="esdl:Point" lat="51.65762707911269" lon="3.564669392863388"/>
          <point xsi:type="esdl:Point" lat="51.65745742087229" lon="3.564903414230757"/>
          <point xsi:type="esdl:Point" lat="51.657307131437875" lon="3.5651694705348986"/>
          <point xsi:type="esdl:Point" lat="51.657178534046274" lon="3.5654634474730234"/>
          <point xsi:type="esdl:Point" lat="51.657073614131754" lon="3.5657808031480775"/>
          <point xsi:type="esdl:Point" lat="51.6547847431127" lon="3.5760324414124045"/>
          <point xsi:type="esdl:Point" lat="51.644882635822576" lon="3.6021717069675594"/>
          <point xsi:type="esdl:Point" lat="51.62127053510961" lon="3.6403737737340087"/>
          <point xsi:type="esdl:Point" lat="51.618598342490216" lon="3.6437961713184324"/>
          <point xsi:type="esdl:Point" lat="51.61561171097303" lon="3.646464497600082"/>
          <point xsi:type="esdl:Point" lat="51.612392257869416" lon="3.648305987589483"/>
          <point xsi:type="esdl:Point" lat="51.60902794217971" lon="3.6492705099624487"/>
          <point xsi:type="esdl:Point" lat="51.6022682289862" lon="3.6494250142655416"/>
          <point xsi:type="esdl:Point" lat="51.58775003325986" lon="3.6471007751435423"/>
          <point xsi:type="esdl:Point" lat="51.58767792500951" lon="3.647109424711208"/>
          <point xsi:type="esdl:Point" lat="51.587631781799324" lon="3.647098403748424"/>
          <point xsi:type="esdl:Point" lat="51.58758691652244" lon="3.647077884316816"/>
          <point xsi:type="esdl:Point" lat="51.587544084379694" lon="3.647048210606798"/>
          <point xsi:type="esdl:Point" lat="51.58750400553707" lon="3.6470098836411275"/>
          <point xsi:type="esdl:Point" lat="51.58746735619887" lon="3.646963549598799"/>
          <point xsi:type="esdl:Point" lat="51.587434752496144" lon="3.6469099865939976"/>
          <point xsi:type="esdl:Point" lat="51.587406744233604" lon="3.6468500973694886"/>
          <point xsi:type="esdl:Point" lat="51.58738380241421" lon="3.6467848889112773"/>
          <point xsi:type="esdl:Point" lat="51.587366313901" lon="3.6467154622694014"/>
          <point xsi:type="esdl:Point" lat="51.58735457257797" lon="3.646642985008318"/>
          <point xsi:type="esdl:Point" lat="51.58734877583353" lon="3.6465686767243652"/>
          <point xsi:type="esdl:Point" lat="51.587295491044244" lon="3.6461922772065867"/>
          <point xsi:type="esdl:Point" lat="51.58730060686161" lon="3.6455733660700567"/>
          <point xsi:type="esdl:Point" lat="51.58736398387153" lon="3.6449628202962208"/>
          <point xsi:type="esdl:Point" lat="51.58767942933905" lon="3.6434249247505512"/>
          <point xsi:type="esdl:Point" lat="51.587693802827566" lon="3.643138579828637"/>
          <point xsi:type="esdl:Point" lat="51.587679851089504" lon="3.6428521813865933"/>
          <point xsi:type="esdl:Point" lat="51.58763792418825" lon="3.642572904505724"/>
          <point xsi:type="esdl:Point" lat="51.58756907188402" lon="3.6423077464338287"/>
          <point xsi:type="esdl:Point" lat="51.587475020313086" lon="3.642063350096523"/>
          <point xsi:type="esdl:Point" lat="51.58735812432248" lon="3.6418458388254162"/>
          <point xsi:type="esdl:Point" lat="51.58717472711533" lon="3.641602143365939"/>
          <point xsi:type="esdl:Point" lat="51.586892469402144" lon="3.6413147669810626"/>
          <point xsi:type="esdl:Point" lat="51.58658458999954" lon="3.6411059162295665"/>
          <point xsi:type="esdl:Point" lat="51.586259490638454" lon="3.6409812897461076"/>
          <point xsi:type="esdl:Point" lat="51.5836804787362" lon="3.64080147563807"/>
          <point xsi:type="esdl:Point" lat="51.5827321672984" lon="3.6403811582659036"/>
          <point xsi:type="esdl:Point" lat="51.582448124458665" lon="3.6401414008132904"/>
          <point xsi:type="esdl:Point" lat="51.57801135935895" lon="3.6348395776481865"/>
          <point xsi:type="esdl:Point" lat="51.576075620070256" lon="3.633469401514192"/>
          <point xsi:type="esdl:Point" lat="51.574233575719234" lon="3.632744783215202"/>
          <point xsi:type="esdl:Point" lat="51.57384949928927" lon="3.6326810199879804"/>
          <point xsi:type="esdl:Point" lat="51.57283934919808" lon="3.632724081802058"/>
          <point xsi:type="esdl:Point" lat="51.57265473357051" lon="3.6327882777996328"/>
          <point xsi:type="esdl:Point" lat="51.5724420544248" lon="3.632905880255547"/>
          <point xsi:type="esdl:Point" lat="51.57112522542156" lon="3.6339876214711193"/>
          <point xsi:type="esdl:Point" lat="51.570971567176144" lon="3.6341757142244666"/>
          <point xsi:type="esdl:Point" lat="51.56577617125999" lon="3.6422824551332607"/>
          <point xsi:type="esdl:Point" lat="51.563995963652005" lon="3.6457275278749544"/>
          <point xsi:type="esdl:Point" lat="51.56148911788686" lon="3.652583589904274"/>
          <point xsi:type="esdl:Point" lat="51.56040525875589" lon="3.6551501291176787"/>
          <point xsi:type="esdl:Point" lat="51.55739617780479" lon="3.659796561551771"/>
          <point xsi:type="esdl:Point" lat="51.55578337286281" lon="3.661499403316148"/>
          <point xsi:type="esdl:Point" lat="51.554156090722515" lon="3.6637406155584253"/>
          <point xsi:type="esdl:Point" lat="51.55335864604521" lon="3.6653465734889012"/>
          <point xsi:type="esdl:Point" lat="51.551135208700444" lon="3.672602495087869"/>
          <point xsi:type="esdl:Point" lat="51.549273797625325" lon="3.676364359101622"/>
          <point xsi:type="esdl:Point" lat="51.546992768143774" lon="3.6801822940316056"/>
          <point xsi:type="esdl:Point" lat="51.546667315917404" lon="3.6805446178538066"/>
          <point xsi:type="esdl:Point" lat="51.54541192465145" lon="3.6815203610710587"/>
          <point xsi:type="esdl:Point" lat="51.545033413486046" lon="3.681682030471521"/>
          <point xsi:type="esdl:Point" lat="51.54171535790994" lon="3.6821419580413366"/>
          <point xsi:type="esdl:Point" lat="51.53810742943491" lon="3.6816058119253228"/>
          <point xsi:type="esdl:Point" lat="51.53800390514152" lon="3.6816139736790303"/>
          <point xsi:type="esdl:Point" lat="51.537798981356936" lon="3.681662946890618"/>
          <point xsi:type="esdl:Point" lat="51.53037210748992" lon="3.6852454488864455"/>
          <point xsi:type="esdl:Point" lat="51.527298633048176" lon="3.6873210955140756"/>
          <point xsi:type="esdl:Point" lat="51.52178727346191" lon="3.6925307790236834"/>
          <point xsi:type="esdl:Point" lat="51.52016952601556" lon="3.6951048826408432"/>
          <point xsi:type="esdl:Point" lat="51.51995881264404" lon="3.695531380092124"/>
          <point xsi:type="esdl:Point" lat="51.519269550163656" lon="3.6974345009380656"/>
          <point xsi:type="esdl:Point" lat="51.518743893457106" lon="3.6999127414965236"/>
          <point xsi:type="esdl:Point" lat="51.51825101128088" lon="3.704039429989814"/>
          <point xsi:type="esdl:Point" lat="51.51823845404858" lon="3.7048600238811535"/>
          <point xsi:type="esdl:Point" lat="51.51828713130966" lon="3.705676677833469"/>
          <point xsi:type="esdl:Point" lat="51.518396506663066" lon="3.706477542525668"/>
          <point xsi:type="esdl:Point" lat="51.51934315995398" lon="3.710487408152966"/>
          <point xsi:type="esdl:Point" lat="51.52091271688734" lon="3.714051058706851"/>
          <point xsi:type="esdl:Point" lat="51.521131195670804" lon="3.7144466927342683"/>
          <point xsi:type="esdl:Point" lat="51.52142210300224" lon="3.714840619332561"/>
          <point xsi:type="esdl:Point" lat="51.522007767467095" lon="3.7154212116558747"/>
          <point xsi:type="esdl:Point" lat="51.52230334761802" lon="3.7157872293140057"/>
          <point xsi:type="esdl:Point" lat="51.522557019577185" lon="3.7162266834809965"/>
          <point xsi:type="esdl:Point" lat="51.5228424094207" lon="3.7169220802551317"/>
          <point xsi:type="esdl:Point" lat="51.522920865331564" lon="3.717200674865853"/>
          <point xsi:type="esdl:Point" lat="51.522974025872465" lon="3.717494222461143"/>
          <point xsi:type="esdl:Point" lat="51.52300082982741" lon="3.7177968552415743"/>
          <point xsi:type="esdl:Point" lat="51.5230007404864" lon="3.7181025218710415"/>
          <point xsi:type="esdl:Point" lat="51.522973760167325" lon="3.7184051131588833"/>
          <point xsi:type="esdl:Point" lat="51.522920427685555" lon="3.718698581710443"/>
          <point xsi:type="esdl:Point" lat="51.522841808643335" lon="3.71897705857962"/>
          <point xsi:type="esdl:Point" lat="51.52273947578047" lon="3.719234976965682"/>
          <point xsi:type="esdl:Point" lat="51.52261547500633" lon="3.7194671841432183"/>
          <point xsi:type="esdl:Point" lat="51.52247228345198" lon="3.7196690345151193"/>
          <point xsi:type="esdl:Point" lat="51.522042308718135" lon="3.7201268808921286"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="CBL_WF_NDW2" capacity="2000000000.0" id="CBL_WF_NDW2" length="205245.709754056">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="6f7e2234-7ee2-4068-a08a-6b9318421cbc" name="InPort" connectedTo="b35bd1e6-2635-4293-b979-f4d4c6e3251f"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="65add1bf-b293-4668-88cd-58f511ee9c8d" id="5657c071-8783-4f05-8816-d03b95034050" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.33685186756443" lon="3.2573648078563084"/>
          <point xsi:type="esdl:Point" lat="53.31369876465948" lon="3.3853377982881088"/>
          <point xsi:type="esdl:Point" lat="53.31341626373612" lon="3.3864168378772295"/>
          <point xsi:type="esdl:Point" lat="53.31303614371674" lon="3.387408782964452"/>
          <point xsi:type="esdl:Point" lat="53.31256776561794" lon="3.3882892049501874"/>
          <point xsi:type="esdl:Point" lat="53.31202266538232" lon="3.38903642236312"/>
          <point xsi:type="esdl:Point" lat="53.31141426954796" lon="3.389632038759565"/>
          <point xsi:type="esdl:Point" lat="53.31075755906785" lon="3.390061392738822"/>
          <point xsi:type="esdl:Point" lat="53.310068706485865" lon="3.3903139188254405"/>
          <point xsi:type="esdl:Point" lat="53.3093646757511" lon="3.3903834071692387"/>
          <point xsi:type="esdl:Point" lat="53.3091883255274" lon="3.390371879433433"/>
          <point xsi:type="esdl:Point" lat="53.30848970295436" lon="3.3902107100419325"/>
          <point xsi:type="esdl:Point" lat="53.237769577266185" lon="3.354551387810446"/>
          <point xsi:type="esdl:Point" lat="53.23707296957244" lon="3.3544360736567933"/>
          <point xsi:type="esdl:Point" lat="53.236374069507235" lon="3.354502458032606"/>
          <point xsi:type="esdl:Point" lat="53.2320361468596" lon="3.3560184293593878"/>
          <point xsi:type="esdl:Point" lat="53.231339522113224" lon="3.3560851514963606"/>
          <point xsi:type="esdl:Point" lat="53.23116505159318" lon="3.3560735946909874"/>
          <point xsi:type="esdl:Point" lat="53.2304738011579" lon="3.35591494907835"/>
          <point xsi:type="esdl:Point" lat="53.22980561430167" lon="3.3555799133327153"/>
          <point xsi:type="esdl:Point" lat="53.22917659556744" lon="3.355076572461917"/>
          <point xsi:type="esdl:Point" lat="53.221779989745635" lon="3.346644548938809"/>
          <point xsi:type="esdl:Point" lat="53.221154490153744" lon="3.346143226499454"/>
          <point xsi:type="esdl:Point" lat="53.095124438847925" lon="3.283179444810844"/>
          <point xsi:type="esdl:Point" lat="53.08908079560505" lon="3.2821341953493515"/>
          <point xsi:type="esdl:Point" lat="52.95828950966523" lon="3.2226318960043767"/>
          <point xsi:type="esdl:Point" lat="52.95764231132061" lon="3.222539334619512"/>
          <point xsi:type="esdl:Point" lat="52.95747976201349" lon="3.222543190772905"/>
          <point xsi:type="esdl:Point" lat="52.95683442935748" lon="3.2226664073969626"/>
          <point xsi:type="esdl:Point" lat="52.94537403782157" lon="3.2279537644283707"/>
          <point xsi:type="esdl:Point" lat="52.94470055291647" lon="3.2280282023101083"/>
          <point xsi:type="esdl:Point" lat="52.94402896633134" lon="3.227916218391414"/>
          <point xsi:type="esdl:Point" lat="52.92770578868126" lon="3.2205927675210213"/>
          <point xsi:type="esdl:Point" lat="52.92700183585708" lon="3.2205100737787635"/>
          <point xsi:type="esdl:Point" lat="52.92682530112858" lon="3.2205180694506184"/>
          <point xsi:type="esdl:Point" lat="52.926125135670055" lon="3.2206643552921794"/>
          <point xsi:type="esdl:Point" lat="52.92544743731121" lon="3.2209901804427923"/>
          <point xsi:type="esdl:Point" lat="52.8968651193103" lon="3.2431866201795874"/>
          <point xsi:type="esdl:Point" lat="52.89620541478098" lon="3.2435079647259704"/>
          <point xsi:type="esdl:Point" lat="52.87754326782702" lon="3.247759771441053"/>
          <point xsi:type="esdl:Point" lat="52.87688246822535" lon="3.2481834334507536"/>
          <point xsi:type="esdl:Point" lat="52.87627017369582" lon="3.2487735038943946"/>
          <point xsi:type="esdl:Point" lat="52.87572160689584" lon="3.2495153063988265"/>
          <point xsi:type="esdl:Point" lat="52.866807644891864" lon="3.26602226941426"/>
          <point xsi:type="esdl:Point" lat="52.866317391609776" lon="3.2667518523456303"/>
          <point xsi:type="esdl:Point" lat="52.86576778385016" lon="3.2673549689126338"/>
          <point xsi:type="esdl:Point" lat="52.79291948795021" lon="3.3238635373276284"/>
          <point xsi:type="esdl:Point" lat="52.79206337422039" lon="3.3248001359035384"/>
          <point xsi:type="esdl:Point" lat="52.79131103319788" lon="3.3259539952750337"/>
          <point xsi:type="esdl:Point" lat="52.790682507023575" lon="3.327294363101554"/>
          <point xsi:type="esdl:Point" lat="52.7901945419639" lon="3.3287855240739916"/>
          <point xsi:type="esdl:Point" lat="52.76916410855538" lon="3.4345686069242505"/>
          <point xsi:type="esdl:Point" lat="52.7647153052263" lon="3.449263984608239"/>
          <point xsi:type="esdl:Point" lat="52.74995640840543" lon="3.520319128210782"/>
          <point xsi:type="esdl:Point" lat="52.749588726767826" lon="3.5214571216659865"/>
          <point xsi:type="esdl:Point" lat="52.74912501315179" lon="3.522495471452285"/>
          <point xsi:type="esdl:Point" lat="52.748575025317656" lon="3.5234123289760655"/>
          <point xsi:type="esdl:Point" lat="52.74795033680582" lon="3.5241884070560703"/>
          <point xsi:type="esdl:Point" lat="52.74726409031382" lon="3.524807384398387"/>
          <point xsi:type="esdl:Point" lat="52.746530726207524" lon="3.5252562427970613"/>
          <point xsi:type="esdl:Point" lat="52.745765671757354" lon="3.5255255487642474"/>
          <point xsi:type="esdl:Point" lat="52.74498502363509" lon="3.5256096459562722"/>
          <point xsi:type="esdl:Point" lat="52.60518451112696" lon="3.523934434928122"/>
          <point xsi:type="esdl:Point" lat="52.60451162104149" lon="3.5240095151194524"/>
          <point xsi:type="esdl:Point" lat="52.60385314400357" lon="3.524249111371249"/>
          <point xsi:type="esdl:Point" lat="52.60322390427908" lon="3.5246478239217365"/>
          <point xsi:type="esdl:Point" lat="52.58271057407627" lon="3.543807501194234"/>
          <point xsi:type="esdl:Point" lat="52.582076480391066" lon="3.5442074803081476"/>
          <point xsi:type="esdl:Point" lat="52.581412911598214" lon="3.5444460184029785"/>
          <point xsi:type="esdl:Point" lat="52.58073502506727" lon="3.5445176724132548"/>
          <point xsi:type="esdl:Point" lat="52.580395547232925" lon="3.5444902599625507"/>
          <point xsi:type="esdl:Point" lat="52.56842690351492" lon="3.541339877697549"/>
          <point xsi:type="esdl:Point" lat="52.54515214499038" lon="3.5408652612568425"/>
          <point xsi:type="esdl:Point" lat="52.4761180136569" lon="3.522908805459375"/>
          <point xsi:type="esdl:Point" lat="52.47577956860832" lon="3.5229266472398097"/>
          <point xsi:type="esdl:Point" lat="52.47510992995435" lon="3.5230870098823015"/>
          <point xsi:type="esdl:Point" lat="52.47446258153323" lon="3.5234101870231256"/>
          <point xsi:type="esdl:Point" lat="52.46978060736384" lon="3.527062167054344"/>
          <point xsi:type="esdl:Point" lat="52.46370978041814" lon="3.5332667612362876"/>
          <point xsi:type="esdl:Point" lat="52.458910103932226" lon="3.53648990936101"/>
          <point xsi:type="esdl:Point" lat="52.45116960167503" lon="3.5394244930452126"/>
          <point xsi:type="esdl:Point" lat="52.440321398382395" lon="3.541086784531621"/>
          <point xsi:type="esdl:Point" lat="52.426035425960755" lon="3.5408902964532767"/>
          <point xsi:type="esdl:Point" lat="52.423590296856176" lon="3.5401828789425513"/>
          <point xsi:type="esdl:Point" lat="52.41940748327167" lon="3.5401102137300042"/>
          <point xsi:type="esdl:Point" lat="52.41491760367166" lon="3.5393567404231456"/>
          <point xsi:type="esdl:Point" lat="52.38798933350364" lon="3.5389919580723004"/>
          <point xsi:type="esdl:Point" lat="52.387699796055806" lon="3.539003682415062"/>
          <point xsi:type="esdl:Point" lat="52.38049792486881" lon="3.540714398032085"/>
          <point xsi:type="esdl:Point" lat="52.372841494551096" lon="3.5403362280934707"/>
          <point xsi:type="esdl:Point" lat="52.367199059153904" lon="3.538053900616352"/>
          <point xsi:type="esdl:Point" lat="52.299441939713944" lon="3.533471152791326"/>
          <point xsi:type="esdl:Point" lat="52.295610521693156" lon="3.532560922836251"/>
          <point xsi:type="esdl:Point" lat="52.28579788348853" lon="3.527307330630834"/>
          <point xsi:type="esdl:Point" lat="52.28508880774273" lon="3.52719561549462"/>
          <point xsi:type="esdl:Point" lat="52.25357213988124" lon="3.5283286128124782"/>
          <point xsi:type="esdl:Point" lat="52.25278136060039" lon="3.528294833921114"/>
          <point xsi:type="esdl:Point" lat="52.21066708568937" lon="3.519881312508004"/>
          <point xsi:type="esdl:Point" lat="52.185637323854216" lon="3.5096978915133072"/>
          <point xsi:type="esdl:Point" lat="52.11026372962402" lon="3.5007600583200023"/>
          <point xsi:type="esdl:Point" lat="52.10902735552939" lon="3.5009057598845588"/>
          <point xsi:type="esdl:Point" lat="52.107577548327576" lon="3.501442725893335"/>
          <point xsi:type="esdl:Point" lat="52.10620206274101" lon="3.502360408935387"/>
          <point xsi:type="esdl:Point" lat="52.10493851979561" lon="3.5036336741704037"/>
          <point xsi:type="esdl:Point" lat="52.103821473546304" lon="3.5052276737116337"/>
          <point xsi:type="esdl:Point" lat="52.10288147074641" lon="3.507098796250469"/>
          <point xsi:type="esdl:Point" lat="52.08519489963494" lon="3.5567505700330875"/>
          <point xsi:type="esdl:Point" lat="52.080944590553365" lon="3.5664277844966907"/>
          <point xsi:type="esdl:Point" lat="52.07578217099111" lon="3.574854754978608"/>
          <point xsi:type="esdl:Point" lat="52.06984488076354" lon="3.5818079210410025"/>
          <point xsi:type="esdl:Point" lat="51.9372524897605" lon="3.687819450273215"/>
          <point xsi:type="esdl:Point" lat="51.93388421070836" lon="3.689304143213757"/>
          <point xsi:type="esdl:Point" lat="51.913425379529244" lon="3.6926140312135924"/>
          <point xsi:type="esdl:Point" lat="51.91127502470346" lon="3.6935325546202376"/>
          <point xsi:type="esdl:Point" lat="51.90923792220479" lon="3.6949759551334447"/>
          <point xsi:type="esdl:Point" lat="51.90736274811117" lon="3.696909671164056"/>
          <point xsi:type="esdl:Point" lat="51.9056943057764" lon="3.6992874437697236"/>
          <point xsi:type="esdl:Point" lat="51.90427245202277" lon="3.7020524249517845"/>
          <point xsi:type="esdl:Point" lat="51.90313115157321" lon="3.7051385320994243"/>
          <point xsi:type="esdl:Point" lat="51.90229766490877" lon="3.708472034004784"/>
          <point xsi:type="esdl:Point" lat="51.90179189662986" lon="3.7119733021807275"/>
          <point xsi:type="esdl:Point" lat="51.90162592750308" lon="3.715558716674425"/>
          <point xsi:type="esdl:Point" lat="51.90485813347085" lon="3.7740137460654792"/>
          <point xsi:type="esdl:Point" lat="51.91251562762703" lon="3.8386347293606606"/>
          <point xsi:type="esdl:Point" lat="51.91257787961193" lon="3.8398561700596714"/>
          <point xsi:type="esdl:Point" lat="51.91253362904137" lon="3.8410796588515534"/>
          <point xsi:type="esdl:Point" lat="51.91238374914342" lon="3.8422810359816584"/>
          <point xsi:type="esdl:Point" lat="51.912131200596455" lon="3.8434365754114195"/>
          <point xsi:type="esdl:Point" lat="51.911780971408554" lon="3.8445234569787248"/>
          <point xsi:type="esdl:Point" lat="51.902101101434724" lon="3.8651934495345164"/>
          <point xsi:type="esdl:Point" lat="51.90144327711924" lon="3.8673730945026015"/>
          <point xsi:type="esdl:Point" lat="51.90101876717715" lon="3.8696991738364566"/>
          <point xsi:type="esdl:Point" lat="51.90083938627682" lon="3.8721069543729536"/>
          <point xsi:type="esdl:Point" lat="51.90091012583471" lon="3.8745294319677805"/>
          <point xsi:type="esdl:Point" lat="51.913614850145684" lon="3.967103191700624"/>
          <point xsi:type="esdl:Point" lat="51.9141686190405" lon="3.9693410688821764"/>
          <point xsi:type="esdl:Point" lat="51.91971612359116" lon="3.984004981713828"/>
          <point xsi:type="esdl:Point" lat="51.92103970933193" lon="3.9853973626466423"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="CBL_WF_NDW3" capacity="2000000000.0" id="CBL_WF_NDW3" length="266243.38320992124">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="e2c046d4-cc85-48a1-927b-73d4dbc7371d" name="InPort" connectedTo="18558581-8d07-47ef-a9e3-7eebf5fec1e9"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="1359b581-f569-4ce3-b0fa-4cbfefb93850" id="9fe50f6f-ea79-49ad-91a8-97eb2a8eebc0" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.45077948428384" lon="3.2306670426110777"/>
          <point xsi:type="esdl:Point" lat="53.41368951711878" lon="3.436073034585657"/>
          <point xsi:type="esdl:Point" lat="53.413406557646844" lon="3.437154262605962"/>
          <point xsi:type="esdl:Point" lat="53.41302601839685" lon="3.438148073308629"/>
          <point xsi:type="esdl:Point" lat="53.41255727071969" lon="3.4390299921477103"/>
          <point xsi:type="esdl:Point" lat="53.41201186055724" lon="3.4397783037823455"/>
          <point xsi:type="esdl:Point" lat="53.41140321941823" lon="3.440374583324126"/>
          <point xsi:type="esdl:Point" lat="53.41074633697593" lon="3.440804153110018"/>
          <point xsi:type="esdl:Point" lat="53.41005739001072" lon="3.441056442402139"/>
          <point xsi:type="esdl:Point" lat="53.40935334301887" lon="3.441125247219842"/>
          <point xsi:type="esdl:Point" lat="53.40917700116833" lon="3.441113480542343"/>
          <point xsi:type="esdl:Point" lat="53.40847846144602" lon="3.440951094218173"/>
          <point xsi:type="esdl:Point" lat="53.318742386024475" lon="3.3955608939626027"/>
          <point xsi:type="esdl:Point" lat="53.311821037988615" lon="3.3941392907948265"/>
          <point xsi:type="esdl:Point" lat="53.23859954210865" lon="3.3573182763544733"/>
          <point xsi:type="esdl:Point" lat="53.237902938166954" lon="3.3572029150058276"/>
          <point xsi:type="esdl:Point" lat="53.23720403583793" lon="3.3572692540222695"/>
          <point xsi:type="esdl:Point" lat="53.23225954536379" lon="3.359003366584457"/>
          <point xsi:type="esdl:Point" lat="53.2315629190587" lon="3.359070039093745"/>
          <point xsi:type="esdl:Point" lat="53.231388448850744" lon="3.3590584715888308"/>
          <point xsi:type="esdl:Point" lat="53.230697202501275" lon="3.3588997755783536"/>
          <point xsi:type="esdl:Point" lat="53.23002902414113" lon="3.3585646916420235"/>
          <point xsi:type="esdl:Point" lat="53.22940001811262" lon="3.3580613044507834"/>
          <point xsi:type="esdl:Point" lat="53.221188436927456" lon="3.348693539069444"/>
          <point xsi:type="esdl:Point" lat="53.22056294503465" lon="3.348192192258822"/>
          <point xsi:type="esdl:Point" lat="53.09473672394702" lon="3.2853248715819774"/>
          <point xsi:type="esdl:Point" lat="53.08869309954581" lon="3.2842793297258885"/>
          <point xsi:type="esdl:Point" lat="52.95802706640421" lon="3.2248236072713317"/>
          <point xsi:type="esdl:Point" lat="52.95764436738585" lon="3.2247723517240905"/>
          <point xsi:type="esdl:Point" lat="52.95751630153477" lon="3.2247753839141913"/>
          <point xsi:type="esdl:Point" lat="52.957134644619856" lon="3.224844728749464"/>
          <point xsi:type="esdl:Point" lat="52.94547170158963" lon="3.2301852989887725"/>
          <point xsi:type="esdl:Point" lat="52.944692818628745" lon="3.230260534227915"/>
          <point xsi:type="esdl:Point" lat="52.94449770746008" lon="3.2302501287265253"/>
          <point xsi:type="esdl:Point" lat="52.94372336466751" lon="3.2300920594671103"/>
          <point xsi:type="esdl:Point" lat="52.928496838852" lon="3.2232649336052854"/>
          <point xsi:type="esdl:Point" lat="52.92779288802997" lon="3.223182194975302"/>
          <point xsi:type="esdl:Point" lat="52.927616353156886" lon="3.223190179912545"/>
          <point xsi:type="esdl:Point" lat="52.92691618454631" lon="3.2233364252608854"/>
          <point xsi:type="esdl:Point" lat="52.92623847898744" lon="3.2236622160526682"/>
          <point xsi:type="esdl:Point" lat="52.89737913947215" lon="3.246072345132786"/>
          <point xsi:type="esdl:Point" lat="52.89671942723899" lon="3.2463936510964237"/>
          <point xsi:type="esdl:Point" lat="52.87844302848628" lon="3.250558802858039"/>
          <point xsi:type="esdl:Point" lat="52.87778221904226" lon="3.2509824310125217"/>
          <point xsi:type="esdl:Point" lat="52.87716991073351" lon="3.251572474159027"/>
          <point xsi:type="esdl:Point" lat="52.876621325658036" lon="3.2523142580827717"/>
          <point xsi:type="esdl:Point" lat="52.86790556084431" lon="3.268452445822864"/>
          <point xsi:type="esdl:Point" lat="52.86741529273563" lon="3.2691820196808"/>
          <point xsi:type="esdl:Point" lat="52.86686567275687" lon="3.269785120668986"/>
          <point xsi:type="esdl:Point" lat="52.793588331090625" lon="3.3266532984985515"/>
          <point xsi:type="esdl:Point" lat="52.79302485090517" lon="3.327335362807016"/>
          <point xsi:type="esdl:Point" lat="52.7925322712068" lon="3.3281532597695636"/>
          <point xsi:type="esdl:Point" lat="52.792122496166314" lon="3.329087218589448"/>
          <point xsi:type="esdl:Point" lat="52.791805430596646" lon="3.330114658064173"/>
          <point xsi:type="esdl:Point" lat="52.77084028705857" lon="3.435640979186822"/>
          <point xsi:type="esdl:Point" lat="52.76632033665382" lon="3.450610034219696"/>
          <point xsi:type="esdl:Point" lat="52.75134115731135" lon="3.5223864610723323"/>
          <point xsi:type="esdl:Point" lat="52.750738033967004" lon="3.523918576801509"/>
          <point xsi:type="esdl:Point" lat="52.74999923396077" lon="3.525279753273316"/>
          <point xsi:type="esdl:Point" lat="52.74914230383225" lon="3.526437672561412"/>
          <point xsi:type="esdl:Point" lat="52.74818759632589" lon="3.5273648435025575"/>
          <point xsi:type="esdl:Point" lat="52.74715778304596" lon="3.528039266473495"/>
          <point xsi:type="esdl:Point" lat="52.74607732023472" lon="3.52844494129633"/>
          <point xsi:type="esdl:Point" lat="52.74497186397181" lon="3.5285722568679514"/>
          <point xsi:type="esdl:Point" lat="52.66564326362958" lon="3.527614605774065"/>
          <point xsi:type="esdl:Point" lat="52.66528784474523" lon="3.5276334623867345"/>
          <point xsi:type="esdl:Point" lat="52.66458527436541" lon="3.5278092264482925"/>
          <point xsi:type="esdl:Point" lat="52.663623473681476" lon="3.5283229653782584"/>
          <point xsi:type="esdl:Point" lat="52.66293154777794" lon="3.528589508661438"/>
          <point xsi:type="esdl:Point" lat="52.66222272858089" lon="3.528673354088516"/>
          <point xsi:type="esdl:Point" lat="52.6598894125353" lon="3.528622067650011"/>
          <point xsi:type="esdl:Point" lat="52.65918848415393" lon="3.5284294090469555"/>
          <point xsi:type="esdl:Point" lat="52.657890032724765" lon="3.527728580177555"/>
          <point xsi:type="esdl:Point" lat="52.657189102594124" lon="3.5275359448706776"/>
          <point xsi:type="esdl:Point" lat="52.60565514703306" lon="3.5268934097472693"/>
          <point xsi:type="esdl:Point" lat="52.604982255241964" lon="3.526968445330744"/>
          <point xsi:type="esdl:Point" lat="52.6043237723806" lon="3.527207999683295"/>
          <point xsi:type="esdl:Point" lat="52.60369452284619" lon="3.5276066739859684"/>
          <point xsi:type="esdl:Point" lat="52.5830478155566" lon="3.546889539140798"/>
          <point xsi:type="esdl:Point" lat="52.58241371161071" lon="3.547289476737549"/>
          <point xsi:type="esdl:Point" lat="52.58175013677625" lon="3.547527968563735"/>
          <point xsi:type="esdl:Point" lat="52.58107224854696" lon="3.547599575529078"/>
          <point xsi:type="esdl:Point" lat="52.58073277151065" lon="3.5475721390458537"/>
          <point xsi:type="esdl:Point" lat="52.56827371615594" lon="3.5442888402817467"/>
          <point xsi:type="esdl:Point" lat="52.5508201194412" lon="3.543884623620675"/>
          <point xsi:type="esdl:Point" lat="52.479033428922" lon="3.52478395149364"/>
          <point xsi:type="esdl:Point" lat="52.47877906361917" lon="3.5247949705569215"/>
          <point xsi:type="esdl:Point" lat="52.478401529670045" lon="3.5248848958236634"/>
          <point xsi:type="esdl:Point" lat="52.47440721964336" lon="3.5270111277567064"/>
          <point xsi:type="esdl:Point" lat="52.474052461874564" lon="3.527359208484674"/>
          <point xsi:type="esdl:Point" lat="52.47373436976788" lon="3.527792012077414"/>
          <point xsi:type="esdl:Point" lat="52.47346042195036" lon="3.528299361334242"/>
          <point xsi:type="esdl:Point" lat="52.47205530417832" lon="3.532009969627414"/>
          <point xsi:type="esdl:Point" lat="52.47179728379307" lon="3.532496252923835"/>
          <point xsi:type="esdl:Point" lat="52.4714988075231" lon="3.532915892089157"/>
          <point xsi:type="esdl:Point" lat="52.47116622483678" lon="3.5332599587765556"/>
          <point xsi:type="esdl:Point" lat="52.47080661331734" lon="3.533521135979777"/>
          <point xsi:type="esdl:Point" lat="52.4511220028808" lon="3.542384053536617"/>
          <point xsi:type="esdl:Point" lat="52.44860769269236" lon="3.542674459438076"/>
          <point xsi:type="esdl:Point" lat="52.385272859975984" lon="3.5415211311053914"/>
          <point xsi:type="esdl:Point" lat="52.38510753222681" lon="3.541527846169868"/>
          <point xsi:type="esdl:Point" lat="52.38194577747624" lon="3.542205373992497"/>
          <point xsi:type="esdl:Point" lat="52.37074001708275" lon="3.5417147628930796"/>
          <point xsi:type="esdl:Point" lat="52.367634323453984" lon="3.541037651963323"/>
          <point xsi:type="esdl:Point" lat="52.298965612889" lon="3.5363589099991644"/>
          <point xsi:type="esdl:Point" lat="52.29506328515709" lon="3.535362968240093"/>
          <point xsi:type="esdl:Point" lat="52.2854986918517" lon="3.530198590811738"/>
          <point xsi:type="esdl:Point" lat="52.285088764894056" lon="3.5301282392891284"/>
          <point xsi:type="esdl:Point" lat="52.25355315666938" lon="3.5312582897990743"/>
          <point xsi:type="esdl:Point" lat="52.252707024384385" lon="3.531222114378963"/>
          <point xsi:type="esdl:Point" lat="52.21039415006239" lon="3.522775230788983"/>
          <point xsi:type="esdl:Point" lat="52.18536148295313" lon="3.512588886783697"/>
          <point xsi:type="esdl:Point" lat="52.16402647752286" lon="3.5099098148945282"/>
          <point xsi:type="esdl:Point" lat="52.160420349510034" lon="3.508346426856925"/>
          <point xsi:type="esdl:Point" lat="52.154576429002496" lon="3.507642539841847"/>
          <point xsi:type="esdl:Point" lat="52.14929261402722" lon="3.508200428686907"/>
          <point xsi:type="esdl:Point" lat="52.11043391671537" lon="3.503654207358912"/>
          <point xsi:type="esdl:Point" lat="52.11020677032013" lon="3.5036533769026525"/>
          <point xsi:type="esdl:Point" lat="52.10907701311267" lon="3.503823579444595"/>
          <point xsi:type="esdl:Point" lat="52.107977792012704" lon="3.5042801923854756"/>
          <point xsi:type="esdl:Point" lat="52.106936456836905" lon="3.5050118320745645"/>
          <point xsi:type="esdl:Point" lat="52.10597891416142" lon="3.506000278597021"/>
          <point xsi:type="esdl:Point" lat="52.10512898855437" lon="3.5072209245291552"/>
          <point xsi:type="esdl:Point" lat="52.10440782099267" lon="3.5086433913025563"/>
          <point xsi:type="esdl:Point" lat="52.08279725374544" lon="3.567374726436315"/>
          <point xsi:type="esdl:Point" lat="52.07720242152439" lon="3.5767214595009316"/>
          <point xsi:type="esdl:Point" lat="52.070704196720285" lon="3.584374345869377"/>
          <point xsi:type="esdl:Point" lat="51.9379780349056" lon="3.6904879862852797"/>
          <point xsi:type="esdl:Point" lat="51.93411535081139" lon="3.6921932537108995"/>
          <point xsi:type="esdl:Point" lat="51.91500451015328" lon="3.695200734989174"/>
          <point xsi:type="esdl:Point" lat="51.91325139132354" lon="3.695659538642896"/>
          <point xsi:type="esdl:Point" lat="51.91171123697951" lon="3.6964794521634987"/>
          <point xsi:type="esdl:Point" lat="51.91026446020721" lon="3.697663253277198"/>
          <point xsi:type="esdl:Point" lat="51.90894372681165" lon="3.6991841771695766"/>
          <point xsi:type="esdl:Point" lat="51.89016469618906" lon="3.729870954419511"/>
          <point xsi:type="esdl:Point" lat="51.88975103742936" lon="3.7308067865050356"/>
          <point xsi:type="esdl:Point" lat="51.8894339301696" lon="3.731836373355345"/>
          <point xsi:type="esdl:Point" lat="51.87397186020945" lon="3.8114148950877493"/>
          <point xsi:type="esdl:Point" lat="51.85431849728709" lon="3.8861940476927286"/>
          <point xsi:type="esdl:Point" lat="51.85391202503539" lon="3.888316557703824"/>
          <point xsi:type="esdl:Point" lat="51.848953483877665" lon="3.9421857901728856"/>
          <point xsi:type="esdl:Point" lat="51.84863973037995" lon="3.9798662915522964"/>
          <point xsi:type="esdl:Point" lat="51.848974742749654" lon="3.982188204757812"/>
          <point xsi:type="esdl:Point" lat="51.853807319184135" lon="4.001336428199091"/>
          <point xsi:type="esdl:Point" lat="51.85484857566479" lon="4.011150256886131"/>
          <point xsi:type="esdl:Point" lat="51.854854489083195" lon="4.0177760670720835"/>
          <point xsi:type="esdl:Point" lat="51.8546352214609" lon="4.020180317352549"/>
          <point xsi:type="esdl:Point" lat="51.854170650050094" lon="4.0224917859910105"/>
          <point xsi:type="esdl:Point" lat="51.83968554917381" lon="4.06594034295024"/>
          <point xsi:type="esdl:Point" lat="51.83502370235764" lon="4.070120456846837"/>
          <point xsi:type="esdl:Point" lat="51.83383520014727" lon="4.071473725643364"/>
          <point xsi:type="esdl:Point" lat="51.82025419714137" lon="4.0933109390282745"/>
          <point xsi:type="esdl:Point" lat="51.81946057329054" lon="4.095319449812668"/>
          <point xsi:type="esdl:Point" lat="51.81888129734022" lon="4.09751038390277"/>
          <point xsi:type="esdl:Point" lat="51.81701637238236" lon="4.110468923875791"/>
          <point xsi:type="esdl:Point" lat="51.817401884523754" lon="4.138447854247702"/>
          <point xsi:type="esdl:Point" lat="51.816925970333045" lon="4.143006172506772"/>
          <point xsi:type="esdl:Point" lat="51.81600724648425" lon="4.147384514038112"/>
          <point xsi:type="esdl:Point" lat="51.81466906188961" lon="4.151471624985949"/>
          <point xsi:type="esdl:Point" lat="51.81294542353555" lon="4.155163674177095"/>
          <point xsi:type="esdl:Point" lat="51.81088012635712" lon="4.158366901507913"/>
          <point xsi:type="esdl:Point" lat="51.79686276253192" lon="4.173579081630833"/>
          <point xsi:type="esdl:Point" lat="51.77452206672065" lon="4.20550694770653"/>
          <point xsi:type="esdl:Point" lat="51.762197572664945" lon="4.232495208057392"/>
          <point xsi:type="esdl:Point" lat="51.76162767763236" lon="4.23474475842709"/>
          <point xsi:type="esdl:Point" lat="51.753067958228584" lon="4.295928031053874"/>
          <point xsi:type="esdl:Point" lat="51.738682916085956" lon="4.353767194215142"/>
          <point xsi:type="esdl:Point" lat="51.73737500513337" lon="4.357741637269435"/>
          <point xsi:type="esdl:Point" lat="51.72630813096561" lon="4.381396159406223"/>
          <point xsi:type="esdl:Point" lat="51.72531138344792" lon="4.383113832908633"/>
          <point xsi:type="esdl:Point" lat="51.724155195803185" lon="4.384549196917959"/>
          <point xsi:type="esdl:Point" lat="51.7228730809942" lon="4.385673862824606"/>
          <point xsi:type="esdl:Point" lat="51.72162856363712" lon="4.386897812591263"/>
          <point xsi:type="esdl:Point" lat="51.72052321349795" lon="4.388429389879248"/>
          <point xsi:type="esdl:Point" lat="51.71958607156104" lon="4.390228334138376"/>
          <point xsi:type="esdl:Point" lat="51.71719684624165" lon="4.396756732473743"/>
          <point xsi:type="esdl:Point" lat="51.71053578482826" lon="4.425781805864433"/>
          <point xsi:type="esdl:Point" lat="51.70690018983664" lon="4.436463413479798"/>
          <point xsi:type="esdl:Point" lat="51.699774809102294" lon="4.451173466123409"/>
          <point xsi:type="esdl:Point" lat="51.69910764835932" lon="4.453221963492342"/>
          <point xsi:type="esdl:Point" lat="51.69502039568292" lon="4.472749277656206"/>
          <point xsi:type="esdl:Point" lat="51.694716699675865" lon="4.474939882890218"/>
          <point xsi:type="esdl:Point" lat="51.693394155180094" lon="4.507164874808607"/>
          <point xsi:type="esdl:Point" lat="51.693129027803586" lon="4.509601283056679"/>
          <point xsi:type="esdl:Point" lat="51.69262161397421" lon="4.511936099730118"/>
          <point xsi:type="esdl:Point" lat="51.69188537633438" lon="4.514107377759883"/>
          <point xsi:type="esdl:Point" lat="51.69093985096139" lon="4.5160575161532"/>
          <point xsi:type="esdl:Point" lat="51.68981012178225" lon="4.517734793491837"/>
          <point xsi:type="esdl:Point" lat="51.68852616023025" lon="4.51909473323857"/>
          <point xsi:type="esdl:Point" lat="51.68374813603908" lon="4.522574796466898"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_NDW-Noord" capacity="2000000000.0" id="CBL_WF_NDW-Noord" length="4196.886933168533">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="f8e7d38b-d3c6-4067-9226-631dedd6c318" name="InPort" connectedTo="4a715f29-2c5b-4bcb-b49b-47d28ce26d06"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="e12e9c36-04b3-45de-8934-565c9610076e" id="fcc4287a-52d2-485d-b6ab-b13935c9531f" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.512674" lon="3.439829"/>
          <point xsi:type="esdl:Point" lat="53.512674" lon="3.503093"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_WA3" capacity="2000000000.0" id="CBL_WF_WA3" length="46801.6486566171">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="e422661c-6267-4c66-ba52-cbae0f7cfe71" name="InPort" connectedTo="0215fba3-6ad0-41ca-8c93-9d6072f0a0dd"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="e12e9c36-04b3-45de-8934-565c9610076e" id="6c0f1ffb-75b2-4ae7-ba25-65834e396d73" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.930931" lon="3.713972"/>
          <point xsi:type="esdl:Point" lat="53.906443" lon="3.692884"/>
          <point xsi:type="esdl:Point" lat="53.88194" lon="3.692884"/>
          <point xsi:type="esdl:Point" lat="53.857423" lon="3.671796"/>
          <point xsi:type="esdl:Point" lat="53.832892" lon="3.671796"/>
          <point xsi:type="esdl:Point" lat="53.808346" lon="3.650708"/>
          <point xsi:type="esdl:Point" lat="53.783786" lon="3.650708"/>
          <point xsi:type="esdl:Point" lat="53.759212" lon="3.650708"/>
          <point xsi:type="esdl:Point" lat="53.710019" lon="3.608532"/>
          <point xsi:type="esdl:Point" lat="53.685402" lon="3.608532"/>
          <point xsi:type="esdl:Point" lat="53.611462" lon="3.545268"/>
          <point xsi:type="esdl:Point" lat="53.586787" lon="3.545268"/>
          <point xsi:type="esdl:Point" lat="53.562097" lon="3.52418"/>
          <point xsi:type="esdl:Point" lat="53.537393" lon="3.52418"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_from_HUB_West_to_HUB_IJVER" capacity="4000000000.0" id="CBL_from_HUB_West_to_HUB_IJVER" length="169667.57183956954">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="e5fcd4fd-74fd-48d4-beb9-e72e0b734e87" name="InPort" connectedTo="804e3b7e-f03c-4c99-b0f2-cbde7b0b1344"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="ac377413-0431-4d63-8a4a-475e5faba1bb" id="f798f861-23ed-46d5-a234-2ac65f534567" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.512674" lon="3.503093"/>
          <point xsi:type="esdl:Point" lat="53.487941" lon="3.503093"/>
          <point xsi:type="esdl:Point" lat="53.463194" lon="3.503093"/>
          <point xsi:type="esdl:Point" lat="53.413656" lon="3.545268"/>
          <point xsi:type="esdl:Point" lat="53.388865" lon="3.545268"/>
          <point xsi:type="esdl:Point" lat="53.36406" lon="3.545268"/>
          <point xsi:type="esdl:Point" lat="53.33924" lon="3.545268"/>
          <point xsi:type="esdl:Point" lat="53.314406" lon="3.545268"/>
          <point xsi:type="esdl:Point" lat="53.264695" lon="3.587444"/>
          <point xsi:type="esdl:Point" lat="53.264695" lon="3.608532"/>
          <point xsi:type="esdl:Point" lat="53.239817" lon="3.608532"/>
          <point xsi:type="esdl:Point" lat="53.214925" lon="3.608532"/>
          <point xsi:type="esdl:Point" lat="53.190019" lon="3.608532"/>
          <point xsi:type="esdl:Point" lat="53.165098" lon="3.608532"/>
          <point xsi:type="esdl:Point" lat="53.140163" lon="3.608532"/>
          <point xsi:type="esdl:Point" lat="53.115213" lon="3.608532"/>
          <point xsi:type="esdl:Point" lat="53.090248" lon="3.608532"/>
          <point xsi:type="esdl:Point" lat="53.040276" lon="3.650708"/>
          <point xsi:type="esdl:Point" lat="53.040276" lon="3.692884"/>
          <point xsi:type="esdl:Point" lat="52.965209" lon="3.756148"/>
          <point xsi:type="esdl:Point" lat="52.940158" lon="3.756148"/>
          <point xsi:type="esdl:Point" lat="52.915092" lon="3.777236"/>
          <point xsi:type="esdl:Point" lat="52.915092" lon="3.798324"/>
          <point xsi:type="esdl:Point" lat="52.864917" lon="3.840499"/>
          <point xsi:type="esdl:Point" lat="52.864917" lon="3.861587"/>
          <point xsi:type="esdl:Point" lat="52.839807" lon="3.861587"/>
          <point xsi:type="esdl:Point" lat="52.789545" lon="3.903763"/>
          <point xsi:type="esdl:Point" lat="52.789545" lon="4.156818"/>
          <point xsi:type="esdl:Point" lat="52.764392" lon="4.156818"/>
          <point xsi:type="esdl:Point" lat="52.739224" lon="4.177906"/>
          <point xsi:type="esdl:Point" lat="52.739224" lon="4.34661"/>
          <point xsi:type="esdl:Point" lat="52.714042" lon="4.34661"/>
          <point xsi:type="esdl:Point" lat="52.663635" lon="4.388785"/>
          <point xsi:type="esdl:Point" lat="52.638409" lon="4.388785"/>
          <point xsi:type="esdl:Point" lat="52.638409" lon="4.494225"/>
          <point xsi:type="esdl:Point" lat="52.613169" lon="4.515313"/>
          <point xsi:type="esdl:Point" lat="52.587914" lon="4.515313"/>
          <point xsi:type="esdl:Point" lat="52.53736" lon="4.557489"/>
          <point xsi:type="esdl:Point" lat="52.53736" lon="4.599665"/>
          <point xsi:type="esdl:Point" lat="52.512062" lon="4.599665"/>
          <point xsi:type="esdl:Point" lat="52.486749" lon="4.578577"/>
          <point xsi:type="esdl:Point" lat="52.461421" lon="4.578577"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_DDW1" capacity="2000000000.0" id="CBL_WF_DDW1" length="54495.630757619874">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="eef7410b-f948-4df0-91f9-093b71be6c20" name="InPort" connectedTo="dc0183f9-75e6-4dca-afd6-ad7a99147bc3"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="df2b7f4e-b729-4799-937c-171608abddfb" id="2a269ec0-be5a-46e4-94ac-bdd7313c3348" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.324032" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.311381" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.298725" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.286066" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.273403" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.260736" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.248065" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.23539" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.222711" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.210028" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.197342" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.184652" lon="5.469983"/>
          <point xsi:type="esdl:Point" lat="54.159259" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.146557" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.133851" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.121141" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.108427" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.095709" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.082988" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.070262" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.057533" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.0448" lon="5.452323"/>
          <point xsi:type="esdl:Point" lat="54.032062" lon="5.452323"/>
          <point xsi:type="esdl:Point" lat="53.993827" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="53.981074" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="53.942792" lon="5.558286"/>
          <point xsi:type="esdl:Point" lat="53.930024" lon="5.558286"/>
          <point xsi:type="esdl:Point" lat="53.891695" lon="5.611267"/>
          <point xsi:type="esdl:Point" lat="53.878911" lon="5.611267"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_DDW2" capacity="2000000000.0" id="CBL_WF_DDW2" length="57154.13798314699">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="aaba5184-c42e-4e24-a3f3-c45ebb329caa" name="InPort" connectedTo="affea88c-bb5f-4ed0-88fb-46c8ad15e027"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="df2b7f4e-b729-4799-937c-171608abddfb" id="28e80fb4-b261-474b-80ff-81786fe4b913" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.324032" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="54.311381" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="54.298725" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="54.286066" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="54.273403" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="54.260736" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="54.248065" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="54.23539" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="54.222711" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="54.210028" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="54.159259" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.146557" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.133851" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.121141" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.108427" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.095709" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.082988" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.070262" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.057533" lon="5.434662"/>
          <point xsi:type="esdl:Point" lat="54.0448" lon="5.452323"/>
          <point xsi:type="esdl:Point" lat="54.032062" lon="5.452323"/>
          <point xsi:type="esdl:Point" lat="53.993827" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="53.981074" lon="5.505304"/>
          <point xsi:type="esdl:Point" lat="53.942792" lon="5.558286"/>
          <point xsi:type="esdl:Point" lat="53.930024" lon="5.558286"/>
          <point xsi:type="esdl:Point" lat="53.891695" lon="5.611267"/>
          <point xsi:type="esdl:Point" lat="53.878911" lon="5.611267"/>
          <point xsi:type="esdl:Point" lat="53.866123" lon="5.628928"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_DDW-West" id="CBL_WF_DDW-West" length="111.31170020054648">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="4d6cfbb0-7ad0-4c14-94eb-32be694615d0" name="InPort" connectedTo="68915d05-303f-45ef-958b-c6ff06dd4ccc"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="eb61df44-0588-42ba-9837-01797255e1c8" id="f5a88aa3-0be1-4087-8d90-8cc480cbedad" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.3606331898551" lon="5.44688724627309"/>
          <point xsi:type="esdl:Point" lat="54.3596331898551" lon="5.44688724627309"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_WA4_1" capacity="2000000000.0" id="CBL_WF_WA4_1" length="8325.473412090014">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="07301e84-3006-4e7c-afca-e3d1190da58c" name="InPort" connectedTo="45805114-b2a8-4f87-b509-0c6835176ce6"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="df2b7f4e-b729-4799-937c-171608abddfb" id="bccd349d-6086-45da-a1df-c02eb86df038" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.840535" lon="5.522965"/>
          <point xsi:type="esdl:Point" lat="53.840535" lon="5.558286"/>
          <point xsi:type="esdl:Point" lat="53.853331" lon="5.575946"/>
          <point xsi:type="esdl:Point" lat="53.853331" lon="5.611267"/>
          <point xsi:type="esdl:Point" lat="53.866123" lon="5.628928"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_WA4_2" capacity="2000000000.0" id="CBL_WF_WA4_2" length="1837.7837069532125">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="5b3bf1ac-486e-4570-87c8-00c10f394ff5" name="InPort" connectedTo="a4f4807f-6c72-4776-b428-a95b5b1b59d7"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="df2b7f4e-b729-4799-937c-171608abddfb" id="66c4b0e4-c4e0-49a3-84c2-e47a347d55c3" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.853331" lon="5.611267"/>
          <point xsi:type="esdl:Point" lat="53.866123" lon="5.628928"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_WA4_3" capacity="1000000000.0" id="CBL_WF_WA4_3" length="8513.965594116638">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="97d3f5d3-061a-4a64-a117-7377b513a064" name="InPort" connectedTo="23c1f88e-196e-4ba9-9b4b-0caeafefd54d"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="df2b7f4e-b729-4799-937c-171608abddfb" id="fe2355d8-1bc0-4872-b101-0c1711a68b2a" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.866123" lon="5.71723"/>
          <point xsi:type="esdl:Point" lat="53.866123" lon="5.69957"/>
          <point xsi:type="esdl:Point" lat="53.840535" lon="5.664249"/>
          <point xsi:type="esdl:Point" lat="53.866123" lon="5.628928"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:GenericConversion" efficiency="1.0" power="200000000.0" controlStrategy="1ca4842e-be2b-44b8-b723-7091bd0382ab" name="conversion_WF_TNW" id="conversion_WF_TNW">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="675fdcfd-d490-40c4-b177-bb1a42b554d7" name="InPort" connectedTo="4197f127-241f-4b31-8855-18cd7b534310"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="be63ce24-c22b-4a27-95fc-981cd8c35bd7" id="e8d7a223-f39c-4322-a4cf-b0717a881353" name="OutPort"/>
        <geometry xsi:type="esdl:Point" lat="54.0389496646664" lon="5.64406597749276"/>
        <costInformation xsi:type="esdl:CostInformation" id="30cc661e-4e31-4a4d-9805-498723fb679c">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.2" name="conversion_WF_TNW_marginalcosts" id="8e40a5e5-a1f7-4453-8d1e-48f6e5e7a7b7"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="200000000.0" name="CBL_WF_TNW_EL_conversion" id="CBL_WF_TNW_EL_conversion" length="72.11395478103157">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="ee1c4981-f67c-43a8-bd9d-1344b3931e79" name="InPort" connectedTo="4be11dcb-3e96-4361-a423-73efe6bb3c9c"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="675fdcfd-d490-40c4-b177-bb1a42b554d7" id="4197f127-241f-4b31-8855-18cd7b534310" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.0384496646664" lon="5.64336597749276"/>
          <point xsi:type="esdl:Point" lat="54.0389496646664" lon="5.64406597749276"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="CBL_WF_TNW_EL_gen" capacity="200000000.0" id="CBL_WF_TNW_EL_gen" length="81136.1528551722">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="be63ce24-c22b-4a27-95fc-981cd8c35bd7" name="InPort" connectedTo="e8d7a223-f39c-4322-a4cf-b0717a881353"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="097776dd-5da1-4a91-ac65-eaaf387a56a9" id="83b58229-2400-46eb-8946-bd90d65effba" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.00851492533276" lon="5.715416325673452"/>
          <point xsi:type="esdl:Point" lat="54.007087460831016" lon="5.715182224191894"/>
          <point xsi:type="esdl:Point" lat="53.62542425566557" lon="6.142968772388104"/>
          <point xsi:type="esdl:Point" lat="53.62493527035734" lon="6.143740035223531"/>
          <point xsi:type="esdl:Point" lat="53.62451995025578" lon="6.144625095783251"/>
          <point xsi:type="esdl:Point" lat="53.614005063719" lon="6.175495765777251"/>
          <point xsi:type="esdl:Point" lat="53.61359747673583" lon="6.176367659446617"/>
          <point xsi:type="esdl:Point" lat="53.61311836664825" lon="6.177129778669862"/>
          <point xsi:type="esdl:Point" lat="53.59912201211626" lon="6.193621437667235"/>
          <point xsi:type="esdl:Point" lat="53.56685715290516" lon="6.246705297630897"/>
          <point xsi:type="esdl:Point" lat="53.55537495127063" lon="6.2582620907956095"/>
          <point xsi:type="esdl:Point" lat="53.55486303576205" lon="6.259027456235804"/>
          <point xsi:type="esdl:Point" lat="53.52029414195021" lon="6.329075576217769"/>
          <point xsi:type="esdl:Point" lat="53.51383052913046" lon="6.337735160343073"/>
          <point xsi:type="esdl:Point" lat="53.513244659352345" lon="6.3383458753744115"/>
          <point xsi:type="esdl:Point" lat="53.506087061111394" lon="6.343478088980654"/>
          <point xsi:type="esdl:Point" lat="53.42794884621087" lon="6.375662759513024"/>
          <point xsi:type="esdl:Point" lat="53.41110160946292" lon="6.386490845011662"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="500000000.0" name="CBL_WF_TNW_EL" id="CBL_WF_TNW_EL" length="59.02151876432281">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="6209a59d-e7c0-4b94-9f3a-380f30641c51" name="InPort" connectedTo="4be11dcb-3e96-4361-a423-73efe6bb3c9c"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="ca282c57-8af1-41bb-9ff8-7e2d087996ca" id="c83f5326-a14c-4aa1-85c1-ca07701c709d" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.0384496646664" lon="5.64336597749276"/>
          <point xsi:type="esdl:Point" lat="54.0389496646664" lon="5.64306597749276"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="CBL_WF_Gemini" capacity="600000000.0" id="CBL_WF_Gemini" length="100842.35097014045">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="d205567c-e630-4dcb-8be1-b7e6deeb82f5" name="InPort" connectedTo="ec275309-ce97-4a2a-9436-f9b94c72d098"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="097776dd-5da1-4a91-ac65-eaaf387a56a9" id="b59ef7de-1246-4a3f-9dc4-4298fc71c9ac" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.03269368916181" lon="5.888533819753494"/>
          <point xsi:type="esdl:Point" lat="54.032719524900145" lon="5.888580951759655"/>
          <point xsi:type="esdl:Point" lat="54.03296203451409" lon="5.888929891512782"/>
          <point xsi:type="esdl:Point" lat="54.03301517958578" lon="5.888992772139213"/>
          <point xsi:type="esdl:Point" lat="54.03302147966149" lon="5.889003662602059"/>
          <point xsi:type="esdl:Point" lat="54.03302675392213" lon="5.88901611923928"/>
          <point xsi:type="esdl:Point" lat="54.0330321169914" lon="5.889077196842714"/>
          <point xsi:type="esdl:Point" lat="54.03302565023171" lon="5.889686321722359"/>
          <point xsi:type="esdl:Point" lat="54.033220833276005" lon="5.893088684315821"/>
          <point xsi:type="esdl:Point" lat="54.033267372765906" lon="5.893414591749221"/>
          <point xsi:type="esdl:Point" lat="54.03393929898701" lon="5.898585852703389"/>
          <point xsi:type="esdl:Point" lat="54.03397167480204" lon="5.898745541604871"/>
          <point xsi:type="esdl:Point" lat="54.03399218375024" lon="5.898894077705727"/>
          <point xsi:type="esdl:Point" lat="54.034073848371904" lon="5.899644999374333"/>
          <point xsi:type="esdl:Point" lat="54.03411903366952" lon="5.899940599507908"/>
          <point xsi:type="esdl:Point" lat="54.03467553603572" lon="5.9042486973854755"/>
          <point xsi:type="esdl:Point" lat="54.034678599634525" lon="5.904263270558384"/>
          <point xsi:type="esdl:Point" lat="54.03471906396194" lon="5.904404134229767"/>
          <point xsi:type="esdl:Point" lat="54.03474074100725" lon="5.904552378715687"/>
          <point xsi:type="esdl:Point" lat="54.034887933778236" lon="5.905763087871883"/>
          <point xsi:type="esdl:Point" lat="54.0349107164913" lon="5.905895288656045"/>
          <point xsi:type="esdl:Point" lat="54.03495887365619" lon="5.906346155091032"/>
          <point xsi:type="esdl:Point" lat="54.0350357909844" lon="5.9067860578681435"/>
          <point xsi:type="esdl:Point" lat="54.0350960945845" lon="5.907388664878604"/>
          <point xsi:type="esdl:Point" lat="54.03514579657865" lon="5.907682580547059"/>
          <point xsi:type="esdl:Point" lat="54.035252887366354" lon="5.908580416762712"/>
          <point xsi:type="esdl:Point" lat="54.0352847488903" lon="5.909035566645389"/>
          <point xsi:type="esdl:Point" lat="54.03530704633521" lon="5.9091839858904045"/>
          <point xsi:type="esdl:Point" lat="54.03537030629589" lon="5.90945983428367"/>
          <point xsi:type="esdl:Point" lat="54.03537227995387" lon="5.909474834477404"/>
          <point xsi:type="esdl:Point" lat="54.03537857004357" lon="5.909612309408138"/>
          <point xsi:type="esdl:Point" lat="54.035378368932186" lon="5.909628040506225"/>
          <point xsi:type="esdl:Point" lat="54.03523674691907" lon="5.9112067795360215"/>
          <point xsi:type="esdl:Point" lat="54.03483631005886" lon="5.913930436620102"/>
          <point xsi:type="esdl:Point" lat="54.034829316510645" lon="5.914085369873561"/>
          <point xsi:type="esdl:Point" lat="54.03481160049369" lon="5.91423388725427"/>
          <point xsi:type="esdl:Point" lat="54.03461225781251" lon="5.915721516671083"/>
          <point xsi:type="esdl:Point" lat="54.03428160497346" lon="5.918721154195454"/>
          <point xsi:type="esdl:Point" lat="54.03423158579864" lon="5.919015014186511"/>
          <point xsi:type="esdl:Point" lat="54.033902512978635" lon="5.921391768787666"/>
          <point xsi:type="esdl:Point" lat="54.0336425977786" lon="5.922693844333587"/>
          <point xsi:type="esdl:Point" lat="54.033606451956345" lon="5.922834636155714"/>
          <point xsi:type="esdl:Point" lat="54.033587880720184" lon="5.922984594865055"/>
          <point xsi:type="esdl:Point" lat="54.0333307266557" lon="5.926007785739096"/>
          <point xsi:type="esdl:Point" lat="54.03332725365771" lon="5.926316490581747"/>
          <point xsi:type="esdl:Point" lat="54.0333011053012" lon="5.926463647661613"/>
          <point xsi:type="esdl:Point" lat="54.02899252240779" lon="5.9408921430767725"/>
          <point xsi:type="esdl:Point" lat="54.028831132561066" lon="5.941620230251406"/>
          <point xsi:type="esdl:Point" lat="54.02683722472293" lon="5.947939001130262"/>
          <point xsi:type="esdl:Point" lat="54.02658642018466" lon="5.948934965155904"/>
          <point xsi:type="esdl:Point" lat="54.02523800613075" lon="5.952893093867354"/>
          <point xsi:type="esdl:Point" lat="54.02147407761419" lon="5.965640818138831"/>
          <point xsi:type="esdl:Point" lat="54.02000513521633" lon="5.970324152096401"/>
          <point xsi:type="esdl:Point" lat="54.01790792884377" lon="5.977357084751976"/>
          <point xsi:type="esdl:Point" lat="54.01759021826674" lon="5.9782786377928145"/>
          <point xsi:type="esdl:Point" lat="54.01089894667672" lon="6.001071327851383"/>
          <point xsi:type="esdl:Point" lat="54.01082864510295" lon="6.001352015094192"/>
          <point xsi:type="esdl:Point" lat="54.009907211027404" lon="6.0037926546990645"/>
          <point xsi:type="esdl:Point" lat="54.00788875066443" lon="6.010957492834045"/>
          <point xsi:type="esdl:Point" lat="54.00778873526844" lon="6.011382513607634"/>
          <point xsi:type="esdl:Point" lat="54.00626387982231" lon="6.015871308134919"/>
          <point xsi:type="esdl:Point" lat="54.005406062068765" lon="6.018354872972001"/>
          <point xsi:type="esdl:Point" lat="54.003228594816875" lon="6.025982978283665"/>
          <point xsi:type="esdl:Point" lat="54.00307586977743" lon="6.026364193628069"/>
          <point xsi:type="esdl:Point" lat="54.00304886080872" lon="6.0265120055401775"/>
          <point xsi:type="esdl:Point" lat="54.00015426746382" lon="6.070467273628581"/>
          <point xsi:type="esdl:Point" lat="53.99987675603788" lon="6.073155525708753"/>
          <point xsi:type="esdl:Point" lat="53.99907683354524" lon="6.08803206292398"/>
          <point xsi:type="esdl:Point" lat="53.999089051389056" lon="6.088794482288463"/>
          <point xsi:type="esdl:Point" lat="53.9981904491964" lon="6.101659798375847"/>
          <point xsi:type="esdl:Point" lat="53.998164263261174" lon="6.10179301071219"/>
          <point xsi:type="esdl:Point" lat="53.99816088096007" lon="6.101805594279173"/>
          <point xsi:type="esdl:Point" lat="53.99811282140347" lon="6.101925978129905"/>
          <point xsi:type="esdl:Point" lat="53.9980424302407" lon="6.1020268283437415"/>
          <point xsi:type="esdl:Point" lat="53.961385432406125" lon="6.1323531046120365"/>
          <point xsi:type="esdl:Point" lat="53.95965994149261" lon="6.133923149531429"/>
          <point xsi:type="esdl:Point" lat="53.956982569371725" lon="6.135691507157527"/>
          <point xsi:type="esdl:Point" lat="53.95446792858749" lon="6.138080969887992"/>
          <point xsi:type="esdl:Point" lat="53.94773050971703" lon="6.143491474666287"/>
          <point xsi:type="esdl:Point" lat="53.94695742130229" lon="6.144236596853976"/>
          <point xsi:type="esdl:Point" lat="53.94680952101827" lon="6.144449699839985"/>
          <point xsi:type="esdl:Point" lat="53.94674163174025" lon="6.144525661193949"/>
          <point xsi:type="esdl:Point" lat="53.94555452292414" lon="6.145374056446657"/>
          <point xsi:type="esdl:Point" lat="53.94537564478474" lon="6.14547584348889"/>
          <point xsi:type="esdl:Point" lat="53.94304047495187" lon="6.147558001335442"/>
          <point xsi:type="esdl:Point" lat="53.940932048492755" lon="6.149360935908795"/>
          <point xsi:type="esdl:Point" lat="53.94084756100375" lon="6.149414890611274"/>
          <point xsi:type="esdl:Point" lat="53.94032948263724" lon="6.149608832138348"/>
          <point xsi:type="esdl:Point" lat="53.940228346732795" lon="6.149677114184627"/>
          <point xsi:type="esdl:Point" lat="53.938909124804496" lon="6.151001620536144"/>
          <point xsi:type="esdl:Point" lat="53.937375484372254" lon="6.152236477747437"/>
          <point xsi:type="esdl:Point" lat="53.937005697111964" lon="6.152688739983687"/>
          <point xsi:type="esdl:Point" lat="53.93692585154837" lon="6.152761004187824"/>
          <point xsi:type="esdl:Point" lat="53.93496900089634" lon="6.154222147706669"/>
          <point xsi:type="esdl:Point" lat="53.934023377531" lon="6.155098206162069"/>
          <point xsi:type="esdl:Point" lat="53.93352641191195" lon="6.155452972345108"/>
          <point xsi:type="esdl:Point" lat="53.93343531627672" lon="6.1555564178370235"/>
          <point xsi:type="esdl:Point" lat="53.93323504567434" lon="6.155821751139731"/>
          <point xsi:type="esdl:Point" lat="53.931670256025676" lon="6.15697752551527"/>
          <point xsi:type="esdl:Point" lat="53.93136704966552" lon="6.157321132575308"/>
          <point xsi:type="esdl:Point" lat="53.931267676816596" lon="6.157400824905296"/>
          <point xsi:type="esdl:Point" lat="53.93033615010675" lon="6.157822340027648"/>
          <point xsi:type="esdl:Point" lat="53.929751142872185" lon="6.15832116369003"/>
          <point xsi:type="esdl:Point" lat="53.928893554518865" lon="6.159212348771134"/>
          <point xsi:type="esdl:Point" lat="53.9281895678152" lon="6.159787449223665"/>
          <point xsi:type="esdl:Point" lat="53.88783646104344" lon="6.193159113870999"/>
          <point xsi:type="esdl:Point" lat="53.886612565492044" lon="6.194405482993306"/>
          <point xsi:type="esdl:Point" lat="53.88336787097207" lon="6.196720555571846"/>
          <point xsi:type="esdl:Point" lat="53.869555444210825" lon="6.208084709827448"/>
          <point xsi:type="esdl:Point" lat="53.86894035789897" lon="6.2086809632795426"/>
          <point xsi:type="esdl:Point" lat="53.85572360222898" lon="6.219514720767483"/>
          <point xsi:type="esdl:Point" lat="53.855647560730105" lon="6.21959767804752"/>
          <point xsi:type="esdl:Point" lat="53.853768337383855" lon="6.22108384092694"/>
          <point xsi:type="esdl:Point" lat="53.846289882750106" lon="6.227332864085275"/>
          <point xsi:type="esdl:Point" lat="53.845863555562296" lon="6.227566250017188"/>
          <point xsi:type="esdl:Point" lat="53.84578459811547" lon="6.227597036416557"/>
          <point xsi:type="esdl:Point" lat="53.845700272201356" lon="6.227650230208278"/>
          <point xsi:type="esdl:Point" lat="53.84093850243295" lon="6.231906221027269"/>
          <point xsi:type="esdl:Point" lat="53.83867707568112" lon="6.23343308025174"/>
          <point xsi:type="esdl:Point" lat="53.83807509827041" lon="6.234068171360851"/>
          <point xsi:type="esdl:Point" lat="53.83472899036713" lon="6.236701045116622"/>
          <point xsi:type="esdl:Point" lat="53.833151647651235" lon="6.2377601565311025"/>
          <point xsi:type="esdl:Point" lat="53.8319316125265" lon="6.239230738552114"/>
          <point xsi:type="esdl:Point" lat="53.82923855344517" lon="6.241468090173197"/>
          <point xsi:type="esdl:Point" lat="53.82816239976884" lon="6.242566890485361"/>
          <point xsi:type="esdl:Point" lat="53.824477766049846" lon="6.245365699663933"/>
          <point xsi:type="esdl:Point" lat="53.8233549319049" lon="6.245909481826613"/>
          <point xsi:type="esdl:Point" lat="53.819923478579874" lon="6.24903332272556"/>
          <point xsi:type="esdl:Point" lat="53.81863053328339" lon="6.250054001938343"/>
          <point xsi:type="esdl:Point" lat="53.81799510837488" lon="6.250480088787388"/>
          <point xsi:type="esdl:Point" lat="53.81734751072169" lon="6.251132780568715"/>
          <point xsi:type="esdl:Point" lat="53.817053681985485" lon="6.2516500934025"/>
          <point xsi:type="esdl:Point" lat="53.81701745808636" lon="6.251696156830182"/>
          <point xsi:type="esdl:Point" lat="53.81697693483227" lon="6.251734995392756"/>
          <point xsi:type="esdl:Point" lat="53.81544235129157" lon="6.252551470117328"/>
          <point xsi:type="esdl:Point" lat="53.81531026312953" lon="6.25259837028288"/>
          <point xsi:type="esdl:Point" lat="53.815225816936355" lon="6.25265222091163"/>
          <point xsi:type="esdl:Point" lat="53.814840028004156" lon="6.25306275320538"/>
          <point xsi:type="esdl:Point" lat="53.81387632020668" lon="6.253698117726457"/>
          <point xsi:type="esdl:Point" lat="53.811360729747804" lon="6.255785778143459"/>
          <point xsi:type="esdl:Point" lat="53.808971689415095" lon="6.259050416287383"/>
          <point xsi:type="esdl:Point" lat="53.808203187432774" lon="6.260001146295133"/>
          <point xsi:type="esdl:Point" lat="53.80813914938862" lon="6.260058187370791"/>
          <point xsi:type="esdl:Point" lat="53.80805400423443" lon="6.260097929182299"/>
          <point xsi:type="esdl:Point" lat="53.80712152650719" lon="6.260337451216597"/>
          <point xsi:type="esdl:Point" lat="53.80603581169646" lon="6.260386545180934"/>
          <point xsi:type="esdl:Point" lat="53.80541855084681" lon="6.260490560987371"/>
          <point xsi:type="esdl:Point" lat="53.80525868277778" lon="6.260547168812301"/>
          <point xsi:type="esdl:Point" lat="53.805082636877145" lon="6.26066302729954"/>
          <point xsi:type="esdl:Point" lat="53.80176165495309" lon="6.263986746809391"/>
          <point xsi:type="esdl:Point" lat="53.79825243938933" lon="6.266659273065903"/>
          <point xsi:type="esdl:Point" lat="53.797546922175876" lon="6.267355263728615"/>
          <point xsi:type="esdl:Point" lat="53.79058561127529" lon="6.27308234183699"/>
          <point xsi:type="esdl:Point" lat="53.79041596814906" lon="6.273170681853163"/>
          <point xsi:type="esdl:Point" lat="53.790150156443374" lon="6.273244640949711"/>
          <point xsi:type="esdl:Point" lat="53.7891712470877" lon="6.273217820347097"/>
          <point xsi:type="esdl:Point" lat="53.789162275322795" lon="6.27321712120396"/>
          <point xsi:type="esdl:Point" lat="53.789135350697585" lon="6.273215398156648"/>
          <point xsi:type="esdl:Point" lat="53.78912637893263" lon="6.273214699014947"/>
          <point xsi:type="esdl:Point" lat="53.789108428570316" lon="6.273213550777593"/>
          <point xsi:type="esdl:Point" lat="53.78909945680528" lon="6.2732128516369725"/>
          <point xsi:type="esdl:Point" lat="53.789090481603374" lon="6.273212278276846"/>
          <point xsi:type="esdl:Point" lat="53.789081509838304" lon="6.273211579136956"/>
          <point xsi:type="esdl:Point" lat="53.78907253807321" lon="6.273210879997445"/>
          <point xsi:type="esdl:Point" lat="53.78888416945562" lon="6.273194823743044"/>
          <point xsi:type="esdl:Point" lat="53.78887519429467" lon="6.27319424887621"/>
          <point xsi:type="esdl:Point" lat="53.788866222529116" lon="6.273193549745669"/>
          <point xsi:type="esdl:Point" lat="53.78885725076354" lon="6.273192850615509"/>
          <point xsi:type="esdl:Point" lat="53.78884827899794" lon="6.273192151485724"/>
          <point xsi:type="esdl:Point" lat="53.78883930723231" lon="6.27319145235632"/>
          <point xsi:type="esdl:Point" lat="53.78883033546669" lon="6.2731907532272935"/>
          <point xsi:type="esdl:Point" lat="53.788821363701025" lon="6.273190054098645"/>
          <point xsi:type="esdl:Point" lat="53.78864187366491" lon="6.27317481598714"/>
          <point xsi:type="esdl:Point" lat="53.78819295846028" lon="6.273151856333135"/>
          <point xsi:type="esdl:Point" lat="53.7881839866933" lon="6.273151157229076"/>
          <point xsi:type="esdl:Point" lat="53.78813911079872" lon="6.273148286054692"/>
          <point xsi:type="esdl:Point" lat="53.788130139928995" lon="6.273147587022696"/>
          <point xsi:type="esdl:Point" lat="53.78791465706429" lon="6.273136680790895"/>
          <point xsi:type="esdl:Point" lat="53.78790568529678" lon="6.273135981697188"/>
          <point xsi:type="esdl:Point" lat="53.78788764519403" lon="6.273134826556261"/>
          <point xsi:type="esdl:Point" lat="53.78787867432382" lon="6.273134127533564"/>
          <point xsi:type="esdl:Point" lat="53.787860723956584" lon="6.273132979386972"/>
          <point xsi:type="esdl:Point" lat="53.78785175218895" lon="6.273132280295435"/>
          <point xsi:type="esdl:Point" lat="53.78772607232962" lon="6.273125241942162"/>
          <point xsi:type="esdl:Point" lat="53.78771710056171" lon="6.273124542855715"/>
          <point xsi:type="esdl:Point" lat="53.78648687572116" lon="6.273065626853989"/>
          <point xsi:type="esdl:Point" lat="53.78630746514036" lon="6.2730507702979486"/>
          <point xsi:type="esdl:Point" lat="53.7861996697697" lon="6.273043999341748"/>
          <point xsi:type="esdl:Point" lat="53.78619069799876" lon="6.273043300311644"/>
          <point xsi:type="esdl:Point" lat="53.78616377241763" lon="6.27304157902244"/>
          <point xsi:type="esdl:Point" lat="53.78615480064663" lon="6.273040879993769"/>
          <point xsi:type="esdl:Point" lat="53.78612787510671" lon="6.2730391571932325"/>
          <point xsi:type="esdl:Point" lat="53.78611890333563" lon="6.273038458165996"/>
          <point xsi:type="esdl:Point" lat="53.78610993156451" lon="6.273037759139139"/>
          <point xsi:type="esdl:Point" lat="53.786100959793394" lon="6.273037060112661"/>
          <point xsi:type="esdl:Point" lat="53.786091988919615" lon="6.2730363611564774"/>
          <point xsi:type="esdl:Point" lat="53.78608301714844" lon="6.273035662130755"/>
          <point xsi:type="esdl:Point" lat="53.78607404537727" lon="6.273034963105413"/>
          <point xsi:type="esdl:Point" lat="53.78606507360607" lon="6.273034264080447"/>
          <point xsi:type="esdl:Point" lat="53.786056098398326" lon="6.2730336908269235"/>
          <point xsi:type="esdl:Point" lat="53.78604712662708" lon="6.2730329918026895"/>
          <point xsi:type="esdl:Point" lat="53.78603815485583" lon="6.273032292778833"/>
          <point xsi:type="esdl:Point" lat="53.78594846790516" lon="6.273024176685642"/>
          <point xsi:type="esdl:Point" lat="53.78593949269714" lon="6.2730236034369025"/>
          <point xsi:type="esdl:Point" lat="53.78593052092565" lon="6.273022904417799"/>
          <point xsi:type="esdl:Point" lat="53.78592154915414" lon="6.273022205399076"/>
          <point xsi:type="esdl:Point" lat="53.78591257738258" lon="6.273021506380729"/>
          <point xsi:type="esdl:Point" lat="53.785903605611026" lon="6.273020807362762"/>
          <point xsi:type="esdl:Point" lat="53.78589463383944" lon="6.2730201083451735"/>
          <point xsi:type="esdl:Point" lat="53.78588565867274" lon="6.273019533583208"/>
          <point xsi:type="esdl:Point" lat="53.78587668600376" lon="6.273018834496434"/>
          <point xsi:type="esdl:Point" lat="53.78586762539381" lon="6.273018128558308"/>
          <point xsi:type="esdl:Point" lat="53.78381102066338" lon="6.2730031462138856"/>
          <point xsi:type="esdl:Point" lat="53.78380204888849" lon="6.273002447253538"/>
          <point xsi:type="esdl:Point" lat="53.78379307367719" lon="6.273001874057867"/>
          <point xsi:type="esdl:Point" lat="53.78378410190226" lon="6.2730011750982495"/>
          <point xsi:type="esdl:Point" lat="53.78376615152096" lon="6.273000027193356"/>
          <point xsi:type="esdl:Point" lat="53.78375717974597" lon="6.27299932823482"/>
          <point xsi:type="esdl:Point" lat="53.783748204575986" lon="6.272998753525599"/>
          <point xsi:type="esdl:Point" lat="53.78373923280096" lon="6.272998054567793"/>
          <point xsi:type="esdl:Point" lat="53.7834608730859" lon="6.272985008738554"/>
          <point xsi:type="esdl:Point" lat="53.78345190131033" lon="6.272984309791022"/>
          <point xsi:type="esdl:Point" lat="53.78166793030447" lon="6.272793752848254"/>
          <point xsi:type="esdl:Point" lat="53.78058113846782" lon="6.272756799685131"/>
          <point xsi:type="esdl:Point" lat="53.78057216668586" lon="6.272756100859853"/>
          <point xsi:type="esdl:Point" lat="53.7805631949039" lon="6.272755402034955"/>
          <point xsi:type="esdl:Point" lat="53.78055422312189" lon="6.272754703210435"/>
          <point xsi:type="esdl:Point" lat="53.78054524790387" lon="6.272754130140912"/>
          <point xsi:type="esdl:Point" lat="53.78053618638607" lon="6.272753424327487"/>
          <point xsi:type="esdl:Point" lat="53.78052721460403" lon="6.272752725504078"/>
          <point xsi:type="esdl:Point" lat="53.78051824282195" lon="6.272752026681049"/>
          <point xsi:type="esdl:Point" lat="53.780509271039854" lon="6.272751327858395"/>
          <point xsi:type="esdl:Point" lat="53.78050029925774" lon="6.272750629036122"/>
          <point xsi:type="esdl:Point" lat="53.780491324081005" lon="6.272750054453571"/>
          <point xsi:type="esdl:Point" lat="53.78048235229887" lon="6.272749355632029"/>
          <point xsi:type="esdl:Point" lat="53.78047338051668" lon="6.272748656810862"/>
          <point xsi:type="esdl:Point" lat="53.78046440529851" lon="6.272748083744452"/>
          <point xsi:type="esdl:Point" lat="53.78045543351631" lon="6.272747384924017"/>
          <point xsi:type="esdl:Point" lat="53.78044645833948" lon="6.272746810343172"/>
          <point xsi:type="esdl:Point" lat="53.78043739682147" lon="6.272746104533875"/>
          <point xsi:type="esdl:Point" lat="53.78042842160323" lon="6.272745531468823"/>
          <point xsi:type="esdl:Point" lat="53.78041944982093" lon="6.272744832649851"/>
          <point xsi:type="esdl:Point" lat="53.78041047803862" lon="6.272744133831255"/>
          <point xsi:type="esdl:Point" lat="53.780401506256304" lon="6.272743435013041"/>
          <point xsi:type="esdl:Point" lat="53.780392534473954" lon="6.2727427361952035"/>
          <point xsi:type="esdl:Point" lat="53.78038356269159" lon="6.2727420373777445"/>
          <point xsi:type="esdl:Point" lat="53.78037459090921" lon="6.272741338560665"/>
          <point xsi:type="esdl:Point" lat="53.780365620024156" lon="6.272740639813857"/>
          <point xsi:type="esdl:Point" lat="53.780356648241735" lon="6.272739940997532"/>
          <point xsi:type="esdl:Point" lat="53.78034767645928" lon="6.2727392421815855"/>
          <point xsi:type="esdl:Point" lat="53.78033870467683" lon="6.272738543366019"/>
          <point xsi:type="esdl:Point" lat="53.78032973289433" lon="6.272737844550829"/>
          <point xsi:type="esdl:Point" lat="53.78032076111182" lon="6.272737145736016"/>
          <point xsi:type="esdl:Point" lat="53.7803117893293" lon="6.272736446921584"/>
          <point xsi:type="esdl:Point" lat="53.780302817546755" lon="6.27273574810753"/>
          <point xsi:type="esdl:Point" lat="53.780293845764184" lon="6.2727350492938525"/>
          <point xsi:type="esdl:Point" lat="53.7802848739816" lon="6.272734350480555"/>
          <point xsi:type="esdl:Point" lat="53.780275902199" lon="6.272733651667634"/>
          <point xsi:type="esdl:Point" lat="53.78026693041638" lon="6.272732952855093"/>
          <point xsi:type="esdl:Point" lat="53.78025795863374" lon="6.2727322540429284"/>
          <point xsi:type="esdl:Point" lat="53.78024898685108" lon="6.272731555231143"/>
          <point xsi:type="esdl:Point" lat="53.780240015068394" lon="6.272730856419737"/>
          <point xsi:type="esdl:Point" lat="53.780231043285696" lon="6.2727301576087084"/>
          <point xsi:type="esdl:Point" lat="53.78022207150297" lon="6.272729458798056"/>
          <point xsi:type="esdl:Point" lat="53.78014129474106" lon="6.272724293724455"/>
          <point xsi:type="esdl:Point" lat="53.78013232295814" lon="6.272723594917348"/>
          <point xsi:type="esdl:Point" lat="53.78012335117521" lon="6.2727228961106185"/>
          <point xsi:type="esdl:Point" lat="53.780114379392266" lon="6.272722197304268"/>
          <point xsi:type="esdl:Point" lat="53.78010540850665" lon="6.272721498568191"/>
          <point xsi:type="esdl:Point" lat="53.780096436723674" lon="6.272720799762597"/>
          <point xsi:type="esdl:Point" lat="53.780087464940664" lon="6.272720100957381"/>
          <point xsi:type="esdl:Point" lat="53.780078493157625" lon="6.272719402152543"/>
          <point xsi:type="esdl:Point" lat="53.78005158124436" lon="6.272717179987151"/>
          <point xsi:type="esdl:Point" lat="53.77960264125789" lon="6.272691854207158"/>
          <point xsi:type="esdl:Point" lat="53.77959366947386" lon="6.27269115542073"/>
          <point xsi:type="esdl:Point" lat="53.77957571907541" lon="6.272690007837387"/>
          <point xsi:type="esdl:Point" lat="53.779566747291334" lon="6.272689309052039"/>
          <point xsi:type="esdl:Point" lat="53.77953982171417" lon="6.2726875869229755"/>
          <point xsi:type="esdl:Point" lat="53.77953084993002" lon="6.272686888139063"/>
          <point xsi:type="esdl:Point" lat="53.77912685426395" lon="6.27266518822212"/>
          <point xsi:type="esdl:Point" lat="53.77911788247899" lon="6.272664489453534"/>
          <point xsi:type="esdl:Point" lat="53.77908198257575" lon="6.272662194423759"/>
          <point xsi:type="esdl:Point" lat="53.7790730107907" lon="6.2726614956569575"/>
          <point xsi:type="esdl:Point" lat="53.77897423244327" lon="6.272657056019528"/>
          <point xsi:type="esdl:Point" lat="53.778884489678966" lon="6.272647688839954"/>
          <point xsi:type="esdl:Point" lat="53.77600134821242" lon="6.272567121823651"/>
          <point xsi:type="esdl:Point" lat="53.77599237642187" lon="6.272566423155811"/>
          <point xsi:type="esdl:Point" lat="53.77597442690826" lon="6.272565275858154"/>
          <point xsi:type="esdl:Point" lat="53.77596545511767" lon="6.272564577191396"/>
          <point xsi:type="esdl:Point" lat="53.77593852952174" lon="6.272562855386106"/>
          <point xsi:type="esdl:Point" lat="53.77592955773105" lon="6.27256215672078"/>
          <point xsi:type="esdl:Point" lat="53.775920492768904" lon="6.272561576808607"/>
          <point xsi:type="esdl:Point" lat="53.77485395312756" lon="6.272441469687662"/>
          <point xsi:type="esdl:Point" lat="53.77484497794013" lon="6.2724408952986295"/>
          <point xsi:type="esdl:Point" lat="53.77483591641083" lon="6.27244018969973"/>
          <point xsi:type="esdl:Point" lat="53.77482694118198" lon="6.27243961682629"/>
          <point xsi:type="esdl:Point" lat="53.77481796938852" lon="6.272438918215635"/>
          <point xsi:type="esdl:Point" lat="53.77480899420102" lon="6.27243834382796"/>
          <point xsi:type="esdl:Point" lat="53.77480002240753" lon="6.272437645218034"/>
          <point xsi:type="esdl:Point" lat="53.774791047178596" lon="6.272437072345944"/>
          <point xsi:type="esdl:Point" lat="53.774782075385055" lon="6.272436373736747"/>
          <point xsi:type="esdl:Point" lat="53.7747731001975" lon="6.272435799350426"/>
          <point xsi:type="esdl:Point" lat="53.774764128403916" lon="6.2724351007419585"/>
          <point xsi:type="esdl:Point" lat="53.7746654907705" lon="6.272425542206615"/>
          <point xsi:type="esdl:Point" lat="53.77465651554129" lon="6.272424969340142"/>
          <point xsi:type="esdl:Point" lat="53.77464754374745" lon="6.272424270736963"/>
          <point xsi:type="esdl:Point" lat="53.774638571953574" lon="6.272423572134161"/>
          <point xsi:type="esdl:Point" lat="53.77462960015969" lon="6.272422873531736"/>
          <point xsi:type="esdl:Point" lat="53.774620624971796" lon="6.27242229915174"/>
          <point xsi:type="esdl:Point" lat="53.77461165317787" lon="6.272421600550046"/>
          <point xsi:type="esdl:Point" lat="53.77460268138393" lon="6.27242090194873"/>
          <point xsi:type="esdl:Point" lat="53.774593709589965" lon="6.272420203347791"/>
          <point xsi:type="esdl:Point" lat="53.77458473779598" lon="6.2724195047472335"/>
          <point xsi:type="esdl:Point" lat="53.77457576600199" lon="6.2724188061470505"/>
          <point xsi:type="esdl:Point" lat="53.77449548215185" lon="6.272412055297627"/>
          <point xsi:type="esdl:Point" lat="53.77440571734234" lon="6.272406817610573"/>
          <point xsi:type="esdl:Point" lat="53.774396745547946" lon="6.272406119017668"/>
          <point xsi:type="esdl:Point" lat="53.77320243646143" lon="6.272411391949379"/>
          <point xsi:type="esdl:Point" lat="53.77319328519346" lon="6.272410679412172"/>
          <point xsi:type="esdl:Point" lat="53.773165910902165" lon="6.272408922958039"/>
          <point xsi:type="esdl:Point" lat="53.77220796778341" lon="6.272276131611411"/>
          <point xsi:type="esdl:Point" lat="53.770397611088924" lon="6.272445737491672"/>
          <point xsi:type="esdl:Point" lat="53.7703154847031" lon="6.27244059588735"/>
          <point xsi:type="esdl:Point" lat="53.768697127754166" lon="6.272174171388681"/>
          <point xsi:type="esdl:Point" lat="53.768688152555626" lon="6.272173597195701"/>
          <point xsi:type="esdl:Point" lat="53.768679180750546" lon="6.272172898798509"/>
          <point xsi:type="esdl:Point" lat="53.76867020461323" lon="6.272172326051042"/>
          <point xsi:type="esdl:Point" lat="53.76866123370547" lon="6.27217162772443"/>
          <point xsi:type="esdl:Point" lat="53.768652258506854" lon="6.272171053532805"/>
          <point xsi:type="esdl:Point" lat="53.76864319696569" lon="6.272170348151716"/>
          <point xsi:type="esdl:Point" lat="53.76863422176704" lon="6.27216977396077"/>
          <point xsi:type="esdl:Point" lat="53.76862524996186" lon="6.2721690755657695"/>
          <point xsi:type="esdl:Point" lat="53.76861627815663" lon="6.272168377171144"/>
          <point xsi:type="esdl:Point" lat="53.76842832183888" lon="6.272160254888037"/>
          <point xsi:type="esdl:Point" lat="53.768419350033305" lon="6.272159556500322"/>
          <point xsi:type="esdl:Point" lat="53.76841037479286" lon="6.272158983831411"/>
          <point xsi:type="esdl:Point" lat="53.76840140298722" lon="6.272158285444423"/>
          <point xsi:type="esdl:Point" lat="53.76838345254762" lon="6.272157138593599"/>
          <point xsi:type="esdl:Point" lat="53.76837448074195" lon="6.272156440207692"/>
          <point xsi:type="esdl:Point" lat="53.76836550554278" lon="6.272155866025779"/>
          <point xsi:type="esdl:Point" lat="53.768356533737055" lon="6.2721551676406015"/>
          <point xsi:type="esdl:Point" lat="53.76834755849648" lon="6.272154594974044"/>
          <point xsi:type="esdl:Point" lat="53.76833858669071" lon="6.272153896589596"/>
          <point xsi:type="esdl:Point" lat="53.768329614884934" lon="6.272153198205526"/>
          <point xsi:type="esdl:Point" lat="53.76832064307914" lon="6.272152499821834"/>
          <point xsi:type="esdl:Point" lat="53.768311672170675" lon="6.272151801508372"/>
          <point xsi:type="esdl:Point" lat="53.76830261062884" lon="6.2721510961402105"/>
          <point xsi:type="esdl:Point" lat="53.76829363882298" lon="6.272150397757657"/>
          <point xsi:type="esdl:Point" lat="53.7682846670171" lon="6.27214969937548"/>
          <point xsi:type="esdl:Point" lat="53.768275695211194" lon="6.2721490009936804"/>
          <point xsi:type="esdl:Point" lat="53.768266723405276" lon="6.272148302612259"/>
          <point xsi:type="esdl:Point" lat="53.76825775159934" lon="6.272147604231217"/>
          <point xsi:type="esdl:Point" lat="53.76816799261079" lon="6.272142118451347"/>
          <point xsi:type="esdl:Point" lat="53.76815902080464" lon="6.272141420074142"/>
          <point xsi:type="esdl:Point" lat="53.768150048998486" lon="6.272140721697316"/>
          <point xsi:type="esdl:Point" lat="53.76687654411092" lon="6.272010554357731"/>
          <point xsi:type="esdl:Point" lat="53.766867568867035" lon="6.272009981755377"/>
          <point xsi:type="esdl:Point" lat="53.76685859705776" lon="6.272009283439537"/>
          <point xsi:type="esdl:Point" lat="53.76684962524845" lon="6.272008585124077"/>
          <point xsi:type="esdl:Point" lat="53.766840650045886" lon="6.272008011008127"/>
          <point xsi:type="esdl:Point" lat="53.76683167823655" lon="6.272007312693395"/>
          <point xsi:type="esdl:Point" lat="53.76405033106277" lon="6.271593609869615"/>
          <point xsi:type="esdl:Point" lat="53.76402457106372" lon="6.271591980200739"/>
          <point xsi:type="esdl:Point" lat="53.76401604792703" lon="6.271591316961249"/>
          <point xsi:type="esdl:Point" lat="53.763998905090695" lon="6.27159023339648"/>
          <point xsi:type="esdl:Point" lat="53.76399029221782" lon="6.27158956317504"/>
          <point xsi:type="esdl:Point" lat="53.76397314938141" lon="6.271588479612088"/>
          <point xsi:type="esdl:Point" lat="53.76396453650848" lon="6.271587809391637"/>
          <point xsi:type="esdl:Point" lat="53.76342263325125" lon="6.271565664568446"/>
          <point xsi:type="esdl:Point" lat="53.763413571696674" lon="6.2715649594525145"/>
          <point xsi:type="esdl:Point" lat="53.75595186609468" lon="6.271512624801844"/>
          <point xsi:type="esdl:Point" lat="53.755370999249244" lon="6.2714192668106"/>
          <point xsi:type="esdl:Point" lat="53.7553259094456" lon="6.271417636448725"/>
          <point xsi:type="esdl:Point" lat="53.754612383830555" lon="6.271562830542171"/>
          <point xsi:type="esdl:Point" lat="53.751911953432085" lon="6.272698767552974"/>
          <point xsi:type="esdl:Point" lat="53.750926156611406" lon="6.27278896648114"/>
          <point xsi:type="esdl:Point" lat="53.750854486702444" lon="6.272809162338122"/>
          <point xsi:type="esdl:Point" lat="53.750749919466216" lon="6.272855324527228"/>
          <point xsi:type="esdl:Point" lat="53.74949052368666" lon="6.273616699441054"/>
          <point xsi:type="esdl:Point" lat="53.74365434936065" lon="6.276075939157257"/>
          <point xsi:type="esdl:Point" lat="53.742299800676086" lon="6.2768834751257385"/>
          <point xsi:type="esdl:Point" lat="53.74203170549046" lon="6.276958536993471"/>
          <point xsi:type="esdl:Point" lat="53.74185230222903" lon="6.276959825349761"/>
          <point xsi:type="esdl:Point" lat="53.74159094972569" lon="6.276923209599358"/>
          <point xsi:type="esdl:Point" lat="53.74149033307298" lon="6.276933385707564"/>
          <point xsi:type="esdl:Point" lat="53.74071470063061" lon="6.277244974619777"/>
          <point xsi:type="esdl:Point" lat="53.74038620500922" lon="6.277493440860159"/>
          <point xsi:type="esdl:Point" lat="53.74015980727359" lon="6.277710456695453"/>
          <point xsi:type="esdl:Point" lat="53.74011195241553" lon="6.277740875618314"/>
          <point xsi:type="esdl:Point" lat="53.74006978994372" lon="6.27775710454147"/>
          <point xsi:type="esdl:Point" lat="53.73827433024833" lon="6.277815372461273"/>
          <point xsi:type="esdl:Point" lat="53.736617396895596" lon="6.2785147781567385"/>
          <point xsi:type="esdl:Point" lat="53.736100839191785" lon="6.278771948342665"/>
          <point xsi:type="esdl:Point" lat="53.73470188644856" lon="6.279325551311208"/>
          <point xsi:type="esdl:Point" lat="53.73318607999189" lon="6.279638404071281"/>
          <point xsi:type="esdl:Point" lat="53.73224154884535" lon="6.280131938901061"/>
          <point xsi:type="esdl:Point" lat="53.731188881948114" lon="6.280516230994554"/>
          <point xsi:type="esdl:Point" lat="53.7307476085501" lon="6.280545741901673"/>
          <point xsi:type="esdl:Point" lat="53.7306861689558" lon="6.280566589282644"/>
          <point xsi:type="esdl:Point" lat="53.73057443019499" lon="6.280644667930884"/>
          <point xsi:type="esdl:Point" lat="53.73025488672901" lon="6.280940142632787"/>
          <point xsi:type="esdl:Point" lat="53.72900596844633" lon="6.281713879114134"/>
          <point xsi:type="esdl:Point" lat="53.72871549949234" lon="6.281912940328859"/>
          <point xsi:type="esdl:Point" lat="53.727637122265584" lon="6.282175490176185"/>
          <point xsi:type="esdl:Point" lat="53.72753726438967" lon="6.282171081924519"/>
          <point xsi:type="esdl:Point" lat="53.72734027531647" lon="6.282141468056505"/>
          <point xsi:type="esdl:Point" lat="53.726702501092795" lon="6.282192403460404"/>
          <point xsi:type="esdl:Point" lat="53.72621480458399" lon="6.28233118776428"/>
          <point xsi:type="esdl:Point" lat="53.72567008418658" lon="6.282726474054304"/>
          <point xsi:type="esdl:Point" lat="53.7256185030084" lon="6.282751710361874"/>
          <point xsi:type="esdl:Point" lat="53.725459778323376" lon="6.282808728762165"/>
          <point xsi:type="esdl:Point" lat="53.72532254560391" lon="6.2828295380799615"/>
          <point xsi:type="esdl:Point" lat="53.72345201756159" lon="6.2832118223356535"/>
          <point xsi:type="esdl:Point" lat="53.72225373423721" lon="6.283863047366289"/>
          <point xsi:type="esdl:Point" lat="53.72139005740185" lon="6.284220524349615"/>
          <point xsi:type="esdl:Point" lat="53.72118131015201" lon="6.284377024959776"/>
          <point xsi:type="esdl:Point" lat="53.72112933129556" lon="6.284400351753752"/>
          <point xsi:type="esdl:Point" lat="53.72087015965643" lon="6.284464526490658"/>
          <point xsi:type="esdl:Point" lat="53.71961135754047" lon="6.285227225193642"/>
          <point xsi:type="esdl:Point" lat="53.71792926642718" lon="6.285622688393652"/>
          <point xsi:type="esdl:Point" lat="53.71739276247627" lon="6.285688717997601"/>
          <point xsi:type="esdl:Point" lat="53.71695793121265" lon="6.285889564434668"/>
          <point xsi:type="esdl:Point" lat="53.716457737131606" lon="6.286267195956521"/>
          <point xsi:type="esdl:Point" lat="53.71637898524154" lon="6.2863421812955265"/>
          <point xsi:type="esdl:Point" lat="53.71630509541282" lon="6.286397296190937"/>
          <point xsi:type="esdl:Point" lat="53.71621443256727" lon="6.2864247232287855"/>
          <point xsi:type="esdl:Point" lat="53.71491458573734" lon="6.287021575101295"/>
          <point xsi:type="esdl:Point" lat="53.71255614794909" lon="6.287834137522721"/>
          <point xsi:type="esdl:Point" lat="53.71239230878914" lon="6.287916848305111"/>
          <point xsi:type="esdl:Point" lat="53.71019737671452" lon="6.288786205144464"/>
          <point xsi:type="esdl:Point" lat="53.69759518771009" lon="6.293529836362052"/>
          <point xsi:type="esdl:Point" lat="53.696638231563476" lon="6.293671969073065"/>
          <point xsi:type="esdl:Point" lat="53.691419399776585" lon="6.296121338690832"/>
          <point xsi:type="esdl:Point" lat="53.68702148302634" lon="6.297565767375709"/>
          <point xsi:type="esdl:Point" lat="53.686119784681395" lon="6.298172186375292"/>
          <point xsi:type="esdl:Point" lat="53.67256862162859" lon="6.303213325784884"/>
          <point xsi:type="esdl:Point" lat="53.67133157966956" lon="6.3038502344243525"/>
          <point xsi:type="esdl:Point" lat="53.67083109352922" lon="6.30403094195685"/>
          <point xsi:type="esdl:Point" lat="53.67033074546327" lon="6.304327039948188"/>
          <point xsi:type="esdl:Point" lat="53.66900468775931" lon="6.304726277306939"/>
          <point xsi:type="esdl:Point" lat="53.66874372239095" lon="6.304841817087372"/>
          <point xsi:type="esdl:Point" lat="53.66741463137694" lon="6.305207575159227"/>
          <point xsi:type="esdl:Point" lat="53.667324607500525" lon="6.3052474712698"/>
          <point xsi:type="esdl:Point" lat="53.666950660348256" lon="6.305498370544953"/>
          <point xsi:type="esdl:Point" lat="53.664094262075814" lon="6.306517785676358"/>
          <point xsi:type="esdl:Point" lat="53.66345895773651" lon="6.306546911119253"/>
          <point xsi:type="esdl:Point" lat="53.66272443513225" lon="6.306880263177388"/>
          <point xsi:type="esdl:Point" lat="53.662075455197275" lon="6.307371501841881"/>
          <point xsi:type="esdl:Point" lat="53.66202340092817" lon="6.307397385776696"/>
          <point xsi:type="esdl:Point" lat="53.66062476498726" lon="6.307884654286743"/>
          <point xsi:type="esdl:Point" lat="53.65972945883599" lon="6.30842670469348"/>
          <point xsi:type="esdl:Point" lat="53.65537681721956" lon="6.309898051743259"/>
          <point xsi:type="esdl:Point" lat="53.65457235630999" lon="6.310029076597332"/>
          <point xsi:type="esdl:Point" lat="53.65196333859767" lon="6.311155822513432"/>
          <point xsi:type="esdl:Point" lat="53.65093033127835" lon="6.311241055533243"/>
          <point xsi:type="esdl:Point" lat="53.64793393854148" lon="6.312758224685135"/>
          <point xsi:type="esdl:Point" lat="53.64537346360606" lon="6.313566096265022"/>
          <point xsi:type="esdl:Point" lat="53.642444801247755" lon="6.314960947604234"/>
          <point xsi:type="esdl:Point" lat="53.6389532343966" lon="6.3163184020750585"/>
          <point xsi:type="esdl:Point" lat="53.63811888332668" lon="6.316868672279575"/>
          <point xsi:type="esdl:Point" lat="53.63739916540813" lon="6.317046233086345"/>
          <point xsi:type="esdl:Point" lat="53.63542822476873" lon="6.3172439328308965"/>
          <point xsi:type="esdl:Point" lat="53.6335033774208" lon="6.317912606819965"/>
          <point xsi:type="esdl:Point" lat="53.63105091437296" lon="6.31890244926338"/>
          <point xsi:type="esdl:Point" lat="53.62916424213957" lon="6.319938015343506"/>
          <point xsi:type="esdl:Point" lat="53.629101326403514" lon="6.319953404968492"/>
          <point xsi:type="esdl:Point" lat="53.6290052545747" lon="6.319958331142375"/>
          <point xsi:type="esdl:Point" lat="53.6288356065369" lon="6.319918927132789"/>
          <point xsi:type="esdl:Point" lat="53.62596001731226" lon="6.318602364536895"/>
          <point xsi:type="esdl:Point" lat="53.623930195940886" lon="6.317953864257932"/>
          <point xsi:type="esdl:Point" lat="53.62376408589944" lon="6.317845272720029"/>
          <point xsi:type="esdl:Point" lat="53.62309235688325" lon="6.317634744909521"/>
          <point xsi:type="esdl:Point" lat="53.621933832814044" lon="6.317149272689904"/>
          <point xsi:type="esdl:Point" lat="53.62087600586821" lon="6.316887509552961"/>
          <point xsi:type="esdl:Point" lat="53.62022919870919" lon="6.31657582127769"/>
          <point xsi:type="esdl:Point" lat="53.620043698619384" lon="6.3164596144917144"/>
          <point xsi:type="esdl:Point" lat="53.61987775233577" lon="6.316390465563014"/>
          <point xsi:type="esdl:Point" lat="53.619590333337705" lon="6.316334362296691"/>
          <point xsi:type="esdl:Point" lat="53.615068148794094" lon="6.31667820003438"/>
          <point xsi:type="esdl:Point" lat="53.61465405209628" lon="6.316813070803959"/>
          <point xsi:type="esdl:Point" lat="53.61447624319917" lon="6.316918714052934"/>
          <point xsi:type="esdl:Point" lat="53.61335220556404" lon="6.317831279728795"/>
          <point xsi:type="esdl:Point" lat="53.612618194946094" lon="6.318730895179998"/>
          <point xsi:type="esdl:Point" lat="53.6123576337334" lon="6.319148645130754"/>
          <point xsi:type="esdl:Point" lat="53.61189638472638" lon="6.320227011610218"/>
          <point xsi:type="esdl:Point" lat="53.611846614605625" lon="6.320371246726673"/>
          <point xsi:type="esdl:Point" lat="53.611345988229516" lon="6.322374508705739"/>
          <point xsi:type="esdl:Point" lat="53.61109015970627" lon="6.324490870114331"/>
          <point xsi:type="esdl:Point" lat="53.61104505800857" lon="6.324783857081164"/>
          <point xsi:type="esdl:Point" lat="53.61101055474951" lon="6.325141898217188"/>
          <point xsi:type="esdl:Point" lat="53.610803808221625" lon="6.326565402299966"/>
          <point xsi:type="esdl:Point" lat="53.610394116494966" lon="6.328389281849914"/>
          <point xsi:type="esdl:Point" lat="53.60975865389847" lon="6.332606327121871"/>
          <point xsi:type="esdl:Point" lat="53.60934390178297" lon="6.333995770976783"/>
          <point xsi:type="esdl:Point" lat="53.60725430334766" lon="6.345310424507861"/>
          <point xsi:type="esdl:Point" lat="53.60606028032258" lon="6.3503153253690225"/>
          <point xsi:type="esdl:Point" lat="53.60604384039108" lon="6.350369383624041"/>
          <point xsi:type="esdl:Point" lat="53.606027570932426" lon="6.3504397874809495"/>
          <point xsi:type="esdl:Point" lat="53.604761722094594" lon="6.365878674913855"/>
          <point xsi:type="esdl:Point" lat="53.60463799899145" lon="6.367417620680908"/>
          <point xsi:type="esdl:Point" lat="53.60431443652859" lon="6.369694580572745"/>
          <point xsi:type="esdl:Point" lat="53.60430311149425" lon="6.370160108286522"/>
          <point xsi:type="esdl:Point" lat="53.60429640818427" lon="6.370895315541766"/>
          <point xsi:type="esdl:Point" lat="53.60345829139733" lon="6.3808491554831095"/>
          <point xsi:type="esdl:Point" lat="53.603421235533474" lon="6.382054201239067"/>
          <point xsi:type="esdl:Point" lat="53.603674002099496" lon="6.396909534780067"/>
          <point xsi:type="esdl:Point" lat="53.60360108792447" lon="6.401506725993309"/>
          <point xsi:type="esdl:Point" lat="53.603730881045564" lon="6.403532995460316"/>
          <point xsi:type="esdl:Point" lat="53.60377290015099" lon="6.403831994624941"/>
          <point xsi:type="esdl:Point" lat="53.60400857354902" lon="6.405132311956956"/>
          <point xsi:type="esdl:Point" lat="53.604093778830105" lon="6.40625382549102"/>
          <point xsi:type="esdl:Point" lat="53.604091573148246" lon="6.406473211271415"/>
          <point xsi:type="esdl:Point" lat="53.60408596943828" lon="6.406540461937906"/>
          <point xsi:type="esdl:Point" lat="53.60407587275076" lon="6.406613958290741"/>
          <point xsi:type="esdl:Point" lat="53.60406028478939" lon="6.406684518845852"/>
          <point xsi:type="esdl:Point" lat="53.604040475871166" lon="6.406751748457111"/>
          <point xsi:type="esdl:Point" lat="53.60401276195852" lon="6.406828189106643"/>
          <point xsi:type="esdl:Point" lat="53.60398607208307" lon="6.406887630559546"/>
          <point xsi:type="esdl:Point" lat="53.60395196146912" lon="6.406945603120222"/>
          <point xsi:type="esdl:Point" lat="53.603875615812086" lon="6.407043684800257"/>
          <point xsi:type="esdl:Point" lat="53.60369677501925" lon="6.407210934727459"/>
          <point xsi:type="esdl:Point" lat="53.59909199429683" lon="6.410679568898918"/>
          <point xsi:type="esdl:Point" lat="53.59620434174828" lon="6.413022162192695"/>
          <point xsi:type="esdl:Point" lat="53.59050047519381" lon="6.418605744688007"/>
          <point xsi:type="esdl:Point" lat="53.58909667482867" lon="6.4198114794222425"/>
          <point xsi:type="esdl:Point" lat="53.588975862355234" lon="6.419895192449481"/>
          <point xsi:type="esdl:Point" lat="53.58893835737623" lon="6.419936407461191"/>
          <point xsi:type="esdl:Point" lat="53.588871676985235" lon="6.420035712490478"/>
          <point xsi:type="esdl:Point" lat="53.58884148088075" lon="6.42009172630837"/>
          <point xsi:type="esdl:Point" lat="53.585274908959775" lon="6.427850711543296"/>
          <point xsi:type="esdl:Point" lat="53.585150376101524" lon="6.428070185852031"/>
          <point xsi:type="esdl:Point" lat="53.58512424274732" lon="6.428131752314892"/>
          <point xsi:type="esdl:Point" lat="53.58508246979519" lon="6.428258975600907"/>
          <point xsi:type="esdl:Point" lat="53.58471174547493" lon="6.429027039732532"/>
          <point xsi:type="esdl:Point" lat="53.584434832719054" lon="6.429612143762544"/>
          <point xsi:type="esdl:Point" lat="53.58441080609074" lon="6.42967861562314"/>
          <point xsi:type="esdl:Point" lat="53.584393019622695" lon="6.429750078890525"/>
          <point xsi:type="esdl:Point" lat="53.58434292764007" lon="6.430057454855825"/>
          <point xsi:type="esdl:Point" lat="53.58308465432415" lon="6.438983720893034"/>
          <point xsi:type="esdl:Point" lat="53.581717786638286" lon="6.458160990086867"/>
          <point xsi:type="esdl:Point" lat="53.58164344173988" lon="6.458906108019133"/>
          <point xsi:type="esdl:Point" lat="53.580656238198536" lon="6.472987741100856"/>
          <point xsi:type="esdl:Point" lat="53.58060666533326" lon="6.495749860221792"/>
          <point xsi:type="esdl:Point" lat="53.58060857674217" lon="6.497251761289785"/>
          <point xsi:type="esdl:Point" lat="53.58059597909746" lon="6.497402626896789"/>
          <point xsi:type="esdl:Point" lat="53.58057875397697" lon="6.497478091384322"/>
          <point xsi:type="esdl:Point" lat="53.58055743885874" lon="6.497545864037866"/>
          <point xsi:type="esdl:Point" lat="53.580534185103794" lon="6.497606125675346"/>
          <point xsi:type="esdl:Point" lat="53.58050526908768" lon="6.497666292550177"/>
          <point xsi:type="esdl:Point" lat="53.580477873539074" lon="6.49771138335321"/>
          <point xsi:type="esdl:Point" lat="53.58043299377665" lon="6.497763999790165"/>
          <point xsi:type="esdl:Point" lat="53.58038514136702" lon="6.497801416643866"/>
          <point xsi:type="esdl:Point" lat="53.58028907112964" lon="6.497861142234299"/>
          <point xsi:type="esdl:Point" lat="53.580067834157475" lon="6.498056070676908"/>
          <point xsi:type="esdl:Point" lat="53.57999625516847" lon="6.49810847420194"/>
          <point xsi:type="esdl:Point" lat="53.57993360893979" lon="6.498138312754508"/>
          <point xsi:type="esdl:Point" lat="53.57992368103101" lon="6.4981457162475955"/>
          <point xsi:type="esdl:Point" lat="53.57990885669604" lon="6.4981606897647035"/>
          <point xsi:type="esdl:Point" lat="53.57989816482569" lon="6.498175757013948"/>
          <point xsi:type="esdl:Point" lat="53.579892148331645" lon="6.498190835932856"/>
          <point xsi:type="esdl:Point" lat="53.57988909976391" lon="6.498205912332872"/>
          <point xsi:type="esdl:Point" lat="53.57987958385645" lon="6.4983190224956004"/>
          <point xsi:type="esdl:Point" lat="53.57988071949656" lon="6.498341671452871"/>
          <point xsi:type="esdl:Point" lat="53.579885220025766" lon="6.498356871652148"/>
          <point xsi:type="esdl:Point" lat="53.579893319228" lon="6.498371997570552"/>
          <point xsi:type="esdl:Point" lat="53.579901819911406" lon="6.498379553689082"/>
          <point xsi:type="esdl:Point" lat="53.57991760051212" lon="6.498387212889839"/>
          <point xsi:type="esdl:Point" lat="53.58005499196748" lon="6.498433337687195"/>
          <point xsi:type="esdl:Point" lat="53.5802086870818" lon="6.498539877397606"/>
          <point xsi:type="esdl:Point" lat="53.58032575117758" lon="6.4985708649670295"/>
          <point xsi:type="esdl:Point" lat="53.58035844333601" lon="6.4985936309031525"/>
          <point xsi:type="esdl:Point" lat="53.5804379181498" lon="6.498692290529819"/>
          <point xsi:type="esdl:Point" lat="53.580457443344734" lon="6.498722567078909"/>
          <point xsi:type="esdl:Point" lat="53.58048218951303" lon="6.498767978247604"/>
          <point xsi:type="esdl:Point" lat="53.580516665150185" lon="6.498858807510931"/>
          <point xsi:type="esdl:Point" lat="53.58053540370362" lon="6.4989343778775455"/>
          <point xsi:type="esdl:Point" lat="53.580543877138616" lon="6.498979690618488"/>
          <point xsi:type="esdl:Point" lat="53.580588948428165" lon="6.4995838156958134"/>
          <point xsi:type="esdl:Point" lat="53.580530808660505" lon="6.5306937823998945"/>
          <point xsi:type="esdl:Point" lat="53.58051885050274" lon="6.530839832482977"/>
          <point xsi:type="esdl:Point" lat="53.580504755943444" lon="6.530930375263318"/>
          <point xsi:type="esdl:Point" lat="53.56476378104723" lon="6.592681313128169"/>
          <point xsi:type="esdl:Point" lat="53.552265528525574" lon="6.635607121618905"/>
          <point xsi:type="esdl:Point" lat="53.55195719102661" lon="6.636410570941495"/>
          <point xsi:type="esdl:Point" lat="53.55173107697958" lon="6.636849453017601"/>
          <point xsi:type="esdl:Point" lat="53.55169226131527" lon="6.6369075167314175"/>
          <point xsi:type="esdl:Point" lat="53.551654844614355" lon="6.6369521259930435"/>
          <point xsi:type="esdl:Point" lat="53.551651510237235" lon="6.636955326964158"/>
          <point xsi:type="esdl:Point" lat="53.551545158292335" lon="6.637034242355886"/>
          <point xsi:type="esdl:Point" lat="53.55145922961253" lon="6.637074436923956"/>
          <point xsi:type="esdl:Point" lat="53.55142714760245" lon="6.637082640954376"/>
          <point xsi:type="esdl:Point" lat="53.551386420021544" lon="6.6370853709649476"/>
          <point xsi:type="esdl:Point" lat="53.551345982582895" lon="6.63708152597697"/>
          <point xsi:type="esdl:Point" lat="53.55127389869786" lon="6.637080441616387"/>
          <point xsi:type="esdl:Point" lat="53.55126941435743" lon="6.637080056593579"/>
          <point xsi:type="esdl:Point" lat="53.55123803620046" lon="6.6370769894492865"/>
          <point xsi:type="esdl:Point" lat="53.55122448214526" lon="6.6370761987462314"/>
          <point xsi:type="esdl:Point" lat="53.55121999780479" lon="6.637075813724565"/>
          <point xsi:type="esdl:Point" lat="53.55120204530688" lon="6.6370747707288"/>
          <point xsi:type="esdl:Point" lat="53.543789530757735" lon="6.635886393056873"/>
          <point xsi:type="esdl:Point" lat="53.54378054786702" lon="6.635886119048351"/>
          <point xsi:type="esdl:Point" lat="53.54376274277395" lon="6.635880233363072"/>
          <point xsi:type="esdl:Point" lat="53.54375001316995" lon="6.635873040651645"/>
          <point xsi:type="esdl:Point" lat="53.54373196092818" lon="6.635857546756026"/>
          <point xsi:type="esdl:Point" lat="53.54370183966224" lon="6.635816114312268"/>
          <point xsi:type="esdl:Point" lat="53.543660953669466" lon="6.63573839554955"/>
          <point xsi:type="esdl:Point" lat="53.543648801256154" lon="6.6357240300915725"/>
          <point xsi:type="esdl:Point" lat="53.54363951444849" lon="6.635716012430975"/>
          <point xsi:type="esdl:Point" lat="53.54362464708788" lon="6.635708136556369"/>
          <point xsi:type="esdl:Point" lat="53.54361889930043" lon="6.635707892529617"/>
          <point xsi:type="esdl:Point" lat="53.54358121062372" lon="6.635699429612829"/>
          <point xsi:type="esdl:Point" lat="53.54355434437023" lon="6.635689902104622"/>
          <point xsi:type="esdl:Point" lat="53.54354318205978" lon="6.6356903139209225"/>
          <point xsi:type="esdl:Point" lat="53.543538360512294" lon="6.635692142566685"/>
          <point xsi:type="esdl:Point" lat="53.543534465296524" lon="6.63569604086893"/>
          <point xsi:type="esdl:Point" lat="53.54353023677014" lon="6.6356990408136785"/>
          <point xsi:type="esdl:Point" lat="53.54352659173528" lon="6.6357035842092005"/>
          <point xsi:type="esdl:Point" lat="53.543511756426405" lon="6.6357330653878766"/>
          <point xsi:type="esdl:Point" lat="53.54350658333693" lon="6.635746442510602"/>
          <point xsi:type="esdl:Point" lat="53.54349995390468" lon="6.635769281631274"/>
          <point xsi:type="esdl:Point" lat="53.543489181885185" lon="6.635795251871084"/>
          <point xsi:type="esdl:Point" lat="53.54346910297952" lon="6.635825652630226"/>
          <point xsi:type="esdl:Point" lat="53.54346537579974" lon="6.635829939811201"/>
          <point xsi:type="esdl:Point" lat="53.543434661777965" lon="6.635849342737969"/>
          <point xsi:type="esdl:Point" lat="53.5434300121195" lon="6.63585143374949"/>
          <point xsi:type="esdl:Point" lat="53.5434028688571" lon="6.635853960839792"/>
          <point xsi:type="esdl:Point" lat="53.54331075237451" lon="6.635837466422077"/>
          <point xsi:type="esdl:Point" lat="53.54320672355553" lon="6.635869628462088"/>
          <point xsi:type="esdl:Point" lat="53.5431386068958" lon="6.635918443555734"/>
          <point xsi:type="esdl:Point" lat="53.543037274873164" lon="6.636018571327579"/>
          <point xsi:type="esdl:Point" lat="53.542989748476046" lon="6.636088078894919"/>
          <point xsi:type="esdl:Point" lat="53.5428414666685" lon="6.636383517567757"/>
          <point xsi:type="esdl:Point" lat="53.54282787341369" lon="6.636428294953589"/>
          <point xsi:type="esdl:Point" lat="53.542813069807714" lon="6.636495130288891"/>
          <point xsi:type="esdl:Point" lat="53.54278588875443" lon="6.636584561555658"/>
          <point xsi:type="esdl:Point" lat="53.54277740939142" lon="6.636606121005957"/>
          <point xsi:type="esdl:Point" lat="53.54277730831427" lon="6.636606486803934"/>
          <point xsi:type="esdl:Point" lat="53.54277721104316" lon="6.636606727601035"/>
          <point xsi:type="esdl:Point" lat="53.54277711001187" lon="6.636607091892971"/>
          <point xsi:type="esdl:Point" lat="53.54277692303581" lon="6.636607324991458"/>
          <point xsi:type="esdl:Point" lat="53.54277682200452" lon="6.63660768928339"/>
          <point xsi:type="esdl:Point" lat="53.542776627462274" lon="6.63660817087758"/>
          <point xsi:type="esdl:Point" lat="53.542776526385126" lon="6.636608536675544"/>
          <point xsi:type="esdl:Point" lat="53.54277633945493" lon="6.636608768267986"/>
          <point xsi:type="esdl:Point" lat="53.54277623837777" lon="6.636609134065946"/>
          <point xsi:type="esdl:Point" lat="53.542776141106664" lon="6.636609374863036"/>
          <point xsi:type="esdl:Point" lat="53.54277604007536" lon="6.636609739154956"/>
          <point xsi:type="esdl:Point" lat="53.54277594280424" lon="6.636609979952042"/>
          <point xsi:type="esdl:Point" lat="53.542775841772915" lon="6.636610344243958"/>
          <point xsi:type="esdl:Point" lat="53.54277565479688" lon="6.636610577342425"/>
          <point xsi:type="esdl:Point" lat="53.54260620648133" lon="6.637045888105842"/>
          <point xsi:type="esdl:Point" lat="53.54256593778316" lon="6.637125105271978"/>
          <point xsi:type="esdl:Point" lat="53.54253639276496" lon="6.637165151763527"/>
          <point xsi:type="esdl:Point" lat="53.542447662961415" lon="6.63724120557777"/>
          <point xsi:type="esdl:Point" lat="53.54189144881281" lon="6.637585411878886"/>
          <point xsi:type="esdl:Point" lat="53.54182155515092" lon="6.637615768338045"/>
          <point xsi:type="esdl:Point" lat="53.541375644464395" lon="6.637895976859448"/>
          <point xsi:type="esdl:Point" lat="53.54005952127221" lon="6.638703064142346"/>
          <point xsi:type="esdl:Point" lat="53.54003757780962" lon="6.638712010343098"/>
          <point xsi:type="esdl:Point" lat="53.53989908318429" lon="6.6388010898089584"/>
          <point xsi:type="esdl:Point" lat="53.53988160239363" lon="6.638808179980428"/>
          <point xsi:type="esdl:Point" lat="53.53986473710755" lon="6.638818683960781"/>
          <point xsi:type="esdl:Point" lat="53.539812968807375" lon="6.638844368262445"/>
          <point xsi:type="esdl:Point" lat="53.5396265379015" lon="6.638954355131105"/>
          <point xsi:type="esdl:Point" lat="53.53957413606789" lon="6.638977245856734"/>
          <point xsi:type="esdl:Point" lat="53.53948233899929" lon="6.639038833368117"/>
          <point xsi:type="esdl:Point" lat="53.53935492984847" lon="6.639112304089198"/>
          <point xsi:type="esdl:Point" lat="53.53927195243182" lon="6.639170665393593"/>
          <point xsi:type="esdl:Point" lat="53.5392460238222" lon="6.639183504112397"/>
          <point xsi:type="esdl:Point" lat="53.53923782999386" lon="6.639189772961583"/>
          <point xsi:type="esdl:Point" lat="53.53891547412005" lon="6.639422542870227"/>
          <point xsi:type="esdl:Point" lat="53.53885818633201" lon="6.639467049080526"/>
          <point xsi:type="esdl:Point" lat="53.53882486166007" lon="6.639489460316759"/>
          <point xsi:type="esdl:Point" lat="53.538533212875734" lon="6.6397590997048255"/>
          <point xsi:type="esdl:Point" lat="53.53842795339313" lon="6.639861111287163"/>
          <point xsi:type="esdl:Point" lat="53.53826429678034" lon="6.640046996940773"/>
          <point xsi:type="esdl:Point" lat="53.53817867153889" lon="6.640130276472096"/>
          <point xsi:type="esdl:Point" lat="53.538096970055314" lon="6.64022347844734"/>
          <point xsi:type="esdl:Point" lat="53.53807311165048" lon="6.640245083292924"/>
          <point xsi:type="esdl:Point" lat="53.53806566457246" lon="6.640253407347333"/>
          <point xsi:type="esdl:Point" lat="53.53805763119187" lon="6.640260311647841"/>
          <point xsi:type="esdl:Point" lat="53.53804900684819" lon="6.640265919598523"/>
          <point xsi:type="esdl:Point" lat="53.53789205084057" lon="6.640441422587064"/>
          <point xsi:type="esdl:Point" lat="53.537883849378375" lon="6.6404479394678955"/>
          <point xsi:type="esdl:Point" lat="53.537869865357756" lon="6.640467155265424"/>
          <point xsi:type="esdl:Point" lat="53.537861412840726" lon="6.640473027027162"/>
          <point xsi:type="esdl:Point" lat="53.53780214676753" lon="6.640541140120256"/>
          <point xsi:type="esdl:Point" lat="53.53779352707293" lon="6.640546624579055"/>
          <point xsi:type="esdl:Point" lat="53.53771287604605" lon="6.640628958629869"/>
          <point xsi:type="esdl:Point" lat="53.53728691427594" lon="6.64109221178892"/>
          <point xsi:type="esdl:Point" lat="53.536173778048145" lon="6.642298382880277"/>
          <point xsi:type="esdl:Point" lat="53.536148199987124" lon="6.642329175579207"/>
          <point xsi:type="esdl:Point" lat="53.535764217194355" lon="6.6427484471456"/>
          <point xsi:type="esdl:Point" lat="53.53557980766862" lon="6.642936511054167"/>
          <point xsi:type="esdl:Point" lat="53.53545294975902" lon="6.643065532457262"/>
          <point xsi:type="esdl:Point" lat="53.535423565780526" lon="6.643100228790043"/>
          <point xsi:type="esdl:Point" lat="53.535358351189345" lon="6.643180521363613"/>
          <point xsi:type="esdl:Point" lat="53.535170592055735" lon="6.643386965765873"/>
          <point xsi:type="esdl:Point" lat="53.53516372346078" lon="6.643396956854801"/>
          <point xsi:type="esdl:Point" lat="53.535148488107986" lon="6.643412951446941"/>
          <point xsi:type="esdl:Point" lat="53.5351157126815" lon="6.643452709172866"/>
          <point xsi:type="esdl:Point" lat="53.535097000075446" lon="6.643473632913254"/>
          <point xsi:type="esdl:Point" lat="53.53500155805271" lon="6.64358680378926"/>
          <point xsi:type="esdl:Point" lat="53.53142490613738" lon="6.647526153503901"/>
          <point xsi:type="esdl:Point" lat="53.53073437218061" lon="6.64802749693065"/>
          <point xsi:type="esdl:Point" lat="53.53003836138297" lon="6.64845491504221"/>
          <point xsi:type="esdl:Point" lat="53.52675350183878" lon="6.651124259532813"/>
          <point xsi:type="esdl:Point" lat="53.519016679274735" lon="6.658188787672519"/>
          <point xsi:type="esdl:Point" lat="53.51567467102405" lon="6.6614764439263"/>
          <point xsi:type="esdl:Point" lat="53.51429421206236" lon="6.663161349961911"/>
          <point xsi:type="esdl:Point" lat="53.514277157983294" lon="6.6631984493887115"/>
          <point xsi:type="esdl:Point" lat="53.51422537055792" lon="6.663283190038211"/>
          <point xsi:type="esdl:Point" lat="53.51420766643873" lon="6.6633062979318645"/>
          <point xsi:type="esdl:Point" lat="53.51324808731102" lon="6.664587489487442"/>
          <point xsi:type="esdl:Point" lat="53.51319522341044" lon="6.66465745310822"/>
          <point xsi:type="esdl:Point" lat="53.50850022911052" lon="6.670558008924382"/>
          <point xsi:type="esdl:Point" lat="53.50795716009331" lon="6.6711233663849905"/>
          <point xsi:type="esdl:Point" lat="53.507584620646384" lon="6.671669875475799"/>
          <point xsi:type="esdl:Point" lat="53.50221243822523" lon="6.676606023077662"/>
          <point xsi:type="esdl:Point" lat="53.50077537210213" lon="6.677686593808775"/>
          <point xsi:type="esdl:Point" lat="53.50076758674762" lon="6.677694128347171"/>
          <point xsi:type="esdl:Point" lat="53.500763533762836" lon="6.677697260224004"/>
          <point xsi:type="esdl:Point" lat="53.50075509192976" lon="6.677702748166032"/>
          <point xsi:type="esdl:Point" lat="53.499574628494535" lon="6.678754988734949"/>
          <point xsi:type="esdl:Point" lat="53.49877717725886" lon="6.679391610267188"/>
          <point xsi:type="esdl:Point" lat="53.49840818647098" lon="6.679629156021123"/>
          <point xsi:type="esdl:Point" lat="53.495650451106506" lon="6.6824223003437035"/>
          <point xsi:type="esdl:Point" lat="53.49505647719863" lon="6.683286144068232"/>
          <point xsi:type="esdl:Point" lat="53.49348272947115" lon="6.685972344285274"/>
          <point xsi:type="esdl:Point" lat="53.493075706310144" lon="6.686695508452517"/>
          <point xsi:type="esdl:Point" lat="53.49179076037781" lon="6.6899852189884"/>
          <point xsi:type="esdl:Point" lat="53.4914656273706" lon="6.691008059252966"/>
          <point xsi:type="esdl:Point" lat="53.491327892735" lon="6.691507331815284"/>
          <point xsi:type="esdl:Point" lat="53.491129534722724" lon="6.69204771533589"/>
          <point xsi:type="esdl:Point" lat="53.491115748529516" lon="6.692095140843828"/>
          <point xsi:type="esdl:Point" lat="53.49090801941712" lon="6.692917994755194"/>
          <point xsi:type="esdl:Point" lat="53.48977614878745" lon="6.698442314762595"/>
          <point xsi:type="esdl:Point" lat="53.48946977455225" lon="6.700896895894527"/>
          <point xsi:type="esdl:Point" lat="53.48947069365993" lon="6.700904934272167"/>
          <point xsi:type="esdl:Point" lat="53.48947797214411" lon="6.700945735565889"/>
          <point xsi:type="esdl:Point" lat="53.48947827104826" lon="6.700953471043746"/>
          <point xsi:type="esdl:Point" lat="53.48947792226053" lon="6.700976323081522"/>
          <point xsi:type="esdl:Point" lat="53.48947220397531" lon="6.700998333023782"/>
          <point xsi:type="esdl:Point" lat="53.4894630422556" lon="6.701009596153097"/>
          <point xsi:type="esdl:Point" lat="53.489422242541536" lon="6.70110738984109"/>
          <point xsi:type="esdl:Point" lat="53.489418634890775" lon="6.701113542071422"/>
          <point xsi:type="esdl:Point" lat="53.48932784669969" lon="6.70123421081401"/>
          <point xsi:type="esdl:Point" lat="53.489279993349875" lon="6.701312984233535"/>
          <point xsi:type="esdl:Point" lat="53.48925873510818" lon="6.7013576390490925"/>
          <point xsi:type="esdl:Point" lat="53.48922980600069" lon="6.70146119174909"/>
          <point xsi:type="esdl:Point" lat="53.489228416828844" lon="6.701468283848148"/>
          <point xsi:type="esdl:Point" lat="53.48922707747561" lon="6.701491171543333"/>
          <point xsi:type="esdl:Point" lat="53.48922467409822" lon="6.7015135954777305"/>
          <point xsi:type="esdl:Point" lat="53.48922377936114" lon="6.701536647106312"/>
          <point xsi:type="esdl:Point" lat="53.48923087503233" lon="6.701673185768782"/>
          <point xsi:type="esdl:Point" lat="53.48922775612805" lon="6.7019303289328755"/>
          <point xsi:type="esdl:Point" lat="53.4892284030944" lon="6.7019384687316155"/>
          <point xsi:type="esdl:Point" lat="53.48923350705883" lon="6.701956572057951"/>
          <point xsi:type="esdl:Point" lat="53.489234329596634" lon="6.7019648508313345"/>
          <point xsi:type="esdl:Point" lat="53.48923435405262" lon="6.702051031521719"/>
          <point xsi:type="esdl:Point" lat="53.489217951535" lon="6.702144982155202"/>
          <point xsi:type="esdl:Point" lat="53.48921762336508" lon="6.702152662915298"/>
          <point xsi:type="esdl:Point" lat="53.48921782569239" lon="6.702160638771025"/>
          <point xsi:type="esdl:Point" lat="53.48921670170493" lon="6.702167879143171"/>
          <point xsi:type="esdl:Point" lat="53.48920322227999" lon="6.702184983316132"/>
          <point xsi:type="esdl:Point" lat="53.489199353175444" lon="6.702190863791272"/>
          <point xsi:type="esdl:Point" lat="53.48916676746464" lon="6.702418078717277"/>
          <point xsi:type="esdl:Point" lat="53.48912095279984" lon="6.702631082527904"/>
          <point xsi:type="esdl:Point" lat="53.4890799705385" lon="6.702807200246242"/>
          <point xsi:type="esdl:Point" lat="53.48907930151653" lon="6.702811370579446"/>
          <point xsi:type="esdl:Point" lat="53.489068603732946" lon="6.702851848175149"/>
          <point xsi:type="esdl:Point" lat="53.489015084685995" lon="6.703075494244513"/>
          <point xsi:type="esdl:Point" lat="53.48856351985226" lon="6.70486534482303"/>
          <point xsi:type="esdl:Point" lat="53.48577856264605" lon="6.714387922763302"/>
          <point xsi:type="esdl:Point" lat="53.48518431472393" lon="6.7162117896877485"/>
          <point xsi:type="esdl:Point" lat="53.48506468542899" lon="6.716634408462399"/>
          <point xsi:type="esdl:Point" lat="53.485056481274604" lon="6.716669750038777"/>
          <point xsi:type="esdl:Point" lat="53.48467345640472" lon="6.717854779619109"/>
          <point xsi:type="esdl:Point" lat="53.48353476765635" lon="6.721261943130252"/>
          <point xsi:type="esdl:Point" lat="53.48228933735447" lon="6.725924930333425"/>
          <point xsi:type="esdl:Point" lat="53.48005654362753" lon="6.737224164032785"/>
          <point xsi:type="esdl:Point" lat="53.47995310411353" lon="6.737856725241374"/>
          <point xsi:type="esdl:Point" lat="53.47661324506106" lon="6.75354499325291"/>
          <point xsi:type="esdl:Point" lat="53.47421351406345" lon="6.76421930837947"/>
          <point xsi:type="esdl:Point" lat="53.47394428113406" lon="6.765701376618944"/>
          <point xsi:type="esdl:Point" lat="53.47166369721091" lon="6.775167019475264"/>
          <point xsi:type="esdl:Point" lat="53.4703678379106" lon="6.78124314452363"/>
          <point xsi:type="esdl:Point" lat="53.463550982411604" lon="6.810168313193007"/>
          <point xsi:type="esdl:Point" lat="53.46354881526713" lon="6.810191111754101"/>
          <point xsi:type="esdl:Point" lat="53.46353351382374" lon="6.810261949832848"/>
          <point xsi:type="esdl:Point" lat="53.46343348956988" lon="6.811037088005731"/>
          <point xsi:type="esdl:Point" lat="53.463361996107544" lon="6.811386250991077"/>
          <point xsi:type="esdl:Point" lat="53.46336103712154" lon="6.811393746340003"/>
          <point xsi:type="esdl:Point" lat="53.463356469461154" lon="6.811463556967056"/>
          <point xsi:type="esdl:Point" lat="53.46329298084758" lon="6.811680330445457"/>
          <point xsi:type="esdl:Point" lat="53.46329043515727" lon="6.811686813772596"/>
          <point xsi:type="esdl:Point" lat="53.46320689708374" lon="6.811849960559414"/>
          <point xsi:type="esdl:Point" lat="53.46319651342834" lon="6.811851267297719"/>
          <point xsi:type="esdl:Point" lat="53.46316870359202" lon="6.811849144837287"/>
          <point xsi:type="esdl:Point" lat="53.46316322114956" lon="6.811851884509365"/>
          <point xsi:type="esdl:Point" lat="53.463132521015496" lon="6.811875478237475"/>
          <point xsi:type="esdl:Point" lat="53.4627437261569" lon="6.812490347776925"/>
          <point xsi:type="esdl:Point" lat="53.46264535736615" lon="6.812633517676798"/>
          <point xsi:type="esdl:Point" lat="53.4626220153164" lon="6.812680142211576"/>
          <point xsi:type="esdl:Point" lat="53.462533367627586" lon="6.812828658420742"/>
          <point xsi:type="esdl:Point" lat="53.4625300773436" lon="6.812844395288961"/>
          <point xsi:type="esdl:Point" lat="53.46253489686403" lon="6.812921509625249"/>
          <point xsi:type="esdl:Point" lat="53.462539448143154" lon="6.812950752287839"/>
          <point xsi:type="esdl:Point" lat="53.462543776975" lon="6.812964438760298"/>
          <point xsi:type="esdl:Point" lat="53.46254952150309" lon="6.812976015580871"/>
          <point xsi:type="esdl:Point" lat="53.46257504977082" lon="6.813018572712571"/>
          <point xsi:type="esdl:Point" lat="53.46259516027833" lon="6.8130590295247995"/>
          <point xsi:type="esdl:Point" lat="53.4626097418064" lon="6.813097995479291"/>
          <point xsi:type="esdl:Point" lat="53.46261252243046" lon="6.81310383672616"/>
          <point xsi:type="esdl:Point" lat="53.4626155229033" lon="6.813108455765543"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_from_HUB_East_to_HUB_EEM" capacity="10000000000.0" id="CBL_from_HUB_East_to_HUB_EEM" length="114790.32245190012">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="3df5861c-468c-440d-a7c9-8ad715a80364" name="InPort" connectedTo="1b095bb2-e21c-4d49-8073-e704fea2f287"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="097776dd-5da1-4a91-ac65-eaaf387a56a9" id="1f495e25-c980-4199-be1c-0548e3335a6e" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.866123" lon="5.628928"/>
          <point xsi:type="esdl:Point" lat="53.840535" lon="5.664249"/>
          <point xsi:type="esdl:Point" lat="53.827736" lon="5.664249"/>
          <point xsi:type="esdl:Point" lat="53.789313" lon="5.71723"/>
          <point xsi:type="esdl:Point" lat="53.776498" lon="5.71723"/>
          <point xsi:type="esdl:Point" lat="53.725197" lon="5.787872"/>
          <point xsi:type="esdl:Point" lat="53.712362" lon="5.787872"/>
          <point xsi:type="esdl:Point" lat="53.673833" lon="5.840854"/>
          <point xsi:type="esdl:Point" lat="53.660983" lon="5.840854"/>
          <point xsi:type="esdl:Point" lat="53.63527" lon="5.876175"/>
          <point xsi:type="esdl:Point" lat="53.622407" lon="5.876175"/>
          <point xsi:type="esdl:Point" lat="53.583797" lon="5.929156"/>
          <point xsi:type="esdl:Point" lat="53.570919" lon="5.929156"/>
          <point xsi:type="esdl:Point" lat="53.558037" lon="5.946817"/>
          <point xsi:type="esdl:Point" lat="53.545151" lon="5.946817"/>
          <point xsi:type="esdl:Point" lat="53.532261" lon="5.946817"/>
          <point xsi:type="esdl:Point" lat="53.519367" lon="5.946817"/>
          <point xsi:type="esdl:Point" lat="53.506469" lon="5.946817"/>
          <point xsi:type="esdl:Point" lat="53.493568" lon="5.946817"/>
          <point xsi:type="esdl:Point" lat="53.480662" lon="5.964477"/>
          <point xsi:type="esdl:Point" lat="53.467753" lon="5.964477"/>
          <point xsi:type="esdl:Point" lat="53.454839" lon="5.982138"/>
          <point xsi:type="esdl:Point" lat="53.454839" lon="6.635577"/>
          <point xsi:type="esdl:Point" lat="53.467753" lon="6.653237"/>
          <point xsi:type="esdl:Point" lat="53.467753" lon="6.812182"/>
          <point xsi:type="esdl:Point" lat="53.454839" lon="6.829843"/>
          <point xsi:type="esdl:Point" lat="53.454839" lon="6.847503"/>
          <point xsi:type="esdl:Point" lat="53.441922" lon="6.829843"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA6_1" id="CBL_WF_WA6_1" length="111.30938229380095">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="eab956bc-c68a-4e72-ab80-ef54a9856051" name="InPort" connectedTo="dcc545a0-0d2c-42ba-b775-a900e9975e4b"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="0e45bc4a-075d-4369-9f56-58d5ba4b4387" id="7ddad3dd-be7d-4b46-9c4a-b2e26e025ee6" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.2348242457071" lon="4.51296592482482"/>
          <point xsi:type="esdl:Point" lat="54.2358242457071" lon="4.51296592482482"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA6_2" id="CBL_WF_WA6_2" length="111.31216763674098">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="ef6bdb5d-1068-4251-b168-64c4668f2c85" name="InPort" connectedTo="1e65b863-f486-41b0-8049-5e6b643636e7"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="a644a0da-2945-4790-94c0-9567ba8c4c22" id="d1dc2825-7726-4b2a-9b79-7d7810e8dd05" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.3848242457071" lon="4.61296592482482"/>
          <point xsi:type="esdl:Point" lat="54.3858242457071" lon="4.61296592482482"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_WA6_3" capacity="2000000000.0" id="CBL_WF_WA6_3" length="63272.32166124482">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="65667b23-f57f-413b-947d-18cd49d2b3ff" name="InPort" connectedTo="02017b92-d205-4f83-80cb-e66214d7611e"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="6da7647d-d0c0-4a34-86ee-02e0a9618618" id="829025f5-d165-4fec-afc7-985a1b431360" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.524678" lon="4.707208"/>
          <point xsi:type="esdl:Point" lat="54.524678" lon="4.687555"/>
          <point xsi:type="esdl:Point" lat="54.498291" lon="4.687555"/>
          <point xsi:type="esdl:Point" lat="54.445466" lon="4.667901"/>
          <point xsi:type="esdl:Point" lat="54.419028" lon="4.648247"/>
          <point xsi:type="esdl:Point" lat="54.3661" lon="4.628594"/>
          <point xsi:type="esdl:Point" lat="54.313105" lon="4.60894"/>
          <point xsi:type="esdl:Point" lat="54.286581" lon="4.589286"/>
          <point xsi:type="esdl:Point" lat="54.260041" lon="4.60894"/>
          <point xsi:type="esdl:Point" lat="54.233483" lon="4.60894"/>
          <point xsi:type="esdl:Point" lat="54.206908" lon="4.60894"/>
          <point xsi:type="esdl:Point" lat="54.153707" lon="4.589286"/>
          <point xsi:type="esdl:Point" lat="54.127081" lon="4.569633"/>
          <point xsi:type="esdl:Point" lat="54.127081" lon="4.549979"/>
          <point xsi:type="esdl:Point" lat="54.073778" lon="4.510672"/>
          <point xsi:type="esdl:Point" lat="54.073778" lon="4.432057"/>
          <point xsi:type="esdl:Point" lat="54.0471" lon="4.412403"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_WA6_4" capacity="2000000000.0" id="CBL_WF_WA6_4" length="81919.65140097901">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="7502d0c7-c0b9-498f-a58b-ea671c13dc87" name="InPort" connectedTo="ccbeb16a-00cf-485b-a150-312ef2261739"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="6da7647d-d0c0-4a34-86ee-02e0a9618618" id="240ec5e3-50b0-41e2-a723-9ebe5baf542c" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.682642" lon="4.805477"/>
          <point xsi:type="esdl:Point" lat="54.656357" lon="4.785823"/>
          <point xsi:type="esdl:Point" lat="54.603737" lon="4.76617"/>
          <point xsi:type="esdl:Point" lat="54.577401" lon="4.746516"/>
          <point xsi:type="esdl:Point" lat="54.524678" lon="4.726862"/>
          <point xsi:type="esdl:Point" lat="54.498291" lon="4.707208"/>
          <point xsi:type="esdl:Point" lat="54.498291" lon="4.687555"/>
          <point xsi:type="esdl:Point" lat="54.445466" lon="4.667901"/>
          <point xsi:type="esdl:Point" lat="54.419028" lon="4.648247"/>
          <point xsi:type="esdl:Point" lat="54.3661" lon="4.628594"/>
          <point xsi:type="esdl:Point" lat="54.313105" lon="4.60894"/>
          <point xsi:type="esdl:Point" lat="54.286581" lon="4.589286"/>
          <point xsi:type="esdl:Point" lat="54.260041" lon="4.60894"/>
          <point xsi:type="esdl:Point" lat="54.233483" lon="4.60894"/>
          <point xsi:type="esdl:Point" lat="54.206908" lon="4.60894"/>
          <point xsi:type="esdl:Point" lat="54.153707" lon="4.589286"/>
          <point xsi:type="esdl:Point" lat="54.127081" lon="4.569633"/>
          <point xsi:type="esdl:Point" lat="54.127081" lon="4.549979"/>
          <point xsi:type="esdl:Point" lat="54.073778" lon="4.510672"/>
          <point xsi:type="esdl:Point" lat="54.073778" lon="4.432057"/>
          <point xsi:type="esdl:Point" lat="54.0471" lon="4.412403"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_WA6_5" capacity="2000000000.0" id="CBL_WF_WA6_5" length="100938.90302519704">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="2f5a175b-927b-4c42-b55b-2bc4d61ce67c" name="InPort" connectedTo="be9cc073-fb16-4a96-9541-5dcb1e331159"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="6da7647d-d0c0-4a34-86ee-02e0a9618618" id="c9421584-4ed8-4252-b6af-e0232ad2c22b" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.839994" lon="4.903745"/>
          <point xsi:type="esdl:Point" lat="54.813811" lon="4.903745"/>
          <point xsi:type="esdl:Point" lat="54.787611" lon="4.903745"/>
          <point xsi:type="esdl:Point" lat="54.761394" lon="4.903745"/>
          <point xsi:type="esdl:Point" lat="54.735161" lon="4.903745"/>
          <point xsi:type="esdl:Point" lat="54.70891" lon="4.903745"/>
          <point xsi:type="esdl:Point" lat="54.656357" lon="4.884092"/>
          <point xsi:type="esdl:Point" lat="54.603737" lon="4.864438"/>
          <point xsi:type="esdl:Point" lat="54.577401" lon="4.844784"/>
          <point xsi:type="esdl:Point" lat="54.524678" lon="4.825131"/>
          <point xsi:type="esdl:Point" lat="54.498291" lon="4.805477"/>
          <point xsi:type="esdl:Point" lat="54.445466" lon="4.785823"/>
          <point xsi:type="esdl:Point" lat="54.419028" lon="4.785823"/>
          <point xsi:type="esdl:Point" lat="54.392573" lon="4.785823"/>
          <point xsi:type="esdl:Point" lat="54.339611" lon="4.76617"/>
          <point xsi:type="esdl:Point" lat="54.313105" lon="4.76617"/>
          <point xsi:type="esdl:Point" lat="54.313105" lon="4.726862"/>
          <point xsi:type="esdl:Point" lat="54.260041" lon="4.687555"/>
          <point xsi:type="esdl:Point" lat="54.260041" lon="4.648247"/>
          <point xsi:type="esdl:Point" lat="54.206908" lon="4.628594"/>
          <point xsi:type="esdl:Point" lat="54.153707" lon="4.60894"/>
          <point xsi:type="esdl:Point" lat="54.153707" lon="4.589286"/>
          <point xsi:type="esdl:Point" lat="54.127081" lon="4.569633"/>
          <point xsi:type="esdl:Point" lat="54.127081" lon="4.549979"/>
          <point xsi:type="esdl:Point" lat="54.073778" lon="4.510672"/>
          <point xsi:type="esdl:Point" lat="54.073778" lon="4.432057"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA7_1" id="CBL_WF_WA7_1" length="111.30754135646252">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="d442f2e2-2c75-47b2-877f-5911fb4694f0" name="InPort" connectedTo="1ff8369a-6c90-4644-b113-ded220e0e743"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="2456b3e8-8111-46d7-8156-b5ef092a06c9" id="5a3eb304-cc11-40ca-983f-dfe7fb1629bf" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.1368242457071" lon="4.01296592482482"/>
          <point xsi:type="esdl:Point" lat="54.1358242457071" lon="4.01296592482482"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA7_2" id="CBL_WF_WA7_2" length="111.30940087924388">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="9c2c85d4-6714-4bb0-b440-ce157dec5e21" name="InPort" connectedTo="f7e8fb62-4d12-46a2-9b11-d63c36c201ba"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="f4887be0-43a6-48f2-a2bc-f939db9f513b" id="fcd1f843-1e47-401e-a203-32cacd518b9a" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.2368242457071" lon="4.01296592482482"/>
          <point xsi:type="esdl:Point" lat="54.2358242457071" lon="4.01296592482482"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_WA7_3" capacity="2000000000.0" id="CBL_WF_WA7_3" length="65495.31213728072">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="051c90dd-181f-4621-b962-7242d6fde9a8" name="InPort" connectedTo="4503eeb3-e820-45c7-8d75-648af982b1e1"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="6da7647d-d0c0-4a34-86ee-02e0a9618618" id="42107817-35f5-41f0-907e-049e9ed33b71" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.339611" lon="4.01933"/>
          <point xsi:type="esdl:Point" lat="54.339611" lon="3.960369"/>
          <point xsi:type="esdl:Point" lat="54.313105" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.286581" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.260041" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.233483" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.206908" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.180316" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.153707" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.127081" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.100438" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.100438" lon="3.980022"/>
          <point xsi:type="esdl:Point" lat="54.073778" lon="3.999676"/>
          <point xsi:type="esdl:Point" lat="54.073778" lon="4.373096"/>
          <point xsi:type="esdl:Point" lat="54.0471" lon="4.39275"/>
          <point xsi:type="esdl:Point" lat="54.0471" lon="4.412403"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_WF_WA7_4" capacity="2000000000.0" id="CBL_WF_WA7_4" length="77140.14964364436">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="e227a5fe-5bfd-44e7-ae77-b3eb46323c08" name="InPort" connectedTo="0ec2352b-e1f4-4b00-8b9a-eb9275c399e5"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="6da7647d-d0c0-4a34-86ee-02e0a9618618" id="04b25823-8ce8-49de-a522-0a81f1605f0a" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.445466" lon="4.01933"/>
          <point xsi:type="esdl:Point" lat="54.445466" lon="3.960369"/>
          <point xsi:type="esdl:Point" lat="54.419028" lon="3.960369"/>
          <point xsi:type="esdl:Point" lat="54.392573" lon="3.960369"/>
          <point xsi:type="esdl:Point" lat="54.3661" lon="3.960369"/>
          <point xsi:type="esdl:Point" lat="54.313105" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.286581" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.260041" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.233483" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.206908" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.180316" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.153707" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.127081" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.100438" lon="3.940715"/>
          <point xsi:type="esdl:Point" lat="54.100438" lon="3.980022"/>
          <point xsi:type="esdl:Point" lat="54.073778" lon="3.999676"/>
          <point xsi:type="esdl:Point" lat="54.073778" lon="4.373096"/>
          <point xsi:type="esdl:Point" lat="54.0471" lon="4.39275"/>
          <point xsi:type="esdl:Point" lat="54.0471" lon="4.412403"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA67_1" id="CBL_WF_WA67_1" length="648.8890908523258">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="63ac9c9f-8500-4a4c-ac1c-1545f5fbc5ca" name="InPort" connectedTo="77aa7a91-417a-4d96-9dcf-81dae0adba69"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="291428fb-d911-49af-bd9a-a57f473b8a12" id="a87527bb-d2ba-4076-a92b-77f2c3b3a11e" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.4358242457071" lon="4.36296592482482"/>
          <point xsi:type="esdl:Point" lat="54.4358242457071" lon="4.35296592482482"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA67_2" id="CBL_WF_WA67_2" length="648.9048945808602">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="e005d189-eade-4db1-b5ce-2cd7b05e257c" name="InPort" connectedTo="efbf6d1e-2edc-4019-83ef-3da04f755170"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="bb1e57ea-5c1c-425a-83a5-e21c753a92c9" id="d92d40a4-5006-4819-9241-0e44a6aa012e" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.434824245707105" lon="4.36296592482482"/>
          <point xsi:type="esdl:Point" lat="54.434824245707105" lon="4.35296592482482"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA67_3" id="CBL_WF_WA67_3" length="648.9206981095434">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="21f2fe6e-bc46-4b8e-ad09-20d5407bf787" name="InPort" connectedTo="e45f3010-e4e6-45b5-83bf-9db0d040ca57"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="71f31b2d-0035-4053-9fbf-5dd425a0241d" id="1c3cf73a-9956-4de3-8523-d563a335b89e" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.43382424570711" lon="4.36296592482482"/>
          <point xsi:type="esdl:Point" lat="54.43382424570711" lon="4.35296592482482"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA67_4" id="CBL_WF_WA67_4" length="648.9365014383717">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="3f107009-d59c-4455-b7be-f36b35ff06c6" name="InPort" connectedTo="e300be1d-20ed-4694-b53b-76e5e8d7e845"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="96616355-a423-41b8-8be9-504ab81b718d" id="adbe185f-3991-4acb-a703-ebd9ed8cefd1" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.43282424570711" lon="4.36296592482482"/>
          <point xsi:type="esdl:Point" lat="54.43282424570711" lon="4.35296592482482"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA67_5" id="CBL_WF_WA67_5" length="648.9523045673398">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="f42e3eb8-13d6-4a2e-916a-67774710ebf8" name="InPort" connectedTo="b9874468-07ef-4d1e-9991-88183896e078"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="afe1b481-7cc3-45aa-94cb-36776529f348" id="66d89a15-411a-433d-a607-8e44b377245f" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.43182424570711" lon="4.36296592482482"/>
          <point xsi:type="esdl:Point" lat="54.43182424570711" lon="4.35296592482482"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_from_HUB_North_to_HUB_DH" capacity="10000000000.0" id="CBL_from_HUB_North_to_HUB_DH" length="157673.86932353032">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="55efd42d-32de-4c8e-9854-baebeeaa70ec" name="InPort" connectedTo="0f9a8562-5571-47c5-a285-e10b6acfed76"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="76b608fd-6fab-4007-bf4a-dbe7a04f525b" id="1c1cb738-0db5-407e-ba4b-fd9073b71796" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.0471" lon="4.412403"/>
          <point xsi:type="esdl:Point" lat="54.020406" lon="4.412403"/>
          <point xsi:type="esdl:Point" lat="53.993694" lon="4.412403"/>
          <point xsi:type="esdl:Point" lat="53.966965" lon="4.412403"/>
          <point xsi:type="esdl:Point" lat="53.940219" lon="4.412403"/>
          <point xsi:type="esdl:Point" lat="53.913456" lon="4.412403"/>
          <point xsi:type="esdl:Point" lat="53.859878" lon="4.373096"/>
          <point xsi:type="esdl:Point" lat="53.833063" lon="4.39275"/>
          <point xsi:type="esdl:Point" lat="53.806231" lon="4.39275"/>
          <point xsi:type="esdl:Point" lat="53.752516" lon="4.432057"/>
          <point xsi:type="esdl:Point" lat="53.752516" lon="4.451711"/>
          <point xsi:type="esdl:Point" lat="53.725632" lon="4.471364"/>
          <point xsi:type="esdl:Point" lat="53.725632" lon="4.491018"/>
          <point xsi:type="esdl:Point" lat="53.698732" lon="4.510672"/>
          <point xsi:type="esdl:Point" lat="53.671814" lon="4.510672"/>
          <point xsi:type="esdl:Point" lat="53.644879" lon="4.510672"/>
          <point xsi:type="esdl:Point" lat="53.617926" lon="4.530325"/>
          <point xsi:type="esdl:Point" lat="53.590957" lon="4.530325"/>
          <point xsi:type="esdl:Point" lat="53.56397" lon="4.549979"/>
          <point xsi:type="esdl:Point" lat="53.56397" lon="4.687555"/>
          <point xsi:type="esdl:Point" lat="53.536966" lon="4.707208"/>
          <point xsi:type="esdl:Point" lat="53.536966" lon="4.726862"/>
          <point xsi:type="esdl:Point" lat="53.509945" lon="4.726862"/>
          <point xsi:type="esdl:Point" lat="53.455851" lon="4.76617"/>
          <point xsi:type="esdl:Point" lat="53.428778" lon="4.76617"/>
          <point xsi:type="esdl:Point" lat="53.401688" lon="4.785823"/>
          <point xsi:type="esdl:Point" lat="53.37458" lon="4.785823"/>
          <point xsi:type="esdl:Point" lat="53.37458" lon="4.805477"/>
          <point xsi:type="esdl:Point" lat="53.347456" lon="4.825131"/>
          <point xsi:type="esdl:Point" lat="53.320314" lon="4.825131"/>
          <point xsi:type="esdl:Point" lat="53.265978" lon="4.805477"/>
          <point xsi:type="esdl:Point" lat="53.211573" lon="4.844784"/>
          <point xsi:type="esdl:Point" lat="53.211573" lon="4.864438"/>
          <point xsi:type="esdl:Point" lat="53.184345" lon="4.864438"/>
          <point xsi:type="esdl:Point" lat="53.129836" lon="4.903745"/>
          <point xsi:type="esdl:Point" lat="53.102556" lon="4.903745"/>
          <point xsi:type="esdl:Point" lat="53.047943" lon="4.864438"/>
          <point xsi:type="esdl:Point" lat="53.047943" lon="4.825131"/>
          <point xsi:type="esdl:Point" lat="53.020611" lon="4.825131"/>
          <point xsi:type="esdl:Point" lat="53.020611" lon="4.785823"/>
          <point xsi:type="esdl:Point" lat="52.965894" lon="4.746516"/>
          <point xsi:type="esdl:Point" lat="52.965894" lon="4.726862"/>
          <point xsi:type="esdl:Point" lat="52.93851" lon="4.726862"/>
          <point xsi:type="esdl:Point" lat="52.911109" lon="4.707208"/>
          <point xsi:type="esdl:Point" lat="52.911109" lon="4.746516"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="10000000000.0" name="CBL_from_HUB_DH_to_HUB_NL" id="CBL_from_HUB_DH_to_HUB_NL" length="92097.71220047632">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="f54ccb29-2b5f-4f19-b274-99f788babf22" name="InPort" connectedTo="b574991d-2cd3-476a-be9d-28df17f8b5db"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" id="7f983f6d-97e9-4c5a-bc08-8133bf184d95" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.88167" lon="4.70947"/>
          <point xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57833421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" name="CBL_from_HUB_North_to_HUB_IJVER" capacity="10000000000.0" id="CBL_from_HUB_North_to_HUB_IJVER" length="203242.49714295115">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="e1af0404-7344-41c0-8e41-51216d262338" name="InPort" connectedTo="0f9a8562-5571-47c5-a285-e10b6acfed76"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="ac377413-0431-4d63-8a4a-475e5faba1bb" id="517efaa7-2504-48df-af37-12e5eac491d7" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.0471" lon="4.412403"/>
          <point xsi:type="esdl:Point" lat="54.020406" lon="4.412403"/>
          <point xsi:type="esdl:Point" lat="53.940219" lon="4.353442"/>
          <point xsi:type="esdl:Point" lat="53.940219" lon="4.333789"/>
          <point xsi:type="esdl:Point" lat="53.833063" lon="4.255174"/>
          <point xsi:type="esdl:Point" lat="53.833063" lon="4.215866"/>
          <point xsi:type="esdl:Point" lat="53.806231" lon="4.196213"/>
          <point xsi:type="esdl:Point" lat="53.752516" lon="4.176559"/>
          <point xsi:type="esdl:Point" lat="53.698732" lon="4.137252"/>
          <point xsi:type="esdl:Point" lat="53.644879" lon="4.117598"/>
          <point xsi:type="esdl:Point" lat="53.590957" lon="4.097944"/>
          <point xsi:type="esdl:Point" lat="53.56397" lon="4.097944"/>
          <point xsi:type="esdl:Point" lat="53.536966" lon="4.097944"/>
          <point xsi:type="esdl:Point" lat="53.509945" lon="4.097944"/>
          <point xsi:type="esdl:Point" lat="53.482907" lon="4.097944"/>
          <point xsi:type="esdl:Point" lat="53.455851" lon="4.097944"/>
          <point xsi:type="esdl:Point" lat="53.401688" lon="4.078291"/>
          <point xsi:type="esdl:Point" lat="53.347456" lon="4.058637"/>
          <point xsi:type="esdl:Point" lat="53.320314" lon="4.058637"/>
          <point xsi:type="esdl:Point" lat="53.293154" lon="4.058637"/>
          <point xsi:type="esdl:Point" lat="53.238784" lon="4.038983"/>
          <point xsi:type="esdl:Point" lat="53.238784" lon="4.058637"/>
          <point xsi:type="esdl:Point" lat="53.184345" lon="4.097944"/>
          <point xsi:type="esdl:Point" lat="53.157099" lon="4.097944"/>
          <point xsi:type="esdl:Point" lat="53.129836" lon="4.117598"/>
          <point xsi:type="esdl:Point" lat="53.102556" lon="4.117598"/>
          <point xsi:type="esdl:Point" lat="53.075258" lon="4.137252"/>
          <point xsi:type="esdl:Point" lat="53.047943" lon="4.137252"/>
          <point xsi:type="esdl:Point" lat="52.965894" lon="4.196213"/>
          <point xsi:type="esdl:Point" lat="52.93851" lon="4.196213"/>
          <point xsi:type="esdl:Point" lat="52.911109" lon="4.196213"/>
          <point xsi:type="esdl:Point" lat="52.88369" lon="4.196213"/>
          <point xsi:type="esdl:Point" lat="52.88369" lon="4.215866"/>
          <point xsi:type="esdl:Point" lat="52.8288" lon="4.255174"/>
          <point xsi:type="esdl:Point" lat="52.8288" lon="4.314135"/>
          <point xsi:type="esdl:Point" lat="52.801329" lon="4.333789"/>
          <point xsi:type="esdl:Point" lat="52.801329" lon="4.373096"/>
          <point xsi:type="esdl:Point" lat="52.746335" lon="4.412403"/>
          <point xsi:type="esdl:Point" lat="52.718812" lon="4.412403"/>
          <point xsi:type="esdl:Point" lat="52.691271" lon="4.432057"/>
          <point xsi:type="esdl:Point" lat="52.691271" lon="4.451711"/>
          <point xsi:type="esdl:Point" lat="52.608545" lon="4.510672"/>
          <point xsi:type="esdl:Point" lat="52.608545" lon="4.530325"/>
          <point xsi:type="esdl:Point" lat="52.553308" lon="4.569633"/>
          <point xsi:type="esdl:Point" lat="52.525663" lon="4.569633"/>
          <point xsi:type="esdl:Point" lat="52.498001" lon="4.589286"/>
          <point xsi:type="esdl:Point" lat="52.442624" lon="4.569633"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="10000000000.0" name="CBL_from_HUB_IJVER_to_HUB_NL" id="CBL_from_HUB_IJVER_to_HUB_NL" length="72319.37127020082">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="c7c10fb8-f00f-4cac-ac64-ee105d6ffb01" name="InPort" connectedTo="5021fc2e-78da-4b93-8173-8c34be115726"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" id="57157d59-876a-4951-9b4b-6a34f7fd0cf3" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.453695" lon="4.572916"/>
          <point xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57833421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_HUB_EEM_NL" id="CBL_HUB_EEM_NL" length="157633.65058501824">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="d78a30fc-550b-4a79-87e2-494e07132a60" name="InPort" connectedTo="20000b88-ed2c-46ca-97e9-7bae2615212c"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" id="d1a30fe8-7610-4b24-9e86-9270c238b43c" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.4412004792261" lon="6.8329384440276"/>
          <point xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57833421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_HUB_BSL_NL" id="CBL_HUB_BSL_NL" length="156378.40413165404">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="9bb7127b-9fce-4da1-aa3e-b58515557676" name="InPort" connectedTo="e456d921-1e4e-4613-a4da-bf1043c6f645"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" id="06461582-7c22-4cd2-9c1b-4eafcb05890a" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.4249245845624" lon="3.73640092624319"/>
          <point xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57833421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_HUB_MVL_NL" id="CBL_HUB_MVL_NL" length="111985.49215626152">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="0f20d0bc-6e25-4960-aa9c-fadafbb719a6" name="InPort" connectedTo="7da7c050-fe3a-4691-b581-5aa461240877"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" id="0d1d3ea3-f647-4233-9f35-2e66bee5c388" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.9670419650243" lon="4.00765977271238"/>
          <point xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57833421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_HUB_GTB_NL" id="CBL_HUB_GTB_NL" length="79137.62221241374">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="787697ec-0701-4a8d-a252-2b895370c900" name="InPort" connectedTo="51005509-1e15-40ec-b8e9-0a0d15269a6b"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" id="c2d4be73-48fd-4f30-815c-f741a645db09" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.7029849705477" lon="4.83367631576912"/>
          <point xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57833421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="13009.420827117965" capacity="2000000000.0" name="PIPE_EL_WA67_1_22" id="PIPE_EL_WA67_1_22" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="131d016c-b25b-47c5-a547-1c02ef45040a" name="InPort" connectedTo="a4b0bc09-cb61-4b1e-8066-4abc055ac393"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="70c760fe-a161-439f-b9dd-d6d9d30779e8" id="46583104-b837-438b-90a1-ac0c67eb3b4e" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.4358242457071" lon="4.35296592482482"/>
          <point xsi:type="esdl:Point" lat="54.536824245707095" lon="4.4539659248248205"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="13105.776906255374" capacity="2000000000.0" name="PIPE_EL_WA67_2_23" id="PIPE_EL_WA67_2_23" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="2191949e-5e2a-49ec-a3ea-82470511e183" name="InPort" connectedTo="b9789ad4-64a4-4a4c-ac9b-9a48d6264284"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="70c760fe-a161-439f-b9dd-d6d9d30779e8" id="71a057e8-9922-41e9-967e-204fd5993201" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.434824245707105" lon="4.35296592482482"/>
          <point xsi:type="esdl:Point" lat="54.536824245707095" lon="4.4539659248248205"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="13202.368240292108" capacity="2000000000.0" name="PIPE_EL_WA67_3_24" id="PIPE_EL_WA67_3_24" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="59f37df5-5379-4705-aea0-ad89f69b8c36" name="InPort" connectedTo="7dad5443-1a72-4e97-9b79-9eed5b4b3923"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="70c760fe-a161-439f-b9dd-d6d9d30779e8" id="34aabc6b-6c04-482a-bbbc-23ae914bd5c9" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.43382424570711" lon="4.35296592482482"/>
          <point xsi:type="esdl:Point" lat="54.536824245707095" lon="4.4539659248248205"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="13299.18970282878" capacity="2000000000.0" name="PIPE_EL_WA67_4_25" id="PIPE_EL_WA67_4_25" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="4cfd2d56-5d3d-4fbc-951e-061ccdd7dbbe" name="InPort" connectedTo="136af978-dd06-43bf-91f2-5a0d6cf7ddcc"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="70c760fe-a161-439f-b9dd-d6d9d30779e8" id="570f19cd-1b9f-48c0-97d1-a975f81340ab" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.43282424570711" lon="4.35296592482482"/>
          <point xsi:type="esdl:Point" lat="54.536824245707095" lon="4.4539659248248205"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="13396.236303634332" capacity="2000000000.0" name="PIPE_EL_WA67_5_26" id="PIPE_EL_WA67_5_26" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="a2e0032a-cb43-4e8b-a9b2-ddc045505b9f" name="InPort" connectedTo="aaf3bc8b-6906-4a04-baeb-199910e9d726"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="70c760fe-a161-439f-b9dd-d6d9d30779e8" id="dfcff336-b5a0-487f-897f-ae09f5735870" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.43182424570711" lon="4.35296592482482"/>
          <point xsi:type="esdl:Point" lat="54.536824245707095" lon="4.4539659248248205"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="92096.86422360467" capacity="18000000000.0" name="PIPE_HUB_EEM_NL_27" id="PIPE_HUB_EEM_NL_27" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="97a66417-099a-4915-a5d8-253cc4803c91" name="InPort" connectedTo="5fd303ba-6e43-4ade-a48f-849f95e12865"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="c2893771-352a-4445-97af-48e952142f52" id="848902ef-4f4e-4635-8997-c47122a883ed" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.88267" lon="4.71047"/>
          <point xsi:type="esdl:Point" lat="52.246546908884895" lon="5.57933421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="157632.62806396323" capacity="2500000000.0" name="PIPE_HUB_EEM_NL_28" id="PIPE_HUB_EEM_NL_28" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="80787752-e15e-4bf5-a9f2-fe33cc136dc6" name="InPort" connectedTo="e200f7ec-1b15-4b6d-beec-95384be1c48f"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="c2893771-352a-4445-97af-48e952142f52" id="3774a468-078a-4374-87e9-103025995b1a" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.442200479226095" lon="6.8339384440276"/>
          <point xsi:type="esdl:Point" lat="52.246546908884895" lon="5.57933421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="232.78868041457883" capacity="100000000000.0" name="PIPE_from_HUB_NL_to_H2_Demand_30" id="PIPE_from_HUB_NL_to_H2_Demand_30" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="c43f01bf-9f64-4103-990c-91e5e193baeb" name="InPort" connectedTo="be9c9746-2ea3-4375-90fd-469ae6e7f287"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="1b9ed795-35a4-430e-aa0c-8b4c8b4e943a" id="e82b7e08-d7d1-4ba3-a692-8ec47bc0f27c" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.246546908884895" lon="5.57933421552437"/>
          <point xsi:type="esdl:Point" lat="52.2485469088849" lon="5.58033421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_from_HUB_NL_to_EL_Demand" id="CBL_from_HUB_NL_to_EL_Demand" length="130.56291596954688">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="2b2e1eb7-5d98-43a1-af0e-64d0b406dfde" name="InPort" connectedTo="2ea57f1a-e4ed-43d7-9c75-57ca2cb530d7"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="d003ad2a-4aef-4177-a572-b0d62f26768b" id="6b4c1614-6f67-42bb-83bc-21519014cb1d" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57833421552437"/>
          <point xsi:type="esdl:Point" lat="52.2445469088849" lon="5.57933421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="222.54410358630972" capacity="100000000000.0" name="PIPE_from_HUB_NL_to_Hydrogen export_31" id="PIPE_from_HUB_NL_to_Hydrogen export_31" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="ae00a201-9484-4d6b-a163-8c07004c1e1c" name="InPort" connectedTo="be9c9746-2ea3-4375-90fd-469ae6e7f287"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="ad541129-c483-47ee-a933-e1153863faa0" id="0d4e6a93-1832-4fdf-9f6e-791affb55a90" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.246546908884895" lon="5.57933421552437"/>
          <point xsi:type="esdl:Point" lat="52.2485469088849" lon="5.57933421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_from_HUB_NL_to_Electricity export" id="CBL_from_HUB_NL_to_Electricity export" length="176.18831748752143">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="e01ac45a-56d6-4a54-ba48-e6edc88ef99e" name="InPort" connectedTo="2ea57f1a-e4ed-43d7-9c75-57ca2cb530d7"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="c30b0d56-208e-40a3-8192-754012432fd3" id="dc9f3802-31fb-4e9f-bc24-3ceeffc3d2c7" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57833421552437"/>
          <point xsi:type="esdl:Point" lat="52.2445469088849" lon="5.58033421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" length="136.6001674844928" capacity="100000000000.0" name="PIPE_from_H2-Import_to_HUB_NL_32" id="PIPE_from_H2-Import_to_HUB_NL_32" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="f53d7843-13cc-4730-99e5-926703d0a28c" name="InPort" connectedTo="050d00ac-d6f6-4a40-82bd-71219b1ab894"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="c2893771-352a-4445-97af-48e952142f52" id="7a952945-9b3e-4a37-bcb4-0b960607b4d8" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.2465469088849" lon="5.58133421552437"/>
          <point xsi:type="esdl:Point" lat="52.246546908884895" lon="5.57933421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_from_Elecimport_to_HUB_NL" id="CBL_from_Dispatchable_NL_to_HUB_NL" length="68.30161923097194">
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" id="6db85928-a23e-41f7-bb34-7c690346aabf" name="InPort" connectedTo="c66e3012-034c-4420-aa7b-e21bf2ddf483"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" id="d81dc4e4-00dd-44c6-b224-ea3320235871" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57933421552437"/>
          <point xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57833421552437"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="34856.905520034365" state="OPTIONAL" name="Pipe_from_EL_DDW-West_to_Noordgastransport B_V__34" id="Pipe_from_EL_DDW-West_to_Noordgastransport B_V__34" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="197fee08-cdd5-4083-9344-54aac48d14a6" name="InPort" connectedTo="98bf4b7f-c432-42ec-8f23-b1394bda20c1"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="d4b4fd92-39e2-45f0-ae93-2d063017ec20" id="c7376b98-8a91-4f67-b9f7-f8295fe24a68" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.357996" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.344953" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.331906" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.318855" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.3058" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.29274" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.279677" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.266609" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.253537" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.240461" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.22738" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.214296" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.201208" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.188115" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.175018" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.161917" lon="5.434423"/>
          <point xsi:type="esdl:Point" lat="54.148812" lon="5.434423"/>
          <point xsi:type="esdl:Point" lat="54.135703" lon="5.434423"/>
          <point xsi:type="esdl:Point" lat="54.122589" lon="5.434423"/>
          <point xsi:type="esdl:Point" lat="54.109472" lon="5.434423"/>
          <point xsi:type="esdl:Point" lat="54.09635" lon="5.434423"/>
          <point xsi:type="esdl:Point" lat="54.083224" lon="5.434423"/>
          <point xsi:type="esdl:Point" lat="54.070094" lon="5.434423"/>
          <point xsi:type="esdl:Point" lat="54.05696" lon="5.434423"/>
          <point xsi:type="esdl:Point" lat="54.048902" lon="5.438709"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="13923.568616710847" state="OPTIONAL" name="Pipe_from_EL_TNW_to_Noordgastransport B_V__35" id="Pipe_from_EL_TNW_to_Noordgastransport B_V__35" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="ce2dea55-7b95-4072-855c-fa50c5a98a52" name="InPort" connectedTo="40cfc20a-1352-4441-9923-c28bc39b2ab5"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="d4b4fd92-39e2-45f0-ae93-2d063017ec20" id="a0cd4417-48dd-491b-b816-769d224e53fe" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.043822" lon="5.648749"/>
          <point xsi:type="esdl:Point" lat="54.043822" lon="5.452283"/>
          <point xsi:type="esdl:Point" lat="54.048902" lon="5.438709"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="11004.801224048206" state="OPTIONAL" name="Pipe_from_None_to_HUB_EEM_36" id="Pipe_from_None_to_HUB_EEM_36" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="9b29ebb4-ed69-436b-8329-b5361baa69af" name="InPort" connectedTo="6e821ce5-138b-4100-ae20-42e5c4bca7a3"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="d983e894-c523-40fc-9ee6-3eab7a40cefb" id="78358c98-b6e7-457d-b219-efe06cf84d46" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.46683" lon="6.688902"/>
          <point xsi:type="esdl:Point" lat="53.474935" lon="6.702519"/>
          <point xsi:type="esdl:Point" lat="53.474935" lon="6.791822"/>
          <point xsi:type="esdl:Point" lat="53.448287" lon="6.827543"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="1.4988634370852418" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__37" id="Pipe_from_None_to_Noordgastransport B_V__37" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="1f667ad9-187c-4c8a-8b9d-1cbf5222baf3" name="InPort" connectedTo="3e73f2c5-5936-4950-be17-3aecf5cfcac9"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" id="5585cabb-c443-46d9-bf22-995d99517849" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.555121" lon="5.949331"/>
          <point xsi:type="esdl:Point" lat="53.555126" lon="5.94931"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_14" id="Joint_14">
        <geometry xsi:type="esdl:Point" lat="53.46683" lon="6.688902"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="24bbeb1d-cee8-49cd-beaf-9a85219355af" name="InPort" connectedTo="71f64b37-a1e2-4966-a2f6-e543b8e714ca"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="9b29ebb4-ed69-436b-8329-b5361baa69af aa1b50c9-b3e2-4b4e-b037-f0b4081f5cd8" id="6e821ce5-138b-4100-ae20-42e5c4bca7a3" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="2217.176270831458" state="OPTIONAL" name="Pipe_from_HUB_WA67_to_None_38" id="Pipe_from_HUB_WA67_to_None_38" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="708bda88-0762-46ca-95ae-82a0d207c81f" name="InPort" connectedTo="7c9a6009-603c-465d-9e34-47b9115f3cbc"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="d9a9a8c3-6154-4dcf-83fd-f57832550d99" id="4d3208f8-4cff-4b30-9f48-a2db71b62e41" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.537882" lon="4.454942"/>
          <point xsi:type="esdl:Point" lat="54.537882" lon="4.489196"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="39328.428276323044" state="OPTIONAL" name="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__39" id="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__39" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="bba8747b-dd1d-4919-93dd-1d33637adae1" name="InPort" connectedTo="15721123-3361-4544-b91a-b993fd36bd86"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="c5e20e4d-5de1-4557-b9b1-007903b99d8b" id="629add5d-f681-4c71-b43e-bf7a309da109" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.537882" lon="4.489196"/>
          <point xsi:type="esdl:Point" lat="54.584543" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="54.607854" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="54.631151" lon="4.591957"/>
          <point xsi:type="esdl:Point" lat="54.654435" lon="4.591957"/>
          <point xsi:type="esdl:Point" lat="54.700963" lon="4.660464"/>
          <point xsi:type="esdl:Point" lat="54.724207" lon="4.660464"/>
          <point xsi:type="esdl:Point" lat="54.852871" lon="4.696465"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="91436.49428250964" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__40" id="Pipe_from_None_to_Noordgastransport B_V__40" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="3bd7a025-d135-4802-9944-aff10666ea9f" name="InPort" connectedTo="15721123-3361-4544-b91a-b993fd36bd86"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="d4b4fd92-39e2-45f0-ae93-2d063017ec20" id="4e8d7496-29b5-4c75-9a16-e4be70427615" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.537882" lon="4.489196"/>
          <point xsi:type="esdl:Point" lat="54.537882" lon="4.52345"/>
          <point xsi:type="esdl:Point" lat="54.327244" lon="4.831733"/>
          <point xsi:type="esdl:Point" lat="54.327244" lon="4.865986"/>
          <point xsi:type="esdl:Point" lat="54.303773" lon="4.90024"/>
          <point xsi:type="esdl:Point" lat="54.303773" lon="5.071508"/>
          <point xsi:type="esdl:Point" lat="54.280289" lon="5.105762"/>
          <point xsi:type="esdl:Point" lat="54.280289" lon="5.140016"/>
          <point xsi:type="esdl:Point" lat="54.186217" lon="5.277031"/>
          <point xsi:type="esdl:Point" lat="54.162666" lon="5.277031"/>
          <point xsi:type="esdl:Point" lat="54.139101" lon="5.277031"/>
          <point xsi:type="esdl:Point" lat="54.115523" lon="5.277031"/>
          <point xsi:type="esdl:Point" lat="54.091931" lon="5.311284"/>
          <point xsi:type="esdl:Point" lat="54.091931" lon="5.345538"/>
          <point xsi:type="esdl:Point" lat="54.044707" lon="5.414045"/>
          <point xsi:type="esdl:Point" lat="54.048902" lon="5.438709"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="24114.76024541212" state="OPTIONAL" name="Pipe_from_EL_WA6_2_to_None_41" id="Pipe_from_EL_WA6_2_to_None_41" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="4dc33e7c-144c-494a-b038-5e43e1af5647" name="InPort" connectedTo="1d3d7488-d22d-42a5-a3f7-8581480d896f"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="28e508a7-e7a5-419e-ac6f-2de2432c1e6e" id="88c9bcc4-1169-47ef-ba72-ef3b5d36ab4f" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.374146" lon="4.626211"/>
          <point xsi:type="esdl:Point" lat="54.327244" lon="4.694718"/>
          <point xsi:type="esdl:Point" lat="54.303773" lon="4.694718"/>
          <point xsi:type="esdl:Point" lat="54.280289" lon="4.694718"/>
          <point xsi:type="esdl:Point" lat="54.209755" lon="4.797479"/>
          <point xsi:type="esdl:Point" lat="54.203709" lon="4.821481"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="19292.16986031561" state="OPTIONAL" name="Pipe_from_EL_WA7_2_to_Wintershall Noordzee B_V__42" id="Pipe_from_EL_WA7_2_to_Wintershall Noordzee B_V__42" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="a0d2cc66-12ce-4547-b3ee-fb3b118560bb" name="InPort" connectedTo="d7830f7f-5633-4003-970b-8826640d8428"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="de7ecb04-9fdf-48a3-928f-86ddb7630aa3" id="27a0e3aa-15af-4825-b89a-e618f6234874" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.23328" lon="4.009644"/>
          <point xsi:type="esdl:Point" lat="54.23328" lon="3.975391"/>
          <point xsi:type="esdl:Point" lat="54.209755" lon="3.941137"/>
          <point xsi:type="esdl:Point" lat="54.186217" lon="3.941137"/>
          <point xsi:type="esdl:Point" lat="54.162666" lon="3.941137"/>
          <point xsi:type="esdl:Point" lat="54.139101" lon="3.941137"/>
          <point xsi:type="esdl:Point" lat="54.115523" lon="3.975391"/>
          <point xsi:type="esdl:Point" lat="54.115523" lon="4.009644"/>
          <point xsi:type="esdl:Point" lat="54.115239" lon="4.010461"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="32807.02965308978" state="OPTIONAL" name="Pipe_from_EL_WA6_1_to_None_43" id="Pipe_from_EL_WA6_1_to_None_43" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="bbf18bde-a0ea-43f1-b2e8-eb6283d6ce45" name="InPort" connectedTo="35d5b2eb-e471-4480-89b8-fd37c0fc434c"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="0e95b210-95b6-40fa-b67f-d920431a02e7" id="fe89871a-d4e2-4f59-99ca-a9cefa2ea886" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.23328" lon="4.52345"/>
          <point xsi:type="esdl:Point" lat="54.209755" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="54.186217" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="54.162666" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="54.139101" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="54.115523" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="54.091931" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="54.068326" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="54.044707" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="54.021075" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="53.99743" lon="4.557703"/>
          <point xsi:type="esdl:Point" lat="53.973771" lon="4.52345"/>
          <point xsi:type="esdl:Point" lat="53.960646" lon="4.496977"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="2656.5534853998856" state="OPTIONAL" name="Pipe_from_EL_WA7_1_to_Wintershall Noordzee B_V__44" id="Pipe_from_EL_WA7_1_to_Wintershall Noordzee B_V__44" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="e64ba077-a319-41ae-8094-c9ddd101d1f8" name="InPort" connectedTo="c20d1878-0918-402c-88a2-57718891a311"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="de7ecb04-9fdf-48a3-928f-86ddb7630aa3" id="5447f116-9180-4b1e-b122-59bc9017dcbc" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.139101" lon="4.009644"/>
          <point xsi:type="esdl:Point" lat="54.115239" lon="4.010461"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="9995.283670332692" state="OPTIONAL" name="Pipe_from_None_to_HUB_EEM_45" id="Pipe_from_None_to_HUB_EEM_45" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="aa1b50c9-b3e2-4b4e-b037-f0b4081f5cd8" name="InPort" connectedTo="6e821ce5-138b-4100-ae20-42e5c4bca7a3"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="d983e894-c523-40fc-9ee6-3eab7a40cefb" id="d6eb76e1-4fe1-4728-944e-8554d2efc7ce" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.46683" lon="6.688902"/>
          <point xsi:type="esdl:Point" lat="53.473825" lon="6.715685"/>
          <point xsi:type="esdl:Point" lat="53.473825" lon="6.784193"/>
          <point xsi:type="esdl:Point" lat="53.449869" lon="6.818446"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="5346.8328843089475" state="OPTIONAL" name="Pipe_from_None_to_HUB_DH_46" id="Pipe_from_None_to_HUB_DH_46" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="b0530675-75a3-4ff9-bd75-9f7bc81c7299" name="InPort" connectedTo="dd4171d8-8603-40ac-b5d7-1c5af9b6d16b"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="3c8f54e4-2ead-43ac-a3ae-dba1a7ded678" id="59cf3bc0-9096-43ba-8206-0db3a4dfe3e4" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.881677" lon="4.709403"/>
          <point xsi:type="esdl:Point" lat="52.895158" lon="4.694718"/>
          <point xsi:type="esdl:Point" lat="52.919425" lon="4.728972"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="2237.3431423619786" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__47" id="Pipe_from_None_to_Noordgastransport B_V__47" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="7e8234fa-8b72-4bf5-aef7-d860e4feb3e4" name="InPort" connectedTo="41829d65-271e-4f8f-90ae-3281dc305c20"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="455a7611-d5a3-492e-81d0-338f680f8b78" id="4400f9db-e694-4529-a7aa-50bd26e5000f" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.94273" lon="3.621734"/>
          <point xsi:type="esdl:Point" lat="53.950099" lon="3.632854"/>
          <point xsi:type="esdl:Point" lat="53.943743" lon="3.619254"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="25.313206694858113" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__48" id="Pipe_from_None_to_Noordgastransport B_V__48" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="780755d7-4e58-4389-a447-ac7375882494" name="InPort" connectedTo="6b368901-7cfb-4a28-ae30-272a209477b3"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="51d6770d-910a-4c74-9edb-eb3e8f7de13a" id="f9c822e5-d0a1-47d6-92eb-8b195ea77be4" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.401823" lon="4.201876"/>
          <point xsi:type="esdl:Point" lat="53.402006" lon="4.202102"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="1.4988634370852418" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__49" id="Pipe_from_None_to_Noordgastransport B_V__49" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="d9de5591-8807-4933-b7f8-a1c17618a881" name="InPort" connectedTo="3e73f2c5-5936-4950-be17-3aecf5cfcac9"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" id="d0dd14e7-aeed-41ca-a3ea-6b457d77a07a" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.555121" lon="5.949331"/>
          <point xsi:type="esdl:Point" lat="53.555126" lon="5.94931"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__50" id="Pipe_from_None_to_Noordgastransport B_V__50" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="cd05622c-a30c-4100-8e78-6f9bacf67340" name="InPort" connectedTo="1f7025c6-e9fb-4eea-a716-98a284654c6d"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="bbd74c33-142e-4cf5-aab5-eebbfd8108be" id="654ed160-0251-4135-bac6-43e24af3a238" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.405017" lon="4.78827"/>
          <point xsi:type="esdl:Point" lat="53.405017" lon="4.78827"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__51" id="Pipe_from_None_to_Noordgastransport B_V__51" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="4ba2a6aa-70e6-45ed-949a-40edec05acdc" name="InPort" connectedTo="3e73f2c5-5936-4950-be17-3aecf5cfcac9"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" id="1fa00c80-e559-4280-a6e9-f203a664d43c" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.555126" lon="5.94931"/>
          <point xsi:type="esdl:Point" lat="53.555126" lon="5.94931"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__52" id="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__52" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="814c95a3-f68a-4a3e-903a-16cd15abaf88" name="InPort" connectedTo="9f00e816-b71b-45dd-8a63-98a89f22722c"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="28e508a7-e7a5-419e-ac6f-2de2432c1e6e" id="7e7fe984-943e-43cf-8e05-0ab6676f66c4" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.203709" lon="4.821481"/>
          <point xsi:type="esdl:Point" lat="54.203709" lon="4.821481"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="0.12921662522904814" state="OPTIONAL" name="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__53" id="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__53" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="503dbe3c-87b2-4aaf-a620-c442e80cff7d" name="InPort" connectedTo="558ea8ce-86e5-4473-bfc4-22f3f6bf822b"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="0e95b210-95b6-40fa-b67f-d920431a02e7" id="b0e8a50d-78c8-4154-b2cb-8017d34ed860" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.960646" lon="4.496977"/>
          <point xsi:type="esdl:Point" lat="53.960645" lon="4.496978"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__54" id="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__54" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="7071e28f-4a7b-46e9-8fbd-1e59502da5f9" name="InPort" connectedTo="aaee02c4-d5f8-4f98-920f-48451f1ddf98"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="d58eff17-c715-4cd9-9267-0254b2a93593" id="9cd8b8c4-e253-4c87-b590-b69252497a2f" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.827442" lon="4.347239"/>
          <point xsi:type="esdl:Point" lat="53.827442" lon="4.347239"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__55" id="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__55" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="a60af722-5bd2-4c07-8089-4bd54f7f96c1" name="InPort" connectedTo="1f7025c6-e9fb-4eea-a716-98a284654c6d"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="bbd74c33-142e-4cf5-aab5-eebbfd8108be" id="970d8056-3e04-4bf8-a670-d8cbd60bbab1" name="OutPort"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.405148" lon="4.788172"/>
          <point xsi:type="esdl:Point" lat="53.405148" lon="4.788172"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_15" id="Joint_15">
        <geometry xsi:type="esdl:Point" lat="54.537882" lon="4.489196"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="d9a9a8c3-6154-4dcf-83fd-f57832550d99" name="InPort" connectedTo="4d3208f8-4cff-4b30-9f48-a2db71b62e41"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="bba8747b-dd1d-4919-93dd-1d33637adae1 3bd7a025-d135-4802-9944-aff10666ea9f" id="15721123-3361-4544-b91a-b993fd36bd86" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_16" id="Joint_16">
        <geometry xsi:type="esdl:Point" lat="54.115239" lon="4.010461"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="de7ecb04-9fdf-48a3-928f-86ddb7630aa3" name="InPort" connectedTo="27a0e3aa-15af-4825-b89a-e618f6234874 5447f116-9180-4b1e-b122-59bc9017dcbc"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="1aaad9fd-a888-4877-b634-3311c239fcef" id="a3c5edd6-6081-4f7f-a852-29f1f6eb4111" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_17" id="Joint_17">
        <geometry xsi:type="esdl:Point" lat="52.881677" lon="4.709403"/>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" id="4bbab8d2-9fc5-4f4a-be67-fb829963f2ec" name="InPort" connectedTo="66482701-4935-405e-a995-d30d40a614fd"/>
        <port xsi:type="esdl:OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" connectedTo="b0530675-75a3-4ff9-bd75-9f7bc81c7299" id="dd4171d8-8603-40ac-b5d7-1c5af9b6d16b" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="1000000000.0" name="Fake_Gas_demand_1" id="Fake_Gas_demand_1">
        <geometry xsi:type="esdl:Point" lat="53.822459437777496" lon="2.944181790308763"/>
        <costInformation xsi:type="esdl:CostInformation" id="0221f498-314f-47d5-a2ff-0c9eb4fd5c2b">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="82e41c26-eb18-4f2c-abcf-fdecc52c7590" name="Fake_Gas_demand_1_marginalcost"/>
        </costInformation>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="77427ca6-a5f7-47de-9f95-4fb5fc323a80" connectedTo="57d28c16-00a5-4461-a883-ed4c898a7e3d"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="1000000000.0" name="Fake_Gas_demand_2" id="Fake_Gas_demand_2">
        <geometry xsi:type="esdl:Point" lat="54.32485214075063" lon="2.935542648293768"/>
        <costInformation xsi:type="esdl:CostInformation" id="151bc5cf-61fc-413e-9521-48541b4376c9">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="06f4ab28-b9e0-4d8a-ae92-99784e557cf6" name="Fake_Gas_demand_2_marginalcost"/>
        </costInformation>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="d6d8796d-94db-4624-bd8e-ccf69251cb85" connectedTo="971a5f2c-d76a-4d03-bb6c-63bcf03ce116"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="1000000000.0" name="Fake_Gas_demand_3" id="Fake_Gas_demand_3">
        <geometry xsi:type="esdl:Point" lat="52.88101557489764" lon="4.716143743685924"/>
        <costInformation xsi:type="esdl:CostInformation" id="9ebcf910-be77-48bb-a89c-6cd38d8a4af6">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="86cdab60-6b4f-45c2-bba6-fead05fc3d3e" name="Fake_Gas_demand_3_marginalcost"/>
        </costInformation>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="ad2e264c-42a9-486e-8b62-18e9bf02f1e1" connectedTo="a9d5c219-ce78-435d-9859-422104f6ac5f"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="1000000000.0" name="Fake_Gas_demand_4" id="Fake_Gas_demand_4">
        <geometry xsi:type="esdl:Point" lat="55.70613029568726" lon="4.75507353963736"/>
        <costInformation xsi:type="esdl:CostInformation" id="19671112-6971-4afd-8d95-28bf01e879fc">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="d57ece0b-b317-413c-a925-d51c106788e8" name="Fake_Gas_demand_4_marginalcost"/>
        </costInformation>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="986bf6f0-516c-4799-85a4-7d61715ea2c0" connectedTo="098cf51b-110e-4249-905b-974371312acb"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="1000000000.0" name="Fake_Gas_demand_5" id="Fake_Gas_demand_5">
        <geometry xsi:type="esdl:Point" lat="55.79063767887756" lon="3.9928878168373534"/>
        <costInformation xsi:type="esdl:CostInformation" id="c6b88342-5e09-48ff-b8c6-4af1292214a6">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="e48bf551-0a1b-4bc7-ac07-76f1fd6bd211" name="Fake_Gas_demand_5_marginalcost"/>
        </costInformation>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="b5983290-319d-4fcf-b7d4-579580049c4c" connectedTo="8c53cd42-cbad-4760-9781-c7c7aa172116"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="1000000000.0" name="Fake_Gas_demand_6" id="Fake_Gas_demand_6">
        <geometry xsi:type="esdl:Point" lat="54.38696" lon="6.5863"/>
        <costInformation xsi:type="esdl:CostInformation" id="eed84520-eee1-473f-9acd-556f27884155">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="8458b03b-05e7-457d-94b3-1b3568600274" name="Fake_Gas_demand_6_marginalcost"/>
        </costInformation>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="bacdf919-3092-49a5-97c9-2b5e69e4263b" connectedTo="ef38bb26-ef73-4ddd-b906-e815b4c9ff43"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="1000000000.0" name="Fake_Gas_demand_7" id="Fake_Gas_demand_7">
        <geometry xsi:type="esdl:Point" lat="53.8428" lon="4.05396"/>
        <costInformation xsi:type="esdl:CostInformation" id="81ad9a94-89d1-4b32-8600-d2bc7dcb8e6c">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="49b0c5c4-92cd-4b6b-bf83-0e6fd1953fbb" name="Fake_Gas_demand_7_marginalcost"/>
        </costInformation>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="58a73ee7-f694-4821-a8d8-8dc329938006" connectedTo="fd40c2fc-9366-4062-9133-01f9e410e6a5"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="1000000000.0" name="Fake_Gas_demand_8" id="Fake_Gas_demand_8">
        <geometry xsi:type="esdl:Point" lat="53.93275" lon="4.14185"/>
        <costInformation xsi:type="esdl:CostInformation" id="3f89f50f-06e2-4ced-86d6-9f4c1da6d34b">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="5e55268e-0238-411b-bedb-a3fd3338b153" name="Fake_Gas_demand_8_marginalcost"/>
        </costInformation>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="849ed0bd-e6ab-43db-bd3e-a6201cf35300" connectedTo="d788f0cc-ffbc-4802-970e-c4586eec1d0c"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" power="1000000000.0" name="Fake_Gas_demand_9" id="Fake_Gas_demand_9">
        <geometry xsi:type="esdl:Point" lat="53.94962" lon="4.34525"/>
        <costInformation xsi:type="esdl:CostInformation" id="98bc40a0-35ae-446c-8159-4d81962e3793">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="89b724c9-9970-4fd5-8a73-2c5e346081be" name="Fake_Gas_demand_9_marginalcost"/>
        </costInformation>
        <port xsi:type="esdl:InPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52" name="InPort" id="e0bdf85f-09b9-45e9-a4f0-102012c4ca13" connectedTo="fa4565d1-4841-4cf6-9753-7bbefc0077e8"/>
      </asset>
      <asset xsi:type="esdl:Import" name="Elecimport" id="Elecimport" power="100000000000.0">
        <geometry xsi:type="esdl:Point" lat="52.2455469088849" lon="5.57933421552437"/>
        <costInformation xsi:type="esdl:CostInformation" id="5509cb2b-ea26-443d-8c3c-212e242801cc">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="59c41624-cdf6-4e1c-a2fe-0127a9acbe46" name="Elecimport_marginalcost"/>
        </costInformation>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="6db85928-a23e-41f7-bb34-7c690346aabf" name="OutPort" id="c66e3012-034c-4420-aa7b-e21bf2ddf483"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="Bus_WF_TNW" id="Bus_WF_TNW">
        <geometry xsi:type="esdl:Point" lat="54.0384496646664" lon="5.64336597749276"/>
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" name="InPort" id="b1569b64-d95a-4f3f-9e96-0d4ac6e126d7" connectedTo="239c801c-3cc0-41d5-986d-a4605df87596"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="ee1c4981-f67c-43a8-bd9d-1344b3931e79 6209a59d-e7c0-4b94-9f3a-380f30641c51" name="OutPort" id="4be11dcb-3e96-4361-a423-73efe6bb3c9c"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="500000000000.0" name="CBL_WF_Bus" id="CBL_WF_Bus" length="59.02159291818677">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="54.0379496646664" lon="5.64306597749276"/>
          <point xsi:type="esdl:Point" lat="54.0384496646664" lon="5.64336597749276"/>
        </geometry>
        <port xsi:type="esdl:InPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" name="InPort" id="8b6ca6ed-3572-4ee0-a54b-607faafe3062" connectedTo="a6fbc9df-cd1a-4f1e-b432-8a72139882c8"/>
        <port xsi:type="esdl:OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa" connectedTo="b1569b64-d95a-4f3f-9e96-0d4ac6e126d7" name="OutPort" id="239c801c-3cc0-41d5-986d-a4605df87596"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="ac1b01a8-8e31-49c2-9b6e-dd68dcd83feb">
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="90db86cc-0a43-4e5c-a58a-7198e42c235a">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ee7c4314-9a46-4ea5-a38f-db4c23e21ada" multiplier="MEGA" physicalQuantity="POWER" unit="WATTHOUR" description="POWER in MEGAWATTHOUR"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="db4d41ea-9162-4631-8253-35decfb265f6" multiplier="GIGA" physicalQuantity="POWER" unit="WATTHOUR" description="POWER in GIGAWATTHOUR"/>
    </quantityAndUnits>
    <carriers xsi:type="esdl:Carriers" id="carrs">
      <carrier xsi:type="esdl:ElectricityCommodity" name="EL" voltage="380000.0" id="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
      <carrier xsi:type="esdl:GasCommodity" name="H2" pressure="15.0" id="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
      <carrier xsi:type="esdl:GasCommodity" name="GAS" pressure="15.0" id="035e1049-7f93-4f54-af82-02650e6fe0e7"/>
    </carriers>
  </energySystemInformation>
  <services xsi:type="esdl:Services" id="f318bbbb-f4b7-41e3-8faf-56f3b1d313cb">
    <service xsi:type="esdl:DrivenByDemand" id="ef2d4880-b7ad-4410-adb3-06dab2a20acf" energyAsset="H2-Import" name="DrivenByDemand_H2-Import" outPort="050d00ac-d6f6-4a40-82bd-71219b1ab894"/>
    <service xsi:type="esdl:DrivenBySupply" id="cc7b3897-c91b-4709-9552-9155a90c78c0" energyAsset="EL_TNW" inPort="ca282c57-8af1-41bb-9ff8-7e2d087996ca" name="DrivenBySupply_EL_TNW"/>
    <service xsi:type="esdl:DrivenBySupply" id="efa1bad6-17b1-4d22-ab4f-dfcd68aa685a" energyAsset="EL_DDW-West" inPort="eb61df44-0588-42ba-9837-01797255e1c8" name="DrivenBySupply_EL_DDW-West"/>
    <service xsi:type="esdl:DrivenBySupply" id="39e0f3de-b84c-4a15-8c08-b66021eeda98" energyAsset="EL_WA6_1" inPort="0e45bc4a-075d-4369-9f56-58d5ba4b4387" name="DrivenBySupply_EL_WA6_1"/>
    <service xsi:type="esdl:DrivenBySupply" id="43aeba42-1b4c-4cc9-b781-fd835b0b5688" energyAsset="EL_WA6_2" inPort="a644a0da-2945-4790-94c0-9567ba8c4c22" name="DrivenBySupply_EL_WA6_2"/>
    <service xsi:type="esdl:DrivenBySupply" id="3ff815cf-4296-49b9-8f59-01ac423bbc05" energyAsset="EL_WA7_1" inPort="2456b3e8-8111-46d7-8156-b5ef092a06c9" name="DrivenBySupply_EL_WA7_1"/>
    <service xsi:type="esdl:DrivenBySupply" id="8e52cd0a-0859-42ff-8f77-4b522ba9b471" energyAsset="EL_WA7_2" inPort="f4887be0-43a6-48f2-a2bc-f939db9f513b" name="DrivenBySupply_EL_WA7_2"/>
    <service xsi:type="esdl:DrivenBySupply" id="f53abdf6-46f4-4619-8823-7b5b90960865" energyAsset="EL_WA67_1" inPort="291428fb-d911-49af-bd9a-a57f473b8a12" name="DrivenBySupply_EL_WA67_1"/>
    <service xsi:type="esdl:DrivenBySupply" id="84663f5c-4c74-4f2c-9aab-1acd18714af0" energyAsset="EL_WA67_2" inPort="bb1e57ea-5c1c-425a-83a5-e21c753a92c9" name="DrivenBySupply_EL_WA67_2"/>
    <service xsi:type="esdl:DrivenBySupply" id="9b4ec5a4-82ae-46cb-8a76-c986ce8ffe09" energyAsset="EL_WA67_3" inPort="71f31b2d-0035-4053-9fbf-5dd425a0241d" name="DrivenBySupply_EL_WA67_3"/>
    <service xsi:type="esdl:DrivenBySupply" id="1452787a-7ed1-46a9-b5e8-5790c1c11f76" energyAsset="EL_WA67_4" inPort="96616355-a423-41b8-8be9-504ab81b718d" name="DrivenBySupply_EL_WA67_4"/>
    <service xsi:type="esdl:DrivenBySupply" id="3b85d482-8927-4f74-bd12-79dcba87d71d" energyAsset="EL_WA67_5" inPort="afe1b481-7cc3-45aa-94cb-36776529f348" name="DrivenBySupply_EL_WA67_5"/>
    <service xsi:type="esdl:DrivenBySupply" id="1ca4842e-be2b-44b8-b723-7091bd0382ab" energyAsset="conversion_WF_TNW" inPort="675fdcfd-d490-40c4-b177-bb1a42b554d7" name="DrivenBySupply_conversion_WF_TNW"/>
    <service xsi:type="esdl:DrivenBySupply" id="85199725-81aa-48a6-994f-70c95831d20c" energyAsset="//@instance.0/@area/@asset.36" inPort="ad541129-c483-47ee-a933-e1153863faa0" name="DrivenBySupply_Hydrogen export"/>
    <service xsi:type="esdl:DrivenBySupply" id="82fbf2ea-fe2b-48b6-9292-c2358363dbe0" energyAsset="//@instance.0/@area/@asset.37" inPort="c30b0d56-208e-40a3-8192-754012432fd3" name="DrivenBySupply_Electricity export"/>
  </services>
</esdl:EnergySystem>
