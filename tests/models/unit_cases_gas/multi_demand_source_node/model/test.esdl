<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="test" id="e93b63f2-6871-4e15-b66f-98b640709118" description="" esdlVersion="v2207" version="2">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="1b1b61d9-4555-42e2-8d51-cecb99f0ebd4">
    <carriers xsi:type="esdl:Carriers" id="699e3192-a773-4566-b6f9-d61f3ab749b5">
      <carrier xsi:type="esdl:GasCommodity" pressure="8.0" id="43264592-a907-498c-9595-25b8fefb268b" name="gas"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="56dc7662-fa31-45f1-b33b-49c217f40ca9">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA" unit="WATT"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="4eb142f6-d611-4791-a771-4649b6b0d523" name="Untitled instance">
    <area xsi:type="esdl:Area" id="6b615002-f95c-49c0-8394-a99d03671d30" name="Untitled area">
      <asset xsi:type="esdl:GasProducer" power="11000000.0" name="GasProducer_3573" id="35734457-bbb7-483f-90ce-927000df81e8">
        <geometry xsi:type="esdl:Point" lon="4.435129165649415" CRS="WGS84" lat="52.088129590216774"/>
        <port xsi:type="esdl:OutPort" id="738238fc-12e6-4ebd-ac43-cb5a536a0d8a" connectedTo="1acd03da-1262-43be-9f28-58063bfc9aed" carrier="43264592-a907-498c-9595-25b8fefb268b" name="Out"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" power="11000000.0" name="GasProducer_a977" id="a9777537-496a-4746-8f20-652c511fb98e">
        <geometry xsi:type="esdl:Point" lon="4.434700012207032" CRS="WGS84" lat="52.083040029708826"/>
        <port xsi:type="esdl:OutPort" id="02698b65-c114-46a5-9c1e-0ddc125bc834" connectedTo="f283d51b-602c-47df-9d42-e9c179e24992" carrier="43264592-a907-498c-9595-25b8fefb268b" name="Out"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="GasDemand_47d0" id="47d0748a-5fd3-45cd-85de-f11df1cbe8b0" power="17000000.0">
        <geometry xsi:type="esdl:Point" lon="4.456930160522462" CRS="WGS84" lat="52.08886792383876"/>
        <port xsi:type="esdl:InPort" connectedTo="d5026706-d236-4f33-bfc2-f48ffc210fa2" id="65853820-c234-4483-89f1-49d0c764ed17" carrier="43264592-a907-498c-9595-25b8fefb268b" name="In">
        </port>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="GasDemand_7978" id="7978b867-4fce-4ecb-9e20-558e2b1537ee" power="17000000.0">
        <geometry xsi:type="esdl:Point" lon="4.456629753112794" CRS="WGS84" lat="52.08369933192916"/>
        <port xsi:type="esdl:InPort" connectedTo="a851c15f-62d7-4ad9-956a-c4dafc69cdd0" id="7b417ffc-835b-45e3-9fc0-f076a8eee711" carrier="43264592-a907-498c-9595-25b8fefb268b" name="In">
        </port>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_17c4" id="17c41d19-1028-40b0-9230-a07757c38dcb">
        <geometry xsi:type="esdl:Point" lon="4.444956779479981" CRS="WGS84" lat="52.0861254802313"/>
        <port xsi:type="esdl:InPort" connectedTo="129fe8e2-a9f7-4ab0-924d-014ae292e847 a127c15b-8cf9-4c69-a4d3-26e3b54f33af" id="fe62444f-6b6c-426a-9cb4-5f26ee44121f" carrier="43264592-a907-498c-9595-25b8fefb268b" name="In"/>
        <port xsi:type="esdl:OutPort" id="fd179090-c7db-4ee6-b463-46a7cba19ae4" connectedTo="80fca13d-c2ba-4629-887e-f3b273c086fc b5f9bd65-fbd4-408a-b6eb-aa7f7ae94918" carrier="43264592-a907-498c-9595-25b8fefb268b" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_0e39" id="0e396c3b-0345-459a-9c13-32dbcca9462d" length="707.5">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.435129165649415" lat="52.088129590216774"/>
          <point xsi:type="esdl:Point" lon="4.444956779479981" lat="52.0861254802313"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="738238fc-12e6-4ebd-ac43-cb5a536a0d8a" id="1acd03da-1262-43be-9f28-58063bfc9aed" carrier="43264592-a907-498c-9595-25b8fefb268b" name="In"/>
        <port xsi:type="esdl:OutPort" id="129fe8e2-a9f7-4ab0-924d-014ae292e847" connectedTo="fe62444f-6b6c-426a-9cb4-5f26ee44121f" carrier="43264592-a907-498c-9595-25b8fefb268b" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_f1a4" id="f1a4790b-33ac-4ba5-932e-b60acb1bbbed" length="78.3">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.434700012207032" lat="52.083040029708826"/>
          <point xsi:type="esdl:Point" lon="4.444956779479981" lat="52.0861254802313"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="02698b65-c114-46a5-9c1e-0ddc125bc834" id="f283d51b-602c-47df-9d42-e9c179e24992" carrier="43264592-a907-498c-9595-25b8fefb268b" name="In"/>
        <port xsi:type="esdl:OutPort" id="a127c15b-8cf9-4c69-a4d3-26e3b54f33af" connectedTo="fe62444f-6b6c-426a-9cb4-5f26ee44121f" carrier="43264592-a907-498c-9595-25b8fefb268b" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_7c53" id="7c530978-e957-41aa-82bf-46fe48ff1523" length="873.1">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.444956779479981" lat="52.0861254802313"/>
          <point xsi:type="esdl:Point" lon="4.456930160522462" lat="52.08886792383876"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="fd179090-c7db-4ee6-b463-46a7cba19ae4" id="80fca13d-c2ba-4629-887e-f3b273c086fc" carrier="43264592-a907-498c-9595-25b8fefb268b" name="In"/>
        <port xsi:type="esdl:OutPort" id="d5026706-d236-4f33-bfc2-f48ffc210fa2" connectedTo="65853820-c234-4483-89f1-49d0c764ed17" carrier="43264592-a907-498c-9595-25b8fefb268b" name="Out"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_c50f" id="c50f59a8-24f4-4ab9-a381-2861f2abba1e" length="842.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.444956779479981" lat="52.0861254802313"/>
          <point xsi:type="esdl:Point" lon="4.456629753112794" lat="52.08369933192916"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="fd179090-c7db-4ee6-b463-46a7cba19ae4" id="b5f9bd65-fbd4-408a-b6eb-aa7f7ae94918" carrier="43264592-a907-498c-9595-25b8fefb268b" name="In"/>
        <port xsi:type="esdl:OutPort" id="a851c15f-62d7-4ad9-956a-c4dafc69cdd0" connectedTo="7b417ffc-835b-45e3-9fc0-f076a8eee711" carrier="43264592-a907-498c-9595-25b8fefb268b" name="Out"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
