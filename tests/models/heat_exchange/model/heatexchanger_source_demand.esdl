<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="heatexchanger_source_demand" id="0735d19f-39a4-463d-bf28-cf0b28b88bef_with_return_network" description="" esdlVersion="v2207" version="7">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="b7ebaafe-597c-4055-bc88-b47cdfa84e34">
    <carriers xsi:type="esdl:Carriers" id="5d5909a4-18ec-4aa3-a08a-1e9539a20be2">
      <carrier xsi:type="esdl:HeatCommodity" id="d336e381-ca6f-442e-985e-9f4c2bec1efe" name="heat1" supplyTemperature="90.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="72126c73-87e9-4bf6-99cf-d02a6c07010c" name="heat2" supplyTemperature="70.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret" returnTemperature="50.0" name="heat1_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" id="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret" returnTemperature="40.0" name="heat2_ret"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" name="MultipleCarrierTest" id="82399ebf-5e52-465d-830a-b502d6c1012b">
    <area xsi:type="esdl:Area" id="e91b7896-ae7a-4136-8e96-d98d40c49fc2" name="MultipleCarrierTest">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_18aa" id="18aabae2-c92a-4f55-ad80-4dce8be795e0" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="52.082502667462315" lon="4.387702348686734"/>
        <port xsi:type="esdl:InPort" id="eb6769ba-4a7d-4e1a-8f89-0e1f60d86f32" name="In" connectedTo="1fb45b83-fc31-475f-9ced-0f9f17a2c454" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" id="a79a74b2-6ca2-4098-827b-7895d4ebb631" name="Out" connectedTo="f7beb290-c113-4f55-ad8b-7a3a6d096b23" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" power="10000000.0" name="ResidualHeatSource_61b8" id="61b8d7e1-aa99-439e-86b2-ea596e728932">
        <geometry xsi:type="esdl:Point" lat="52.09114215057476" lon="4.387354082471747"/>
        <port xsi:type="esdl:OutPort" id="c932c77b-d5e5-40eb-b9c8-c67b8d0e25e9" name="Out" connectedTo="7206613a-713e-42af-8c0e-ff16195ec3ad" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:InPort" id="7c3e792b-9c73-49af-9845-1ee16dcb2a27" name="In" connectedTo="b7e1cb61-6809-4a3e-8053-3eac95fadcd4" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_ce68" length="455.2" id="ce6861d7-f06f-4391-adcf-bb1284c24718" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.387664794921876" lat="52.09084554299605"/>
          <point xsi:type="esdl:Point" lon="4.387589693069459" lat="52.08675177427041"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="7206613a-713e-42af-8c0e-ff16195ec3ad" name="In" connectedTo="c932c77b-d5e5-40eb-b9c8-c67b8d0e25e9" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:OutPort" id="22daf91b-d674-4fe9-b35b-360a731c173b" name="Out" connectedTo="230bf10b-c2f5-4ef9-b865-2863133a8156" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="5888dfba-51d2-4562-b1f4-6b3965f20eba">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_408e" length="404.9" id="408e117a-809b-458e-bd9f-1ead868fc84a" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.387664794921876" lat="52.08633644341566"/>
          <point xsi:type="esdl:Point" lon="4.387879371643067" lat="52.08269718870518"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="5a64ebd4-90d9-471e-b413-5948c25cf9c8" name="In" connectedTo="e150e40b-4c79-4f88-8118-be593084f286" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" id="1fb45b83-fc31-475f-9ced-0f9f17a2c454" name="Out" connectedTo="eb6769ba-4a7d-4e1a-8f89-0e1f60d86f32" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="3efcdead-3f3b-4972-b7e9-dd3dbebabb81">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_408e_ret" length="413.5" id="9a7df578-3001-4e0b-a902-fca2665bef9c" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3873000144958505" lat="52.08268400246011"/>
          <point xsi:type="esdl:Point" lon="4.387278556823731" lat="52.086402369206255"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="f7beb290-c113-4f55-ad8b-7a3a6d096b23" name="In" connectedTo="a79a74b2-6ca2-4098-827b-7895d4ebb631" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" id="96a5a980-06b9-4519-bc9b-c61e2f86537d" name="Out" connectedTo="3386f229-42cb-4bc5-9824-de3f2dc7cd7f" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="0970189c-8baa-4c65-83ab-d13e0b7c03c0">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_ce68_ret" length="436.9" id="71ef008d-7412-4db6-9d42-adba1a7f59d1" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.38732147216797" lat="52.0867319966983"/>
          <point xsi:type="esdl:Point" lon="4.387235641479493" lat="52.09066096891663"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b" name="steel"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478" name="PUR"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763" name="HDPE"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" id="ef6d471c-ead8-4541-853e-f85dea09e2be" name="In" connectedTo="861b1adf-1050-48b7-821e-58eea67d479b" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <port xsi:type="esdl:OutPort" id="b7e1cb61-6809-4a3e-8053-3eac95fadcd4" name="Out" connectedTo="7c3e792b-9c73-49af-9845-1ee16dcb2a27" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="52bf58f4-7c46-48f7-9f28-4590b6719641">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatExchange" name="HeatExchange_39ed" id="39ed1de8-8c7a-4e3c-8e52-45a0b209a176" heatTransferCoefficient="400000.0" efficiency="0.9" capacity="10000000.0">
        <geometry xsi:type="esdl:Point" lon="4.387479722499848" lat="52.086540813049496"/>
        <port xsi:type="esdl:InPort" id="230bf10b-c2f5-4ef9-b865-2863133a8156" name="PrimIn" connectedTo="22daf91b-d674-4fe9-b35b-360a731c173b" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:OutPort" id="861b1adf-1050-48b7-821e-58eea67d479b" name="PrimOut" connectedTo="ef6d471c-ead8-4541-853e-f85dea09e2be" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <port xsi:type="esdl:OutPort" id="e150e40b-4c79-4f88-8118-be593084f286" name="SecOut" connectedTo="5a64ebd4-90d9-471e-b413-5948c25cf9c8" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:InPort" id="3386f229-42cb-4bc5-9824-de3f2dc7cd7f" name="SecIn" connectedTo="96a5a980-06b9-4519-bc9b-c61e2f86537d" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
