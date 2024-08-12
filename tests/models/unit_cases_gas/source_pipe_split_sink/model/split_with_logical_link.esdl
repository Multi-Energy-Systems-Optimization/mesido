<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="47475692-1016-4d52-9898-416270c3d943" description="" esdlVersion="v2207" name="Untitled EnergySystem" version="3">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="29011ed8-60de-4b61-bb59-910356c1417b">
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="0e2ff04d-b867-4551-8922-2c39377a9a03">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATT" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA"/>
    </quantityAndUnits>
    <carriers xsi:type="esdl:Carriers" id="689cb14a-8325-4c43-ab2d-8755a4b9de1f">
      <carrier xsi:type="esdl:GasCommodity" name="gas" pressure="15.0" id="aebcaaae-484a-4a61-a91a-6b83c663aa48"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="d04d66e1-73bd-4371-9ffb-5b569f1dc65d" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="114658f2-81a5-478e-b051-f4e29356b627" name="Untitled Area">
      <asset xsi:type="esdl:GasProducer" name="GasProducer_0876" power="30000000.0" id="0876900b-7107-4e4f-b76a-4d130e8549cf">
        <port xsi:type="esdl:OutPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out" connectedTo="29c0dc88-8d44-47e4-b5f8-a74e836e903e" id="6e9b7534-46eb-43f4-a7a5-0aaeb30c1c30"/>
        <geometry xsi:type="esdl:Point" lon="4.437446594238282" CRS="WGS84" lat="52.0862573323384"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="GasDemand_a2d8" power="30000000.0" id="a2d8e2af-beea-4383-898e-dfbdbcf40ad2">
        <port xsi:type="esdl:InPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="3c0edd70-8a95-4ca0-a363-9e455bedcdda" id="540de366-8c1e-481d-8cfe-fdc1c881860b"/>
        <geometry xsi:type="esdl:Point" lon="4.46645736694336" CRS="WGS84" lat="52.087417614082575"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="700.0" name="Pipe1" outerDiameter="0.45" id="a5aa96d4-f192-48ef-9f88-b9b2f06e952a" diameter="DN300">
        <port xsi:type="esdl:InPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="6e9b7534-46eb-43f4-a7a5-0aaeb30c1c30" id="29c0dc88-8d44-47e4-b5f8-a74e836e903e"/>
        <port xsi:type="esdl:OutPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out" connectedTo="1e5ad94f-f3ed-4b92-9c87-07dbedec46cb" id="68cf7875-2a39-41b9-80f0-2f9cd4d5257b"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.437446594238282" lat="52.0862573323384"/>
          <point xsi:type="esdl:Point" lon="4.448218345642091" lat="52.08670562658855"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_212f" id="212f46cc-5b17-485b-b13b-6bbedee8c610">
        <port xsi:type="esdl:InPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="68cf7875-2a39-41b9-80f0-2f9cd4d5257b" id="1e5ad94f-f3ed-4b92-9c87-07dbedec46cb"/>
        <port xsi:type="esdl:OutPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out" connectedTo="0af85ede-0115-4373-9ed6-0c8cb4d7560b 68225fb8-b95c-46b0-bb2b-02306050b632" id="a17b8ec1-418c-4fdc-ba20-403f95e2a4ea"/>
        <geometry xsi:type="esdl:Point" lon="4.448668956756593" lat="52.08670562658855"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="700.0" name="Pipe3" outerDiameter="0.45" id="13f16a06-a2e2-4d3a-a1a5-68ea0edfb59c" diameter="DN300">
        <port xsi:type="esdl:InPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="7be3f6a6-231e-4492-a486-aaa9bd5cf3dc" id="19a2a857-2328-4d08-8603-8afbd082c7d1"/>
        <port xsi:type="esdl:OutPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out" connectedTo="540de366-8c1e-481d-8cfe-fdc1c881860b" id="3c0edd70-8a95-4ca0-a363-9e455bedcdda"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.455213546752931" lat="52.086995696938885"/>
          <point xsi:type="esdl:Point" lon="4.46645736694336" lat="52.087417614082575"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_a700" id="a700f0b6-a59e-4645-86f6-8f2f2c95c850">
        <port xsi:type="esdl:InPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="b0f99e9b-c329-46f9-bf47-880cb2353c9b a17b8ec1-418c-4fdc-ba20-403f95e2a4ea" id="68225fb8-b95c-46b0-bb2b-02306050b632"/>
        <port xsi:type="esdl:OutPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out" connectedTo="19a2a857-2328-4d08-8603-8afbd082c7d1" id="7be3f6a6-231e-4492-a486-aaa9bd5cf3dc"/>
        <geometry xsi:type="esdl:Point" lon="4.455213546752931" lat="52.086995696938885"/>
      </asset>
      <asset xsi:type="esdl:Pipe" length="1397.4" name="Pipe4" outerDiameter="0.45" id="533b4980-f19f-4179-a2d4-872b8929f819" diameter="DN300">
        <port xsi:type="esdl:InPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="a17b8ec1-418c-4fdc-ba20-403f95e2a4ea" id="0af85ede-0115-4373-9ed6-0c8cb4d7560b"/>
        <port xsi:type="esdl:OutPort" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out" connectedTo="68225fb8-b95c-46b0-bb2b-02306050b632" id="b0f99e9b-c329-46f9-bf47-880cb2353c9b"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.448668956756593" lat="52.08670562658855"/>
          <point xsi:type="esdl:Point" lon="4.449634552001954" lat="52.08206424454861"/>
          <point xsi:type="esdl:Point" lon="4.454827308654786" lat="52.0823147860172"/>
          <point xsi:type="esdl:Point" lon="4.455213546752931" lat="52.086995696938885"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
