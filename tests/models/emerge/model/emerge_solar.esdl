<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2401" name="Untitled EnergySystem" version="7" id="415d9426-dae2-4194-88ad-607793871425" description="">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="7997daa8-8ded-4f31-96b2-6842510f43f2">
    <carriers xsi:type="esdl:Carriers" id="6e119417-37a2-4dfd-a493-95f4b68d0235">
      <carrier xsi:type="esdl:ElectricityCommodity" id="e1077d81-b32a-4004-9a33-db65c96b5f4c" voltage="50000.0" name="Elec"/>
      <carrier xsi:type="esdl:GasCommodity" id="14831e6c-c3bb-4763-8300-9658a365ee54" pressure="15.0" name="Hydrogen"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="791c9938-3b6c-47b3-bcc5-0328ffd687bd" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="3f8efe6b-ccda-4054-85d0-38cbcd6977da" name="Untitled Area">
      <asset xsi:type="esdl:ElectricityDemand" name="ElectricityDemand_f833" id="f8339608-af60-4b32-945b-521e6f7b8098" power="2000000000.0" technicalLifetime="20.0">
        <port xsi:type="esdl:InPort" id="ac3fc355-1545-4b78-a46c-1b0908f5ccde" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="In" connectedTo="69ba58df-cb90-4ebd-843e-d5b9865aeacd"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.36553758871974" lon="4.872436523437501"/>
      </asset>
      <asset xsi:type="esdl:Electrolyzer" name="Electrolyzer_6327" effMaxLoad="69.0" maxLoad="200000000" efficiency="63.0" id="6327ee2b-9f17-432f-8d15-b034422eab79" power="200000000.0" technicalLifetime="20.0" effMinLoad="67.0" minLoad="20000000">
        <costInformation xsi:type="esdl:CostInformation" id="995670aa-a117-4569-a89b-e3a63935c829">
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="63836d94-a84b-4137-8274-e926ace66a9f" value="15000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" id="1b39bf48-df74-4fcf-b94b-a23593fa965b" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST" perUnit="WATT"/>
          </fixedMaintenanceCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="d81bb99d-1508-4b13-bc13-1f1a149d481d" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="In" connectedTo="1e76b7b0-9f17-4ccc-b4c3-0089b3ff6a45"/>
        <port xsi:type="esdl:OutPort" id="5e58c0e2-5db4-4f6a-8aab-2c880d499c14" connectedTo="5e660a4f-e8ca-4e9d-8568-6292d36b5994" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.579688026538726" lon="3.6419677734375004"/>
      </asset>
      <asset xsi:type="esdl:GasDemand" name="GasDemand_4146" id="41466625-a14b-43a9-9a13-93d34a4ea6ff" power="500000000.0" technicalLifetime="20.0">
        <costInformation xsi:type="esdl:CostInformation" id="14964bd8-8eb0-4525-bcb4-0d03c1252a2b">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="5c63dce1-8a70-44f3-b6b9-476587ff73bb">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" id="4a4516c3-372a-4a6c-b25a-dcc8dca30545" description="Cost in EUR/kg" physicalQuantity="COST" multiplier="KILO" perUnit="GRAM"/>
          </variableOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="121a1b8d-758b-4b35-92fa-894435965e85" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="In" connectedTo="f0b7ab61-b983-45ed-9274-887ccaadfce0"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.633062890594374" lon="4.707641601562501"/>
      </asset>
      <asset xsi:type="esdl:GasStorage" name="GasStorage_9172" workingVolume="1000.0" id="9172f2eb-e1f4-4230-9495-396504f7c3c6" maxChargeRate="100000000.0" technicalLifetime="20.0" maxDischargeRate="100000000.0">
        <costInformation xsi:type="esdl:CostInformation" id="6f57c644-a1de-4c79-a707-76a6741c02b9">
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="ee900804-4f57-4488-a932-5c2a7102b4e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" id="6ae2e528-2275-47b0-81a9-97517e478150" description="Cost in EUR/kg/yr" physicalQuantity="COST" multiplier="KILO" perTimeUnit="YEAR" perUnit="GRAM"/>
          </fixedOperationalCosts>
        </costInformation>
        <port xsi:type="esdl:InPort" id="b2bd6049-3e2e-443c-aa36-ba893135cf82" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="In" connectedTo="0e6e6a7d-5b9a-42ff-8902-4e8db530b248"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.566334145326486" lon="3.8177490234375004"/>
      </asset>
      <asset xsi:type="esdl:Bus" name="Bus_24cf" id="24cf77d5-b66e-4362-9132-1065425d2c6a" technicalLifetime="20.0">
        <port xsi:type="esdl:InPort" id="8f93331f-7785-4213-a6e0-d120a8f0fba7" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="In" connectedTo="62807929-3c55-4545-8279-2f655ab7e943"/>
        <port xsi:type="esdl:OutPort" id="e2422830-d8e7-4652-a281-1d841c61e2cd" connectedTo="ca9db1df-cad3-45db-8115-fc6844467c6e 801d733f-16f6-4e5c-a22f-afd204d59776" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.466050361889515" lon="3.7298583984375004"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_80a3" capacity="2000000000.0" length="23801.2" id="80a35550-3167-4240-a7ac-92c40248dae7" technicalLifetime="20.0">
        <port xsi:type="esdl:InPort" id="b0ed14ac-faa8-499f-aa98-53be98852d0f" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="In" connectedTo="fd7fab3b-9c6e-491d-b3c2-a39833edf0bf"/>
        <port xsi:type="esdl:OutPort" id="62807929-3c55-4545-8279-2f655ab7e943" connectedTo="8f93331f-7785-4213-a6e0-d120a8f0fba7" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.49203060725069" lon="3.381008869842488"/>
          <point xsi:type="esdl:Point" lat="52.466050361889515" lon="3.7298583984375004"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_e388" capacity="2000000000.0" length="78291.5" id="e3880640-ef13-484f-819c-47f2dc41429d" technicalLifetime="20.0">
        <port xsi:type="esdl:InPort" id="ca9db1df-cad3-45db-8115-fc6844467c6e" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="In" connectedTo="e2422830-d8e7-4652-a281-1d841c61e2cd"/>
        <port xsi:type="esdl:OutPort" id="69ba58df-cb90-4ebd-843e-d5b9865aeacd" connectedTo="ac3fc355-1545-4b78-a46c-1b0908f5ccde" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.466050361889515" lon="3.7298583984375004"/>
          <point xsi:type="esdl:Point" lat="52.36553758871974" lon="4.872436523437501"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" name="ElectricityCable_91e7" capacity="2000000000.0" length="13965.2" id="91e77ee4-d2d8-4d6c-b655-835d180f4680" technicalLifetime="20.0">
        <port xsi:type="esdl:InPort" id="801d733f-16f6-4e5c-a22f-afd204d59776" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="In" connectedTo="e2422830-d8e7-4652-a281-1d841c61e2cd"/>
        <port xsi:type="esdl:OutPort" id="1e76b7b0-9f17-4ccc-b4c3-0089b3ff6a45" connectedTo="d81bb99d-1508-4b13-bc13-1f1a149d481d" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.466050361889515" lon="3.7298583984375004"/>
          <point xsi:type="esdl:Point" lat="52.579688026538726" lon="3.6419677734375004"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_2503" id="2503e1c2-e928-4331-bf0b-d41b5f1289fd">
        <port xsi:type="esdl:InPort" id="272d0690-117e-4f69-bd34-ed24b2dc6f0b" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="In" connectedTo="73a0c91a-a167-4a3d-b7e3-7603d32db9ac"/>
        <port xsi:type="esdl:OutPort" id="c3a78fa8-b482-4bcd-bad2-fd4c971b2565" connectedTo="f613dd95-9882-45a3-a569-4cd723444c90 1ab8ab85-2824-4606-a2ac-709596d8367b" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.5992941670283" lon="3.750457763671875"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_ec1a" id="ec1a89cf-c7fb-4574-a93b-048b9d06640a" diameter="DN1200" length="7646.2">
        <port xsi:type="esdl:InPort" id="5e660a4f-e8ca-4e9d-8568-6292d36b5994" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="In" connectedTo="5e58c0e2-5db4-4f6a-8aab-2c880d499c14"/>
        <port xsi:type="esdl:OutPort" id="73a0c91a-a167-4a3d-b7e3-7603d32db9ac" connectedTo="272d0690-117e-4f69-bd34-ed24b2dc6f0b" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.579688026538726" lon="3.6419677734375004"/>
          <point xsi:type="esdl:Point" lat="52.5992941670283" lon="3.750457763671875"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_97ee" id="97ee0a46-1a47-4bec-b131-c0a13246f298" diameter="DN1200" length="5839.7">
        <port xsi:type="esdl:InPort" id="f613dd95-9882-45a3-a569-4cd723444c90" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="In" connectedTo="c3a78fa8-b482-4bcd-bad2-fd4c971b2565"/>
        <port xsi:type="esdl:OutPort" id="0e6e6a7d-5b9a-42ff-8902-4e8db530b248" connectedTo="b2bd6049-3e2e-443c-aa36-ba893135cf82" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.5992941670283" lon="3.750457763671875"/>
          <point xsi:type="esdl:Point" lat="52.566334145326486" lon="3.8177490234375004"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_910d" id="910d3cd0-715a-423c-b67a-52fb967c85b4" diameter="DN1200" length="64730.1">
        <port xsi:type="esdl:InPort" id="1ab8ab85-2824-4606-a2ac-709596d8367b" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="In" connectedTo="c3a78fa8-b482-4bcd-bad2-fd4c971b2565"/>
        <port xsi:type="esdl:OutPort" id="f0b7ab61-b983-45ed-9274-887ccaadfce0" connectedTo="121a1b8d-758b-4b35-92fa-894435965e85" carrier="14831e6c-c3bb-4763-8300-9658a365ee54" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.5992941670283" lon="3.750457763671875"/>
          <point xsi:type="esdl:Point" lat="52.633062890594374" lon="4.707641601562501"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:PVInstallation" name="PVInstallation_2bcf" id="2bcf2f6d-6426-4f92-923a-ee1369bf5acd" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="fd7fab3b-9c6e-491d-b3c2-a39833edf0bf" connectedTo="b0ed14ac-faa8-499f-aa98-53be98852d0f" carrier="e1077d81-b32a-4004-9a33-db65c96b5f4c" name="Out"/>
        <geometry xsi:type="esdl:Point" CRS="WGS84" lat="52.492891564137324" lon="3.381034242066989"/>
        <costInformation xsi:type="esdl:CostInformation" id="cced62ec-db9f-476c-995b-9dae86ecc08f">
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="0c34c932-7857-4f8f-b1b3-d7fbe04d300c" value="255000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9dc9c866-79ee-4a72-9982-8d3d7e04d3aa" unit="EURO" description="Cost in EUR/MW" perMultiplier="MEGA" physicalQuantity="COST" perUnit="WATT"/>
          </fixedMaintenanceCosts>
        </costInformation>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
