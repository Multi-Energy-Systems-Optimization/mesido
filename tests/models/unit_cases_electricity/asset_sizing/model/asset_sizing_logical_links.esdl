<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="electricity_asset_sizing" description="Optional electricity producer and battery sizing regression fixture" id="7def0396-69d2-463b-8bf4-590eebb62205" esdlVersion="v2107">
  <instance xsi:type="esdl:Instance" id="a82d93af-0bb7-43e1-8c31-3b5b9e090920" name="Asset sizing instance">
    <area xsi:type="esdl:Area" id="e35786e5-ef4b-4cc2-a542-0b635e84a815" name="Asset sizing area">
      <asset xsi:type="esdl:ElectricityProducer" id="asset_sizing_selected_producer" name="SelectedProducer" technicalLifetime="20.0" state="OPTIONAL" power="1000.0">
        <costInformation xsi:type="esdl:CostInformation" id="74cc5eb3-894b-4e7c-92b2-4f5211be376f">
          <investmentCosts xsi:type="esdl:SingleValue" id="e99943d0-ec4b-4836-8b15-3abed2382aa1" value="0.001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="8d9013f6-d230-4b12-a359-4fb2871a7350" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="7c42f707-b336-4685-90e4-f316071e1912">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d9d40fba-d924-4aa3-87e9-c2778b6e6497" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="f8e1930b-9c9e-4a83-8bc4-87292fd6577a" value="0.0001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="2686673d-22de-4562-8f3d-8ad27f55d3a5" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="1fb7098d-3feb-4f59-a3bc-06303b0682c4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="cf2415b1-7e7b-41a5-ae62-8991f353a262" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="fb0d6908-1701-4d55-bb55-5dda7d094a3f" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="bda6ea18-5cca-4218-9623-ba11b267c322"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="asset_sizing_rejected_producer" name="RejectedProducer" technicalLifetime="20.0" state="OPTIONAL" power="1000.0">
        <costInformation xsi:type="esdl:CostInformation" id="f2759513-271a-4a83-baa7-4481c0e85032">
          <investmentCosts xsi:type="esdl:SingleValue" id="5ac5f6e1-b956-42b9-8bc9-5a499e6d490f" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="371a7cf6-2c22-44b7-85ab-68cb5c1819b3" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="194f7335-2e30-4327-9f45-b56a5a775f22" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="af655c92-5846-429b-93da-2794d54e3c4e" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="ecb0efd5-169c-4570-a7cb-e1346c15c9df" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9688543e-a3d3-4296-8694-68a9e6595b3f" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="7a3269fe-751f-4803-ad14-740cc6498bc1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="6583d213-44e0-4127-adcb-17815faf9474" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="cb00cc59-105a-4789-ac24-0fc0644a6c15" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="bda6ea18-5cca-4218-9623-ba11b267c322"/>
      </asset>
      <asset xsi:type="esdl:Battery" id="asset_sizing_selected_battery" name="SelectedBattery" technicalLifetime="20.0" state="OPTIONAL" capacity="10000000.0" maxChargeRate="400.0" maxDischargeRate="400.0" chargeEfficiency="0.9" dischargeEfficiency="0.9">
        <costInformation xsi:type="esdl:CostInformation" id="fe714633-b424-4418-85ae-c1b916f6d1f2">
          <investmentCosts xsi:type="esdl:SingleValue" id="b4a81a7c-de80-42e5-8dba-650e7fbc742c" value="0.001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="965e6cc6-559d-4b10-b8ff-2e9d0c2730d9" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="324f2983-2909-4e15-aac2-8b21feccbd37" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="6c4600bf-0c2d-4cc0-8574-a0fb99396475" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="2a57c49d-7021-42b9-8874-48ebb4b80ec4" value="0.0001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="6b337015-bd10-4daa-8d39-00a91621676d" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="45efea1b-0f56-45c7-9999-7af3650f79fa">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a7f8885d-52c3-4bb7-8892-d7bf42a2566f" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="ecdbb26c-823a-4776-aa35-d3a954c5dcec" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="22b06dfe-66ce-40f1-a42c-820dfe183c12"/>
      </asset>
      <asset xsi:type="esdl:Battery" id="asset_sizing_rejected_battery" name="RejectedBattery" technicalLifetime="20.0" state="OPTIONAL" capacity="10000000.0" maxChargeRate="400.0" maxDischargeRate="400.0" chargeEfficiency="0.9" dischargeEfficiency="0.9">
        <costInformation xsi:type="esdl:CostInformation" id="f4918c37-a77c-49cf-8f18-2f926e5ba2b8">
          <investmentCosts xsi:type="esdl:SingleValue" id="855b014b-3d0c-4857-ab26-9382b9a44b0a" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a4f13b50-2a4f-416a-b5e0-7d2b2d762500" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="1201c6a5-f9ee-4182-9131-5d60b4517350" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="29850a54-1aa2-4554-9928-32b061babede" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="31343859-cf17-421c-b93f-012b83e02e2b" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d56625fa-ab40-43af-b12c-619e7eb9862e" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="75dd72f8-b299-4cdf-88da-288563b620f3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="3d199253-e928-46c0-8d4b-487d19759f7e" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="56d7a605-cfc8-481f-87ef-d318e8a4576e" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="22b06dfe-66ce-40f1-a42c-820dfe183c12"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" id="asset_sizing_demand" name="AssetSizingDemand" power="1000.0">
        <port xsi:type="esdl:InPort" id="c330e412-c7b4-4792-b373-c1a96608c2b7" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="22b06dfe-66ce-40f1-a42c-820dfe183c12"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="asset_sizing_bus" name="AssetSizingBus">
        <port xsi:type="esdl:InPort" id="bda6ea18-5cca-4218-9623-ba11b267c322" name="In" connectedTo="fb0d6908-1701-4d55-bb55-5dda7d094a3f cb00cc59-105a-4789-ac24-0fc0644a6c15" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="22b06dfe-66ce-40f1-a42c-820dfe183c12" name="Out" connectedTo="ecdbb26c-823a-4776-aa35-d3a954c5dcec 56d7a605-cfc8-481f-87ef-d318e8a4576e c330e412-c7b4-4792-b373-c1a96608c2b7" carrier="electricity_asset_sizing_carrier"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="1e7d1497-cd44-4879-92ff-b5525ed62c90">
    <carriers xsi:type="esdl:Carriers" id="87f516db-fca6-4406-babc-6419c46ea8de">
      <carrier xsi:type="esdl:ElectricityCommodity" id="electricity_asset_sizing_carrier" name="Electricity" voltage="230.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
