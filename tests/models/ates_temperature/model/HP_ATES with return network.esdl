<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="8" id="238c5cfb-4a72-415f-956d-e55212623118_with_return_network" description="" esdlVersion="v2303" name="HP_ATES with return network">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="bf061ba2-40bb-444e-bfdd-85dd968370be">
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="d3feabee-2e43-4e9e-ba77-58a90c9b9939">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" unit="WATT" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA"/>
    </quantityAndUnits>
    <carriers xsi:type="esdl:Carriers" id="61628030-507a-4d4d-a96e-e756db92b19a">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="80.0" name="Primary" id="f518c023-f81b-440f-93b2-a8cde23eb059"/>
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="ATES" id="c41e7703-dee0-4dc7-9166-a99838591a90"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" name="Primary_ret" id="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="30.0" name="ATES_ret" id="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" name="Untitled instance" id="48f91767-4fbf-4c24-b064-beaa162e6a7a">
    <area xsi:type="esdl:Area" name="Untitled area" id="1e226d40-25eb-41c4-9a35-ce0b28e61844">
      <asset xsi:type="esdl:ATES" maxDischargeRate="4010000.0" aquiferAnisotropy="4.0" name="ATES_cb47" wellDistance="150.0" aquiferThickness="45.0" maxChargeRate="4010000.0" aquiferPorosity="0.3" salinity="10000.0" aquiferMidTemperature="17.0" aquiferPermeability="10000.0" id="cb47e1d6-8d04-4f8c-9a84-6acd2fbadba4" wellCasingSize="13.0" aquiferTopDepth="300.0" aquiferNetToGross="1.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.04248556477125" lon="4.3048756292178325"/>
        <costInformation xsi:type="esdl:CostInformation">
          <installationCosts xsi:type="esdl:SingleValue" id="d38ded19-6eba-41d3-9bbd-990119f0f332" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" id="6958ab14-3dfd-4899-82a9-cc3335561317" physicalQuantity="COST" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="2.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="3c9f580e-b71a-4bc8-8cea-cb6788c0bf49" unit="EURO" description="Cost in EUR/MWh" perMultiplier="MEGA"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="233359.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="a3b5cdd9-364b-4262-bce5-4658c5f1bac9" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA"/>
          </investmentCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="12500.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="574ef21d-681a-43ae-a1cb-f7b25d88defb" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA"/>
          </fixedOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" name="In" id="fa2863f3-7745-4e51-b80e-b39277a196df" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="e262a06a-d30d-4c47-b213-b7f3705f3ec8"/>
        <port xsi:type="esdl:OutPort" name="Out" id="911dfd6e-f894-432e-9238-ca6b8135f71a" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" connectedTo="c68c3322-f4df-47c5-ae67-81c0fa56eb6d"/>
        <dataSource xsi:type="esdl:DataSource" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution="" name="WarmingUp factsheet: HT-ATES (high)"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="7f2cc50a-cde9-4640-81d3-1219ce44e817" COP="3.7" name="HeatPump_7f2c" power="5000000.0">
        <port xsi:type="esdl:InPort" name="PrimIn" id="df79731a-c974-4a51-b048-7f5a64de2f5c" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="bc01948f-ebe5-407b-93cd-ac6044d382f3"/>
        <port xsi:type="esdl:OutPort" name="PrimOut" id="9ffb073f-83df-42f3-b65a-191b0a40d066" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" connectedTo="a2fbbd83-65c9-4282-b9db-1de2d306cbc4"/>
        <port xsi:type="esdl:InPort" name="SecIn" id="c80765ca-c4c2-440d-b119-b648c73e7ed0" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" connectedTo="78da6979-3754-43e0-920e-4cd0130ebfbc"/>
        <port xsi:type="esdl:OutPort" name="SecOut" id="41ab3b61-8ef9-4be6-9d0e-ea49e016154b" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" connectedTo="b1f7aa8b-a7e5-4dfd-bb2c-32350a2afe54"/>
        <geometry xsi:type="esdl:Point" lat="52.03955754374964" lon="4.3105457066835005"/>
        <dataSource xsi:type="esdl:DataSource" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution="" name="WarmingUp factsheet: Warmtepomp"/>
        <costInformation xsi:type="esdl:CostInformation">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="62fdea30-ff3b-4bdc-b687-537eef8c13c8" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA"/>
          </investmentCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="900.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="73f54385-24f6-4166-a8c1-d6954d13d240" unit="EURO" description="Cost in EUR/MW/yr" perMultiplier="MEGA" perTimeUnit="YEAR"/>
          </fixedMaintenanceCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="900.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="9dd51278-62a3-46d3-be1b-d9f352eca327" unit="EURO" description="Cost in EUR/MW/yr" perMultiplier="MEGA" perTimeUnit="YEAR"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="500.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MWh" perMultiplier="MEGA" perUnit="WATTHOUR" id="9dd51278-62a3-46d3-be1b-d9f352eca328" unit="EURO"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatExchange" capacity="10000000.0" id="32ba35b1-7274-4285-8a72-0e050e579557" name="HeatExchange_32ba" heatTransferCoefficient="200000.0">
        <port xsi:type="esdl:InPort" name="PrimIn" id="ca8fec66-c5e4-410c-91c3-39d36720f8af" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" connectedTo="81fa0613-5da6-497c-a375-c16de6ae887f"/>
        <port xsi:type="esdl:OutPort" name="PrimOut" id="958d560d-15b9-4e68-9ac5-e8ee573ea409" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" connectedTo="ee159cb7-91b2-4cfc-96bf-b63cc0087819"/>
        <port xsi:type="esdl:OutPort" name="SecOut" id="861d1cf7-3107-4fd4-8172-6377893f38fc" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="0d14b582-a17a-4db0-aba6-c682b26015df"/>
        <port xsi:type="esdl:InPort" name="SecIn" id="fbc0b7bd-1b42-4d76-8547-bf2bd6275506" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" connectedTo="863dbd58-40f8-4385-a30f-07f4a2656555"/>
        <geometry xsi:type="esdl:Point" lat="52.03850155489687" lon="4.306340197467629"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe1" outerDiameter="0.56" diameter="DN400" name="Pipe1" length="218.06" innerDiameter="0.3938" related="Pipe1_ret">
        <port xsi:type="esdl:InPort" name="In" id="fb2f05de-43db-4f92-adb5-1207f760a63e" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="c30173b3-0f21-4f03-9c02-6a2e2ddbf109"/>
        <port xsi:type="esdl:OutPort" name="Out" id="e262a06a-d30d-4c47-b213-b7f3705f3ec8" connectedTo="fa2863f3-7745-4e51-b80e-b39277a196df" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.040705429262196" lon="4.306209377957765"/>
          <point xsi:type="esdl:Point" lat="52.040705217736736" lon="4.3062072877117075"/>
          <point xsi:type="esdl:Point" lat="52.04248556477125" lon="4.3048756292178325"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="3e1609b8-1f76-45cf-875f-94bcc0c2f005">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="9169bd50-197f-4d6b-aaac-b383a59c815d" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="8b06c8d2-49a9-430b-b9d6-a5ba971e0ad8" name="Joint_8b06">
        <port xsi:type="esdl:InPort" name="In" id="af0a176b-2f6d-4c27-a23b-c066052e0495" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="badc56bf-08ff-4734-af63-7dd8e50b0dcf"/>
        <port xsi:type="esdl:OutPort" name="Out" id="c30173b3-0f21-4f03-9c02-6a2e2ddbf109" connectedTo="fb2f05de-43db-4f92-adb5-1207f760a63e 37774942-a934-4ac5-b4c5-31f12d7ca44f" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <geometry xsi:type="esdl:Point" lat="52.040705429262196" lon="4.306209377957765"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe2" outerDiameter="0.56" diameter="DN400" name="Pipe2" length="322.9" innerDiameter="0.3938" related="Pipe2_ret">
        <port xsi:type="esdl:InPort" name="In" id="37774942-a934-4ac5-b4c5-31f12d7ca44f" connectedTo="c30173b3-0f21-4f03-9c02-6a2e2ddbf109" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <port xsi:type="esdl:OutPort" name="Out" id="bc01948f-ebe5-407b-93cd-ac6044d382f3" connectedTo="df79731a-c974-4a51-b048-7f5a64de2f5c" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.040705429262196" lon="4.306209377957765"/>
          <point xsi:type="esdl:Point" lat="52.03955754374964" lon="4.3105457066835005"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="409b4727-951b-401e-a84d-dc21f8ae40ae">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="9169bd50-197f-4d6b-aaac-b383a59c815d" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:GeothermalSource" maxTemperature="70.0" id="4e5bef4c-0192-4275-9e6a-2d1ae59a3941" power="6000000.0" name="GeothermalSource_4e5b">
        <port xsi:type="esdl:OutPort" name="Out" id="14632e13-9a41-45ec-8125-d8bff7c0c2a3" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" connectedTo="bf59c1bd-f9f2-40c3-b5cd-b4aeb7127483"/>
        <port xsi:type="esdl:InPort" name="In" id="f09e1c35-7d0c-4d8a-ae33-ed8cd461e397" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" connectedTo="8b9ef7db-d545-4a9f-938c-c9fa3f7c6a58"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.03592690466185" lon="4.306080476812526"/>
        <dataSource xsi:type="esdl:DataSource" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution="" name="WarmingUp factsheet: Diepe geothermie (2500 m)"/>
        <costInformation xsi:type="esdl:CostInformation">
          <investmentCosts xsi:type="esdl:SingleValue" value="1360000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="a0321ad0-64f1-441b-bedb-d13f089ff3b7" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="46b56fbb-b718-4933-8c96-5728804dc81e" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" id="543df5a0-ac63-4708-a1d3-ac09749aa931" physicalQuantity="COST" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="2.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="6c4b9fa3-96e9-4784-a1e8-27cb5247bc9e" unit="EURO" description="Cost in EUR/MWh" perMultiplier="MEGA"/>
          </variableOperationalCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="91000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="9d72bca2-a4b3-4e8b-ac4f-f7911f1b2c3b" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA"/>
          </fixedMaintenanceCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GenericProducer" id="4dfef171-02b4-4ad7-ad67-75bf36c92423" power="6000000.0" name="GenericProducer_4dfe">
        <port xsi:type="esdl:OutPort" name="Out" id="49470edb-de9f-4e15-ae8e-f22416915e3b" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" connectedTo="f6284605-daa7-4f27-8e06-317344a19094"/>
        <port xsi:type="esdl:InPort" name="In" id="3e41c106-c498-4d77-a5c8-d0856484570f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" connectedTo="38b164c3-9c95-4f7e-b29f-416dbcfd2c11"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.0330748992019" lon="4.30783781758207"/>
        <costInformation xsi:type="esdl:CostInformation" id="e86e46df-ea92-4f8f-9c5a-5587a1569df4">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="1e9ded33-463e-4927-8c1b-a889495378e1" value="3000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="ec8c9da3-4275-4a57-8bf8-e52f86d4c0ee" unit="EURO" description="Cost in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="55bfdf02-2d05-4357-9ca4-351b81116419" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="2cc18b1d-7a7c-440e-9894-df19efd4fedc" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="b7affceb-3249-42d0-9041-5933ad26e593" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" id="90eea8c8-a659-4b03-88bc-fe3fe037b449" physicalQuantity="COST" description="Cost in EUR"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="72ea5657-7cc8-4d5c-9667-38a7fe0b0643" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="f4160eb1-7b18-43b9-9b91-180864073fb2" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
          </fixedOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="4b650b45-9b1c-4d0c-9e6c-24357d296241" power="14000000.0" name="HeatingDemand_1">
        <port xsi:type="esdl:InPort" name="In" id="f712c29a-d586-4016-81a2-dd5a1f489936" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" connectedTo="fdf307cb-449b-48a9-9113-27dda4b491b8"/>
        <port xsi:type="esdl:OutPort" name="Out" id="67ccc3c0-c1f7-4bfc-b635-565c7949951f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" connectedTo="31ea31da-facb-4d11-ba25-9908489a0655"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.03778770180885" lon="4.3174495400080035"/>
        <costInformation xsi:type="esdl:CostInformation" id="20f4ba36-8585-413a-a10b-9e74ea65a2d8">
          <installationCosts xsi:type="esdl:SingleValue" id="7c955dff-0dc0-4530-a629-275adaea007f" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="59be6706-c2c4-452c-9455-af73279cb9a5" unit="EURO" description="Cost in EUR" physicalQuantity="COST"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe3" outerDiameter="0.8" diameter="DN600" name="Pipe3" length="338.69" innerDiameter="0.5958" related="Pipe3_ret">
        <port xsi:type="esdl:InPort" name="In" id="bf59c1bd-f9f2-40c3-b5cd-b4aeb7127483" connectedTo="14632e13-9a41-45ec-8125-d8bff7c0c2a3" carrier="f518c023-f81b-440f-93b2-a8cde23eb059"/>
        <port xsi:type="esdl:OutPort" name="Out" id="b9082a47-899e-4b8a-ae8b-b4cb05b3da80" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" connectedTo="5710ec36-7159-41dc-afe2-fd09ae4bb66f"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0071">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="677a2b31-11f6-4611-9593-6aa5b8439366"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0872">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="963c7474-11f9-4b17-bea5-3f79580215ac"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0078">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="3952a627-302d-42fd-9ddf-afc5df895ece"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.03592690466185" lon="4.306080476812526"/>
          <point xsi:type="esdl:Point" lat="52.03723327254086" lon="4.310519795185832"/>
          <point xsi:type="esdl:Point" lat="52.03724647331762" lon="4.310541249504155"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="f7a00b8a-57c9-433c-93b9-7ee354cd100d">
          <investmentCosts xsi:type="esdl:SingleValue" id="31c32868-a829-4d58-8a55-d97ec2ae8361" name="Combined investment and installation costs" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="08824a9e-e611-4d06-a533-54f75ccb56f5" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe4" outerDiameter="0.8" diameter="DN600" name="Pipe4" length="476.35" innerDiameter="0.5958" related="Pipe4_ret">
        <port xsi:type="esdl:InPort" name="In" id="b7b1c1e9-2288-436f-971d-dfce9cd4c624" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" connectedTo="d8381212-2d28-4446-a19c-d661aa3f371b"/>
        <port xsi:type="esdl:OutPort" name="Out" id="fdf307cb-449b-48a9-9113-27dda4b491b8" connectedTo="f712c29a-d586-4016-81a2-dd5a1f489936" carrier="f518c023-f81b-440f-93b2-a8cde23eb059"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0071">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="677a2b31-11f6-4611-9593-6aa5b8439366"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0872">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="963c7474-11f9-4b17-bea5-3f79580215ac"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0078">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="3952a627-302d-42fd-9ddf-afc5df895ece"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.03724647331762" lon="4.310541249504155"/>
          <point xsi:type="esdl:Point" lat="52.03778770180885" lon="4.3174495400080035"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="f7a00b8a-57c9-433c-93b9-7ee354cd100d">
          <investmentCosts xsi:type="esdl:SingleValue" id="31c32868-a829-4d58-8a55-d97ec2ae8361" name="Combined investment and installation costs" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="08824a9e-e611-4d06-a533-54f75ccb56f5" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="44447d60-2402-448a-9c35-afb00e6e3f08" name="Joint_4444">
        <port xsi:type="esdl:InPort" name="In" id="5710ec36-7159-41dc-afe2-fd09ae4bb66f" connectedTo="b9082a47-899e-4b8a-ae8b-b4cb05b3da80 65f4ff4c-ad4d-41ff-bad2-550db7a53f77 0b3e2946-0e21-4936-be7a-c00c5dc5e8b1" carrier="f518c023-f81b-440f-93b2-a8cde23eb059"/>
        <port xsi:type="esdl:OutPort" name="Out" id="d8381212-2d28-4446-a19c-d661aa3f371b" connectedTo="b7b1c1e9-2288-436f-971d-dfce9cd4c624 22236a93-b4ac-43d4-9356-9af7c542d59f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059"/>
        <geometry xsi:type="esdl:Point" lat="52.03724647331762" lon="4.310541249504155"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe5" outerDiameter="0.8" diameter="DN600" name="Pipe5" length="730.5" innerDiameter="0.5958" related="Pipe5_ret">
        <port xsi:type="esdl:InPort" name="In" id="f6284605-daa7-4f27-8e06-317344a19094" connectedTo="49470edb-de9f-4e15-ae8e-f22416915e3b" carrier="f518c023-f81b-440f-93b2-a8cde23eb059"/>
        <port xsi:type="esdl:OutPort" name="Out" id="65f4ff4c-ad4d-41ff-bad2-550db7a53f77" connectedTo="5710ec36-7159-41dc-afe2-fd09ae4bb66f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0071">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="677a2b31-11f6-4611-9593-6aa5b8439366"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0872">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="963c7474-11f9-4b17-bea5-3f79580215ac"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0078">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="3952a627-302d-42fd-9ddf-afc5df895ece"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.0330748992019" lon="4.30783781758207"/>
          <point xsi:type="esdl:Point" lat="52.03431580525122" lon="4.312836861565997"/>
          <point xsi:type="esdl:Point" lat="52.03724647331762" lon="4.310541249504155"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="4ca1e9d2-744f-438c-a43a-a44c87c37595">
          <investmentCosts xsi:type="esdl:SingleValue" id="31c32868-a829-4d58-8a55-d97ec2ae8361" name="Combined investment and installation costs" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="08824a9e-e611-4d06-a533-54f75ccb56f5" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe6" outerDiameter="0.8" diameter="DN600" name="Pipe6" length="257.0" innerDiameter="0.5958" related="Pipe6_ret">
        <port xsi:type="esdl:InPort" name="In" id="b1f7aa8b-a7e5-4dfd-bb2c-32350a2afe54" connectedTo="41ab3b61-8ef9-4be6-9d0e-ea49e016154b" carrier="f518c023-f81b-440f-93b2-a8cde23eb059"/>
        <port xsi:type="esdl:OutPort" name="Out" id="0b3e2946-0e21-4936-be7a-c00c5dc5e8b1" connectedTo="5710ec36-7159-41dc-afe2-fd09ae4bb66f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0071">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="677a2b31-11f6-4611-9593-6aa5b8439366"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0872">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="963c7474-11f9-4b17-bea5-3f79580215ac"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0078">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="3952a627-302d-42fd-9ddf-afc5df895ece"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.03955754374964" lon="4.3105457066835005"/>
          <point xsi:type="esdl:Point" lat="52.03724647331762" lon="4.310541249504155"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="93b4eab0-53f8-4103-b6f3-c4aa6b2d1bde">
          <investmentCosts xsi:type="esdl:SingleValue" id="31c32868-a829-4d58-8a55-d97ec2ae8361" name="Combined investment and installation costs" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="08824a9e-e611-4d06-a533-54f75ccb56f5" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe7" outerDiameter="0.8" diameter="DN600" name="Pipe7" length="319.5" innerDiameter="0.5958" related="Pipe7_ret">
        <port xsi:type="esdl:InPort" name="In" id="22236a93-b4ac-43d4-9356-9af7c542d59f" connectedTo="d8381212-2d28-4446-a19c-d661aa3f371b" carrier="f518c023-f81b-440f-93b2-a8cde23eb059"/>
        <port xsi:type="esdl:OutPort" name="Out" id="81fa0613-5da6-497c-a375-c16de6ae887f" connectedTo="ca8fec66-c5e4-410c-91c3-39d36720f8af" carrier="f518c023-f81b-440f-93b2-a8cde23eb059"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0071">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="677a2b31-11f6-4611-9593-6aa5b8439366"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0872">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="963c7474-11f9-4b17-bea5-3f79580215ac"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0078">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="3952a627-302d-42fd-9ddf-afc5df895ece"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.03724647331762" lon="4.310541249504155"/>
          <point xsi:type="esdl:Point" lat="52.03850155489687" lon="4.306340197467629"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="6d2cd47c-5d2c-4319-8176-ba7aad48a187">
          <investmentCosts xsi:type="esdl:SingleValue" id="31c32868-a829-4d58-8a55-d97ec2ae8361" name="Combined investment and installation costs" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="08824a9e-e611-4d06-a533-54f75ccb56f5" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe8" outerDiameter="0.8" diameter="DN600" name="Pipe8" length="245.2" innerDiameter="0.5958" related="Pipe8_ret">
        <port xsi:type="esdl:InPort" name="In" id="0d14b582-a17a-4db0-aba6-c682b26015df" connectedTo="861d1cf7-3107-4fd4-8172-6377893f38fc" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <port xsi:type="esdl:OutPort" name="Out" id="badc56bf-08ff-4734-af63-7dd8e50b0dcf" connectedTo="af0a176b-2f6d-4c27-a23b-c066052e0495" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0071">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="677a2b31-11f6-4611-9593-6aa5b8439366"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0872">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="963c7474-11f9-4b17-bea5-3f79580215ac"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0078">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="3952a627-302d-42fd-9ddf-afc5df895ece"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.03850155489687" lon="4.306340197467629"/>
          <point xsi:type="esdl:Point" lat="52.040705429262196" lon="4.306209377957765"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="a4a624eb-7c9d-4c7f-9ffe-867afab59433">
          <investmentCosts xsi:type="esdl:SingleValue" id="31c32868-a829-4d58-8a55-d97ec2ae8361" name="Combined investment and installation costs" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="08824a9e-e611-4d06-a533-54f75ccb56f5" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="26a95f45-960b-4731-97b5-71f558e2371c" name="Joint_8b06_ret">
        <port xsi:type="esdl:InPort" name="ret_port" id="55c06f28-a3d3-468b-9d79-b3c1402df635" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" connectedTo="218b42cd-a652-4e5d-a5db-d71ee44b51d7 9d6e4005-88c5-43f2-bed5-4d7e3ce88295"/>
        <port xsi:type="esdl:OutPort" name="ret_port" id="03c9cba1-0d12-4434-911a-8b3813126b03" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" connectedTo="7ba8c24d-9506-4d1c-840e-47448dd354c4"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.040795429352194" lon="4.30558249861894"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="360ebdae-28f3-4bab-9c02-c6f843f1ead3" name="Joint_4444_ret">
        <port xsi:type="esdl:OutPort" name="ret_port" id="4f487e75-ce7c-4c87-9101-38e73be55bdb" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" connectedTo="58584c12-19ee-4efd-a6f7-0b6fa4df4bad f5e323c1-9378-4649-882d-23695b24f210 13e6422e-533f-4204-95f7-6fc24bf8e7af"/>
        <port xsi:type="esdl:InPort" name="ret_port" id="76103626-fa5a-4884-9a96-67bf0b6fe212" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" connectedTo="69cec8da-8b4a-4aeb-b722-30f4f6cfd541 f9304493-a1b6-4193-8ed5-248cf4c80a60"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.03733647340762" lon="4.309903730049743"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe1_ret" outerDiameter="0.56" diameter="DN400" name="Pipe1_ret" length="218.06" innerDiameter="0.3938" related="Pipe1">
        <port xsi:type="esdl:InPort" name="In_ret" id="c68c3322-f4df-47c5-ae67-81c0fa56eb6d" connectedTo="911dfd6e-f894-432e-9238-ca6b8135f71a" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="218b42cd-a652-4e5d-a5db-d71ee44b51d7" connectedTo="55c06f28-a3d3-468b-9d79-b3c1402df635" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.042575564861245" lon="4.304254085651542"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.040795217826734" lon="4.305580407733295"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.040795429352194" lon="4.30558249861894"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe2_ret" outerDiameter="0.56" diameter="DN400" name="Pipe2_ret" length="322.9" innerDiameter="0.3938" related="Pipe2">
        <port xsi:type="esdl:InPort" name="In_ret" id="a2fbbd83-65c9-4282-b9db-1de2d306cbc4" connectedTo="9ffb073f-83df-42f3-b65a-191b0a40d066" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="9d6e4005-88c5-43f2-bed5-4d7e3ce88295" connectedTo="55c06f28-a3d3-468b-9d79-b3c1402df635" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.039647543839635" lon="4.309915336755912"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.040795429352194" lon="4.30558249861894"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe3_ret" outerDiameter="0.8" diameter="DN600" name="Pipe3_ret" length="338.69" innerDiameter="0.5958" related="Pipe3">
        <port xsi:type="esdl:InPort" name="In_ret" id="58584c12-19ee-4efd-a6f7-0b6fa4df4bad" connectedTo="4f487e75-ce7c-4c87-9101-38e73be55bdb" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="8b9ef7db-d545-4a9f-938c-c9fa3f7c6a58" connectedTo="f09e1c35-7d0c-4d8a-ae33-ed8cd461e397" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.03733647340762" lon="4.309903730049743"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.03732327263086" lon="4.309882234417831"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.03601690475185" lon="4.305438800381441"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe4_ret" outerDiameter="0.8" diameter="DN600" name="Pipe4_ret" length="476.35" innerDiameter="0.5958" related="Pipe4">
        <port xsi:type="esdl:InPort" name="In_ret" id="31ea31da-facb-4d11-ba25-9908489a0655" connectedTo="67ccc3c0-c1f7-4bfc-b635-565c7949951f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="69cec8da-8b4a-4aeb-b722-30f4f6cfd541" connectedTo="76103626-fa5a-4884-9a96-67bf0b6fe212" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.03787770189885" lon="4.316813709707303"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.03733647340762" lon="4.309903730049743"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe5_ret" outerDiameter="0.8" diameter="DN600" name="Pipe5_ret" length="730.5" innerDiameter="0.5958" related="Pipe5">
        <port xsi:type="esdl:InPort" name="In_ret" id="f5e323c1-9378-4649-882d-23695b24f210" connectedTo="4f487e75-ce7c-4c87-9101-38e73be55bdb" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="38b164c3-9c95-4f7e-b29f-416dbcfd2c11" connectedTo="3e41c106-c498-4d77-a5c8-d0856484570f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.03733647340762" lon="4.309903730049743"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.034405805341216" lon="4.312190034133983"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.0331648992919" lon="4.307186964841335"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe6_ret" outerDiameter="0.8" diameter="DN600" name="Pipe6_ret" length="257.0" innerDiameter="0.5958" related="Pipe6">
        <port xsi:type="esdl:InPort" name="In_ret" id="13e6422e-533f-4204-95f7-6fc24bf8e7af" connectedTo="4f487e75-ce7c-4c87-9101-38e73be55bdb" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="78da6979-3754-43e0-920e-4cd0130ebfbc" connectedTo="c80765ca-c4c2-440d-b119-b648c73e7ed0" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.03733647340762" lon="4.309903730049743"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.039647543839635" lon="4.309915336755912"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe7_ret" outerDiameter="0.8" diameter="DN600" name="Pipe7_ret" length="319.5" innerDiameter="0.5958" related="Pipe7">
        <port xsi:type="esdl:InPort" name="In_ret" id="ee159cb7-91b2-4cfc-96bf-b63cc0087819" connectedTo="958d560d-15b9-4e68-9ac5-e8ee573ea409" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="f9304493-a1b6-4193-8ed5-248cf4c80a60" connectedTo="76103626-fa5a-4884-9a96-67bf0b6fe212" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.038591554986866" lon="4.305706581151468"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.03733647340762" lon="4.309903730049743"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe8_ret" outerDiameter="0.8" diameter="DN600" name="Pipe8_ret" length="245.2" innerDiameter="0.5958" related="Pipe8">
        <port xsi:type="esdl:InPort" name="In_ret" id="7ba8c24d-9506-4d1c-840e-47448dd354c4" connectedTo="03c9cba1-0d12-4434-911a-8b3813126b03" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="863dbd58-40f8-4385-a30f-07f4a2656555" connectedTo="fbc0b7bd-1b42-4d76-8547-bf2bd6275506" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.040795429352194" lon="4.30558249861894"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.038591554986866" lon="4.305706581151468"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
