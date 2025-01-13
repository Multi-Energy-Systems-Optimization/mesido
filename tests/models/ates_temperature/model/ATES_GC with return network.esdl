<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="28d4cc1e-ef8d-42f9-afcc-87c79f9ccbdf_with_return_network" description="" esdlVersion="v2401" name="ATES_GC with return network" version="1">
  <instance xsi:type="esdl:Instance" name="Untitled instance" id="f4d456e7-e051-4f8e-bf72-0be5c0e973fc">
    <area xsi:type="esdl:Area" name="Untitled area" id="db83f3bc-2fbe-4d2a-82f7-749851518229">
      <asset xsi:type="esdl:GenericConsumer" id="1266bcaf-8f01-4d76-972d-55d758822a60" name="GenericConsumer_1266" power="25000000.0">
        <geometry xsi:type="esdl:Point" lat="52.014234519950584" lon="4.366765022277833" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" name="In" id="976750c5-22c5-40e7-bc3e-d4d7caa5ff35" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="9852ea96-e3d4-455c-b333-fbfabcb5ede2"/>
        <port xsi:type="esdl:OutPort" name="ret_port" id="778decb2-6a6a-4e71-a8a0-8a259a8253e1" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" connectedTo="35d84747-a77c-4986-841c-420019070517"/>
      </asset>
      <asset xsi:type="esdl:ATES" aquiferNetToGross="1.0" aquiferThickness="45.0" wellCasingSize="13.0" aquiferAnisotropy="4.0" name="ATES_524e" maxDischargeRate="11610000.0" aquiferPorosity="0.3" id="524e5461-eae0-401e-8c8b-ac3c3c87124e" aquiferTopDepth="300.0" aquiferMidTemperature="17.0" wellDistance="150.0" salinity="10000.0" aquiferPermeability="10000.0" maxChargeRate="11610000.0">
        <costInformation xsi:type="esdl:CostInformation">
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="30000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/yr" id="574ef21d-681a-43ae-a1cb-f7b25d88defb" unit="EURO" perTimeUnit="YEAR"/>
          </fixedOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="2333594.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR" id="a3b5cdd9-364b-4262-bce5-4658c5f1bac9" unit="EURO"/>
          </investmentCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="69666.67">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/yr" id="3c9f580e-b71a-4bc8-8cea-cb6788c0bf49" unit="EURO" perTimeUnit="YEAR"/>
          </variableOperationalCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="115472.22">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Cost in EUR/yr" id="57537388-7fd7-40b3-a0c4-0ce65648eaab" unit="EURO" perTimeUnit="YEAR"/>
          </fixedMaintenanceCosts>
        </costInformation>
        <dataSource xsi:type="esdl:DataSource" attribution="" name="WarmingUp factsheet: HT-ATES (high)" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D"/>
        <port xsi:type="esdl:InPort" name="In" id="8a8503b2-dfa2-422d-a4a7-42efc1960be9" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="187e1475-02ce-425c-812f-b4b16a87eb91"/>
        <port xsi:type="esdl:OutPort" name="ret_port" id="ee8289cf-a53e-4b90-8610-a084b20c70db" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" connectedTo="5e3cf7b3-b021-4692-89bf-bbaadf5f4692"/>
        <geometry xsi:type="esdl:Point" lat="52.01618903346187" lon="4.360671043395997" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" id="b99d762b-f36c-45a8-a01a-06af6e75b352" power="50000000.0" name="ResidualHeatSource_b99d" maxTemperature="90.0">
        <costInformation xsi:type="esdl:CostInformation">
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="35.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="c297a9b0-2726-4611-9775-42259bc44669" description="Cost in EUR/kW" perUnit="WATT" perMultiplier="KILO" unit="EURO"/>
          </fixedOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" value="1500.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="8c58400a-acae-4dba-b392-7ed5640e5379" description="Cost in EUR/kW" perUnit="WATT" perMultiplier="KILO" unit="EURO"/>
          </investmentCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="8a88e248-20f8-4433-b78a-2f6d88012754" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" unit="EURO"/>
          </variableOperationalCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="29000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="456d0590-36eb-4b83-b143-48c8aa500e96" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" unit="EURO"/>
          </fixedMaintenanceCosts>
        </costInformation>
        <geometry xsi:type="esdl:Point" lat="52.01320440414692" lon="4.361529350280763" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" name="Out" id="53b62111-fc14-4722-b5ac-552d1147eae7" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="97c8dd8c-49d0-4ecf-ad75-ae3377720894"/>
        <port xsi:type="esdl:InPort" name="ret_port" id="c3fd5e44-65cb-4f45-ae21-dfe572641918" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" connectedTo="02d1daca-96bf-4109-891e-1770329320ad"/>
        <dataSource xsi:type="esdl:DataSource" attribution="" name="WarmingUp factsheet: Industriele restwarmte" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe1" diameter="DN400" length="186.08" outerDiameter="0.56" innerDiameter="0.3938" name="Pipe1" related="Pipe1_ret">
        <costInformation xsi:type="esdl:CostInformation" id="beae9abb-c553-4040-993e-de01d5c45eb4">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.01320440414692" lon="4.361529350280763"/>
          <point xsi:type="esdl:Point" lat="52.014830457527026" lon="4.362171739339829"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="97c8dd8c-49d0-4ecf-ad75-ae3377720894" connectedTo="53b62111-fc14-4722-b5ac-552d1147eae7" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <port xsi:type="esdl:OutPort" name="Out" id="53684883-49ec-4be9-99f8-0b63969e29f1" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="6d3517c0-7e64-4fc8-a6a8-d97a862abcc4"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
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
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe2" diameter="DN400" length="321.33" outerDiameter="0.56" innerDiameter="0.3938" name="Pipe2" related="Pipe2_ret">
        <costInformation xsi:type="esdl:CostInformation" id="beae9abb-c553-4040-993e-de01d5c45eb4">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.014830457527026" lon="4.362171739339829"/>
          <point xsi:type="esdl:Point" lat="52.014828806741384" lon="4.362173080444337"/>
          <point xsi:type="esdl:Point" lat="52.014234519950584" lon="4.366765022277833"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="c5c56788-d202-4b0e-b6da-62f9f61159a1" carrier="c41e7703-dee0-4dc7-9166-a99838591a90" connectedTo="691a29df-b5e6-44b3-9314-b79022141998"/>
        <port xsi:type="esdl:OutPort" name="Out" id="9852ea96-e3d4-455c-b333-fbfabcb5ede2" connectedTo="976750c5-22c5-40e7-bc3e-d4d7caa5ff35" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
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
      </asset>
      <asset xsi:type="esdl:Joint" id="8f089144-a17c-417e-9f29-1f9b369c1954" name="Joint_8f08">
        <geometry xsi:type="esdl:Point" lat="52.014830457527026" lon="4.362171739339829"/>
        <port xsi:type="esdl:InPort" name="In" id="6d3517c0-7e64-4fc8-a6a8-d97a862abcc4" connectedTo="53684883-49ec-4be9-99f8-0b63969e29f1" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <port xsi:type="esdl:OutPort" name="Out" id="691a29df-b5e6-44b3-9314-b79022141998" connectedTo="c5c56788-d202-4b0e-b6da-62f9f61159a1 8b561dc4-dd09-4848-9264-a2491af7e408" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="Pipe3" diameter="DN400" length="182.7" outerDiameter="0.56" innerDiameter="0.3938" name="Pipe3" related="Pipe3_ret">
        <costInformation xsi:type="esdl:CostInformation" id="77e8c547-7e19-4ce0-b848-71f98766ba08">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6" name="Combined investment and installation costs">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.014830457527026" lon="4.362171739339829"/>
          <point xsi:type="esdl:Point" lat="52.01618903346187" lon="4.360671043395997"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="8b561dc4-dd09-4848-9264-a2491af7e408" connectedTo="691a29df-b5e6-44b3-9314-b79022141998" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <port xsi:type="esdl:OutPort" name="Out" id="187e1475-02ce-425c-812f-b4b16a87eb91" connectedTo="8a8503b2-dfa2-422d-a4a7-42efc1960be9" carrier="c41e7703-dee0-4dc7-9166-a99838591a90"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
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
      </asset>
      <asset xsi:type="esdl:Joint" id="bf3e673d-6e94-446d-b911-1b0a44fc7314" name="Joint_8f08_ret">
        <geometry xsi:type="esdl:Point" lat="52.01492045761702" lon="4.361455202559538" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" name="ret_port" id="3545eb77-3b1f-490d-ac6d-5dbace79ce30" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" connectedTo="7e27f539-261d-42f0-909e-11a378e5ca9a"/>
        <port xsi:type="esdl:InPort" name="ret_port" id="cece8943-e487-4553-8985-0cde00c3f82c" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret" connectedTo="b62f5858-ad85-4834-ab67-ed1926ea2bb3 0d3d61ad-be10-4c2d-a313-2891b3a907e4"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" id="Pipe1_ret" diameter="DN400" length="186.08" innerDiameter="0.3938" name="Pipe1_ret" related="Pipe1">
        <port xsi:type="esdl:InPort" name="In_ret" id="7e27f539-261d-42f0-909e-11a378e5ca9a" connectedTo="3545eb77-3b1f-490d-ac6d-5dbace79ce30" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="02d1daca-96bf-4109-891e-1770329320ad" connectedTo="c3fd5e44-65cb-4f45-ae21-dfe572641918" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.01492045761702" lon="4.361455202559538" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.013294404236916" lon="4.360806297901972" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" id="Pipe2_ret" diameter="DN400" length="321.33" innerDiameter="0.3938" name="Pipe2_ret" related="Pipe2">
        <port xsi:type="esdl:InPort" name="In_ret" id="35d84747-a77c-4986-841c-420019070517" connectedTo="778decb2-6a6a-4e71-a8a0-8a259a8253e1" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="b62f5858-ad85-4834-ab67-ed1926ea2bb3" connectedTo="cece8943-e487-4553-8985-0cde00c3f82c" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.01432452004058" lon="4.366046111472265" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.01491880683138" lon="4.3614565371098495" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.01492045761702" lon="4.361455202559538" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" id="Pipe3_ret" diameter="DN400" length="182.7" innerDiameter="0.3938" name="Pipe3_ret" related="Pipe3">
        <port xsi:type="esdl:InPort" name="In_ret" id="5e3cf7b3-b021-4692-89bf-bbaadf5f4692" connectedTo="ee8289cf-a53e-4b90-8610-a084b20c70db" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <port xsi:type="esdl:OutPort" name="Out_ret" id="0d3d61ad-be10-4c2d-a313-2891b3a907e4" connectedTo="cece8943-e487-4553-8985-0cde00c3f82c" carrier="c41e7703-dee0-4dc7-9166-a99838591a90_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.01627903355187" lon="4.359959859632437" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.01492045761702" lon="4.361455202559538" CRS="WGS84"/>
        </geometry>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="771f8345-783d-483e-a2f7-7c4084e32988">
    <carriers xsi:type="esdl:Carriers" id="47395742-f1d0-4bdc-9add-f757451da481">
      <carrier xsi:type="esdl:HeatCommodity" id="c41e7703-dee0-4dc7-9166-a99838591a90" supplyTemperature="70.0" name="ATES"/>
      <carrier xsi:type="esdl:HeatCommodity" name="ATES_ret" id="c41e7703-dee0-4dc7-9166-a99838591a90_ret" returnTemperature="30.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
