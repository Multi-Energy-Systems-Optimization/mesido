<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="e93b63f2-6871-4e15-b66f-98b640709118" description="" esdlVersion="v2207" name="test" version="3">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="1b1b61d9-4555-42e2-8d51-cecb99f0ebd4">
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="56dc7662-fa31-45f1-b33b-49c217f40ca9">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="WATT" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA"/>
    </quantityAndUnits>
    <carriers xsi:type="esdl:Carriers" id="699e3192-a773-4566-b6f9-d61f3ab749b5">
      <carrier xsi:type="esdl:GasCommodity" name="gas" pressure="8.0" id="43264592-a907-498c-9595-25b8fefb268b"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="4eb142f6-d611-4791-a771-4649b6b0d523" name="Untitled instance">
    <area xsi:type="esdl:Area" id="6b615002-f95c-49c0-8394-a99d03671d30" name="Untitled area">
      <asset xsi:type="esdl:GasProducer" name="GasProducer_3573" power="10000000.0" id="35734457-bbb7-483f-90ce-927000df81e8">
        <port xsi:type="esdl:OutPort" carrier="43264592-a907-498c-9595-25b8fefb268b" name="Out" connectedTo="fe62444f-6b6c-426a-9cb4-5f26ee44121f" id="738238fc-12e6-4ebd-ac43-cb5a536a0d8a"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lon="4.435129165649415" lat="52.088129590216774"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" name="GasProducer_a977" power="10000000.0" id="a9777537-496a-4746-8f20-652c511fb98e">
        <port xsi:type="esdl:OutPort" carrier="43264592-a907-498c-9595-25b8fefb268b" name="Out" connectedTo="fe62444f-6b6c-426a-9cb4-5f26ee44121f" id="02698b65-c114-46a5-9c1e-0ddc125bc834"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lon="4.434700012207032" lat="52.083040029708826"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="GasDemand_47d0" power="170000000.0" id="47d0748a-5fd3-45cd-85de-f11df1cbe8b0">
        <port xsi:type="esdl:InPort" carrier="43264592-a907-498c-9595-25b8fefb268b" name="In" connectedTo="fd179090-c7db-4ee6-b463-46a7cba19ae4" id="65853820-c234-4483-89f1-49d0c764ed17"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lon="4.456930160522462" lat="52.08886792383876"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="GasDemand_7978" power="170000000.0" id="7978b867-4fce-4ecb-9e20-558e2b1537ee">
        <port xsi:type="esdl:InPort" carrier="43264592-a907-498c-9595-25b8fefb268b" name="In" connectedTo="fd179090-c7db-4ee6-b463-46a7cba19ae4" id="7b417ffc-835b-45e3-9fc0-f076a8eee711"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lon="4.456629753112794" lat="52.08369933192916"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_17c4" id="17c41d19-1028-40b0-9230-a07757c38dcb">
        <port xsi:type="esdl:InPort" carrier="43264592-a907-498c-9595-25b8fefb268b" name="In" connectedTo="738238fc-12e6-4ebd-ac43-cb5a536a0d8a 02698b65-c114-46a5-9c1e-0ddc125bc834" id="fe62444f-6b6c-426a-9cb4-5f26ee44121f"/>
        <port xsi:type="esdl:OutPort" carrier="43264592-a907-498c-9595-25b8fefb268b" name="Out" connectedTo="65853820-c234-4483-89f1-49d0c764ed17 7b417ffc-835b-45e3-9fc0-f076a8eee711" id="fd179090-c7db-4ee6-b463-46a7cba19ae4"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lon="4.444956779479981" lat="52.0861254802313"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
