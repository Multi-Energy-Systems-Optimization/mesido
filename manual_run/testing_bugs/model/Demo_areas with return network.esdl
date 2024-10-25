<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="483e3ff5-7ff2-4b50-b7a3-c66cffe49703_with_return_network" description="" esdlVersion="v2303" name="Demo_areas with return network" version="15">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="587aaec6-59e1-42a3-9d05-fda822e823c7">
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="013d8f95-ae1c-448b-83eb-136a19150707">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" unit="WATT" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA"/>
    </quantityAndUnits>
    <carriers xsi:type="esdl:Carriers" id="6072772c-ea2b-4161-a0f6-cdaf0319f3c2">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="90.0" name="Primary" id="9e201a90-71c0-45bc-a683-6ae7e68b67d1"/>
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="Secondary" id="e32b730d-4c75-4610-8ef7-dfcf461cc069"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="50.0" name="Primary_ret" id="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" name="Secondary_ret" id="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="411b572c-f96b-49fa-8a0a-389705cbf58d" name="Untitled instance">
    <area xsi:type="esdl:Area" id="1e502f41-ce24-4609-b518-cd76a8aafb59" name="Delft">
      <asset xsi:type="esdl:ResidualHeatSource" name="ResidualHeatSource_ec0a" state="OPTIONAL" power="50000000.0" id="ec0a2222-d6fe-4cb6-aff0-237e08174fa8">
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="24d83ef4-39c1-4b43-b541-889d70c7d996" id="13305198-7cb2-4432-be42-bb9397acda0e"/>
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="In" connectedTo="62bf94ae-b3aa-4084-95ff-b052fe182df1" id="8d27a37a-082e-49af-923d-b878fd19cf3f"/>
        <geometry xsi:type="esdl:Point" lon="4.364640712738038" CRS="WGS84" lat="51.994420442979276"/>
        <costInformation xsi:type="esdl:CostInformation" id="df01f903-c501-4fb3-9216-744e490d92cb">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="6895c9ee-eb7d-4f30-86cc-483210f055fd" value="20.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" unit="EURO" id="5b5536c9-b0f3-4d81-9ce4-8325a1170aaa" description="Cost in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="e29c3cbe-f718-4a84-8ce3-1aa6bfe35d34" value="200000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="b02b49f1-fb38-4154-989e-00e2531ca68c" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="2b3593ea-6359-4cc1-b099-53a6d3af7ec5" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" description="Cost in EUR" id="eb86cc68-4c3b-4767-ba2d-2fda540637d2"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="8c5955a8-ef9b-4fe9-9f22-4c1d2bc32385" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="6b1ef088-0a9f-4f5b-af72-75d9d412f0f3" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
          </fixedOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" name="ResidualHeatSource_54b1" state="OPTIONAL" power="50000000.0" id="54b13f38-8835-4e75-8acc-780a14fa8dbd">
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="a17c3c44-2296-47e7-b16e-e72593d46cc5" id="010265a0-43b7-44dc-bf06-72519dac9ee5"/>
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="In" connectedTo="3ca327dc-8876-4b78-be0c-206a0eafe345" id="2b4fdbd3-6904-4e60-b08e-9bcf6448e265"/>
        <geometry xsi:type="esdl:Point" lon="4.370477199554444" CRS="WGS84" lat="52.004328577925094"/>
        <costInformation xsi:type="esdl:CostInformation" id="ed861601-3428-4381-88cb-9a1452aed93e">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="08aab920-91f7-4f75-9fc7-b46c0c69c69d" value="40.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" unit="EURO" id="b5b04d25-41a0-4f14-abb5-bf8d98c7f0dd" description="Cost in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="0d14d98e-acc3-473b-aca6-76e85fa0922f" value="500000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="2a9d1538-b945-4b1a-b951-e71e38f8c9ef" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="bad6f69c-e77b-497e-b0be-83df5b7680df" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" description="Cost in EUR" id="8abbad22-0502-4c21-bbf9-7a7c0baa4341"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="26ce5018-fb93-4ed0-ba48-c04470a0cf78" value="120000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="6dc663e0-9f60-49e3-aa91-eb0e05a338fd" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
          </fixedOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" length="843.42" name="Pipe1" innerDiameter="0.3938" state="OPTIONAL" related="Pipe1_ret" outerDiameter="0.56" id="Pipe1" diameter="DN400">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="010265a0-43b7-44dc-bf06-72519dac9ee5" id="a17c3c44-2296-47e7-b16e-e72593d46cc5"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="e78c77ed-4744-499e-a6cf-dabb06f5bfac" id="b9abe6ee-3285-4d34-b602-82dc0650ef14"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.370477199554444" lat="52.004328577925094"/>
          <point xsi:type="esdl:Point" lon="4.370799064636231" lat="52.00332465343612"/>
          <point xsi:type="esdl:Point" lon="4.366292953491212" lat="52.0026509546404"/>
          <point xsi:type="esdl:Point" lon="4.366314411163331" lat="52.00084116453207"/>
          <point xsi:type="esdl:Point" lon="4.367365837097169" lat="51.99905772313822"/>
        </geometry>
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
        <costInformation xsi:type="esdl:CostInformation" id="80dfa3cf-155f-41de-93c4-fb8acafe2fae">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="9169bd50-197f-4d6b-aaac-b383a59c815d" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_b3e4" id="b3e415da-242d-4003-8a26-447529a7a9e4">
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="b9abe6ee-3285-4d34-b602-82dc0650ef14" id="e78c77ed-4744-499e-a6cf-dabb06f5bfac"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="86838250-3430-4918-9806-e3b5dc400055 a5ba6248-a54b-4430-b873-158497eb0876" id="e585e343-cb4d-45c4-bc16-0a7e862f8a75"/>
        <geometry xsi:type="esdl:Point" lon="4.367365837097169" lat="51.99905772313822"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="588.97" name="Pipe2" innerDiameter="0.3938" related="Pipe2_ret" outerDiameter="0.56" id="Pipe2" diameter="DN400">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="e585e343-cb4d-45c4-bc16-0a7e862f8a75" id="a5ba6248-a54b-4430-b873-158497eb0876"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="4f7746c7-53a6-431b-bfaf-04ae200b712c" id="fee183b9-5c67-48d1-9994-470733a41fb9"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.367365837097169" lat="51.99905772313822"/>
          <point xsi:type="esdl:Point" lon="4.370262622833253" lat="51.99407031543172"/>
        </geometry>
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
        <costInformation xsi:type="esdl:CostInformation" id="80dfa3cf-155f-41de-93c4-fb8acafe2fae">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="9169bd50-197f-4d6b-aaac-b383a59c815d" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" length="734.05" name="Pipe3" innerDiameter="0.3938" state="OPTIONAL" related="Pipe3_ret" outerDiameter="0.56" id="Pipe3" diameter="DN400">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="ae7152ae-f443-4478-97ae-2a4e4abccd63" id="702894a7-7da7-42dc-99c9-a86352a0d42b"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="d0a39b01-2cc1-4869-a853-a2a1e65c9c1e" id="a897a7ca-5b60-4552-80aa-8333587eca41"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.370262622833253" lat="51.99407031543172"/>
          <point xsi:type="esdl:Point" lon="4.371185302734376" lat="51.99245176571451"/>
          <point xsi:type="esdl:Point" lon="4.3740177154541025" lat="51.989386270407564"/>
          <point xsi:type="esdl:Point" lon="4.375991821289063" lat="51.989994100812105"/>
        </geometry>
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
        <costInformation xsi:type="esdl:CostInformation" id="80dfa3cf-155f-41de-93c4-fb8acafe2fae">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="9169bd50-197f-4d6b-aaac-b383a59c815d" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_21a0" id="21a04f29-2a92-4e5f-8160-072fc4db05fc">
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="fee183b9-5c67-48d1-9994-470733a41fb9 5e7c7a5b-c57a-4551-89c8-174c4db754e7" id="4f7746c7-53a6-431b-bfaf-04ae200b712c"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="702894a7-7da7-42dc-99c9-a86352a0d42b 0bc8b306-7783-459f-bdbf-cb4bfb4ca200" id="ae7152ae-f443-4478-97ae-2a4e4abccd63"/>
        <geometry xsi:type="esdl:Point" lon="4.370262622833253" lat="51.99407031543172"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="314.5" name="Pipe4" innerDiameter="0.3127" related="Pipe4_ret" outerDiameter="0.45" id="Pipe4" diameter="DN300">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="ae7152ae-f443-4478-97ae-2a4e4abccd63" id="0bc8b306-7783-459f-bdbf-cb4bfb4ca200"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="6d7f2662-daac-4f09-ad23-94069b7429b0" id="0dfd35e1-3273-452b-a8e9-0edc558ad204"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.370262622833253" lat="51.99407031543172"/>
          <point xsi:type="esdl:Point" lon="4.374768733978272" lat="51.99461862717003"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <costInformation xsi:type="esdl:CostInformation" id="8d87e825-fcc5-4db9-9f69-85e9bea755a2">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" length="386.9" name="Pipe5" innerDiameter="0.3127" state="OPTIONAL" related="Pipe5_ret" outerDiameter="0.45" id="Pipe5" diameter="DN300">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="13305198-7cb2-4432-be42-bb9397acda0e" id="24d83ef4-39c1-4b43-b541-889d70c7d996"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="4f7746c7-53a6-431b-bfaf-04ae200b712c" id="5e7c7a5b-c57a-4551-89c8-174c4db754e7"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.364640712738038" lat="51.994420442979276"/>
          <point xsi:type="esdl:Point" lon="4.370262622833253" lat="51.99407031543172"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <costInformation xsi:type="esdl:CostInformation" id="97fd42ee-48c3-4fed-baa8-57a1a0205861">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_b3e4_ret" id="6df97adc-beff-4925-a7a1-394d7013af7c">
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="ret_port" connectedTo="02ecbc14-ff04-4e0f-86b0-346f229b7fac" id="78ac7bde-62b4-4587-8a3a-6893966fbd79"/>
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="ret_port" connectedTo="935f3cbd-95b4-4d81-be5f-ca68315c9f4f 2ece3d04-caba-4f59-b658-b4053a04d550" id="a455fc93-a668-42f6-a014-70f482fb3efc"/>
        <geometry xsi:type="esdl:Point" lon="4.366580576596763" CRS="WGS84" lat="51.99914772322822"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_21a0_ret" id="0b02007d-8de3-4d3b-9501-f9d572241fec">
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="ret_port" connectedTo="f30e1d44-20de-4860-832c-9cf230dcb4f3 9871687a-b3a8-43a8-9d7b-c039ce331ed6" id="b91359da-6f9e-454c-bc50-59067a8a13b2"/>
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="ret_port" connectedTo="9fbee64a-535c-49b2-9022-a6e61361073d f1ea42b8-db7d-44e4-b451-654b8394cba2" id="ebb8ee4a-4d65-41ea-8899-cc7f95491bb0"/>
        <geometry xsi:type="esdl:Point" lon="4.369452758355907" CRS="WGS84" lat="51.99416031552172"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="843.42" name="Pipe1_ret" innerDiameter="0.3938" state="OPTIONAL" related="Pipe1" outerDiameter="0.56" id="Pipe1_ret" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="In_ret" connectedTo="78ac7bde-62b4-4587-8a3a-6893966fbd79" id="02ecbc14-ff04-4e0f-86b0-346f229b7fac"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out_ret" connectedTo="2b4fdbd3-6904-4e60-b08e-9bcf6448e265" id="3ca327dc-8876-4b78-be0c-206a0eafe345"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.366580576596763" CRS="WGS84" lat="51.99914772322822"/>
          <point xsi:type="esdl:Point" lon="4.36553758519132" CRS="WGS84" lat="52.00093116462207"/>
          <point xsi:type="esdl:Point" lon="4.365524500958683" CRS="WGS84" lat="52.0027409547304"/>
          <point xsi:type="esdl:Point" lon="4.3700336825792006" CRS="WGS84" lat="52.003414653526114"/>
          <point xsi:type="esdl:Point" lon="4.369716347128475" CRS="WGS84" lat="52.00441857801509"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="588.97" name="Pipe2_ret" innerDiameter="0.3938" related="Pipe2" outerDiameter="0.56" id="Pipe2_ret" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="In_ret" connectedTo="b91359da-6f9e-454c-bc50-59067a8a13b2" id="f30e1d44-20de-4860-832c-9cf230dcb4f3"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out_ret" connectedTo="a455fc93-a668-42f6-a014-70f482fb3efc" id="2ece3d04-caba-4f59-b658-b4053a04d550"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.369452758355907" CRS="WGS84" lat="51.99416031552172"/>
          <point xsi:type="esdl:Point" lon="4.366580576596763" CRS="WGS84" lat="51.99914772322822"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="734.05" name="Pipe3_ret" innerDiameter="0.3938" state="OPTIONAL" related="Pipe3" outerDiameter="0.56" id="Pipe3_ret" diameter="DN400">
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="In_ret" connectedTo="b3c6c264-b0e9-47f7-88ff-d18ed934ef3e" id="cae6d1fb-7402-4e24-8870-c7d1c4c86a8e"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out_ret" connectedTo="ebb8ee4a-4d65-41ea-8899-cc7f95491bb0" id="9fbee64a-535c-49b2-9022-a6e61361073d"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3751606570700075" CRS="WGS84" lat="51.9900841009021"/>
          <point xsi:type="esdl:Point" lon="4.37318327752516" CRS="WGS84" lat="51.98947627049756"/>
          <point xsi:type="esdl:Point" lon="4.370367114375066" CRS="WGS84" lat="51.99254176580451"/>
          <point xsi:type="esdl:Point" lon="4.369452758355907" CRS="WGS84" lat="51.99416031552172"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="314.5" name="Pipe4_ret" innerDiameter="0.3127" related="Pipe4" outerDiameter="0.45" id="Pipe4_ret" diameter="DN300">
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="In_ret" connectedTo="906f06cf-0b5a-4d32-9c89-2483b0880f73" id="4d4ea4f1-04fb-4d25-8aaf-9e1223651f81"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out_ret" connectedTo="ebb8ee4a-4d65-41ea-8899-cc7f95491bb0" id="f1ea42b8-db7d-44e4-b451-654b8394cba2"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.373961650608693" CRS="WGS84" lat="51.994708627260025"/>
          <point xsi:type="esdl:Point" lon="4.369452758355907" CRS="WGS84" lat="51.99416031552172"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" length="386.9" name="Pipe5_ret" innerDiameter="0.3127" state="OPTIONAL" related="Pipe5" outerDiameter="0.45" id="Pipe5_ret" diameter="DN300">
        <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="In_ret" connectedTo="b91359da-6f9e-454c-bc50-59067a8a13b2" id="9871687a-b3a8-43a8-9d7b-c039ce331ed6"/>
        <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out_ret" connectedTo="8d27a37a-082e-49af-923d-b878fd19cf3f" id="62bf94ae-b3aa-4084-95ff-b052fe182df1"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.369452758355907" CRS="WGS84" lat="51.99416031552172"/>
          <point xsi:type="esdl:Point" lon="4.363832626387745" CRS="WGS84" lat="51.994510443069274"/>
        </geometry>
      </asset>
      <area xsi:type="esdl:Area" id="72effb55-fb15-45a4-9e91-ed56104d777f" name="TUwijk">
        <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_c5c8" power="25000000.0" id="c5c8678d-e624-4878-95cc-baa9e8809d5e">
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="3574833a-a997-42aa-b93f-2feb32350f9c" id="751b6c76-92d3-4d7c-83a9-ca90ddc73b0e">
            <profile xsi:type="esdl:InfluxDBProfile" startDate="2018-12-31T23:00:00.000000+0000" database="energy_profiles" field="demand2_MW" measurement="WarmingUp default profiles" endDate="2019-12-31T22:00:00.000000+0000" id="5645e777-6500-4b99-80eb-6f09f8d8910e" multiplier="8.0" port="443" host="profiles.warmingup.info" filters="">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
            </profile>
          </port>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out" connectedTo="880b4ede-37b5-4849-83e8-f1ed0f2d5a1a" id="c81b81a7-2ed3-4c20-9c4b-ecc05eff5627"/>
          <geometry xsi:type="esdl:Point" lon="4.371979236602784" CRS="WGS84" lat="52.000365587107815"/>
          <costInformation xsi:type="esdl:CostInformation" id="1f927790-982a-4ef5-b99a-4e9e9aceabd2">
            <investmentCosts xsi:type="esdl:SingleValue" id="ae0d67c2-2e06-48fd-a150-2fabe403a076" value="100000.0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="51492d75-208e-4a02-a6c9-a1c2e5be6a5f" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </investmentCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:HeatStorage" name="HeatStorage_171d" capacity="3600000000.0" maxChargeRate="1000000.0" state="OPTIONAL" maxDischargeRate="1000000.0" id="171dd49c-b2f2-47d0-99d8-a845ad9ee33b">
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="c9bd9209-6b43-46b0-b315-6f465c950a94" id="61f03284-a3b3-4748-b34d-31bc2bdcdd3d"/>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out" connectedTo="374aa328-c36e-4b1a-a530-70fb96205bb3" id="96cdb905-3636-4bea-b989-d51afcac0d97"/>
          <geometry xsi:type="esdl:Point" lon="4.376206398010255" CRS="WGS84" lat="51.99872744841605"/>
          <costInformation xsi:type="esdl:CostInformation" id="200a0bf3-3e61-452f-a01c-e6f2e13b04c8">
            <investmentCosts xsi:type="esdl:SingleValue" id="07eb7de0-5274-4697-948f-9e434657ea4c" value="500.0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="CUBIC_METRE" id="a5e1e949-0e02-4c21-a02c-fe0dd79ed1a3" unit="EURO" description="Cost in EUR/m3" physicalQuantity="COST"/>
            </investmentCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Pipe" length="344.13" name="Pipe6" innerDiameter="0.3127" related="Pipe6_ret" outerDiameter="0.45" id="Pipe6" diameter="DN300">
          <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="e585e343-cb4d-45c4-bc16-0a7e862f8a75" id="86838250-3430-4918-9806-e3b5dc400055"/>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="459b9e2d-3588-4652-9ad3-b4c7845728d0" id="920fda15-8b06-40ab-9c25-70c4ec4af6c9"/>
          <geometry xsi:type="esdl:Line">
            <point xsi:type="esdl:Point" lon="4.367365837097169" lat="51.99905772313822"/>
            <point xsi:type="esdl:Point" lon="4.372290372848512" lat="51.99967863301928"/>
          </geometry>
          <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
              <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
              <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
              <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
            </component>
          </material>
          <costInformation xsi:type="esdl:CostInformation" id="030b9982-3c2c-4e5e-9ad0-79d3b61612d6">
            <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
            </investmentCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Pipe" length="80.38" name="Pipe7" innerDiameter="0.3127" related="Pipe7_ret" outerDiameter="0.45" id="Pipe7" diameter="DN300">
          <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="acb56bd8-eb5f-456e-923a-c5656848a3a8" id="1ba3bfca-5ef8-41ff-ab57-b3d5b18a4560"/>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="751b6c76-92d3-4d7c-83a9-ca90ddc73b0e" id="3574833a-a997-42aa-b93f-2feb32350f9c"/>
          <geometry xsi:type="esdl:Line">
            <point xsi:type="esdl:Point" lon="4.372290372848512" lat="51.99967863301928"/>
            <point xsi:type="esdl:Point" lon="4.372311830520631" lat="51.99969184377424"/>
            <point xsi:type="esdl:Point" lon="4.371979236602784" lat="52.000365587107815"/>
          </geometry>
          <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
              <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
              <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
              <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
            </component>
          </material>
          <costInformation xsi:type="esdl:CostInformation" id="030b9982-3c2c-4e5e-9ad0-79d3b61612d6">
            <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
            </investmentCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Joint" name="Joint_1591" id="1591bb7b-d143-44fb-95b3-e78f2c45144c">
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="920fda15-8b06-40ab-9c25-70c4ec4af6c9" id="459b9e2d-3588-4652-9ad3-b4c7845728d0"/>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="1ba3bfca-5ef8-41ff-ab57-b3d5b18a4560 424c2407-d687-4c13-87a8-c9b5ad3dc334" id="acb56bd8-eb5f-456e-923a-c5656848a3a8"/>
          <geometry xsi:type="esdl:Point" lon="4.372290372848512" lat="51.99967863301928"/>
        </asset>
        <asset xsi:type="esdl:Pipe" length="288.2" name="Pipe8" innerDiameter="0.3127" state="OPTIONAL" related="Pipe8_ret" outerDiameter="0.45" id="Pipe8" diameter="DN300">
          <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="acb56bd8-eb5f-456e-923a-c5656848a3a8" id="424c2407-d687-4c13-87a8-c9b5ad3dc334"/>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="Out" connectedTo="61f03284-a3b3-4748-b34d-31bc2bdcdd3d" id="c9bd9209-6b43-46b0-b315-6f465c950a94"/>
          <geometry xsi:type="esdl:Line" CRS="WGS84">
            <point xsi:type="esdl:Point" lon="4.372290372848512" lat="51.99967863301928"/>
            <point xsi:type="esdl:Point" lon="4.376206398010255" lat="51.99872744841605"/>
          </geometry>
          <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
              <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
              <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
              <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
            </component>
          </material>
          <costInformation xsi:type="esdl:CostInformation" id="442e7c97-693f-49db-b2ef-3a61a1c84ccc">
            <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
            </investmentCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Joint" name="Joint_1591_ret" id="e9f0319e-9509-4667-8f3b-b53427e93188">
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="ret_port" connectedTo="3e11b654-c5ff-4cf5-a7ed-23e5758a84c3" id="02e4b3f2-3b9f-499a-b6bc-e5af5d54197e"/>
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="ret_port" connectedTo="f145e3cd-ee40-49b9-a05a-75659fe099dd 2f6d8d3f-6f9c-443a-9401-350d944fa87f" id="64490463-6f86-4924-8b85-38bafce82628"/>
          <geometry xsi:type="esdl:Point" lon="4.371508069839314" CRS="WGS84" lat="51.99976863310928"/>
        </asset>
        <asset xsi:type="esdl:Pipe" length="344.13" name="Pipe6_ret" innerDiameter="0.3127" related="Pipe6" outerDiameter="0.45" id="Pipe6_ret" diameter="DN300">
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="In_ret" connectedTo="02e4b3f2-3b9f-499a-b6bc-e5af5d54197e" id="3e11b654-c5ff-4cf5-a7ed-23e5758a84c3"/>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out_ret" connectedTo="a455fc93-a668-42f6-a014-70f482fb3efc" id="935f3cbd-95b4-4d81-be5f-ca68315c9f4f"/>
          <geometry xsi:type="esdl:Line">
            <point xsi:type="esdl:Point" lon="4.371508069839314" CRS="WGS84" lat="51.99976863310928"/>
            <point xsi:type="esdl:Point" lon="4.366580576596763" CRS="WGS84" lat="51.99914772322822"/>
          </geometry>
        </asset>
        <asset xsi:type="esdl:Pipe" length="80.38" name="Pipe7_ret" innerDiameter="0.3127" related="Pipe7" outerDiameter="0.45" id="Pipe7_ret" diameter="DN300">
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="In_ret" connectedTo="c81b81a7-2ed3-4c20-9c4b-ecc05eff5627" id="880b4ede-37b5-4849-83e8-f1ed0f2d5a1a"/>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out_ret" connectedTo="64490463-6f86-4924-8b85-38bafce82628" id="2f6d8d3f-6f9c-443a-9401-350d944fa87f"/>
          <geometry xsi:type="esdl:Line">
            <point xsi:type="esdl:Point" lon="4.371200179465164" CRS="WGS84" lat="52.00045558719781"/>
            <point xsi:type="esdl:Point" lon="4.371529590191046" CRS="WGS84" lat="51.999781843864234"/>
            <point xsi:type="esdl:Point" lon="4.371508069839314" CRS="WGS84" lat="51.99976863310928"/>
          </geometry>
        </asset>
        <asset xsi:type="esdl:Pipe" length="288.2" name="Pipe8_ret" innerDiameter="0.3127" state="OPTIONAL" related="Pipe8" outerDiameter="0.45" id="Pipe8_ret" diameter="DN300">
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="In_ret" connectedTo="96cdb905-3636-4bea-b989-d51afcac0d97" id="374aa328-c36e-4b1a-a530-70fb96205bb3"/>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out_ret" connectedTo="64490463-6f86-4924-8b85-38bafce82628" id="f145e3cd-ee40-49b9-a05a-75659fe099dd"/>
          <geometry xsi:type="esdl:Line">
            <point xsi:type="esdl:Point" lon="4.375419555106473" CRS="WGS84" lat="51.998817448506045"/>
            <point xsi:type="esdl:Point" lon="4.371508069839314" CRS="WGS84" lat="51.99976863310928"/>
          </geometry>
        </asset>
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lon="4.366979598999024" lat="52.002003665853785"/>
            <point xsi:type="esdl:Point" lon="4.371356964111329" lat="52.0030604590385"/>
            <point xsi:type="esdl:Point" lon="4.373674392700196" lat="52.000127796500934"/>
            <point xsi:type="esdl:Point" lon="4.374532699584962" lat="51.99875387048352"/>
            <point xsi:type="esdl:Point" lon="4.378180503845216" lat="51.999837161821546"/>
            <point xsi:type="esdl:Point" lon="4.379682540893556" lat="51.997353479419196"/>
            <point xsi:type="esdl:Point" lon="4.375905990600587" lat="51.99674574891218"/>
            <point xsi:type="esdl:Point" lon="4.37483310699463" lat="51.99809331411895"/>
            <point xsi:type="esdl:Point" lon="4.370155334472657" lat="51.996957134372074"/>
          </exterior>
        </geometry>
      </area>
      <area xsi:type="esdl:Area" id="4d129d60-44fb-49f1-b440-ee83b3396912" name="Xsport">
        <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_5d98" power="25000000.0" id="5d98329e-e593-4b67-aa8b-40ce2a9531db">
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="In" connectedTo="0dfd35e1-3273-452b-a8e9-0edc558ad204" id="6d7f2662-daac-4f09-ad23-94069b7429b0">
            <profile xsi:type="esdl:InfluxDBProfile" startDate="2018-12-31T23:00:00.000000+0000" database="energy_profiles" field="demand4_MW" measurement="WarmingUp default profiles" endDate="2019-12-31T22:00:00.000000+0000" id="e92f1544-5170-4922-b4fe-3ae0a298d0de" multiplier="8.0" port="443" host="profiles.warmingup.info" filters="">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
            </profile>
          </port>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="Out" connectedTo="4d4ea4f1-04fb-4d25-8aaf-9e1223651f81" id="906f06cf-0b5a-4d32-9c89-2483b0880f73"/>
          <geometry xsi:type="esdl:Point" lon="4.374768733978272" CRS="WGS84" lat="51.99461862717003"/>
          <costInformation xsi:type="esdl:CostInformation" id="95b2b2cb-6787-4f7e-8bd1-0d46e21d29ea">
            <investmentCosts xsi:type="esdl:SingleValue" id="41f92a36-2b13-41a4-a654-abc3e04f4737" value="100000.0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="a013a4eb-bc48-45b4-9f79-5faf32835cf8" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </investmentCosts>
          </costInformation>
        </asset>
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lon="4.370155334472657" lat="51.99669290239127"/>
            <point xsi:type="esdl:Point" lon="4.374661445617677" lat="51.997749820957424"/>
            <point xsi:type="esdl:Point" lon="4.376292228698731" lat="51.99539814314251"/>
            <point xsi:type="esdl:Point" lon="4.380154609680177" lat="51.99642866885095"/>
            <point xsi:type="esdl:Point" lon="4.381270408630372" lat="51.99534529503086"/>
            <point xsi:type="esdl:Point" lon="4.372386932373048" lat="51.99291421446105"/>
          </exterior>
        </geometry>
      </area>
      <area xsi:type="esdl:Area" id="815405ce-057a-4229-9bcf-9c515813f780" name="Kluyverpark">
        <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_13d1" power="25000000.0" id="13d18f34-caa6-4fef-ba8e-8e2bbe3b184f">
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="In" connectedTo="3367f7bc-73da-4669-8d92-817a6c355777" id="1c5f5573-fbd8-436b-b602-e8d085b38fae">
            <profile xsi:type="esdl:InfluxDBProfile" startDate="2018-12-31T23:00:00.000000+0000" database="energy_profiles" field="demand5_MW" measurement="WarmingUp default profiles" endDate="2019-12-31T22:00:00.000000+0000" id="10320809-979e-44e4-b39a-764ded8de3b7" multiplier="10.0" port="443" host="profiles.warmingup.info" filters="">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
            </profile>
          </port>
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="Out" connectedTo="1794f187-75b5-4609-a4e8-f03a75066ef2" id="45555242-5bef-42d6-bd46-ab4b81aa1189"/>
          <geometry xsi:type="esdl:Point" lon="4.380176067352296" CRS="WGS84" lat="51.99118331035038"/>
          <costInformation xsi:type="esdl:CostInformation" id="893354c9-2516-4e5d-adf3-26283292dfdd">
            <investmentCosts xsi:type="esdl:SingleValue" id="7fd12178-8441-46ac-bf53-fcf81243dcc0" value="100000.0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="952228d7-bb23-4980-8824-34da8f6bdf77" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </investmentCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:GenericProducer" name="GenericProducer_e7d4" state="OPTIONAL" power="10000000.0" id="e7d42e39-275b-4723-88ce-6f53de43a1f9">
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="Out" connectedTo="f181c6c2-30d8-411f-9281-a2148ea1392d" id="7e98c563-5b4f-408d-9bc6-4c18ed60ffb8"/>
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="In" connectedTo="5b7d8822-58e5-4d67-8334-3a4f20b02efb" id="3894549d-0548-4860-99e9-f2f8c6999ae1"/>
          <geometry xsi:type="esdl:Point" lon="4.381334781646729" CRS="WGS84" lat="51.98972982773691"/>
          <costInformation xsi:type="esdl:CostInformation" id="3b3ad03a-e25e-4a72-bedb-2d9e2f072c1f">
            <variableOperationalCosts xsi:type="esdl:SingleValue" id="86000dd6-1343-4cec-ae78-2bf64531d12b" value="100.0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" unit="EURO" id="46e3a198-0f0c-4e86-8a2f-dd1f07ef5d91" description="Cost in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
            </variableOperationalCosts>
            <investmentCosts xsi:type="esdl:SingleValue" id="403c649d-2a50-47dc-a41d-dd9cd1d00a9b" value="100000.0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="68819dd5-2e8e-4e6c-9a38-2dbcf4381fc0" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </investmentCosts>
            <installationCosts xsi:type="esdl:SingleValue" id="ad6887fe-665e-4cb7-a253-b02e634ee62a" value="500000.0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" description="Cost in EUR" id="ab86121c-4475-429f-8e92-62b2dc2a7c9f"/>
            </installationCosts>
            <fixedOperationalCosts xsi:type="esdl:SingleValue" id="8bbcf767-982c-49f1-b24c-4a4609b3a86d" value="10000.0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="df9e8833-bbdc-4a6e-8148-394317ac6039" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </fixedOperationalCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:GenericConversion" name="GenericConversion_fa33" state="OPTIONAL" efficiency="0.99" id="fa3307a7-9422-4051-8e9f-c0bd4b612690" power="15000000.0">
          <port xsi:type="esdl:InPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1" name="PrimIn" connectedTo="a897a7ca-5b60-4552-80aa-8333587eca41" id="d0a39b01-2cc1-4869-a853-a2a1e65c9c1e"/>
          <port xsi:type="esdl:OutPort" carrier="9e201a90-71c0-45bc-a683-6ae7e68b67d1_ret" name="PrimOut" connectedTo="cae6d1fb-7402-4e24-8870-c7d1c4c86a8e" id="b3c6c264-b0e9-47f7-88ff-d18ed934ef3e"/>
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="SecIn" connectedTo="310a945c-43a6-45e0-aaa0-0e216702fa53" id="eda6adb8-a88c-4fd0-ac40-45d2e1f3578b"/>
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="SecOut" connectedTo="d3f37217-014b-40e4-a19a-92c54c8e4d3e" id="4a31d9cb-8ec9-487c-8678-0e373ea0e9d7"/>
          <geometry xsi:type="esdl:Point" lon="4.375991821289063" CRS="WGS84" lat="51.989994100812105"/>
          <costInformation xsi:type="esdl:CostInformation" id="1815f197-424d-473b-b930-a91591a1694a">
            <investmentCosts xsi:type="esdl:SingleValue" id="d839ff1d-e696-4df0-b6c9-f6e0bb0d1600" value="75000.0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="f830b95f-8369-435f-91a9-9bde58a97761" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </investmentCosts>
            <fixedOperationalCosts xsi:type="esdl:SingleValue" id="7e0988d1-b0f7-40ab-99ba-2c416c0acd0f" value="1500.0">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" unit="EURO" id="00fadb02-4dae-4ad9-8b42-e8a856737e29" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST"/>
            </fixedOperationalCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Pipe" length="283.4" name="Pipe9" innerDiameter="0.3127" state="OPTIONAL" related="Pipe9_ret" outerDiameter="0.45" id="Pipe9" diameter="DN300">
          <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="In" connectedTo="4a31d9cb-8ec9-487c-8678-0e373ea0e9d7" id="d3f37217-014b-40e4-a19a-92c54c8e4d3e"/>
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="Out" connectedTo="18029b4e-46e5-41e4-94f0-dcfce11609b4" id="b51ab54d-a158-470b-b397-8375d3a62430"/>
          <geometry xsi:type="esdl:Line" CRS="WGS84">
            <point xsi:type="esdl:Point" lon="4.375991821289063" lat="51.989994100812105"/>
            <point xsi:type="esdl:Point" lon="4.377381205558778" lat="51.98968027636168"/>
            <point xsi:type="esdl:Point" lon="4.379172921180726" lat="51.98997428038556"/>
            <point xsi:type="esdl:Point" lon="4.379714727401734" lat="51.99034095685646"/>
          </geometry>
          <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
              <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
              <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
              <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
            </component>
          </material>
          <costInformation xsi:type="esdl:CostInformation" id="7af869d5-da87-41d4-b2b1-026f2a846fd2">
            <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
            </investmentCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Joint" name="Joint_f0da" id="f0da2ffb-9f5e-4832-90bf-bce36224ceb4">
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="In" connectedTo="b51ab54d-a158-470b-b397-8375d3a62430 50ee156e-a49c-4b81-91f7-8e395ef773fd" id="18029b4e-46e5-41e4-94f0-dcfce11609b4"/>
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="Out" connectedTo="94810176-f76d-4ec2-8318-344584593538" id="7497949d-2872-4ab6-b144-e7e0ffc2640b"/>
          <geometry xsi:type="esdl:Point" lon="4.379737526178361" CRS="WGS84" lat="51.990358299588166"/>
        </asset>
        <asset xsi:type="esdl:Pipe" length="96.5" name="Pipe10" innerDiameter="0.3127" related="Pipe10_ret" outerDiameter="0.45" id="Pipe10" diameter="DN300">
          <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="In" connectedTo="7497949d-2872-4ab6-b144-e7e0ffc2640b" id="94810176-f76d-4ec2-8318-344584593538"/>
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="Out" connectedTo="1c5f5573-fbd8-436b-b602-e8d085b38fae" id="3367f7bc-73da-4669-8d92-817a6c355777"/>
          <geometry xsi:type="esdl:Line" CRS="WGS84">
            <point xsi:type="esdl:Point" lon="4.379737526178361" lat="51.990358299588166"/>
            <point xsi:type="esdl:Point" lon="4.380176067352296" lat="51.99118331035038"/>
          </geometry>
          <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
              <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
              <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
              <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
            </component>
          </material>
          <costInformation xsi:type="esdl:CostInformation" id="b2bd6b3b-fe6a-4353-a575-65dcb504a281">
            <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
            </investmentCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Pipe" length="129.8" name="Pipe11" innerDiameter="0.3127" state="OPTIONAL" related="Pipe11_ret" outerDiameter="0.45" id="Pipe11" diameter="DN300">
          <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="In" connectedTo="7e98c563-5b4f-408d-9bc6-4c18ed60ffb8" id="f181c6c2-30d8-411f-9281-a2148ea1392d"/>
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069" name="Out" connectedTo="18029b4e-46e5-41e4-94f0-dcfce11609b4" id="50ee156e-a49c-4b81-91f7-8e395ef773fd"/>
          <geometry xsi:type="esdl:Line" CRS="WGS84">
            <point xsi:type="esdl:Point" lon="4.381334781646729" lat="51.98972982773691"/>
            <point xsi:type="esdl:Point" lon="4.379737526178361" lat="51.990358299588166"/>
          </geometry>
          <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
              <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
              <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
            </component>
            <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
              <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
            </component>
          </material>
          <costInformation xsi:type="esdl:CostInformation" id="8b5b5cb5-324d-4d82-937b-3177a3a65e34">
            <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
              <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="METRE" id="983f0959-8566-43ce-a380-782d29406ed3" unit="EURO" description="Costs in EUR/m" physicalQuantity="COST"/>
            </investmentCosts>
          </costInformation>
        </asset>
        <asset xsi:type="esdl:Joint" name="Joint_f0da_ret" id="58b8c00e-965a-457b-8cf9-13b26215f807">
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="ret_port" connectedTo="f3d0f5eb-a215-44ca-8911-9439dfa74633" id="1a3d201e-9e7f-4467-a1ee-acf91b521766"/>
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="ret_port" connectedTo="da04a1c0-c18f-4fa5-9ac0-43e26de071df 9d4fa664-bc3e-41ce-a955-4c82f7cb8af8" id="b1d7edff-1cdd-48bc-ae7b-8c2ec9653e0e"/>
          <geometry xsi:type="esdl:Point" lon="4.378908311071035" CRS="WGS84" lat="51.990448299678164"/>
        </asset>
        <asset xsi:type="esdl:Pipe" length="283.4" name="Pipe9_ret" innerDiameter="0.3127" state="OPTIONAL" related="Pipe9" outerDiameter="0.45" id="Pipe9_ret" diameter="DN300">
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="In_ret" connectedTo="b1d7edff-1cdd-48bc-ae7b-8c2ec9653e0e" id="da04a1c0-c18f-4fa5-9ac0-43e26de071df"/>
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="Out_ret" connectedTo="eda6adb8-a88c-4fd0-ac40-45d2e1f3578b" id="310a945c-43a6-45e0-aaa0-0e216702fa53"/>
          <geometry xsi:type="esdl:Line">
            <point xsi:type="esdl:Point" lon="4.378885419689728" CRS="WGS84" lat="51.990430956946454"/>
            <point xsi:type="esdl:Point" lon="4.378341650621005" CRS="WGS84" lat="51.99006428047556"/>
            <point xsi:type="esdl:Point" lon="4.376548354367039" CRS="WGS84" lat="51.98977027645168"/>
            <point xsi:type="esdl:Point" lon="4.3751606570700075" CRS="WGS84" lat="51.9900841009021"/>
          </geometry>
        </asset>
        <asset xsi:type="esdl:Pipe" length="96.5" name="Pipe10_ret" innerDiameter="0.3127" related="Pipe10" outerDiameter="0.45" id="Pipe10_ret" diameter="DN300">
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="In_ret" connectedTo="45555242-5bef-42d6-bd46-ab4b81aa1189" id="1794f187-75b5-4609-a4e8-f03a75066ef2"/>
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="Out_ret" connectedTo="1a3d201e-9e7f-4467-a1ee-acf91b521766" id="f3d0f5eb-a215-44ca-8911-9439dfa74633"/>
          <geometry xsi:type="esdl:Line">
            <point xsi:type="esdl:Point" lon="4.379351233488201" CRS="WGS84" lat="51.99127331044038"/>
            <point xsi:type="esdl:Point" lon="4.378908311071035" CRS="WGS84" lat="51.990448299678164"/>
          </geometry>
        </asset>
        <asset xsi:type="esdl:Pipe" length="129.8" name="Pipe11_ret" innerDiameter="0.3127" state="OPTIONAL" related="Pipe11" outerDiameter="0.45" id="Pipe11_ret" diameter="DN300">
          <port xsi:type="esdl:InPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="In_ret" connectedTo="b1d7edff-1cdd-48bc-ae7b-8c2ec9653e0e" id="9d4fa664-bc3e-41ce-a955-4c82f7cb8af8"/>
          <port xsi:type="esdl:OutPort" carrier="e32b730d-4c75-4610-8ef7-dfcf461cc069_ret" name="Out_ret" connectedTo="3894549d-0548-4860-99e9-f2f8c6999ae1" id="5b7d8822-58e5-4d67-8334-3a4f20b02efb"/>
          <geometry xsi:type="esdl:Line">
            <point xsi:type="esdl:Point" lon="4.378908311071035" CRS="WGS84" lat="51.990448299678164"/>
            <point xsi:type="esdl:Point" lon="4.380502197280458" CRS="WGS84" lat="51.989819827826906"/>
          </geometry>
        </asset>
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lon="4.373159408569337" lat="51.992279997820766"/>
            <point xsi:type="esdl:Point" lon="4.3819570541381845" lat="51.99402407196604"/>
            <point xsi:type="esdl:Point" lon="4.385046958923341" lat="51.98961090434427"/>
            <point xsi:type="esdl:Point" lon="4.377150535583497" lat="51.98712665460617"/>
          </exterior>
        </geometry>
      </area>
    </area>
  </instance>
</esdl:EnergySystem>
