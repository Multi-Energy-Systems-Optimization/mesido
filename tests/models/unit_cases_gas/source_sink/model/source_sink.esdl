<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="Untitled EnergySystem" id="47475692-1016-4d52-9898-416270c3d943" description="" esdlVersion="v2207" version="1">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="29011ed8-60de-4b61-bb59-910356c1417b">
    <carriers xsi:type="esdl:Carriers" id="689cb14a-8325-4c43-ab2d-8755a4b9de1f">
      <carrier xsi:type="esdl:GasCommodity" pressure="8.0" id="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Hydrogen"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="0e2ff04d-b867-4551-8922-2c39377a9a03">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="d04d66e1-73bd-4371-9ffb-5b569f1dc65d" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="114658f2-81a5-478e-b051-f4e29356b627" name="Untitled Area">
      <asset xsi:type="esdl:GasProducer" power="1200000000.0" name="GasProducer_0876" id="0876900b-7107-4e4f-b76a-4d130e8549cf">
        <geometry xsi:type="esdl:Point" lon="4.437446594238282" CRS="WGS84" lat="52.0862573323384"/>
        <port xsi:type="esdl:OutPort" id="6e9b7534-46eb-43f4-a7a5-0aaeb30c1c30" connectedTo="29c0dc88-8d44-47e4-b5f8-a74e836e903e" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="GasDemand_a2d8" id="a2d8e2af-beea-4383-898e-dfbdbcf40ad2" power="1200000000.0">
        <geometry xsi:type="esdl:Point" lon="4.46645736694336" CRS="WGS84" lat="52.087417614082575"/>
        <port xsi:type="esdl:InPort" connectedTo="3c0edd70-8a95-4ca0-a363-9e455bedcdda" id="540de366-8c1e-481d-8cfe-fdc1c881860b" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In">
        </port>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_4abc" id="4abcb49f-2dac-4e00-9c93-9dbab4510a31" length="1986.4" outerDiameter="0.45" diameter="DN300">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.437446594238282" lat="52.0862573323384"/>
          <point xsi:type="esdl:Point" lon="4.46645736694336" lat="52.087417614082575"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="6e9b7534-46eb-43f4-a7a5-0aaeb30c1c30" id="29c0dc88-8d44-47e4-b5f8-a74e836e903e" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="In"/>
        <port xsi:type="esdl:OutPort" id="3c0edd70-8a95-4ca0-a363-9e455bedcdda" connectedTo="540de366-8c1e-481d-8cfe-fdc1c881860b" carrier="aebcaaae-484a-4a61-a91a-6b83c663aa48" name="Out"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
