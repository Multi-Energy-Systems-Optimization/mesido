<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="electricity_asset_sizing" description="Optional electricity producer and battery sizing regression fixture" id="c0d854f6-c5e1-4976-8f87-ea6ad45fc8c7" esdlVersion="v2107">
  <instance xsi:type="esdl:Instance" id="aa6db1c7-3ace-4f2e-a1c8-7ce7c128a41f" name="Asset sizing instance">
    <area xsi:type="esdl:Area" id="75ff514a-46a1-41f6-823a-e8042c66b0b2" name="Asset sizing area">
      <asset xsi:type="esdl:ElectricityProducer" id="asset_sizing_selected_producer" name="SelectedProducer" technicalLifetime="20.0" state="OPTIONAL" power="1000.0">
        <costInformation xsi:type="esdl:CostInformation" id="792a65cf-a25e-452f-8a8d-d3497e3069f9">
          <investmentCosts xsi:type="esdl:SingleValue" id="40ae61aa-5fa1-4b2d-ab97-3f7902d76a9b" value="0.001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="29d7b1c6-f4cd-4455-9a85-ed7a118d625f" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="74df18bd-dbbe-49ef-a8ff-534eed35f995">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ad1bd730-048b-4e36-9c4a-0e897189b171" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="60822f02-5260-4a2c-91a1-ba67ab20c66c" value="0.0001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="83f49b56-c62a-40f7-9f5d-d7d19b592390" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="d41d9ce8-d234-4604-a171-4eeb992234bf" value="0.0002">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="c20e5438-0cd7-40cb-bc99-0d2d77a3cf97" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="33a6776e-4e94-4b5e-a078-a34d2d9c6a64" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="9171087a-01c3-4a06-8d39-ee587c33fd8d"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="asset_sizing_rejected_producer" name="RejectedProducer" technicalLifetime="20.0" state="OPTIONAL" power="1000.0">
        <costInformation xsi:type="esdl:CostInformation" id="9e6304c6-274f-4538-ba57-6939f05236a2">
          <investmentCosts xsi:type="esdl:SingleValue" id="7c630607-a776-4ca5-b9ba-630aa61c6631" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5eacd11d-b60f-4ed8-9ca2-4f0792d24ef0" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="2ce9d489-8a56-4e45-83ad-f1fa8422c10a" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a413c175-15ad-4a79-8ab0-1340159d0591" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="6830ec20-a7d3-4a64-903d-20a5ecef97a5" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="45a0d2ca-adcf-4477-b360-7a94d194aa27" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="99822139-b2ec-4834-ad08-ef4877b95576">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="13e1df73-f8ec-4c73-a2a4-a963f2275bf4" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="60f8d922-8422-47bb-af44-42fe08f12d45" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="9171087a-01c3-4a06-8d39-ee587c33fd8d"/>
      </asset>
      <asset xsi:type="esdl:Battery" id="asset_sizing_selected_battery" name="SelectedBattery" technicalLifetime="20.0" state="OPTIONAL" capacity="10000000.0" maxChargeRate="400.0" maxDischargeRate="400.0" chargeEfficiency="0.9" dischargeEfficiency="0.9">
        <costInformation xsi:type="esdl:CostInformation" id="22d3d62c-7fd9-46f0-b233-c985ee993525">
          <investmentCosts xsi:type="esdl:SingleValue" id="606d046a-c671-4bd3-8dc5-c11d2df7b159" value="0.001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="1014ccfc-8875-4d0c-b841-3ee4088f255c" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="e721eed2-593f-4b77-b1bc-7e813813f2d6" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3f6bd52-e91a-4df5-b692-245106b92767" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="3f6a08c0-f9d1-4463-8e3d-26729cb232ed" value="0.0001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="165dc47c-0983-4f50-aa72-f989ab32dce4" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="30ee3268-1470-4c6e-b779-8736e4a6ff6d">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="28e0148c-ba57-461f-9781-c73c5f9b20c4" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="fa89b8a2-30ae-46c9-b279-1eacce417f0f" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="f6e7bb15-ec01-42cb-802e-fdb534d4ece4"/>
      </asset>
      <asset xsi:type="esdl:Battery" id="asset_sizing_rejected_battery" name="RejectedBattery" technicalLifetime="20.0" state="OPTIONAL" capacity="10000000.0" maxChargeRate="400.0" maxDischargeRate="400.0" chargeEfficiency="0.9" dischargeEfficiency="0.9">
        <costInformation xsi:type="esdl:CostInformation" id="152ca784-ef68-4c8e-a2fd-4acf854af1ff">
          <investmentCosts xsi:type="esdl:SingleValue" id="97481352-0932-4b3e-b275-a275089a1a9d" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="0ddaef87-5859-4157-8058-599acab4c365" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="c83ea37c-ed96-4cbc-b60a-1183b8c8e2dd" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="3c49610b-4b3b-4d90-99f2-a1db194d0bfa" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="79b2f49d-8b32-4d49-803e-d980f9a2a6d9" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="6c305659-205a-4766-9c24-d4597250708b" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="d27ae69c-0b56-4b7d-852b-5d0e30892338">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="4484538b-0578-46d9-b856-b32cd5d1df12" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="c271337d-ed86-42f1-b4d6-8baaf3b518b8" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="f6e7bb15-ec01-42cb-802e-fdb534d4ece4"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" id="asset_sizing_demand" name="AssetSizingDemand" power="1000.0">
        <port xsi:type="esdl:InPort" id="80a24739-cf89-4084-b6ba-02737910dbaa" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="f6e7bb15-ec01-42cb-802e-fdb534d4ece4"/>
      </asset>
      <asset xsi:type="esdl:Import" id="asset_sizing_import" name="ElectricityImport" technicalLifetime="20.0" power="1500.0">
        <costInformation xsi:type="esdl:CostInformation" id="e6d255da-8cc7-4d2f-98e6-f5a4c8ee36f0">
          <investmentCosts xsi:type="esdl:SingleValue" id="bc410d09-640e-4dcc-a854-33a50ef8d807">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="3e450428-85c2-4390-adc1-faf6fd89c0b3" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="6b99dbb2-0a08-42e5-a7bf-a493f64ad41d">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="01c82f33-d179-4647-bee2-d3d47afc9546" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="6e6ceecd-81e1-45f3-a4af-26a43d26325a">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b70273d1-6085-480e-912b-ef8df2d55e76" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="808382de-5445-4fff-a92a-55358083d4d7" value="10.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d6ccefee-3086-410a-a729-99a137ee9f1f" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR" perMultiplier="MEGA"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="99181077-8590-4380-bb69-ff8f5c41382a" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="9171087a-01c3-4a06-8d39-ee587c33fd8d"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="asset_sizing_bus" name="AssetSizingBus">
        <port xsi:type="esdl:InPort" id="9171087a-01c3-4a06-8d39-ee587c33fd8d" name="In" connectedTo="33a6776e-4e94-4b5e-a078-a34d2d9c6a64 60f8d922-8422-47bb-af44-42fe08f12d45 99181077-8590-4380-bb69-ff8f5c41382a" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="f6e7bb15-ec01-42cb-802e-fdb534d4ece4" name="Out" connectedTo="fa89b8a2-30ae-46c9-b279-1eacce417f0f c271337d-ed86-42f1-b4d6-8baaf3b518b8 80a24739-cf89-4084-b6ba-02737910dbaa" carrier="electricity_asset_sizing_carrier"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="99f7c270-b698-4e5b-969c-6f94b33caf35">
    <carriers xsi:type="esdl:Carriers" id="cf753857-a818-4bc3-9e92-ddfc3e7b6dd2">
      <carrier xsi:type="esdl:ElectricityCommodity" id="electricity_asset_sizing_carrier" name="Electricity" voltage="230.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
