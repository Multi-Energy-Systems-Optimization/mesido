<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="HP_ATES with return network with return network" description="" version="10" esdlVersion="v2303" id="238c5cfb-4a72-415f-956d-e55212623118_with_return_network_with_return_network">
  <instance xsi:type="esdl:Instance" name="Untitled instance" id="48f91767-4fbf-4c24-b064-beaa162e6a7a">
    <area xsi:type="esdl:Area" name="Untitled area" id="1e226d40-25eb-41c4-9a35-ce0b28e61844">
      <asset xsi:type="esdl:ATES" aquiferNetToGross="1.0" aquiferThickness="45.0" wellCasingSize="13.0" name="ATES_cb47" aquiferAnisotropy="4.0" maxDischargeRate="4010000.0" aquiferPorosity="0.3" id="cb47e1d6-8d04-4f8c-9a84-6acd2fbadba4" aquiferMidTemperature="17.0" aquiferTopDepth="300.0" wellDistance="150.0" salinity="10000.0" aquiferPermeability="10000.0" maxChargeRate="4010000.0">
        <costInformation xsi:type="esdl:CostInformation">
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="12500.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="574ef21d-681a-43ae-a1cb-f7b25d88defb" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" unit="EURO"/>
          </fixedOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="233359.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a3b5cdd9-364b-4262-bce5-4658c5f1bac9" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" unit="EURO"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="d38ded19-6eba-41d3-9bbd-990119f0f332" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR" unit="EURO" id="6958ab14-3dfd-4899-82a9-cc3335561317" physicalQuantity="COST"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="2.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="3c9f580e-b71a-4bc8-8cea-cb6788c0bf49" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" unit="EURO"/>
          </variableOperationalCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" name="WarmingUp factsheet: HT-ATES (high)" attribution="" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D"/>
        <port xsi:type="esdl:InPort" name="In" id="fa2863f3-7745-4e51-b80e-b39277a196df" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="e262a06a-d30d-4c47-b213-b7f3705f3ec8"/>
        <port xsi:type="esdl:OutPort" name="Out" id="911dfd6e-f894-432e-9238-ca6b8135f71a" connectedTo="517f7643-346a-4f15-92f4-a4bdcd7eb1e7"/>
        <geometry xsi:type="esdl:Point" lat="52.04248556477125" lon="4.3048756292178325" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe2" diameter="DN400" length="218.06" outerDiameter="0.56" innerDiameter="0.3938" name="Pipe2" related="Pipe2_ret">
        <costInformation xsi:type="esdl:CostInformation" id="3e1609b8-1f76-45cf-875f-94bcc0c2f005">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.040705429262196" lon="4.306209377957765"/>
          <point xsi:type="esdl:Point" lat="52.040705217736736" lon="4.3062072877117075"/>
          <point xsi:type="esdl:Point" lat="52.04248556477125" lon="4.3048756292178325"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="fb2f05de-43db-4f92-adb5-1207f760a63e" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="c30173b3-0f21-4f03-9c02-6a2e2ddbf109"/>
        <port xsi:type="esdl:OutPort" name="Out" id="e262a06a-d30d-4c47-b213-b7f3705f3ec8" connectedTo="fa2863f3-7745-4e51-b80e-b39277a196df" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
      </asset>
      <asset xsi:type="esdl:Joint" id="8b06c8d2-49a9-430b-b9d6-a5ba971e0ad8" name="Joint_8b06">
        <geometry xsi:type="esdl:Point" lat="52.040705429262196" lon="4.306209377957765"/>
        <port xsi:type="esdl:InPort" name="In" id="af0a176b-2f6d-4c27-a23b-c066052e0495" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="48537a84-36c7-4bb2-8b52-a3229e150522"/>
        <port xsi:type="esdl:OutPort" name="Out" id="c30173b3-0f21-4f03-9c02-6a2e2ddbf109" connectedTo="fb2f05de-43db-4f92-adb5-1207f760a63e fb6c6969-c292-4a09-bd1b-1d14f68f1424" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
      </asset>
      <asset xsi:type="esdl:GenericProducer" id="4dfef171-02b4-4ad7-ad67-75bf36c92423" power="6000000.0" name="GenericProducer_4dfe">
        <costInformation xsi:type="esdl:CostInformation" id="e86e46df-ea92-4f8f-9c5a-5587a1569df4">
          <investmentCosts xsi:type="esdl:SingleValue" id="55bfdf02-2d05-4357-9ca4-351b81116419" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" id="2cc18b1d-7a7c-440e-9894-df19efd4fedc" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST"/>
          </investmentCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="72ea5657-7cc8-4d5c-9667-38a7fe0b0643" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" id="f4160eb1-7b18-43b9-9b91-180864073fb2" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="1e9ded33-463e-4927-8c1b-a889495378e1" value="3000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" id="ec8c9da3-4275-4a57-8bf8-e52f86d4c0ee" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST"/>
          </variableOperationalCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="b7affceb-3249-42d0-9041-5933ad26e593" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR" unit="EURO" id="90eea8c8-a659-4b03-88bc-fe3fe037b449" physicalQuantity="COST"/>
          </installationCosts>
        </costInformation>
        <geometry xsi:type="esdl:Point" lat="52.039636536025625" lon="4.3053531646728525"/>
        <port xsi:type="esdl:OutPort" name="Out" id="49470edb-de9f-4e15-ae8e-f22416915e3b" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="d33740dd-15b4-409b-a093-e9f91a4569a1"/>
        <port xsi:type="esdl:InPort" name="In" id="3e41c106-c498-4d77-a5c8-d0856484570f" carrier="" connectedTo="f53a3199-7a59-4280-afdb-c4ddb089cf3f"/>
      </asset>
      <asset xsi:type="esdl:GenericConsumer" power="14000000.0" id="ccb7e695-0827-4aa1-a5fb-75fb1971914b" name="GenericConsumer_ccb7">
        <geometry xsi:type="esdl:Point" lat="52.04009849729296" lon="4.307820796966554"/>
        <port xsi:type="esdl:InPort" name="In" id="8e5544d6-333b-4654-ab58-6e297401e2ea" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="7a06be88-be0b-4145-bb70-c51144822ce4"/>
        <port xsi:type="esdl:OutPort" name="Out" id="3be86022-67f6-4294-a31f-d7cc10f69be5" carrier="" connectedTo="6f8b7b54-00ec-4923-b6eb-e76de2ab9bad"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe1" length="129.2" name="Pipe1" related="Pipe1_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.040705429262196" lon="4.306209377957765"/>
          <point xsi:type="esdl:Point" lat="52.04009849729296" lon="4.307820796966554"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="fb6c6969-c292-4a09-bd1b-1d14f68f1424" connectedTo="c30173b3-0f21-4f03-9c02-6a2e2ddbf109" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <port xsi:type="esdl:OutPort" name="Out" id="7a06be88-be0b-4145-bb70-c51144822ce4" connectedTo="8e5544d6-333b-4654-ab58-6e297401e2ea" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe3" length="132.5" name="Pipe3" related="Pipe3_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.039636536025625" lon="4.3053531646728525"/>
          <point xsi:type="esdl:Point" lat="52.040705429262196" lon="4.306209377957765"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="d33740dd-15b4-409b-a093-e9f91a4569a1" connectedTo="49470edb-de9f-4e15-ae8e-f22416915e3b" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <port xsi:type="esdl:OutPort" name="Out" id="48537a84-36c7-4bb2-8b52-a3229e150522" connectedTo="af0a176b-2f6d-4c27-a23b-c066052e0495" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="0b8fac00-5ade-417c-970b-4a58a783e251" name="Joint_8b06_ret">
        <geometry xsi:type="esdl:Point" lat="52.040795429352194" lon="4.30558249861894" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" name="ret_port" id="41368589-8c2c-49d9-adb5-00261ef202b9" carrier="" connectedTo="f4931b94-5749-4af3-87c9-16ddf24f5671 99cfabba-150d-4794-98f8-78f7690b1a0a"/>
        <port xsi:type="esdl:OutPort" name="ret_port" id="5888dc91-d502-469b-8ab9-01f719a8c5ae" carrier="" connectedTo="1a591c2c-a6e2-4b13-a0e2-be1560956f34"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" id="Pipe2_ret" diameter="DN400" length="218.06" innerDiameter="0.3938" name="Pipe2_ret" related="Pipe2">
        <port xsi:type="esdl:InPort" name="In_ret" id="517f7643-346a-4f15-92f4-a4bdcd7eb1e7" connectedTo="911dfd6e-f894-432e-9238-ca6b8135f71a"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="f4931b94-5749-4af3-87c9-16ddf24f5671" connectedTo="41368589-8c2c-49d9-adb5-00261ef202b9"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.042575564861245" lon="4.304254085651542" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.040795217826734" lon="4.305580407733295" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.040795429352194" lon="4.30558249861894" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe1_ret" length="129.2" name="Pipe1_ret" related="Pipe1">
        <port xsi:type="esdl:InPort" name="In_ret" id="6f8b7b54-00ec-4923-b6eb-e76de2ab9bad" connectedTo="3be86022-67f6-4294-a31f-d7cc10f69be5" carrier=""/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="99cfabba-150d-4794-98f8-78f7690b1a0a" connectedTo="41368589-8c2c-49d9-adb5-00261ef202b9" carrier=""/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.04018849738296" lon="4.307192076950485" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.040795429352194" lon="4.30558249861894" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe3_ret" length="132.5" name="Pipe3_ret" related="Pipe3">
        <port xsi:type="esdl:InPort" name="In_ret" id="1a591c2c-a6e2-4b13-a0e2-be1560956f34" connectedTo="5888dc91-d502-469b-8ab9-01f719a8c5ae" carrier=""/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="f53a3199-7a59-4280-afdb-c4ddb089cf3f" connectedTo="3e41c106-c498-4d77-a5c8-d0856484570f" carrier=""/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.040795429352194" lon="4.30558249861894" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.03972653611562" lon="4.304723036223399" CRS="WGS84"/>
        </geometry>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="bf061ba2-40bb-444e-bfdd-85dd968370be">
    <carriers xsi:type="esdl:Carriers" id="61628030-507a-4d4d-a96e-e756db92b19a">
      <carrier xsi:type="esdl:HeatCommodity" name="ATES" id="c41e7703-dee0-4dc7-9166-a99838591a90" supplyTemperature="70.0"/>
      <carrier xsi:type="esdl:HeatCommodity" name="ATES_ret" id="c41e7703-dee0-4dc7-9166-a99838591a90_ret" returnTemperature="30.0"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="d3feabee-2e43-4e9e-ba77-58a90c9b9939">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" multiplier="MEGA" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" unit="WATT" physicalQuantity="POWER"/>
    </quantityAndUnits>
  </energySystemInformation>
</esdl:EnergySystem>
