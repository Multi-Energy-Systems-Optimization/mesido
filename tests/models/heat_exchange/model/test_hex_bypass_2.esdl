<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="2" id="6aba9853-9a32-410c-9f55-63e950db69cd" description="" esdlVersion="v2401" name="test_hex_bypass">
  <instance xsi:type="esdl:Instance" id="925c9f2f-376b-4c37-b573-d4b626a9c0f7" name="Untitled instance">
    <area xsi:type="esdl:Area" id="b02aea94-a59b-473a-9607-e3535e7c2ddd" name="Untitled area">
      <asset xsi:type="esdl:HeatProducer" power="5000000.0" name="HeatProducer_737a" id="737a2910-51bf-4967-b494-3a6d0bb2c9bf">
        <geometry xsi:type="esdl:Point" lat="52.078029014540235" lon="4.40929412841797" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="b0a70294-17c8-44d1-afa5-f9382af1ef55" connectedTo="b20ded49-b9d2-4ded-8738-6f342084e851" carrier="c8a29d9a-a4c0-4331-ab0a-2e4ff52e838d" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="f7899fee-c687-4604-8e05-0b3c7873eab0" id="74ea4aaa-8a63-40a9-89fb-60b0d9d8e366" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="InPort"/>
      </asset>
      <asset xsi:type="esdl:HeatExchange" name="HeatExchange_e410" capacity="10000000.0" id="e41085c1-27c0-41e0-a6f6-7f6ebdbf7cf0">
        <geometry xsi:type="esdl:Point" lat="52.08272356118355" lon="4.413757324218751" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="13415f68-2d49-4d7b-be46-53ab958e27e2" id="7fa17d47-5693-4abd-9112-bc5dab14f5a0" carrier="c8a29d9a-a4c0-4331-ab0a-2e4ff52e838d" name="PrimIn"/>
        <port xsi:type="esdl:OutPort" id="a182976d-643d-4bed-9726-9b261310f27e" connectedTo="fd3d9bf1-1cc4-4977-8bff-dcdc126053fc" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="SecOut"/>
        <port xsi:type="esdl:InPort" connectedTo="48a24653-ad2e-459b-b153-20317870e721" id="f8d6c63f-d5b0-40f8-add0-1e4688cdb7e2" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="SecIn"/>
        <port xsi:type="esdl:OutPort" id="d18bc24e-b920-4fbd-bbb5-4afd978eb7a5" connectedTo="10199d71-b2ef-446f-89b9-f7b69d6bb4e4" carrier="8cc72543-f319-4d6e-8173-bd6ba500139b" name="PrimOut"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="10000000.0" name="HeatingDemand_2ab9" id="3322fe41-f73b-4ba4-b87b-bf8315aa69e4">
        <geometry xsi:type="esdl:Point" lat="52.08633644341566" lon="4.413113594055177"/>
        <port xsi:type="esdl:InPort" connectedTo="b2c8f5d0-e7a3-419e-9c58-0ef999a8e9b0" id="c4195206-c168-4569-9b6b-0b4397daf641" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="In"/>
        <port xsi:type="esdl:OutPort" id="6681b4d6-4ca3-48fe-b84c-b946dfafdba5" connectedTo="19ac5b34-3255-436b-8b25-d1b0bad52736" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:HeatExchange" name="HeatExchange_e410_copy" capacity="10000000.0" id="67578b48-8a88-409c-92b6-116cc848ad15">
        <geometry xsi:type="esdl:Point" lat="52.08272356118355" lon="4.4066762924194345"/>
        <port xsi:type="esdl:InPort" connectedTo="d081ffc3-3875-4f05-b7c4-b40a09948e44" id="47d74305-eb43-405d-aec6-c237b2cc806b" carrier="8cc72543-f319-4d6e-8173-bd6ba500139b" name="PrimIn"/>
        <port xsi:type="esdl:OutPort" id="537c2da7-a450-4b54-bc83-57410a4bf85d" connectedTo="07aec471-8ff4-4984-bcc9-946b255c2335" carrier="fa9c3ad3-5ba9-451e-b895-94d39accd086" name="SecOut"/>
        <port xsi:type="esdl:InPort" connectedTo="80ff038d-7c42-4ab6-be07-8ccc0c88d90f" id="4f8f25d6-ea32-45df-afc4-0a9afa6f4139" carrier="cb95064e-2d74-40b2-a4b1-e6cad9a9d020" name="SecIn"/>
        <port xsi:type="esdl:OutPort" id="f937e4e3-35fd-4f1c-b6fc-1efa00053e0c" connectedTo="a180db06-27f7-4467-ac21-aeefaf037aa7" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="PrimOut"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="10000000.0" name="HeatingDemand_6662" id="18aabae2-c92a-4f55-ad80-4dce8be795e0">
        <geometry xsi:type="esdl:Point" lat="52.0862073323384" lon="4.403922625732423" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" connectedTo="85cacb10-0906-449b-bdc3-554d2de0d86c" id="1b9087eb-6227-43fc-bf50-281adf326b10" carrier="fa9c3ad3-5ba9-451e-b895-94d39accd086" name="In"/>
        <port xsi:type="esdl:OutPort" id="8c9afa04-abf8-404a-8664-87d3d03345c3" connectedTo="67fe8c0d-682f-47f8-b937-9f2cd3cf1a7c" carrier="cb95064e-2d74-40b2-a4b1-e6cad9a9d020" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="5000000.0" name="HeatProducer_737a_copy" id="2ac51b74-a51e-4ab9-a272-0cce8deb0de5">
        <geometry xsi:type="esdl:Point" lat="52.0856244386714" lon="4.419507980346681"/>
        <port xsi:type="esdl:OutPort" id="1fc47b57-45c5-4ddb-bb7a-0eddac625f7d" connectedTo="8e419ffa-4639-4c83-8a4d-dd625c096c49" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="Out"/>
        <port xsi:type="esdl:InPort" connectedTo="ad26816b-7adc-430a-ba95-f49f57d8fc76" id="0d4d29ec-2da0-40ce-af02-c01f378a8fb0" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="InPort"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_74f7" length="604.6" diameter="DN400" innerDiameter="0.3938" id="74f7d682-ee35-4ade-a7e7-a559a9e54f4b">
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
          <point xsi:type="esdl:Point" lat="52.078029014540235" lon="4.40929412841797"/>
          <point xsi:type="esdl:Point" lat="52.08272356118355" lon="4.413757324218751"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="ae52ff3c-40c2-411c-876d-37d33368838e">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="b0a70294-17c8-44d1-afa5-f9382af1ef55" id="b20ded49-b9d2-4ded-8738-6f342084e851" carrier="c8a29d9a-a4c0-4331-ab0a-2e4ff52e838d" name="In"/>
        <port xsi:type="esdl:OutPort" id="13415f68-2d49-4d7b-be46-53ab958e27e2" connectedTo="7fa17d47-5693-4abd-9112-bc5dab14f5a0" carrier="c8a29d9a-a4c0-4331-ab0a-2e4ff52e838d" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_78a8" length="483.9" diameter="DN400" innerDiameter="0.3938" id="78a844cc-765d-44d5-8b92-4e62a8e43f41">
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
          <point xsi:type="esdl:Point" lat="52.08272356118355" lon="4.413757324218751"/>
          <point xsi:type="esdl:Point" lat="52.08272356118355" lon="4.4066762924194345"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="7d832427-5f0e-41cc-8e8a-3f95cb404abf">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="d18bc24e-b920-4fbd-bbb5-4afd978eb7a5" id="10199d71-b2ef-446f-89b9-f7b69d6bb4e4" carrier="8cc72543-f319-4d6e-8173-bd6ba500139b" name="In"/>
        <port xsi:type="esdl:OutPort" id="d081ffc3-3875-4f05-b7c4-b40a09948e44" connectedTo="47d74305-eb43-405d-aec6-c237b2cc806b" carrier="8cc72543-f319-4d6e-8173-bd6ba500139b" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_52d4" length="551.8" diameter="DN400" innerDiameter="0.3938" id="52d4378e-a5eb-4bf0-8791-c9cc3723252a">
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
          <point xsi:type="esdl:Point" lat="52.08272356118355" lon="4.4066762924194345"/>
          <point xsi:type="esdl:Point" lat="52.078029014540235" lon="4.40929412841797"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="e8415685-899d-423c-ac85-696f460abbc9">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="f937e4e3-35fd-4f1c-b6fc-1efa00053e0c" id="a180db06-27f7-4467-ac21-aeefaf037aa7" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="In"/>
        <port xsi:type="esdl:OutPort" id="f7899fee-c687-4604-8e05-0b3c7873eab0" connectedTo="74ea4aaa-8a63-40a9-89fb-60b0d9d8e366" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_2116" length="478.7" diameter="DN400" innerDiameter="0.3938" id="2116a6bd-aae1-48a9-a65c-cf3a603abf69">
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
          <point xsi:type="esdl:Point" lat="52.08272356118355" lon="4.4066762924194345"/>
          <point xsi:type="esdl:Point" lat="52.08344879823275" lon="4.406611919403077"/>
          <point xsi:type="esdl:Point" lat="52.0863759989017" lon="4.404444694519044"/>
          <point xsi:type="esdl:Point" lat="52.0862073323384" lon="4.403922625732423"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="c088a17a-170e-4da4-a037-e3893b29b18e">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="537c2da7-a450-4b54-bc83-57410a4bf85d" id="07aec471-8ff4-4984-bcc9-946b255c2335" carrier="fa9c3ad3-5ba9-451e-b895-94d39accd086" name="In"/>
        <port xsi:type="esdl:OutPort" id="85cacb10-0906-449b-bdc3-554d2de0d86c" connectedTo="1b9087eb-6227-43fc-bf50-281adf326b10" carrier="fa9c3ad3-5ba9-451e-b895-94d39accd086" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_73e7" length="453.9" diameter="DN400" innerDiameter="0.3938" id="73e72608-88e6-4d1b-8d60-15124c977143">
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
          <point xsi:type="esdl:Point" lat="52.0862073323384" lon="4.403922625732423"/>
          <point xsi:type="esdl:Point" lat="52.085136577010374" lon="4.403758049011231"/>
          <point xsi:type="esdl:Point" lat="52.08272356118355" lon="4.4066762924194345"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="71336218-4a9c-42d8-8918-de990a36ff7d">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="8c9afa04-abf8-404a-8664-87d3d03345c3" id="67fe8c0d-682f-47f8-b937-9f2cd3cf1a7c" carrier="cb95064e-2d74-40b2-a4b1-e6cad9a9d020" name="In"/>
        <port xsi:type="esdl:OutPort" id="80ff038d-7c42-4ab6-be07-8ccc0c88d90f" connectedTo="4f8f25d6-ea32-45df-afc4-0a9afa6f4139" carrier="cb95064e-2d74-40b2-a4b1-e6cad9a9d020" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_e23a" length="221.97" diameter="DN400" innerDiameter="0.3938" id="e23ab700-5dca-4e67-9226-b09c06522940">
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
          <point xsi:type="esdl:Point" lat="52.08633644341566" lon="4.413113594055177"/>
          <point xsi:type="esdl:Point" lat="52.08638918405594" lon="4.414079189300538"/>
          <point xsi:type="esdl:Point" lat="52.085090427658216" lon="4.414932131767274"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="59424ee3-2bab-41e5-a3df-a98f4e3f34aa">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="6681b4d6-4ca3-48fe-b84c-b946dfafdba5" id="19ac5b34-3255-436b-8b25-d1b0bad52736" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="In"/>
        <port xsi:type="esdl:OutPort" id="71621d98-0cbc-46c5-b2ce-6282dc87f25c" connectedTo="a65b35d5-fd30-4858-8ccd-308cfdf7317c" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_b9cc" length="275.38" diameter="DN400" innerDiameter="0.3938" id="b9ccc1d5-76fe-415a-bc1d-a3395c0feaba">
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
          <point xsi:type="esdl:Point" lat="52.085090427658216" lon="4.414932131767274"/>
          <point xsi:type="esdl:Point" lat="52.085083834889716" lon="4.414937496185304"/>
          <point xsi:type="esdl:Point" lat="52.08272356118355" lon="4.413757324218751"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="59424ee3-2bab-41e5-a3df-a98f4e3f34aa">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="8ef800b3-5abd-4ac1-b608-2b7ca175ef90" id="f10a8fce-15b5-4986-83b6-6e616e5dfc0c" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="In"/>
        <port xsi:type="esdl:OutPort" id="48a24653-ad2e-459b-b153-20317870e721" connectedTo="f8d6c63f-d5b0-40f8-add0-1e4688cdb7e2" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_382b" id="382bb8b8-f0d9-40f6-9722-7ad80bac2470">
        <geometry xsi:type="esdl:Point" lat="52.085090427658216" lon="4.414932131767274"/>
        <port xsi:type="esdl:InPort" connectedTo="71621d98-0cbc-46c5-b2ce-6282dc87f25c" id="a65b35d5-fd30-4858-8ccd-308cfdf7317c" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="In"/>
        <port xsi:type="esdl:OutPort" id="8ef800b3-5abd-4ac1-b608-2b7ca175ef90" connectedTo="f10a8fce-15b5-4986-83b6-6e616e5dfc0c 85c61a7d-b3c4-4c02-abd7-37ab6aa0c0c5" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_dfba" length="245.89" diameter="DN400" innerDiameter="0.3938" id="dfba1ce4-fc85-47c5-acf1-823d39bb42d0">
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
          <point xsi:type="esdl:Point" lat="52.08272356118355" lon="4.413757324218751"/>
          <point xsi:type="esdl:Point" lat="52.08491242256714" lon="4.414229393005372"/>
          <point xsi:type="esdl:Point" lat="52.08491242256714" lon="4.414224028587342"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="7ce26bc2-3d8f-4cee-976e-cc86e8b25b8b">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="a182976d-643d-4bed-9726-9b261310f27e" id="fd3d9bf1-1cc4-4977-8bff-dcdc126053fc" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="In"/>
        <port xsi:type="esdl:OutPort" id="75501a49-52b3-4d64-8454-1da471364dd0" connectedTo="a23ae3a9-e426-4ce8-ab92-89ac566cfc85" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_45d9" length="175.58" diameter="DN400" innerDiameter="0.3938" id="45d9bd6b-d1ef-4239-b81b-f0276f4c8494">
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
          <point xsi:type="esdl:Point" lat="52.08491242256714" lon="4.414224028587342"/>
          <point xsi:type="esdl:Point" lat="52.08633644341566" lon="4.413113594055177"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="7ce26bc2-3d8f-4cee-976e-cc86e8b25b8b">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="5f20ce47-f0be-4cd1-a0fe-03c2a36612c8" id="6106bbc5-a87e-4903-85af-bf83c0ba3a2c" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="In"/>
        <port xsi:type="esdl:OutPort" id="b2c8f5d0-e7a3-419e-9c58-0ef999a8e9b0" connectedTo="c4195206-c168-4569-9b6b-0b4397daf641" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_de15" id="de15e2cf-bfa1-4121-8491-04387e1c13d0">
        <geometry xsi:type="esdl:Point" lat="52.08491242256714" lon="4.414224028587342"/>
        <port xsi:type="esdl:InPort" connectedTo="75501a49-52b3-4d64-8454-1da471364dd0 ccebec10-37a1-4406-b4c8-4581ba4199ab" id="a23ae3a9-e426-4ce8-ab92-89ac566cfc85" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="In"/>
        <port xsi:type="esdl:OutPort" id="5f20ce47-f0be-4cd1-a0fe-03c2a36612c8" connectedTo="6106bbc5-a87e-4903-85af-bf83c0ba3a2c" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_db19" length="340.7" diameter="DN400" innerDiameter="0.3938" id="db193bb0-3393-4162-9b02-aa57d5b978ef">
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
          <point xsi:type="esdl:Point" lat="52.085413472121125" lon="4.419143199920655"/>
          <point xsi:type="esdl:Point" lat="52.08491242256714" lon="4.414224028587342"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="fb8cfe6a-c4bf-48a9-b3f5-5805a30814aa">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="1fc47b57-45c5-4ddb-bb7a-0eddac625f7d" id="8e419ffa-4639-4c83-8a4d-dd625c096c49" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="In"/>
        <port xsi:type="esdl:OutPort" id="ccebec10-37a1-4406-b4c8-4581ba4199ab" connectedTo="a23ae3a9-e426-4ce8-ab92-89ac566cfc85" carrier="fa013018-2010-4797-a2cf-e355d525da5d" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.56" name="Pipe_9230" length="325.4" diameter="DN400" innerDiameter="0.3938" id="923009e5-b909-4c6b-9f09-2c9bd86debfd">
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
          <point xsi:type="esdl:Point" lat="52.085090427658216" lon="4.414932131767274"/>
          <point xsi:type="esdl:Point" lat="52.08613866545956" lon="4.419379234313966"/>
        </geometry>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="6f48830c-4ce9-42dc-8086-1299d2639e7e">
          <investmentCosts xsi:type="esdl:SingleValue" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" name="Combined investment and installation costs" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" connectedTo="8ef800b3-5abd-4ac1-b608-2b7ca175ef90" id="85c61a7d-b3c4-4c02-abd7-37ab6aa0c0c5" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="In"/>
        <port xsi:type="esdl:OutPort" id="ad26816b-7adc-430a-ba95-f49f57d8fc76" connectedTo="0d4d29ec-2da0-40ce-af02-c01f378a8fb0" carrier="c00001e7-c342-450a-bb43-cc8fba9d4e67" name="Out"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="f57031ec-9be4-4e47-86bd-3c909fdcc71c">
    <carriers xsi:type="esdl:Carriers" id="dcb2d69d-99be-4fe7-a023-bb63c89b2060">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="50.0" name="T50" id="fa9c3ad3-5ba9-451e-b895-94d39accd086"/>
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="T75" id="c8a29d9a-a4c0-4331-ab0a-2e4ff52e838d"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="30.0" name="T30" id="c1f48dd6-25db-4424-97eb-5a4c5c1832ef"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" name="T40" id="c00001e7-c342-450a-bb43-cc8fba9d4e67"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="35.0" name="T35" id="cb95064e-2d74-40b2-a4b1-e6cad9a9d020"/>
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="T70" id="fa013018-2010-4797-a2cf-e355d525da5d"/>
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="65.0" name="T60" id="8cc72543-f319-4d6e-8173-bd6ba500139b"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
