<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="electricity_asset_sizing" description="Optional electricity producer and battery sizing regression fixture" id="b7e0b051-f120-4c55-a685-c499e471be13" esdlVersion="v2107">
  <instance xsi:type="esdl:Instance" id="db9d5bf7-5909-4eb6-a4d8-2044da3c674d" name="Asset sizing instance">
    <area xsi:type="esdl:Area" id="68e47291-753f-4a9b-8cc8-fbcb3f6c3d56" name="Asset sizing area">
      <asset xsi:type="esdl:ElectricityProducer" id="asset_sizing_selected_producer" name="SelectedProducer" technicalLifetime="20.0" state="OPTIONAL" power="1000.0">
        <costInformation xsi:type="esdl:CostInformation" id="be4847ed-c3eb-4b9a-a36b-bb3a9ab0f952">
          <investmentCosts xsi:type="esdl:SingleValue" id="09d926bb-e5c7-4ab6-b570-e7b8ec209084" value="0.001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="56f76a74-cca6-4779-9cc1-eb931316366e" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="35df5051-54c6-4248-a1ba-c76c7d208c6d">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="271a8902-a713-4ad8-8053-a61ba85faa67" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="4b9be08a-7e17-4c1f-88c3-5752e57d0540" value="0.0001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b9a7fcc3-05eb-4efd-8a54-13054eace111" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="20e0f706-8d3c-4bdf-bc11-b75eb8565a8e">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="1e215fd0-b717-4130-aa7f-47591b763974" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="fb0d6908-1701-4d55-bb55-5dda7d094a3f" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="bc101477-c651-414e-b98f-18234529b8dc"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="asset_sizing_rejected_producer" name="RejectedProducer" technicalLifetime="20.0" state="OPTIONAL" power="1000.0">
        <costInformation xsi:type="esdl:CostInformation" id="00e57fbd-241c-4938-a2eb-a0690bc59d0f">
          <investmentCosts xsi:type="esdl:SingleValue" id="f65dcfe3-b2e9-4d2c-b846-814d4651e273" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="18286951-8d01-4659-8a17-5269f9d8d7b0" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="fcbe2040-3a31-4659-9d8c-a25cd6ac33ec" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="6c64b467-96bf-450a-8c14-886d3aa48cf4" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="20d23054-6e7f-4001-8534-0d03934cfed9" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ef98c124-c59f-4573-9a65-052beeadf978" physicalQuantity="COST" unit="EURO" perUnit="WATT"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="47e83c5b-3256-4de1-8d9d-55e7a143de60">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="3c10e2e0-02f6-4bf0-8cbf-fb7f1d9c3f81" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="cb00cc59-105a-4789-ac24-0fc0644a6c15" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="5c0d1662-d949-49e8-a417-38dd1053d2f6"/>
      </asset>
      <asset xsi:type="esdl:Battery" id="asset_sizing_selected_battery" name="SelectedBattery" technicalLifetime="20.0" state="OPTIONAL" capacity="10000000.0" maxChargeRate="400.0" maxDischargeRate="400.0" chargeEfficiency="0.9" dischargeEfficiency="0.9">
        <costInformation xsi:type="esdl:CostInformation" id="06b4451f-a3f0-4005-a5ff-064a7f713d4a">
          <investmentCosts xsi:type="esdl:SingleValue" id="dabf8c5a-0c17-4bb7-921b-25ec9eb4eae8" value="0.001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e2528540-4dca-43aa-a8ac-fa1ce3ae6833" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="1031808f-ed46-4ae5-9acf-a380de251829" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="7b587383-119f-4339-a501-f07a351e4426" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="4b69748e-54f5-4b86-9984-f405b179b6e4" value="0.0001">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="79528c3d-ca7e-4176-98d6-8538126b964a" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="41e2f40a-b31a-4f1d-bc70-9fbc343fbd57">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d7407f11-ecd5-41da-8d86-006307ed0d81" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="ecdbb26c-823a-4776-aa35-d3a954c5dcec" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="a39b7dde-284c-487a-829e-ca6bd99098ad"/>
      </asset>
      <asset xsi:type="esdl:Battery" id="asset_sizing_rejected_battery" name="RejectedBattery" technicalLifetime="20.0" state="OPTIONAL" capacity="10000000.0" maxChargeRate="400.0" maxDischargeRate="400.0" chargeEfficiency="0.9" dischargeEfficiency="0.9">
        <costInformation xsi:type="esdl:CostInformation" id="20f40e3f-cd64-4426-8015-f66caeabc1cc">
          <investmentCosts xsi:type="esdl:SingleValue" id="dbcdf639-2315-4244-8b32-ab1c7b884c6e" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="43a640c1-0138-4525-ac16-0ec14ea9ddd6" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="67806c95-901e-4b9a-90a0-ed5537e2492b" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ade95416-48e6-4dc5-b985-5831894dc091" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="fef25da4-38ab-4dbc-8882-54e6b3fdab91" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="806c8fa1-df99-46d9-8343-ded5295e320b" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="2cfe4d7f-c93b-481a-801f-553e8689fa33">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b2c1869d-ec8c-4b08-81c7-e2b22eb28027" physicalQuantity="COST" unit="EURO" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="56d7a605-cfc8-481f-87ef-d318e8a4576e" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="00fa2c03-8642-451d-a13f-b7a9e2af8ec4"/>
      </asset>
      <asset xsi:type="esdl:ElectricityDemand" id="asset_sizing_demand" name="AssetSizingDemand" power="1000.0">
        <port xsi:type="esdl:InPort" id="c330e412-c7b4-4792-b373-c1a96608c2b7" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="6f48408e-b3e1-4088-8bcb-fcaa4f1c63f9"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="asset_sizing_bus" name="AssetSizingBus">
        <port xsi:type="esdl:InPort" id="bda6ea18-5cca-4218-9623-ba11b267c322" name="In" carrier="electricity_asset_sizing_carrier" connectedTo="0be2dbcb-fad4-4e3c-ad81-35c5b9752bdc f2c914ca-ee17-4a9f-b7c0-39356e18a285"/>
        <port xsi:type="esdl:OutPort" id="22b06dfe-66ce-40f1-a42c-820dfe183c12" name="Out" carrier="electricity_asset_sizing_carrier" connectedTo="794ab1da-7ce1-4d43-bb56-e5e69208be42 36c07fa2-32d8-4ffb-9a49-d94e7851a429 6a4df716-3210-4692-a5a4-6b9c4ca7d95b"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_0" name="AssetSizingCable0" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="bc101477-c651-414e-b98f-18234529b8dc" name="In" connectedTo="fb0d6908-1701-4d55-bb55-5dda7d094a3f" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="0be2dbcb-fad4-4e3c-ad81-35c5b9752bdc" name="Out" connectedTo="bda6ea18-5cca-4218-9623-ba11b267c322" carrier="electricity_asset_sizing_carrier"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_1" name="AssetSizingCable1" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="5c0d1662-d949-49e8-a417-38dd1053d2f6" name="In" connectedTo="cb00cc59-105a-4789-ac24-0fc0644a6c15" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="f2c914ca-ee17-4a9f-b7c0-39356e18a285" name="Out" connectedTo="bda6ea18-5cca-4218-9623-ba11b267c322" carrier="electricity_asset_sizing_carrier"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_2" name="AssetSizingCable2" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="794ab1da-7ce1-4d43-bb56-e5e69208be42" name="In" connectedTo="22b06dfe-66ce-40f1-a42c-820dfe183c12" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="a39b7dde-284c-487a-829e-ca6bd99098ad" name="Out" connectedTo="ecdbb26c-823a-4776-aa35-d3a954c5dcec" carrier="electricity_asset_sizing_carrier"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_3" name="AssetSizingCable3" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="36c07fa2-32d8-4ffb-9a49-d94e7851a429" name="In" connectedTo="22b06dfe-66ce-40f1-a42c-820dfe183c12" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="00fa2c03-8642-451d-a13f-b7a9e2af8ec4" name="Out" connectedTo="56d7a605-cfc8-481f-87ef-d318e8a4576e" carrier="electricity_asset_sizing_carrier"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="asset_sizing_cable_4" name="AssetSizingCable4" capacity="100000.0" length="1.0">
        <port xsi:type="esdl:InPort" id="6a4df716-3210-4692-a5a4-6b9c4ca7d95b" name="In" connectedTo="22b06dfe-66ce-40f1-a42c-820dfe183c12" carrier="electricity_asset_sizing_carrier"/>
        <port xsi:type="esdl:OutPort" id="6f48408e-b3e1-4088-8bcb-fcaa4f1c63f9" name="Out" connectedTo="c330e412-c7b4-4792-b373-c1a96608c2b7" carrier="electricity_asset_sizing_carrier"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="442e9313-fbba-4390-8a01-79f6b819dfe0">
    <carriers xsi:type="esdl:Carriers" id="452f8841-7fa7-4c52-9908-24979b9fe36f">
      <carrier xsi:type="esdl:ElectricityCommodity" id="electricity_asset_sizing_carrier" name="Electricity" voltage="230.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
