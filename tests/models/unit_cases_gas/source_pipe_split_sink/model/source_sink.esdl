<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2207" name="Untitled EnergySystem" version="2" id="47475692-1016-4d52-9898-416270c3d943" description="">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="29011ed8-60de-4b61-bb59-910356c1417b">
    <carriers xsi:type="esdl:Carriers" id="689cb14a-8325-4c43-ab2d-8755a4b9de1f">
      <carrier xsi:type="esdl:GasCommodity" id="aebcaaae-484a-4a61-a91a-6b83c663aa48" pressure="15.0" name="gas"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="0e2ff04d-b867-4551-8922-2c39377a9a03">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" unit="WATT" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="d04d66e1-73bd-4371-9ffb-5b569f1dc65d" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="114658f2-81a5-478e-b051-f4e29356b627" name="Untitled Area">
      <asset xsi:type="esdl:GasProducer" name="GasProducer_0876" id="0876900b-7107-4e4f-b76a-4d130e8549cf" power="31000000.0">
        <port xsi:type="esdl:OutPort" id="6e9b7534-46eb-43f4-a7a5-0aaeb30c1c30" connectedTo="29c0dc88-8d44-47e4-b5f8-a74e836e903e" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.0862573323384" lon="4.437446594238282"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="GasDemand_a2d8" id="a2d8e2af-beea-4383-898e-dfbdbcf40ad2" power="31000000.0">
        <port xsi:type="esdl:InPort" id="540de366-8c1e-481d-8cfe-fdc1c881860b" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="3c0edd70-8a95-4ca0-a363-9e455bedcdda"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.087417614082575" lon="4.46645736694336"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe1" outerDiameter="0.45" id="a5aa96d4-f192-48ef-9f88-b9b2f06e952a" diameter="DN300" length="700.0">
        <port xsi:type="esdl:InPort" id="29c0dc88-8d44-47e4-b5f8-a74e836e903e" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="6e9b7534-46eb-43f4-a7a5-0aaeb30c1c30"/>
        <port xsi:type="esdl:OutPort" id="68cf7875-2a39-41b9-80f0-2f9cd4d5257b" connectedTo="1e5ad94f-f3ed-4b92-9c87-07dbedec46cb" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.0862573323384" lon="4.437446594238282"/>
          <point xsi:type="esdl:Point" lat="52.08670562658855" lon="4.448218345642091"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_212f" id="212f46cc-5b17-485b-b13b-6bbedee8c610">
        <port xsi:type="esdl:InPort" id="1e5ad94f-f3ed-4b92-9c87-07dbedec46cb" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="68cf7875-2a39-41b9-80f0-2f9cd4d5257b"/>
        <port xsi:type="esdl:OutPort" id="a17b8ec1-418c-4fdc-ba20-403f95e2a4ea" connectedTo="0e497cb4-9238-4143-b69e-b4947d79aa3b 0af85ede-0115-4373-9ed6-0c8cb4d7560b" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="52.08670562658855" lon="4.448668956756593"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe2" outerDiameter="0.45" id="dd72e18c-a168-4503-8acf-92182652736a" diameter="DN300" length="479.0">
        <port xsi:type="esdl:InPort" id="0e497cb4-9238-4143-b69e-b4947d79aa3b" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="a17b8ec1-418c-4fdc-ba20-403f95e2a4ea"/>
        <port xsi:type="esdl:OutPort" id="2ee7c1dd-2b66-4f9d-b380-048a29864252" connectedTo="68225fb8-b95c-46b0-bb2b-02306050b632" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08771427054657" lon="4.448186159133912"/>
          <point xsi:type="esdl:Point" lat="52.08800434089691" lon="4.455181360244752"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe3" outerDiameter="0.45" id="13f16a06-a2e2-4d3a-a1a5-68ea0edfb59c" diameter="DN300" length="700.00">
        <port xsi:type="esdl:InPort" id="19a2a857-2328-4d08-8603-8afbd082c7d1" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="7be3f6a6-231e-4492-a486-aaa9bd5cf3dc"/>
        <port xsi:type="esdl:OutPort" id="3c0edd70-8a95-4ca0-a363-9e455bedcdda" connectedTo="540de366-8c1e-481d-8cfe-fdc1c881860b" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.086995696938885" lon="4.455213546752931"/>
          <point xsi:type="esdl:Point" lat="52.087417614082575" lon="4.46645736694336"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_a700" id="a700f0b6-a59e-4645-86f6-8f2f2c95c850">
        <port xsi:type="esdl:InPort" id="68225fb8-b95c-46b0-bb2b-02306050b632" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="2ee7c1dd-2b66-4f9d-b380-048a29864252 b0f99e9b-c329-46f9-bf47-880cb2353c9b"/>
        <port xsi:type="esdl:OutPort" id="7be3f6a6-231e-4492-a486-aaa9bd5cf3dc" connectedTo="19a2a857-2328-4d08-8603-8afbd082c7d1" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="52.086995696938885" lon="4.455213546752931"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe4" outerDiameter="0.45" id="533b4980-f19f-4179-a2d4-872b8929f819" diameter="DN300" length="1397.4">
        <port xsi:type="esdl:InPort" id="0af85ede-0115-4373-9ed6-0c8cb4d7560b" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In" connectedTo="a17b8ec1-418c-4fdc-ba20-403f95e2a4ea"/>
        <port xsi:type="esdl:OutPort" id="b0f99e9b-c329-46f9-bf47-880cb2353c9b" connectedTo="68225fb8-b95c-46b0-bb2b-02306050b632" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08670562658855" lon="4.448668956756593"/>
          <point xsi:type="esdl:Point" lat="52.08206424454861" lon="4.449634552001954"/>
          <point xsi:type="esdl:Point" lat="52.0823147860172" lon="4.454827308654786"/>
          <point xsi:type="esdl:Point" lat="52.086995696938885" lon="4.455213546752931"/>
        </geometry>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
