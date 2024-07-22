<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="68d4018a-f6bb-4d61-9a56-c112c67222d8" name="NorthSeaEnergy" description="">
  <services xsi:type="esdl:Services" id="f318bbbb-f4b7-41e3-8faf-56f3b1d313cb">
    <service xsi:type="esdl:DrivenByDemand" outPort="050d00ac-d6f6-4a40-82bd-71219b1ab894" id="ef2d4880-b7ad-4410-adb3-06dab2a20acf" name="DrivenByDemand_H2-Import" energyAsset="H2-Import"/>
    <service xsi:type="esdl:DrivenBySupply" id="cc7b3897-c91b-4709-9552-9155a90c78c0" inPort="ca282c57-8af1-41bb-9ff8-7e2d087996ca" name="DrivenBySupply_EL_TNW" energyAsset="EL_TNW"/>
    <service xsi:type="esdl:DrivenBySupply" id="efa1bad6-17b1-4d22-ab4f-dfcd68aa685a" inPort="eb61df44-0588-42ba-9837-01797255e1c8" name="DrivenBySupply_EL_DDW-West" energyAsset="EL_DDW-West"/>
    <service xsi:type="esdl:DrivenBySupply" id="39e0f3de-b84c-4a15-8c08-b66021eeda98" inPort="0e45bc4a-075d-4369-9f56-58d5ba4b4387" name="DrivenBySupply_EL_WA6_1" energyAsset="EL_WA6_1"/>
    <service xsi:type="esdl:DrivenBySupply" id="43aeba42-1b4c-4cc9-b781-fd835b0b5688" inPort="a644a0da-2945-4790-94c0-9567ba8c4c22" name="DrivenBySupply_EL_WA6_2" energyAsset="EL_WA6_2"/>
    <service xsi:type="esdl:DrivenBySupply" id="3ff815cf-4296-49b9-8f59-01ac423bbc05" inPort="2456b3e8-8111-46d7-8156-b5ef092a06c9" name="DrivenBySupply_EL_WA7_1" energyAsset="EL_WA7_1"/>
    <service xsi:type="esdl:DrivenBySupply" id="8e52cd0a-0859-42ff-8f77-4b522ba9b471" inPort="f4887be0-43a6-48f2-a2bc-f939db9f513b" name="DrivenBySupply_EL_WA7_2" energyAsset="EL_WA7_2"/>
    <service xsi:type="esdl:DrivenBySupply" id="f53abdf6-46f4-4619-8823-7b5b90960865" inPort="291428fb-d911-49af-bd9a-a57f473b8a12" name="DrivenBySupply_EL_WA67_1" energyAsset="EL_WA67_1"/>
    <service xsi:type="esdl:DrivenBySupply" id="84663f5c-4c74-4f2c-9aab-1acd18714af0" inPort="bb1e57ea-5c1c-425a-83a5-e21c753a92c9" name="DrivenBySupply_EL_WA67_2" energyAsset="EL_WA67_2"/>
    <service xsi:type="esdl:DrivenBySupply" id="9b4ec5a4-82ae-46cb-8a76-c986ce8ffe09" inPort="71f31b2d-0035-4053-9fbf-5dd425a0241d" name="DrivenBySupply_EL_WA67_3" energyAsset="EL_WA67_3"/>
    <service xsi:type="esdl:DrivenBySupply" id="1452787a-7ed1-46a9-b5e8-5790c1c11f76" inPort="96616355-a423-41b8-8be9-504ab81b718d" name="DrivenBySupply_EL_WA67_4" energyAsset="EL_WA67_4"/>
    <service xsi:type="esdl:DrivenBySupply" id="3b85d482-8927-4f74-bd12-79dcba87d71d" inPort="afe1b481-7cc3-45aa-94cb-36776529f348" name="DrivenBySupply_EL_WA67_5" energyAsset="EL_WA67_5"/>
    <service xsi:type="esdl:DrivenBySupply" id="1ca4842e-be2b-44b8-b723-7091bd0382ab" inPort="675fdcfd-d490-40c4-b177-bb1a42b554d7" name="DrivenBySupply_conversion_WF_TNW" energyAsset="conversion_WF_TNW"/>
    <service xsi:type="esdl:DrivenBySupply" id="85199725-81aa-48a6-994f-70c95831d20c" inPort="ad541129-c483-47ee-a933-e1153863faa0" name="DrivenBySupply_Hydrogen export" energyAsset="//@instance.0/@area/@asset.36"/>
    <service xsi:type="esdl:DrivenBySupply" id="82fbf2ea-fe2b-48b6-9292-c2358363dbe0" inPort="c30b0d56-208e-40a3-8192-754012432fd3" name="DrivenBySupply_Electricity export" energyAsset="//@instance.0/@area/@asset.37"/>
  </services>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="ac1b01a8-8e31-49c2-9b6e-dd68dcd83feb">
    <carriers xsi:type="esdl:Carriers" id="carrs">
      <carrier xsi:type="esdl:ElectricityCommodity" name="EL" id="9cceb888-16de-4c9b-b94b-e738ee6373aa" voltage="380000.0"/>
      <carrier xsi:type="esdl:GasCommodity" name="H2" id="43bf50c5-0ad7-4b88-93e9-925a5669ae52" pressure="70.0"/>
      <carrier xsi:type="esdl:GasCommodity" name="GAS" id="035e1049-7f93-4f54-af82-02650e6fe0e7" pressure="15.0"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="90db86cc-0a43-4e5c-a58a-7198e42c235a">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="POWER in MEGAWATTHOUR" physicalQuantity="POWER" id="ee7c4314-9a46-4ea5-a38f-db4c23e21ada" multiplier="MEGA"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="POWER in GIGAWATTHOUR" physicalQuantity="POWER" id="db4d41ea-9162-4631-8253-35decfb265f6" multiplier="GIGA"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" name="instance" id="b7cfb436-0bd8-4ed4-8e9b-abd65a4e75dd">
    <area xsi:type="esdl:Area" name="NorthSea" id="80076d07-1cc1-4f1d-9b27-4195b8e8c48b">
      <area xsi:type="esdl:Area" name="Hub_East" id="3ff7ce8e-be47-4235-9d31-6319456e8f1b">
        <geometry xsi:type="esdl:Polygon">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lon="5.16169" lat="54.541311"/>
            <point xsi:type="esdl:Point" lon="4.790348" lat="54.116186"/>
            <point xsi:type="esdl:Point" lon="5.271091" lat="53.662194"/>
            <point xsi:type="esdl:Point" lon="6.176204" lat="53.87281"/>
            <point xsi:type="esdl:Point" lon="6.213526" lat="53.876739"/>
            <point xsi:type="esdl:Point" lon="6.109419" lat="53.994596"/>
            <point xsi:type="esdl:Point" lon="6.001383" lat="54.187096"/>
            <point xsi:type="esdl:Point" lon="5.16169" lat="54.541311"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:WindTurbine" name="WF_DDW1" power="2000000000.0" id="WF_DDW1" description="Hub_East">
          <port xsi:type="esdl:OutPort" connectedTo="eef7410b-f948-4df0-91f9-093b71be6c20" name="OutPort" id="dc0183f9-75e6-4dca-afd6-ad7a99147bc3" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HE" database="energy_profiles" id="771c8c12-e306-439a-a88d-a5673f895eff" measurement="NS_OFWprofile_HE_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="c6db8799-ead5-4e22-87e0-c72fad288e63" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="5.46688724627309" lat="54.3196331898551"/>
          <costInformation xsi:type="esdl:CostInformation" id="6bfd940a-741a-4182-a3be-1b4ef25d9506">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="23e6bb6f-9856-447a-87e8-6766394a9d2c" name="WF_DDW1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_DDW2" power="2000000000.0" id="WF_DDW2" description="Hub_East">
          <port xsi:type="esdl:OutPort" connectedTo="aaba5184-c42e-4e24-a3f3-c45ebb329caa" name="OutPort" id="affea88c-bb5f-4ed0-88fb-46c8ad15e027" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HE" database="energy_profiles" id="03715097-8592-42b9-8d8c-0b23235e4b46" measurement="NS_OFWprofile_HE_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="2fe6701e-4276-48bc-a4ca-df77c201620b" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="5.50688724627309" lat="54.3196331898551"/>
          <costInformation xsi:type="esdl:CostInformation" id="dfa4b025-cdd9-4553-80a7-103e4fc1efac">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="9240902c-56e6-48c8-9a35-d8bfda1c6a93" name="WF_DDW2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_DDW-West" power="2000000000.0" id="WF_DDW-West" description="Hub_East">
          <port xsi:type="esdl:OutPort" connectedTo="4d6cfbb0-7ad0-4c14-94eb-32be694615d0" name="OutPort" id="68915d05-303f-45ef-958b-c6ff06dd4ccc" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HE" database="energy_profiles" id="c266861e-7d23-4d2e-84eb-d2dbd92108c1" measurement="NS_OFWprofile_HE_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="8f9de92e-882c-4350-baa5-96118d309ffc" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="5.44688724627309" lat="54.3606331898551"/>
          <costInformation xsi:type="esdl:CostInformation" id="0ec4b763-e6fc-4421-b229-b75d1f6fb4b8">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="dce757a2-7398-488e-8da8-9f7b322a2528" name="WF_DDW-West_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA4_1" power="2000000000.0" id="WF_WA4_1" description="Hub_East">
          <port xsi:type="esdl:OutPort" connectedTo="07301e84-3006-4e7c-afca-e3d1190da58c" name="OutPort" id="45805114-b2a8-4f87-b509-0c6835176ce6" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HE" database="energy_profiles" id="6dd3324a-ffd8-4d6f-8dad-54774ce5ca0a" measurement="NS_OFWprofile_HE_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="d44dc199-fd40-4a04-8672-e10030449d00" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="5.51582580431392" lat="53.8430686888668"/>
          <costInformation xsi:type="esdl:CostInformation" id="94ebddbe-c442-4c26-8b7e-fc7fb92a13da">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="82016f5c-a4ea-47f3-9859-eb3d86c51f1c" name="WF_WA4_1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA4_2" power="2000000000.0" id="WF_WA4_2" description="Hub_East">
          <port xsi:type="esdl:OutPort" connectedTo="5b3bf1ac-486e-4570-87c8-00c10f394ff5" name="OutPort" id="a4f4807f-6c72-4776-b428-a95b5b1b59d7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HE" database="energy_profiles" id="7c44d59d-0846-40d0-a9e5-c05746462eb8" measurement="NS_OFWprofile_HE_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="f61f2761-f98c-4007-877e-b643153e98b3" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="5.61582580431392" lat="53.8530686888668"/>
          <costInformation xsi:type="esdl:CostInformation" id="1b54f7f3-92fe-4db3-92bd-83ce0ba62559">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="5a4c019b-2ea9-40f6-83ed-5f250f13f897" name="WF_WA4_2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA4_3" power="1000000000.0" id="WF_WA4_3" description="Hub_East">
          <port xsi:type="esdl:OutPort" connectedTo="97d3f5d3-061a-4a64-a117-7377b513a064" name="OutPort" id="23c1f88e-196e-4ba9-9b4b-0caeafefd54d" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" field="MWh_normalized_HE" database="energy_profiles" id="602713fa-8105-4d14-9101-19edbea3813f" measurement="NS_OFWprofile_HE_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="0661c36e-9fa1-4d89-903a-d01cd65daf2e" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="5.71582580431392" lat="53.8630686888668"/>
          <costInformation xsi:type="esdl:CostInformation" id="ea5eda70-ebf7-44a0-8f05-6f1d8bc241ea">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="470ba019-ee88-4944-9c41-39370a952ee0" name="WF_WA4_3_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_TNW" power="700000000.0" id="WF_TNW" description="Hub_East">
          <port xsi:type="esdl:OutPort" connectedTo="7ae4a749-2760-48c2-8169-181bc0e7eea7" name="OutPort" id="a6fbc9df-cd1a-4f1e-b432-8a72139882c8" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="0.7" field="MWh_normalized_HE" database="energy_profiles" id="1545a741-8aa5-42ad-87aa-d0ec79d75f5c" measurement="NS_OFWprofile_HE_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="7770f623-ae6a-441c-96f0-12e3ae084dc5" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="5.64306597749276" lat="54.0379496646664"/>
          <costInformation xsi:type="esdl:CostInformation" id="c79d402e-33ae-48f7-beab-005f35896274">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="bd384d14-b75b-459a-a26a-7ec9a80ac730" name="WF_TNW_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_Gemini" power="600000000.0" id="WF_Gemini" description="Hub_East">
          <port xsi:type="esdl:OutPort" connectedTo="d205567c-e630-4dcb-8be1-b7e6deeb82f5" name="OutPort" id="ec275309-ce97-4a2a-9436-f9b94c72d098" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="0.6" field="MWh_normalized_HE" database="energy_profiles" id="79cea8bf-e2de-46b6-a9a0-470c12a8c5b5" measurement="NS_OFWprofile_HE_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="d47cc82c-5a23-4b29-9bb2-6c66235415e2" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="5.97306597749276" lat="54.0389496646664"/>
          <costInformation xsi:type="esdl:CostInformation" id="1b04cef0-f96e-4b59-8708-bd08148898e0">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="e8a93639-e35c-4db2-b46f-139f5841c907" name="WF_Gemini_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="340000000.0" name="EL_TNW" id="EL_TNW" effMinLoad="67.0" description="Hub_East" effMaxLoad="68.0" controlStrategy="cc7b3897-c91b-4709-9552-9155a90c78c0" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="ca282c57-8af1-41bb-9ff8-7e2d087996ca" connectedTo="c83f5326-a14c-4aa1-85c1-ca07701c709d" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="ce2dea55-7b95-4072-855c-fa50c5a98a52" name="OutPort" id="40cfc20a-1352-4441-9923-c28bc39b2ab5" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="5.64306597749276" lat="54.0389496646664"/>
          <costInformation xsi:type="esdl:CostInformation" id="9f4108b5-f76f-42be-91fc-dd2b974986e0">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="5f2d619d-0234-48ea-abd6-59f2c023d968" name="EL_TNW_marginalcosts"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="1360000000.0" name="EL_DDW-West" id="EL_DDW-West" effMinLoad="67.0" description="Hub_East" effMaxLoad="68.0" controlStrategy="efa1bad6-17b1-4d22-ab4f-dfcd68aa685a" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="eb61df44-0588-42ba-9837-01797255e1c8" connectedTo="f5a88aa3-0be1-4087-8d90-8cc480cbedad" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="197fee08-cdd5-4083-9344-54aac48d14a6" name="OutPort" id="98bf4b7f-c432-42ec-8f23-b1394bda20c1" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="5.44688724627309" lat="54.3596331898551"/>
          <costInformation xsi:type="esdl:CostInformation" id="b066e307-2be8-4dd5-8640-6cfcb36b07c0">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="e06e1a8d-fc2d-4534-951c-3ef7a1459bb4" name="EL_DDW-West_marginalcosts"/>
          </costInformation>
        </asset>
      </area>
      <area xsi:type="esdl:Area" name="Hub_West" id="ef598e59-1246-47a8-bd30-261bf6120a81">
        <geometry xsi:type="esdl:Polygon">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lon="3.165978" lat="52.905596"/>
            <point xsi:type="esdl:Point" lon="3.1666" lat="52.90404"/>
            <point xsi:type="esdl:Point" lon="3.167069" lat="52.907412"/>
            <point xsi:type="esdl:Point" lon="2.891568" lat="53.893407"/>
            <point xsi:type="esdl:Point" lon="4.529313" lat="53.875984"/>
            <point xsi:type="esdl:Point" lon="4.504423" lat="53.230096"/>
            <point xsi:type="esdl:Point" lon="3.361984" lat="53.235074"/>
            <point xsi:type="esdl:Point" lon="3.330872" lat="53.161649"/>
            <point xsi:type="esdl:Point" lon="3.193045" lat="52.93453"/>
            <point xsi:type="esdl:Point" lon="3.165978" lat="52.905596"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:WindTurbine" name="WF_NDW1" power="2000000000.0" id="WF_NDW1" description="Hub_West">
          <port xsi:type="esdl:OutPort" connectedTo="b8d57a5f-ff48-4b5b-a68b-2e1d855d9975" name="OutPort" id="e4baa182-bf81-4a89-a93e-c02f79148a95" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HW" database="energy_profiles" id="8834cca2-43a8-42d3-bc43-412bbde8981a" measurement="NS_OFWprofile_HW_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="b52b1235-97bf-4f0f-8b47-68135bffeec6" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="3.31421897392904" lat="53.0771607197844"/>
          <costInformation xsi:type="esdl:CostInformation" id="6126be73-9964-4be7-b9a7-87bf7f936234">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="df5e194b-b533-44d1-b3fe-ef2425428834" name="WF_NDW1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_NDW2" power="2000000000.0" id="WF_NDW2" description="Hub_West">
          <port xsi:type="esdl:OutPort" connectedTo="6f7e2234-7ee2-4068-a08a-6b9318421cbc" name="OutPort" id="b35bd1e6-2635-4293-b979-f4d4c6e3251f" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HW" database="energy_profiles" id="a3600a1e-5b78-4aa4-9ab8-462121233e6d" measurement="NS_OFWprofile_HW_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="8a0df6e7-bea4-4810-9e1c-01f6a760312f" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="3.44225466303724" lat="53.4253612135523"/>
          <costInformation xsi:type="esdl:CostInformation" id="52418131-823d-4a56-a7bc-c309e43ee36a">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="da0893a1-a87c-4f19-9e8b-1b718b71391a" name="WF_NDW2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_NDW3" power="2000000000.0" id="WF_NDW3" description="Hub_West">
          <port xsi:type="esdl:OutPort" connectedTo="e2c046d4-cc85-48a1-927b-73d4dbc7371d" name="OutPort" id="18558581-8d07-47ef-a9e3-7eebf5fec1e9" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HW" database="energy_profiles" id="15a44414-56f5-45d0-8210-d1ca1eda7b26" measurement="NS_OFWprofile_HW_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="528fe804-4396-450c-9e95-9fb6a973c08d" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="3.48062008113859" lat="53.463502235067"/>
          <costInformation xsi:type="esdl:CostInformation" id="5eb89c5f-6c5e-4ca8-8cea-0e9888649283">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="43eda6f4-fe8e-488d-b4e1-a57f574b8784" name="WF_NDW3_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_NDW-Noord" power="2000000000.0" id="WF_NDW-Noord" description="Hub_West">
          <port xsi:type="esdl:OutPort" connectedTo="f8e7d38b-d3c6-4067-9226-631dedd6c318" name="OutPort" id="4a715f29-2c5b-4bcb-b49b-47d28ce26d06" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HW" database="energy_profiles" id="7ec0706b-bcd1-4d67-9650-2e8dda69767e" measurement="NS_OFWprofile_HW_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="37bcb8ab-97a0-41b3-9fe8-50cd9d5b291f" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="3.44225466303724" lat="53.5053612135523"/>
          <costInformation xsi:type="esdl:CostInformation" id="a261b033-00ac-4542-8800-f985e62235c0">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="8cc81463-6f57-451e-8abe-e089ac6dc786" name="WF_NDW-Noord_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA3" power="2000000000.0" id="WF_WA3" description="Hub_West">
          <port xsi:type="esdl:OutPort" connectedTo="e422661c-6267-4c66-ba52-cbae0f7cfe71" name="OutPort" id="0215fba3-6ad0-41ca-8c93-9d6072f0a0dd" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HW" database="energy_profiles" id="854489d5-d77c-4755-a5cb-ac13416bc298" measurement="NS_OFWprofile_HW_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="18be7b2a-fdb4-43fa-b7e2-a64aed91d4cd" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="3.7148881087642" lat="53.941124165846"/>
          <costInformation xsi:type="esdl:CostInformation" id="950c0ffd-cb3c-43cd-a95c-71aeec3a144f">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="95fa8d65-069e-4cbe-ae2c-2d5f3d5d19b3" name="WF_WA3_marginalcost"/>
          </costInformation>
        </asset>
      </area>
      <area xsi:type="esdl:Area" name="Hub_North" id="444a4cae-3d3c-4568-aa6a-e9be0baaef17">
        <geometry xsi:type="esdl:Polygon">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lon="4.341879" lat="54.068175"/>
            <point xsi:type="esdl:Point" lon="4.997591" lat="54.64385"/>
            <point xsi:type="esdl:Point" lon="4.997527" lat="54.809326"/>
            <point xsi:type="esdl:Point" lon="4.295701" lat="54.949957"/>
            <point xsi:type="esdl:Point" lon="4.169358" lat="54.488521"/>
            <point xsi:type="esdl:Point" lon="3.756379" lat="54.483983"/>
            <point xsi:type="esdl:Point" lon="3.57485" lat="54.027891"/>
            <point xsi:type="esdl:Point" lon="4.341879" lat="54.068175"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA6_1" power="2000000000.0" id="WF_WA6_1" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="eab956bc-c68a-4e72-ab80-ef54a9856051" name="OutPort" id="dcc545a0-0d2c-42ba-b775-a900e9975e4b" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="8b141771-a2fa-423e-aab3-e2a9410cdab6" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="c23aa7e0-c707-4ac0-bf6b-f6c291e9bbfc" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.51296592482482" lat="54.2348242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="1d0d8e3e-4376-4146-a548-8d82e1883ad9">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="837dfbfd-b4f0-4974-afb3-327f2a1d61b2" name="WF_WA6_1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA6_2" power="2000000000.0" id="WF_WA6_2" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="ef6bdb5d-1068-4251-b168-64c4668f2c85" name="OutPort" id="1e65b863-f486-41b0-8049-5e6b643636e7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="8ecca5bf-99f8-4df2-8c60-537b653a94fa" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="cd158ee5-c0c6-43ac-8166-d21d0f46bb3c" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.61296592482482" lat="54.3848242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="12c5f98a-aa84-4f4e-b0ab-898df273ef3e">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="7032d1ce-70c2-4392-b2ec-bebd8fc7ea2a" name="WF_WA6_2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA6_3" power="2000000000.0" id="WF_WA6_3" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="65667b23-f57f-413b-947d-18cd49d2b3ff" name="OutPort" id="02017b92-d205-4f83-80cb-e66214d7611e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="3b671545-2a3b-44c4-a87b-116736962d82" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="4333b348-f585-4844-83a8-de9fa7ce681c" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.71296592482482" lat="54.5358242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="a254a1f9-bd38-4bb0-90fe-70d995896ae6">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="ff52379c-0765-462f-9230-4c0f50de5e16" name="WF_WA6_3_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA6_4" power="2000000000.0" id="WF_WA6_4" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="7502d0c7-c0b9-498f-a58b-ea671c13dc87" name="OutPort" id="ccbeb16a-00cf-485b-a150-312ef2261739" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="f546c7c6-ac51-4727-a35a-99f6c697da1d" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="67d0b672-eddf-497c-b77d-e03295b58051" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.81296592482482" lat="54.6858242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="7b5f2c2e-9ed5-4267-a1a3-96c208f43b9a">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="123cb3eb-5643-44d9-b55c-d95d928121b8" name="WF_WA6_4_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA6_5" power="2000000000.0" id="WF_WA6_5" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="2f5a175b-927b-4c42-b55b-2bc4d61ce67c" name="OutPort" id="be9cc073-fb16-4a96-9541-5dcb1e331159" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="34380206-01b8-4f57-aeae-51d2cdd580fb" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="6af2cf35-3991-41f2-8900-5129cf423c68" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.91296592482482" lat="54.8358242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="806edd21-d69f-43ca-87ed-7e797ee5634c">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="90a84207-0bc8-49d2-ae8d-e4433642c70a" name="WF_WA6_5_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA7_1" power="2000000000.0" id="WF_WA7_1" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="d442f2e2-2c75-47b2-877f-5911fb4694f0" name="OutPort" id="1ff8369a-6c90-4644-b113-ded220e0e743" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="abd4541e-f7f0-43a0-81ab-48f0cf2ee6cc" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="1107a82f-0838-4c4b-a7da-eb0319311500" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.01296592482482" lat="54.1368242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="c492305e-ec56-480e-ac75-9476a3b0a821">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="d2c80334-f2f7-49e8-b668-0f4ccbc1b8db" name="WF_WA7_1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA7_2" power="2000000000.0" id="WF_WA7_2" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="9c2c85d4-6714-4bb0-b440-ce157dec5e21" name="OutPort" id="f7e8fb62-4d12-46a2-9b11-d63c36c201ba" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="02052ad1-814e-467e-a1d3-6086fec254bf" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="fd335509-0a8d-4b95-a179-ee626ff11f2a" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.01296592482482" lat="54.2368242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="1c3e8d5f-c6ec-46bd-a169-413ddf93cbe9">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="9384cb85-ab41-4102-b7be-015a2d9c7aee" name="WF_WA7_2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA7_3" power="2000000000.0" id="WF_WA7_3" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="051c90dd-181f-4621-b962-7242d6fde9a8" name="OutPort" id="4503eeb3-e820-45c7-8d75-648af982b1e1" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="c7a5eead-cd1a-4183-8090-f9f3d4860de6" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="a34dfa71-db89-4d3f-91b2-5ee082684bcc" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.01296592482482" lat="54.3358242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="1e04e3d6-bc85-4bea-a4e7-e6956dd74f1f">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="33fd2074-f277-4e0f-84b1-af6840328d0a" name="WF_WA7_3_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA7_4" power="2000000000.0" id="WF_WA7_4" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="e227a5fe-5bfd-44e7-ae77-b3eb46323c08" name="OutPort" id="0ec2352b-e1f4-4b00-8b9a-eb9275c399e5" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="58297a7f-69da-47ce-8770-777b8418bfe0" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="e277968c-16ec-4736-b9ae-767643d24f17" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.01296592482482" lat="54.4358242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="8ba8e0d2-fcba-4bb1-8327-dd9970e2978f">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="a88d742f-928f-4d31-9884-fb6d87f94462" name="WF_WA7_4_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA67_1" power="2000000000.0" id="WF_WA67_1" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="63ac9c9f-8500-4a4c-ac1c-1545f5fbc5ca" name="OutPort" id="77aa7a91-417a-4d96-9dcf-81dae0adba69" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="eca5f8f3-8f69-48f2-b9b6-49a951044345" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="1a841c17-9460-49fb-9fe2-cbeed148137f" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.36296592482482" lat="54.4358242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="38a24182-669a-4ddc-bd75-5e415bc489a5">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="48c311f1-239f-480f-a22d-bc29b99ad457" name="WF_WA67_1_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA67_2" power="2000000000.0" id="WF_WA67_2" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="e005d189-eade-4db1-b5ce-2cd7b05e257c" name="OutPort" id="efbf6d1e-2edc-4019-83ef-3da04f755170" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="9c49e2a5-ff8e-4dda-9d7b-2bbe3a9af070" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="a19ad6f0-7580-4d82-8c6c-769bf3a9c5cb" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.36296592482482" lat="54.434824245707105"/>
          <costInformation xsi:type="esdl:CostInformation" id="c879d6aa-15e5-4572-a910-f7c89ab9f60f">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="e1dbc5df-04c4-4ab5-a7c0-ae7bc8efe93b" name="WF_WA67_2_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA67_3" power="2000000000.0" id="WF_WA67_3" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="21f2fe6e-bc46-4b8e-ad09-20d5407bf787" name="OutPort" id="e45f3010-e4e6-45b5-83bf-9db0d040ca57" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="b62a3454-1b3e-43ed-9c87-b4d182dc461e" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="27fb18e9-c931-460d-a940-802122de2c1f" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.36296592482482" lat="54.43382424570711"/>
          <costInformation xsi:type="esdl:CostInformation" id="ed700910-b683-4643-bcd6-c8da45609bb7">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="73b7ad30-d034-40d1-8298-2a6abb2306e2" name="WF_WA67_3_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA67_4" power="2000000000.0" id="WF_WA67_4" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="3f107009-d59c-4455-b7be-f36b35ff06c6" name="OutPort" id="e300be1d-20ed-4694-b53b-76e5e8d7e845" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="40b66548-7d79-4085-9ed0-9c1f3f04893b" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="be61282b-cdd3-4039-b024-1e521dd52672" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.36296592482482" lat="54.43282424570711"/>
          <costInformation xsi:type="esdl:CostInformation" id="0a1ca110-57ce-4f82-b3ba-46fc9abf3028">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="a2c4b6af-02f1-418f-bcc2-171226338280" name="WF_WA67_4_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:WindTurbine" name="WF_WA67_5" power="2000000000.0" id="WF_WA67_5" description="Hub_North">
          <port xsi:type="esdl:OutPort" connectedTo="f42e3eb8-13d6-4a2e-916a-67774710ebf8" name="OutPort" id="b9874468-07ef-4d1e-9991-88183896e078" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
            <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.0" field="MWh_normalized_HN" database="energy_profiles" id="d4ac91a4-64da-4c45-a98e-8c4cb48f64d7" measurement="NS_OFWprofile_HN_CY2009_med-wind" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in GIGAWATTHOUR" physicalQuantity="ENERGY" id="4830100a-ef2f-4870-b3ae-1d9608db472b" multiplier="GIGA"/>
            </profile>
          </port>
          <geometry xsi:type="esdl:Point" lon="4.36296592482482" lat="54.43182424570711"/>
          <costInformation xsi:type="esdl:CostInformation" id="6ec880e9-1fa7-40ed-8d5e-4fab02d742b2">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="d6c142d3-5484-49a3-ad82-a80075a1f60d" name="WF_WA67_5_marginalcost"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="1360000000.0" name="EL_WA6_1" id="EL_WA6_1" effMinLoad="67.0" description="Hub_North" effMaxLoad="68.0" controlStrategy="39e0f3de-b84c-4a15-8c08-b66021eeda98" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="0e45bc4a-075d-4369-9f56-58d5ba4b4387" connectedTo="7ddad3dd-be7d-4b46-9c4a-b2e26e025ee6" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="bbf18bde-a0ea-43f1-b2e8-eb6283d6ce45" name="OutPort" id="35d5b2eb-e471-4480-89b8-fd37c0fc434c" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="4.51296592482482" lat="54.2358242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="2a09c898-8644-4bfe-86db-9abc157e7e3f">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="8003929c-5c5a-4d69-82eb-7f1093a02a00" name="EL_WA6_1_marginalcosts"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="1360000000.0" name="EL_WA6_2" id="EL_WA6_2" effMinLoad="67.0" description="Hub_North" effMaxLoad="68.0" controlStrategy="43aeba42-1b4c-4cc9-b781-fd835b0b5688" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="a644a0da-2945-4790-94c0-9567ba8c4c22" connectedTo="d1dc2825-7726-4b2a-9b79-7d7810e8dd05" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="4dc33e7c-144c-494a-b038-5e43e1af5647" name="OutPort" id="1d3d7488-d22d-42a5-a3f7-8581480d896f" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="4.61296592482482" lat="54.3858242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="a422ca20-7a1d-4576-8ea6-55ded0a14b51">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="a0ed402c-6e5f-49aa-a926-346218ff8f62" name="EL_WA6_2_marginalcosts"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="1360000000.0" name="EL_WA7_1" id="EL_WA7_1" effMinLoad="67.0" description="Hub_North" effMaxLoad="68.0" controlStrategy="3ff815cf-4296-49b9-8f59-01ac423bbc05" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="2456b3e8-8111-46d7-8156-b5ef092a06c9" connectedTo="5a3eb304-cc11-40ca-983f-dfe7fb1629bf" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="e64ba077-a319-41ae-8094-c9ddd101d1f8" name="OutPort" id="c20d1878-0918-402c-88a2-57718891a311" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="4.01296592482482" lat="54.1358242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="08c87478-e253-46ec-97ea-bc4f1c6f66f4">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="e28cfd13-203c-42ea-9ddc-2b0d83a143c2" name="EL_WA7_1_marginalcosts"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="1360000000.0" name="EL_WA7_2" id="EL_WA7_2" effMinLoad="67.0" description="Hub_North" effMaxLoad="68.0" controlStrategy="8e52cd0a-0859-42ff-8f77-4b522ba9b471" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="f4887be0-43a6-48f2-a2bc-f939db9f513b" connectedTo="fcd1f843-1e47-401e-a203-32cacd518b9a" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="a0d2cc66-12ce-4547-b3ee-fb3b118560bb" name="OutPort" id="d7830f7f-5633-4003-970b-8826640d8428" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="4.01296592482482" lat="54.2358242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="ea184e0f-a999-4cbe-895e-c6cce3087fd3">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="5207b45d-d2ca-4591-bc39-b9487d56a461" name="EL_WA7_2_marginalcosts"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="1360000000.0" name="EL_WA67_1" id="EL_WA67_1" effMinLoad="67.0" description="Hub_North" effMaxLoad="68.0" controlStrategy="f53abdf6-46f4-4619-8823-7b5b90960865" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="291428fb-d911-49af-bd9a-a57f473b8a12" connectedTo="a87527bb-d2ba-4076-a92b-77f2c3b3a11e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="131d016c-b25b-47c5-a547-1c02ef45040a" name="OutPort" id="a4b0bc09-cb61-4b1e-8066-4abc055ac393" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="4.35296592482482" lat="54.4358242457071"/>
          <costInformation xsi:type="esdl:CostInformation" id="7f911842-6477-41a5-b49a-ef2b5ac48a18">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="a2af891e-bfcf-49c2-ad92-a247b4efd911" name="EL_WA67_1_marginalcosts"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="1360000000.0" name="EL_WA67_2" id="EL_WA67_2" effMinLoad="67.0" description="Hub_North" effMaxLoad="68.0" controlStrategy="84663f5c-4c74-4f2c-9aab-1acd18714af0" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="bb1e57ea-5c1c-425a-83a5-e21c753a92c9" connectedTo="d92d40a4-5006-4819-9241-0e44a6aa012e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="2191949e-5e2a-49ec-a3ea-82470511e183" name="OutPort" id="b9789ad4-64a4-4a4c-ac9b-9a48d6264284" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="4.35296592482482" lat="54.434824245707105"/>
          <costInformation xsi:type="esdl:CostInformation" id="b9387a9e-cc2c-4d2b-911b-e3cbac86de08">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="8be34e10-be05-4f95-83c3-0a714562fe7f" name="EL_WA67_2_marginalcosts"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="1360000000.0" name="EL_WA67_3" id="EL_WA67_3" effMinLoad="67.0" description="Hub_North" effMaxLoad="68.0" controlStrategy="9b4ec5a4-82ae-46cb-8a76-c986ce8ffe09" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="71f31b2d-0035-4053-9fbf-5dd425a0241d" connectedTo="1c3cf73a-9956-4de3-8523-d563a335b89e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="59f37df5-5379-4705-aea0-ad89f69b8c36" name="OutPort" id="7dad5443-1a72-4e97-9b79-9eed5b4b3923" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="4.35296592482482" lat="54.43382424570711"/>
          <costInformation xsi:type="esdl:CostInformation" id="babc73cb-478e-4e40-8d35-5250f41be5d8">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="f67bdfe4-95a4-4c85-b7b9-2e9570617eb0" name="EL_WA67_3_marginalcosts"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="1360000000.0" name="EL_WA67_4" id="EL_WA67_4" effMinLoad="67.0" description="Hub_North" effMaxLoad="68.0" controlStrategy="1452787a-7ed1-46a9-b5e8-5790c1c11f76" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="96616355-a423-41b8-8be9-504ab81b718d" connectedTo="adbe185f-3991-4acb-a703-ebd9ed8cefd1" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="4cfd2d56-5d3d-4fbc-951e-061ccdd7dbbe" name="OutPort" id="136af978-dd06-43bf-91f2-5a0d6cf7ddcc" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="4.35296592482482" lat="54.43282424570711"/>
          <costInformation xsi:type="esdl:CostInformation" id="7aecb1c6-32f7-46ab-bb59-b8df22085e35">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="a1f34b0b-f5f3-41cf-9f17-8599088e8098" name="EL_WA67_4_marginalcosts"/>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Electrolyzer" power="1360000000.0" name="EL_WA67_5" id="EL_WA67_5" effMinLoad="67.0" description="Hub_North" effMaxLoad="68.0" controlStrategy="3b85d482-8927-4f74-bd12-79dcba87d71d" efficiency="63.0">
          <port xsi:type="esdl:InPort" name="InPort" id="afe1b481-7cc3-45aa-94cb-36776529f348" connectedTo="66d89a15-411a-433d-a607-8e44b377245f" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
          <port xsi:type="esdl:OutPort" connectedTo="a2e0032a-cb43-4e8b-a9b2-ddc045505b9f" name="OutPort" id="aaf3bc8b-6906-4a04-baeb-199910e9d726" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
          <geometry xsi:type="esdl:Point" lon="4.35296592482482" lat="54.43182424570711"/>
          <costInformation xsi:type="esdl:CostInformation" id="c89eca70-4dbd-4576-96a7-e0e335ad6a96">
            <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="b38a4416-a18e-495e-8fc4-2bc3e6442107" name="EL_WA67_5_marginalcosts"/>
          </costInformation>
        </asset>
      </area>
      <asset xsi:type="esdl:Pipe" capacity="10000000000.0" name="Pipe_Wintershall Noordzee B_V__0" id="Pipe_Wintershall Noordzee B_V__0" diameter="DN500" length="85796.33160936175">
        <port xsi:type="esdl:InPort" id="08207a3d-8025-49ac-b684-d0c46a8dbaa0" name="InPort" connectedTo="d5cb0a75-71d3-4e2b-b8c1-4e6ef4dc4111" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="63608208-bc4d-45ae-b98e-5487e4a9ec5a" name="OutPort" id="57d28c16-00a5-4461-a883-ed4c898a7e3d" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.2177011169605856" lat="53.21751306865999"/>
          <point xsi:type="esdl:Point" lon="3.217597880187599" lat="53.21782787811185"/>
          <point xsi:type="esdl:Point" lon="3.2175546807266087" lat="53.21816953174424"/>
          <point xsi:type="esdl:Point" lon="3.217555272869095" lat="53.21828639907123"/>
          <point xsi:type="esdl:Point" lon="3.2175408914792" lat="53.218403269457276"/>
          <point xsi:type="esdl:Point" lon="3.217541392568448" lat="53.21850217130035"/>
          <point xsi:type="esdl:Point" lon="3.217526973036086" lat="53.21861005443088"/>
          <point xsi:type="esdl:Point" lon="3.2175281115339276" lat="53.218834777560595"/>
          <point xsi:type="esdl:Point" lon="3.2170760045521107" lat="53.221244664670465"/>
          <point xsi:type="esdl:Point" lon="3.2170315722072913" lat="53.22134362492433"/>
          <point xsi:type="esdl:Point" lon="3.2166826573342244" lat="53.22342972260774"/>
          <point xsi:type="esdl:Point" lon="3.21663831104801" lat="53.22354665714244"/>
          <point xsi:type="esdl:Point" lon="3.2134289183490847" lat="53.24081139573477"/>
          <point xsi:type="esdl:Point" lon="3.213430036302456" lat="53.24103611808245"/>
          <point xsi:type="esdl:Point" lon="3.2132406257881807" lat="53.242115135957185"/>
          <point xsi:type="esdl:Point" lon="3.2132110837108985" lat="53.24220508409254"/>
          <point xsi:type="esdl:Point" lon="3.213167858261647" lat="53.2425467302346"/>
          <point xsi:type="esdl:Point" lon="3.2131683942145117" lat="53.242654590141406"/>
          <point xsi:type="esdl:Point" lon="3.2129213178238096" lat="53.24420116748302"/>
          <point xsi:type="esdl:Point" lon="3.212788602744943" lat="53.24463284864738"/>
          <point xsi:type="esdl:Point" lon="3.2127741313079246" lat="53.244740755073295"/>
          <point xsi:type="esdl:Point" lon="3.2127446269509012" lat="53.24483070747896"/>
          <point xsi:type="esdl:Point" lon="3.2127452064361246" lat="53.244947550947494"/>
          <point xsi:type="esdl:Point" lon="3.212556389447741" lat="53.24616141372923"/>
          <point xsi:type="esdl:Point" lon="3.212467139210166" lat="53.246296400834325"/>
          <point xsi:type="esdl:Point" lon="3.211825604915578" lat="53.249911131780976"/>
          <point xsi:type="esdl:Point" lon="3.211766544404672" lat="53.25009100367433"/>
          <point xsi:type="esdl:Point" lon="3.211490129530864" lat="53.25178144420364"/>
          <point xsi:type="esdl:Point" lon="3.2114606214727823" lat="53.25188037445931"/>
          <point xsi:type="esdl:Point" lon="3.2114172524907145" lat="53.252204053205794"/>
          <point xsi:type="esdl:Point" lon="3.2114177842394636" lat="53.25231191384396"/>
          <point xsi:type="esdl:Point" lon="3.211315060853662" lat="53.25275255110078"/>
          <point xsi:type="esdl:Point" lon="3.2113156810415515" lat="53.25287841037387"/>
          <point xsi:type="esdl:Point" lon="3.2112283169157303" lat="53.253399928144404"/>
          <point xsi:type="esdl:Point" lon="3.2112289367263265" lat="53.25352575864093"/>
          <point xsi:type="esdl:Point" lon="3.2111845297139987" lat="53.25364269511448"/>
          <point xsi:type="esdl:Point" lon="3.2111701269172506" lat="53.253759573934616"/>
          <point xsi:type="esdl:Point" lon="3.2111256474468113" lat="53.2538585260954"/>
          <point xsi:type="esdl:Point" lon="3.2111261343606454" lat="53.253957422891894"/>
          <point xsi:type="esdl:Point" lon="3.2110966682269373" lat="53.254065340210154"/>
          <point xsi:type="esdl:Point" lon="3.2110972434900784" lat="53.25418219789385"/>
          <point xsi:type="esdl:Point" lon="3.2109505698223892" lat="53.25482966538269"/>
          <point xsi:type="esdl:Point" lon="3.210951100448244" lat="53.25493752597369"/>
          <point xsi:type="esdl:Point" lon="3.2109216346738627" lat="53.25504543873424"/>
          <point xsi:type="esdl:Point" lon="3.2109221653446336" lat="53.25515332269634"/>
          <point xsi:type="esdl:Point" lon="3.210863852896798" lat="53.25548601565532"/>
          <point xsi:type="esdl:Point" lon="3.210819450295198" lat="53.2556029375592"/>
          <point xsi:type="esdl:Point" lon="3.210600537409176" lat="53.256807865434695"/>
          <point xsi:type="esdl:Point" lon="3.2106010230384188" lat="53.25690673791505"/>
          <point xsi:type="esdl:Point" lon="3.2103087063042324" lat="53.25843537721618"/>
          <point xsi:type="esdl:Point" lon="3.2102798411973485" lat="53.25866015628816"/>
          <point xsi:type="esdl:Point" lon="3.2102353971923967" lat="53.25876809522627"/>
          <point xsi:type="esdl:Point" lon="3.209155345063671" lat="53.26476564403363"/>
          <point xsi:type="esdl:Point" lon="3.2091558714764274" lat="53.26487352783"/>
          <point xsi:type="esdl:Point" lon="3.2090541910706034" lat="53.2655388792434"/>
          <point xsi:type="esdl:Point" lon="3.209009750802643" lat="53.265655820110716"/>
          <point xsi:type="esdl:Point" lon="3.208571702293326" lat="53.26806564043135"/>
          <point xsi:type="esdl:Point" lon="3.208572183493874" lat="53.26816452172314"/>
          <point xsi:type="esdl:Point" lon="3.2081770167114305" lat="53.27015176722881"/>
          <point xsi:type="esdl:Point" lon="3.208177584374825" lat="53.270268628208626"/>
          <point xsi:type="esdl:Point" lon="3.207973543870884" lat="53.27148248606826"/>
          <point xsi:type="esdl:Point" lon="3.207974023732942" lat="53.27158136281546"/>
          <point xsi:type="esdl:Point" lon="3.207930172732859" lat="53.27181515058194"/>
          <point xsi:type="esdl:Point" lon="3.2078857093422632" lat="53.27192310729458"/>
          <point xsi:type="esdl:Point" lon="3.207490303958298" lat="53.273874398900624"/>
          <point xsi:type="esdl:Point" lon="3.207447004739395" lat="53.2742250428359"/>
          <point xsi:type="esdl:Point" lon="3.207447439847386" lat="53.274314918002084"/>
          <point xsi:type="esdl:Point" lon="3.2074330201173953" lat="53.274431804968174"/>
          <point xsi:type="esdl:Point" lon="3.2074335858583947" lat="53.274548671266444"/>
          <point xsi:type="esdl:Point" lon="3.2063086120275983" lat="53.28072602638081"/>
          <point xsi:type="esdl:Point" lon="3.2062640844972914" lat="53.28082497633069"/>
          <point xsi:type="esdl:Point" lon="3.2048751799407023" lat="53.28833316588438"/>
          <point xsi:type="esdl:Point" lon="3.2048157367924013" lat="53.28845011160531"/>
          <point xsi:type="esdl:Point" lon="3.2048312860999633" lat="53.28856694650774"/>
          <point xsi:type="esdl:Point" lon="3.2036613658364774" lat="53.29490615772356"/>
          <point xsi:type="esdl:Point" lon="3.2036619215971944" lat="53.295023000270234"/>
          <point xsi:type="esdl:Point" lon="3.202155756083813" lat="53.30331335088011"/>
          <point xsi:type="esdl:Point" lon="3.201991210334731" lat="53.303430491818176"/>
          <point xsi:type="esdl:Point" lon="3.2021118008252585" lat="53.30354714886999"/>
          <point xsi:type="esdl:Point" lon="3.2020973459262234" lat="53.30365503848448"/>
          <point xsi:type="esdl:Point" lon="3.202067738325825" lat="53.30374498298009"/>
          <point xsi:type="esdl:Point" lon="3.2018193223853375" lat="53.30516565486479"/>
          <point xsi:type="esdl:Point" lon="3.2018198309665356" lat="53.3052735137061"/>
          <point xsi:type="esdl:Point" lon="3.201790271506853" lat="53.30537243622744"/>
          <point xsi:type="esdl:Point" lon="3.2017908224885323" lat="53.30548930195328"/>
          <point xsi:type="esdl:Point" lon="3.20170388859285" lat="53.30614563475163"/>
          <point xsi:type="esdl:Point" lon="3.2016743721175533" lat="53.30625354433893"/>
          <point xsi:type="esdl:Point" lon="3.201674922793806" lat="53.30637041004718"/>
          <point xsi:type="esdl:Point" lon="3.2016459866840825" lat="53.306595180783134"/>
          <point xsi:type="esdl:Point" lon="3.2016464948790047" lat="53.306703044993576"/>
          <point xsi:type="esdl:Point" lon="3.2016175283882577" lat="53.3069278157605"/>
          <point xsi:type="esdl:Point" lon="3.2016180788129818" lat="53.30704465718635"/>
          <point xsi:type="esdl:Point" lon="3.201589101156176" lat="53.30726044526398"/>
          <point xsi:type="esdl:Point" lon="3.201589609306183" lat="53.307368328341056"/>
          <point xsi:type="esdl:Point" lon="3.2015750374375154" lat="53.307467225440426"/>
          <point xsi:type="esdl:Point" lon="3.2015755454437915" lat="53.30757508424336"/>
          <point xsi:type="esdl:Point" lon="3.2015610987463754" lat="53.30769197526574"/>
          <point xsi:type="esdl:Point" lon="3.2015616490273695" lat="53.3078088175794"/>
          <point xsi:type="esdl:Point" lon="3.201547128281824" lat="53.3079167017614"/>
          <point xsi:type="esdl:Point" lon="3.2015486099450876" lat="53.30823132069301"/>
          <point xsi:type="esdl:Point" lon="3.201534120622611" lat="53.308339223694006"/>
          <point xsi:type="esdl:Point" lon="3.2015351365632987" lat="53.30855496103828"/>
          <point xsi:type="esdl:Point" lon="3.2015206470162436" lat="53.30866284515443"/>
          <point xsi:type="esdl:Point" lon="3.2015361947517538" lat="53.308779666604714"/>
          <point xsi:type="esdl:Point" lon="3.201521705132834" lat="53.308887551618355"/>
          <point xsi:type="esdl:Point" lon="3.2015227633302725" lat="53.30911227155262"/>
          <point xsi:type="esdl:Point" lon="3.2015382266061794" lat="53.30921112237632"/>
          <point xsi:type="esdl:Point" lon="3.2015237792350266" lat="53.3093280088712"/>
          <point xsi:type="esdl:Point" lon="3.2017810503274107" lat="53.31295908880666"/>
          <point xsi:type="esdl:Point" lon="3.201919296108903" lat="53.31363302948577"/>
          <point xsi:type="esdl:Point" lon="3.20188988993774" lat="53.31375892392981"/>
          <point xsi:type="esdl:Point" lon="3.2019504290845866" lat="53.31386668101699"/>
          <point xsi:type="esdl:Point" lon="3.2020119097826316" lat="53.3141722099766"/>
          <point xsi:type="esdl:Point" lon="3.2020123766101354" lat="53.31427108695202"/>
          <point xsi:type="esdl:Point" lon="3.2022423225505774" lat="53.31528645438436"/>
          <point xsi:type="esdl:Point" lon="3.20231790362753" lat="53.31539418575708"/>
          <point xsi:type="esdl:Point" lon="3.202288373381061" lat="53.31550209624217"/>
          <point xsi:type="esdl:Point" lon="3.2023650714142544" lat="53.31585254128053"/>
          <point xsi:type="esdl:Point" lon="3.2031269059806515" lat="53.318233311577444"/>
          <point xsi:type="esdl:Point" lon="3.2031724185855324" lat="53.31833211177737"/>
          <point xsi:type="esdl:Point" lon="3.2032335211467418" lat="53.318556733581964"/>
          <point xsi:type="esdl:Point" lon="3.203278999031737" lat="53.31864652146014"/>
          <point xsi:type="esdl:Point" lon="3.203919158885974" lat="53.320676927973935"/>
          <point xsi:type="esdl:Point" lon="3.203964773009465" lat="53.320802699034665"/>
          <point xsi:type="esdl:Point" lon="3.2040403253582954" lat="53.320901446608175"/>
          <point xsi:type="esdl:Point" lon="3.204040839841425" lat="53.321009306047976"/>
          <point xsi:type="esdl:Point" lon="3.204375787456925" lat="53.32198853374218"/>
          <point xsi:type="esdl:Point" lon="3.204421263940549" lat="53.322078331028784"/>
          <point xsi:type="esdl:Point" lon="3.2091868129312924" lat="53.33569723178353"/>
          <point xsi:type="esdl:Point" lon="3.2104973365238854" lat="53.33956013605494"/>
          <point xsi:type="esdl:Point" lon="3.2105129518755873" lat="53.33967697451436"/>
          <point xsi:type="esdl:Point" lon="3.2109242991308946" lat="53.34086276371219"/>
          <point xsi:type="esdl:Point" lon="3.2110761417945604" lat="53.34119509823287"/>
          <point xsi:type="esdl:Point" lon="3.2111828303080934" lat="53.3415095049404"/>
          <point xsi:type="esdl:Point" lon="3.211198336855848" lat="53.34160835481936"/>
          <point xsi:type="esdl:Point" lon="3.2114725326214097" lat="53.342380911715864"/>
          <point xsi:type="esdl:Point" lon="3.211503627742087" lat="53.342596594470336"/>
          <point xsi:type="esdl:Point" lon="3.211564239661455" lat="53.34270434697536"/>
          <point xsi:type="esdl:Point" lon="3.2116103675224736" lat="53.342920007536854"/>
          <point xsi:type="esdl:Point" lon="3.2116709876704093" lat="53.34302775906909"/>
          <point xsi:type="esdl:Point" lon="3.2116864439035253" lat="53.34311762542081"/>
          <point xsi:type="esdl:Point" lon="3.212950423517493" lat="53.346594076079406"/>
          <point xsi:type="esdl:Point" lon="3.2129659807931112" lat="53.34670190728865"/>
          <point xsi:type="esdl:Point" lon="3.213087829212498" lat="53.347034270005274"/>
          <point xsi:type="esdl:Point" lon="3.213148443952575" lat="53.34714202522277"/>
          <point xsi:type="esdl:Point" lon="3.213163993008609" lat="53.34724987618557"/>
          <point xsi:type="esdl:Point" lon="3.2134842181888175" lat="53.34820211496516"/>
          <point xsi:type="esdl:Point" lon="3.2135149011624433" lat="53.34832790315126"/>
          <point xsi:type="esdl:Point" lon="3.213560430952095" lat="53.348426698903495"/>
          <point xsi:type="esdl:Point" lon="3.2136521969485723" lat="53.3487501357448"/>
          <point xsi:type="esdl:Point" lon="3.2136977140989287" lat="53.34883994343644"/>
          <point xsi:type="esdl:Point" lon="3.2140026197426583" lat="53.349729305372584"/>
          <point xsi:type="esdl:Point" lon="3.214093684738804" lat="53.349917893131035"/>
          <point xsi:type="esdl:Point" lon="3.214154891765097" lat="53.35014250354481"/>
          <point xsi:type="esdl:Point" lon="3.2142004625269096" lat="53.35024129805176"/>
          <point xsi:type="esdl:Point" lon="3.2142311055704207" lat="53.35035810436039"/>
          <point xsi:type="esdl:Point" lon="3.2142766827462044" lat="53.35046588594007"/>
          <point xsi:type="esdl:Point" lon="3.2143228417697802" lat="53.350681540640174"/>
          <point xsi:type="esdl:Point" lon="3.2147956523497148" lat="53.35209194310729"/>
          <point xsi:type="esdl:Point" lon="3.2148411754109856" lat="53.35218173593033"/>
          <point xsi:type="esdl:Point" lon="3.215237794787209" lat="53.353376541352254"/>
          <point xsi:type="esdl:Point" lon="3.2152833202559647" lat="53.353466352857595"/>
          <point xsi:type="esdl:Point" lon="3.2153596047497177" lat="53.35369992244634"/>
          <point xsi:type="esdl:Point" lon="3.215405174604232" lat="53.35379871734112"/>
          <point xsi:type="esdl:Point" lon="3.215435754154819" lat="53.353906535372964"/>
          <point xsi:type="esdl:Point" lon="3.215526949218034" lat="53.354113111192"/>
          <point xsi:type="esdl:Point" lon="3.215542538383845" lat="53.35422095626136"/>
          <point xsi:type="esdl:Point" lon="3.2158473607537483" lat="53.35508332639205"/>
          <point xsi:type="esdl:Point" lon="3.2159991575763853" lat="53.35538866390623"/>
          <point xsi:type="esdl:Point" lon="3.2161515513295287" lat="53.355819867332116"/>
          <point xsi:type="esdl:Point" lon="3.2162122708221514" lat="53.35593659878257"/>
          <point xsi:type="esdl:Point" lon="3.2162428009025157" lat="53.35603542056556"/>
          <point xsi:type="esdl:Point" lon="3.2162883463318366" lat="53.35612522712247"/>
          <point xsi:type="esdl:Point" lon="3.2181498874287575" lat="53.361712902577445"/>
          <point xsi:type="esdl:Point" lon="3.218241112387906" lat="53.36191947601661"/>
          <point xsi:type="esdl:Point" lon="3.2182717418758395" lat="53.36203628109978"/>
          <point xsi:type="esdl:Point" lon="3.218362968065679" lat="53.36224284454954"/>
          <point xsi:type="esdl:Point" lon="3.2183785359144688" lat="53.36235069903564"/>
          <point xsi:type="esdl:Point" lon="3.220772460106009" lat="53.36906094274244"/>
          <point xsi:type="esdl:Point" lon="3.220787943558078" lat="53.36915080749011"/>
          <point xsi:type="esdl:Point" lon="3.222360634780005" lat="53.373893992166565"/>
          <point xsi:type="esdl:Point" lon="3.2224061971874858" lat="53.37398379611642"/>
          <point xsi:type="esdl:Point" lon="3.2253521797163582" lat="53.38250864287866"/>
          <point xsi:type="esdl:Point" lon="3.2254129386001065" lat="53.38262539337423"/>
          <point xsi:type="esdl:Point" lon="3.2281302494487676" lat="53.39034159538695"/>
          <point xsi:type="esdl:Point" lon="3.22814580439775" lat="53.39044046558092"/>
          <point xsi:type="esdl:Point" lon="3.2283140909652364" lat="53.39097945559881"/>
          <point xsi:type="esdl:Point" lon="3.228329751744742" lat="53.39109629068319"/>
          <point xsi:type="esdl:Point" lon="3.228956214545668" lat="53.392946774707944"/>
          <point xsi:type="esdl:Point" lon="3.2289718204560764" lat="53.39305460294579"/>
          <point xsi:type="esdl:Point" lon="3.230147575456996" lat="53.39636021489432"/>
          <point xsi:type="esdl:Point" lon="3.2302083522262013" lat="53.396476957278345"/>
          <point xsi:type="esdl:Point" lon="3.2311246263869355" lat="53.39905497305531"/>
          <point xsi:type="esdl:Point" lon="3.23114018171321" lat="53.399144817018176"/>
          <point xsi:type="esdl:Point" lon="3.232454707884299" lat="53.40301643590885"/>
          <point xsi:type="esdl:Point" lon="3.2324854626333153" lat="53.40314222338977"/>
          <point xsi:type="esdl:Point" lon="3.232912405252809" lat="53.40420207084964"/>
          <point xsi:type="esdl:Point" lon="3.2329431131007844" lat="53.40431886674519"/>
          <point xsi:type="esdl:Point" lon="3.2329887870880056" lat="53.404417653064236"/>
          <point xsi:type="esdl:Point" lon="3.2330502217024772" lat="53.404651238477655"/>
          <point xsi:type="esdl:Point" lon="3.233095896300553" lat="53.40475002564228"/>
          <point xsi:type="esdl:Point" lon="3.233111524632911" lat="53.40485785759103"/>
          <point xsi:type="esdl:Point" lon="3.234379588967324" lat="53.408423909697326"/>
          <point xsi:type="esdl:Point" lon="3.234425261678938" lat="53.408522695405765"/>
          <point xsi:type="esdl:Point" lon="3.2344866188676145" lat="53.40873831499963"/>
          <point xsi:type="esdl:Point" lon="3.234532301164253" lat="53.408837096149206"/>
          <point xsi:type="esdl:Point" lon="3.234563040920387" lat="53.4089538959791"/>
          <point xsi:type="esdl:Point" lon="3.2346087161562664" lat="53.409052686100765"/>
          <point xsi:type="esdl:Point" lon="3.234639481640151" lat="53.40917846839396"/>
          <point xsi:type="esdl:Point" lon="3.2346851647901884" lat="53.40927725397261"/>
          <point xsi:type="esdl:Point" lon="3.2349457134487687" lat="53.41014865191789"/>
          <point xsi:type="esdl:Point" lon="3.234991438846574" lat="53.410256420716266"/>
          <point xsi:type="esdl:Point" lon="3.235022198841752" lat="53.41038220739635"/>
          <point xsi:type="esdl:Point" lon="3.2350678346505735" lat="53.4104720103658"/>
          <point xsi:type="esdl:Point" lon="3.2380494240796556" lat="53.419077330547076"/>
          <point xsi:type="esdl:Point" lon="3.238080182368034" lat="53.41919411487064"/>
          <point xsi:type="esdl:Point" lon="3.2381258326037994" lat="53.419283916521515"/>
          <point xsi:type="esdl:Point" lon="3.239641620026088" lat="53.423937053195736"/>
          <point xsi:type="esdl:Point" lon="3.239932285270507" lat="53.42478141143094"/>
          <point xsi:type="esdl:Point" lon="3.239993144666752" lat="53.42489815355926"/>
          <point xsi:type="esdl:Point" lon="3.2436023174282957" lat="53.43497621320761"/>
          <point xsi:type="esdl:Point" lon="3.243617924740076" lat="53.43507505631087"/>
          <point xsi:type="esdl:Point" lon="3.244428797116124" lat="53.43735653059019"/>
          <point xsi:type="esdl:Point" lon="3.244474489312196" lat="53.43744632499167"/>
          <point xsi:type="esdl:Point" lon="3.245118025080187" lat="53.4394135402276"/>
          <point xsi:type="esdl:Point" lon="3.2451643342930954" lat="53.43961119491926"/>
          <point xsi:type="esdl:Point" lon="3.245271049369811" lat="53.439844679833215"/>
          <point xsi:type="esdl:Point" lon="3.2452867733996964" lat="53.43996149278673"/>
          <point xsi:type="esdl:Point" lon="3.245409092437476" lat="53.44028485315938"/>
          <point xsi:type="esdl:Point" lon="3.2454248095682994" lat="53.44040167958561"/>
          <point xsi:type="esdl:Point" lon="3.2454555277648676" lat="53.440509474713586"/>
          <point xsi:type="esdl:Point" lon="3.245501208974544" lat="53.44059926870218"/>
          <point xsi:type="esdl:Point" lon="3.245715806443772" lat="53.44126398592405"/>
          <point xsi:type="esdl:Point" lon="3.2457766850100653" lat="53.44137171801538"/>
          <point xsi:type="esdl:Point" lon="3.245838147445361" lat="53.44158732597166"/>
          <point xsi:type="esdl:Point" lon="3.2458989282839346" lat="53.441686081104336"/>
          <point xsi:type="esdl:Point" lon="3.2462351164638594" lat="53.442548306467614"/>
          <point xsi:type="esdl:Point" lon="3.246281538352454" lat="53.44276394964732"/>
          <point xsi:type="esdl:Point" lon="3.2463424242939163" lat="53.44288066480296"/>
          <point xsi:type="esdl:Point" lon="3.247061638336573" lat="53.444883660685065"/>
          <point xsi:type="esdl:Point" lon="3.2470773616478064" lat="53.445000473310536"/>
          <point xsi:type="esdl:Point" lon="3.2471080874980203" lat="53.44510828679683"/>
          <point xsi:type="esdl:Point" lon="3.2471238501374957" lat="53.44522509393588"/>
          <point xsi:type="esdl:Point" lon="3.247552216523833" lat="53.44639274196107"/>
          <point xsi:type="esdl:Point" lon="3.2476752178680037" lat="53.446832937999645"/>
          <point xsi:type="esdl:Point" lon="3.247751691780518" lat="53.44703953567923"/>
          <point xsi:type="esdl:Point" lon="3.247919221759923" lat="53.447362779598556"/>
          <point xsi:type="esdl:Point" lon="3.2492512703072465" lat="53.451144251904395"/>
          <point xsi:type="esdl:Point" lon="3.2492977168635786" lat="53.451359874700366"/>
          <point xsi:type="esdl:Point" lon="3.2493284243432448" lat="53.451458685294305"/>
          <point xsi:type="esdl:Point" lon="3.2493598359493805" lat="53.451683340784214"/>
          <point xsi:type="esdl:Point" lon="3.250034247891665" lat="53.45369541182123"/>
          <point xsi:type="esdl:Point" lon="3.2500499299342933" lat="53.453803241502484"/>
          <point xsi:type="esdl:Point" lon="3.250203222344081" lat="53.454261335985336"/>
          <point xsi:type="esdl:Point" lon="3.250355619501839" lat="53.45456664738012"/>
          <point xsi:type="esdl:Point" lon="3.250431485731012" lat="53.45466535851427"/>
          <point xsi:type="esdl:Point" lon="3.2507686118239594" lat="53.45565340025999"/>
          <point xsi:type="esdl:Point" lon="3.2507841905872796" lat="53.45574325969894"/>
          <point xsi:type="esdl:Point" lon="3.251550031055939" lat="53.45791691501024"/>
          <point xsi:type="esdl:Point" lon="3.251565666880246" lat="53.45801575216456"/>
          <point xsi:type="esdl:Point" lon="3.2516114330076666" lat="53.45811453036588"/>
          <point xsi:type="esdl:Point" lon="3.2518268076633454" lat="53.458878123024775"/>
          <point xsi:type="esdl:Point" lon="3.2518882654902836" lat="53.4590847250539"/>
          <point xsi:type="esdl:Point" lon="3.251949177896114" lat="53.45919247341877"/>
          <point xsi:type="esdl:Point" lon="3.252087854042492" lat="53.45972250419364"/>
          <point xsi:type="esdl:Point" lon="3.253052126185987" lat="53.46231819493945"/>
          <point xsi:type="esdl:Point" lon="3.253112907590499" lat="53.4624079591383"/>
          <point xsi:type="esdl:Point" lon="3.25325109800882" lat="53.46284810179414"/>
          <point xsi:type="esdl:Point" lon="3.253311995170239" lat="53.46295584854516"/>
          <point xsi:type="esdl:Point" lon="3.253480186219863" lat="53.46337795788162"/>
          <point xsi:type="esdl:Point" lon="3.253541077075109" lat="53.46348568563953"/>
          <point xsi:type="esdl:Point" lon="3.253649138286262" lat="53.46392591505877"/>
          <point xsi:type="esdl:Point" lon="3.253878935887901" lat="53.46457260906681"/>
          <point xsi:type="esdl:Point" lon="3.253894663403249" lat="53.46468043796368"/>
          <point xsi:type="esdl:Point" lon="3.2539253580998886" lat="53.464779242710236"/>
          <point xsi:type="esdl:Point" lon="3.253941008072662" lat="53.464878083912794"/>
          <point xsi:type="esdl:Point" lon="3.254032845350457" lat="53.465120593964635"/>
          <point xsi:type="esdl:Point" lon="3.2540485417930793" lat="53.46522841750689"/>
          <point xsi:type="esdl:Point" lon="3.254293381782966" lat="53.46586609525288"/>
          <point xsi:type="esdl:Point" lon="3.25432438004729" lat="53.46600984567175"/>
          <point xsi:type="esdl:Point" lon="3.254370022180251" lat="53.4660906535538"/>
          <point xsi:type="esdl:Point" lon="3.254416403779405" lat="53.466288303691215"/>
          <point xsi:type="esdl:Point" lon="3.254998470087275" lat="53.467896043419145"/>
          <point xsi:type="esdl:Point" lon="3.255059362254062" lat="53.46800377123016"/>
          <point xsi:type="esdl:Point" lon="3.257543481243732" lat="53.47522533725973"/>
          <point xsi:type="esdl:Point" lon="3.2576195025221235" lat="53.47534202697055"/>
          <point xsi:type="esdl:Point" lon="3.2576503072534027" lat="53.47544981819728"/>
          <point xsi:type="esdl:Point" lon="3.257696053474156" lat="53.475539611413886"/>
          <point xsi:type="esdl:Point" lon="3.258862170010218" lat="53.47899772732578"/>
          <point xsi:type="esdl:Point" lon="3.2589852833204054" lat="53.47941993450564"/>
          <point xsi:type="esdl:Point" lon="3.2590462036853096" lat="53.4795276591447"/>
          <point xsi:type="esdl:Point" lon="3.2590619806169814" lat="53.479644479328286"/>
          <point xsi:type="esdl:Point" lon="3.2602426513159166" lat="53.4829767113116"/>
          <point xsi:type="esdl:Point" lon="3.260288488086851" lat="53.48308448787483"/>
          <point xsi:type="esdl:Point" lon="3.260319354208996" lat="53.48320125968648"/>
          <point xsi:type="esdl:Point" lon="3.2603802909681536" lat="53.48330898893829"/>
          <point xsi:type="esdl:Point" lon="3.2603960179894282" lat="53.48341682565456"/>
          <point xsi:type="esdl:Point" lon="3.260993433334451" lat="53.484997527006016"/>
          <point xsi:type="esdl:Point" lon="3.2610091866044986" lat="53.48510535457117"/>
          <point xsi:type="esdl:Point" lon="3.2615603935814863" lat="53.48651537600988"/>
          <point xsi:type="esdl:Point" lon="3.261606079040194" lat="53.48659616640838"/>
          <point xsi:type="esdl:Point" lon="3.2621279633354416" lat="53.488132085735934"/>
          <point xsi:type="esdl:Point" lon="3.262174602966678" lat="53.488365685590935"/>
          <point xsi:type="esdl:Point" lon="3.263080392539389" lat="53.4910423225145"/>
          <point xsi:type="esdl:Point" lon="3.263141284418715" lat="53.49114106252134"/>
          <point xsi:type="esdl:Point" lon="3.263448147949589" lat="53.49201227997229"/>
          <point xsi:type="esdl:Point" lon="3.2635090406104497" lat="53.49211102517093"/>
          <point xsi:type="esdl:Point" lon="3.2635705088308953" lat="53.49229963640486"/>
          <point xsi:type="esdl:Point" lon="3.263631513691334" lat="53.49241636051031"/>
          <point xsi:type="esdl:Point" lon="3.263861561231235" lat="53.49305404865719"/>
          <point xsi:type="esdl:Point" lon="3.264030823557767" lat="53.49361097130246"/>
          <point xsi:type="esdl:Point" lon="3.264091719847821" lat="53.49370971167776"/>
          <point xsi:type="esdl:Point" lon="3.264199194971132" lat="53.49402408078585"/>
          <point xsi:type="esdl:Point" lon="3.2643992849629324" lat="53.4946887865952"/>
          <point xsi:type="esdl:Point" lon="3.264415091440194" lat="53.494805609327464"/>
          <point xsi:type="esdl:Point" lon="3.2644609272948464" lat="53.4949043828116"/>
          <point xsi:type="esdl:Point" lon="3.264522667004138" lat="53.49513794809206"/>
          <point xsi:type="esdl:Point" lon="3.264583575646027" lat="53.495236682774284"/>
          <point xsi:type="esdl:Point" lon="3.265504055090101" lat="53.497805408783705"/>
          <point xsi:type="esdl:Point" lon="3.2655813895886565" lat="53.498119843393056"/>
          <point xsi:type="esdl:Point" lon="3.265734722090255" lat="53.49853296496785"/>
          <point xsi:type="esdl:Point" lon="3.2657957509357125" lat="53.49864968691018"/>
          <point xsi:type="esdl:Point" lon="3.2661641977342715" lat="53.49970953115111"/>
          <point xsi:type="esdl:Point" lon="3.266179994303115" lat="53.49982633919613"/>
          <point xsi:type="esdl:Point" lon="3.2690515313513187" lat="53.508107444939775"/>
          <point xsi:type="esdl:Point" lon="3.26906720895627" lat="53.50819728215601"/>
          <point xsi:type="esdl:Point" lon="3.269712907633903" lat="53.51015535644109"/>
          <point xsi:type="esdl:Point" lon="3.269728548210298" lat="53.51024519362757"/>
          <point xsi:type="esdl:Point" lon="3.2698205804584424" lat="53.51048768405243"/>
          <point xsi:type="esdl:Point" lon="3.2698362200017743" lat="53.51057754009706"/>
          <point xsi:type="esdl:Point" lon="3.2699130059171524" lat="53.510793079914606"/>
          <point xsi:type="esdl:Point" lon="3.2699288171465017" lat="53.51090990700572"/>
          <point xsi:type="esdl:Point" lon="3.2700364289574675" lat="53.51123325212738"/>
          <point xsi:type="esdl:Point" lon="3.270097430871433" lat="53.511340990219544"/>
          <point xsi:type="esdl:Point" lon="3.272400025782471" lat="53.517681709075816"/>
          <point xsi:type="esdl:Point" lon="3.2724775648992823" lat="53.51801412143881"/>
          <point xsi:type="esdl:Point" lon="3.273322900081194" lat="53.5204750702941"/>
          <point xsi:type="esdl:Point" lon="3.2734313055087965" lat="53.520915253801896"/>
          <point xsi:type="esdl:Point" lon="3.2734621275506113" lat="53.52101407127032"/>
          <point xsi:type="esdl:Point" lon="3.273477894475051" lat="53.52112189654941"/>
          <point xsi:type="esdl:Point" lon="3.275520992888269" lat="53.52683394276166"/>
          <point xsi:type="esdl:Point" lon="3.2755367165947606" lat="53.52693279888921"/>
          <point xsi:type="esdl:Point" lon="3.2759826555192584" lat="53.52823511277985"/>
          <point xsi:type="esdl:Point" lon="3.276028578762022" lat="53.528333881134536"/>
          <point xsi:type="esdl:Point" lon="3.276290747559166" lat="53.52921415074717"/>
          <point xsi:type="esdl:Point" lon="3.27633658997152" lat="53.529303936790576"/>
          <point xsi:type="esdl:Point" lon="3.276413477585172" lat="53.529528477332725"/>
          <point xsi:type="esdl:Point" lon="3.27662748213038" lat="53.529959426327"/>
          <point xsi:type="esdl:Point" lon="3.2785200632093865" lat="53.535590872039805"/>
          <point xsi:type="esdl:Point" lon="3.278581053876444" lat="53.53568962758567"/>
          <point xsi:type="esdl:Point" lon="3.27878071838121" lat="53.53622846143497"/>
          <point xsi:type="esdl:Point" lon="3.2787964531010463" lat="53.536327298085055"/>
          <point xsi:type="esdl:Point" lon="3.2789041960840097" lat="53.53665063906706"/>
          <point xsi:type="esdl:Point" lon="3.278950120162206" lat="53.5367494007846"/>
          <point xsi:type="esdl:Point" lon="3.2791815197025422" lat="53.53752188443183"/>
          <point xsi:type="esdl:Point" lon="3.2791973075217955" lat="53.53762972211281"/>
          <point xsi:type="esdl:Point" lon="3.28010393568979" lat="53.54010843733681"/>
          <point xsi:type="esdl:Point" lon="3.280119667418237" lat="53.540207273759115"/>
          <point xsi:type="esdl:Point" lon="3.280396206457184" lat="53.54095267759247"/>
          <point xsi:type="esdl:Point" lon="3.2804572775414256" lat="53.54106039539342"/>
          <point xsi:type="esdl:Point" lon="3.2813175112104584" lat="53.54335045832704"/>
          <point xsi:type="esdl:Point" lon="3.2813643424343786" lat="53.54358406712235"/>
          <point xsi:type="esdl:Point" lon="3.281917528974859" lat="53.54507486281405"/>
          <point xsi:type="esdl:Point" lon="3.281948467213756" lat="53.54519165202983"/>
          <point xsi:type="esdl:Point" lon="3.282009548215398" lat="53.54529934467533"/>
          <point xsi:type="esdl:Point" lon="3.2827199881162317" lat="53.547733587054616"/>
          <point xsi:type="esdl:Point" lon="3.2835198782106385" lat="53.549987826256384"/>
          <point xsi:type="esdl:Point" lon="3.283565735840454" lat="53.55007760383012"/>
          <point xsi:type="esdl:Point" lon="3.283612525319663" lat="53.550302210388786"/>
          <point xsi:type="esdl:Point" lon="3.283782277767014" lat="53.55085909906415"/>
          <point xsi:type="esdl:Point" lon="3.2838282797471114" lat="53.55096684085252"/>
          <point xsi:type="esdl:Point" lon="3.2838440242765508" lat="53.5510656765845"/>
          <point xsi:type="esdl:Point" lon="3.2851497038656707" lat="53.55444228117468"/>
          <point xsi:type="esdl:Point" lon="3.288597156600724" lat="53.56416859901557"/>
          <point xsi:type="esdl:Point" lon="3.2886129172639067" lat="53.564267433879714"/>
          <point xsi:type="esdl:Point" lon="3.2892755397523343" lat="53.56623434632181"/>
          <point xsi:type="esdl:Point" lon="3.289291334488616" lat="53.566333181886016"/>
          <point xsi:type="esdl:Point" lon="3.2899530687767897" lat="53.568156225931574"/>
          <point xsi:type="esdl:Point" lon="3.290014134659786" lat="53.56825497051181"/>
          <point xsi:type="esdl:Point" lon="3.2916769874691267" lat="53.5729159721043"/>
          <point xsi:type="esdl:Point" lon="3.2917395489213077" lat="53.57323040781402"/>
          <point xsi:type="esdl:Point" lon="3.291769893652279" lat="53.573248318195624"/>
          <point xsi:type="esdl:Point" lon="3.2938047388207736" lat="53.579229699577674"/>
          <point xsi:type="esdl:Point" lon="3.2938206114499726" lat="53.57933752993317"/>
          <point xsi:type="esdl:Point" lon="3.2958691688353414" lat="53.585031200767325"/>
          <point xsi:type="esdl:Point" lon="3.295930405901298" lat="53.58514789185951"/>
          <point xsi:type="esdl:Point" lon="3.2961774224462363" lat="53.585911311570634"/>
          <point xsi:type="esdl:Point" lon="3.296193271862968" lat="53.58601912717534"/>
          <point xsi:type="esdl:Point" lon="3.2966405276817397" lat="53.587330350398034"/>
          <point xsi:type="esdl:Point" lon="3.296656347678647" lat="53.587429188199756"/>
          <point xsi:type="esdl:Point" lon="3.297411750011165" lat="53.5895935412165"/>
          <point xsi:type="esdl:Point" lon="3.2989689718935566" lat="53.594038959949025"/>
          <point xsi:type="esdl:Point" lon="3.298984736437461" lat="53.594128810713165"/>
          <point xsi:type="esdl:Point" lon="3.2997403785572783" lat="53.5962931507586"/>
          <point xsi:type="esdl:Point" lon="3.299801666988903" lat="53.59640985842691"/>
          <point xsi:type="esdl:Point" lon="3.3013275608174637" lat="53.60063060473246"/>
          <point xsi:type="esdl:Point" lon="3.301358625413388" lat="53.600747383134554"/>
          <point xsi:type="esdl:Point" lon="3.301404000297553" lat="53.600756251127336"/>
          <point xsi:type="esdl:Point" lon="3.3014356410998498" lat="53.60095392145851"/>
          <point xsi:type="esdl:Point" lon="3.3020993426356147" lat="53.60290274170463"/>
          <point xsi:type="esdl:Point" lon="3.302115221346408" lat="53.60301057594101"/>
          <point xsi:type="esdl:Point" lon="3.306048739186632" lat="53.61406540254175"/>
          <point xsi:type="esdl:Point" lon="3.3062483852400018" lat="53.61449633355437"/>
          <point xsi:type="esdl:Point" lon="3.3062794419577015" lat="53.614613105961546"/>
          <point xsi:type="esdl:Point" lon="3.306325572630447" lat="53.614720847646595"/>
          <point xsi:type="esdl:Point" lon="3.30635664639817" lat="53.61483762357868"/>
          <point xsi:type="esdl:Point" lon="3.3064027759659878" lat="53.61494536073673"/>
          <point xsi:type="esdl:Point" lon="3.3064967375707837" lat="53.61539454604576"/>
          <point xsi:type="esdl:Point" lon="3.307994552282402" lat="53.619723150397846"/>
          <point xsi:type="esdl:Point" lon="3.3093997796858443" lat="53.62375535221369"/>
          <point xsi:type="esdl:Point" lon="3.3094340392927903" lat="53.62430353748862"/>
          <point xsi:type="esdl:Point" lon="3.3094769743436605" lat="53.62397086103328"/>
          <point xsi:type="esdl:Point" lon="3.3104041910805004" lat="53.62670095630383"/>
          <point xsi:type="esdl:Point" lon="3.3104200038369855" lat="53.62679978811229"/>
          <point xsi:type="esdl:Point" lon="3.3113145497362737" lat="53.62917939700978"/>
          <point xsi:type="esdl:Point" lon="3.31134569753416" lat="53.62930515432034"/>
          <point xsi:type="esdl:Point" lon="3.311391789597315" lat="53.6294039063033"/>
          <point xsi:type="esdl:Point" lon="3.3115621625379816" lat="53.62995176062237"/>
          <point xsi:type="esdl:Point" lon="3.311608264886847" lat="53.63005051248775"/>
          <point xsi:type="esdl:Point" lon="3.311639379788427" lat="53.630167287570465"/>
          <point xsi:type="esdl:Point" lon="3.311823808470715" lat="53.63057127785531"/>
          <point xsi:type="esdl:Point" lon="3.314634953372385" lat="53.638491730199796"/>
          <point xsi:type="esdl:Point" lon="3.3148977446391394" lat="53.63925506824295"/>
          <point xsi:type="esdl:Point" lon="3.3150539503123424" lat="53.63991980904709"/>
          <point xsi:type="esdl:Point" lon="3.316010381708509" lat="53.64241606676244"/>
          <point xsi:type="esdl:Point" lon="3.3160565677354423" lat="53.642523798720134"/>
          <point xsi:type="esdl:Point" lon="3.316259006471368" lat="53.643296274827236"/>
          <point xsi:type="esdl:Point" lon="3.316275063695375" lat="53.64342207044757"/>
          <point xsi:type="esdl:Point" lon="3.319379430671341" lat="53.65188093502984"/>
          <point xsi:type="esdl:Point" lon="3.3196129539188397" lat="53.652752169600745"/>
          <point xsi:type="esdl:Point" lon="3.320617651184368" lat="53.65555387244674"/>
          <point xsi:type="esdl:Point" lon="3.320633630766985" lat="53.65566170757873"/>
          <point xsi:type="esdl:Point" lon="3.3206798856318187" lat="53.65577842044939"/>
          <point xsi:type="esdl:Point" lon="3.320695780467372" lat="53.655877249341756"/>
          <point xsi:type="esdl:Point" lon="3.3207420691807252" lat="53.655993980967324"/>
          <point xsi:type="esdl:Point" lon="3.320789067886547" lat="53.656209582125975"/>
          <point xsi:type="esdl:Point" lon="3.3212067832809367" lat="53.65741290564256"/>
          <point xsi:type="esdl:Point" lon="3.32125378737665" lat="53.65762849217646"/>
          <point xsi:type="esdl:Point" lon="3.322705268593898" lat="53.66143567671085"/>
          <point xsi:type="esdl:Point" lon="3.32272107752356" lat="53.66152552330081"/>
          <point xsi:type="esdl:Point" lon="3.3232631883306607" lat="53.66315096140139"/>
          <point xsi:type="esdl:Point" lon="3.323324470015938" lat="53.66324968168599"/>
          <point xsi:type="esdl:Point" lon="3.3244080950589594" lat="53.666410654948386"/>
          <point xsi:type="esdl:Point" lon="3.3244694940821793" lat="53.66651836185251"/>
          <point xsi:type="esdl:Point" lon="3.324670296968005" lat="53.6670481234393"/>
          <point xsi:type="esdl:Point" lon="3.324716532249566" lat="53.667155851541395"/>
          <point xsi:type="esdl:Point" lon="3.3249501208225523" lat="53.66800913257401"/>
          <point xsi:type="esdl:Point" lon="3.3249660828251395" lat="53.6681169426981"/>
          <point xsi:type="esdl:Point" lon="3.325105839150731" lat="53.668574963178756"/>
          <point xsi:type="esdl:Point" lon="3.3254755745645985" lat="53.66941887230174"/>
          <point xsi:type="esdl:Point" lon="3.3255369097804834" lat="53.66951757234754"/>
          <point xsi:type="esdl:Point" lon="3.3260472432593304" lat="53.67092736923118"/>
          <point xsi:type="esdl:Point" lon="3.3260633042742276" lat="53.6710441619582"/>
          <point xsi:type="esdl:Point" lon="3.326898960234717" lat="53.67340584936819"/>
          <point xsi:type="esdl:Point" lon="3.327257198326859" lat="53.67470818313034"/>
          <point xsi:type="esdl:Point" lon="3.327550656101119" lat="53.67546239910365"/>
          <point xsi:type="esdl:Point" lon="3.3276120050342786" lat="53.67556110246172"/>
          <point xsi:type="esdl:Point" lon="3.327982899499441" lat="53.676539819360684"/>
          <point xsi:type="esdl:Point" lon="3.3280140944139642" lat="53.676656588260336"/>
          <point xsi:type="esdl:Point" lon="3.328060356429388" lat="53.67676431574692"/>
          <point xsi:type="esdl:Point" lon="3.3280754841845366" lat="53.676764274311665"/>
          <point xsi:type="esdl:Point" lon="3.3281075191855463" lat="53.67698889955885"/>
          <point xsi:type="esdl:Point" lon="3.328153748646024" lat="53.67709664596855"/>
          <point xsi:type="esdl:Point" lon="3.328263002298851" lat="53.677518797325924"/>
          <point xsi:type="esdl:Point" lon="3.3283244015376656" lat="53.677626483211"/>
          <point xsi:type="esdl:Point" lon="3.3285253305739078" lat="53.67815626050011"/>
          <point xsi:type="esdl:Point" lon="3.328648149209733" lat="53.67837163098637"/>
          <point xsi:type="esdl:Point" lon="3.328926425644338" lat="53.679116898200405"/>
          <point xsi:type="esdl:Point" lon="3.3291462211430924" lat="53.68012299566635"/>
          <point xsi:type="esdl:Point" lon="3.3295937530321176" lat="53.681209363904955"/>
          <point xsi:type="esdl:Point" lon="3.3297165544562217" lat="53.68142475661949"/>
          <point xsi:type="esdl:Point" lon="3.3298249909296014" lat="53.68173905083232"/>
          <point xsi:type="esdl:Point" lon="3.329871193027395" lat="53.68183779915191"/>
          <point xsi:type="esdl:Point" lon="3.330151656311745" lat="53.682852704925054"/>
          <point xsi:type="esdl:Point" lon="3.331033351388686" lat="53.68523217880608"/>
          <point xsi:type="esdl:Point" lon="3.331111679334114" lat="53.68556454703172"/>
          <point xsi:type="esdl:Point" lon="3.331220183253005" lat="53.68588782714516"/>
          <point xsi:type="esdl:Point" lon="3.331236255362096" lat="53.68600461797764"/>
          <point xsi:type="esdl:Point" lon="3.331437348448675" lat="53.686543372322284"/>
          <point xsi:type="esdl:Point" lon="3.3315449319357593" lat="53.68674979870102"/>
          <point xsi:type="esdl:Point" lon="3.3316847516105446" lat="53.687198833322796"/>
          <point xsi:type="esdl:Point" lon="3.331701656610618" lat="53.68742349465193"/>
          <point xsi:type="esdl:Point" lon="3.332552404402627" lat="53.68969520635441"/>
          <point xsi:type="esdl:Point" lon="3.3325683957621575" lat="53.6898030150313"/>
          <point xsi:type="esdl:Point" lon="3.3336051206894597" lat="53.69260451019297"/>
          <point xsi:type="esdl:Point" lon="3.333666468014635" lat="53.69270321561488"/>
          <point xsi:type="esdl:Point" lon="3.333962095049627" lat="53.6937000998283"/>
          <point xsi:type="esdl:Point" lon="3.3339781853765516" lat="53.69381689010322"/>
          <point xsi:type="esdl:Point" lon="3.3340403983722333" lat="53.69402346477793"/>
          <point xsi:type="esdl:Point" lon="3.3348264452664154" lat="53.69574702328497"/>
          <point xsi:type="esdl:Point" lon="3.3351218751840848" lat="53.696707956456706"/>
          <point xsi:type="esdl:Point" lon="3.335185090043853" lat="53.697040345746615"/>
          <point xsi:type="esdl:Point" lon="3.335339950983992" lat="53.69747134481334"/>
          <point xsi:type="esdl:Point" lon="3.335355975248811" lat="53.697579157388766"/>
          <point xsi:type="esdl:Point" lon="3.3364413937603308" lat="53.700740020624494"/>
          <point xsi:type="esdl:Point" lon="3.336523235160566" lat="53.701503802355994"/>
          <point xsi:type="esdl:Point" lon="3.3365241672255554" lat="53.70162064012407"/>
          <point xsi:type="esdl:Point" lon="3.336839217552772" lat="53.70313880449916"/>
          <point xsi:type="esdl:Point" lon="3.336870322402204" lat="53.70323758327458"/>
          <point xsi:type="esdl:Point" lon="3.336886400341361" lat="53.7033543784203"/>
          <point xsi:type="esdl:Point" lon="3.3369175363713173" lat="53.703462149093404"/>
          <point xsi:type="esdl:Point" lon="3.337168636971947" lat="53.706445582600224"/>
          <point xsi:type="esdl:Point" lon="3.3371544234771786" lat="53.70656246288978"/>
          <point xsi:type="esdl:Point" lon="3.337176756538373" lat="53.70746123877693"/>
          <point xsi:type="esdl:Point" lon="3.337148162596941" lat="53.70767704454622"/>
          <point xsi:type="esdl:Point" lon="3.3371881822553875" lat="53.708890348408694"/>
          <point xsi:type="esdl:Point" lon="3.337204112197102" lat="53.708989193082296"/>
          <point xsi:type="esdl:Point" lon="3.3372078492515658" lat="53.70945656688218"/>
          <point xsi:type="esdl:Point" lon="3.337193500299836" lat="53.709555477888905"/>
          <point xsi:type="esdl:Point" lon="3.337209502178638" lat="53.70966328557891"/>
          <point xsi:type="esdl:Point" lon="3.3371952969932863" lat="53.70978018466345"/>
          <point xsi:type="esdl:Point" lon="3.3371961593490096" lat="53.70988803585472"/>
          <point xsi:type="esdl:Point" lon="3.3366307605356345" lat="53.7130804909922"/>
          <point xsi:type="esdl:Point" lon="3.3365569617611213" lat="53.713323374207846"/>
          <point xsi:type="esdl:Point" lon="3.3361473336027903" lat="53.715158148411454"/>
          <point xsi:type="esdl:Point" lon="3.336102720283374" lat="53.71526612618554"/>
          <point xsi:type="esdl:Point" lon="3.336059053303177" lat="53.71549096116865"/>
          <point xsi:type="esdl:Point" lon="3.3360143128721482" lat="53.715580970560715"/>
          <point xsi:type="esdl:Point" lon="3.335570277100445" lat="53.71690350121397"/>
          <point xsi:type="esdl:Point" lon="3.3354507743709125" lat="53.71711954639101"/>
          <point xsi:type="esdl:Point" lon="3.3348127722520213" lat="53.718829112853946"/>
          <point xsi:type="esdl:Point" lon="3.3340972828131776" lat="53.720332176570366"/>
          <point xsi:type="esdl:Point" lon="3.3340679219171054" lat="53.72044909393997"/>
          <point xsi:type="esdl:Point" lon="3.333336808152391" lat="53.7218982560166"/>
          <point xsi:type="esdl:Point" lon="3.332723791774812" lat="53.722951579578655"/>
          <point xsi:type="esdl:Point" lon="3.33267916929258" lat="53.72305958020839"/>
          <point xsi:type="esdl:Point" lon="3.3307170202165874" lat="53.72601316950251"/>
          <point xsi:type="esdl:Point" lon="3.3306268490172" lat="53.7261122931335"/>
          <point xsi:type="esdl:Point" lon="3.3305071003109763" lat="53.726301377528806"/>
          <point xsi:type="esdl:Point" lon="3.328254816032515" lat="53.72902204019881"/>
          <point xsi:type="esdl:Point" lon="3.3281645018033683" lat="53.72910319365671"/>
          <point xsi:type="esdl:Point" lon="3.327834079747555" lat="53.729490574514834"/>
          <point xsi:type="esdl:Point" lon="3.327743763667879" lat="53.72957172315695"/>
          <point xsi:type="esdl:Point" lon="3.3276687959965345" lat="53.72967978498523"/>
          <point xsi:type="esdl:Point" lon="3.3270071138465798" lat="53.73035572170926"/>
          <point xsi:type="esdl:Point" lon="3.322958118133537" lat="53.7340698704777"/>
          <point xsi:type="esdl:Point" lon="3.3228374770858258" lat="53.734151101545805"/>
          <point xsi:type="esdl:Point" lon="3.3222952603314204" lat="53.73461095648751"/>
          <point xsi:type="esdl:Point" lon="3.3221595289972905" lat="53.73470120950777"/>
          <point xsi:type="esdl:Point" lon="3.3218432490920464" lat="53.734971704658065"/>
          <point xsi:type="esdl:Point" lon="3.320064837875922" lat="53.736342683200284"/>
          <point xsi:type="esdl:Point" lon="3.3199593960443403" lat="53.73643284830393"/>
          <point xsi:type="esdl:Point" lon="3.318406157534463" lat="53.73752457761561"/>
          <point xsi:type="esdl:Point" lon="3.3182703404561398" lat="53.737605820960425"/>
          <point xsi:type="esdl:Point" lon="3.3181648298944553" lat="53.73768700707186"/>
          <point xsi:type="esdl:Point" lon="3.313547569912962" lat="53.74062036407743"/>
          <point xsi:type="esdl:Point" lon="3.313396484124839" lat="53.74069266331781"/>
          <point xsi:type="esdl:Point" lon="3.312490729990666" lat="53.74122534613453"/>
          <point xsi:type="esdl:Point" lon="3.312082851732542" lat="53.74142414979661"/>
          <point xsi:type="esdl:Point" lon="3.3115242153557776" lat="53.741740178108195"/>
          <point xsi:type="esdl:Point" lon="3.308804837582463" lat="53.74307750100912"/>
          <point xsi:type="esdl:Point" lon="3.3086689992859317" lat="53.743158737907216"/>
          <point xsi:type="esdl:Point" lon="3.306296302733713" lat="53.74423442751399"/>
          <point xsi:type="esdl:Point" lon="3.3061450927175686" lat="53.74428874476729"/>
          <point xsi:type="esdl:Point" lon="3.3054045328801807" lat="53.74462319719963"/>
          <point xsi:type="esdl:Point" lon="3.305268602721929" lat="53.74469544300009"/>
          <point xsi:type="esdl:Point" lon="3.3035755675970204" lat="53.74541882355134"/>
          <point xsi:type="esdl:Point" lon="3.303424325421189" lat="53.74547311856058"/>
          <point xsi:type="esdl:Point" lon="3.303273204823348" lat="53.74554540502695"/>
          <point xsi:type="esdl:Point" lon="3.3015796506518678" lat="53.74620583656023"/>
          <point xsi:type="esdl:Point" lon="3.3014436769792246" lat="53.746278078098975"/>
          <point xsi:type="esdl:Point" lon="3.301141261824788" lat="53.74639569651882"/>
          <point xsi:type="esdl:Point" lon="3.300490781675409" lat="53.74661303377868"/>
          <point xsi:type="esdl:Point" lon="3.300324506723304" lat="53.74668536887778"/>
          <point xsi:type="esdl:Point" lon="3.295998104037054" lat="53.7481702004024"/>
          <point xsi:type="esdl:Point" lon="3.295831618043739" lat="53.74821554138669"/>
          <point xsi:type="esdl:Point" lon="3.295680380269653" lat="53.748269854428585"/>
          <point xsi:type="esdl:Point" lon="3.291669879001469" lat="53.74943018383482"/>
          <point xsi:type="esdl:Point" lon="3.2914730437317075" lat="53.7494756015707"/>
          <point xsi:type="esdl:Point" lon="3.2913217335983256" lat="53.74952091824136"/>
          <point xsi:type="esdl:Point" lon="3.284371559145616" lat="53.751065611931125"/>
          <point xsi:type="esdl:Point" lon="3.2842050400404004" lat="53.751110936792955"/>
          <point xsi:type="esdl:Point" lon="3.2815546946525656" lat="53.751647493439826"/>
          <point xsi:type="esdl:Point" lon="3.2806915305802615" lat="53.75183827522809"/>
          <point xsi:type="esdl:Point" lon="3.2805097390641866" lat="53.751865666644974"/>
          <point xsi:type="esdl:Point" lon="3.277541500199228" lat="53.752501766473216"/>
          <point xsi:type="esdl:Point" lon="3.2773749756502206" lat="53.75254708633306"/>
          <point xsi:type="esdl:Point" lon="3.25514006759089" lat="53.75724340663875"/>
          <point xsi:type="esdl:Point" lon="3.25497350157565" lat="53.75728868999544"/>
          <point xsi:type="esdl:Point" lon="3.245156969024047" lat="53.75934949997908"/>
          <point xsi:type="esdl:Point" lon="3.2448389114696363" lat="53.75943105101133"/>
          <point xsi:type="esdl:Point" lon="3.2305062413358594" lat="53.76244355560387"/>
          <point xsi:type="esdl:Point" lon="3.230339628212966" lat="53.762488814629755"/>
          <point xsi:type="esdl:Point" lon="3.2269606185506006" lat="53.76318736153706"/>
          <point xsi:type="esdl:Point" lon="3.226794006227208" lat="53.76323261112695"/>
          <point xsi:type="esdl:Point" lon="3.2266121287154106" lat="53.76325991993253"/>
          <point xsi:type="esdl:Point" lon="3.218853878413998" lat="53.76491918485715"/>
          <point xsi:type="esdl:Point" lon="3.2186719975694515" lat="53.76494648700104"/>
          <point xsi:type="esdl:Point" lon="3.217262700528277" lat="53.76524565290591"/>
          <point xsi:type="esdl:Point" lon="3.2170808484208355" lat="53.76528193997312"/>
          <point xsi:type="esdl:Point" lon="3.2168990703255913" lat="53.76533617983713"/>
          <point xsi:type="esdl:Point" lon="3.2160505708101255" lat="53.76553545158377"/>
          <point xsi:type="esdl:Point" lon="3.2150047385109444" lat="53.765717106460876"/>
          <point xsi:type="esdl:Point" lon="3.2144744176697397" lat="53.765843891478816"/>
          <point xsi:type="esdl:Point" lon="3.213595435190546" lat="53.76602523095219"/>
          <point xsi:type="esdl:Point" lon="3.213413637251517" lat="53.76607049345046"/>
          <point xsi:type="esdl:Point" lon="3.21286799555331" lat="53.76617033375876"/>
          <point xsi:type="esdl:Point" lon="3.212701301725771" lat="53.76620658186016"/>
          <point xsi:type="esdl:Point" lon="3.2125042026836925" lat="53.766233896239584"/>
          <point xsi:type="esdl:Point" lon="3.194605269093526" lat="53.77004832717392"/>
          <point xsi:type="esdl:Point" lon="3.1944233016963017" lat="53.77007558722475"/>
          <point xsi:type="esdl:Point" lon="3.188072373939069" lat="53.771451925891974"/>
          <point xsi:type="esdl:Point" lon="3.1879056703468427" lat="53.7714971358357"/>
          <point xsi:type="esdl:Point" lon="3.185237727043441" lat="53.77204957036959"/>
          <point xsi:type="esdl:Point" lon="3.1850406220994314" lat="53.772076826062886"/>
          <point xsi:type="esdl:Point" lon="3.1838126826970328" lat="53.772321401859244"/>
          <point xsi:type="esdl:Point" lon="3.1797651616044624" lat="53.773172429091034"/>
          <point xsi:type="esdl:Point" lon="3.1795983821944263" lat="53.77319964923424"/>
          <point xsi:type="esdl:Point" lon="3.1790526806863877" lat="53.77332628142982"/>
          <point xsi:type="esdl:Point" lon="3.1788858926974406" lat="53.77335351946501"/>
          <point xsi:type="esdl:Point" lon="3.1786888220241587" lat="53.77339874749194"/>
          <point xsi:type="esdl:Point" lon="3.1785220334243576" lat="53.773425965253345"/>
          <point xsi:type="esdl:Point" lon="3.178355320750164" lat="53.7734711430282"/>
          <point xsi:type="esdl:Point" lon="3.1738374887657015" lat="53.774394568371754"/>
          <point xsi:type="esdl:Point" lon="3.1736706915330903" lat="53.774421774891195"/>
          <point xsi:type="esdl:Point" lon="3.1726550482509093" lat="53.77466593393998"/>
          <point xsi:type="esdl:Point" lon="3.1658930873882074" lat="53.77605965177513"/>
          <point xsi:type="esdl:Point" lon="3.163133753063094" lat="53.776674641509786"/>
          <point xsi:type="esdl:Point" lon="3.1629821037078942" lat="53.77670181342659"/>
          <point xsi:type="esdl:Point" lon="3.162466684578763" lat="53.77682834680913"/>
          <point xsi:type="esdl:Point" lon="3.158903478206066" lat="53.7775701558493"/>
          <point xsi:type="esdl:Point" lon="3.1587214717590757" lat="53.77759736709439"/>
          <point xsi:type="esdl:Point" lon="3.156583543510356" lat="53.778058572203584"/>
          <point xsi:type="esdl:Point" lon="3.1563863599727426" lat="53.77808579971505"/>
          <point xsi:type="esdl:Point" lon="3.1560224785112725" lat="53.77816716001153"/>
          <point xsi:type="esdl:Point" lon="3.1500020279484446" lat="53.77929836612426"/>
          <point xsi:type="esdl:Point" lon="3.137233459067371" lat="53.782091018574036"/>
          <point xsi:type="esdl:Point" lon="3.1370970018944915" lat="53.782127122283896"/>
          <point xsi:type="esdl:Point" lon="3.1368998234503254" lat="53.782163299671524"/>
          <point xsi:type="esdl:Point" lon="3.136733023792263" lat="53.78220842406179"/>
          <point xsi:type="esdl:Point" lon="3.136369047082423" lat="53.782280756245754"/>
          <point xsi:type="esdl:Point" lon="3.1358534626453127" lat="53.78240716173848"/>
          <point xsi:type="esdl:Point" lon="3.1288008579809787" lat="53.78387104558755"/>
          <point xsi:type="esdl:Point" lon="3.1272234146262825" lat="53.78419630742156"/>
          <point xsi:type="esdl:Point" lon="3.1265105814518352" lat="53.784358828480904"/>
          <point xsi:type="esdl:Point" lon="3.1263285489537025" lat="53.78438600940252"/>
          <point xsi:type="esdl:Point" lon="3.1224304086109136" lat="53.78521695794742"/>
          <point xsi:type="esdl:Point" lon="3.1222635290656724" lat="53.785244093848"/>
          <point xsi:type="esdl:Point" lon="3.1217630144783084" lat="53.785361460208534"/>
          <point xsi:type="esdl:Point" lon="3.1201551596298485" lat="53.78569563186662"/>
          <point xsi:type="esdl:Point" lon="3.119973136555043" lat="53.785740752644"/>
          <point xsi:type="esdl:Point" lon="3.119821435663495" lat="53.785767869057075"/>
          <point xsi:type="esdl:Point" lon="3.1196546109514194" lat="53.78581296966865"/>
          <point xsi:type="esdl:Point" lon="3.118759642188177" lat="53.78599363413848"/>
          <point xsi:type="esdl:Point" lon="3.1183955460383372" lat="53.78605691098073"/>
          <point xsi:type="esdl:Point" lon="3.1180466969219487" lat="53.78613815988942"/>
          <point xsi:type="esdl:Point" lon="3.1178646495926308" lat="53.78616528571545"/>
          <point xsi:type="esdl:Point" lon="3.1099461503997357" lat="53.78782663042486"/>
          <point xsi:type="esdl:Point" lon="3.1097793069577864" lat="53.78787173707047"/>
          <point xsi:type="esdl:Point" lon="3.108520169362014" lat="53.788133537623935"/>
          <point xsi:type="esdl:Point" lon="3.1083532768181517" lat="53.788160654156904"/>
          <point xsi:type="esdl:Point" lon="3.1081863969046024" lat="53.78820573883863"/>
          <point xsi:type="esdl:Point" lon="3.0836680316250784" lat="53.793339623322396"/>
          <point xsi:type="esdl:Point" lon="3.0835011023670704" lat="53.7933667052571"/>
          <point xsi:type="esdl:Point" lon="3.0831369232398473" lat="53.79344784335987"/>
          <point xsi:type="esdl:Point" lon="3.082954791379061" lat="53.793474935073256"/>
          <point xsi:type="esdl:Point" lon="3.082605812150687" lat="53.79355607633086"/>
          <point xsi:type="esdl:Point" lon="3.082423702262692" lat="53.79358317620442"/>
          <point xsi:type="esdl:Point" lon="3.072772457037405" lat="53.79564769477003"/>
          <point xsi:type="esdl:Point" lon="3.072590340843237" lat="53.795674775214486"/>
          <point xsi:type="esdl:Point" lon="3.0718770469138974" lat="53.79582800918111"/>
          <point xsi:type="esdl:Point" lon="3.071710129289072" lat="53.795873037650836"/>
          <point xsi:type="esdl:Point" lon="3.070101468427224" lat="53.796197565778996"/>
          <point xsi:type="esdl:Point" lon="3.069585528886082" lat="53.796332686941525"/>
          <point xsi:type="esdl:Point" lon="3.0683866111759044" lat="53.796594031521444"/>
          <point xsi:type="esdl:Point" lon="3.0674759407867604" lat="53.79673836883021"/>
          <point xsi:type="esdl:Point" lon="3.0581571131348584" lat="53.7986936771106"/>
          <point xsi:type="esdl:Point" lon="3.0579749500127003" lat="53.79872073086919"/>
          <point xsi:type="esdl:Point" lon="3.0568973054318174" lat="53.79895493621672"/>
          <point xsi:type="esdl:Point" lon="3.056548198579791" lat="53.799018013478864"/>
          <point xsi:type="esdl:Point" lon="3.056381253412619" lat="53.79906304486916"/>
          <point xsi:type="esdl:Point" lon="3.0561991223423495" lat="53.79909908682906"/>
          <point xsi:type="esdl:Point" lon="3.0560473575626186" lat="53.79914408726957"/>
          <point xsi:type="esdl:Point" lon="3.0526624958343187" lat="53.79982872154928"/>
          <point xsi:type="esdl:Point" lon="3.0497177617480955" lat="53.80044117461055"/>
          <point xsi:type="esdl:Point" lon="3.049353456102148" lat="53.80052222982889"/>
          <point xsi:type="esdl:Point" lon="3.0491864956995487" lat="53.8005672278244"/>
          <point xsi:type="esdl:Point" lon="3.0454674829997077" lat="53.80133269925848"/>
          <point xsi:type="esdl:Point" lon="3.042644036685318" lat="53.80195391433239"/>
          <point xsi:type="esdl:Point" lon="3.042097474124113" lat="53.802043975199744"/>
          <point xsi:type="esdl:Point" lon="3.031592127884507" lat="53.80427626512224"/>
          <point xsi:type="esdl:Point" lon="3.0314403089633135" lat="53.804321257763014"/>
          <point xsi:type="esdl:Point" lon="3.031091141726534" lat="53.804402234601824"/>
          <point xsi:type="esdl:Point" lon="3.0307267526540462" lat="53.80446524059979"/>
          <point xsi:type="esdl:Point" lon="3.0273562708154547" lat="53.805158157071126"/>
          <point xsi:type="esdl:Point" lon="3.0271892380715255" lat="53.80520312891481"/>
          <point xsi:type="esdl:Point" lon="3.026490851181269" lat="53.80533810655711"/>
          <point xsi:type="esdl:Point" lon="3.0263238410928515" lat="53.80538307179956"/>
          <point xsi:type="esdl:Point" lon="3.025944269674595" lat="53.80544609085346"/>
          <point xsi:type="esdl:Point" lon="3.0258076466637314" lat="53.80549105868554"/>
          <point xsi:type="esdl:Point" lon="3.0213741009882793" lat="53.80638176884569"/>
          <point xsi:type="esdl:Point" lon="3.0211918960405613" lat="53.80640874692749"/>
          <point xsi:type="esdl:Point" lon="3.011716892036467" lat="53.80840541889535"/>
          <point xsi:type="esdl:Point" lon="3.0115498691290905" lat="53.808450373427156"/>
          <point xsi:type="esdl:Point" lon="3.004625278417195" lat="53.80986198127801"/>
          <point xsi:type="esdl:Point" lon="3.0030610858058284" lat="53.81022155414039"/>
          <point xsi:type="esdl:Point" lon="3.002848477610881" lat="53.81024852937996"/>
          <point xsi:type="esdl:Point" lon="2.999871916914827" lat="53.810859758216054"/>
          <point xsi:type="esdl:Point" lon="2.9995529946690724" lat="53.81094064317738"/>
          <point xsi:type="esdl:Point" lon="2.9990062621735656" lat="53.81103950832144"/>
          <point xsi:type="esdl:Point" lon="2.9988240310219902" lat="53.81109344127718"/>
          <point xsi:type="esdl:Point" lon="2.9970774878100648" lat="53.81144395220018"/>
          <point xsi:type="esdl:Point" lon="2.9968952544306675" lat="53.811470913122484"/>
          <point xsi:type="esdl:Point" lon="2.9965003907308185" lat="53.81155178258359"/>
          <point xsi:type="esdl:Point" lon="2.996318154988852" lat="53.81157875161535"/>
          <point xsi:type="esdl:Point" lon="2.9959688272321148" lat="53.81165063520612"/>
          <point xsi:type="esdl:Point" lon="2.9958017669817716" lat="53.81169558216843"/>
          <point xsi:type="esdl:Point" lon="2.9952854034268324" lat="53.81178544948677"/>
          <point xsi:type="esdl:Point" lon="2.9951183495006286" lat="53.81183037661605"/>
          <point xsi:type="esdl:Point" lon="2.9949361120967795" lat="53.81186632096652"/>
          <point xsi:type="esdl:Point" lon="2.9947690483699563" lat="53.81191124761132"/>
          <point xsi:type="esdl:Point" lon="2.9944045385459277" lat="53.811983148447965"/>
          <point xsi:type="esdl:Point" lon="2.9940704117031354" lat="53.81207300541697"/>
          <point xsi:type="esdl:Point" lon="2.993311025971152" lat="53.812207781285714"/>
          <point xsi:type="esdl:Point" lon="2.992976893477957" lat="53.81229764328926"/>
          <point xsi:type="esdl:Point" lon="2.991032826500487" lat="53.81266604249087"/>
          <point xsi:type="esdl:Point" lon="2.989468458708656" lat="53.81300745523279"/>
          <point xsi:type="esdl:Point" lon="2.9891342820722473" lat="53.81308832550576"/>
          <point xsi:type="esdl:Point" lon="2.980279057681843" lat="53.81492976265798"/>
          <point xsi:type="esdl:Point" lon="2.9800967984040168" lat="53.814956688158766"/>
          <point xsi:type="esdl:Point" lon="2.9793676899305446" lat="53.81511836867506"/>
          <point xsi:type="esdl:Point" lon="2.9791853958430004" lat="53.81514528379224"/>
          <point xsi:type="esdl:Point" lon="2.9701773971730985" lat="53.81703988262182"/>
          <point xsi:type="esdl:Point" lon="2.969797637863217" lat="53.81710270945577"/>
          <point xsi:type="esdl:Point" lon="2.9678531026478883" lat="53.81752464289552"/>
          <point xsi:type="esdl:Point" lon="2.9676859813929544" lat="53.81756953176176"/>
          <point xsi:type="esdl:Point" lon="2.9613205281560546" lat="53.81883497514943"/>
          <point xsi:type="esdl:Point" lon="2.9587225094897907" lat="53.81944529909639"/>
          <point xsi:type="esdl:Point" lon="2.9585250270467487" lat="53.819481201714936"/>
          <point xsi:type="esdl:Point" lon="2.9561092005631417" lat="53.820064552016795"/>
          <point xsi:type="esdl:Point" lon="2.9559268752321923" lat="53.82011841520224"/>
          <point xsi:type="esdl:Point" lon="2.9557597479765123" lat="53.82015431093886"/>
          <point xsi:type="esdl:Point" lon="2.9556077810488928" lat="53.82020818393073"/>
          <point xsi:type="esdl:Point" lon="2.953510958162473" lat="53.82074668549511"/>
          <point xsi:type="esdl:Point" lon="2.951459720114465" lat="53.821222232636735"/>
          <point xsi:type="esdl:Point" lon="2.9487248699832747" lat="53.82165253507112"/>
          <point xsi:type="esdl:Point" lon="2.9479956117067463" lat="53.82175108942217"/>
          <point xsi:type="esdl:Point" lon="2.9443793427934466" lat="53.82241457691888"/>
          <point xsi:type="esdl:Point" lon="2.944181790308763" lat="53.822459437777496"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="14000000000.0" name="Pipe_Noordgastransport B_V__1" id="Pipe_Noordgastransport B_V__1" diameter="DN800" length="61669.36039619275">
        <port xsi:type="esdl:InPort" id="213a5e17-4364-4546-9355-bdc4fa14c3b2" name="InPort" connectedTo="41829d65-271e-4f8f-90ae-3281dc305c20" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="f16da699-66ce-405b-9beb-485c564a4527" name="OutPort" id="971a5f2c-d76a-4d03-bb6c-63bcf03ce116" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.6192539856492467" lat="53.943742686207486"/>
          <point xsi:type="esdl:Point" lon="3.6180454949793623" lat="53.94444098216007"/>
          <point xsi:type="esdl:Point" lon="3.6180454636281585" lat="53.944441025462304"/>
          <point xsi:type="esdl:Point" lon="3.6119402760535757" lat="53.94785175179025"/>
          <point xsi:type="esdl:Point" lon="3.6119402763230704" lat="53.947851770664045"/>
          <point xsi:type="esdl:Point" lon="3.604564150946025" lat="53.95196072401323"/>
          <point xsi:type="esdl:Point" lon="3.6045641265657475" lat="53.95196072413483"/>
          <point xsi:type="esdl:Point" lon="3.5984573763807117" lat="53.95541574026774"/>
          <point xsi:type="esdl:Point" lon="3.598457376587324" lat="53.95541575465045"/>
          <point xsi:type="esdl:Point" lon="3.5935280551083117" lat="53.958145605904015"/>
          <point xsi:type="esdl:Point" lon="3.5935280553778064" lat="53.95814562477843"/>
          <point xsi:type="esdl:Point" lon="3.5861939061539636" lat="53.96224422039815"/>
          <point xsi:type="esdl:Point" lon="3.586193906495324" lat="53.96224424466666"/>
          <point xsi:type="esdl:Point" lon="3.5825033282230705" lat="53.96428447612236"/>
          <point xsi:type="esdl:Point" lon="3.5825033040943213" lat="53.96428449511555"/>
          <point xsi:type="esdl:Point" lon="3.575151910477909" lat="53.96839147391732"/>
          <point xsi:type="esdl:Point" lon="3.57515191073842" lat="53.96839149279239"/>
          <point xsi:type="esdl:Point" lon="3.5714607098618094" lat="53.9704673538951"/>
          <point xsi:type="esdl:Point" lon="3.571460677854836" lat="53.97046735404833"/>
          <point xsi:type="esdl:Point" lon="3.56902466000147" lat="53.97181812090105"/>
          <point xsi:type="esdl:Point" lon="3.5690246283178904" lat="53.97181814531721"/>
          <point xsi:type="esdl:Point" lon="3.565394107048703" lat="53.97391149377724"/>
          <point xsi:type="esdl:Point" lon="3.565394082910972" lat="53.97391151276604"/>
          <point xsi:type="esdl:Point" lon="3.5629426413524867" lat="53.97528019622282"/>
          <point xsi:type="esdl:Point" lon="3.5629426415501158" lat="53.97528021060397"/>
          <point xsi:type="esdl:Point" lon="3.5604450926032176" lat="53.97663109483506"/>
          <point xsi:type="esdl:Point" lon="3.5604450605872615" lat="53.976631094982984"/>
          <point xsi:type="esdl:Point" lon="3.5506369609254724" lat="53.98209620118721"/>
          <point xsi:type="esdl:Point" lon="3.550636927562043" lat="53.98209621482117"/>
          <point xsi:type="esdl:Point" lon="3.5445514508663396" lat="53.985521392477104"/>
          <point xsi:type="esdl:Point" lon="3.544551451054986" lat="53.98552140685471"/>
          <point xsi:type="esdl:Point" lon="3.5384034778732643" lat="53.988910619814675"/>
          <point xsi:type="esdl:Point" lon="3.538403445848324" lat="53.988910619957274"/>
          <point xsi:type="esdl:Point" lon="3.5346776832523537" lat="53.9909495442789"/>
          <point xsi:type="esdl:Point" lon="3.534677658845128" lat="53.99094954438451"/>
          <point xsi:type="esdl:Point" lon="3.532285593788933" lat="53.99234429520077"/>
          <point xsi:type="esdl:Point" lon="3.532285593968596" lat="53.992344309581306"/>
          <point xsi:type="esdl:Point" lon="3.5261358685690136" lat="53.99575086274272"/>
          <point xsi:type="esdl:Point" lon="3.5261358441617867" lat="53.99575086284833"/>
          <point xsi:type="esdl:Point" lon="3.5163189468672296" lat="54.001231148528476"/>
          <point xsi:type="esdl:Point" lon="3.516318947100791" lat="54.001231167404505"/>
          <point xsi:type="esdl:Point" lon="3.5065185086490382" lat="54.006706064315566"/>
          <point xsi:type="esdl:Point" lon="3.506518484475374" lat="54.0067060841869"/>
          <point xsi:type="esdl:Point" lon="3.497951076600942" lat="54.011500979002875"/>
          <point xsi:type="esdl:Point" lon="3.4979510445580364" lat="54.01150097914013"/>
          <point xsi:type="esdl:Point" lon="3.490598476493204" lat="54.01562072957227"/>
          <point xsi:type="esdl:Point" lon="3.4905984444413147" lat="54.01562072970423"/>
          <point xsi:type="esdl:Point" lon="3.4843961913041515" lat="54.01903431228296"/>
          <point xsi:type="esdl:Point" lon="3.4843961915377135" lat="54.01903433205341"/>
          <point xsi:type="esdl:Point" lon="3.47581198759292" lat="54.023805230908806"/>
          <point xsi:type="esdl:Point" lon="3.475811963383323" lat="54.02380524988014"/>
          <point xsi:type="esdl:Point" lon="3.4684244184157738" lat="54.0279147510605"/>
          <point xsi:type="esdl:Point" lon="3.4684243865165985" lat="54.02791476556595"/>
          <point xsi:type="esdl:Point" lon="3.4535387663148565" lat="54.03620471399006"/>
          <point xsi:type="esdl:Point" lon="3.4535387665663846" lat="54.03620473736084"/>
          <point xsi:type="esdl:Point" lon="3.4412739336851823" lat="54.04304518056794"/>
          <point xsi:type="esdl:Point" lon="3.4412739094486358" lat="54.04304519953049"/>
          <point xsi:type="esdl:Point" lon="3.431403997134355" lat="54.048500683964456"/>
          <point xsi:type="esdl:Point" lon="3.4314039972870685" lat="54.04850069834668"/>
          <point xsi:type="esdl:Point" lon="3.421577475119164" lat="54.05397319442773"/>
          <point xsi:type="esdl:Point" lon="3.4215774430493084" lat="54.05397319453848"/>
          <point xsi:type="esdl:Point" lon="3.41051719409177" lat="54.060078232032964"/>
          <point xsi:type="esdl:Point" lon="3.410517171175747" lat="54.060078232112055"/>
          <point xsi:type="esdl:Point" lon="3.4043782950801935" lat="54.063505406104674"/>
          <point xsi:type="esdl:Point" lon="3.404378261689814" lat="54.06350542958663"/>
          <point xsi:type="esdl:Point" lon="3.395791324845348" lat="54.06830650958759"/>
          <point xsi:type="esdl:Point" lon="3.395791325025011" lat="54.06830652845956"/>
          <point xsi:type="esdl:Point" lon="3.3883412680216054" lat="54.07232137129662"/>
          <point xsi:type="esdl:Point" lon="3.3883412682102514" lat="54.072321391068094"/>
          <point xsi:type="esdl:Point" lon="3.382229666359113" lat="54.075783288274614"/>
          <point xsi:type="esdl:Point" lon="3.382229641906971" lat="54.075783288353676"/>
          <point xsi:type="esdl:Point" lon="3.379766294383137" lat="54.077157225559965"/>
          <point xsi:type="esdl:Point" lon="3.379766262286332" lat="54.077157225665374"/>
          <point xsi:type="esdl:Point" lon="3.3773334772720442" lat="54.07854900792634"/>
          <point xsi:type="esdl:Point" lon="3.3773334773978085" lat="54.078549022308714"/>
          <point xsi:type="esdl:Point" lon="3.345291453331925" lat="54.096252276155845"/>
          <point xsi:type="esdl:Point" lon="3.345291453493622" lat="54.0962522950309"/>
          <point xsi:type="esdl:Point" lon="3.3280116912768487" lat="54.1058096528775"/>
          <point xsi:type="esdl:Point" lon="3.328011691420579" lat="54.10580967175347"/>
          <point xsi:type="esdl:Point" lon="3.3218284762073673" lat="54.1092057449475"/>
          <point xsi:type="esdl:Point" lon="3.3218284440836126" lat="54.109205745031765"/>
          <point xsi:type="esdl:Point" lon="3.3181119553981917" lat="54.11124685600973"/>
          <point xsi:type="esdl:Point" lon="3.3181119309280835" lat="54.11124685607818"/>
          <point xsi:type="esdl:Point" lon="3.302099864071704" lat="54.12011403520359"/>
          <point xsi:type="esdl:Point" lon="3.3020998642154344" lat="54.12011405407832"/>
          <point xsi:type="esdl:Point" lon="3.2996158595992666" lat="54.12147740377194"/>
          <point xsi:type="esdl:Point" lon="3.2996158274665284" lat="54.12147740385091"/>
          <point xsi:type="esdl:Point" lon="3.2947240467808685" lat="54.12423072016371"/>
          <point xsi:type="esdl:Point" lon="3.2947240147469463" lat="54.124230734619736"/>
          <point xsi:type="esdl:Point" lon="3.29223946767411" lat="54.1255849405612"/>
          <point xsi:type="esdl:Point" lon="3.2922394678088573" lat="54.12558495943344"/>
          <point xsi:type="esdl:Point" lon="3.288550634549976" lat="54.12762504282344"/>
          <point xsi:type="esdl:Point" lon="3.2885506346577738" lat="54.127625057204575"/>
          <point xsi:type="esdl:Point" lon="3.2799062263862067" lat="54.132381978613594"/>
          <point xsi:type="esdl:Point" lon="3.279906201898132" lat="54.13238197867149"/>
          <point xsi:type="esdl:Point" lon="3.277405494789105" lat="54.13375390477276"/>
          <point xsi:type="esdl:Point" lon="3.2774054703010305" lat="54.1337539048254"/>
          <point xsi:type="esdl:Point" lon="3.2724954088184903" lat="54.13649736872649"/>
          <point xsi:type="esdl:Point" lon="3.272495375149634" lat="54.13649736880017"/>
          <point xsi:type="esdl:Point" lon="3.2700554055624176" lat="54.13786898889458"/>
          <point xsi:type="esdl:Point" lon="3.270055405661232" lat="54.13786900327742"/>
          <point xsi:type="esdl:Point" lon="3.25898129735176" lat="54.14398695487216"/>
          <point xsi:type="esdl:Point" lon="3.2589812652908874" lat="54.1439869693213"/>
          <point xsi:type="esdl:Point" lon="3.2540378369111984" lat="54.14668479023441"/>
          <point xsi:type="esdl:Point" lon="3.2540378370549288" lat="54.14668481360093"/>
          <point xsi:type="esdl:Point" lon="3.251581325620576" lat="54.14805609063953"/>
          <point xsi:type="esdl:Point" lon="3.2515813257014248" lat="54.14805610501885"/>
          <point xsi:type="esdl:Point" lon="3.2367161239815117" lat="54.15623802788277"/>
          <point xsi:type="esdl:Point" lon="3.2367160994844535" lat="54.156238027930115"/>
          <point xsi:type="esdl:Point" lon="3.2084814442538003" lat="54.17195564873119"/>
          <point xsi:type="esdl:Point" lon="3.2084814121569947" lat="54.171955663165306"/>
          <point xsi:type="esdl:Point" lon="3.2022478106730587" lat="54.175318647133324"/>
          <point xsi:type="esdl:Point" lon="3.202247810744924" lat="54.175318660614586"/>
          <point xsi:type="esdl:Point" lon="3.1885548294607147" lat="54.182737654254716"/>
          <point xsi:type="esdl:Point" lon="3.1885548295685124" lat="54.18273767852084"/>
          <point xsi:type="esdl:Point" lon="3.186063333811358" lat="54.18409867521875"/>
          <point xsi:type="esdl:Point" lon="3.1860633108324534" lat="54.18409867525555"/>
          <point xsi:type="esdl:Point" lon="3.182394636226688" lat="54.186117483326484"/>
          <point xsi:type="esdl:Point" lon="3.18239463631652" lat="54.18611750309629"/>
          <point xsi:type="esdl:Point" lon="3.1673950970794884" lat="54.19436289220984"/>
          <point xsi:type="esdl:Point" lon="3.167395097160337" lat="54.19436291198095"/>
          <point xsi:type="esdl:Point" lon="3.145198177659612" lat="54.20651593225091"/>
          <point xsi:type="esdl:Point" lon="3.145198153135605" lat="54.20651593228244"/>
          <point xsi:type="esdl:Point" lon="3.1303983057300906" lat="54.214684562882596"/>
          <point xsi:type="esdl:Point" lon="3.130398305775006" lat="54.214684577265025"/>
          <point xsi:type="esdl:Point" lon="3.0919554231719304" lat="54.2357598013138"/>
          <point xsi:type="esdl:Point" lon="3.091955423216846" lat="54.23575982018307"/>
          <point xsi:type="esdl:Point" lon="3.089442184456892" lat="54.23710982541561"/>
          <point xsi:type="esdl:Point" lon="3.089442150707187" lat="54.23710982544186"/>
          <point xsi:type="esdl:Point" lon="2.9430685365369667" lat="54.3171447470089"/>
          <point xsi:type="esdl:Point" lon="2.940852751446303" lat="54.31862659997304"/>
          <point xsi:type="esdl:Point" lon="2.9389747297403983" lat="54.32031528889381"/>
          <point xsi:type="esdl:Point" lon="2.9355546553195855" lat="54.32484314715173"/>
          <point xsi:type="esdl:Point" lon="2.935542648293768" lat="54.32485214075063"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="14000000000.0" name="Pipe_Noordgastransport B_V__2" id="Pipe_Noordgastransport B_V__2" diameter="DN800" length="78900.35801386733">
        <port xsi:type="esdl:InPort" name="InPort" id="3ce888c0-e1fc-4529-9597-6d05683be3ea" connectedTo="41829d65-271e-4f8f-90ae-3281dc305c20" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="51d6770d-910a-4c74-9edb-eb3e8f7de13a" name="OutPort" id="d897984f-840b-4f6e-88e2-876b7027e8d8" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.6192539856492467" lat="53.943742686207486"/>
          <point xsi:type="esdl:Point" lon="3.624179761962923" lat="53.941002801336005"/>
          <point xsi:type="esdl:Point" lon="3.624179761675462" lat="53.94100278156021"/>
          <point xsi:type="esdl:Point" lon="3.626565717145679" lat="53.93959722217883"/>
          <point xsi:type="esdl:Point" lon="3.626565756464939" lat="53.939597203100355"/>
          <point xsi:type="esdl:Point" lon="3.6277123301430114" lat="53.93885420468143"/>
          <point xsi:type="esdl:Point" lon="3.6277123619074403" lat="53.938854190134364"/>
          <point xsi:type="esdl:Point" lon="3.6298524540269987" lat="53.937324014464636"/>
          <point xsi:type="esdl:Point" lon="3.629852453739538" lat="53.937323995591356"/>
          <point xsi:type="esdl:Point" lon="3.6317926404261724" lat="53.9356779773179"/>
          <point xsi:type="esdl:Point" lon="3.6317926642944096" lat="53.93567794393274"/>
          <point xsi:type="esdl:Point" lon="3.632663403545094" lat="53.93483749848603"/>
          <point xsi:type="esdl:Point" lon="3.6326634032576335" lat="53.934837479611645"/>
          <point xsi:type="esdl:Point" lon="3.6335337155749974" lat="53.933970041080954"/>
          <point xsi:type="esdl:Point" lon="3.633533739721712" lat="53.93397002656921"/>
          <point xsi:type="esdl:Point" lon="3.6343277162425363" lat="53.93309400727903"/>
          <point xsi:type="esdl:Point" lon="3.6343277482315437" lat="53.933094007109794"/>
          <point xsi:type="esdl:Point" lon="3.635060500172994" lat="53.93220031892341"/>
          <point xsi:type="esdl:Point" lon="3.635060499885533" lat="53.93220030004781"/>
          <point xsi:type="esdl:Point" lon="3.6357320306073078" lat="53.931288966545566"/>
          <point xsi:type="esdl:Point" lon="3.6357320638270068" lat="53.93128894749502"/>
          <point xsi:type="esdl:Point" lon="3.636342657376399" lat="53.93037793288782"/>
          <point xsi:type="esdl:Point" lon="3.6363426568014776" lat="53.930377895140275"/>
          <point xsi:type="esdl:Point" lon="3.6369069747349525" lat="53.929431190525285"/>
          <point xsi:type="esdl:Point" lon="3.6369070061310715" lat="53.9294311517085"/>
          <point xsi:type="esdl:Point" lon="3.6381729175361257" lat="53.926557252373705"/>
          <point xsi:type="esdl:Point" lon="3.638172916889338" lat="53.926557210131946"/>
          <point xsi:type="esdl:Point" lon="3.63962109828912" lat="53.92266668675411"/>
          <point xsi:type="esdl:Point" lon="3.639621098064542" lat="53.922666672375975"/>
          <point xsi:type="esdl:Point" lon="3.640688059080565" lat="53.91974882028586"/>
          <point xsi:type="esdl:Point" lon="3.6406880588739527" lat="53.91974880680078"/>
          <point xsi:type="esdl:Point" lon="3.6432790371109594" lat="53.912975895837796"/>
          <point xsi:type="esdl:Point" lon="3.6432790368234973" lat="53.9129758769641"/>
          <point xsi:type="esdl:Point" lon="3.644010037418454" lat="53.911012535200086"/>
          <point xsi:type="esdl:Point" lon="3.6440100371309927" lat="53.9110125163255"/>
          <point xsi:type="esdl:Point" lon="3.645061159384303" lat="53.9080947274575"/>
          <point xsi:type="esdl:Point" lon="3.645061159159724" lat="53.90809471307964"/>
          <point xsi:type="esdl:Point" lon="3.6457922383572665" lat="53.90614935517159"/>
          <point xsi:type="esdl:Point" lon="3.64579227002288" lat="53.906149336125466"/>
          <point xsi:type="esdl:Point" lon="3.6479853084949423" lat="53.90032220136254"/>
          <point xsi:type="esdl:Point" lon="3.6479853082883293" lat="53.90032218788178"/>
          <point xsi:type="esdl:Point" lon="3.6501779066937003" lat="53.89450399473788"/>
          <point xsi:type="esdl:Point" lon="3.6501779063972557" lat="53.89450397586112"/>
          <point xsi:type="esdl:Point" lon="3.6530851145482623" lat="53.8867403779041"/>
          <point xsi:type="esdl:Point" lon="3.6530851143236833" lat="53.88674036352418"/>
          <point xsi:type="esdl:Point" lon="3.6545766197268867" lat="53.88287631943635"/>
          <point xsi:type="esdl:Point" lon="3.654576619430442" lat="53.882876300559644"/>
          <point xsi:type="esdl:Point" lon="3.656037028859568" lat="53.8789854201109"/>
          <point xsi:type="esdl:Point" lon="3.6560370529074686" lat="53.878985401105346"/>
          <point xsi:type="esdl:Point" lon="3.658531103122948" lat="53.872167698127996"/>
          <point xsi:type="esdl:Point" lon="3.658531125706594" lat="53.87216768362125"/>
          <point xsi:type="esdl:Point" lon="3.660005859123268" lat="53.86826768550023"/>
          <point xsi:type="esdl:Point" lon="3.6600058588268247" lat="53.86826766662751"/>
          <point xsi:type="esdl:Point" lon="3.6625904348426657" lat="53.86148532378009"/>
          <point xsi:type="esdl:Point" lon="3.6625904661759026" lat="53.861485285853725"/>
          <point xsi:type="esdl:Point" lon="3.663684547986124" lat="53.85855806906616"/>
          <point xsi:type="esdl:Point" lon="3.663684547617815" lat="53.85855804569629"/>
          <point xsi:type="esdl:Point" lon="3.6669360569844196" lat="53.849812453245896"/>
          <point xsi:type="esdl:Point" lon="3.6669360567598406" lat="53.84981243886918"/>
          <point xsi:type="esdl:Point" lon="3.668378965956203" lat="53.84592147921528"/>
          <point xsi:type="esdl:Point" lon="3.668378965569928" lat="53.845921454948005"/>
          <point xsi:type="esdl:Point" lon="3.669806431531797" lat="53.84203057983039"/>
          <point xsi:type="esdl:Point" lon="3.669806463143511" lat="53.84203056077624"/>
          <point xsi:type="esdl:Point" lon="3.6720082067218685" lat="53.836211864959395"/>
          <point xsi:type="esdl:Point" lon="3.672008206425424" lat="53.83621184608283"/>
          <point xsi:type="esdl:Point" lon="3.672752178755964" lat="53.83427519527182"/>
          <point xsi:type="esdl:Point" lon="3.672752209990386" lat="53.834275152851895"/>
          <point xsi:type="esdl:Point" lon="3.6742244322654987" lat="53.83038400145915"/>
          <point xsi:type="esdl:Point" lon="3.674224432031937" lat="53.83038398708106"/>
          <point xsi:type="esdl:Point" lon="3.6749229270793524" lat="53.828465550012204"/>
          <point xsi:type="esdl:Point" lon="3.6749229267739256" lat="53.82846553113745"/>
          <point xsi:type="esdl:Point" lon="3.6760002395800244" lat="53.825547292163904"/>
          <point xsi:type="esdl:Point" lon="3.676000239346463" lat="53.82554727778415"/>
          <point xsi:type="esdl:Point" lon="3.6774720690577953" lat="53.82166500699905"/>
          <point xsi:type="esdl:Point" lon="3.677472068752368" lat="53.82166498812653"/>
          <point xsi:type="esdl:Point" lon="3.6785645021720095" lat="53.81876460520035"/>
          <point xsi:type="esdl:Point" lon="3.6785645428746743" lat="53.81876458609319"/>
          <point xsi:type="esdl:Point" lon="3.6810981453371925" lat="53.812017971183224"/>
          <point xsi:type="esdl:Point" lon="3.681098186336302" lat="53.81201797094984"/>
          <point xsi:type="esdl:Point" lon="3.6821747942972793" lat="53.80910863808004"/>
          <point xsi:type="esdl:Point" lon="3.682174793991852" lat="53.809108619201865"/>
          <point xsi:type="esdl:Point" lon="3.6847222089142453" lat="53.80234387110704"/>
          <point xsi:type="esdl:Point" lon="3.6847222085908515" lat="53.80234385133454"/>
          <point xsi:type="esdl:Point" lon="3.68508595031938" lat="53.80137109150671"/>
          <point xsi:type="esdl:Point" lon="3.6850859496815755" lat="53.801371052862706"/>
          <point xsi:type="esdl:Point" lon="3.686525706321297" lat="53.797488858496365"/>
          <point xsi:type="esdl:Point" lon="3.686525705935021" lat="53.797488835124234"/>
          <point xsi:type="esdl:Point" lon="3.687995865148235" lat="53.7936244289987"/>
          <point xsi:type="esdl:Point" lon="3.6879958648428084" lat="53.79362441012416"/>
          <point xsi:type="esdl:Point" lon="3.6887233328218914" lat="53.79169672939473"/>
          <point xsi:type="esdl:Point" lon="3.6887233325883297" lat="53.79169671501398"/>
          <point xsi:type="esdl:Point" lon="3.69125330799509" lat="53.78492292022275"/>
          <point xsi:type="esdl:Point" lon="3.691253339552906" lat="53.784922901163846"/>
          <point xsi:type="esdl:Point" lon="3.694448727040444" lat="53.776221685867164"/>
          <point xsi:type="esdl:Point" lon="3.694448726726034" lat="53.776221666990104"/>
          <point xsi:type="esdl:Point" lon="3.697022390699507" lat="53.76944747511551"/>
          <point xsi:type="esdl:Point" lon="3.697022423766492" lat="53.76944745604426"/>
          <point xsi:type="esdl:Point" lon="3.7002153211150803" lat="53.76073709071622"/>
          <point xsi:type="esdl:Point" lon="3.70021535265493" lat="53.760737071656955"/>
          <point xsi:type="esdl:Point" lon="3.7017134603790276" lat="53.75688128147118"/>
          <point xsi:type="esdl:Point" lon="3.701713460145465" lat="53.75688126709443"/>
          <point xsi:type="esdl:Point" lon="3.7042391482437167" lat="53.750098172040616"/>
          <point xsi:type="esdl:Point" lon="3.704239147929307" lat="53.75009815316775"/>
          <point xsi:type="esdl:Point" lon="3.7052979494847227" lat="53.747215658863325"/>
          <point xsi:type="esdl:Point" lon="3.7052979492421776" lat="53.74721564448327"/>
          <point xsi:type="esdl:Point" lon="3.70677997011583" lat="53.74335985557682"/>
          <point xsi:type="esdl:Point" lon="3.706779969801419" lat="53.743359836700925"/>
          <point xsi:type="esdl:Point" lon="3.7082307880979193" lat="53.7394683006436"/>
          <point xsi:type="esdl:Point" lon="3.708230819619803" lat="53.73946828158"/>
          <point xsi:type="esdl:Point" lon="3.709650923618424" lat="53.73556788572219"/>
          <point xsi:type="esdl:Point" lon="3.7096509233758796" lat="53.73556787133815"/>
          <point xsi:type="esdl:Point" lon="3.713548795320027" lat="53.72492934304178"/>
          <point xsi:type="esdl:Point" lon="3.713548794763072" lat="53.724929309785864"/>
          <point xsi:type="esdl:Point" lon="3.713972104721321" lat="53.72397406951711"/>
          <point xsi:type="esdl:Point" lon="3.7139721287243055" lat="53.72397405499621"/>
          <point xsi:type="esdl:Point" lon="3.7146211490664323" lat="53.72202868682148"/>
          <point xsi:type="esdl:Point" lon="3.714621148500493" lat="53.722028653568586"/>
          <point xsi:type="esdl:Point" lon="3.7160856973305156" lat="53.71813690303242"/>
          <point xsi:type="esdl:Point" lon="3.7160856970071228" lat="53.718136884155825"/>
          <point xsi:type="esdl:Point" lon="3.720071272864849" lat="53.70749762304012"/>
          <point xsi:type="esdl:Point" lon="3.7200712724516234" lat="53.70749759877244"/>
          <point xsi:type="esdl:Point" lon="3.7218671872691935" lat="53.70266893517026"/>
          <point xsi:type="esdl:Point" lon="3.7218671869458" lat="53.70266891629205"/>
          <point xsi:type="esdl:Point" lon="3.723995168149378" lat="53.69691243388181"/>
          <point xsi:type="esdl:Point" lon="3.723995208142375" lat="53.69691238151021"/>
          <point xsi:type="esdl:Point" lon="3.7247190601149787" lat="53.69496654194664"/>
          <point xsi:type="esdl:Point" lon="3.724719084351525" lat="53.69496654180304"/>
          <point xsi:type="esdl:Point" lon="3.7272831331714222" lat="53.688200656792084"/>
          <point xsi:type="esdl:Point" lon="3.727283164073468" lat="53.68820060446816"/>
          <point xsi:type="esdl:Point" lon="3.727630148143595" lat="53.6872457141432"/>
          <point xsi:type="esdl:Point" lon="3.7276301479100336" lat="53.68724570066294"/>
          <point xsi:type="esdl:Point" lon="3.7308262483724475" lat="53.67856135100302"/>
          <point xsi:type="esdl:Point" lon="3.7308262791846607" lat="53.67856129418695"/>
          <point xsi:type="esdl:Point" lon="3.7319117667676434" lat="53.67567834340045"/>
          <point xsi:type="esdl:Point" lon="3.73191176644425" lat="53.675678324526096"/>
          <point xsi:type="esdl:Point" lon="3.733750116579897" lat="53.67083125363926"/>
          <point xsi:type="esdl:Point" lon="3.733750116337352" lat="53.67083124015907"/>
          <point xsi:type="esdl:Point" lon="3.740541675907131" lat="53.652425743064924"/>
          <point xsi:type="esdl:Point" lon="3.740541675152546" lat="53.6524256999233"/>
          <point xsi:type="esdl:Point" lon="3.7427392938737305" lat="53.64661450097092"/>
          <point xsi:type="esdl:Point" lon="3.7427393253057826" lat="53.646614481897174"/>
          <point xsi:type="esdl:Point" lon="3.74523814343743" lat="53.63990243204302"/>
          <point xsi:type="esdl:Point" lon="3.745238143105053" lat="53.63990241316861"/>
          <point xsi:type="esdl:Point" lon="3.7459299890832476" lat="53.63796558431927"/>
          <point xsi:type="esdl:Point" lon="3.745929988418495" lat="53.63796554656872"/>
          <point xsi:type="esdl:Point" lon="3.7513278862952992" lat="53.62339718360412"/>
          <point xsi:type="esdl:Point" lon="3.751327885603596" lat="53.623397144956115"/>
          <point xsi:type="esdl:Point" lon="3.751703696790855" lat="53.622424069844215"/>
          <point xsi:type="esdl:Point" lon="3.751703696458478" lat="53.62242405097263"/>
          <point xsi:type="esdl:Point" lon="3.752064391919029" lat="53.62145102540811"/>
          <point xsi:type="esdl:Point" lon="3.7520643915866523" lat="53.621451006536105"/>
          <point xsi:type="esdl:Point" lon="3.752800790490527" lat="53.61950490118787"/>
          <point xsi:type="esdl:Point" lon="3.7528008286150274" lat="53.61950483442946"/>
          <point xsi:type="esdl:Point" lon="3.7538680721242588" lat="53.61661275683334"/>
          <point xsi:type="esdl:Point" lon="3.7538680717828985" lat="53.61661273795918"/>
          <point xsi:type="esdl:Point" lon="3.7542285076752484" lat="53.61563072925013"/>
          <point xsi:type="esdl:Point" lon="3.7542285073428716" lat="53.61563071037553"/>
          <point xsi:type="esdl:Point" lon="3.755310021794133" lat="53.61270257804005"/>
          <point xsi:type="esdl:Point" lon="3.755310021461757" lat="53.61270255916414"/>
          <point xsi:type="esdl:Point" lon="3.7556405943626725" lat="53.611747752174374"/>
          <point xsi:type="esdl:Point" lon="3.755640625165903" lat="53.61174769984075"/>
          <point xsi:type="esdl:Point" lon="3.756677086545468" lat="53.60884678989792"/>
          <point xsi:type="esdl:Point" lon="3.7566771100453953" lat="53.6088467519934"/>
          <point xsi:type="esdl:Point" lon="3.7588706254240583" lat="53.6030531885707"/>
          <point xsi:type="esdl:Point" lon="3.758870657637645" lat="53.60305313083727"/>
          <point xsi:type="esdl:Point" lon="3.76031243096823" lat="53.59918790882874"/>
          <point xsi:type="esdl:Point" lon="3.7603124624451967" lat="53.59918789424879"/>
          <point xsi:type="esdl:Point" lon="3.7614087127974973" lat="53.59628656996032"/>
          <point xsi:type="esdl:Point" lon="3.7614087367106497" lat="53.59628655542202"/>
          <point xsi:type="esdl:Point" lon="3.762114543945664" lat="53.5943675242456"/>
          <point xsi:type="esdl:Point" lon="3.76211460789673" lat="53.59436746720939"/>
          <point xsi:type="esdl:Point" lon="3.76247498355704" lat="53.5934033798976"/>
          <point xsi:type="esdl:Point" lon="3.7624749825419435" lat="53.593403323275965"/>
          <point xsi:type="esdl:Point" lon="3.763870527543928" lat="53.58952035927372"/>
          <point xsi:type="esdl:Point" lon="3.763870526519848" lat="53.58952030265221"/>
          <point xsi:type="esdl:Point" lon="3.764216028765016" lat="53.58857437866993"/>
          <point xsi:type="esdl:Point" lon="3.764216027740936" lat="53.588574322047144"/>
          <point xsi:type="esdl:Point" lon="3.7678473114192874" lat="53.57887924584136"/>
          <point xsi:type="esdl:Point" lon="3.767847334982098" lat="53.5788792124327"/>
          <point xsi:type="esdl:Point" lon="3.7685674061702494" lat="53.576942021893835"/>
          <point xsi:type="esdl:Point" lon="3.76856740582889" lat="53.576942003017926"/>
          <point xsi:type="esdl:Point" lon="3.7692723051995287" lat="53.57500491028623"/>
          <point xsi:type="esdl:Point" lon="3.769272304516809" lat="53.575004872538045"/>
          <point xsi:type="esdl:Point" lon="3.7699767901324113" lat="53.5730498313704"/>
          <point xsi:type="esdl:Point" lon="3.769976789341894" lat="53.5730497882276"/>
          <point xsi:type="esdl:Point" lon="3.771401333632116" lat="53.56917548285739"/>
          <point xsi:type="esdl:Point" lon="3.7714013332099077" lat="53.56917545949157"/>
          <point xsi:type="esdl:Point" lon="3.7724961002729938" lat="53.56627408543601"/>
          <point xsi:type="esdl:Point" lon="3.7724961238178367" lat="53.566274052028064"/>
          <point xsi:type="esdl:Point" lon="3.773215896944978" lat="53.56434581356928"/>
          <point xsi:type="esdl:Point" lon="3.7732158966036184" lat="53.5643457946931"/>
          <point xsi:type="esdl:Point" lon="3.773920051693095" lat="53.56239070906975"/>
          <point xsi:type="esdl:Point" lon="3.7739200513427513" lat="53.56239069019269"/>
          <point xsi:type="esdl:Point" lon="3.7746246182558867" lat="53.560462558903055"/>
          <point xsi:type="esdl:Point" lon="3.7746246493465794" lat="53.560462525442496"/>
          <point xsi:type="esdl:Point" lon="3.7749993890233666" lat="53.559489307887844"/>
          <point xsi:type="esdl:Point" lon="3.7749993886820064" lat="53.55948928901483"/>
          <point xsi:type="esdl:Point" lon="3.7764225289593387" lat="53.555587949697454"/>
          <point xsi:type="esdl:Point" lon="3.7764225603105417" lat="53.555587930619915"/>
          <point xsi:type="esdl:Point" lon="3.7771419858794992" lat="53.55365967621598"/>
          <point xsi:type="esdl:Point" lon="3.777142016781545" lat="53.55365963287196"/>
          <point xsi:type="esdl:Point" lon="3.7782490880600945" lat="53.55065023509933"/>
          <point xsi:type="esdl:Point" lon="3.7782490877906008" lat="53.550650220721465"/>
          <point xsi:type="esdl:Point" lon="3.778608577433562" lat="53.549677113280985"/>
          <point xsi:type="esdl:Point" lon="3.7786085764005" lat="53.54967705665947"/>
          <point xsi:type="esdl:Point" lon="3.779989549929075" lat="53.546800685750426"/>
          <point xsi:type="esdl:Point" lon="3.779989581010784" lat="53.54680065228975"/>
          <point xsi:type="esdl:Point" lon="3.7805761481836546" lat="53.54587102719631"/>
          <point xsi:type="esdl:Point" lon="3.780576147842295" lat="53.54587100832256"/>
          <point xsi:type="esdl:Point" lon="3.7811932334443803" lat="53.544959132422996"/>
          <point xsi:type="esdl:Point" lon="3.781193233085054" lat="53.54495911264675"/>
          <point xsi:type="esdl:Point" lon="3.78187065153588" lat="53.544046838915975"/>
          <point xsi:type="esdl:Point" lon="3.7818706511945206" lat="53.5440468200414"/>
          <point xsi:type="esdl:Point" lon="3.783362150965287" lat="53.54227530288928"/>
          <point xsi:type="esdl:Point" lon="3.783362150165787" lat="53.54227525974713"/>
          <point xsi:type="esdl:Point" lon="3.785111401403035" lat="53.540573902510836"/>
          <point xsi:type="esdl:Point" lon="3.785111432736272" lat="53.540573883426525"/>
          <point xsi:type="esdl:Point" lon="3.786062088522118" lat="53.53975866540968"/>
          <point xsi:type="esdl:Point" lon="3.786062119594843" lat="53.53975863194342"/>
          <point xsi:type="esdl:Point" lon="3.7881153911142436" lat="53.53819008963363"/>
          <point xsi:type="esdl:Point" lon="3.7881153907459346" lat="53.53819006985956"/>
          <point xsi:type="esdl:Point" lon="3.7903510581769164" lat="53.53670118227151"/>
          <point xsi:type="esdl:Point" lon="3.79035105781759" lat="53.53670116339901"/>
          <point xsi:type="esdl:Point" lon="3.7939647862234" lat="53.53468170533682"/>
          <point xsi:type="esdl:Point" lon="3.793964873368966" lat="53.53468168588146"/>
          <point xsi:type="esdl:Point" lon="3.7966273324485753" lat="53.53345055590996"/>
          <point xsi:type="esdl:Point" lon="3.7966273949982683" lat="53.533450512347706"/>
          <point xsi:type="esdl:Point" lon="3.7979747295569446" lat="53.53289324779014"/>
          <point xsi:type="esdl:Point" lon="3.7979747847494356" lat="53.53289321416363"/>
          <point xsi:type="esdl:Point" lon="3.800821228869347" lat="53.531822502334315"/>
          <point xsi:type="esdl:Point" lon="3.800821260552927" lat="53.53182250212073"/>
          <point xsi:type="esdl:Point" lon="3.8107083406514506" lat="53.528133359567455"/>
          <point xsi:type="esdl:Point" lon="3.8107083647801994" lat="53.528133359407256"/>
          <point xsi:type="esdl:Point" lon="3.8135544871864577" lat="53.5270803333059"/>
          <point xsi:type="esdl:Point" lon="3.8135544867193336" lat="53.527080309035746"/>
          <point xsi:type="esdl:Point" lon="3.8191705658852095" lat="53.52495656520406"/>
          <point xsi:type="esdl:Point" lon="3.8191705972004804" lat="53.52495654611271"/>
          <point xsi:type="esdl:Point" lon="3.8205931676135454" lat="53.52441647839956"/>
          <point xsi:type="esdl:Point" lon="3.8205932302261214" lat="53.52441644021637"/>
          <point xsi:type="esdl:Point" lon="3.8234084605579044" lat="53.52335440137025"/>
          <point xsi:type="esdl:Point" lon="3.8234085552133865" lat="53.523354381840264"/>
          <point xsi:type="esdl:Point" lon="3.82623904000769" lat="53.52231016017085"/>
          <point xsi:type="esdl:Point" lon="3.826239073191456" lat="53.522310159941206"/>
          <point xsi:type="esdl:Point" lon="3.83898147290863" lat="53.517556187665726"/>
          <point xsi:type="esdl:Point" lon="3.8389815136292613" lat="53.51755618737731"/>
          <point xsi:type="esdl:Point" lon="3.8445648827101904" lat="53.51543146799443"/>
          <point xsi:type="esdl:Point" lon="3.844564945762941" lat="53.51543145316659"/>
          <point xsi:type="esdl:Point" lon="3.84883151444391" lat="53.51385517798409"/>
          <point xsi:type="esdl:Point" lon="3.8488315702382723" lat="53.51385517758881"/>
          <point xsi:type="esdl:Point" lon="3.8798681775330004" lat="53.502214875031186"/>
          <point xsi:type="esdl:Point" lon="3.87986817704791" lat="53.50221485166579"/>
          <point xsi:type="esdl:Point" lon="3.8959037503449077" lat="53.49620802840367"/>
          <point xsi:type="esdl:Point" lon="3.8959038373647097" lat="53.496208008877204"/>
          <point xsi:type="esdl:Point" lon="3.9007943448142184" lat="53.49437345933443"/>
          <point xsi:type="esdl:Point" lon="3.900794376470849" lat="53.494373459099286"/>
          <point xsi:type="esdl:Point" lon="3.90504176409031" lat="53.492795273927406"/>
          <point xsi:type="esdl:Point" lon="3.9050417882100747" lat="53.492795273745706"/>
          <point xsi:type="esdl:Point" lon="3.909273992872912" lat="53.4912260298711"/>
          <point xsi:type="esdl:Point" lon="3.9092740245205593" lat="53.4912260296306"/>
          <point xsi:type="esdl:Point" lon="3.9191415514753847" lat="53.487501051723484"/>
          <point xsi:type="esdl:Point" lon="3.9191416139262634" lat="53.487501012593036"/>
          <point xsi:type="esdl:Point" lon="3.9219971328092074" lat="53.48643633903834"/>
          <point xsi:type="esdl:Point" lon="3.9219971644478724" lat="53.48643633879247"/>
          <point xsi:type="esdl:Point" lon="3.926197565578599" lat="53.48484874968504"/>
          <point xsi:type="esdl:Point" lon="3.9261976451244176" lat="53.48484873468616"/>
          <point xsi:type="esdl:Point" lon="3.929022668745699" lat="53.483784103616294"/>
          <point xsi:type="esdl:Point" lon="3.929022700384363" lat="53.483784103370404"/>
          <point xsi:type="esdl:Point" lon="3.931832713148263" lat="53.482728514513035"/>
          <point xsi:type="esdl:Point" lon="3.931832736845821" lat="53.482728495450765"/>
          <point xsi:type="esdl:Point" lon="3.969083780570956" lat="53.46875994744457"/>
          <point xsi:type="esdl:Point" lon="3.9690838667463413" lat="53.46875989460769"/>
          <point xsi:type="esdl:Point" lon="3.971891854312332" lat="53.467703389263136"/>
          <point xsi:type="esdl:Point" lon="3.9718918949790654" lat="53.46770338893159"/>
          <point xsi:type="esdl:Point" lon="3.9746845405417126" lat="53.4666379160864"/>
          <point xsi:type="esdl:Point" lon="3.980299106711088" lat="53.46448858553698"/>
          <point xsi:type="esdl:Point" lon="3.9816871395874416" lat="53.46392885568722"/>
          <point xsi:type="esdl:Point" lon="3.9816871944385728" lat="53.46392881748161"/>
          <point xsi:type="esdl:Point" lon="3.99724739693911" lat="53.45813686711941"/>
          <point xsi:type="esdl:Point" lon="3.997247420690566" lat="53.458136852538956"/>
          <point xsi:type="esdl:Point" lon="4.001486981720147" lat="53.456528315264514"/>
          <point xsi:type="esdl:Point" lon="4.001487021937722" lat="53.4565282960514"/>
          <point xsi:type="esdl:Point" lon="4.004293627472598" lat="53.45547999568928"/>
          <point xsi:type="esdl:Point" lon="4.004293659093297" lat="53.45547999542184"/>
          <point xsi:type="esdl:Point" lon="4.0126962682710285" lat="53.452271876724744"/>
          <point xsi:type="esdl:Point" lon="4.012696299891727" lat="53.45227187645728"/>
          <point xsi:type="esdl:Point" lon="4.016904805299553" lat="53.450672032154635"/>
          <point xsi:type="esdl:Point" lon="4.016904867525852" lat="53.450671989373895"/>
          <point xsi:type="esdl:Point" lon="4.019710465600138" lat="53.44961436746148"/>
          <point xsi:type="esdl:Point" lon="4.019710496762696" lat="53.44961434832014"/>
          <point xsi:type="esdl:Point" lon="4.023933671353684" lat="53.44802313110334"/>
          <point xsi:type="esdl:Point" lon="4.023933702516241" lat="53.448023111955926"/>
          <point xsi:type="esdl:Point" lon="4.032409298184858" lat="53.4448399566526"/>
          <point xsi:type="esdl:Point" lon="4.032409321684785" lat="53.44483993218018"/>
          <point xsi:type="esdl:Point" lon="4.033812344586588" lat="53.44433340165701"/>
          <point xsi:type="esdl:Point" lon="4.03381244058056" lat="53.444333386445834"/>
          <point xsi:type="esdl:Point" lon="4.036646876452944" lat="53.443257123671394"/>
          <point xsi:type="esdl:Point" lon="4.036646940260279" lat="53.44325708536158"/>
          <point xsi:type="esdl:Point" lon="4.047910058147948" lat="53.43902384511101"/>
          <point xsi:type="esdl:Point" lon="4.047910089292539" lat="53.43902382595955"/>
          <point xsi:type="esdl:Point" lon="4.052160344163707" lat="53.43739540537688"/>
          <point xsi:type="esdl:Point" lon="4.052160375299314" lat="53.43739538622468"/>
          <point xsi:type="esdl:Point" lon="4.066208322077153" lat="53.43208407959892"/>
          <point xsi:type="esdl:Point" lon="4.066208362707953" lat="53.432084079235"/>
          <point xsi:type="esdl:Point" lon="4.074707668177802" lat="53.4288976584863"/>
          <point xsi:type="esdl:Point" lon="4.074707699304426" lat="53.428897639330266"/>
          <point xsi:type="esdl:Point" lon="4.0817138560559725" lat="53.42622754213097"/>
          <point xsi:type="esdl:Point" lon="4.081713920761622" lat="53.426227541542175"/>
          <point xsi:type="esdl:Point" lon="4.090150224191576" lat="53.42302260495301"/>
          <point xsi:type="esdl:Point" lon="4.09015024676624" lat="53.42302260474424"/>
          <point xsi:type="esdl:Point" lon="4.118269833216854" lat="53.41243400120515"/>
          <point xsi:type="esdl:Point" lon="4.118269896386385" lat="53.412434000610816"/>
          <point xsi:type="esdl:Point" lon="4.123901354314667" lat="53.41032258700369"/>
          <point xsi:type="esdl:Point" lon="4.123901416469102" lat="53.41032254776461"/>
          <point xsi:type="esdl:Point" lon="4.137915829478744" lat="53.404985076768604"/>
          <point xsi:type="esdl:Point" lon="4.137915884096313" lat="53.40498503759421"/>
          <point xsi:type="esdl:Point" lon="4.147728936700269" lat="53.40126847997321"/>
          <point xsi:type="esdl:Point" lon="4.147729022758873" lat="53.40126843599658"/>
          <point xsi:type="esdl:Point" lon="4.150604269319194" lat="53.40024299172413"/>
          <point xsi:type="esdl:Point" lon="4.150604300266155" lat="53.40024296805619"/>
          <point xsi:type="esdl:Point" lon="4.153557710281393" lat="53.39933356464923"/>
          <point xsi:type="esdl:Point" lon="4.153557796474744" lat="53.39933352605879"/>
          <point xsi:type="esdl:Point" lon="4.158220944538941" lat="53.39824562671437"/>
          <point xsi:type="esdl:Point" lon="4.158221039266287" lat="53.3982456257931"/>
          <point xsi:type="esdl:Point" lon="4.163027519966003" lat="53.39746179779389"/>
          <point xsi:type="esdl:Point" lon="4.163027551029746" lat="53.39746177861298"/>
          <point xsi:type="esdl:Point" lon="4.166311333666506" lat="53.39709714492519"/>
          <point xsi:type="esdl:Point" lon="4.166311428393853" lat="53.397097143998536"/>
          <point xsi:type="esdl:Point" lon="4.167947071053574" lat="53.39696428862562"/>
          <point xsi:type="esdl:Point" lon="4.177889784608162" lat="53.397010451736065"/>
          <point xsi:type="esdl:Point" lon="4.179518320471092" lat="53.39716516870586"/>
          <point xsi:type="esdl:Point" lon="4.179518376499017" lat="53.39716518253592"/>
          <point xsi:type="esdl:Point" lon="4.184408819916611" lat="53.39779993810108"/>
          <point xsi:type="esdl:Point" lon="4.187583769141418" lat="53.398388677249706"/>
          <point xsi:type="esdl:Point" lon="4.1875838007172" lat="53.39838867693369"/>
          <point xsi:type="esdl:Point" lon="4.198567147005323" lat="53.40067005149278"/>
          <point xsi:type="esdl:Point" lon="4.198567266202779" lat="53.400670064679"/>
          <point xsi:type="esdl:Point" lon="4.198733682253265" lat="53.40070435516059"/>
          <point xsi:type="esdl:Point" lon="4.198733682657506" lat="53.4007043695358"/>
          <point xsi:type="esdl:Point" lon="4.198930349933327" lat="53.400747315743686"/>
          <point xsi:type="esdl:Point" lon="4.198930413623881" lat="53.400747333985834"/>
          <point xsi:type="esdl:Point" lon="4.199444692135146" lat="53.40085003874326"/>
          <point xsi:type="esdl:Point" lon="4.199792555646954" lat="53.40091847138482"/>
          <point xsi:type="esdl:Point" lon="4.199792587222736" lat="53.40091847106346"/>
          <point xsi:type="esdl:Point" lon="4.199974196713185" lat="53.40096156597489"/>
          <point xsi:type="esdl:Point" lon="4.200518685899833" lat="53.401063972387384"/>
          <point xsi:type="esdl:Point" lon="4.200518725650284" lat="53.401063995358605"/>
          <point xsi:type="esdl:Point" lon="4.201365535156222" lat="53.4012262682375"/>
          <point xsi:type="esdl:Point" lon="4.201365559222088" lat="53.40122626799649"/>
          <point xsi:type="esdl:Point" lon="4.2014927550248995" lat="53.401269927870786"/>
          <point xsi:type="esdl:Point" lon="4.201511675134802" lat="53.40127422677787"/>
          <point xsi:type="esdl:Point" lon="4.201511697691498" lat="53.40127422655292"/>
          <point xsi:type="esdl:Point" lon="4.201526979157376" lat="53.40128306036454"/>
          <point xsi:type="esdl:Point" lon="4.201537585799497" lat="53.401291951112015"/>
          <point xsi:type="esdl:Point" lon="4.201543560422587" lat="53.40130535439968"/>
          <point xsi:type="esdl:Point" lon="4.201543560952593" lat="53.401305373268215"/>
          <point xsi:type="esdl:Point" lon="4.201542065410358" lat="53.40131886521715"/>
          <point xsi:type="esdl:Point" lon="4.201542065940363" lat="53.401318884085676"/>
          <point xsi:type="esdl:Point" lon="4.201352888323309" lat="53.40164440215422"/>
          <point xsi:type="esdl:Point" lon="4.201349500991969" lat="53.40165791313181"/>
          <point xsi:type="esdl:Point" lon="4.201350841431086" lat="53.40167137654053"/>
          <point xsi:type="esdl:Point" lon="4.201350867491213" lat="53.401671447295584"/>
          <point xsi:type="esdl:Point" lon="4.201358730579642" lat="53.40168476955951"/>
          <point xsi:type="esdl:Point" lon="4.201372135887099" lat="53.40169363665766"/>
          <point xsi:type="esdl:Point" lon="4.201372199604602" lat="53.40169365578846"/>
          <point xsi:type="esdl:Point" lon="4.201389300069098" lat="53.4017024479469"/>
          <point xsi:type="esdl:Point" lon="4.2018759238275605" lat="53.40182340562555"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="10000000000.0" name="Pipe_Wintershall Noordzee B_V__3" id="Pipe_Wintershall Noordzee B_V__3" diameter="DN500" length="31899.49913925324">
        <port xsi:type="esdl:InPort" name="InPort" id="1aaad9fd-a888-4877-b634-3311c239fcef" connectedTo="a3c5edd6-6081-4f7f-a852-29f1f6eb4111" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="455a7611-d5a3-492e-81d0-338f680f8b78" name="OutPort" id="b4d8d75c-e83d-4b6e-9922-0b741de4f603" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.010460700885419" lat="54.11523933863713"/>
          <point xsi:type="esdl:Point" lon="3.946107861450469" lat="54.08688074426048"/>
          <point xsi:type="esdl:Point" lon="3.94597534327333" lat="54.086834677447534"/>
          <point xsi:type="esdl:Point" lon="3.6217343068673227" lat="53.942729758750616"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="6000000000.0" name="Pipe_Noordgastransport B_V__4" id="Pipe_Noordgastransport B_V__4" diameter="DN800" length="64526.90370524039">
        <port xsi:type="esdl:InPort" name="InPort" id="c1eeb675-bbac-42ae-9253-0d5b3f2ef854" connectedTo="895f1148-4200-458a-8698-b95eba4ad949" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" name="OutPort" id="2e73e37b-3796-41cb-bf0e-2a554d220e04" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.438708615226464" lat="54.048902189771546"/>
          <point xsi:type="esdl:Point" lon="5.438755961616232" lat="54.04883416371717"/>
          <point xsi:type="esdl:Point" lon="5.439278470267553" lat="54.048977652106586"/>
          <point xsi:type="esdl:Point" lon="5.56578684460204" lat="53.93022610928613"/>
          <point xsi:type="esdl:Point" lon="5.567690738219318" lat="53.92777561352812"/>
          <point xsi:type="esdl:Point" lon="5.949881067970367" lat="53.55523437892454"/>
          <point xsi:type="esdl:Point" lon="5.949885728663623" lat="53.55522544893675"/>
          <point xsi:type="esdl:Point" lon="5.949888523996208" lat="53.555198313738096"/>
          <point xsi:type="esdl:Point" lon="5.949887078535051" lat="53.55519186701637"/>
          <point xsi:type="esdl:Point" lon="5.949884389266551" lat="53.55518716309042"/>
          <point xsi:type="esdl:Point" lon="5.949878937498889" lat="53.55518336272238"/>
          <point xsi:type="esdl:Point" lon="5.949872556675595" lat="53.55517986133799"/>
          <point xsi:type="esdl:Point" lon="5.949865796026632" lat="53.55517778019009"/>
          <point xsi:type="esdl:Point" lon="5.949858011648588" lat="53.555176590252174"/>
          <point xsi:type="esdl:Point" lon="5.949339232613682" lat="53.555138767073004"/>
          <point xsi:type="esdl:Point" lon="5.949333051306212" lat="53.55513754563302"/>
          <point xsi:type="esdl:Point" lon="5.949330516422177" lat="53.555135080516045"/>
          <point xsi:type="esdl:Point" lon="5.949329722006039" lat="53.55513225861568"/>
          <point xsi:type="esdl:Point" lon="5.949331044128506" lat="53.55512098767271"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="14000000000.0" name="Pipe_Noordgastransport B_V__5" id="Pipe_Noordgastransport B_V__5" diameter="DN800" length="39500.08082431462">
        <port xsi:type="esdl:InPort" name="InPort" id="807b01a9-8445-4b34-bd92-54d8ea7d0a81" connectedTo="6b368901-7cfb-4a28-ae30-272a209477b3" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="bbd74c33-142e-4cf5-aab5-eebbfd8108be" name="OutPort" id="f17e5722-26dc-46cb-82e4-e8bedb50532e" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.2021020197054755" lat="53.402006313670235"/>
          <point xsi:type="esdl:Point" lon="4.205445716647921" lat="53.4013649224219"/>
          <point xsi:type="esdl:Point" lon="4.210139341953576" lat="53.399798244539994"/>
          <point xsi:type="esdl:Point" lon="4.216942117708331" lat="53.398186529388774"/>
          <point xsi:type="esdl:Point" lon="4.218736603764423" lat="53.39800282193413"/>
          <point xsi:type="esdl:Point" lon="4.220125756795021" lat="53.39807699791765"/>
          <point xsi:type="esdl:Point" lon="4.22145183577677" lat="53.39828071305577"/>
          <point xsi:type="esdl:Point" lon="4.230268902734279" lat="53.40048246769667"/>
          <point xsi:type="esdl:Point" lon="4.245752509852109" lat="53.40584138875145"/>
          <point xsi:type="esdl:Point" lon="4.248162848824089" lat="53.406472439842396"/>
          <point xsi:type="esdl:Point" lon="4.251580077130554" lat="53.40706592890452"/>
          <point xsi:type="esdl:Point" lon="4.260008732447908" lat="53.40822680084306"/>
          <point xsi:type="esdl:Point" lon="4.271766427858416" lat="53.40951348665739"/>
          <point xsi:type="esdl:Point" lon="4.277518412128528" lat="53.41068362872383"/>
          <point xsi:type="esdl:Point" lon="4.280703073057839" lat="53.41084224823626"/>
          <point xsi:type="esdl:Point" lon="4.28651564901726" lat="53.411692723178824"/>
          <point xsi:type="esdl:Point" lon="4.31340078949601" lat="53.414105849559945"/>
          <point xsi:type="esdl:Point" lon="4.319180705011387" lat="53.41503178221062"/>
          <point xsi:type="esdl:Point" lon="4.36722775561219" lat="53.41425714174515"/>
          <point xsi:type="esdl:Point" lon="4.376182073709558" lat="53.41346729754579"/>
          <point xsi:type="esdl:Point" lon="4.412105160219414" lat="53.41276362923958"/>
          <point xsi:type="esdl:Point" lon="4.418172406873052" lat="53.41239227810776"/>
          <point xsi:type="esdl:Point" lon="4.433145368437305" lat="53.4133132893113"/>
          <point xsi:type="esdl:Point" lon="4.436164942050198" lat="53.41324976996459"/>
          <point xsi:type="esdl:Point" lon="4.439142441117414" lat="53.413009676544974"/>
          <point xsi:type="esdl:Point" lon="4.454147188472052" lat="53.4128703162626"/>
          <point xsi:type="esdl:Point" lon="4.457210078542518" lat="53.41268015230065"/>
          <point xsi:type="esdl:Point" lon="4.473652712621747" lat="53.41260420856118"/>
          <point xsi:type="esdl:Point" lon="4.476729813860344" lat="53.412453458991195"/>
          <point xsi:type="esdl:Point" lon="4.482682358507091" lat="53.41266322558807"/>
          <point xsi:type="esdl:Point" lon="4.487446421908933" lat="53.41250508859999"/>
          <point xsi:type="esdl:Point" lon="4.490534848037639" lat="53.41261939880951"/>
          <point xsi:type="esdl:Point" lon="4.491481703114399" lat="53.412589594119005"/>
          <point xsi:type="esdl:Point" lon="4.497470314760475" lat="53.41174153038979"/>
          <point xsi:type="esdl:Point" lon="4.499032166182549" lat="53.4116590053832"/>
          <point xsi:type="esdl:Point" lon="4.5043771543311655" lat="53.41164643843376"/>
          <point xsi:type="esdl:Point" lon="4.505122966824632" lat="53.411582382901834"/>
          <point xsi:type="esdl:Point" lon="4.508196872594068" lat="53.411227338085574"/>
          <point xsi:type="esdl:Point" lon="4.509607517251898" lat="53.41118415681495"/>
          <point xsi:type="esdl:Point" lon="4.511386245456537" lat="53.411278521878906"/>
          <point xsi:type="esdl:Point" lon="4.514092265137847" lat="53.411217268153905"/>
          <point xsi:type="esdl:Point" lon="4.518618847557593" lat="53.4108067591493"/>
          <point xsi:type="esdl:Point" lon="4.524505315159362" lat="53.410784064774695"/>
          <point xsi:type="esdl:Point" lon="4.529180448240652" lat="53.410962057339106"/>
          <point xsi:type="esdl:Point" lon="4.538178030774155" lat="53.410738605361594"/>
          <point xsi:type="esdl:Point" lon="4.54006767712001" lat="53.41057041443636"/>
          <point xsi:type="esdl:Point" lon="4.5458937089171245" lat="53.41066592680773"/>
          <point xsi:type="esdl:Point" lon="4.549044580920763" lat="53.41042731886393"/>
          <point xsi:type="esdl:Point" lon="4.560958122399882" lat="53.410362054075776"/>
          <point xsi:type="esdl:Point" lon="4.5631652413891" lat="53.410484203312635"/>
          <point xsi:type="esdl:Point" lon="4.564301863018416" lat="53.41046212895897"/>
          <point xsi:type="esdl:Point" lon="4.569808470716959" lat="53.41003691686038"/>
          <point xsi:type="esdl:Point" lon="4.5772986773829984" lat="53.41016887834555"/>
          <point xsi:type="esdl:Point" lon="4.584554449056442" lat="53.40969164024435"/>
          <point xsi:type="esdl:Point" lon="4.590886193362647" lat="53.40976376848459"/>
          <point xsi:type="esdl:Point" lon="4.595356556229508" lat="53.409682636638806"/>
          <point xsi:type="esdl:Point" lon="4.599795018061115" lat="53.40968617642976"/>
          <point xsi:type="esdl:Point" lon="4.602624969184275" lat="53.4093245894561"/>
          <point xsi:type="esdl:Point" lon="4.604425741345301" lat="53.409201518012644"/>
          <point xsi:type="esdl:Point" lon="4.608728815187863" lat="53.40920654367242"/>
          <point xsi:type="esdl:Point" lon="4.61036450074214" lat="53.409094594806255"/>
          <point xsi:type="esdl:Point" lon="4.613556835080606" lat="53.40916836340649"/>
          <point xsi:type="esdl:Point" lon="4.619379706892011" lat="53.40878387414844"/>
          <point xsi:type="esdl:Point" lon="4.623777403193992" lat="53.40890393807143"/>
          <point xsi:type="esdl:Point" lon="4.626630686673251" lat="53.40876621120703"/>
          <point xsi:type="esdl:Point" lon="4.62835309547726" lat="53.408562936180054"/>
          <point xsi:type="esdl:Point" lon="4.645115450305716" lat="53.40823425577536"/>
          <point xsi:type="esdl:Point" lon="4.646344999012997" lat="53.40812740942312"/>
          <point xsi:type="esdl:Point" lon="4.647834333044428" lat="53.40812483921546"/>
          <point xsi:type="esdl:Point" lon="4.650743718352356" lat="53.4082734344832"/>
          <point xsi:type="esdl:Point" lon="4.661449647112066" lat="53.407888138696926"/>
          <point xsi:type="esdl:Point" lon="4.666197902141202" lat="53.40796886140734"/>
          <point xsi:type="esdl:Point" lon="4.670964719400413" lat="53.40752466300259"/>
          <point xsi:type="esdl:Point" lon="4.674939951975109" lat="53.40761279961585"/>
          <point xsi:type="esdl:Point" lon="4.677537347524977" lat="53.40747744470323"/>
          <point xsi:type="esdl:Point" lon="4.679486051596961" lat="53.40728220661892"/>
          <point xsi:type="esdl:Point" lon="4.6885937372302235" lat="53.407016910564245"/>
          <point xsi:type="esdl:Point" lon="4.690103584740325" lat="53.40710000663639"/>
          <point xsi:type="esdl:Point" lon="4.697531315357019" lat="53.4068649010754"/>
          <point xsi:type="esdl:Point" lon="4.7018607689016365" lat="53.407007334853745"/>
          <point xsi:type="esdl:Point" lon="4.7348642393255425" lat="53.405795127933885"/>
          <point xsi:type="esdl:Point" lon="4.737983976116693" lat="53.40589565910655"/>
          <point xsi:type="esdl:Point" lon="4.742427300178592" lat="53.405693972533825"/>
          <point xsi:type="esdl:Point" lon="4.747095499568446" lat="53.405881514589666"/>
          <point xsi:type="esdl:Point" lon="4.767411764248454" lat="53.405477816064376"/>
          <point xsi:type="esdl:Point" lon="4.768233739433105" lat="53.405393545887186"/>
          <point xsi:type="esdl:Point" lon="4.771013321632009" lat="53.40502159895008"/>
          <point xsi:type="esdl:Point" lon="4.7727215492446655" lat="53.40491282051896"/>
          <point xsi:type="esdl:Point" lon="4.7763565952291245" lat="53.40508209660298"/>
          <point xsi:type="esdl:Point" lon="4.777077140637915" lat="53.40504836027513"/>
          <point xsi:type="esdl:Point" lon="4.781335712875551" lat="53.40471519079541"/>
          <point xsi:type="esdl:Point" lon="4.785041600838747" lat="53.40471854340059"/>
          <point xsi:type="esdl:Point" lon="4.788270048924873" lat="53.40501696863106"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="14000000000.0" name="Pipe_Noordgastransport B_V__6" id="Pipe_Noordgastransport B_V__6" diameter="DN800" length="79467.51651055354">
        <port xsi:type="esdl:InPort" name="InPort" id="a770de95-d2ea-417f-8cdb-59ee45f3621f" connectedTo="1f7025c6-e9fb-4eea-a716-98a284654c6d" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" name="OutPort" id="0b5222fd-99fe-4280-927d-77252f7e49e7" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.788270048924873" lat="53.40501696863106"/>
          <point xsi:type="esdl:Point" lon="4.791036744539497" lat="53.405019542673486"/>
          <point xsi:type="esdl:Point" lon="4.793636575826342" lat="53.40495353984059"/>
          <point xsi:type="esdl:Point" lon="4.795264456053863" lat="53.40502795997733"/>
          <point xsi:type="esdl:Point" lon="4.79676563227924" lat="53.404951439732464"/>
          <point xsi:type="esdl:Point" lon="4.799612899202052" lat="53.404517754908674"/>
          <point xsi:type="esdl:Point" lon="4.801076947365034" lat="53.40444595808867"/>
          <point xsi:type="esdl:Point" lon="4.80282357084143" lat="53.40448252405291"/>
          <point xsi:type="esdl:Point" lon="4.805606604762915" lat="53.40483602642899"/>
          <point xsi:type="esdl:Point" lon="4.835165414954659" lat="53.411739622024115"/>
          <point xsi:type="esdl:Point" lon="4.870931416798792" lat="53.418286229210494"/>
          <point xsi:type="esdl:Point" lon="4.875199940537212" lat="53.41884857237401"/>
          <point xsi:type="esdl:Point" lon="4.883555031127117" lat="53.42095559961158"/>
          <point xsi:type="esdl:Point" lon="4.888100135200038" lat="53.42159861308113"/>
          <point xsi:type="esdl:Point" lon="4.890894528542869" lat="53.42221004441134"/>
          <point xsi:type="esdl:Point" lon="4.897840060592021" lat="53.423381484510514"/>
          <point xsi:type="esdl:Point" lon="4.906277954102911" lat="53.42561147546902"/>
          <point xsi:type="esdl:Point" lon="4.913576314113455" lat="53.42691518201647"/>
          <point xsi:type="esdl:Point" lon="4.91502219351744" lat="53.42726958779924"/>
          <point xsi:type="esdl:Point" lon="4.931097407258071" lat="53.42991451935497"/>
          <point xsi:type="esdl:Point" lon="4.952007773074626" lat="53.434546104259134"/>
          <point xsi:type="esdl:Point" lon="4.970930644298605" lat="53.43810107771264"/>
          <point xsi:type="esdl:Point" lon="4.974704210329194" lat="53.439024158822605"/>
          <point xsi:type="esdl:Point" lon="5.016805527938555" lat="53.4469727041226"/>
          <point xsi:type="esdl:Point" lon="5.019320877586713" lat="53.447597641694465"/>
          <point xsi:type="esdl:Point" lon="5.056770952064165" lat="53.45471505229848"/>
          <point xsi:type="esdl:Point" lon="5.059696849925168" lat="53.45510515635337"/>
          <point xsi:type="esdl:Point" lon="5.068058752332075" lat="53.45704867130218"/>
          <point xsi:type="esdl:Point" lon="5.08070900733203" lat="53.46018920150107"/>
          <point xsi:type="esdl:Point" lon="5.102320979241494" lat="53.46419798280462"/>
          <point xsi:type="esdl:Point" lon="5.11055143708379" lat="53.46611164245437"/>
          <point xsi:type="esdl:Point" lon="5.119392549219558" lat="53.46739922809262"/>
          <point xsi:type="esdl:Point" lon="5.199441722832366" lat="53.48325318229643"/>
          <point xsi:type="esdl:Point" lon="5.2252394013209695" lat="53.48783892892453"/>
          <point xsi:type="esdl:Point" lon="5.230807083364637" lat="53.489261695970946"/>
          <point xsi:type="esdl:Point" lon="5.271074659860513" lat="53.49703819216908"/>
          <point xsi:type="esdl:Point" lon="5.273919784310356" lat="53.49739459084806"/>
          <point xsi:type="esdl:Point" lon="5.293760485981383" lat="53.501825351606065"/>
          <point xsi:type="esdl:Point" lon="5.308100092797986" lat="53.504579077070936"/>
          <point xsi:type="esdl:Point" lon="5.3139825298567045" lat="53.50542730909664"/>
          <point xsi:type="esdl:Point" lon="5.379762566199114" lat="53.51854757210766"/>
          <point xsi:type="esdl:Point" lon="5.382685183789991" lat="53.518959375572265"/>
          <point xsi:type="esdl:Point" lon="5.396885340876009" lat="53.52193224359884"/>
          <point xsi:type="esdl:Point" lon="5.445887453409293" lat="53.53127928247645"/>
          <point xsi:type="esdl:Point" lon="5.511905821447357" lat="53.5346791005022"/>
          <point xsi:type="esdl:Point" lon="5.517760603510728" lat="53.534599955032526"/>
          <point xsi:type="esdl:Point" lon="5.556611003204266" lat="53.53753291446297"/>
          <point xsi:type="esdl:Point" lon="5.619889564422997" lat="53.540281898253006"/>
          <point xsi:type="esdl:Point" lon="5.622870156425669" lat="53.54063911040415"/>
          <point xsi:type="esdl:Point" lon="5.949309530160172" lat="53.55512637524054"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="14000000000.0" name="Pipe_Noordgastransport B_V__7" id="Pipe_Noordgastransport B_V__7" diameter="DN800" length="57414.97987701351">
        <port xsi:type="esdl:InPort" name="InPort" id="324ecaa9-c9b6-4ad7-a209-036ca42bf923" connectedTo="3e73f2c5-5936-4950-be17-3aecf5cfcac9" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="24bbeb1d-cee8-49cd-beaf-9a85219355af" name="OutPort" id="71f64b37-a1e2-4966-a2f6-e543b8e714ca" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.949309530160172" lat="53.55512637524054"/>
          <point xsi:type="esdl:Point" lon="6.0528710277366296" lat="53.56005382886746"/>
          <point xsi:type="esdl:Point" lon="6.058886918244461" lat="53.56054977661937"/>
          <point xsi:type="esdl:Point" lon="6.071031428027664" lat="53.56077784453837"/>
          <point xsi:type="esdl:Point" lon="6.124725655987258" lat="53.56317174063936"/>
          <point xsi:type="esdl:Point" lon="6.271420146068295" lat="53.56143208495749"/>
          <point xsi:type="esdl:Point" lon="6.276026174584471" lat="53.56181740397432"/>
          <point xsi:type="esdl:Point" lon="6.310989013798565" lat="53.567441304749806"/>
          <point xsi:type="esdl:Point" lon="6.337422853793976" lat="53.571152708617554"/>
          <point xsi:type="esdl:Point" lon="6.405781246594491" lat="53.57288414831567"/>
          <point xsi:type="esdl:Point" lon="6.409003524943448" lat="53.57261690151535"/>
          <point xsi:type="esdl:Point" lon="6.412744829067568" lat="53.57195675528364"/>
          <point xsi:type="esdl:Point" lon="6.418554275071962" lat="53.57151217634097"/>
          <point xsi:type="esdl:Point" lon="6.450713571602057" lat="53.56641488142687"/>
          <point xsi:type="esdl:Point" lon="6.459334695020436" lat="53.56553929275689"/>
          <point xsi:type="esdl:Point" lon="6.4624143307208595" lat="53.56540188298691"/>
          <point xsi:type="esdl:Point" lon="6.4836113721750115" lat="53.56616171668192"/>
          <point xsi:type="esdl:Point" lon="6.49282597329913" lat="53.56586076697671"/>
          <point xsi:type="esdl:Point" lon="6.507735075174938" lat="53.56613041559553"/>
          <point xsi:type="esdl:Point" lon="6.570971190268857" lat="53.563388728287954"/>
          <point xsi:type="esdl:Point" lon="6.576884717184125" lat="53.562675618253635"/>
          <point xsi:type="esdl:Point" lon="6.587215588586832" lat="53.560666314995856"/>
          <point xsi:type="esdl:Point" lon="6.587914846968677" lat="53.56047569784368"/>
          <point xsi:type="esdl:Point" lon="6.591746827046561" lat="53.55899350194431"/>
          <point xsi:type="esdl:Point" lon="6.6025388497951285" lat="53.55249206915339"/>
          <point xsi:type="esdl:Point" lon="6.609539195246288" lat="53.54691405913971"/>
          <point xsi:type="esdl:Point" lon="6.6099467297461025" lat="53.546518429539574"/>
          <point xsi:type="esdl:Point" lon="6.610598428217619" lat="53.5457079927627"/>
          <point xsi:type="esdl:Point" lon="6.611230716242819" lat="53.54426786195789"/>
          <point xsi:type="esdl:Point" lon="6.611355004531433" lat="53.54377205462635"/>
          <point xsi:type="esdl:Point" lon="6.611414302808428" lat="53.54302557287859"/>
          <point xsi:type="esdl:Point" lon="6.611352188250135" lat="53.54090950310465"/>
          <point xsi:type="esdl:Point" lon="6.6113878686145675" lat="53.54014637797323"/>
          <point xsi:type="esdl:Point" lon="6.6113795961279305" lat="53.53978714525603"/>
          <point xsi:type="esdl:Point" lon="6.611394134633169" lat="53.53920831486118"/>
          <point xsi:type="esdl:Point" lon="6.611359148989845" lat="53.538687821336595"/>
          <point xsi:type="esdl:Point" lon="6.611375351848725" lat="53.53781493385165"/>
          <point xsi:type="esdl:Point" lon="6.610881638801636" lat="53.522981090741055"/>
          <point xsi:type="esdl:Point" lon="6.610882147301985" lat="53.5215690439359"/>
          <point xsi:type="esdl:Point" lon="6.6106163694782705" lat="53.5136097295045"/>
          <point xsi:type="esdl:Point" lon="6.610625834783874" lat="53.51229562384723"/>
          <point xsi:type="esdl:Point" lon="6.610586946328949" lat="53.50950745396651"/>
          <point xsi:type="esdl:Point" lon="6.610683472156758" lat="53.50683004108711"/>
          <point xsi:type="esdl:Point" lon="6.610488825605237" lat="53.50276586330175"/>
          <point xsi:type="esdl:Point" lon="6.610610249777264" lat="53.500967920000136"/>
          <point xsi:type="esdl:Point" lon="6.610864332371412" lat="53.50009979742362"/>
          <point xsi:type="esdl:Point" lon="6.6122909216224794" lat="53.497530898209746"/>
          <point xsi:type="esdl:Point" lon="6.636097032790571" lat="53.473091826811476"/>
          <point xsi:type="esdl:Point" lon="6.63748665740076" lat="53.47202875970701"/>
          <point xsi:type="esdl:Point" lon="6.639040613763362" lat="53.471040798517954"/>
          <point xsi:type="esdl:Point" lon="6.64256781229079" lat="53.469426975801"/>
          <point xsi:type="esdl:Point" lon="6.644214052169306" lat="53.46896722241708"/>
          <point xsi:type="esdl:Point" lon="6.648936680086965" lat="53.46796848771502"/>
          <point xsi:type="esdl:Point" lon="6.655694017752092" lat="53.46786799180627"/>
          <point xsi:type="esdl:Point" lon="6.688384907344446" lat="53.46955291851841"/>
          <point xsi:type="esdl:Point" lon="6.68846470573318" lat="53.46951717109312"/>
          <point xsi:type="esdl:Point" lon="6.688615012196863" lat="53.46907811407812"/>
          <point xsi:type="esdl:Point" lon="6.68890215143701" lat="53.46682970924358"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="14000000000.0" name="Pipe_Wintershall Noordzee B_V__8" id="Pipe_Wintershall Noordzee B_V__8" diameter="DN500" length="120999.14810173953">
        <port xsi:type="esdl:InPort" name="InPort" id="c7dccfbf-5abc-4b8e-afc7-98c8999723ce" connectedTo="d5cb0a75-71d3-4e2b-b8c1-4e6ef4dc4111" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="e39ec930-7b25-4c5d-a213-23550f2b8a51" id="a9d5c219-ce78-435d-9859-422104f6ac5f" name="OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.218376973169268" lat="53.21788938148056"/>
          <point xsi:type="esdl:Point" lon="3.219697012346171" lat="53.21830943775387"/>
          <point xsi:type="esdl:Point" lon="3.2284644261211084" lat="53.219479498811616"/>
          <point xsi:type="esdl:Point" lon="3.235924791085787" lat="53.21982454396574"/>
          <point xsi:type="esdl:Point" lon="3.2373934061489265" lat="53.219983410423765"/>
          <point xsi:type="esdl:Point" lon="3.2388913979364533" lat="53.22003435746154"/>
          <point xsi:type="esdl:Point" lon="3.244825194177281" lat="53.22054368264189"/>
          <point xsi:type="esdl:Point" lon="3.247644291819246" lat="53.22113113140537"/>
          <point xsi:type="esdl:Point" lon="3.2520506073216304" lat="53.22163426820549"/>
          <point xsi:type="esdl:Point" lon="3.2550468094478098" lat="53.22175374571518"/>
          <point xsi:type="esdl:Point" lon="3.2608190185229775" lat="53.222712071980126"/>
          <point xsi:type="esdl:Point" lon="3.2667534816101904" lat="53.22322030435963"/>
          <point xsi:type="esdl:Point" lon="3.2755818016464815" lat="53.224189020755915"/>
          <point xsi:type="esdl:Point" lon="3.278563518232092" lat="53.22434389186057"/>
          <point xsi:type="esdl:Point" lon="3.2873632294418673" lat="53.22543763520119"/>
          <point xsi:type="esdl:Point" lon="3.293047924228831" lat="53.226565401044375"/>
          <point xsi:type="esdl:Point" lon="3.2945167861040945" lat="53.226696615712406"/>
          <point xsi:type="esdl:Point" lon="3.2988361840601357" lat="53.22745894255533"/>
          <point xsi:type="esdl:Point" lon="3.3077243322806247" lat="53.228191403117684"/>
          <point xsi:type="esdl:Point" lon="3.310604208641139" lat="53.22870529981721"/>
          <point xsi:type="esdl:Point" lon="3.3179940921210016" lat="53.22934201024729"/>
          <point xsi:type="esdl:Point" lon="3.3194489647209924" lat="53.22958082996851"/>
          <point xsi:type="esdl:Point" lon="3.322239959278962" lat="53.23020254072006"/>
          <point xsi:type="esdl:Point" lon="3.3296888790781005" lat="53.230667581625134"/>
          <point xsi:type="esdl:Point" lon="3.3311437223750464" lat="53.23088827962541"/>
          <point xsi:type="esdl:Point" lon="3.3339795335771134" lat="53.231455669912464"/>
          <point xsi:type="esdl:Point" lon="3.3428257488353985" lat="53.23238338797516"/>
          <point xsi:type="esdl:Point" lon="3.345632305313277" lat="53.23301350920708"/>
          <point xsi:type="esdl:Point" lon="3.3485568864776356" lat="53.233400513030944"/>
          <point xsi:type="esdl:Point" lon="3.3545072978771104" lat="53.23372455460357"/>
          <point xsi:type="esdl:Point" lon="3.360194764200288" lat="53.23484012891378"/>
          <point xsi:type="esdl:Point" lon="3.371908894248022" lat="53.23634127549759"/>
          <point xsi:type="esdl:Point" lon="3.377831831914207" lat="53.236879967317606"/>
          <point xsi:type="esdl:Point" lon="3.3835644796603694" lat="53.237904407333076"/>
          <point xsi:type="esdl:Point" lon="3.3865327779938" lat="53.238083589469575"/>
          <point xsi:type="esdl:Point" lon="3.3879883255250123" lat="53.23832155662367"/>
          <point xsi:type="esdl:Point" lon="3.3909134485351844" lat="53.23868955000826"/>
          <point xsi:type="esdl:Point" lon="3.3937506409329337" lat="53.239264503062266"/>
          <point xsi:type="esdl:Point" lon="3.395220577256159" lat="53.2394304232345"/>
          <point xsi:type="esdl:Point" lon="3.398203584154894" lat="53.23956430885419"/>
          <point xsi:type="esdl:Point" lon="3.4025988909831355" lat="53.240097881067584"/>
          <point xsi:type="esdl:Point" lon="3.405465691520272" lat="53.240609546021155"/>
          <point xsi:type="esdl:Point" lon="3.4128308443713804" lat="53.24142922463809"/>
          <point xsi:type="esdl:Point" lon="3.414227573263078" lat="53.24175698640386"/>
          <point xsi:type="esdl:Point" lon="3.415668407108589" lat="53.241994686754566"/>
          <point xsi:type="esdl:Point" lon="3.4231194730098906" lat="53.242363965055"/>
          <point xsi:type="esdl:Point" lon="3.4273099424387015" lat="53.24333782650556"/>
          <point xsi:type="esdl:Point" lon="3.4287508185499465" lat="53.24356636610363"/>
          <point xsi:type="esdl:Point" lon="3.439115649082119" lat="53.24454441565386"/>
          <point xsi:type="esdl:Point" lon="3.446409189038277" lat="53.24555105505166"/>
          <point xsi:type="esdl:Point" lon="3.4506885293910345" lat="53.24634398995057"/>
          <point xsi:type="esdl:Point" lon="3.456613814732349" lat="53.24687876136079"/>
          <point xsi:type="esdl:Point" lon="3.46392289701616" lat="53.2478663005207"/>
          <point xsi:type="esdl:Point" lon="3.4713045018020283" lat="53.24860142560859"/>
          <point xsi:type="esdl:Point" lon="3.477128718633958" lat="53.24943221479005"/>
          <point xsi:type="esdl:Point" lon="3.483069128721065" lat="53.249911689572414"/>
          <point xsi:type="esdl:Point" lon="3.504999708097624" lat="53.252778216921286"/>
          <point xsi:type="esdl:Point" lon="3.5079691107210498" lat="53.252918417159954"/>
          <point xsi:type="esdl:Point" lon="3.5167806292970876" lat="53.25401317241635"/>
          <point xsi:type="esdl:Point" lon="3.5197506837740162" lat="53.25419802504175"/>
          <point xsi:type="esdl:Point" lon="3.5299174041294097" lat="53.255744334358624"/>
          <point xsi:type="esdl:Point" lon="3.534373341606892" lat="53.256066041538475"/>
          <point xsi:type="esdl:Point" lon="3.5430403630523255" lat="53.257483091699655"/>
          <point xsi:type="esdl:Point" lon="3.5533387352945143" lat="53.258649284436814"/>
          <point xsi:type="esdl:Point" lon="3.5548386505277776" lat="53.2587142202053"/>
          <point xsi:type="esdl:Point" lon="3.556309628240963" lat="53.258860186227686"/>
          <point xsi:type="esdl:Point" lon="3.562107711302613" lat="53.259749873610176"/>
          <point xsi:type="esdl:Point" lon="3.56806460748741" lat="53.26016212076825"/>
          <point xsi:type="esdl:Point" lon="3.569506426111051" lat="53.26036198004838"/>
          <point xsi:type="esdl:Point" lon="3.572303521783885" lat="53.261013787951185"/>
          <point xsi:type="esdl:Point" lon="3.5752028221373098" lat="53.26145828214553"/>
          <point xsi:type="esdl:Point" lon="3.5796601740301734" lat="53.26181424196066"/>
          <point xsi:type="esdl:Point" lon="3.586887090316505" lat="53.26297442349441"/>
          <point xsi:type="esdl:Point" lon="3.5942881992878886" lat="53.2636928636621"/>
          <point xsi:type="esdl:Point" lon="3.5986306599617137" lat="53.2643812769036"/>
          <point xsi:type="esdl:Point" lon="3.604587773978984" lat="53.26473773539621"/>
          <point xsi:type="esdl:Point" lon="3.6118598058148406" lat="53.26582428924209"/>
          <point xsi:type="esdl:Point" lon="3.6133458358606227" lat="53.26594250223488"/>
          <point xsi:type="esdl:Point" lon="3.6148305530994658" lat="53.26597081175913"/>
          <point xsi:type="esdl:Point" lon="3.616301721255491" lat="53.26609806632368"/>
          <point xsi:type="esdl:Point" lon="3.6206012162458947" lat="53.266884767277865"/>
          <point xsi:type="esdl:Point" lon="3.6294748177505443" lat="53.26772818793842"/>
          <point xsi:type="esdl:Point" lon="3.635246949372968" lat="53.26870435665246"/>
          <point xsi:type="esdl:Point" lon="3.6514240618100375" lat="53.27056771524278"/>
          <point xsi:type="esdl:Point" lon="3.65290924173515" lat="53.27061352777517"/>
          <point xsi:type="esdl:Point" lon="3.654407793846835" lat="53.27055137820561"/>
          <point xsi:type="esdl:Point" lon="3.658856082555949" lat="53.27021227363224"/>
          <point xsi:type="esdl:Point" lon="3.664835246036278" lat="53.269972326274925"/>
          <point xsi:type="esdl:Point" lon="3.669235038404261" lat="53.269417366522184"/>
          <point xsi:type="esdl:Point" lon="3.6825929189191973" lat="53.26833486712344"/>
          <point xsi:type="esdl:Point" lon="3.6855906275829895" lat="53.26826372872791"/>
          <point xsi:type="esdl:Point" lon="3.715300523697605" lat="53.265958770729625"/>
          <point xsi:type="esdl:Point" lon="3.733150446319781" lat="53.26466378041091"/>
          <point xsi:type="esdl:Point" lon="3.7494211442729686" lat="53.26314233483532"/>
          <point xsi:type="esdl:Point" lon="3.7866665758452314" lat="53.260924797215424"/>
          <point xsi:type="esdl:Point" lon="3.7970219762049107" lat="53.259912158103674"/>
          <point xsi:type="esdl:Point" lon="3.804497634295599" lat="53.25964620441895"/>
          <point xsi:type="esdl:Point" lon="3.822293529002653" lat="53.25814945679561"/>
          <point xsi:type="esdl:Point" lon="3.8267875406032723" lat="53.25798352183447"/>
          <point xsi:type="esdl:Point" lon="3.829719033773736" lat="53.25763954576048"/>
          <point xsi:type="esdl:Point" lon="3.8386749755580145" lat="53.25720832875574"/>
          <point xsi:type="esdl:Point" lon="3.863990769323487" lat="53.25557129817855"/>
          <point xsi:type="esdl:Point" lon="3.8669057380651477" lat="53.255172604219595"/>
          <point xsi:type="esdl:Point" lon="3.8684024875545027" lat="53.255062811727015"/>
          <point xsi:type="esdl:Point" lon="3.875860022134333" lat="53.25470263191205"/>
          <point xsi:type="esdl:Point" lon="3.8788064219306553" lat="53.25438430605348"/>
          <point xsi:type="esdl:Point" lon="3.8862783484645687" lat="53.254005377310406"/>
          <point xsi:type="esdl:Point" lon="3.8922192052569167" lat="53.253529570169476"/>
          <point xsi:type="esdl:Point" lon="3.8952000811002705" lat="53.25343531608912"/>
          <point xsi:type="esdl:Point" lon="3.905566753771663" lat="53.252449105350735"/>
          <point xsi:type="esdl:Point" lon="3.910045204108143" lat="53.252298137287674"/>
          <point xsi:type="esdl:Point" lon="3.92783394290751" lat="53.25077665846941"/>
          <point xsi:type="esdl:Point" lon="3.9338099225249104" lat="53.250577174733415"/>
          <point xsi:type="esdl:Point" lon="3.951595655758966" lat="53.24898926166076"/>
          <point xsi:type="esdl:Point" lon="3.9605484529905906" lat="53.24854888848825"/>
          <point xsi:type="esdl:Point" lon="3.9620135272452237" lat="53.24838426910736"/>
          <point xsi:type="esdl:Point" lon="3.9635107983233806" lat="53.24831823522343"/>
          <point xsi:type="esdl:Point" lon="3.971003738526898" lat="53.24828441297105"/>
          <point xsi:type="esdl:Point" lon="3.972484176533088" lat="53.248137506722856"/>
          <point xsi:type="esdl:Point" lon="3.975349770614832" lat="53.24761068277562"/>
          <point xsi:type="esdl:Point" lon="3.978294935191706" lat="53.247289903352666"/>
          <point xsi:type="esdl:Point" lon="3.981274953808716" lat="53.24718449508562"/>
          <point xsi:type="esdl:Point" lon="3.9871806980886717" lat="53.2465694213423"/>
          <point xsi:type="esdl:Point" lon="3.9916765066073197" lat="53.24655907476968"/>
          <point xsi:type="esdl:Point" lon="3.9946379442014988" lat="53.24630066259757"/>
          <point xsi:type="esdl:Point" lon="4.007625514865875" lat="53.24413303188284"/>
          <point xsi:type="esdl:Point" lon="4.010350477393446" lat="53.24339080167988"/>
          <point xsi:type="esdl:Point" lon="4.017544427898368" lat="53.24216099196084"/>
          <point xsi:type="esdl:Point" lon="4.020299930270991" lat="53.241454248077474"/>
          <point xsi:type="esdl:Point" lon="4.030436906652743" lat="53.23987480820643"/>
          <point xsi:type="esdl:Point" lon="4.033177043845487" lat="53.23916789332092"/>
          <point xsi:type="esdl:Point" lon="4.041864851543027" lat="53.23780678308628"/>
          <point xsi:type="esdl:Point" lon="4.0460981139361785" lat="53.236897727197146"/>
          <point xsi:type="esdl:Point" lon="4.047845346146944" lat="53.23665764996815"/>
          <point xsi:type="esdl:Point" lon="4.050394407178197" lat="53.2361228089637"/>
          <point xsi:type="esdl:Point" lon="4.05332166092934" lat="53.235737421039296"/>
          <point xsi:type="esdl:Point" lon="4.054288312799854" lat="53.23544119004239"/>
          <point xsi:type="esdl:Point" lon="4.064776703967293" lat="53.23363997560217"/>
          <point xsi:type="esdl:Point" lon="4.068993868613435" lat="53.23272124852821"/>
          <point xsi:type="esdl:Point" lon="4.081941933563506" lat="53.23048289397455"/>
          <point xsi:type="esdl:Point" lon="4.087828183521448" lat="53.22983601450104"/>
          <point xsi:type="esdl:Point" lon="4.093319693315857" lat="53.22840139784244"/>
          <point xsi:type="esdl:Point" lon="4.106233788680071" lat="53.226106765349385"/>
          <point xsi:type="esdl:Point" lon="4.109176236670677" lat="53.22577377845591"/>
          <point xsi:type="esdl:Point" lon="4.1220727602423315" lat="53.22344164586681"/>
          <point xsi:type="esdl:Point" lon="4.126178826374532" lat="53.222369104005956"/>
          <point xsi:type="esdl:Point" lon="4.133366587828506" lat="53.22115929851007"/>
          <point xsi:type="esdl:Point" lon="4.134765859311783" lat="53.220831344544074"/>
          <point xsi:type="esdl:Point" lon="4.136088323041639" lat="53.22043219221942"/>
          <point xsi:type="esdl:Point" lon="4.149093326502249" lat="53.21834779427519"/>
          <point xsi:type="esdl:Point" lon="4.159464162748203" lat="53.21748322304662"/>
          <point xsi:type="esdl:Point" lon="4.160895263653038" lat="53.217235569263444"/>
          <point xsi:type="esdl:Point" lon="4.162294199858103" lat="53.21690729004353"/>
          <point xsi:type="esdl:Point" lon="4.163539263117126" lat="53.21642769205522"/>
          <point xsi:type="esdl:Point" lon="4.167128736138899" lat="53.21459466756908"/>
          <point xsi:type="esdl:Point" lon="4.170179824403674" lat="53.210600351018996"/>
          <point xsi:type="esdl:Point" lon="4.170456921485058" lat="53.20977956512918"/>
          <point xsi:type="esdl:Point" lon="4.171378000330006" lat="53.20896145265848"/>
          <point xsi:type="esdl:Point" lon="4.1754872565504595" lat="53.20317665322634"/>
          <point xsi:type="esdl:Point" lon="4.177683593824891" lat="53.20082665957856"/>
          <point xsi:type="esdl:Point" lon="4.178805670705676" lat="53.199161459290025"/>
          <point xsi:type="esdl:Point" lon="4.191936451322653" lat="53.18302930439038"/>
          <point xsi:type="esdl:Point" lon="4.192004039208174" lat="53.182228559237195"/>
          <point xsi:type="esdl:Point" lon="4.19328340328885" lat="53.18141566707685"/>
          <point xsi:type="esdl:Point" lon="4.1954477379734865" lat="53.17906564818815"/>
          <point xsi:type="esdl:Point" lon="4.2032128454927555" lat="53.16940449809361"/>
          <point xsi:type="esdl:Point" lon="4.204027997002642" lat="53.168596173859264"/>
          <point xsi:type="esdl:Point" lon="4.207114754968847" lat="53.16451058975558"/>
          <point xsi:type="esdl:Point" lon="4.209398161631855" lat="53.162195055893804"/>
          <point xsi:type="esdl:Point" lon="4.213995363059504" lat="53.15654770854212"/>
          <point xsi:type="esdl:Point" lon="4.2150396442826" lat="53.154864969763935"/>
          <point xsi:type="esdl:Point" lon="4.21798715886124" lat="53.151742409845596"/>
          <point xsi:type="esdl:Point" lon="4.220617268816951" lat="53.148515148267016"/>
          <point xsi:type="esdl:Point" lon="4.227432554168991" lat="53.14053412572376"/>
          <point xsi:type="esdl:Point" lon="4.230349215049187" lat="53.13639571639739"/>
          <point xsi:type="esdl:Point" lon="4.232509033777125" lat="53.13403604631965"/>
          <point xsi:type="esdl:Point" lon="4.233537091444156" lat="53.13235330142575"/>
          <point xsi:type="esdl:Point" lon="4.2422799949650445" lat="53.12194215098562"/>
          <point xsi:type="esdl:Point" lon="4.243110026016585" lat="53.121187335694046"/>
          <point xsi:type="esdl:Point" lon="4.251411044269678" lat="53.110636260115086"/>
          <point xsi:type="esdl:Point" lon="4.253478073182228" lat="53.108250190026716"/>
          <point xsi:type="esdl:Point" lon="4.254942815159019" lat="53.10570862676495"/>
          <point xsi:type="esdl:Point" lon="4.267413828061676" lat="53.09139952881296"/>
          <point xsi:type="esdl:Point" lon="4.267881632779689" lat="53.090549487822095"/>
          <point xsi:type="esdl:Point" lon="4.2684997600951275" lat="53.08973382920136"/>
          <point xsi:type="esdl:Point" lon="4.280810914154798" lat="53.07537100714107"/>
          <point xsi:type="esdl:Point" lon="4.281308143684016" lat="53.07452061127448"/>
          <point xsi:type="esdl:Point" lon="4.300548275306406" lat="53.05118980621729"/>
          <point xsi:type="esdl:Point" lon="4.301737157451455" lat="53.049549631517344"/>
          <point xsi:type="esdl:Point" lon="4.304716581410696" lat="53.04644243198696"/>
          <point xsi:type="esdl:Point" lon="4.3072585178944465" lat="53.04318712379696"/>
          <point xsi:type="esdl:Point" lon="4.308010793568752" lat="53.042414720884196"/>
          <point xsi:type="esdl:Point" lon="4.311800369877393" lat="53.03752739683762"/>
          <point xsi:type="esdl:Point" lon="4.313289355793684" lat="53.035973679425425"/>
          <point xsi:type="esdl:Point" lon="4.316311204857158" lat="53.031867809099175"/>
          <point xsi:type="esdl:Point" lon="4.318446273283238" lat="53.0295067912966"/>
          <point xsi:type="esdl:Point" lon="4.321469913317894" lat="53.025490657270595"/>
          <point xsi:type="esdl:Point" lon="4.322266653074498" lat="53.024726648984505"/>
          <point xsi:type="esdl:Point" lon="4.32292810197689" lat="53.02392816196327"/>
          <point xsi:type="esdl:Point" lon="4.328187013168706" lat="53.01747766784394"/>
          <point xsi:type="esdl:Point" lon="4.329193740321348" lat="53.01579426813332"/>
          <point xsi:type="esdl:Point" lon="4.3314023726574105" lat="53.01345014966602"/>
          <point xsi:type="esdl:Point" lon="4.33667396450371" lat="53.00700809887996"/>
          <point xsi:type="esdl:Point" lon="4.338280579299785" lat="53.00449976535184"/>
          <point xsi:type="esdl:Point" lon="4.341284367761421" lat="53.00140032802881"/>
          <point xsi:type="esdl:Point" lon="4.346912651178235" lat="52.99406374994069"/>
          <point xsi:type="esdl:Point" lon="4.349960083757944" lat="52.99097257103088"/>
          <point xsi:type="esdl:Point" lon="4.354476047453228" lat="52.9853113880571"/>
          <point xsi:type="esdl:Point" lon="4.357296466552909" lat="52.982141679809715"/>
          <point xsi:type="esdl:Point" lon="4.364269464493058" lat="52.97321560868467"/>
          <point xsi:type="esdl:Point" lon="4.365124855802535" lat="52.97247758131527"/>
          <point xsi:type="esdl:Point" lon="4.3662381602393125" lat="52.97188943514211"/>
          <point xsi:type="esdl:Point" lon="4.370050889456591" lat="52.970488045234255"/>
          <point xsi:type="esdl:Point" lon="4.3722920656623225" lat="52.969311446969684"/>
          <point xsi:type="esdl:Point" lon="4.377463018501739" lat="52.967552507164655"/>
          <point xsi:type="esdl:Point" lon="4.379901901711367" lat="52.966517305742265"/>
          <point xsi:type="esdl:Point" lon="4.383883465477439" lat="52.965302298387535"/>
          <point xsi:type="esdl:Point" lon="4.385072455034046" lat="52.96476701936798"/>
          <point xsi:type="esdl:Point" lon="4.387327806565128" lat="52.96358998662482"/>
          <point xsi:type="esdl:Point" lon="4.39482739590075" lat="52.960670306316"/>
          <point xsi:type="esdl:Point" lon="4.398963824900907" lat="52.959668734562385"/>
          <point xsi:type="esdl:Point" lon="4.40026013872674" lat="52.959239918013104"/>
          <point xsi:type="esdl:Point" lon="4.402590924145816" lat="52.958115634588054"/>
          <point xsi:type="esdl:Point" lon="4.407697402956932" lat="52.956284189427905"/>
          <point xsi:type="esdl:Point" lon="4.412480438031974" lat="52.95413271792788"/>
          <point xsi:type="esdl:Point" lon="4.413807356372574" lat="52.95373936689513"/>
          <point xsi:type="esdl:Point" lon="4.415211882793651" lat="52.953443943403656"/>
          <point xsi:type="esdl:Point" lon="4.416476894913241" lat="52.95297936487906"/>
          <point xsi:type="esdl:Point" lon="4.419919223397402" lat="52.95127510593606"/>
          <point xsi:type="esdl:Point" lon="4.4248852303388695" lat="52.94929174795149"/>
          <point xsi:type="esdl:Point" lon="4.43022151474663" lat="52.94771730037823"/>
          <point xsi:type="esdl:Point" lon="4.431470109839992" lat="52.94721679748055"/>
          <point xsi:type="esdl:Point" lon="4.433647685593102" lat="52.94600383340796"/>
          <point xsi:type="esdl:Point" lon="4.441340786108539" lat="52.94326763238758"/>
          <point xsi:type="esdl:Point" lon="4.444055307086372" lat="52.942551416628106"/>
          <point xsi:type="esdl:Point" lon="4.445474425570245" lat="52.942264462841415"/>
          <point xsi:type="esdl:Point" lon="4.446692985501065" lat="52.94176415866214"/>
          <point xsi:type="esdl:Point" lon="4.447834678299822" lat="52.941192867690724"/>
          <point xsi:type="esdl:Point" lon="4.449083220203936" lat="52.94070115728581"/>
          <point xsi:type="esdl:Point" lon="4.450440337964029" lat="52.9403429601719"/>
          <point xsi:type="esdl:Point" lon="4.453343885884493" lat="52.93994787460478"/>
          <point xsi:type="esdl:Point" lon="4.454700937259086" lat="52.93958964815979"/>
          <point xsi:type="esdl:Point" lon="4.4558731804311495" lat="52.93904485691871"/>
          <point xsi:type="esdl:Point" lon="4.457152496613654" lat="52.9385886629107"/>
          <point xsi:type="esdl:Point" lon="4.463685908640759" lat="52.936845150264475"/>
          <point xsi:type="esdl:Point" lon="4.465402795159355" lat="52.93657225604164"/>
          <point xsi:type="esdl:Point" lon="4.468147178445903" lat="52.93588209279501"/>
          <point xsi:type="esdl:Point" lon="4.4774710057883" lat="52.93308741431968"/>
          <point xsi:type="esdl:Point" lon="4.478688605995003" lat="52.93257780576202"/>
          <point xsi:type="esdl:Point" lon="4.490738545115646" lat="52.92905586367509"/>
          <point xsi:type="esdl:Point" lon="4.491940664098103" lat="52.92853730880376"/>
          <point xsi:type="esdl:Point" lon="4.494221550366902" lat="52.9273758625801"/>
          <point xsi:type="esdl:Point" lon="4.499536767044445" lat="52.925771556620624"/>
          <point xsi:type="esdl:Point" lon="4.501970674871989" lat="52.92474288522623"/>
          <point xsi:type="esdl:Point" lon="4.503437504012479" lat="52.92457149045967"/>
          <point xsi:type="esdl:Point" lon="4.504840754017368" lat="52.92428402219652"/>
          <point xsi:type="esdl:Point" lon="4.507412343187962" lat="52.923370350963744"/>
          <point xsi:type="esdl:Point" lon="4.510124199511133" lat="52.92264366483314"/>
          <point xsi:type="esdl:Point" lon="4.512961483123817" lat="52.92210409755443"/>
          <point xsi:type="esdl:Point" lon="4.515595389018558" lat="52.921279380975506"/>
          <point xsi:type="esdl:Point" lon="4.516998449577738" lat="52.920991770313115"/>
          <point xsi:type="esdl:Point" lon="4.519915570161797" lat="52.92061284090507"/>
          <point xsi:type="esdl:Point" lon="4.521286627448462" lat="52.92026265134028"/>
          <point xsi:type="esdl:Point" lon="4.523781373741506" lat="52.91929567690504"/>
          <point xsi:type="esdl:Point" lon="4.526508216757377" lat="52.918586389327025"/>
          <point xsi:type="esdl:Point" lon="4.530747606981291" lat="52.917749681546184"/>
          <point xsi:type="esdl:Point" lon="4.53210300018265" lat="52.91738157527144"/>
          <point xsi:type="esdl:Point" lon="4.534474278187237" lat="52.916299094748155"/>
          <point xsi:type="esdl:Point" lon="4.5397242734471455" lat="52.91461290846191"/>
          <point xsi:type="esdl:Point" lon="4.541127311988617" lat="52.91433397592173"/>
          <point xsi:type="esdl:Point" lon="4.542482531824109" lat="52.913965776427226"/>
          <point xsi:type="esdl:Point" lon="4.548700625727228" lat="52.91150240917457"/>
          <point xsi:type="esdl:Point" lon="4.552875569051961" lat="52.910557842804295"/>
          <point xsi:type="esdl:Point" lon="4.55419922824183" lat="52.91014495674499"/>
          <point xsi:type="esdl:Point" lon="4.5566926443814655" lat="52.90917730309942"/>
          <point xsi:type="esdl:Point" lon="4.562158695291903" lat="52.90775697181583"/>
          <point xsi:type="esdl:Point" lon="4.563561333508152" lat="52.90747781039798"/>
          <point xsi:type="esdl:Point" lon="4.564885759221469" lat="52.90709175628828"/>
          <point xsi:type="esdl:Point" lon="4.566009469410122" lat="52.90650155255959"/>
          <point xsi:type="esdl:Point" lon="4.567240471537633" lat="52.90599985507211"/>
          <point xsi:type="esdl:Point" lon="4.5781406618668665" lat="52.9031493785652"/>
          <point xsi:type="esdl:Point" lon="4.598536450374526" lat="52.89575619393451"/>
          <point xsi:type="esdl:Point" lon="4.611625835383535" lat="52.89153357045165"/>
          <point xsi:type="esdl:Point" lon="4.619969188927299" lat="52.889648917073515"/>
          <point xsi:type="esdl:Point" lon="4.627353417224987" lat="52.88916136802538"/>
          <point xsi:type="esdl:Point" lon="4.628840441472227" lat="52.88917693736473"/>
          <point xsi:type="esdl:Point" lon="4.630308573780733" lat="52.88908486939066"/>
          <point xsi:type="esdl:Point" lon="4.633142791955391" lat="52.88856044075886"/>
          <point xsi:type="esdl:Point" lon="4.637507818237288" lat="52.888032813910314"/>
          <point xsi:type="esdl:Point" lon="4.648778127875425" lat="52.8857730806858"/>
          <point xsi:type="esdl:Point" lon="4.656106867076318" lat="52.88502377759683"/>
          <point xsi:type="esdl:Point" lon="4.660421518792538" lat="52.88436115444786"/>
          <point xsi:type="esdl:Point" lon="4.673596530971884" lat="52.88298945354963"/>
          <point xsi:type="esdl:Point" lon="4.716143743685924" lat="52.88101557489764"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="10000000000.0" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__9" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__9" diameter="DN500" length="72745.91570260194">
        <port xsi:type="esdl:InPort" name="InPort" id="df628259-42cd-4887-8627-06422ea4278a" connectedTo="c2c4b3ca-bf1b-4095-aef1-cd4b75ee0c39" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="28e508a7-e7a5-419e-ac6f-2de2432c1e6e" name="OutPort" id="ee4358d3-64e7-44ea-ae9d-913ccdae8344" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.696464640068138" lat="54.85287124425952"/>
          <point xsi:type="esdl:Point" lon="4.700671528750999" lat="54.832082641809926"/>
          <point xsi:type="esdl:Point" lon="4.700694350720286" lat="54.831180815527674"/>
          <point xsi:type="esdl:Point" lon="4.823256216650277" lat="54.20986608594392"/>
          <point xsi:type="esdl:Point" lon="4.823293336295458" lat="54.208968407305925"/>
          <point xsi:type="esdl:Point" lon="4.823071767693012" lat="54.20717577943206"/>
          <point xsi:type="esdl:Point" lon="4.822442234944519" lat="54.20541537501273"/>
          <point xsi:type="esdl:Point" lon="4.821480839440125" lat="54.20370853414505"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="10000000000.0" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__10" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__10" diameter="DN500" length="35289.45766966107">
        <port xsi:type="esdl:InPort" name="InPort" id="839bd07d-1610-431e-bb46-fef52519fe46" connectedTo="9f00e816-b71b-45dd-8a63-98a89f22722c" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="0e95b210-95b6-40fa-b67f-d920431a02e7" name="OutPort" id="44d73b0f-6196-4b15-b061-579411da7fd4" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.821480839440125" lat="54.20370853414505"/>
          <point xsi:type="esdl:Point" lon="4.820190193651358" lat="54.202077664339555"/>
          <point xsi:type="esdl:Point" lon="4.818524847774559" lat="54.200571083434625"/>
          <point xsi:type="esdl:Point" lon="4.737412833547257" lat="54.14669793768842"/>
          <point xsi:type="esdl:Point" lon="4.617687364889209" lat="54.082454220524475"/>
          <point xsi:type="esdl:Point" lon="4.616715338137838" lat="54.08175358278189"/>
          <point xsi:type="esdl:Point" lon="4.613604653220648" lat="54.07864835365657"/>
          <point xsi:type="esdl:Point" lon="4.589330168674018" lat="54.03699364625817"/>
          <point xsi:type="esdl:Point" lon="4.524876426325122" lat="53.9676229144216"/>
          <point xsi:type="esdl:Point" lon="4.523013281474907" lat="53.96619664302509"/>
          <point xsi:type="esdl:Point" lon="4.518470078659336" lat="53.963800190586035"/>
          <point xsi:type="esdl:Point" lon="4.513123167271595" lat="53.96209235583419"/>
          <point xsi:type="esdl:Point" lon="4.510275407802512" lat="53.961452239457564"/>
          <point xsi:type="esdl:Point" lon="4.505792897889432" lat="53.960915227186334"/>
          <point xsi:type="esdl:Point" lon="4.502749924430012" lat="53.96077446515716"/>
          <point xsi:type="esdl:Point" lon="4.5013758856079695" lat="53.96079882908048"/>
          <point xsi:type="esdl:Point" lon="4.496977455085957" lat="53.96064608233263"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="10000000000.0" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__11" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__11" diameter="DN500" length="17879.367958192797">
        <port xsi:type="esdl:InPort" name="InPort" id="7cec8f23-3130-4357-8045-ebf8cd929059" connectedTo="558ea8ce-86e5-4473-bfc4-22f3f6bf822b" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="d58eff17-c715-4cd9-9267-0254b2a93593" name="OutPort" id="840b9842-6472-465c-a287-1e2286334ded" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.4969775695043746" lat="53.96064497886619"/>
          <point xsi:type="esdl:Point" lon="4.496760500114029" lat="53.959999786700514"/>
          <point xsi:type="esdl:Point" lon="4.484463125438268" lat="53.949716337622874"/>
          <point xsi:type="esdl:Point" lon="4.483723734524658" lat="53.94892995327127"/>
          <point xsi:type="esdl:Point" lon="4.351286579890362" lat="53.83694217010657"/>
          <point xsi:type="esdl:Point" lon="4.349396276453826" lat="53.83448702548336"/>
          <point xsi:type="esdl:Point" lon="4.347739863945234" lat="53.83102694790746"/>
          <point xsi:type="esdl:Point" lon="4.347239250273694" lat="53.82744151856819"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="10000000000.0" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__12" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__12" diameter="DN500" length="56014.931698001674">
        <port xsi:type="esdl:InPort" name="InPort" id="7bc7c809-fd94-4259-8966-c5bd6604780c" connectedTo="aaee02c4-d5f8-4f98-920f-48451f1ddf98" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="bbd74c33-142e-4cf5-aab5-eebbfd8108be" name="OutPort" id="4b28789c-1c0a-4a0f-90fd-cae8499bb8ec" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.347239250273694" lat="53.82744151856819"/>
          <point xsi:type="esdl:Point" lon="4.347734962826876" lat="53.82386288442111"/>
          <point xsi:type="esdl:Point" lon="4.34924203879178" lat="53.820380731379785"/>
          <point xsi:type="esdl:Point" lon="4.35167499376732" lat="53.81709036939507"/>
          <point xsi:type="esdl:Point" lon="4.353295757379463" lat="53.81556195691837"/>
          <point xsi:type="esdl:Point" lon="4.362660388474802" lat="53.80848503120156"/>
          <point xsi:type="esdl:Point" lon="4.363456333527807" lat="53.807711925331404"/>
          <point xsi:type="esdl:Point" lon="4.468335812681025" lat="53.728524706717295"/>
          <point xsi:type="esdl:Point" lon="4.477540509771338" lat="53.721382024776354"/>
          <point xsi:type="esdl:Point" lon="4.478563929238928" lat="53.72071768384778"/>
          <point xsi:type="esdl:Point" lon="4.549415388375108" lat="53.66689331367457"/>
          <point xsi:type="esdl:Point" lon="4.550218699487679" lat="53.66612332299835"/>
          <point xsi:type="esdl:Point" lon="4.554859810773029" lat="53.66257527306561"/>
          <point xsi:type="esdl:Point" lon="4.555902636384005" lat="53.661918985182055"/>
          <point xsi:type="esdl:Point" lon="4.585698918026719" lat="53.63925231810788"/>
          <point xsi:type="esdl:Point" lon="4.706820534096982" lat="53.54616163013035"/>
          <point xsi:type="esdl:Point" lon="4.709011789601852" lat="53.54381549015188"/>
          <point xsi:type="esdl:Point" lon="4.768437116315614" lat="53.44005774118385"/>
          <point xsi:type="esdl:Point" lon="4.768725949724488" lat="53.43917243268462"/>
          <point xsi:type="esdl:Point" lon="4.788171538592838" lat="53.40514792406354"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="10000000000.0" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__13" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__13" diameter="DN500" length="74747.15399347262">
        <port xsi:type="esdl:InPort" name="InPort" id="0493f79e-9884-4a5f-b577-c172aa462a53" connectedTo="1f7025c6-e9fb-4eea-a716-98a284654c6d" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="4bbab8d2-9fc5-4f4a-be67-fb829963f2ec" name="OutPort" id="66482701-4935-405e-a995-d30d40a614fd" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.788171538592838" lat="53.40514792406354"/>
          <point xsi:type="esdl:Point" lon="4.790199571737718" lat="53.40176424189254"/>
          <point xsi:type="esdl:Point" lon="4.790522649329466" lat="53.40088287021102"/>
          <point xsi:type="esdl:Point" lon="4.818146676425588" lat="53.352390782448616"/>
          <point xsi:type="esdl:Point" lon="4.82024931042375" lat="53.34901889486501"/>
          <point xsi:type="esdl:Point" lon="4.824616984265369" lat="53.340429523494024"/>
          <point xsi:type="esdl:Point" lon="4.824885032473165" lat="53.339539885925404"/>
          <point xsi:type="esdl:Point" lon="4.825016043304207" lat="53.337748842848185"/>
          <point xsi:type="esdl:Point" lon="4.824897960128419" lat="53.335049110000135"/>
          <point xsi:type="esdl:Point" lon="4.824916997594229" lat="53.33415429112243"/>
          <point xsi:type="esdl:Point" lon="4.824899268848024" lat="53.33325554125399"/>
          <point xsi:type="esdl:Point" lon="4.824903107546862" lat="53.33235646492368"/>
          <point xsi:type="esdl:Point" lon="4.824627920553267" lat="53.32709694114619"/>
          <point xsi:type="esdl:Point" lon="4.824630621859191" lat="53.32696203457168"/>
          <point xsi:type="esdl:Point" lon="4.824141334928288" lat="53.32068538450362"/>
          <point xsi:type="esdl:Point" lon="4.82312958121654" lat="53.31806224445566"/>
          <point xsi:type="esdl:Point" lon="4.821447796700047" lat="53.31556618907548"/>
          <point xsi:type="esdl:Point" lon="4.655874739972466" lat="53.127192151288206"/>
          <point xsi:type="esdl:Point" lon="4.646098658243697" lat="53.11709237659396"/>
          <point xsi:type="esdl:Point" lon="4.645472508460732" lat="53.116273945840774"/>
          <point xsi:type="esdl:Point" lon="4.64459573210913" lat="53.115544369257286"/>
          <point xsi:type="esdl:Point" lon="4.632546532409762" lat="53.10311943930053"/>
          <point xsi:type="esdl:Point" lon="4.631936681246088" lat="53.10230069584029"/>
          <point xsi:type="esdl:Point" lon="4.489536795637216" lat="52.95363238056736"/>
          <point xsi:type="esdl:Point" lon="4.488917874507511" lat="52.95281303971902"/>
          <point xsi:type="esdl:Point" lon="4.488479837182218" lat="52.95195096643435"/>
          <point xsi:type="esdl:Point" lon="4.487872876356953" lat="52.9511269805735"/>
          <point xsi:type="esdl:Point" lon="4.486773761393993" lat="52.948511071683036"/>
          <point xsi:type="esdl:Point" lon="4.486227087217114" lat="52.945834329771934"/>
          <point xsi:type="esdl:Point" lon="4.486175811048319" lat="52.944935938059025"/>
          <point xsi:type="esdl:Point" lon="4.486574792158307" lat="52.94135280699003"/>
          <point xsi:type="esdl:Point" lon="4.488033848607834" lat="52.93787328088984"/>
          <point xsi:type="esdl:Point" lon="4.491147000649138" lat="52.93379760902935"/>
          <point xsi:type="esdl:Point" lon="4.494688531266918" lat="52.93091667839674"/>
          <point xsi:type="esdl:Point" lon="4.497889610219585" lat="52.92904233565574"/>
          <point xsi:type="esdl:Point" lon="4.502638298380418" lat="52.926892127215794"/>
          <point xsi:type="esdl:Point" lon="4.612825361819098" lat="52.893337863720774"/>
          <point xsi:type="esdl:Point" lon="4.624275407879469" lat="52.891392686063284"/>
          <point xsi:type="esdl:Point" lon="4.650378457294204" lat="52.887845656007215"/>
          <point xsi:type="esdl:Point" lon="4.650732450855612" lat="52.88777331160405"/>
          <point xsi:type="esdl:Point" lon="4.65110098016443" lat="52.88774121189986"/>
          <point xsi:type="esdl:Point" lon="4.651456223641723" lat="52.88767783226556"/>
          <point xsi:type="esdl:Point" lon="4.65616263439034" lat="52.887023406917315"/>
          <point xsi:type="esdl:Point" lon="4.656531316772083" lat="52.88699578167089"/>
          <point xsi:type="esdl:Point" lon="4.657251264962906" lat="52.88687336720288"/>
          <point xsi:type="esdl:Point" lon="4.673193068463387" lat="52.88469435156198"/>
          <point xsi:type="esdl:Point" lon="4.673562833961834" lat="52.88467115328817"/>
          <point xsi:type="esdl:Point" lon="4.6768512373078375" lat="52.884310106259406"/>
          <point xsi:type="esdl:Point" lon="4.691583722583445" lat="52.883134657051954"/>
          <point xsi:type="esdl:Point" lon="4.691949589330677" lat="52.883084498369925"/>
          <point xsi:type="esdl:Point" lon="4.709402738524541" lat="52.8816771968297"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="8000000000.0" name="Pipe_GDF SUEZ E&amp;P Nederland B_V__14" id="Pipe_GDF SUEZ E&amp;P Nederland B_V__14" diameter="DN500" length="95437.32987174026">
        <port xsi:type="esdl:InPort" id="8305327c-cbf6-4540-83c9-550d4bbe040c" name="InPort" connectedTo="c2c4b3ca-bf1b-4095-aef1-cd4b75ee0c39" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="ea3663a5-51c0-46d8-8304-5cf2af3cd2ee" name="OutPort" id="098cf51b-110e-4249-905b-974371312acb" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.698444433700228" lat="54.8507424542925"/>
          <point xsi:type="esdl:Point" lon="4.706809337064089" lat="54.872681125788"/>
          <point xsi:type="esdl:Point" lon="4.708538156533425" lat="54.90284341827223"/>
          <point xsi:type="esdl:Point" lon="4.7085495429221975" lat="54.902849723150545"/>
          <point xsi:type="esdl:Point" lon="4.71757810450506" lat="55.132529327525205"/>
          <point xsi:type="esdl:Point" lon="4.7176035395028295" lat="55.132541170579934"/>
          <point xsi:type="esdl:Point" lon="4.717633809026845" lat="55.1331547161427"/>
          <point xsi:type="esdl:Point" lon="4.725024991874851" lat="55.16431403937511"/>
          <point xsi:type="esdl:Point" lon="4.725517720736698" lat="55.17329313288188"/>
          <point xsi:type="esdl:Point" lon="4.720604160055616" lat="55.209102328189395"/>
          <point xsi:type="esdl:Point" lon="4.725747388630594" lat="55.339345916347234"/>
          <point xsi:type="esdl:Point" lon="4.724314627360636" lat="55.37976778004514"/>
          <point xsi:type="esdl:Point" lon="4.736157850731541" lat="55.59525296426202"/>
          <point xsi:type="esdl:Point" lon="4.756470928826725" lat="55.69792768551515"/>
          <point xsi:type="esdl:Point" lon="4.756380390351134" lat="55.70241190839362"/>
          <point xsi:type="esdl:Point" lon="4.75507353963736" lat="55.70613029568726"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" capacity="10000000000.0" name="Pipe_Wintershall Noordzee B_V__15" id="Pipe_Wintershall Noordzee B_V__15" diameter="DN500" length="117929.55932284273">
        <port xsi:type="esdl:InPort" id="847b4479-83d9-4ccc-82d5-b5e1b9b860f5" name="InPort" connectedTo="c2c4b3ca-bf1b-4095-aef1-cd4b75ee0c39" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="bc037a52-7b9f-4bc8-b30d-0088e567f302" name="OutPort" id="8c53cd42-cbad-4760-9781-c7c7aa172116" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.694934635126629" lat="54.853122457656646"/>
          <point xsi:type="esdl:Point" lon="4.087567265179179" lat="55.30463810616633"/>
          <point xsi:type="esdl:Point" lon="3.9928878168373534" lat="55.79063767887756"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="10000000000.0" name="New_Pipe_1_16" id="New_Pipe_1_16" diameter="DN400" length="43880.01476109635">
        <port xsi:type="esdl:InPort" name="InPort" id="614a369d-e4e9-4f93-901b-dca7502c0127" connectedTo="895f1148-4200-458a-8698-b95eba4ad949" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="28e508a7-e7a5-419e-ac6f-2de2432c1e6e" name="OutPort" id="b25d47e1-559e-44ce-a7e8-2a51896b6cd9" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.43873" lat="54.04887"/>
          <point xsi:type="esdl:Point" lon="4.82149" lat="54.20372"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="10000000000.0" name="New_Pipe_2_17" id="New_Pipe_2_17" diameter="DN400" length="75803.13056153244">
        <port xsi:type="esdl:InPort" name="InPort" id="88d96411-fd0b-4a9a-a2b4-831063ea0892" connectedTo="895f1148-4200-458a-8698-b95eba4ad949" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="d58eff17-c715-4cd9-9267-0254b2a93593" name="OutPort" id="8b4e181f-b106-410c-9672-4b452d4deaac" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.43873" lat="54.04887"/>
          <point xsi:type="esdl:Point" lon="4.34724" lat="53.82733"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="10000000000.0" name="New_Pipe_3_18" id="New_Pipe_3_18" diameter="DN400" length="83784.68069724849">
        <port xsi:type="esdl:InPort" name="InPort" id="d70264e7-f873-4e1e-8935-4f49f6489b11" connectedTo="895f1148-4200-458a-8698-b95eba4ad949" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="c041e5d4-390f-49b8-a950-d9c2b79068c3" id="ef38bb26-ef73-4ddd-b906-e815b4c9ff43" name="OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.43873" lat="54.04887"/>
          <point xsi:type="esdl:Point" lon="6.5863" lat="54.38696"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="10000000000.0" name="New_Pipe_4_19" id="New_Pipe_4_19" diameter="DN400" length="19384.613940850842">
        <port xsi:type="esdl:InPort" name="InPort" id="896ea0ad-0d8c-4b3f-8cf0-91627c74ba47" connectedTo="aaee02c4-d5f8-4f98-920f-48451f1ddf98" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="3780c630-e721-4cfa-bb6b-e9161e716c92" id="fd40c2fc-9366-4062-9133-01f9e410e6a5" name="OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.34724" lat="53.82733"/>
          <point xsi:type="esdl:Point" lon="4.05396" lat="53.8428"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="10000000000.0" name="New_Pipe_5_20" id="New_Pipe_5_20" diameter="DN400" length="17891.97068906917">
        <port xsi:type="esdl:InPort" name="InPort" id="752d5719-1c4a-4750-897a-ea04672e3214" connectedTo="aaee02c4-d5f8-4f98-920f-48451f1ddf98" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="e91bfd1d-3d21-4287-92c1-5a37ceaa2bbc" id="d788f0cc-ffbc-4802-970e-c4586eec1d0c" name="OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.34724" lat="53.82733"/>
          <point xsi:type="esdl:Point" lon="4.14185" lat="53.93275"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="10000000000.0" name="New_Pipe_6_21" id="New_Pipe_6_21" diameter="DN400" length="13611.863393130661">
        <port xsi:type="esdl:InPort" name="InPort" id="eb744c6c-ed13-4cf4-b686-e3490974d1be" connectedTo="aaee02c4-d5f8-4f98-920f-48451f1ddf98" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="38b103ad-bd20-446e-adab-38104b005f5d" id="fa4565d1-4841-4cf6-9753-7bbefc0077e8" name="OutPort" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.34724" lat="53.82733"/>
          <point xsi:type="esdl:Point" lon="4.34525" lat="53.94962"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_0" id="Joint_0">
        <port xsi:type="esdl:InPort" name="InPort" id="cb7481ab-4afb-4a27-88dc-d660eff7e4ff" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="c7dccfbf-5abc-4b8e-afc7-98c8999723ce 08207a3d-8025-49ac-b684-d0c46a8dbaa0" name="OutPort" id="d5cb0a75-71d3-4e2b-b8c1-4e6ef4dc4111" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="3.2177011169605856" lat="53.21751306865999"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1" id="Joint_1">
        <port xsi:type="esdl:InPort" name="InPort" id="455a7611-d5a3-492e-81d0-338f680f8b78" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="3ce888c0-e1fc-4529-9597-6d05683be3ea 7e8234fa-8b72-4bf5-aef7-d860e4feb3e4 213a5e17-4364-4546-9355-bdc4fa14c3b2" name="OutPort" id="41829d65-271e-4f8f-90ae-3281dc305c20" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="3.6192539856492467" lat="53.943742686207486"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_2" id="Joint_2">
        <port xsi:type="esdl:InPort" name="InPort" id="51d6770d-910a-4c74-9edb-eb3e8f7de13a" connectedTo="d897984f-840b-4f6e-88e2-876b7027e8d8 f9c822e5-d0a1-47d6-92eb-8b195ea77be4" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="807b01a9-8445-4b34-bd92-54d8ea7d0a81 780755d7-4e58-4389-a447-ac7375882494" name="OutPort" id="6b368901-7cfb-4a28-ae30-272a209477b3" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.2018759238275605" lat="53.40182340562555"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_3" id="Joint_3">
        <port xsi:type="esdl:InPort" name="InPort" id="d4b4fd92-39e2-45f0-ae93-2d063017ec20" connectedTo="c7376b98-8a91-4f67-b9f7-f8295fe24a68 a0cd4417-48dd-491b-b816-769d224e53fe 4e8d7496-29b5-4c75-9a16-e4be70427615" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="c1eeb675-bbac-42ae-9253-0d5b3f2ef854 614a369d-e4e9-4f93-901b-dca7502c0127 88d96411-fd0b-4a9a-a2b4-831063ea0892 d70264e7-f873-4e1e-8935-4f49f6489b11" name="OutPort" id="895f1148-4200-458a-8698-b95eba4ad949" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="5.438708615226464" lat="54.048902189771546"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4" id="Joint_4">
        <port xsi:type="esdl:InPort" name="InPort" id="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" connectedTo="2e73e37b-3796-41cb-bf0e-2a554d220e04 0b5222fd-99fe-4280-927d-77252f7e49e7 5585cabb-c443-46d9-bf22-995d99517849 d0dd14e7-aeed-41ca-a3ea-6b457d77a07a 1fa00c80-e559-4280-a6e9-f203a664d43c" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="324ecaa9-c9b6-4ad7-a209-036ca42bf923 1f667ad9-187c-4c8a-8b9d-1cbf5222baf3 d9de5591-8807-4933-b7f8-a1c17618a881 4ba2a6aa-70e6-45ed-949a-40edec05acdc" name="OutPort" id="3e73f2c5-5936-4950-be17-3aecf5cfcac9" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="5.949331044128506" lat="53.55512098767271"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_5" id="Joint_5">
        <port xsi:type="esdl:InPort" name="InPort" id="bbd74c33-142e-4cf5-aab5-eebbfd8108be" connectedTo="f17e5722-26dc-46cb-82e4-e8bedb50532e 4b28789c-1c0a-4a0f-90fd-cae8499bb8ec 654ed160-0251-4135-bac6-43e24af3a238 970d8056-3e04-4bf8-a670-d8cbd60bbab1" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="a770de95-d2ea-417f-8cdb-59ee45f3621f 0493f79e-9884-4a5f-b577-c172aa462a53 cd05622c-a30c-4100-8e78-6f9bacf67340 a60af722-5bd2-4c07-8089-4bd54f7f96c1" name="OutPort" id="1f7025c6-e9fb-4eea-a716-98a284654c6d" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.788270048924873" lat="53.40501696863106"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_6" id="Joint_6">
        <port xsi:type="esdl:InPort" name="InPort" id="c5e20e4d-5de1-4557-b9b1-007903b99d8b" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="df628259-42cd-4887-8627-06422ea4278a 8305327c-cbf6-4540-83c9-550d4bbe040c 847b4479-83d9-4ccc-82d5-b5e1b9b860f5" name="OutPort" id="c2c4b3ca-bf1b-4095-aef1-cd4b75ee0c39" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.696464640068138" lat="54.85287124425952"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7" id="Joint_7">
        <port xsi:type="esdl:InPort" name="InPort" id="28e508a7-e7a5-419e-ac6f-2de2432c1e6e" connectedTo="ee4358d3-64e7-44ea-ae9d-913ccdae8344 b25d47e1-559e-44ce-a7e8-2a51896b6cd9 88c9bcc4-1169-47ef-ba72-ef3b5d36ab4f 7e7fe984-943e-43cf-8e05-0ab6676f66c4" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="839bd07d-1610-431e-bb46-fef52519fe46 814c95a3-f68a-4a3e-903a-16cd15abaf88" name="OutPort" id="9f00e816-b71b-45dd-8a63-98a89f22722c" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.821480839440125" lat="54.20370853414505"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_8" id="Joint_8">
        <port xsi:type="esdl:InPort" name="InPort" id="0e95b210-95b6-40fa-b67f-d920431a02e7" connectedTo="44d73b0f-6196-4b15-b061-579411da7fd4 fe89871a-d4e2-4f59-99ca-a9cefa2ea886 b0e8a50d-78c8-4154-b2cb-8017d34ed860" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="7cec8f23-3130-4357-8045-ebf8cd929059 503dbe3c-87b2-4aaf-a620-c442e80cff7d" name="OutPort" id="558ea8ce-86e5-4473-bfc4-22f3f6bf822b" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.496977455085957" lat="53.96064608233263"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_9" id="Joint_9">
        <port xsi:type="esdl:InPort" name="InPort" id="d58eff17-c715-4cd9-9267-0254b2a93593" connectedTo="840b9842-6472-465c-a287-1e2286334ded 8b4e181f-b106-410c-9672-4b452d4deaac 9cd8b8c4-e253-4c87-b590-b69252497a2f" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="7bc7c809-fd94-4259-8966-c5bd6604780c 896ea0ad-0d8c-4b3f-8cf0-91627c74ba47 752d5719-1c4a-4750-897a-ea04672e3214 eb744c6c-ed13-4cf4-b686-e3490974d1be 7071e28f-4a7b-46e9-8fbd-1e59502da5f9" name="OutPort" id="aaee02c4-d5f8-4f98-920f-48451f1ddf98" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.347239250273694" lat="53.82744151856819"/>
      </asset>
      <asset xsi:type="esdl:Import" name="H2-Import" power="100000000000.0" id="H2-Import" description="Hub_NL" controlStrategy="ef2d4880-b7ad-4410-adb3-06dab2a20acf">
        <port xsi:type="esdl:OutPort" connectedTo="f53d7843-13cc-4730-99e5-926703d0a28c" name="OutPort" id="050d00ac-d6f6-4a40-82bd-71219b1ab894" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="5.58133421552437" lat="52.2465469088849"/>
        <costInformation xsi:type="esdl:CostInformation" id="7f014631-ecfe-49d4-bef0-2f07cc040551">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.4" id="632b0db5-bd43-4e84-be1d-05e71ae0d580" name="H2-Import_marginalcosts"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="H2_Demand" id="H2_Demand" power="100000000000.0" description="Hub_NL">
        <port xsi:type="esdl:InPort" name="InPort" id="1b9ed795-35a4-430e-aa0c-8b4c8b4e943a" connectedTo="e82b7e08-d7d1-4ba3-a692-8ec47bc0f27c" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="186.0" field="normalized_curve_H2" database="energy_profiles" id="b138f8c7-bcb3-4d42-a647-991bccb42561" measurement="H2_Demand_profile_inflex_II3050" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in TERAWATTHOUR" physicalQuantity="ENERGY" id="e1c41bd3-2b51-41e3-a669-3eecdac8b59f" multiplier="TERA"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Point" lon="5.58033421552437" lat="52.2485469088849"/>
        <costInformation xsi:type="esdl:CostInformation" id="fc7d6880-0009-4f2c-b1fe-510f7d041754">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="16bfc35c-89de-4681-a4d4-bba05e7a9aac" name="H2_Demand_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="EL_Demand" id="EL_Demand" power="100000000000.0" description="Hub_NL">
        <port xsi:type="esdl:InPort" name="InPort" id="d003ad2a-4aef-4177-a572-b0d62f26768b" connectedTo="6b4c1614-6f67-42bb-83bc-21519014cb1d" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="193.0" field="normalized_curve" database="energy_profiles" id="08520fa4-4717-43d1-aa5e-31cc293231da" measurement="Demand_profile_CY2015" startDate="2050-01-01T00:00:00.000000" host="http://influxdb" port="8086" endDate="2050-12-31T23:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATTHOUR" description="ENERGY in TERAWATTHOUR" physicalQuantity="ENERGY" id="2cfcdc99-4a94-4a89-af9d-56aa3fe44f72" multiplier="TERA"/>
          </profile>
        </port>
        <geometry xsi:type="esdl:Point" lon="5.57933421552437" lat="52.2445469088849"/>
        <costInformation xsi:type="esdl:CostInformation" id="a11fb7cf-bbba-448b-a1f8-34a035d6dc7d">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="4f36b00d-0885-4ef7-bbd5-e9109c258b02" name="EL_Demand_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="Hydrogen export" id="Hydrogen export" power="100000000000.0" description="Hub_NL" controlStrategy="85199725-81aa-48a6-994f-70c95831d20c">
        <port xsi:type="esdl:InPort" name="InPort" id="ad541129-c483-47ee-a933-e1153863faa0" connectedTo="0d4e6a93-1832-4fdf-9f6e-791affb55a90" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="5.57933421552437" lat="52.2485469088849"/>
        <costInformation xsi:type="esdl:CostInformation" id="fcf26e6f-d804-4e35-8b8b-6a8af1648264">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.1" id="38ce06f8-5b84-4e56-a191-7096558674a8" name="Hydrogen export_marginalcosts"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" name="Electricity export" id="Electricity export" power="100000000000.0" description="Hub_NL" controlStrategy="82fbf2ea-fe2b-48b6-9292-c2358363dbe0">
        <port xsi:type="esdl:InPort" name="InPort" id="c30b0d56-208e-40a3-8192-754012432fd3" connectedTo="dc9f3802-31fb-4e9f-bc24-3ceeffc3d2c7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="5.58033421552437" lat="52.2445469088849"/>
        <costInformation xsi:type="esdl:CostInformation" id="b68e1870-93ba-42c8-95b8-edeaf21a7b91">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.1" id="5d72ec05-c05e-4816-adfd-a42071563cbd" name="Electricity export_marginalcosts"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_NL" id="EL_HUB_NL">
        <port xsi:type="esdl:InPort" name="InPort" id="663b1149-997e-4c50-bfa5-d8539841205a" connectedTo="7f983f6d-97e9-4c5a-bc08-8133bf184d95 57157d59-876a-4951-9b4b-6a34f7fd0cf3 d1a30fe8-7610-4b24-9e86-9270c238b43c 06461582-7c22-4cd2-9c1b-4eafcb05890a 0d1d3ea3-f647-4233-9f35-2e66bee5c388 c2d4be73-48fd-4f30-815c-f741a645db09 d81dc4e4-00dd-44c6-b224-ea3320235871" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="2b2e1eb7-5d98-43a1-af0e-64d0b406dfde e01ac45a-56d6-4a54-ba48-e6edc88ef99e" name="OutPort" id="2ea57f1a-e4ed-43d7-9c75-57ca2cb530d7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="5.57833421552437" lat="52.2455469088849"/>
      </asset>
      <asset xsi:type="esdl:Joint" capacity="100000000000.0" name="Joint_10" id="Joint_10">
        <port xsi:type="esdl:InPort" name="InPort" id="c2893771-352a-4445-97af-48e952142f52" connectedTo="848902ef-4f4e-4635-8997-c47122a883ed 3774a468-078a-4374-87e9-103025995b1a 7a952945-9b3e-4a37-bcb4-0b960607b4d8" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" name="OutPort" id="be9c9746-2ea3-4375-90fd-469ae6e7f287" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="5.57933421552437" lat="52.246546908884895"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_BSL" id="EL_HUB_BSL">
        <port xsi:type="esdl:InPort" name="InPort" id="b0567a7f-3c5a-4ccf-bf9d-4406f51d0060" connectedTo="84ef44a7-baae-462f-bdb5-2285f3132b2e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="9bb7127b-9fce-4da1-aa3e-b58515557676" name="OutPort" id="e456d921-1e4e-4613-a4da-bf1043c6f645" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="3.73640092624319" lat="51.4249245845624"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_MVL" id="EL_HUB_MVL">
        <port xsi:type="esdl:InPort" name="InPort" id="65add1bf-b293-4668-88cd-58f511ee9c8d" connectedTo="5657c071-8783-4f05-8816-d03b95034050" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="0f20d0bc-6e25-4960-aa9c-fadafbb719a6" name="OutPort" id="7da7c050-fe3a-4691-b581-5aa461240877" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="4.00765977271238" lat="51.9670419650243"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_EEM" id="EL_HUB_EEM">
        <port xsi:type="esdl:InPort" name="InPort" id="097776dd-5da1-4a91-ac65-eaaf387a56a9" connectedTo="83b58229-2400-46eb-8946-bd90d65effba b59ef7de-1246-4a3f-9dc4-4298fc71c9ac 1f495e25-c980-4199-be1c-0548e3335a6e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="d78a30fc-550b-4a79-87e2-494e07132a60" name="OutPort" id="20000b88-ed2c-46ca-97e9-7bae2615212c" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="6.8329384440276" lat="53.4412004792261"/>
      </asset>
      <asset xsi:type="esdl:Joint" capacity="100000000000.0" name="Joint_11" id="Joint_11">
        <port xsi:type="esdl:InPort" name="InPort" id="d983e894-c523-40fc-9ee6-3eab7a40cefb" connectedTo="78358c98-b6e7-457d-b219-efe06cf84d46 d6eb76e1-4fe1-4728-944e-8554d2efc7ce" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="80787752-e15e-4bf5-a9f2-fe33cc136dc6" name="OutPort" id="e200f7ec-1b15-4b6d-beec-95384be1c48f" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="6.8339384440276" lat="53.442200479226095"/>
      </asset>
      <asset xsi:type="esdl:Joint" capacity="100000000000.0" name="Joint_12" id="Joint_12">
        <port xsi:type="esdl:InPort" name="InPort" id="70c760fe-a161-439f-b9dd-d6d9d30779e8" connectedTo="46583104-b837-438b-90a1-ac0c67eb3b4e 71a057e8-9922-41e9-967e-204fd5993201 34aabc6b-6c04-482a-bbbc-23ae914bd5c9 570f19cd-1b9f-48c0-97d1-a975f81340ab dfcff336-b5a0-487f-897f-ae09f5735870" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="708bda88-0762-46ca-95ae-82a0d207c81f" name="OutPort" id="7c9a6009-603c-465d-9e34-47b9115f3cbc" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.4539659248248205" lat="54.536824245707095"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_GTB" id="EL_HUB_GTB">
        <port xsi:type="esdl:InPort" name="InPort" id="1359b581-f569-4ce3-b0fa-4cbfefb93850" connectedTo="9fe50f6f-ea79-49ad-91a8-97eb2a8eebc0" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="787697ec-0701-4a8d-a252-2b895370c900" name="OutPort" id="51005509-1e15-40ec-b8e9-0a0d15269a6b" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="4.83367631576912" lat="51.7029849705477"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_West" id="EL_HUB_West">
        <port xsi:type="esdl:InPort" name="InPort" id="e12e9c36-04b3-45de-8934-565c9610076e" connectedTo="fcc4287a-52d2-485d-b6ab-b13935c9531f 6c0f1ffb-75b2-4ae7-ba25-65834e396d73" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="e5fcd4fd-74fd-48d4-beb9-e72e0b734e87" name="OutPort" id="804e3b7e-f03c-4c99-b0f2-cbde7b0b1344" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="3.503093" lat="53.512674"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_North" id="EL_HUB_North">
        <port xsi:type="esdl:InPort" name="InPort" id="6da7647d-d0c0-4a34-86ee-02e0a9618618" connectedTo="829025f5-d165-4fec-afc7-985a1b431360 240ec5e3-50b0-41e2-a723-9ebe5baf542c c9421584-4ed8-4252-b6af-e0232ad2c22b 42107817-35f5-41f0-907e-049e9ed33b71 04b25823-8ce8-49de-a522-0a81f1605f0a" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="55efd42d-32de-4c8e-9854-baebeeaa70ec e1af0404-7344-41c0-8e41-51216d262338" name="OutPort" id="0f9a8562-5571-47c5-a285-e10b6acfed76" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="4.412403" lat="54.0471"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_East" id="EL_HUB_East">
        <port xsi:type="esdl:InPort" name="InPort" id="df2b7f4e-b729-4799-937c-171608abddfb" connectedTo="2a269ec0-be5a-46e4-94ac-bdd7313c3348 28e80fb4-b261-474b-80ff-81786fe4b913 bccd349d-6086-45da-a1df-c02eb86df038 66c4b0e4-c4e0-49a3-84c2-e47a347d55c3 fe2355d8-1bc0-4872-b101-0c1711a68b2a" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="3df5861c-468c-440d-a7c9-8ad715a80364" name="OutPort" id="1b095bb2-e21c-4d49-8073-e704fea2f287" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="5.628928" lat="53.866123"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_DH" id="EL_HUB_DH">
        <port xsi:type="esdl:InPort" name="InPort" id="76b608fd-6fab-4007-bf4a-dbe7a04f525b" connectedTo="1c1cb738-0db5-407e-ba4b-fd9073b71796" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="f54ccb29-2b5f-4f19-b274-99f788babf22" name="OutPort" id="b574991d-2cd3-476a-be9d-28df17f8b5db" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="4.70947" lat="52.88167"/>
      </asset>
      <asset xsi:type="esdl:Joint" capacity="100000000000.0" name="Joint_13" id="Joint_13">
        <port xsi:type="esdl:InPort" name="InPort" id="3c8f54e4-2ead-43ac-a3ae-dba1a7ded678" connectedTo="59cf3bc0-9096-43ba-8206-0db3a4dfe3e4" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="97a66417-099a-4915-a5d8-253cc4803c91" name="OutPort" id="5fd303ba-6e43-4ade-a48f-849f95e12865" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.71047" lat="52.88267"/>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="EL_HUB_IJVER" id="EL_HUB_IJVER">
        <port xsi:type="esdl:InPort" name="InPort" id="ac377413-0431-4d63-8a4a-475e5faba1bb" connectedTo="f798f861-23ed-46d5-a234-2ac65f534567 517efaa7-2504-48df-af37-12e5eac491d7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="c7c10fb8-f00f-4cac-ac64-ee105d6ffb01" name="OutPort" id="5021fc2e-78da-4b93-8173-8c34be115726" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="4.572916" lat="52.453695"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="2000000000.0" name="CBL_WF_NDW1" id="CBL_WF_NDW1" length="208366.40712540146">
        <port xsi:type="esdl:InPort" name="InPort" id="b8d57a5f-ff48-4b5b-a68b-2e1d855d9975" connectedTo="e4baa182-bf81-4a89-a93e-c02f79148a95" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="b0567a7f-3c5a-4ccf-bf9d-4406f51d0060" name="OutPort" id="84ef44a7-baae-462f-bdb5-2285f3132b2e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.191426075413588" lat="53.10544888316223"/>
          <point xsi:type="esdl:Point" lon="3.2466295516186694" lat="53.09549453994145"/>
          <point xsi:type="esdl:Point" lon="3.2476061355467816" lat="53.09522099855387"/>
          <point xsi:type="esdl:Point" lon="3.2583494885848188" lat="53.09070660579104"/>
          <point xsi:type="esdl:Point" lon="3.2593258910592056" lat="53.09043296825273"/>
          <point xsi:type="esdl:Point" lon="3.2720466142802636" lat="53.08812010203952"/>
          <point xsi:type="esdl:Point" lon="3.27312132817034" lat="53.087839414898326"/>
          <point xsi:type="esdl:Point" lon="3.2741098606811394" lat="53.08746095625155"/>
          <point xsi:type="esdl:Point" lon="3.2749878682025777" lat="53.08699404886846"/>
          <point xsi:type="esdl:Point" lon="3.275733729584816" lat="53.08645019137366"/>
          <point xsi:type="esdl:Point" lon="3.2763290790185327" lat="53.08584277802503"/>
          <point xsi:type="esdl:Point" lon="3.276759263587807" lat="53.085186768324995"/>
          <point xsi:type="esdl:Point" lon="3.277013697217941" lat="53.08449831735103"/>
          <point xsi:type="esdl:Point" lon="3.2770861215876836" lat="53.083794376698414"/>
          <point xsi:type="esdl:Point" lon="3.276974763734558" lat="53.08309228136406"/>
          <point xsi:type="esdl:Point" lon="3.220445766861459" lat="52.95857084123278"/>
          <point xsi:type="esdl:Point" lon="3.2203059206334825" lat="52.9576365022722"/>
          <point xsi:type="esdl:Point" lon="3.220436286575723" lat="52.956701664005514"/>
          <point xsi:type="esdl:Point" lon="3.225760678806183" lat="52.94511141537663"/>
          <point xsi:type="esdl:Point" lon="3.225795934566493" lat="52.94471303028144"/>
          <point xsi:type="esdl:Point" lon="3.225733509452606" lat="52.944315862710845"/>
          <point xsi:type="esdl:Point" lon="3.2182381517048366" lat="52.92752758086859"/>
          <point xsi:type="esdl:Point" lon="3.2181150041974766" lat="52.926425429921935"/>
          <point xsi:type="esdl:Point" lon="3.218124091724859" lat="52.92620435726148"/>
          <point xsi:type="esdl:Point" lon="3.2183376258092298" lat="52.92510726022365"/>
          <point xsi:type="esdl:Point" lon="3.2188266516996453" lat="52.924042866622834"/>
          <point xsi:type="esdl:Point" lon="3.240300960374051" lat="52.89635103522503"/>
          <point xsi:type="esdl:Point" lon="3.2406223449859115" lat="52.89569133839787"/>
          <point xsi:type="esdl:Point" lon="3.2449608527954097" lat="52.87664344723048"/>
          <point xsi:type="esdl:Point" lon="3.245384548654714" lat="52.8759826574721"/>
          <point xsi:type="esdl:Point" lon="3.245974646389765" lat="52.87537037672235"/>
          <point xsi:type="esdl:Point" lon="3.246716470435579" lat="52.874821827292855"/>
          <point xsi:type="esdl:Point" lon="3.2635922141844915" lat="52.86570968604618"/>
          <point xsi:type="esdl:Point" lon="3.264321806184917" lat="52.86521944759038"/>
          <point xsi:type="esdl:Point" lon="3.2649249383260757" lat="52.864669852049936"/>
          <point xsi:type="esdl:Point" lon="3.321822644898002" lat="52.79149397338295"/>
          <point xsi:type="esdl:Point" lon="3.3230116136107863" lat="52.79056028036827"/>
          <point xsi:type="esdl:Point" lon="3.324411839682106" lat="52.78974129463648"/>
          <point xsi:type="esdl:Point" lon="3.3259935650361903" lat="52.7890544156321"/>
          <point xsi:type="esdl:Point" lon="3.3277231761450685" lat="52.78851423671076"/>
          <point xsi:type="esdl:Point" lon="3.433496315931828" lat="52.76748792690752"/>
          <point xsi:type="esdl:Point" lon="3.448061448452013" lat="52.76307199035493"/>
          <point xsi:type="esdl:Point" lon="3.5189644533346627" lat="52.74835246654482"/>
          <point xsi:type="esdl:Point" lon="3.5196679166447766" lat="52.74814401490919"/>
          <point xsi:type="esdl:Point" lon="3.5203199496175257" lat="52.74788110804321"/>
          <point xsi:type="esdl:Point" lon="3.5209091729568174" lat="52.747568335765145"/>
          <point xsi:type="esdl:Point" lon="3.521425301678327" lat="52.74721115704125"/>
          <point xsi:type="esdl:Point" lon="3.521859329239934" lat="52.746815808292624"/>
          <point xsi:type="esdl:Point" lon="3.5222036802046803" lat="52.74638918846553"/>
          <point xsi:type="esdl:Point" lon="3.5224523480241006" lat="52.74593874507153"/>
          <point xsi:type="esdl:Point" lon="3.5226009954827053" lat="52.745472340624865"/>
          <point xsi:type="esdl:Point" lon="3.5226470313316147" lat="52.74499811470623"/>
          <point xsi:type="esdl:Point" lon="3.5209755216559975" lat="52.60471380650547"/>
          <point xsi:type="esdl:Point" lon="3.5210506464524096" lat="52.60404091812738"/>
          <point xsi:type="esdl:Point" lon="3.521290284600084" lat="52.60338244691445"/>
          <point xsi:type="esdl:Point" lon="3.5216890353944987" lat="52.60275321700121"/>
          <point xsi:type="esdl:Point" lon="3.540725510075378" lat="52.58237325853425"/>
          <point xsi:type="esdl:Point" lon="3.5411255307029306" lat="52.58173917511127"/>
          <point xsi:type="esdl:Point" lon="3.541364113587722" lat="52.58107561236866"/>
          <point xsi:type="esdl:Point" lon="3.541435814640764" lat="52.58039772753794"/>
          <point xsi:type="esdl:Point" lon="3.541408426221776" lat="52.58005824890655"/>
          <point xsi:type="esdl:Point" lon="3.5383908926419134" lat="52.56858002378199"/>
          <point xsi:type="esdl:Point" lon="3.537846681466067" lat="52.53948409142036"/>
          <point xsi:type="esdl:Point" lon="3.5218077233320835" lat="52.47920925293862"/>
          <point xsi:type="esdl:Point" lon="3.5215253402350464" lat="52.47582082630797"/>
          <point xsi:type="esdl:Point" lon="3.5215278916684154" lat="52.47564983345537"/>
          <point xsi:type="esdl:Point" lon="3.5216443215995863" lat="52.474970161244606"/>
          <point xsi:type="esdl:Point" lon="3.5219281294775544" lat="52.4743091210977"/>
          <point xsi:type="esdl:Point" lon="3.533453441886219" lat="52.45867855992464"/>
          <point xsi:type="esdl:Point" lon="3.5362804349637322" lat="52.45149587330466"/>
          <point xsi:type="esdl:Point" lon="3.5395540134515446" lat="52.434072090688524"/>
          <point xsi:type="esdl:Point" lon="3.539365977938185" lat="52.42586817139984"/>
          <point xsi:type="esdl:Point" lon="3.53860011105086" lat="52.42410688897144"/>
          <point xsi:type="esdl:Point" lon="3.5384165600768616" lat="52.42342111911466"/>
          <point xsi:type="esdl:Point" lon="3.5383383924552603" lat="52.41928032752231"/>
          <point xsi:type="esdl:Point" lon="3.536336421608162" lat="52.40946903658651"/>
          <point xsi:type="esdl:Point" lon="3.5361025348439017" lat="52.39206604959321"/>
          <point xsi:type="esdl:Point" lon="3.536114278983447" lat="52.391776512578105"/>
          <point xsi:type="esdl:Point" lon="3.539221440394594" lat="52.379059890712284"/>
          <point xsi:type="esdl:Point" lon="3.538934313528206" lat="52.37353477298286"/>
          <point xsi:type="esdl:Point" lon="3.538681659759717" lat="52.372850096209234"/>
          <point xsi:type="esdl:Point" lon="3.5353027772558914" lat="52.367534150474015"/>
          <point xsi:type="esdl:Point" lon="3.5350939885680326" lat="52.3668733568512"/>
          <point xsi:type="esdl:Point" lon="3.530541140127138" lat="52.29952460738674"/>
          <point xsi:type="esdl:Point" lon="3.529755311458577" lat="52.29615222869747"/>
          <point xsi:type="esdl:Point" lon="3.524414055057994" lat="52.28608970023873"/>
          <point xsi:type="esdl:Point" lon="3.5242631271064613" lat="52.285073962427845"/>
          <point xsi:type="esdl:Point" lon="3.5253969226122845" lat="52.25349915048575"/>
          <point xsi:type="esdl:Point" lon="3.525381111388844" lat="52.253085385957434"/>
          <point xsi:type="esdl:Point" lon="3.517310183377731" lat="52.212037393041854"/>
          <point xsi:type="esdl:Point" lon="3.5067718081392" lat="52.1857824658507"/>
          <point xsi:type="esdl:Point" lon="3.504351559748431" lat="52.16614556326941"/>
          <point xsi:type="esdl:Point" lon="3.504897200593514" lat="52.16265020932089"/>
          <point xsi:type="esdl:Point" lon="3.503573450221154" lat="52.1516099495042"/>
          <point xsi:type="esdl:Point" lon="3.5023346107149815" lat="52.14890833810615"/>
          <point xsi:type="esdl:Point" lon="3.49783988124088" lat="52.11027792847409"/>
          <point xsi:type="esdl:Point" lon="3.497864124714639" lat="52.10972757390797"/>
          <point xsi:type="esdl:Point" lon="3.4982093972435675" lat="52.108091088125704"/>
          <point xsi:type="esdl:Point" lon="3.4989559317800674" lat="52.10650616453716"/>
          <point xsi:type="esdl:Point" lon="3.5000862227463796" lat="52.105009878009746"/>
          <point xsi:type="esdl:Point" lon="3.501573796862502" lat="52.10363722466205"/>
          <point xsi:type="esdl:Point" lon="3.503383833812774" lat="52.102420308585494"/>
          <point xsi:type="esdl:Point" lon="3.50547398033389" lat="52.101387585529444"/>
          <point xsi:type="esdl:Point" lon="3.554479795588747" lat="52.083931324809164"/>
          <point xsi:type="esdl:Point" lon="3.5640573380940532" lat="52.07982184331045"/>
          <point xsi:type="esdl:Point" lon="3.5723925185878125" lat="52.074788994467816"/>
          <point xsi:type="esdl:Point" lon="3.5792539094107148" lat="52.06897278960638"/>
          <point xsi:type="esdl:Point" lon="3.6847098072128017" lat="51.937248404699325"/>
          <point xsi:type="esdl:Point" lon="3.6862994031225775" lat="51.93400439239228"/>
          <point xsi:type="esdl:Point" lon="3.69316377814691" lat="51.89821122564066"/>
          <point xsi:type="esdl:Point" lon="3.6931569825667894" lat="51.89794200136392"/>
          <point xsi:type="esdl:Point" lon="3.692888828400387" lat="51.896336472261005"/>
          <point xsi:type="esdl:Point" lon="3.6922365559241626" lat="51.89477365576881"/>
          <point xsi:type="esdl:Point" lon="3.6882665754941835" lat="51.88925068959294"/>
          <point xsi:type="esdl:Point" lon="3.685960294117729" lat="51.88678085852684"/>
          <point xsi:type="esdl:Point" lon="3.6811396615947634" lat="51.88287394526118"/>
          <point xsi:type="esdl:Point" lon="3.6574936538558798" lat="51.869385275784104"/>
          <point xsi:type="esdl:Point" lon="3.650826698153683" lat="51.86403515010777"/>
          <point xsi:type="esdl:Point" lon="3.58256736948057" lat="51.75751283524017"/>
          <point xsi:type="esdl:Point" lon="3.580174603733493" lat="51.75458821688412"/>
          <point xsi:type="esdl:Point" lon="3.5642393850511818" lat="51.74129925052511"/>
          <point xsi:type="esdl:Point" lon="3.552630954698301" lat="51.73343582960317"/>
          <point xsi:type="esdl:Point" lon="3.5500975810073006" lat="51.73117895495016"/>
          <point xsi:type="esdl:Point" lon="3.5482380911169793" lat="51.72879078738416"/>
          <point xsi:type="esdl:Point" lon="3.5448287749000045" lat="51.72160525519137"/>
          <point xsi:type="esdl:Point" lon="3.544465188733303" lat="51.71886547777591"/>
          <point xsi:type="esdl:Point" lon="3.5444856206641977" lat="51.718177630698435"/>
          <point xsi:type="esdl:Point" lon="3.546083518298567" lat="51.70968218107938"/>
          <point xsi:type="esdl:Point" lon="3.547226627278721" lat="51.70701781063022"/>
          <point xsi:type="esdl:Point" lon="3.55673024658313" lat="51.6943498143697"/>
          <point xsi:type="esdl:Point" lon="3.5688568037333552" lat="51.68259549955467"/>
          <point xsi:type="esdl:Point" lon="3.5695057148370237" lat="51.68176269349908"/>
          <point xsi:type="esdl:Point" lon="3.5699161111592743" lat="51.68087320024755"/>
          <point xsi:type="esdl:Point" lon="3.5711264725574896" lat="51.67456846663974"/>
          <point xsi:type="esdl:Point" lon="3.5709815932721454" lat="51.67365048237218"/>
          <point xsi:type="esdl:Point" lon="3.564122928420834" lat="51.65900030934326"/>
          <point xsi:type="esdl:Point" lon="3.564087246402316" lat="51.65877787430361"/>
          <point xsi:type="esdl:Point" lon="3.564086141387342" lat="51.65866605218926"/>
          <point xsi:type="esdl:Point" lon="3.5641174225438044" lat="51.65844336025678"/>
          <point xsi:type="esdl:Point" lon="3.5641928842915576" lat="51.65822480351525"/>
          <point xsi:type="esdl:Point" lon="3.564311360798283" lat="51.65801375752622"/>
          <point xsi:type="esdl:Point" lon="3.564471018468142" lat="51.657813485026324"/>
          <point xsi:type="esdl:Point" lon="3.564669392863388" lat="51.65762707911269"/>
          <point xsi:type="esdl:Point" lon="3.564903414230757" lat="51.65745742087229"/>
          <point xsi:type="esdl:Point" lon="3.5651694705348986" lat="51.657307131437875"/>
          <point xsi:type="esdl:Point" lon="3.5654634474730234" lat="51.657178534046274"/>
          <point xsi:type="esdl:Point" lon="3.5657808031480775" lat="51.657073614131754"/>
          <point xsi:type="esdl:Point" lon="3.5760324414124045" lat="51.6547847431127"/>
          <point xsi:type="esdl:Point" lon="3.6021717069675594" lat="51.644882635822576"/>
          <point xsi:type="esdl:Point" lon="3.6403737737340087" lat="51.62127053510961"/>
          <point xsi:type="esdl:Point" lon="3.6437961713184324" lat="51.618598342490216"/>
          <point xsi:type="esdl:Point" lon="3.646464497600082" lat="51.61561171097303"/>
          <point xsi:type="esdl:Point" lon="3.648305987589483" lat="51.612392257869416"/>
          <point xsi:type="esdl:Point" lon="3.6492705099624487" lat="51.60902794217971"/>
          <point xsi:type="esdl:Point" lon="3.6494250142655416" lat="51.6022682289862"/>
          <point xsi:type="esdl:Point" lon="3.6471007751435423" lat="51.58775003325986"/>
          <point xsi:type="esdl:Point" lon="3.647109424711208" lat="51.58767792500951"/>
          <point xsi:type="esdl:Point" lon="3.647098403748424" lat="51.587631781799324"/>
          <point xsi:type="esdl:Point" lon="3.647077884316816" lat="51.58758691652244"/>
          <point xsi:type="esdl:Point" lon="3.647048210606798" lat="51.587544084379694"/>
          <point xsi:type="esdl:Point" lon="3.6470098836411275" lat="51.58750400553707"/>
          <point xsi:type="esdl:Point" lon="3.646963549598799" lat="51.58746735619887"/>
          <point xsi:type="esdl:Point" lon="3.6469099865939976" lat="51.587434752496144"/>
          <point xsi:type="esdl:Point" lon="3.6468500973694886" lat="51.587406744233604"/>
          <point xsi:type="esdl:Point" lon="3.6467848889112773" lat="51.58738380241421"/>
          <point xsi:type="esdl:Point" lon="3.6467154622694014" lat="51.587366313901"/>
          <point xsi:type="esdl:Point" lon="3.646642985008318" lat="51.58735457257797"/>
          <point xsi:type="esdl:Point" lon="3.6465686767243652" lat="51.58734877583353"/>
          <point xsi:type="esdl:Point" lon="3.6461922772065867" lat="51.587295491044244"/>
          <point xsi:type="esdl:Point" lon="3.6455733660700567" lat="51.58730060686161"/>
          <point xsi:type="esdl:Point" lon="3.6449628202962208" lat="51.58736398387153"/>
          <point xsi:type="esdl:Point" lon="3.6434249247505512" lat="51.58767942933905"/>
          <point xsi:type="esdl:Point" lon="3.643138579828637" lat="51.587693802827566"/>
          <point xsi:type="esdl:Point" lon="3.6428521813865933" lat="51.587679851089504"/>
          <point xsi:type="esdl:Point" lon="3.642572904505724" lat="51.58763792418825"/>
          <point xsi:type="esdl:Point" lon="3.6423077464338287" lat="51.58756907188402"/>
          <point xsi:type="esdl:Point" lon="3.642063350096523" lat="51.587475020313086"/>
          <point xsi:type="esdl:Point" lon="3.6418458388254162" lat="51.58735812432248"/>
          <point xsi:type="esdl:Point" lon="3.641602143365939" lat="51.58717472711533"/>
          <point xsi:type="esdl:Point" lon="3.6413147669810626" lat="51.586892469402144"/>
          <point xsi:type="esdl:Point" lon="3.6411059162295665" lat="51.58658458999954"/>
          <point xsi:type="esdl:Point" lon="3.6409812897461076" lat="51.586259490638454"/>
          <point xsi:type="esdl:Point" lon="3.64080147563807" lat="51.5836804787362"/>
          <point xsi:type="esdl:Point" lon="3.6403811582659036" lat="51.5827321672984"/>
          <point xsi:type="esdl:Point" lon="3.6401414008132904" lat="51.582448124458665"/>
          <point xsi:type="esdl:Point" lon="3.6348395776481865" lat="51.57801135935895"/>
          <point xsi:type="esdl:Point" lon="3.633469401514192" lat="51.576075620070256"/>
          <point xsi:type="esdl:Point" lon="3.632744783215202" lat="51.574233575719234"/>
          <point xsi:type="esdl:Point" lon="3.6326810199879804" lat="51.57384949928927"/>
          <point xsi:type="esdl:Point" lon="3.632724081802058" lat="51.57283934919808"/>
          <point xsi:type="esdl:Point" lon="3.6327882777996328" lat="51.57265473357051"/>
          <point xsi:type="esdl:Point" lon="3.632905880255547" lat="51.5724420544248"/>
          <point xsi:type="esdl:Point" lon="3.6339876214711193" lat="51.57112522542156"/>
          <point xsi:type="esdl:Point" lon="3.6341757142244666" lat="51.570971567176144"/>
          <point xsi:type="esdl:Point" lon="3.6422824551332607" lat="51.56577617125999"/>
          <point xsi:type="esdl:Point" lon="3.6457275278749544" lat="51.563995963652005"/>
          <point xsi:type="esdl:Point" lon="3.652583589904274" lat="51.56148911788686"/>
          <point xsi:type="esdl:Point" lon="3.6551501291176787" lat="51.56040525875589"/>
          <point xsi:type="esdl:Point" lon="3.659796561551771" lat="51.55739617780479"/>
          <point xsi:type="esdl:Point" lon="3.661499403316148" lat="51.55578337286281"/>
          <point xsi:type="esdl:Point" lon="3.6637406155584253" lat="51.554156090722515"/>
          <point xsi:type="esdl:Point" lon="3.6653465734889012" lat="51.55335864604521"/>
          <point xsi:type="esdl:Point" lon="3.672602495087869" lat="51.551135208700444"/>
          <point xsi:type="esdl:Point" lon="3.676364359101622" lat="51.549273797625325"/>
          <point xsi:type="esdl:Point" lon="3.6801822940316056" lat="51.546992768143774"/>
          <point xsi:type="esdl:Point" lon="3.6805446178538066" lat="51.546667315917404"/>
          <point xsi:type="esdl:Point" lon="3.6815203610710587" lat="51.54541192465145"/>
          <point xsi:type="esdl:Point" lon="3.681682030471521" lat="51.545033413486046"/>
          <point xsi:type="esdl:Point" lon="3.6821419580413366" lat="51.54171535790994"/>
          <point xsi:type="esdl:Point" lon="3.6816058119253228" lat="51.53810742943491"/>
          <point xsi:type="esdl:Point" lon="3.6816139736790303" lat="51.53800390514152"/>
          <point xsi:type="esdl:Point" lon="3.681662946890618" lat="51.537798981356936"/>
          <point xsi:type="esdl:Point" lon="3.6852454488864455" lat="51.53037210748992"/>
          <point xsi:type="esdl:Point" lon="3.6873210955140756" lat="51.527298633048176"/>
          <point xsi:type="esdl:Point" lon="3.6925307790236834" lat="51.52178727346191"/>
          <point xsi:type="esdl:Point" lon="3.6951048826408432" lat="51.52016952601556"/>
          <point xsi:type="esdl:Point" lon="3.695531380092124" lat="51.51995881264404"/>
          <point xsi:type="esdl:Point" lon="3.6974345009380656" lat="51.519269550163656"/>
          <point xsi:type="esdl:Point" lon="3.6999127414965236" lat="51.518743893457106"/>
          <point xsi:type="esdl:Point" lon="3.704039429989814" lat="51.51825101128088"/>
          <point xsi:type="esdl:Point" lon="3.7048600238811535" lat="51.51823845404858"/>
          <point xsi:type="esdl:Point" lon="3.705676677833469" lat="51.51828713130966"/>
          <point xsi:type="esdl:Point" lon="3.706477542525668" lat="51.518396506663066"/>
          <point xsi:type="esdl:Point" lon="3.710487408152966" lat="51.51934315995398"/>
          <point xsi:type="esdl:Point" lon="3.714051058706851" lat="51.52091271688734"/>
          <point xsi:type="esdl:Point" lon="3.7144466927342683" lat="51.521131195670804"/>
          <point xsi:type="esdl:Point" lon="3.714840619332561" lat="51.52142210300224"/>
          <point xsi:type="esdl:Point" lon="3.7154212116558747" lat="51.522007767467095"/>
          <point xsi:type="esdl:Point" lon="3.7157872293140057" lat="51.52230334761802"/>
          <point xsi:type="esdl:Point" lon="3.7162266834809965" lat="51.522557019577185"/>
          <point xsi:type="esdl:Point" lon="3.7169220802551317" lat="51.5228424094207"/>
          <point xsi:type="esdl:Point" lon="3.717200674865853" lat="51.522920865331564"/>
          <point xsi:type="esdl:Point" lon="3.717494222461143" lat="51.522974025872465"/>
          <point xsi:type="esdl:Point" lon="3.7177968552415743" lat="51.52300082982741"/>
          <point xsi:type="esdl:Point" lon="3.7181025218710415" lat="51.5230007404864"/>
          <point xsi:type="esdl:Point" lon="3.7184051131588833" lat="51.522973760167325"/>
          <point xsi:type="esdl:Point" lon="3.718698581710443" lat="51.522920427685555"/>
          <point xsi:type="esdl:Point" lon="3.71897705857962" lat="51.522841808643335"/>
          <point xsi:type="esdl:Point" lon="3.719234976965682" lat="51.52273947578047"/>
          <point xsi:type="esdl:Point" lon="3.7194671841432183" lat="51.52261547500633"/>
          <point xsi:type="esdl:Point" lon="3.7196690345151193" lat="51.52247228345198"/>
          <point xsi:type="esdl:Point" lon="3.7201268808921286" lat="51.522042308718135"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="d97921d0-9313-4237-b0a6-e2f09fed6eb0"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="2000000000.0" name="CBL_WF_NDW2" id="CBL_WF_NDW2" length="205245.709754056">
        <port xsi:type="esdl:InPort" name="InPort" id="6f7e2234-7ee2-4068-a08a-6b9318421cbc" connectedTo="b35bd1e6-2635-4293-b979-f4d4c6e3251f" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="65add1bf-b293-4668-88cd-58f511ee9c8d" name="OutPort" id="5657c071-8783-4f05-8816-d03b95034050" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.2573648078563084" lat="53.33685186756443"/>
          <point xsi:type="esdl:Point" lon="3.3853377982881088" lat="53.31369876465948"/>
          <point xsi:type="esdl:Point" lon="3.3864168378772295" lat="53.31341626373612"/>
          <point xsi:type="esdl:Point" lon="3.387408782964452" lat="53.31303614371674"/>
          <point xsi:type="esdl:Point" lon="3.3882892049501874" lat="53.31256776561794"/>
          <point xsi:type="esdl:Point" lon="3.38903642236312" lat="53.31202266538232"/>
          <point xsi:type="esdl:Point" lon="3.389632038759565" lat="53.31141426954796"/>
          <point xsi:type="esdl:Point" lon="3.390061392738822" lat="53.31075755906785"/>
          <point xsi:type="esdl:Point" lon="3.3903139188254405" lat="53.310068706485865"/>
          <point xsi:type="esdl:Point" lon="3.3903834071692387" lat="53.3093646757511"/>
          <point xsi:type="esdl:Point" lon="3.390371879433433" lat="53.3091883255274"/>
          <point xsi:type="esdl:Point" lon="3.3902107100419325" lat="53.30848970295436"/>
          <point xsi:type="esdl:Point" lon="3.354551387810446" lat="53.237769577266185"/>
          <point xsi:type="esdl:Point" lon="3.3544360736567933" lat="53.23707296957244"/>
          <point xsi:type="esdl:Point" lon="3.354502458032606" lat="53.236374069507235"/>
          <point xsi:type="esdl:Point" lon="3.3560184293593878" lat="53.2320361468596"/>
          <point xsi:type="esdl:Point" lon="3.3560851514963606" lat="53.231339522113224"/>
          <point xsi:type="esdl:Point" lon="3.3560735946909874" lat="53.23116505159318"/>
          <point xsi:type="esdl:Point" lon="3.35591494907835" lat="53.2304738011579"/>
          <point xsi:type="esdl:Point" lon="3.3555799133327153" lat="53.22980561430167"/>
          <point xsi:type="esdl:Point" lon="3.355076572461917" lat="53.22917659556744"/>
          <point xsi:type="esdl:Point" lon="3.346644548938809" lat="53.221779989745635"/>
          <point xsi:type="esdl:Point" lon="3.346143226499454" lat="53.221154490153744"/>
          <point xsi:type="esdl:Point" lon="3.283179444810844" lat="53.095124438847925"/>
          <point xsi:type="esdl:Point" lon="3.2821341953493515" lat="53.08908079560505"/>
          <point xsi:type="esdl:Point" lon="3.2226318960043767" lat="52.95828950966523"/>
          <point xsi:type="esdl:Point" lon="3.222539334619512" lat="52.95764231132061"/>
          <point xsi:type="esdl:Point" lon="3.222543190772905" lat="52.95747976201349"/>
          <point xsi:type="esdl:Point" lon="3.2226664073969626" lat="52.95683442935748"/>
          <point xsi:type="esdl:Point" lon="3.2279537644283707" lat="52.94537403782157"/>
          <point xsi:type="esdl:Point" lon="3.2280282023101083" lat="52.94470055291647"/>
          <point xsi:type="esdl:Point" lon="3.227916218391414" lat="52.94402896633134"/>
          <point xsi:type="esdl:Point" lon="3.2205927675210213" lat="52.92770578868126"/>
          <point xsi:type="esdl:Point" lon="3.2205100737787635" lat="52.92700183585708"/>
          <point xsi:type="esdl:Point" lon="3.2205180694506184" lat="52.92682530112858"/>
          <point xsi:type="esdl:Point" lon="3.2206643552921794" lat="52.926125135670055"/>
          <point xsi:type="esdl:Point" lon="3.2209901804427923" lat="52.92544743731121"/>
          <point xsi:type="esdl:Point" lon="3.2431866201795874" lat="52.8968651193103"/>
          <point xsi:type="esdl:Point" lon="3.2435079647259704" lat="52.89620541478098"/>
          <point xsi:type="esdl:Point" lon="3.247759771441053" lat="52.87754326782702"/>
          <point xsi:type="esdl:Point" lon="3.2481834334507536" lat="52.87688246822535"/>
          <point xsi:type="esdl:Point" lon="3.2487735038943946" lat="52.87627017369582"/>
          <point xsi:type="esdl:Point" lon="3.2495153063988265" lat="52.87572160689584"/>
          <point xsi:type="esdl:Point" lon="3.26602226941426" lat="52.866807644891864"/>
          <point xsi:type="esdl:Point" lon="3.2667518523456303" lat="52.866317391609776"/>
          <point xsi:type="esdl:Point" lon="3.2673549689126338" lat="52.86576778385016"/>
          <point xsi:type="esdl:Point" lon="3.3238635373276284" lat="52.79291948795021"/>
          <point xsi:type="esdl:Point" lon="3.3248001359035384" lat="52.79206337422039"/>
          <point xsi:type="esdl:Point" lon="3.3259539952750337" lat="52.79131103319788"/>
          <point xsi:type="esdl:Point" lon="3.327294363101554" lat="52.790682507023575"/>
          <point xsi:type="esdl:Point" lon="3.3287855240739916" lat="52.7901945419639"/>
          <point xsi:type="esdl:Point" lon="3.4345686069242505" lat="52.76916410855538"/>
          <point xsi:type="esdl:Point" lon="3.449263984608239" lat="52.7647153052263"/>
          <point xsi:type="esdl:Point" lon="3.520319128210782" lat="52.74995640840543"/>
          <point xsi:type="esdl:Point" lon="3.5214571216659865" lat="52.749588726767826"/>
          <point xsi:type="esdl:Point" lon="3.522495471452285" lat="52.74912501315179"/>
          <point xsi:type="esdl:Point" lon="3.5234123289760655" lat="52.748575025317656"/>
          <point xsi:type="esdl:Point" lon="3.5241884070560703" lat="52.74795033680582"/>
          <point xsi:type="esdl:Point" lon="3.524807384398387" lat="52.74726409031382"/>
          <point xsi:type="esdl:Point" lon="3.5252562427970613" lat="52.746530726207524"/>
          <point xsi:type="esdl:Point" lon="3.5255255487642474" lat="52.745765671757354"/>
          <point xsi:type="esdl:Point" lon="3.5256096459562722" lat="52.74498502363509"/>
          <point xsi:type="esdl:Point" lon="3.523934434928122" lat="52.60518451112696"/>
          <point xsi:type="esdl:Point" lon="3.5240095151194524" lat="52.60451162104149"/>
          <point xsi:type="esdl:Point" lon="3.524249111371249" lat="52.60385314400357"/>
          <point xsi:type="esdl:Point" lon="3.5246478239217365" lat="52.60322390427908"/>
          <point xsi:type="esdl:Point" lon="3.543807501194234" lat="52.58271057407627"/>
          <point xsi:type="esdl:Point" lon="3.5442074803081476" lat="52.582076480391066"/>
          <point xsi:type="esdl:Point" lon="3.5444460184029785" lat="52.581412911598214"/>
          <point xsi:type="esdl:Point" lon="3.5445176724132548" lat="52.58073502506727"/>
          <point xsi:type="esdl:Point" lon="3.5444902599625507" lat="52.580395547232925"/>
          <point xsi:type="esdl:Point" lon="3.541339877697549" lat="52.56842690351492"/>
          <point xsi:type="esdl:Point" lon="3.5408652612568425" lat="52.54515214499038"/>
          <point xsi:type="esdl:Point" lon="3.522908805459375" lat="52.4761180136569"/>
          <point xsi:type="esdl:Point" lon="3.5229266472398097" lat="52.47577956860832"/>
          <point xsi:type="esdl:Point" lon="3.5230870098823015" lat="52.47510992995435"/>
          <point xsi:type="esdl:Point" lon="3.5234101870231256" lat="52.47446258153323"/>
          <point xsi:type="esdl:Point" lon="3.527062167054344" lat="52.46978060736384"/>
          <point xsi:type="esdl:Point" lon="3.5332667612362876" lat="52.46370978041814"/>
          <point xsi:type="esdl:Point" lon="3.53648990936101" lat="52.458910103932226"/>
          <point xsi:type="esdl:Point" lon="3.5394244930452126" lat="52.45116960167503"/>
          <point xsi:type="esdl:Point" lon="3.541086784531621" lat="52.440321398382395"/>
          <point xsi:type="esdl:Point" lon="3.5408902964532767" lat="52.426035425960755"/>
          <point xsi:type="esdl:Point" lon="3.5401828789425513" lat="52.423590296856176"/>
          <point xsi:type="esdl:Point" lon="3.5401102137300042" lat="52.41940748327167"/>
          <point xsi:type="esdl:Point" lon="3.5393567404231456" lat="52.41491760367166"/>
          <point xsi:type="esdl:Point" lon="3.5389919580723004" lat="52.38798933350364"/>
          <point xsi:type="esdl:Point" lon="3.539003682415062" lat="52.387699796055806"/>
          <point xsi:type="esdl:Point" lon="3.540714398032085" lat="52.38049792486881"/>
          <point xsi:type="esdl:Point" lon="3.5403362280934707" lat="52.372841494551096"/>
          <point xsi:type="esdl:Point" lon="3.538053900616352" lat="52.367199059153904"/>
          <point xsi:type="esdl:Point" lon="3.533471152791326" lat="52.299441939713944"/>
          <point xsi:type="esdl:Point" lon="3.532560922836251" lat="52.295610521693156"/>
          <point xsi:type="esdl:Point" lon="3.527307330630834" lat="52.28579788348853"/>
          <point xsi:type="esdl:Point" lon="3.52719561549462" lat="52.28508880774273"/>
          <point xsi:type="esdl:Point" lon="3.5283286128124782" lat="52.25357213988124"/>
          <point xsi:type="esdl:Point" lon="3.528294833921114" lat="52.25278136060039"/>
          <point xsi:type="esdl:Point" lon="3.519881312508004" lat="52.21066708568937"/>
          <point xsi:type="esdl:Point" lon="3.5096978915133072" lat="52.185637323854216"/>
          <point xsi:type="esdl:Point" lon="3.5007600583200023" lat="52.11026372962402"/>
          <point xsi:type="esdl:Point" lon="3.5009057598845588" lat="52.10902735552939"/>
          <point xsi:type="esdl:Point" lon="3.501442725893335" lat="52.107577548327576"/>
          <point xsi:type="esdl:Point" lon="3.502360408935387" lat="52.10620206274101"/>
          <point xsi:type="esdl:Point" lon="3.5036336741704037" lat="52.10493851979561"/>
          <point xsi:type="esdl:Point" lon="3.5052276737116337" lat="52.103821473546304"/>
          <point xsi:type="esdl:Point" lon="3.507098796250469" lat="52.10288147074641"/>
          <point xsi:type="esdl:Point" lon="3.5567505700330875" lat="52.08519489963494"/>
          <point xsi:type="esdl:Point" lon="3.5664277844966907" lat="52.080944590553365"/>
          <point xsi:type="esdl:Point" lon="3.574854754978608" lat="52.07578217099111"/>
          <point xsi:type="esdl:Point" lon="3.5818079210410025" lat="52.06984488076354"/>
          <point xsi:type="esdl:Point" lon="3.687819450273215" lat="51.9372524897605"/>
          <point xsi:type="esdl:Point" lon="3.689304143213757" lat="51.93388421070836"/>
          <point xsi:type="esdl:Point" lon="3.6926140312135924" lat="51.913425379529244"/>
          <point xsi:type="esdl:Point" lon="3.6935325546202376" lat="51.91127502470346"/>
          <point xsi:type="esdl:Point" lon="3.6949759551334447" lat="51.90923792220479"/>
          <point xsi:type="esdl:Point" lon="3.696909671164056" lat="51.90736274811117"/>
          <point xsi:type="esdl:Point" lon="3.6992874437697236" lat="51.9056943057764"/>
          <point xsi:type="esdl:Point" lon="3.7020524249517845" lat="51.90427245202277"/>
          <point xsi:type="esdl:Point" lon="3.7051385320994243" lat="51.90313115157321"/>
          <point xsi:type="esdl:Point" lon="3.708472034004784" lat="51.90229766490877"/>
          <point xsi:type="esdl:Point" lon="3.7119733021807275" lat="51.90179189662986"/>
          <point xsi:type="esdl:Point" lon="3.715558716674425" lat="51.90162592750308"/>
          <point xsi:type="esdl:Point" lon="3.7740137460654792" lat="51.90485813347085"/>
          <point xsi:type="esdl:Point" lon="3.8386347293606606" lat="51.91251562762703"/>
          <point xsi:type="esdl:Point" lon="3.8398561700596714" lat="51.91257787961193"/>
          <point xsi:type="esdl:Point" lon="3.8410796588515534" lat="51.91253362904137"/>
          <point xsi:type="esdl:Point" lon="3.8422810359816584" lat="51.91238374914342"/>
          <point xsi:type="esdl:Point" lon="3.8434365754114195" lat="51.912131200596455"/>
          <point xsi:type="esdl:Point" lon="3.8445234569787248" lat="51.911780971408554"/>
          <point xsi:type="esdl:Point" lon="3.8651934495345164" lat="51.902101101434724"/>
          <point xsi:type="esdl:Point" lon="3.8673730945026015" lat="51.90144327711924"/>
          <point xsi:type="esdl:Point" lon="3.8696991738364566" lat="51.90101876717715"/>
          <point xsi:type="esdl:Point" lon="3.8721069543729536" lat="51.90083938627682"/>
          <point xsi:type="esdl:Point" lon="3.8745294319677805" lat="51.90091012583471"/>
          <point xsi:type="esdl:Point" lon="3.967103191700624" lat="51.913614850145684"/>
          <point xsi:type="esdl:Point" lon="3.9693410688821764" lat="51.9141686190405"/>
          <point xsi:type="esdl:Point" lon="3.984004981713828" lat="51.91971612359116"/>
          <point xsi:type="esdl:Point" lon="3.9853973626466423" lat="51.92103970933193"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="8fc06905-96aa-4292-88d6-201a29ff0f65"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="2000000000.0" name="CBL_WF_NDW3" id="CBL_WF_NDW3" length="266243.38320992124">
        <port xsi:type="esdl:InPort" name="InPort" id="e2c046d4-cc85-48a1-927b-73d4dbc7371d" connectedTo="18558581-8d07-47ef-a9e3-7eebf5fec1e9" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="1359b581-f569-4ce3-b0fa-4cbfefb93850" name="OutPort" id="9fe50f6f-ea79-49ad-91a8-97eb2a8eebc0" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.2306670426110777" lat="53.45077948428384"/>
          <point xsi:type="esdl:Point" lon="3.436073034585657" lat="53.41368951711878"/>
          <point xsi:type="esdl:Point" lon="3.437154262605962" lat="53.413406557646844"/>
          <point xsi:type="esdl:Point" lon="3.438148073308629" lat="53.41302601839685"/>
          <point xsi:type="esdl:Point" lon="3.4390299921477103" lat="53.41255727071969"/>
          <point xsi:type="esdl:Point" lon="3.4397783037823455" lat="53.41201186055724"/>
          <point xsi:type="esdl:Point" lon="3.440374583324126" lat="53.41140321941823"/>
          <point xsi:type="esdl:Point" lon="3.440804153110018" lat="53.41074633697593"/>
          <point xsi:type="esdl:Point" lon="3.441056442402139" lat="53.41005739001072"/>
          <point xsi:type="esdl:Point" lon="3.441125247219842" lat="53.40935334301887"/>
          <point xsi:type="esdl:Point" lon="3.441113480542343" lat="53.40917700116833"/>
          <point xsi:type="esdl:Point" lon="3.440951094218173" lat="53.40847846144602"/>
          <point xsi:type="esdl:Point" lon="3.3955608939626027" lat="53.318742386024475"/>
          <point xsi:type="esdl:Point" lon="3.3941392907948265" lat="53.311821037988615"/>
          <point xsi:type="esdl:Point" lon="3.3573182763544733" lat="53.23859954210865"/>
          <point xsi:type="esdl:Point" lon="3.3572029150058276" lat="53.237902938166954"/>
          <point xsi:type="esdl:Point" lon="3.3572692540222695" lat="53.23720403583793"/>
          <point xsi:type="esdl:Point" lon="3.359003366584457" lat="53.23225954536379"/>
          <point xsi:type="esdl:Point" lon="3.359070039093745" lat="53.2315629190587"/>
          <point xsi:type="esdl:Point" lon="3.3590584715888308" lat="53.231388448850744"/>
          <point xsi:type="esdl:Point" lon="3.3588997755783536" lat="53.230697202501275"/>
          <point xsi:type="esdl:Point" lon="3.3585646916420235" lat="53.23002902414113"/>
          <point xsi:type="esdl:Point" lon="3.3580613044507834" lat="53.22940001811262"/>
          <point xsi:type="esdl:Point" lon="3.348693539069444" lat="53.221188436927456"/>
          <point xsi:type="esdl:Point" lon="3.348192192258822" lat="53.22056294503465"/>
          <point xsi:type="esdl:Point" lon="3.2853248715819774" lat="53.09473672394702"/>
          <point xsi:type="esdl:Point" lon="3.2842793297258885" lat="53.08869309954581"/>
          <point xsi:type="esdl:Point" lon="3.2248236072713317" lat="52.95802706640421"/>
          <point xsi:type="esdl:Point" lon="3.2247723517240905" lat="52.95764436738585"/>
          <point xsi:type="esdl:Point" lon="3.2247753839141913" lat="52.95751630153477"/>
          <point xsi:type="esdl:Point" lon="3.224844728749464" lat="52.957134644619856"/>
          <point xsi:type="esdl:Point" lon="3.2301852989887725" lat="52.94547170158963"/>
          <point xsi:type="esdl:Point" lon="3.230260534227915" lat="52.944692818628745"/>
          <point xsi:type="esdl:Point" lon="3.2302501287265253" lat="52.94449770746008"/>
          <point xsi:type="esdl:Point" lon="3.2300920594671103" lat="52.94372336466751"/>
          <point xsi:type="esdl:Point" lon="3.2232649336052854" lat="52.928496838852"/>
          <point xsi:type="esdl:Point" lon="3.223182194975302" lat="52.92779288802997"/>
          <point xsi:type="esdl:Point" lon="3.223190179912545" lat="52.927616353156886"/>
          <point xsi:type="esdl:Point" lon="3.2233364252608854" lat="52.92691618454631"/>
          <point xsi:type="esdl:Point" lon="3.2236622160526682" lat="52.92623847898744"/>
          <point xsi:type="esdl:Point" lon="3.246072345132786" lat="52.89737913947215"/>
          <point xsi:type="esdl:Point" lon="3.2463936510964237" lat="52.89671942723899"/>
          <point xsi:type="esdl:Point" lon="3.250558802858039" lat="52.87844302848628"/>
          <point xsi:type="esdl:Point" lon="3.2509824310125217" lat="52.87778221904226"/>
          <point xsi:type="esdl:Point" lon="3.251572474159027" lat="52.87716991073351"/>
          <point xsi:type="esdl:Point" lon="3.2523142580827717" lat="52.876621325658036"/>
          <point xsi:type="esdl:Point" lon="3.268452445822864" lat="52.86790556084431"/>
          <point xsi:type="esdl:Point" lon="3.2691820196808" lat="52.86741529273563"/>
          <point xsi:type="esdl:Point" lon="3.269785120668986" lat="52.86686567275687"/>
          <point xsi:type="esdl:Point" lon="3.3266532984985515" lat="52.793588331090625"/>
          <point xsi:type="esdl:Point" lon="3.327335362807016" lat="52.79302485090517"/>
          <point xsi:type="esdl:Point" lon="3.3281532597695636" lat="52.7925322712068"/>
          <point xsi:type="esdl:Point" lon="3.329087218589448" lat="52.792122496166314"/>
          <point xsi:type="esdl:Point" lon="3.330114658064173" lat="52.791805430596646"/>
          <point xsi:type="esdl:Point" lon="3.435640979186822" lat="52.77084028705857"/>
          <point xsi:type="esdl:Point" lon="3.450610034219696" lat="52.76632033665382"/>
          <point xsi:type="esdl:Point" lon="3.5223864610723323" lat="52.75134115731135"/>
          <point xsi:type="esdl:Point" lon="3.523918576801509" lat="52.750738033967004"/>
          <point xsi:type="esdl:Point" lon="3.525279753273316" lat="52.74999923396077"/>
          <point xsi:type="esdl:Point" lon="3.526437672561412" lat="52.74914230383225"/>
          <point xsi:type="esdl:Point" lon="3.5273648435025575" lat="52.74818759632589"/>
          <point xsi:type="esdl:Point" lon="3.528039266473495" lat="52.74715778304596"/>
          <point xsi:type="esdl:Point" lon="3.52844494129633" lat="52.74607732023472"/>
          <point xsi:type="esdl:Point" lon="3.5285722568679514" lat="52.74497186397181"/>
          <point xsi:type="esdl:Point" lon="3.527614605774065" lat="52.66564326362958"/>
          <point xsi:type="esdl:Point" lon="3.5276334623867345" lat="52.66528784474523"/>
          <point xsi:type="esdl:Point" lon="3.5278092264482925" lat="52.66458527436541"/>
          <point xsi:type="esdl:Point" lon="3.5283229653782584" lat="52.663623473681476"/>
          <point xsi:type="esdl:Point" lon="3.528589508661438" lat="52.66293154777794"/>
          <point xsi:type="esdl:Point" lon="3.528673354088516" lat="52.66222272858089"/>
          <point xsi:type="esdl:Point" lon="3.528622067650011" lat="52.6598894125353"/>
          <point xsi:type="esdl:Point" lon="3.5284294090469555" lat="52.65918848415393"/>
          <point xsi:type="esdl:Point" lon="3.527728580177555" lat="52.657890032724765"/>
          <point xsi:type="esdl:Point" lon="3.5275359448706776" lat="52.657189102594124"/>
          <point xsi:type="esdl:Point" lon="3.5268934097472693" lat="52.60565514703306"/>
          <point xsi:type="esdl:Point" lon="3.526968445330744" lat="52.604982255241964"/>
          <point xsi:type="esdl:Point" lon="3.527207999683295" lat="52.6043237723806"/>
          <point xsi:type="esdl:Point" lon="3.5276066739859684" lat="52.60369452284619"/>
          <point xsi:type="esdl:Point" lon="3.546889539140798" lat="52.5830478155566"/>
          <point xsi:type="esdl:Point" lon="3.547289476737549" lat="52.58241371161071"/>
          <point xsi:type="esdl:Point" lon="3.547527968563735" lat="52.58175013677625"/>
          <point xsi:type="esdl:Point" lon="3.547599575529078" lat="52.58107224854696"/>
          <point xsi:type="esdl:Point" lon="3.5475721390458537" lat="52.58073277151065"/>
          <point xsi:type="esdl:Point" lon="3.5442888402817467" lat="52.56827371615594"/>
          <point xsi:type="esdl:Point" lon="3.543884623620675" lat="52.5508201194412"/>
          <point xsi:type="esdl:Point" lon="3.52478395149364" lat="52.479033428922"/>
          <point xsi:type="esdl:Point" lon="3.5247949705569215" lat="52.47877906361917"/>
          <point xsi:type="esdl:Point" lon="3.5248848958236634" lat="52.478401529670045"/>
          <point xsi:type="esdl:Point" lon="3.5270111277567064" lat="52.47440721964336"/>
          <point xsi:type="esdl:Point" lon="3.527359208484674" lat="52.474052461874564"/>
          <point xsi:type="esdl:Point" lon="3.527792012077414" lat="52.47373436976788"/>
          <point xsi:type="esdl:Point" lon="3.528299361334242" lat="52.47346042195036"/>
          <point xsi:type="esdl:Point" lon="3.532009969627414" lat="52.47205530417832"/>
          <point xsi:type="esdl:Point" lon="3.532496252923835" lat="52.47179728379307"/>
          <point xsi:type="esdl:Point" lon="3.532915892089157" lat="52.4714988075231"/>
          <point xsi:type="esdl:Point" lon="3.5332599587765556" lat="52.47116622483678"/>
          <point xsi:type="esdl:Point" lon="3.533521135979777" lat="52.47080661331734"/>
          <point xsi:type="esdl:Point" lon="3.542384053536617" lat="52.4511220028808"/>
          <point xsi:type="esdl:Point" lon="3.542674459438076" lat="52.44860769269236"/>
          <point xsi:type="esdl:Point" lon="3.5415211311053914" lat="52.385272859975984"/>
          <point xsi:type="esdl:Point" lon="3.541527846169868" lat="52.38510753222681"/>
          <point xsi:type="esdl:Point" lon="3.542205373992497" lat="52.38194577747624"/>
          <point xsi:type="esdl:Point" lon="3.5417147628930796" lat="52.37074001708275"/>
          <point xsi:type="esdl:Point" lon="3.541037651963323" lat="52.367634323453984"/>
          <point xsi:type="esdl:Point" lon="3.5363589099991644" lat="52.298965612889"/>
          <point xsi:type="esdl:Point" lon="3.535362968240093" lat="52.29506328515709"/>
          <point xsi:type="esdl:Point" lon="3.530198590811738" lat="52.2854986918517"/>
          <point xsi:type="esdl:Point" lon="3.5301282392891284" lat="52.285088764894056"/>
          <point xsi:type="esdl:Point" lon="3.5312582897990743" lat="52.25355315666938"/>
          <point xsi:type="esdl:Point" lon="3.531222114378963" lat="52.252707024384385"/>
          <point xsi:type="esdl:Point" lon="3.522775230788983" lat="52.21039415006239"/>
          <point xsi:type="esdl:Point" lon="3.512588886783697" lat="52.18536148295313"/>
          <point xsi:type="esdl:Point" lon="3.5099098148945282" lat="52.16402647752286"/>
          <point xsi:type="esdl:Point" lon="3.508346426856925" lat="52.160420349510034"/>
          <point xsi:type="esdl:Point" lon="3.507642539841847" lat="52.154576429002496"/>
          <point xsi:type="esdl:Point" lon="3.508200428686907" lat="52.14929261402722"/>
          <point xsi:type="esdl:Point" lon="3.503654207358912" lat="52.11043391671537"/>
          <point xsi:type="esdl:Point" lon="3.5036533769026525" lat="52.11020677032013"/>
          <point xsi:type="esdl:Point" lon="3.503823579444595" lat="52.10907701311267"/>
          <point xsi:type="esdl:Point" lon="3.5042801923854756" lat="52.107977792012704"/>
          <point xsi:type="esdl:Point" lon="3.5050118320745645" lat="52.106936456836905"/>
          <point xsi:type="esdl:Point" lon="3.506000278597021" lat="52.10597891416142"/>
          <point xsi:type="esdl:Point" lon="3.5072209245291552" lat="52.10512898855437"/>
          <point xsi:type="esdl:Point" lon="3.5086433913025563" lat="52.10440782099267"/>
          <point xsi:type="esdl:Point" lon="3.567374726436315" lat="52.08279725374544"/>
          <point xsi:type="esdl:Point" lon="3.5767214595009316" lat="52.07720242152439"/>
          <point xsi:type="esdl:Point" lon="3.584374345869377" lat="52.070704196720285"/>
          <point xsi:type="esdl:Point" lon="3.6904879862852797" lat="51.9379780349056"/>
          <point xsi:type="esdl:Point" lon="3.6921932537108995" lat="51.93411535081139"/>
          <point xsi:type="esdl:Point" lon="3.695200734989174" lat="51.91500451015328"/>
          <point xsi:type="esdl:Point" lon="3.695659538642896" lat="51.91325139132354"/>
          <point xsi:type="esdl:Point" lon="3.6964794521634987" lat="51.91171123697951"/>
          <point xsi:type="esdl:Point" lon="3.697663253277198" lat="51.91026446020721"/>
          <point xsi:type="esdl:Point" lon="3.6991841771695766" lat="51.90894372681165"/>
          <point xsi:type="esdl:Point" lon="3.729870954419511" lat="51.89016469618906"/>
          <point xsi:type="esdl:Point" lon="3.7308067865050356" lat="51.88975103742936"/>
          <point xsi:type="esdl:Point" lon="3.731836373355345" lat="51.8894339301696"/>
          <point xsi:type="esdl:Point" lon="3.8114148950877493" lat="51.87397186020945"/>
          <point xsi:type="esdl:Point" lon="3.8861940476927286" lat="51.85431849728709"/>
          <point xsi:type="esdl:Point" lon="3.888316557703824" lat="51.85391202503539"/>
          <point xsi:type="esdl:Point" lon="3.9421857901728856" lat="51.848953483877665"/>
          <point xsi:type="esdl:Point" lon="3.9798662915522964" lat="51.84863973037995"/>
          <point xsi:type="esdl:Point" lon="3.982188204757812" lat="51.848974742749654"/>
          <point xsi:type="esdl:Point" lon="4.001336428199091" lat="51.853807319184135"/>
          <point xsi:type="esdl:Point" lon="4.011150256886131" lat="51.85484857566479"/>
          <point xsi:type="esdl:Point" lon="4.0177760670720835" lat="51.854854489083195"/>
          <point xsi:type="esdl:Point" lon="4.020180317352549" lat="51.8546352214609"/>
          <point xsi:type="esdl:Point" lon="4.0224917859910105" lat="51.854170650050094"/>
          <point xsi:type="esdl:Point" lon="4.06594034295024" lat="51.83968554917381"/>
          <point xsi:type="esdl:Point" lon="4.070120456846837" lat="51.83502370235764"/>
          <point xsi:type="esdl:Point" lon="4.071473725643364" lat="51.83383520014727"/>
          <point xsi:type="esdl:Point" lon="4.0933109390282745" lat="51.82025419714137"/>
          <point xsi:type="esdl:Point" lon="4.095319449812668" lat="51.81946057329054"/>
          <point xsi:type="esdl:Point" lon="4.09751038390277" lat="51.81888129734022"/>
          <point xsi:type="esdl:Point" lon="4.110468923875791" lat="51.81701637238236"/>
          <point xsi:type="esdl:Point" lon="4.138447854247702" lat="51.817401884523754"/>
          <point xsi:type="esdl:Point" lon="4.143006172506772" lat="51.816925970333045"/>
          <point xsi:type="esdl:Point" lon="4.147384514038112" lat="51.81600724648425"/>
          <point xsi:type="esdl:Point" lon="4.151471624985949" lat="51.81466906188961"/>
          <point xsi:type="esdl:Point" lon="4.155163674177095" lat="51.81294542353555"/>
          <point xsi:type="esdl:Point" lon="4.158366901507913" lat="51.81088012635712"/>
          <point xsi:type="esdl:Point" lon="4.173579081630833" lat="51.79686276253192"/>
          <point xsi:type="esdl:Point" lon="4.20550694770653" lat="51.77452206672065"/>
          <point xsi:type="esdl:Point" lon="4.232495208057392" lat="51.762197572664945"/>
          <point xsi:type="esdl:Point" lon="4.23474475842709" lat="51.76162767763236"/>
          <point xsi:type="esdl:Point" lon="4.295928031053874" lat="51.753067958228584"/>
          <point xsi:type="esdl:Point" lon="4.353767194215142" lat="51.738682916085956"/>
          <point xsi:type="esdl:Point" lon="4.357741637269435" lat="51.73737500513337"/>
          <point xsi:type="esdl:Point" lon="4.381396159406223" lat="51.72630813096561"/>
          <point xsi:type="esdl:Point" lon="4.383113832908633" lat="51.72531138344792"/>
          <point xsi:type="esdl:Point" lon="4.384549196917959" lat="51.724155195803185"/>
          <point xsi:type="esdl:Point" lon="4.385673862824606" lat="51.7228730809942"/>
          <point xsi:type="esdl:Point" lon="4.386897812591263" lat="51.72162856363712"/>
          <point xsi:type="esdl:Point" lon="4.388429389879248" lat="51.72052321349795"/>
          <point xsi:type="esdl:Point" lon="4.390228334138376" lat="51.71958607156104"/>
          <point xsi:type="esdl:Point" lon="4.396756732473743" lat="51.71719684624165"/>
          <point xsi:type="esdl:Point" lon="4.425781805864433" lat="51.71053578482826"/>
          <point xsi:type="esdl:Point" lon="4.436463413479798" lat="51.70690018983664"/>
          <point xsi:type="esdl:Point" lon="4.451173466123409" lat="51.699774809102294"/>
          <point xsi:type="esdl:Point" lon="4.453221963492342" lat="51.69910764835932"/>
          <point xsi:type="esdl:Point" lon="4.472749277656206" lat="51.69502039568292"/>
          <point xsi:type="esdl:Point" lon="4.474939882890218" lat="51.694716699675865"/>
          <point xsi:type="esdl:Point" lon="4.507164874808607" lat="51.693394155180094"/>
          <point xsi:type="esdl:Point" lon="4.509601283056679" lat="51.693129027803586"/>
          <point xsi:type="esdl:Point" lon="4.511936099730118" lat="51.69262161397421"/>
          <point xsi:type="esdl:Point" lon="4.514107377759883" lat="51.69188537633438"/>
          <point xsi:type="esdl:Point" lon="4.5160575161532" lat="51.69093985096139"/>
          <point xsi:type="esdl:Point" lon="4.517734793491837" lat="51.68981012178225"/>
          <point xsi:type="esdl:Point" lon="4.51909473323857" lat="51.68852616023025"/>
          <point xsi:type="esdl:Point" lon="4.522574796466898" lat="51.68374813603908"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="1ff52306-ddc3-4213-bdae-c80a9b48debc"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_NDW-Noord" length="4196.886933168533" id="CBL_WF_NDW-Noord">
        <port xsi:type="esdl:InPort" name="InPort" id="f8e7d38b-d3c6-4067-9226-631dedd6c318" connectedTo="4a715f29-2c5b-4bcb-b49b-47d28ce26d06" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="e12e9c36-04b3-45de-8934-565c9610076e" name="OutPort" id="fcc4287a-52d2-485d-b6ab-b13935c9531f" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.439829" lat="53.512674"/>
          <point xsi:type="esdl:Point" lon="3.503093" lat="53.512674"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="3d2e7b30-dc23-4ea4-8e15-c3300d7972df"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA3" length="46801.6486566171" id="CBL_WF_WA3">
        <port xsi:type="esdl:InPort" name="InPort" id="e422661c-6267-4c66-ba52-cbae0f7cfe71" connectedTo="0215fba3-6ad0-41ca-8c93-9d6072f0a0dd" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="e12e9c36-04b3-45de-8934-565c9610076e" name="OutPort" id="6c0f1ffb-75b2-4ae7-ba25-65834e396d73" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.713972" lat="53.930931"/>
          <point xsi:type="esdl:Point" lon="3.692884" lat="53.906443"/>
          <point xsi:type="esdl:Point" lon="3.692884" lat="53.88194"/>
          <point xsi:type="esdl:Point" lon="3.671796" lat="53.857423"/>
          <point xsi:type="esdl:Point" lon="3.671796" lat="53.832892"/>
          <point xsi:type="esdl:Point" lon="3.650708" lat="53.808346"/>
          <point xsi:type="esdl:Point" lon="3.650708" lat="53.783786"/>
          <point xsi:type="esdl:Point" lon="3.650708" lat="53.759212"/>
          <point xsi:type="esdl:Point" lon="3.608532" lat="53.710019"/>
          <point xsi:type="esdl:Point" lon="3.608532" lat="53.685402"/>
          <point xsi:type="esdl:Point" lon="3.545268" lat="53.611462"/>
          <point xsi:type="esdl:Point" lon="3.545268" lat="53.586787"/>
          <point xsi:type="esdl:Point" lon="3.52418" lat="53.562097"/>
          <point xsi:type="esdl:Point" lon="3.52418" lat="53.537393"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="de763f98-dc3b-482b-bf98-9dbd38406f64"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="4000000000.0" name="CBL_from_HUB_West_to_HUB_IJVER" length="169667.57183956954" id="CBL_from_HUB_West_to_HUB_IJVER">
        <port xsi:type="esdl:InPort" name="InPort" id="e5fcd4fd-74fd-48d4-beb9-e72e0b734e87" connectedTo="804e3b7e-f03c-4c99-b0f2-cbde7b0b1344" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="ac377413-0431-4d63-8a4a-475e5faba1bb" name="OutPort" id="f798f861-23ed-46d5-a234-2ac65f534567" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.503093" lat="53.512674"/>
          <point xsi:type="esdl:Point" lon="3.503093" lat="53.487941"/>
          <point xsi:type="esdl:Point" lon="3.503093" lat="53.463194"/>
          <point xsi:type="esdl:Point" lon="3.545268" lat="53.413656"/>
          <point xsi:type="esdl:Point" lon="3.545268" lat="53.388865"/>
          <point xsi:type="esdl:Point" lon="3.545268" lat="53.36406"/>
          <point xsi:type="esdl:Point" lon="3.545268" lat="53.33924"/>
          <point xsi:type="esdl:Point" lon="3.545268" lat="53.314406"/>
          <point xsi:type="esdl:Point" lon="3.587444" lat="53.264695"/>
          <point xsi:type="esdl:Point" lon="3.608532" lat="53.264695"/>
          <point xsi:type="esdl:Point" lon="3.608532" lat="53.239817"/>
          <point xsi:type="esdl:Point" lon="3.608532" lat="53.214925"/>
          <point xsi:type="esdl:Point" lon="3.608532" lat="53.190019"/>
          <point xsi:type="esdl:Point" lon="3.608532" lat="53.165098"/>
          <point xsi:type="esdl:Point" lon="3.608532" lat="53.140163"/>
          <point xsi:type="esdl:Point" lon="3.608532" lat="53.115213"/>
          <point xsi:type="esdl:Point" lon="3.608532" lat="53.090248"/>
          <point xsi:type="esdl:Point" lon="3.650708" lat="53.040276"/>
          <point xsi:type="esdl:Point" lon="3.692884" lat="53.040276"/>
          <point xsi:type="esdl:Point" lon="3.756148" lat="52.965209"/>
          <point xsi:type="esdl:Point" lon="3.756148" lat="52.940158"/>
          <point xsi:type="esdl:Point" lon="3.777236" lat="52.915092"/>
          <point xsi:type="esdl:Point" lon="3.798324" lat="52.915092"/>
          <point xsi:type="esdl:Point" lon="3.840499" lat="52.864917"/>
          <point xsi:type="esdl:Point" lon="3.861587" lat="52.864917"/>
          <point xsi:type="esdl:Point" lon="3.861587" lat="52.839807"/>
          <point xsi:type="esdl:Point" lon="3.903763" lat="52.789545"/>
          <point xsi:type="esdl:Point" lon="4.156818" lat="52.789545"/>
          <point xsi:type="esdl:Point" lon="4.156818" lat="52.764392"/>
          <point xsi:type="esdl:Point" lon="4.177906" lat="52.739224"/>
          <point xsi:type="esdl:Point" lon="4.34661" lat="52.739224"/>
          <point xsi:type="esdl:Point" lon="4.34661" lat="52.714042"/>
          <point xsi:type="esdl:Point" lon="4.388785" lat="52.663635"/>
          <point xsi:type="esdl:Point" lon="4.388785" lat="52.638409"/>
          <point xsi:type="esdl:Point" lon="4.494225" lat="52.638409"/>
          <point xsi:type="esdl:Point" lon="4.515313" lat="52.613169"/>
          <point xsi:type="esdl:Point" lon="4.515313" lat="52.587914"/>
          <point xsi:type="esdl:Point" lon="4.557489" lat="52.53736"/>
          <point xsi:type="esdl:Point" lon="4.599665" lat="52.53736"/>
          <point xsi:type="esdl:Point" lon="4.599665" lat="52.512062"/>
          <point xsi:type="esdl:Point" lon="4.578577" lat="52.486749"/>
          <point xsi:type="esdl:Point" lon="4.578577" lat="52.461421"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="2834be91-bf31-4f09-9827-d7bee7a26a24"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_DDW1" length="54495.630757619874" id="CBL_WF_DDW1">
        <port xsi:type="esdl:InPort" name="InPort" id="eef7410b-f948-4df0-91f9-093b71be6c20" connectedTo="dc0183f9-75e6-4dca-afd6-ad7a99147bc3" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="df2b7f4e-b729-4799-937c-171608abddfb" name="OutPort" id="2a269ec0-be5a-46e4-94ac-bdd7313c3348" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.324032"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.311381"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.298725"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.286066"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.273403"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.260736"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.248065"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.23539"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.222711"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.210028"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.197342"/>
          <point xsi:type="esdl:Point" lon="5.469983" lat="54.184652"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.159259"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.146557"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.133851"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.121141"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.108427"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.095709"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.082988"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.070262"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.057533"/>
          <point xsi:type="esdl:Point" lon="5.452323" lat="54.0448"/>
          <point xsi:type="esdl:Point" lon="5.452323" lat="54.032062"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="53.993827"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="53.981074"/>
          <point xsi:type="esdl:Point" lon="5.558286" lat="53.942792"/>
          <point xsi:type="esdl:Point" lon="5.558286" lat="53.930024"/>
          <point xsi:type="esdl:Point" lon="5.611267" lat="53.891695"/>
          <point xsi:type="esdl:Point" lon="5.611267" lat="53.878911"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="48f2c80c-0a9c-49e5-bb19-10919f20572b"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_DDW2" length="57154.13798314699" id="CBL_WF_DDW2">
        <port xsi:type="esdl:InPort" name="InPort" id="aaba5184-c42e-4e24-a3f3-c45ebb329caa" connectedTo="affea88c-bb5f-4ed0-88fb-46c8ad15e027" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="df2b7f4e-b729-4799-937c-171608abddfb" name="OutPort" id="28e80fb4-b261-474b-80ff-81786fe4b913" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.505304" lat="54.324032"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="54.311381"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="54.298725"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="54.286066"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="54.273403"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="54.260736"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="54.248065"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="54.23539"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="54.222711"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="54.210028"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.159259"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.146557"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.133851"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.121141"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.108427"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.095709"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.082988"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.070262"/>
          <point xsi:type="esdl:Point" lon="5.434662" lat="54.057533"/>
          <point xsi:type="esdl:Point" lon="5.452323" lat="54.0448"/>
          <point xsi:type="esdl:Point" lon="5.452323" lat="54.032062"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="53.993827"/>
          <point xsi:type="esdl:Point" lon="5.505304" lat="53.981074"/>
          <point xsi:type="esdl:Point" lon="5.558286" lat="53.942792"/>
          <point xsi:type="esdl:Point" lon="5.558286" lat="53.930024"/>
          <point xsi:type="esdl:Point" lon="5.611267" lat="53.891695"/>
          <point xsi:type="esdl:Point" lon="5.611267" lat="53.878911"/>
          <point xsi:type="esdl:Point" lon="5.628928" lat="53.866123"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="4a99520e-18da-4b77-9712-4ce8896e25ae"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_DDW-West" id="CBL_WF_DDW-West" length="111.31170020054648">
        <port xsi:type="esdl:InPort" name="InPort" id="4d6cfbb0-7ad0-4c14-94eb-32be694615d0" connectedTo="68915d05-303f-45ef-958b-c6ff06dd4ccc" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="eb61df44-0588-42ba-9837-01797255e1c8" name="OutPort" id="f5a88aa3-0be1-4087-8d90-8cc480cbedad" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.44688724627309" lat="54.3606331898551"/>
          <point xsi:type="esdl:Point" lon="5.44688724627309" lat="54.3596331898551"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="1d974ec8-85e5-4efd-8aa6-87f3b4daf806"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA4_1" length="8325.473412090014" id="CBL_WF_WA4_1">
        <port xsi:type="esdl:InPort" name="InPort" id="07301e84-3006-4e7c-afca-e3d1190da58c" connectedTo="45805114-b2a8-4f87-b509-0c6835176ce6" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="df2b7f4e-b729-4799-937c-171608abddfb" name="OutPort" id="bccd349d-6086-45da-a1df-c02eb86df038" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.522965" lat="53.840535"/>
          <point xsi:type="esdl:Point" lon="5.558286" lat="53.840535"/>
          <point xsi:type="esdl:Point" lon="5.575946" lat="53.853331"/>
          <point xsi:type="esdl:Point" lon="5.611267" lat="53.853331"/>
          <point xsi:type="esdl:Point" lon="5.628928" lat="53.866123"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="43915f3d-b636-45bb-82f2-9a8d6b848662"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA4_2" length="1837.7837069532125" id="CBL_WF_WA4_2">
        <port xsi:type="esdl:InPort" name="InPort" id="5b3bf1ac-486e-4570-87c8-00c10f394ff5" connectedTo="a4f4807f-6c72-4776-b428-a95b5b1b59d7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="df2b7f4e-b729-4799-937c-171608abddfb" name="OutPort" id="66c4b0e4-c4e0-49a3-84c2-e47a347d55c3" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.611267" lat="53.853331"/>
          <point xsi:type="esdl:Point" lon="5.628928" lat="53.866123"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="29b10ad4-c45b-4108-8441-c1aefddc8b57"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="1000000000.0" name="CBL_WF_WA4_3" length="8513.965594116638" id="CBL_WF_WA4_3">
        <port xsi:type="esdl:InPort" name="InPort" id="97d3f5d3-061a-4a64-a117-7377b513a064" connectedTo="23c1f88e-196e-4ba9-9b4b-0caeafefd54d" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="df2b7f4e-b729-4799-937c-171608abddfb" name="OutPort" id="fe2355d8-1bc0-4872-b101-0c1711a68b2a" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.71723" lat="53.866123"/>
          <point xsi:type="esdl:Point" lon="5.69957" lat="53.866123"/>
          <point xsi:type="esdl:Point" lon="5.664249" lat="53.840535"/>
          <point xsi:type="esdl:Point" lon="5.628928" lat="53.866123"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="9d7a397d-0c1d-4548-8aa9-8541adc7c853"/>
      </asset>
      <asset xsi:type="esdl:GenericConversion" power="200000000.0" name="conversion_WF_TNW" id="conversion_WF_TNW" controlStrategy="1ca4842e-be2b-44b8-b723-7091bd0382ab" efficiency="1.0">
        <port xsi:type="esdl:InPort" name="InPort" id="675fdcfd-d490-40c4-b177-bb1a42b554d7" connectedTo="4197f127-241f-4b31-8855-18cd7b534310" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="be63ce24-c22b-4a27-95fc-981cd8c35bd7" name="OutPort" id="e8d7a223-f39c-4322-a4cf-b0717a881353" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="5.64406597749276" lat="54.0389496646664"/>
        <costInformation xsi:type="esdl:CostInformation" id="30cc661e-4e31-4a4d-9805-498723fb679c">
          <marginalCosts xsi:type="esdl:SingleValue" value="0.2" id="8e40a5e5-a1f7-4453-8d1e-48f6e5e7a7b7" name="conversion_WF_TNW_marginalcosts"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="200000000.0" name="CBL_WF_TNW_EL_conversion" id="CBL_WF_TNW_EL_conversion" length="72.11395478103157">
        <port xsi:type="esdl:InPort" name="InPort" id="ee1c4981-f67c-43a8-bd9d-1344b3931e79" connectedTo="01a79f00-c106-4826-ac44-acc272b4b4f3" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="675fdcfd-d490-40c4-b177-bb1a42b554d7" name="OutPort" id="4197f127-241f-4b31-8855-18cd7b534310" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.64336597749276" lat="54.0384496646664"/>
          <point xsi:type="esdl:Point" lon="5.64406597749276" lat="54.0389496646664"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="f64ee7ed-af5b-4997-ab4b-e1cbe8864d71"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="200000000.0" name="CBL_WF_TNW_EL_gen" id="CBL_WF_TNW_EL_gen" length="81136.1528551722">
        <port xsi:type="esdl:InPort" name="InPort" id="be63ce24-c22b-4a27-95fc-981cd8c35bd7" connectedTo="e8d7a223-f39c-4322-a4cf-b0717a881353" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="097776dd-5da1-4a91-ac65-eaaf387a56a9" name="OutPort" id="83b58229-2400-46eb-8946-bd90d65effba" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.715416325673452" lat="54.00851492533276"/>
          <point xsi:type="esdl:Point" lon="5.715182224191894" lat="54.007087460831016"/>
          <point xsi:type="esdl:Point" lon="6.142968772388104" lat="53.62542425566557"/>
          <point xsi:type="esdl:Point" lon="6.143740035223531" lat="53.62493527035734"/>
          <point xsi:type="esdl:Point" lon="6.144625095783251" lat="53.62451995025578"/>
          <point xsi:type="esdl:Point" lon="6.175495765777251" lat="53.614005063719"/>
          <point xsi:type="esdl:Point" lon="6.176367659446617" lat="53.61359747673583"/>
          <point xsi:type="esdl:Point" lon="6.177129778669862" lat="53.61311836664825"/>
          <point xsi:type="esdl:Point" lon="6.193621437667235" lat="53.59912201211626"/>
          <point xsi:type="esdl:Point" lon="6.246705297630897" lat="53.56685715290516"/>
          <point xsi:type="esdl:Point" lon="6.2582620907956095" lat="53.55537495127063"/>
          <point xsi:type="esdl:Point" lon="6.259027456235804" lat="53.55486303576205"/>
          <point xsi:type="esdl:Point" lon="6.329075576217769" lat="53.52029414195021"/>
          <point xsi:type="esdl:Point" lon="6.337735160343073" lat="53.51383052913046"/>
          <point xsi:type="esdl:Point" lon="6.3383458753744115" lat="53.513244659352345"/>
          <point xsi:type="esdl:Point" lon="6.343478088980654" lat="53.506087061111394"/>
          <point xsi:type="esdl:Point" lon="6.375662759513024" lat="53.42794884621087"/>
          <point xsi:type="esdl:Point" lon="6.386490845011662" lat="53.41110160946292"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="cb2effbf-bbe1-4d4e-a54a-f43a1432444d"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="500000000.0" name="CBL_WF_TNW_EL" id="CBL_WF_TNW_EL" length="59.02151876432281">
        <port xsi:type="esdl:InPort" name="InPort" id="6209a59d-e7c0-4b94-9f3a-380f30641c51" connectedTo="01a79f00-c106-4826-ac44-acc272b4b4f3" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="ca282c57-8af1-41bb-9ff8-7e2d087996ca" name="OutPort" id="c83f5326-a14c-4aa1-85c1-ca07701c709d" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.64336597749276" lat="54.0384496646664"/>
          <point xsi:type="esdl:Point" lon="5.64306597749276" lat="54.0389496646664"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="1570e9c3-d725-466c-b595-df688a1ef3fd"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="600000000.0" name="CBL_WF_Gemini" id="CBL_WF_Gemini" length="100842.35097014045">
        <port xsi:type="esdl:InPort" name="InPort" id="d205567c-e630-4dcb-8be1-b7e6deeb82f5" connectedTo="ec275309-ce97-4a2a-9436-f9b94c72d098" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="097776dd-5da1-4a91-ac65-eaaf387a56a9" name="OutPort" id="b59ef7de-1246-4a3f-9dc4-4298fc71c9ac" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.888533819753494" lat="54.03269368916181"/>
          <point xsi:type="esdl:Point" lon="5.888580951759655" lat="54.032719524900145"/>
          <point xsi:type="esdl:Point" lon="5.888929891512782" lat="54.03296203451409"/>
          <point xsi:type="esdl:Point" lon="5.888992772139213" lat="54.03301517958578"/>
          <point xsi:type="esdl:Point" lon="5.889003662602059" lat="54.03302147966149"/>
          <point xsi:type="esdl:Point" lon="5.88901611923928" lat="54.03302675392213"/>
          <point xsi:type="esdl:Point" lon="5.889077196842714" lat="54.0330321169914"/>
          <point xsi:type="esdl:Point" lon="5.889686321722359" lat="54.03302565023171"/>
          <point xsi:type="esdl:Point" lon="5.893088684315821" lat="54.033220833276005"/>
          <point xsi:type="esdl:Point" lon="5.893414591749221" lat="54.033267372765906"/>
          <point xsi:type="esdl:Point" lon="5.898585852703389" lat="54.03393929898701"/>
          <point xsi:type="esdl:Point" lon="5.898745541604871" lat="54.03397167480204"/>
          <point xsi:type="esdl:Point" lon="5.898894077705727" lat="54.03399218375024"/>
          <point xsi:type="esdl:Point" lon="5.899644999374333" lat="54.034073848371904"/>
          <point xsi:type="esdl:Point" lon="5.899940599507908" lat="54.03411903366952"/>
          <point xsi:type="esdl:Point" lon="5.9042486973854755" lat="54.03467553603572"/>
          <point xsi:type="esdl:Point" lon="5.904263270558384" lat="54.034678599634525"/>
          <point xsi:type="esdl:Point" lon="5.904404134229767" lat="54.03471906396194"/>
          <point xsi:type="esdl:Point" lon="5.904552378715687" lat="54.03474074100725"/>
          <point xsi:type="esdl:Point" lon="5.905763087871883" lat="54.034887933778236"/>
          <point xsi:type="esdl:Point" lon="5.905895288656045" lat="54.0349107164913"/>
          <point xsi:type="esdl:Point" lon="5.906346155091032" lat="54.03495887365619"/>
          <point xsi:type="esdl:Point" lon="5.9067860578681435" lat="54.0350357909844"/>
          <point xsi:type="esdl:Point" lon="5.907388664878604" lat="54.0350960945845"/>
          <point xsi:type="esdl:Point" lon="5.907682580547059" lat="54.03514579657865"/>
          <point xsi:type="esdl:Point" lon="5.908580416762712" lat="54.035252887366354"/>
          <point xsi:type="esdl:Point" lon="5.909035566645389" lat="54.0352847488903"/>
          <point xsi:type="esdl:Point" lon="5.9091839858904045" lat="54.03530704633521"/>
          <point xsi:type="esdl:Point" lon="5.90945983428367" lat="54.03537030629589"/>
          <point xsi:type="esdl:Point" lon="5.909474834477404" lat="54.03537227995387"/>
          <point xsi:type="esdl:Point" lon="5.909612309408138" lat="54.03537857004357"/>
          <point xsi:type="esdl:Point" lon="5.909628040506225" lat="54.035378368932186"/>
          <point xsi:type="esdl:Point" lon="5.9112067795360215" lat="54.03523674691907"/>
          <point xsi:type="esdl:Point" lon="5.913930436620102" lat="54.03483631005886"/>
          <point xsi:type="esdl:Point" lon="5.914085369873561" lat="54.034829316510645"/>
          <point xsi:type="esdl:Point" lon="5.91423388725427" lat="54.03481160049369"/>
          <point xsi:type="esdl:Point" lon="5.915721516671083" lat="54.03461225781251"/>
          <point xsi:type="esdl:Point" lon="5.918721154195454" lat="54.03428160497346"/>
          <point xsi:type="esdl:Point" lon="5.919015014186511" lat="54.03423158579864"/>
          <point xsi:type="esdl:Point" lon="5.921391768787666" lat="54.033902512978635"/>
          <point xsi:type="esdl:Point" lon="5.922693844333587" lat="54.0336425977786"/>
          <point xsi:type="esdl:Point" lon="5.922834636155714" lat="54.033606451956345"/>
          <point xsi:type="esdl:Point" lon="5.922984594865055" lat="54.033587880720184"/>
          <point xsi:type="esdl:Point" lon="5.926007785739096" lat="54.0333307266557"/>
          <point xsi:type="esdl:Point" lon="5.926316490581747" lat="54.03332725365771"/>
          <point xsi:type="esdl:Point" lon="5.926463647661613" lat="54.0333011053012"/>
          <point xsi:type="esdl:Point" lon="5.9408921430767725" lat="54.02899252240779"/>
          <point xsi:type="esdl:Point" lon="5.941620230251406" lat="54.028831132561066"/>
          <point xsi:type="esdl:Point" lon="5.947939001130262" lat="54.02683722472293"/>
          <point xsi:type="esdl:Point" lon="5.948934965155904" lat="54.02658642018466"/>
          <point xsi:type="esdl:Point" lon="5.952893093867354" lat="54.02523800613075"/>
          <point xsi:type="esdl:Point" lon="5.965640818138831" lat="54.02147407761419"/>
          <point xsi:type="esdl:Point" lon="5.970324152096401" lat="54.02000513521633"/>
          <point xsi:type="esdl:Point" lon="5.977357084751976" lat="54.01790792884377"/>
          <point xsi:type="esdl:Point" lon="5.9782786377928145" lat="54.01759021826674"/>
          <point xsi:type="esdl:Point" lon="6.001071327851383" lat="54.01089894667672"/>
          <point xsi:type="esdl:Point" lon="6.001352015094192" lat="54.01082864510295"/>
          <point xsi:type="esdl:Point" lon="6.0037926546990645" lat="54.009907211027404"/>
          <point xsi:type="esdl:Point" lon="6.010957492834045" lat="54.00788875066443"/>
          <point xsi:type="esdl:Point" lon="6.011382513607634" lat="54.00778873526844"/>
          <point xsi:type="esdl:Point" lon="6.015871308134919" lat="54.00626387982231"/>
          <point xsi:type="esdl:Point" lon="6.018354872972001" lat="54.005406062068765"/>
          <point xsi:type="esdl:Point" lon="6.025982978283665" lat="54.003228594816875"/>
          <point xsi:type="esdl:Point" lon="6.026364193628069" lat="54.00307586977743"/>
          <point xsi:type="esdl:Point" lon="6.0265120055401775" lat="54.00304886080872"/>
          <point xsi:type="esdl:Point" lon="6.070467273628581" lat="54.00015426746382"/>
          <point xsi:type="esdl:Point" lon="6.073155525708753" lat="53.99987675603788"/>
          <point xsi:type="esdl:Point" lon="6.08803206292398" lat="53.99907683354524"/>
          <point xsi:type="esdl:Point" lon="6.088794482288463" lat="53.999089051389056"/>
          <point xsi:type="esdl:Point" lon="6.101659798375847" lat="53.9981904491964"/>
          <point xsi:type="esdl:Point" lon="6.10179301071219" lat="53.998164263261174"/>
          <point xsi:type="esdl:Point" lon="6.101805594279173" lat="53.99816088096007"/>
          <point xsi:type="esdl:Point" lon="6.101925978129905" lat="53.99811282140347"/>
          <point xsi:type="esdl:Point" lon="6.1020268283437415" lat="53.9980424302407"/>
          <point xsi:type="esdl:Point" lon="6.1323531046120365" lat="53.961385432406125"/>
          <point xsi:type="esdl:Point" lon="6.133923149531429" lat="53.95965994149261"/>
          <point xsi:type="esdl:Point" lon="6.135691507157527" lat="53.956982569371725"/>
          <point xsi:type="esdl:Point" lon="6.138080969887992" lat="53.95446792858749"/>
          <point xsi:type="esdl:Point" lon="6.143491474666287" lat="53.94773050971703"/>
          <point xsi:type="esdl:Point" lon="6.144236596853976" lat="53.94695742130229"/>
          <point xsi:type="esdl:Point" lon="6.144449699839985" lat="53.94680952101827"/>
          <point xsi:type="esdl:Point" lon="6.144525661193949" lat="53.94674163174025"/>
          <point xsi:type="esdl:Point" lon="6.145374056446657" lat="53.94555452292414"/>
          <point xsi:type="esdl:Point" lon="6.14547584348889" lat="53.94537564478474"/>
          <point xsi:type="esdl:Point" lon="6.147558001335442" lat="53.94304047495187"/>
          <point xsi:type="esdl:Point" lon="6.149360935908795" lat="53.940932048492755"/>
          <point xsi:type="esdl:Point" lon="6.149414890611274" lat="53.94084756100375"/>
          <point xsi:type="esdl:Point" lon="6.149608832138348" lat="53.94032948263724"/>
          <point xsi:type="esdl:Point" lon="6.149677114184627" lat="53.940228346732795"/>
          <point xsi:type="esdl:Point" lon="6.151001620536144" lat="53.938909124804496"/>
          <point xsi:type="esdl:Point" lon="6.152236477747437" lat="53.937375484372254"/>
          <point xsi:type="esdl:Point" lon="6.152688739983687" lat="53.937005697111964"/>
          <point xsi:type="esdl:Point" lon="6.152761004187824" lat="53.93692585154837"/>
          <point xsi:type="esdl:Point" lon="6.154222147706669" lat="53.93496900089634"/>
          <point xsi:type="esdl:Point" lon="6.155098206162069" lat="53.934023377531"/>
          <point xsi:type="esdl:Point" lon="6.155452972345108" lat="53.93352641191195"/>
          <point xsi:type="esdl:Point" lon="6.1555564178370235" lat="53.93343531627672"/>
          <point xsi:type="esdl:Point" lon="6.155821751139731" lat="53.93323504567434"/>
          <point xsi:type="esdl:Point" lon="6.15697752551527" lat="53.931670256025676"/>
          <point xsi:type="esdl:Point" lon="6.157321132575308" lat="53.93136704966552"/>
          <point xsi:type="esdl:Point" lon="6.157400824905296" lat="53.931267676816596"/>
          <point xsi:type="esdl:Point" lon="6.157822340027648" lat="53.93033615010675"/>
          <point xsi:type="esdl:Point" lon="6.15832116369003" lat="53.929751142872185"/>
          <point xsi:type="esdl:Point" lon="6.159212348771134" lat="53.928893554518865"/>
          <point xsi:type="esdl:Point" lon="6.159787449223665" lat="53.9281895678152"/>
          <point xsi:type="esdl:Point" lon="6.193159113870999" lat="53.88783646104344"/>
          <point xsi:type="esdl:Point" lon="6.194405482993306" lat="53.886612565492044"/>
          <point xsi:type="esdl:Point" lon="6.196720555571846" lat="53.88336787097207"/>
          <point xsi:type="esdl:Point" lon="6.208084709827448" lat="53.869555444210825"/>
          <point xsi:type="esdl:Point" lon="6.2086809632795426" lat="53.86894035789897"/>
          <point xsi:type="esdl:Point" lon="6.219514720767483" lat="53.85572360222898"/>
          <point xsi:type="esdl:Point" lon="6.21959767804752" lat="53.855647560730105"/>
          <point xsi:type="esdl:Point" lon="6.22108384092694" lat="53.853768337383855"/>
          <point xsi:type="esdl:Point" lon="6.227332864085275" lat="53.846289882750106"/>
          <point xsi:type="esdl:Point" lon="6.227566250017188" lat="53.845863555562296"/>
          <point xsi:type="esdl:Point" lon="6.227597036416557" lat="53.84578459811547"/>
          <point xsi:type="esdl:Point" lon="6.227650230208278" lat="53.845700272201356"/>
          <point xsi:type="esdl:Point" lon="6.231906221027269" lat="53.84093850243295"/>
          <point xsi:type="esdl:Point" lon="6.23343308025174" lat="53.83867707568112"/>
          <point xsi:type="esdl:Point" lon="6.234068171360851" lat="53.83807509827041"/>
          <point xsi:type="esdl:Point" lon="6.236701045116622" lat="53.83472899036713"/>
          <point xsi:type="esdl:Point" lon="6.2377601565311025" lat="53.833151647651235"/>
          <point xsi:type="esdl:Point" lon="6.239230738552114" lat="53.8319316125265"/>
          <point xsi:type="esdl:Point" lon="6.241468090173197" lat="53.82923855344517"/>
          <point xsi:type="esdl:Point" lon="6.242566890485361" lat="53.82816239976884"/>
          <point xsi:type="esdl:Point" lon="6.245365699663933" lat="53.824477766049846"/>
          <point xsi:type="esdl:Point" lon="6.245909481826613" lat="53.8233549319049"/>
          <point xsi:type="esdl:Point" lon="6.24903332272556" lat="53.819923478579874"/>
          <point xsi:type="esdl:Point" lon="6.250054001938343" lat="53.81863053328339"/>
          <point xsi:type="esdl:Point" lon="6.250480088787388" lat="53.81799510837488"/>
          <point xsi:type="esdl:Point" lon="6.251132780568715" lat="53.81734751072169"/>
          <point xsi:type="esdl:Point" lon="6.2516500934025" lat="53.817053681985485"/>
          <point xsi:type="esdl:Point" lon="6.251696156830182" lat="53.81701745808636"/>
          <point xsi:type="esdl:Point" lon="6.251734995392756" lat="53.81697693483227"/>
          <point xsi:type="esdl:Point" lon="6.252551470117328" lat="53.81544235129157"/>
          <point xsi:type="esdl:Point" lon="6.25259837028288" lat="53.81531026312953"/>
          <point xsi:type="esdl:Point" lon="6.25265222091163" lat="53.815225816936355"/>
          <point xsi:type="esdl:Point" lon="6.25306275320538" lat="53.814840028004156"/>
          <point xsi:type="esdl:Point" lon="6.253698117726457" lat="53.81387632020668"/>
          <point xsi:type="esdl:Point" lon="6.255785778143459" lat="53.811360729747804"/>
          <point xsi:type="esdl:Point" lon="6.259050416287383" lat="53.808971689415095"/>
          <point xsi:type="esdl:Point" lon="6.260001146295133" lat="53.808203187432774"/>
          <point xsi:type="esdl:Point" lon="6.260058187370791" lat="53.80813914938862"/>
          <point xsi:type="esdl:Point" lon="6.260097929182299" lat="53.80805400423443"/>
          <point xsi:type="esdl:Point" lon="6.260337451216597" lat="53.80712152650719"/>
          <point xsi:type="esdl:Point" lon="6.260386545180934" lat="53.80603581169646"/>
          <point xsi:type="esdl:Point" lon="6.260490560987371" lat="53.80541855084681"/>
          <point xsi:type="esdl:Point" lon="6.260547168812301" lat="53.80525868277778"/>
          <point xsi:type="esdl:Point" lon="6.26066302729954" lat="53.805082636877145"/>
          <point xsi:type="esdl:Point" lon="6.263986746809391" lat="53.80176165495309"/>
          <point xsi:type="esdl:Point" lon="6.266659273065903" lat="53.79825243938933"/>
          <point xsi:type="esdl:Point" lon="6.267355263728615" lat="53.797546922175876"/>
          <point xsi:type="esdl:Point" lon="6.27308234183699" lat="53.79058561127529"/>
          <point xsi:type="esdl:Point" lon="6.273170681853163" lat="53.79041596814906"/>
          <point xsi:type="esdl:Point" lon="6.273244640949711" lat="53.790150156443374"/>
          <point xsi:type="esdl:Point" lon="6.273217820347097" lat="53.7891712470877"/>
          <point xsi:type="esdl:Point" lon="6.27321712120396" lat="53.789162275322795"/>
          <point xsi:type="esdl:Point" lon="6.273215398156648" lat="53.789135350697585"/>
          <point xsi:type="esdl:Point" lon="6.273214699014947" lat="53.78912637893263"/>
          <point xsi:type="esdl:Point" lon="6.273213550777593" lat="53.789108428570316"/>
          <point xsi:type="esdl:Point" lon="6.2732128516369725" lat="53.78909945680528"/>
          <point xsi:type="esdl:Point" lon="6.273212278276846" lat="53.789090481603374"/>
          <point xsi:type="esdl:Point" lon="6.273211579136956" lat="53.789081509838304"/>
          <point xsi:type="esdl:Point" lon="6.273210879997445" lat="53.78907253807321"/>
          <point xsi:type="esdl:Point" lon="6.273194823743044" lat="53.78888416945562"/>
          <point xsi:type="esdl:Point" lon="6.27319424887621" lat="53.78887519429467"/>
          <point xsi:type="esdl:Point" lon="6.273193549745669" lat="53.788866222529116"/>
          <point xsi:type="esdl:Point" lon="6.273192850615509" lat="53.78885725076354"/>
          <point xsi:type="esdl:Point" lon="6.273192151485724" lat="53.78884827899794"/>
          <point xsi:type="esdl:Point" lon="6.27319145235632" lat="53.78883930723231"/>
          <point xsi:type="esdl:Point" lon="6.2731907532272935" lat="53.78883033546669"/>
          <point xsi:type="esdl:Point" lon="6.273190054098645" lat="53.788821363701025"/>
          <point xsi:type="esdl:Point" lon="6.27317481598714" lat="53.78864187366491"/>
          <point xsi:type="esdl:Point" lon="6.273151856333135" lat="53.78819295846028"/>
          <point xsi:type="esdl:Point" lon="6.273151157229076" lat="53.7881839866933"/>
          <point xsi:type="esdl:Point" lon="6.273148286054692" lat="53.78813911079872"/>
          <point xsi:type="esdl:Point" lon="6.273147587022696" lat="53.788130139928995"/>
          <point xsi:type="esdl:Point" lon="6.273136680790895" lat="53.78791465706429"/>
          <point xsi:type="esdl:Point" lon="6.273135981697188" lat="53.78790568529678"/>
          <point xsi:type="esdl:Point" lon="6.273134826556261" lat="53.78788764519403"/>
          <point xsi:type="esdl:Point" lon="6.273134127533564" lat="53.78787867432382"/>
          <point xsi:type="esdl:Point" lon="6.273132979386972" lat="53.787860723956584"/>
          <point xsi:type="esdl:Point" lon="6.273132280295435" lat="53.78785175218895"/>
          <point xsi:type="esdl:Point" lon="6.273125241942162" lat="53.78772607232962"/>
          <point xsi:type="esdl:Point" lon="6.273124542855715" lat="53.78771710056171"/>
          <point xsi:type="esdl:Point" lon="6.273065626853989" lat="53.78648687572116"/>
          <point xsi:type="esdl:Point" lon="6.2730507702979486" lat="53.78630746514036"/>
          <point xsi:type="esdl:Point" lon="6.273043999341748" lat="53.7861996697697"/>
          <point xsi:type="esdl:Point" lon="6.273043300311644" lat="53.78619069799876"/>
          <point xsi:type="esdl:Point" lon="6.27304157902244" lat="53.78616377241763"/>
          <point xsi:type="esdl:Point" lon="6.273040879993769" lat="53.78615480064663"/>
          <point xsi:type="esdl:Point" lon="6.2730391571932325" lat="53.78612787510671"/>
          <point xsi:type="esdl:Point" lon="6.273038458165996" lat="53.78611890333563"/>
          <point xsi:type="esdl:Point" lon="6.273037759139139" lat="53.78610993156451"/>
          <point xsi:type="esdl:Point" lon="6.273037060112661" lat="53.786100959793394"/>
          <point xsi:type="esdl:Point" lon="6.2730363611564774" lat="53.786091988919615"/>
          <point xsi:type="esdl:Point" lon="6.273035662130755" lat="53.78608301714844"/>
          <point xsi:type="esdl:Point" lon="6.273034963105413" lat="53.78607404537727"/>
          <point xsi:type="esdl:Point" lon="6.273034264080447" lat="53.78606507360607"/>
          <point xsi:type="esdl:Point" lon="6.2730336908269235" lat="53.786056098398326"/>
          <point xsi:type="esdl:Point" lon="6.2730329918026895" lat="53.78604712662708"/>
          <point xsi:type="esdl:Point" lon="6.273032292778833" lat="53.78603815485583"/>
          <point xsi:type="esdl:Point" lon="6.273024176685642" lat="53.78594846790516"/>
          <point xsi:type="esdl:Point" lon="6.2730236034369025" lat="53.78593949269714"/>
          <point xsi:type="esdl:Point" lon="6.273022904417799" lat="53.78593052092565"/>
          <point xsi:type="esdl:Point" lon="6.273022205399076" lat="53.78592154915414"/>
          <point xsi:type="esdl:Point" lon="6.273021506380729" lat="53.78591257738258"/>
          <point xsi:type="esdl:Point" lon="6.273020807362762" lat="53.785903605611026"/>
          <point xsi:type="esdl:Point" lon="6.2730201083451735" lat="53.78589463383944"/>
          <point xsi:type="esdl:Point" lon="6.273019533583208" lat="53.78588565867274"/>
          <point xsi:type="esdl:Point" lon="6.273018834496434" lat="53.78587668600376"/>
          <point xsi:type="esdl:Point" lon="6.273018128558308" lat="53.78586762539381"/>
          <point xsi:type="esdl:Point" lon="6.2730031462138856" lat="53.78381102066338"/>
          <point xsi:type="esdl:Point" lon="6.273002447253538" lat="53.78380204888849"/>
          <point xsi:type="esdl:Point" lon="6.273001874057867" lat="53.78379307367719"/>
          <point xsi:type="esdl:Point" lon="6.2730011750982495" lat="53.78378410190226"/>
          <point xsi:type="esdl:Point" lon="6.273000027193356" lat="53.78376615152096"/>
          <point xsi:type="esdl:Point" lon="6.27299932823482" lat="53.78375717974597"/>
          <point xsi:type="esdl:Point" lon="6.272998753525599" lat="53.783748204575986"/>
          <point xsi:type="esdl:Point" lon="6.272998054567793" lat="53.78373923280096"/>
          <point xsi:type="esdl:Point" lon="6.272985008738554" lat="53.7834608730859"/>
          <point xsi:type="esdl:Point" lon="6.272984309791022" lat="53.78345190131033"/>
          <point xsi:type="esdl:Point" lon="6.272793752848254" lat="53.78166793030447"/>
          <point xsi:type="esdl:Point" lon="6.272756799685131" lat="53.78058113846782"/>
          <point xsi:type="esdl:Point" lon="6.272756100859853" lat="53.78057216668586"/>
          <point xsi:type="esdl:Point" lon="6.272755402034955" lat="53.7805631949039"/>
          <point xsi:type="esdl:Point" lon="6.272754703210435" lat="53.78055422312189"/>
          <point xsi:type="esdl:Point" lon="6.272754130140912" lat="53.78054524790387"/>
          <point xsi:type="esdl:Point" lon="6.272753424327487" lat="53.78053618638607"/>
          <point xsi:type="esdl:Point" lon="6.272752725504078" lat="53.78052721460403"/>
          <point xsi:type="esdl:Point" lon="6.272752026681049" lat="53.78051824282195"/>
          <point xsi:type="esdl:Point" lon="6.272751327858395" lat="53.780509271039854"/>
          <point xsi:type="esdl:Point" lon="6.272750629036122" lat="53.78050029925774"/>
          <point xsi:type="esdl:Point" lon="6.272750054453571" lat="53.780491324081005"/>
          <point xsi:type="esdl:Point" lon="6.272749355632029" lat="53.78048235229887"/>
          <point xsi:type="esdl:Point" lon="6.272748656810862" lat="53.78047338051668"/>
          <point xsi:type="esdl:Point" lon="6.272748083744452" lat="53.78046440529851"/>
          <point xsi:type="esdl:Point" lon="6.272747384924017" lat="53.78045543351631"/>
          <point xsi:type="esdl:Point" lon="6.272746810343172" lat="53.78044645833948"/>
          <point xsi:type="esdl:Point" lon="6.272746104533875" lat="53.78043739682147"/>
          <point xsi:type="esdl:Point" lon="6.272745531468823" lat="53.78042842160323"/>
          <point xsi:type="esdl:Point" lon="6.272744832649851" lat="53.78041944982093"/>
          <point xsi:type="esdl:Point" lon="6.272744133831255" lat="53.78041047803862"/>
          <point xsi:type="esdl:Point" lon="6.272743435013041" lat="53.780401506256304"/>
          <point xsi:type="esdl:Point" lon="6.2727427361952035" lat="53.780392534473954"/>
          <point xsi:type="esdl:Point" lon="6.2727420373777445" lat="53.78038356269159"/>
          <point xsi:type="esdl:Point" lon="6.272741338560665" lat="53.78037459090921"/>
          <point xsi:type="esdl:Point" lon="6.272740639813857" lat="53.780365620024156"/>
          <point xsi:type="esdl:Point" lon="6.272739940997532" lat="53.780356648241735"/>
          <point xsi:type="esdl:Point" lon="6.2727392421815855" lat="53.78034767645928"/>
          <point xsi:type="esdl:Point" lon="6.272738543366019" lat="53.78033870467683"/>
          <point xsi:type="esdl:Point" lon="6.272737844550829" lat="53.78032973289433"/>
          <point xsi:type="esdl:Point" lon="6.272737145736016" lat="53.78032076111182"/>
          <point xsi:type="esdl:Point" lon="6.272736446921584" lat="53.7803117893293"/>
          <point xsi:type="esdl:Point" lon="6.27273574810753" lat="53.780302817546755"/>
          <point xsi:type="esdl:Point" lon="6.2727350492938525" lat="53.780293845764184"/>
          <point xsi:type="esdl:Point" lon="6.272734350480555" lat="53.7802848739816"/>
          <point xsi:type="esdl:Point" lon="6.272733651667634" lat="53.780275902199"/>
          <point xsi:type="esdl:Point" lon="6.272732952855093" lat="53.78026693041638"/>
          <point xsi:type="esdl:Point" lon="6.2727322540429284" lat="53.78025795863374"/>
          <point xsi:type="esdl:Point" lon="6.272731555231143" lat="53.78024898685108"/>
          <point xsi:type="esdl:Point" lon="6.272730856419737" lat="53.780240015068394"/>
          <point xsi:type="esdl:Point" lon="6.2727301576087084" lat="53.780231043285696"/>
          <point xsi:type="esdl:Point" lon="6.272729458798056" lat="53.78022207150297"/>
          <point xsi:type="esdl:Point" lon="6.272724293724455" lat="53.78014129474106"/>
          <point xsi:type="esdl:Point" lon="6.272723594917348" lat="53.78013232295814"/>
          <point xsi:type="esdl:Point" lon="6.2727228961106185" lat="53.78012335117521"/>
          <point xsi:type="esdl:Point" lon="6.272722197304268" lat="53.780114379392266"/>
          <point xsi:type="esdl:Point" lon="6.272721498568191" lat="53.78010540850665"/>
          <point xsi:type="esdl:Point" lon="6.272720799762597" lat="53.780096436723674"/>
          <point xsi:type="esdl:Point" lon="6.272720100957381" lat="53.780087464940664"/>
          <point xsi:type="esdl:Point" lon="6.272719402152543" lat="53.780078493157625"/>
          <point xsi:type="esdl:Point" lon="6.272717179987151" lat="53.78005158124436"/>
          <point xsi:type="esdl:Point" lon="6.272691854207158" lat="53.77960264125789"/>
          <point xsi:type="esdl:Point" lon="6.27269115542073" lat="53.77959366947386"/>
          <point xsi:type="esdl:Point" lon="6.272690007837387" lat="53.77957571907541"/>
          <point xsi:type="esdl:Point" lon="6.272689309052039" lat="53.779566747291334"/>
          <point xsi:type="esdl:Point" lon="6.2726875869229755" lat="53.77953982171417"/>
          <point xsi:type="esdl:Point" lon="6.272686888139063" lat="53.77953084993002"/>
          <point xsi:type="esdl:Point" lon="6.27266518822212" lat="53.77912685426395"/>
          <point xsi:type="esdl:Point" lon="6.272664489453534" lat="53.77911788247899"/>
          <point xsi:type="esdl:Point" lon="6.272662194423759" lat="53.77908198257575"/>
          <point xsi:type="esdl:Point" lon="6.2726614956569575" lat="53.7790730107907"/>
          <point xsi:type="esdl:Point" lon="6.272657056019528" lat="53.77897423244327"/>
          <point xsi:type="esdl:Point" lon="6.272647688839954" lat="53.778884489678966"/>
          <point xsi:type="esdl:Point" lon="6.272567121823651" lat="53.77600134821242"/>
          <point xsi:type="esdl:Point" lon="6.272566423155811" lat="53.77599237642187"/>
          <point xsi:type="esdl:Point" lon="6.272565275858154" lat="53.77597442690826"/>
          <point xsi:type="esdl:Point" lon="6.272564577191396" lat="53.77596545511767"/>
          <point xsi:type="esdl:Point" lon="6.272562855386106" lat="53.77593852952174"/>
          <point xsi:type="esdl:Point" lon="6.27256215672078" lat="53.77592955773105"/>
          <point xsi:type="esdl:Point" lon="6.272561576808607" lat="53.775920492768904"/>
          <point xsi:type="esdl:Point" lon="6.272441469687662" lat="53.77485395312756"/>
          <point xsi:type="esdl:Point" lon="6.2724408952986295" lat="53.77484497794013"/>
          <point xsi:type="esdl:Point" lon="6.27244018969973" lat="53.77483591641083"/>
          <point xsi:type="esdl:Point" lon="6.27243961682629" lat="53.77482694118198"/>
          <point xsi:type="esdl:Point" lon="6.272438918215635" lat="53.77481796938852"/>
          <point xsi:type="esdl:Point" lon="6.27243834382796" lat="53.77480899420102"/>
          <point xsi:type="esdl:Point" lon="6.272437645218034" lat="53.77480002240753"/>
          <point xsi:type="esdl:Point" lon="6.272437072345944" lat="53.774791047178596"/>
          <point xsi:type="esdl:Point" lon="6.272436373736747" lat="53.774782075385055"/>
          <point xsi:type="esdl:Point" lon="6.272435799350426" lat="53.7747731001975"/>
          <point xsi:type="esdl:Point" lon="6.2724351007419585" lat="53.774764128403916"/>
          <point xsi:type="esdl:Point" lon="6.272425542206615" lat="53.7746654907705"/>
          <point xsi:type="esdl:Point" lon="6.272424969340142" lat="53.77465651554129"/>
          <point xsi:type="esdl:Point" lon="6.272424270736963" lat="53.77464754374745"/>
          <point xsi:type="esdl:Point" lon="6.272423572134161" lat="53.774638571953574"/>
          <point xsi:type="esdl:Point" lon="6.272422873531736" lat="53.77462960015969"/>
          <point xsi:type="esdl:Point" lon="6.27242229915174" lat="53.774620624971796"/>
          <point xsi:type="esdl:Point" lon="6.272421600550046" lat="53.77461165317787"/>
          <point xsi:type="esdl:Point" lon="6.27242090194873" lat="53.77460268138393"/>
          <point xsi:type="esdl:Point" lon="6.272420203347791" lat="53.774593709589965"/>
          <point xsi:type="esdl:Point" lon="6.2724195047472335" lat="53.77458473779598"/>
          <point xsi:type="esdl:Point" lon="6.2724188061470505" lat="53.77457576600199"/>
          <point xsi:type="esdl:Point" lon="6.272412055297627" lat="53.77449548215185"/>
          <point xsi:type="esdl:Point" lon="6.272406817610573" lat="53.77440571734234"/>
          <point xsi:type="esdl:Point" lon="6.272406119017668" lat="53.774396745547946"/>
          <point xsi:type="esdl:Point" lon="6.272411391949379" lat="53.77320243646143"/>
          <point xsi:type="esdl:Point" lon="6.272410679412172" lat="53.77319328519346"/>
          <point xsi:type="esdl:Point" lon="6.272408922958039" lat="53.773165910902165"/>
          <point xsi:type="esdl:Point" lon="6.272276131611411" lat="53.77220796778341"/>
          <point xsi:type="esdl:Point" lon="6.272445737491672" lat="53.770397611088924"/>
          <point xsi:type="esdl:Point" lon="6.27244059588735" lat="53.7703154847031"/>
          <point xsi:type="esdl:Point" lon="6.272174171388681" lat="53.768697127754166"/>
          <point xsi:type="esdl:Point" lon="6.272173597195701" lat="53.768688152555626"/>
          <point xsi:type="esdl:Point" lon="6.272172898798509" lat="53.768679180750546"/>
          <point xsi:type="esdl:Point" lon="6.272172326051042" lat="53.76867020461323"/>
          <point xsi:type="esdl:Point" lon="6.27217162772443" lat="53.76866123370547"/>
          <point xsi:type="esdl:Point" lon="6.272171053532805" lat="53.768652258506854"/>
          <point xsi:type="esdl:Point" lon="6.272170348151716" lat="53.76864319696569"/>
          <point xsi:type="esdl:Point" lon="6.27216977396077" lat="53.76863422176704"/>
          <point xsi:type="esdl:Point" lon="6.2721690755657695" lat="53.76862524996186"/>
          <point xsi:type="esdl:Point" lon="6.272168377171144" lat="53.76861627815663"/>
          <point xsi:type="esdl:Point" lon="6.272160254888037" lat="53.76842832183888"/>
          <point xsi:type="esdl:Point" lon="6.272159556500322" lat="53.768419350033305"/>
          <point xsi:type="esdl:Point" lon="6.272158983831411" lat="53.76841037479286"/>
          <point xsi:type="esdl:Point" lon="6.272158285444423" lat="53.76840140298722"/>
          <point xsi:type="esdl:Point" lon="6.272157138593599" lat="53.76838345254762"/>
          <point xsi:type="esdl:Point" lon="6.272156440207692" lat="53.76837448074195"/>
          <point xsi:type="esdl:Point" lon="6.272155866025779" lat="53.76836550554278"/>
          <point xsi:type="esdl:Point" lon="6.2721551676406015" lat="53.768356533737055"/>
          <point xsi:type="esdl:Point" lon="6.272154594974044" lat="53.76834755849648"/>
          <point xsi:type="esdl:Point" lon="6.272153896589596" lat="53.76833858669071"/>
          <point xsi:type="esdl:Point" lon="6.272153198205526" lat="53.768329614884934"/>
          <point xsi:type="esdl:Point" lon="6.272152499821834" lat="53.76832064307914"/>
          <point xsi:type="esdl:Point" lon="6.272151801508372" lat="53.768311672170675"/>
          <point xsi:type="esdl:Point" lon="6.2721510961402105" lat="53.76830261062884"/>
          <point xsi:type="esdl:Point" lon="6.272150397757657" lat="53.76829363882298"/>
          <point xsi:type="esdl:Point" lon="6.27214969937548" lat="53.7682846670171"/>
          <point xsi:type="esdl:Point" lon="6.2721490009936804" lat="53.768275695211194"/>
          <point xsi:type="esdl:Point" lon="6.272148302612259" lat="53.768266723405276"/>
          <point xsi:type="esdl:Point" lon="6.272147604231217" lat="53.76825775159934"/>
          <point xsi:type="esdl:Point" lon="6.272142118451347" lat="53.76816799261079"/>
          <point xsi:type="esdl:Point" lon="6.272141420074142" lat="53.76815902080464"/>
          <point xsi:type="esdl:Point" lon="6.272140721697316" lat="53.768150048998486"/>
          <point xsi:type="esdl:Point" lon="6.272010554357731" lat="53.76687654411092"/>
          <point xsi:type="esdl:Point" lon="6.272009981755377" lat="53.766867568867035"/>
          <point xsi:type="esdl:Point" lon="6.272009283439537" lat="53.76685859705776"/>
          <point xsi:type="esdl:Point" lon="6.272008585124077" lat="53.76684962524845"/>
          <point xsi:type="esdl:Point" lon="6.272008011008127" lat="53.766840650045886"/>
          <point xsi:type="esdl:Point" lon="6.272007312693395" lat="53.76683167823655"/>
          <point xsi:type="esdl:Point" lon="6.271593609869615" lat="53.76405033106277"/>
          <point xsi:type="esdl:Point" lon="6.271591980200739" lat="53.76402457106372"/>
          <point xsi:type="esdl:Point" lon="6.271591316961249" lat="53.76401604792703"/>
          <point xsi:type="esdl:Point" lon="6.27159023339648" lat="53.763998905090695"/>
          <point xsi:type="esdl:Point" lon="6.27158956317504" lat="53.76399029221782"/>
          <point xsi:type="esdl:Point" lon="6.271588479612088" lat="53.76397314938141"/>
          <point xsi:type="esdl:Point" lon="6.271587809391637" lat="53.76396453650848"/>
          <point xsi:type="esdl:Point" lon="6.271565664568446" lat="53.76342263325125"/>
          <point xsi:type="esdl:Point" lon="6.2715649594525145" lat="53.763413571696674"/>
          <point xsi:type="esdl:Point" lon="6.271512624801844" lat="53.75595186609468"/>
          <point xsi:type="esdl:Point" lon="6.2714192668106" lat="53.755370999249244"/>
          <point xsi:type="esdl:Point" lon="6.271417636448725" lat="53.7553259094456"/>
          <point xsi:type="esdl:Point" lon="6.271562830542171" lat="53.754612383830555"/>
          <point xsi:type="esdl:Point" lon="6.272698767552974" lat="53.751911953432085"/>
          <point xsi:type="esdl:Point" lon="6.27278896648114" lat="53.750926156611406"/>
          <point xsi:type="esdl:Point" lon="6.272809162338122" lat="53.750854486702444"/>
          <point xsi:type="esdl:Point" lon="6.272855324527228" lat="53.750749919466216"/>
          <point xsi:type="esdl:Point" lon="6.273616699441054" lat="53.74949052368666"/>
          <point xsi:type="esdl:Point" lon="6.276075939157257" lat="53.74365434936065"/>
          <point xsi:type="esdl:Point" lon="6.2768834751257385" lat="53.742299800676086"/>
          <point xsi:type="esdl:Point" lon="6.276958536993471" lat="53.74203170549046"/>
          <point xsi:type="esdl:Point" lon="6.276959825349761" lat="53.74185230222903"/>
          <point xsi:type="esdl:Point" lon="6.276923209599358" lat="53.74159094972569"/>
          <point xsi:type="esdl:Point" lon="6.276933385707564" lat="53.74149033307298"/>
          <point xsi:type="esdl:Point" lon="6.277244974619777" lat="53.74071470063061"/>
          <point xsi:type="esdl:Point" lon="6.277493440860159" lat="53.74038620500922"/>
          <point xsi:type="esdl:Point" lon="6.277710456695453" lat="53.74015980727359"/>
          <point xsi:type="esdl:Point" lon="6.277740875618314" lat="53.74011195241553"/>
          <point xsi:type="esdl:Point" lon="6.27775710454147" lat="53.74006978994372"/>
          <point xsi:type="esdl:Point" lon="6.277815372461273" lat="53.73827433024833"/>
          <point xsi:type="esdl:Point" lon="6.2785147781567385" lat="53.736617396895596"/>
          <point xsi:type="esdl:Point" lon="6.278771948342665" lat="53.736100839191785"/>
          <point xsi:type="esdl:Point" lon="6.279325551311208" lat="53.73470188644856"/>
          <point xsi:type="esdl:Point" lon="6.279638404071281" lat="53.73318607999189"/>
          <point xsi:type="esdl:Point" lon="6.280131938901061" lat="53.73224154884535"/>
          <point xsi:type="esdl:Point" lon="6.280516230994554" lat="53.731188881948114"/>
          <point xsi:type="esdl:Point" lon="6.280545741901673" lat="53.7307476085501"/>
          <point xsi:type="esdl:Point" lon="6.280566589282644" lat="53.7306861689558"/>
          <point xsi:type="esdl:Point" lon="6.280644667930884" lat="53.73057443019499"/>
          <point xsi:type="esdl:Point" lon="6.280940142632787" lat="53.73025488672901"/>
          <point xsi:type="esdl:Point" lon="6.281713879114134" lat="53.72900596844633"/>
          <point xsi:type="esdl:Point" lon="6.281912940328859" lat="53.72871549949234"/>
          <point xsi:type="esdl:Point" lon="6.282175490176185" lat="53.727637122265584"/>
          <point xsi:type="esdl:Point" lon="6.282171081924519" lat="53.72753726438967"/>
          <point xsi:type="esdl:Point" lon="6.282141468056505" lat="53.72734027531647"/>
          <point xsi:type="esdl:Point" lon="6.282192403460404" lat="53.726702501092795"/>
          <point xsi:type="esdl:Point" lon="6.28233118776428" lat="53.72621480458399"/>
          <point xsi:type="esdl:Point" lon="6.282726474054304" lat="53.72567008418658"/>
          <point xsi:type="esdl:Point" lon="6.282751710361874" lat="53.7256185030084"/>
          <point xsi:type="esdl:Point" lon="6.282808728762165" lat="53.725459778323376"/>
          <point xsi:type="esdl:Point" lon="6.2828295380799615" lat="53.72532254560391"/>
          <point xsi:type="esdl:Point" lon="6.2832118223356535" lat="53.72345201756159"/>
          <point xsi:type="esdl:Point" lon="6.283863047366289" lat="53.72225373423721"/>
          <point xsi:type="esdl:Point" lon="6.284220524349615" lat="53.72139005740185"/>
          <point xsi:type="esdl:Point" lon="6.284377024959776" lat="53.72118131015201"/>
          <point xsi:type="esdl:Point" lon="6.284400351753752" lat="53.72112933129556"/>
          <point xsi:type="esdl:Point" lon="6.284464526490658" lat="53.72087015965643"/>
          <point xsi:type="esdl:Point" lon="6.285227225193642" lat="53.71961135754047"/>
          <point xsi:type="esdl:Point" lon="6.285622688393652" lat="53.71792926642718"/>
          <point xsi:type="esdl:Point" lon="6.285688717997601" lat="53.71739276247627"/>
          <point xsi:type="esdl:Point" lon="6.285889564434668" lat="53.71695793121265"/>
          <point xsi:type="esdl:Point" lon="6.286267195956521" lat="53.716457737131606"/>
          <point xsi:type="esdl:Point" lon="6.2863421812955265" lat="53.71637898524154"/>
          <point xsi:type="esdl:Point" lon="6.286397296190937" lat="53.71630509541282"/>
          <point xsi:type="esdl:Point" lon="6.2864247232287855" lat="53.71621443256727"/>
          <point xsi:type="esdl:Point" lon="6.287021575101295" lat="53.71491458573734"/>
          <point xsi:type="esdl:Point" lon="6.287834137522721" lat="53.71255614794909"/>
          <point xsi:type="esdl:Point" lon="6.287916848305111" lat="53.71239230878914"/>
          <point xsi:type="esdl:Point" lon="6.288786205144464" lat="53.71019737671452"/>
          <point xsi:type="esdl:Point" lon="6.293529836362052" lat="53.69759518771009"/>
          <point xsi:type="esdl:Point" lon="6.293671969073065" lat="53.696638231563476"/>
          <point xsi:type="esdl:Point" lon="6.296121338690832" lat="53.691419399776585"/>
          <point xsi:type="esdl:Point" lon="6.297565767375709" lat="53.68702148302634"/>
          <point xsi:type="esdl:Point" lon="6.298172186375292" lat="53.686119784681395"/>
          <point xsi:type="esdl:Point" lon="6.303213325784884" lat="53.67256862162859"/>
          <point xsi:type="esdl:Point" lon="6.3038502344243525" lat="53.67133157966956"/>
          <point xsi:type="esdl:Point" lon="6.30403094195685" lat="53.67083109352922"/>
          <point xsi:type="esdl:Point" lon="6.304327039948188" lat="53.67033074546327"/>
          <point xsi:type="esdl:Point" lon="6.304726277306939" lat="53.66900468775931"/>
          <point xsi:type="esdl:Point" lon="6.304841817087372" lat="53.66874372239095"/>
          <point xsi:type="esdl:Point" lon="6.305207575159227" lat="53.66741463137694"/>
          <point xsi:type="esdl:Point" lon="6.3052474712698" lat="53.667324607500525"/>
          <point xsi:type="esdl:Point" lon="6.305498370544953" lat="53.666950660348256"/>
          <point xsi:type="esdl:Point" lon="6.306517785676358" lat="53.664094262075814"/>
          <point xsi:type="esdl:Point" lon="6.306546911119253" lat="53.66345895773651"/>
          <point xsi:type="esdl:Point" lon="6.306880263177388" lat="53.66272443513225"/>
          <point xsi:type="esdl:Point" lon="6.307371501841881" lat="53.662075455197275"/>
          <point xsi:type="esdl:Point" lon="6.307397385776696" lat="53.66202340092817"/>
          <point xsi:type="esdl:Point" lon="6.307884654286743" lat="53.66062476498726"/>
          <point xsi:type="esdl:Point" lon="6.30842670469348" lat="53.65972945883599"/>
          <point xsi:type="esdl:Point" lon="6.309898051743259" lat="53.65537681721956"/>
          <point xsi:type="esdl:Point" lon="6.310029076597332" lat="53.65457235630999"/>
          <point xsi:type="esdl:Point" lon="6.311155822513432" lat="53.65196333859767"/>
          <point xsi:type="esdl:Point" lon="6.311241055533243" lat="53.65093033127835"/>
          <point xsi:type="esdl:Point" lon="6.312758224685135" lat="53.64793393854148"/>
          <point xsi:type="esdl:Point" lon="6.313566096265022" lat="53.64537346360606"/>
          <point xsi:type="esdl:Point" lon="6.314960947604234" lat="53.642444801247755"/>
          <point xsi:type="esdl:Point" lon="6.3163184020750585" lat="53.6389532343966"/>
          <point xsi:type="esdl:Point" lon="6.316868672279575" lat="53.63811888332668"/>
          <point xsi:type="esdl:Point" lon="6.317046233086345" lat="53.63739916540813"/>
          <point xsi:type="esdl:Point" lon="6.3172439328308965" lat="53.63542822476873"/>
          <point xsi:type="esdl:Point" lon="6.317912606819965" lat="53.6335033774208"/>
          <point xsi:type="esdl:Point" lon="6.31890244926338" lat="53.63105091437296"/>
          <point xsi:type="esdl:Point" lon="6.319938015343506" lat="53.62916424213957"/>
          <point xsi:type="esdl:Point" lon="6.319953404968492" lat="53.629101326403514"/>
          <point xsi:type="esdl:Point" lon="6.319958331142375" lat="53.6290052545747"/>
          <point xsi:type="esdl:Point" lon="6.319918927132789" lat="53.6288356065369"/>
          <point xsi:type="esdl:Point" lon="6.318602364536895" lat="53.62596001731226"/>
          <point xsi:type="esdl:Point" lon="6.317953864257932" lat="53.623930195940886"/>
          <point xsi:type="esdl:Point" lon="6.317845272720029" lat="53.62376408589944"/>
          <point xsi:type="esdl:Point" lon="6.317634744909521" lat="53.62309235688325"/>
          <point xsi:type="esdl:Point" lon="6.317149272689904" lat="53.621933832814044"/>
          <point xsi:type="esdl:Point" lon="6.316887509552961" lat="53.62087600586821"/>
          <point xsi:type="esdl:Point" lon="6.31657582127769" lat="53.62022919870919"/>
          <point xsi:type="esdl:Point" lon="6.3164596144917144" lat="53.620043698619384"/>
          <point xsi:type="esdl:Point" lon="6.316390465563014" lat="53.61987775233577"/>
          <point xsi:type="esdl:Point" lon="6.316334362296691" lat="53.619590333337705"/>
          <point xsi:type="esdl:Point" lon="6.31667820003438" lat="53.615068148794094"/>
          <point xsi:type="esdl:Point" lon="6.316813070803959" lat="53.61465405209628"/>
          <point xsi:type="esdl:Point" lon="6.316918714052934" lat="53.61447624319917"/>
          <point xsi:type="esdl:Point" lon="6.317831279728795" lat="53.61335220556404"/>
          <point xsi:type="esdl:Point" lon="6.318730895179998" lat="53.612618194946094"/>
          <point xsi:type="esdl:Point" lon="6.319148645130754" lat="53.6123576337334"/>
          <point xsi:type="esdl:Point" lon="6.320227011610218" lat="53.61189638472638"/>
          <point xsi:type="esdl:Point" lon="6.320371246726673" lat="53.611846614605625"/>
          <point xsi:type="esdl:Point" lon="6.322374508705739" lat="53.611345988229516"/>
          <point xsi:type="esdl:Point" lon="6.324490870114331" lat="53.61109015970627"/>
          <point xsi:type="esdl:Point" lon="6.324783857081164" lat="53.61104505800857"/>
          <point xsi:type="esdl:Point" lon="6.325141898217188" lat="53.61101055474951"/>
          <point xsi:type="esdl:Point" lon="6.326565402299966" lat="53.610803808221625"/>
          <point xsi:type="esdl:Point" lon="6.328389281849914" lat="53.610394116494966"/>
          <point xsi:type="esdl:Point" lon="6.332606327121871" lat="53.60975865389847"/>
          <point xsi:type="esdl:Point" lon="6.333995770976783" lat="53.60934390178297"/>
          <point xsi:type="esdl:Point" lon="6.345310424507861" lat="53.60725430334766"/>
          <point xsi:type="esdl:Point" lon="6.3503153253690225" lat="53.60606028032258"/>
          <point xsi:type="esdl:Point" lon="6.350369383624041" lat="53.60604384039108"/>
          <point xsi:type="esdl:Point" lon="6.3504397874809495" lat="53.606027570932426"/>
          <point xsi:type="esdl:Point" lon="6.365878674913855" lat="53.604761722094594"/>
          <point xsi:type="esdl:Point" lon="6.367417620680908" lat="53.60463799899145"/>
          <point xsi:type="esdl:Point" lon="6.369694580572745" lat="53.60431443652859"/>
          <point xsi:type="esdl:Point" lon="6.370160108286522" lat="53.60430311149425"/>
          <point xsi:type="esdl:Point" lon="6.370895315541766" lat="53.60429640818427"/>
          <point xsi:type="esdl:Point" lon="6.3808491554831095" lat="53.60345829139733"/>
          <point xsi:type="esdl:Point" lon="6.382054201239067" lat="53.603421235533474"/>
          <point xsi:type="esdl:Point" lon="6.396909534780067" lat="53.603674002099496"/>
          <point xsi:type="esdl:Point" lon="6.401506725993309" lat="53.60360108792447"/>
          <point xsi:type="esdl:Point" lon="6.403532995460316" lat="53.603730881045564"/>
          <point xsi:type="esdl:Point" lon="6.403831994624941" lat="53.60377290015099"/>
          <point xsi:type="esdl:Point" lon="6.405132311956956" lat="53.60400857354902"/>
          <point xsi:type="esdl:Point" lon="6.40625382549102" lat="53.604093778830105"/>
          <point xsi:type="esdl:Point" lon="6.406473211271415" lat="53.604091573148246"/>
          <point xsi:type="esdl:Point" lon="6.406540461937906" lat="53.60408596943828"/>
          <point xsi:type="esdl:Point" lon="6.406613958290741" lat="53.60407587275076"/>
          <point xsi:type="esdl:Point" lon="6.406684518845852" lat="53.60406028478939"/>
          <point xsi:type="esdl:Point" lon="6.406751748457111" lat="53.604040475871166"/>
          <point xsi:type="esdl:Point" lon="6.406828189106643" lat="53.60401276195852"/>
          <point xsi:type="esdl:Point" lon="6.406887630559546" lat="53.60398607208307"/>
          <point xsi:type="esdl:Point" lon="6.406945603120222" lat="53.60395196146912"/>
          <point xsi:type="esdl:Point" lon="6.407043684800257" lat="53.603875615812086"/>
          <point xsi:type="esdl:Point" lon="6.407210934727459" lat="53.60369677501925"/>
          <point xsi:type="esdl:Point" lon="6.410679568898918" lat="53.59909199429683"/>
          <point xsi:type="esdl:Point" lon="6.413022162192695" lat="53.59620434174828"/>
          <point xsi:type="esdl:Point" lon="6.418605744688007" lat="53.59050047519381"/>
          <point xsi:type="esdl:Point" lon="6.4198114794222425" lat="53.58909667482867"/>
          <point xsi:type="esdl:Point" lon="6.419895192449481" lat="53.588975862355234"/>
          <point xsi:type="esdl:Point" lon="6.419936407461191" lat="53.58893835737623"/>
          <point xsi:type="esdl:Point" lon="6.420035712490478" lat="53.588871676985235"/>
          <point xsi:type="esdl:Point" lon="6.42009172630837" lat="53.58884148088075"/>
          <point xsi:type="esdl:Point" lon="6.427850711543296" lat="53.585274908959775"/>
          <point xsi:type="esdl:Point" lon="6.428070185852031" lat="53.585150376101524"/>
          <point xsi:type="esdl:Point" lon="6.428131752314892" lat="53.58512424274732"/>
          <point xsi:type="esdl:Point" lon="6.428258975600907" lat="53.58508246979519"/>
          <point xsi:type="esdl:Point" lon="6.429027039732532" lat="53.58471174547493"/>
          <point xsi:type="esdl:Point" lon="6.429612143762544" lat="53.584434832719054"/>
          <point xsi:type="esdl:Point" lon="6.42967861562314" lat="53.58441080609074"/>
          <point xsi:type="esdl:Point" lon="6.429750078890525" lat="53.584393019622695"/>
          <point xsi:type="esdl:Point" lon="6.430057454855825" lat="53.58434292764007"/>
          <point xsi:type="esdl:Point" lon="6.438983720893034" lat="53.58308465432415"/>
          <point xsi:type="esdl:Point" lon="6.458160990086867" lat="53.581717786638286"/>
          <point xsi:type="esdl:Point" lon="6.458906108019133" lat="53.58164344173988"/>
          <point xsi:type="esdl:Point" lon="6.472987741100856" lat="53.580656238198536"/>
          <point xsi:type="esdl:Point" lon="6.495749860221792" lat="53.58060666533326"/>
          <point xsi:type="esdl:Point" lon="6.497251761289785" lat="53.58060857674217"/>
          <point xsi:type="esdl:Point" lon="6.497402626896789" lat="53.58059597909746"/>
          <point xsi:type="esdl:Point" lon="6.497478091384322" lat="53.58057875397697"/>
          <point xsi:type="esdl:Point" lon="6.497545864037866" lat="53.58055743885874"/>
          <point xsi:type="esdl:Point" lon="6.497606125675346" lat="53.580534185103794"/>
          <point xsi:type="esdl:Point" lon="6.497666292550177" lat="53.58050526908768"/>
          <point xsi:type="esdl:Point" lon="6.49771138335321" lat="53.580477873539074"/>
          <point xsi:type="esdl:Point" lon="6.497763999790165" lat="53.58043299377665"/>
          <point xsi:type="esdl:Point" lon="6.497801416643866" lat="53.58038514136702"/>
          <point xsi:type="esdl:Point" lon="6.497861142234299" lat="53.58028907112964"/>
          <point xsi:type="esdl:Point" lon="6.498056070676908" lat="53.580067834157475"/>
          <point xsi:type="esdl:Point" lon="6.49810847420194" lat="53.57999625516847"/>
          <point xsi:type="esdl:Point" lon="6.498138312754508" lat="53.57993360893979"/>
          <point xsi:type="esdl:Point" lon="6.4981457162475955" lat="53.57992368103101"/>
          <point xsi:type="esdl:Point" lon="6.4981606897647035" lat="53.57990885669604"/>
          <point xsi:type="esdl:Point" lon="6.498175757013948" lat="53.57989816482569"/>
          <point xsi:type="esdl:Point" lon="6.498190835932856" lat="53.579892148331645"/>
          <point xsi:type="esdl:Point" lon="6.498205912332872" lat="53.57988909976391"/>
          <point xsi:type="esdl:Point" lon="6.4983190224956004" lat="53.57987958385645"/>
          <point xsi:type="esdl:Point" lon="6.498341671452871" lat="53.57988071949656"/>
          <point xsi:type="esdl:Point" lon="6.498356871652148" lat="53.579885220025766"/>
          <point xsi:type="esdl:Point" lon="6.498371997570552" lat="53.579893319228"/>
          <point xsi:type="esdl:Point" lon="6.498379553689082" lat="53.579901819911406"/>
          <point xsi:type="esdl:Point" lon="6.498387212889839" lat="53.57991760051212"/>
          <point xsi:type="esdl:Point" lon="6.498433337687195" lat="53.58005499196748"/>
          <point xsi:type="esdl:Point" lon="6.498539877397606" lat="53.5802086870818"/>
          <point xsi:type="esdl:Point" lon="6.4985708649670295" lat="53.58032575117758"/>
          <point xsi:type="esdl:Point" lon="6.4985936309031525" lat="53.58035844333601"/>
          <point xsi:type="esdl:Point" lon="6.498692290529819" lat="53.5804379181498"/>
          <point xsi:type="esdl:Point" lon="6.498722567078909" lat="53.580457443344734"/>
          <point xsi:type="esdl:Point" lon="6.498767978247604" lat="53.58048218951303"/>
          <point xsi:type="esdl:Point" lon="6.498858807510931" lat="53.580516665150185"/>
          <point xsi:type="esdl:Point" lon="6.4989343778775455" lat="53.58053540370362"/>
          <point xsi:type="esdl:Point" lon="6.498979690618488" lat="53.580543877138616"/>
          <point xsi:type="esdl:Point" lon="6.4995838156958134" lat="53.580588948428165"/>
          <point xsi:type="esdl:Point" lon="6.5306937823998945" lat="53.580530808660505"/>
          <point xsi:type="esdl:Point" lon="6.530839832482977" lat="53.58051885050274"/>
          <point xsi:type="esdl:Point" lon="6.530930375263318" lat="53.580504755943444"/>
          <point xsi:type="esdl:Point" lon="6.592681313128169" lat="53.56476378104723"/>
          <point xsi:type="esdl:Point" lon="6.635607121618905" lat="53.552265528525574"/>
          <point xsi:type="esdl:Point" lon="6.636410570941495" lat="53.55195719102661"/>
          <point xsi:type="esdl:Point" lon="6.636849453017601" lat="53.55173107697958"/>
          <point xsi:type="esdl:Point" lon="6.6369075167314175" lat="53.55169226131527"/>
          <point xsi:type="esdl:Point" lon="6.6369521259930435" lat="53.551654844614355"/>
          <point xsi:type="esdl:Point" lon="6.636955326964158" lat="53.551651510237235"/>
          <point xsi:type="esdl:Point" lon="6.637034242355886" lat="53.551545158292335"/>
          <point xsi:type="esdl:Point" lon="6.637074436923956" lat="53.55145922961253"/>
          <point xsi:type="esdl:Point" lon="6.637082640954376" lat="53.55142714760245"/>
          <point xsi:type="esdl:Point" lon="6.6370853709649476" lat="53.551386420021544"/>
          <point xsi:type="esdl:Point" lon="6.63708152597697" lat="53.551345982582895"/>
          <point xsi:type="esdl:Point" lon="6.637080441616387" lat="53.55127389869786"/>
          <point xsi:type="esdl:Point" lon="6.637080056593579" lat="53.55126941435743"/>
          <point xsi:type="esdl:Point" lon="6.6370769894492865" lat="53.55123803620046"/>
          <point xsi:type="esdl:Point" lon="6.6370761987462314" lat="53.55122448214526"/>
          <point xsi:type="esdl:Point" lon="6.637075813724565" lat="53.55121999780479"/>
          <point xsi:type="esdl:Point" lon="6.6370747707288" lat="53.55120204530688"/>
          <point xsi:type="esdl:Point" lon="6.635886393056873" lat="53.543789530757735"/>
          <point xsi:type="esdl:Point" lon="6.635886119048351" lat="53.54378054786702"/>
          <point xsi:type="esdl:Point" lon="6.635880233363072" lat="53.54376274277395"/>
          <point xsi:type="esdl:Point" lon="6.635873040651645" lat="53.54375001316995"/>
          <point xsi:type="esdl:Point" lon="6.635857546756026" lat="53.54373196092818"/>
          <point xsi:type="esdl:Point" lon="6.635816114312268" lat="53.54370183966224"/>
          <point xsi:type="esdl:Point" lon="6.63573839554955" lat="53.543660953669466"/>
          <point xsi:type="esdl:Point" lon="6.6357240300915725" lat="53.543648801256154"/>
          <point xsi:type="esdl:Point" lon="6.635716012430975" lat="53.54363951444849"/>
          <point xsi:type="esdl:Point" lon="6.635708136556369" lat="53.54362464708788"/>
          <point xsi:type="esdl:Point" lon="6.635707892529617" lat="53.54361889930043"/>
          <point xsi:type="esdl:Point" lon="6.635699429612829" lat="53.54358121062372"/>
          <point xsi:type="esdl:Point" lon="6.635689902104622" lat="53.54355434437023"/>
          <point xsi:type="esdl:Point" lon="6.6356903139209225" lat="53.54354318205978"/>
          <point xsi:type="esdl:Point" lon="6.635692142566685" lat="53.543538360512294"/>
          <point xsi:type="esdl:Point" lon="6.63569604086893" lat="53.543534465296524"/>
          <point xsi:type="esdl:Point" lon="6.6356990408136785" lat="53.54353023677014"/>
          <point xsi:type="esdl:Point" lon="6.6357035842092005" lat="53.54352659173528"/>
          <point xsi:type="esdl:Point" lon="6.6357330653878766" lat="53.543511756426405"/>
          <point xsi:type="esdl:Point" lon="6.635746442510602" lat="53.54350658333693"/>
          <point xsi:type="esdl:Point" lon="6.635769281631274" lat="53.54349995390468"/>
          <point xsi:type="esdl:Point" lon="6.635795251871084" lat="53.543489181885185"/>
          <point xsi:type="esdl:Point" lon="6.635825652630226" lat="53.54346910297952"/>
          <point xsi:type="esdl:Point" lon="6.635829939811201" lat="53.54346537579974"/>
          <point xsi:type="esdl:Point" lon="6.635849342737969" lat="53.543434661777965"/>
          <point xsi:type="esdl:Point" lon="6.63585143374949" lat="53.5434300121195"/>
          <point xsi:type="esdl:Point" lon="6.635853960839792" lat="53.5434028688571"/>
          <point xsi:type="esdl:Point" lon="6.635837466422077" lat="53.54331075237451"/>
          <point xsi:type="esdl:Point" lon="6.635869628462088" lat="53.54320672355553"/>
          <point xsi:type="esdl:Point" lon="6.635918443555734" lat="53.5431386068958"/>
          <point xsi:type="esdl:Point" lon="6.636018571327579" lat="53.543037274873164"/>
          <point xsi:type="esdl:Point" lon="6.636088078894919" lat="53.542989748476046"/>
          <point xsi:type="esdl:Point" lon="6.636383517567757" lat="53.5428414666685"/>
          <point xsi:type="esdl:Point" lon="6.636428294953589" lat="53.54282787341369"/>
          <point xsi:type="esdl:Point" lon="6.636495130288891" lat="53.542813069807714"/>
          <point xsi:type="esdl:Point" lon="6.636584561555658" lat="53.54278588875443"/>
          <point xsi:type="esdl:Point" lon="6.636606121005957" lat="53.54277740939142"/>
          <point xsi:type="esdl:Point" lon="6.636606486803934" lat="53.54277730831427"/>
          <point xsi:type="esdl:Point" lon="6.636606727601035" lat="53.54277721104316"/>
          <point xsi:type="esdl:Point" lon="6.636607091892971" lat="53.54277711001187"/>
          <point xsi:type="esdl:Point" lon="6.636607324991458" lat="53.54277692303581"/>
          <point xsi:type="esdl:Point" lon="6.63660768928339" lat="53.54277682200452"/>
          <point xsi:type="esdl:Point" lon="6.63660817087758" lat="53.542776627462274"/>
          <point xsi:type="esdl:Point" lon="6.636608536675544" lat="53.542776526385126"/>
          <point xsi:type="esdl:Point" lon="6.636608768267986" lat="53.54277633945493"/>
          <point xsi:type="esdl:Point" lon="6.636609134065946" lat="53.54277623837777"/>
          <point xsi:type="esdl:Point" lon="6.636609374863036" lat="53.542776141106664"/>
          <point xsi:type="esdl:Point" lon="6.636609739154956" lat="53.54277604007536"/>
          <point xsi:type="esdl:Point" lon="6.636609979952042" lat="53.54277594280424"/>
          <point xsi:type="esdl:Point" lon="6.636610344243958" lat="53.542775841772915"/>
          <point xsi:type="esdl:Point" lon="6.636610577342425" lat="53.54277565479688"/>
          <point xsi:type="esdl:Point" lon="6.637045888105842" lat="53.54260620648133"/>
          <point xsi:type="esdl:Point" lon="6.637125105271978" lat="53.54256593778316"/>
          <point xsi:type="esdl:Point" lon="6.637165151763527" lat="53.54253639276496"/>
          <point xsi:type="esdl:Point" lon="6.63724120557777" lat="53.542447662961415"/>
          <point xsi:type="esdl:Point" lon="6.637585411878886" lat="53.54189144881281"/>
          <point xsi:type="esdl:Point" lon="6.637615768338045" lat="53.54182155515092"/>
          <point xsi:type="esdl:Point" lon="6.637895976859448" lat="53.541375644464395"/>
          <point xsi:type="esdl:Point" lon="6.638703064142346" lat="53.54005952127221"/>
          <point xsi:type="esdl:Point" lon="6.638712010343098" lat="53.54003757780962"/>
          <point xsi:type="esdl:Point" lon="6.6388010898089584" lat="53.53989908318429"/>
          <point xsi:type="esdl:Point" lon="6.638808179980428" lat="53.53988160239363"/>
          <point xsi:type="esdl:Point" lon="6.638818683960781" lat="53.53986473710755"/>
          <point xsi:type="esdl:Point" lon="6.638844368262445" lat="53.539812968807375"/>
          <point xsi:type="esdl:Point" lon="6.638954355131105" lat="53.5396265379015"/>
          <point xsi:type="esdl:Point" lon="6.638977245856734" lat="53.53957413606789"/>
          <point xsi:type="esdl:Point" lon="6.639038833368117" lat="53.53948233899929"/>
          <point xsi:type="esdl:Point" lon="6.639112304089198" lat="53.53935492984847"/>
          <point xsi:type="esdl:Point" lon="6.639170665393593" lat="53.53927195243182"/>
          <point xsi:type="esdl:Point" lon="6.639183504112397" lat="53.5392460238222"/>
          <point xsi:type="esdl:Point" lon="6.639189772961583" lat="53.53923782999386"/>
          <point xsi:type="esdl:Point" lon="6.639422542870227" lat="53.53891547412005"/>
          <point xsi:type="esdl:Point" lon="6.639467049080526" lat="53.53885818633201"/>
          <point xsi:type="esdl:Point" lon="6.639489460316759" lat="53.53882486166007"/>
          <point xsi:type="esdl:Point" lon="6.6397590997048255" lat="53.538533212875734"/>
          <point xsi:type="esdl:Point" lon="6.639861111287163" lat="53.53842795339313"/>
          <point xsi:type="esdl:Point" lon="6.640046996940773" lat="53.53826429678034"/>
          <point xsi:type="esdl:Point" lon="6.640130276472096" lat="53.53817867153889"/>
          <point xsi:type="esdl:Point" lon="6.64022347844734" lat="53.538096970055314"/>
          <point xsi:type="esdl:Point" lon="6.640245083292924" lat="53.53807311165048"/>
          <point xsi:type="esdl:Point" lon="6.640253407347333" lat="53.53806566457246"/>
          <point xsi:type="esdl:Point" lon="6.640260311647841" lat="53.53805763119187"/>
          <point xsi:type="esdl:Point" lon="6.640265919598523" lat="53.53804900684819"/>
          <point xsi:type="esdl:Point" lon="6.640441422587064" lat="53.53789205084057"/>
          <point xsi:type="esdl:Point" lon="6.6404479394678955" lat="53.537883849378375"/>
          <point xsi:type="esdl:Point" lon="6.640467155265424" lat="53.537869865357756"/>
          <point xsi:type="esdl:Point" lon="6.640473027027162" lat="53.537861412840726"/>
          <point xsi:type="esdl:Point" lon="6.640541140120256" lat="53.53780214676753"/>
          <point xsi:type="esdl:Point" lon="6.640546624579055" lat="53.53779352707293"/>
          <point xsi:type="esdl:Point" lon="6.640628958629869" lat="53.53771287604605"/>
          <point xsi:type="esdl:Point" lon="6.64109221178892" lat="53.53728691427594"/>
          <point xsi:type="esdl:Point" lon="6.642298382880277" lat="53.536173778048145"/>
          <point xsi:type="esdl:Point" lon="6.642329175579207" lat="53.536148199987124"/>
          <point xsi:type="esdl:Point" lon="6.6427484471456" lat="53.535764217194355"/>
          <point xsi:type="esdl:Point" lon="6.642936511054167" lat="53.53557980766862"/>
          <point xsi:type="esdl:Point" lon="6.643065532457262" lat="53.53545294975902"/>
          <point xsi:type="esdl:Point" lon="6.643100228790043" lat="53.535423565780526"/>
          <point xsi:type="esdl:Point" lon="6.643180521363613" lat="53.535358351189345"/>
          <point xsi:type="esdl:Point" lon="6.643386965765873" lat="53.535170592055735"/>
          <point xsi:type="esdl:Point" lon="6.643396956854801" lat="53.53516372346078"/>
          <point xsi:type="esdl:Point" lon="6.643412951446941" lat="53.535148488107986"/>
          <point xsi:type="esdl:Point" lon="6.643452709172866" lat="53.5351157126815"/>
          <point xsi:type="esdl:Point" lon="6.643473632913254" lat="53.535097000075446"/>
          <point xsi:type="esdl:Point" lon="6.64358680378926" lat="53.53500155805271"/>
          <point xsi:type="esdl:Point" lon="6.647526153503901" lat="53.53142490613738"/>
          <point xsi:type="esdl:Point" lon="6.64802749693065" lat="53.53073437218061"/>
          <point xsi:type="esdl:Point" lon="6.64845491504221" lat="53.53003836138297"/>
          <point xsi:type="esdl:Point" lon="6.651124259532813" lat="53.52675350183878"/>
          <point xsi:type="esdl:Point" lon="6.658188787672519" lat="53.519016679274735"/>
          <point xsi:type="esdl:Point" lon="6.6614764439263" lat="53.51567467102405"/>
          <point xsi:type="esdl:Point" lon="6.663161349961911" lat="53.51429421206236"/>
          <point xsi:type="esdl:Point" lon="6.6631984493887115" lat="53.514277157983294"/>
          <point xsi:type="esdl:Point" lon="6.663283190038211" lat="53.51422537055792"/>
          <point xsi:type="esdl:Point" lon="6.6633062979318645" lat="53.51420766643873"/>
          <point xsi:type="esdl:Point" lon="6.664587489487442" lat="53.51324808731102"/>
          <point xsi:type="esdl:Point" lon="6.66465745310822" lat="53.51319522341044"/>
          <point xsi:type="esdl:Point" lon="6.670558008924382" lat="53.50850022911052"/>
          <point xsi:type="esdl:Point" lon="6.6711233663849905" lat="53.50795716009331"/>
          <point xsi:type="esdl:Point" lon="6.671669875475799" lat="53.507584620646384"/>
          <point xsi:type="esdl:Point" lon="6.676606023077662" lat="53.50221243822523"/>
          <point xsi:type="esdl:Point" lon="6.677686593808775" lat="53.50077537210213"/>
          <point xsi:type="esdl:Point" lon="6.677694128347171" lat="53.50076758674762"/>
          <point xsi:type="esdl:Point" lon="6.677697260224004" lat="53.500763533762836"/>
          <point xsi:type="esdl:Point" lon="6.677702748166032" lat="53.50075509192976"/>
          <point xsi:type="esdl:Point" lon="6.678754988734949" lat="53.499574628494535"/>
          <point xsi:type="esdl:Point" lon="6.679391610267188" lat="53.49877717725886"/>
          <point xsi:type="esdl:Point" lon="6.679629156021123" lat="53.49840818647098"/>
          <point xsi:type="esdl:Point" lon="6.6824223003437035" lat="53.495650451106506"/>
          <point xsi:type="esdl:Point" lon="6.683286144068232" lat="53.49505647719863"/>
          <point xsi:type="esdl:Point" lon="6.685972344285274" lat="53.49348272947115"/>
          <point xsi:type="esdl:Point" lon="6.686695508452517" lat="53.493075706310144"/>
          <point xsi:type="esdl:Point" lon="6.6899852189884" lat="53.49179076037781"/>
          <point xsi:type="esdl:Point" lon="6.691008059252966" lat="53.4914656273706"/>
          <point xsi:type="esdl:Point" lon="6.691507331815284" lat="53.491327892735"/>
          <point xsi:type="esdl:Point" lon="6.69204771533589" lat="53.491129534722724"/>
          <point xsi:type="esdl:Point" lon="6.692095140843828" lat="53.491115748529516"/>
          <point xsi:type="esdl:Point" lon="6.692917994755194" lat="53.49090801941712"/>
          <point xsi:type="esdl:Point" lon="6.698442314762595" lat="53.48977614878745"/>
          <point xsi:type="esdl:Point" lon="6.700896895894527" lat="53.48946977455225"/>
          <point xsi:type="esdl:Point" lon="6.700904934272167" lat="53.48947069365993"/>
          <point xsi:type="esdl:Point" lon="6.700945735565889" lat="53.48947797214411"/>
          <point xsi:type="esdl:Point" lon="6.700953471043746" lat="53.48947827104826"/>
          <point xsi:type="esdl:Point" lon="6.700976323081522" lat="53.48947792226053"/>
          <point xsi:type="esdl:Point" lon="6.700998333023782" lat="53.48947220397531"/>
          <point xsi:type="esdl:Point" lon="6.701009596153097" lat="53.4894630422556"/>
          <point xsi:type="esdl:Point" lon="6.70110738984109" lat="53.489422242541536"/>
          <point xsi:type="esdl:Point" lon="6.701113542071422" lat="53.489418634890775"/>
          <point xsi:type="esdl:Point" lon="6.70123421081401" lat="53.48932784669969"/>
          <point xsi:type="esdl:Point" lon="6.701312984233535" lat="53.489279993349875"/>
          <point xsi:type="esdl:Point" lon="6.7013576390490925" lat="53.48925873510818"/>
          <point xsi:type="esdl:Point" lon="6.70146119174909" lat="53.48922980600069"/>
          <point xsi:type="esdl:Point" lon="6.701468283848148" lat="53.489228416828844"/>
          <point xsi:type="esdl:Point" lon="6.701491171543333" lat="53.48922707747561"/>
          <point xsi:type="esdl:Point" lon="6.7015135954777305" lat="53.48922467409822"/>
          <point xsi:type="esdl:Point" lon="6.701536647106312" lat="53.48922377936114"/>
          <point xsi:type="esdl:Point" lon="6.701673185768782" lat="53.48923087503233"/>
          <point xsi:type="esdl:Point" lon="6.7019303289328755" lat="53.48922775612805"/>
          <point xsi:type="esdl:Point" lon="6.7019384687316155" lat="53.4892284030944"/>
          <point xsi:type="esdl:Point" lon="6.701956572057951" lat="53.48923350705883"/>
          <point xsi:type="esdl:Point" lon="6.7019648508313345" lat="53.489234329596634"/>
          <point xsi:type="esdl:Point" lon="6.702051031521719" lat="53.48923435405262"/>
          <point xsi:type="esdl:Point" lon="6.702144982155202" lat="53.489217951535"/>
          <point xsi:type="esdl:Point" lon="6.702152662915298" lat="53.48921762336508"/>
          <point xsi:type="esdl:Point" lon="6.702160638771025" lat="53.48921782569239"/>
          <point xsi:type="esdl:Point" lon="6.702167879143171" lat="53.48921670170493"/>
          <point xsi:type="esdl:Point" lon="6.702184983316132" lat="53.48920322227999"/>
          <point xsi:type="esdl:Point" lon="6.702190863791272" lat="53.489199353175444"/>
          <point xsi:type="esdl:Point" lon="6.702418078717277" lat="53.48916676746464"/>
          <point xsi:type="esdl:Point" lon="6.702631082527904" lat="53.48912095279984"/>
          <point xsi:type="esdl:Point" lon="6.702807200246242" lat="53.4890799705385"/>
          <point xsi:type="esdl:Point" lon="6.702811370579446" lat="53.48907930151653"/>
          <point xsi:type="esdl:Point" lon="6.702851848175149" lat="53.489068603732946"/>
          <point xsi:type="esdl:Point" lon="6.703075494244513" lat="53.489015084685995"/>
          <point xsi:type="esdl:Point" lon="6.70486534482303" lat="53.48856351985226"/>
          <point xsi:type="esdl:Point" lon="6.714387922763302" lat="53.48577856264605"/>
          <point xsi:type="esdl:Point" lon="6.7162117896877485" lat="53.48518431472393"/>
          <point xsi:type="esdl:Point" lon="6.716634408462399" lat="53.48506468542899"/>
          <point xsi:type="esdl:Point" lon="6.716669750038777" lat="53.485056481274604"/>
          <point xsi:type="esdl:Point" lon="6.717854779619109" lat="53.48467345640472"/>
          <point xsi:type="esdl:Point" lon="6.721261943130252" lat="53.48353476765635"/>
          <point xsi:type="esdl:Point" lon="6.725924930333425" lat="53.48228933735447"/>
          <point xsi:type="esdl:Point" lon="6.737224164032785" lat="53.48005654362753"/>
          <point xsi:type="esdl:Point" lon="6.737856725241374" lat="53.47995310411353"/>
          <point xsi:type="esdl:Point" lon="6.75354499325291" lat="53.47661324506106"/>
          <point xsi:type="esdl:Point" lon="6.76421930837947" lat="53.47421351406345"/>
          <point xsi:type="esdl:Point" lon="6.765701376618944" lat="53.47394428113406"/>
          <point xsi:type="esdl:Point" lon="6.775167019475264" lat="53.47166369721091"/>
          <point xsi:type="esdl:Point" lon="6.78124314452363" lat="53.4703678379106"/>
          <point xsi:type="esdl:Point" lon="6.810168313193007" lat="53.463550982411604"/>
          <point xsi:type="esdl:Point" lon="6.810191111754101" lat="53.46354881526713"/>
          <point xsi:type="esdl:Point" lon="6.810261949832848" lat="53.46353351382374"/>
          <point xsi:type="esdl:Point" lon="6.811037088005731" lat="53.46343348956988"/>
          <point xsi:type="esdl:Point" lon="6.811386250991077" lat="53.463361996107544"/>
          <point xsi:type="esdl:Point" lon="6.811393746340003" lat="53.46336103712154"/>
          <point xsi:type="esdl:Point" lon="6.811463556967056" lat="53.463356469461154"/>
          <point xsi:type="esdl:Point" lon="6.811680330445457" lat="53.46329298084758"/>
          <point xsi:type="esdl:Point" lon="6.811686813772596" lat="53.46329043515727"/>
          <point xsi:type="esdl:Point" lon="6.811849960559414" lat="53.46320689708374"/>
          <point xsi:type="esdl:Point" lon="6.811851267297719" lat="53.46319651342834"/>
          <point xsi:type="esdl:Point" lon="6.811849144837287" lat="53.46316870359202"/>
          <point xsi:type="esdl:Point" lon="6.811851884509365" lat="53.46316322114956"/>
          <point xsi:type="esdl:Point" lon="6.811875478237475" lat="53.463132521015496"/>
          <point xsi:type="esdl:Point" lon="6.812490347776925" lat="53.4627437261569"/>
          <point xsi:type="esdl:Point" lon="6.812633517676798" lat="53.46264535736615"/>
          <point xsi:type="esdl:Point" lon="6.812680142211576" lat="53.4626220153164"/>
          <point xsi:type="esdl:Point" lon="6.812828658420742" lat="53.462533367627586"/>
          <point xsi:type="esdl:Point" lon="6.812844395288961" lat="53.4625300773436"/>
          <point xsi:type="esdl:Point" lon="6.812921509625249" lat="53.46253489686403"/>
          <point xsi:type="esdl:Point" lon="6.812950752287839" lat="53.462539448143154"/>
          <point xsi:type="esdl:Point" lon="6.812964438760298" lat="53.462543776975"/>
          <point xsi:type="esdl:Point" lon="6.812976015580871" lat="53.46254952150309"/>
          <point xsi:type="esdl:Point" lon="6.813018572712571" lat="53.46257504977082"/>
          <point xsi:type="esdl:Point" lon="6.8130590295247995" lat="53.46259516027833"/>
          <point xsi:type="esdl:Point" lon="6.813097995479291" lat="53.4626097418064"/>
          <point xsi:type="esdl:Point" lon="6.81310383672616" lat="53.46261252243046"/>
          <point xsi:type="esdl:Point" lon="6.813108455765543" lat="53.4626155229033"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="a4119e2f-90c7-4f8b-8938-a9d9d8fdea83"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="10000000000.0" name="CBL_from_HUB_East_to_HUB_EEM" length="114790.32245190012" id="CBL_from_HUB_East_to_HUB_EEM">
        <port xsi:type="esdl:InPort" name="InPort" id="3df5861c-468c-440d-a7c9-8ad715a80364" connectedTo="1b095bb2-e21c-4d49-8073-e704fea2f287" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="097776dd-5da1-4a91-ac65-eaaf387a56a9" name="OutPort" id="1f495e25-c980-4199-be1c-0548e3335a6e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.628928" lat="53.866123"/>
          <point xsi:type="esdl:Point" lon="5.664249" lat="53.840535"/>
          <point xsi:type="esdl:Point" lon="5.664249" lat="53.827736"/>
          <point xsi:type="esdl:Point" lon="5.71723" lat="53.789313"/>
          <point xsi:type="esdl:Point" lon="5.71723" lat="53.776498"/>
          <point xsi:type="esdl:Point" lon="5.787872" lat="53.725197"/>
          <point xsi:type="esdl:Point" lon="5.787872" lat="53.712362"/>
          <point xsi:type="esdl:Point" lon="5.840854" lat="53.673833"/>
          <point xsi:type="esdl:Point" lon="5.840854" lat="53.660983"/>
          <point xsi:type="esdl:Point" lon="5.876175" lat="53.63527"/>
          <point xsi:type="esdl:Point" lon="5.876175" lat="53.622407"/>
          <point xsi:type="esdl:Point" lon="5.929156" lat="53.583797"/>
          <point xsi:type="esdl:Point" lon="5.929156" lat="53.570919"/>
          <point xsi:type="esdl:Point" lon="5.946817" lat="53.558037"/>
          <point xsi:type="esdl:Point" lon="5.946817" lat="53.545151"/>
          <point xsi:type="esdl:Point" lon="5.946817" lat="53.532261"/>
          <point xsi:type="esdl:Point" lon="5.946817" lat="53.519367"/>
          <point xsi:type="esdl:Point" lon="5.946817" lat="53.506469"/>
          <point xsi:type="esdl:Point" lon="5.946817" lat="53.493568"/>
          <point xsi:type="esdl:Point" lon="5.964477" lat="53.480662"/>
          <point xsi:type="esdl:Point" lon="5.964477" lat="53.467753"/>
          <point xsi:type="esdl:Point" lon="5.982138" lat="53.454839"/>
          <point xsi:type="esdl:Point" lon="6.635577" lat="53.454839"/>
          <point xsi:type="esdl:Point" lon="6.653237" lat="53.467753"/>
          <point xsi:type="esdl:Point" lon="6.812182" lat="53.467753"/>
          <point xsi:type="esdl:Point" lon="6.829843" lat="53.454839"/>
          <point xsi:type="esdl:Point" lon="6.847503" lat="53.454839"/>
          <point xsi:type="esdl:Point" lon="6.829843" lat="53.441922"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="abc96e2b-cd4b-410d-8b0b-53466dcc73cf"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA6_1" id="CBL_WF_WA6_1" length="111.30938229380095">
        <port xsi:type="esdl:InPort" name="InPort" id="eab956bc-c68a-4e72-ab80-ef54a9856051" connectedTo="dcc545a0-0d2c-42ba-b775-a900e9975e4b" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="0e45bc4a-075d-4369-9f56-58d5ba4b4387" name="OutPort" id="7ddad3dd-be7d-4b46-9c4a-b2e26e025ee6" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.51296592482482" lat="54.2348242457071"/>
          <point xsi:type="esdl:Point" lon="4.51296592482482" lat="54.2358242457071"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="7b484a99-22b1-4ec8-afc7-87092e4472e2"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA6_2" id="CBL_WF_WA6_2" length="111.31216763674098">
        <port xsi:type="esdl:InPort" name="InPort" id="ef6bdb5d-1068-4251-b168-64c4668f2c85" connectedTo="1e65b863-f486-41b0-8049-5e6b643636e7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="a644a0da-2945-4790-94c0-9567ba8c4c22" name="OutPort" id="d1dc2825-7726-4b2a-9b79-7d7810e8dd05" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.61296592482482" lat="54.3848242457071"/>
          <point xsi:type="esdl:Point" lon="4.61296592482482" lat="54.3858242457071"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="3b2d0f70-9b45-4448-b715-1f2b91bbf4f8"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA6_3" length="63272.32166124482" id="CBL_WF_WA6_3">
        <port xsi:type="esdl:InPort" name="InPort" id="65667b23-f57f-413b-947d-18cd49d2b3ff" connectedTo="02017b92-d205-4f83-80cb-e66214d7611e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="6da7647d-d0c0-4a34-86ee-02e0a9618618" name="OutPort" id="829025f5-d165-4fec-afc7-985a1b431360" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.707208" lat="54.524678"/>
          <point xsi:type="esdl:Point" lon="4.687555" lat="54.524678"/>
          <point xsi:type="esdl:Point" lon="4.687555" lat="54.498291"/>
          <point xsi:type="esdl:Point" lon="4.667901" lat="54.445466"/>
          <point xsi:type="esdl:Point" lon="4.648247" lat="54.419028"/>
          <point xsi:type="esdl:Point" lon="4.628594" lat="54.3661"/>
          <point xsi:type="esdl:Point" lon="4.60894" lat="54.313105"/>
          <point xsi:type="esdl:Point" lon="4.589286" lat="54.286581"/>
          <point xsi:type="esdl:Point" lon="4.60894" lat="54.260041"/>
          <point xsi:type="esdl:Point" lon="4.60894" lat="54.233483"/>
          <point xsi:type="esdl:Point" lon="4.60894" lat="54.206908"/>
          <point xsi:type="esdl:Point" lon="4.589286" lat="54.153707"/>
          <point xsi:type="esdl:Point" lon="4.569633" lat="54.127081"/>
          <point xsi:type="esdl:Point" lon="4.549979" lat="54.127081"/>
          <point xsi:type="esdl:Point" lon="4.510672" lat="54.073778"/>
          <point xsi:type="esdl:Point" lon="4.432057" lat="54.073778"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="54.0471"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="b3c881a3-20e6-4b58-96dc-b8fb44054811"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA6_4" length="81919.65140097901" id="CBL_WF_WA6_4">
        <port xsi:type="esdl:InPort" name="InPort" id="7502d0c7-c0b9-498f-a58b-ea671c13dc87" connectedTo="ccbeb16a-00cf-485b-a150-312ef2261739" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="6da7647d-d0c0-4a34-86ee-02e0a9618618" name="OutPort" id="240ec5e3-50b0-41e2-a723-9ebe5baf542c" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.805477" lat="54.682642"/>
          <point xsi:type="esdl:Point" lon="4.785823" lat="54.656357"/>
          <point xsi:type="esdl:Point" lon="4.76617" lat="54.603737"/>
          <point xsi:type="esdl:Point" lon="4.746516" lat="54.577401"/>
          <point xsi:type="esdl:Point" lon="4.726862" lat="54.524678"/>
          <point xsi:type="esdl:Point" lon="4.707208" lat="54.498291"/>
          <point xsi:type="esdl:Point" lon="4.687555" lat="54.498291"/>
          <point xsi:type="esdl:Point" lon="4.667901" lat="54.445466"/>
          <point xsi:type="esdl:Point" lon="4.648247" lat="54.419028"/>
          <point xsi:type="esdl:Point" lon="4.628594" lat="54.3661"/>
          <point xsi:type="esdl:Point" lon="4.60894" lat="54.313105"/>
          <point xsi:type="esdl:Point" lon="4.589286" lat="54.286581"/>
          <point xsi:type="esdl:Point" lon="4.60894" lat="54.260041"/>
          <point xsi:type="esdl:Point" lon="4.60894" lat="54.233483"/>
          <point xsi:type="esdl:Point" lon="4.60894" lat="54.206908"/>
          <point xsi:type="esdl:Point" lon="4.589286" lat="54.153707"/>
          <point xsi:type="esdl:Point" lon="4.569633" lat="54.127081"/>
          <point xsi:type="esdl:Point" lon="4.549979" lat="54.127081"/>
          <point xsi:type="esdl:Point" lon="4.510672" lat="54.073778"/>
          <point xsi:type="esdl:Point" lon="4.432057" lat="54.073778"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="54.0471"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="ed89fcb2-7150-4288-9f49-f6a817349ee6"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA6_5" length="100938.90302519704" id="CBL_WF_WA6_5">
        <port xsi:type="esdl:InPort" name="InPort" id="2f5a175b-927b-4c42-b55b-2bc4d61ce67c" connectedTo="be9cc073-fb16-4a96-9541-5dcb1e331159" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="6da7647d-d0c0-4a34-86ee-02e0a9618618" name="OutPort" id="c9421584-4ed8-4252-b6af-e0232ad2c22b" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.903745" lat="54.839994"/>
          <point xsi:type="esdl:Point" lon="4.903745" lat="54.813811"/>
          <point xsi:type="esdl:Point" lon="4.903745" lat="54.787611"/>
          <point xsi:type="esdl:Point" lon="4.903745" lat="54.761394"/>
          <point xsi:type="esdl:Point" lon="4.903745" lat="54.735161"/>
          <point xsi:type="esdl:Point" lon="4.903745" lat="54.70891"/>
          <point xsi:type="esdl:Point" lon="4.884092" lat="54.656357"/>
          <point xsi:type="esdl:Point" lon="4.864438" lat="54.603737"/>
          <point xsi:type="esdl:Point" lon="4.844784" lat="54.577401"/>
          <point xsi:type="esdl:Point" lon="4.825131" lat="54.524678"/>
          <point xsi:type="esdl:Point" lon="4.805477" lat="54.498291"/>
          <point xsi:type="esdl:Point" lon="4.785823" lat="54.445466"/>
          <point xsi:type="esdl:Point" lon="4.785823" lat="54.419028"/>
          <point xsi:type="esdl:Point" lon="4.785823" lat="54.392573"/>
          <point xsi:type="esdl:Point" lon="4.76617" lat="54.339611"/>
          <point xsi:type="esdl:Point" lon="4.76617" lat="54.313105"/>
          <point xsi:type="esdl:Point" lon="4.726862" lat="54.313105"/>
          <point xsi:type="esdl:Point" lon="4.687555" lat="54.260041"/>
          <point xsi:type="esdl:Point" lon="4.648247" lat="54.260041"/>
          <point xsi:type="esdl:Point" lon="4.628594" lat="54.206908"/>
          <point xsi:type="esdl:Point" lon="4.60894" lat="54.153707"/>
          <point xsi:type="esdl:Point" lon="4.589286" lat="54.153707"/>
          <point xsi:type="esdl:Point" lon="4.569633" lat="54.127081"/>
          <point xsi:type="esdl:Point" lon="4.549979" lat="54.127081"/>
          <point xsi:type="esdl:Point" lon="4.510672" lat="54.073778"/>
          <point xsi:type="esdl:Point" lon="4.432057" lat="54.073778"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="5f8018dc-4096-426a-a031-e9fd9931eb81"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA7_1" id="CBL_WF_WA7_1" length="111.30754135646252">
        <port xsi:type="esdl:InPort" name="InPort" id="d442f2e2-2c75-47b2-877f-5911fb4694f0" connectedTo="1ff8369a-6c90-4644-b113-ded220e0e743" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="2456b3e8-8111-46d7-8156-b5ef092a06c9" name="OutPort" id="5a3eb304-cc11-40ca-983f-dfe7fb1629bf" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.01296592482482" lat="54.1368242457071"/>
          <point xsi:type="esdl:Point" lon="4.01296592482482" lat="54.1358242457071"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="e0ee0f5b-7a2c-41ca-8297-07015d34e884"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA7_2" id="CBL_WF_WA7_2" length="111.30940087924388">
        <port xsi:type="esdl:InPort" name="InPort" id="9c2c85d4-6714-4bb0-b440-ce157dec5e21" connectedTo="f7e8fb62-4d12-46a2-9b11-d63c36c201ba" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="f4887be0-43a6-48f2-a2bc-f939db9f513b" name="OutPort" id="fcd1f843-1e47-401e-a203-32cacd518b9a" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.01296592482482" lat="54.2368242457071"/>
          <point xsi:type="esdl:Point" lon="4.01296592482482" lat="54.2358242457071"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="d484f745-ba98-4e5e-9ba0-fafabc0f2c5a"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA7_3" length="65495.31213728072" id="CBL_WF_WA7_3">
        <port xsi:type="esdl:InPort" name="InPort" id="051c90dd-181f-4621-b962-7242d6fde9a8" connectedTo="4503eeb3-e820-45c7-8d75-648af982b1e1" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="6da7647d-d0c0-4a34-86ee-02e0a9618618" name="OutPort" id="42107817-35f5-41f0-907e-049e9ed33b71" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.01933" lat="54.339611"/>
          <point xsi:type="esdl:Point" lon="3.960369" lat="54.339611"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.313105"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.286581"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.260041"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.233483"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.206908"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.180316"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.153707"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.127081"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.100438"/>
          <point xsi:type="esdl:Point" lon="3.980022" lat="54.100438"/>
          <point xsi:type="esdl:Point" lon="3.999676" lat="54.073778"/>
          <point xsi:type="esdl:Point" lon="4.373096" lat="54.073778"/>
          <point xsi:type="esdl:Point" lon="4.39275" lat="54.0471"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="54.0471"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="bd3af954-7e6a-4752-8dcd-7af980d96727"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA7_4" length="77140.14964364436" id="CBL_WF_WA7_4">
        <port xsi:type="esdl:InPort" name="InPort" id="e227a5fe-5bfd-44e7-ae77-b3eb46323c08" connectedTo="0ec2352b-e1f4-4b00-8b9a-eb9275c399e5" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="6da7647d-d0c0-4a34-86ee-02e0a9618618" name="OutPort" id="04b25823-8ce8-49de-a522-0a81f1605f0a" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.01933" lat="54.445466"/>
          <point xsi:type="esdl:Point" lon="3.960369" lat="54.445466"/>
          <point xsi:type="esdl:Point" lon="3.960369" lat="54.419028"/>
          <point xsi:type="esdl:Point" lon="3.960369" lat="54.392573"/>
          <point xsi:type="esdl:Point" lon="3.960369" lat="54.3661"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.313105"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.286581"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.260041"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.233483"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.206908"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.180316"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.153707"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.127081"/>
          <point xsi:type="esdl:Point" lon="3.940715" lat="54.100438"/>
          <point xsi:type="esdl:Point" lon="3.980022" lat="54.100438"/>
          <point xsi:type="esdl:Point" lon="3.999676" lat="54.073778"/>
          <point xsi:type="esdl:Point" lon="4.373096" lat="54.073778"/>
          <point xsi:type="esdl:Point" lon="4.39275" lat="54.0471"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="54.0471"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="f4ad3188-b45d-4384-a1a8-600f62f54887"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA67_1" id="CBL_WF_WA67_1" length="648.8890908523258">
        <port xsi:type="esdl:InPort" name="InPort" id="63ac9c9f-8500-4a4c-ac1c-1545f5fbc5ca" connectedTo="77aa7a91-417a-4d96-9dcf-81dae0adba69" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="291428fb-d911-49af-bd9a-a57f473b8a12" name="OutPort" id="a87527bb-d2ba-4076-a92b-77f2c3b3a11e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.36296592482482" lat="54.4358242457071"/>
          <point xsi:type="esdl:Point" lon="4.35296592482482" lat="54.4358242457071"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="c2124286-2d7b-4056-8fbb-da6dfdbd6082"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA67_2" id="CBL_WF_WA67_2" length="648.9048945808602">
        <port xsi:type="esdl:InPort" name="InPort" id="e005d189-eade-4db1-b5ce-2cd7b05e257c" connectedTo="efbf6d1e-2edc-4019-83ef-3da04f755170" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="bb1e57ea-5c1c-425a-83a5-e21c753a92c9" name="OutPort" id="d92d40a4-5006-4819-9241-0e44a6aa012e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.36296592482482" lat="54.434824245707105"/>
          <point xsi:type="esdl:Point" lon="4.35296592482482" lat="54.434824245707105"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="83002425-7bfa-40e9-9852-bb806eef7357"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA67_3" id="CBL_WF_WA67_3" length="648.9206981095434">
        <port xsi:type="esdl:InPort" name="InPort" id="21f2fe6e-bc46-4b8e-ad09-20d5407bf787" connectedTo="e45f3010-e4e6-45b5-83bf-9db0d040ca57" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="71f31b2d-0035-4053-9fbf-5dd425a0241d" name="OutPort" id="1c3cf73a-9956-4de3-8523-d563a335b89e" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.36296592482482" lat="54.43382424570711"/>
          <point xsi:type="esdl:Point" lon="4.35296592482482" lat="54.43382424570711"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="b1795604-ddf5-4875-869b-72f11d7f52a0"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA67_4" id="CBL_WF_WA67_4" length="648.9365014383717">
        <port xsi:type="esdl:InPort" name="InPort" id="3f107009-d59c-4455-b7be-f36b35ff06c6" connectedTo="e300be1d-20ed-4694-b53b-76e5e8d7e845" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="96616355-a423-41b8-8be9-504ab81b718d" name="OutPort" id="adbe185f-3991-4acb-a703-ebd9ed8cefd1" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.36296592482482" lat="54.43282424570711"/>
          <point xsi:type="esdl:Point" lon="4.35296592482482" lat="54.43282424570711"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="c1ed1726-5e0d-4b17-bdd0-57187ca546bc"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="2000000000.0" name="CBL_WF_WA67_5" id="CBL_WF_WA67_5" length="648.9523045673398">
        <port xsi:type="esdl:InPort" name="InPort" id="f42e3eb8-13d6-4a2e-916a-67774710ebf8" connectedTo="b9874468-07ef-4d1e-9991-88183896e078" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="afe1b481-7cc3-45aa-94cb-36776529f348" name="OutPort" id="66d89a15-411a-433d-a607-8e44b377245f" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.36296592482482" lat="54.43182424570711"/>
          <point xsi:type="esdl:Point" lon="4.35296592482482" lat="54.43182424570711"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="347a75e9-e9f0-4fe9-8a4f-c643e383248e"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="10000000000.0" name="CBL_from_HUB_North_to_HUB_DH" length="157673.86932353032" id="CBL_from_HUB_North_to_HUB_DH">
        <port xsi:type="esdl:InPort" name="InPort" id="55efd42d-32de-4c8e-9854-baebeeaa70ec" connectedTo="0f9a8562-5571-47c5-a285-e10b6acfed76" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="76b608fd-6fab-4007-bf4a-dbe7a04f525b" name="OutPort" id="1c1cb738-0db5-407e-ba4b-fd9073b71796" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.412403" lat="54.0471"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="54.020406"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="53.993694"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="53.966965"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="53.940219"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="53.913456"/>
          <point xsi:type="esdl:Point" lon="4.373096" lat="53.859878"/>
          <point xsi:type="esdl:Point" lon="4.39275" lat="53.833063"/>
          <point xsi:type="esdl:Point" lon="4.39275" lat="53.806231"/>
          <point xsi:type="esdl:Point" lon="4.432057" lat="53.752516"/>
          <point xsi:type="esdl:Point" lon="4.451711" lat="53.752516"/>
          <point xsi:type="esdl:Point" lon="4.471364" lat="53.725632"/>
          <point xsi:type="esdl:Point" lon="4.491018" lat="53.725632"/>
          <point xsi:type="esdl:Point" lon="4.510672" lat="53.698732"/>
          <point xsi:type="esdl:Point" lon="4.510672" lat="53.671814"/>
          <point xsi:type="esdl:Point" lon="4.510672" lat="53.644879"/>
          <point xsi:type="esdl:Point" lon="4.530325" lat="53.617926"/>
          <point xsi:type="esdl:Point" lon="4.530325" lat="53.590957"/>
          <point xsi:type="esdl:Point" lon="4.549979" lat="53.56397"/>
          <point xsi:type="esdl:Point" lon="4.687555" lat="53.56397"/>
          <point xsi:type="esdl:Point" lon="4.707208" lat="53.536966"/>
          <point xsi:type="esdl:Point" lon="4.726862" lat="53.536966"/>
          <point xsi:type="esdl:Point" lon="4.726862" lat="53.509945"/>
          <point xsi:type="esdl:Point" lon="4.76617" lat="53.455851"/>
          <point xsi:type="esdl:Point" lon="4.76617" lat="53.428778"/>
          <point xsi:type="esdl:Point" lon="4.785823" lat="53.401688"/>
          <point xsi:type="esdl:Point" lon="4.785823" lat="53.37458"/>
          <point xsi:type="esdl:Point" lon="4.805477" lat="53.37458"/>
          <point xsi:type="esdl:Point" lon="4.825131" lat="53.347456"/>
          <point xsi:type="esdl:Point" lon="4.825131" lat="53.320314"/>
          <point xsi:type="esdl:Point" lon="4.805477" lat="53.265978"/>
          <point xsi:type="esdl:Point" lon="4.844784" lat="53.211573"/>
          <point xsi:type="esdl:Point" lon="4.864438" lat="53.211573"/>
          <point xsi:type="esdl:Point" lon="4.864438" lat="53.184345"/>
          <point xsi:type="esdl:Point" lon="4.903745" lat="53.129836"/>
          <point xsi:type="esdl:Point" lon="4.903745" lat="53.102556"/>
          <point xsi:type="esdl:Point" lon="4.864438" lat="53.047943"/>
          <point xsi:type="esdl:Point" lon="4.825131" lat="53.047943"/>
          <point xsi:type="esdl:Point" lon="4.825131" lat="53.020611"/>
          <point xsi:type="esdl:Point" lon="4.785823" lat="53.020611"/>
          <point xsi:type="esdl:Point" lon="4.746516" lat="52.965894"/>
          <point xsi:type="esdl:Point" lon="4.726862" lat="52.965894"/>
          <point xsi:type="esdl:Point" lon="4.726862" lat="52.93851"/>
          <point xsi:type="esdl:Point" lon="4.707208" lat="52.911109"/>
          <point xsi:type="esdl:Point" lon="4.746516" lat="52.911109"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="badd31b5-228e-4736-b232-a032fddeb9b5"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_from_HUB_DH_to_HUB_NL" id="CBL_from_HUB_DH_to_HUB_NL" length="92097.71220047632">
        <port xsi:type="esdl:InPort" name="InPort" id="f54ccb29-2b5f-4f19-b274-99f788babf22" connectedTo="b574991d-2cd3-476a-be9d-28df17f8b5db" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" name="OutPort" id="7f983f6d-97e9-4c5a-bc08-8133bf184d95" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.70947" lat="52.88167"/>
          <point xsi:type="esdl:Point" lon="5.57833421552437" lat="52.2455469088849"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="7e3f7c0f-ec58-43d6-abdc-09a1c3c24f12"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="10000000000.0" name="CBL_from_HUB_North_to_HUB_IJVER" length="203242.49714295115" id="CBL_from_HUB_North_to_HUB_IJVER">
        <port xsi:type="esdl:InPort" name="InPort" id="e1af0404-7344-41c0-8e41-51216d262338" connectedTo="0f9a8562-5571-47c5-a285-e10b6acfed76" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="ac377413-0431-4d63-8a4a-475e5faba1bb" name="OutPort" id="517efaa7-2504-48df-af37-12e5eac491d7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.412403" lat="54.0471"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="54.020406"/>
          <point xsi:type="esdl:Point" lon="4.353442" lat="53.940219"/>
          <point xsi:type="esdl:Point" lon="4.333789" lat="53.940219"/>
          <point xsi:type="esdl:Point" lon="4.255174" lat="53.833063"/>
          <point xsi:type="esdl:Point" lon="4.215866" lat="53.833063"/>
          <point xsi:type="esdl:Point" lon="4.196213" lat="53.806231"/>
          <point xsi:type="esdl:Point" lon="4.176559" lat="53.752516"/>
          <point xsi:type="esdl:Point" lon="4.137252" lat="53.698732"/>
          <point xsi:type="esdl:Point" lon="4.117598" lat="53.644879"/>
          <point xsi:type="esdl:Point" lon="4.097944" lat="53.590957"/>
          <point xsi:type="esdl:Point" lon="4.097944" lat="53.56397"/>
          <point xsi:type="esdl:Point" lon="4.097944" lat="53.536966"/>
          <point xsi:type="esdl:Point" lon="4.097944" lat="53.509945"/>
          <point xsi:type="esdl:Point" lon="4.097944" lat="53.482907"/>
          <point xsi:type="esdl:Point" lon="4.097944" lat="53.455851"/>
          <point xsi:type="esdl:Point" lon="4.078291" lat="53.401688"/>
          <point xsi:type="esdl:Point" lon="4.058637" lat="53.347456"/>
          <point xsi:type="esdl:Point" lon="4.058637" lat="53.320314"/>
          <point xsi:type="esdl:Point" lon="4.058637" lat="53.293154"/>
          <point xsi:type="esdl:Point" lon="4.038983" lat="53.238784"/>
          <point xsi:type="esdl:Point" lon="4.058637" lat="53.238784"/>
          <point xsi:type="esdl:Point" lon="4.097944" lat="53.184345"/>
          <point xsi:type="esdl:Point" lon="4.097944" lat="53.157099"/>
          <point xsi:type="esdl:Point" lon="4.117598" lat="53.129836"/>
          <point xsi:type="esdl:Point" lon="4.117598" lat="53.102556"/>
          <point xsi:type="esdl:Point" lon="4.137252" lat="53.075258"/>
          <point xsi:type="esdl:Point" lon="4.137252" lat="53.047943"/>
          <point xsi:type="esdl:Point" lon="4.196213" lat="52.965894"/>
          <point xsi:type="esdl:Point" lon="4.196213" lat="52.93851"/>
          <point xsi:type="esdl:Point" lon="4.196213" lat="52.911109"/>
          <point xsi:type="esdl:Point" lon="4.196213" lat="52.88369"/>
          <point xsi:type="esdl:Point" lon="4.215866" lat="52.88369"/>
          <point xsi:type="esdl:Point" lon="4.255174" lat="52.8288"/>
          <point xsi:type="esdl:Point" lon="4.314135" lat="52.8288"/>
          <point xsi:type="esdl:Point" lon="4.333789" lat="52.801329"/>
          <point xsi:type="esdl:Point" lon="4.373096" lat="52.801329"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="52.746335"/>
          <point xsi:type="esdl:Point" lon="4.412403" lat="52.718812"/>
          <point xsi:type="esdl:Point" lon="4.432057" lat="52.691271"/>
          <point xsi:type="esdl:Point" lon="4.451711" lat="52.691271"/>
          <point xsi:type="esdl:Point" lon="4.510672" lat="52.608545"/>
          <point xsi:type="esdl:Point" lon="4.530325" lat="52.608545"/>
          <point xsi:type="esdl:Point" lon="4.569633" lat="52.553308"/>
          <point xsi:type="esdl:Point" lon="4.569633" lat="52.525663"/>
          <point xsi:type="esdl:Point" lon="4.589286" lat="52.498001"/>
          <point xsi:type="esdl:Point" lon="4.569633" lat="52.442624"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="e20b76cd-e709-4d59-accf-b28ff63bce3e"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_from_HUB_IJVER_to_HUB_NL" id="CBL_from_HUB_IJVER_to_HUB_NL" length="72319.37127020082">
        <port xsi:type="esdl:InPort" name="InPort" id="c7c10fb8-f00f-4cac-ac64-ee105d6ffb01" connectedTo="5021fc2e-78da-4b93-8173-8c34be115726" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" name="OutPort" id="57157d59-876a-4951-9b4b-6a34f7fd0cf3" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.572916" lat="52.453695"/>
          <point xsi:type="esdl:Point" lon="5.57833421552437" lat="52.2455469088849"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="16c4d8b5-ca15-426a-9f0c-0897343a4524"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_HUB_EEM_NL" id="CBL_HUB_EEM_NL" length="157633.65058501824">
        <port xsi:type="esdl:InPort" name="InPort" id="d78a30fc-550b-4a79-87e2-494e07132a60" connectedTo="20000b88-ed2c-46ca-97e9-7bae2615212c" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" name="OutPort" id="d1a30fe8-7610-4b24-9e86-9270c238b43c" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="6.8329384440276" lat="53.4412004792261"/>
          <point xsi:type="esdl:Point" lon="5.57833421552437" lat="52.2455469088849"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="a1e2ad87-7734-4b7a-a2c8-78fc92799e14"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_HUB_BSL_NL" id="CBL_HUB_BSL_NL" length="156378.40413165404">
        <port xsi:type="esdl:InPort" name="InPort" id="9bb7127b-9fce-4da1-aa3e-b58515557676" connectedTo="e456d921-1e4e-4613-a4da-bf1043c6f645" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" name="OutPort" id="06461582-7c22-4cd2-9c1b-4eafcb05890a" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.73640092624319" lat="51.4249245845624"/>
          <point xsi:type="esdl:Point" lon="5.57833421552437" lat="52.2455469088849"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="f983ed8c-8995-469f-8e29-833452744231"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_HUB_MVL_NL" id="CBL_HUB_MVL_NL" length="111985.49215626152">
        <port xsi:type="esdl:InPort" name="InPort" id="0f20d0bc-6e25-4960-aa9c-fadafbb719a6" connectedTo="7da7c050-fe3a-4691-b581-5aa461240877" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" name="OutPort" id="0d1d3ea3-f647-4233-9f35-2e66bee5c388" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.00765977271238" lat="51.9670419650243"/>
          <point xsi:type="esdl:Point" lon="5.57833421552437" lat="52.2455469088849"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="56cd9b80-3a65-4176-90af-6014dccd8f56"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_HUB_GTB_NL" id="CBL_HUB_GTB_NL" length="79137.62221241374">
        <port xsi:type="esdl:InPort" name="InPort" id="787697ec-0701-4a8d-a252-2b895370c900" connectedTo="51005509-1e15-40ec-b8e9-0a0d15269a6b" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" name="OutPort" id="c2d4be73-48fd-4f30-815c-f741a645db09" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.83367631576912" lat="51.7029849705477"/>
          <point xsi:type="esdl:Point" lon="5.57833421552437" lat="52.2455469088849"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="d0e446fb-86f8-4ab4-9d5c-5b60e56238af"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="2000000000.0" name="PIPE_EL_WA67_1_22" id="PIPE_EL_WA67_1_22" diameter="DN400" length="13009.420827117965">
        <port xsi:type="esdl:InPort" name="InPort" id="131d016c-b25b-47c5-a547-1c02ef45040a" connectedTo="a4b0bc09-cb61-4b1e-8066-4abc055ac393" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="70c760fe-a161-439f-b9dd-d6d9d30779e8" name="OutPort" id="46583104-b837-438b-90a1-ac0c67eb3b4e" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.35296592482482" lat="54.4358242457071"/>
          <point xsi:type="esdl:Point" lon="4.4539659248248205" lat="54.536824245707095"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="2000000000.0" name="PIPE_EL_WA67_2_23" id="PIPE_EL_WA67_2_23" diameter="DN400" length="13105.776906255374">
        <port xsi:type="esdl:InPort" name="InPort" id="2191949e-5e2a-49ec-a3ea-82470511e183" connectedTo="b9789ad4-64a4-4a4c-ac9b-9a48d6264284" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="70c760fe-a161-439f-b9dd-d6d9d30779e8" name="OutPort" id="71a057e8-9922-41e9-967e-204fd5993201" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.35296592482482" lat="54.434824245707105"/>
          <point xsi:type="esdl:Point" lon="4.4539659248248205" lat="54.536824245707095"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="2000000000.0" name="PIPE_EL_WA67_3_24" id="PIPE_EL_WA67_3_24" diameter="DN400" length="13202.368240292108">
        <port xsi:type="esdl:InPort" name="InPort" id="59f37df5-5379-4705-aea0-ad89f69b8c36" connectedTo="7dad5443-1a72-4e97-9b79-9eed5b4b3923" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="70c760fe-a161-439f-b9dd-d6d9d30779e8" name="OutPort" id="34aabc6b-6c04-482a-bbbc-23ae914bd5c9" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.35296592482482" lat="54.43382424570711"/>
          <point xsi:type="esdl:Point" lon="4.4539659248248205" lat="54.536824245707095"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="2000000000.0" name="PIPE_EL_WA67_4_25" id="PIPE_EL_WA67_4_25" diameter="DN400" length="13299.18970282878">
        <port xsi:type="esdl:InPort" name="InPort" id="4cfd2d56-5d3d-4fbc-951e-061ccdd7dbbe" connectedTo="136af978-dd06-43bf-91f2-5a0d6cf7ddcc" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="70c760fe-a161-439f-b9dd-d6d9d30779e8" name="OutPort" id="570f19cd-1b9f-48c0-97d1-a975f81340ab" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.35296592482482" lat="54.43282424570711"/>
          <point xsi:type="esdl:Point" lon="4.4539659248248205" lat="54.536824245707095"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="2000000000.0" name="PIPE_EL_WA67_5_26" id="PIPE_EL_WA67_5_26" diameter="DN400" length="13396.236303634332">
        <port xsi:type="esdl:InPort" name="InPort" id="a2e0032a-cb43-4e8b-a9b2-ddc045505b9f" connectedTo="aaf3bc8b-6906-4a04-baeb-199910e9d726" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="70c760fe-a161-439f-b9dd-d6d9d30779e8" name="OutPort" id="dfcff336-b5a0-487f-897f-ae09f5735870" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.35296592482482" lat="54.43182424570711"/>
          <point xsi:type="esdl:Point" lon="4.4539659248248205" lat="54.536824245707095"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="18000000000.0" name="PIPE_HUB_EEM_NL_27" innerDiameter="10.0" id="PIPE_HUB_EEM_NL_27" length="92096.86422360467">
        <port xsi:type="esdl:InPort" name="InPort" id="97a66417-099a-4915-a5d8-253cc4803c91" connectedTo="5fd303ba-6e43-4ade-a48f-849f95e12865" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="c2893771-352a-4445-97af-48e952142f52" name="OutPort" id="848902ef-4f4e-4635-8997-c47122a883ed" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.71047" lat="52.88267"/>
          <point xsi:type="esdl:Point" lon="5.57933421552437" lat="52.246546908884895"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="2500000000.0" name="PIPE_HUB_EEM_NL_28" innerDiameter="10.0" id="PIPE_HUB_EEM_NL_28" length="157632.62806396323">
        <port xsi:type="esdl:InPort" name="InPort" id="80787752-e15e-4bf5-a9f2-fe33cc136dc6" connectedTo="e200f7ec-1b15-4b6d-beec-95384be1c48f" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="c2893771-352a-4445-97af-48e952142f52" name="OutPort" id="3774a468-078a-4374-87e9-103025995b1a" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="6.8339384440276" lat="53.442200479226095"/>
          <point xsi:type="esdl:Point" lon="5.57933421552437" lat="52.246546908884895"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="100000000000.0" name="PIPE_from_HUB_NL_to_H2_Demand_30" id="PIPE_from_HUB_NL_to_H2_Demand_30" diameter="DN400" length="232.78868041457883">
        <port xsi:type="esdl:InPort" name="InPort" id="c43f01bf-9f64-4103-990c-91e5e193baeb" connectedTo="be9c9746-2ea3-4375-90fd-469ae6e7f287" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="1b9ed795-35a4-430e-aa0c-8b4c8b4e943a" name="OutPort" id="e82b7e08-d7d1-4ba3-a692-8ec47bc0f27c" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.57933421552437" lat="52.246546908884895"/>
          <point xsi:type="esdl:Point" lon="5.58033421552437" lat="52.2485469088849"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_from_HUB_NL_to_EL_Demand" id="CBL_from_HUB_NL_to_EL_Demand" length="130.56291596954688">
        <port xsi:type="esdl:InPort" name="InPort" id="2b2e1eb7-5d98-43a1-af0e-64d0b406dfde" connectedTo="2ea57f1a-e4ed-43d7-9c75-57ca2cb530d7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="d003ad2a-4aef-4177-a572-b0d62f26768b" name="OutPort" id="6b4c1614-6f67-42bb-83bc-21519014cb1d" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.57833421552437" lat="52.2455469088849"/>
          <point xsi:type="esdl:Point" lon="5.57933421552437" lat="52.2445469088849"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="730cd9d1-5a99-4668-9e88-eeeefe777f56"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="100000000000.0" name="PIPE_from_HUB_NL_to_Hydrogen export_31" id="PIPE_from_HUB_NL_to_Hydrogen export_31" diameter="DN400" length="222.54410358630972">
        <port xsi:type="esdl:InPort" name="InPort" id="ae00a201-9484-4d6b-a163-8c07004c1e1c" connectedTo="be9c9746-2ea3-4375-90fd-469ae6e7f287" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="ad541129-c483-47ee-a933-e1153863faa0" name="OutPort" id="0d4e6a93-1832-4fdf-9f6e-791affb55a90" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.57933421552437" lat="52.246546908884895"/>
          <point xsi:type="esdl:Point" lon="5.57933421552437" lat="52.2485469088849"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_from_HUB_NL_to_Electricity export" id="CBL_from_HUB_NL_to_Electricity export" length="176.18831748752143">
        <port xsi:type="esdl:InPort" name="InPort" id="e01ac45a-56d6-4a54-ba48-e6edc88ef99e" connectedTo="2ea57f1a-e4ed-43d7-9c75-57ca2cb530d7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="c30b0d56-208e-40a3-8192-754012432fd3" name="OutPort" id="dc9f3802-31fb-4e9f-bc24-3ceeffc3d2c7" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.57833421552437" lat="52.2455469088849"/>
          <point xsi:type="esdl:Point" lon="5.58033421552437" lat="52.2445469088849"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="71e301e0-9f44-4ce4-abbf-813d6f921429"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" capacity="100000000000.0" name="PIPE_from_H2-Import_to_HUB_NL_32" innerDiameter="10.0" id="PIPE_from_H2-Import_to_HUB_NL_32" length="136.6001674844928">
        <port xsi:type="esdl:InPort" name="InPort" id="f53d7843-13cc-4730-99e5-926703d0a28c" connectedTo="050d00ac-d6f6-4a40-82bd-71219b1ab894" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="c2893771-352a-4445-97af-48e952142f52" name="OutPort" id="7a952945-9b3e-4a37-bcb4-0b960607b4d8" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.58133421552437" lat="52.2465469088849"/>
          <point xsi:type="esdl:Point" lon="5.57933421552437" lat="52.246546908884895"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" state="OPTIONAL" capacity="100000000000.0" name="CBL_from_Elecimport_to_HUB_NL" id="CBL_from_Dispatchable_NL_to_HUB_NL" length="68.30161923097194">
        <port xsi:type="esdl:InPort" name="InPort" id="6db85928-a23e-41f7-bb34-7c690346aabf" connectedTo="f9a2ddbc-7e8a-4e8b-9921-e2e19a2c0135" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="663b1149-997e-4c50-bfa5-d8539841205a" name="OutPort" id="d81dc4e4-00dd-44c6-b224-ea3320235871" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.57933421552437" lat="52.2455469088849"/>
          <point xsi:type="esdl:Point" lon="5.57833421552437" lat="52.2455469088849"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="aa29840c-f9b1-4f47-b6ef-3e00f42452ba"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_EL_DDW-West_to_Noordgastransport B_V__34" id="Pipe_from_EL_DDW-West_to_Noordgastransport B_V__34" diameter="DN400" length="34856.905520034365">
        <port xsi:type="esdl:InPort" name="InPort" id="197fee08-cdd5-4083-9344-54aac48d14a6" connectedTo="98bf4b7f-c432-42ec-8f23-b1394bda20c1" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="d4b4fd92-39e2-45f0-ae93-2d063017ec20" name="OutPort" id="c7376b98-8a91-4f67-b9f7-f8295fe24a68" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.357996"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.344953"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.331906"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.318855"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.3058"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.29274"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.279677"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.266609"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.253537"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.240461"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.22738"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.214296"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.201208"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.188115"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.175018"/>
          <point xsi:type="esdl:Point" lon="5.434423" lat="54.161917"/>
          <point xsi:type="esdl:Point" lon="5.434423" lat="54.148812"/>
          <point xsi:type="esdl:Point" lon="5.434423" lat="54.135703"/>
          <point xsi:type="esdl:Point" lon="5.434423" lat="54.122589"/>
          <point xsi:type="esdl:Point" lon="5.434423" lat="54.109472"/>
          <point xsi:type="esdl:Point" lon="5.434423" lat="54.09635"/>
          <point xsi:type="esdl:Point" lon="5.434423" lat="54.083224"/>
          <point xsi:type="esdl:Point" lon="5.434423" lat="54.070094"/>
          <point xsi:type="esdl:Point" lon="5.434423" lat="54.05696"/>
          <point xsi:type="esdl:Point" lon="5.438709" lat="54.048902"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_EL_TNW_to_Noordgastransport B_V__35" id="Pipe_from_EL_TNW_to_Noordgastransport B_V__35" diameter="DN400" length="13923.568616710847">
        <port xsi:type="esdl:InPort" name="InPort" id="ce2dea55-7b95-4072-855c-fa50c5a98a52" connectedTo="40cfc20a-1352-4441-9923-c28bc39b2ab5" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="d4b4fd92-39e2-45f0-ae93-2d063017ec20" name="OutPort" id="a0cd4417-48dd-491b-b816-769d224e53fe" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.648749" lat="54.043822"/>
          <point xsi:type="esdl:Point" lon="5.452283" lat="54.043822"/>
          <point xsi:type="esdl:Point" lon="5.438709" lat="54.048902"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_HUB_EEM_36" id="Pipe_from_None_to_HUB_EEM_36" diameter="DN400" length="11004.801224048206">
        <port xsi:type="esdl:InPort" name="InPort" id="9b29ebb4-ed69-436b-8329-b5361baa69af" connectedTo="6e821ce5-138b-4100-ae20-42e5c4bca7a3" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="d983e894-c523-40fc-9ee6-3eab7a40cefb" name="OutPort" id="78358c98-b6e7-457d-b219-efe06cf84d46" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="6.688902" lat="53.46683"/>
          <point xsi:type="esdl:Point" lon="6.702519" lat="53.474935"/>
          <point xsi:type="esdl:Point" lon="6.791822" lat="53.474935"/>
          <point xsi:type="esdl:Point" lon="6.827543" lat="53.448287"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__37" id="Pipe_from_None_to_Noordgastransport B_V__37" diameter="DN400" length="1.4988634370852418">
        <port xsi:type="esdl:InPort" name="InPort" id="1f667ad9-187c-4c8a-8b9d-1cbf5222baf3" connectedTo="3e73f2c5-5936-4950-be17-3aecf5cfcac9" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" name="OutPort" id="5585cabb-c443-46d9-bf22-995d99517849" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.949331" lat="53.555121"/>
          <point xsi:type="esdl:Point" lon="5.94931" lat="53.555126"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_14" id="Joint_14">
        <port xsi:type="esdl:InPort" name="InPort" id="24bbeb1d-cee8-49cd-beaf-9a85219355af" connectedTo="71f64b37-a1e2-4966-a2f6-e543b8e714ca" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="9b29ebb4-ed69-436b-8329-b5361baa69af aa1b50c9-b3e2-4b4e-b037-f0b4081f5cd8" name="OutPort" id="6e821ce5-138b-4100-ae20-42e5c4bca7a3" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="6.688902" lat="53.46683"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_HUB_WA67_to_None_38" id="Pipe_from_HUB_WA67_to_None_38" diameter="DN400" length="2217.176270831458">
        <port xsi:type="esdl:InPort" name="InPort" id="708bda88-0762-46ca-95ae-82a0d207c81f" connectedTo="7c9a6009-603c-465d-9e34-47b9115f3cbc" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="d9a9a8c3-6154-4dcf-83fd-f57832550d99" name="OutPort" id="4d3208f8-4cff-4b30-9f48-a2db71b62e41" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.454942" lat="54.537882"/>
          <point xsi:type="esdl:Point" lon="4.489196" lat="54.537882"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__39" id="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__39" diameter="DN400" length="39328.428276323044">
        <port xsi:type="esdl:InPort" name="InPort" id="bba8747b-dd1d-4919-93dd-1d33637adae1" connectedTo="15721123-3361-4544-b91a-b993fd36bd86" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="c5e20e4d-5de1-4557-b9b1-007903b99d8b" name="OutPort" id="629add5d-f681-4c71-b43e-bf7a309da109" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.489196" lat="54.537882"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.584543"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.607854"/>
          <point xsi:type="esdl:Point" lon="4.591957" lat="54.631151"/>
          <point xsi:type="esdl:Point" lon="4.591957" lat="54.654435"/>
          <point xsi:type="esdl:Point" lon="4.660464" lat="54.700963"/>
          <point xsi:type="esdl:Point" lon="4.660464" lat="54.724207"/>
          <point xsi:type="esdl:Point" lon="4.696465" lat="54.852871"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__40" id="Pipe_from_None_to_Noordgastransport B_V__40" diameter="DN400" length="91436.49428250964">
        <port xsi:type="esdl:InPort" name="InPort" id="3bd7a025-d135-4802-9944-aff10666ea9f" connectedTo="15721123-3361-4544-b91a-b993fd36bd86" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="d4b4fd92-39e2-45f0-ae93-2d063017ec20" name="OutPort" id="4e8d7496-29b5-4c75-9a16-e4be70427615" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.489196" lat="54.537882"/>
          <point xsi:type="esdl:Point" lon="4.52345" lat="54.537882"/>
          <point xsi:type="esdl:Point" lon="4.831733" lat="54.327244"/>
          <point xsi:type="esdl:Point" lon="4.865986" lat="54.327244"/>
          <point xsi:type="esdl:Point" lon="4.90024" lat="54.303773"/>
          <point xsi:type="esdl:Point" lon="5.071508" lat="54.303773"/>
          <point xsi:type="esdl:Point" lon="5.105762" lat="54.280289"/>
          <point xsi:type="esdl:Point" lon="5.140016" lat="54.280289"/>
          <point xsi:type="esdl:Point" lon="5.277031" lat="54.186217"/>
          <point xsi:type="esdl:Point" lon="5.277031" lat="54.162666"/>
          <point xsi:type="esdl:Point" lon="5.277031" lat="54.139101"/>
          <point xsi:type="esdl:Point" lon="5.277031" lat="54.115523"/>
          <point xsi:type="esdl:Point" lon="5.311284" lat="54.091931"/>
          <point xsi:type="esdl:Point" lon="5.345538" lat="54.091931"/>
          <point xsi:type="esdl:Point" lon="5.414045" lat="54.044707"/>
          <point xsi:type="esdl:Point" lon="5.438709" lat="54.048902"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_EL_WA6_2_to_None_41" id="Pipe_from_EL_WA6_2_to_None_41" diameter="DN400" length="24114.76024541212">
        <port xsi:type="esdl:InPort" name="InPort" id="4dc33e7c-144c-494a-b038-5e43e1af5647" connectedTo="1d3d7488-d22d-42a5-a3f7-8581480d896f" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="28e508a7-e7a5-419e-ac6f-2de2432c1e6e" name="OutPort" id="88c9bcc4-1169-47ef-ba72-ef3b5d36ab4f" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.626211" lat="54.374146"/>
          <point xsi:type="esdl:Point" lon="4.694718" lat="54.327244"/>
          <point xsi:type="esdl:Point" lon="4.694718" lat="54.303773"/>
          <point xsi:type="esdl:Point" lon="4.694718" lat="54.280289"/>
          <point xsi:type="esdl:Point" lon="4.797479" lat="54.209755"/>
          <point xsi:type="esdl:Point" lon="4.821481" lat="54.203709"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_EL_WA7_2_to_Wintershall Noordzee B_V__42" id="Pipe_from_EL_WA7_2_to_Wintershall Noordzee B_V__42" diameter="DN400" length="19292.16986031561">
        <port xsi:type="esdl:InPort" name="InPort" id="a0d2cc66-12ce-4547-b3ee-fb3b118560bb" connectedTo="d7830f7f-5633-4003-970b-8826640d8428" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="de7ecb04-9fdf-48a3-928f-86ddb7630aa3" name="OutPort" id="27a0e3aa-15af-4825-b89a-e618f6234874" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.009644" lat="54.23328"/>
          <point xsi:type="esdl:Point" lon="3.975391" lat="54.23328"/>
          <point xsi:type="esdl:Point" lon="3.941137" lat="54.209755"/>
          <point xsi:type="esdl:Point" lon="3.941137" lat="54.186217"/>
          <point xsi:type="esdl:Point" lon="3.941137" lat="54.162666"/>
          <point xsi:type="esdl:Point" lon="3.941137" lat="54.139101"/>
          <point xsi:type="esdl:Point" lon="3.975391" lat="54.115523"/>
          <point xsi:type="esdl:Point" lon="4.009644" lat="54.115523"/>
          <point xsi:type="esdl:Point" lon="4.010461" lat="54.115239"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_EL_WA6_1_to_None_43" id="Pipe_from_EL_WA6_1_to_None_43" diameter="DN400" length="32807.02965308978">
        <port xsi:type="esdl:InPort" name="InPort" id="bbf18bde-a0ea-43f1-b2e8-eb6283d6ce45" connectedTo="35d5b2eb-e471-4480-89b8-fd37c0fc434c" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="0e95b210-95b6-40fa-b67f-d920431a02e7" name="OutPort" id="fe89871a-d4e2-4f59-99ca-a9cefa2ea886" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.52345" lat="54.23328"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.209755"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.186217"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.162666"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.139101"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.115523"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.091931"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.068326"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.044707"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="54.021075"/>
          <point xsi:type="esdl:Point" lon="4.557703" lat="53.99743"/>
          <point xsi:type="esdl:Point" lon="4.52345" lat="53.973771"/>
          <point xsi:type="esdl:Point" lon="4.496977" lat="53.960646"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_EL_WA7_1_to_Wintershall Noordzee B_V__44" id="Pipe_from_EL_WA7_1_to_Wintershall Noordzee B_V__44" diameter="DN400" length="2656.5534853998856">
        <port xsi:type="esdl:InPort" name="InPort" id="e64ba077-a319-41ae-8094-c9ddd101d1f8" connectedTo="c20d1878-0918-402c-88a2-57718891a311" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="de7ecb04-9fdf-48a3-928f-86ddb7630aa3" name="OutPort" id="5447f116-9180-4b1e-b122-59bc9017dcbc" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.009644" lat="54.139101"/>
          <point xsi:type="esdl:Point" lon="4.010461" lat="54.115239"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_HUB_EEM_45" id="Pipe_from_None_to_HUB_EEM_45" diameter="DN400" length="9995.283670332692">
        <port xsi:type="esdl:InPort" name="InPort" id="aa1b50c9-b3e2-4b4e-b037-f0b4081f5cd8" connectedTo="6e821ce5-138b-4100-ae20-42e5c4bca7a3" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="d983e894-c523-40fc-9ee6-3eab7a40cefb" name="OutPort" id="d6eb76e1-4fe1-4728-944e-8554d2efc7ce" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="6.688902" lat="53.46683"/>
          <point xsi:type="esdl:Point" lon="6.715685" lat="53.473825"/>
          <point xsi:type="esdl:Point" lon="6.784193" lat="53.473825"/>
          <point xsi:type="esdl:Point" lon="6.818446" lat="53.449869"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_HUB_DH_46" id="Pipe_from_None_to_HUB_DH_46" diameter="DN400" length="5346.8328843089475">
        <port xsi:type="esdl:InPort" name="InPort" id="b0530675-75a3-4ff9-bd75-9f7bc81c7299" connectedTo="dd4171d8-8603-40ac-b5d7-1c5af9b6d16b" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="3c8f54e4-2ead-43ac-a3ae-dba1a7ded678" name="OutPort" id="59cf3bc0-9096-43ba-8206-0db3a4dfe3e4" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.709403" lat="52.881677"/>
          <point xsi:type="esdl:Point" lon="4.694718" lat="52.895158"/>
          <point xsi:type="esdl:Point" lon="4.728972" lat="52.919425"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__47" id="Pipe_from_None_to_Noordgastransport B_V__47" diameter="DN400" length="2237.3431423619786">
        <port xsi:type="esdl:InPort" name="InPort" id="7e8234fa-8b72-4bf5-aef7-d860e4feb3e4" connectedTo="41829d65-271e-4f8f-90ae-3281dc305c20" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="455a7611-d5a3-492e-81d0-338f680f8b78" name="OutPort" id="4400f9db-e694-4529-a7aa-50bd26e5000f" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="3.621734" lat="53.94273"/>
          <point xsi:type="esdl:Point" lon="3.632854" lat="53.950099"/>
          <point xsi:type="esdl:Point" lon="3.619254" lat="53.943743"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__48" id="Pipe_from_None_to_Noordgastransport B_V__48" diameter="DN400" length="25.313206694858113">
        <port xsi:type="esdl:InPort" name="InPort" id="780755d7-4e58-4389-a447-ac7375882494" connectedTo="6b368901-7cfb-4a28-ae30-272a209477b3" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="51d6770d-910a-4c74-9edb-eb3e8f7de13a" name="OutPort" id="f9c822e5-d0a1-47d6-92eb-8b195ea77be4" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.201876" lat="53.401823"/>
          <point xsi:type="esdl:Point" lon="4.202102" lat="53.402006"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__49" id="Pipe_from_None_to_Noordgastransport B_V__49" diameter="DN400" length="1.4988634370852418">
        <port xsi:type="esdl:InPort" name="InPort" id="d9de5591-8807-4933-b7f8-a1c17618a881" connectedTo="3e73f2c5-5936-4950-be17-3aecf5cfcac9" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" name="OutPort" id="d0dd14e7-aeed-41ca-a3ea-6b457d77a07a" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.949331" lat="53.555121"/>
          <point xsi:type="esdl:Point" lon="5.94931" lat="53.555126"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__50" id="Pipe_from_None_to_Noordgastransport B_V__50" diameter="DN400">
        <port xsi:type="esdl:InPort" name="InPort" id="cd05622c-a30c-4100-8e78-6f9bacf67340" connectedTo="1f7025c6-e9fb-4eea-a716-98a284654c6d" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="bbd74c33-142e-4cf5-aab5-eebbfd8108be" name="OutPort" id="654ed160-0251-4135-bac6-43e24af3a238" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.78827" lat="53.405017"/>
          <point xsi:type="esdl:Point" lon="4.78827" lat="53.405017"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_Noordgastransport B_V__51" id="Pipe_from_None_to_Noordgastransport B_V__51" diameter="DN400">
        <port xsi:type="esdl:InPort" name="InPort" id="4ba2a6aa-70e6-45ed-949a-40edec05acdc" connectedTo="3e73f2c5-5936-4950-be17-3aecf5cfcac9" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="6c5e77b9-3a3e-4d70-81b8-4135b45f06d2" name="OutPort" id="1fa00c80-e559-4280-a6e9-f203a664d43c" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.94931" lat="53.555126"/>
          <point xsi:type="esdl:Point" lon="5.94931" lat="53.555126"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__52" id="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__52" diameter="DN400">
        <port xsi:type="esdl:InPort" name="InPort" id="814c95a3-f68a-4a3e-903a-16cd15abaf88" connectedTo="9f00e816-b71b-45dd-8a63-98a89f22722c" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="28e508a7-e7a5-419e-ac6f-2de2432c1e6e" name="OutPort" id="7e7fe984-943e-43cf-8e05-0ab6676f66c4" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.821481" lat="54.203709"/>
          <point xsi:type="esdl:Point" lon="4.821481" lat="54.203709"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__53" id="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__53" diameter="DN400" length="0.12921662522904814">
        <port xsi:type="esdl:InPort" name="InPort" id="503dbe3c-87b2-4aaf-a620-c442e80cff7d" connectedTo="558ea8ce-86e5-4473-bfc4-22f3f6bf822b" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="0e95b210-95b6-40fa-b67f-d920431a02e7" name="OutPort" id="b0e8a50d-78c8-4154-b2cb-8017d34ed860" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.496977" lat="53.960646"/>
          <point xsi:type="esdl:Point" lon="4.496978" lat="53.960645"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__54" id="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__54" diameter="DN400">
        <port xsi:type="esdl:InPort" name="InPort" id="7071e28f-4a7b-46e9-8fbd-1e59502da5f9" connectedTo="aaee02c4-d5f8-4f98-920f-48451f1ddf98" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="d58eff17-c715-4cd9-9267-0254b2a93593" name="OutPort" id="9cd8b8c4-e253-4c87-b590-b69252497a2f" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.347239" lat="53.827442"/>
          <point xsi:type="esdl:Point" lon="4.347239" lat="53.827442"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" name="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__55" id="Pipe_from_None_to_GDF SUEZ E&amp;P Nederland B_V__55" diameter="DN400">
        <port xsi:type="esdl:InPort" name="InPort" id="a60af722-5bd2-4c07-8089-4bd54f7f96c1" connectedTo="1f7025c6-e9fb-4eea-a716-98a284654c6d" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="bbd74c33-142e-4cf5-aab5-eebbfd8108be" name="OutPort" id="970d8056-3e04-4bf8-a670-d8cbd60bbab1" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.788172" lat="53.405148"/>
          <point xsi:type="esdl:Point" lon="4.788172" lat="53.405148"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_15" id="Joint_15">
        <port xsi:type="esdl:InPort" name="InPort" id="d9a9a8c3-6154-4dcf-83fd-f57832550d99" connectedTo="4d3208f8-4cff-4b30-9f48-a2db71b62e41" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="bba8747b-dd1d-4919-93dd-1d33637adae1 3bd7a025-d135-4802-9944-aff10666ea9f" name="OutPort" id="15721123-3361-4544-b91a-b993fd36bd86" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.489196" lat="54.537882"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_16" id="Joint_16">
        <port xsi:type="esdl:InPort" name="InPort" id="de7ecb04-9fdf-48a3-928f-86ddb7630aa3" connectedTo="27a0e3aa-15af-4825-b89a-e618f6234874 5447f116-9180-4b1e-b122-59bc9017dcbc" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="1aaad9fd-a888-4877-b634-3311c239fcef" name="OutPort" id="a3c5edd6-6081-4f7f-a852-29f1f6eb4111" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.010461" lat="54.115239"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_17" id="Joint_17">
        <port xsi:type="esdl:InPort" name="InPort" id="4bbab8d2-9fc5-4f4a-be67-fb829963f2ec" connectedTo="66482701-4935-405e-a995-d30d40a614fd" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <port xsi:type="esdl:OutPort" connectedTo="b0530675-75a3-4ff9-bd75-9f7bc81c7299" name="OutPort" id="dd4171d8-8603-40ac-b5d7-1c5af9b6d16b" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.709403" lat="52.881677"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="Fake_Gas_demand_1" id="Fake_Gas_demand_1" power="1000000000.0">
        <port xsi:type="esdl:InPort" id="63608208-bc4d-45ae-b98e-5487e4a9ec5a" name="InPort" connectedTo="57d28c16-00a5-4461-a883-ed4c898a7e3d" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="2.944181790308763" lat="53.822459437777496"/>
        <costInformation xsi:type="esdl:CostInformation" id="44599d99-fc1e-429d-a7a0-9e402a7f7f06">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="dc2bd335-ab0a-4b5d-aabd-bc6faf3da6cf" name="Fake_Gas_demand_1_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="Fake_Gas_demand_2" id="Fake_Gas_demand_2" power="1000000000.0">
        <port xsi:type="esdl:InPort" id="f16da699-66ce-405b-9beb-485c564a4527" name="InPort" connectedTo="971a5f2c-d76a-4d03-bb6c-63bcf03ce116" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="2.935542648293768" lat="54.32485214075063"/>
        <costInformation xsi:type="esdl:CostInformation" id="6a6bd17d-d32e-4adf-92a0-f3219f7f996e">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="104a12ba-4ca2-448a-8a8b-d9e03fac94bf" name="Fake_Gas_demand_2_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="Fake_Gas_demand_3" id="Fake_Gas_demand_3" power="1000000000.0">
        <port xsi:type="esdl:InPort" id="e39ec930-7b25-4c5d-a213-23550f2b8a51" name="InPort" connectedTo="a9d5c219-ce78-435d-9859-422104f6ac5f" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.716143743685924" lat="52.88101557489764"/>
        <costInformation xsi:type="esdl:CostInformation" id="fba11984-11fa-4dee-bdd0-0bf9dcbe9235">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="d69d509b-17db-4b98-858f-f7eca8f34df4" name="Fake_Gas_demand_3_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="Fake_Gas_demand_4" id="Fake_Gas_demand_4" power="1000000000.0">
        <port xsi:type="esdl:InPort" id="ea3663a5-51c0-46d8-8304-5cf2af3cd2ee" name="InPort" connectedTo="098cf51b-110e-4249-905b-974371312acb" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.75507353963736" lat="55.70613029568726"/>
        <costInformation xsi:type="esdl:CostInformation" id="4d2c1a9b-f15b-4983-b33f-666c376e8c29">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="31a9bb62-23ed-4e16-9b4b-f83271682ff4" name="Fake_Gas_demand_4_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="Fake_Gas_demand_5" id="Fake_Gas_demand_5" power="1000000000.0">
        <port xsi:type="esdl:InPort" id="bc037a52-7b9f-4bc8-b30d-0088e567f302" name="InPort" connectedTo="8c53cd42-cbad-4760-9781-c7c7aa172116" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="3.9928878168373534" lat="55.79063767887756"/>
        <costInformation xsi:type="esdl:CostInformation" id="83705344-181a-4c6c-b106-a49b261a7c7b">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="0e4953b5-6b92-4bf8-a73a-745d462d5af8" name="Fake_Gas_demand_5_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="Fake_Gas_demand_6" id="Fake_Gas_demand_6" power="1000000000.0">
        <port xsi:type="esdl:InPort" id="c041e5d4-390f-49b8-a950-d9c2b79068c3" name="InPort" connectedTo="ef38bb26-ef73-4ddd-b906-e815b4c9ff43" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="6.5863" lat="54.38696"/>
        <costInformation xsi:type="esdl:CostInformation" id="77ede87e-3530-4771-acb7-e06ed25386df">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="5bb2680a-a569-4ea2-a49e-d8fad8add25e" name="Fake_Gas_demand_6_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="Fake_Gas_demand_7" id="Fake_Gas_demand_7" power="1000000000.0">
        <port xsi:type="esdl:InPort" id="3780c630-e721-4cfa-bb6b-e9161e716c92" name="InPort" connectedTo="fd40c2fc-9366-4062-9133-01f9e410e6a5" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.05396" lat="53.8428"/>
        <costInformation xsi:type="esdl:CostInformation" id="71dba3f3-270e-4673-97cb-c72383573ec2">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="586ac978-30f2-4c6a-a790-473975864aaf" name="Fake_Gas_demand_7_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="Fake_Gas_demand_8" id="Fake_Gas_demand_8" power="1000000000.0">
        <port xsi:type="esdl:InPort" id="e91bfd1d-3d21-4287-92c1-5a37ceaa2bbc" name="InPort" connectedTo="d788f0cc-ffbc-4802-970e-c4586eec1d0c" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.14185" lat="53.93275"/>
        <costInformation xsi:type="esdl:CostInformation" id="4f258285-c1bb-4510-bd03-fb8dd77f0247">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="bca8827e-ef01-40e4-870d-74a24caf4e6f" name="Fake_Gas_demand_8_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="Fake_Gas_demand_9" id="Fake_Gas_demand_9" power="1000000000.0">
        <port xsi:type="esdl:InPort" id="38b103ad-bd20-446e-adab-38104b005f5d" name="InPort" connectedTo="fa4565d1-4841-4cf6-9753-7bbefc0077e8" carrier="43bf50c5-0ad7-4b88-93e9-925a5669ae52"/>
        <geometry xsi:type="esdl:Point" lon="4.34525" lat="53.94962"/>
        <costInformation xsi:type="esdl:CostInformation" id="1608f4b7-46ea-44d2-a349-3f370c4ca1f4">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="aa96160f-6e71-4cfc-be91-486be0c8d2b0" name="Fake_Gas_demand_9_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Import" power="100000000000.0" name="Elecimport" id="Elecimport">
        <port xsi:type="esdl:OutPort" connectedTo="6db85928-a23e-41f7-bb34-7c690346aabf" id="f9a2ddbc-7e8a-4e8b-9921-e2e19a2c0135" name="OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="5.57933421552437" lat="52.2455469088849"/>
        <costInformation xsi:type="esdl:CostInformation" id="06dfea93-5e42-4711-9c4c-2c6b180d2da4">
          <marginalCosts xsi:type="esdl:SingleValue" value="1.0" id="013dc85f-6d07-4eb1-bacb-c035bbe072c4" name="Elecimport_marginalcost"/>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" capacity="100000000000.0" name="Bus_WF_TNW" id="Bus_WF_TNW">
        <port xsi:type="esdl:InPort" id="d3d57716-1870-4caf-ad3b-bb7a29eae0c6" name="InPort" connectedTo="bb09400d-40b7-4bed-b0b3-3eda34f48102" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="ee1c4981-f67c-43a8-bd9d-1344b3931e79 6209a59d-e7c0-4b94-9f3a-380f30641c51" id="01a79f00-c106-4826-ac44-acc272b4b4f3" name="OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Point" lon="5.64336597749276" lat="54.0384496646664"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" capacity="500000000000.0" name="CBL_WF_Bus" id="CBL_WF_Bus" length="59.02159291818677">
        <port xsi:type="esdl:InPort" id="7ae4a749-2760-48c2-8169-181bc0e7eea7" name="InPort" connectedTo="a6fbc9df-cd1a-4f1e-b432-8a72139882c8" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <port xsi:type="esdl:OutPort" connectedTo="d3d57716-1870-4caf-ad3b-bb7a29eae0c6" id="bb09400d-40b7-4bed-b0b3-3eda34f48102" name="OutPort" carrier="9cceb888-16de-4c9b-b94b-e738ee6373aa"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="5.64306597749276" lat="54.0379496646664"/>
          <point xsi:type="esdl:Point" lon="5.64336597749276" lat="54.0384496646664"/>
        </geometry>
        <material xsi:type="esdl:Material" electricalConductivity="23809.52380952381" id="30f8282c-d764-4080-8c46-ff79e8ffc52e"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
