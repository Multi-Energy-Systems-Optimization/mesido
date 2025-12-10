<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="Insulation with return network with return network" id="a71ebbf5-0909-4f16-9e14-d6890ee8af32_with_return_network_with_return_network" description="" esdlVersion="v2207" version="7">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="af3f6d4b-0523-4164-8cc4-de0eebbf08ab">
    <carriers xsi:type="esdl:Carriers" id="3bbdceff-2a55-4990-b24c-c7546cf946d0">
      <carrier xsi:type="esdl:HeatCommodity" id="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Prim" supplyTemperature="90.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="20216d2d-11f6-4e09-af9e-84204974b8f5" name="Sec" supplyTemperature="80.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="43b450c9-df27-400e-8c14-54bb49f423ca" name="LTSource" supplyTemperature="50.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" returnTemperature="50.0" name="Prim_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" id="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" returnTemperature="45.0" name="Sec_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" id="43b450c9-df27-400e-8c14-54bb49f423ca_ret" returnTemperature="30.0" name="LTSource_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="00883efd-3abb-4fb5-969a-1dad424efab5">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" multiplier="MEGA" physicalQuantity="POWER" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="0bf24ee2-984f-4a2c-b7e3-40542aa39635" name="Untitled instance">
    <area xsi:type="esdl:Area" id="f175b346-a63d-4c90-b598-207b0e84ade1" name="Untitled area">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_f15e" id="f15ef798-9620-483a-8b25-aa8e5c02f72d" minTemperature="60.0" power="60000000.0">
        <geometry xsi:type="esdl:Point" lon="4.3720436096191415" lat="52.01580606118932" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="e34e00c3-2aaf-4fc3-9360-a1e50bce3e88" id="78c7169a-a6b3-4377-b38b-85631425428e" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="In"/>
        <port xsi:type="esdl:OutPort" id="abdd78ac-f0f4-4f5b-ad00-f0620c366626" connectedTo="127c440b-5c1f-4893-89fb-01bd75ce1eee" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="Out"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_e6b3" id="e6b37a73-ebb4-4deb-80b4-80e8ceafe16f" minTemperature="80.0" power="60000000.0">
        <geometry xsi:type="esdl:Point" lon="4.368717670440675" lat="52.00971768236719" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="cfc5ed9b-d4d7-4e99-849b-88b876900510" id="826de3f7-13ef-44fa-80cb-061ef8953a1d" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="In"/>
        <port xsi:type="esdl:OutPort" id="a3fc2a36-da66-447e-92ab-74d264bb63f8" connectedTo="6b951724-6658-4b06-aedf-30ec0c238ebc" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="Out"/>
      </asset>
      <asset xsi:type="esdl:GenericConversion" name="GenericConversion_db26" power="60000000.0" id="db26dace-343b-43c9-bbe1-1a03c1a1dc0e" efficiency="1.0">
        <geometry xsi:type="esdl:Point" lon="4.36534881591797" lat="52.0155155283129" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="23cfd960-f4e3-45fa-9e95-2adbb02c0147" id="23c67bb7-3de0-476a-91af-6f832283d355" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Prim_In"/>
        <port xsi:type="esdl:OutPort" id="73f546ea-2f76-4f2a-8b0d-51fc209d8af3" connectedTo="28cb017e-9068-4860-bfd4-a8dad13504ae" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="Prim_out"/>
        <port xsi:type="esdl:InPort" connectedTo="9d9e468d-a896-4021-9d3a-2e6b1a6d9b58" id="05ec5b67-4852-47cf-ad1a-c26880804e1b" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="Sec_In"/>
        <port xsi:type="esdl:OutPort" id="107d130a-48e0-4f99-9c86-5159413c6981" connectedTo="07c5b7da-297e-41ab-b179-46e5bd1279de" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="Sec_Out"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" name="HeatPump_cd41" power="10000000.0" id="cd41c90e-6e21-4178-a9f4-966c6f2c9123" COP="4.0">
        <geometry xsi:type="esdl:Point" lon="4.369661808013917" lat="52.01786614928232" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="cf2a008c-7c6b-4bda-b363-290e694427a0" id="6cd22aab-9535-42b1-a1d1-c67e6b9c3f0f" carrier="43b450c9-df27-400e-8c14-54bb49f423ca" name="InPrimary"/>
        <port xsi:type="esdl:OutPort" id="b08c3da0-56b1-42f5-bd4c-7b10bb095d1f" connectedTo="c1ab0541-eab5-43cd-8e2f-fec9a097d8b3" carrier="43b450c9-df27-400e-8c14-54bb49f423ca_ret" name="OutPrimary"/>
        <port xsi:type="esdl:InPort" connectedTo="a73c7412-9691-4eec-a3d4-d6ac0ba788cc" id="d872a56f-8827-4a7f-a36b-91a929720812" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="InSecondary"/>
        <port xsi:type="esdl:OutPort" id="05baa793-6449-4b22-88f9-ef45769e95d7" connectedTo="ee48c15a-2821-4d9d-90ff-904e04da9c28" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="OutSecondary"/>
      </asset>
      <asset xsi:type="esdl:HeatStorage" name="HeatStorage_bce7" id="bce72b89-24a7-40c7-b63c-c34252d1e235" capacity="200000000000.0" maxDischargeRate="10000000.0" maxChargeRate="10000000.0">
        <geometry xsi:type="esdl:Point" lon="4.369640350341798" lat="52.01354777871666" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="627283aa-12b2-45de-a907-cf70f9998eac" id="108e9998-1c37-487e-84b6-0430a9678f1c" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="In"/>
        <port xsi:type="esdl:OutPort" id="ff23eb9c-e982-47b3-a221-dc56b0b6c7ab" connectedTo="1083f2a4-f27c-48ae-bb63-4930e2a02a04" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe1_ret" diameter="DN400" name="Pipe1" length="420.89" innerDiameter="0.3938" id="Pipe1" outerDiameter="0.56">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.355993270874024" lat="52.009783721288684"/>
          <point xsi:type="esdl:Point" lon="4.362140893936158" lat="52.009876175615055"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="688b3bf8-bd6b-4361-9516-038441173e70" id="0121b493-7787-472f-860c-caf7245955be" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="In"/>
        <port xsi:type="esdl:OutPort" id="4faba1eb-1267-4b92-b0d8-24c48e03b7e4" connectedTo="a3a35a8a-7e00-4d7d-a838-a19d5df8d8ca" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="74d84321-1767-4cec-b6e7-b90c06020400" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="12d831c7-0cfa-4f0b-8b3c-8540b35cd4cb">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_cc5f" id="cc5feedb-68c3-4b59-911b-fd759c97404c">
        <geometry xsi:type="esdl:Point" lon="4.362140893936158" lat="52.009876175615055"/>
        <port xsi:type="esdl:InPort" connectedTo="4faba1eb-1267-4b92-b0d8-24c48e03b7e4" id="a3a35a8a-7e00-4d7d-a838-a19d5df8d8ca" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="In"/>
        <port xsi:type="esdl:OutPort" id="83a95536-68ce-407a-a088-62dc9e488a23" connectedTo="9cb6f5ec-d9e1-4b80-a30b-3e7d4a41aabd 4e384449-cd5c-4f63-9296-f894b85e3692" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe2_ret" diameter="DN400" name="Pipe2" length="647.17" innerDiameter="0.3938" id="Pipe2" outerDiameter="0.56">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.362140893936158" lat="52.009876175615055"/>
          <point xsi:type="esdl:Point" lon="4.3621301651000985" lat="52.00988938336036"/>
          <point xsi:type="esdl:Point" lon="4.361958503723145" lat="52.01566079498693"/>
          <point xsi:type="esdl:Point" lon="4.361990690231324" lat="52.01563438289948"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="83a95536-68ce-407a-a088-62dc9e488a23" id="9cb6f5ec-d9e1-4b80-a30b-3e7d4a41aabd" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="In"/>
        <port xsi:type="esdl:OutPort" id="750707ea-87d9-40ae-b9d0-8dab748f1f36" connectedTo="6b68cb6e-9d7a-4681-be5c-536c341eca21" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="74d84321-1767-4cec-b6e7-b90c06020400" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="12d831c7-0cfa-4f0b-8b3c-8540b35cd4cb">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_b137" id="b137b045-9ad6-4081-b05b-24655295679e">
        <geometry xsi:type="esdl:Point" lon="4.361990690231324" lat="52.01563438289948"/>
        <port xsi:type="esdl:InPort" connectedTo="750707ea-87d9-40ae-b9d0-8dab748f1f36 b61bf757-2231-4b9d-90ae-c0a21662f315" id="6b68cb6e-9d7a-4681-be5c-536c341eca21" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="In"/>
        <port xsi:type="esdl:OutPort" id="abfcc986-c2bf-4aca-8e27-f54ab9d1b6bc" connectedTo="a1111261-90b5-4926-b3b6-f21c04141c72" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe3_ret" diameter="DN400" name="Pipe3" length="450.5" id="Pipe3" outerDiameter="0.56" innerDiameter="0.3938">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.362140893936158" lat="52.009876175615055"/>
          <point xsi:type="esdl:Point" lon="4.368717670440675" lat="52.00971768236719"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="83a95536-68ce-407a-a088-62dc9e488a23" id="4e384449-cd5c-4f63-9296-f894b85e3692" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="In"/>
        <port xsi:type="esdl:OutPort" id="cfc5ed9b-d4d7-4e99-849b-88b876900510" connectedTo="826de3f7-13ef-44fa-80cb-061ef8953a1d" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="74d84321-1767-4cec-b6e7-b90c06020400" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="8bcca778-57fa-46e1-8ca6-6670c0d519d9">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe4_ret" diameter="DN400" name="Pipe4" length="449.2" id="Pipe4" outerDiameter="0.56" innerDiameter="0.3938">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.355456829071046" lat="52.01601735664165"/>
          <point xsi:type="esdl:Point" lon="4.361990690231324" lat="52.01563438289948"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="b3aa7d9e-1562-4abe-a3b1-374b964c779a" id="84c087a2-fa2b-4dad-9ea3-57a6376b02ef" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="In"/>
        <port xsi:type="esdl:OutPort" id="b61bf757-2231-4b9d-90ae-c0a21662f315" connectedTo="6b68cb6e-9d7a-4681-be5c-536c341eca21" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="74d84321-1767-4cec-b6e7-b90c06020400" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="416fc003-5c9a-45f7-8f80-bf853c5e549e">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe5_ret" diameter="DN400" name="Pipe5" length="230.2" id="Pipe5" outerDiameter="0.56" innerDiameter="0.3938">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.01563438289948" lon="4.361990690231324"/>
          <point xsi:type="esdl:Point" lat="52.0155155283129" lon="4.36534881591797"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="abfcc986-c2bf-4aca-8e27-f54ab9d1b6bc" id="a1111261-90b5-4926-b3b6-f21c04141c72" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="In"/>
        <port xsi:type="esdl:OutPort" id="23cfd960-f4e3-45fa-9e95-2adbb02c0147" connectedTo="23c67bb7-3de0-476a-91af-6f832283d355" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Out"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="1666462b-4168-4cef-a92f-619d56a0e1cf">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe6_ret" diameter="DN400" name="Pipe6" length="250.16" innerDiameter="0.3938" id="Pipe6" outerDiameter="0.56">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.0155155283129" lon="4.36534881591797"/>
          <point xsi:type="esdl:Point" lat="52.01566079498693" lon="4.3689966201782235"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="107d130a-48e0-4f99-9c86-5159413c6981" id="07c5b7da-297e-41ab-b179-46e5bd1279de" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="In"/>
        <port xsi:type="esdl:OutPort" id="d9ae0241-b8a1-4a51-999d-585f507a7532" connectedTo="7af2bd3c-1af3-4dcd-867f-5a00ea8059ae" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="Out"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="611004a0-a140-48b1-8fe0-2bc19df076ea">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe7_ret" diameter="DN400" name="Pipe7" length="209.14" innerDiameter="0.3938" id="Pipe7" outerDiameter="0.56">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.01566079498693" lon="4.3689966201782235"/>
          <point xsi:type="esdl:Point" lat="52.01580606118932" lon="4.3720436096191415"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="11b463c7-2b36-4012-bf9d-c89a4047caa6" id="62f5e684-2983-4ef8-aece-9396a9586b0f" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="In"/>
        <port xsi:type="esdl:OutPort" id="e34e00c3-2aaf-4fc3-9360-a1e50bce3e88" connectedTo="78c7169a-a6b3-4377-b38b-85631425428e" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="Out"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="611004a0-a140-48b1-8fe0-2bc19df076ea">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_6a53" id="6a53b636-c7da-4e54-a6b0-b2fe3e4e364f">
        <geometry xsi:type="esdl:Point" lat="52.01566079498693" lon="4.3689966201782235"/>
        <port xsi:type="esdl:InPort" connectedTo="d9ae0241-b8a1-4a51-999d-585f507a7532 0f42c0f6-f5ea-49cf-9187-0b685bc9ab6f" id="7af2bd3c-1af3-4dcd-867f-5a00ea8059ae" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="In"/>
        <port xsi:type="esdl:OutPort" id="11b463c7-2b36-4012-bf9d-c89a4047caa6" connectedTo="62f5e684-2983-4ef8-aece-9396a9586b0f 4334a0f2-c342-48c0-8732-e5c133f933aa" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe8_ret" diameter="DN400" name="Pipe8" length="239.1" id="Pipe8" outerDiameter="0.56" innerDiameter="0.3938">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.01566079498693" lon="4.3689966201782235"/>
          <point xsi:type="esdl:Point" lat="52.01354777871666" lon="4.369640350341798"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="11b463c7-2b36-4012-bf9d-c89a4047caa6" id="4334a0f2-c342-48c0-8732-e5c133f933aa" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="In"/>
        <port xsi:type="esdl:OutPort" id="627283aa-12b2-45de-a907-cf70f9998eac" connectedTo="108e9998-1c37-487e-84b6-0430a9678f1c" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="Out"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="f99d0d6b-fef1-4537-9d6b-6e14ab61995d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" power="40000000.0" name="ResidualHeatSource_6783" maxTemperature="100.0" id="678332f9-320d-4f34-96d1-12577c73b798">
        <geometry xsi:type="esdl:Point" lat="52.009790325175466" lon="4.355778694152833"/>
        <port xsi:type="esdl:OutPort" id="688b3bf8-bd6b-4361-9516-038441173e70" connectedTo="0121b493-7787-472f-860c-caf7245955be" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="4443d6f8-159a-4d61-82f7-14f49414ca04" id="fe8fd335-e544-48d0-a2bb-9029920ce799" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="In"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" power="30000000.0" name="ResidualHeatSource_4539" maxTemperature="60.0" id="4539f425-2d05-4a12-bb6f-fdf979bc6498">
        <geometry xsi:type="esdl:Point" lon="4.355370998382569" lat="52.01608338626585" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="b3aa7d9e-1562-4abe-a3b1-374b964c779a" connectedTo="84c087a2-fa2b-4dad-9ea3-57a6376b02ef" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="c99cbcd0-ba6d-4481-9cdd-e3414a2d4bf7" id="17c2b043-f773-4bbf-9cdd-c2307c0d6c0a" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="In"/>
      </asset>
      <asset xsi:type="esdl:GenericProducer" power="10000000.0" name="GenericProducer_7f8d" id="7f8d0805-4d84-4ef7-9e7d-caff5db06027">
        <geometry xsi:type="esdl:Point" lon="4.369479417800904" lat="52.019410157663714" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="9a68e8e5-a3ce-427f-b588-3f3dd1550ac0" connectedTo="757c6602-8580-4810-8a66-d49569a40521" carrier="43b450c9-df27-400e-8c14-54bb49f423ca" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="7fb34ef7-446e-4646-bef2-623b377550f9" id="4f401c8a-d292-4361-8c27-1a2581b4d1c4" carrier="43b450c9-df27-400e-8c14-54bb49f423ca_ret" name="In"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe21_ret" diameter="DN400" name="Pipe21" length="172.1" id="Pipe21" outerDiameter="0.56" innerDiameter="0.3938">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.019410157663714" lon="4.369479417800904"/>
          <point xsi:type="esdl:Point" lat="52.01786614928232" lon="4.369661808013917"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="9a68e8e5-a3ce-427f-b588-3f3dd1550ac0" id="757c6602-8580-4810-8a66-d49569a40521" carrier="43b450c9-df27-400e-8c14-54bb49f423ca" name="In"/>
        <port xsi:type="esdl:OutPort" id="cf2a008c-7c6b-4bda-b363-290e694427a0" connectedTo="6cd22aab-9535-42b1-a1d1-c67e6b9c3f0f" carrier="43b450c9-df27-400e-8c14-54bb49f423ca" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="74d84321-1767-4cec-b6e7-b90c06020400" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" name="HDPE"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="abdceaf4-5070-428e-95ad-a434ca1dee59">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe22_ret" diameter="DN400" name="Pipe22" length="249.4" id="Pipe22" outerDiameter="0.56" innerDiameter="0.3938">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.369661808013917" lat="52.01786614928232"/>
          <point xsi:type="esdl:Point" lon="4.3689966201782235" lat="52.01566079498693"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="05baa793-6449-4b22-88f9-ef45769e95d7" id="ee48c15a-2821-4d9d-90ff-904e04da9c28" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="In"/>
        <port xsi:type="esdl:OutPort" id="0f42c0f6-f5ea-49cf-9187-0b685bc9ab6f" connectedTo="7af2bd3c-1af3-4dcd-867f-5a00ea8059ae" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5" name="Out"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_cc5f_ret" id="76f33094-2dc5-4de6-8401-6db5f9e614eb">
        <geometry xsi:type="esdl:Point" lon="4.361404122680249" lat="52.00996617570505" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="aae5dbc5-862d-4e8c-9717-04b5e3554c11" connectedTo="a214b179-4871-47f2-87dc-7694e3391eed" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="ret_port"/>
        <port xsi:type="esdl:InPort" connectedTo="d2b6cee9-31a5-49a1-ad51-96b9d5d7ac10 a7c2cba4-0cf7-451a-b1e9-18a9b9e90311" id="6a5845d7-7cc7-4152-89e3-5ab29bd8bcf3" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="ret_port"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_b137_ret" id="15fbafd7-eece-4239-8a09-5a551d4c032e">
        <geometry xsi:type="esdl:Point" lon="4.361277330901265" lat="52.015724382989475" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="defaeee2-1c1c-4595-b120-a9c767269417" connectedTo="77f3ac75-be36-4d3d-b7b5-5e385b206709 358c2328-5849-40bb-9bd4-64a964583a82" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="ret_port"/>
        <port xsi:type="esdl:InPort" connectedTo="2e23c42f-78f5-4d48-82d2-3c6ba3ed520f" id="38d4286c-92ce-46cb-aed1-5c5c69fff6a3" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="ret_port"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_6a53_ret" id="ad60b7a0-6ff0-4de8-955e-af2b2fe50ab4">
        <geometry xsi:type="esdl:Point" lon="4.368283364753943" lat="52.015750795076926" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="9fdc990f-ccc9-4646-88f2-0c7858c14ca5 3447e4de-a954-4971-8104-7d55ababf365" id="198b3a70-7ce2-43eb-ad83-580c6225747a" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="ret_port"/>
        <port xsi:type="esdl:OutPort" id="dd72ecbb-60ee-4851-9c9e-19b87f1f3074" connectedTo="ade82c1f-3c99-462d-adfa-28a0a38b182d 57afe20b-0303-4bd1-a7ad-c7f6bd8b6aed" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="ret_port"/>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe1" diameter="DN400" name="Pipe1_ret" length="420.89" outerDiameter="0.56" innerDiameter="0.3938" id="Pipe1_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.361404122680249" lat="52.00996617570505" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.355256110970786" lat="52.00987372137868" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="aae5dbc5-862d-4e8c-9717-04b5e3554c11" id="a214b179-4871-47f2-87dc-7694e3391eed" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="4443d6f8-159a-4d61-82f7-14f49414ca04" connectedTo="fe8fd335-e544-48d0-a2bb-9029920ce799" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="Out_ret"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe2" diameter="DN400" name="Pipe2_ret" length="647.17" outerDiameter="0.56" innerDiameter="0.3938" id="Pipe2_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.361277330901265" lat="52.015724382989475" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.361245248298865" lat="52.015750795076926" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3613934493312065" lat="52.00997938345036" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.361404122680249" lat="52.00996617570505" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="defaeee2-1c1c-4595-b120-a9c767269417" id="77f3ac75-be36-4d3d-b7b5-5e385b206709" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="d2b6cee9-31a5-49a1-ad51-96b9d5d7ac10" connectedTo="6a5845d7-7cc7-4152-89e3-5ab29bd8bcf3" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="Out_ret"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe3" diameter="DN400" name="Pipe3_ret" length="450.5" outerDiameter="0.56" innerDiameter="0.3938" id="Pipe3_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.367980232676718" lat="52.009807682457186" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.361404122680249" lat="52.00996617570505" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="a3fc2a36-da66-447e-92ab-74d264bb63f8" id="6b951724-6658-4b06-aedf-30ec0c238ebc" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="a7c2cba4-0cf7-451a-b1e9-18a9b9e90311" connectedTo="6a5845d7-7cc7-4152-89e3-5ab29bd8bcf3" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="Out_ret"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe4" diameter="DN400" name="Pipe4_ret" length="449.2" outerDiameter="0.56" innerDiameter="0.3938" id="Pipe4_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.361277330901265" lat="52.015724382989475" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.354744973363476" lat="52.016107356731645" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="defaeee2-1c1c-4595-b120-a9c767269417" id="358c2328-5849-40bb-9bd4-64a964583a82" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="c99cbcd0-ba6d-4481-9cdd-e3414a2d4bf7" connectedTo="17c2b043-f773-4bbf-9cdd-c2307c0d6c0a" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="Out_ret"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe5" diameter="DN400" name="Pipe5_ret" length="230.2" outerDiameter="0.56" innerDiameter="0.3938" id="Pipe5_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.364634988630099" lat="52.0156055284029" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.361277330901265" lat="52.015724382989475" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="73f546ea-2f76-4f2a-8b0d-51fc209d8af3" id="28cb017e-9068-4860-bfd4-a8dad13504ae" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="2e23c42f-78f5-4d48-82d2-3c6ba3ed520f" connectedTo="38d4286c-92ce-46cb-aed1-5c5c69fff6a3" carrier="ce071f25-185e-45f0-9c31-c51bb40c104e_ret" name="Out_ret"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe6" diameter="DN400" name="Pipe6_ret" length="250.16" outerDiameter="0.56" innerDiameter="0.3938" id="Pipe6_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.368283364753943" lat="52.015750795076926" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.364634988630099" lat="52.0156055284029" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="dd72ecbb-60ee-4851-9c9e-19b87f1f3074" id="ade82c1f-3c99-462d-adfa-28a0a38b182d" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="9d9e468d-a896-4021-9d3a-2e6b1a6d9b58" connectedTo="05ec5b67-4852-47cf-ad1a-c26880804e1b" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="Out_ret"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe7" diameter="DN400" name="Pipe7_ret" length="209.14" outerDiameter="0.56" innerDiameter="0.3938" id="Pipe7_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.371330925126038" lat="52.01589606127932" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.368283364753943" lat="52.015750795076926" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="abdd78ac-f0f4-4f5b-ad00-f0620c366626" id="127c440b-5c1f-4893-89fb-01bd75ce1eee" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="9fdc990f-ccc9-4646-88f2-0c7858c14ca5" connectedTo="198b3a70-7ce2-43eb-ad83-580c6225747a" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="Out_ret"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe8" diameter="DN400" name="Pipe8_ret" length="239.1" outerDiameter="0.56" innerDiameter="0.3938" id="Pipe8_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.368918683875052" lat="52.013637778806654" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.368283364753943" lat="52.015750795076926" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ff23eb9c-e982-47b3-a221-dc56b0b6c7ab" id="1083f2a4-f27c-48ae-bb63-4930e2a02a04" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="3447e4de-a954-4971-8104-7d55ababf365" connectedTo="198b3a70-7ce2-43eb-ad83-580c6225747a" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="Out_ret"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe21" diameter="DN400" name="Pipe21_ret" length="172.1" outerDiameter="0.56" innerDiameter="0.3938" id="Pipe21_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3689571212879335" lat="52.01795614937232" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.368780606666017" lat="52.01950015775371" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="b08c3da0-56b1-42f5-bd4c-7b10bb095d1f" id="c1ab0541-eab5-43cd-8e2f-fec9a097d8b3" carrier="43b450c9-df27-400e-8c14-54bb49f423ca_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="7fb34ef7-446e-4646-bef2-623b377550f9" connectedTo="4f401c8a-d292-4361-8c27-1a2581b4d1c4" carrier="43b450c9-df27-400e-8c14-54bb49f423ca_ret" name="Out_ret"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" related="Pipe22" diameter="DN400" name="Pipe22_ret" length="249.4" outerDiameter="0.56" innerDiameter="0.3938" id="Pipe22_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.368283364753943" lat="52.015750795076926" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3689571212879335" lat="52.01795614937232" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="dd72ecbb-60ee-4851-9c9e-19b87f1f3074" id="57afe20b-0303-4bd1-a7ad-c7f6bd8b6aed" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="a73c7412-9691-4eec-a3d4-d6ac0ba788cc" connectedTo="d872a56f-8827-4a7f-a36b-91a929720812" carrier="20216d2d-11f6-4e09-af9e-84204974b8f5_ret" name="Out_ret"/>
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
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="08d88c1a-1f32-4f55-b5a8-1560dbc2ff0f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" value="2840.6" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
