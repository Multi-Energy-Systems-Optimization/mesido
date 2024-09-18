<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" id="78ab6018-fdd7-4ad6-bd6e-2d8a38feeb57_with_return_network" description="" esdlVersion="v2401" name="Heating and cooling network with return network" version="16">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="bf7d18e8-40c0-4234-af50-a0c72991b8fd">
    <carriers xsi:type="esdl:Carriers" id="222f232f-3510-4270-8e2c-9e713d69f5cc">
      <carrier xsi:type="esdl:HeatCommodity" id="001521ea-9f10-4745-ac3b-6e0c767e16b2" supplyTemperature="22.0" name="LT"/>
      <carrier xsi:type="esdl:HeatCommodity" id="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" returnTemperature="8.0" name="LT_ret"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="45672c2e-bf7b-40b3-b625-f47b5865f42e" name="Untitled instance">
    <area xsi:type="esdl:Area" id="f1755851-5d5f-4798-bfbf-aa9a1f99c653" name="Untitled area">
      <asset xsi:type="esdl:CoolingDemand" name="CoolingDemand_1" id="c0842515-4f6b-44e5-8f6f-9a470d6f0b37" power="12000000.0">
        <port xsi:type="esdl:InPort" id="9400bb52-862c-44b1-9dac-a2190b2087d3" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In" connectedTo="1d8186aa-76c7-4d82-bc01-084cdb68e359"/>
        <port xsi:type="esdl:OutPort" id="b87783a5-9683-4bf6-86d9-0a82e26e3313" connectedTo="c0b27ede-d8da-4894-a288-291e2dcde7b3" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Port"/>
        <geometry xsi:type="esdl:Point" lat="51.98810497931513" lon="4.3792702277458915" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:ATES" maxChargeRate="5000000.0" name="ATES_1" maxStorageTemperature="26.0" minStorageTemperature="6.0" id="b2219730-9197-4057-9b99-93b32756886a" maxDischargeRate="5000000.0">
        <port xsi:type="esdl:InPort" id="abeb79f8-9d78-406d-87fc-f71553c15a69" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="7f008df3-cc20-4fc7-852d-e2375dd1eae7"/>
        <port xsi:type="esdl:OutPort" id="3c7b1a2a-87df-41e3-8823-4100495f52ff" connectedTo="ed220d84-039a-4432-b5a1-39cc412e3400" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port"/>
        <geometry xsi:type="esdl:Point" lat="51.989426621710344" lon="4.321046005483394" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" name="HeatPump_1" power="15000000.0" id="bfb2beda-2612-4358-bb2e-810096d2f219" COP="4.0">
        <port xsi:type="esdl:InPort" id="7fab37db-27ff-4772-a284-059f2c0de2b5" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In" connectedTo="d894f0db-1638-4520-b4f7-6576d1f76056"/>
        <port xsi:type="esdl:OutPort" id="e9e2f0a8-c7d8-4246-b4a2-c45b171cc9e7" connectedTo="f3cac062-81ae-44e6-a06c-212f1986b2f9" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.99782979186225" lon="4.3632351591223815" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Airco" name="Airco_1" power="6000000.0" id="2c26c88b-22a1-47cd-abe3-4929f3423d93">
        <port xsi:type="esdl:InPort" id="49a54630-f420-49e0-a357-37330260f6cf" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="4289b88c-21c6-4e4f-b545-2d464ddca524"/>
        <port xsi:type="esdl:OutPort" id="bb467777-7816-4a96-9ad0-af7e276808cb" connectedTo="5bf6808a-f633-446f-90db-4c43fd8b7d30" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.99666733844491" lon="4.363750086499999" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_81a5" id="81a5d5f0-7746-40fb-9a68-6af0bc5038c4">
        <port xsi:type="esdl:InPort" id="25f60a8a-072d-42e1-9617-0787745932df" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="fb186cd8-96ae-4478-b602-a86ed690889a"/>
        <port xsi:type="esdl:OutPort" id="84b74956-20a2-49e5-9f89-bbfacdb8d9d6" connectedTo="ae9bdc7d-ea46-4878-89ab-36bc6296ab68 0131bf9a-e2e0-4c37-b7b6-e5d6944f60ba" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.99608591924782" lon="4.348560878113622"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe1" diameter="DN400" length="1469.2" id="Pipe1" related="Pipe1_ret">
        <port xsi:type="esdl:InPort" id="0131bf9a-e2e0-4c37-b7b6-e5d6944f60ba" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="84b74956-20a2-49e5-9f89-bbfacdb8d9d6"/>
        <port xsi:type="esdl:OutPort" id="47355a98-eaf6-4b02-99a1-4b807da7b6a2" connectedTo="de02cebd-c106-4186-a94b-08df9eec8227" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.99608591924782" lon="4.348560878113622"/>
          <point xsi:type="esdl:Point" lat="51.98747252420681" lon="4.351650073483212"/>
          <point xsi:type="esdl:Point" lat="51.98313779836048" lon="4.35279996448387"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe2" diameter="DN400" length="296.13" id="Pipe2" related="Pipe2_ret">
        <port xsi:type="esdl:InPort" id="ae9bdc7d-ea46-4878-89ab-36bc6296ab68" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="84b74956-20a2-49e5-9f89-bbfacdb8d9d6"/>
        <port xsi:type="esdl:OutPort" id="722e540d-3e72-44c3-97ae-3566b88ce4c8" connectedTo="96ca92b4-3b68-4af1-b403-4acd3b911e6e" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99608591924782" lon="4.348560878113622"/>
          <point xsi:type="esdl:Point" lat="51.995399116181005" lon="4.344610836151502"/>
          <point xsi:type="esdl:Point" lat="51.99553047265992" lon="4.344554338635756"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe3" diameter="DN400" length="1768.24" id="Pipe3" related="Pipe3_ret">
        <port xsi:type="esdl:InPort" id="253e5752-7ccb-482b-b082-e5b3f2e6ebe8" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="2729871e-527d-4e14-9761-e8ee14b8808d"/>
        <port xsi:type="esdl:OutPort" id="559054f0-f415-456c-9e9c-46dfdea6b5fc" connectedTo="be0e23b7-4bdf-4972-97ee-c5592c7d1dfb" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99553047265992" lon="4.344554338635756"/>
          <point xsi:type="esdl:Point" lat="51.999651976743884" lon="4.343795515552547"/>
          <point xsi:type="esdl:Point" lat="52.00585895734452" lon="4.338465217949886"/>
          <point xsi:type="esdl:Point" lat="52.004961777969676" lon="4.330915550935296"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_fd18" id="fd183126-8b9d-4cb0-b365-ff22838a1225">
        <port xsi:type="esdl:InPort" id="96ca92b4-3b68-4af1-b403-4acd3b911e6e" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="722e540d-3e72-44c3-97ae-3566b88ce4c8"/>
        <port xsi:type="esdl:OutPort" id="2729871e-527d-4e14-9761-e8ee14b8808d" connectedTo="253e5752-7ccb-482b-b082-e5b3f2e6ebe8 1efa5215-26bf-4fd2-bd5b-3a6cfd5a559f" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.99553047265992" lon="4.344554338635756"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe4" diameter="DN400" length="1851.7" id="Pipe4" related="Pipe4_ret">
        <port xsi:type="esdl:InPort" id="1efa5215-26bf-4fd2-bd5b-3a6cfd5a559f" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="2729871e-527d-4e14-9761-e8ee14b8808d"/>
        <port xsi:type="esdl:OutPort" id="7f008df3-cc20-4fc7-852d-e2375dd1eae7" connectedTo="abeb79f8-9d78-406d-87fc-f71553c15a69" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.99553047265992" lon="4.344554338635756"/>
          <point xsi:type="esdl:Point" lat="51.99357525191401" lon="4.326373512718159"/>
          <point xsi:type="esdl:Point" lat="51.989426621710344" lon="4.321046005483394"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe5" diameter="DN400" length="120.67" id="Pipe5" related="Pipe5_ret">
        <port xsi:type="esdl:InPort" id="f3cac062-81ae-44e6-a06c-212f1986b2f9" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="e9e2f0a8-c7d8-4246-b4a2-c45b171cc9e7"/>
        <port xsi:type="esdl:OutPort" id="87b96574-f5bf-4d12-9dc7-ffc6bcc82f31" connectedTo="00031c3e-1632-4e52-b094-6261aa532565" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99782979186225" lon="4.3632351591223815"/>
          <point xsi:type="esdl:Point" lat="51.99765747293156" lon="4.361494981596344"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe6" diameter="DN400" length="1453.81" id="Pipe6" related="Pipe6_ret">
        <port xsi:type="esdl:InPort" id="b960e732-94c3-4ef3-a17d-99c20127395b" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="65ad942a-afe1-406b-955b-82f9c7eeca38"/>
        <port xsi:type="esdl:OutPort" id="fb186cd8-96ae-4478-b602-a86ed690889a" connectedTo="25f60a8a-072d-42e1-9617-0787745932df" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99765747293156" lon="4.361494981596344"/>
          <point xsi:type="esdl:Point" lat="51.99764477996154" lon="4.361474693580077"/>
          <point xsi:type="esdl:Point" lat="52.00063004573248" lon="4.359929911447225"/>
          <point xsi:type="esdl:Point" lat="51.9994940831065" lon="4.35469481644149"/>
          <point xsi:type="esdl:Point" lat="51.9971164149163" lon="4.355038115548191"/>
          <point xsi:type="esdl:Point" lat="51.99608591924782" lon="4.348560878113622"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_daa2" id="daa21bac-a68c-4769-bbeb-d5f492cf1877">
        <port xsi:type="esdl:InPort" id="00031c3e-1632-4e52-b094-6261aa532565" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="87b96574-f5bf-4d12-9dc7-ffc6bcc82f31"/>
        <port xsi:type="esdl:OutPort" id="65ad942a-afe1-406b-955b-82f9c7eeca38" connectedTo="b960e732-94c3-4ef3-a17d-99c20127395b aa02e7eb-ecaa-4c7e-8424-0f47b20b9095" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.99765747293156" lon="4.361494981596344"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe7" diameter="DN400" length="145.21" id="Pipe7" related="Pipe7_ret">
        <port xsi:type="esdl:InPort" id="aa02e7eb-ecaa-4c7e-8424-0f47b20b9095" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="65ad942a-afe1-406b-955b-82f9c7eeca38"/>
        <port xsi:type="esdl:OutPort" id="440e39fb-aa07-4465-bc7e-f42f2623e905" connectedTo="d203afd4-294c-4536-a7f8-43060e89924d" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99765747293156" lon="4.361494981596344"/>
          <point xsi:type="esdl:Point" lat="51.99640908831016" lon="4.362117304929249"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_5563" id="5563e161-dbfa-43e0-a92e-ad7420499891">
        <port xsi:type="esdl:InPort" id="d203afd4-294c-4536-a7f8-43060e89924d" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="440e39fb-aa07-4465-bc7e-f42f2623e905 90cc89f2-2141-42e0-a8c0-5991eeb54ac8"/>
        <port xsi:type="esdl:OutPort" id="d56d5c6d-3a9d-4295-90f5-14f39eb9f0b5" connectedTo="b3c375a2-3220-4772-9edf-ca2a04206bdd" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Point" lat="51.99640908831016" lon="4.362117304929249"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe8" diameter="DN400" length="115.4" id="Pipe8" related="Pipe8_ret">
        <port xsi:type="esdl:InPort" id="b3c375a2-3220-4772-9edf-ca2a04206bdd" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="d56d5c6d-3a9d-4295-90f5-14f39eb9f0b5"/>
        <port xsi:type="esdl:OutPort" id="4289b88c-21c6-4e4f-b545-2d464ddca524" connectedTo="49a54630-f420-49e0-a357-37330260f6cf" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.99640908831016" lon="4.362117304929249"/>
          <point xsi:type="esdl:Point" lat="51.99666733844491" lon="4.363750086499999"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe9" diameter="DN400" length="2101.9" id="Pipe9" related="Pipe9_ret">
        <port xsi:type="esdl:InPort" id="c0b27ede-d8da-4894-a288-291e2dcde7b3" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="b87783a5-9683-4bf6-86d9-0a82e26e3313"/>
        <port xsi:type="esdl:OutPort" id="90cc89f2-2141-42e0-a8c0-5991eeb54ac8" connectedTo="d203afd4-294c-4536-a7f8-43060e89924d" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="Out"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98810497931513" lon="4.3792702277458915"/>
          <point xsi:type="esdl:Point" lat="51.98550272261256" lon="4.368004701587918"/>
          <point xsi:type="esdl:Point" lat="51.99640908831016" lon="4.362117304929249"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_81a5_ret" id="c6b396c5-5758-41ac-9c5b-5fe63d397835">
        <port xsi:type="esdl:InPort" id="157aad77-a0fd-4c97-a26e-4e1df6ffa15e" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port" connectedTo="c207b0fc-f502-4395-b31c-ec9c79f0fb35 31b32b2f-2ac9-4f55-a6bf-73dd99b834d4"/>
        <port xsi:type="esdl:OutPort" id="d505422c-5dc8-4b4b-a352-48dab7d57a7c" connectedTo="77ab5e52-edaf-448a-9e14-e76b2619794f" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port"/>
        <geometry xsi:type="esdl:Point" lat="51.996175919337816" lon="4.34776114277135" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_fd18_ret" id="4d045aaa-86cc-4733-9a87-20c81d89725d">
        <port xsi:type="esdl:OutPort" id="9b230ca1-03c7-4d73-8b1e-a6503b59e2fb" connectedTo="9d14b744-ff41-4424-811d-60632200caf4" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port"/>
        <port xsi:type="esdl:InPort" id="4443fa2a-e0c4-40e9-978d-21923cf0e90e" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port" connectedTo="d720caa8-96db-4ac1-af18-9feff1bd0592 f42c5c51-c9be-41c2-9109-04ddb1b3de0b"/>
        <geometry xsi:type="esdl:Point" lat="51.99562047274992" lon="4.343751837677512" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_daa2_ret" id="f7170aeb-efd4-4e26-97da-9a32d574a5fe">
        <port xsi:type="esdl:OutPort" id="582f5e79-fb1d-4688-b23a-f9f8ac700f8b" connectedTo="eac79bf2-43ea-4051-972e-3eb684f79b8a" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port"/>
        <port xsi:type="esdl:InPort" id="87693dcc-a9c5-46ec-b55f-09c657b675ba" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port" connectedTo="b4335cd9-a981-4dcc-9554-7fd6fc85d7b7 e321f6a3-a3aa-4558-b925-0a83f2450826"/>
        <geometry xsi:type="esdl:Point" lat="51.997747473021555" lon="4.36070296757314" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_5563_ret" id="4160e224-0929-4920-a309-866278f1b9d0">
        <port xsi:type="esdl:OutPort" id="86654dfc-b8a0-4ba3-aa2e-34754f30aa5b" connectedTo="e5f9ec90-49fa-4cb3-8c32-a7c59efaeb8f b7069ad5-af80-4937-aef9-3048be9e4bf0" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port"/>
        <port xsi:type="esdl:InPort" id="2d1fd402-5d2a-4dad-a1ee-a94727f0a8ad" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port" connectedTo="2a6735bd-9ecc-4d45-81b9-ddb640aabf02"/>
        <geometry xsi:type="esdl:Point" lat="51.99649908840016" lon="4.361319169806175" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe1_ret" diameter="DN400" length="1469.2" id="Pipe1_ret" related="Pipe1">
        <port xsi:type="esdl:InPort" id="83d2d118-76d0-4566-ac70-1a9166dd55ac" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In_ret" connectedTo="134eb358-541f-43d9-8c24-faa7f6e60bde"/>
        <port xsi:type="esdl:OutPort" id="c207b0fc-f502-4395-b31c-ec9c79f0fb35" connectedTo="157aad77-a0fd-4c97-a26e-4e1df6ffa15e" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.98322779845048" lon="4.35193029550033" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.987562524296806" lon="4.35080515573096" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.996175919337816" lon="4.34776114277135" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe2_ret" diameter="DN400" length="296.13" id="Pipe2_ret" related="Pipe2">
        <port xsi:type="esdl:InPort" id="9d14b744-ff41-4424-811d-60632200caf4" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In_ret" connectedTo="9b230ca1-03c7-4d73-8b1e-a6503b59e2fb"/>
        <port xsi:type="esdl:OutPort" id="31b32b2f-2ac9-4f55-a6bf-73dd99b834d4" connectedTo="157aad77-a0fd-4c97-a26e-4e1df6ffa15e" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99562047274992" lon="4.343751837677512" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.995489116271" lon="4.343807678322918" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.996175919337816" lon="4.34776114277135" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe3_ret" diameter="DN400" length="1768.24" id="Pipe3_ret" related="Pipe3">
        <port xsi:type="esdl:InPort" id="46aa88e9-f922-43b6-b244-2fd7b5af1c39" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In_ret" connectedTo="4b472e65-2fa4-40ec-a738-f52d72b3da3a"/>
        <port xsi:type="esdl:OutPort" id="d720caa8-96db-4ac1-af18-9feff1bd0592" connectedTo="4443fa2a-e0c4-40e9-978d-21923cf0e90e" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.00505177805967" lon="4.330157527599254" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.00594895743452" lon="4.337711166793232" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.99974197683388" lon="4.343013086039256" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.99562047274992" lon="4.343751837677512" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe4_ret" diameter="DN400" length="1851.7" id="Pipe4_ret" related="Pipe4">
        <port xsi:type="esdl:InPort" id="ed220d84-039a-4432-b5a1-39cc412e3400" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In_ret" connectedTo="3c7b1a2a-87df-41e3-8823-4100495f52ff"/>
        <port xsi:type="esdl:OutPort" id="f42c5c51-c9be-41c2-9109-04ddb1b3de0b" connectedTo="4443fa2a-e0c4-40e9-978d-21923cf0e90e" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.98951662180034" lon="4.320211785690793" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.99366525200401" lon="4.325561120487929" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.99562047274992" lon="4.343751837677512" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe5_ret" diameter="DN400" length="120.67" id="Pipe5_ret" related="Pipe5">
        <port xsi:type="esdl:InPort" id="eac79bf2-43ea-4051-972e-3eb684f79b8a" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In_ret" connectedTo="582f5e79-fb1d-4688-b23a-f9f8ac700f8b"/>
        <port xsi:type="esdl:OutPort" id="d894f0db-1638-4520-b4f7-6576d1f76056" connectedTo="7fab37db-27ff-4772-a284-059f2c0de2b5" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.997747473021555" lon="4.36070296757314" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.99791979195225" lon="4.362443982553118" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe6_ret" diameter="DN400" length="1453.81" id="Pipe6_ret" related="Pipe6">
        <port xsi:type="esdl:InPort" id="77ab5e52-edaf-448a-9e14-e76b2619794f" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In_ret" connectedTo="d505422c-5dc8-4b4b-a352-48dab7d57a7c"/>
        <port xsi:type="esdl:OutPort" id="b4335cd9-a981-4dcc-9554-7fd6fc85d7b7" connectedTo="87693dcc-a9c5-46ec-b55f-09c657b675ba" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.996175919337816" lon="4.34776114277135" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.997206415006296" lon="4.354243460318822" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.999584083196495" lon="4.353911636752891" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="52.000720045822476" lon="4.359152096615075" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.99773478005154" lon="4.360682617799181" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.997747473021555" lon="4.36070296757314" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe7_ret" diameter="DN400" length="145.21" id="Pipe7_ret" related="Pipe7">
        <port xsi:type="esdl:InPort" id="e5f9ec90-49fa-4cb3-8c32-a7c59efaeb8f" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In_ret" connectedTo="86654dfc-b8a0-4ba3-aa2e-34754f30aa5b"/>
        <port xsi:type="esdl:OutPort" id="e321f6a3-a3aa-4558-b925-0a83f2450826" connectedTo="87693dcc-a9c5-46ec-b55f-09c657b675ba" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99649908840016" lon="4.361319169806175" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.997747473021555" lon="4.36070296757314" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe8_ret" diameter="DN400" length="115.4" id="Pipe8_ret" related="Pipe8">
        <port xsi:type="esdl:InPort" id="5bf6808a-f633-446f-90db-4c43fd8b7d30" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In_ret" connectedTo="bb467777-7816-4a96-9ad0-af7e276808cb"/>
        <port xsi:type="esdl:OutPort" id="2a6735bd-9ecc-4d45-81b9-ddb640aabf02" connectedTo="2d1fd402-5d2a-4dad-a1ee-a94727f0a8ad" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.996757338534906" lon="4.3629532254846755" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.99649908840016" lon="4.361319169806175" CRS="WGS84"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" name="Pipe9_ret" diameter="DN400" length="2101.9" id="Pipe9_ret" related="Pipe9">
        <port xsi:type="esdl:InPort" id="b7069ad5-af80-4937-aef9-3048be9e4bf0" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="In_ret" connectedTo="86654dfc-b8a0-4ba3-aa2e-34754f30aa5b"/>
        <port xsi:type="esdl:OutPort" id="1d8186aa-76c7-4d82-bc01-084cdb68e359" connectedTo="9400bb52-862c-44b1-9dac-a2190b2087d3" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="Out_ret"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.99649908840016" lon="4.361319169806175" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.985592722702556" lon="4.367148715218089" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lat="51.98819497940513" lon="4.378428802710231" CRS="WGS84"/>
        </geometry>
      </asset>
      <area xsi:type="esdl:Area" name="Residential_1" id="336b2e6a-d5cd-4bdd-872e-05b9c8f1622f">
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="52.01637358815169" lon="4.33443798598094"/>
            <point xsi:type="esdl:Point" lat="52.01272912079581" lon="4.325426756872678"/>
            <point xsi:type="esdl:Point" lat="52.010299310963326" lon="4.324740187035855"/>
            <point xsi:type="esdl:Point" lat="52.00580909779724" lon="4.314956566861206"/>
            <point xsi:type="esdl:Point" lat="51.99598188321521" lon="4.321307337851779"/>
            <point xsi:type="esdl:Point" lat="51.99909935158678" lon="4.341475326808335"/>
            <point xsi:type="esdl:Point" lat="52.00105426336875" lon="4.346882064273277"/>
            <point xsi:type="esdl:Point" lat="52.0073939303598" lon="4.343449215089162"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_1" id="140d3199-7e86-43d5-a05d-d93034f3414a" power="10000000.0">
          <port xsi:type="esdl:InPort" id="be0e23b7-4bdf-4972-97ee-c5592c7d1dfb" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="559054f0-f415-456c-9e9c-46dfdea6b5fc"/>
          <port xsi:type="esdl:OutPort" id="4b472e65-2fa4-40ec-a738-f52d72b3da3a" connectedTo="46aa88e9-f922-43b6-b244-2fd7b5af1c39" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port"/>
          <geometry xsi:type="esdl:Point" lat="52.004961777969676" lon="4.330915550935296" CRS="WGS84"/>
        </asset>
      </area>
      <area xsi:type="esdl:Area" name="Residential_2" id="e6fde750-d776-4a74-8dd6-ca1599f493e4">
        <geometry xsi:type="esdl:Polygon" CRS="WGS84">
          <exterior xsi:type="esdl:SubPolygon">
            <point xsi:type="esdl:Point" lat="51.983772059203304" lon="4.334691685037782"/>
            <point xsi:type="esdl:Point" lat="51.9769532844516" lon="4.341471562176369"/>
            <point xsi:type="esdl:Point" lat="51.9814463922035" lon="4.368848534419487"/>
            <point xsi:type="esdl:Point" lat="51.98984993682504" lon="4.36412836679137"/>
          </exterior>
        </geometry>
        <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_2" id="86975b87-29d4-4414-bcc7-f8d3c147b7b1" power="10000000.0">
          <port xsi:type="esdl:InPort" id="de02cebd-c106-4186-a94b-08df9eec8227" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2" name="In" connectedTo="47355a98-eaf6-4b02-99a1-4b807da7b6a2"/>
          <port xsi:type="esdl:OutPort" id="134eb358-541f-43d9-8c24-faa7f6e60bde" connectedTo="83d2d118-76d0-4566-ac70-1a9166dd55ac" carrier="001521ea-9f10-4745-ac3b-6e0c767e16b2_ret" name="ret_port"/>
          <geometry xsi:type="esdl:Point" lat="51.98313779836048" lon="4.35279996448387" CRS="WGS84"/>
        </asset>
      </area>
    </area>
  </instance>
</esdl:EnergySystem>
