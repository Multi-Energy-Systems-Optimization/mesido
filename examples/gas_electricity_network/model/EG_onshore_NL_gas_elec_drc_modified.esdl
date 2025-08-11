<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2111" version="60" name="EG_onshore_NL_gas_elec_drc_modified_efvc_" id="f8f47243-f20d-43a0-8646-5ea02212c0ac" description="TenneT high electricity grid">
  <instance xsi:type="esdl:Instance" id="5e55167c-094a-49aa-b708-499689511e7b" name="Untitled instance">
    <area xsi:type="esdl:Area" id="23ae3043-b224-4644-a5ff-475ad9efe784" name="Netherlands">
      <asset xsi:type="esdl:ElectricityCable" length="107182.1" id="93339914-c7bf-4793-b89a-69fa820747d6" name="ElectricityCable_9333" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="3fbcf75f-57b6-41f6-9783-417650baea76" name="In" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="7cb7d383-a76b-4e34-a7d2-2ab2c151a767"/>
        <port xsi:type="esdl:OutPort" id="8b186a97-c982-4bba-b4ac-d35f4be45b91" name="Out" connectedTo="f210fadf-6a24-4b28-a7ee-f57d5e48b9a1" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.12143547143276" lon="6.952114105224609"/>
          <point xsi:type="esdl:Point" lat="53.118048634476786" lon="6.955633163452149"/>
          <point xsi:type="esdl:Point" lat="53.09430753314901" lon="6.955783367156983"/>
          <point xsi:type="esdl:Point" lat="53.07953841662153" lon="6.9405484199523935"/>
          <point xsi:type="esdl:Point" lat="53.05860037713854" lon="6.940183639526367"/>
          <point xsi:type="esdl:Point" lat="53.02090173844018" lon="6.971254348754884"/>
          <point xsi:type="esdl:Point" lat="52.98659341814081" lon="6.993527412414552"/>
          <point xsi:type="esdl:Point" lat="52.96296074120645" lon="7.012774944305421"/>
          <point xsi:type="esdl:Point" lat="52.935034536923375" lon="7.036163806915284"/>
          <point xsi:type="esdl:Point" lat="52.92348385188595" lon="7.041141986846925"/>
          <point xsi:type="esdl:Point" lat="52.90289710968094" lon="7.031936645507813"/>
          <point xsi:type="esdl:Point" lat="52.87884313375296" lon="7.009620666503907"/>
          <point xsi:type="esdl:Point" lat="52.87159066295942" lon="7.0168519020080575"/>
          <point xsi:type="esdl:Point" lat="52.84000237891732" lon="7.00181007385254"/>
          <point xsi:type="esdl:Point" lat="52.80955845622319" lon="6.917781829833985"/>
          <point xsi:type="esdl:Point" lat="52.80312464294532" lon="6.856069564819337"/>
          <point xsi:type="esdl:Point" lat="52.79528863312749" lon="6.850061416625977"/>
          <point xsi:type="esdl:Point" lat="52.732809584160435" lon="6.837444305419923"/>
          <point xsi:type="esdl:Point" lat="52.72277758404731" lon="6.810579299926759"/>
          <point xsi:type="esdl:Point" lat="52.730782578502506" lon="6.760282516479493"/>
          <point xsi:type="esdl:Point" lat="52.72989898243994" lon="6.742172241210938"/>
          <point xsi:type="esdl:Point" lat="52.70026215928561" lon="6.6907596588134775"/>
          <point xsi:type="esdl:Point" lat="52.68652880776236" lon="6.627759933471681"/>
          <point xsi:type="esdl:Point" lat="52.67128181009286" lon="6.617116928100587"/>
          <point xsi:type="esdl:Point" lat="52.66415084175691" lon="6.555061340332032"/>
          <point xsi:type="esdl:Point" lat="52.64962505261271" lon="6.526393890380859"/>
          <point xsi:type="esdl:Point" lat="52.602891149870295" lon="6.531350612640382"/>
          <point xsi:type="esdl:Point" lat="52.584642533817274" lon="6.486825942993164"/>
          <point xsi:type="esdl:Point" lat="52.580053114607566" lon="6.42528533935547"/>
          <point xsi:type="esdl:Point" lat="52.57139449292074" lon="6.3784217834472665"/>
          <point xsi:type="esdl:Point" lat="52.56669934459808" lon="6.366770267486573"/>
          <point xsi:type="esdl:Point" lat="52.54864442653698" lon="6.290788650512696"/>
          <point xsi:type="esdl:Point" lat="52.53166876943238" lon="6.197828650474549"/>
          <point xsi:type="esdl:Point" lat="52.529994665670216" lon="6.192147731781007"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="27390c55-fc04-4300-bde3-194dcefe3251">
          <investmentCosts xsi:type="esdl:SingleValue" id="197dd585-0de0-4cde-b071-d6704400077b" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="30f40f5d-59f4-4c63-8db9-180816f293cf" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="31422.3" id="12fcc8a7-c6e8-49e9-807b-ce05e1627271" name="ElectricityCable_12fc" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="67188869-75ed-4a7c-973e-33ac65f22211" name="In" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="699f65ee-277a-437d-905f-057d67a6b44d"/>
        <port xsi:type="esdl:OutPort" id="2ab366b2-d661-46c0-8965-5b52a73530fc" name="Out" connectedTo="08195e83-b116-4792-adec-17d707323688" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.52965526843317" lon="6.187362670898438"/>
          <point xsi:type="esdl:Point" lat="52.53295775320848" lon="6.182062625885011"/>
          <point xsi:type="esdl:Point" lat="52.54488966209727" lon="6.1590707302093515"/>
          <point xsi:type="esdl:Point" lat="52.570846751517564" lon="6.138031482696533"/>
          <point xsi:type="esdl:Point" lat="52.57392444775875" lon="6.102347373962402"/>
          <point xsi:type="esdl:Point" lat="52.55644652385667" lon="6.03801727294922"/>
          <point xsi:type="esdl:Point" lat="52.55675962255434" lon="6.028618812561036"/>
          <point xsi:type="esdl:Point" lat="52.57079458531282" lon="5.990896224975586"/>
          <point xsi:type="esdl:Point" lat="52.58890556943298" lon="5.977292060852052"/>
          <point xsi:type="esdl:Point" lat="52.59043077502958" lon="5.972442626953125"/>
          <point xsi:type="esdl:Point" lat="52.58618744325449" lon="5.949638485908509"/>
          <point xsi:type="esdl:Point" lat="52.6016009617359" lon="5.908091068267823"/>
          <point xsi:type="esdl:Point" lat="52.61156960960664" lon="5.881397724151612"/>
          <point xsi:type="esdl:Point" lat="52.6205980731236" lon="5.861077308654785"/>
          <point xsi:type="esdl:Point" lat="52.615569461681396" lon="5.8411431312561035"/>
          <point xsi:type="esdl:Point" lat="52.61559551815169" lon="5.816831588745118"/>
          <point xsi:type="esdl:Point" lat="52.61566717336494" lon="5.810517668724061"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="23dded37-60a9-4b51-9348-4d5a64fb3a27">
          <investmentCosts xsi:type="esdl:SingleValue" id="83aa4304-5cd6-4436-b26d-8a688380251f" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="6e6c1125-3a9b-4867-a6c7-f5687abb945a" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="e7759b40-fada-458d-a01c-06a7619559dc" name="Bus_e775" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" name="In" id="27852c31-da2e-4fbe-ae3e-23a6c1c5051a" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="8b329734-4712-4ac0-a97e-8647072e61fd"/>
        <port xsi:type="esdl:OutPort" id="7cb7d383-a76b-4e34-a7d2-2ab2c151a767" name="Out" connectedTo="3fbcf75f-57b6-41f6-9783-417650baea76" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="53.122259021894635" lon="6.946964352081531"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="f671f0a9-8272-462f-87c9-6ac01d27a61b" name="Bus_f671" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="f210fadf-6a24-4b28-a7ee-f57d5e48b9a1" name="In" connectedTo="8b186a97-c982-4bba-b4ac-d35f4be45b91" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="699f65ee-277a-437d-905f-057d67a6b44d" name="Out" connectedTo="67188869-75ed-4a7c-973e-33ac65f22211 334fce00-67ca-4be6-bce1-98c4e27a99d9" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.53141803427195" lon="6.189336804786079"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="3dc33ad6-e3f2-4d9f-bb44-6981ac23f092" name="Bus_3dc3" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="08195e83-b116-4792-adec-17d707323688" name="In" connectedTo="2ab366b2-d661-46c0-8965-5b52a73530fc" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="7340334b-101d-4e48-9d63-c39ddfbfd472" name="Out" connectedTo="c43e8bad-6534-4a5e-8d0c-7da57737edb3" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.61631532201138" lon="5.808323621749879"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="19827.3" id="94e827e3-e410-4877-92c9-564613bb7bec" name="ElectricityCable_94e8" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="c43e8bad-6534-4a5e-8d0c-7da57737edb3" name="In" connectedTo="7340334b-101d-4e48-9d63-c39ddfbfd472" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="01ca0526-44c1-413e-b7eb-bfe52b654eb5" name="Out" connectedTo="1d08e006-6199-4ba6-90a2-e60d46946d7e" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.61703511403672" lon="5.8062851428985605"/>
          <point xsi:type="esdl:Point" lat="52.614761703411375" lon="5.798270702362061"/>
          <point xsi:type="esdl:Point" lat="52.6149571301659" lon="5.73439121246338"/>
          <point xsi:type="esdl:Point" lat="52.61959500245339" lon="5.727095603942871"/>
          <point xsi:type="esdl:Point" lat="52.619725272670294" lon="5.675296783447266"/>
          <point xsi:type="esdl:Point" lat="52.59431524693743" lon="5.6283044815063485"/>
          <point xsi:type="esdl:Point" lat="52.5858419619051" lon="5.577149391174316"/>
          <point xsi:type="esdl:Point" lat="52.57476556020428" lon="5.544576644897462"/>
          <point xsi:type="esdl:Point" lat="52.57654553566356" lon="5.540220737457275"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="3032d11c-b2ba-4d71-9657-ab9120e0cd84">
          <investmentCosts xsi:type="esdl:SingleValue" id="312bdaac-6a19-4fe6-8e72-0f8ea1d178c3" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="70e877cc-7bdb-466e-9c40-c12d4088a15f" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="22036194-8fa4-4db0-add7-bbcc1f518d58" name="Bus_2203" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="1d08e006-6199-4ba6-90a2-e60d46946d7e" name="In" connectedTo="01ca0526-44c1-413e-b7eb-bfe52b654eb5 f15357d8-c63d-4840-9ed1-a1ddc5d2acae" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="1bccc857-8379-496c-8a71-9310dfd5724e" name="Out" connectedTo="cc10d512-a1f7-4977-bb6d-5d17fc2943bb" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.576669414049846" CRS="WGS84" lon="5.538750886917115"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="51380.2" id="cd24b8b5-1e51-43f4-9021-ee91c5d8cae5" name="ElectricityCable_cd24" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="cc10d512-a1f7-4977-bb6d-5d17fc2943bb" name="In" connectedTo="1bccc857-8379-496c-8a71-9310dfd5724e" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="1110a392-8157-4978-8718-8c467ef588dd" name="Out" connectedTo="366a15c7-43af-4c45-add3-79ddf58562d1" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.575847898215336" lon="5.539458990097046"/>
          <point xsi:type="esdl:Point" lat="52.57233346226599" lon="5.5409181118011475"/>
          <point xsi:type="esdl:Point" lat="52.57172052622203" lon="5.540639162063599"/>
          <point xsi:type="esdl:Point" lat="52.57022727382916" lon="5.5384182929992685"/>
          <point xsi:type="esdl:Point" lat="52.54929682895678" lon="5.54560661315918"/>
          <point xsi:type="esdl:Point" lat="52.51452331933269" lon="5.548524856567384"/>
          <point xsi:type="esdl:Point" lat="52.49704785672787" lon="5.530886650085449"/>
          <point xsi:type="esdl:Point" lat="52.49665595057367" lon="5.525994300842286"/>
          <point xsi:type="esdl:Point" lat="52.44905258694054" lon="5.44072151184082"/>
          <point xsi:type="esdl:Point" lat="52.43524033337096" lon="5.4193925857543945"/>
          <point xsi:type="esdl:Point" lat="52.40469674958997" lon="5.348582267761231"/>
          <point xsi:type="esdl:Point" lat="52.34399835168284" lon="5.16810178756714"/>
          <point xsi:type="esdl:Point" lat="52.31968120273674" lon="5.119843482971192"/>
          <point xsi:type="esdl:Point" lat="52.317372706455025" lon="5.101218223571778"/>
          <point xsi:type="esdl:Point" lat="52.32191744367382" lon="5.085554122924806"/>
          <point xsi:type="esdl:Point" lat="52.32345848235523" lon="5.0820350646972665"/>
          <point xsi:type="esdl:Point" lat="52.32225188641575" lon="5.077700614929199"/>
          <point xsi:type="esdl:Point" lat="52.32395684933692" lon="5.067862272262574"/>
          <point xsi:type="esdl:Point" lat="52.33034331870424" lon="5.0478529930114755"/>
          <point xsi:type="esdl:Point" lat="52.33302483643123" lon="5.040417909622193"/>
          <point xsi:type="esdl:Point" lat="52.33299205602242" lon="5.0290024280548105"/>
          <point xsi:type="esdl:Point" lat="52.33516206665517" lon="5.024785995483399"/>
          <point xsi:type="esdl:Point" lat="52.33573241431808" lon="5.020451545715333"/>
          <point xsi:type="esdl:Point" lat="52.33443437102728" lon="5.017350912094116"/>
          <point xsi:type="esdl:Point" lat="52.3349063911773" lon="5.015366077423096"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="1b84ed43-909c-4e1d-a61e-899dc6063179">
          <investmentCosts xsi:type="esdl:SingleValue" id="f3fa06ec-5ad0-474b-9914-1b2943ef90a6" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="301b7db0-073e-4832-88a9-900b8371d76b" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="15211.6" id="056a02e6-6b11-44d7-832e-f7e9862a56b2" name="ElectricityCable_056a" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="716674e2-8f43-410c-ac19-279b3b8292c2" name="In" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="8b916d9a-a54a-49f1-a9bc-2343801d8907"/>
        <port xsi:type="esdl:OutPort" id="c8aeb7e1-29cc-4005-8234-b6582333e883" name="Out" connectedTo="3d8cd093-93fb-4b4a-8455-265cc3932bd8" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.337522078198184" lon="5.011460781097412"/>
          <point xsi:type="esdl:Point" lat="52.33915434583768" lon="5.010409355163575"/>
          <point xsi:type="esdl:Point" lat="52.35230206330621" lon="4.985518455505372"/>
          <point xsi:type="esdl:Point" lat="52.377298808469114" lon="4.982179105281831"/>
          <point xsi:type="esdl:Point" lat="52.38417198934899" lon="4.982428550720216"/>
          <point xsi:type="esdl:Point" lat="52.3963570573787" lon="4.972504377365113"/>
          <point xsi:type="esdl:Point" lat="52.40448074919108" lon="4.966506958007813"/>
          <point xsi:type="esdl:Point" lat="52.424050672841105" lon="4.912379980087281"/>
          <point xsi:type="esdl:Point" lat="52.42512691390416" lon="4.907530546188355"/>
          <point xsi:type="esdl:Point" lat="52.4257942355915" lon="4.902091026306153"/>
          <point xsi:type="esdl:Point" lat="52.4287250975002" lon="4.893078804016114"/>
          <point xsi:type="esdl:Point" lat="52.42888210246025" lon="4.877768754959107"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="e7a8f296-2713-425d-8a4c-6f0a51ba215e">
          <investmentCosts xsi:type="esdl:SingleValue" id="2732f14f-28ae-4810-860b-51b0aa1b74d9" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="bf618453-2637-4351-b144-3bd041f1974e" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="924737c1-449f-42f4-ab9a-f1bef07fe5b8" name="Bus_9247" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="3d8cd093-93fb-4b4a-8455-265cc3932bd8" name="In" connectedTo="c8aeb7e1-29cc-4005-8234-b6582333e883" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="0d6b3844-1f5e-4393-830b-fb8f75e4ccae" name="Out" connectedTo="b70541c5-80cf-4df7-b665-46a990ab3941" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.428888644321425" CRS="WGS84" lon="4.876234531402588"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="5bccff2e-db8a-438f-a4ed-e263aaa9545a" name="Bus_5bcc" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="366a15c7-43af-4c45-add3-79ddf58562d1" name="In" connectedTo="1110a392-8157-4978-8718-8c467ef588dd 542e2a61-fd5b-48ba-abd3-162d31768449 8be7b159-4d61-43a2-928d-5ea260d390e8" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="8b916d9a-a54a-49f1-a9bc-2343801d8907" name="Out" connectedTo="716674e2-8f43-410c-ac19-279b3b8292c2" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.33687308757833" CRS="WGS84" lon="5.014346837997437"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="15840.2" id="5ae3c407-8c4e-405b-9dff-35303f8cadf6" name="ElectricityCable_5ae3" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="b70541c5-80cf-4df7-b665-46a990ab3941" name="In" connectedTo="0d6b3844-1f5e-4393-830b-fb8f75e4ccae" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="066ff12b-549e-44d4-ab3d-e3a866dc2ca8" name="Out" connectedTo="0c85933d-b982-4ea0-afea-312941724388" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.42956245082466" lon="4.873192906379701"/>
          <point xsi:type="esdl:Point" lat="52.432787420865296" lon="4.868482947349549"/>
          <point xsi:type="esdl:Point" lat="52.45753921941149" lon="4.843039512634277"/>
          <point xsi:type="esdl:Point" lat="52.45863752380283" lon="4.837803840637207"/>
          <point xsi:type="esdl:Point" lat="52.4577876478023" lon="4.832310676574708"/>
          <point xsi:type="esdl:Point" lat="52.45781052929411" lon="4.818491935729981"/>
          <point xsi:type="esdl:Point" lat="52.45604861963214" lon="4.813942909240723"/>
          <point xsi:type="esdl:Point" lat="52.452900542451985" lon="4.8075270652771005"/>
          <point xsi:type="esdl:Point" lat="52.45254420385796" lon="4.804029464721681"/>
          <point xsi:type="esdl:Point" lat="52.44630617691003" lon="4.760770797729492"/>
          <point xsi:type="esdl:Point" lat="52.44813713595707" lon="4.750406742095948"/>
          <point xsi:type="esdl:Point" lat="52.459722726233466" lon="4.721996784210206"/>
          <point xsi:type="esdl:Point" lat="52.473308373359686" lon="4.680476188659669"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="96176591-18e7-426d-97d3-a2c07ca2a7ee">
          <investmentCosts xsi:type="esdl:SingleValue" id="8d1fdb02-6483-4bd9-9f58-297433f9202e" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="97074a59-568d-4e7e-9c0b-9879a38c5ca6" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="1684f1a1-6f7e-4713-bd7d-63bda528d7ad" name="Bus_1684" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="0c85933d-b982-4ea0-afea-312941724388" name="In" connectedTo="066ff12b-549e-44d4-ab3d-e3a866dc2ca8 499b288a-4ded-46fd-af42-833317b80a84" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="c9391ab3-32b5-4700-bf66-9c77feb9a9e9" name="Out" connectedTo="e77175ea-04cb-4bd7-bf3e-886a894a0679 dfee21ff-6b6e-4548-b019-ea6e9e0051a2" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.4729816088404" CRS="WGS84" lon="4.67919409275055"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="12076.7" id="bda80a97-d49d-44b5-b616-3793b798e99e" name="ElectricityCable_bda8" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="e77175ea-04cb-4bd7-bf3e-886a894a0679" name="In" connectedTo="c9391ab3-32b5-4700-bf66-9c77feb9a9e9" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="a640d42b-d308-4b31-ad0d-45a9323552a1" name="Out" connectedTo="e83635df-c2bb-456c-b4f8-5115fe46d0d5" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.472112403408346" lon="4.680006802082063"/>
          <point xsi:type="esdl:Point" lat="52.466311814869925" lon="4.679242372512818"/>
          <point xsi:type="esdl:Point" lat="52.460118230107355" lon="4.674803316593171"/>
          <point xsi:type="esdl:Point" lat="52.45213882433703" lon="4.670562744140626"/>
          <point xsi:type="esdl:Point" lat="52.449340296177205" lon="4.668502807617188"/>
          <point xsi:type="esdl:Point" lat="52.44580918917912" lon="4.6678268909454355"/>
          <point xsi:type="esdl:Point" lat="52.420245999148456" lon="4.707864224910737"/>
          <point xsi:type="esdl:Point" lat="52.40599927503221" lon="4.705098867416383"/>
          <point xsi:type="esdl:Point" lat="52.40326981828095" lon="4.7049808502197275"/>
          <point xsi:type="esdl:Point" lat="52.40114242673826" lon="4.704068899154664"/>
          <point xsi:type="esdl:Point" lat="52.38800924088981" lon="4.7014081478118905"/>
          <point xsi:type="esdl:Point" lat="52.385913854765974" lon="4.700292348861695"/>
          <point xsi:type="esdl:Point" lat="52.37706957485441" lon="4.698377251625062"/>
          <point xsi:type="esdl:Point" lat="52.37544198197317" lon="4.696357548236848"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="16c43ade-8e67-4d4b-8eaf-fcdacdbf9aca">
          <investmentCosts xsi:type="esdl:SingleValue" id="d39496b2-004c-4afe-a0aa-573d6de4d7ec" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="7d47e126-b602-4ce6-9b42-e97d4c9a3687" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="367c73c1-b581-4784-87d3-57fd56ae58fa" name="Bus_367c" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="e83635df-c2bb-456c-b4f8-5115fe46d0d5" name="In" connectedTo="a640d42b-d308-4b31-ad0d-45a9323552a1" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="22588ae7-4740-4f0f-a71a-bdb88f39b1ad" name="Out" connectedTo="43d5e37f-fd36-422f-a4b3-a88c5ce9a9dd" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.373955154561386" CRS="WGS84" lon="4.694874286651612"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="45337.9" id="fc371a41-2756-4071-a1b4-0a1be62849b9" name="ElectricityCable_fc37" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="43d5e37f-fd36-422f-a4b3-a88c5ce9a9dd" name="In" connectedTo="22588ae7-4740-4f0f-a71a-bdb88f39b1ad" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="6cb3b70d-9b19-4292-9364-2fc062516503" name="Out" connectedTo="45025e3c-e3f1-4c3d-a1ad-5de1d1bfde03" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.37330669873697" lon="4.6947669982910165"/>
          <point xsi:type="esdl:Point" lat="52.34965448249402" lon="4.693500995635987"/>
          <point xsi:type="esdl:Point" lat="52.332179094111815" lon="4.667387008666993"/>
          <point xsi:type="esdl:Point" lat="52.329412289201926" lon="4.655649662017823"/>
          <point xsi:type="esdl:Point" lat="52.30502807800319" lon="4.62002992630005"/>
          <point xsi:type="esdl:Point" lat="52.30278442305158" lon="4.617390632629395"/>
          <point xsi:type="esdl:Point" lat="52.295724696898404" lon="4.619793891906739"/>
          <point xsi:type="esdl:Point" lat="52.274459988242945" lon="4.5896244049072275"/>
          <point xsi:type="esdl:Point" lat="52.26521584701145" lon="4.591169357299806"/>
          <point xsi:type="esdl:Point" lat="52.24703708564381" lon="4.625415802001954"/>
          <point xsi:type="esdl:Point" lat="52.244041603746204" lon="4.626359939575196"/>
          <point xsi:type="esdl:Point" lat="52.22643249143796" lon="4.6013832092285165"/>
          <point xsi:type="esdl:Point" lat="52.21276090242591" lon="4.604988098144532"/>
          <point xsi:type="esdl:Point" lat="52.19132484784276" lon="4.603765010833741"/>
          <point xsi:type="esdl:Point" lat="52.179537188946334" lon="4.584882259368897"/>
          <point xsi:type="esdl:Point" lat="52.16507462138046" lon="4.558875560760499"/>
          <point xsi:type="esdl:Point" lat="52.16208677177077" lon="4.557995796203614"/>
          <point xsi:type="esdl:Point" lat="52.148079375449136" lon="4.574689865112306"/>
          <point xsi:type="esdl:Point" lat="52.12400374445517" lon="4.577693939208985"/>
          <point xsi:type="esdl:Point" lat="52.09226937451609" lon="4.574346542358399"/>
          <point xsi:type="esdl:Point" lat="52.03871259916833" lon="4.550142288208009"/>
          <point xsi:type="esdl:Point" lat="52.03735305735472" lon="4.544885158538819"/>
          <point xsi:type="esdl:Point" lat="52.0373662569886" lon="4.540357589721681"/>
          <point xsi:type="esdl:Point" lat="52.0385542080753" lon="4.533834457397462"/>
          <point xsi:type="esdl:Point" lat="52.03714186268308" lon="4.530036449432374"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="e3b9a6db-dc00-461d-bb48-9b8aac2bba3c">
          <investmentCosts xsi:type="esdl:SingleValue" id="e3227563-ce81-4b02-9581-e169348fef0e" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="ce153399-08bb-40c9-b52e-07127f6e91aa" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="3d2becd6-a7f1-4b56-9fc7-a51c11129105" name="Bus_3d2b" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="45025e3c-e3f1-4c3d-a1ad-5de1d1bfde03" name="In" connectedTo="6cb3b70d-9b19-4292-9364-2fc062516503 2ade8f13-ff2b-4e09-b82b-fb7d0889a56d" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="333c45c4-a0ca-42cf-8657-09df30d8bcbe" name="Out" connectedTo="91d97a7e-0e28-41f5-83b2-c5dd542b8797" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.03654793408148" lon="4.525680662217898"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="21677.5" id="c5627ad7-015d-4046-b8e5-f404ad82ca8b" name="ElectricityCable_c562" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="91d97a7e-0e28-41f5-83b2-c5dd542b8797" name="In" connectedTo="333c45c4-a0ca-42cf-8657-09df30d8bcbe" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="33a8b76a-e9a0-45d0-8181-31414cc21d27" name="Out" connectedTo="8d740e8f-7f4b-4ff8-8696-b67384ae9023" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.03595057405204" lon="4.528411030769349"/>
          <point xsi:type="esdl:Point" lat="52.035181664533184" lon="4.523921012878419"/>
          <point xsi:type="esdl:Point" lat="52.03682506880487" lon="4.512848854064942"/>
          <point xsi:type="esdl:Point" lat="52.031676853640604" lon="4.505832195281983"/>
          <point xsi:type="esdl:Point" lat="52.03169005495035" lon="4.474396705627442"/>
          <point xsi:type="esdl:Point" lat="52.029208140200446" lon="4.470727443695069"/>
          <point xsi:type="esdl:Point" lat="52.02607914711741" lon="4.470233917236329"/>
          <point xsi:type="esdl:Point" lat="52.01970166067582" lon="4.457294940948487"/>
          <point xsi:type="esdl:Point" lat="52.01183087951586" lon="4.457273483276368"/>
          <point xsi:type="esdl:Point" lat="52.00074869153974" lon="4.45673704147339"/>
          <point xsi:type="esdl:Point" lat="51.97430679316347" lon="4.338741302490235"/>
          <point xsi:type="esdl:Point" lat="51.980743615190406" lon="4.3332159519195566"/>
          <point xsi:type="esdl:Point" lat="51.994222257911254" lon="4.319611787796021"/>
          <point xsi:type="esdl:Point" lat="52.0022678664891" lon="4.3129920959472665"/>
          <point xsi:type="esdl:Point" lat="52.010800708372656" lon="4.310631752014161"/>
          <point xsi:type="esdl:Point" lat="52.01575984017608" lon="4.308051466941834"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="885759bf-9e14-42f5-8e99-d260b890b0e4">
          <investmentCosts xsi:type="esdl:SingleValue" id="939b4654-7ae5-4f20-8bd2-d1a0eb8a2265" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="3f9afaee-4015-4b33-937a-5067b18c8b22" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="1f151adb-508b-452d-b7d5-e7d52d7dffe3" name="Bus_1f15" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="8d740e8f-7f4b-4ff8-8696-b67384ae9023" name="In" connectedTo="33a8b76a-e9a0-45d0-8181-31414cc21d27" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="091a720f-ea0e-415d-8e9b-59f6921bc8cb" name="Out" connectedTo="04d86ab0-de7e-4599-b352-566e4d85ac7e" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.020178639032125" lon="4.307498915854669"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="6626.4" id="4b4b5d3c-1155-4f21-874f-72e78ccb4b61" name="ElectricityCable_4b4b" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="04d86ab0-de7e-4599-b352-566e4d85ac7e" name="In" connectedTo="091a720f-ea0e-415d-8e9b-59f6921bc8cb" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="c349bbfc-c927-4a54-b5c4-c4db98556ade" name="Out" connectedTo="5c0259ff-325e-4431-a09d-9c7b82ac4847" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.01615601873992" lon="4.305245876312257"/>
          <point xsi:type="esdl:Point" lat="51.98975625511461" lon="4.247556924819947"/>
          <point xsi:type="esdl:Point" lat="51.98310267050751" lon="4.225112199783326"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="8643ee8d-fe92-4f70-9913-3336a1b14e9f">
          <investmentCosts xsi:type="esdl:SingleValue" id="ed903072-3eb3-4b4f-9840-573de6861775" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="5783831d-9bd8-4696-808a-9232a737f449" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="4b1f78d8-679b-4411-8ebe-09ba51affedd" name="Bus_4b1f" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="5c0259ff-325e-4431-a09d-9c7b82ac4847" name="In" connectedTo="c349bbfc-c927-4a54-b5c4-c4db98556ade" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="95a8d657-b230-42ed-8c10-af2f5ace1737" name="Out" connectedTo="93551f83-7328-4ea8-8ca1-4be346e9d11e" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.984986808884514" lon="4.2225265983832605"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="5177.9" id="b81934e1-f00c-4da1-9a5b-a46fb214ecbb" name="ElectricityCable_b819" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="93551f83-7328-4ea8-8ca1-4be346e9d11e" name="In" connectedTo="95a8d657-b230-42ed-8c10-af2f5ace1737" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="1d4172a3-d830-47fd-982f-8d06162a5016" name="Out" connectedTo="d3292643-8934-4d04-8c42-7e6f63499fa6" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.98206523011252" lon="4.222848415374757"/>
          <point xsi:type="esdl:Point" lat="51.9824881386523" lon="4.2211318016052255"/>
          <point xsi:type="esdl:Point" lat="51.98197932632747" lon="4.217483997344972"/>
          <point xsi:type="esdl:Point" lat="51.97920388463124" lon="4.215842485427857"/>
          <point xsi:type="esdl:Point" lat="51.97605817615839" lon="4.215048551559449"/>
          <point xsi:type="esdl:Point" lat="51.97203319764883" lon="4.205145835876466"/>
          <point xsi:type="esdl:Point" lat="51.96251456880403" lon="4.180212020874024"/>
          <point xsi:type="esdl:Point" lat="51.96323514684915" lon="4.168431758880616"/>
          <point xsi:type="esdl:Point" lat="51.960028816189144" lon="4.1637539863586435"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="3fcb3e4d-4003-49f9-bdf4-78571b4ed103">
          <investmentCosts xsi:type="esdl:SingleValue" id="c3209226-1976-452a-a2e1-11a74356c587" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="44a39f60-ad1b-4a95-ab9d-ae67a32320cb" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="42c2b2d7-8629-4dd0-b4ca-c7821cfd759b" name="Bus_42c2" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="d3292643-8934-4d04-8c42-7e6f63499fa6" name="In" connectedTo="1d4172a3-d830-47fd-982f-8d06162a5016" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="09ee32b5-d569-4aa6-8146-c7b2393b1200" name="Out" connectedTo="5c521fcd-3093-4349-855a-01da6725ad4b" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.95944702439493" CRS="WGS84" lon="4.162702560424806"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="14117.0" id="b09319fe-2eaf-4401-96de-357d999f716b" name="ElectricityCable_b093" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="5c521fcd-3093-4349-855a-01da6725ad4b" name="In" connectedTo="09ee32b5-d569-4aa6-8146-c7b2393b1200" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="48bf5ed0-c957-4952-a3ea-dd177590ecf2" name="Out" connectedTo="4d7cd68e-6ae8-4dbe-822d-ab5b97b7827c" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.95897100731088" lon="4.161972999572755"/>
          <point xsi:type="esdl:Point" lat="51.94590500995263" lon="4.152574539184571"/>
          <point xsi:type="esdl:Point" lat="51.93892081064174" lon="4.152746200561524"/>
          <point xsi:type="esdl:Point" lat="51.93659250254966" lon="4.151973724365235"/>
          <point xsi:type="esdl:Point" lat="51.93471389317559" lon="4.141416549682618"/>
          <point xsi:type="esdl:Point" lat="51.93458159377617" lon="4.137339591979981"/>
          <point xsi:type="esdl:Point" lat="51.93582519273032" lon="4.132962226867677"/>
          <point xsi:type="esdl:Point" lat="51.939899722280366" lon="4.111075401306153"/>
          <point xsi:type="esdl:Point" lat="51.939079554520696" lon="4.105753898620606"/>
          <point xsi:type="esdl:Point" lat="51.93378778918764" lon="4.098973274230958"/>
          <point xsi:type="esdl:Point" lat="51.935639978049274" lon="4.082665443420411"/>
          <point xsi:type="esdl:Point" lat="51.9352430868725" lon="4.069533348083497"/>
          <point xsi:type="esdl:Point" lat="51.92828369114746" lon="4.0394926071167"/>
          <point xsi:type="esdl:Point" lat="51.928654180475206" lon="4.037132263183595"/>
          <point xsi:type="esdl:Point" lat="51.951883043962226" lon="4.0232276916503915"/>
          <point xsi:type="esdl:Point" lat="51.954322963783504" lon="4.023249149322511"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="43976a8b-fcd0-4730-a50f-4dcc57d03e09">
          <investmentCosts xsi:type="esdl:SingleValue" id="ffb5dc64-3e18-4c79-9160-b47c67401500" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="03af564b-0f7e-47a0-9971-89e7e64c802c" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="0247b563-124f-4080-ad10-19e58230a59e" name="Bus_0247" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="4d7cd68e-6ae8-4dbe-822d-ab5b97b7827c" name="In" connectedTo="48bf5ed0-c957-4952-a3ea-dd177590ecf2 c3154a26-f50f-4369-82fc-3f23aa4c66cd bc803b22-4bdd-48ba-90ab-44534a434388" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="f7c6973d-2195-475f-9838-8cfc9e880568" name="Out" connectedTo="3ee8044d-e0ed-4688-aa9f-28e71eeb49a3" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.955374270419746" CRS="WGS84" lon="4.022058248519898"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="23202.4" id="47294d4d-cc11-457a-a8fc-930a35ca2238" name="ElectricityCable_4729" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="3ee8044d-e0ed-4688-aa9f-28e71eeb49a3" name="In" connectedTo="f7c6973d-2195-475f-9838-8cfc9e880568" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="79aa3412-1bf5-4223-af49-61cbe90aaa16" name="Out" connectedTo="2f415f67-e2be-48c6-8ef6-ff5c071efc04" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.954131213374254" lon="4.022369384765626"/>
          <point xsi:type="esdl:Point" lat="51.9515259713887" lon="4.021618366241456"/>
          <point xsi:type="esdl:Point" lat="51.92805874970636" lon="4.0358877182006845"/>
          <point xsi:type="esdl:Point" lat="51.92719866909384" lon="4.038677215576173"/>
          <point xsi:type="esdl:Point" lat="51.93444929398662" lon="4.069747924804688"/>
          <point xsi:type="esdl:Point" lat="51.93488588181172" lon="4.082643985748292"/>
          <point xsi:type="esdl:Point" lat="51.93369517773755" lon="4.0917420387268075"/>
          <point xsi:type="esdl:Point" lat="51.922024605627016" lon="4.103350639343263"/>
          <point xsi:type="esdl:Point" lat="51.913263066774526" lon="4.124507904052735"/>
          <point xsi:type="esdl:Point" lat="51.889934747298135" lon="4.152896404266358"/>
          <point xsi:type="esdl:Point" lat="51.865256042791536" lon="4.193601608276368"/>
          <point xsi:type="esdl:Point" lat="51.84622445736405" lon="4.236774444580079"/>
          <point xsi:type="esdl:Point" lat="51.83947996418363" lon="4.264288544654847"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="4074dacb-8a51-4abb-a68a-67533a3ee67a">
          <investmentCosts xsi:type="esdl:SingleValue" id="c8113004-e7a6-463d-838b-7bcc7d45cf1f" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="4dd44532-6695-48ad-8f21-11b1f8c0bf70" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="8141344a-46d3-42ea-a552-14b2a70e5a0f" name="Bus_8141" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="2f415f67-e2be-48c6-8ef6-ff5c071efc04" name="In" connectedTo="79aa3412-1bf5-4223-af49-61cbe90aaa16" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="2ac72af7-2734-4f07-845a-2457cb5170eb" name="Out" connectedTo="a05d23b4-ad53-481a-96d6-a2722474eb21 8c0c05f7-625c-44e3-900d-43d8e4eb891b" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.839125311764896" CRS="WGS84" lon="4.2654258012771615"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="42278.8" id="12e9853b-b99a-4146-9919-590ecc6f25a8" name="ElectricityCable_12e9" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="a05d23b4-ad53-481a-96d6-a2722474eb21" name="In" connectedTo="2ac72af7-2734-4f07-845a-2457cb5170eb" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="be79c516-1847-4c55-aae0-a414148ae9c8" name="Out" connectedTo="9b247cc4-4693-465b-ac83-6dbec61fdf4c" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.83879717292677" lon="4.2663753032684335"/>
          <point xsi:type="esdl:Point" lat="51.821627867729596" lon="4.318034648895265"/>
          <point xsi:type="esdl:Point" lat="51.82095143749507" lon="4.336102008819581"/>
          <point xsi:type="esdl:Point" lat="51.81303246946138" lon="4.348955154418946"/>
          <point xsi:type="esdl:Point" lat="51.80889335957388" lon="4.388995170593263"/>
          <point xsi:type="esdl:Point" lat="51.800215914906545" lon="4.454998970031739"/>
          <point xsi:type="esdl:Point" lat="51.810538435943336" lon="4.475855827331544"/>
          <point xsi:type="esdl:Point" lat="51.81211712212758" lon="4.507741928100587"/>
          <point xsi:type="esdl:Point" lat="51.80385825678808" lon="4.541961550712586"/>
          <point xsi:type="esdl:Point" lat="51.79052479124055" lon="4.5682740211486825"/>
          <point xsi:type="esdl:Point" lat="51.76397551327779" lon="4.570226669311524"/>
          <point xsi:type="esdl:Point" lat="51.761770945541265" lon="4.572479724884034"/>
          <point xsi:type="esdl:Point" lat="51.75960611464017" lon="4.60279941558838"/>
          <point xsi:type="esdl:Point" lat="51.76853039355072" lon="4.652709960937501"/>
          <point xsi:type="esdl:Point" lat="51.76838432580634" lon="4.68817949295044"/>
          <point xsi:type="esdl:Point" lat="51.77637752019151" lon="4.7342705726623535"/>
          <point xsi:type="esdl:Point" lat="51.7930497933339" lon="4.748218059539796"/>
          <point xsi:type="esdl:Point" lat="51.79473526138659" lon="4.748454093933106"/>
          <point xsi:type="esdl:Point" lat="51.80215322627496" lon="4.737961292266847"/>
          <point xsi:type="esdl:Point" lat="51.81242887294488" lon="4.743733406066895"/>
          <point xsi:type="esdl:Point" lat="51.81296945701616" lon="4.746340513229371"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="0e8851e1-d056-4e4e-b99f-87599adbda63">
          <investmentCosts xsi:type="esdl:SingleValue" id="db4de91c-d29d-44d0-8e7a-b9cd26420126" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="e5a83da7-e5c8-4125-8f35-ea477475a1a3" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="840af453-afbb-4dbb-a413-64a83b4db824" name="Bus_840a" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="9b247cc4-4693-465b-ac83-6dbec61fdf4c" name="In" connectedTo="be79c516-1847-4c55-aae0-a414148ae9c8" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="c93c8a08-841e-4891-8b65-325c18cf59d6" name="Out" connectedTo="6edb2e3f-0881-4f94-abf8-e386898b3b4a" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.81361616467524" lon="4.745986523088091"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="14643.6" id="49496482-c165-4fb6-a0ef-60fec1a86503" name="ElectricityCable_4949" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="6edb2e3f-0881-4f94-abf8-e386898b3b4a" name="In" connectedTo="c93c8a08-841e-4891-8b65-325c18cf59d6" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="0a9cf7ba-2a3b-429a-aea0-51593743922a" name="Out" connectedTo="d1371d0b-005d-4661-8b54-cc1168619101" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.81415009661297" lon="4.745846986770631"/>
          <point xsi:type="esdl:Point" lat="51.815118463304955" lon="4.744763374328614"/>
          <point xsi:type="esdl:Point" lat="51.82795398822651" lon="4.7440552711486825"/>
          <point xsi:type="esdl:Point" lat="51.833881433187486" lon="4.731867313385011"/>
          <point xsi:type="esdl:Point" lat="51.83598966511042" lon="4.723005294799806"/>
          <point xsi:type="esdl:Point" lat="51.860114597454064" lon="4.718027114868165"/>
          <point xsi:type="esdl:Point" lat="51.876332005364304" lon="4.681806564331056"/>
          <point xsi:type="esdl:Point" lat="51.9117143994815" lon="4.6467018127441415"/>
          <point xsi:type="esdl:Point" lat="51.91524845953366" lon="4.638397693634034"/>
          <point xsi:type="esdl:Point" lat="51.91469255840984" lon="4.6343421936035165"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="2fce08bf-a6c7-4f4f-9d54-c7aa1d34f9bd">
          <investmentCosts xsi:type="esdl:SingleValue" id="0414f3ab-2cf8-4bba-be01-1c47294816e9" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="9b9d859d-b48a-4764-bd8d-1743adc2cf1b" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="2c818cbc-899b-4029-b755-67a14881be91" name="Bus_2c81" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="d1371d0b-005d-4661-8b54-cc1168619101" name="In" connectedTo="0a9cf7ba-2a3b-429a-aea0-51593743922a 41dac491-7fbe-416d-a272-7b82a92f036a" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="a1fe66e8-a5e0-4620-b39c-ac3817e919a7" name="Out" connectedTo="79608553-54a3-4882-987c-69c2f5a3a5cf 435ef827-23c6-4fcc-8508-6297484f8170" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.91377907090002" lon="4.622154513694784"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="17226.9" id="dd1015fa-425c-4ad7-8ecb-9d9ef5f16a4c" name="ElectricityCable_dd10" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="79608553-54a3-4882-987c-69c2f5a3a5cf" name="In" connectedTo="a1fe66e8-a5e0-4620-b39c-ac3817e919a7" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="2ade8f13-ff2b-4e09-b82b-fb7d0889a56d" name="Out" connectedTo="45025e3c-e3f1-4c3d-a1ad-5de1d1bfde03" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.91616171072475" lon="4.63150978088379"/>
          <point xsi:type="esdl:Point" lat="51.92125704669307" lon="4.638268947601319"/>
          <point xsi:type="esdl:Point" lat="51.92395667863866" lon="4.637356996536256"/>
          <point xsi:type="esdl:Point" lat="51.94016428932683" lon="4.614472389221192"/>
          <point xsi:type="esdl:Point" lat="51.965899201787714" lon="4.584045410156251"/>
          <point xsi:type="esdl:Point" lat="51.9883159402927" lon="4.586963653564454"/>
          <point xsi:type="esdl:Point" lat="52.005332479896225" lon="4.574561119079591"/>
          <point xsi:type="esdl:Point" lat="52.0297098149284" lon="4.571127891540528"/>
          <point xsi:type="esdl:Point" lat="52.03695046665009" lon="4.542953968048097"/>
          <point xsi:type="esdl:Point" lat="52.035432469091305" lon="4.539080858230592"/>
          <point xsi:type="esdl:Point" lat="52.036957066526945" lon="4.531280994415284"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="2d296ed5-26bd-45c8-8543-07eaafd16019">
          <investmentCosts xsi:type="esdl:SingleValue" id="e2387e06-63e7-4817-ad8a-9640f665708b" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="d91da343-3a38-4f7d-b987-ac8cc0af6f12" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="37182.2" id="1ec60deb-6d1f-4c57-acaa-958e66b44f4d" name="ElectricityCable_1ec6" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="435ef827-23c6-4fcc-8508-6297484f8170" name="In" connectedTo="a1fe66e8-a5e0-4620-b39c-ac3817e919a7" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="14f53077-6eac-402f-b3a4-09b81dd12727" name="Out" connectedTo="fd81cfb1-a18e-4a4a-930b-90d236fef532" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.91582420701366" lon="4.632164239883424"/>
          <point xsi:type="esdl:Point" lat="51.95116889597186" lon="4.686141014099122"/>
          <point xsi:type="esdl:Point" lat="51.97351369155164" lon="4.711289405822755"/>
          <point xsi:type="esdl:Point" lat="52.00369452297293" lon="4.754462242126466"/>
          <point xsi:type="esdl:Point" lat="52.02049394448102" lon="4.801669120788575"/>
          <point xsi:type="esdl:Point" lat="52.04354325791391" lon="4.854884147644043"/>
          <point xsi:type="esdl:Point" lat="52.063441121356036" lon="4.886040687561036"/>
          <point xsi:type="esdl:Point" lat="52.07452096918634" lon="4.9178409576416025"/>
          <point xsi:type="esdl:Point" lat="52.15953312017008" lon="4.985915422439576"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="4c98bb45-a940-4605-aeb6-155f6b1560dd">
          <investmentCosts xsi:type="esdl:SingleValue" id="87e3c441-74be-47a5-bb66-b7862517b528" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="5d16cf46-0d99-40a8-9e60-174fdec33653" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="514c2230-86b8-48c7-88d6-0396c75fc64e" name="Bus_514c" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="fd81cfb1-a18e-4a4a-930b-90d236fef532" name="In" connectedTo="14f53077-6eac-402f-b3a4-09b81dd12727" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="2e4094b8-0fa6-4bce-89f6-60d75e45a637" name="Out" connectedTo="fd305c5c-80b7-436a-ae36-f2255bfb7592" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.160520373986856" CRS="WGS84" lon="4.987546205520631"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="19731.6" id="c05380f6-51d3-4172-9072-02fea67cdc80" name="ElectricityCable_c053" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="fd305c5c-80b7-436a-ae36-f2255bfb7592" name="In" connectedTo="2e4094b8-0fa6-4bce-89f6-60d75e45a637" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="542e2a61-fd5b-48ba-abd3-162d31768449" name="Out" connectedTo="366a15c7-43af-4c45-add3-79ddf58562d1" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.16252114122419" lon="4.988200664520265"/>
          <point xsi:type="esdl:Point" lat="52.17119447992377" lon="4.985218048095704"/>
          <point xsi:type="esdl:Point" lat="52.209237157080416" lon="4.985475540161134"/>
          <point xsi:type="esdl:Point" lat="52.21139351204487" lon="4.98830795288086"/>
          <point xsi:type="esdl:Point" lat="52.229008588827746" lon="5.003242492675782"/>
          <point xsi:type="esdl:Point" lat="52.245040120181876" lon="5.007190704345704"/>
          <point xsi:type="esdl:Point" lat="52.2625893189209" lon="5.0092506408691415"/>
          <point xsi:type="esdl:Point" lat="52.30307308678646" lon="5.009078979492188"/>
          <point xsi:type="esdl:Point" lat="52.32065178453125" lon="5.00753402709961"/>
          <point xsi:type="esdl:Point" lat="52.32432406352089" lon="5.007963180541993"/>
          <point xsi:type="esdl:Point" lat="52.32804849230352" lon="5.007019042968751"/>
          <point xsi:type="esdl:Point" lat="52.335955306808124" lon="5.012469291687013"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="f5106fed-95ab-4371-8fd1-ec02181f22a9">
          <investmentCosts xsi:type="esdl:SingleValue" id="fae71d3f-f496-4fa1-b953-09fac704b702" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="2090ffa1-8db6-4089-8448-7ab447c981cf" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="60390.4" id="71405804-5fe4-4bc6-87bb-e2783dadd703" name="ElectricityCable_7140" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="334fce00-67ca-4be6-bce1-98c4e27a99d9" name="In" connectedTo="699f65ee-277a-437d-905f-057d67a6b44d" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="1657ebab-7f7c-49ab-9659-4897a525a853" name="Out" connectedTo="3d74a80a-07dd-46c8-9d8d-892c812b3aa2" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.52927017993024" lon="6.187373399734498"/>
          <point xsi:type="esdl:Point" lat="52.49677352278671" lon="6.163973808288575"/>
          <point xsi:type="esdl:Point" lat="52.48104218114151" lon="6.148180961608888"/>
          <point xsi:type="esdl:Point" lat="52.476781730223" lon="6.151185035705566"/>
          <point xsi:type="esdl:Point" lat="52.4702334232259" lon="6.207275390625001"/>
          <point xsi:type="esdl:Point" lat="52.46380180215249" lon="6.257314682006836"/>
          <point xsi:type="esdl:Point" lat="52.457055433785904" lon="6.302547454833984"/>
          <point xsi:type="esdl:Point" lat="52.45600939264076" lon="6.35335922241211"/>
          <point xsi:type="esdl:Point" lat="52.443768864998496" lon="6.378078460693359"/>
          <point xsi:type="esdl:Point" lat="52.43764732544782" lon="6.406574249267579"/>
          <point xsi:type="esdl:Point" lat="52.43063528652407" lon="6.451292037963868"/>
          <point xsi:type="esdl:Point" lat="52.41692195703509" lon="6.478757858276367"/>
          <point xsi:type="esdl:Point" lat="52.411686737000544" lon="6.4971256256103525"/>
          <point xsi:type="esdl:Point" lat="52.401266800143915" lon="6.523303985595704"/>
          <point xsi:type="esdl:Point" lat="52.39419659749338" lon="6.536264419555665"/>
          <point xsi:type="esdl:Point" lat="52.38785863832959" lon="6.553773880004884"/>
          <point xsi:type="esdl:Point" lat="52.38356297507495" lon="6.5720558166503915"/>
          <point xsi:type="esdl:Point" lat="52.38064220922446" lon="6.581068038940431"/>
          <point xsi:type="esdl:Point" lat="52.37186565170669" lon="6.603727340698243"/>
          <point xsi:type="esdl:Point" lat="52.36338872348908" lon="6.6147780418396005"/>
          <point xsi:type="esdl:Point" lat="52.34933990789695" lon="6.614348888397218"/>
          <point xsi:type="esdl:Point" lat="52.32783867366428" lon="6.625099182128907"/>
          <point xsi:type="esdl:Point" lat="52.32112395176095" lon="6.678142547607423"/>
          <point xsi:type="esdl:Point" lat="52.31943855396181" lon="6.68146848678589"/>
          <point xsi:type="esdl:Point" lat="52.30014699906054" lon="6.72165870666504"/>
          <point xsi:type="esdl:Point" lat="52.28450292800667" lon="6.751742362976075"/>
          <point xsi:type="esdl:Point" lat="52.27751905929657" lon="6.768071651458741"/>
          <point xsi:type="esdl:Point" lat="52.274893260067536" lon="6.768479347229005"/>
          <point xsi:type="esdl:Point" lat="52.26459862689503" lon="6.752943992614747"/>
          <point xsi:type="esdl:Point" lat="52.251792654633796" lon="6.757643222808839"/>
          <point xsi:type="esdl:Point" lat="52.24999295505439" lon="6.759467124938966"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="5233d79c-d542-4798-bbcc-8e5406c22cf2">
          <investmentCosts xsi:type="esdl:SingleValue" id="a67fbe15-99e4-4cca-957e-889447b00938" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="1c2107af-9a39-4460-854b-2cea50c67aac" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="578e5268-f8d1-4c4b-93b5-4c6bc37bb63b" name="Bus_578e" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="3d74a80a-07dd-46c8-9d8d-892c812b3aa2" name="In" connectedTo="1657ebab-7f7c-49ab-9659-4897a525a853" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="ae9fb9db-88c0-4976-b45a-db3726c7de94" name="Out" connectedTo="c88644a8-16ac-4797-8abd-228a6faf7b46" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.248981413021816" CRS="WGS84" lon="6.759080886840821"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="58428.6" id="44d72b51-0a4c-48be-8940-d27aa47660cd" name="ElectricityCable_44d7" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="c88644a8-16ac-4797-8abd-228a6faf7b46" name="In" connectedTo="ae9fb9db-88c0-4976-b45a-db3726c7de94" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="8fe5b972-0d85-40b8-bf20-06f49d5c11ed" name="Out" connectedTo="7a1d8e83-a6d2-496b-a63d-8967cce2c8fb" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.2497400717085" lon="6.757729053497315"/>
          <point xsi:type="esdl:Point" lat="52.25044288679409" lon="6.7558032274246225"/>
          <point xsi:type="esdl:Point" lat="52.25147738406991" lon="6.727452278137208"/>
          <point xsi:type="esdl:Point" lat="52.24712904899362" lon="6.717710494995118"/>
          <point xsi:type="esdl:Point" lat="52.2443569271534" lon="6.679859161376954"/>
          <point xsi:type="esdl:Point" lat="52.240888246430075" lon="6.662864685058595"/>
          <point xsi:type="esdl:Point" lat="52.23352954124061" lon="6.647157669067383"/>
          <point xsi:type="esdl:Point" lat="52.235421896246486" lon="6.636857986450196"/>
          <point xsi:type="esdl:Point" lat="52.226485066348154" lon="6.603212356567384"/>
          <point xsi:type="esdl:Point" lat="52.22375108846848" lon="6.583728790283204"/>
          <point xsi:type="esdl:Point" lat="52.22485521518381" lon="6.577978134155274"/>
          <point xsi:type="esdl:Point" lat="52.220911779418536" lon="6.550512313842774"/>
          <point xsi:type="esdl:Point" lat="52.18766785053024" lon="6.48244857788086"/>
          <point xsi:type="esdl:Point" lat="52.17898456576359" lon="6.467170715332032"/>
          <point xsi:type="esdl:Point" lat="52.16781221054184" lon="6.438202857971192"/>
          <point xsi:type="esdl:Point" lat="52.17007585897401" lon="6.405758857727051"/>
          <point xsi:type="esdl:Point" lat="52.170536471006606" lon="6.387712955474854"/>
          <point xsi:type="esdl:Point" lat="52.163903197643386" lon="6.361384391784669"/>
          <point xsi:type="esdl:Point" lat="52.1651009451551" lon="6.317975521087647"/>
          <point xsi:type="esdl:Point" lat="52.164393488296824" lon="6.3086360692977905"/>
          <point xsi:type="esdl:Point" lat="52.164798220806375" lon="6.278858184814454"/>
          <point xsi:type="esdl:Point" lat="52.1629686689541" lon="6.2651896476745605"/>
          <point xsi:type="esdl:Point" lat="52.160151801790306" lon="6.259803771972657"/>
          <point xsi:type="esdl:Point" lat="52.15326683872532" lon="6.25673532485962"/>
          <point xsi:type="esdl:Point" lat="52.12732347780383" lon="6.257658004760743"/>
          <point xsi:type="esdl:Point" lat="52.12505765485123" lon="6.254353523254395"/>
          <point xsi:type="esdl:Point" lat="52.11749529560638" lon="6.232895851135255"/>
          <point xsi:type="esdl:Point" lat="52.109944831360274" lon="6.2308573722839355"/>
          <point xsi:type="esdl:Point" lat="52.10112774972513" lon="6.236715316772462"/>
          <point xsi:type="esdl:Point" lat="52.05681828075688" lon="6.256284713745118"/>
          <point xsi:type="esdl:Point" lat="52.0259867262715" lon="6.255168914794923"/>
          <point xsi:type="esdl:Point" lat="52.00918936748673" lon="6.2513065338134775"/>
          <point xsi:type="esdl:Point" lat="52.00093363733338" lon="6.246070861816407"/>
          <point xsi:type="esdl:Point" lat="51.98875200379791" lon="6.242337226867677"/>
          <point xsi:type="esdl:Point" lat="51.982762366274564" lon="6.2506574392318734"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="c243aefe-a90e-48ba-879f-55006d6e64a0">
          <investmentCosts xsi:type="esdl:SingleValue" id="b7dd56b0-e7d1-4358-b1d2-202a0ec751eb" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="cc0790b7-489a-4952-bd85-4f02d68d1ed5" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="97e0dad8-7621-4edb-bf45-2d41b1d50f95" name="Bus_97e0" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="7a1d8e83-a6d2-496b-a63d-8967cce2c8fb" name="In" connectedTo="8fe5b972-0d85-40b8-bf20-06f49d5c11ed" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="0b9129ed-46ee-4aba-a1c0-d0b10c8e32d8" name="Out" connectedTo="c4ebe2c3-e86d-4d34-a4e9-39fa72724163" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.98183725432146" CRS="WGS84" lon="6.251714229583741"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="809a65a0-c3c8-4e52-ab08-9b8408e0cfe8" name="Bus_809a" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="4d5677e0-7d41-4422-8e1a-dab727a96589" name="In" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="291cc339-d52b-4867-a195-d317e8c1846e f1017cd6-780b-49c2-a0be-110590133bd1"/>
        <port xsi:type="esdl:OutPort" id="75f81d10-0a5e-46f8-b40e-dc76242bf547" name="Out" connectedTo="5a2951d3-689d-4d9d-ae5d-95d7e17d9c12" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="53.424668105030946" lon="6.872828096913658"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="44368.8" id="f53c9e64-a4a2-400d-b672-3ac9b9900780" name="ElectricityCable_f53c" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="c4ebe2c3-e86d-4d34-a4e9-39fa72724163" name="In" connectedTo="0b9129ed-46ee-4aba-a1c0-d0b10c8e32d8" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="cfc15a5a-9744-40f9-917f-20cda7e9c024" name="Out" connectedTo="f121d0cc-e416-4682-865b-4c52a7fcef12" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.981510156594574" lon="6.250169277191163"/>
          <point xsi:type="esdl:Point" lat="51.98227007693509" lon="6.244804859161378"/>
          <point xsi:type="esdl:Point" lat="51.98099472502613" lon="6.185731887817383"/>
          <point xsi:type="esdl:Point" lat="51.96679820196322" lon="6.112990379333496"/>
          <point xsi:type="esdl:Point" lat="51.955929667747945" lon="6.086339950561523"/>
          <point xsi:type="esdl:Point" lat="51.95265007913558" lon="6.054883003234864"/>
          <point xsi:type="esdl:Point" lat="51.94222785874081" lon="6.04423999786377"/>
          <point xsi:type="esdl:Point" lat="51.93315273540566" lon="6.018362045288087"/>
          <point xsi:type="esdl:Point" lat="51.93262351705503" lon="6.007976531982422"/>
          <point xsi:type="esdl:Point" lat="51.92460509546322" lon="5.998706817626953"/>
          <point xsi:type="esdl:Point" lat="51.92029096248404" lon="5.990509986877442"/>
          <point xsi:type="esdl:Point" lat="51.91616171072475" lon="5.977034568786622"/>
          <point xsi:type="esdl:Point" lat="51.905783965962236" lon="5.968408584594727"/>
          <point xsi:type="esdl:Point" lat="51.90453953453485" lon="5.95012664794922"/>
          <point xsi:type="esdl:Point" lat="51.90308324121289" lon="5.904293060302735"/>
          <point xsi:type="esdl:Point" lat="51.90140182565535" lon="5.889884233474732"/>
          <point xsi:type="esdl:Point" lat="51.900064591977305" lon="5.88395118713379"/>
          <point xsi:type="esdl:Point" lat="51.899184114407916" lon="5.865497589111329"/>
          <point xsi:type="esdl:Point" lat="51.896509475220405" lon="5.86020827293396"/>
          <point xsi:type="esdl:Point" lat="51.89336458440054" lon="5.812067985534668"/>
          <point xsi:type="esdl:Point" lat="51.90416884616866" lon="5.779709815979005"/>
          <point xsi:type="esdl:Point" lat="51.91081429480405" lon="5.7717275619506845"/>
          <point xsi:type="esdl:Point" lat="51.912879214047884" lon="5.7682085037231445"/>
          <point xsi:type="esdl:Point" lat="51.91671759365971" lon="5.755763053894044"/>
          <point xsi:type="esdl:Point" lat="51.92068798590821" lon="5.685167312622071"/>
          <point xsi:type="esdl:Point" lat="51.92484328704635" lon="5.6783437728881845"/>
          <point xsi:type="esdl:Point" lat="51.92580927328671" lon="5.6654369831085205"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="d94d90f5-3427-4752-b44c-a1ccefaa676a">
          <investmentCosts xsi:type="esdl:SingleValue" id="f48b625c-38c8-4367-a8fc-aa9e6340d14d" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="dd509f1a-d32d-4af7-95f8-307a71bcbb80" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="695f2ac8-0e12-444e-b91a-a34eb46a0c43" name="Bus_695f" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="f121d0cc-e416-4682-865b-4c52a7fcef12" name="In" connectedTo="cfc15a5a-9744-40f9-917f-20cda7e9c024" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="7df91e3a-55a5-442b-8e12-469790b48b1b" name="Out" connectedTo="9cd3a1c4-6eb9-4772-8f0b-eb13097e73c3" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.92695387390637" CRS="WGS84" lon="5.663602352142334"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="41490.5" id="1826b7a5-809f-4393-9083-ab255965c1d4" name="ElectricityCable_1826" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="9cd3a1c4-6eb9-4772-8f0b-eb13097e73c3" name="In" connectedTo="7df91e3a-55a5-442b-8e12-469790b48b1b" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="8097169e-e30e-4923-b95a-21bdbbcbb88e" name="Out" connectedTo="f4f7b7b0-c379-4c23-89e6-951b4f618a98" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.92752947127999" lon="5.66147804260254"/>
          <point xsi:type="esdl:Point" lat="51.925081477365474" lon="5.6511783599853525"/>
          <point xsi:type="esdl:Point" lat="51.91597641488371" lon="5.6449127197265625"/>
          <point xsi:type="esdl:Point" lat="51.86377197456952" lon="5.640020370483399"/>
          <point xsi:type="esdl:Point" lat="51.833443863250004" lon="5.652894973754883"/>
          <point xsi:type="esdl:Point" lat="51.81752934066326" lon="5.665340423583985"/>
          <point xsi:type="esdl:Point" lat="51.79656664344844" lon="5.705938339233398"/>
          <point xsi:type="esdl:Point" lat="51.77851499504395" lon="5.776491165161134"/>
          <point xsi:type="esdl:Point" lat="51.76167797947606" lon="5.803098678588868"/>
          <point xsi:type="esdl:Point" lat="51.741220791341064" lon="5.800180435180664"/>
          <point xsi:type="esdl:Point" lat="51.711767433461695" lon="5.802583694458008"/>
          <point xsi:type="esdl:Point" lat="51.67244869163258" lon="5.837259292602539"/>
          <point xsi:type="esdl:Point" lat="51.637643886208345" lon="5.909598469734193"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="8e2c5c67-6d18-4af0-a7e0-152de38fdfbd">
          <investmentCosts xsi:type="esdl:SingleValue" id="721dd153-7126-4b3f-b205-6003e8f4e270" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="b6f395ca-c9b4-4160-878a-6303d69e01c3" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="923c7552-bd08-4cb4-9241-cc0380e9344b" name="Bus_923c" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="f4f7b7b0-c379-4c23-89e6-951b4f618a98" name="In" connectedTo="8097169e-e30e-4923-b95a-21bdbbcbb88e" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="f75e722b-818d-4920-898f-eb3d5b00bee5" name="Out" connectedTo="eb738353-d3eb-43b0-87d5-7386a77a9e8c" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.63847954122383" CRS="WGS84" lon="5.91290831565857"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="57824.4" id="2c43a9fc-3974-4f7f-819b-3e288933e9ae" name="ElectricityCable_2c43" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="eb738353-d3eb-43b0-87d5-7386a77a9e8c" name="In" connectedTo="f75e722b-818d-4920-898f-eb3d5b00bee5" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="9f33bb3f-a281-44cf-a8a4-8ecb2b78f37e" name="Out" connectedTo="ea12a015-6a2c-4c4f-9eb3-ab51a02d46ce" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.63762557487026" lon="5.9096091985702515"/>
          <point xsi:type="esdl:Point" lat="51.546535209446105" lon="5.894658565521241"/>
          <point xsi:type="esdl:Point" lat="51.528063266238995" lon="5.912189483642579"/>
          <point xsi:type="esdl:Point" lat="51.48678129755648" lon="5.928068161010743"/>
          <point xsi:type="esdl:Point" lat="51.391065489647175" lon="5.944054126739503"/>
          <point xsi:type="esdl:Point" lat="51.35845015051737" lon="5.9241628646850595"/>
          <point xsi:type="esdl:Point" lat="51.27050757321479" lon="5.970425605773927"/>
          <point xsi:type="esdl:Point" lat="51.241903702056796" lon="5.973021984100343"/>
          <point xsi:type="esdl:Point" lat="51.22262298448618" lon="5.952937602996827"/>
          <point xsi:type="esdl:Point" lat="51.22220637809062" lon="5.942251682281495"/>
          <point xsi:type="esdl:Point" lat="51.206359097331486" lon="5.909550189971925"/>
          <point xsi:type="esdl:Point" lat="51.17474234106825" lon="5.908691883087158"/>
          <point xsi:type="esdl:Point" lat="51.150668947213376" lon="5.919227600097656"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="fda79ccb-0db3-4f7a-b5af-33a3ba716ba4">
          <investmentCosts xsi:type="esdl:SingleValue" id="c3ccc8b7-531f-4fdf-8719-7ef8c59e241f" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/m" id="9029da2d-3ab6-4f51-a004-3c9a2548a07e" unit="EURO" perUnit="METRE"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="3e247e41-3570-4cf6-a81f-9e7c64b56435" name="Bus_3e24" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="ea12a015-6a2c-4c4f-9eb3-ab51a02d46ce" name="In" connectedTo="9f33bb3f-a281-44cf-a8a4-8ecb2b78f37e 0a47564c-01ef-46e3-bfc3-30292b083aca" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="955c2d5b-812d-4156-aaf7-29389009ab48" name="Out" connectedTo="20967b74-36af-42ed-99cc-b2f6789fcdd9 f5d6471c-6ec2-47e7-802c-0da25adac0bf" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.148905672879316" CRS="WGS84" lon="5.918562412261964"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="eb0074d7-6933-4b2e-8983-cbebe18006ac" name="Bus_eb00" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="de8ec129-3b85-4bfd-a3b6-fde46f6d7c42" name="In" connectedTo="41c012bf-50c7-4f00-aa03-4b9e3239f461 f3a3ab9f-64b0-4e55-867c-f4d8ccf37626" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="bb4facb4-dcaa-45c2-8577-da41b1503c24" name="Out" connectedTo="c38ba474-6a36-4301-8798-16f82000ecb8" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.70129597084116" CRS="WGS84" lon="4.83276128768921"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="33696.4" id="18696411-2257-4310-8334-d073fa3bd12e" name="ElectricityCable_1869" capacity="4000000000.0">
        <port xsi:type="esdl:InPort" id="c38ba474-6a36-4301-8798-16f82000ecb8" name="In" connectedTo="bb4facb4-dcaa-45c2-8577-da41b1503c24" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="41dac491-7fbe-416d-a272-7b82a92f036a" name="Out" connectedTo="d1371d0b-005d-4661-8b54-cc1168619101" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.70326412591912" lon="4.834381341934204"/>
          <point xsi:type="esdl:Point" lat="51.704234873584724" lon="4.83576536178589"/>
          <point xsi:type="esdl:Point" lat="51.718494484718555" lon="4.8436832427978525"/>
          <point xsi:type="esdl:Point" lat="51.721286050126515" lon="4.854154586791993"/>
          <point xsi:type="esdl:Point" lat="51.734816053175386" lon="4.866170883178712"/>
          <point xsi:type="esdl:Point" lat="51.75748102630367" lon="4.865612983703613"/>
          <point xsi:type="esdl:Point" lat="51.79184205701332" lon="4.805574417114259"/>
          <point xsi:type="esdl:Point" lat="51.85497256448741" lon="4.8024845123291025"/>
          <point xsi:type="esdl:Point" lat="51.85680149921755" lon="4.798922538757325"/>
          <point xsi:type="esdl:Point" lat="51.87911381610841" lon="4.685325622558595"/>
          <point xsi:type="esdl:Point" lat="51.90644588352587" lon="4.659190177917481"/>
          <point xsi:type="esdl:Point" lat="51.91600288576498" lon="4.639320373535157"/>
          <point xsi:type="esdl:Point" lat="51.91606906289982" lon="4.634878635406495"/>
          <point xsi:type="esdl:Point" lat="51.915083013489976" lon="4.633655548095704"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="10429609-ea9e-418c-b7be-72bb1906bb9b">
          <investmentCosts xsi:type="esdl:SingleValue" id="2b9b43c7-8edc-4e32-94fb-f957dd1668fa" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="6ecc4ad8-4826-4553-a069-48c379eccb4a" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="31e2c65e-41c3-4bea-b2b6-b90762bdd20e" name="Bus_31e2" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="c6df4c63-795c-4de2-94fa-a11cef08eba9" name="In" connectedTo="a8c54619-4d8d-4260-9fd6-4d7874570842 1b227827-1523-409d-8bf9-ac040c632cd5" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" name="Out" id="20b09136-bbd4-48f0-b104-641f7e46b519" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="4491bcc1-e7f4-4573-9a69-d25f46b920bb befedf4b-43e5-47cd-818a-791f6b934858"/>
        <geometry xsi:type="esdl:Point" lat="51.43330361377654" CRS="WGS84" lon="3.728141784667969"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="6b0ebe59-bfdc-4c8e-8d8a-2f036a5cb167" name="ElectricityProducer_Beverwijk_Offshore" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="499b288a-4ded-46fd-af42-833317b80a84" name="Out" connectedTo="0c85933d-b982-4ea0-afea-312941724388" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.47734470376444" lon="4.678158725338944"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="e8b6ad5a-7af2-4812-b56d-e70303d90eeb" name="ElectricityProducer_Maasvlakte_Offshore" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="c3154a26-f50f-4369-82fc-3f23aa4c66cd" name="Out" connectedTo="4d7cd68e-6ae8-4dbe-822d-ab5b97b7827c" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.9760968507607" lon="3.994560241699219"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="62aabba4-ffd7-4c34-9ac9-44c65d3f3795" name="ElectricityProducer_Lelystad" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="f15357d8-c63d-4840-9ed1-a1ddc5d2acae" name="Out" connectedTo="1d08e006-6199-4ba6-90a2-e60d46946d7e" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.57801901378958" CRS="WGS84" lon="5.5289554595947275"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="86bb8642-d7f9-404d-b7af-3ec2e9a548db" name="ElectricityProducer_Diemen" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="8be7b159-4d61-43a2-928d-5ea260d390e8" name="Out" connectedTo="366a15c7-43af-4c45-add3-79ddf58562d1" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.339482103160265" CRS="WGS84" lon="5.020751953125"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="103a8e35-4a3a-41b6-beac-6b6d60cc2675" name="ElectricityProducer_Borselle" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="a8c54619-4d8d-4260-9fd6-4d7874570842" name="Out" connectedTo="c6df4c63-795c-4de2-94fa-a11cef08eba9" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.43104280189433" CRS="WGS84" lon="3.7178206443786626"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="74cb5196-bd01-450c-ae5f-dd0f71e19317" name="ElectricityProducer_Maasbracht" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="0a47564c-01ef-46e3-bfc3-30292b083aca" name="Out" connectedTo="ea12a015-6a2c-4c4f-9eb3-ab51a02d46ce" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.15399341097399" CRS="WGS84" lon="5.907876491546632"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="4530fb5b-67c8-48c5-9a38-3118f5fd5bf2" name="ElectricityProducer_Eemshaven" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="291cc339-d52b-4867-a195-d317e8c1846e" name="Out" connectedTo="4d5677e0-7d41-4422-8e1a-dab727a96589" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="53.43605155965126" CRS="WGS84" lon="6.8792009353637695"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="4f4a5b54-ffa9-4b96-8925-358f3f48c646" name="ElectricityProducer_Maasvlakte" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="bc803b22-4bdd-48ba-90ab-44534a434388" name="Out" connectedTo="4d7cd68e-6ae8-4dbe-822d-ab5b97b7827c" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.960756045314085" CRS="WGS84" lon="4.0233778953552255"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="0a0de3a7-6a12-4b96-b55c-b61f6c7b1877" name="ElectricityProducer_Eemshaven_Offshore" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="b2c14a7a-7187-4959-bc22-0476d3cdcf69" name="Out" connectedTo="10bead7b-ce3d-45a1-9557-0a52f4f7d074" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="53.4491648613521" lon="6.852636160859635"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="43332e31-66dc-4043-8239-0d6b3786e9dc" diameter="DN1000" length="30162.65" name="Pipe_4333">
        <port xsi:type="esdl:InPort" name="In" id="f64ae75e-06ae-435b-839c-2d6c14f58f58" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="d2d886c1-85a5-4f39-a4da-55f94e82a752"/>
        <port xsi:type="esdl:OutPort" id="4497d08d-4ad9-496d-bd56-973e356ca71c" name="Out" connectedTo="927dfa0e-3842-47cd-84c7-28d3411a1915" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.9130428994452" lon="4.795532226562501"/>
          <point xsi:type="esdl:Point" lat="52.87658981733708" lon="4.769439697265626"/>
          <point xsi:type="esdl:Point" lat="52.84549764505799" lon="4.759140014648438"/>
          <point xsi:type="esdl:Point" lat="52.80815762634652" lon="4.818878173828126"/>
          <point xsi:type="esdl:Point" lat="52.79777970322422" lon="4.909515380859376"/>
          <point xsi:type="esdl:Point" lat="52.80317653234415" lon="4.923248291015626"/>
          <point xsi:type="esdl:Point" lat="52.75956761546834" lon="4.956893920898438"/>
          <point xsi:type="esdl:Point" lat="52.75790545926437" lon="5.013198852539063"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="265a7d59-9a6e-433e-a49b-4a8fe83dc260">
          <investmentCosts xsi:type="esdl:SingleValue" id="22a94e15-357a-409b-84fb-9f64db7aa406" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="3ea497b5-78bc-4547-bbdc-79770dba59f4" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="ebe08a24-a799-4088-9de7-3815027d2e98" name="Joint_ebe0">
        <port xsi:type="esdl:InPort" id="927dfa0e-3842-47cd-84c7-28d3411a1915" name="In" connectedTo="4497d08d-4ad9-496d-bd56-973e356ca71c 33d81cad-9bb8-4198-986f-0ea43b087bab" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="c57cd03d-5e35-49e0-8e56-f171249aa668" name="Out" connectedTo="72ab487b-4903-4fcb-95ae-8cc61fec18d5" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="52.75790545926437" lon="5.013198852539063"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="15ad6a9c-75c2-44da-bc23-b51126573600" name="Joint_15ad">
        <port xsi:type="esdl:InPort" id="4d862b35-fb77-4da3-990d-6620362fa1f0" name="In" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="a00dedf1-783d-4961-9bd7-f11944468ada 61b04bd4-8a71-4fee-9636-83b2d65d6e9c 0325e36c-5cd2-487a-861b-75390e3aca86"/>
        <port xsi:type="esdl:OutPort" id="f52b0cc4-1c47-4db5-8866-ce45afd913a2" name="Out" connectedTo="2ca05466-cfb9-476b-a700-7f26cd1d7171" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="51.8544424245821" lon="4.758453369140626"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="4a548e77-a216-4124-ba3c-49f63dd425ae" name="Joint_4a54">
        <port xsi:type="esdl:InPort" id="47ef132b-8380-43ba-a5e6-254dd1a75b62" name="In" connectedTo="34d80ad5-aa96-4ea7-aa72-84eec4fe7271" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="6732771b-4496-4521-a2ff-8beb029805fb" name="Out" connectedTo="524d9449-af62-4bf8-b66c-f1ff6a5a6d01" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="51.82731080690345" CRS="WGS84" lon="5.720422267913818"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="e2a8c21d-202f-42e6-af77-f5562612cbd7" diameter="DN1000" length="6787.44" name="Pipe_e2a8">
        <port xsi:type="esdl:InPort" id="524d9449-af62-4bf8-b66c-f1ff6a5a6d01" name="In" connectedTo="6732771b-4496-4521-a2ff-8beb029805fb" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="4d6c360c-119b-4f30-83d1-13fefc889196" name="Out" connectedTo="27755afc-72fc-4cc5-b72c-eb1f1e503128" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.82729091455115" lon="5.7204437255859375"/>
          <point xsi:type="esdl:Point" lat="51.82007604211561" lon="5.710830688476563"/>
          <point xsi:type="esdl:Point" lat="51.81455800703693" lon="5.697097778320313"/>
          <point xsi:type="esdl:Point" lat="51.803519909558034" lon="5.672378540039063"/>
          <point xsi:type="esdl:Point" lat="51.79035556791182" lon="5.660018920898438"/>
          <point xsi:type="esdl:Point" lat="51.784409121571045" lon="5.66619873046875"/>
          <point xsi:type="esdl:Point" lat="51.784409121571045" lon="5.665512084960938"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="02f5e04f-d4ae-48a3-a7e7-caa0fa766b1d">
          <investmentCosts xsi:type="esdl:SingleValue" id="228314ba-8fe6-4b98-ae5c-8acb0a22d6aa" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="eeed0db9-b69c-49a0-8a6d-440da4878c57" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="54cbddfe-f78f-44d1-9978-e467c0587fda" name="Joint_54cb">
        <port xsi:type="esdl:InPort" id="27755afc-72fc-4cc5-b72c-eb1f1e503128" name="In" connectedTo="4d6c360c-119b-4f30-83d1-13fefc889196" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="e82f61af-ba6d-4cbe-bfe0-318f3dd038ac" name="Out" connectedTo="4753e5ff-f195-4eea-8683-d780e0a6448e 18a98e0f-bb3d-4c49-9550-02e6080eac78" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="51.784409121571045" lon="5.665512084960938"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c1ced69e-4db7-47eb-b195-93ed37aa5868" name="Joint_c1ce">
        <port xsi:type="esdl:InPort" id="891ccb9a-539d-40e2-8210-18dbc130d809" name="In" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="1b922630-bbd6-4380-9fbf-2957fdced13e 51f0d172-3db5-4405-a99f-ae69e3e5f07a"/>
        <port xsi:type="esdl:OutPort" id="a7028b54-194f-4315-b4fe-9d83a9e1a781" name="Out" connectedTo="a0088f34-13d2-478e-9128-a5cae9f67dfe" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="53.15019351038124" CRS="WGS84" lon="6.845684051513673"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" id="5b233069-6071-4b9b-9d3d-19d676e51f4d" name="GasProducer_Eemshaven" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="6c2d6ca3-8725-4665-9763-9b4090dfd6a8" name="Out" connectedTo="612d8006-ca77-439e-b2d8-9d82aa733bdc" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="53.439144977718065" lon="6.8535810419198295"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="7c442069-115b-464c-8562-c93e65f714b0" name="ElectricityProducer_Borselle_Offshore" power="2000000000.0">
        <port xsi:type="esdl:OutPort" id="1b227827-1523-409d-8bf9-ac040c632cd5" name="Out" connectedTo="c6df4c63-795c-4de2-94fa-a11cef08eba9" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.444806849921186" lon="3.7315770974532474"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="6619b918-679b-4134-ad2d-11a643e5e96e" name="Joint_6619">
        <port xsi:type="esdl:InPort" id="2b31c358-0faf-4444-a1df-2394d995942c" name="In" connectedTo="363ef637-b0cb-4f22-8cf2-a2c7caf596d6" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="67bc53b9-175d-4c82-8bca-6c3894095335" name="Out" connectedTo="9ae83037-fa22-4952-8661-7d59a4a4755b e7ff1f73-e77e-491a-b027-f2f10120f337" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="51.87423944163612" lon="4.338226318359376"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="8802b75c-8666-43df-bc9f-4370388d1249" diameter="DN1000" length="3520.61" name="Pipe_8802">
        <port xsi:type="esdl:InPort" id="9ae83037-fa22-4952-8661-7d59a4a4755b" name="In" connectedTo="67bc53b9-175d-4c82-8bca-6c3894095335" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="59f30765-1570-4cb5-8c1f-bdf7220f3180" name="Out" connectedTo="46ddab80-b152-483a-abdf-2440b95370a8" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.87423944163612" lon="4.338226318359376"/>
          <point xsi:type="esdl:Point" lat="51.90391780943757" lon="4.322433471679688"/>
          <point xsi:type="esdl:Point" lat="51.90391780943757" lon="4.321746826171876"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="135c9fa6-b04c-4de8-b04d-01d9566864c5">
          <investmentCosts xsi:type="esdl:SingleValue" id="813cb4c7-4103-46af-b3d1-92726a0169cf" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="2092d537-39f1-43f8-8009-9ea9ba318c69" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasProducer" id="82866b8b-34b8-4539-95c5-a938cfedd62a" name="GasProducer_DenHelder" power="2000000000.0">
        <geometry xsi:type="esdl:Point" lat="52.959801208563285" lon="4.764288507599407"/>
        <port xsi:type="esdl:OutPort" id="d2d886c1-85a5-4f39-a4da-55f94e82a752" name="Out" connectedTo="f64ae75e-06ae-435b-839c-2d6c14f58f58" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" id="cd2d7449-969e-4539-b2c7-0d029e0ff4b9" name="GasProducer_Borselle" power="2000000000.0">
        <geometry xsi:type="esdl:Point" lat="51.454701241295446" lon="3.684710756917076"/>
        <port xsi:type="esdl:OutPort" id="f184a4f3-6766-4382-831c-5df185e12530" name="Out" connectedTo="a599d1c5-e38b-47d8-a1d0-ff0de13225c9" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" id="49074bcd-2763-4cec-a8da-a27984efb9a5" name="GasProducer_Maasvlakte" power="2000000000.0">
        <geometry xsi:type="esdl:Point" lat="51.97975241057527" lon="4.0457149161826145"/>
        <port xsi:type="esdl:OutPort" id="32cdfe79-8470-4d7f-98cd-7c74c9dd6cfe" name="Out" connectedTo="c5932fd1-9ba7-4510-90d7-0787087ac4e5" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="bea7e169-2241-4d5e-9db4-8d44c3e0a806" name="Pipe_bea7" innerDiameter="1.194" outerDiameter="1.4" diameter="DN1000" length="181103.0">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="f2369071-d155-405b-8691-51082d3b9162">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="303577c0-b204-4f50-8aae-e54eae034da0" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="5b3b5b1e-ddce-4c82-b43a-16b03577a143"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0125">
            <matter xsi:type="esdl:Material" name="steel" id="00ea5714-14d4-40cd-a326-2c083a737d0d" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.078">
            <matter xsi:type="esdl:Material" name="PUR" id="1cd60ec8-d9da-4aad-a4d0-f20b49fe0f0a" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0125">
            <matter xsi:type="esdl:Material" name="HDPE" id="6a9e4795-6b77-4958-8eb5-df8f776cfce3" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="53.15019351038124" lon="6.845684051513673"/>
          <point xsi:type="esdl:Point" lat="53.11299015004823" lon="6.813125159452832"/>
          <point xsi:type="esdl:Point" lat="53.072583654870606" lon="6.815929367944485"/>
          <point xsi:type="esdl:Point" lat="53.033759761836116" lon="6.786903827416603"/>
          <point xsi:type="esdl:Point" lat="53.00495018798517" lon="6.7130459718184055"/>
          <point xsi:type="esdl:Point" lat="53.00322028700948" lon="6.709998758701372"/>
          <point xsi:type="esdl:Point" lat="52.95206948175104" lon="6.680256905478449"/>
          <point xsi:type="esdl:Point" lat="52.922175958855625" lon="6.695364215579993"/>
          <point xsi:type="esdl:Point" lat="52.71805490440326" lon="6.549683731625737"/>
          <point xsi:type="esdl:Point" lat="52.69555053505183" lon="6.518211539582387"/>
          <point xsi:type="esdl:Point" lat="52.685459981247696" lon="6.515464755927579"/>
          <point xsi:type="esdl:Point" lat="52.682338719258816" lon="6.51718149571183"/>
          <point xsi:type="esdl:Point" lat="52.67285328207216" lon="6.4890001306203"/>
          <point xsi:type="esdl:Point" lat="52.611344497212784" lon="6.433038717056419"/>
          <point xsi:type="esdl:Point" lat="52.5811534641606" lon="6.442380275568912"/>
          <point xsi:type="esdl:Point" lat="52.526463920772436" lon="6.3884941649212665"/>
          <point xsi:type="esdl:Point" lat="52.46946076244498" lon="6.343517743726201"/>
          <point xsi:type="esdl:Point" lat="52.436355176005314" lon="6.336597444591781"/>
          <point xsi:type="esdl:Point" lat="52.41217882870577" lon="6.326812027821461"/>
          <point xsi:type="esdl:Point" lat="52.3800209086044" lon="6.310333228714994"/>
          <point xsi:type="esdl:Point" lat="52.36419197706142" lon="6.30930367630191"/>
          <point xsi:type="esdl:Point" lat="52.34427509462825" lon="6.302265043186398"/>
          <point xsi:type="esdl:Point" lat="52.33498277728373" lon="6.2978572540246125"/>
          <point xsi:type="esdl:Point" lat="52.17314918904446" lon="6.293332635929142"/>
          <point xsi:type="esdl:Point" lat="51.984555542063916" lon="6.151186581792106"/>
          <point xsi:type="esdl:Point" lat="51.96926840735886" lon="6.087913131970748"/>
          <point xsi:type="esdl:Point" lat="51.94748141772564" lon="6.05941525155199"/>
          <point xsi:type="esdl:Point" lat="51.90662874112336" lon="6.043621245536754"/>
          <point xsi:type="esdl:Point" lat="51.896453305505865" lon="5.986976922801861"/>
          <point xsi:type="esdl:Point" lat="51.896453305505865" lon="5.919337375301864"/>
          <point xsi:type="esdl:Point" lat="51.88268314219581" lon="5.865088398119158"/>
          <point xsi:type="esdl:Point" lat="51.88056428104559" lon="5.797792198575987"/>
          <point xsi:type="esdl:Point" lat="51.848142284135605" lon="5.773528578547542"/>
          <point xsi:type="esdl:Point" lat="51.82731080690345" lon="5.720422267913818"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a0088f34-13d2-478e-9128-a5cae9f67dfe" name="In" connectedTo="a7028b54-194f-4315-b4fe-9d83a9e1a781" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="34d80ad5-aa96-4ea7-aa72-84eec4fe7271" name="Out" connectedTo="47ef132b-8380-43ba-a5e6-254dd1a75b62" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="588f41d3-cb78-448b-8837-456a91f86fe6" name="Pipe_588f" innerDiameter="1.194" outerDiameter="1.4" diameter="DN1000" length="24311.1">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="4c00e640-bf79-4d91-bf9e-ea1e23798d93">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="303577c0-b204-4f50-8aae-e54eae034da0" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="5b3b5b1e-ddce-4c82-b43a-16b03577a143"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0125">
            <matter xsi:type="esdl:Material" name="steel" id="00ea5714-14d4-40cd-a326-2c083a737d0d" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.078">
            <matter xsi:type="esdl:Material" name="PUR" id="1cd60ec8-d9da-4aad-a4d0-f20b49fe0f0a" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0125">
            <matter xsi:type="esdl:Material" name="HDPE" id="6a9e4795-6b77-4958-8eb5-df8f776cfce3" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.974015937252695" lon="4.049972068506117"/>
          <point xsi:type="esdl:Point" lat="51.946068729286914" lon="4.12780740883541"/>
          <point xsi:type="esdl:Point" lat="51.92479967372977" lon="4.175876122794807"/>
          <point xsi:type="esdl:Point" lat="51.909661819119506" lon="4.207120786868411"/>
          <point xsi:type="esdl:Point" lat="51.90256750191206" lon="4.24609077997118"/>
          <point xsi:type="esdl:Point" lat="51.867192263518774" lon="4.28235706944081"/>
          <point xsi:type="esdl:Point" lat="51.87423944163612" lon="4.338226318359376"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c5932fd1-9ba7-4510-90d7-0787087ac4e5" name="In" connectedTo="32cdfe79-8470-4d7f-98cd-7c74c9dd6cfe" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="363ef637-b0cb-4f22-8cf2-a2c7caf596d6" name="Out" connectedTo="2b31c358-0faf-4444-a1df-2394d995942c" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="ba8ea377-ef3a-4dc3-a369-3f27959d9c8d" name="Pipe_ba8e" innerDiameter="1.194" outerDiameter="1.4" diameter="DN1000" length="32679.3">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="c6235a10-e203-498f-8ab8-b228ee34f103">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="303577c0-b204-4f50-8aae-e54eae034da0" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="5b3b5b1e-ddce-4c82-b43a-16b03577a143"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0125">
            <matter xsi:type="esdl:Material" name="steel" id="00ea5714-14d4-40cd-a326-2c083a737d0d" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.078">
            <matter xsi:type="esdl:Material" name="PUR" id="1cd60ec8-d9da-4aad-a4d0-f20b49fe0f0a" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0125">
            <matter xsi:type="esdl:Material" name="HDPE" id="6a9e4795-6b77-4958-8eb5-df8f776cfce3" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.87423944163612" lon="4.338226318359376"/>
          <point xsi:type="esdl:Point" lat="51.87826805931177" lon="4.367424144037125"/>
          <point xsi:type="esdl:Point" lat="51.8766062106952" lon="4.409708443456807"/>
          <point xsi:type="esdl:Point" lat="51.861446928079644" lon="4.485404406709367"/>
          <point xsi:type="esdl:Point" lat="51.868441763830965" lon="4.544460255288035"/>
          <point xsi:type="esdl:Point" lat="51.86632223149707" lon="4.551327214425114"/>
          <point xsi:type="esdl:Point" lat="51.86623670477368" lon="4.558000094605208"/>
          <point xsi:type="esdl:Point" lat="51.86295122601965" lon="4.558643872024302"/>
          <point xsi:type="esdl:Point" lat="51.85272277609525" lon="4.571057940754884"/>
          <point xsi:type="esdl:Point" lat="51.84551344031128" lon="4.571015022260286"/>
          <point xsi:type="esdl:Point" lat="51.834935697692636" lon="4.613601843071145"/>
          <point xsi:type="esdl:Point" lat="51.838435312304036" lon="4.618408714467069"/>
          <point xsi:type="esdl:Point" lat="51.82904936880686" lon="4.632056795751992"/>
          <point xsi:type="esdl:Point" lat="51.84182861823671" lon="4.687164142826862"/>
          <point xsi:type="esdl:Point" lat="51.84532769711942" lon="4.688451697665049"/>
          <point xsi:type="esdl:Point" lat="51.84904210349218" lon="4.693635730863601"/>
          <point xsi:type="esdl:Point" lat="51.8544424245821" lon="4.758453369140626"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="e7ff1f73-e77e-491a-b027-f2f10120f337" name="In" connectedTo="67bc53b9-175d-4c82-8bca-6c3894095335" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="a00dedf1-783d-4961-9bd7-f11944468ada" name="Out" connectedTo="4d862b35-fb77-4da3-990d-6620362fa1f0" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="5529d5d1-addb-4d77-9bb8-5ac00d0349b9" name="Pipe_5529" innerDiameter="1.194" outerDiameter="1.4" diameter="DN1000" length="159525.7">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="d1620774-4474-4008-9365-bdde1245e01c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="303577c0-b204-4f50-8aae-e54eae034da0" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Cost in EUR/m" id="5b3b5b1e-ddce-4c82-b43a-16b03577a143"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0125">
            <matter xsi:type="esdl:Material" name="steel" id="00ea5714-14d4-40cd-a326-2c083a737d0d" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.078">
            <matter xsi:type="esdl:Material" name="PUR" id="1cd60ec8-d9da-4aad-a4d0-f20b49fe0f0a" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0125">
            <matter xsi:type="esdl:Material" name="HDPE" id="6a9e4795-6b77-4958-8eb5-df8f776cfce3" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.75790545926437" lon="5.013198852539063"/>
          <point xsi:type="esdl:Point" lat="52.7567184674491" lon="5.0456685386787345"/>
          <point xsi:type="esdl:Point" lat="52.77001160729121" lon="5.067642807917317"/>
          <point xsi:type="esdl:Point" lat="52.77686429701823" lon="5.109016236718068"/>
          <point xsi:type="esdl:Point" lat="52.94306914636596" lon="5.397836160825445"/>
          <point xsi:type="esdl:Point" lat="52.946585405409294" lon="5.430454216726473"/>
          <point xsi:type="esdl:Point" lat="52.98898891246092" lon="5.474736551243726"/>
          <point xsi:type="esdl:Point" lat="53.052170679026126" lon="5.596968423883336"/>
          <point xsi:type="esdl:Point" lat="53.066404765568706" lon="5.6546508806345805"/>
          <point xsi:type="esdl:Point" lat="53.06868039450809" lon="5.704072219193463"/>
          <point xsi:type="esdl:Point" lat="53.064142740530635" lon="5.740467102619859"/>
          <point xsi:type="esdl:Point" lat="53.05754166315922" lon="5.76518815551325"/>
          <point xsi:type="esdl:Point" lat="53.0530028357201" lon="5.810166737860972"/>
          <point xsi:type="esdl:Point" lat="53.05341547615285" lon="5.882613156756894"/>
          <point xsi:type="esdl:Point" lat="53.06723664736971" lon="5.907334209650283"/>
          <point xsi:type="esdl:Point" lat="53.09630850989911" lon="5.92724839114775"/>
          <point xsi:type="esdl:Point" lat="53.10846750576822" lon="5.978750584675687"/>
          <point xsi:type="esdl:Point" lat="53.14430622767345" lon="5.976690496934573"/>
          <point xsi:type="esdl:Point" lat="53.16119644395027" lon="6.0082630091528895"/>
          <point xsi:type="esdl:Point" lat="53.175589550497925" lon="6.065833645558989"/>
          <point xsi:type="esdl:Point" lat="53.19525026463133" lon="6.098840224985371"/>
          <point xsi:type="esdl:Point" lat="53.22937283342449" lon="6.165793076571676"/>
          <point xsi:type="esdl:Point" lat="53.25761638202658" lon="6.255714946748175"/>
          <point xsi:type="esdl:Point" lat="53.28207050253686" lon="6.307078046746858"/>
          <point xsi:type="esdl:Point" lat="53.286174761645015" lon="6.4087090419753086"/>
          <point xsi:type="esdl:Point" lat="53.28248094618691" lon="6.442357141746853"/>
          <point xsi:type="esdl:Point" lat="53.28576435347325" lon="6.522013867736722"/>
          <point xsi:type="esdl:Point" lat="53.29315109746162" lon="6.532314306442301"/>
          <point xsi:type="esdl:Point" lat="53.286991528529086" lon="6.588823928258815"/>
          <point xsi:type="esdl:Point" lat="53.29027458923527" lon="6.645132993182675"/>
          <point xsi:type="esdl:Point" lat="53.28083510971852" lon="6.669167350162374"/>
          <point xsi:type="esdl:Point" lat="53.25455775631214" lon="6.711055800898423"/>
          <point xsi:type="esdl:Point" lat="53.23483914207766" lon="6.704188841761343"/>
          <point xsi:type="esdl:Point" lat="53.21983869706613" lon="6.748824076152201"/>
          <point xsi:type="esdl:Point" lat="53.20758656760504" lon="6.749614100068808"/>
          <point xsi:type="esdl:Point" lat="53.208717244482635" lon="6.778283654465996"/>
          <point xsi:type="esdl:Point" lat="53.188669003340884" lon="6.824120606705844"/>
          <point xsi:type="esdl:Point" lat="53.17039940349216" lon="6.828033530157619"/>
          <point xsi:type="esdl:Point" lat="53.15434722397989" lon="6.826488464351761"/>
          <point xsi:type="esdl:Point" lat="53.15019351038124" lon="6.845684051513673"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="72ab487b-4903-4fcb-95ae-8cc61fec18d5" name="In" connectedTo="c57cd03d-5e35-49e0-8e56-f171249aa668" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="51f0d172-3db5-4405-a99f-ae69e3e5f07a" name="Out" connectedTo="891ccb9a-539d-40e2-8210-18dbc130d809" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="f1ba5abf-5b3a-4ccd-89ee-b705d52b10e6" name="HeatingDemand_Borselle" power="1000000000.0">
        <geometry xsi:type="esdl:Point" lat="51.44543476529252" lon="3.7150310317131168"/>
        <port xsi:type="esdl:InPort" id="0b954cfd-6395-4b16-b88b-2aa4bac593bb" name="In" connectedTo="d9d79219-b01c-4c7d-a7ae-10de8037510d" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:OutPort" id="7ad00229-1c17-42de-8d34-e969c82cd103" name="Out" connectedTo="75c103de-ac5d-4cb4-9ee1-bab7fa47b7e4" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" id="45587df1-f52b-458c-b0ab-518b4c9aee48" name="GasHeater_Borselle" power="1000000000.0" efficiency="0.85">
        <geometry xsi:type="esdl:Point" lat="51.439082208362755" lon="3.7103743108417673"/>
        <port xsi:type="esdl:InPort" id="8e5b657c-f3b6-4bac-9fb0-e26120e32149" name="In" connectedTo="e2c2271d-250c-45ef-b1e1-2d1ae6d6dc80" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="697cb5e5-1c56-4033-a2fd-b34af828b182" name="HeatOut" connectedTo="d85c1037-cb22-42d4-9320-32f2af384987" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:InPort" id="56344f7b-493a-47e6-b0f2-0dea25881a63" name="HeatIn" connectedTo="fdf0ec3c-ef44-4852-b8fe-5d9c117582ef" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <costInformation xsi:type="esdl:CostInformation" id="c2bfad8b-4e38-4ca2-a24f-292f9f514234">
          <investmentCosts xsi:type="esdl:SingleValue" id="ade266f8-a876-4235-bf05-c8db7c73ae8b" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="ab3f3f37-e31c-4ffa-91b6-78abf6e4e5f5" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="1df73877-23c2-4042-a8dd-53a4a522c963" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="9f0b9f0d-f02b-45ff-9b4f-1b1dab3d1f49" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="39bc920d-8c55-4686-af44-dbecca49056f" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="8f3d5553-02e6-47be-89a0-2efc8d24c786" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="84387396-8476-43af-954f-d744d93f36d4" name="Joint_8438">
        <geometry xsi:type="esdl:Point" lat="51.440607523464486" lon="3.7083149357307663"/>
        <port xsi:type="esdl:InPort" id="d85c1037-cb22-42d4-9320-32f2af384987" name="In" connectedTo="697cb5e5-1c56-4033-a2fd-b34af828b182 e935019d-df28-4166-be67-8b724deaf477" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:OutPort" id="d9d79219-b01c-4c7d-a7ae-10de8037510d" name="Out" connectedTo="0b954cfd-6395-4b16-b88b-2aa4bac593bb" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="34c7653e-02b7-4c02-b7bc-575716fed02c" name="Joint_34c7">
        <geometry xsi:type="esdl:Point" lat="51.44313441701449" lon="3.7246454823788038"/>
        <port xsi:type="esdl:InPort" id="75c103de-ac5d-4cb4-9ee1-bab7fa47b7e4" name="In" connectedTo="7ad00229-1c17-42de-8d34-e969c82cd103" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="fdf0ec3c-ef44-4852-b8fe-5d9c117582ef" name="Out" connectedTo="56344f7b-493a-47e6-b0f2-0dea25881a63 92b3cf63-3a84-46b1-a13e-c9914600c778" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="b2354298-4f37-4cce-8127-5ad32ef4c6f4" name="HeatingDemand_Maasbracht" power="5000000000.0">
        <geometry xsi:type="esdl:Point" lat="51.1209802086605" lon="5.8715035432348825"/>
        <port xsi:type="esdl:InPort" id="7506381b-94f1-434e-8108-c20b21919503" name="In" connectedTo="4bcfaeec-5a2b-4c27-acbd-4f87c8472c1f" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:OutPort" id="7d388fdf-76b1-4bc2-ae44-2be52b10e7e7" name="Out" connectedTo="76764c8c-6b11-4c3e-a2aa-0cb239c9dc2a" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" id="aaa16ac5-b8a5-49a6-81d5-b9779b081575" name="GasHeater_Maasbracht" power="5000000000.0" efficiency="0.85">
        <geometry xsi:type="esdl:Point" lat="51.11365575020616" lon="5.901031647215259"/>
        <port xsi:type="esdl:InPort" id="a33b4acf-79e9-4d89-af1e-5548bf04111d" name="In" connectedTo="12bc506a-b104-49f0-9d7f-0e37ea206c23" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="725bab4e-b2bd-4337-abe0-fd7316c03952" name="OutHeat" connectedTo="d50b436d-7aa6-4281-88ce-a1fb005e66a1" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:InPort" id="fb4dc2f9-bfde-49aa-9675-7035db7ec29e" name="InHeat" connectedTo="a7eebbd3-73a1-420b-8f86-b06d9b40e421" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <costInformation xsi:type="esdl:CostInformation" id="daad23bc-6d8e-4766-8dc8-cf40f2ea1b37">
          <investmentCosts xsi:type="esdl:SingleValue" id="9b4d6f5a-7eb2-4fd6-bf34-d9dd6b9f32e8" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="ee8ebf3e-a8c4-4fa6-b7e6-3f6adc2542b0" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="bf510a94-e851-44fd-b231-0df694b02b05" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="ef8936de-7f26-407f-a601-97685f4fa738" unit="EURO"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="d1bc986e-bf53-4ec2-aff2-8aa4952eed61" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="d5060abc-2571-437a-a335-0f6554e60498" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="8b16281d-c411-4b13-be0e-7969c2ab530d" name="Joint_8b16">
        <geometry xsi:type="esdl:Point" lat="51.12545033883683" lon="5.882747682330814"/>
        <port xsi:type="esdl:InPort" id="76764c8c-6b11-4c3e-a2aa-0cb239c9dc2a" name="In" connectedTo="7d388fdf-76b1-4bc2-ae44-2be52b10e7e7" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="a7eebbd3-73a1-420b-8f86-b06d9b40e421" name="Out" connectedTo="fb4dc2f9-bfde-49aa-9675-7035db7ec29e a7801285-d462-4687-b8a1-cacac20c3302" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="2fa74704-e6c9-460f-b3df-170be0eb68e8" name="Joint_2fa7">
        <geometry xsi:type="esdl:Point" lat="51.11327594173972" lon="5.881546792552875"/>
        <port xsi:type="esdl:InPort" id="d50b436d-7aa6-4281-88ce-a1fb005e66a1" name="In" connectedTo="725bab4e-b2bd-4337-abe0-fd7316c03952 2d7109f5-b6b6-4e40-8e1c-850d17784828" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:OutPort" id="4bcfaeec-5a2b-4c27-acbd-4f87c8472c1f" name="Out" connectedTo="7506381b-94f1-434e-8108-c20b21919503" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" id="a402aed6-d119-4354-9bb4-646af3b776ce" name="GasHeater_Vlaardingen" power="1000000000.0" efficiency="0.85">
        <geometry xsi:type="esdl:Point" lat="51.90403647294035" lon="4.33028572318762"/>
        <port xsi:type="esdl:InPort" id="46ddab80-b152-483a-abdf-2440b95370a8" name="In" connectedTo="59f30765-1570-4cb5-8c1f-bdf7220f3180" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="37d59959-0e2a-48ec-8faf-7b29eb5ec686" name="OutHeat" connectedTo="6ad75916-f582-4e25-86f4-949e76af2768" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:InPort" id="47133502-87f7-4157-936e-8f0efa234770" name="InHeat" connectedTo="92b583d5-05d6-4197-bc77-c88fad8b2f45" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <costInformation xsi:type="esdl:CostInformation" id="1afda3d0-6794-4e60-be1e-cb4bb85feb57">
          <investmentCosts xsi:type="esdl:SingleValue" id="4b4306d6-ccb5-4331-8507-779793335b82" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="e6254215-68bd-493e-8e97-f4165db08058" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="a0013bed-2d81-4b4a-9b24-adf1ab24689c" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="73a1c586-2d41-4e56-b8b6-f78873c98090" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="219e01f5-464a-4c99-b30e-0a539d081efb" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="c3b171c6-e9f5-4a83-a197-c0ae4c55222d" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="0907a1ef-96ab-4398-80c1-8478d25f9988" name="HeatingDemand_Vlaardingen" power="1000000000.0">
        <geometry xsi:type="esdl:Point" lat="51.907637256512366" lon="4.334192684200012"/>
        <port xsi:type="esdl:InPort" id="02d6995d-1a3a-4636-a0da-a246e9895b10" name="In" connectedTo="6706bf1b-6af6-41eb-a803-86558980e6e6" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:OutPort" id="11403709-287a-4537-9972-eed1e94a5c7e" name="Out" connectedTo="4f05c4f8-0059-48b0-92b8-a8fa4d39f94e" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="36f1c799-370e-4cd1-bef8-e51cd74ed4e0" name="Joint_36f1">
        <geometry xsi:type="esdl:Point" lat="51.90567810148599" lon="4.329300181882214"/>
        <port xsi:type="esdl:InPort" id="6ad75916-f582-4e25-86f4-949e76af2768" name="In" connectedTo="37d59959-0e2a-48ec-8faf-7b29eb5ec686 9c9fb16d-1a88-4af6-9d85-88e28a6d37d2" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:OutPort" id="6706bf1b-6af6-41eb-a803-86558980e6e6" name="Out" connectedTo="02d6995d-1a3a-4636-a0da-a246e9895b10" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="f4e01da6-698c-49d5-a0fd-9ad5b1a0fa11" name="Joint_f4e0">
        <geometry xsi:type="esdl:Point" lat="51.90599582928759" lon="4.3373682091960095"/>
        <port xsi:type="esdl:InPort" id="4f05c4f8-0059-48b0-92b8-a8fa4d39f94e" name="In" connectedTo="11403709-287a-4537-9972-eed1e94a5c7e" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="92b583d5-05d6-4197-bc77-c88fad8b2f45" name="Out" connectedTo="47133502-87f7-4157-936e-8f0efa234770 a19951fa-43bf-4075-adc9-48f5d37099ce" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" id="16b0e014-7aeb-4fe8-8242-f630a908d9c6" name="GasHeater_Eemshaven" power="1000000000.0" efficiency="0.85">
        <geometry xsi:type="esdl:Point" lat="53.324001727671686" lon="6.845598111286218"/>
        <port xsi:type="esdl:InPort" id="95b248fc-98d0-486b-bcab-c02f23d655cd" name="In" connectedTo="24e8fa52-e5f5-4935-ab65-fb769cb391ba" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="bd1bae00-a7eb-4179-b03d-bd82eb43b990" name="OutHeat" connectedTo="c678cd62-ad68-4a8e-af80-fb16e54b8239" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:InPort" id="4adfeec3-0c73-47b2-ab2b-1380b6ae5985" name="InHeat" connectedTo="252a6721-97cb-44a5-a3e1-f34936d8886e" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <costInformation xsi:type="esdl:CostInformation" id="e5fed50e-ac9d-4b64-b4d2-11d63d8c92b1">
          <investmentCosts xsi:type="esdl:SingleValue" id="1e804899-c251-4966-82c3-2b59bca65e29" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="7f3738de-d8b6-4d36-9ad1-115dbdefba06" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="01167105-5d3f-4146-8f10-a3799940f16f" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="8f888527-3f71-4d4a-ae91-2f3e89253fd4" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="55b54268-63a6-4df8-8b1b-65d1f5562be9" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="4683b902-0098-405b-8b02-810717f80b83" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="d0a4edc2-5ebd-40b1-b7d2-8edee5a4dc68" name="Joint_d0a4">
        <geometry xsi:type="esdl:Point" lat="53.32492278207696" lon="6.85418132440471"/>
        <port xsi:type="esdl:InPort" id="c678cd62-ad68-4a8e-af80-fb16e54b8239" name="In" connectedTo="bd1bae00-a7eb-4179-b03d-bd82eb43b990 47290dd9-4fe7-4a77-b455-ca6fd369f696" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:OutPort" id="156a83a5-d9c3-426e-88ba-4bdc8b985ddf" name="Out" connectedTo="792f3332-47f3-48c0-abff-f024003b9a78" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="145ad697-41da-455b-9dcc-4202c1f794af" name="Joint_145a">
        <geometry xsi:type="esdl:Point" lat="53.313055177191536" lon="6.854610667536556"/>
        <port xsi:type="esdl:InPort" id="25b702cb-19e2-4096-bdab-fe6c692defc6" name="In" connectedTo="3e962a3c-6ef9-40ce-976d-2e7ad18274b5" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="252a6721-97cb-44a5-a3e1-f34936d8886e" name="Out" connectedTo="4adfeec3-0c73-47b2-ab2b-1380b6ae5985 e7608003-9e1d-4b92-a06a-b6ef6c722336" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="3456da19-512c-4d26-98fe-c56603a1d65e" name="HeatingDemand_Eemshaven" power="1000000000.0">
        <geometry xsi:type="esdl:Point" lat="53.319556855434676" lon="6.859674696858434"/>
        <port xsi:type="esdl:InPort" id="792f3332-47f3-48c0-abff-f024003b9a78" name="In" connectedTo="156a83a5-d9c3-426e-88ba-4bdc8b985ddf" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:OutPort" id="3e962a3c-6ef9-40ce-976d-2e7ad18274b5" name="Out" connectedTo="25b702cb-19e2-4096-bdab-fe6c692defc6" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" id="9b5fa023-45e2-4195-956b-190772dc43ea" name="HeatingDemand_Beverwijk" power="1000000000.0">
        <geometry xsi:type="esdl:Point" lat="52.47232670070793" lon="4.653439026192467"/>
        <port xsi:type="esdl:InPort" id="8fefa257-db7b-41ac-9286-fe983c69938d" name="In" connectedTo="e176aa4c-c4af-4818-8a1a-0c785a46bf58" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:OutPort" id="c2d5a6c5-18b8-408b-845b-369deae0f428" name="Out" connectedTo="be4abc09-d07b-483e-9fb4-160de524b115" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" id="8d53ecb7-6ef9-459f-acd6-5612b3b1a36c" name="GasHeater_Beverwijk" power="1000000000.0" efficiency="0.85">
        <geometry xsi:type="esdl:Point" lat="52.46931788245804" lon="4.666142522461106"/>
        <port xsi:type="esdl:InPort" id="e1cd46e1-44eb-43c7-a8f1-a30f64e793be" name="In" connectedTo="fe27bbf9-ad48-4b46-a06f-db464ce8685d" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="a18a726f-9087-4412-b802-b08e9d37a796" name="OutHeat" connectedTo="7b17d78f-b595-45ce-adc3-46cd7ea0a9ab" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:InPort" id="5703bfff-130d-4e8c-93dc-6c64b8a265af" name="InHeat" connectedTo="c9303b3a-0d29-4831-89c8-7c523783d21d" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <costInformation xsi:type="esdl:CostInformation" id="4fdfaaab-5504-4304-abf8-290bf2e2d99a">
          <investmentCosts xsi:type="esdl:SingleValue" id="3a7b166d-320c-435d-bcbc-c9c6e4fa7c8e" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="585ed7ba-3f77-400d-b61d-fb6db7049068" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="3456bc3b-9ea5-44b2-a524-e2b1e5433c71" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="12e20d4f-a5ab-4791-a715-a5b43b4f0952" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="6fb2a4f0-6be5-4b86-af8f-1d6f0d8c4750" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="55fdde98-5153-437c-a55c-f94ff06a8dfa" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="46161169-6f28-4e74-87af-723abd15788b" name="Joint_4616">
        <geometry xsi:type="esdl:Point" lat="52.46967310587156" lon="4.65925431515788"/>
        <port xsi:type="esdl:InPort" id="7b17d78f-b595-45ce-adc3-46cd7ea0a9ab" name="In" connectedTo="a18a726f-9087-4412-b802-b08e9d37a796 c92024b1-35e0-473a-a02e-903f912fb7ae" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <port xsi:type="esdl:OutPort" id="e176aa4c-c4af-4818-8a1a-0c785a46bf58" name="Out" connectedTo="8fefa257-db7b-41ac-9286-fe983c69938d" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="90861702-0234-4d26-9045-e8c3d3969acc" name="Joint_9086">
        <geometry xsi:type="esdl:Point" lat="52.47554126186934" lon="4.66013401492647"/>
        <port xsi:type="esdl:InPort" id="be4abc09-d07b-483e-9fb4-160de524b115" name="In" connectedTo="c2d5a6c5-18b8-408b-845b-369deae0f428" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="c9303b3a-0d29-4831-89c8-7c523783d21d" name="Out" connectedTo="5703bfff-130d-4e8c-93dc-6c64b8a265af 107f6208-ccdf-4ffc-939a-478716504082" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="c564348e-ea17-4967-b0cc-ed5d017e77f0" name="Pipe_c564" innerDiameter="1.194" outerDiameter="1.4" diameter="DN1000" length="96714.45">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="71b62f3e-049d-4f3a-9a75-ac6c0dd9bf50">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="303577c0-b204-4f50-8aae-e54eae034da0" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="5b3b5b1e-ddce-4c82-b43a-16b03577a143"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0125">
            <matter xsi:type="esdl:Material" name="steel" id="00ea5714-14d4-40cd-a326-2c083a737d0d" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.078">
            <matter xsi:type="esdl:Material" name="PUR" id="1cd60ec8-d9da-4aad-a4d0-f20b49fe0f0a" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0125">
            <matter xsi:type="esdl:Material" name="HDPE" id="6a9e4795-6b77-4958-8eb5-df8f776cfce3" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.784409121571045" lon="5.665512084960938"/>
          <point xsi:type="esdl:Point" lat="51.76481597752518" lon="5.672392775449634"/>
          <point xsi:type="esdl:Point" lat="51.75770283844893" lon="5.687000546572275"/>
          <point xsi:type="esdl:Point" lat="51.74479738313155" lon="5.692349146518376"/>
          <point xsi:type="esdl:Point" lat="51.74299083854042" lon="5.709516544360995"/>
          <point xsi:type="esdl:Point" lat="51.73385074115318" lon="5.716211829519643"/>
          <point xsi:type="esdl:Point" lat="51.725134042709136" lon="5.713980067800094"/>
          <point xsi:type="esdl:Point" lat="51.6837515530997" lon="5.7443662233653745"/>
          <point xsi:type="esdl:Point" lat="51.661732198304655" lon="5.742542564158329"/>
          <point xsi:type="esdl:Point" lat="51.637651653869774" lon="5.750435610303369"/>
          <point xsi:type="esdl:Point" lat="51.61804828187927" lon="5.770349791800836"/>
          <point xsi:type="esdl:Point" lat="51.61399870401693" lon="5.790607321255129"/>
          <point xsi:type="esdl:Point" lat="51.59520664892752" lon="5.820064190252153"/>
          <point xsi:type="esdl:Point" lat="51.57473162738154" lon="5.838948327879063"/>
          <point xsi:type="esdl:Point" lat="51.560222904309214" lon="5.871738057758523"/>
          <point xsi:type="esdl:Point" lat="51.55008538770392" lon="5.873798145499639"/>
          <point xsi:type="esdl:Point" lat="51.54634994360683" lon="5.890278847428565"/>
          <point xsi:type="esdl:Point" lat="51.53354037823009" lon="5.905042809573242"/>
          <point xsi:type="esdl:Point" lat="51.50993416475051" lon="5.910020775279806"/>
          <point xsi:type="esdl:Point" lat="51.49059622915776" lon="5.930278304734138"/>
          <point xsi:type="esdl:Point" lat="51.47455551037878" lon="5.928040431300055"/>
          <point xsi:type="esdl:Point" lat="51.453063612929355" lon="5.946752894948531"/>
          <point xsi:type="esdl:Point" lat="51.439250606184075" lon="5.947432987690254"/>
          <point xsi:type="esdl:Point" lat="51.38883409753072" lon="5.985029588965639"/>
          <point xsi:type="esdl:Point" lat="51.3848712093687" lon="5.997046767455467"/>
          <point xsi:type="esdl:Point" lat="51.3724259302305" lon="6.008369840365325"/>
          <point xsi:type="esdl:Point" lat="51.36599714799455" lon="6.008884862300624"/>
          <point xsi:type="esdl:Point" lat="51.36171079171574" lon="6.019185301006202"/>
          <point xsi:type="esdl:Point" lat="51.35549486251234" lon="6.029485739711782"/>
          <point xsi:type="esdl:Point" lat="51.332767392797855" lon="6.039957852395794"/>
          <point xsi:type="esdl:Point" lat="51.329228612500295" lon="6.051631682928798"/>
          <point xsi:type="esdl:Point" lat="51.303805710970124" lon="6.075666039908497"/>
          <point xsi:type="esdl:Point" lat="51.295664059651656" lon="6.091687640825057"/>
          <point xsi:type="esdl:Point" lat="51.2754837699779" lon="6.114005258020506"/>
          <point xsi:type="esdl:Point" lat="51.242653471369195" lon="6.070858332062343"/>
          <point xsi:type="esdl:Point" lat="51.21744954839809" lon="6.0652540822424115"/>
          <point xsi:type="esdl:Point" lat="51.17593541459004" lon="6.074867825034298"/>
          <point xsi:type="esdl:Point" lat="51.16818770582331" lon="6.080018044387089"/>
          <point xsi:type="esdl:Point" lat="51.15936234085617" lon="6.072464389336317"/>
          <point xsi:type="esdl:Point" lat="51.15871651614673" lon="6.058387123105372"/>
          <point xsi:type="esdl:Point" lat="51.152688382887376" lon="6.051176816011426"/>
          <point xsi:type="esdl:Point" lat="51.141090529106854" lon="6.019363749824285"/>
          <point xsi:type="esdl:Point" lat="51.13290617515359" lon="6.007689919291282"/>
          <point xsi:type="esdl:Point" lat="51.12385862231462" lon="5.980908778656776"/>
          <point xsi:type="esdl:Point" lat="51.10834440798819" lon="5.955501029849653"/>
          <point xsi:type="esdl:Point" lat="51.09096174210558" lon="5.910025701342004"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4753e5ff-f195-4eea-8683-d780e0a6448e" name="In" connectedTo="e82f61af-ba6d-4cbe-bfe0-318f3dd038ac" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="12bc506a-b104-49f0-9d7f-0e37ea206c23" name="Out" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="a33b4acf-79e9-4d89-af1e-5548bf04111d"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="3fe0eb0f-dd03-419a-9dda-fe9b34a89c43" name="HeatPump_Maasbracht" power="5000000000.0" COP="2.0">
        <geometry xsi:type="esdl:Point" lat="51.125287423483215" lon="5.901375582267737"/>
        <port xsi:type="esdl:InPort" id="20967b74-36af-42ed-99cc-b2f6789fcdd9" name="In" connectedTo="955c2d5b-812d-4156-aaf7-29389009ab48" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:InPort" id="a7801285-d462-4687-b8a1-cacac20c3302" name="InPort_sec" connectedTo="a7eebbd3-73a1-420b-8f86-b06d9b40e421" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="2d7109f5-b6b6-4e40-8e1c-850d17784828" name="OutPort_sec" connectedTo="d50b436d-7aa6-4281-88ce-a1fb005e66a1" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <costInformation xsi:type="esdl:CostInformation" id="44c1a807-c9ea-49f7-a654-f4da87865086">
          <investmentCosts xsi:type="esdl:SingleValue" id="ed9e2015-65bc-4d14-9740-87bcc0c84482" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="16f7e3ec-9de2-481c-aa96-3e369939907d" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="4e4e6426-4e1f-4399-be0b-4a37cc12004f" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="f9aea887-d774-4004-9282-3d3f92d53fd8" unit="EURO"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="45c1831a-13c0-48bd-ab1d-ca98d1c396ca" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MWh" id="d068d132-44a8-4b09-9f58-d9d82d111220" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="9cb95c2e-e791-4258-b91c-b44810df3258" name="HeatPump_Borselle" power="1000000000.0" COP="2.0">
        <geometry xsi:type="esdl:Point" lat="51.44074063852936" lon="3.7245367754493057"/>
        <port xsi:type="esdl:InPort" id="4491bcc1-e7f4-4573-9a69-d25f46b920bb" name="In" connectedTo="20b09136-bbd4-48f0-b104-641f7e46b519" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:InPort" id="92b3cf63-3a84-46b1-a13e-c9914600c778" name="InPort_sec" connectedTo="fdf0ec3c-ef44-4852-b8fe-5d9c117582ef" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="e935019d-df28-4166-be67-8b724deaf477" name="OutPort_sec" connectedTo="d85c1037-cb22-42d4-9320-32f2af384987" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <costInformation xsi:type="esdl:CostInformation" id="3a4e39bf-d560-4e39-ae68-ffc473d3cbae">
          <investmentCosts xsi:type="esdl:SingleValue" id="45bd496d-e8bc-4f71-a773-edf3bf109dfb" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="23da1ca4-4ee1-4c89-a93e-d4d8a91f2311" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="d49ac517-bcaf-4aab-b4eb-635f742411c0" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="5030e10b-f5a0-401b-ae9b-dc67a4cda8b7" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="b17c7109-5fe2-435a-b33c-66dbfbb63032" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="bc81bc18-a1d5-4a0b-b117-d892c3c5c412" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="78efcf8f-4013-41a5-9c00-91f2efc02363" name="HeatPump_Vlaardingen" power="1000000000.0" COP="2.0">
        <geometry xsi:type="esdl:Point" lat="51.903930977297634" lon="4.336424766836773"/>
        <port xsi:type="esdl:InPort" id="bcf9b55c-7ec4-4c11-9c8f-e51aa0fbc92c" name="In" connectedTo="08fbd854-cb11-44f6-a470-26cc4c04463d" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:InPort" id="a19951fa-43bf-4075-adc9-48f5d37099ce" name="InPort_sec" connectedTo="92b583d5-05d6-4197-bc77-c88fad8b2f45" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="9c9fb16d-1a88-4af6-9d85-88e28a6d37d2" name="OutPort_sec" connectedTo="6ad75916-f582-4e25-86f4-949e76af2768" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <costInformation xsi:type="esdl:CostInformation" id="2a7d588d-5dba-4712-9dc7-6b9d96f375d9">
          <investmentCosts xsi:type="esdl:SingleValue" id="aaccd027-0d05-45e7-bb6f-ca487d0d17c6" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="229172bf-8aef-46f2-916e-c5c064cf49ad" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="c7203909-d296-42b7-aa54-387fe76006ca" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="394ecb1d-bcd1-4f2c-a8d3-9151fdd9b461" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="a0a59830-8506-4ff2-960a-eb5fd5026307" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="8bb963cf-8861-4b82-876c-9dfdd4590747" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="b6128ef5-5ea3-4227-8a37-2049b1fb95ca" name="HeatPump_Beverwijk" power="1000000000.0" COP="2.0">
        <geometry xsi:type="esdl:Point" lat="52.47483563616666" lon="4.667816031196934"/>
        <port xsi:type="esdl:InPort" id="dfee21ff-6b6e-4548-b019-ea6e9e0051a2" name="In" connectedTo="c9391ab3-32b5-4700-bf66-9c77feb9a9e9" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:InPort" id="107f6208-ccdf-4ffc-939a-478716504082" name="InPort_sec" connectedTo="c9303b3a-0d29-4831-89c8-7c523783d21d" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="c92024b1-35e0-473a-a02e-903f912fb7ae" name="OutPort_sec" connectedTo="7b17d78f-b595-45ce-adc3-46cd7ea0a9ab" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <costInformation xsi:type="esdl:CostInformation" id="c073b3d6-8b94-4643-81d4-0b92ff77a80b">
          <investmentCosts xsi:type="esdl:SingleValue" id="e4273bcf-803f-49ec-8ccb-0f61f3d89cad" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="cd34e1d9-be55-420e-aa12-06bf0e5a975f" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="806804ed-ebd4-427d-b09a-fbc7760d2788" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="3775b22e-22d6-4e01-af99-d97840a35cce" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="bb5831e3-aa3e-40f3-a858-7790dcf11302" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="ed82d43f-f285-4a63-8ceb-6c0ae8c50c27" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="a21dd43d-92c2-4102-a5dd-f1c46e2d0495" name="HeatPump_Eemshaven" power="1000000000.0" COP="2.0">
        <geometry xsi:type="esdl:Point" lat="53.31405481404398" lon="6.846027294117093"/>
        <port xsi:type="esdl:InPort" id="d8aa7e02-00ba-4673-ab85-0c290f73e802" name="In" connectedTo="67f19ca1-8b4e-42e4-a93e-c76a52bf55a2" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:InPort" id="e7608003-9e1d-4b92-a06a-b6ef6c722336" name="InPort_sec" connectedTo="252a6721-97cb-44a5-a3e1-f34936d8886e" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="47290dd9-4fe7-4a77-b455-ca6fd369f696" name="OutPort_sec" connectedTo="c678cd62-ad68-4a8e-af80-fb16e54b8239" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <costInformation xsi:type="esdl:CostInformation" id="aa39038c-a557-48b3-9df0-7b60f3ff7b87">
          <investmentCosts xsi:type="esdl:SingleValue" id="17cdbd28-abb1-4bc9-b29f-e4eff4aba05d" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="bc16d3ee-4f3b-430b-8ec7-23f5eb47333e" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="04e0f75f-5b5a-4b90-a3ec-c08fc4bb9bd5" value="1.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="7091f7a4-044f-4e50-ab73-c35326fe6d16" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="2c129c71-e835-44c0-a05b-4ef2979d5039" value="100.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="a5506689-d011-481a-bcd7-4fc9074af883" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="eed56080-a834-4a72-a51f-449996fadc14" name="Pipe_drc" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="92898.4">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="aae175d0-5ab6-46b7-9703-8ce35c96da6d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="5271c996-fda1-4189-b26e-3c74c93d3783" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="70ae3d6f-0186-48c7-8b1a-dde64b71a830"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.011">
            <matter xsi:type="esdl:Material" name="steel" id="a0c06d1a-4353-4987-ad69-647d610f2af5" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.081">
            <matter xsi:type="esdl:Material" name="PUR" id="aab1e5a5-7dd2-41d4-8701-746b2aed68b6" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.011">
            <matter xsi:type="esdl:Material" name="HDPE" id="e675e39e-6cce-486d-957e-068b7f326874" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.784409121571045" lon="5.665512084960938"/>
          <point xsi:type="esdl:Point" lat="51.78068962750752" lon="5.653224149421888"/>
          <point xsi:type="esdl:Point" lat="51.7758053062457" lon="5.600855198680109"/>
          <point xsi:type="esdl:Point" lat="51.77506199361704" lon="5.600855198680109"/>
          <point xsi:type="esdl:Point" lat="51.755094159834556" lon="5.574756574048157"/>
          <point xsi:type="esdl:Point" lat="51.74478815301159" lon="5.573898066658939"/>
          <point xsi:type="esdl:Point" lat="51.74160025211094" lon="5.5577581277418195"/>
          <point xsi:type="esdl:Point" lat="51.72470062174811" lon="5.553637292273602"/>
          <point xsi:type="esdl:Point" lat="51.68541746605967" lon="5.481217508617093"/>
          <point xsi:type="esdl:Point" lat="51.68626865167468" lon="5.457866107630634"/>
          <point xsi:type="esdl:Point" lat="51.63942967464109" lon="5.393306351962077"/>
          <point xsi:type="esdl:Point" lat="51.60107085445523" lon="5.356218832748239"/>
          <point xsi:type="esdl:Point" lat="51.579746386619206" lon="5.356218832748239"/>
          <point xsi:type="esdl:Point" lat="51.5678003119773" lon="5.33561465540723"/>
          <point xsi:type="esdl:Point" lat="51.562679604579074" lon="5.2985271361933926"/>
          <point xsi:type="esdl:Point" lat="51.5448668646769" lon="5.277650854744458"/>
          <point xsi:type="esdl:Point" lat="51.53269810930425" lon="5.270439392675117"/>
          <point xsi:type="esdl:Point" lat="51.8544424245821" lon="4.758453369140626"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="18a98e0f-bb3d-4c49-9550-02e6080eac78" name="In" connectedTo="e82f61af-ba6d-4cbe-bfe0-318f3dd038ac" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="61b04bd4-8a71-4fee-9636-83b2d65d6e9c" name="Out" connectedTo="4d862b35-fb77-4da3-990d-6620362fa1f0" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="8a9da466-2204-45d6-84ff-df33a2020c3f" name="ElectricityCable_drc" length="112642.4" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.148905672879316" lon="5.918562412261964"/>
          <point xsi:type="esdl:Point" lat="51.153529239327284" lon="5.900566178223428"/>
          <point xsi:type="esdl:Point" lat="51.16848941601579" lon="5.89404152206543"/>
          <point xsi:type="esdl:Point" lat="51.177204979599736" lon="5.884082836350598"/>
          <point xsi:type="esdl:Point" lat="51.24430988522262" lon="5.841036837157103"/>
          <point xsi:type="esdl:Point" lat="51.2587036158103" lon="5.8276441218854345"/>
          <point xsi:type="esdl:Point" lat="51.30755409434941" lon="5.806487442769175"/>
          <point xsi:type="esdl:Point" lat="51.323121810676305" lon="5.775424833920147"/>
          <point xsi:type="esdl:Point" lat="51.36750120946551" lon="5.743488359041581"/>
          <point xsi:type="esdl:Point" lat="51.39422311648712" lon="5.744844470621731"/>
          <point xsi:type="esdl:Point" lat="51.4079275821137" lon="5.707756951407894"/>
          <point xsi:type="esdl:Point" lat="51.43618007492948" lon="5.700888892294223"/>
          <point xsi:type="esdl:Point" lat="51.458427314899616" lon="5.60885690017099"/>
          <point xsi:type="esdl:Point" lat="51.45199408835497" lon="5.560845225464753"/>
          <point xsi:type="esdl:Point" lat="51.448678614073145" lon="5.550543136794248"/>
          <point xsi:type="esdl:Point" lat="51.447288182237" lon="5.538352331867471"/>
          <point xsi:type="esdl:Point" lat="51.45413297624933" lon="5.5270200343299125"/>
          <point xsi:type="esdl:Point" lat="51.49688969215998" lon="5.5062441555110695"/>
          <point xsi:type="esdl:Point" lat="51.49988116147171" lon="5.496800574229745"/>
          <point xsi:type="esdl:Point" lat="51.49891963917679" lon="5.4816908441796794"/>
          <point xsi:type="esdl:Point" lat="51.51070217714095" lon="5.450347172469507"/>
          <point xsi:type="esdl:Point" lat="51.52287681200718" lon="5.440045083799002"/>
          <point xsi:type="esdl:Point" lat="51.528429073531214" lon="5.396089505471493"/>
          <point xsi:type="esdl:Point" lat="51.52180899178695" lon="5.335650585271155"/>
          <point xsi:type="esdl:Point" lat="51.53312661217682" lon="5.293068618766372"/>
          <point xsi:type="esdl:Point" lat="51.530592517568664" lon="5.1720177706121735"/>
          <point xsi:type="esdl:Point" lat="51.54382916468032" lon="5.137677475043825"/>
          <point xsi:type="esdl:Point" lat="51.57967686292025" lon="5.121880939082378"/>
          <point xsi:type="esdl:Point" lat="51.59588439617499" lon="5.099903149918604"/>
          <point xsi:type="esdl:Point" lat="51.62231585467775" lon="5.001689904593083"/>
          <point xsi:type="esdl:Point" lat="51.65299114155604" lon="4.987953786365705"/>
          <point xsi:type="esdl:Point" lat="51.66534060427622" lon="4.959107938088302"/>
          <point xsi:type="esdl:Point" lat="51.676409675252714" lon="4.865702334142301"/>
          <point xsi:type="esdl:Point" lat="51.69431085501201" lon="4.844708671398524"/>
          <point xsi:type="esdl:Point" lat="51.70129597084116" lon="4.83276128768921"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f5d6471c-6ec2-47e7-802c-0da25adac0bf" name="In" connectedTo="955c2d5b-812d-4156-aaf7-29389009ab48" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="41c012bf-50c7-4f00-aa03-4b9e3239f461" name="Out" connectedTo="de8ec129-3b85-4bfd-a3b6-fde46f6d7c42" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="780ceda6-ee60-4fdb-837f-96ca662e7f3d">
          <investmentCosts xsi:type="esdl:SingleValue" id="0fd30b9c-d751-44e8-a64e-025acc1f4184" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="3cbe2188-0315-4a1b-b3b3-58e88513e488" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="a573cef3-98b8-4d55-bd61-c1af3afb90bb" diameter="DN1000" length="12488.62" name="Pipe_a573">
        <port xsi:type="esdl:InPort" id="612d8006-ca77-439e-b2d8-9d82aa733bdc" name="In" connectedTo="6c2d6ca3-8725-4665-9763-9b4090dfd6a8" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="d743df35-2416-452a-a4a8-6589b5c95d3b" name="Out" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="435e389a-e4a4-460b-985f-cbb7067cb69d"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.435428495083535" lon="6.8561205981108095"/>
          <point xsi:type="esdl:Point" lat="53.38169011399543" lon="6.830749511718751"/>
          <point xsi:type="esdl:Point" lat="53.325227775801686" lon="6.827963375352255"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="bf11bd26-4836-48ed-b72c-6b475c84c8a6">
          <investmentCosts xsi:type="esdl:SingleValue" id="d7ee1c1d-ee7c-448c-b5ec-b41c88513fe0" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="516663b3-f3f1-40a8-b22a-50d610bb74e6" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="442259d9-dcf0-4ed2-bd70-4259e2be2d71" diameter="DN1000" length="21133.04" name="Pipe_4422">
        <port xsi:type="esdl:InPort" id="11adcd96-d523-457c-8009-7aee4e5252f8" name="In" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="24e8fa52-e5f5-4935-ab65-fb769cb391ba"/>
        <port xsi:type="esdl:OutPort" id="1b922630-bbd6-4380-9fbf-2957fdced13e" name="Out" connectedTo="891ccb9a-539d-40e2-8210-18dbc130d809" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="53.325227775801686" lon="6.827963375352255"/>
          <point xsi:type="esdl:Point" lat="53.32513175791219" lon="6.828002929687501"/>
          <point xsi:type="esdl:Point" lat="53.29395162470101" lon="6.845855712890626"/>
          <point xsi:type="esdl:Point" lat="53.25124716393741" lon="6.876068115234376"/>
          <point xsi:type="esdl:Point" lat="53.20109715974551" lon="6.888427734375"/>
          <point xsi:type="esdl:Point" lat="53.17064968295498" lon="6.880187988281251"/>
          <point xsi:type="esdl:Point" lat="53.15019351038124" lon="6.845684051513673"/>
        </geometry>
        <costInformation xsi:type="esdl:CostInformation" id="bf11bd26-4836-48ed-b72c-6b475c84c8a6">
          <investmentCosts xsi:type="esdl:SingleValue" id="d7ee1c1d-ee7c-448c-b5ec-b41c88513fe0" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="516663b3-f3f1-40a8-b22a-50d610bb74e6" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="ef7752cb-4afc-4ec8-b0c6-8519052c0bbd" name="Joint_ef77">
        <port xsi:type="esdl:InPort" id="435e389a-e4a4-460b-985f-cbb7067cb69d" name="In" connectedTo="d743df35-2416-452a-a4a8-6589b5c95d3b" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="24e8fa52-e5f5-4935-ab65-fb769cb391ba" name="Out" connectedTo="95b248fc-98d0-486b-bcab-c02f23d655cd 11adcd96-d523-457c-8009-7aee4e5252f8" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="53.325227775801686" lon="6.827963375352255"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="f2b4f6ab-2bcd-4530-ab65-359ab818def7" name="Bus_f2b4" capacity="10000000000.0">
        <geometry xsi:type="esdl:Point" lat="53.32248822971938" lon="6.8151081965863325" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="e6f2b55b-ee9b-4848-8de9-7947807fdedf" name="In" connectedTo="ab8bc062-b68e-4f81-b9d5-46e9a47940e7" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="67f19ca1-8b4e-42e4-a93e-c76a52bf55a2" name="Out" connectedTo="d8aa7e02-00ba-4673-ab85-0c290f73e802 6bf2d72a-d7be-4b28-93e0-bc708094779b" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="48f50e2e-d5ea-4a49-a518-a293e98f3f92" name="ElectricityCable_48f5" length="24689.1" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="53.32251589358375" lon="6.8131655555632085"/>
          <point xsi:type="esdl:Point" lat="53.29202157653937" lon="6.838648067093703"/>
          <point xsi:type="esdl:Point" lat="53.25079479049957" lon="6.896502070958982"/>
          <point xsi:type="esdl:Point" lat="53.219152887685205" lon="6.899076809938883"/>
          <point xsi:type="esdl:Point" lat="53.13643761450206" lon="6.952463150852612"/>
          <point xsi:type="esdl:Point" lat="53.125476150362864" lon="6.947136298334768"/>
          <point xsi:type="esdl:Point" lat="53.12377261965195" lon="6.949818134307862"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="6bf2d72a-d7be-4b28-93e0-bc708094779b" name="In" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="67f19ca1-8b4e-42e4-a93e-c76a52bf55a2"/>
        <port xsi:type="esdl:OutPort" id="8b329734-4712-4ac0-a97e-8647072e61fd" name="Out" connectedTo="27852c31-da2e-4fbe-ae3e-23a6c1c5051a" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="05b2f3a3-7cdb-4e36-8f91-e2fbab380c50">
          <investmentCosts xsi:type="esdl:SingleValue" id="71303373-da17-4692-a899-b4936cfdfcd5" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="908d7371-c67c-4ace-b19f-58b0cf52529c" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="4feedb06-90c3-4051-b391-2810b166fbfa" name="ElectricityCable_4fee" length="13085.7" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="53.42472588236535" lon="6.8709186292758515"/>
          <point xsi:type="esdl:Point" lat="53.41504188054104" lon="6.839484118124949"/>
          <point xsi:type="esdl:Point" lat="53.40353873641352" lon="6.826892399360084"/>
          <point xsi:type="esdl:Point" lat="53.386013012282916" lon="6.821525181374631"/>
          <point xsi:type="esdl:Point" lat="53.343479773986566" lon="6.820439649638332"/>
          <point xsi:type="esdl:Point" lat="53.32259416661203" lon="6.813154595292678"/>
          <point xsi:type="esdl:Point" lat="53.32248822971938" lon="6.8151081965863325"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="5a2951d3-689d-4d9d-ae5d-95d7e17d9c12" name="In" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="75f81d10-0a5e-46f8-b40e-dc76242bf547"/>
        <port xsi:type="esdl:OutPort" id="ab8bc062-b68e-4f81-b9d5-46e9a47940e7" name="Out" connectedTo="e6f2b55b-ee9b-4848-8de9-7947807fdedf" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="c8e394d5-1ee0-4b0f-afde-5fb66be5cdf0">
          <investmentCosts xsi:type="esdl:SingleValue" id="be52f48f-6c92-401f-a6d6-9ada0e081538" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="d6a5362f-f1fb-4809-9c07-1df59dd801c7" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="a8e323ef-8f14-4df2-9259-3e730425a41d" name="ElectricityCable_a8e3" length="3771.9" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="53.45131576212356" lon="6.8585808031034965"/>
          <point xsi:type="esdl:Point" lat="53.446841425196176" lon="6.86832228300963"/>
          <point xsi:type="esdl:Point" lat="53.44569080523272" lon="6.868923079127205"/>
          <point xsi:type="esdl:Point" lat="53.43777931263044" lon="6.86533967593595"/>
          <point xsi:type="esdl:Point" lat="53.435969072936125" lon="6.8624479780865375"/>
          <point xsi:type="esdl:Point" lat="53.43495710854985" lon="6.862507965884987"/>
          <point xsi:type="esdl:Point" lat="53.43449673555241" lon="6.862851277952161"/>
          <point xsi:type="esdl:Point" lat="53.43401078086685" lon="6.865383204447625"/>
          <point xsi:type="esdl:Point" lat="53.432297106839876" lon="6.8698033473125095"/>
          <point xsi:type="esdl:Point" lat="53.42999504790347" lon="6.86830135701861"/>
          <point xsi:type="esdl:Point" lat="53.427309154888995" lon="6.870404143430085"/>
          <point xsi:type="esdl:Point" lat="53.425211482321124" lon="6.874051834143847"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="10bead7b-ce3d-45a1-9557-0a52f4f7d074" name="In" connectedTo="b2c14a7a-7187-4959-bc22-0476d3cdcf69" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="f1017cd6-780b-49c2-a0be-110590133bd1" name="Out" connectedTo="4d5677e0-7d41-4422-8e1a-dab727a96589" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="68b1e3ef-dcc2-406a-a027-5ebc9c176272">
          <investmentCosts xsi:type="esdl:SingleValue" id="4d8fe0ac-9694-4002-a45a-375e93f6fbce" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="b13568fe-2aee-40ae-85cb-a975dc782139" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="da0291ca-6088-46a1-87af-519f726049bf" name="ElectricityCable_da02" length="12291.9" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.839125311764896" lon="4.2654258012771615"/>
          <point xsi:type="esdl:Point" lat="51.843137476713466" lon="4.2642427576374695"/>
          <point xsi:type="esdl:Point" lat="51.860640010952906" lon="4.263641961519894"/>
          <point xsi:type="esdl:Point" lat="51.86260199192835" lon="4.276516164039066"/>
          <point xsi:type="esdl:Point" lat="51.86005624810675" lon="4.323380246268656"/>
          <point xsi:type="esdl:Point" lat="51.870540228096814" lon="4.346817862044504"/>
          <point xsi:type="esdl:Point" lat="51.891212077719715" lon="4.351310289229638"/>
          <point xsi:type="esdl:Point" lat="51.90186103379971" lon="4.339259201491799"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8c0c05f7-625c-44e3-900d-43d8e4eb891b" name="In" connectedTo="2ac72af7-2734-4f07-845a-2457cb5170eb" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="08fbd854-cb11-44f6-a470-26cc4c04463d" name="Out" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="bcf9b55c-7ec4-4c11-9c8f-e51aa0fbc92c"/>
        <costInformation xsi:type="esdl:CostInformation" id="4d2b0671-301b-4d5a-bdcb-adda6a0080ed">
          <investmentCosts xsi:type="esdl:SingleValue" id="dba08b16-b8e9-4729-9b82-f160bed9280b" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="564a3838-d2bc-4849-8bce-410fd1d4d22b" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="08674ab0-0945-470a-9043-753939f65b75" name="ElectricityCable_0867" length="99750.0" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.43385657382945" lon="3.7341784338473794"/>
          <point xsi:type="esdl:Point" lat="51.43788298459162" lon="3.760620660329904"/>
          <point xsi:type="esdl:Point" lat="51.43274842277005" lon="3.795518842729982"/>
          <point xsi:type="esdl:Point" lat="51.41559870210285" lon="3.823236838615225"/>
          <point xsi:type="esdl:Point" lat="51.415926524996785" lon="3.8405263026547947"/>
          <point xsi:type="esdl:Point" lat="51.4248016674891" lon="3.871194683200701"/>
          <point xsi:type="esdl:Point" lat="51.4367283394406" lon="3.900317945408452"/>
          <point xsi:type="esdl:Point" lat="51.44355237772029" lon="3.9123767817680353"/>
          <point xsi:type="esdl:Point" lat="51.45934978105212" lon="3.928980477021087"/>
          <point xsi:type="esdl:Point" lat="51.466839076263085" lon="3.95953525099988"/>
          <point xsi:type="esdl:Point" lat="51.4625596294994" lon="3.977730790560261"/>
          <point xsi:type="esdl:Point" lat="51.46662511345636" lon="3.986656904306845"/>
          <point xsi:type="esdl:Point" lat="51.46919260091956" lon="4.033004033375756"/>
          <point xsi:type="esdl:Point" lat="51.4445970661996" lon="4.0927514311021715"/>
          <point xsi:type="esdl:Point" lat="51.43742527251665" lon="4.118156524073303"/>
          <point xsi:type="esdl:Point" lat="51.431323009179685" lon="4.126396013685537"/>
          <point xsi:type="esdl:Point" lat="51.42575532106144" lon="4.142874992910045"/>
          <point xsi:type="esdl:Point" lat="51.42575532106144" lon="4.178236135829284"/>
          <point xsi:type="esdl:Point" lat="51.42650485705613" lon="4.199521483994277"/>
          <point xsi:type="esdl:Point" lat="51.423506639310276" lon="4.2032979167332005"/>
          <point xsi:type="esdl:Point" lat="51.424179240982454" lon="4.219693911832416"/>
          <point xsi:type="esdl:Point" lat="51.42632081363918" lon="4.223963855667928"/>
          <point xsi:type="esdl:Point" lat="51.43071077887198" lon="4.2262593383510625"/>
          <point xsi:type="esdl:Point" lat="51.432508547366105" lon="4.2420939115743295"/>
          <point xsi:type="esdl:Point" lat="51.43539911975649" lon="4.244497096044594"/>
          <point xsi:type="esdl:Point" lat="51.490343354791904" lon="4.230417865637507"/>
          <point xsi:type="esdl:Point" lat="51.52155506706392" lon="4.2523898379368505"/>
          <point xsi:type="esdl:Point" lat="51.540570897085765" lon="4.254449710339938"/>
          <point xsi:type="esdl:Point" lat="51.54377503011565" lon="4.263032512019347"/>
          <point xsi:type="esdl:Point" lat="51.54420223080733" lon="4.286377732587391"/>
          <point xsi:type="esdl:Point" lat="51.54398863096283" lon="4.3083497048867345"/>
          <point xsi:type="esdl:Point" lat="51.54313422155805" lon="4.323798747909678"/>
          <point xsi:type="esdl:Point" lat="51.56938824103548" lon="4.459417230957739"/>
          <point xsi:type="esdl:Point" lat="51.57920731081303" lon="4.475209586047858"/>
          <point xsi:type="esdl:Point" lat="51.59393193855568" lon="4.488255444600578"/>
          <point xsi:type="esdl:Point" lat="51.59542547475725" lon="4.496151622145677"/>
          <point xsi:type="esdl:Point" lat="51.6201683536015" lon="4.503704487623562"/>
          <point xsi:type="esdl:Point" lat="51.6350928776431" lon="4.536319134005402"/>
          <point xsi:type="esdl:Point" lat="51.650412697596266" lon="4.563445307798832"/>
          <point xsi:type="esdl:Point" lat="51.66958767697492" lon="4.624211543689164"/>
          <point xsi:type="esdl:Point" lat="51.68747700435284" lon="4.679484786504658"/>
          <point xsi:type="esdl:Point" lat="51.69109660364699" lon="4.729608348312531"/>
          <point xsi:type="esdl:Point" lat="51.69471591351755" lon="4.734071405185842"/>
          <point xsi:type="esdl:Point" lat="51.69471591351755" lon="4.744027455133951"/>
          <point xsi:type="esdl:Point" lat="51.69258694276214" lon="4.749177136141612"/>
          <point xsi:type="esdl:Point" lat="51.69762006728712" lon="4.822310605271159"/>
          <point xsi:type="esdl:Point" lat="51.70038740196002" lon="4.830635922900207"/>
          <point xsi:type="esdl:Point" lat="51.70129597084116" lon="4.83276128768921"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="befedf4b-43e5-47cd-818a-791f6b934858" name="In" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="20b09136-bbd4-48f0-b104-641f7e46b519"/>
        <port xsi:type="esdl:OutPort" id="f3a3ab9f-64b0-4e55-867c-f4d8ccf37626" name="Out" connectedTo="de8ec129-3b85-4bfd-a3b6-fde46f6d7c42" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="162dd893-bb4d-4c4b-ae75-f24a9669046d">
          <investmentCosts xsi:type="esdl:SingleValue" id="e25242c4-89a1-4c25-88ec-4a188358dcab" value="1000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="e2f3f05e-9b52-4461-b80a-29682504b688" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="1dce0903-f110-4248-9154-77bea15611b0" name="Pipe_1dce" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="1926.55">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="d3eba359-fd20-46f2-ba06-637738e2ad4d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="5271c996-fda1-4189-b26e-3c74c93d3783" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="70ae3d6f-0186-48c7-8b1a-dde64b71a830"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.011">
            <matter xsi:type="esdl:Material" name="steel" id="a0c06d1a-4353-4987-ad69-647d610f2af5" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.081">
            <matter xsi:type="esdl:Material" name="PUR" id="aab1e5a5-7dd2-41d4-8701-746b2aed68b6" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.011">
            <matter xsi:type="esdl:Material" name="HDPE" id="e675e39e-6cce-486d-957e-068b7f326874" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.444975603049464" lon="3.6894489514992443"/>
          <point xsi:type="esdl:Point" lat="51.435459477005075" lon="3.712676725877953"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a599d1c5-e38b-47d8-a1d0-ff0de13225c9" name="In" connectedTo="f184a4f3-6766-4382-831c-5df185e12530" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="6c6f931f-ac78-4e79-a8de-d6cb63b3897e" name="Out" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="26ce8461-772d-4b67-8f2f-8cf8a9757651"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="0efefd0f-b857-4e5e-8c29-b096d9a3f5af" name="Pipe_0efe" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="111694.33">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="d3eba359-fd20-46f2-ba06-637738e2ad4d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="5271c996-fda1-4189-b26e-3c74c93d3783" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="70ae3d6f-0186-48c7-8b1a-dde64b71a830"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.011">
            <matter xsi:type="esdl:Material" name="steel" id="a0c06d1a-4353-4987-ad69-647d610f2af5" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.081">
            <matter xsi:type="esdl:Material" name="PUR" id="aab1e5a5-7dd2-41d4-8701-746b2aed68b6" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.011">
            <matter xsi:type="esdl:Material" name="HDPE" id="e675e39e-6cce-486d-957e-068b7f326874" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.435459477005075" lon="3.712676725877953"/>
          <point xsi:type="esdl:Point" lat="51.43543491642484" lon="3.7127353978442383"/>
          <point xsi:type="esdl:Point" lat="51.445626125569405" lon="3.7499008607669246"/>
          <point xsi:type="esdl:Point" lat="51.44375304674653" lon="3.770370842772369"/>
          <point xsi:type="esdl:Point" lat="51.43788259652527" lon="3.796549685029023"/>
          <point xsi:type="esdl:Point" lat="51.44612754818283" lon="3.8439294674003626"/>
          <point xsi:type="esdl:Point" lat="51.46570978382026" lon="3.891564016721159"/>
          <point xsi:type="esdl:Point" lat="51.468809456667756" lon="3.930618553598869"/>
          <point xsi:type="esdl:Point" lat="51.45955504820685" lon="3.969841957273844"/>
          <point xsi:type="esdl:Point" lat="51.462978863125265" lon="3.991127305438838"/>
          <point xsi:type="esdl:Point" lat="51.473222473322686" lon="4.004522084115791"/>
          <point xsi:type="esdl:Point" lat="51.4721527989267" lon="4.0587653907298025"/>
          <point xsi:type="esdl:Point" lat="51.46487834786325" lon="4.06872144067791"/>
          <point xsi:type="esdl:Point" lat="51.45118211705611" lon="4.070438001013824"/>
          <point xsi:type="esdl:Point" lat="51.436197158527655" lon="4.111635449075073"/>
          <point xsi:type="esdl:Point" lat="51.42862140674422" lon="4.147341298549012"/>
          <point xsi:type="esdl:Point" lat="51.43493814329283" lon="4.176522824259066"/>
          <point xsi:type="esdl:Point" lat="51.43268991344185" lon="4.199181420692759"/>
          <point xsi:type="esdl:Point" lat="51.42369897607648" lon="4.234722117138446"/>
          <point xsi:type="esdl:Point" lat="51.42915984540168" lon="4.28347243067758"/>
          <point xsi:type="esdl:Point" lat="51.46565594896696" lon="4.307160963312798"/>
          <point xsi:type="esdl:Point" lat="51.46993510536488" lon="4.316602045160184"/>
          <point xsi:type="esdl:Point" lat="51.49610930476621" lon="4.326731279344163"/>
          <point xsi:type="esdl:Point" lat="51.504020144102356" lon="4.399856749652865"/>
          <point xsi:type="esdl:Point" lat="51.56532320976634" lon="4.4560743089790265"/>
          <point xsi:type="esdl:Point" lat="51.58516747863363" lon="4.483798783604055"/>
          <point xsi:type="esdl:Point" lat="51.622206362261885" lon="4.500286948464175"/>
          <point xsi:type="esdl:Point" lat="51.64096698479519" lon="4.529811786241403"/>
          <point xsi:type="esdl:Point" lat="51.645229680569045" lon="4.544230893062823"/>
          <point xsi:type="esdl:Point" lat="51.66099817062263" lon="4.5565901274811935"/>
          <point xsi:type="esdl:Point" lat="51.679742748355245" lon="4.542171020659774"/>
          <point xsi:type="esdl:Point" lat="51.68442768085367" lon="4.527751913838315"/>
          <point xsi:type="esdl:Point" lat="51.70699374345401" lon="4.525692041435266"/>
          <point xsi:type="esdl:Point" lat="51.72571928568804" lon="4.5339315310475"/>
          <point xsi:type="esdl:Point" lat="51.72316625921985" lon="4.550410510272008"/>
          <point xsi:type="esdl:Point" lat="51.72912309671579" lon="4.560023248152981"/>
          <point xsi:type="esdl:Point" lat="51.73252665144956" lon="4.603280568617279"/>
          <point xsi:type="esdl:Point" lat="51.74443707480739" lon="4.623879292647924"/>
          <point xsi:type="esdl:Point" lat="51.74545339476093" lon="4.63624162595648"/>
          <point xsi:type="esdl:Point" lat="51.75906115710916" lon="4.644824427635928"/>
          <point xsi:type="esdl:Point" lat="51.76947682914722" lon="4.682245442958216"/>
          <point xsi:type="esdl:Point" lat="51.77691512368559" lon="4.724816139288204"/>
          <point xsi:type="esdl:Point" lat="51.78987607830923" lon="4.7509078563936455"/>
          <point xsi:type="esdl:Point" lat="51.80389521260043" lon="4.745414863318809"/>
          <point xsi:type="esdl:Point" lat="51.8544424245821" lon="4.758453369140626"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="90cd5fe3-66f6-4b97-b644-a03a23cbd9f3" name="In" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="e2c2271d-250c-45ef-b1e1-2d1ae6d6dc80"/>
        <port xsi:type="esdl:OutPort" id="0325e36c-5cd2-487a-861b-75390e3aca86" name="Out" connectedTo="4d862b35-fb77-4da3-990d-6620362fa1f0" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="1a48957c-bbc6-4542-b74f-24fe387165ad" name="Joint_1a48">
        <port xsi:type="esdl:InPort" id="26ce8461-772d-4b67-8f2f-8cf8a9757651" name="In" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="6c6f931f-ac78-4e79-a8de-d6cb63b3897e"/>
        <port xsi:type="esdl:OutPort" id="e2c2271d-250c-45ef-b1e1-2d1ae6d6dc80" name="Out" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="90cd5fe3-66f6-4b97-b644-a03a23cbd9f3 8e5b657c-f3b6-4bac-9fb0-e26120e32149"/>
        <geometry xsi:type="esdl:Point" lat="51.435459477005075" lon="3.712676725877953"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="0116966a-6e1d-4b0d-ad9f-667d76eff895" name="Pipe_0116" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="84947.62">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="c3f9377d-c68e-4920-9304-64e6fc24a5c8">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="5271c996-fda1-4189-b26e-3c74c93d3783" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="70ae3d6f-0186-48c7-8b1a-dde64b71a830"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.011">
            <matter xsi:type="esdl:Material" name="steel" id="a0c06d1a-4353-4987-ad69-647d610f2af5" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.081">
            <matter xsi:type="esdl:Material" name="PUR" id="aab1e5a5-7dd2-41d4-8701-746b2aed68b6" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.011">
            <matter xsi:type="esdl:Material" name="HDPE" id="e675e39e-6cce-486d-957e-068b7f326874" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.8544424245821" lon="4.758453369140626"/>
          <point xsi:type="esdl:Point" lat="51.85585860673649" lon="4.759228781581083"/>
          <point xsi:type="esdl:Point" lat="51.87303811685239" lon="4.753993272556608"/>
          <point xsi:type="esdl:Point" lat="51.89870921571241" lon="4.723790499151784"/>
          <point xsi:type="esdl:Point" lat="51.945521588515945" lon="4.726536995689181"/>
          <point xsi:type="esdl:Point" lat="51.97715098102016" lon="4.663017209889566"/>
          <point xsi:type="esdl:Point" lat="51.977362541444776" lon="4.6563226245796185"/>
          <point xsi:type="esdl:Point" lat="52.02459271736628" lon="4.605347750481844"/>
          <point xsi:type="esdl:Point" lat="52.0315662887333" lon="4.571703167898478"/>
          <point xsi:type="esdl:Point" lat="52.12040376432821" lon="4.585255535875242"/>
          <point xsi:type="esdl:Point" lat="52.12335603964445" lon="4.57753101436373"/>
          <point xsi:type="esdl:Point" lat="52.179158214784145" lon="4.607399361912626"/>
          <point xsi:type="esdl:Point" lat="52.20400274366743" lon="4.601563056770615"/>
          <point xsi:type="esdl:Point" lat="52.20610757406809" lon="4.6089442662149525"/>
          <point xsi:type="esdl:Point" lat="52.21999695427196" lon="4.610145858450064"/>
          <point xsi:type="esdl:Point" lat="52.23819388507411" lon="4.634006047118869"/>
          <point xsi:type="esdl:Point" lat="52.27865204203591" lon="4.733569506824212"/>
          <point xsi:type="esdl:Point" lat="52.29543182102755" lon="4.7049087522394615"/>
          <point xsi:type="esdl:Point" lat="52.303203162149636" lon="4.715208114254784"/>
          <point xsi:type="esdl:Point" lat="52.31685221600711" lon="4.689459709216518"/>
          <point xsi:type="esdl:Point" lat="52.36317847749726" lon="4.758810809324997"/>
          <point xsi:type="esdl:Point" lat="52.39525600985328" lon="4.6990745096361906"/>
          <point xsi:type="esdl:Point" lat="52.450341376936386" lon="4.681565594210158"/>
          <point xsi:type="esdl:Point" lat="52.46625420856721" lon="4.690433152355814"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="2ca05466-cfb9-476b-a700-7f26cd1d7171" name="In" connectedTo="f52b0cc4-1c47-4db5-8866-ce45afd913a2" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="79016891-dc72-4e89-b116-d3ba99fe20c3" name="Out" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="ef107569-2ace-44e8-9d44-c9959f170de8"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="7224b650-5457-4620-89e9-c307d48c471e" name="Pipe_7224" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="46113.8">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="c3f9377d-c68e-4920-9304-64e6fc24a5c8">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="5271c996-fda1-4189-b26e-3c74c93d3783" value="26155.2">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" unit="EURO" perUnit="METRE" description="Costs in EUR/m" id="70ae3d6f-0186-48c7-8b1a-dde64b71a830"/>
          </investmentCosts>
        </costInformation>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.011">
            <matter xsi:type="esdl:Material" name="steel" id="a0c06d1a-4353-4987-ad69-647d610f2af5" thermalConductivity="52.15"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.081">
            <matter xsi:type="esdl:Material" name="PUR" id="aab1e5a5-7dd2-41d4-8701-746b2aed68b6" thermalConductivity="0.027"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.011">
            <matter xsi:type="esdl:Material" name="HDPE" id="e675e39e-6cce-486d-957e-068b7f326874" thermalConductivity="0.4"/>
          </component>
        </material>
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="52.46625420856721" lon="4.690433152355814"/>
          <point xsi:type="esdl:Point" lat="52.474790100839996" lon="4.695298034150342"/>
          <point xsi:type="esdl:Point" lat="52.50302344541074" lon="4.70525408409845"/>
          <point xsi:type="esdl:Point" lat="52.52246254079849" lon="4.695298034150342"/>
          <point xsi:type="esdl:Point" lat="52.56966580050176" lon="4.716583382315297"/>
          <point xsi:type="esdl:Point" lat="52.57905861990657" lon="4.735122233942853"/>
          <point xsi:type="esdl:Point" lat="52.57592790367402" lon="4.75228783730171"/>
          <point xsi:type="esdl:Point" lat="52.60663905522965" lon="4.768092332777445"/>
          <point xsi:type="esdl:Point" lat="52.59579177912553" lon="4.821649015257067"/>
          <point xsi:type="esdl:Point" lat="52.63791422661297" lon="4.8463674840938085"/>
          <point xsi:type="esdl:Point" lat="52.65041803860461" lon="4.84568085995946"/>
          <point xsi:type="esdl:Point" lat="52.67416543388754" lon="4.871772577064939"/>
          <point xsi:type="esdl:Point" lat="52.69332059152137" lon="4.908850280320053"/>
          <point xsi:type="esdl:Point" lat="52.69914875460173" lon="4.915716521663587"/>
          <point xsi:type="esdl:Point" lat="52.71829295512756" lon="4.918463018201026"/>
          <point xsi:type="esdl:Point" lat="52.72286967174427" lon="4.949361104246953"/>
          <point xsi:type="esdl:Point" lat="52.74848793739282" lon="5.010368860428809"/>
          <point xsi:type="esdl:Point" lat="52.75790545926437" lon="5.013198852539063"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="92811726-89ee-4073-81fd-7b8bbce6b9ad" name="In" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="fe27bbf9-ad48-4b46-a06f-db464ce8685d"/>
        <port xsi:type="esdl:OutPort" id="33d81cad-9bb8-4198-986f-0ea43b087bab" name="Out" connectedTo="927dfa0e-3842-47cd-84c7-28d3411a1915" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="18ea0904-c7ce-44ae-8f8e-6e8f5f80c76e" name="Joint_18ea">
        <port xsi:type="esdl:InPort" id="ef107569-2ace-44e8-9d44-c9959f170de8" name="In" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="79016891-dc72-4e89-b116-d3ba99fe20c3"/>
        <port xsi:type="esdl:OutPort" id="fe27bbf9-ad48-4b46-a06f-db464ce8685d" name="Out" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="92811726-89ee-4073-81fd-7b8bbce6b9ad e1cd46e1-44eb-43c7-a8f1-a30f64e793be"/>
        <geometry xsi:type="esdl:Point" lat="52.46625420856721" lon="4.690433152355814"/>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="df818709-e977-495b-9e27-18b83e62f37b">
    <carriers xsi:type="esdl:Carriers" id="81b9c861-68d8-49a7-8eb5-e6374be9469d">
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="380000.0" name="380kV" id="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
      <carrier xsi:type="esdl:GasCommodity" name="Hydrogen" pressure="51.0" id="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      <carrier xsi:type="esdl:HeatCommodity" id="f73c2bd6-f040-4538-bebe-1efbebd308ff" name="Heat_sup" supplyTemperature="80.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="aad1f42c-c113-436a-80d7-2e47c4bf740f" name="Heat_ret" returnTemperature="40.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
