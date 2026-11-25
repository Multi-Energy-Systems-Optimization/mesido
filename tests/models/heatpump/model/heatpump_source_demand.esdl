<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="6" name="heatpump_source_demand" id="0735d19f-39a4-463d-bf28-cf0b28b88bef_with_return_network" esdlVersion="v2207" description="">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="b7ebaafe-597c-4055-bc88-b47cdfa84e34">
    <carriers xsi:type="esdl:Carriers" id="5d5909a4-18ec-4aa3-a08a-1e9539a20be2">
      <carrier xsi:type="esdl:HeatCommodity" name="heat1" id="d336e381-ca6f-442e-985e-9f4c2bec1efe" supplyTemperature="70.0"/>
      <carrier xsi:type="esdl:HeatCommodity" name="heat2" id="72126c73-87e9-4bf6-99cf-d02a6c07010c" supplyTemperature="90.0"/>
      <carrier xsi:type="esdl:HeatCommodity" name="heat1_ret" returnTemperature="40.0" id="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
      <carrier xsi:type="esdl:HeatCommodity" name="heat2_ret" returnTemperature="50.0" id="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" name="MultipleCarrierTest" id="82399ebf-5e52-465d-830a-b502d6c1012b">
    <area xsi:type="esdl:Area" id="e91b7896-ae7a-4136-8e96-d98d40c49fc2" name="MultipleCarrierTest">
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_18aa" id="18aabae2-c92a-4f55-ad80-4dce8be795e0" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="52.082374139531" lon="4.3875924224361915"/>
        <port xsi:type="esdl:InPort" name="In" id="eb6769ba-4a7d-4e1a-8f89-0e1f60d86f32" connectedTo="1fb45b83-fc31-475f-9ced-0f9f17a2c454" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" name="Out" id="a79a74b2-6ca2-4098-827b-7895d4ebb631" connectedTo="f7beb290-c113-4f55-ad8b-7a3a6d096b23" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" power="10000000.0" name="ResidualHeatSource_61b8" id="61b8d7e1-aa99-439e-86b2-ea596e728932">
        <geometry xsi:type="esdl:Point" lat="52.09134643854653" lon="4.3874255975709495"/>
        <port xsi:type="esdl:OutPort" name="Out" id="c932c77b-d5e5-40eb-b9c8-c67b8d0e25e9" connectedTo="7206613a-713e-42af-8c0e-ff16195ec3ad" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:InPort" name="In" id="7c3e792b-9c73-49af-9845-1ee16dcb2a27" connectedTo="b7e1cb61-6809-4a3e-8053-3eac95fadcd4" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_ce68" length="455.2" id="ce6861d7-f06f-4391-adcf-bb1284c24718" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.09084554299605" lon="4.387664794921876"/>
          <point xsi:type="esdl:Point" lat="52.08675177427041" lon="4.387589693069459"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" name="In" id="7206613a-713e-42af-8c0e-ff16195ec3ad" connectedTo="c932c77b-d5e5-40eb-b9c8-c67b8d0e25e9" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:OutPort" name="Out" id="22daf91b-d674-4fe9-b35b-360a731c173b" connectedTo="59f661b5-9a21-4054-8af9-3ee8858f9960" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="5888dfba-51d2-4562-b1f4-6b3965f20eba">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_408e" length="404.9" id="408e117a-809b-458e-bd9f-1ead868fc84a" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08633644341566" lon="4.387664794921876"/>
          <point xsi:type="esdl:Point" lat="52.08269718870518" lon="4.387879371643067"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" name="In" id="5a64ebd4-90d9-471e-b413-5948c25cf9c8" connectedTo="80cfef3d-79d3-4d2c-b78d-701264cf3313" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <port xsi:type="esdl:OutPort" name="Out" id="1fb45b83-fc31-475f-9ced-0f9f17a2c454" connectedTo="eb6769ba-4a7d-4e1a-8f89-0e1f60d86f32" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="3efcdead-3f3b-4972-b7e9-dd3dbebabb81">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_408e_ret" length="413.5" id="9a7df578-3001-4e0b-a902-fca2665bef9c" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08268400246011" lon="4.3873000144958505"/>
          <point xsi:type="esdl:Point" lat="52.086402369206255" lon="4.387278556823731"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" name="In" id="f7beb290-c113-4f55-ad8b-7a3a6d096b23" connectedTo="a79a74b2-6ca2-4098-827b-7895d4ebb631" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" name="Out" id="96a5a980-06b9-4519-bc9b-c61e2f86537d" connectedTo="0500e037-457c-418b-9a55-d7ed0d34a98a" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="0970189c-8baa-4c65-83ab-d13e0b7c03c0">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN300" name="Pipe_ce68_ret" length="436.9" id="71ef008d-7412-4db6-9d42-adba1a7f59d1" outerDiameter="0.45" innerDiameter="0.3127">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.0867319966983" lon="4.38732147216797"/>
          <point xsi:type="esdl:Point" lat="52.09066096891663" lon="4.387235641479493"/>
        </geometry>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" name="steel" thermalConductivity="52.15" id="f4cee538-cc3b-4809-bd66-979f2ce9649b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.05785">
            <matter xsi:type="esdl:Material" name="PUR" thermalConductivity="0.027" id="e4c0350c-cd79-45b4-a45c-6259c750b478"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0052">
            <matter xsi:type="esdl:Material" name="HDPE" thermalConductivity="0.4" id="9a97f588-10fe-4a34-b0f2-277862151763"/>
          </component>
        </material>
        <port xsi:type="esdl:InPort" name="In" id="ef6d471c-ead8-4541-853e-f85dea09e2be" connectedTo="76ab7560-39a3-4095-81a2-6afd87603fcd" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <port xsi:type="esdl:OutPort" name="Out" id="b7e1cb61-6809-4a3e-8053-3eac95fadcd4" connectedTo="7c3e792b-9c73-49af-9845-1ee16dcb2a27" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="52bf58f4-7c46-48f7-9f28-4590b6719641">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e93bdda-8a74-42d5-960d-d64e4dff2025" name="Combined investment and installation costs" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="983f0959-8566-43ce-a380-782d29406ed3" description="Costs in EUR/m" perUnit="METRE" unit="EURO" physicalQuantity="COST"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatPump" name="GenericConversion_3d3f" id="3d3f6e8e-a8cb-48c4-9c6a-fc0d7848e549" power="10000000.0" COP="4.0">
        <geometry xsi:type="esdl:Point" lat="52.08654740560273" lon="4.387439489364625" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" name="HeatInPrimary" id="59f661b5-9a21-4054-8af9-3ee8858f9960" connectedTo="22daf91b-d674-4fe9-b35b-360a731c173b" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe"/>
        <port xsi:type="esdl:InPort" name="HeatInSecondary" id="0500e037-457c-418b-9a55-d7ed0d34a98a" connectedTo="96a5a980-06b9-4519-bc9b-c61e2f86537d" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c_ret"/>
        <port xsi:type="esdl:OutPort" name="HeatOutPrimary" id="76ab7560-39a3-4095-81a2-6afd87603fcd" connectedTo="ef6d471c-ead8-4541-853e-f85dea09e2be" carrier="d336e381-ca6f-442e-985e-9f4c2bec1efe_ret"/>
        <port xsi:type="esdl:OutPort" name="HeatOutSecondary" id="80cfef3d-79d3-4d2c-b78d-701264cf3313" connectedTo="5a64ebd4-90d9-471e-b413-5948c25cf9c8" carrier="72126c73-87e9-4bf6-99cf-d02a6c07010c"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
