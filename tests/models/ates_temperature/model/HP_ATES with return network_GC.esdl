<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="8" id="238c5cfb-4a72-415f-956d-e55212623118_with_return_network" description="" esdlVersion="v2303" name="HP_ATES with return network">
  <instance xsi:type="esdl:Instance" id="48f91767-4fbf-4c24-b064-beaa162e6a7a" name="Untitled instance">
    <area xsi:type="esdl:Area" name="Untitled area" id="1e226d40-25eb-41c4-9a35-ce0b28e61844">
      <asset xsi:type="esdl:ATES" aquiferThickness="45.0" aquiferPorosity="0.3" id="cb47e1d6-8d04-4f8c-9a84-6acd2fbadba4" salinity="10000.0" aquiferMidTemperature="17.0" maxDischargeRate="4010000.0" aquiferPermeability="10000.0" name="ATES_cb47" wellCasingSize="13.0" aquiferTopDepth="300.0" aquiferNetToGross="1.0" maxChargeRate="4010000.0" aquiferAnisotropy="4.0" wellDistance="150.0">
        <port xsi:type="esdl:InPort" connectedTo="e262a06a-d30d-4c47-b213-b7f3705f3ec8" id="fa2863f3-7745-4e51-b80e-b39277a196df" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="In"/>
        <port xsi:type="esdl:OutPort" id="911dfd6e-f894-432e-9238-ca6b8135f71a" connectedTo="c68c3322-f4df-47c5-ae67-81c0fa56eb6d" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="Out"/>
        <dataSource xsi:type="esdl:DataSource" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution="" name="WarmingUp factsheet: HT-ATES (high)"/>
        <geometry xsi:type="esdl:Point" lat="52.04248556477125" lon="4.3048756292178325" CRS="WGS84"/>
        <costInformation xsi:type="esdl:CostInformation">
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="2.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MWh" id="3c9f580e-b71a-4bc8-8cea-cb6788c0bf49" perMultiplier="MEGA" perUnit="WATTHOUR" unit="EURO"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="233359.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MW" id="a3b5cdd9-364b-4262-bce5-4658c5f1bac9" perMultiplier="MEGA" perUnit="WATT" unit="EURO"/>
          </investmentCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="12500.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MW" id="574ef21d-681a-43ae-a1cb-f7b25d88defb" perMultiplier="MEGA" perUnit="WATT" unit="EURO"/>
          </fixedOperationalCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="d38ded19-6eba-41d3-9bbd-990119f0f332" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="6958ab14-3dfd-4899-82a9-cc3335561317" physicalQuantity="COST" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatPump" name="HeatPump_7f2c" power="5000000.0" id="7f2cc50a-cde9-4640-81d3-1219ce44e817" COP="3.7">
        <geometry xsi:type="esdl:Point" lat="52.03955754374964" lon="4.3105457066835005"/>
        <dataSource xsi:type="esdl:DataSource" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution="" name="WarmingUp factsheet: Warmtepomp"/>
        <costInformation xsi:type="esdl:CostInformation">
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="900.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MW" id="73f54385-24f6-4166-a8c1-d6954d13d240" perMultiplier="MEGA" perUnit="WATT" unit="EURO"/>
          </fixedMaintenanceCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MW" id="62fdea30-ff3b-4bdc-b687-537eef8c13c8" perMultiplier="MEGA" perUnit="WATT" unit="EURO"/>
          </investmentCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="900.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MW" id="9dd51278-62a3-46d3-be1b-d9f352eca327" perMultiplier="MEGA" perUnit="WATT" unit="EURO"/>
          </fixedOperationalCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="500.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MWh" id="9dd51278-62a3-46d3-be1b-d9f352eca328" perMultiplier="MEGA" perUnit="WATTHOUR" unit="EURO"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="bc01948f-ebe5-407b-93cd-ac6044d382f3" id="df79731a-c974-4a51-b048-7f5a64de2f5c" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="PrimIn"/>
        <port xsi:type="esdl:OutPort" id="9ffb073f-83df-42f3-b65a-191b0a40d066" connectedTo="a2fbbd83-65c9-4282-b9db-1de2d306cbc4" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="PrimOut"/>
        <port xsi:type="esdl:InPort" connectedTo="78da6979-3754-43e0-920e-4cd0130ebfbc" id="c80765ca-c4c2-440d-b119-b648c73e7ed0" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="SecIn"/>
        <port xsi:type="esdl:OutPort" id="41ab3b61-8ef9-4be6-9d0e-ea49e016154b" connectedTo="b1f7aa8b-a7e5-4dfd-bb2c-32350a2afe54" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="SecOut"/>
      </asset>
      <asset xsi:type="esdl:HeatExchange" heatTransferCoefficient="200000.0" name="HeatExchange_32ba" capacity="10000000.0" id="32ba35b1-7274-4285-8a72-0e050e579557">
        <geometry xsi:type="esdl:Point" lat="52.03850155489687" lon="4.306340197467629"/>
        <port xsi:type="esdl:InPort" connectedTo="81fa0613-5da6-497c-a375-c16de6ae887f" id="ca8fec66-c5e4-410c-91c3-39d36720f8af" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="PrimIn"/>
        <port xsi:type="esdl:OutPort" id="958d560d-15b9-4e68-9ac5-e8ee573ea409" connectedTo="ee159cb7-91b2-4cfc-96bf-b63cc0087819" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="PrimOut"/>
        <port xsi:type="esdl:OutPort" id="861d1cf7-3107-4fd4-8172-6377893f38fc" connectedTo="0d14b582-a17a-4db0-aba6-c682b26015df" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="SecOut"/>
        <port xsi:type="esdl:InPort" connectedTo="863dbd58-40f8-4385-a30f-07f4a2656555" id="fbc0b7bd-1b42-4d76-8547-bf2bd6275506" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="SecIn"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe1_ret" outerDiameter="0.56" name="Pipe1" innerDiameter="0.3938" diameter="DN400" length="218.06" id="Pipe1">
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
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="3e1609b8-1f76-45cf-875f-94bcc0c2f005">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="c30173b3-0f21-4f03-9c02-6a2e2ddbf109" id="fb2f05de-43db-4f92-adb5-1207f760a63e" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="In"/>
        <port xsi:type="esdl:OutPort" id="e262a06a-d30d-4c47-b213-b7f3705f3ec8" connectedTo="fa2863f3-7745-4e51-b80e-b39277a196df" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_8b06" id="8b06c8d2-49a9-430b-b9d6-a5ba971e0ad8">
        <geometry xsi:type="esdl:Point" lat="52.040705429262196" lon="4.306209377957765"/>
        <port xsi:type="esdl:InPort" connectedTo="badc56bf-08ff-4734-af63-7dd8e50b0dcf" id="af0a176b-2f6d-4c27-a23b-c066052e0495" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="In"/>
        <port xsi:type="esdl:OutPort" id="c30173b3-0f21-4f03-9c02-6a2e2ddbf109" connectedTo="fb2f05de-43db-4f92-adb5-1207f760a63e 37774942-a934-4ac5-b4c5-31f12d7ca44f" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe2_ret" outerDiameter="0.56" name="Pipe2" innerDiameter="0.3938" diameter="DN400" length="322.9" id="Pipe2">
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
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="409b4727-951b-401e-a84d-dc21f8ae40ae">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="c30173b3-0f21-4f03-9c02-6a2e2ddbf109" id="37774942-a934-4ac5-b4c5-31f12d7ca44f" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="In"/>
        <port xsi:type="esdl:OutPort" id="bc01948f-ebe5-407b-93cd-ac6044d382f3" connectedTo="df79731a-c974-4a51-b048-7f5a64de2f5c" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="Out"/>
      </asset>
      <asset xsi:type="esdl:GeothermalSource" power="6000000.0" name="GeothermalSource_4e5b" maxTemperature="70.0" id="4e5bef4c-0192-4275-9e6a-2d1ae59a3941">
        <geometry xsi:type="esdl:Point" lat="52.03592690466185" lon="4.306080476812526" CRS="WGS84"/>
        <dataSource xsi:type="esdl:DataSource" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution="" name="WarmingUp factsheet: Diepe geothermie (2500 m)"/>
        <costInformation xsi:type="esdl:CostInformation">
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="2.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MWh" id="6c4b9fa3-96e9-4784-a1e8-27cb5247bc9e" perMultiplier="MEGA" perUnit="WATTHOUR" unit="EURO"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="1360000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MW" id="a0321ad0-64f1-441b-bedb-d13f089ff3b7" perMultiplier="MEGA" perUnit="WATT" unit="EURO"/>
          </investmentCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="91000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MW" id="9d72bca2-a4b3-4e8b-ac4f-f7911f1b2c3b" perMultiplier="MEGA" perUnit="WATT" unit="EURO"/>
          </fixedMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="46b56fbb-b718-4933-8c96-5728804dc81e" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="543df5a0-ac63-4708-a1d3-ac09749aa931" physicalQuantity="COST" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="14632e13-9a41-45ec-8125-d8bff7c0c2a3" connectedTo="bf59c1bd-f9f2-40c3-b5cd-b4aeb7127483" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="8b9ef7db-d545-4a9f-938c-c9fa3f7c6a58" id="f09e1c35-7d0c-4d8a-ae33-ed8cd461e397" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="In"/>
      </asset>
      <asset xsi:type="esdl:GenericProducer" power="6000000.0" name="GenericProducer_4dfe" id="4dfef171-02b4-4ad7-ad67-75bf36c92423">
        <geometry xsi:type="esdl:Point" lat="52.0330748992019" lon="4.30783781758207" CRS="WGS84"/>
        <costInformation xsi:type="esdl:CostInformation" id="e86e46df-ea92-4f8f-9c5a-5587a1569df4">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="1e9ded33-463e-4927-8c1b-a889495378e1" value="3000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MWh" id="ec8c9da3-4275-4a57-8bf8-e52f86d4c0ee" perMultiplier="MEGA" physicalQuantity="COST" perUnit="WATTHOUR" unit="EURO"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="55bfdf02-2d05-4357-9ca4-351b81116419" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MW" id="2cc18b1d-7a7c-440e-9894-df19efd4fedc" perMultiplier="MEGA" physicalQuantity="COST" perUnit="WATT" unit="EURO"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="b7affceb-3249-42d0-9041-5933ad26e593" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="90eea8c8-a659-4b03-88bc-fe3fe037b449" physicalQuantity="COST" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="72ea5657-7cc8-4d5c-9667-38a7fe0b0643" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/MW" id="f4160eb1-7b18-43b9-9b91-180864073fb2" perMultiplier="MEGA" physicalQuantity="COST" perUnit="WATT" unit="EURO"/>
          </fixedOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:OutPort" id="49470edb-de9f-4e15-ae8e-f22416915e3b" connectedTo="f6284605-daa7-4f27-8e06-317344a19094" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="38b164c3-9c95-4f7e-b29f-416dbcfd2c11" id="3e41c106-c498-4d77-a5c8-d0856484570f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="In"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="14000000.0" name="HeatingDemand_1" id="4b650b45-9b1c-4d0c-9e6c-24357d296241">
        <geometry xsi:type="esdl:Point" lat="52.03778770180885" lon="4.3174495400080035" CRS="WGS84"/>
        <costInformation xsi:type="esdl:CostInformation" id="20f4ba36-8585-413a-a10b-9e74ea65a2d8">
          <installationCosts xsi:type="esdl:SingleValue" id="7c955dff-0dc0-4530-a629-275adaea007f" value="100000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" description="Cost in EUR" id="59be6706-c2c4-452c-9455-af73279cb9a5"/>
          </installationCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="fdf307cb-449b-48a9-9113-27dda4b491b8" id="f712c29a-d586-4016-81a2-dd5a1f489936" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="In"/>
        <port xsi:type="esdl:OutPort" id="67ccc3c0-c1f7-4bfc-b635-565c7949951f" connectedTo="31ea31da-facb-4d11-ba25-9908489a0655" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe3_ret" outerDiameter="0.8" name="Pipe3" innerDiameter="0.5958" diameter="DN600" length="338.69" id="Pipe3">
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
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="f7a00b8a-57c9-433c-93b9-7ee354cd100d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="31c32868-a829-4d58-8a55-d97ec2ae8361" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="08824a9e-e611-4d06-a533-54f75ccb56f5" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="14632e13-9a41-45ec-8125-d8bff7c0c2a3" id="bf59c1bd-f9f2-40c3-b5cd-b4aeb7127483" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="In"/>
        <port xsi:type="esdl:OutPort" id="b9082a47-899e-4b8a-ae8b-b4cb05b3da80" connectedTo="5710ec36-7159-41dc-afe2-fd09ae4bb66f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe4_ret" outerDiameter="0.8" name="Pipe4" innerDiameter="0.5958" diameter="DN600" length="476.35" id="Pipe4">
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
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="f7a00b8a-57c9-433c-93b9-7ee354cd100d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="31c32868-a829-4d58-8a55-d97ec2ae8361" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="08824a9e-e611-4d06-a533-54f75ccb56f5" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="d8381212-2d28-4446-a19c-d661aa3f371b" id="b7b1c1e9-2288-436f-971d-dfce9cd4c624" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="In"/>
        <port xsi:type="esdl:OutPort" id="fdf307cb-449b-48a9-9113-27dda4b491b8" connectedTo="f712c29a-d586-4016-81a2-dd5a1f489936" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4444" id="44447d60-2402-448a-9c35-afb00e6e3f08">
        <geometry xsi:type="esdl:Point" lat="52.03724647331762" lon="4.310541249504155"/>
        <port xsi:type="esdl:InPort" connectedTo="b9082a47-899e-4b8a-ae8b-b4cb05b3da80 65f4ff4c-ad4d-41ff-bad2-550db7a53f77 0b3e2946-0e21-4936-be7a-c00c5dc5e8b1" id="5710ec36-7159-41dc-afe2-fd09ae4bb66f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="In"/>
        <port xsi:type="esdl:OutPort" id="d8381212-2d28-4446-a19c-d661aa3f371b" connectedTo="b7b1c1e9-2288-436f-971d-dfce9cd4c624 22236a93-b4ac-43d4-9356-9af7c542d59f fae80294-b8ca-45d6-9052-ede20bd4cb45" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe5_ret" outerDiameter="0.8" name="Pipe5" innerDiameter="0.5958" diameter="DN600" length="730.5" id="Pipe5">
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
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="4ca1e9d2-744f-438c-a43a-a44c87c37595">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="31c32868-a829-4d58-8a55-d97ec2ae8361" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="08824a9e-e611-4d06-a533-54f75ccb56f5" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="49470edb-de9f-4e15-ae8e-f22416915e3b" id="f6284605-daa7-4f27-8e06-317344a19094" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="In"/>
        <port xsi:type="esdl:OutPort" id="65f4ff4c-ad4d-41ff-bad2-550db7a53f77" connectedTo="5710ec36-7159-41dc-afe2-fd09ae4bb66f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe6_ret" outerDiameter="0.8" name="Pipe6" innerDiameter="0.5958" diameter="DN600" length="257.0" id="Pipe6">
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
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="93b4eab0-53f8-4103-b6f3-c4aa6b2d1bde">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="31c32868-a829-4d58-8a55-d97ec2ae8361" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="08824a9e-e611-4d06-a533-54f75ccb56f5" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="41ab3b61-8ef9-4be6-9d0e-ea49e016154b" id="b1f7aa8b-a7e5-4dfd-bb2c-32350a2afe54" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="In"/>
        <port xsi:type="esdl:OutPort" id="0b3e2946-0e21-4936-be7a-c00c5dc5e8b1" connectedTo="5710ec36-7159-41dc-afe2-fd09ae4bb66f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe7_ret" outerDiameter="0.8" name="Pipe7" innerDiameter="0.5958" diameter="DN600" length="319.5" id="Pipe7">
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
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="6d2cd47c-5d2c-4319-8176-ba7aad48a187">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="31c32868-a829-4d58-8a55-d97ec2ae8361" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="08824a9e-e611-4d06-a533-54f75ccb56f5" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="d8381212-2d28-4446-a19c-d661aa3f371b" id="22236a93-b4ac-43d4-9356-9af7c542d59f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="In"/>
        <port xsi:type="esdl:OutPort" id="81fa0613-5da6-497c-a375-c16de6ae887f" connectedTo="ca8fec66-c5e4-410c-91c3-39d36720f8af" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe8_ret" outerDiameter="0.8" name="Pipe8" innerDiameter="0.5958" diameter="DN600" length="245.2" id="Pipe8">
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
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="a4a624eb-7c9d-4c7f-9ffe-867afab59433">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="31c32868-a829-4d58-8a55-d97ec2ae8361" value="5953.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="08824a9e-e611-4d06-a533-54f75ccb56f5" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="861d1cf7-3107-4fd4-8172-6377893f38fc" id="0d14b582-a17a-4db0-aba6-c682b26015df" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="In"/>
        <port xsi:type="esdl:OutPort" id="badc56bf-08ff-4734-af63-7dd8e50b0dcf" connectedTo="af0a176b-2f6d-4c27-a23b-c066052e0495" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_8b06_ret" id="26a95f45-960b-4731-97b5-71f558e2371c">
        <geometry xsi:type="esdl:Point" lat="52.040795429352194" lon="4.30558249861894" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="218b42cd-a652-4e5d-a5db-d71ee44b51d7 9d6e4005-88c5-43f2-bed5-4d7e3ce88295" id="55c06f28-a3d3-468b-9d79-b3c1402df635" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="ret_port"/>
        <port xsi:type="esdl:OutPort" id="03c9cba1-0d12-4434-911a-8b3813126b03" connectedTo="7ba8c24d-9506-4d1c-840e-47448dd354c4" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="ret_port"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4444_ret" id="360ebdae-28f3-4bab-9c02-c6f843f1ead3">
        <geometry xsi:type="esdl:Point" lat="52.03733647340762" lon="4.309903730049743" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="4f487e75-ce7c-4c87-9101-38e73be55bdb" connectedTo="58584c12-19ee-4efd-a6f7-0b6fa4df4bad f5e323c1-9378-4649-882d-23695b24f210 13e6422e-533f-4204-95f7-6fc24bf8e7af" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="ret_port"/>
        <port xsi:type="esdl:InPort" connectedTo="69cec8da-8b4a-4aeb-b722-30f4f6cfd541 f9304493-a1b6-4193-8ed5-248cf4c80a60 160b6ed1-51e4-4ea7-9f7c-de978f90b9fa" id="76103626-fa5a-4884-9a96-67bf0b6fe212" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="ret_port"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe1" outerDiameter="0.56" name="Pipe1_ret" innerDiameter="0.3938" diameter="DN400" length="218.06" id="Pipe1_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.042575564861245" lon="4.304254085651542" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.040795217826734" lon="4.305580407733295" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.040795429352194" lon="4.30558249861894" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="911dfd6e-f894-432e-9238-ca6b8135f71a" id="c68c3322-f4df-47c5-ae67-81c0fa56eb6d" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="218b42cd-a652-4e5d-a5db-d71ee44b51d7" connectedTo="55c06f28-a3d3-468b-9d79-b3c1402df635" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe2" outerDiameter="0.56" name="Pipe2_ret" innerDiameter="0.3938" diameter="DN400" length="322.9" id="Pipe2_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.039647543839635" lon="4.309915336755912" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.040795429352194" lon="4.30558249861894" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="9ffb073f-83df-42f3-b65a-191b0a40d066" id="a2fbbd83-65c9-4282-b9db-1de2d306cbc4" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="9d6e4005-88c5-43f2-bed5-4d7e3ce88295" connectedTo="55c06f28-a3d3-468b-9d79-b3c1402df635" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe3" outerDiameter="0.8" name="Pipe3_ret" innerDiameter="0.5958" diameter="DN600" length="338.69" id="Pipe3_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.03733647340762" lon="4.309903730049743" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.03732327263086" lon="4.309882234417831" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.03601690475185" lon="4.305438800381441" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="4f487e75-ce7c-4c87-9101-38e73be55bdb" id="58584c12-19ee-4efd-a6f7-0b6fa4df4bad" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="8b9ef7db-d545-4a9f-938c-c9fa3f7c6a58" connectedTo="f09e1c35-7d0c-4d8a-ae33-ed8cd461e397" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe4" outerDiameter="0.8" name="Pipe4_ret" innerDiameter="0.5958" diameter="DN600" length="476.35" id="Pipe4_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.03787770189885" lon="4.316813709707303" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.03733647340762" lon="4.309903730049743" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="67ccc3c0-c1f7-4bfc-b635-565c7949951f" id="31ea31da-facb-4d11-ba25-9908489a0655" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="69cec8da-8b4a-4aeb-b722-30f4f6cfd541" connectedTo="76103626-fa5a-4884-9a96-67bf0b6fe212" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe5" outerDiameter="0.8" name="Pipe5_ret" innerDiameter="0.5958" diameter="DN600" length="730.5" id="Pipe5_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.03733647340762" lon="4.309903730049743" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.034405805341216" lon="4.312190034133983" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.0331648992919" lon="4.307186964841335" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="4f487e75-ce7c-4c87-9101-38e73be55bdb" id="f5e323c1-9378-4649-882d-23695b24f210" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="38b164c3-9c95-4f7e-b29f-416dbcfd2c11" connectedTo="3e41c106-c498-4d77-a5c8-d0856484570f" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe6" outerDiameter="0.8" name="Pipe6_ret" innerDiameter="0.5958" diameter="DN600" length="257.0" id="Pipe6_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.03733647340762" lon="4.309903730049743" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.039647543839635" lon="4.309915336755912" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="4f487e75-ce7c-4c87-9101-38e73be55bdb" id="13e6422e-533f-4204-95f7-6fc24bf8e7af" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="78da6979-3754-43e0-920e-4cd0130ebfbc" connectedTo="c80765ca-c4c2-440d-b119-b648c73e7ed0" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe7" outerDiameter="0.8" name="Pipe7_ret" innerDiameter="0.5958" diameter="DN600" length="319.5" id="Pipe7_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.038591554986866" lon="4.305706581151468" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.03733647340762" lon="4.309903730049743" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="958d560d-15b9-4e68-9ac5-e8ee573ea409" id="ee159cb7-91b2-4cfc-96bf-b63cc0087819" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="f9304493-a1b6-4193-8ed5-248cf4c80a60" connectedTo="76103626-fa5a-4884-9a96-67bf0b6fe212" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe8" outerDiameter="0.8" name="Pipe8_ret" innerDiameter="0.5958" diameter="DN600" length="245.2" id="Pipe8_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.040795429352194" lon="4.30558249861894" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.038591554986866" lon="4.305706581151468" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="03c9cba1-0d12-4434-911a-8b3813126b03" id="7ba8c24d-9506-4d1c-840e-47448dd354c4" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="863dbd58-40f8-4385-a30f-07f4a2656555" connectedTo="fbc0b7bd-1b42-4d76-8547-bf2bd6275506" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" name="Out_ret"/>
      </asset>
      <asset xsi:type="esdl:GenericConsumer" power="1400000.0" name="GenericConsumer_ccb7" id="ccb7e695-0827-4aa1-a5fb-75fb1971914b">
        <geometry xsi:type="esdl:Point" lat="52.03667987086042" lon="4.3175625801086435" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="14b570e7-7d2c-4753-9ccb-b920599b50dd" id="8e5544d6-333b-4654-ab58-6e297401e2ea" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="In"/>
        <port xsi:type="esdl:OutPort" id="3be86022-67f6-4294-a31f-d7cc10f69be5" connectedTo="00add66c-507b-4531-a3e0-cd7f9eac0b78" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_3dab" length="484.4" diameter="DN400" innerDiameter="0.3938" id="3dabdeb0-2b71-4257-93f3-97c4ad7f027a">
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
          <point xsi:type="esdl:Point" lat="52.03724647331762" lon="4.310541249504155"/>
          <point xsi:type="esdl:Point" lat="52.03667987086042" lon="4.3175625801086435"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="b6f359ee-8c9a-4f04-8a31-76a3776f4163">
          <investmentCosts xsi:type="esdl:SingleValue" value="2840.6" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="d8381212-2d28-4446-a19c-d661aa3f371b" id="fae80294-b8ca-45d6-9052-ede20bd4cb45" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="In"/>
        <port xsi:type="esdl:OutPort" id="14b570e7-7d2c-4753-9ccb-b920599b50dd" connectedTo="8e5544d6-333b-4654-ab58-6e297401e2ea" carrier="f518c023-f81b-440f-93b2-a8cde23eb059" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_cc69" length="528.9" diameter="DN400" innerDiameter="0.3938" id="cc691622-14c0-4246-bc4a-91e36325f7f0">
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
          <point xsi:type="esdl:Point" lat="52.03667987086042" lon="4.3175625801086435"/>
          <point xsi:type="esdl:Point" lat="52.03733647340762" lon="4.309903730049743"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="bf6a0444-460d-4f66-9abc-c3051394d987">
          <investmentCosts xsi:type="esdl:SingleValue" value="2840.6" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="3be86022-67f6-4294-a31f-d7cc10f69be5" id="00add66c-507b-4531-a3e0-cd7f9eac0b78" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="160b6ed1-51e4-4ea7-9f7c-de978f90b9fa" connectedTo="76103626-fa5a-4884-9a96-67bf0b6fe212" carrier="f518c023-f81b-440f-93b2-a8cde23eb059_ret" name="Out"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="bf061ba2-40bb-444e-bfdd-85dd968370be">
    <carriers xsi:type="esdl:Carriers" id="61628030-507a-4d4d-a96e-e756db92b19a">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="80.0" name="Primary" id="f518c023-f81b-440f-93b2-a8cde23eb059"/>
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="ATES" id="c41e7703-dee0-4dc7-9166-a99838591a90"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" name="Primary_ret" id="f518c023-f81b-440f-93b2-a8cde23eb059_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="30.0" name="ATES_ret" id="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="d3feabee-2e43-4e9e-ba77-58a90c9b9939">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Power in MW" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" physicalQuantity="POWER" multiplier="MEGA" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
</esdl:EnergySystem>
