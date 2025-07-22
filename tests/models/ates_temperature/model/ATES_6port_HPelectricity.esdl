<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="90" id="6d632920-deae-4dc7-9870-0df7a8138870" description="" esdlVersion="v2401" name="accel_utes_charge_discharge">
  <instance xsi:type="esdl:Instance" id="5038aed8-004e-4841-976b-133b75f6264e" name="Untitled instance">
    <area xsi:type="esdl:Area" id="47f70d5c-e1ff-4c95-b27e-3c0801e251c1" name="Untitled area">
      <asset xsi:type="esdl:HeatPump" name="HeatPump_5e09" id="5e090abb-eeb2-4e62-b1db-611bd5874eb0" power="3500000.0" COP="4.0" efficiency="0.5">
        <geometry xsi:type="esdl:Point" lat="52.08633653886894" lon="5.1877999148147556"/>
        <port xsi:type="esdl:InPort" name="HeatInPrimary" id="ce8cbd62-fa72-4f8c-91d6-05f4f2efc392" connectedTo="4a8138bb-de3e-4739-bb83-1dca96864222" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <port xsi:type="esdl:OutPort" name="HeatOutPrimary" id="1f1b8209-614a-4034-92db-14b3a7b71f7a" connectedTo="2638062b-9de9-4eb6-8940-2c8d166d336a" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <port xsi:type="esdl:InPort" name="HeatInSecondary" id="1ceff18e-9d8b-4e22-ab38-6470987155b6" connectedTo="2406aa1a-8a3a-4aa5-9ee9-aa51a623b079" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" name="HeatOutSecondary" id="14ace9da-997a-42a8-ae45-a7647bf243a8" connectedTo="3f251393-5ae8-42d1-9d2f-9a57dd68bc61" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:InPort" id="959f5762-e257-4b96-a416-de3940b852a9" name="ElecIn" connectedTo="86731e03-48b3-44c7-92bd-265c9b1def15" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
        <costInformation xsi:type="esdl:CostInformation" id="c6d19fbc-999a-48e5-877f-a1a6bc3cccc4">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="7591a424-3f88-4337-beb5-b8afd3c50eec" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="2737119a-7dac-4b14-99a4-e3ac9b2e68ab" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatExchange" name="Hex_D1" id="a585fbb4-a62d-422a-ac14-deb267cc8a33" capacity="20000000.0">
        <geometry xsi:type="esdl:Point" lat="52.083250900448206" lon="5.195996629744913"/>
        <port xsi:type="esdl:InPort" name="PrimIn" id="2e0ac4cd-9b10-46e3-8428-3b42f0ca2a50" connectedTo="9c23668a-47e0-4fb1-88ba-8d23e1028cc8" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" name="SecOut" id="b24ee0ec-9626-471b-aafa-c5d82f15c340" connectedTo="30fbd482-4510-48cc-a2f1-e1884b15d4c1" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
        <port xsi:type="esdl:OutPort" name="PrimOut" id="ea4ae0b1-1283-48bf-8b4d-f5795fc810b2" connectedTo="63091bbf-3763-4898-b9a7-0ec44c1fedd1" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40"/>
        <port xsi:type="esdl:InPort" name="SecIn" id="4f0ccf8d-2452-4295-be48-557b8c53fa14" connectedTo="db5c8488-f56c-49ff-8005-b9a4e27ff531" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_bf07" id="bf07f987-ee5f-4afe-a466-61e54984ca0e" power="20000000.0">
        <geometry xsi:type="esdl:Point" lat="52.08653452420892" lon="5.200438343449072"/>
        <port xsi:type="esdl:InPort" name="In" id="40c39d88-f32a-419c-bb47-97ee8ac59f52" connectedTo="e76fb395-60f7-41d6-baa4-c6dd3f29f900" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
        <port xsi:type="esdl:OutPort" name="Out" id="6c8e697a-4a9b-45e9-8e46-302eee5521d8" connectedTo="f1779584-3d48-407a-afdf-559f0cff754f" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="2135d9eb-0e5e-4e61-b331-08cf3970d3dc" name="Pipe_2135" length="459.0" diameter="DN400">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.082775120064156" lon="5.186367119351441"/>
          <point xsi:type="esdl:Point" lat="52.08518866244888" lon="5.186367119351441"/>
          <point xsi:type="esdl:Point" lat="52.08520185084649" lon="5.189156514301661"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="b9053f95-fcf7-453e-929e-f2e0a4f20e4e" name="In" connectedTo="5c429ef1-a124-4ba0-84e5-6e241e0d97f2" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" id="c9885c2e-28f2-4918-88d1-feb1435efcff" name="Out" connectedTo="8c4beda9-0eea-4173-a273-679b09acaa65" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_3e42" length="25.04" id="3e422e76-6b82-4340-a0c4-ec18183d79e4" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08571685120297" lon="5.189158319475951"/>
          <point xsi:type="esdl:Point" lat="52.085716328372015" lon="5.1887918678163745"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="29acc54f-c04c-47f1-b2b9-4e5ce1aaa2e9" connectedTo="f2a95959-ec93-45c2-b860-181c1a2fe171" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" id="2406aa1a-8a3a-4aa5-9ee9-aa51a623b079" name="Out" connectedTo="1ceff18e-9d8b-4e22-ab38-6470987155b6" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="8fd6e0a2-fd25-4120-ba9d-aaf47da0b0e4" name="Joint_8fd6">
        <port xsi:type="esdl:InPort" id="8c4beda9-0eea-4173-a273-679b09acaa65" name="In" connectedTo="c9885c2e-28f2-4918-88d1-feb1435efcff 362c8c82-639d-4f42-b369-bde928c6e6f5" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" id="f2a95959-ec93-45c2-b860-181c1a2fe171" name="Out" connectedTo="29acc54f-c04c-47f1-b2b9-4e5ce1aaa2e9" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <geometry xsi:type="esdl:Point" lat="52.08571685120297" lon="5.189158319475951"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_e228" length="210.55" id="e228c7e4-8de0-4c4a-b26f-9416d91cbd0a" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.085723204518295" lon="5.184058157861556"/>
          <point xsi:type="esdl:Point" lat="52.085716328372015" lon="5.187139687730512"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="69c777ff-040a-4c64-ad47-b511f246f694" connectedTo="5f0a73f5-ba82-4105-81f0-7cdce7dc7898" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <port xsi:type="esdl:OutPort" id="4a8138bb-de3e-4739-bb83-1dca96864222" name="Out" connectedTo="ce8cbd62-fa72-4f8c-91d6-05f4f2efc392" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="95e5f855-b1be-4cc6-b644-69b051ffd784" name="Joint_95e5">
        <port xsi:type="esdl:InPort" id="54b77217-a714-47a4-9f6a-f79eac934d94" name="In" connectedTo="a9611038-7cd2-44d4-8d4d-9182666a2486" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <port xsi:type="esdl:OutPort" id="5f0a73f5-ba82-4105-81f0-7cdce7dc7898" name="Out" connectedTo="69c777ff-040a-4c64-ad47-b511f246f694 6b25d9ad-4afe-4436-a01a-c431e97007d3" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <geometry xsi:type="esdl:Point" lat="52.085723204518295" lon="5.184058157861556"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_cbe6" length="62.36" id="cbe6b8bf-6a39-4b58-9cc9-2015a47d95bc" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08691639901871" lon="5.199499128020802"/>
          <point xsi:type="esdl:Point" lat="52.08635558480809" lon="5.199507195267193"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="f1779584-3d48-407a-afdf-559f0cff754f" connectedTo="6c8e697a-4a9b-45e9-8e46-302eee5521d8" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
        <port xsi:type="esdl:OutPort" id="ace267d4-a85b-4bcb-99d1-20bf2b656a8d" name="Out" connectedTo="164bf4c9-b16a-4678-aae6-177a8fc4bf50" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_9d12" length="464.09" id="9d12da1e-07ac-4fb4-ad69-b1464062787b" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08635558480809" lon="5.199507195267193"/>
          <point xsi:type="esdl:Point" lat="52.08383032629127" lon="5.199499128020802"/>
          <point xsi:type="esdl:Point" lat="52.083803948681464" lon="5.196817017491769"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="37189149-c19f-4f55-a78d-1f3809c9dbf0" name="In" connectedTo="585e01dc-59af-46b1-93a8-1d3f92c4721d" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
        <port xsi:type="esdl:OutPort" name="Out" id="db5c8488-f56c-49ff-8005-b9a4e27ff531" connectedTo="4f0ccf8d-2452-4295-be48-557b8c53fa14" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="94e51e47-8b06-4a8b-a6fa-583b75b240da" name="Joint_94e5">
        <port xsi:type="esdl:InPort" id="164bf4c9-b16a-4678-aae6-177a8fc4bf50" name="In" connectedTo="ace267d4-a85b-4bcb-99d1-20bf2b656a8d" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
        <port xsi:type="esdl:OutPort" id="585e01dc-59af-46b1-93a8-1d3f92c4721d" name="Out" connectedTo="37189149-c19f-4f55-a78d-1f3809c9dbf0 9c5262e4-2a34-4e9c-8cbb-4b298776b11f 11a84120-195c-4b44-820a-0fc190f710ed" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
        <geometry xsi:type="esdl:Point" lat="52.08635558480809" lon="5.199507195267193"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="5f5fa2ee-77e4-43c9-837f-73b6e9a25bed" name="Pipe_5f5f" length="635.02" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.082760808560195" lon="5.196837875581984"/>
          <point xsi:type="esdl:Point" lat="52.08277399767529" lon="5.20151547634463"/>
          <point xsi:type="esdl:Point" lat="52.08561037250337" lon="5.201513441518922"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="30fbd482-4510-48cc-a2f1-e1884b15d4c1" name="In" connectedTo="b24ee0ec-9626-471b-aafa-c5d82f15c340" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
        <port xsi:type="esdl:OutPort" id="8f8b51fc-34cd-4298-bbad-ea6ef59e02b9" name="Out" connectedTo="d52e13d7-1ea8-4512-85b4-ba262bd9261e" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="9af5f188-90ea-4f51-83ff-0a188cd64415" name="Pipe_9af5" length="64.43" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08561037250337" lon="5.201513441518922"/>
          <point xsi:type="esdl:Point" lat="52.08618984725805" lon="5.20151547634463"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="2b686428-cef7-49be-9f4e-434cd602bb55" name="In" connectedTo="3e0b5462-2035-4ed9-9dff-2535c1a01326" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
        <port xsi:type="esdl:OutPort" id="e76fb395-60f7-41d6-baa4-c6dd3f29f900" name="Out" connectedTo="40c39d88-f32a-419c-bb47-97ee8ac59f52" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="ee1ca0ec-a44f-403a-b3f6-2a123b53b55d" name="Joint_ee1c">
        <port xsi:type="esdl:InPort" id="d52e13d7-1ea8-4512-85b4-ba262bd9261e" name="In" connectedTo="8f8b51fc-34cd-4298-bbad-ea6ef59e02b9 434ba2a1-e1f6-4756-85a6-f31c7003e5f7 7e2ac81a-c84a-4349-9f19-cf451f2bd981" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
        <port xsi:type="esdl:OutPort" id="3e0b5462-2035-4ed9-9dff-2535c1a01326" name="Out" connectedTo="2b686428-cef7-49be-9f4e-434cd602bb55" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
        <geometry xsi:type="esdl:Point" lat="52.08561037250337" lon="5.201513441518922"/>
      </asset>
      <asset xsi:type="esdl:HeatExchange" id="2729ab4e-ad8d-4f20-a061-1e2e69b1ccf8" name="Hex_C1" capacity="20000000.0">
        <geometry xsi:type="esdl:Point" lat="52.08601995487694" lon="5.196425915552295"/>
        <port xsi:type="esdl:InPort" id="27617393-f7b2-4cb6-97a5-a3f080c7ed73" name="PrimIn" connectedTo="434dfaec-477e-42c5-9e45-c4ac479abdee" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="db7a0bb5-a4e5-4f14-9e80-023d426da602" name="SecOut" connectedTo="120d69e5-2591-4e26-b90e-a961d3c7a1d1" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
        <port xsi:type="esdl:OutPort" id="41c5411e-2e96-4040-89a0-f0157fd4562d" name="PrimOut" connectedTo="1b2aefe2-845f-4e50-87a4-fbeea559507a" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:InPort" id="6f859f68-f7e0-4e29-b7dd-f65aae86e13a" name="SecIn" connectedTo="831ba5d0-6f34-4e62-85ef-d564d1f61bc1" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="34f61860-cee2-4361-bffb-e7f41235cc76" name="Pipe_34f6" length="161.3" diameter="DN400">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08650731804628" lon="5.199006000232838"/>
          <point xsi:type="esdl:Point" lat="52.08650731804628" lon="5.196645742967286"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9c5262e4-2a34-4e9c-8cbb-4b298776b11f" name="In" connectedTo="585e01dc-59af-46b1-93a8-1d3f92c4721d" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
        <port xsi:type="esdl:OutPort" id="831ba5d0-6f34-4e62-85ef-d564d1f61bc1" name="Out" connectedTo="6f859f68-f7e0-4e29-b7dd-f65aae86e13a" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="afeb72b0-b3c1-46f6-8e0e-90fa28e0f465" name="Pipe_afeb" length="303.5" diameter="DN400">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08555777123253" lon="5.196538458546099"/>
          <point xsi:type="esdl:Point" lat="52.08558414780573" lon="5.200980033582182"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="120d69e5-2591-4e26-b90e-a961d3c7a1d1" name="In" connectedTo="db7a0bb5-a4e5-4f14-9e80-023d426da602" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
        <port xsi:type="esdl:OutPort" id="434ba2a1-e1f6-4756-85a6-f31c7003e5f7" name="Out" connectedTo="d52e13d7-1ea8-4512-85b4-ba262bd9261e" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="3d4409aa-185d-4deb-a956-785ff4d4236a" name="Pipe_3d44" length="567.5" diameter="DN400">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08671807695058" lon="5.189865091789466"/>
          <point xsi:type="esdl:Point" lat="52.08302529884272" lon="5.189800721136778"/>
          <point xsi:type="esdl:Point" lat="52.08302529884272" lon="5.187504834523914"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="6157fb6b-bc9e-44cb-914c-4c8dcf679f65" name="In" connectedTo="601e1208-a2be-41f8-ae0c-8f369ed8bfd4" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="b41a852d-e958-4bb1-84a7-a8fc3b3a418d" name="Out" connectedTo="b7ddbfeb-8187-4434-a160-d1a6da109397" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="1c482564-86bf-452c-a1d4-bc46b8a2b925" name="Pipe_1c48" length="92.91" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.086955537473045" lon="5.188491967017979"/>
          <point xsi:type="esdl:Point" lat="52.08696239462721" lon="5.189851777000874"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="3f251393-5ae8-42d1-9d2f-9a57dd68bc61" name="In" connectedTo="14ace9da-997a-42a8-ae45-a7647bf243a8" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="4011308c-b240-41cf-afa6-49e0a0692271" name="Out" connectedTo="58685c3e-6cb0-4709-a11c-78c7e9fa9edd" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="5dded072-a944-4d6b-aeb4-417317777474" name="Joint_5dde">
        <port xsi:type="esdl:InPort" id="58685c3e-6cb0-4709-a11c-78c7e9fa9edd" name="In" connectedTo="4011308c-b240-41cf-afa6-49e0a0692271" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="601e1208-a2be-41f8-ae0c-8f369ed8bfd4" name="Out" connectedTo="6157fb6b-bc9e-44cb-914c-4c8dcf679f65 94ec771c-b39a-437b-a56b-577442da1573" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <geometry xsi:type="esdl:Point" lat="52.08696239462721" lon="5.189851777000874"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="48244e97-ec15-4f1b-838e-13a0dab12bb6" name="Pipe_4824" length="144.6" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08696898856444" lon="5.193992955657705"/>
          <point xsi:type="esdl:Point" lat="52.086955537473045" lon="5.196109160920451"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d3093d80-9f7b-4d65-8701-87f92d50a9e1" name="In" connectedTo="53552488-8056-40eb-b626-eaf9353be97b" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="434dfaec-477e-42c5-9e45-c4ac479abdee" name="Out" connectedTo="27617393-f7b2-4cb6-97a5-a3f080c7ed73" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="fa5f1cc9-00fb-4ba9-835f-0a0527452026" name="Joint_fa5f">
        <port xsi:type="esdl:InPort" id="bdc94e6d-59dc-4107-acb0-e6ad629b9c46" name="In" connectedTo="f9e5431e-c162-4ff3-9258-cda57dbaeec0" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="53552488-8056-40eb-b626-eaf9353be97b" name="Out" connectedTo="d3093d80-9f7b-4d65-8701-87f92d50a9e1 ec4698ef-a7b4-46de-8fde-c545a8f68a79" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <geometry xsi:type="esdl:Point" lat="52.08696898856444" lon="5.193992955657705"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_15af" length="261.88" id="15af16ab-b1a6-4af1-a720-093d4e35494d" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08567676362357" lon="5.195228933086071"/>
          <point xsi:type="esdl:Point" lat="52.08570969230752" lon="5.191396605301277"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="1b2aefe2-845f-4e50-87a4-fbeea559507a" name="In" connectedTo="41c5411e-2e96-4040-89a0-f0157fd4562d" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" name="Out" id="a7c088fb-1104-40ba-a2f5-46b5cc183cb1" connectedTo="231a599f-cac2-431f-b363-f23944ff4230" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="ee380e31-7e89-487d-8af5-ccd0d79561ce" name="Joint_ee38">
        <port xsi:type="esdl:InPort" id="231a599f-cac2-431f-b363-f23944ff4230" name="In" connectedTo="a7c088fb-1104-40ba-a2f5-46b5cc183cb1 8638f0a3-3ca9-4397-973b-29ed5d1d4fb4" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" id="72c1d574-3c4a-46ae-bc4f-1e0895b058ba" name="Out" connectedTo="ec60b44d-efbd-4081-a222-e23271d749c1" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <geometry xsi:type="esdl:Point" lat="52.08570969230752" lon="5.191396605301277"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="45fc9d28-9d9b-48d7-87d7-855b323e699f" name="Pipe_45fc" length="292.6" diameter="DN400">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08288719411578" lon="5.191418047215639"/>
          <point xsi:type="esdl:Point" lat="52.08551833795577" lon="5.1913965903314105"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="0a520578-7a69-46e0-b3f3-9614846d92fa" name="In" connectedTo="acae43e1-1ae5-4b04-8028-fbf4ac8731b3" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" id="8638f0a3-3ca9-4397-973b-29ed5d1d4fb4" name="Out" connectedTo="231a599f-cac2-431f-b363-f23944ff4230" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
      </asset>
      <asset xsi:type="esdl:Airco" id="930f3f30-a47f-4a65-a4cd-c0bdbc76c1dd" name="Airco_930f" power="15000000.0">
        <geometry xsi:type="esdl:Point" lat="52.08637700008078" lon="5.178299877058734" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="20731742-a185-454b-ac95-f9845103019b" name="In" connectedTo="82a22cf2-95a5-448e-90a4-6728310b5e18" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <port xsi:type="esdl:OutPort" id="7470caa3-10e7-49b3-b277-350e0289a170" name="Out" connectedTo="a81de100-16f7-4a31-ad5f-e43b4837ffaf" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <costInformation xsi:type="esdl:CostInformation" id="35afe237-78bb-4161-8417-fd04fc780aa4">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="1d96f9cd-508b-4392-ab38-2089cf95c774" value="0.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="7f4722d0-3592-440e-a5fd-b6c06bec0e0b" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_e7fc" length="266.81" id="e7fca076-3d98-4383-9024-82b70add636e" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.085723204518295" lon="5.184058157861556"/>
          <point xsi:type="esdl:Point" lat="52.08572404280798" lon="5.180153229871435"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="6b25d9ad-4afe-4436-a01a-c431e97007d3" name="In" connectedTo="5f0a73f5-ba82-4105-81f0-7cdce7dc7898" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <port xsi:type="esdl:OutPort" id="4a023fb2-4da5-4eec-8b6e-dfc590d4a3ac" name="Out" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f" connectedTo="f16ad1b7-caa0-4e5d-a989-ca327bf0e8ff"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_2847" length="44.57" id="2847495b-fcee-472d-8fc3-30ab254e204b" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08572404280798" lon="5.180153229871435"/>
          <point xsi:type="esdl:Point" lat="52.085716328372015" lon="5.17950103694381"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="53a77d74-1fce-4a09-b337-8f6abcf484ce" name="In" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f" connectedTo="5e82abe7-be73-4872-aaaf-ba975c77be8c"/>
        <port xsi:type="esdl:OutPort" name="Out" id="82a22cf2-95a5-448e-90a4-6728310b5e18" connectedTo="20731742-a185-454b-ac95-f9845103019b" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c4c17c09-94fc-43e1-998f-aa893964a976" name="Joint_c4c1">
        <port xsi:type="esdl:InPort" id="f16ad1b7-caa0-4e5d-a989-ca327bf0e8ff" name="In" connectedTo="4a023fb2-4da5-4eec-8b6e-dfc590d4a3ac c87b3e4a-ea4b-4a4c-9a52-d4e8780e438a" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <port xsi:type="esdl:OutPort" id="5e82abe7-be73-4872-aaaf-ba975c77be8c" name="Out" connectedTo="53a77d74-1fce-4a09-b337-8f6abcf484ce" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <geometry xsi:type="esdl:Point" lat="52.08572404280798" lon="5.180153229871435"/>
      </asset>
      <asset xsi:type="esdl:HeatProducer" id="4e191c80-258e-4599-8b8c-9da6be7520bd" name="HeatProducer_4e19" power="2500000.0">
        <geometry xsi:type="esdl:Point" lat="52.0854003103802" lon="5.178197588761622"/>
        <port xsi:type="esdl:InPort" id="d344e43c-9756-4201-8b15-59b2d9680485" name="Port" connectedTo="9aaf4597-6dcb-42f9-8805-f6edcc5b322a" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <port xsi:type="esdl:OutPort" id="bb93a597-8613-4e35-a74f-7feac35f9b12" name="Port" connectedTo="624fc74f-e93d-4435-943b-d09fcfb89e1a" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <costInformation xsi:type="esdl:CostInformation" id="ee8e3d51-5d03-4139-8732-a11a4c432bd4">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="912dc3a8-ce4e-4755-900f-3e46976bc4f9" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="c311189a-1aea-44ec-a771-374ff9f2d990" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="4dfaba85-d89c-43cf-bfc0-49e75ed1f59b" name="Pipe_4dfa" length="448.8" diameter="DN400">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.0866789238255" lon="5.181024565543408"/>
          <point xsi:type="esdl:Point" lat="52.08264322584827" lon="5.180895824238033"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="203c0884-86a2-4699-a59a-76938d42bebf" name="In" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f" connectedTo="86a07f1c-5d00-490e-a623-cbf00e03381c"/>
        <port xsi:type="esdl:OutPort" id="4b97d7c6-46cf-4dce-99f9-52f218bec7c6" name="Out" connectedTo="70a7c6a8-72b7-4527-be84-35b839776bf4" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="e73936ad-f740-46cf-8838-38f0a45af385" name="Pipe_e739" length="413.43" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08704820974048" lon="5.187062170503035"/>
          <point xsi:type="esdl:Point" lat="52.087041615815" lon="5.181011329149548"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="2638062b-9de9-4eb6-8940-2c8d166d336a" name="In" connectedTo="1f1b8209-614a-4034-92db-14b3a7b71f7a" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <port xsi:type="esdl:OutPort" id="0bf6ca41-b2f5-4b32-9abb-0b50156ff5f4" name="Out" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f" connectedTo="973fed5e-8f60-4a1e-9329-16dcf35e858e"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="12e3bb47-ec81-4595-9187-dae90e88ae0e" name="Joint_12e3">
        <port xsi:type="esdl:InPort" id="973fed5e-8f60-4a1e-9329-16dcf35e858e" name="In" connectedTo="0bf6ca41-b2f5-4b32-9abb-0b50156ff5f4 62e6bd12-f42d-44ff-895d-380eb0685d54" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <port xsi:type="esdl:OutPort" id="86a07f1c-5d00-490e-a623-cbf00e03381c" name="Out" connectedTo="203c0884-86a2-4699-a59a-76938d42bebf" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <geometry xsi:type="esdl:Point" lat="52.087041615815" lon="5.181011329149548"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="52d36363-d763-4b7d-8dba-763bd7da7d0b" name="Pipe_52d3" length="41.08" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08701524010322" lon="5.179520075695385"/>
          <point xsi:type="esdl:Point" lat="52.08702842796106" lon="5.180120868453888"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a81de100-16f7-4a31-ad5f-e43b4837ffaf" name="In" connectedTo="7470caa3-10e7-49b3-b277-350e0289a170" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <port xsi:type="esdl:OutPort" id="a491d9c1-6936-412d-88ec-6a7f3d384ccf" name="Out" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f" connectedTo="55d062a3-6c86-47ec-a919-c00b377af2e8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="e0a153e5-73d2-4510-bf82-1151010245f8" name="Pipe_e0a1" length="60.86" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08702842796106" lon="5.180120868453888"/>
          <point xsi:type="esdl:Point" lat="52.087041615815" lon="5.181011329149548"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="e263e500-6e1f-460e-af5b-66449fff1cb3" name="In" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f" connectedTo="d30a5a46-5c4c-42c4-b0b7-5f5823a9fde2"/>
        <port xsi:type="esdl:OutPort" id="62e6bd12-f42d-44ff-895d-380eb0685d54" name="Out" connectedTo="973fed5e-8f60-4a1e-9329-16dcf35e858e" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="565842a9-7c59-4f06-a0da-465e3d91df8b" name="Joint_5658">
        <port xsi:type="esdl:InPort" id="55d062a3-6c86-47ec-a919-c00b377af2e8" name="In" connectedTo="a491d9c1-6936-412d-88ec-6a7f3d384ccf" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <port xsi:type="esdl:OutPort" id="d30a5a46-5c4c-42c4-b0b7-5f5823a9fde2" name="Out" connectedTo="e263e500-6e1f-460e-af5b-66449fff1cb3 7b8c09d8-3775-404f-96d9-6dd022d24f27" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <geometry xsi:type="esdl:Point" lat="52.08702842796106" lon="5.180120868453888"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="98dad2b2-b08a-4e68-9c35-4a53afe095da" name="Pipe_98da" length="453.2" diameter="DN400">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.082615331727986" lon="5.181839868840604"/>
          <point xsi:type="esdl:Point" lat="52.082641710040285" lon="5.184049927916551"/>
          <point xsi:type="esdl:Point" lat="52.08535859270576" lon="5.18407138480078"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="5be25a5d-3a9a-4ed2-9a4c-38261a166fb0" name="In" connectedTo="cc926b83-f19c-4809-8d60-015a0a3d174a" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <port xsi:type="esdl:OutPort" id="a9611038-7cd2-44d4-8d4d-9182666a2486" name="Out" connectedTo="54b77217-a714-47a4-9f6a-f79eac934d94" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="c2250e2b-654e-4231-9c47-e944a112465e" name="ElectricityProducer_c225" power="10000000.0">
        <geometry xsi:type="esdl:Point" lat="52.08977785935224" lon="5.185010460773044"/>
        <port xsi:type="esdl:OutPort" id="8ee878ec-7e09-4496-9e8b-115fc88b45aa" name="Out" connectedTo="ee5a0430-4c16-472c-8f6d-c7d22398a518" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
      </asset>
      <asset xsi:type="esdl:Export" id="1439d428-b278-4ec9-856a-ef1fd9b3dfdc" name="Export_1439" power="20000000.0">
        <geometry xsi:type="esdl:Point" lat="52.08977763953739" lon="5.190696724975342"/>
        <port xsi:type="esdl:InPort" id="c59d5cc3-fdd5-4bbe-992d-040c2b96254a" name="In" connectedTo="bfbf79dc-d073-4862-bb35-e3e35276e7a4" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
      </asset>
      <asset xsi:type="esdl:PVInstallation" id="6ea761ff-3675-4559-8fa9-b15609b32956" name="PVInstallation_6ea7" power="20000000.0">
        <geometry xsi:type="esdl:Point" lat="52.08977762218357" lon="5.187950127974267"/>
        <port xsi:type="esdl:OutPort" id="89cdb6ac-1313-4426-89d6-93c70aba18bb" name="Out" connectedTo="61f7aa46-0d49-4ba4-bf04-6465b85260f2" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="819265f3-abba-4c25-bd14-23786f2557d0" name="Bus_8192" capacity="2000000.0">
        <geometry xsi:type="esdl:Point" lat="52.08805048231839" lon="5.187885758897318"/>
        <port xsi:type="esdl:InPort" id="c54fd2fa-518d-44f1-9943-533611cb44a2" name="In" connectedTo="53d38f12-946c-4b6a-b29f-e54d30d731cc 57820fd2-a9eb-46a8-9a58-e9a0327978df" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
        <port xsi:type="esdl:OutPort" id="4b454fd6-8134-471b-80f1-db70c1560a60" name="Out" connectedTo="bfad2bf2-dd97-4fed-b723-01734ae3642a 327e2a6e-ede3-40f3-92d0-19c71f48887b" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="e7324537-e1cf-4caf-9153-4ad649b0cccc" name="ElectricityCable_e732" length="300.6" capacity="20000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08939505022388" lon="5.185012877723883"/>
          <point xsi:type="esdl:Point" lat="52.0880301586556" lon="5.185012877723883"/>
          <point xsi:type="esdl:Point" lat="52.088016971093836" lon="5.187190751473465"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ee5a0430-4c16-472c-8f6d-c7d22398a518" name="In" connectedTo="8ee878ec-7e09-4496-9e8b-115fc88b45aa" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
        <port xsi:type="esdl:OutPort" id="53d38f12-946c-4b6a-b29f-e54d30d731cc" name="Out" connectedTo="c54fd2fa-518d-44f1-9943-533611cb44a2" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="1e7b923c-37c5-4d60-be36-d835394716ff" name="ElectricityCable_1e7b" length="109.3" capacity="20000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08934889515239" lon="5.187963199305804"/>
          <point xsi:type="esdl:Point" lat="52.088366440164286" lon="5.187898828653116"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="61f7aa46-0d49-4ba4-bf04-6465b85260f2" name="In" connectedTo="89cdb6ac-1313-4426-89d6-93c70aba18bb" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
        <port xsi:type="esdl:OutPort" id="57820fd2-a9eb-46a8-9a58-e9a0327978df" name="Out" connectedTo="c54fd2fa-518d-44f1-9943-533611cb44a2" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="7205ae6b-7f31-4391-adf9-a69ded5dacad" name="ElectricityCable_7205" length="294.8" capacity="20000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08803675243505" lon="5.188445979201065"/>
          <point xsi:type="esdl:Point" lat="52.08808290886377" lon="5.190634581392742"/>
          <point xsi:type="esdl:Point" lat="52.08938845664515" lon="5.190634581392742"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="bfad2bf2-dd97-4fed-b723-01734ae3642a" name="In" connectedTo="4b454fd6-8134-471b-80f1-db70c1560a60" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
        <port xsi:type="esdl:OutPort" id="bfbf79dc-d073-4862-bb35-e3e35276e7a4" name="Out" connectedTo="c59d5cc3-fdd5-4bbe-992d-040c2b96254a" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="d4115e02-1039-4043-ae7e-8013081c65fa" name="ElectricityCable_d411" length="107.8" capacity="20000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.087713656097094" lon="5.187834458000427"/>
          <point xsi:type="esdl:Point" lat="52.08674435304683" lon="5.187845186442562"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="327e2a6e-ede3-40f3-92d0-19c71f48887b" name="In" connectedTo="4b454fd6-8134-471b-80f1-db70c1560a60" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
        <port xsi:type="esdl:OutPort" id="86731e03-48b3-44c7-92bd-265c9b1def15" name="Out" connectedTo="959f5762-e257-4b96-a416-de3940b852a9" carrier="cb2560b2-9c0f-4357-ba0f-c46a22c7b900"/>
      </asset>
      <asset xsi:type="esdl:HeatStorage" id="50b049a9-da1b-4f95-b0d8-488da495bb17" name="Buffer_C" capacity="380000000000.0" maxChargeRate="10000000.0" maxDischargeRate="10000000.0">
        <geometry xsi:type="esdl:Point" lat="52.08640332975438" lon="5.191475687051783" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="11d9b4ae-4646-4456-99c3-ad1af96adc6b" name="In" connectedTo="e077bb52-9929-46c5-bb65-c4731f31a2b3" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="5c4236b7-314c-4ce7-971a-198ec7832dd9" name="Out" connectedTo="8cddd0a1-4ce1-4748-9881-57d064038dc2" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="9260529c-272e-4cde-af98-9eccf3b4052d" name="Pipe_9260" length="30.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08687745304046" lon="5.191483520758786"/>
          <point xsi:type="esdl:Point" lat="52.08660722896756" lon="5.191483520758786"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="47b59669-605a-4191-a844-1ef34f2425c8" name="In" connectedTo="b519a6e2-a7d3-4ec0-9b4a-c795a7da3903" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="e077bb52-9929-46c5-bb65-c4731f31a2b3" name="Out" connectedTo="11d9b4ae-4646-4456-99c3-ad1af96adc6b" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="ef7c0681-6698-4ad3-858f-b482f27b7f9a" name="Pipe_ef7c_ret" length="64.3">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08624473069015" lon="5.191440594235371"/>
          <point xsi:type="esdl:Point" lat="52.08581631983868" lon="5.190807428014837"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8cddd0a1-4ce1-4748-9881-57d064038dc2" name="In" connectedTo="5c4236b7-314c-4ce7-971a-198ec7832dd9" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" id="28ef6543-64d5-41bc-858b-f21742196ada" name="Out" connectedTo="84de7ab8-2e5f-4c3a-a79d-93d1359db4f1" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="7a69b9ee-3457-44dc-8bfb-36335fdfcd47" name="Pipe_7a69" length="171.46" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08697631509732" lon="5.191483520758786"/>
          <point xsi:type="esdl:Point" lat="52.08696898856444" lon="5.193992955657705"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="77a0213c-38c0-4765-9a8d-e64e7bd5521d" name="In" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425" connectedTo="b519a6e2-a7d3-4ec0-9b4a-c795a7da3903"/>
        <port xsi:type="esdl:OutPort" id="f9e5431e-c162-4ff3-9258-cda57dbaeec0" name="Out" connectedTo="bdc94e6d-59dc-4107-acb0-e6ad629b9c46" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="9c0b9544-302a-435e-ab50-a630d264ec8a" name="Joint_9c0b">
        <port xsi:type="esdl:InPort" id="a62a87bb-549d-4758-b66f-013b71f6c636" name="In" connectedTo="38b1dd79-3dd6-4228-acb9-e489e8cbcbea" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="b519a6e2-a7d3-4ec0-9b4a-c795a7da3903" name="Out" connectedTo="47b59669-605a-4191-a844-1ef34f2425c8 77a0213c-38c0-4765-9a8d-e64e7bd5521d" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <geometry xsi:type="esdl:Point" lat="52.08697631509732" lon="5.191483520758786"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_580c" length="49.8" id="580c6de6-4480-4826-b236-1453edaf475a" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08570969230752" lon="5.191396605301277"/>
          <point xsi:type="esdl:Point" lat="52.08571745521198" lon="5.190667916813726"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ec60b44d-efbd-4081-a222-e23271d749c1" name="In" connectedTo="72c1d574-3c4a-46ae-bc4f-1e0895b058ba" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" id="e9ba38b0-d385-4c01-93f7-41d5713b98cc" name="Out" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9" connectedTo="84de7ab8-2e5f-4c3a-a79d-93d1359db4f1"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="90123a86-9015-44d6-ac17-ee77efb13d6c" name="Joint_9012">
        <port xsi:type="esdl:InPort" id="84de7ab8-2e5f-4c3a-a79d-93d1359db4f1" name="In" connectedTo="28ef6543-64d5-41bc-858b-f21742196ada e9ba38b0-d385-4c01-93f7-41d5713b98cc" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" id="c0b40221-acf4-4cac-86be-056bbdaff3cb" name="Out" connectedTo="ce2364a6-2ba2-49d3-a2a7-0ede79bff396" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <geometry xsi:type="esdl:Point" lat="52.08571745521198" lon="5.190667916813726"/>
      </asset>
      <asset xsi:type="esdl:HeatStorage" id="bbd0b0fa-d45c-483b-889b-656f56fbcace" name="Buffer_D" capacity="380000000000.0" maxChargeRate="10000000.0" maxDischargeRate="10000000.0">
        <geometry xsi:type="esdl:Point" lat="52.08323915787121" lon="5.194308261869725" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="729e2d96-1048-4540-be40-6875f8f32c92" name="In" connectedTo="6d96083f-deb3-4fd7-820a-022370f0f696" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="f03ca1e3-d2eb-4ece-a542-3d67594566c8" name="Out" connectedTo="325441fd-84fa-4ba4-bfb2-84e7ff4b6bcd" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_56dd" length="73.29" id="56dd4bf2-458c-411a-9622-ef6c8ca482ee" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08279078915964" lon="5.195374488830567"/>
          <point xsi:type="esdl:Point" lat="52.082811159769655" lon="5.194302458964928"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="63091bbf-3763-4898-b9a7-0ec44c1fedd1" connectedTo="ea4ae0b1-1283-48bf-8b4d-f5795fc810b2" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40"/>
        <port xsi:type="esdl:OutPort" id="9911ab09-2ed3-4f14-8b03-b79d845fce62" name="Out" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40" connectedTo="fd9abcb7-2cae-4c65-86c5-48f50a757fdd"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_c137" length="76.31" id="c1376d13-b2d9-4460-96d2-07419133c682" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.082811159769655" lon="5.194302458964928"/>
          <point xsi:type="esdl:Point" lat="52.08281715583175" lon="5.193185806274415"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="65a34255-c644-4f8b-93eb-bf9256c3d4d0" name="In" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40" connectedTo="3fec5693-4283-4d91-b91d-61265c5d867e"/>
        <port xsi:type="esdl:OutPort" name="Out" id="c0875e90-1c95-4eb2-ae3b-79dd98ce9bed" connectedTo="567bcae7-c72f-4fbd-8e0d-22830a163973" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="005249f1-9d06-4a84-a9b1-82c760da77eb" name="Joint_0052">
        <port xsi:type="esdl:InPort" id="fd9abcb7-2cae-4c65-86c5-48f50a757fdd" name="In" connectedTo="9911ab09-2ed3-4f14-8b03-b79d845fce62 a94b020c-346f-4c7c-93d0-e0caf0241e46" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40"/>
        <port xsi:type="esdl:OutPort" id="3fec5693-4283-4d91-b91d-61265c5d867e" name="Out" connectedTo="65a34255-c644-4f8b-93eb-bf9256c3d4d0" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40"/>
        <geometry xsi:type="esdl:Point" lat="52.082811159769655" lon="5.194302458964928"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_4763" length="353.52" id="47630c8e-3b97-4e63-8ffc-9323d2d1c07e" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08670539229604" lon="5.194027622541589"/>
          <point xsi:type="esdl:Point" lat="52.08372481575857" lon="5.19398470877313"/>
          <point xsi:type="esdl:Point" lat="52.08372579256999" lon="5.194307925393038"/>
        </geometry>
        <port xsi:type="esdl:InPort" name="In" id="ec4698ef-a7b4-46de-8fde-c545a8f68a79" connectedTo="53552488-8056-40eb-b626-eaf9353be97b" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="5f5d8471-ea30-4789-8fd9-f8f2f67ff87d" name="Out" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425" connectedTo="331c9897-ab10-4599-95dd-6dc8b74a54da"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_c8f1" length="87.88" id="c8f14f71-29cc-4fc1-ba40-51a69d8cfce0" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08372579256999" lon="5.194307925393038"/>
          <point xsi:type="esdl:Point" lat="52.08372481575857" lon="5.195593975090534"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="1d44dde4-b8c5-4274-82c0-0af492515b13" name="In" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425" connectedTo="d0ff29ff-18fb-4799-8a85-b40171ca9a3b"/>
        <port xsi:type="esdl:OutPort" name="Out" id="9c23668a-47e0-4fb1-88ba-8d23e1028cc8" connectedTo="2e0ac4cd-9b10-46e3-8428-3b42f0ca2a50" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="94f3859f-53c0-4d71-9688-aa6561d23ee9" name="Joint_94f3">
        <port xsi:type="esdl:InPort" id="331c9897-ab10-4599-95dd-6dc8b74a54da" name="In" connectedTo="5f5d8471-ea30-4789-8fd9-f8f2f67ff87d" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="d0ff29ff-18fb-4799-8a85-b40171ca9a3b" name="Out" connectedTo="1d44dde4-b8c5-4274-82c0-0af492515b13 b6dea282-7374-4fbe-a766-888091c32835" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <geometry xsi:type="esdl:Point" lat="52.08372579256999" lon="5.194307925393038"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="c6c777fc-593f-439d-9dd5-bbce2ff7febe" name="Pipe_c6c7" length="35.9">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08367601642212" lon="5.194297455585098"/>
          <point xsi:type="esdl:Point" lat="52.08335288851076" lon="5.194297455585098"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="b6dea282-7374-4fbe-a766-888091c32835" name="In" connectedTo="d0ff29ff-18fb-4799-8a85-b40171ca9a3b" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="6d96083f-deb3-4fd7-820a-022370f0f696" name="Out" connectedTo="729e2d96-1048-4540-be40-6875f8f32c92" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="f24b5909-0c2a-4230-ad64-613c5a4988b4" name="Pipe_f24b_ret" length="31.5">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08315175669076" lon="5.194302819806126"/>
          <point xsi:type="esdl:Point" lat="52.08286819225719" lon="5.194297455585098"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="325441fd-84fa-4ba4-bfb2-84e7ff4b6bcd" name="In" connectedTo="f03ca1e3-d2eb-4ece-a542-3d67594566c8" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40"/>
        <port xsi:type="esdl:OutPort" id="a94b020c-346f-4c7c-93d0-e0caf0241e46" name="Out" connectedTo="fd9abcb7-2cae-4c65-86c5-48f50a757fdd" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40"/>
      </asset>
      <asset xsi:type="esdl:HeatProducer" id="0a92a465-5bcd-4d1a-a7ac-4618dd39d462" name="HeatProducer_Peak" power="1000000.0">
        <geometry xsi:type="esdl:Point" lat="52.088802001690645" lon="5.19282102584839" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="17da8d98-1cde-4953-bd1c-03a3776c237a" name="Out" connectedTo="c505d447-5835-49c0-b9d6-17bfca9a7497" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
        <port xsi:type="esdl:InPort" id="8465bdef-c089-4607-999f-f3ee0baf9e16" name="In" connectedTo="122bfbc6-23a7-4854-865d-c97d30e63754" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
        <costInformation xsi:type="esdl:CostInformation" id="79d6e1b6-4187-4b7b-88b9-11c520c295a4">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="01fcc6a8-28e5-4443-85a9-f9e1de7007cf" value="3000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="5cc56680-f69d-4a8e-a046-1fc56864ebd9" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="8f64771c-3f83-4641-87bf-bbb50413b481" name="Pipe_8f64" length="33.55" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08696239462721" lon="5.189851777000874"/>
          <point xsi:type="esdl:Point" lat="52.086969326984956" lon="5.190342664718629"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="94ec771c-b39a-437b-a56b-577442da1573" name="In" connectedTo="601e1208-a2be-41f8-ae0c-8f369ed8bfd4" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="31fb3906-0b8b-4ba9-81dd-f5b6184d5f85" name="Out" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425" connectedTo="57c6855e-86a3-4699-8b7e-b947e253f7b0"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="c0de11b9-7026-45dc-a6e0-7cf23323f7ee" name="Pipe_c0de" length="77.95" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.086969326984956" lon="5.190342664718629"/>
          <point xsi:type="esdl:Point" lat="52.08697631509732" lon="5.191483520758786"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="eb67f3a4-30d2-468c-9ac2-66ab2b80a3ae" name="In" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425" connectedTo="f7631c0d-21fc-4d5c-bccf-1db6da36fa47"/>
        <port xsi:type="esdl:OutPort" id="38b1dd79-3dd6-4228-acb9-e489e8cbcbea" name="Out" connectedTo="a62a87bb-549d-4758-b66f-013b71f6c636" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="63e289e5-7411-4b41-a358-eae9f8a7d261" name="Joint_63e2">
        <port xsi:type="esdl:InPort" id="57c6855e-86a3-4699-8b7e-b947e253f7b0" name="In" connectedTo="31fb3906-0b8b-4ba9-81dd-f5b6184d5f85" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="f7631c0d-21fc-4d5c-bccf-1db6da36fa47" name="Out" connectedTo="eb67f3a4-30d2-468c-9ac2-66ab2b80a3ae" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <geometry xsi:type="esdl:Point" lat="52.086969326984956" lon="5.190342664718629"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_3a55" length="40.55" id="3a552957-f69b-4381-b046-d8e2cfaa0c5a" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08571745521198" lon="5.190667916813726"/>
          <point xsi:type="esdl:Point" lat="52.08571673622355" lon="5.19007444381714"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ce2364a6-2ba2-49d3-a2a7-0ede79bff396" name="In" connectedTo="c0b40221-acf4-4cac-86be-056bbdaff3cb" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" id="6fe6143e-2966-4b53-b0b8-6c6fef0034bb" name="Out" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9" connectedTo="031d6fcd-7cf6-4522-8d68-35c5966ad11b"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe_c327" length="62.6" id="c327283f-52b3-48fe-a77c-f6c6838f791e" diameter="DN400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.08571673622355" lon="5.19007444381714"/>
          <point xsi:type="esdl:Point" lat="52.08571685120297" lon="5.189158319475951"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a0988145-51dc-4b0d-8ec1-74fb4b8239df" name="In" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9" connectedTo="b533c0d7-15d8-43d8-824a-cb96323343b6"/>
        <port xsi:type="esdl:OutPort" id="362c8c82-639d-4f42-b369-bde928c6e6f5" name="Out" connectedTo="8c4beda9-0eea-4173-a273-679b09acaa65" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="d41094c1-b5f2-46f5-b3c8-1be37990c51a" name="Joint_d410">
        <port xsi:type="esdl:InPort" id="031d6fcd-7cf6-4522-8d68-35c5966ad11b" name="In" connectedTo="6fe6143e-2966-4b53-b0b8-6c6fef0034bb" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:OutPort" id="b533c0d7-15d8-43d8-824a-cb96323343b6" name="Out" connectedTo="a0988145-51dc-4b0d-8ec1-74fb4b8239df" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <geometry xsi:type="esdl:Point" lat="52.08571673622355" lon="5.19007444381714"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="3efd277d-5329-4dee-b1db-1928114490fd" name="Pipe_3efd" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="691.9">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="6c4ace8e-ec46-430a-8faf-54657fb1eedc">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.088802001690645" lon="5.19282102584839"/>
          <point xsi:type="esdl:Point" lat="52.08561037250337" lon="5.201513441518922"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c505d447-5835-49c0-b9d6-17bfca9a7497" name="In" connectedTo="17da8d98-1cde-4953-bd1c-03a3776c237a" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
        <port xsi:type="esdl:OutPort" id="7e2ac81a-c84a-4349-9f19-cf451f2bd981" name="Out" connectedTo="d52e13d7-1ea8-4512-85b4-ba262bd9261e" carrier="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="53226c12-158d-4cd6-91ba-d55264f4ed75" name="Pipe_5322" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="531.7">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="c86ce344-276f-437d-8091-37bdae746c0d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08635558480809" lon="5.199507195267193"/>
          <point xsi:type="esdl:Point" lat="52.088802001690645" lon="5.19282102584839"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="11a84120-195c-4b44-820a-0fc190f710ed" name="In" connectedTo="585e01dc-59af-46b1-93a8-1d3f92c4721d" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
        <port xsi:type="esdl:OutPort" id="122bfbc6-23a7-4854-865d-c97d30e63754" name="Out" connectedTo="8465bdef-c089-4607-999f-f3ee0baf9e16" carrier="da9c93be-9585-4c95-bec5-1a97b9b9daf6"/>
      </asset>
      <asset xsi:type="esdl:ATES" id="1d313856-b807-454c-906a-e4fee49d9725" name="ATES_1d31" maxChargeRate="3610000.0" maxDischargeRate="3610000.0" aquiferTopDepth="300.0" aquiferThickness="45.0" aquiferMidTemperature="17.0" aquiferNetToGross="1.0" aquiferPorosity="0.3" aquiferPermeability="10000.0" aquiferAnisotropy="4.0" salinity="10000.0" wellCasingSize="13.0" wellDistance="150.0">
        <dataSource xsi:type="esdl:DataSource" name="WarmingUp factsheet: HT-ATES (high)" description="This data was generated using the 'kosten_per_asset.xslx' file in the 'Kentallen' directory of WarmingUp project 1D" attribution=""/>
        <costInformation xsi:type="esdl:CostInformation">
          <investmentCosts xsi:type="esdl:SingleValue" value="2333594.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" description="Cost in EUR" id="a3b5cdd9-364b-4262-bce5-4658c5f1bac9"/>
          </investmentCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="69666.67">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" description="Cost in EUR/yr" perTimeUnit="YEAR" id="3c9f580e-b71a-4bc8-8cea-cb6788c0bf49"/>
          </variableOperationalCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="115472.22">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" description="Cost in EUR/yr" perTimeUnit="YEAR" id="57537388-7fd7-40b3-a0c4-0ce65648eaab"/>
          </fixedMaintenanceCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="30000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" unit="EURO" description="Cost in EUR/yr" perTimeUnit="YEAR" id="574ef21d-681a-43ae-a1cb-f7b25d88defb"/>
          </fixedOperationalCosts>
        </costInformation>
        <geometry xsi:type="esdl:Point" lat="52.08162909023414" lon="5.187220573425294"/>
        <port xsi:type="esdl:InPort" id="b7ddbfeb-8187-4434-a160-d1a6da109397" name="ChargeHotIn" connectedTo="b41a852d-e958-4bb1-84a7-a8fc3b3a418d" carrier="3e394b4f-7857-4d5b-b60f-f6613502c425"/>
        <port xsi:type="esdl:OutPort" id="5c429ef1-a124-4ba0-84e5-6e241e0d97f2" name="ChargeHotOut" connectedTo="b9053f95-fcf7-453e-929e-f2e0a4f20e4e" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
        <port xsi:type="esdl:InPort" id="567bcae7-c72f-4fbd-8e0d-22830a163973" name="DischargeHotIn" connectedTo="c0875e90-1c95-4eb2-ae3b-79dd98ce9bed" carrier="c941d80d-445a-4962-8e8d-cd310ae78d40"/>
        <port xsi:type="esdl:InPort" id="70a7c6a8-72b7-4527-be84-35b839776bf4" name="DischargeColdIn" connectedTo="4b97d7c6-46cf-4dce-99f9-52f218bec7c6" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <port xsi:type="esdl:OutPort" id="cc926b83-f19c-4809-8d60-015a0a3d174a" name="DischargeColdOut" connectedTo="5be25a5d-3a9a-4ed2-9a4c-38261a166fb0" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <port xsi:type="esdl:OutPort" id="acae43e1-1ae5-4b04-8028-fbf4ac8731b3" name="DischargeHotOut" connectedTo="0a520578-7a69-46e0-b3f3-9614846d92fa" carrier="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="f38c5d9a-e934-4b28-bfde-ed9c1bf0fb07" name="Pipe_f38c" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="138.4">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="8c83f2fd-1daf-4b09-ad5d-273745198581">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.0854003103802" lon="5.178197588761622"/>
          <point xsi:type="esdl:Point" lat="52.08572404280798" lon="5.180153229871435"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="624fc74f-e93d-4435-943b-d09fcfb89e1a" name="In" connectedTo="bb93a597-8613-4e35-a74f-7feac35f9b12" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
        <port xsi:type="esdl:OutPort" id="c87b3e4a-ea4b-4a4c-9a52-d4e8780e438a" name="Out" connectedTo="f16ad1b7-caa0-4e5d-a989-ca327bf0e8ff" carrier="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="239b07e8-b9c6-4549-9053-b78b20f9cccd" name="Pipe_239b" innerDiameter="0.3938" outerDiameter="0.56" diameter="DN400" length="223.7">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="fa994030-a4b3-4e86-9404-2944657d032c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="9169bd50-197f-4d6b-aaac-b383a59c815d"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.08702842796106" lon="5.180120868453888"/>
          <point xsi:type="esdl:Point" lat="52.0854003103802" lon="5.178197588761622"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="7b8c09d8-3775-404f-96d9-6dd022d24f27" name="In" connectedTo="d30a5a46-5c4c-42c4-b0b7-5f5823a9fde2" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
        <port xsi:type="esdl:OutPort" id="9aaf4597-6dcb-42f9-8805-f6edcc5b322a" name="Out" connectedTo="d344e43c-9756-4201-8b15-59b2d9680485" carrier="21a8504f-454f-4779-8571-9dae4d5c6f0f"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="e6148785-26f8-472c-864a-25d441f7be4a">
    <carriers xsi:type="esdl:Carriers" id="900cbe4e-1c63-4e1c-8ec1-c647e2392d88">
      <carrier xsi:type="esdl:HeatCommodity" id="0fe6b8fb-be02-484b-a909-0460f430cd06" name="Ates_hot" supplyTemperature="83.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="713f7f15-aa81-49f4-b216-be6620ac4046" name="Ates_mid" supplyTemperature="63.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="bc434cd4-f9c9-4043-bba5-194ff6da8a50" name="Ates_cold" supplyTemperature="30.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="cdb0f4d4-cbc6-4a2a-88fa-885a6412959f" name="Cold_net_1" supplyTemperature="45.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="31e15344-5c5a-42ce-a7b4-8eee2ebd36f9" name="Hot_net_1" supplyTemperature="65.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="220215f7-1a14-48a9-97cb-aaea7c193068" name="Hot_net_2" supplyTemperature="80.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="3e394b4f-7857-4d5b-b60f-f6613502c425" name="Hot_net_3" supplyTemperature="90.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="da9c93be-9585-4c95-bec5-1a97b9b9daf6" name="Hot_net_4" supplyTemperature="50.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="7d62c3fb-3178-43ed-9a8a-71908aa2b4a5" name="Hot_net_5" supplyTemperature="80.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="c941d80d-445a-4962-8e8d-cd310ae78d40" name="Hot_net_6" supplyTemperature="60.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="21a8504f-454f-4779-8571-9dae4d5c6f0f" name="Heat_Cold_net_2" supplyTemperature="25.0"/>
      <carrier xsi:type="esdl:ElectricityCommodity" id="cb2560b2-9c0f-4357-ba0f-c46a22c7b900" name="Electricity" voltage="10000.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
