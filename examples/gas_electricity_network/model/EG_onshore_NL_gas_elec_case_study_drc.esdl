<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2111" version="93" name="EG_onshore_NL_gas_elec_case_study_drc" id="f8f47243-f20d-43a0-8646-5ea02212c0ac" description="TenneT high electricity grid">
  <instance xsi:type="esdl:Instance" id="5e55167c-094a-49aa-b708-499689511e7b" name="Untitled instance">
    <area xsi:type="esdl:Area" id="23ae3043-b224-4644-a5ff-475ad9efe784" name="Netherlands">
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="f671f0a9-8272-462f-87c9-6ac01d27a61b" name="Bus_f671" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="f210fadf-6a24-4b28-a7ee-f57d5e48b9a1" name="In" connectedTo="14ac1585-6e28-48c3-b0d5-8a36a64354b2" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="699f65ee-277a-437d-905f-057d67a6b44d" name="Out" connectedTo="b712a0d6-ac8d-438a-aa29-5030ecf46949 ec82187b-14a3-4f31-8d35-ccc2f0198114" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.53157413368958" lon="6.188521385192871"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="22036194-8fa4-4db0-add7-bbcc1f518d58" name="Bus_2203" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="1d08e006-6199-4ba6-90a2-e60d46946d7e" name="In" connectedTo="f15357d8-c63d-4840-9ed1-a1ddc5d2acae 00eafe14-d6d4-4936-9bfb-1cfddca21dd3" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="1bccc857-8379-496c-8a71-9310dfd5724e" name="Out" connectedTo="cc10d512-a1f7-4977-bb6d-5d17fc2943bb" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.57614129849472" lon="5.535736083984376"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="51380.2" id="cd24b8b5-1e51-43f4-9021-ee91c5d8cae5" name="Cable_DiLe" capacity="4000000000.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="f3fa06ec-5ad0-474b-9914-1b2943ef90a6" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="301b7db0-073e-4832-88a9-900b8371d76b" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="5bccff2e-db8a-438f-a4ed-e263aaa9545a" name="Bus_5bcc" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="366a15c7-43af-4c45-add3-79ddf58562d1" name="In" connectedTo="1110a392-8157-4978-8718-8c467ef588dd 8be7b159-4d61-43a2-928d-5ea260d390e8 8b5b1553-4da4-40a3-a993-cea5f677d512" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="8b916d9a-a54a-49f1-a9bc-2343801d8907" name="Out" connectedTo="0dc69471-344e-43c6-85d0-656bba94cb4e" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.33687308757833" CRS="WGS84" lon="5.014346837997437"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="1684f1a1-6f7e-4713-bd7d-63bda528d7ad" name="Bus_1684" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="0c85933d-b982-4ea0-afea-312941724388" name="In" connectedTo="499b288a-4ded-46fd-af42-833317b80a84 e1113b6a-e57a-4271-b6b7-e42c3a8d9d83" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="c9391ab3-32b5-4700-bf66-9c77feb9a9e9" name="Out" connectedTo="dfee21ff-6b6e-4548-b019-ea6e9e0051a2 738603f9-2172-4df7-a156-8a4f0277c8fc" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.47418082273862" lon="4.675068855285645"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="3d2becd6-a7f1-4b56-9fc7-a51c11129105" name="Bus_3d2b" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="45025e3c-e3f1-4c3d-a1ad-5de1d1bfde03" name="In" connectedTo="2ade8f13-ff2b-4e09-b82b-fb7d0889a56d f2cbd336-3d2f-4c8a-8050-2d8f7c76d055" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="333c45c4-a0ca-42cf-8657-09df30d8bcbe" name="Out" connectedTo="d10788ea-3fb2-4594-9c64-9dad84beefa9" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.03623107423245" lon="4.529156684875489"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="0247b563-124f-4080-ad10-19e58230a59e" name="Bus_0247" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="4d7cd68e-6ae8-4dbe-822d-ab5b97b7827c" name="In" connectedTo="c3154a26-f50f-4369-82fc-3f23aa4c66cd bc803b22-4bdd-48ba-90ab-44534a434388 290e0bb7-7951-43ab-aa4a-c64232823848" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="f7c6973d-2195-475f-9838-8cfc9e880568" name="Out" connectedTo="3ee8044d-e0ed-4688-aa9f-28e71eeb49a3" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.955374270419746" CRS="WGS84" lon="4.022058248519898"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="23202.4" id="47294d4d-cc11-457a-a8fc-930a35ca2238" name="Cable_MaV1" capacity="4000000000.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="c8113004-e7a6-463d-838b-7bcc7d45cf1f" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="4dd44532-6695-48ad-8f21-11b1f8c0bf70" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="8141344a-46d3-42ea-a552-14b2a70e5a0f" name="Bus_8141" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="2f415f67-e2be-48c6-8ef6-ff5c071efc04" name="In" connectedTo="79aa3412-1bf5-4223-af49-61cbe90aaa16" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="2ac72af7-2734-4f07-845a-2457cb5170eb" name="Out" connectedTo="8c0c05f7-625c-44e3-900d-43d8e4eb891b 9ae0d399-8901-4ce5-a1d2-10941fdde56f" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.839112053676395" lon="4.265087842941285"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="2c818cbc-899b-4029-b755-67a14881be91" name="Bus_2c81" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="d1371d0b-005d-4661-8b54-cc1168619101" name="In" connectedTo="41dac491-7fbe-416d-a272-7b82a92f036a 614c1b30-f457-4322-bf70-f26f77717de6" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="a1fe66e8-a5e0-4620-b39c-ac3817e919a7" name="Out" connectedTo="79608553-54a3-4882-987c-69c2f5a3a5cf b4773b73-ff2d-4fd4-aa02-e0538f7469c4" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.91377907090002" lon="4.622154513694784"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="17226.9" id="dd1015fa-425c-4ad7-8ecb-9d9ef5f16a4c" name="Cable_Rot2" capacity="4000000000.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="e2387e06-63e7-4817-ad8a-9640f665708b" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="d91da343-3a38-4f7d-b987-ac8cc0af6f12" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="809a65a0-c3c8-4e52-ab08-9b8408e0cfe8" name="Bus_809a" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="4d5677e0-7d41-4422-8e1a-dab727a96589" name="In" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="291cc339-d52b-4867-a195-d317e8c1846e b2c14a7a-7187-4959-bc22-0476d3cdcf69"/>
        <port xsi:type="esdl:OutPort" id="75f81d10-0a5e-46f8-b40e-dc76242bf547" name="Out" connectedTo="5a2951d3-689d-4d9d-ae5d-95d7e17d9c12" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="53.424668105030946" lon="6.872828096913658"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="3e247e41-3570-4cf6-a81f-9e7c64b56435" name="Bus_3e24" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="ea12a015-6a2c-4c4f-9eb3-ab51a02d46ce" name="In" connectedTo="0a47564c-01ef-46e3-bfc3-30292b083aca 1abee595-0033-4305-a4a4-b2e88ea722b2" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="955c2d5b-812d-4156-aaf7-29389009ab48" name="Out" connectedTo="20967b74-36af-42ed-99cc-b2f6789fcdd9 f5d6471c-6ec2-47e7-802c-0da25adac0bf" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.14877779921986" lon="5.918471217155457"/>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="eb0074d7-6933-4b2e-8983-cbebe18006ac" name="Bus_eb00" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="de8ec129-3b85-4bfd-a3b6-fde46f6d7c42" name="In" connectedTo="41c012bf-50c7-4f00-aa03-4b9e3239f461 f3a3ab9f-64b0-4e55-867c-f4d8ccf37626" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="bb4facb4-dcaa-45c2-8577-da41b1503c24" name="Out" connectedTo="c38ba474-6a36-4301-8798-16f82000ecb8" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.70190105465847" lon="4.8320960998535165"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="33696.4" id="18696411-2257-4310-8334-d073fa3bd12e" name="Cable_Rot1" capacity="4000000000.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="2b9b43c7-8edc-4e32-94fb-f957dd1668fa" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="6ecc4ad8-4826-4553-a069-48c379eccb4a" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Bus" voltage="380000.0" id="31e2c65e-41c3-4bea-b2b6-b90762bdd20e" name="Bus_31e2" capacity="10000000000.0">
        <port xsi:type="esdl:InPort" id="c6df4c63-795c-4de2-94fa-a11cef08eba9" name="In" connectedTo="a8c54619-4d8d-4260-9fd6-4d7874570842 1b227827-1523-409d-8bf9-ac040c632cd5" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" name="Out" id="20b09136-bbd4-48f0-b104-641f7e46b519" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a" connectedTo="4491bcc1-e7f4-4573-9a69-d25f46b920bb befedf4b-43e5-47cd-818a-791f6b934858"/>
        <geometry xsi:type="esdl:Point" lat="51.43330361377654" CRS="WGS84" lon="3.728141784667969"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="6b0ebe59-bfdc-4c8e-8d8a-2f036a5cb167" name="ElectricityProducer_Beverwijk_Offshore" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="499b288a-4ded-46fd-af42-833317b80a84" name="Out" connectedTo="0c85933d-b982-4ea0-afea-312941724388" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.47734470376444" lon="4.678158725338944"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="e8b6ad5a-7af2-4812-b56d-e70303d90eeb" name="ElectricityProducer_Maasvlakte_Offshore" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="c3154a26-f50f-4369-82fc-3f23aa4c66cd" name="Out" connectedTo="4d7cd68e-6ae8-4dbe-822d-ab5b97b7827c" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.9760968507607" lon="3.994560241699219"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="62aabba4-ffd7-4c34-9ac9-44c65d3f3795" name="ElectricityProducer_Lelystad" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="f15357d8-c63d-4840-9ed1-a1ddc5d2acae" name="Out" connectedTo="1d08e006-6199-4ba6-90a2-e60d46946d7e" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.57801901378958" CRS="WGS84" lon="5.5289554595947275"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="86bb8642-d7f9-404d-b7af-3ec2e9a548db" name="ElectricityProducer_Diemen" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="8be7b159-4d61-43a2-928d-5ea260d390e8" name="Out" connectedTo="366a15c7-43af-4c45-add3-79ddf58562d1" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="52.339482103160265" CRS="WGS84" lon="5.020751953125"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="103a8e35-4a3a-41b6-beac-6b6d60cc2675" name="ElectricityProducer_Borselle" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="a8c54619-4d8d-4260-9fd6-4d7874570842" name="Out" connectedTo="c6df4c63-795c-4de2-94fa-a11cef08eba9" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.43104280189433" CRS="WGS84" lon="3.7178206443786626"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="74cb5196-bd01-450c-ae5f-dd0f71e19317" name="ElectricityProducer_Maasbracht" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="0a47564c-01ef-46e3-bfc3-30292b083aca" name="Out" connectedTo="ea12a015-6a2c-4c4f-9eb3-ab51a02d46ce" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.15399341097399" CRS="WGS84" lon="5.907876491546632"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="4530fb5b-67c8-48c5-9a38-3118f5fd5bf2" name="ElectricityProducer_Eemshaven" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="291cc339-d52b-4867-a195-d317e8c1846e" name="Out" connectedTo="4d5677e0-7d41-4422-8e1a-dab727a96589" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="53.43605155965126" CRS="WGS84" lon="6.8792009353637695"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="4f4a5b54-ffa9-4b96-8925-358f3f48c646" name="ElectricityProducer_Maasvlakte" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="bc803b22-4bdd-48ba-90ab-44534a434388" name="Out" connectedTo="4d7cd68e-6ae8-4dbe-822d-ab5b97b7827c" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.960756045314085" CRS="WGS84" lon="4.0233778953552255"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="0a0de3a7-6a12-4b96-b55c-b61f6c7b1877" name="ElectricityProducer_Eemshaven_Offshore" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="b2c14a7a-7187-4959-bc22-0476d3cdcf69" name="Out" connectedTo="4d5677e0-7d41-4422-8e1a-dab727a96589" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="53.43796892980263" lon="6.864395141601563"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="43332e31-66dc-4043-8239-0d6b3786e9dc" diameter="DN1000" length="30162.65" name="Pipe_DenH">
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
        <port xsi:type="esdl:InPort" id="927dfa0e-3842-47cd-84c7-28d3411a1915" name="In" connectedTo="4497d08d-4ad9-496d-bd56-973e356ca71c 1d0bcd6c-68a5-4bfc-8d33-56552a8ab04e" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="c57cd03d-5e35-49e0-8e56-f171249aa668" name="Out" connectedTo="c6b8da57-8413-4516-84e4-5ab10d397832" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="52.75790545926437" lon="5.013198852539063"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="15ad6a9c-75c2-44da-bc23-b51126573600" name="Joint_15ad">
        <port xsi:type="esdl:InPort" id="4d862b35-fb77-4da3-990d-6620362fa1f0" name="In" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="a00dedf1-783d-4961-9bd7-f11944468ada 0325e36c-5cd2-487a-861b-75390e3aca86 28082ca3-d9d3-4bc0-b93a-1a44893f8553"/>
        <port xsi:type="esdl:OutPort" id="f52b0cc4-1c47-4db5-8866-ce45afd913a2" name="Out" connectedTo="8671b8ca-7716-4aee-92cb-464423c6f6d6" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="51.8544424245821" lon="4.758453369140626"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="54cbddfe-f78f-44d1-9978-e467c0587fda" name="Joint_54cb">
        <port xsi:type="esdl:InPort" id="27755afc-72fc-4cc5-b72c-eb1f1e503128" name="In" connectedTo="90d533c5-81b1-4234-8614-193ff2af5095" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="e82f61af-ba6d-4cbe-bfe0-318f3dd038ac" name="Out" connectedTo="4753e5ff-f195-4eea-8683-d780e0a6448e c7c64c94-5316-4cf9-b2d7-51da8631639d" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="51.784409121571045" lon="5.665512084960938"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c1ced69e-4db7-47eb-b195-93ed37aa5868" name="Joint_c1ce">
        <port xsi:type="esdl:InPort" id="891ccb9a-539d-40e2-8210-18dbc130d809" name="In" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76" connectedTo="1b922630-bbd6-4380-9fbf-2957fdced13e 01342cfc-2e55-45ec-b564-3863cb0e27b1"/>
        <port xsi:type="esdl:OutPort" id="a7028b54-194f-4315-b4fe-9d83a9e1a781" name="Out" connectedTo="a7b85746-834f-4526-9783-0293d7083a01" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="53.15019351038124" CRS="WGS84" lon="6.845684051513673"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" id="5b233069-6071-4b9b-9d3d-19d676e51f4d" name="GasProducer_Eemshaven" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="6c2d6ca3-8725-4665-9763-9b4090dfd6a8" name="Out" connectedTo="612d8006-ca77-439e-b2d8-9d82aa733bdc" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="53.439144977718065" lon="6.8535810419198295"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="7c442069-115b-464c-8562-c93e65f714b0" name="ElectricityProducer_Borselle_Offshore" power="1000000000.0">
        <port xsi:type="esdl:OutPort" id="1b227827-1523-409d-8bf9-ac040c632cd5" name="Out" connectedTo="c6df4c63-795c-4de2-94fa-a11cef08eba9" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <geometry xsi:type="esdl:Point" lat="51.444806849921186" lon="3.7315770974532474"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="6619b918-679b-4134-ad2d-11a643e5e96e" name="Joint_6619">
        <port xsi:type="esdl:InPort" id="2b31c358-0faf-4444-a1df-2394d995942c" name="In" connectedTo="363ef637-b0cb-4f22-8cf2-a2c7caf596d6" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="67bc53b9-175d-4c82-8bca-6c3894095335" name="Out" connectedTo="9ae83037-fa22-4952-8661-7d59a4a4755b e7ff1f73-e77e-491a-b027-f2f10120f337" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="51.87423944163612" lon="4.338226318359376"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="8802b75c-8666-43df-bc9f-4370388d1249" diameter="DN1000" length="3520.61" name="Pipe_Vlaa">
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
      <asset xsi:type="esdl:GasProducer" id="82866b8b-34b8-4539-95c5-a938cfedd62a" name="GasProducer_DenHelder" power="1000000000.0">
        <geometry xsi:type="esdl:Point" lat="52.959801208563285" lon="4.764288507599407"/>
        <port xsi:type="esdl:OutPort" id="d2d886c1-85a5-4f39-a4da-55f94e82a752" name="Out" connectedTo="f64ae75e-06ae-435b-839c-2d6c14f58f58" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" id="cd2d7449-969e-4539-b2c7-0d029e0ff4b9" name="GasProducer_Borselle" power="3000000000.0">
        <geometry xsi:type="esdl:Point" lat="51.44510082832498" lon="3.699302673339844"/>
        <port xsi:type="esdl:OutPort" id="f184a4f3-6766-4382-831c-5df185e12530" name="Out" connectedTo="26ce8461-772d-4b67-8f2f-8cf8a9757651" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" id="49074bcd-2763-4cec-a8da-a27984efb9a5" name="GasProducer_Maasvlakte" power="3000000000.0">
        <geometry xsi:type="esdl:Point" lat="51.97975241057527" lon="4.0457149161826145"/>
        <port xsi:type="esdl:OutPort" id="32cdfe79-8470-4d7f-98cd-7c74c9dd6cfe" name="Out" connectedTo="c5932fd1-9ba7-4510-90d7-0787087ac4e5" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="588f41d3-cb78-448b-8837-456a91f86fe6" name="Pipe_MaV1" innerDiameter="1.194" outerDiameter="1.4" diameter="DN1000" length="24311.1">
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
      <asset xsi:type="esdl:Pipe" id="ba8ea377-ef3a-4dc3-a369-3f27959d9c8d" name="Pipe_MaV2" innerDiameter="1.194" outerDiameter="1.4" diameter="DN1000" length="32679.3">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="ade266f8-a876-4235-bf05-c8db7c73ae8b" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="ab3f3f37-e31c-4ffa-91b6-78abf6e4e5f5" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="1df73877-23c2-4042-a8dd-53a4a522c963" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="9f0b9f0d-f02b-45ff-9b4f-1b1dab3d1f49" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="39bc920d-8c55-4686-af44-dbecca49056f" value="200.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="9b4d6f5a-7eb2-4fd6-bf34-d9dd6b9f32e8" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="ee8ebf3e-a8c4-4fa6-b7e6-3f6adc2542b0" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="bf510a94-e851-44fd-b231-0df694b02b05" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="ef8936de-7f26-407f-a601-97685f4fa738" unit="EURO"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="d1bc986e-bf53-4ec2-aff2-8aa4952eed61" value="200.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="4b4306d6-ccb5-4331-8507-779793335b82" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="e6254215-68bd-493e-8e97-f4165db08058" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="a0013bed-2d81-4b4a-9b24-adf1ab24689c" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="73a1c586-2d41-4e56-b8b6-f78873c98090" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="219e01f5-464a-4c99-b30e-0a539d081efb" value="200.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="1e804899-c251-4966-82c3-2b59bca65e29" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="7f3738de-d8b6-4d36-9ad1-115dbdefba06" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="01167105-5d3f-4146-8f10-a3799940f16f" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="8f888527-3f71-4d4a-ae91-2f3e89253fd4" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="55b54268-63a6-4df8-8b1b-65d1f5562be9" value="200.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="3a7b166d-320c-435d-bcbc-c9c6e4fa7c8e" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="585ed7ba-3f77-400d-b61d-fb6db7049068" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="3456bc3b-9ea5-44b2-a524-e2b1e5433c71" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="12e20d4f-a5ab-4791-a715-a5b43b4f0952" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="6fb2a4f0-6be5-4b86-af8f-1d6f0d8c4750" value="200.0">
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
      <asset xsi:type="esdl:Pipe" id="c564348e-ea17-4967-b0cc-ed5d017e77f0" name="Pipe_MaBr" innerDiameter="1.194" outerDiameter="1.4" diameter="DN1000" length="96714.45">
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
        <port xsi:type="esdl:OutPort" id="12bc506a-b104-49f0-9d7f-0e37ea206c23" name="Out" connectedTo="a33b4acf-79e9-4d89-af1e-5548bf04111d" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="3fe0eb0f-dd03-419a-9dda-fe9b34a89c43" name="HeatPump_Maasbracht" power="5000000000.0" COP="2.0">
        <geometry xsi:type="esdl:Point" lat="51.125287423483215" lon="5.901375582267737"/>
        <port xsi:type="esdl:InPort" id="20967b74-36af-42ed-99cc-b2f6789fcdd9" name="In" connectedTo="955c2d5b-812d-4156-aaf7-29389009ab48" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:InPort" id="a7801285-d462-4687-b8a1-cacac20c3302" name="InPort_sec" connectedTo="a7eebbd3-73a1-420b-8f86-b06d9b40e421" carrier="aad1f42c-c113-436a-80d7-2e47c4bf740f"/>
        <port xsi:type="esdl:OutPort" id="2d7109f5-b6b6-4e40-8e1c-850d17784828" name="OutPort_sec" connectedTo="d50b436d-7aa6-4281-88ce-a1fb005e66a1" carrier="f73c2bd6-f040-4538-bebe-1efbebd308ff"/>
        <costInformation xsi:type="esdl:CostInformation" id="44c1a807-c9ea-49f7-a654-f4da87865086">
          <investmentCosts xsi:type="esdl:SingleValue" id="ed9e2015-65bc-4d14-9740-87bcc0c84482" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR/MW" id="16f7e3ec-9de2-481c-aa96-3e369939907d" unit="EURO" perMultiplier="MEGA" perUnit="WATT"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="4e4e6426-4e1f-4399-be0b-4a37cc12004f" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" description="Cost in EUR" id="f9aea887-d774-4004-9282-3d3f92d53fd8" unit="EURO"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="45c1831a-13c0-48bd-ab1d-ca98d1c396ca" value="600.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="45bd496d-e8bc-4f71-a773-edf3bf109dfb" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="23da1ca4-4ee1-4c89-a93e-d4d8a91f2311" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="d49ac517-bcaf-4aab-b4eb-635f742411c0" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="5030e10b-f5a0-401b-ae9b-dc67a4cda8b7" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="b17c7109-5fe2-435a-b33c-66dbfbb63032" value="600.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="aaccd027-0d05-45e7-bb6f-ca487d0d17c6" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="229172bf-8aef-46f2-916e-c5c064cf49ad" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="c7203909-d296-42b7-aa54-387fe76006ca" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="394ecb1d-bcd1-4f2c-a8d3-9151fdd9b461" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="a0a59830-8506-4ff2-960a-eb5fd5026307" value="600.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="e4273bcf-803f-49ec-8ccb-0f61f3d89cad" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="cd34e1d9-be55-420e-aa12-06bf0e5a975f" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="806804ed-ebd4-427d-b09a-fbc7760d2788" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="3775b22e-22d6-4e01-af99-d97840a35cce" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="bb5831e3-aa3e-40f3-a858-7790dcf11302" value="600.0">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="17cdbd28-abb1-4bc9-b29f-e4eff4aba05d" value="10000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="bc16d3ee-4f3b-430b-8ec7-23f5eb47333e" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
          <installationCosts xsi:type="esdl:SingleValue" id="04e0f75f-5b5a-4b90-a3ec-c08fc4bb9bd5" value="1000000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="7091f7a4-044f-4e50-ab73-c35326fe6d16" unit="EURO" description="Cost in EUR"/>
          </installationCosts>
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="2c129c71-e835-44c0-a05b-4ef2979d5039" value="600.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="a5506689-d011-481a-bcd7-4fc9074af883" unit="EURO" perMultiplier="MEGA" perUnit="WATTHOUR" description="Cost in EUR/MWh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="8a9da466-2204-45d6-84ff-df33a2020c3f" name="Cable_DRC" length="112642.4" capacity="4000000000.0" state="OPTIONAL">
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
          <investmentCosts xsi:type="esdl:SingleValue" id="0fd30b9c-d751-44e8-a64e-025acc1f4184" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="3cbe2188-0315-4a1b-b3b3-58e88513e488" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="a573cef3-98b8-4d55-bd61-c1af3afb90bb" diameter="DN1000" length="12488.62" name="Pipe_Eem1">
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
      <asset xsi:type="esdl:Pipe" id="442259d9-dcf0-4ed2-bd70-4259e2be2d71" diameter="DN1000" length="21133.04" name="Pipe_Eem2">
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
        <geometry xsi:type="esdl:Point" lat="53.322437088454876" lon="6.8151524662971505"/>
        <port xsi:type="esdl:InPort" id="e6f2b55b-ee9b-4848-8de9-7947807fdedf" name="In" connectedTo="ab8bc062-b68e-4f81-b9d5-46e9a47940e7" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="67f19ca1-8b4e-42e4-a93e-c76a52bf55a2" name="Out" connectedTo="d8aa7e02-00ba-4673-ab85-0c290f73e802 f79a33b9-5d42-4cef-892b-92d824c70cf8" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="4feedb06-90c3-4051-b391-2810b166fbfa" name="Cable_Eem1" length="13085.7" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="53.42472588236535" lon="6.8709186292758515"/>
          <point xsi:type="esdl:Point" lat="53.41504188054104" lon="6.839484118124949"/>
          <point xsi:type="esdl:Point" lat="53.40353873641352" lon="6.826892399360084"/>
          <point xsi:type="esdl:Point" lat="53.386013012282916" lon="6.821525181374631"/>
          <point xsi:type="esdl:Point" lat="53.343479773986566" lon="6.820439649638332"/>
          <point xsi:type="esdl:Point" lat="53.32259416661203" lon="6.813154595292678"/>
          <point xsi:type="esdl:Point" lat="53.32248822971938" lon="6.8151081965863325"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="5a2951d3-689d-4d9d-ae5d-95d7e17d9c12" name="In" connectedTo="75f81d10-0a5e-46f8-b40e-dc76242bf547" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="ab8bc062-b68e-4f81-b9d5-46e9a47940e7" name="Out" connectedTo="e6f2b55b-ee9b-4848-8de9-7947807fdedf" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="c8e394d5-1ee0-4b0f-afde-5fb66be5cdf0">
          <investmentCosts xsi:type="esdl:SingleValue" id="be52f48f-6c92-401f-a6d6-9ada0e081538" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="d6a5362f-f1fb-4809-9c07-1df59dd801c7" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="da0291ca-6088-46a1-87af-519f726049bf" name="Cable_Vlaa" length="12291.9" capacity="4000000000.0">
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
        <port xsi:type="esdl:OutPort" id="08fbd854-cb11-44f6-a470-26cc4c04463d" name="Out" connectedTo="bcf9b55c-7ec4-4c11-9c8f-e51aa0fbc92c" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="4d2b0671-301b-4d5a-bdcb-adda6a0080ed">
          <investmentCosts xsi:type="esdl:SingleValue" id="dba08b16-b8e9-4729-9b82-f160bed9280b" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="564a3838-d2bc-4849-8bce-410fd1d4d22b" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="08674ab0-0945-470a-9043-753939f65b75" name="Cable_Bors" length="99750.0" capacity="4000000000.0">
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
        <port xsi:type="esdl:InPort" id="befedf4b-43e5-47cd-818a-791f6b934858" name="In" connectedTo="20b09136-bbd4-48f0-b104-641f7e46b519" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="f3a3ab9f-64b0-4e55-867c-f4d8ccf37626" name="Out" connectedTo="de8ec129-3b85-4bfd-a3b6-fde46f6d7c42" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="162dd893-bb4d-4c4b-ae75-f24a9669046d">
          <investmentCosts xsi:type="esdl:SingleValue" id="e25242c4-89a1-4c25-88ec-4a188358dcab" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="e2f3f05e-9b52-4461-b80a-29682504b688" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="0efefd0f-b857-4e5e-8c29-b096d9a3f5af" name="Pipe_Bors" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="111694.33">
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
        <port xsi:type="esdl:InPort" id="26ce8461-772d-4b67-8f2f-8cf8a9757651" name="In" connectedTo="f184a4f3-6766-4382-831c-5df185e12530" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="e2c2271d-250c-45ef-b1e1-2d1ae6d6dc80" name="Out" connectedTo="8e5b657c-f3b6-4bac-9fb0-e26120e32149 90cd5fe3-66f6-4b97-b644-a03a23cbd9f3" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="51.435459477005075" lon="3.712676725877953"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="18ea0904-c7ce-44ae-8f8e-6e8f5f80c76e" name="Joint_18ea">
        <port xsi:type="esdl:InPort" id="ef107569-2ace-44e8-9d44-c9959f170de8" name="In" connectedTo="64893724-fa1a-4afb-b14a-6a39737e08ac" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="fe27bbf9-ad48-4b46-a06f-db464ce8685d" name="Out" connectedTo="e1cd46e1-44eb-43c7-a8f1-a30f64e793be a7825c6b-eb4f-4088-8625-8a2a3dac9123" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <geometry xsi:type="esdl:Point" lat="52.46625420856721" lon="4.690433152355814"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="f96d4910-3cd0-46e0-95bb-191fcd592876" name="Pipe_DRC" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="92930.3" state="OPTIONAL">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="833a863d-9d9e-458c-85a5-0cf69ed4f8ba">
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
          <point xsi:type="esdl:Point" lat="51.8544424245821" lon="4.758453369140626"/>
          <point xsi:type="esdl:Point" lat="51.53293520641541" lon="5.2703636759495085"/>
          <point xsi:type="esdl:Point" lat="51.545048396941404" lon="5.276526801115603"/>
          <point xsi:type="esdl:Point" lat="51.563200381525476" lon="5.2974688372133825"/>
          <point xsi:type="esdl:Point" lat="51.56789736223302" lon="5.335576476670059"/>
          <point xsi:type="esdl:Point" lat="51.58006455520772" lon="5.356346856734252"/>
          <point xsi:type="esdl:Point" lat="51.60086930934517" lon="5.356003544667078"/>
          <point xsi:type="esdl:Point" lat="51.63964841441126" lon="5.392740302965523"/>
          <point xsi:type="esdl:Point" lat="51.68641092746267" lon="5.457797939695577"/>
          <point xsi:type="esdl:Point" lat="51.685571085941625" lon="5.480799452918115"/>
          <point xsi:type="esdl:Point" lat="51.72494693970888" lon="5.553238299092468"/>
          <point xsi:type="esdl:Point" lat="51.74193761226857" lon="5.557365535295747"/>
          <point xsi:type="esdl:Point" lat="51.74448957859946" lon="5.573157890385905"/>
          <point xsi:type="esdl:Point" lat="51.755333827404414" lon="5.574531138654605"/>
          <point xsi:type="esdl:Point" lat="51.77573946867171" lon="5.60096616782722"/>
          <point xsi:type="esdl:Point" lat="51.78083943783609" lon="5.654522850306842"/>
          <point xsi:type="esdl:Point" lat="51.784409121571045" lon="5.665512084960938"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8671b8ca-7716-4aee-92cb-464423c6f6d6" name="In" connectedTo="f52b0cc4-1c47-4db5-8866-ce45afd913a2" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="90d533c5-81b1-4234-8614-193ff2af5095" name="Out" connectedTo="27755afc-72fc-4cc5-b72c-eb1f1e503128" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="6f685f81-9f35-4b62-9bb3-dca34403c792" name="Pipe_EeMa" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="193625.4">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="eef6b22e-3ab8-4561-b593-d9ededf2e03d">
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
          <point xsi:type="esdl:Point" lat="51.79073454097272" lon="5.659697281779261"/>
          <point xsi:type="esdl:Point" lat="51.80432865828006" lon="5.672399828264806"/>
          <point xsi:type="esdl:Point" lat="51.82004174781176" lon="5.710164155654267"/>
          <point xsi:type="esdl:Point" lat="51.82874529031857" lon="5.721836765938289"/>
          <point xsi:type="esdl:Point" lat="51.84890557336241" lon="5.774020200149211"/>
          <point xsi:type="esdl:Point" lat="51.88156727827878" lon="5.796678796582904"/>
          <point xsi:type="esdl:Point" lat="51.88305133775868" lon="5.863967961749635"/>
          <point xsi:type="esdl:Point" lat="51.89704149002428" lon="5.920271140766655"/>
          <point xsi:type="esdl:Point" lat="51.897210767278274" lon="5.988265076395094"/>
          <point xsi:type="esdl:Point" lat="51.907806428320185" lon="6.043881631277765"/>
          <point xsi:type="esdl:Point" lat="51.949317322545596" lon="6.0583007380992235"/>
          <point xsi:type="esdl:Point" lat="51.97048156004051" lon="6.0898854482795"/>
          <point xsi:type="esdl:Point" lat="51.985290581565444" lon="6.152368244505745"/>
          <point xsi:type="esdl:Point" lat="52.1730263671303" lon="6.29176303205195"/>
          <point xsi:type="esdl:Point" lat="52.47256468696671" lon="6.341975380773205"/>
          <point xsi:type="esdl:Point" lat="52.582890873368676" lon="6.451835242269884"/>
          <point xsi:type="esdl:Point" lat="52.607926366494226" lon="6.421623780358307"/>
          <point xsi:type="esdl:Point" lat="52.66795319640012" lon="6.476553711106627"/>
          <point xsi:type="esdl:Point" lat="52.68128130781322" lon="6.520497655705314"/>
          <point xsi:type="esdl:Point" lat="52.71125469359549" lon="6.520497655705314"/>
          <point xsi:type="esdl:Point" lat="52.719576981995324" lon="6.5699345933787985"/>
          <point xsi:type="esdl:Point" lat="52.925346290827946" lon="6.701874407976281"/>
          <point xsi:type="esdl:Point" lat="52.95515188328571" lon="6.646944477227922"/>
          <point xsi:type="esdl:Point" lat="53.01139533143179" lon="6.701874407976281"/>
          <point xsi:type="esdl:Point" lat="53.03371908011022" lon="6.784774250179848"/>
          <point xsi:type="esdl:Point" lat="53.07211764693605" lon="6.81086596728529"/>
          <point xsi:type="esdl:Point" lat="53.1108943386286" lon="6.814299087957076"/>
          <point xsi:type="esdl:Point" lat="53.15019351038124" lon="6.845684051513673"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c7c64c94-5316-4cf9-b2d7-51da8631639d" name="In" connectedTo="e82f61af-ba6d-4cbe-bfe0-318f3dd038ac" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="01342cfc-2e55-45ec-b564-3863cb0e27b1" name="Out" connectedTo="891ccb9a-539d-40e2-8210-18dbc130d809" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="b118e1ca-18ef-4f5e-92a3-2c06f648ee36" name="Pipe_EeDe" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="159619.0">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="cf05adf3-c43e-4e55-b97f-b03980867a75">
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
          <point xsi:type="esdl:Point" lat="53.15019351038124" lon="6.845684051513673"/>
          <point xsi:type="esdl:Point" lat="53.154381896627214" lon="6.825988325077606"/>
          <point xsi:type="esdl:Point" lat="53.170111973102316" lon="6.827840822377046"/>
          <point xsi:type="esdl:Point" lat="53.18843156375375" lon="6.824064389638084"/>
          <point xsi:type="esdl:Point" lat="53.20859464749166" lon="6.778060572636347"/>
          <point xsi:type="esdl:Point" lat="53.2075279667779" lon="6.747067802638021"/>
          <point xsi:type="esdl:Point" lat="53.222335986320914" lon="6.74844105090672"/>
          <point xsi:type="esdl:Point" lat="53.23549437357578" lon="6.705870354576772"/>
          <point xsi:type="esdl:Point" lat="53.256046259050564" lon="6.7044971063080725"/>
          <point xsi:type="esdl:Point" lat="53.2938359424872" lon="6.645447430753577"/>
          <point xsi:type="esdl:Point" lat="53.286444937421855" lon="6.583651258661722"/>
          <point xsi:type="esdl:Point" lat="53.2938359424872" lon="6.536960817525636"/>
          <point xsi:type="esdl:Point" lat="53.28562363570646" lon="6.5204818383011265"/>
          <point xsi:type="esdl:Point" lat="53.28233827097777" lon="6.438086942178628"/>
          <point xsi:type="esdl:Point" lat="53.28890874785003" lon="6.407875480267051"/>
          <point xsi:type="esdl:Point" lat="53.28315963584028" lon="6.304881860113905"/>
          <point xsi:type="esdl:Point" lat="53.147420735295135" lon="5.972555779086508"/>
          <point xsi:type="esdl:Point" lat="53.10587229333632" lon="5.97592717268812"/>
          <point xsi:type="esdl:Point" lat="53.09473658396496" lon="5.929236731552035"/>
          <point xsi:type="esdl:Point" lat="53.067503824406316" lon="5.90863800752143"/>
          <point xsi:type="esdl:Point" lat="53.055945327349534" lon="5.883232914550298"/>
          <point xsi:type="esdl:Point" lat="53.051816541078345" lon="5.809764132174423"/>
          <point xsi:type="esdl:Point" lat="53.06832931267058" lon="5.711576880961765"/>
          <point xsi:type="esdl:Point" lat="53.065852800412046" lon="5.652527205407308"/>
          <point xsi:type="esdl:Point" lat="52.99136913297882" lon="5.4699419968438265"/>
          <point xsi:type="esdl:Point" lat="52.94586267293681" lon="5.423251555707741"/>
          <point xsi:type="esdl:Point" lat="52.9428360339436" lon="5.396712511816407"/>
          <point xsi:type="esdl:Point" lat="52.77652676568898" lon="5.108673687454833"/>
          <point xsi:type="esdl:Point" lat="52.76966995989694" lon="5.066789615259234"/>
          <point xsi:type="esdl:Point" lat="52.756215149217574" lon="5.044968710879144"/>
          <point xsi:type="esdl:Point" lat="52.75790545926437" lon="5.013198852539063"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a7b85746-834f-4526-9783-0293d7083a01" name="In" connectedTo="a7028b54-194f-4315-b4fe-9d83a9e1a781" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="1d0bcd6c-68a5-4bfc-8d33-56552a8ab04e" name="Out" connectedTo="927dfa0e-3842-47cd-84c7-28d3411a1915" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="3238fada-da58-43eb-877a-4eda428e2bb7" name="Pipe_Bev1" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="45943.3">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="404adc2a-6d55-4130-826f-7da48f488aac">
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
          <point xsi:type="esdl:Point" lat="52.75790545926437" lon="5.013198852539063"/>
          <point xsi:type="esdl:Point" lat="52.74831184690992" lon="5.010463283312841"/>
          <point xsi:type="esdl:Point" lat="52.72273260764379" lon="4.948323799153772"/>
          <point xsi:type="esdl:Point" lat="52.7182598985907" lon="4.918455649309369"/>
          <point xsi:type="esdl:Point" lat="52.69791988478695" lon="4.915747235323203"/>
          <point xsi:type="esdl:Point" lat="52.6746019071243" lon="4.871116666590206"/>
          <point xsi:type="esdl:Point" lat="52.651688201096995" lon="4.845711573619075"/>
          <point xsi:type="esdl:Point" lat="52.63960159151137" lon="4.846398197753424"/>
          <point xsi:type="esdl:Point" lat="52.59622903495331" lon="4.820993104782332"/>
          <point xsi:type="esdl:Point" lat="52.60582474358871" lon="4.767436422302712"/>
          <point xsi:type="esdl:Point" lat="52.57703131113761" lon="4.750270818943854"/>
          <point xsi:type="esdl:Point" lat="52.579118427604904" lon="4.737224960391134"/>
          <point xsi:type="esdl:Point" lat="52.56993437190936" lon="4.713879739823091"/>
          <point xsi:type="esdl:Point" lat="52.52273140119832" lon="4.693281015792446"/>
          <point xsi:type="esdl:Point" lat="52.50182892801715" lon="4.705640250210817"/>
          <point xsi:type="esdl:Point" lat="52.46625420856721" lon="4.690433152355814"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c6b8da57-8413-4516-84e4-5ab10d397832" name="In" connectedTo="c57cd03d-5e35-49e0-8e56-f171249aa668" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="64893724-fa1a-4afb-b14a-6a39737e08ac" name="Out" connectedTo="ef107569-2ace-44e8-9d44-c9959f170de8" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="46ca0e75-4184-49f8-9eca-25b35ccaf11d" name="Pipe_Bev2" innerDiameter="0.994" outerDiameter="1.2" diameter="DN1000" length="84225.8">
        <dataSource xsi:type="esdl:DataSource" name="Logstor Product Catalogue Version 2020.03" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf"/>
        <costInformation xsi:type="esdl:CostInformation" id="f730d8b4-4661-42d1-8487-5b637dd96ca3">
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
          <point xsi:type="esdl:Point" lat="52.46625420856721" lon="4.690433152355814"/>
          <point xsi:type="esdl:Point" lat="52.450445932316605" lon="4.681560533913297"/>
          <point xsi:type="esdl:Point" lat="52.394941533105204" lon="4.698726137272114"/>
          <point xsi:type="esdl:Point" lat="52.36327462911483" lon="4.757805410114871"/>
          <point xsi:type="esdl:Point" lat="52.31752922366803" lon="4.6905162449481805"/>
          <point xsi:type="esdl:Point" lat="52.30310107736516" lon="4.715033198638193"/>
          <point xsi:type="esdl:Point" lat="52.29543474578256" lon="4.705420460757219"/>
          <point xsi:type="esdl:Point" lat="52.278627184744806" lon="4.733743706299336"/>
          <point xsi:type="esdl:Point" lat="52.23984893188628" lon="4.634208556131428"/>
          <point xsi:type="esdl:Point" lat="52.22091625804425" lon="4.610863335563385"/>
          <point xsi:type="esdl:Point" lat="52.20618526255162" lon="4.609490087294686"/>
          <point xsi:type="esdl:Point" lat="52.20408043583106" lon="4.601250597682412"/>
          <point xsi:type="esdl:Point" lat="52.17923595037805" lon="4.606743590757248"/>
          <point xsi:type="esdl:Point" lat="52.12367453492145" lon="4.57858695711257"/>
          <point xsi:type="esdl:Point" lat="52.11987874357859" lon="4.584766574321756"/>
          <point xsi:type="esdl:Point" lat="52.032486294583386" lon="4.574467212306432"/>
          <point xsi:type="esdl:Point" lat="52.023188149070975" lon="4.604678674218051"/>
          <point xsi:type="esdl:Point" lat="51.977937779201326" lon="4.654802236025884"/>
          <point xsi:type="esdl:Point" lat="51.97709154237429" lon="4.663041725638118"/>
          <point xsi:type="esdl:Point" lat="51.94534612145041" lon="4.728957642536149"/>
          <point xsi:type="esdl:Point" lat="51.89757500127073" lon="4.7255237951667795"/>
          <point xsi:type="esdl:Point" lat="51.8544424245821" lon="4.758453369140626"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a7825c6b-eb4f-4088-8625-8a2a3dac9123" name="In" connectedTo="fe27bbf9-ad48-4b46-a06f-db464ce8685d" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
        <port xsi:type="esdl:OutPort" id="28082ca3-d9d3-4bc0-b93a-1a44893f8553" name="Out" connectedTo="4d862b35-fb77-4da3-990d-6620362fa1f0" carrier="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="32392782-2bca-4dd1-9fb1-f108f3d20f2a" name="Cable_Eem2" length="132630.5" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="53.32251278824043" lon="6.813205853104592"/>
          <point xsi:type="esdl:Point" lat="53.29200211021535" lon="6.838731765747071"/>
          <point xsi:type="esdl:Point" lat="53.250784983402234" lon="6.896495819091798"/>
          <point xsi:type="esdl:Point" lat="53.22001307546095" lon="6.898727416992188"/>
          <point xsi:type="esdl:Point" lat="53.136370427875875" lon="6.952543258666993"/>
          <point xsi:type="esdl:Point" lat="53.12522120144792" lon="6.947436332702638"/>
          <point xsi:type="esdl:Point" lat="53.118035756260504" lon="6.955590248107911"/>
          <point xsi:type="esdl:Point" lat="53.094384845030056" lon="6.955890655517579"/>
          <point xsi:type="esdl:Point" lat="53.07969309331362" lon="6.940784454345704"/>
          <point xsi:type="esdl:Point" lat="53.05875512904823" lon="6.940183639526367"/>
          <point xsi:type="esdl:Point" lat="53.02139221293762" lon="6.970825195312501"/>
          <point xsi:type="esdl:Point" lat="52.98957727118986" lon="6.991424560546876"/>
          <point xsi:type="esdl:Point" lat="52.934568947428474" lon="7.036399841308595"/>
          <point xsi:type="esdl:Point" lat="52.923807261265246" lon="7.041549682617188"/>
          <point xsi:type="esdl:Point" lat="52.904346653702405" lon="7.032623291015626"/>
          <point xsi:type="esdl:Point" lat="52.8790762287689" lon="7.009963989257813"/>
          <point xsi:type="esdl:Point" lat="52.87327438033861" lon="7.016830444335938"/>
          <point xsi:type="esdl:Point" lat="52.839691305320216" lon="7.00103759765625"/>
          <point xsi:type="esdl:Point" lat="52.808987753203425" lon="6.918640136718751"/>
          <point xsi:type="esdl:Point" lat="52.803591645305865" lon="6.854782104492188"/>
          <point xsi:type="esdl:Point" lat="52.79528863312749" lon="6.849288940429688"/>
          <point xsi:type="esdl:Point" lat="52.73296550376907" lon="6.837615966796876"/>
          <point xsi:type="esdl:Point" lat="52.722153756528385" lon="6.810836791992188"/>
          <point xsi:type="esdl:Point" lat="52.73088652980318" lon="6.760025024414063"/>
          <point xsi:type="esdl:Point" lat="52.73005491245807" lon="6.740112304687501"/>
          <point xsi:type="esdl:Point" lat="52.699273918403335" lon="6.689987182617188"/>
          <point xsi:type="esdl:Point" lat="52.687205172413364" lon="6.627502441406251"/>
          <point xsi:type="esdl:Point" lat="52.670969529275744" lon="6.615142822265626"/>
          <point xsi:type="esdl:Point" lat="52.66347412007777" lon="6.551971435546876"/>
          <point xsi:type="esdl:Point" lat="52.64889603279042" lon="6.5265655517578125"/>
          <point xsi:type="esdl:Point" lat="52.6030475337285" lon="6.529998779296876"/>
          <point xsi:type="esdl:Point" lat="52.584277483971114" lon="6.4867401123046875"/>
          <point xsi:type="esdl:Point" lat="52.58010526979777" lon="6.423568725585938"/>
          <point xsi:type="esdl:Point" lat="52.571342327367596" lon="6.376190185546876"/>
          <point xsi:type="esdl:Point" lat="52.566334145326486" lon="6.366577148437501"/>
          <point xsi:type="esdl:Point" lat="52.549636074382306" lon="6.293792724609376"/>
          <point xsi:type="esdl:Point" lat="52.52974664487039" lon="6.192169189453126"/>
          <point xsi:type="esdl:Point" lat="52.53141803427195" lon="6.189336804786079"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f79a33b9-5d42-4cef-892b-92d824c70cf8" name="In" connectedTo="67f19ca1-8b4e-42e4-a93e-c76a52bf55a2" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="14ac1585-6e28-48c3-b0d5-8a36a64354b2" name="Out" connectedTo="f210fadf-6a24-4b28-a7ee-f57d5e48b9a1" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="245a2cf2-04a2-4b6d-ad0b-7de984926f0c">
          <investmentCosts xsi:type="esdl:SingleValue" id="775d1519-3319-4dec-9320-ef1f07cc230f" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="dd09083f-fe64-4490-85f9-0be77b2ef018" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="46a75398-eead-4047-bc7d-4e6cc65f3080" name="Cable_EmMa" length="264865.6" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.53141803427195" lon="6.189336804786079"/>
          <point xsi:type="esdl:Point" lat="52.49699560277581" lon="6.16436004638672"/>
          <point xsi:type="esdl:Point" lat="52.4813166132228" lon="6.14788055419922"/>
          <point xsi:type="esdl:Point" lat="52.47629815604365" lon="6.153030395507813"/>
          <point xsi:type="esdl:Point" lat="52.45726463903304" lon="6.302719116210938"/>
          <point xsi:type="esdl:Point" lat="52.45621860285773" lon="6.354217529296875"/>
          <point xsi:type="esdl:Point" lat="52.443454960583146" lon="6.379623413085938"/>
          <point xsi:type="esdl:Point" lat="52.430896949806524" lon="6.452064514160157"/>
          <point xsi:type="esdl:Point" lat="52.416241413574696" lon="6.480216979980469"/>
          <point xsi:type="esdl:Point" lat="52.411424959685" lon="6.497726440429688"/>
          <point xsi:type="esdl:Point" lat="52.401581005080814" lon="6.5238189697265625"/>
          <point xsi:type="esdl:Point" lat="52.39382996350069" lon="6.536865234375001"/>
          <point xsi:type="esdl:Point" lat="52.387963405382365" lon="6.553001403808594"/>
          <point xsi:type="esdl:Point" lat="52.38356297507495" lon="6.5720558166503915"/>
          <point xsi:type="esdl:Point" lat="52.37182634976541" lon="6.603984832763673"/>
          <point xsi:type="esdl:Point" lat="52.36323148534417" lon="6.615056991577149"/>
          <point xsi:type="esdl:Point" lat="52.34960205354996" lon="6.61479949951172"/>
          <point xsi:type="esdl:Point" lat="52.32757639896584" lon="6.625442504882813"/>
          <point xsi:type="esdl:Point" lat="52.32107148898424" lon="6.678657531738282"/>
          <point xsi:type="esdl:Point" lat="52.27740090167397" lon="6.767921447753907"/>
          <point xsi:type="esdl:Point" lat="52.274459988242945" lon="6.768951416015626"/>
          <point xsi:type="esdl:Point" lat="52.26458549445877" lon="6.752471923828126"/>
          <point xsi:type="esdl:Point" lat="52.251792654633796" lon="6.757664680480958"/>
          <point xsi:type="esdl:Point" lat="52.24996668152709" lon="6.7594242095947275"/>
          <point xsi:type="esdl:Point" lat="52.24861357383702" lon="6.759037971496583"/>
          <point xsi:type="esdl:Point" lat="52.25043960263734" lon="6.755883693695068"/>
          <point xsi:type="esdl:Point" lat="52.25145111142177" lon="6.727452278137208"/>
          <point xsi:type="esdl:Point" lat="52.247089636152765" lon="6.717710494995118"/>
          <point xsi:type="esdl:Point" lat="52.24430437340781" lon="6.6797733306884775"/>
          <point xsi:type="esdl:Point" lat="52.240888246430075" lon="6.662778854370118"/>
          <point xsi:type="esdl:Point" lat="52.233476974672165" lon="6.647243499755859"/>
          <point xsi:type="esdl:Point" lat="52.23536933191902" lon="6.6364288330078125"/>
          <point xsi:type="esdl:Point" lat="52.22645877890084" lon="6.603169441223145"/>
          <point xsi:type="esdl:Point" lat="52.22372479940255" lon="6.583685874938966"/>
          <point xsi:type="esdl:Point" lat="52.2249603686772" lon="6.577892303466798"/>
          <point xsi:type="esdl:Point" lat="52.22127984824024" lon="6.550598144531251"/>
          <point xsi:type="esdl:Point" lat="52.18835191606342" lon="6.482620239257813"/>
          <point xsi:type="esdl:Point" lat="52.17919508969048" lon="6.467170715332032"/>
          <point xsi:type="esdl:Point" lat="52.16782537162136" lon="6.437644958496094"/>
          <point xsi:type="esdl:Point" lat="52.17056279155013" lon="6.387176513671875"/>
          <point xsi:type="esdl:Point" lat="52.16340302979992" lon="6.362457275390626"/>
          <point xsi:type="esdl:Point" lat="52.16508778326973" lon="6.316452026367188"/>
          <point xsi:type="esdl:Point" lat="52.16435071147503" lon="6.3083839416503915"/>
          <point xsi:type="esdl:Point" lat="52.16466660088196" lon="6.278343200683595"/>
          <point xsi:type="esdl:Point" lat="52.16298183146627" lon="6.265125274658204"/>
          <point xsi:type="esdl:Point" lat="52.16013863844113" lon="6.259803771972657"/>
          <point xsi:type="esdl:Point" lat="52.15371445951162" lon="6.2560272216796875"/>
          <point xsi:type="esdl:Point" lat="52.12737616999006" lon="6.257915496826173"/>
          <point xsi:type="esdl:Point" lat="52.12474148434946" lon="6.253795623779298"/>
          <point xsi:type="esdl:Point" lat="52.11725812770208" lon="6.232681274414063"/>
          <point xsi:type="esdl:Point" lat="52.1098789403549" lon="6.230449676513673"/>
          <point xsi:type="esdl:Point" lat="52.10049506697517" lon="6.236801147460938"/>
          <point xsi:type="esdl:Point" lat="52.05681828075688" lon="6.2560272216796875"/>
          <point xsi:type="esdl:Point" lat="52.02545860348814" lon="6.25499725341797"/>
          <point xsi:type="esdl:Point" lat="52.008872375564515" lon="6.251392364501954"/>
          <point xsi:type="esdl:Point" lat="52.00094684771797" lon="6.245899200439454"/>
          <point xsi:type="esdl:Point" lat="51.988368796701295" lon="6.242122650146485"/>
          <point xsi:type="esdl:Point" lat="51.98128548202468" lon="6.252626180648804"/>
          <point xsi:type="esdl:Point" lat="51.98221060537343" lon="6.244826316833497"/>
          <point xsi:type="esdl:Point" lat="51.98096829247812" lon="6.1861610412597665"/>
          <point xsi:type="esdl:Point" lat="51.96690396550421" lon="6.113204956054688"/>
          <point xsi:type="esdl:Point" lat="51.95526847967245" lon="6.085739135742188"/>
          <point xsi:type="esdl:Point" lat="51.952517832627976" lon="6.054153442382813"/>
          <point xsi:type="esdl:Point" lat="51.941513556993755" lon="6.043167114257813"/>
          <point xsi:type="esdl:Point" lat="51.932835205144265" lon="6.017417907714844"/>
          <point xsi:type="esdl:Point" lat="51.932200137880656" lon="6.008148193359375"/>
          <point xsi:type="esdl:Point" lat="51.92457862965376" lon="5.997505187988281"/>
          <point xsi:type="esdl:Point" lat="51.919285154094695" lon="5.990295410156251"/>
          <point xsi:type="esdl:Point" lat="51.91589700214632" lon="5.975875854492188"/>
          <point xsi:type="esdl:Point" lat="51.90551919620549" lon="5.96832275390625"/>
          <point xsi:type="esdl:Point" lat="51.90297732712961" lon="5.905494689941407"/>
          <point xsi:type="esdl:Point" lat="51.90170633865142" lon="5.890388488769532"/>
          <point xsi:type="esdl:Point" lat="51.89937609970991" lon="5.884552001953126"/>
          <point xsi:type="esdl:Point" lat="51.89916425381262" lon="5.868072509765626"/>
          <point xsi:type="esdl:Point" lat="51.89302028824895" lon="5.810737609863281"/>
          <point xsi:type="esdl:Point" lat="51.90446010157105" lon="5.777778625488282"/>
          <point xsi:type="esdl:Point" lat="51.912508594508694" lon="5.76885223388672"/>
          <point xsi:type="esdl:Point" lat="51.91674406410398" lon="5.755119323730469"/>
          <point xsi:type="esdl:Point" lat="51.920343899143454" lon="5.684051513671876"/>
          <point xsi:type="esdl:Point" lat="51.92457862965376" lon="5.677528381347657"/>
          <point xsi:type="esdl:Point" lat="51.92579604073893" lon="5.6656837463378915"/>
          <point xsi:type="esdl:Point" lat="51.92752947127999" lon="5.6614136695861825"/>
          <point xsi:type="esdl:Point" lat="51.92510794287848" lon="5.650835037231446"/>
          <point xsi:type="esdl:Point" lat="51.9161087691339" lon="5.644741058349609"/>
          <point xsi:type="esdl:Point" lat="51.863983987313205" lon="5.640106201171876"/>
          <point xsi:type="esdl:Point" lat="51.831534417403034" lon="5.65349578857422"/>
          <point xsi:type="esdl:Point" lat="51.81646817257424" lon="5.66722869873047"/>
          <point xsi:type="esdl:Point" lat="51.797575198911495" lon="5.70465087890625"/>
          <point xsi:type="esdl:Point" lat="51.78058599210829" lon="5.77880859375"/>
          <point xsi:type="esdl:Point" lat="51.76104049272952" lon="5.806274414062501"/>
          <point xsi:type="esdl:Point" lat="51.70916142932305" lon="5.800781250000001"/>
          <point xsi:type="esdl:Point" lat="51.671703487277476" lon="5.840606689453126"/>
          <point xsi:type="esdl:Point" lat="51.63789025621996" lon="5.909271240234376"/>
          <point xsi:type="esdl:Point" lat="51.545481015589345" lon="5.892791748046875"/>
          <point xsi:type="esdl:Point" lat="51.5283970022217" lon="5.913391113281251"/>
          <point xsi:type="esdl:Point" lat="51.38720911696497" lon="5.943603515625001"/>
          <point xsi:type="esdl:Point" lat="51.35720401156475" lon="5.924377441406251"/>
          <point xsi:type="esdl:Point" lat="51.27050757321479" lon="5.969696044921875"/>
          <point xsi:type="esdl:Point" lat="51.24042602354959" lon="5.9710693359375"/>
          <point xsi:type="esdl:Point" lat="51.2206474303833" lon="5.954589843750001"/>
          <point xsi:type="esdl:Point" lat="51.22150754599216" lon="5.940856933593751"/>
          <point xsi:type="esdl:Point" lat="51.20602300602931" lon="5.909271240234376"/>
          <point xsi:type="esdl:Point" lat="51.17417731875822" lon="5.910644531250001"/>
          <point xsi:type="esdl:Point" lat="51.15070932675253" lon="5.919055938720704"/>
          <point xsi:type="esdl:Point" lat="51.148905672879316" lon="5.918562412261964"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="b712a0d6-ac8d-438a-aa29-5030ecf46949" name="In" connectedTo="699f65ee-277a-437d-905f-057d67a6b44d" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="1abee595-0033-4305-a4a4-b2e88ea722b2" name="Out" connectedTo="ea12a015-6a2c-4c4f-9eb3-ab51a02d46ce" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="90b58676-d2fb-468e-b9c0-0cae664dab3d">
          <investmentCosts xsi:type="esdl:SingleValue" id="87b31b02-d977-4dba-b15e-4fdac71061a6" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="6dc9a3fd-4735-4a46-a578-cb80ef4c9b73" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="d3d6be66-7e7e-48db-bb35-123ac4eefc02" name="Cable_LeEm" length="51633.6" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.529851074851564" lon="6.187201738357545"/>
          <point xsi:type="esdl:Point" lat="52.53300996441222" lon="6.18208408355713"/>
          <point xsi:type="esdl:Point" lat="52.54493859680129" lon="6.158952713012696"/>
          <point xsi:type="esdl:Point" lat="52.570820668422954" lon="6.138439178466798"/>
          <point xsi:type="esdl:Point" lat="52.57405485384592" lon="6.102390289306641"/>
          <point xsi:type="esdl:Point" lat="52.55642043219769" lon="6.03750228881836"/>
          <point xsi:type="esdl:Point" lat="52.55662916503518" lon="6.028747558593751"/>
          <point xsi:type="esdl:Point" lat="52.57092500070833" lon="5.990467071533204"/>
          <point xsi:type="esdl:Point" lat="52.58876217130501" lon="5.9774208068847665"/>
          <point xsi:type="esdl:Point" lat="52.59048291787224" lon="5.972528457641602"/>
          <point xsi:type="esdl:Point" lat="52.58620699872114" lon="5.949525833129884"/>
          <point xsi:type="esdl:Point" lat="52.620663206787995" lon="5.86094856262207"/>
          <point xsi:type="esdl:Point" lat="52.6155043204379" lon="5.8412933349609375"/>
          <point xsi:type="esdl:Point" lat="52.6147226179558" lon="5.733489990234376"/>
          <point xsi:type="esdl:Point" lat="52.61930840661157" lon="5.72765350341797"/>
          <point xsi:type="esdl:Point" lat="52.619725272670294" lon="5.674438476562501"/>
          <point xsi:type="esdl:Point" lat="52.59408062417794" lon="5.628089904785157"/>
          <point xsi:type="esdl:Point" lat="52.5857376651135" lon="5.577621459960938"/>
          <point xsi:type="esdl:Point" lat="52.57478512076683" lon="5.544490814208985"/>
          <point xsi:type="esdl:Point" lat="52.576669414049846" lon="5.538750886917115"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ec82187b-14a3-4f31-8d35-ccc2f0198114" name="In" connectedTo="699f65ee-277a-437d-905f-057d67a6b44d" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="00eafe14-d6d4-4936-9bfb-1cfddca21dd3" name="Out" connectedTo="1d08e006-6199-4ba6-90a2-e60d46946d7e" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="2e59c925-3fb7-45d2-8a3e-1d8022549326">
          <investmentCosts xsi:type="esdl:SingleValue" id="8a6f5813-62f9-41b1-b638-5d4b46da70ba" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="f6a16810-2c95-4baa-84c9-b30f187cf7db" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="55d21dd0-f4f0-4572-a605-ba249bfae371" name="Cable_DiBe" length="31490.6" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.337541744431924" lon="5.011439323425293"/>
          <point xsi:type="esdl:Point" lat="52.33914123549424" lon="5.010452270507813"/>
          <point xsi:type="esdl:Point" lat="52.35234138261823" lon="4.985496997833253"/>
          <point xsi:type="esdl:Point" lat="52.37769505233968" lon="4.981956481933595"/>
          <point xsi:type="esdl:Point" lat="52.384191634830856" lon="4.982643127441407"/>
          <point xsi:type="esdl:Point" lat="52.404618204112744" lon="4.9666786193847665"/>
          <point xsi:type="esdl:Point" lat="52.42430256140241" lon="4.912090301513673"/>
          <point xsi:type="esdl:Point" lat="52.42566338899799" lon="4.902820587158204"/>
          <point xsi:type="esdl:Point" lat="52.42901293949973" lon="4.89269256591797"/>
          <point xsi:type="esdl:Point" lat="52.4296278683832" lon="4.8731446266174325"/>
          <point xsi:type="esdl:Point" lat="52.43288553998687" lon="4.8678016662597665"/>
          <point xsi:type="esdl:Point" lat="52.457473843286216" lon="4.842910766601563"/>
          <point xsi:type="esdl:Point" lat="52.45862444891168" lon="4.837417602539063"/>
          <point xsi:type="esdl:Point" lat="52.45757844504006" lon="4.83226776123047"/>
          <point xsi:type="esdl:Point" lat="52.45789224881067" lon="4.818191528320313"/>
          <point xsi:type="esdl:Point" lat="52.452975732796084" lon="4.8073768615722665"/>
          <point xsi:type="esdl:Point" lat="52.44638464814447" lon="4.761199951171876"/>
          <point xsi:type="esdl:Point" lat="52.448058667844606" lon="4.750728607177735"/>
          <point xsi:type="esdl:Point" lat="52.459722726233466" lon="4.72214698791504"/>
          <point xsi:type="esdl:Point" lat="52.47334104967815" lon="4.680503010749818"/>
          <point xsi:type="esdl:Point" lat="52.4729816088404" lon="4.67919409275055"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="0dc69471-344e-43c6-85d0-656bba94cb4e" name="In" connectedTo="8b916d9a-a54a-49f1-a9bc-2343801d8907" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="e1113b6a-e57a-4271-b6b7-e42c3a8d9d83" name="Out" connectedTo="0c85933d-b982-4ea0-afea-312941724388" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="d4d99037-5329-4180-91f5-3849241f65e7">
          <investmentCosts xsi:type="esdl:SingleValue" id="1c5ce372-1a5d-40bf-b7bb-0175de55ec14" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="34666435-580a-4e2a-8c15-52ee757271f3" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="1de0318f-1f3e-4b54-ac87-6b1ec01732cd" name="Cable_BeRo" length="58080.8" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.47224637980084" lon="4.680004119873048"/>
          <point xsi:type="esdl:Point" lat="52.46625952439808" lon="4.679317474365235"/>
          <point xsi:type="esdl:Point" lat="52.460141110388065" lon="4.674596786499024"/>
          <point xsi:type="esdl:Point" lat="52.45208651703025" lon="4.670476913452149"/>
          <point xsi:type="esdl:Point" lat="52.44936645146913" lon="4.668416976928712"/>
          <point xsi:type="esdl:Point" lat="52.44570455946863" lon="4.667644500732423"/>
          <point xsi:type="esdl:Point" lat="52.42001044535863" lon="4.708328247070313"/>
          <point xsi:type="esdl:Point" lat="52.377275885161175" lon="4.698028564453126"/>
          <point xsi:type="esdl:Point" lat="52.373359099561206" lon="4.694745540618897"/>
          <point xsi:type="esdl:Point" lat="52.34954962454371" lon="4.693479537963868"/>
          <point xsi:type="esdl:Point" lat="52.33219220651926" lon="4.667129516601563"/>
          <point xsi:type="esdl:Point" lat="52.3298843629478" lon="4.655113220214845"/>
          <point xsi:type="esdl:Point" lat="52.302810665287076" lon="4.617347717285157"/>
          <point xsi:type="esdl:Point" lat="52.29504228453735" lon="4.619407653808595"/>
          <point xsi:type="esdl:Point" lat="52.274459988242945" lon="4.589195251464845"/>
          <point xsi:type="esdl:Point" lat="52.2650057304896" lon="4.591941833496095"/>
          <point xsi:type="esdl:Point" lat="52.24777278710507" lon="4.625930786132813"/>
          <point xsi:type="esdl:Point" lat="52.24377883252849" lon="4.626617431640626"/>
          <point xsi:type="esdl:Point" lat="52.226327341430775" lon="4.60155487060547"/>
          <point xsi:type="esdl:Point" lat="52.211603882535336" lon="4.605331420898438"/>
          <point xsi:type="esdl:Point" lat="52.19098283926205" lon="4.603271484375001"/>
          <point xsi:type="esdl:Point" lat="52.164877192574174" lon="4.559669494628907"/>
          <point xsi:type="esdl:Point" lat="52.162139422839424" lon="4.55760955810547"/>
          <point xsi:type="esdl:Point" lat="52.1482373781785" lon="4.574775695800782"/>
          <point xsi:type="esdl:Point" lat="52.12358217331795" lon="4.578895568847657"/>
          <point xsi:type="esdl:Point" lat="52.0917420348066" lon="4.57408905029297"/>
          <point xsi:type="esdl:Point" lat="52.03834301907822" lon="4.549026489257813"/>
          <point xsi:type="esdl:Point" lat="52.03733985771698" lon="4.544906616210938"/>
          <point xsi:type="esdl:Point" lat="52.03733985771698" lon="4.540357589721681"/>
          <point xsi:type="esdl:Point" lat="52.03871259916833" lon="4.533662796020509"/>
          <point xsi:type="esdl:Point" lat="52.03654793408148" lon="4.525680662217898"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="738603f9-2172-4df7-a156-8a4f0277c8fc" name="In" connectedTo="c9391ab3-32b5-4700-bf66-9c77feb9a9e9" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="f2cbd336-3d2f-4c8a-8050-2d8f7c76d055" name="Out" connectedTo="45025e3c-e3f1-4c3d-a1ad-5de1d1bfde03" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="506907cd-0bdd-4589-a958-4579c1a4d7ac">
          <investmentCosts xsi:type="esdl:SingleValue" id="1cac324e-0bf8-42a5-ad91-03c658434bbc" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="ad45fc57-ee5b-46dc-bde7-ea1941f43fc4" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="83635576-58e3-4f37-a469-d20848a82d99" name="Cable_MaRo" length="48142.2" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="52.03544566929224" lon="4.527997970581056"/>
          <point xsi:type="esdl:Point" lat="52.03516846425432" lon="4.52388882637024"/>
          <point xsi:type="esdl:Point" lat="52.03683826859462" lon="4.512805938720704"/>
          <point xsi:type="esdl:Point" lat="52.03168345429596" lon="4.505832195281983"/>
          <point xsi:type="esdl:Point" lat="52.03176926272717" lon="4.474396705627442"/>
          <point xsi:type="esdl:Point" lat="52.02918173611148" lon="4.47070598602295"/>
          <point xsi:type="esdl:Point" lat="52.0259867262715" lon="4.470105171203614"/>
          <point xsi:type="esdl:Point" lat="52.01972807036208" lon="4.4571876525878915"/>
          <point xsi:type="esdl:Point" lat="52.0007619019789" lon="4.456672668457032"/>
          <point xsi:type="esdl:Point" lat="51.97420104709299" lon="4.338741302490235"/>
          <point xsi:type="esdl:Point" lat="52.00274342370294" lon="4.31264877319336"/>
          <point xsi:type="esdl:Point" lat="52.015819267184305" lon="4.307971000671388"/>
          <point xsi:type="esdl:Point" lat="52.01618903346187" lon="4.305138587951661"/>
          <point xsi:type="esdl:Point" lat="51.98971661404223" lon="4.247460365295411"/>
          <point xsi:type="esdl:Point" lat="51.983135709615745" lon="4.224929809570313"/>
          <point xsi:type="esdl:Point" lat="51.98205201415632" lon="4.222784042358399"/>
          <point xsi:type="esdl:Point" lat="51.9824484911463" lon="4.221067428588868"/>
          <point xsi:type="esdl:Point" lat="51.981999150292495" lon="4.217419624328614"/>
          <point xsi:type="esdl:Point" lat="51.97917084262293" lon="4.215831756591798"/>
          <point xsi:type="esdl:Point" lat="51.97605156729463" lon="4.214973449707032"/>
          <point xsi:type="esdl:Point" lat="51.96251456880403" lon="4.180212020874024"/>
          <point xsi:type="esdl:Point" lat="51.96317565001811" lon="4.168281555175782"/>
          <point xsi:type="esdl:Point" lat="51.95963875207031" lon="4.162960052490235"/>
          <point xsi:type="esdl:Point" lat="51.94579919686418" lon="4.1523170471191415"/>
          <point xsi:type="esdl:Point" lat="51.939079554520696" lon="4.152832031250001"/>
          <point xsi:type="esdl:Point" lat="51.93653958505238" lon="4.151973724365235"/>
          <point xsi:type="esdl:Point" lat="51.93463451358274" lon="4.141416549682618"/>
          <point xsi:type="esdl:Point" lat="51.93447575397574" lon="4.137296676635743"/>
          <point xsi:type="esdl:Point" lat="51.935851651908045" lon="4.132747650146485"/>
          <point xsi:type="esdl:Point" lat="51.93987326548989" lon="4.110946655273438"/>
          <point xsi:type="esdl:Point" lat="51.9390266399568" lon="4.105796813964845"/>
          <point xsi:type="esdl:Point" lat="51.93378778918764" lon="4.098587036132813"/>
          <point xsi:type="esdl:Point" lat="51.93558705942854" lon="4.082708358764649"/>
          <point xsi:type="esdl:Point" lat="51.935216627335905" lon="4.069404602050782"/>
          <point xsi:type="esdl:Point" lat="51.92833661838154" lon="4.039793014526368"/>
          <point xsi:type="esdl:Point" lat="51.928654180475206" lon="4.037046432495118"/>
          <point xsi:type="esdl:Point" lat="51.95185659423948" lon="4.0232276916503915"/>
          <point xsi:type="esdl:Point" lat="51.95433618791945" lon="4.023334980010987"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d10788ea-3fb2-4594-9c64-9dad84beefa9" name="In" connectedTo="333c45c4-a0ca-42cf-8657-09df30d8bcbe" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="290e0bb7-7951-43ab-aa4a-c64232823848" name="Out" connectedTo="4d7cd68e-6ae8-4dbe-822d-ab5b97b7827c" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="80f386a1-10a6-4b22-afbc-a2ab5db6041b">
          <investmentCosts xsi:type="esdl:SingleValue" id="f5773b64-9c90-4fa5-bf18-2138e94f5dad" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="27607f3c-eec4-4276-a64b-06bc78e7466f" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="db813da5-a730-4748-9bc0-5c2a772ae375" name="Cable_DiRo" length="57330.2" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.91576464727188" lon="4.632368087768556"/>
          <point xsi:type="esdl:Point" lat="51.951883043962226" lon="4.68669891357422"/>
          <point xsi:type="esdl:Point" lat="51.97409530077295" lon="4.712448120117188"/>
          <point xsi:type="esdl:Point" lat="52.0041172272724" lon="4.752960205078125"/>
          <point xsi:type="esdl:Point" lat="52.02102212588851" lon="4.802742004394532"/>
          <point xsi:type="esdl:Point" lat="52.04362244469156" lon="4.856643676757813"/>
          <point xsi:type="esdl:Point" lat="52.06346750521128" lon="4.886512756347657"/>
          <point xsi:type="esdl:Point" lat="52.07444183716456" lon="4.918441772460938"/>
          <point xsi:type="esdl:Point" lat="52.159559447222726" lon="4.986033439636231"/>
          <point xsi:type="esdl:Point" lat="52.162534303868725" lon="4.988265037536622"/>
          <point xsi:type="esdl:Point" lat="52.17116815975394" lon="4.985303878784181"/>
          <point xsi:type="esdl:Point" lat="52.20918456174935" lon="4.98556137084961"/>
          <point xsi:type="esdl:Point" lat="52.21144610476088" lon="4.988393783569337"/>
          <point xsi:type="esdl:Point" lat="52.2296920181494" lon="5.003585815429688"/>
          <point xsi:type="esdl:Point" lat="52.24609116583923" lon="5.007362365722656"/>
          <point xsi:type="esdl:Point" lat="52.26542596253758" lon="5.008735656738281"/>
          <point xsi:type="esdl:Point" lat="52.3284156725276" lon="5.007019042968751"/>
          <point xsi:type="esdl:Point" lat="52.335955306808124" lon="5.012619495391847"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="b4773b73-ff2d-4fd4-aa02-e0538f7469c4" name="In" connectedTo="a1fe66e8-a5e0-4620-b39c-ac3817e919a7" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="8b5b1553-4da4-40a3-a993-cea5f677d512" name="Out" connectedTo="366a15c7-43af-4c45-add3-79ddf58562d1" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="71685c93-f60b-4fd3-ac5f-38133f50365d">
          <investmentCosts xsi:type="esdl:SingleValue" id="2521e30c-a94d-45bc-ba68-41e9264bd441" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="ece780bd-3533-4a71-8f7f-10754f27c6d4" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" id="7e0c8edb-c3c5-41da-8943-6a9b8eff27c8" name="Cable_MaV2" length="57185.6" capacity="4000000000.0">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lat="51.839085537487634" lon="4.2657503485679635"/>
          <point xsi:type="esdl:Point" lat="51.838782671786554" lon="4.266388714313508"/>
          <point xsi:type="esdl:Point" lat="51.82134933886301" lon="4.317798614501954"/>
          <point xsi:type="esdl:Point" lat="51.82103101804979" lon="4.3363380432128915"/>
          <point xsi:type="esdl:Point" lat="51.81296614056922" lon="4.349555969238282"/>
          <point xsi:type="esdl:Point" lat="51.80033534061772" lon="4.454956054687501"/>
          <point xsi:type="esdl:Point" lat="51.81063130136729" lon="4.4764137268066415"/>
          <point xsi:type="esdl:Point" lat="51.81201099369774" lon="4.50817108154297"/>
          <point xsi:type="esdl:Point" lat="51.80378528014933" lon="4.5423316955566415"/>
          <point xsi:type="esdl:Point" lat="51.790567926497296" lon="4.568510055541993"/>
          <point xsi:type="esdl:Point" lat="51.763802870291954" lon="4.570312500000001"/>
          <point xsi:type="esdl:Point" lat="51.76167797947606" lon="4.572629928588868"/>
          <point xsi:type="esdl:Point" lat="51.75965924056717" lon="4.603271484375001"/>
          <point xsi:type="esdl:Point" lat="51.76853039355072" lon="4.652452468872071"/>
          <point xsi:type="esdl:Point" lat="51.7682648154821" lon="4.688415527343751"/>
          <point xsi:type="esdl:Point" lat="51.77649700903517" lon="4.734249114990234"/>
          <point xsi:type="esdl:Point" lat="51.79316923802566" lon="4.7483253479003915"/>
          <point xsi:type="esdl:Point" lat="51.795027225829145" lon="4.748411178588868"/>
          <point xsi:type="esdl:Point" lat="51.802246108975304" lon="4.738025665283204"/>
          <point xsi:type="esdl:Point" lat="51.81259469696911" lon="4.743690490722656"/>
          <point xsi:type="esdl:Point" lat="51.8129528747791" lon="4.746415615081788"/>
          <point xsi:type="esdl:Point" lat="51.81419984198432" lon="4.745900630950929"/>
          <point xsi:type="esdl:Point" lat="51.81512841216984" lon="4.744720458984376"/>
          <point xsi:type="esdl:Point" lat="51.827993772336626" lon="4.744098186492921"/>
          <point xsi:type="esdl:Point" lat="51.83397425050641" lon="4.731760025024414"/>
          <point xsi:type="esdl:Point" lat="51.836095737064575" lon="4.722747802734376"/>
          <point xsi:type="esdl:Point" lat="51.86037963477381" lon="4.717941284179688"/>
          <point xsi:type="esdl:Point" lat="51.875855106240806" lon="4.681549072265626"/>
          <point xsi:type="esdl:Point" lat="51.9117143994815" lon="4.646787643432618"/>
          <point xsi:type="esdl:Point" lat="51.91515580982431" lon="4.638290405273438"/>
          <point xsi:type="esdl:Point" lat="51.91472399347842" lon="4.634326100349427"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9ae0d399-8901-4ce5-a1d2-10941fdde56f" name="In" connectedTo="2ac72af7-2734-4f07-845a-2457cb5170eb" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <port xsi:type="esdl:OutPort" id="614c1b30-f457-4322-bf70-f26f77717de6" name="Out" connectedTo="d1371d0b-005d-4661-8b54-cc1168619101" carrier="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
        <costInformation xsi:type="esdl:CostInformation" id="0cd3a9cc-803b-48ca-a98e-af71b7a326f6">
          <investmentCosts xsi:type="esdl:SingleValue" id="adc76ff6-0105-4284-ac71-0f68346e01ad" value="60000.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="9c34b584-be68-49b0-a771-a51f1a9cddfa" unit="EURO" perUnit="METRE" description="Cost in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
    </area>
  </instance>
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="df818709-e977-495b-9e27-18b83e62f37b">
    <carriers xsi:type="esdl:Carriers" id="81b9c861-68d8-49a7-8eb5-e6374be9469d">
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="380000.0" name="380kV" id="c2bcf264-0b42-4172-97ad-00fd1eb6555a"/>
      <carrier xsi:type="esdl:GasCommodity" name="Hydrogen" pressure="50.0" id="ddd5df8f-0bf3-4fcf-b55c-283a5d923e76"/>
      <carrier xsi:type="esdl:HeatCommodity" id="f73c2bd6-f040-4538-bebe-1efbebd308ff" name="Heat_sup" supplyTemperature="80.0"/>
      <carrier xsi:type="esdl:HeatCommodity" id="aad1f42c-c113-436a-80d7-2e47c4bf740f" name="Heat_ret" returnTemperature="40.0"/>
    </carriers>
  </energySystemInformation>
</esdl:EnergySystem>
