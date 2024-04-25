<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" version="2" id="2dc6d2a1-519b-4759-986a-f3d4007d8d67" description="" esdlVersion="v2211" name="3a">
  <instance xsi:type="esdl:Instance" id="a6350368-fa00-4b9b-81b0-283d35b91de0" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="f280f1c3-8858-4336-906e-c7608b192bf6" name="Untitled Area">
      <asset xsi:type="esdl:HeatStorage" capacity="100000000000.0" id="4b0cd685-2219-4b02-ad4f-da3bc5453651" name="HeatStorage_4b0c">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="In" connectedTo="a7c97b65-6bdd-4a00-b9b7-6c8d214053bd" id="efad2169-5f95-4618-98ce-e89860e2897b"/>
        <port xsi:type="esdl:OutPort" connectedTo="776e5a76-57a5-4c03-b361-409ccb548b88" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="out" id="db555a41-d15b-44fb-b994-f5004eb3bc85"/>
        <geometry xsi:type="esdl:Point" lat="51.98322161118308" lon="4.383137226104737" CRS="WGS84"/>
        <costInformation xsi:type="esdl:CostInformation" id="a668decd-5b98-497b-84c7-b4d11f32648c">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="bc6341c5-c510-43be-8cfc-3cfaa7a2e621" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="9feaf430-fc73-419c-af6d-c3128091f3aa" unit="EURO" description="COST in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="f6c38846-7906-4749-a844-b10ad5556aef" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="cbcbe35a-719d-4cd7-870a-0c2edaca3683" unit="EURO" description="COST in EUR/kW" perMultiplier="KILO" physicalQuantity="COST"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="1c42a11a-0765-4a57-b03a-d65bb5bda7b2" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="7eafb8a5-c594-447f-b9a2-787d9159b999" physicalQuantity="COST" description="COST in EUR/EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GeothermalSource" flowRate="5.0" maxTemperature="80.0" id="b702bda3-632c-43ff-9867-72cda41f442f" minTemperature="80.0" power="1000000.0" name="GeothermalSource_b702">
        <constraint xsi:type="esdl:RangedConstraint" name="setpointconstraint" id="86ddf8ca-2241-4f4e-b2ab-e6b9ff944067">
          <range xsi:type="esdl:Range" id="fc3d32df-a615-490d-a957-7509a58ab6d9" name="NewRange" maxValue="0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perTimeUnit="DAY" id="47bca11d-8286-411f-be06-dd2e4e888e89"/>
          </range>
        </constraint>
        <port xsi:type="esdl:OutPort" connectedTo="7cec87b6-9928-4cfb-9b7b-fe7b51908911" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="Out" id="f31879b6-efa1-4b2c-8740-80bebb9500a7"/>
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="in" connectedTo="53542379-cead-4b7c-97f5-891e1985a8cc" id="02be741c-673b-4c30-8bad-dee320e26924"/>
        <geometry xsi:type="esdl:Point" lat="51.98491978527026" lon="4.3822574615478525" CRS="WGS84"/>
        <costInformation xsi:type="esdl:CostInformation" id="a668decd-5b98-497b-84c7-b4d11f32648c">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="bc6341c5-c510-43be-8cfc-3cfaa7a2e621" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="9feaf430-fc73-419c-af6d-c3128091f3aa" unit="EURO" description="COST in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="f6c38846-7906-4749-a844-b10ad5556aef" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="cbcbe35a-719d-4cd7-870a-0c2edaca3683" unit="EURO" description="COST in EUR/kW" perMultiplier="KILO" physicalQuantity="COST"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="1c42a11a-0765-4a57-b03a-d65bb5bda7b2" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="7eafb8a5-c594-447f-b9a2-787d9159b999" physicalQuantity="COST" description="COST in EUR/EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.16030000000000003" length="1000.0" id="de7364b2-24e6-4ce3-84a3-d6870a9f93bf" outerDiameter="0.25" name="Pipe_de73">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="In" connectedTo="1a4a112f-dd25-4438-9741-9cdd34c23e73" id="750c4c71-06a5-4137-a540-ac49fd5c8e24"/>
        <port xsi:type="esdl:OutPort" connectedTo="18b90d93-5005-45d0-b558-ece8994d39ae" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="Out" id="0f61b1e9-cf22-403c-8788-a0b00963dc5f"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" name="HDPE" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98443082345643" lon="4.385175704956056"/>
          <point xsi:type="esdl:Point" lat="51.9853294518694" lon="4.3877506256103525"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.16030000000000003" length="1000.0" id="2e4292aa-da7d-4e1a-a71f-d0058f06a5ae" outerDiameter="0.25" name="Pipe_2e42">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="In" connectedTo="1a4a112f-dd25-4438-9741-9cdd34c23e73" id="bff4b9c4-d3fc-475f-b57a-15006f7e2841"/>
        <port xsi:type="esdl:OutPort" connectedTo="f5eb43f1-fb71-4d82-97cc-3fb0eb2c209d" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="Out" id="618a8f33-60c9-4265-83e2-13916fc28e75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" name="HDPE" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.984166517550754" lon="4.385282993316651"/>
          <point xsi:type="esdl:Point" lat="51.98429867069855" lon="4.38807249069214"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.16030000000000003" length="1000.0" id="7fab434b-b488-43f2-826e-d9c46c0d1b98" outerDiameter="0.25" name="Pipe_7fab">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="In" connectedTo="1a4a112f-dd25-4438-9741-9cdd34c23e73" id="2a5d7b97-a173-4fcf-a317-669761abecde"/>
        <port xsi:type="esdl:OutPort" connectedTo="889db852-2751-425f-ab8c-989ff878acf8" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="Out" id="75895019-b7a1-45c4-8550-8f01bc3a6f2a"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" name="HDPE" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98394185630461" lon="4.385218620300294"/>
          <point xsi:type="esdl:Point" lat="51.98346609935764" lon="4.387922286987306"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.16030000000000003" length="1000.0" id="e53abd80-80fa-416e-9950-94e149bcab8d" outerDiameter="0.25" name="Pipe_e53a">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="In" connectedTo="1a4a112f-dd25-4438-9741-9cdd34c23e73" id="99c1b5b6-f5e5-47dc-a0a8-a4b6ab877a4b"/>
        <port xsi:type="esdl:OutPort" connectedTo="efad2169-5f95-4618-98ce-e89860e2897b" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="Out" id="a7c97b65-6bdd-4a00-b9b7-6c8d214053bd"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" name="HDPE" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.984034364013006" lon="4.384467601776124"/>
          <point xsi:type="esdl:Point" lat="51.98350574596288" lon="4.383544921875001"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Joint" id="f1a51444-41aa-4b92-a3f5-05ba2d4de379" name="Joint_f1a5">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="In" connectedTo="beb9f479-61b9-48d2-a492-850dedc2826e" id="4dc27c51-a337-402a-9fdb-376aa78b98bf"/>
        <port xsi:type="esdl:OutPort" connectedTo="750c4c71-06a5-4137-a540-ac49fd5c8e24 bff4b9c4-d3fc-475f-b57a-15006f7e2841 2a5d7b97-a173-4fcf-a317-669761abecde 99c1b5b6-f5e5-47dc-a0a8-a4b6ab877a4b" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="Out" id="1a4a112f-dd25-4438-9741-9cdd34c23e73"/>
        <geometry xsi:type="esdl:Point" lat="51.9843184936371" lon="4.384735822677613" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="59de9666-e9f5-4526-a1eb-910f050d3056" name="Joint_f1a5_ret">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="In" connectedTo="2616e85e-2b1a-4ddc-8724-fc7de9173c02 e26af727-64fb-4b86-8b5e-00700334a2a1 613a36f5-a31f-498a-a33d-bfe3c9132ae3 5b87fbb9-44a9-41e1-9088-19561c4c5836" id="c43e1fb4-83c1-4830-afef-828db81160a7"/>
        <port xsi:type="esdl:OutPort" connectedTo="b1476c2d-cb2c-4efe-b854-7435ee1789e8" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="Out" id="06a60970-d7d0-4e0f-827c-b3accf4048ae"/>
        <geometry xsi:type="esdl:Point" lat="51.98410374466893" lon="4.384773373603822" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="a3b88fb6-b4a7-4986-8233-32ca05a5df9f" minTemperature="70.0" power="1000000.0" name="HeatingDemand_a3b8">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="In" connectedTo="0f61b1e9-cf22-403c-8788-a0b00963dc5f" id="18b90d93-5005-45d0-b558-ece8994d39ae">
          <profile xsi:type="esdl:SingleValue" id="5317d120-2e6e-415d-a3bc-bdd6268997d3" value="0.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" connectedTo="5b25d760-cdb5-460e-bde2-283058a4b124" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="out" id="31ec92fd-18c8-4788-9d6d-b96fab55e6e5"/>
        <KPIs xsi:type="esdl:KPIs" id="da2ac53f-3c9c-46a8-a57c-dddb2d93d5a0"/>
        <geometry xsi:type="esdl:Point" lat="51.98544177915329" lon="4.387986660003663" CRS="WGS84"/>
        <costInformation xsi:type="esdl:CostInformation" id="a668decd-5b98-497b-84c7-b4d11f32648c">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="bc6341c5-c510-43be-8cfc-3cfaa7a2e621" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="9feaf430-fc73-419c-af6d-c3128091f3aa" unit="EURO" description="COST in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="f6c38846-7906-4749-a844-b10ad5556aef" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="cbcbe35a-719d-4cd7-870a-0c2edaca3683" unit="EURO" description="COST in EUR/kW" perMultiplier="KILO" physicalQuantity="COST"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="1c42a11a-0765-4a57-b03a-d65bb5bda7b2" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="7eafb8a5-c594-447f-b9a2-787d9159b999" physicalQuantity="COST" description="COST in EUR/EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="d1217097-9b71-4af9-8d14-df08d3ed1edb" minTemperature="70.0" power="1000000.0" name="HeatingDemand_d121">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="In" connectedTo="618a8f33-60c9-4265-83e2-13916fc28e75" id="f5eb43f1-fb71-4d82-97cc-3fb0eb2c209d">
          <profile xsi:type="esdl:SingleValue" id="5317d120-2e6e-415d-a3bc-bdd6268997d3" value="0.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" connectedTo="505a5bf8-8bb4-4615-9274-fb12a8209ff6" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="out" id="8480259e-a24f-406b-a14c-38aac26c6127"/>
        <geometry xsi:type="esdl:Point" lat="51.98435813948783" lon="4.3883728981018075" CRS="WGS84"/>
        <costInformation xsi:type="esdl:CostInformation" id="a668decd-5b98-497b-84c7-b4d11f32648c">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="bc6341c5-c510-43be-8cfc-3cfaa7a2e621" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATTHOUR" id="9feaf430-fc73-419c-af6d-c3128091f3aa" unit="EURO" description="COST in EUR/MWh" perMultiplier="MEGA" physicalQuantity="COST"/>
          </variableOperationalCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="f6c38846-7906-4749-a844-b10ad5556aef" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" perUnit="WATT" id="cbcbe35a-719d-4cd7-870a-0c2edaca3683" unit="EURO" description="COST in EUR/kW" perMultiplier="KILO" physicalQuantity="COST"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="1c42a11a-0765-4a57-b03a-d65bb5bda7b2" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="7eafb8a5-c594-447f-b9a2-787d9159b999" physicalQuantity="COST" description="COST in EUR/EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="208d2055-e5cd-4382-a561-19ddedec4428" minTemperature="70.0" power="1000000.0" name="HeatingDemand_208d">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="In" connectedTo="75895019-b7a1-45c4-8550-8f01bc3a6f2a" id="889db852-2751-425f-ab8c-989ff878acf8">
          <profile xsi:type="esdl:SingleValue" id="5317d120-2e6e-415d-a3bc-bdd6268997d3" value="0.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" connectedTo="fc0a7022-4c09-4f5a-8215-aefc9f11d75c" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="out" id="1fe139dc-c68d-4ea5-948f-ee0c5df13d1b"/>
        <geometry xsi:type="esdl:Point" lat="51.983472707127596" lon="4.388158321380616" CRS="WGS84"/>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.16030000000000003" length="1000.0" id="a0c9270c-d9d0-4cd8-9a1b-17567ef62316" outerDiameter="0.25" name="Pipe_a0c9">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="In" connectedTo="f31879b6-efa1-4b2c-8740-80bebb9500a7" id="7cec87b6-9928-4cfb-9b7b-fe7b51908911"/>
        <port xsi:type="esdl:OutPort" connectedTo="4dc27c51-a337-402a-9fdb-376aa78b98bf" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f" name="Out" id="beb9f479-61b9-48d2-a492-850dedc2826e"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" name="HDPE" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98474138090263" lon="4.382675886154176"/>
          <point xsi:type="esdl:Point" lat="51.9842920630504" lon="4.384349584579469"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.16030000000000003" length="1000.0" id="450923c5-762d-4166-82db-424c282e0a71" outerDiameter="0.25" name="Pipe_a0c9_ret">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="In" connectedTo="06a60970-d7d0-4e0f-827c-b3accf4048ae" id="b1476c2d-cb2c-4efe-b854-7435ee1789e8"/>
        <port xsi:type="esdl:OutPort" connectedTo="02be741c-673b-4c30-8bad-dee320e26924" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="Out" id="53542379-cead-4b7c-97f5-891e1985a8cc"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" name="HDPE" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.9842720630504" lon="4.3843295845794685"/>
          <point xsi:type="esdl:Point" lat="51.984721380902634" lon="4.382655886154176"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.16030000000000003" length="1000.0" id="03bc68c6-cead-40bc-93e2-70838ea463e9" outerDiameter="0.25" name="Pipe_e53a_ret">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="In" connectedTo="db555a41-d15b-44fb-b994-f5004eb3bc85" id="776e5a76-57a5-4c03-b361-409ccb548b88"/>
        <port xsi:type="esdl:OutPort" connectedTo="c43e1fb4-83c1-4830-afef-828db81160a7" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="Out" id="2616e85e-2b1a-4ddc-8724-fc7de9173c02"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" name="HDPE" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98348574596288" lon="4.383524921875001"/>
          <point xsi:type="esdl:Point" lat="51.98401436401301" lon="4.384447601776124"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.16030000000000003" length="1000.0" id="9d0308e0-00ed-458a-a2bd-d18cbdd60184" outerDiameter="0.25" name="Pipe_7fab_ret">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="In" connectedTo="1fe139dc-c68d-4ea5-948f-ee0c5df13d1b" id="fc0a7022-4c09-4f5a-8215-aefc9f11d75c"/>
        <port xsi:type="esdl:OutPort" connectedTo="c43e1fb4-83c1-4830-afef-828db81160a7" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="Out" id="e26af727-64fb-4b86-8b5e-00700334a2a1"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" name="HDPE" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98344609935764" lon="4.3879022869873054"/>
          <point xsi:type="esdl:Point" lat="51.98392185630461" lon="4.385198620300294"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.16030000000000003" length="1000.0" id="aee94265-d252-4f7f-bf61-9afdd1c2bc3c" outerDiameter="0.25" name="Pipe_2e42_ret">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="In" connectedTo="8480259e-a24f-406b-a14c-38aac26c6127" id="505a5bf8-8bb4-4615-9274-fb12a8209ff6"/>
        <port xsi:type="esdl:OutPort" connectedTo="c43e1fb4-83c1-4830-afef-828db81160a7" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="Out" id="613a36f5-a31f-498a-a33d-bfe3c9132ae3"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" name="HDPE" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.98427867069855" lon="4.388052490692139"/>
          <point xsi:type="esdl:Point" lat="51.984146517550755" lon="4.385262993316651"/>
        </geometry>
      </asset>
      <asset xsi:type="esdl:Pipe" innerDiameter="0.16030000000000003" length="1000.0" id="acd16776-5e03-46d5-adc3-6c1f280027bc" outerDiameter="0.25" name="Pipe_de73_ret">
        <port xsi:type="esdl:InPort" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="In" connectedTo="31ec92fd-18c8-4788-9d6d-b96fab55e6e5" id="5b25d760-cdb5-460e-bde2-283058a4b124"/>
        <port xsi:type="esdl:OutPort" connectedTo="c43e1fb4-83c1-4830-afef-828db81160a7" carrier="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" name="Out" id="5b87fbb9-44a9-41e1-9088-19561c4c5836"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" name="steel" id="c4af6ec7-a8da-4412-b4c4-62d3b5c8ecb8" thermalConductivity="0.00014862917548188605"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" name="PUR" id="b74a8c0f-9c8a-4a02-8055-c77943b414c1" thermalConductivity="2.1603217928675567"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036000000000000003">
            <matter xsi:type="esdl:Material" name="HDPE" id="aff626e3-66f1-470f-a86d-f1f6adb336cb" thermalConductivity="0.011627406024262562"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.9853094518694" lon="4.387730625610352"/>
          <point xsi:type="esdl:Point" lat="51.98441082345643" lon="4.3851557049560554"/>
        </geometry>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="6a1c2e35-b383-4816-af26-14deb41e6d1d">
    <carriers xsi:type="esdl:Carriers" id="3a4f662c-eb5e-4e08-8e02-bbf2607faf1c">
      <carrier xsi:type="esdl:HeatCommodity" name="Heat_ret" id="419b5016-12c9-475a-b46e-9e474b60aa8f_ret" returnTemperature="40.0"/>
      <carrier xsi:type="esdl:HeatCommodity" name="Heat" id="419b5016-12c9-475a-b46e-9e474b60aa8f" supplyTemperature="80.0"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="c7104449-b5eb-49c7-b064-a2a4b16ae6e4">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" multiplier="MEGA" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" unit="WATT" description="Power in MW" physicalQuantity="POWER"/>
    </quantityAndUnits>
  </energySystemInformation>
</esdl:EnergySystem>
