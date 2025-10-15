<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="Untitled EnergySystem with return network" id="7ac09231-ce60-4c24-8338-9c0317695ba4_with_return_network" description="" esdlVersion="v2210" version="14">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="e64737d9-d772-4723-b092-a0b397ac00b3">
    <carriers xsi:type="esdl:Carriers" id="9dff13b9-77cd-4b99-8777-6b7680a155b6">
      <carrier xsi:type="esdl:HeatCommodity" id="7b32e287-d775-480c-b317-64ffdacf12c9" name="Heat" supplyTemperature="70.0"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" id="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Heat_ret"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="f852b941-99fe-487b-a20d-01beff9e7c43" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="f4acc7ef-a37d-43b7-87cb-8af5b82e3fed" name="Untitled Area">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_1" id="c2d77abc-1656-4722-8508-7c64574e04ef" power="10000000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.04198588944146" lon="4.3088722229003915"/>
        <port xsi:type="esdl:InPort" connectedTo="1dfdc172-9359-435a-8153-0a657932223a" id="2a873195-fa6b-4250-8519-046f040fedb7" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="ef74ea8c-89b4-42e0-a98c-411860876c1a" connectedTo="18ce6906-595c-45e4-acf0-e07f7d7648c6" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
        <costInformation xsi:type="esdl:CostInformation" id="d8a67243-4e4e-43f8-9801-fd4579c0eddf">
          <installationCosts xsi:type="esdl:SingleValue" value="1000000.0" id="accd84bc-d3ed-4528-a1ff-f906c48991a1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" id="ae8b81fb-857b-4280-9e91-919dd1c7675e" description="Cost in EUR"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_2" id="9352d984-0e21-4af6-9c5f-91f984abfcfd" power="10000000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.04002590369568" lon="4.310610294342042"/>
        <port xsi:type="esdl:InPort" connectedTo="53a54448-abdb-41ab-a53e-498556062216" id="a4a7c23e-4d77-4bbe-b8b4-ddf2d2d6e97e" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="bf6e0b6b-baac-468b-a9ba-f8397babf5d6" connectedTo="d126f79e-c43e-4d9d-a7ce-8f58be634695" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
        <costInformation xsi:type="esdl:CostInformation" id="7d95dc58-02b0-49cf-a7a7-5623fffb4079">
          <installationCosts xsi:type="esdl:SingleValue" value="1000000.0" id="c33af629-6fc5-4d7c-9ac4-5b1e0db295a5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" id="89301826-acf3-4fec-b03c-7db277de004a" description="Cost in EUR"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_3" id="e295a155-3fab-4ab1-925d-7bdb50094f48" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="52.03796848613761" lon="4.312646090984345"/>
        <port xsi:type="esdl:InPort" connectedTo="16b1337c-5970-4eb4-90d3-e52d514a13df" id="770022e6-3e71-4e51-8544-0dba86c46a5b" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="9c025b19-57d1-43a8-b2e8-db3e684756f2" connectedTo="5cd0f2e0-d456-4909-a81c-4b312b1be857" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
        <costInformation xsi:type="esdl:CostInformation" id="3d07b171-f65b-413d-9090-2d1cd578a488">
          <installationCosts xsi:type="esdl:SingleValue" value="1000000.0" id="ae1d6cd8-2990-4a77-a74c-65eb9c93b084">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" id="7feb28ca-bfb8-4c0d-b1b5-ab1b397e394c" description="Cost in EUR"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe1_ret" diameter="DN450" name="Pipe1" length="245.7" id="Pipe1" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.04469805119214" lon="4.310052394866944"/>
          <point xsi:type="esdl:Point" lat="52.04274148388849" lon="4.311720728874207"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="45bfc7d0-ef59-4f49-b37a-867b18e04b86" id="b462d564-a8c0-4ae0-a4af-36958f2455ea" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="66590f96-a397-4d6f-9cfb-e7d34232cad6" connectedTo="51852861-aeeb-461f-b8ec-08f000abc6dd" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="371c1d72-de35-4559-9b0e-47172e5d1d83"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0805">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="df30bd37-2fc4-4993-828f-1b7cf1e8202c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.006">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="f53de37b-a735-4b0d-b226-a6b722029a01"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="ec2d740c-2f13-4b70-a1bb-6e4a561414c2">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" name="Combined investment and installation costs" id="a40165e8-88bd-49b9-81d9-298812ac0170">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0aebc76-201b-4b2d-81fe-55269fcefe3b" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe2_ret" diameter="DN450" name="Pipe2" length="195.4" id="Pipe2" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.04271178827801" lon="4.311629533767701"/>
          <point xsi:type="esdl:Point" lat="52.04202218466326" lon="4.309000968933106"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="c0eac4db-f5da-47f3-8202-8438d000bd32" id="5f65520d-61ee-4f68-8002-271f48f1daee" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="1dfdc172-9359-435a-8153-0a657932223a" connectedTo="2a873195-fa6b-4250-8519-046f040fedb7" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="371c1d72-de35-4559-9b0e-47172e5d1d83"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0805">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="df30bd37-2fc4-4993-828f-1b7cf1e8202c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.006">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="f53de37b-a735-4b0d-b226-a6b722029a01"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="c8140b3b-99dc-4ee0-b034-1050b4fd1946">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" name="Combined investment and installation costs" id="a40165e8-88bd-49b9-81d9-298812ac0170">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0aebc76-201b-4b2d-81fe-55269fcefe3b" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe3_ret" diameter="DN450" name="Pipe3" length="241.6" id="Pipe3" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.042708488764504" lon="4.311758279800416"/>
          <point xsi:type="esdl:Point" lat="52.04078483093156" lon="4.31339979171753"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="c0eac4db-f5da-47f3-8202-8438d000bd32" id="578ec414-3f11-430e-a893-60ea77848ff5" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="dc1bc94f-26f2-4a49-a3bf-d0614b1f0df2" connectedTo="e0adf80a-b6f3-4c12-a439-dab4e555202a" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="371c1d72-de35-4559-9b0e-47172e5d1d83"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0805">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="df30bd37-2fc4-4993-828f-1b7cf1e8202c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.006">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="f53de37b-a735-4b0d-b226-a6b722029a01"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="883afc13-098e-47b4-aa30-ae3c3e25f9b1">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" name="Combined investment and installation costs" id="a40165e8-88bd-49b9-81d9-298812ac0170">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0aebc76-201b-4b2d-81fe-55269fcefe3b" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe4_ret" diameter="DN450" name="Pipe4" length="189.7" id="Pipe4" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.04076173333622" lon="4.313324689865113"/>
          <point xsi:type="esdl:Point" lat="52.04007209963487" lon="4.310787320137025"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ed75b210-6b5a-488e-8a8d-efe570c84990" id="4b92e418-4ca6-4765-85ab-ce30f4127bf0" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="53a54448-abdb-41ab-a53e-498556062216" connectedTo="a4a7c23e-4d77-4bbe-b8b4-ddf2d2d6e97e" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="371c1d72-de35-4559-9b0e-47172e5d1d83"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0805">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="df30bd37-2fc4-4993-828f-1b7cf1e8202c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.006">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="f53de37b-a735-4b0d-b226-a6b722029a01"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="b1dd0427-f8ca-4525-8192-8a8954f2be1c">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" name="Combined investment and installation costs" id="a40165e8-88bd-49b9-81d9-298812ac0170">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0aebc76-201b-4b2d-81fe-55269fcefe3b" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe5_ret" diameter="DN450" name="Pipe5" length="244.6" id="Pipe5" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.04073863572898" lon="4.313453435897828"/>
          <point xsi:type="esdl:Point" lat="52.03879839410938" lon="4.315137863159181"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ed75b210-6b5a-488e-8a8d-efe570c84990" id="d1ce17fe-572d-4ade-a6e1-a3d3aa0fab64" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="8f1bea52-e322-4d34-ad43-7d1e97243d62" connectedTo="1cb923b5-2a69-46d9-874c-68d552ef5576" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="371c1d72-de35-4559-9b0e-47172e5d1d83"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0805">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="df30bd37-2fc4-4993-828f-1b7cf1e8202c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.006">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="f53de37b-a735-4b0d-b226-a6b722029a01"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="d9132301-1f49-4c31-b38f-4e650c18a984">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" name="Combined investment and installation costs" id="a40165e8-88bd-49b9-81d9-298812ac0170">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0aebc76-201b-4b2d-81fe-55269fcefe3b" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe6_ret" diameter="DN450" name="Pipe6" length="176.6" id="Pipe6" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.03875219685389" lon="4.315094947814942"/>
          <point xsi:type="esdl:Point" lat="52.03801303427292" lon="4.312809705734254"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="a02e41ab-99f8-46d3-b2d1-be44aa5b7914" id="7f162a30-7e41-4d7f-b011-ffcf4c1651f8" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="16b1337c-5970-4eb4-90d3-e52d514a13df" connectedTo="770022e6-3e71-4e51-8544-0dba86c46a5b" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="371c1d72-de35-4559-9b0e-47172e5d1d83"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0805">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="df30bd37-2fc4-4993-828f-1b7cf1e8202c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.006">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="f53de37b-a735-4b0d-b226-a6b722029a01"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="762aeec6-ac5d-4e54-b32f-3da929bd6713">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" name="Combined investment and installation costs" id="a40165e8-88bd-49b9-81d9-298812ac0170">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0aebc76-201b-4b2d-81fe-55269fcefe3b" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="3000000.0" name="HeatProducer_1" id="324b0371-b738-4f55-a978-3306ee81638c" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lat="52.04476403847825" lon="4.309977293014527"/>
        <port xsi:type="esdl:OutPort" id="45bfc7d0-ef59-4f49-b37a-867b18e04b86" connectedTo="b462d564-a8c0-4ae0-a4af-36958f2455ea" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="e31e12c2-8f80-4aed-9e4b-918445a32996" id="ba9ca084-b71f-42a3-884a-f2f2b3ae4265" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In"/>
        <costInformation xsi:type="esdl:CostInformation" id="28e9b853-e407-49b0-be66-1572c12dc811">
          <investmentCosts xsi:type="esdl:SingleValue" value="100000.0" id="b6c85259-9211-417f-b9db-89fb473f2f1c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="47fcbff2-f0f1-48d9-b7c1-7e34a90b1539" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="15.0" id="b90c659f-4d87-4402-b042-90a7594e7016">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="0d948406-7864-4eff-bc65-7670533bf18b" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" unit="EURO" physicalQuantity="COST"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="ccba43a5-c4c8-4818-a339-762b3385f562">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" physicalQuantity="COST" id="6924031c-0548-4b33-a341-3d03c5c2b5a0" description="Cost in EUR"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1" id="f96d02d7-19d1-4a0b-8869-2d180f39b7e6">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.042720861938854" lon="4.311695247888566"/>
        <port xsi:type="esdl:InPort" connectedTo="66590f96-a397-4d6f-9cfb-e7d34232cad6 f966bade-1fad-453f-8ec2-4062ec70bc7b" id="51852861-aeeb-461f-b8ec-08f000abc6dd" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="c0eac4db-f5da-47f3-8202-8438d000bd32" connectedTo="5f65520d-61ee-4f68-8002-271f48f1daee 578ec414-3f11-430e-a893-60ea77848ff5 2e672d8b-ee9b-4c8b-8357-58ea984ae6be c7ad4fce-efbb-4b30-9508-f71a4356ca2d" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_2" id="d74db9ba-b86c-486a-8911-3ff368ae63a3">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.04075678384997" lon="4.313372969627381"/>
        <port xsi:type="esdl:InPort" connectedTo="dc1bc94f-26f2-4a49-a3bf-d0614b1f0df2" id="e0adf80a-b6f3-4c12-a439-dab4e555202a" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="ed75b210-6b5a-488e-8a8d-efe570c84990" connectedTo="4b92e418-4ca6-4765-85ab-ce30f4127bf0 d1ce17fe-572d-4ade-a6e1-a3d3aa0fab64" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_3" id="da2f12dc-0b74-4719-bc50-18d847524db3">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.038770345781394" lon="4.315127134323121"/>
        <port xsi:type="esdl:InPort" connectedTo="8f1bea52-e322-4d34-ad43-7d1e97243d62" id="1cb923b5-2a69-46d9-874c-68d552ef5576" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="a02e41ab-99f8-46d3-b2d1-be44aa5b7914" connectedTo="7f162a30-7e41-4d7f-b011-ffcf4c1651f8" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
      </asset>
      <asset xsi:type="esdl:ATES" aquiferNetToGross="1.0" name="ATES_033c" aquiferThickness="45.0" state="OPTIONAL" maxDischargeRate="11610000.0" wellCasingSize="13.0" aquiferAnisotropy="4.0" aquiferPorosity="0.3" aquiferMidTemperature="17.0" aquiferTopDepth="300.0" id="033c2598-5c1a-48b7-93b1-c746b81819ff" wellDistance="150.0" maxChargeRate="11610000.0" salinity="10000.0" aquiferPermeability="10000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.04364884025295" lon="4.314751625061036"/>
        <dataSource xsi:type="esdl:DataSource" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution="" name="WarmingUp factsheet: HT-ATES (high)"/>
        <port xsi:type="esdl:InPort" connectedTo="e15db059-ab19-4483-9911-7a37f0c08e42" id="33a9041b-dd75-42c0-94a3-584c5e374927" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="0117d26b-8ab1-44b5-afee-51702e431e52" connectedTo="febc9c00-71c8-4b12-b005-28beaae24e7b" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
        <costInformation xsi:type="esdl:CostInformation">
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="6.0" id="7a789b95-93bb-415b-abbd-4ecbb6ad60c9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="c52334c9-bc5d-41f4-b93d-10e7b769f281" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" unit="EURO" physicalQuantity="COST"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="233359.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a3b5cdd9-364b-4262-bce5-4658c5f1bac9" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" unit="EURO"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="1000000.0" id="22528972-1920-42d8-9e0c-115f419c31d1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="620a8529-43ec-4674-8ed3-10befaff0742" physicalQuantity="COST" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1_ret" id="6d97700c-a3d7-4127-b64c-f08ee2e308f9">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.04281086202885" lon="4.311074402665649"/>
        <port xsi:type="esdl:OutPort" id="2913e645-b027-429e-bf5d-22ace96a39fa" connectedTo="dd50e603-c87c-4cdb-82bb-486ebee77255 42e9f86b-ea96-4992-bf3f-9cbae8a4a39c" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="ret_port"/>
        <port xsi:type="esdl:InPort" connectedTo="0431b8a0-a8d1-4375-b348-37a475add47a 6b655eb1-2b66-455f-90a3-0dd6f2844fab 8271240c-cae3-4e81-8b36-d65302a4e6b4 2b341054-a732-404f-a361-d39c4cb4e271" id="7893125d-d82f-4fe8-aaea-5fb6afecc635" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="ret_port"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_2_ret" id="e615c77a-bb75-411b-92c2-549efbdf8ec8">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.04084678393997" lon="4.312746245529536"/>
        <port xsi:type="esdl:InPort" connectedTo="b3187ef9-cd0b-4ea8-90e4-eab39fa225e9 4b3973ab-6e4b-48af-947d-52c6d30f20ea" id="a1b719cb-f735-4a30-a0d2-cf6945b3afa1" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="ret_port"/>
        <port xsi:type="esdl:OutPort" id="2dd7961b-46ce-4027-84b6-cc2684a03a7b" connectedTo="0650d850-58a9-45b3-8313-a3156a061988" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="ret_port"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_3_ret" id="a90d146f-e234-459c-974e-7867afbbb3f0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.03886034587139" lon="4.314494347576344"/>
        <port xsi:type="esdl:InPort" connectedTo="2045aca9-4e50-42ec-99de-fbcffa627a86" id="f36b9767-8e64-4744-8cd0-08acb2ae873b" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="ret_port"/>
        <port xsi:type="esdl:OutPort" id="59ccdddc-893b-4152-8bc4-0168e7e74bf3" connectedTo="2b7c3acb-69a7-497d-a72f-b98db189841c" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="ret_port"/>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe1" diameter="DN450" name="Pipe1_ret" length="245.7" id="Pipe1_ret" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.04283148397849" lon="4.311099944779182"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.04478805128214" lon="4.309437355033006"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="2913e645-b027-429e-bf5d-22ace96a39fa" id="dd50e603-c87c-4cdb-82bb-486ebee77255" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="e31e12c2-8f80-4aed-9e4b-918445a32996" connectedTo="ba9ca084-b71f-42a3-884a-f2f2b3ae4265" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="03c07293-f6d4-4aa6-a297-5312c4d1c27e">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" id="9b449144-d0bf-45b9-8822-15dba1d4126d">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="6dbe093f-f6dd-49b4-9d5e-a2cd578611be" description="Cost in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe2" diameter="DN450" name="Pipe2_ret" length="195.4" id="Pipe2_ret" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.04211218475326" lon="4.308378045386691"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.04280178836801" lon="4.311008661644606"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ef74ea8c-89b4-42e0-a98c-411860876c1a" id="18ce6906-595c-45e4-acf0-e07f7d7648c6" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="0431b8a0-a8d1-4375-b348-37a475add47a" connectedTo="7893125d-d82f-4fe8-aaea-5fb6afecc635" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="bec83070-2c51-4825-82f3-92434bd3e59c">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" id="1c33024c-99c8-4168-b353-9f099b59eb60">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="26fdb8bf-6413-4272-a56b-b084823ac574" description="Cost in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe3" diameter="DN450" name="Pipe3_ret" length="241.6" id="Pipe3_ret" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.040874831021554" lon="4.312773152370705"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.0427984888545" lon="4.3111373978948455"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="2dd7961b-46ce-4027-84b6-cc2684a03a7b" id="0650d850-58a9-45b3-8313-a3156a061988" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="6b655eb1-2b66-455f-90a3-0dd6f2844fab" connectedTo="7893125d-d82f-4fe8-aaea-5fb6afecc635" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="38f2f0f7-f814-4baf-ae3a-365af1b872db">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" id="78221659-7294-4830-802c-67e38364b1f0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="19f63b61-453d-4213-bdc6-86f65468fec9" description="Cost in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe4" diameter="DN450" name="Pipe4_ret" length="189.7" id="Pipe4_ret" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.04016209972487" lon="4.310158519812684"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.040851733426216" lon="4.312697980725036"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="bf6e0b6b-baac-468b-a9ba-f8397babf5d6" id="d126f79e-c43e-4d9d-a7ce-8f58be634695" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="b3187ef9-cd0b-4ea8-90e4-eab39fa225e9" connectedTo="a1b719cb-f735-4a30-a0d2-cf6945b3afa1" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="2a15456e-d23e-4064-8dee-c0588d3b05dc">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" id="0297b96a-c32c-41f8-8653-0085659dba29">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9869b0d2-dfa3-4148-86ab-ddd1cb43b7c7" description="Cost in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe5" diameter="DN450" name="Pipe5_ret" length="244.6" id="Pipe5_ret" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.038888394199375" lon="4.314505162850188"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.040828635818976" lon="4.312826656948579"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="59ccdddc-893b-4152-8bc4-0168e7e74bf3" id="2b7c3acb-69a7-497d-a72f-b98db189841c" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="4b3973ab-6e4b-48af-947d-52c6d30f20ea" connectedTo="a1b719cb-f735-4a30-a0d2-cf6945b3afa1" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="387eb458-4e3e-4e0d-bf1c-0ca2d77aa4dd">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" id="b78ac8a7-9d0e-4603-821b-febf58b48bb3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d6547801-0eb7-4ed4-9597-1e79cc093622" description="Cost in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL"  related="Pipe6" diameter="DN450" name="Pipe6_ret" length="176.6" id="Pipe6_ret" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.03810303436292" lon="4.312174575996732"/>
          <point xsi:type="esdl:Point" CRS="WGS84" lat="52.03884219694389" lon="4.314462105124955"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="9c025b19-57d1-43a8-b2e8-db3e684756f2" id="5cd0f2e0-d456-4909-a81c-4b312b1be857" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In_ret"/>
        <port xsi:type="esdl:OutPort" id="2045aca9-4e50-42ec-99de-fbcffa627a86" connectedTo="f36b9767-8e64-4744-8cd0-08acb2ae873b" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="cbbb74ba-ba6f-4f17-a78f-3b3c07ce531d">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" id="ae5f4f5f-1323-4a3b-98c8-faca321a00c7">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="18570b20-b820-43d0-952a-b6eaf166c639" description="Cost in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="50000000.0" name="HeatProducer_2" id="da00ddfc-cfa4-4f21-b5be-7c69d2bf53bb" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.311726093292237" CRS="WGS84" lat="52.04487621664103"/>
        <port xsi:type="esdl:OutPort" id="886e5430-bec1-44e3-bab6-221c4518c810" connectedTo="bbfed830-071d-4d02-bddd-e709247c8337" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="df6f89d0-7872-4891-934f-de407f6aa142" id="c7ed8915-ddd0-47f8-93d6-1dabfb5d320b" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In"/>
        <costInformation xsi:type="esdl:CostInformation" id="d59fe0c4-5156-4dcf-b259-6ac6855241c6">
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="6.0" id="7a789b95-93bb-415b-abbd-4ecbb6ad60c9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="c52334c9-bc5d-41f4-b93d-10e7b769f281" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" unit="EURO" physicalQuantity="COST"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="100000.0" id="3633cd09-9f87-4d8d-a5f8-0431bab9576d">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="88a009ff-0eeb-48b1-9eb3-60dba04b3e79" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="2b2f4b93-32c7-4f20-9723-5900cc76fe20">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b0975eef-2e13-4b7f-b89a-64a47183e8cc" physicalQuantity="COST" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" related="Pipe_f6e5_ret" diameter="DN450" name="Pipe_f6e5" length="239.7" id="Pipe_f6e5" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.311726093292237" lat="52.04487621664103"/>
          <point xsi:type="esdl:Point" lon="4.311695247888566" lat="52.042720861938854"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="886e5430-bec1-44e3-bab6-221c4518c810" id="bbfed830-071d-4d02-bddd-e709247c8337" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="f966bade-1fad-453f-8ec2-4062ec70bc7b" connectedTo="51852861-aeeb-461f-b8ec-08f000abc6dd" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="371c1d72-de35-4559-9b0e-47172e5d1d83"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0805">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="df30bd37-2fc4-4993-828f-1b7cf1e8202c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.006">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="f53de37b-a735-4b0d-b226-a6b722029a01"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="22fb2e85-7a81-4371-b6ab-6d5101b8ca45">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" name="Combined investment and installation costs" id="a40165e8-88bd-49b9-81d9-298812ac0170">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0aebc76-201b-4b2d-81fe-55269fcefe3b" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" related="Pipe_f6e5" diameter="DN450" name="Pipe_f6e5_ret" length="233.9" id="Pipe_f6e5_ret" innerDiameter="0.4444" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.311074402665649" lat="52.04281086202885"/>
          <point xsi:type="esdl:Point" lon="4.311726093292237" lat="52.04487621664103"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="2913e645-b027-429e-bf5d-22ace96a39fa" id="42e9f86b-ea96-4992-bf3f-9cbae8a4a39c" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="df6f89d0-7872-4891-934f-de407f6aa142" connectedTo="c7ed8915-ddd0-47f8-93d6-1dabfb5d320b" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="371c1d72-de35-4559-9b0e-47172e5d1d83"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0805">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="df30bd37-2fc4-4993-828f-1b7cf1e8202c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.006">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="f53de37b-a735-4b0d-b226-a6b722029a01"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="7cbc9c32-3d7d-44e1-ab73-598459294f0c">
          <investmentCosts xsi:type="esdl:SingleValue" value="3417.9" name="Combined investment and installation costs" id="a40165e8-88bd-49b9-81d9-298812ac0170">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0aebc76-201b-4b2d-81fe-55269fcefe3b" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatStorage" name="HeatStorage_74c1" id="74c13eed-9ca8-4247-bd72-a68e242d8e1b" maxDischargeRate="10000000.0" state="OPTIONAL" maxChargeRate="10000000.0" volume="500.0">
        <geometry xsi:type="esdl:Point" lon="4.313871860504151" CRS="WGS84" lat="52.042658996032856"/>
        <port xsi:type="esdl:InPort" connectedTo="636a1943-2289-4d57-a2dd-33aaa4f25b49" id="8c09b9ff-5070-4fbc-97fe-db7a501932dc" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="cc725203-e648-490f-a12d-91fa85ee58f2" connectedTo="a581c340-3cab-46b1-924f-c5ddc0120de6" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
        <costInformation xsi:type="esdl:CostInformation" id="4e390bc0-04b9-4c38-af99-077d7836f877">
          <investmentCosts xsi:type="esdl:SingleValue" value="690.0" id="40414844-ab63-452e-9558-057d61623ba9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a95abc37-2285-4d68-88ad-dba3e1e8aaf9" description="COST in EUR/m3" perUnit="CUBIC_METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="1000000.0" id="22528972-1920-42d8-9e0c-115f419c31d1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="620a8529-43ec-4674-8ed3-10befaff0742" physicalQuantity="COST" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" related="Pipe_9768_ret" diameter="DN450" name="Pipe_9768" id="Pipe_9768" innerDiameter="0.4444" length="149.0" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.311695247888566" lat="52.042720861938854"/>
          <point xsi:type="esdl:Point" lon="4.313871860504151" lat="52.042658996032856"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="c0eac4db-f5da-47f3-8202-8438d000bd32" id="2e672d8b-ee9b-4c8b-8357-58ea984ae6be" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="636a1943-2289-4d57-a2dd-33aaa4f25b49" connectedTo="8c09b9ff-5070-4fbc-97fe-db7a501932dc" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="371c1d72-de35-4559-9b0e-47172e5d1d83"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0805">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="df30bd37-2fc4-4993-828f-1b7cf1e8202c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.006">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="f53de37b-a735-4b0d-b226-a6b722029a01"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="6939255e-b8a1-4045-9739-74690c35fda4">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="a40165e8-88bd-49b9-81d9-298812ac0170" value="3417.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0aebc76-201b-4b2d-81fe-55269fcefe3b" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" related="Pipe_9768" diameter="DN450" name="Pipe_9768_ret" id="Pipe_9768_ret" innerDiameter="0.4444" length="192.1" outerDiameter="0.63">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.313871860504151" lat="52.042658996032856"/>
          <point xsi:type="esdl:Point" lon="4.311074402665649" lat="52.04281086202885"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="cc725203-e648-490f-a12d-91fa85ee58f2" id="a581c340-3cab-46b1-924f-c5ddc0120de6" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="8271240c-cae3-4e81-8b36-d65302a4e6b4" connectedTo="7893125d-d82f-4fe8-aaea-5fb6afecc635" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="371c1d72-de35-4559-9b0e-47172e5d1d83"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0805">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="df30bd37-2fc4-4993-828f-1b7cf1e8202c"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.006">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="f53de37b-a735-4b0d-b226-a6b722029a01"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="68394efa-f98e-4fbe-9418-b5975d7c0fe7">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="a40165e8-88bd-49b9-81d9-298812ac0170" value="3417.9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d0aebc76-201b-4b2d-81fe-55269fcefe3b" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" related="Pipe_352c_ret" diameter="DN400" name="Pipe_352c" outerDiameter="0.63" id="Pipe_352c" innerDiameter="0.3938" length="233.1">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.311695247888566" lat="52.042720861938854"/>
          <point xsi:type="esdl:Point" lon="4.314751625061036" lat="52.04364884025295"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="ae32d30b-4e0d-4470-a4f0-4ba7bd258070" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="5d591b58-2cf8-4d94-91eb-be773e1c25ee" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0066">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="8a0279cc-afbf-46fb-a590-33960ce30613" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" connectedTo="c0eac4db-f5da-47f3-8202-8438d000bd32" id="c7ad4fce-efbb-4b30-9508-f71a4356ca2d" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="e15db059-ab19-4483-9911-7a37f0c08e42" connectedTo="33a9041b-dd75-42c0-94a3-584c5e374927" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="ea319afa-4c85-49d6-80f6-313f6866cdc7">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="566d3f26-f85a-48b4-b06a-5fd62ac6fa61" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5b1085e4-5642-4c1d-aa7c-bfb7793d4e64" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" state="OPTIONAL" related="Pipe_352c" diameter="DN400" name="Pipe_352c_ret" outerDiameter="0.63" id="Pipe_352c_ret" innerDiameter="0.3938" length="234.8">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.314306378364564" lat="52.043747823469246"/>
          <point xsi:type="esdl:Point" lon="4.311178922653199" lat="52.04287676364216"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="ae32d30b-4e0d-4470-a4f0-4ba7bd258070" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.1052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="5d591b58-2cf8-4d94-91eb-be773e1c25ee" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0066">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="8a0279cc-afbf-46fb-a590-33960ce30613" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" connectedTo="0117d26b-8ab1-44b5-afee-51702e431e52" id="febc9c00-71c8-4b12-b005-28beaae24e7b" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="2b341054-a732-404f-a361-d39c4cb4e271" connectedTo="7893125d-d82f-4fe8-aaea-5fb6afecc635" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="aa0df5f9-2ce9-4153-8761-a4a0288edfbf">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="566d3f26-f85a-48b4-b06a-5fd62ac6fa61" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5b1085e4-5642-4c1d-aa7c-bfb7793d4e64" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
    </area>
  </instance>
  <templates xsi:type="esdl:Templates" id="a564dad8-2c39-483c-8ebe-e8fb4f0adf51" name="Pipe catalog" description="Pipe catalog">
    <assetTemplate xsi:type="esdl:AssetTemplate" id="ea8983eb-6885-4a45-adbc-caabcad3f9cd" name="Pipe DN20" description="Pipe DN20">
    <asset xsi:type="esdl:Pipe" id="5ebdf710-8047-4ff1-b922-78192f667ed7" name="DN20 pipe" diameter="DN20">
      <costInformation xsi:type="esdl:CostInformation" id="b937dec4-0422-4cea-a709-331ddb8de1f7">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="a0b3509d-26ce-4984-8a2b-6d8a23169c5b" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="e038e9ad-72c5-42a6-aab8-edd194979417" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="4c623284-d972-4e02-9dc7-be79a8f08463" name="Pipe DN32" description="Pipe DN32">
    <asset xsi:type="esdl:Pipe" id="38bc2665-ef35-4e62-99ad-7a65096c7274" name="DN32 pipe" diameter="DN32">
      <costInformation xsi:type="esdl:CostInformation" id="e7491e20-d6f3-481d-affe-74c3b0bb1b26">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="4083ee9f-e31a-448a-be4a-ddacb2acfd46" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="c05be78b-5549-440d-aa11-d0d9eac1e708" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="125a1284-f700-46f7-b579-579db0ce54aa" name="Pipe DN40" description="Pipe DN40">
    <asset xsi:type="esdl:Pipe" id="5290f85f-6815-4501-a6d5-c979adf25e3b" name="DN40 pipe" diameter="DN40">
      <costInformation xsi:type="esdl:CostInformation" id="450c1a42-a9d0-406f-b39c-ae4fde8a28a2">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="9e2c1e41-e227-4c10-9cff-3a4860adb846" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="50f5e3d9-9582-4325-9bcc-210d1c39c8cb" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="847d5ff1-c1f7-4c97-aaa4-59705f5d61f7" name="Pipe DN50" description="Pipe DN50">
    <asset xsi:type="esdl:Pipe" id="c27fd92c-8542-4ec9-82a5-265e46ffc3c9" name="DN50 pipe" diameter="DN50">
      <costInformation xsi:type="esdl:CostInformation" id="6bf657ca-96b0-449b-a133-facb0bb7e82f">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="d2dcdfe6-c33b-480d-ba3c-65c422f76c31" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="ffb4c0f3-6426-49a9-bb78-8ec08578450e" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="d7f0d6e8-9669-4a95-9bb2-277dd4e579ee" name="Pipe DN65" description="Pipe DN65">
    <asset xsi:type="esdl:Pipe" id="770b6d0c-ac92-4dc1-9b91-12bc51ecbf17" name="DN65 pipe" diameter="DN65">
      <costInformation xsi:type="esdl:CostInformation" id="8bb38b90-fc8f-45f8-b721-9ece13bb5484">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="4dd873c8-4271-4d7c-90ea-bb2ca0748d14" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="72553109-a544-43c9-8667-3d6dc7adc56b" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="a3b4880b-e937-414b-ae0c-3f384291a4bc" name="Pipe DN80" description="Pipe DN80">
    <asset xsi:type="esdl:Pipe" id="f4345138-6a5d-40da-b18a-3793485f5661" name="DN80 pipe" diameter="DN80">
      <costInformation xsi:type="esdl:CostInformation" id="bdbc88d5-1600-47b7-8ad9-8434aed53afb">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="e4b726d2-d1d8-4016-b27f-90d18082b2d6" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="5cdd38e7-23b8-4087-9369-6bdbd79cbde4" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="a53acc93-4cfd-4fbb-aecf-21031ad9884b" name="Pipe DN100" description="Pipe DN100">
    <asset xsi:type="esdl:Pipe" id="8b2a4a66-7c9b-4cc3-a8d2-88eee43ee24a" name="DN100 pipe" diameter="DN100">
      <costInformation xsi:type="esdl:CostInformation" id="4e6c46df-c94e-41a0-9f87-6addb1c5fb6f">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="0471abae-9ff3-4947-850f-6a13fd052c43" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="98df5e7f-3db8-4a30-9398-d2c65928375e" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="457f32db-4596-4ce4-8221-ef397be5373c" name="Pipe DN125" description="Pipe DN125">
    <asset xsi:type="esdl:Pipe" id="cb05bf3d-a3da-4690-bbd0-15ba0f54e4c1" name="DN125 pipe" diameter="DN125">
      <costInformation xsi:type="esdl:CostInformation" id="b4a8beee-be6f-4238-8858-5cc241dca6e4">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="094b92f9-c54c-4914-ab60-af45b709401a" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="c6941606-8eea-4e5a-82d4-e9155dff423c" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="57bc10a1-8ff4-4c33-9a0c-e392df0b2f47" name="Pipe DN150" description="Pipe DN150">
    <asset xsi:type="esdl:Pipe" id="5debfd80-a97e-41ac-aff6-7ffd749a28b8" name="DN150 pipe" diameter="DN150">
      <costInformation xsi:type="esdl:CostInformation" id="ae12604c-0ae2-4369-a0e0-116ce91f5e64">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7d71dfb9-b039-4e60-aebe-4f6c94e62058" value="1500.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="b9de0739-bc81-4565-9c17-11c26ad5cdf7" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="1589d9c7-b3a1-4e62-bd72-0c4f087bc4b0" name="Pipe DN200" description="Pipe DN200">
    <asset xsi:type="esdl:Pipe" id="b62b15c0-c922-4c2f-a29e-1161bdabf6f5" name="DN200 pipe" diameter="DN200">
      <costInformation xsi:type="esdl:CostInformation" id="9de87662-4bab-49d9-993c-5e38c4cf5851">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1f6dbe19-b522-46e6-a7e6-c0efc49ec9bf" value="2000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="cbfe2059-1909-4738-bf5a-c83cdcd53bf7" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="9ddbb7de-8518-4e1b-b8f7-55dbfb501e23" name="Pipe DN250" description="Pipe DN250">
    <asset xsi:type="esdl:Pipe" id="0899b73b-8eac-40b2-87da-9be5079704ff" name="DN250 pipe" diameter="DN250">
      <costInformation xsi:type="esdl:CostInformation" id="a1500a39-bf0b-4bc0-8b4b-b74efe891987">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="c75ef601-c027-49f7-aa1a-2535ead7f9d5" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="5fd66412-720c-4d9b-a2e6-662be5b606ce" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="dfbe1fbc-dcee-4251-a76d-42c81b419cfb" name="Pipe DN300" description="Pipe DN300">
    <asset xsi:type="esdl:Pipe" id="0745acc4-c177-4181-a722-2e8f0fc32a71" name="DN300 pipe" diameter="DN300">
      <costInformation xsi:type="esdl:CostInformation" id="d34ee407-e512-4fe4-a9b8-abb44df3e2da">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="0b306195-3f98-4b14-9d83-6112af0b4e22" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="f29ac96b-e0b9-4eec-a766-296aa2bcd955" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="363d94cb-29d2-4d8f-981c-11931bceae7b" name="Pipe DN350" description="Pipe DN350">
    <asset xsi:type="esdl:Pipe" id="c0b8ab88-c7c3-4188-ac2d-9ee3658cf582" name="DN350 pipe" diameter="DN350">
      <costInformation xsi:type="esdl:CostInformation" id="ba67d991-e732-41b8-ae21-ffe968d631f3">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="84263e3e-fb55-4164-8cd7-6a158a7305c0" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="e92d9b63-fc0b-4eb6-9aea-cadc4733b878" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="033321ca-4a45-4a34-9042-ab397c4f492d" name="Pipe DN400" description="Pipe DN400">
    <asset xsi:type="esdl:Pipe" id="bc485f99-d368-40be-8e76-94b7c0f3642c" name="DN400 pipe" diameter="DN400">
      <costInformation xsi:type="esdl:CostInformation" id="4bb27801-31aa-43ea-953b-9a074306bd19">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="63009710-c67a-4ee6-a2a3-c2dfc95bed5a" value="2840.6">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="36d09339-bd33-4bf3-8a3d-4194e72f7ddc" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="c51856c0-734d-48d9-a203-9a9ead5dca0d" name="Pipe DN450" description="Pipe DN450">
    <asset xsi:type="esdl:Pipe" id="96e39665-1824-4e60-9c33-4089aeeebf24" name="DN450 pipe" diameter="DN450">
      <costInformation xsi:type="esdl:CostInformation" id="4c31e631-7eda-40ac-b1bf-7c4538187170">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="e3dfe611-3c1f-461f-a8ce-e73830f97ab8" value="6835.8">""
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="013dc4b9-9591-403b-9da6-e29c1cd43ef0" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="807bebae-0b62-454e-adda-180679644ada" name="Pipe DN500" description="Pipe DN500">
    <asset xsi:type="esdl:Pipe" id="0d0ae1e2-fe51-4f2a-9a00-58cce4fcae72" name="DN500 pipe" diameter="DN500">
      <costInformation xsi:type="esdl:CostInformation" id="b29bc41d-d188-4d4c-b88c-e863066d50fe">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="73b986ff-b2ad-4906-9d97-ffdc6e784292" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="a68d411f-7d37-47c1-8c24-770bb8695129" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="bdd4742f-d81b-422b-8a1f-b5be6ca4a4a4" name="Pipe DN600" description="Pipe DN600">
    <asset xsi:type="esdl:Pipe" id="31f0e5ac-d3f3-4986-887b-1785791a64b5" name="DN600 pipe" diameter="DN600">
      <costInformation xsi:type="esdl:CostInformation" id="325eea1d-4955-4755-9d9c-6158b72602c2">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="5a31d35d-c7ab-472c-a02c-9e7195497c99" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="2eea1218-a5be-4931-96d5-88cc1b97053d" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="bd658016-b8ef-40e4-918c-9a2596bc13a1" name="Pipe DN700" description="Pipe DN700">
    <asset xsi:type="esdl:Pipe" id="ee559a71-4bf2-4ba9-add8-d81b91b3878c" name="DN700 pipe" diameter="DN700">
      <costInformation xsi:type="esdl:CostInformation" id="bdc73021-3a82-4a3f-9169-156ca8cabc18">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="d84a8fbd-cd54-4f7f-9089-510c2d295f34" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="92882a1e-ddc1-4771-b156-cf9f0aa9f0be" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="48041467-aa26-451d-b757-c9b290e11b94" name="Pipe DN800" description="Pipe DN800">
    <asset xsi:type="esdl:Pipe" id="39e2d0dd-2f5c-48b0-aa13-40f8eaa356a7" name="DN800 pipe" diameter="DN800">
      <costInformation xsi:type="esdl:CostInformation" id="112e1254-1f85-43ae-9828-36e2988145ba">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="fa8c1faf-bd67-4cc6-885b-efa93966f5d7" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="2f976747-fd1b-4386-bb53-c2729860aebb" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="36442c19-43a8-4614-8ce7-44bfb5ad56b9" name="Pipe DN900" description="Pipe DN900">
    <asset xsi:type="esdl:Pipe" id="1ea04211-4b6d-4b76-a17f-c31889161443" name="DN900 pipe" diameter="DN900">
      <costInformation xsi:type="esdl:CostInformation" id="87050d47-a96b-436f-bbcf-9f312d22c4f8">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="efa84b19-7a15-4379-8476-56dc2eaaeb6f" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="292b1458-f794-4c5d-87a0-532ea967a7b8" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="3eab818d-4900-4282-a1f6-092e3ddf687c" name="Pipe DN1000" description="Pipe DN1000">
    <asset xsi:type="esdl:Pipe" id="b7f2776f-bea0-4828-8c87-6f9516665c94" name="DN1000 pipe" diameter="DN1000">
      <costInformation xsi:type="esdl:CostInformation" id="9be25611-26e8-44e6-bb31-cf0def7e3790">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="777c6b1b-2d1d-49a1-a4fb-902ad323b6b2" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="c6ffaa18-fb29-4f99-a8df-db89d95f7ec2" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="ca0b4762-dfa3-4240-be9e-f4e6ca19b7a5" name="Pipe DN1100" description="Pipe DN1100">
    <asset xsi:type="esdl:Pipe" id="481b3dd1-f399-4c7a-bf9b-b9d0dcccc818" name="DN1100 pipe" diameter="DN1100">
      <costInformation xsi:type="esdl:CostInformation" id="49f32fc9-0507-4e2a-94d6-a4ef1f7f7391">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="212b6b9b-a3e5-4fba-bba4-fbc4ecccca86" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="139c0e5f-bb71-4e18-8ca6-a0c35c98d9b7" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  <assetTemplate xsi:type="esdl:AssetTemplate" id="ac49d49f-50a3-46a2-bf5a-7954e94696f4" name="Pipe DN1200" description="Pipe DN1200">
    <asset xsi:type="esdl:Pipe" id="632709a1-ca6f-4eec-8236-e7f37b0d9d64" name="DN1200 pipe" diameter="DN1200">
      <costInformation xsi:type="esdl:CostInformation" id="7dac353e-68de-4471-8ec8-b2b9ad903b1e">
        <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="e82780a1-cbb6-473b-9a37-633a4c37d027" value="1000.0">
          <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="5c802809-99c4-4b3d-a60d-b679245e8c0c" />
          </investmentCosts>
        </costInformation>
      </asset>
    </assetTemplate>
  </templates>
</esdl:EnergySystem>
