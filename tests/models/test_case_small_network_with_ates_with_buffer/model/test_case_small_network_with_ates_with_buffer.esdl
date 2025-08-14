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
      <asset xsi:type="esdl:Pipe" related="Pipe1_ret" diameter="DN450" name="Pipe1" length="245.7" id="Pipe1" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" related="Pipe2_ret" diameter="DN450" name="Pipe2" length="195.4" id="Pipe2" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" related="Pipe3_ret" diameter="DN450" name="Pipe3" length="241.6" id="Pipe3" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" related="Pipe4_ret" diameter="DN450" name="Pipe4" length="189.7" id="Pipe4" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" related="Pipe5_ret" diameter="DN450" name="Pipe5" length="244.6" id="Pipe5" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" related="Pipe6_ret" diameter="DN450" name="Pipe6" length="176.6" id="Pipe6" innerDiameter="0.4444" outerDiameter="0.63">
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
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="5000.0" id="7a789b95-93bb-415b-abbd-4ecbb6ad60c9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="88a009ff-0eeb-48b1-9eb3-60dba04b3e79" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" unit="EURO" physicalQuantity="COST"/>
          </fixedOperationalCosts>
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
        <port xsi:type="esdl:OutPort" id="c0eac4db-f5da-47f3-8202-8438d000bd32" connectedTo="5f65520d-61ee-4f68-8002-271f48f1daee 578ec414-3f11-430e-a893-60ea77848ff5 2e672d8b-ee9b-4c8b-8357-58ea984ae6be d89aec21-40a8-4014-86ee-2aba9f3ccbe5" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
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
      <asset xsi:type="esdl:ATES" aquiferNetToGross="1.0" name="ATES_033c" aquiferThickness="45.0" maxDischargeRate="11610000.0" wellCasingSize="13.0" aquiferAnisotropy="4.0" aquiferPorosity="0.3" aquiferMidTemperature="17.0" aquiferTopDepth="300.0" id="033c2598-5c1a-48b7-93b1-c746b81819ff" wellDistance="150.0" maxChargeRate="11610000.0" salinity="10000.0" aquiferPermeability="10000.0">
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.04364884025295" lon="4.314751625061036"/>
        <dataSource xsi:type="esdl:DataSource" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution="" name="WarmingUp factsheet: HT-ATES (high)"/>
        <port xsi:type="esdl:InPort" connectedTo="350d66d9-dea3-4a42-85e4-ec9e2c127444" id="33a9041b-dd75-42c0-94a3-584c5e374927" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="0117d26b-8ab1-44b5-afee-51702e431e52" connectedTo="3ec3a129-928e-4152-9f98-2baa194e66c4" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
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
        <port xsi:type="esdl:InPort" connectedTo="0431b8a0-a8d1-4375-b348-37a475add47a 6b655eb1-2b66-455f-90a3-0dd6f2844fab 8271240c-cae3-4e81-8b36-d65302a4e6b4 b314b276-dcb4-4668-a337-5eef17ff164d" id="7893125d-d82f-4fe8-aaea-5fb6afecc635" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="ret_port"/>
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
      <asset xsi:type="esdl:Pipe" related="Pipe1" diameter="DN450" name="Pipe1_ret" length="245.7" id="Pipe1_ret" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" related="Pipe2" diameter="DN450" name="Pipe2_ret" length="195.4" id="Pipe2_ret" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" related="Pipe3" diameter="DN450" name="Pipe3_ret" length="241.6" id="Pipe3_ret" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" related="Pipe4" diameter="DN450" name="Pipe4_ret" length="189.7" id="Pipe4_ret" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" related="Pipe5" diameter="DN450" name="Pipe5_ret" length="244.6" id="Pipe5_ret" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" related="Pipe6" diameter="DN450" name="Pipe6_ret" length="176.6" id="Pipe6_ret" innerDiameter="0.4444" outerDiameter="0.63">
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
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="5000.0" id="7a789b95-93bb-415b-abbd-4ecbb6ad60c9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="88a009ff-0eeb-48b1-9eb3-60dba04b3e79" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" unit="EURO" physicalQuantity="COST"/>
          </fixedOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="100000.0" id="3633cd09-9f87-4d8d-a5f8-0431bab9576d">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="88a009ff-0eeb-48b1-9eb3-60dba04b3e79" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="2b2f4b93-32c7-4f20-9723-5900cc76fe20">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b0975eef-2e13-4b7f-b89a-64a47183e8cc" physicalQuantity="COST" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN450" name="Pipe_f6e5" length="239.7" id="f6e5a760-01d5-4341-bf15-b8d33b7bea50" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" diameter="DN450" name="Pipe_f6e5_ret" length="233.9" id="0db91515-418a-4bcb-9d99-9047c1ca8bdf" innerDiameter="0.4444" outerDiameter="0.63">
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
      <asset xsi:type="esdl:HeatStorage" name="HeatStorage_74c1" id="74c13eed-9ca8-4247-bd72-a68e242d8e1b" maxDischargeRate="10000000.0" maxChargeRate="10000000.0" volume="500.0">
        <geometry xsi:type="esdl:Point" lon="4.313871860504151" CRS="WGS84" lat="52.042658996032856"/>
        <port xsi:type="esdl:InPort" connectedTo="636a1943-2289-4d57-a2dd-33aaa4f25b49" id="8c09b9ff-5070-4fbc-97fe-db7a501932dc" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="cc725203-e648-490f-a12d-91fa85ee58f2" connectedTo="a581c340-3cab-46b1-924f-c5ddc0120de6" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
        <costInformation xsi:type="esdl:CostInformation" id="4e390bc0-04b9-4c38-af99-077d7836f877">
          <investmentCosts xsi:type="esdl:SingleValue" value="690.0" id="40414844-ab63-452e-9558-057d61623ba9">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a95abc37-2285-4d68-88ad-dba3e1e8aaf9" description="COST in EUR/m3" perUnit="CUBIC_METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN450" name="Pipe_9768" id="97684360-d920-45c2-a584-a092fdcf91f1" innerDiameter="0.4444" length="149.0" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" diameter="DN450" name="Pipe_9768_ret" id="3542e501-01ea-468b-9d4f-c1e7c67b43d9" innerDiameter="0.4444" length="192.1" outerDiameter="0.63">
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
      <asset xsi:type="esdl:Pipe" diameter="DN400" name="Pipe_8125" outerDiameter="0.63" id="81250990-a84d-47c5-b923-b087329d35f8" innerDiameter="0.3938" length="233.1">
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
        <port xsi:type="esdl:InPort" connectedTo="c0eac4db-f5da-47f3-8202-8438d000bd32" id="d89aec21-40a8-4014-86ee-2aba9f3ccbe5" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="In"/>
        <port xsi:type="esdl:OutPort" id="350d66d9-dea3-4a42-85e4-ec9e2c127444" connectedTo="33a9041b-dd75-42c0-94a3-584c5e374927" carrier="7b32e287-d775-480c-b317-64ffdacf12c9" name="Out"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="9180beaf-4b01-4d6d-9292-ce4434da40f9">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="566d3f26-f85a-48b4-b06a-5fd62ac6fa61" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5b1085e4-5642-4c1d-aa7c-bfb7793d4e64" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN400" name="Pipe_8125_ret" outerDiameter="0.63" id="57872968-57f4-4702-a0d7-78987855e877" innerDiameter="0.3938" length="232.9">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.314354658126832" lat="52.04373462571976"/>
          <point xsi:type="esdl:Point" lon="4.311237931251527" lat="52.042889961645"/>
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
        <port xsi:type="esdl:InPort" connectedTo="0117d26b-8ab1-44b5-afee-51702e431e52" id="3ec3a129-928e-4152-9f98-2baa194e66c4" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="In"/>
        <port xsi:type="esdl:OutPort" id="b314b276-dcb4-4668-a337-5eef17ff164d" connectedTo="7893125d-d82f-4fe8-aaea-5fb6afecc635" carrier="7b32e287-d775-480c-b317-64ffdacf12c9_ret" name="Out"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="25cd514a-a4a7-4b3c-832e-69bd1544ec90">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="566d3f26-f85a-48b4-b06a-5fd62ac6fa61" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5b1085e4-5642-4c1d-aa7c-bfb7793d4e64" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
