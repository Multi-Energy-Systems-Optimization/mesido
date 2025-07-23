<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="elect_tree" description="" id="cc3b855b-0403-4df8-a84f-8ea6fd25420e" esdlVersion="v250501" version="55">
  <instance xsi:type="esdl:Instance" id="f2e9533d-015d-445f-8c08-cd035d238eee" name="Untitled instance">
    <area xsi:type="esdl:Area" id="74ab5996-6a79-4cd6-9fa8-4f1a498722f5" name="Untitled area">
      <asset xsi:type="esdl:HeatingDemand" id="e820e953-45db-410e-b57b-6c0cfd187b79" name="HeatingDemand_1" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.51515704274855" lon="3.9904332022486737"/>
        <port xsi:type="esdl:InPort" id="6baaa615-3559-4685-aafc-1bf31b3118fa" name="In" connectedTo="37441b6d-d279-4155-af28-430c140bb88f" carrier="b73c23fb-3b07-47b3-9c04-47dabc1116a3"/>
        <port xsi:type="esdl:OutPort" id="88635197-9a87-4471-bded-374ba2d75b22" name="Out" connectedTo="42355913-2d28-4178-9726-0f163f94b724" carrier="1d5f7417-03b1-4467-9d61-e11e36dcaf43"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="677dc2e8-802a-4883-87d7-0affcf02c480" name="Joint_677d">
        <geometry xsi:type="esdl:Point" lat="51.51498516376332" lon="3.98991159342498" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="79424184-fe22-430e-9989-53c0f05d8084" name="In" connectedTo="81a58665-2ba2-4bf6-a32f-0c7198328508" carrier="b73c23fb-3b07-47b3-9c04-47dabc1116a3"/>
        <port xsi:type="esdl:OutPort" id="37441b6d-d279-4155-af28-430c140bb88f" name="Out" connectedTo="6baaa615-3559-4685-aafc-1bf31b3118fa" carrier="b73c23fb-3b07-47b3-9c04-47dabc1116a3"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="8a4e97e4-b609-47f0-b949-d038967ce34e" name="Joint_8a4e">
        <geometry xsi:type="esdl:Point" lat="51.51484495864813" lon="3.9905393343219635" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="42355913-2d28-4178-9726-0f163f94b724" name="In" connectedTo="88635197-9a87-4471-bded-374ba2d75b22" carrier="1d5f7417-03b1-4467-9d61-e11e36dcaf43"/>
        <port xsi:type="esdl:OutPort" id="8f52d2ef-2cbb-4226-a99b-67ccb2c8969d" name="Out" connectedTo="95669730-c046-4dea-955a-74cca74324a6" carrier="1d5f7417-03b1-4467-9d61-e11e36dcaf43"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="52b8de9c-b116-45aa-bc6a-ec35ec048e69" name="ElectricityProducer" power="50000000.0">
        <geometry xsi:type="esdl:Point" lat="51.512882074317375" lon="3.9887687017231026" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="e24aeb1a-b05d-49f0-a8f5-91bee021adff" name="OutPort" connectedTo="8a5750d5-3d76-4c4d-bae2-9c62bcb44c35" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
        <costInformation xsi:type="esdl:CostInformation" id="7ea0e861-befe-44d2-be72-efe589173544"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="aa00fac0-ba7f-4f51-b72b-08cad2fabade" name="HeatPump_1" power="10000000.0" COP="4.0" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lat="51.514578175132144" lon="3.9903623886668753" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="044d6e40-a990-4dc2-9820-bacae498b366" name="InPort" connectedTo="25b003b2-4031-472e-8a20-40a40f7960db" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
        <port xsi:type="esdl:InPort" id="95669730-c046-4dea-955a-74cca74324a6" name="InPort_sec" connectedTo="8f52d2ef-2cbb-4226-a99b-67ccb2c8969d" carrier="1d5f7417-03b1-4467-9d61-e11e36dcaf43"/>
        <port xsi:type="esdl:OutPort" id="81a58665-2ba2-4bf6-a32f-0c7198328508" name="OutPort_sec" connectedTo="79424184-fe22-430e-9989-53c0f05d8084" carrier="b73c23fb-3b07-47b3-9c04-47dabc1116a3"/>
        <costInformation xsi:type="esdl:CostInformation" id="a4ca9a5b-170d-4d1b-8437-59d1e556ba97">
          <investmentCosts xsi:type="esdl:SingleValue" id="73cbc745-ae7a-4caa-bff3-07a56c9a78eb" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="9ed7f98f-9fbe-415a-a35c-4e023cb23f02" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="97af1581-85fc-4c0d-a1e2-dccc65ba95af" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="20eb4103-c149-4041-8b1a-e6c5db37c1ee" unit="EURO"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="e29680ac-9ada-478a-bdec-585975001153" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="366a09c3-a30c-4d94-9faf-f98dab2f03e2" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="6c7b50e2-8e58-4bf3-ac78-81fc04f36d9e" name="HeatingDemand_2" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.51654851372736" lon="3.9911486308103066"/>
        <port xsi:type="esdl:InPort" id="4c23860c-d861-476b-80ed-2953b71c2990" name="In" connectedTo="cc20ce99-0216-488d-b401-99a6155e0e75" carrier="b73c23fb-3b07-47b3-9c04-47dabc1116a3"/>
        <port xsi:type="esdl:OutPort" id="a7280fbc-a9fe-4cdc-aee6-7a9aa77eca61" name="Out" connectedTo="52906d2f-6d35-4ef0-a152-fe87a7b85b3c" carrier="1d5f7417-03b1-4467-9d61-e11e36dcaf43"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="5c4ca39a-8ebc-40a7-8040-102ec34408fc" name="Bus_1" capacity="10000000.0">
        <geometry xsi:type="esdl:Point" lat="51.513841079206216" lon="3.9895178604003965" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="8669f620-cacd-40cd-8f94-4869c17d8f32" name="In" connectedTo="1926c995-82d2-4454-b0db-f88ae2c3c743" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
        <port xsi:type="esdl:OutPort" id="7ad98887-687e-4287-88ed-9c789b816451" name="Out" connectedTo="4b1a6427-1e1e-4426-8228-102152167c33 eb0dc0d6-a06e-44f0-be72-929d41b6846c" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="2417971c-82e1-4c29-a420-40dcd3a0aa3e" name="ElectricityCable_prod" length="118.6" capacity="10000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.512882074317375" lon="3.9887687017231026"/>
          <point xsi:type="esdl:Point" lat="51.513841079206216" lon="3.9895178604003965"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8a5750d5-3d76-4c4d-bae2-9c62bcb44c35" name="In" connectedTo="e24aeb1a-b05d-49f0-a8f5-91bee021adff" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
        <port xsi:type="esdl:OutPort" id="1926c995-82d2-4454-b0db-f88ae2c3c743" name="Out" connectedTo="8669f620-cacd-40cd-8f94-4869c17d8f32" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
        <costInformation xsi:type="esdl:CostInformation" id="ae4add1d-38f9-4c42-80df-91948f559da2">
          <investmentCosts xsi:type="esdl:SingleValue" id="5cdcc0ac-acea-4f24-9b42-fca8d518fc09" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/m" id="457f73a4-92ab-4571-a7ae-1aedfcdff1b9" unit="EURO" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="e35b872e-d6bc-4104-bef5-63bbda49869f" name="ElectricityCable_dem_1" length="100.7" capacity="10000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.513841079206216" lon="3.9895178604003965"/>
          <point xsi:type="esdl:Point" lat="51.514578175132144" lon="3.9903623886668753"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4b1a6427-1e1e-4426-8228-102152167c33" name="In" connectedTo="7ad98887-687e-4287-88ed-9c789b816451" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
        <port xsi:type="esdl:OutPort" id="25b003b2-4031-472e-8a20-40a40f7960db" name="Out" connectedTo="044d6e40-a990-4dc2-9820-bacae498b366" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
        <costInformation xsi:type="esdl:CostInformation" id="46e0ffd6-29c7-4ece-a029-87e6da7b44a5">
          <investmentCosts xsi:type="esdl:SingleValue" id="61cf2ee6-6a8b-408e-8eb8-b8d3c597d6f1" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/m" id="8d9d9904-88dc-428b-b8e7-0ae96c120fbc" unit="EURO" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="0cac8242-2094-43f7-9819-85b0cac2fabc" name="ElectricityCable_dem_2" length="335.4" capacity="10000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.513841079206216" lon="3.9895178604003965"/>
          <point xsi:type="esdl:Point" lat="51.513685047322674" lon="3.9901215449743264"/>
          <point xsi:type="esdl:Point" lat="51.514524303348715" lon="3.99110831847168"/>
          <point xsi:type="esdl:Point" lat="51.51608732138533" lon="3.9913333325576836"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="eb0dc0d6-a06e-44f0-be72-929d41b6846c" name="In" connectedTo="7ad98887-687e-4287-88ed-9c789b816451" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
        <port xsi:type="esdl:OutPort" id="a653273e-ef74-41c0-9bdc-3a4c8255ec37" name="Out" connectedTo="ef6e1dbe-e00f-4263-9579-b5ff694acb77" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
        <costInformation xsi:type="esdl:CostInformation" id="83761a9c-8cd4-48f8-8c89-2fff48072de1">
          <investmentCosts xsi:type="esdl:SingleValue" id="fbe1ec97-9b35-42c2-9610-70056a08e822" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/m" id="27ab0e14-fc32-4165-89b4-4970723d0f67" unit="EURO" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="5d2aa15d-be0d-4a3c-b62a-53e410577449" name="HeatPump_2" power="10000000.0" state="OPTIONAL" COP="4.0">
        <geometry xsi:type="esdl:Point" lat="51.51610553337001" lon="3.991341864275895"/>
        <port xsi:type="esdl:InPort" id="db754d23-ee44-424e-b38c-bc63400bee41" name="SecIn" connectedTo="da9d1d6f-6f62-4b43-8e22-24a681355c68" carrier="1d5f7417-03b1-4467-9d61-e11e36dcaf43"/>
        <port xsi:type="esdl:OutPort" id="018a9a76-16ea-4e0d-8d10-af3222fa3cbb" name="SecOut" connectedTo="37fe23e9-1282-4f27-a8cf-04c1e5d67f54" carrier="b73c23fb-3b07-47b3-9c04-47dabc1116a3"/>
        <port xsi:type="esdl:InPort" id="ef6e1dbe-e00f-4263-9579-b5ff694acb77" name="InPort" connectedTo="a653273e-ef74-41c0-9bdc-3a4c8255ec37" carrier="0f43ef33-aca7-473a-88b2-9a10ad995e02"/>
        <costInformation xsi:type="esdl:CostInformation" id="63c3a7b3-c63d-498f-b7e9-e10480458485">
          <investmentCosts xsi:type="esdl:SingleValue" id="a1811290-8c95-46f8-a450-cd3dba0a988b" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="6e0c66a0-e896-47e4-93e4-f013ab28f11d" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="1ff7533c-5ab5-47cf-bf15-13c7d2bc2d4d" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="8743ee3a-5373-4df8-b7b8-391751ec5e9c" unit="EURO"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="569ed1e4-5246-4eae-b3ea-bd4540982a34" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="fb05c465-b65c-4baa-b3a6-e27853715bdd" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="f93adf87-4a51-42ea-9a1d-4576fd7ee040" name="Joint_f93a">
        <geometry xsi:type="esdl:Point" lat="51.51636776290656" lon="3.9907036488461505" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="37fe23e9-1282-4f27-a8cf-04c1e5d67f54" name="In" connectedTo="018a9a76-16ea-4e0d-8d10-af3222fa3cbb" carrier="b73c23fb-3b07-47b3-9c04-47dabc1116a3"/>
        <port xsi:type="esdl:OutPort" id="cc20ce99-0216-488d-b401-99a6155e0e75" name="Out" connectedTo="4c23860c-d861-476b-80ed-2953b71c2990" carrier="b73c23fb-3b07-47b3-9c04-47dabc1116a3"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="191ab9b5-db7a-4f47-a4a7-352a69b506c9" name="Joint_191a">
        <geometry xsi:type="esdl:Point" lat="51.51631937234245" lon="3.9913740112764367" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="52906d2f-6d35-4ef0-a152-fe87a7b85b3c" name="In" connectedTo="a7280fbc-a9fe-4cdc-aee6-7a9aa77eca61" carrier="1d5f7417-03b1-4467-9d61-e11e36dcaf43"/>
        <port xsi:type="esdl:OutPort" id="da9d1d6f-6f62-4b43-8e22-24a681355c68" name="Out" connectedTo="db754d23-ee44-424e-b38c-bc63400bee41" carrier="1d5f7417-03b1-4467-9d61-e11e36dcaf43"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="1ea9d767-79eb-478b-ac74-ef592b9d68d4">
    <carriers xsi:type="esdl:Carriers" id="496305e0-726d-449e-8969-ec6496a5918e">
      <carrier xsi:type="esdl:ElectricityCommodity" id="0f43ef33-aca7-473a-88b2-9a10ad995e02" name="Elec" voltage="230.0"/>
      <carrier xsi:type="esdl:GasCommodity" id="1a8f4b2c-10cb-4a42-9b2e-2217b619c5aa" name="Gas" pressure="5.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="b73c23fb-3b07-47b3-9c04-47dabc1116a3" name="Heat_sup" supplyTemperature="80.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="1d5f7417-03b1-4467-9d61-e11e36dcaf43" name="Heat_ret" returnTemperature="40.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
