<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="17" id="5d539f68-f98e-466b-9ff5-b908a211e0ab_with_return_network_with_return_network" name="sourcesink_with_heater_ebuffer" description="" esdlVersion="v2401">
  <instance xsi:type="esdl:Instance" name="Untitled instance" id="90e7e098-038e-4462-89fe-a8852c501753">
    <area xsi:type="esdl:Area" id="4fd1adc2-5371-4ab7-806a-b40e49d127e9" name="Untitled area">
      <asset xsi:type="esdl:HeatingDemand" id="f6d5923d-ba9a-409d-80a0-26f73b2a574b" power="10000000.0" name="demand">
        <port xsi:type="esdl:InPort" id="b8849fb5-fe97-48d9-91a8-9abcbf365738" name="In" connectedTo="76679c8a-43ec-4f6d-81c4-9b43e21696cc" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" id="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" name="Out" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="0f4bf90b-218d-4d45-a83e-97a8a6a187af"/>
        <geometry xsi:type="esdl:Point" lat="52.086586960901776" CRS="WGS84" lon="4.398479461669923"/>
      </asset>
      <asset xsi:type="esdl:HeatStorage" id="81ef7326-1362-4dcb-a8df-dded30a7a428" name="HeatStorage" maxChargeRate="1000000.0" maxDischargeRate="1000000.0" volume="1000.0" chargeEfficiency="0.9">
        <geometry xsi:type="esdl:Point" lat="52.08748353827592" lon="4.392256736755372"/>
        <port xsi:type="esdl:InPort" id="850f5c11-d307-4450-af57-c8e833638bec" name="In" connectedTo="adcc65af-b034-4dcc-b6e4-3ee5bd4c1116" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" id="7841e5b7-a039-4170-8431-b1875c557e0f" name="Out" connectedTo="ae782fc6-ff48-4a22-b6c5-0c2b3bff80d3" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <port xsi:type="esdl:InPort" id="f0fe524a-9e78-4556-94e7-c4b649073686" name="ElecPort" connectedTo="69fb977b-a670-46e4-bd64-4d7d2e0529b5" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" id="0b237c36-1fb8-4195-9d60-250128107fd0" length="304.26" diameter="DN300" innerDiameter="0.15" name="Pipe1_a">
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="a5e06a9f-ad3d-4c95-afcf-28ce7f772ec3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="3b5636b1-7b14-46bd-bb27-c0718350b418" name="In" connectedTo="31a565a0-a231-46b1-acea-945d5b2a3c5c" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" id="f184d4af-a7a4-4d4e-94bc-226728f1551c" name="Out" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" connectedTo="585475cf-11bb-4e36-8fc7-d3eba2065cbc"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08646829489945" lon="4.386527538299561"/>
          <point xsi:type="esdl:Point" lat="52.08651444282675" lon="4.390980005264283"/>
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
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" id="56886dca-c9aa-42e4-a46e-f6a7a0785cd7" length="512.47" diameter="DN300" innerDiameter="0.15" name="Pipe1_b">
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="a5e06a9f-ad3d-4c95-afcf-28ce7f772ec3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" description="Costs in EUR/m" id="983f0959-8566-43ce-a380-782d29406ed3" physicalQuantity="COST" perUnit="METRE" unit="EURO"/>
          </investmentCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="fb55ea30-413c-4383-8679-3f47baa16c85" name="In" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11" connectedTo="104bb118-9f3a-4c00-97cc-2c0f6ece1b48"/>
        <port xsi:type="esdl:OutPort" id="76679c8a-43ec-4f6d-81c4-9b43e21696cc" name="Out" connectedTo="b8849fb5-fe97-48d9-91a8-9abcbf365738" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08651444282675" lon="4.390980005264283"/>
          <point xsi:type="esdl:Point" lat="52.086586960901776" lon="4.398479461669923"/>
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
      </asset>
      <asset xsi:type="esdl:Joint" id="09a37155-0793-41ab-a291-0899708448ed" name="Joint_09a3">
        <port xsi:type="esdl:InPort" id="585475cf-11bb-4e36-8fc7-d3eba2065cbc" name="In" connectedTo="f184d4af-a7a4-4d4e-94bc-226728f1551c" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" id="104bb118-9f3a-4c00-97cc-2c0f6ece1b48" name="Out" connectedTo="fb55ea30-413c-4383-8679-3f47baa16c85 01fa0a87-9942-4bd1-9c82-6ec5ff5fc3ad" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <geometry xsi:type="esdl:Point" lat="52.08651444282675" lon="4.390980005264283"/>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" id="d32a199c-e379-47dd-93b2-a66223cddcd9" length="288.94" diameter="DN300" innerDiameter="0.15" name="Pipe1_ret_a">
        <port xsi:type="esdl:InPort" id="0f4bf90b-218d-4d45-a83e-97a8a6a187af" name="In_ret" connectedTo="eb68d4fe-b361-4e64-9f54-a1e05e5712ee" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <port xsi:type="esdl:OutPort" id="5b722ea8-2cb9-46a4-9fd1-8a4d74fedcc5" name="Out" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="0a080b69-4109-44dd-a72a-65acf026ca24"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.086676960991774" lon="4.39796569977892"/>
          <point xsi:type="esdl:Point" lat="52.08663970124596" lon="4.393737316131593"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" outerDiameter="0.45" id="d12cd2bc-ec04-4aa1-9b01-820f94a9b17c" length="527.81" diameter="DN300" innerDiameter="0.15" name="Pipe1_ret_b">
        <port xsi:type="esdl:InPort" id="d458da1a-f642-4cbb-b4d6-d13941bec739" name="In" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret" connectedTo="31011fb9-46ba-481b-8e8c-fd7eb2f614b6"/>
        <port xsi:type="esdl:OutPort" id="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" name="Out_ret" connectedTo="c306dd34-3ca1-44c7-8dc6-860311a0773c" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08663970124596" lon="4.393737316131593"/>
          <point xsi:type="esdl:Point" lat="52.086558294989445" CRS="WGS84" lon="4.386013537838319"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="ece5179b-fabd-4191-8d19-f6a54067d715" name="Joint_ece5">
        <port xsi:type="esdl:InPort" id="0a080b69-4109-44dd-a72a-65acf026ca24" name="In" connectedTo="5b722ea8-2cb9-46a4-9fd1-8a4d74fedcc5 fd9d107f-229e-4b95-bfce-e35ad14814c4" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <port xsi:type="esdl:OutPort" id="31011fb9-46ba-481b-8e8c-fd7eb2f614b6" name="Out" connectedTo="d458da1a-f642-4cbb-b4d6-d13941bec739" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <geometry xsi:type="esdl:Point" lat="52.08663970124596" lon="4.393737316131593"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="f1e718ff-0835-4981-a67b-a72de8493016" name="Pipe2" innerDiameter="0.3127" outerDiameter="0.45" diameter="DN300" length="138.6">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="179ca04c-6765-4d9c-887d-19c2441794d1">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="584f9291-2fae-4e66-8c66-40becfcfb661">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="912966ec-3555-4df5-851c-dbc01bd921d5"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" id="4c692af2-2782-4d1f-9814-1d4ea4403ff0" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" id="19065ca9-4d99-4616-aa4d-ea07ddd9ed06" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" id="39aced77-cb98-4939-bc89-aec2d5d3fa0b" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08651444282675" lon="4.390980005264283"/>
          <point xsi:type="esdl:Point" lat="52.08748353827592" lon="4.392256736755372"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="01fa0a87-9942-4bd1-9c82-6ec5ff5fc3ad" name="In" connectedTo="104bb118-9f3a-4c00-97cc-2c0f6ece1b48" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:OutPort" id="adcc65af-b034-4dcc-b6e4-3ee5bd4c1116" name="Out" connectedTo="850f5c11-d307-4450-af57-c8e833638bec" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="f35af973-ae08-4a23-9e71-58205a7f4dac" name="Pipe2_ret" innerDiameter="0.3127" outerDiameter="0.45" diameter="DN300" length="138.0">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="4d3125a0-df7d-4f92-829c-63204af577d4">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1595f30e-35d4-4a99-ab29-b8119cfdf73c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="61e27940-07ed-4af3-b676-20c21324f8c1"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" id="5f2880f3-49c8-441f-9f1c-db78305c2028" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" id="0ae342b7-0a27-458e-ac07-c15c851a1a6d" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" id="3ee864f6-0e6c-43fc-9e82-0c9440117abc" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08748353827592" lon="4.392256736755372"/>
          <point xsi:type="esdl:Point" lat="52.08663970124596" lon="4.393737316131593"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ae782fc6-ff48-4a22-b6c5-0c2b3bff80d3" name="In" connectedTo="7841e5b7-a039-4170-8431-b1875c557e0f" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <port xsi:type="esdl:OutPort" id="fd9d107f-229e-4b95-bfce-e35ad14814c4" name="Out" connectedTo="0a080b69-4109-44dd-a72a-65acf026ca24" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="4e453589-3137-49d7-bc08-63d0bd8635c3" power="10000000.0" name="ElectricityProducer2">
        <port xsi:type="esdl:OutPort" id="5e468712-006f-4d85-b007-db74ad5d9701" name="Out" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8" connectedTo="aaa1948d-e2a9-4a2d-a38e-eafd2acee8d9"/>
        <geometry xsi:type="esdl:Point" lat="52.08896021468253" lon="4.392235279083253"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="54ec0054-550c-40cb-9b9d-b6863a103805" name="ElectricityCable2" length="164.2" capacity="10000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08896021468253" lon="4.392235279083253"/>
          <point xsi:type="esdl:Point" lat="52.08748353827592" lon="4.392256736755372"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="aaa1948d-e2a9-4a2d-a38e-eafd2acee8d9" name="In" connectedTo="5e468712-006f-4d85-b007-db74ad5d9701" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
        <port xsi:type="esdl:OutPort" id="69fb977b-a670-46e4-bd64-4d7d2e0529b5" name="Out" connectedTo="f0fe524a-9e78-4556-94e7-c4b649073686" carrier="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
      </asset>
      <asset xsi:type="esdl:HeatProducer" id="01574e92-46a9-44a0-9b4f-227d7d5515ca" name="HeatProducer_0157" power="100000.0">
        <geometry xsi:type="esdl:Point" lat="52.086467056610275" lon="4.386502061547214"/>
        <port xsi:type="esdl:OutPort" id="31a565a0-a231-46b1-acea-945d5b2a3c5c" name="Out" connectedTo="3b5636b1-7b14-46bd-bb27-c0718350b418" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
        <port xsi:type="esdl:InPort" id="c306dd34-3ca1-44c7-8dc6-860311a0773c" name="In" connectedTo="0f11bb2d-fb28-4f9d-8992-8d5901f579d7" carrier="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="99078442-3ed8-4fad-bf8f-8d9b69e934b2">
          <investmentCosts xsi:type="esdl:SingleValue" id="9847d0cc-d82b-464b-a76a-4fb806c855fb" value="10.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="093de0e4-62c9-46ea-ab80-d8836f8a266b" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="bc3e35d5-1e05-4c02-a615-ba393374d7e7" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="f5209895-bef8-4d4b-955d-89ebab20828e" unit="EURO"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="c28af75f-51c3-4c14-85a9-4a5c305509d2" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="9d3e42d0-dca1-4c10-93ba-fdad9516fc0f" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="11f4eafa-7fbc-4d82-b346-e893326d2c30">
    <carriers xsi:type="esdl:Carriers" id="eafbd8f4-1fde-4bb5-8dce-fdb74a1a1097">
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="70.0" name="heat" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" name="heat_ret" id="435a0034-fab0-4e7e-9a17-edf8de9a2b11_ret"/>
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="230.0" name="elec" id="0e237e2a-00d1-4c6c-b966-9c9b8d9657f8"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="3ac35011-9c50-4a58-9f42-857b1c37cf5f">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
</esdl:EnergySystem>
