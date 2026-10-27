<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="electricity_asset_sizing" description="Optional electricity producer and battery sizing regression fixture" id="ec1f58d5-a7e3-407c-9f8b-4e1502db367a" esdlVersion="v2107">
  <instance xsi:type="esdl:Instance" id="3f7d9bab-4650-4e19-a799-cfa83706c5a0" name="Asset sizing instance">
    <area xsi:type="esdl:Area" id="92fc3917-ae2e-4da2-97f5-655efe568371" name="Asset sizing area">
      <asset xsi:type="esdl:ElectricityProducer" id="asset_sizing_selected_producer" name="SelectedProducer" technicalLifetime="20.0" state="OPTIONAL" power="1000.0">
        <costInformation xsi:type="esdl:CostInformation" id="617e550a-d1d3-4261-8422-b43ccfef4d3f">
          <investmentCosts xsi:type="esdl:SingleValue" id="95200d57-790d-4c4d-bdbf-7c700c815c85" value="0.001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="7750c45f-e62d-4f05-8955-68c14d70f2a9" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="b41976ec-3f8b-4bcf-859a-3b01614477ee">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9bb0301d-2467-4908-ac9f-50361fa853c6" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="18bd063d-0278-46ae-b5d5-43aa8f9fed84" value="0.0001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fefa4d6e-0f8c-435a-957d-6da761512e63" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="ab217f12-639e-49be-aa8d-31a99016150d" value="0.0002">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="12551608-9bda-47ef-af4c-ad7a710f4ced" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="33a6776e-4e94-4b5e-a078-a34d2d9c6a64" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="ae4bf4e6-164e-443f-94a8-8bf85a483391"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="asset_sizing_rejected_producer" name="RejectedProducer" technicalLifetime="20.0" state="OPTIONAL" power="1000.0">
        <costInformation xsi:type="esdl:CostInformation" id="f7da205f-9269-4380-823d-a906be41202a">
          <investmentCosts xsi:type="esdl:SingleValue" id="907b09df-fdce-4807-b898-14548beff907" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5f8a275f-a489-4640-80c3-dc02663f5fd5" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="d19a5d88-ac23-4144-93f0-bd847c2d5882" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e31501ce-294c-457e-bee0-54155e8b1ddd" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="6c4f5e8b-e128-4026-aa5e-045bbb1752df" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="8265279d-c380-41d5-91bb-ff187eb6db17" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="e963a5d4-a20c-445b-888f-5d88d0a51588">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="f30ea1da-9dd4-4e03-94fb-0189100dee9a" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="60f8d922-8422-47bb-af44-42fe08f12d45" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="757826bb-27f1-4362-8ba4-c195f4a6bcc8"/>
      </asset>
      <asset xsi:type="esdl:Battery" id="asset_sizing_selected_battery" name="SelectedBattery" technicalLifetime="20.0" state="OPTIONAL" capacity="10000000.0" maxChargeRate="400.0" maxDischargeRate="400.0" chargeEfficiency="0.9" dischargeEfficiency="0.9">
        <costInformation xsi:type="esdl:CostInformation" id="04f01304-81c9-4b01-a6c9-fd0d9b3b30a0">
          <investmentCosts xsi:type="esdl:SingleValue" id="1abd5d23-3318-499d-a91b-bdeb0f8b73d1" value="0.001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="6892c057-fe66-457c-8dc3-12a0404069f4" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="a94b5f79-26a9-4fbe-82c5-ec279a1e038e" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="afc86970-f0f2-4c3a-9681-08440413db9c" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="9fad5679-f857-4c40-80b7-745384dfd303" value="0.0001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a6ef8236-5c3f-4114-bef2-c29d7e57c6b6" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="ea90e354-d826-4377-81df-44f2585176c4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="000ca4c6-016b-4e45-a7d5-5969b57b85c6" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="fa89b8a2-30ae-46c9-b279-1eacce417f0f" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="03b36f23-d880-4946-8b6f-3e89e45c0e1c"/>
      </asset>
      <asset xsi:type="esdl:Battery" id="asset_sizing_rejected_battery" name="RejectedBattery" technicalLifetime="20.0" state="OPTIONAL" capacity="10000000.0" maxChargeRate="400.0" maxDischargeRate="400.0" chargeEfficiency="0.9" dischargeEfficiency="0.9">
        <costInformation xsi:type="esdl:CostInformation" id="18ea4477-6a3c-48a0-8228-13241beb3904">
          <investmentCosts xsi:type="esdl:SingleValue" id="2fb41b00-64af-4bb6-b945-92ad765ed234" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="efcde895-8e83-4e26-9973-4f94589ac206" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="618cd4df-7241-40f9-bb89-285655ab8181" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="79f4a1c1-fa42-46bc-968b-43890c4adb10" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="5c8800de-38a9-4a90-a0cb-33b4c9189c78" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="00742f9c-9d61-4060-9b93-83319e34e0f8" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="af0c5bab-230e-42ae-9515-72a391ffd22b">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="00ce4962-bf13-4b81-8f2a-e514dde5e957" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="c271337d-ed86-42f1-b4d6-8baaf3b518b8" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="bf1b29ab-9198-4f51-9c3f-b52a4caa622f"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" id="asset_sizing_demand" name="AssetSizingDemand" power="1000.0">
        <port xsi:type="esdl:InPort" id="80a24739-cf89-4084-b6ba-02737910dbaa" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="fd01af76-859c-4a78-b66d-acafd5332300"/>
      </asset>
      <asset xsi:type="esdl:Import" id="asset_sizing_import" name="ElectricityImport" technicalLifetime="20.0" power="1500.0">
        <costInformation xsi:type="esdl:CostInformation" id="8c0eaf6f-aacb-41f3-b902-dbbd75d51c83">
          <investmentCosts xsi:type="esdl:SingleValue" id="be22247c-07a3-4907-9ee6-8d44a6d1c7d6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="14bb4908-8de2-46af-8385-f5c997ae6e38" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="012e425a-a693-465b-95de-0bf0c31f55e6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e8bb5f50-0f55-45ac-99be-4fad9d4b313b" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="54e6134c-be2e-4395-8d43-db24a0f7e45b">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="34d5bc49-19b1-4295-9b1e-061029a2954f" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="cf4b29f5-3e4a-418d-870c-e9e65c67814c" value="10.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="89219bf3-da5b-4eb4-a9ef-00a420b3eec5" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR" perMultiplier="MEGA"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="99181077-8590-4380-bb69-ff8f5c41382a" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="8ab08406-7efb-4a0f-ab82-cd8412b6d7ed"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="asset_sizing_bus" name="AssetSizingBus">
        <port xsi:type="esdl:InPort" id="9171087a-01c3-4a06-8d39-ee587c33fd8d" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="ab878b68-282f-4211-9e4f-bd14287ee5cd ae17cf14-5bb3-495f-9e3d-ad622c8136d9 164009e4-103f-4c0c-827a-33b0f57471e1"/>
        <port xsi:type="esdl:OutPort" id="f6e7bb15-ec01-42cb-802e-fdb534d4ece4" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="630a63db-9653-4b2b-b522-ddb315f27c16 0ab012d9-500a-46d7-aacc-d4f8a7197f79 e2c6b625-1fe5-434c-a189-7dce1e3d86d5"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_0" name="AssetSizingCable0" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="ae4bf4e6-164e-443f-94a8-8bf85a483391" name="In" connectedTo="33a6776e-4e94-4b5e-a078-a34d2d9c6a64" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="ab878b68-282f-4211-9e4f-bd14287ee5cd" name="Out" connectedTo="9171087a-01c3-4a06-8d39-ee587c33fd8d" carrier="electricity_asset_sizing_carrier"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_1" name="AssetSizingCable1" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="757826bb-27f1-4362-8ba4-c195f4a6bcc8" name="In" connectedTo="60f8d922-8422-47bb-af44-42fe08f12d45" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="ae17cf14-5bb3-495f-9e3d-ad622c8136d9" name="Out" connectedTo="9171087a-01c3-4a06-8d39-ee587c33fd8d" carrier="electricity_asset_sizing_carrier"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_2" name="AssetSizingCable2" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="8ab08406-7efb-4a0f-ab82-cd8412b6d7ed" name="In" connectedTo="99181077-8590-4380-bb69-ff8f5c41382a" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="164009e4-103f-4c0c-827a-33b0f57471e1" name="Out" connectedTo="9171087a-01c3-4a06-8d39-ee587c33fd8d" carrier="electricity_asset_sizing_carrier"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_3" name="AssetSizingCable3" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="630a63db-9653-4b2b-b522-ddb315f27c16" name="In" connectedTo="f6e7bb15-ec01-42cb-802e-fdb534d4ece4" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="03b36f23-d880-4946-8b6f-3e89e45c0e1c" name="Out" connectedTo="fa89b8a2-30ae-46c9-b279-1eacce417f0f" carrier="electricity_asset_sizing_carrier"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_4" name="AssetSizingCable4" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="0ab012d9-500a-46d7-aacc-d4f8a7197f79" name="In" connectedTo="f6e7bb15-ec01-42cb-802e-fdb534d4ece4" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="bf1b29ab-9198-4f51-9c3f-b52a4caa622f" name="Out" connectedTo="c271337d-ed86-42f1-b4d6-8baaf3b518b8" carrier="electricity_asset_sizing_carrier"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_5" name="AssetSizingCable5" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="e2c6b625-1fe5-434c-a189-7dce1e3d86d5" name="In" connectedTo="f6e7bb15-ec01-42cb-802e-fdb534d4ece4" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="fd01af76-859c-4a78-b66d-acafd5332300" name="Out" connectedTo="80a24739-cf89-4084-b6ba-02737910dbaa" carrier="electricity_asset_sizing_carrier"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="04d2eab8-ce49-4bcb-adfc-574f704d0b14">
    <carriers xsi:type="esdl:Carriers" id="6fd2e1b9-c259-45bd-8210-dd6ccdefe82d">
      <carrier xsi:type="esdl:ElectricityCommodity" id="electricity_asset_sizing_carrier" name="Electricity" voltage="230.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
