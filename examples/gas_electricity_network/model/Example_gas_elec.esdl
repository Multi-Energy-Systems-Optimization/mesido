<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" esdlVersion="v2401" id="b6cc80d8-65cc-4433-93c0-930a68cf7c78" version="2" name="elec">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="ec68a25e-7b95-4e92-b93f-22fb720c108b">
    <carriers xsi:type="esdl:Carriers" id="carrs">
      <carrier xsi:type="esdl:ElectricityCommodity" voltage="230.0" name="Elec" id="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc"/>
      <carrier xsi:type="esdl:GasCommodity" name="Gas" id="96ba9649-f9dd-4ee9-917c-753bd002e780" pressure="5.0"/>
      <carrier xsi:type="esdl:HeatCommodity" supplyTemperature="80.0" name="Heat_sup" id="d8829f14-19dd-428d-8b9e-e968852087b1"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" name="Heat_ret" id="ee6cc489-0e74-4085-a31c-aa9606f131cc"/>
    </carriers>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="4c7e8273-7bec-42a5-9e4c-d982905d1c97" name="Instance0">
    <area xsi:type="esdl:Area" name="Untitled Area" id="c39ed818-7af5-4419-a490-68bdfb9af4ef">
      <asset xsi:type="esdl:ElectricityCable" length="10.23" id="718fddc2-dc1e-4096-bb04-757725261dae" capacity="100000.0" name="Cable_19">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.50982712005984" lon="3.9850277628976367"/>
          <point xsi:type="esdl:Point" lat="51.50986716137029" lon="3.984993393023394"/>
          <point xsi:type="esdl:Point" lat="51.5098716373044" lon="3.9849918143359866"/>
          <point xsi:type="esdl:Point" lat="51.5098752491791" lon="3.9849931436073565"/>
          <point xsi:type="esdl:Point" lat="51.50989254824975" lon="3.985011338669078"/>
          <point xsi:type="esdl:Point" lat="51.5098952614788" lon="3.985012695655126"/>
          <point xsi:type="esdl:Point" lat="51.50989704147689" lon="3.9850112001062974"/>
          <point xsi:type="esdl:Point" lat="51.50989704147689" lon="3.9850112001062974"/>
          <point xsi:type="esdl:Point" lat="51.50989978385532" lon="3.985005252061893"/>
          <point xsi:type="esdl:Point" lat="51.50989978385532" lon="3.985005252061893"/>
          <point xsi:type="esdl:Point" lat="51.50990324548977" lon="3.984998561507427"/>
          <point xsi:type="esdl:Point" lat="51.50990324548977" lon="3.984998561507427"/>
          <point xsi:type="esdl:Point" lat="51.50990493906405" lon="3.984995109329026"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="1d5a6d97-3f63-4013-807c-35b612b34af6" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="71ce1d05-9994-421c-9fa6-2932be785f5f"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="98880cae-4756-4a18-92a4-a32915586c99" connectedTo="7b330f78-1e38-4730-aaa9-cef7c700f439"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="15.78" id="bf4dac95-4a9d-4bc3-a3d0-d5d17a762a8c" capacity="100000.0" name="Cable_48">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.514942056741425" lon="3.9900760532214234"/>
          <point xsi:type="esdl:Point" lat="51.51494859635724" lon="3.9900741376803617"/>
          <point xsi:type="esdl:Point" lat="51.51498199331245" lon="3.990064365591116"/>
          <point xsi:type="esdl:Point" lat="51.51499540408785" lon="3.990058190188701"/>
          <point xsi:type="esdl:Point" lat="51.51497278374866" lon="3.9899445565516416"/>
          <point xsi:type="esdl:Point" lat="51.51498391067237" lon="3.989940598124798"/>
          <point xsi:type="esdl:Point" lat="51.51498531603313" lon="3.9899400938706955"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="7bccd98b-fa90-4725-bb75-2af09a91359b" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="3a1453e7-8235-4413-b9db-df387123c879"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="b4cdc549-b194-47f9-b4ce-52063deac2b7" connectedTo="36c65c6e-fcdc-4e46-9f10-0649c2f3287c"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="496.49" id="f756e39d-4f36-43dd-a897-080ea08a8c3f" capacity="100000.0" name="Cable_56">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.5052687161934" lon="3.9796742080994103"/>
          <point xsi:type="esdl:Point" lat="51.50527736202378" lon="3.979654623231547"/>
          <point xsi:type="esdl:Point" lat="51.50528096740422" lon="3.97964645917509"/>
          <point xsi:type="esdl:Point" lat="51.505283511809644" lon="3.9796405175355374"/>
          <point xsi:type="esdl:Point" lat="51.505283511809644" lon="3.9796405175355374"/>
          <point xsi:type="esdl:Point" lat="51.50528533911535" lon="3.9796362402752776"/>
          <point xsi:type="esdl:Point" lat="51.50528533911535" lon="3.9796362402752776"/>
          <point xsi:type="esdl:Point" lat="51.506086734927884" lon="3.9805650706461186"/>
          <point xsi:type="esdl:Point" lat="51.508128057740194" lon="3.9829336599667533"/>
          <point xsi:type="esdl:Point" lat="51.508725942127775" lon="3.983622367395197"/>
          <point xsi:type="esdl:Point" lat="51.50873470166912" lon="3.9836308847941466"/>
          <point xsi:type="esdl:Point" lat="51.50887253883554" lon="3.983775720367213"/>
          <point xsi:type="esdl:Point" lat="51.50887253883554" lon="3.983775720367213"/>
          <point xsi:type="esdl:Point" lat="51.508882880222245" lon="3.9837879490320667"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="6d394e9f-2265-412d-9489-855b86ef9d62" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="0328f50d-2861-4076-9591-d43db3d88205"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="efdb5ac1-f3c6-4588-9c6a-054c0e6a8e42" connectedTo="9e9e6bd8-9979-4b34-b45b-b1082c626b98"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="3.37" id="c94b4de7-24a6-44bd-8cc3-f9819102a194" capacity="100000.0" name="Cable_61">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515014481486844" lon="3.989927541275302"/>
          <point xsi:type="esdl:Point" lat="51.51501102112954" lon="3.9899291028537456"/>
          <point xsi:type="esdl:Point" lat="51.51501102112954" lon="3.9899291028537456"/>
          <point xsi:type="esdl:Point" lat="51.515008005072566" lon="3.9899309821646964"/>
          <point xsi:type="esdl:Point" lat="51.515008005072566" lon="3.9899309821646964"/>
          <point xsi:type="esdl:Point" lat="51.51500649738872" lon="3.9899319506258393"/>
          <point xsi:type="esdl:Point" lat="51.51500649738872" lon="3.9899319506258393"/>
          <point xsi:type="esdl:Point" lat="51.5150059623366" lon="3.9899323128665976"/>
          <point xsi:type="esdl:Point" lat="51.514995078194616" lon="3.9899370274688937"/>
          <point xsi:type="esdl:Point" lat="51.51498531603313" lon="3.9899400938706955"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="86282b1b-079a-495c-b470-746b54332746" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="33b61a32-abc1-41ea-852e-fc59c5320d05"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="5e2775c4-5f5c-4ecc-83d2-e81dec66cc50" connectedTo="36c65c6e-fcdc-4e46-9f10-0649c2f3287c"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="670.77" id="62022f57-3f47-43c3-8059-f44121a58b8f" capacity="100000.0" name="Cable_163">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.514942056741425" lon="3.9900760532214234"/>
          <point xsi:type="esdl:Point" lat="51.514904950932504" lon="3.9900869046154503"/>
          <point xsi:type="esdl:Point" lat="51.51483317981371" lon="3.990099195889271"/>
          <point xsi:type="esdl:Point" lat="51.51476135700166" lon="3.9901071662821184"/>
          <point xsi:type="esdl:Point" lat="51.5147118797425" lon="3.9901043643088663"/>
          <point xsi:type="esdl:Point" lat="51.514662316330075" lon="3.9900943609550756"/>
          <point xsi:type="esdl:Point" lat="51.51458026378938" lon="3.9900738296030185"/>
          <point xsi:type="esdl:Point" lat="51.51444657483191" lon="3.990020305978105"/>
          <point xsi:type="esdl:Point" lat="51.514379540792355" lon="3.9899777013320183"/>
          <point xsi:type="esdl:Point" lat="51.51416612681477" lon="3.989812676311851"/>
          <point xsi:type="esdl:Point" lat="51.514164493567826" lon="3.9898114153919884"/>
          <point xsi:type="esdl:Point" lat="51.514116417204704" lon="3.98977543255393"/>
          <point xsi:type="esdl:Point" lat="51.51372458449958" lon="3.9894099926158932"/>
          <point xsi:type="esdl:Point" lat="51.513424757466886" lon="3.9890705448685355"/>
          <point xsi:type="esdl:Point" lat="51.51298986000051" lon="3.9885623657073297"/>
          <point xsi:type="esdl:Point" lat="51.5122861666452" lon="3.9877541512853854"/>
          <point xsi:type="esdl:Point" lat="51.51154410292605" lon="3.9868952778389377"/>
          <point xsi:type="esdl:Point" lat="51.51117481418845" lon="3.986461475743307"/>
          <point xsi:type="esdl:Point" lat="51.510600910524595" lon="3.9858046876463713"/>
          <point xsi:type="esdl:Point" lat="51.510600910524595" lon="3.9858046876463713"/>
          <point xsi:type="esdl:Point" lat="51.51059458301472" lon="3.985797304697289"/>
          <point xsi:type="esdl:Point" lat="51.51059458301472" lon="3.985797304697289"/>
          <point xsi:type="esdl:Point" lat="51.51050096280675" lon="3.985687140358196"/>
          <point xsi:type="esdl:Point" lat="51.51050096280675" lon="3.985687140358196"/>
          <point xsi:type="esdl:Point" lat="51.51049507217048" lon="3.9856802049914957"/>
          <point xsi:type="esdl:Point" lat="51.50990768687918" lon="3.984999346562661"/>
          <point xsi:type="esdl:Point" lat="51.50990493906405" lon="3.984995109329026"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="7bccd98b-fa90-4725-bb75-2af09a91359b" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="83387a46-8947-42bb-ba93-3eb3d52fe599"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="576e3200-d6d1-4afc-8222-801b5efb3b6e" connectedTo="7b330f78-1e38-4730-aaa9-cef7c700f439"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="141.31" id="b8ab93f0-d11b-4b33-bb85-db05405cd1e7" capacity="100000.0" name="Cable_214">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.50990493906405" lon="3.984995109329026"/>
          <point xsi:type="esdl:Point" lat="51.50895251818358" lon="3.983886197036733"/>
          <point xsi:type="esdl:Point" lat="51.50894411187531" lon="3.98387640089514"/>
          <point xsi:type="esdl:Point" lat="51.508882880222245" lon="3.9837879490320667"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="765733b6-3ebc-4dc1-87a2-dcf8f975372d" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="94cd88ec-e583-415a-8700-4a1a4816b6ee"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="4de0cf63-1052-4881-98d4-99f6d181c818" connectedTo="9e9e6bd8-9979-4b34-b45b-b1082c626b98"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="0.2" id="06cf771e-7f91-49dc-b93f-4ed566d95420" capacity="100000.0" name="Cable_243">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51509577058398" lon="3.989833925398175"/>
          <point xsi:type="esdl:Point" lat="51.51509625782333" lon="3.9898318212322654"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="54504f64-cf26-4fec-ba08-12c445830484" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="1c03b5e7-03b5-4228-aee6-f51fcf32e336"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="9b814fd8-5939-4b15-bced-cbbc3bf84482" connectedTo="28c5c0f2-3d62-4d95-bbcc-26f0598ee4be"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="14.57" id="5b5a76e5-8c25-4305-9305-8fe40c4da8d2" capacity="100000.0" name="Cable_254">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515014481486844" lon="3.989927541275302"/>
          <point xsi:type="esdl:Point" lat="51.515013922902114" lon="3.9899236826429423"/>
          <point xsi:type="esdl:Point" lat="51.51502758726263" lon="3.9899154102139502"/>
          <point xsi:type="esdl:Point" lat="51.51503169762043" lon="3.989917834131599"/>
          <point xsi:type="esdl:Point" lat="51.51505861909058" lon="3.989904068148532"/>
          <point xsi:type="esdl:Point" lat="51.51506109393709" lon="3.9899057931081843"/>
          <point xsi:type="esdl:Point" lat="51.51506163036777" lon="3.9899055460898523"/>
          <point xsi:type="esdl:Point" lat="51.51506163036777" lon="3.9899055460898523"/>
          <point xsi:type="esdl:Point" lat="51.51506202335965" lon="3.989905332296502"/>
          <point xsi:type="esdl:Point" lat="51.51506202335965" lon="3.989905332296502"/>
          <point xsi:type="esdl:Point" lat="51.51506595327842" lon="3.9899031943628036"/>
          <point xsi:type="esdl:Point" lat="51.51506595327842" lon="3.9899031943628036"/>
          <point xsi:type="esdl:Point" lat="51.515100677810594" lon="3.989882661612229"/>
          <point xsi:type="esdl:Point" lat="51.51508931724107" lon="3.9898400455239074"/>
          <point xsi:type="esdl:Point" lat="51.51509577058398" lon="3.989833925398175"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="86282b1b-079a-495c-b470-746b54332746" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="2133753c-2e1a-4054-a328-21de82d358fc"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="99ccb045-b25a-42fb-9f3e-f29deb024857" connectedTo="00eb89b6-4d74-4fba-a387-12bc4326688e"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="0.2" id="0c5e23d8-8c90-4d5b-8fc6-11e06f1772c9" capacity="100000.0" name="Cable_261">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51509577058398" lon="3.989833925398175"/>
          <point xsi:type="esdl:Point" lat="51.51509683010041" lon="3.9898345700178446"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="54504f64-cf26-4fec-ba08-12c445830484" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="fb62b76c-36fb-47c3-a6b9-9c329d6a7ecb"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="645d9c4b-f893-4d4f-844e-fde6f1e5c522" connectedTo="f5c0dc0a-951a-4979-ae1b-b5c774b963ca"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="39.66" id="f28965e6-ab41-49d7-aa7a-dad9c2387abf" capacity="100000.0" name="Cable_377">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51406603297594" lon="3.9937593175744994"/>
          <point xsi:type="esdl:Point" lat="51.514114891479686" lon="3.993710274071706"/>
          <point xsi:type="esdl:Point" lat="51.51418240167623" lon="3.993635444922274"/>
          <point xsi:type="esdl:Point" lat="51.514215149681384" lon="3.9935991417276915"/>
          <point xsi:type="esdl:Point" lat="51.514266497802225" lon="3.993532732052377"/>
          <point xsi:type="esdl:Point" lat="51.51429033158107" lon="3.9934959815871918"/>
          <point xsi:type="esdl:Point" lat="51.51431490929312" lon="3.9934462411233524"/>
          <point xsi:type="esdl:Point" lat="51.51431490929312" lon="3.9934462411233524"/>
          <point xsi:type="esdl:Point" lat="51.514326127596604" lon="3.9934069957389355"/>
          <point xsi:type="esdl:Point" lat="51.51432951590905" lon="3.9933896023183686"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="28ac1054-5c84-4552-98de-bed6a58751f7" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="056d43c4-4bde-4d5e-bb4c-3a27f9494337"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="dbec74d2-e7e5-43d6-b146-0c901a623138" connectedTo="a0b7133d-9f4d-4829-aa22-309806d819c9"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="118.58" id="106a07df-9f6d-4a4f-9a72-30e63940c20f" capacity="100000.0" name="Cable_381">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516774598890514" lon="3.993830469376887"/>
          <point xsi:type="esdl:Point" lat="51.51673680413265" lon="3.9938273051784807"/>
          <point xsi:type="esdl:Point" lat="51.51669356593364" lon="3.993819985217594"/>
          <point xsi:type="esdl:Point" lat="51.51669356593364" lon="3.993819985217594"/>
          <point xsi:type="esdl:Point" lat="51.51665934858114" lon="3.993815270514905"/>
          <point xsi:type="esdl:Point" lat="51.516580444600564" lon="3.9938091734305465"/>
          <point xsi:type="esdl:Point" lat="51.51646400057478" lon="3.993800163755438"/>
          <point xsi:type="esdl:Point" lat="51.51643865301696" lon="3.993798203034894"/>
          <point xsi:type="esdl:Point" lat="51.51642610072732" lon="3.9937972333602856"/>
          <point xsi:type="esdl:Point" lat="51.51642021583795" lon="3.99379676534817"/>
          <point xsi:type="esdl:Point" lat="51.516408779418114" lon="3.99379589114967"/>
          <point xsi:type="esdl:Point" lat="51.51640130203191" lon="3.993795313454251"/>
          <point xsi:type="esdl:Point" lat="51.51636707330687" lon="3.993792659576405"/>
          <point xsi:type="esdl:Point" lat="51.516364616905264" lon="3.993792475512031"/>
          <point xsi:type="esdl:Point" lat="51.51635251445494" lon="3.99379153527828"/>
          <point xsi:type="esdl:Point" lat="51.516335436668385" lon="3.993787246255651"/>
          <point xsi:type="esdl:Point" lat="51.5163250134146" lon="3.993784640793648"/>
          <point xsi:type="esdl:Point" lat="51.5162871159074" lon="3.9937751256298335"/>
          <point xsi:type="esdl:Point" lat="51.51627217513321" lon="3.9937713762774174"/>
          <point xsi:type="esdl:Point" lat="51.51621037438889" lon="3.993755879415144"/>
          <point xsi:type="esdl:Point" lat="51.51620670451901" lon="3.9937549544862017"/>
          <point xsi:type="esdl:Point" lat="51.516200807599404" lon="3.9937534782521085"/>
          <point xsi:type="esdl:Point" lat="51.51616099859761" lon="3.9937434886138212"/>
          <point xsi:type="esdl:Point" lat="51.51614555286103" lon="3.9937396106744383"/>
          <point xsi:type="esdl:Point" lat="51.516141955226544" lon="3.9937387123509924"/>
          <point xsi:type="esdl:Point" lat="51.516135201669805" lon="3.9937370174334865"/>
          <point xsi:type="esdl:Point" lat="51.51604913684851" lon="3.993715434776651"/>
          <point xsi:type="esdl:Point" lat="51.51603746017616" lon="3.9937125075544855"/>
          <point xsi:type="esdl:Point" lat="51.51600446780514" lon="3.9937042253691075"/>
          <point xsi:type="esdl:Point" lat="51.51599514811785" lon="3.993702191273607"/>
          <point xsi:type="esdl:Point" lat="51.515988144829684" lon="3.9937006625148985"/>
          <point xsi:type="esdl:Point" lat="51.515982547556646" lon="3.993699436462349"/>
          <point xsi:type="esdl:Point" lat="51.51596371895025" lon="3.993695330851008"/>
          <point xsi:type="esdl:Point" lat="51.515894506242134" lon="3.9936802198830126"/>
          <point xsi:type="esdl:Point" lat="51.51583314039743" lon="3.9936604882675275"/>
          <point xsi:type="esdl:Point" lat="51.51582953102593" lon="3.9936593597811973"/>
          <point xsi:type="esdl:Point" lat="51.51579828246975" lon="3.9936495545584405"/>
          <point xsi:type="esdl:Point" lat="51.51578712030841" lon="3.993646049669029"/>
          <point xsi:type="esdl:Point" lat="51.51571770100284" lon="3.9936294466921978"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="b32c896d-203c-417d-a51a-06f0d2c0bdaa" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="238183db-c16c-49e8-9c7c-71ab02bf0e1e"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="d21b5281-ac7d-4885-990c-5f516a13c1ea" connectedTo="df54f6c3-d764-49e8-868e-09f22d4660b8"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="28.12" id="828255bb-0b66-4759-b848-e6b8f098f5b2" capacity="100000.0" name="Cable_486">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51562805271911" lon="3.9946247868553093"/>
          <point xsi:type="esdl:Point" lat="51.515638721732095" lon="3.9946246329454196"/>
          <point xsi:type="esdl:Point" lat="51.515666039656885" lon="3.9946229604638925"/>
          <point xsi:type="esdl:Point" lat="51.5158357337964" lon="3.994631536862769"/>
          <point xsi:type="esdl:Point" lat="51.5158357337964" lon="3.994631536862769"/>
          <point xsi:type="esdl:Point" lat="51.515935733796404" lon="3.994631536862769"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ac655af3-4287-4c61-81d0-7ecaf9515b99" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="43dcdd29-8e3b-4fc3-bd9d-2a882f7442c3"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="a5429906-aea4-4785-ab8e-ad80bf1d609e" connectedTo="e849ea15-988c-4695-b697-2cf4dabf67be"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="6.71" id="74f3fb5f-2937-4f39-8f2b-2b216c3ca242" capacity="100000.0" name="Cable_551">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51509740149241" lon="3.9898327370212305"/>
          <point xsi:type="esdl:Point" lat="51.515104342614805" lon="3.989829065704142"/>
          <point xsi:type="esdl:Point" lat="51.51514867937708" lon="3.989792186665839"/>
          <point xsi:type="esdl:Point" lat="51.51514867937708" lon="3.989792186665839"/>
          <point xsi:type="esdl:Point" lat="51.51515139612085" lon="3.989790086008347"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="68c15c71-bb17-4ba8-ab35-67d2976082a6" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="22e6564d-c02f-4627-971a-1962e770632d"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="b5cbdc0f-1e33-4f24-9c49-60877e712322" connectedTo="e2411af5-2e07-420a-96f8-cb392e7f4891"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="0.2" id="9296887a-2ce1-4bfc-8d85-1b8e701945bf" capacity="100000.0" name="Cable_598">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51509683010041" lon="3.9898345700178446"/>
          <point xsi:type="esdl:Point" lat="51.51509740149241" lon="3.9898327370212305"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="1551eaa3-df31-4241-9c03-db2e1fd1c67d" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="a2f1c222-3a36-4e41-aaaf-42b846295263"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="9c0fc11e-cd95-4125-b732-e2c89992c690" connectedTo="4ee9bf2b-76d1-4fb8-a600-154f8f699489"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="10.87" id="6558829c-4be3-49f5-80c6-7d7529a6cd3c" capacity="100000.0" name="Cable_602">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51518630078258" lon="3.989825177786908"/>
          <point xsi:type="esdl:Point" lat="51.51519132985557" lon="3.989821738130877"/>
          <point xsi:type="esdl:Point" lat="51.51523604971001" lon="3.989791330951028"/>
          <point xsi:type="esdl:Point" lat="51.515275947050156" lon="3.989762844163574"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="a77a4141-a57d-488f-b08e-1579cb5805e0" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="3c18a4d4-7e91-499b-9e72-22a0d2bc68a6"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="1bb469d4-b948-455a-8986-8929b5d805ae" connectedTo="355e083b-9090-45a7-a613-6afd92df4886"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="12.13" id="bf2c0f73-2b10-4b08-97c7-c55d99412da8" capacity="100000.0" name="Cable_634">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516774598890514" lon="3.993830469376887"/>
          <point xsi:type="esdl:Point" lat="51.51677530850403" lon="3.9938145980270474"/>
          <point xsi:type="esdl:Point" lat="51.51677097666532" lon="3.9938071662191796"/>
          <point xsi:type="esdl:Point" lat="51.5167174907061" lon="3.9937155092083816"/>
          <point xsi:type="esdl:Point" lat="51.51671901301933" lon="3.993692408609754"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="b32c896d-203c-417d-a51a-06f0d2c0bdaa" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="98e41b0e-b973-494e-bd29-8499f0c2dc61"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="ef846fc5-5b37-4a94-9bfc-ddb852dd4a6c" connectedTo="ecfdad02-4cd0-4e04-8085-5c8477f50915"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="10.2" id="f1c4edf4-a559-438d-8af8-46ba50a2ef90" capacity="100000.0" name="Cable_662">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51560752084822" lon="3.9935117939061904"/>
          <point xsi:type="esdl:Point" lat="51.51560760679111" lon="3.9935189954505015"/>
          <point xsi:type="esdl:Point" lat="51.51560822556678" lon="3.9935708465704702"/>
          <point xsi:type="esdl:Point" lat="51.51562799581608" lon="3.99357024051536"/>
          <point xsi:type="esdl:Point" lat="51.51562866613081" lon="3.993626412588246"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="89699f97-ac8e-400d-9fa7-d6734cbc3dfb" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="b02b55f7-fb3d-4160-b009-b1a469335a8e"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="4da03038-37e1-4ec5-9b8e-1abb4a2a6cff" connectedTo="6d32e370-7ea4-4ad1-a0ae-a73911dd6c69"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="16.03" id="f8ac00b3-ca62-4d26-8753-33cbd9a4ec86" capacity="100000.0" name="Cable_693">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51566474911341" lon="3.992507216435024"/>
          <point xsi:type="esdl:Point" lat="51.515653908897896" lon="3.992277014985413"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="58c4a1cc-c2f9-4b99-b82b-460fe8d3ca5f" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="c631deae-5906-4bd5-b341-44a3a1976dd9"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="421de0c2-c079-4cd4-9a67-fe25a4ec0b08" connectedTo="1263796a-3a58-44e6-a6ec-62610d63a796"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="0.2" id="4c3dde0c-af62-4dd1-b423-c66586836315" capacity="100000.0" name="Cable_737">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51509625782333" lon="3.9898318212322654"/>
          <point xsi:type="esdl:Point" lat="51.51509740149241" lon="3.9898327370212305"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="3468b779-4eb2-446a-92c1-f8973d54c5ab" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="843e3a3b-b3d8-4a05-b8ae-f144ab4ee43b"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="05fb8826-f9e0-4e4b-98c9-ef8e49023471" connectedTo="4ee9bf2b-76d1-4fb8-a600-154f8f699489"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="11.41" id="0bf2f9b4-6be6-4db7-b348-630ce12d3d37" capacity="100000.0" name="Cable_763">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51614895093966" lon="3.9964734377668205"/>
          <point xsi:type="esdl:Point" lat="51.51612283867499" lon="3.996469914025545"/>
          <point xsi:type="esdl:Point" lat="51.51605964168639" lon="3.9964473528774076"/>
          <point xsi:type="esdl:Point" lat="51.51604822747045" lon="3.9964438117686347"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="73b5868d-dc12-4107-9cd2-6a296814efd8" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="55fa234d-802c-4d6e-ba34-36e25be1dd48"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="4e458d5e-ba70-4e90-b146-a5316dc1885a" connectedTo="31e2543c-a401-45fb-8365-7db43a70d7cc"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="9.92" id="3de6341a-66a0-487e-8e3d-43d8c0398ddb" capacity="100000.0" name="Cable_768">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51571770100284" lon="3.9936294466921978"/>
          <point xsi:type="esdl:Point" lat="51.51570418691284" lon="3.993626979271213"/>
          <point xsi:type="esdl:Point" lat="51.51570328826514" lon="3.9936270068181248"/>
          <point xsi:type="esdl:Point" lat="51.51567541299897" lon="3.9936264204606995"/>
          <point xsi:type="esdl:Point" lat="51.51562866613081" lon="3.993626412588246"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="08ebd14a-544c-48a8-9863-558f7130812a" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="55afae0c-3346-4e63-91f2-f38fc4b13390"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="97a2d0a9-8202-4264-ad59-0de29f8c33dc" connectedTo="6d32e370-7ea4-4ad1-a0ae-a73911dd6c69"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="6.279999999999999" id="7ea92ba1-1faf-4f79-b2eb-1b798ffe527c" capacity="100000.0" name="Cable_813">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51518630078258" lon="3.989825177786908"/>
          <point xsi:type="esdl:Point" lat="51.515169313554885" lon="3.989774377811148"/>
          <point xsi:type="esdl:Point" lat="51.515155014662405" lon="3.9897867185241043"/>
          <point xsi:type="esdl:Point" lat="51.515155014662405" lon="3.9897867185241043"/>
          <point xsi:type="esdl:Point" lat="51.51515139612085" lon="3.989790086008347"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="a77a4141-a57d-488f-b08e-1579cb5805e0" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="c3147289-f30c-4701-bf0e-9e355a27fb8a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="fd06b635-c166-462e-a063-4ae740b3c3aa" connectedTo="e2411af5-2e07-420a-96f8-cb392e7f4891"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="2.1" id="db802b0e-de63-41d1-a5fa-30773f27d06f" capacity="100000.0" name="Cable_832">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51566474911341" lon="3.992507216435024"/>
          <point xsi:type="esdl:Point" lat="51.5156674450555" lon="3.992507133727982"/>
          <point xsi:type="esdl:Point" lat="51.515683603507" lon="3.9925051971747205"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="58c4a1cc-c2f9-4b99-b82b-460fe8d3ca5f" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="8fcff925-85b2-4ea9-a651-921923921cd2"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="354d4a35-7528-4b11-9ece-48feb107206e" connectedTo="439d9cc2-f027-4491-b511-4b0e00d25d63"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="67.3" id="f5f7fe13-b93c-45c8-846b-e783ad522e2e" capacity="100000.0" name="Cable_919">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516774598890514" lon="3.993830469376887"/>
          <point xsi:type="esdl:Point" lat="51.516774671682974" lon="3.993835063529721"/>
          <point xsi:type="esdl:Point" lat="51.516775269997574" lon="3.9938731562747876"/>
          <point xsi:type="esdl:Point" lat="51.516776142393034" lon="3.993928948946318"/>
          <point xsi:type="esdl:Point" lat="51.51677659939811" lon="3.9939582134740834"/>
          <point xsi:type="esdl:Point" lat="51.51677698721781" lon="3.99398318632182"/>
          <point xsi:type="esdl:Point" lat="51.516777295717084" lon="3.994003017685045"/>
          <point xsi:type="esdl:Point" lat="51.5167773388971" lon="3.9940058836984997"/>
          <point xsi:type="esdl:Point" lat="51.51677741374458" lon="3.9940106506934963"/>
          <point xsi:type="esdl:Point" lat="51.516777521805714" lon="3.994017448301213"/>
          <point xsi:type="esdl:Point" lat="51.5167779316577" lon="3.994043515537798"/>
          <point xsi:type="esdl:Point" lat="51.516778319802796" lon="3.994068517194093"/>
          <point xsi:type="esdl:Point" lat="51.51677896413959" lon="3.9941097208185603"/>
          <point xsi:type="esdl:Point" lat="51.51677922377061" lon="3.994126210855715"/>
          <point xsi:type="esdl:Point" lat="51.51677989614407" lon="3.9941690129910605"/>
          <point xsi:type="esdl:Point" lat="51.51678012204039" lon="3.994183429205612"/>
          <point xsi:type="esdl:Point" lat="51.516780583620346" lon="3.9942130826326245"/>
          <point xsi:type="esdl:Point" lat="51.51678076788284" lon="3.994224762464903"/>
          <point xsi:type="esdl:Point" lat="51.516781011639246" lon="3.9942406766403225"/>
          <point xsi:type="esdl:Point" lat="51.516781720615796" lon="3.9942857974618615"/>
          <point xsi:type="esdl:Point" lat="51.5167821381384" lon="3.994312512859753"/>
          <point xsi:type="esdl:Point" lat="51.51678250526806" lon="3.994335757298491"/>
          <point xsi:type="esdl:Point" lat="51.51678369222829" lon="3.994411914287558"/>
          <point xsi:type="esdl:Point" lat="51.516784178024515" lon="3.9944428493529247"/>
          <point xsi:type="esdl:Point" lat="51.51678440629183" lon="3.9944574672190423"/>
          <point xsi:type="esdl:Point" lat="51.516784493144804" lon="3.9944632424583295"/>
          <point xsi:type="esdl:Point" lat="51.51678514730475" lon="3.9945052814963753"/>
          <point xsi:type="esdl:Point" lat="51.516785275316494" lon="3.994513000653259"/>
          <point xsi:type="esdl:Point" lat="51.51678566542225" lon="3.9945381751601627"/>
          <point xsi:type="esdl:Point" lat="51.516786237860735" lon="3.9945748710648474"/>
          <point xsi:type="esdl:Point" lat="51.51678706332139" lon="3.9946275096823327"/>
          <point xsi:type="esdl:Point" lat="51.51678729792028" lon="3.9946426604788385"/>
          <point xsi:type="esdl:Point" lat="51.51678755077799" lon="3.9946585887875217"/>
          <point xsi:type="esdl:Point" lat="51.51678775337262" lon="3.9946718097949185"/>
          <point xsi:type="esdl:Point" lat="51.516789754849256" lon="3.9947997124130348"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="b32c896d-203c-417d-a51a-06f0d2c0bdaa" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="79f29a27-810a-4b47-8f7a-0b15e048a7c7"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="b7aa6f57-698e-47e8-b215-a23fc15c7305" connectedTo="11fa5a80-3e2f-43a4-9408-0a6f442662fa"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="23.73" id="f48c46e6-b8cf-4251-aa99-496e648fb771" capacity="100000.0" name="Cable_1007">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515957061443" lon="3.9894364476904225"/>
          <point xsi:type="esdl:Point" lat="51.515944809086655" lon="3.989395947558206"/>
          <point xsi:type="esdl:Point" lat="51.51593459748242" lon="3.9893622143145335"/>
          <point xsi:type="esdl:Point" lat="51.51592721867228" lon="3.989346591879402"/>
          <point xsi:type="esdl:Point" lat="51.51592079022699" lon="3.989335262767478"/>
          <point xsi:type="esdl:Point" lat="51.515914413501434" lon="3.9893282546082633"/>
          <point xsi:type="esdl:Point" lat="51.515905358076694" lon="3.9893227696637363"/>
          <point xsi:type="esdl:Point" lat="51.515890046607886" lon="3.989320358778497"/>
          <point xsi:type="esdl:Point" lat="51.51588197603095" lon="3.989322047783506"/>
          <point xsi:type="esdl:Point" lat="51.515873041288174" lon="3.9893266450503804"/>
          <point xsi:type="esdl:Point" lat="51.51582306614181" lon="3.9892071508360716"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="fb1e1a13-cd11-4b6a-995b-d102de4b2417" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="cdf321c0-680f-4613-b64d-a024de69d34e"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="8f8eb2e7-8240-4e27-8065-2daa65cf8c6e" connectedTo="a01734ab-dd66-40ae-b5f3-1409b98edd02"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="149.62" id="b63ba0fb-f5e4-40b6-a38d-6ef75e0cc92f" capacity="100000.0" name="Cable_1030">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51562805271911" lon="3.9946247868553093"/>
          <point xsi:type="esdl:Point" lat="51.51562877223401" lon="3.994663263957944"/>
          <point xsi:type="esdl:Point" lat="51.51562944691217" lon="3.994697981852444"/>
          <point xsi:type="esdl:Point" lat="51.5156294677487" lon="3.9946989753911857"/>
          <point xsi:type="esdl:Point" lat="51.51563026411428" lon="3.9947401300971284"/>
          <point xsi:type="esdl:Point" lat="51.51562892356575" lon="3.9948863151663416"/>
          <point xsi:type="esdl:Point" lat="51.515628613557226" lon="3.9949198817334937"/>
          <point xsi:type="esdl:Point" lat="51.51562851888113" lon="3.9949307917622052"/>
          <point xsi:type="esdl:Point" lat="51.515627528106585" lon="3.9950384669657715"/>
          <point xsi:type="esdl:Point" lat="51.51562738522479" lon="3.995086811389749"/>
          <point xsi:type="esdl:Point" lat="51.51562731981696" lon="3.9951099820357014"/>
          <point xsi:type="esdl:Point" lat="51.51562705207772" lon="3.9952006476345248"/>
          <point xsi:type="esdl:Point" lat="51.51562675320123" lon="3.9953037918233827"/>
          <point xsi:type="esdl:Point" lat="51.515626627462375" lon="3.995346040982584"/>
          <point xsi:type="esdl:Point" lat="51.515626462442285" lon="3.995401590259244"/>
          <point xsi:type="esdl:Point" lat="51.515629941855" lon="3.9955426856660643"/>
          <point xsi:type="esdl:Point" lat="51.515632528657584" lon="3.9956088849385054"/>
          <point xsi:type="esdl:Point" lat="51.515633753395235" lon="3.9956362233347043"/>
          <point xsi:type="esdl:Point" lat="51.51563765690942" lon="3.9956620389017314"/>
          <point xsi:type="esdl:Point" lat="51.51564517217309" lon="3.9956891847598377"/>
          <point xsi:type="esdl:Point" lat="51.51565292393514" lon="3.9957090183462154"/>
          <point xsi:type="esdl:Point" lat="51.515653517432916" lon="3.995710541875756"/>
          <point xsi:type="esdl:Point" lat="51.51565496434998" lon="3.995713523345865"/>
          <point xsi:type="esdl:Point" lat="51.51566181120503" lon="3.995727578064502"/>
          <point xsi:type="esdl:Point" lat="51.51567100362304" lon="3.99574458675444"/>
          <point xsi:type="esdl:Point" lat="51.51567829708633" lon="3.9957538730497526"/>
          <point xsi:type="esdl:Point" lat="51.515691998593184" lon="3.9957713200785463"/>
          <point xsi:type="esdl:Point" lat="51.51571676781739" lon="3.995798687148491"/>
          <point xsi:type="esdl:Point" lat="51.5157275263746" lon="3.9958105761871305"/>
          <point xsi:type="esdl:Point" lat="51.515762903278834" lon="3.995847733347545"/>
          <point xsi:type="esdl:Point" lat="51.515846875814404" lon="3.9959359508713708"/>
          <point xsi:type="esdl:Point" lat="51.51585679891435" lon="3.995946381474916"/>
          <point xsi:type="esdl:Point" lat="51.51592523784359" lon="3.9960256083501755"/>
          <point xsi:type="esdl:Point" lat="51.515988973125516" lon="3.9960993889037995"/>
          <point xsi:type="esdl:Point" lat="51.51604366406975" lon="3.996162553583345"/>
          <point xsi:type="esdl:Point" lat="51.5160587608732" lon="3.9962367708718483"/>
          <point xsi:type="esdl:Point" lat="51.516059515065535" lon="3.996240465187593"/>
          <point xsi:type="esdl:Point" lat="51.516064812381565" lon="3.9962663248513697"/>
          <point xsi:type="esdl:Point" lat="51.51605570240944" lon="3.996380776476076"/>
          <point xsi:type="esdl:Point" lat="51.51604916524223" lon="3.996437256034141"/>
          <point xsi:type="esdl:Point" lat="51.51604916524223" lon="3.996437256034141"/>
          <point xsi:type="esdl:Point" lat="51.51604822747045" lon="3.9964438117686347"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ac655af3-4287-4c61-81d0-7ecaf9515b99" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="3e7fbb83-81ea-4aa2-9d98-e2f60c38d14d"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="43fd79e0-2595-42a2-804e-b02602f0545f" connectedTo="31e2543c-a401-45fb-8365-7db43a70d7cc"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="88.17" id="698d11cf-8f53-47a1-b494-9dd90ac712f1" capacity="100000.0" name="Cable_1072">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516461999236384" lon="3.9922695098760186"/>
          <point xsi:type="esdl:Point" lat="51.516441399165906" lon="3.9922759054242176"/>
          <point xsi:type="esdl:Point" lat="51.51627754884469" lon="3.992331363013523"/>
          <point xsi:type="esdl:Point" lat="51.51625898805235" lon="3.992336889056736"/>
          <point xsi:type="esdl:Point" lat="51.51625162474012" lon="3.9923390889558155"/>
          <point xsi:type="esdl:Point" lat="51.51624139487422" lon="3.9923421404610004"/>
          <point xsi:type="esdl:Point" lat="51.51623768634466" lon="3.9923432484385897"/>
          <point xsi:type="esdl:Point" lat="51.51620342232561" lon="3.992353449171191"/>
          <point xsi:type="esdl:Point" lat="51.51620327007166" lon="3.9923534970683274"/>
          <point xsi:type="esdl:Point" lat="51.51619931976735" lon="3.9923546845049454"/>
          <point xsi:type="esdl:Point" lat="51.516196515774865" lon="3.992355505373453"/>
          <point xsi:type="esdl:Point" lat="51.51618355380774" lon="3.9923593755333706"/>
          <point xsi:type="esdl:Point" lat="51.516144121278884" lon="3.992371132447925"/>
          <point xsi:type="esdl:Point" lat="51.51614131745829" lon="3.992371967717642"/>
          <point xsi:type="esdl:Point" lat="51.51613350619787" lon="3.9923742966171756"/>
          <point xsi:type="esdl:Point" lat="51.516132619289486" lon="3.9923745543654547"/>
          <point xsi:type="esdl:Point" lat="51.51609550685825" lon="3.9923856205032346"/>
          <point xsi:type="esdl:Point" lat="51.51609287326445" lon="3.992386407322797"/>
          <point xsi:type="esdl:Point" lat="51.51608310015902" lon="3.992389315115697"/>
          <point xsi:type="esdl:Point" lat="51.51608029633828" lon="3.992390150383137"/>
          <point xsi:type="esdl:Point" lat="51.5160352651506" lon="3.9924035774993847"/>
          <point xsi:type="esdl:Point" lat="51.51603079500645" lon="3.9924048961442375"/>
          <point xsi:type="esdl:Point" lat="51.5160253665781" lon="3.9924065179512067"/>
          <point xsi:type="esdl:Point" lat="51.51602175655498" lon="3.9924075940788497"/>
          <point xsi:type="esdl:Point" lat="51.51599304659655" lon="3.99241615464563"/>
          <point xsi:type="esdl:Point" lat="51.51598553085659" lon="3.9924183880120885"/>
          <point xsi:type="esdl:Point" lat="51.51598006665415" lon="3.9924200253218225"/>
          <point xsi:type="esdl:Point" lat="51.51597414551772" lon="3.992421791917936"/>
          <point xsi:type="esdl:Point" lat="51.515948794648274" lon="3.9924293416751184"/>
          <point xsi:type="esdl:Point" lat="51.515790232919976" lon="3.9924759907922334"/>
          <point xsi:type="esdl:Point" lat="51.51572578832966" lon="3.992499580490864"/>
          <point xsi:type="esdl:Point" lat="51.515683603507" lon="3.9925051971747205"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="966682b0-eeef-4bc1-8280-999c639e8b19" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="5bed49c6-7f25-4963-8a36-dae38f1dcd47"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="5d69f994-fcea-4cd9-9f7f-05aa2e041f38" connectedTo="439d9cc2-f027-4491-b511-4b0e00d25d63"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="144.17" id="8f51d645-169f-4d84-968f-ed934e565352" capacity="100000.0" name="Cable_1088">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51560752084822" lon="3.9935117939061904"/>
          <point xsi:type="esdl:Point" lat="51.51558073009317" lon="3.993507168851953"/>
          <point xsi:type="esdl:Point" lat="51.515565424769655" lon="3.9935045114450545"/>
          <point xsi:type="esdl:Point" lat="51.5155579749052" lon="3.993503226954433"/>
          <point xsi:type="esdl:Point" lat="51.51542687711391" lon="3.9934663119360336"/>
          <point xsi:type="esdl:Point" lat="51.51539299773834" lon="3.9934567748912"/>
          <point xsi:type="esdl:Point" lat="51.51533044343408" lon="3.9934391550139736"/>
          <point xsi:type="esdl:Point" lat="51.51526797034914" lon="3.9934215615108473"/>
          <point xsi:type="esdl:Point" lat="51.51525836399682" lon="3.9934188591056152"/>
          <point xsi:type="esdl:Point" lat="51.515239566217" lon="3.993413571251914"/>
          <point xsi:type="esdl:Point" lat="51.51523519346048" lon="3.9934132586565254"/>
          <point xsi:type="esdl:Point" lat="51.515196116888646" lon="3.9934104079538915"/>
          <point xsi:type="esdl:Point" lat="51.51508660702371" lon="3.993402411647778"/>
          <point xsi:type="esdl:Point" lat="51.515059949962875" lon="3.993401456696241"/>
          <point xsi:type="esdl:Point" lat="51.515034165277825" lon="3.9934005326329696"/>
          <point xsi:type="esdl:Point" lat="51.514999836172244" lon="3.9934000146081283"/>
          <point xsi:type="esdl:Point" lat="51.51498170963665" lon="3.993399749068072"/>
          <point xsi:type="esdl:Point" lat="51.51493172969809" lon="3.9934000134393703"/>
          <point xsi:type="esdl:Point" lat="51.51492925772935" lon="3.9934000315925324"/>
          <point xsi:type="esdl:Point" lat="51.51491731551332" lon="3.993401218981389"/>
          <point xsi:type="esdl:Point" lat="51.514871377999384" lon="3.993405753895616"/>
          <point xsi:type="esdl:Point" lat="51.51481456334284" lon="3.993414094622391"/>
          <point xsi:type="esdl:Point" lat="51.514813621137925" lon="3.9934142387730174"/>
          <point xsi:type="esdl:Point" lat="51.51478394333038" lon="3.993420047376667"/>
          <point xsi:type="esdl:Point" lat="51.514756059379955" lon="3.993425512815913"/>
          <point xsi:type="esdl:Point" lat="51.514594990357296" lon="3.993488082891037"/>
          <point xsi:type="esdl:Point" lat="51.51451410313291" lon="3.993457424123119"/>
          <point xsi:type="esdl:Point" lat="51.51446133730653" lon="3.9934374297398114"/>
          <point xsi:type="esdl:Point" lat="51.514454665015045" lon="3.9934350120362625"/>
          <point xsi:type="esdl:Point" lat="51.51438963013211" lon="3.993411417239455"/>
          <point xsi:type="esdl:Point" lat="51.514387535471236" lon="3.9934106602017585"/>
          <point xsi:type="esdl:Point" lat="51.51432951590905" lon="3.9933896023183686"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="89699f97-ac8e-400d-9fa7-d6734cbc3dfb" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="3d6a973d-b021-486e-b191-622f119d0c1d"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="10b82fd7-b9da-43a7-95ce-d10c62e2622d" connectedTo="a0b7133d-9f4d-4829-aa22-309806d819c9"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="109.34" id="2735413e-5fab-435a-8c6c-07cbf65de131" capacity="100000.0" name="Cable_1155">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51614895093966" lon="3.9964734377668205"/>
          <point xsi:type="esdl:Point" lat="51.516157993848395" lon="3.9964356269235357"/>
          <point xsi:type="esdl:Point" lat="51.516161796025536" lon="3.9964197332699873"/>
          <point xsi:type="esdl:Point" lat="51.51617908286863" lon="3.9963615702921067"/>
          <point xsi:type="esdl:Point" lat="51.51618948926842" lon="3.9963295531416265"/>
          <point xsi:type="esdl:Point" lat="51.5162086419818" lon="3.9962770964213337"/>
          <point xsi:type="esdl:Point" lat="51.51623535602479" lon="3.9962194373521647"/>
          <point xsi:type="esdl:Point" lat="51.51625334081154" lon="3.996180632353108"/>
          <point xsi:type="esdl:Point" lat="51.516275292341064" lon="3.996136734990848"/>
          <point xsi:type="esdl:Point" lat="51.516294650849524" lon="3.9961015620736178"/>
          <point xsi:type="esdl:Point" lat="51.51631497662434" lon="3.9960721229574143"/>
          <point xsi:type="esdl:Point" lat="51.516351256643375" lon="3.996026619913641"/>
          <point xsi:type="esdl:Point" lat="51.5163649856336" lon="3.9960093993679298"/>
          <point xsi:type="esdl:Point" lat="51.5164141354454" lon="3.9959477537618326"/>
          <point xsi:type="esdl:Point" lat="51.51641506547083" lon="3.9959465870199833"/>
          <point xsi:type="esdl:Point" lat="51.51644748782191" lon="3.99590929947879"/>
          <point xsi:type="esdl:Point" lat="51.51648998461723" lon="3.9958604360053553"/>
          <point xsi:type="esdl:Point" lat="51.51651396455034" lon="3.995832873205916"/>
          <point xsi:type="esdl:Point" lat="51.51653558530424" lon="3.995808004957059"/>
          <point xsi:type="esdl:Point" lat="51.516561090478476" lon="3.9957786807887308"/>
          <point xsi:type="esdl:Point" lat="51.5165746943531" lon="3.9957630344605453"/>
          <point xsi:type="esdl:Point" lat="51.51661710869437" lon="3.9957012198386503"/>
          <point xsi:type="esdl:Point" lat="51.51662276783761" lon="3.9956917962496874"/>
          <point xsi:type="esdl:Point" lat="51.51662944950417" lon="3.9956806699531557"/>
          <point xsi:type="esdl:Point" lat="51.51662944950417" lon="3.9956806699531557"/>
          <point xsi:type="esdl:Point" lat="51.51663738287997" lon="3.9956674593065906"/>
          <point xsi:type="esdl:Point" lat="51.51665762273048" lon="3.995630818058076"/>
          <point xsi:type="esdl:Point" lat="51.51667063905719" lon="3.9955915161602165"/>
          <point xsi:type="esdl:Point" lat="51.516680180922286" lon="3.9955624066854374"/>
          <point xsi:type="esdl:Point" lat="51.51668322908342" lon="3.995547371559798"/>
          <point xsi:type="esdl:Point" lat="51.51668782250039" lon="3.9955247101540285"/>
          <point xsi:type="esdl:Point" lat="51.516687834809254" lon="3.9955242342902793"/>
          <point xsi:type="esdl:Point" lat="51.51668873919868" lon="3.995487723787359"/>
          <point xsi:type="esdl:Point" lat="51.5166890362131" lon="3.995475683433796"/>
          <point xsi:type="esdl:Point" lat="51.51668762262103" lon="3.9954325006236044"/>
          <point xsi:type="esdl:Point" lat="51.51670324899725" lon="3.9953859143826915"/>
          <point xsi:type="esdl:Point" lat="51.51670324899725" lon="3.9953859143826915"/>
          <point xsi:type="esdl:Point" lat="51.51670737218251" lon="3.9953735839772127"/>
          <point xsi:type="esdl:Point" lat="51.516738840432446" lon="3.9952796411209133"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="73b5868d-dc12-4107-9cd2-6a296814efd8" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="0fb6defe-40f6-4b82-a120-787a32045aa3"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="c60350fb-7936-45e0-8a07-dd636d0a55f0" connectedTo="855f806e-c758-41e6-9a21-dabe2be1f836"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="49.99" id="020f7b6c-3941-4479-95f0-1715d2e2e749" capacity="100000.0" name="Cable_1192">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516461999236384" lon="3.9922695098760186"/>
          <point xsi:type="esdl:Point" lat="51.516501384877465" lon="3.9922553335746778"/>
          <point xsi:type="esdl:Point" lat="51.51650307635051" lon="3.9922659872957547"/>
          <point xsi:type="esdl:Point" lat="51.51651050251523" lon="3.9923127028014567"/>
          <point xsi:type="esdl:Point" lat="51.51651178541306" lon="3.9923207610978295"/>
          <point xsi:type="esdl:Point" lat="51.51651596561997" lon="3.99234710152388"/>
          <point xsi:type="esdl:Point" lat="51.5165294412185" lon="3.992421613053281"/>
          <point xsi:type="esdl:Point" lat="51.51653904754109" lon="3.9924626999817634"/>
          <point xsi:type="esdl:Point" lat="51.5165408098496" lon="3.992470253684601"/>
          <point xsi:type="esdl:Point" lat="51.516554027357984" lon="3.9925231602164883"/>
          <point xsi:type="esdl:Point" lat="51.51656169848344" lon="3.9925482408964723"/>
          <point xsi:type="esdl:Point" lat="51.5165736729754" lon="3.9925873965127323"/>
          <point xsi:type="esdl:Point" lat="51.51659539344126" lon="3.9926416992744036"/>
          <point xsi:type="esdl:Point" lat="51.51663417307616" lon="3.9927386328094574"/>
          <point xsi:type="esdl:Point" lat="51.516675602728924" lon="3.992842185271193"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="966682b0-eeef-4bc1-8280-999c639e8b19" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="67289ce7-1845-4bb4-ac8c-e57ede338452"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="f2007946-182e-4099-b9cf-fd5a6c82a260" connectedTo="0d71b427-0b80-43a4-9203-49cfc92b5293"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="74.76" id="7df5feb8-7154-4032-a719-f79a8a65cdd0" capacity="100000.0" name="Cable_1341">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515594620591564" lon="3.99114094843952"/>
          <point xsi:type="esdl:Point" lat="51.51582818914665" lon="3.9911098146674377"/>
          <point xsi:type="esdl:Point" lat="51.515828905827895" lon="3.9911291575944974"/>
          <point xsi:type="esdl:Point" lat="51.51583164791643" lon="3.9911795605449734"/>
          <point xsi:type="esdl:Point" lat="51.51583957412344" lon="3.991325231394906"/>
          <point xsi:type="esdl:Point" lat="51.51584238519544" lon="3.9913769001917596"/>
          <point xsi:type="esdl:Point" lat="51.51585086609732" lon="3.9915328993361703"/>
          <point xsi:type="esdl:Point" lat="51.515853837140796" lon="3.9915874305255863"/>
          <point xsi:type="esdl:Point" lat="51.515861789934135" lon="3.99173386433836"/>
          <point xsi:type="esdl:Point" lat="51.51586194999374" lon="3.9917367267054495"/>
          <point xsi:type="esdl:Point" lat="51.51586194999374" lon="3.9917367267054495"/>
          <point xsi:type="esdl:Point" lat="51.515961949993745" lon="3.9917367267054495"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="97600cc2-49b9-4bc3-b57d-4298a8ba0bad" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="46cb5ef7-3e18-4961-8cca-74c18c6b9af1"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="ddcb4921-37c0-4927-aa1e-429e4f74a52a" connectedTo="ebc4e6a6-f5d9-4967-9343-243d4c6bbed8"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="79.15" id="663b27e1-befe-477a-8340-50791409767b" capacity="100000.0" name="Cable_1382">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515653908897896" lon="3.992277014985413"/>
          <point xsi:type="esdl:Point" lat="51.51565122071477" lon="3.992222806710609"/>
          <point xsi:type="esdl:Point" lat="51.51565106776109" lon="3.9922197856451525"/>
          <point xsi:type="esdl:Point" lat="51.515648012191576" lon="3.992158153928972"/>
          <point xsi:type="esdl:Point" lat="51.51564691062534" lon="3.9921359267938024"/>
          <point xsi:type="esdl:Point" lat="51.515641936345816" lon="3.9920355954465587"/>
          <point xsi:type="esdl:Point" lat="51.515641866080486" lon="3.9920342288075035"/>
          <point xsi:type="esdl:Point" lat="51.5156392123155" lon="3.9919806534711078"/>
          <point xsi:type="esdl:Point" lat="51.51563775594263" lon="3.9919513050890374"/>
          <point xsi:type="esdl:Point" lat="51.515636144880105" lon="3.9919187916146406"/>
          <point xsi:type="esdl:Point" lat="51.515629828444325" lon="3.991781385546571"/>
          <point xsi:type="esdl:Point" lat="51.515627739960216" lon="3.991736005655446"/>
          <point xsi:type="esdl:Point" lat="51.515624446659984" lon="3.991664281029475"/>
          <point xsi:type="esdl:Point" lat="51.515622467064134" lon="3.991621246369427"/>
          <point xsi:type="esdl:Point" lat="51.51562048745244" lon="3.9915782117132768"/>
          <point xsi:type="esdl:Point" lat="51.5156185078249" lon="3.9915351770610266"/>
          <point xsi:type="esdl:Point" lat="51.515616500741125" lon="3.9914913507949774"/>
          <point xsi:type="esdl:Point" lat="51.51561525065634" lon="3.991464229404021"/>
          <point xsi:type="esdl:Point" lat="51.51561306381924" lon="3.9914166480791935"/>
          <point xsi:type="esdl:Point" lat="51.51561016207489" lon="3.99136416104795"/>
          <point xsi:type="esdl:Point" lat="51.51560783564931" lon="3.991322203280266"/>
          <point xsi:type="esdl:Point" lat="51.515606413681034" lon="3.9912964991955864"/>
          <point xsi:type="esdl:Point" lat="51.51560442927696" lon="3.991268867253283"/>
          <point xsi:type="esdl:Point" lat="51.515600323136916" lon="3.9912118929974727"/>
          <point xsi:type="esdl:Point" lat="51.515594620591564" lon="3.99114094843952"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="441be35f-9d8b-44b5-bcf9-fa37822fbba9" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="9a2f5ee4-6455-4592-a83e-e4efc85c3db1"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="16495779-3b31-42ff-878f-d92959a57427" connectedTo="f4c10621-6a53-484d-9f73-200d1551e053"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="78.13" id="70586468-8556-4932-8501-831fe4dda2be" capacity="100000.0" name="Cable_1400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51566474911341" lon="3.992507216435024"/>
          <point xsi:type="esdl:Point" lat="51.51566752731922" lon="3.9925501546255933"/>
          <point xsi:type="esdl:Point" lat="51.51567011937126" lon="3.9925903033058554"/>
          <point xsi:type="esdl:Point" lat="51.515672467268374" lon="3.992626569217181"/>
          <point xsi:type="esdl:Point" lat="51.51567355627266" lon="3.992652269179953"/>
          <point xsi:type="esdl:Point" lat="51.51567594619741" lon="3.992708619091833"/>
          <point xsi:type="esdl:Point" lat="51.51567758347998" lon="3.99274711129238"/>
          <point xsi:type="esdl:Point" lat="51.51567782163925" lon="3.992752752073138"/>
          <point xsi:type="esdl:Point" lat="51.5156787240536" lon="3.9927741208414136"/>
          <point xsi:type="esdl:Point" lat="51.51568158988589" lon="3.992841723523849"/>
          <point xsi:type="esdl:Point" lat="51.5156821133188" lon="3.992853940187094"/>
          <point xsi:type="esdl:Point" lat="51.51568292856228" lon="3.99287328005048"/>
          <point xsi:type="esdl:Point" lat="51.5156851906849" lon="3.9929264640584097"/>
          <point xsi:type="esdl:Point" lat="51.515685766734684" lon="3.992940076722983"/>
          <point xsi:type="esdl:Point" lat="51.51568748158924" lon="3.9929805549166786"/>
          <point xsi:type="esdl:Point" lat="51.51569702793019" lon="3.9931883336730825"/>
          <point xsi:type="esdl:Point" lat="51.515701220647685" lon="3.9932797560099824"/>
          <point xsi:type="esdl:Point" lat="51.51570327314948" lon="3.993324431124866"/>
          <point xsi:type="esdl:Point" lat="51.51571770100284" lon="3.9936294466921978"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="58c4a1cc-c2f9-4b99-b82b-460fe8d3ca5f" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="63507b55-b0d1-4364-b656-cc9e0fd32a3a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="e2162fe2-810f-49ad-9bb5-d85e9f3f2e3f" connectedTo="df54f6c3-d764-49e8-868e-09f22d4660b8"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="102.46000000000001" id="644da878-8fe5-4bee-8b60-0d52bc715b36" capacity="100000.0" name="Cable_1413">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515594620591564" lon="3.99114094843952"/>
          <point xsi:type="esdl:Point" lat="51.515585897662426" lon="3.991058742868422"/>
          <point xsi:type="esdl:Point" lat="51.51558413924703" lon="3.9910470108336153"/>
          <point xsi:type="esdl:Point" lat="51.515583934517494" lon="3.9910456771437484"/>
          <point xsi:type="esdl:Point" lat="51.51557203744766" lon="3.9909664219477206"/>
          <point xsi:type="esdl:Point" lat="51.515568657773166" lon="3.9909439046317012"/>
          <point xsi:type="esdl:Point" lat="51.51556180028049" lon="3.9908981814229594"/>
          <point xsi:type="esdl:Point" lat="51.51555794219718" lon="3.99087249456556"/>
          <point xsi:type="esdl:Point" lat="51.5155379664971" lon="3.9907393842721373"/>
          <point xsi:type="esdl:Point" lat="51.51553782067747" lon="3.9907384666173393"/>
          <point xsi:type="esdl:Point" lat="51.51553602750924" lon="3.990730597109954"/>
          <point xsi:type="esdl:Point" lat="51.51552187802925" lon="3.9906569584774076"/>
          <point xsi:type="esdl:Point" lat="51.515502526643026" lon="3.99057231323745"/>
          <point xsi:type="esdl:Point" lat="51.51545644223137" lon="3.990387919315904"/>
          <point xsi:type="esdl:Point" lat="51.515434937699396" lon="3.9903126770527737"/>
          <point xsi:type="esdl:Point" lat="51.51538998541612" lon="3.990155322060031"/>
          <point xsi:type="esdl:Point" lat="51.51535897032568" lon="3.9900448270400455"/>
          <point xsi:type="esdl:Point" lat="51.51535265069344" lon="3.990022299389135"/>
          <point xsi:type="esdl:Point" lat="51.51533283764184" lon="3.9899517025780407"/>
          <point xsi:type="esdl:Point" lat="51.51531990683205" lon="3.9899055756733515"/>
          <point xsi:type="esdl:Point" lat="51.51531990683205" lon="3.9899055756733515"/>
          <point xsi:type="esdl:Point" lat="51.51531150881497" lon="3.9898798988962825"/>
          <point xsi:type="esdl:Point" lat="51.51528057816081" lon="3.989774228421979"/>
          <point xsi:type="esdl:Point" lat="51.515275947050156" lon="3.989762844163574"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="97600cc2-49b9-4bc3-b57d-4298a8ba0bad" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="d80ee544-566b-459c-89e2-b1f22539f36a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="7d1750de-4ff9-4b40-81b8-3e1bc2f8dd17" connectedTo="355e083b-9090-45a7-a613-6afd92df4886"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="135.81" id="8f58dd3f-812d-4f75-9cb4-0848e8602172" capacity="100000.0" name="Cable_1567">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515653908897896" lon="3.992277014985413"/>
          <point xsi:type="esdl:Point" lat="51.51555694100861" lon="3.992287194455056"/>
          <point xsi:type="esdl:Point" lat="51.51555546336067" lon="3.9922628320579556"/>
          <point xsi:type="esdl:Point" lat="51.51555492637697" lon="3.992254001811"/>
          <point xsi:type="esdl:Point" lat="51.51555209313975" lon="3.992207218403355"/>
          <point xsi:type="esdl:Point" lat="51.515549395766065" lon="3.992162779391973"/>
          <point xsi:type="esdl:Point" lat="51.515544458714075" lon="3.992081365267651"/>
          <point xsi:type="esdl:Point" lat="51.51554332791377" lon="3.9920627123504473"/>
          <point xsi:type="esdl:Point" lat="51.515543294415885" lon="3.992062165861458"/>
          <point xsi:type="esdl:Point" lat="51.515540452459575" lon="3.9920154115603723"/>
          <point xsi:type="esdl:Point" lat="51.51553891880992" lon="3.991990128764638"/>
          <point xsi:type="esdl:Point" lat="51.51553679082662" lon="3.99195498008973"/>
          <point xsi:type="esdl:Point" lat="51.515530503099214" lon="3.991821478096144"/>
          <point xsi:type="esdl:Point" lat="51.51552997535322" lon="3.9918104142826434"/>
          <point xsi:type="esdl:Point" lat="51.515527337160975" lon="3.991754389193638"/>
          <point xsi:type="esdl:Point" lat="51.51552640873171" lon="3.9917346206367266"/>
          <point xsi:type="esdl:Point" lat="51.51552251801592" lon="3.9916520218074836"/>
          <point xsi:type="esdl:Point" lat="51.51552235089757" lon="3.9916485689369243"/>
          <point xsi:type="esdl:Point" lat="51.51551879608371" lon="3.9915730198934063"/>
          <point xsi:type="esdl:Point" lat="51.51551758154813" lon="3.99154736711766"/>
          <point xsi:type="esdl:Point" lat="51.51551631625772" lon="3.9915204767845873"/>
          <point xsi:type="esdl:Point" lat="51.5155136582831" lon="3.9914485167167073"/>
          <point xsi:type="esdl:Point" lat="51.515510541912995" lon="3.9913923622631766"/>
          <point xsi:type="esdl:Point" lat="51.515510220744105" lon="3.991386551157548"/>
          <point xsi:type="esdl:Point" lat="51.51550700091367" lon="3.9913285123970703"/>
          <point xsi:type="esdl:Point" lat="51.51550673582974" lon="3.9913243853450413"/>
          <point xsi:type="esdl:Point" lat="51.515505058969964" lon="3.9912984153855358"/>
          <point xsi:type="esdl:Point" lat="51.51549969592027" lon="3.991215256686418"/>
          <point xsi:type="esdl:Point" lat="51.51549957365406" lon="3.991213300907956"/>
          <point xsi:type="esdl:Point" lat="51.51549953998004" lon="3.991212740017114"/>
          <point xsi:type="esdl:Point" lat="51.5154992755807" lon="3.9912086705786476"/>
          <point xsi:type="esdl:Point" lat="51.515494250879726" lon="3.991140284453926"/>
          <point xsi:type="esdl:Point" lat="51.51549313463757" lon="3.991125117945843"/>
          <point xsi:type="esdl:Point" lat="51.515490482629076" lon="3.991089020075871"/>
          <point xsi:type="esdl:Point" lat="51.51547347292717" lon="3.990958844544767"/>
          <point xsi:type="esdl:Point" lat="51.51545244486114" lon="3.990830190138999"/>
          <point xsi:type="esdl:Point" lat="51.51544721947315" lon="3.99080368084751"/>
          <point xsi:type="esdl:Point" lat="51.515444587856756" lon="3.990790347539497"/>
          <point xsi:type="esdl:Point" lat="51.51544396550306" lon="3.990787168010131"/>
          <point xsi:type="esdl:Point" lat="51.515427438171095" lon="3.990703372652676"/>
          <point xsi:type="esdl:Point" lat="51.515403466095556" lon="3.9905871568449456"/>
          <point xsi:type="esdl:Point" lat="51.51540262654052" lon="3.990583105087293"/>
          <point xsi:type="esdl:Point" lat="51.51540262654052" lon="3.990583105087293"/>
          <point xsi:type="esdl:Point" lat="51.515502626540524" lon="3.990583105087293"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="441be35f-9d8b-44b5-bcf9-fa37822fbba9" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="274b2eff-f8ae-47a8-8b5a-9d6125dc6644"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="afcfed42-0de0-42b4-b3bb-5e027d0b7a92" connectedTo="36601147-0e78-40df-ace9-441685f06b57"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="72.11" id="a5c37f9b-4a2c-49d7-a631-de1dd17ec5ea" capacity="100000.0" name="Cable_1613">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51582306614181" lon="3.9892071508360716"/>
          <point xsi:type="esdl:Point" lat="51.51579105970452" lon="3.989236951922986"/>
          <point xsi:type="esdl:Point" lat="51.51578146173729" lon="3.9892462235126676"/>
          <point xsi:type="esdl:Point" lat="51.515766158251765" lon="3.9892610016581487"/>
          <point xsi:type="esdl:Point" lat="51.51572794403085" lon="3.989297909588798"/>
          <point xsi:type="esdl:Point" lat="51.51569906992339" lon="3.989325784367861"/>
          <point xsi:type="esdl:Point" lat="51.515676390242234" lon="3.9893476908819214"/>
          <point xsi:type="esdl:Point" lat="51.5156486005758" lon="3.989374538075278"/>
          <point xsi:type="esdl:Point" lat="51.51564620095196" lon="3.989376845156187"/>
          <point xsi:type="esdl:Point" lat="51.51561713323828" lon="3.989405820823066"/>
          <point xsi:type="esdl:Point" lat="51.51560607283285" lon="3.989416837493035"/>
          <point xsi:type="esdl:Point" lat="51.51558932694206" lon="3.9894335329583277"/>
          <point xsi:type="esdl:Point" lat="51.51558248631865" lon="3.9894403423086526"/>
          <point xsi:type="esdl:Point" lat="51.51557203009396" lon="3.989450764051545"/>
          <point xsi:type="esdl:Point" lat="51.51551705708595" lon="3.989505548954758"/>
          <point xsi:type="esdl:Point" lat="51.515493861476024" lon="3.989528667043005"/>
          <point xsi:type="esdl:Point" lat="51.51548806918338" lon="3.98953443555189"/>
          <point xsi:type="esdl:Point" lat="51.51535062330179" lon="3.9896928297857723"/>
          <point xsi:type="esdl:Point" lat="51.515275947050156" lon="3.989762844163574"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="6b0238d5-22ee-4185-a42c-8eeb2045ab30" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="afdaf7d4-f1f4-4e8d-b3bb-bfd501f2a489"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="9118b565-d43c-4f5a-9c69-df2bfafb002c" connectedTo="355e083b-9090-45a7-a613-6afd92df4886"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="69.31" id="39ac22d1-f98a-40ba-9f37-202986411dbf" capacity="100000.0" name="Cable_1628">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51562866613081" lon="3.993626412588246"/>
          <point xsi:type="esdl:Point" lat="51.51562897549773" lon="3.993652338160993"/>
          <point xsi:type="esdl:Point" lat="51.51562807485805" lon="3.993708702471808"/>
          <point xsi:type="esdl:Point" lat="51.515627431036314" lon="3.9937489215409077"/>
          <point xsi:type="esdl:Point" lat="51.515627428824274" lon="3.993750996413076"/>
          <point xsi:type="esdl:Point" lat="51.51562724509085" lon="3.9938953306209353"/>
          <point xsi:type="esdl:Point" lat="51.51562715926978" lon="3.993955199999902"/>
          <point xsi:type="esdl:Point" lat="51.51562713489497" lon="3.9939780235938955"/>
          <point xsi:type="esdl:Point" lat="51.5156270427917" lon="3.9940456592717175"/>
          <point xsi:type="esdl:Point" lat="51.515626938054396" lon="3.9941303260200987"/>
          <point xsi:type="esdl:Point" lat="51.51562690369482" lon="3.994154576347"/>
          <point xsi:type="esdl:Point" lat="51.51562690199099" lon="3.994156694428487"/>
          <point xsi:type="esdl:Point" lat="51.515626987796104" lon="3.994194787509453"/>
          <point xsi:type="esdl:Point" lat="51.515627052115605" lon="3.994221282516981"/>
          <point xsi:type="esdl:Point" lat="51.5156275579104" lon="3.9944438329897447"/>
          <point xsi:type="esdl:Point" lat="51.51562757086483" lon="3.994448688210833"/>
          <point xsi:type="esdl:Point" lat="51.51562758032074" lon="3.994451742493865"/>
          <point xsi:type="esdl:Point" lat="51.51562761397487" lon="3.994466625300664"/>
          <point xsi:type="esdl:Point" lat="51.515627756597304" lon="3.994529844823035"/>
          <point xsi:type="esdl:Point" lat="51.51562805271911" lon="3.9946247868553093"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="95299be4-418f-4dac-b509-76463499d972" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="4896bbaa-04a4-40b1-b3d2-9775fee46d37"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="2a40aeae-0629-41f2-b3ee-22c15ad4744b" connectedTo="c8aaa365-2bcd-4b84-8843-39625c013046"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="204.72" id="03cbfa1a-9c39-4cb1-b2c8-56b69bbbf051" capacity="100000.0" name="Cable_1639">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516461999236384" lon="3.9922695098760186"/>
          <point xsi:type="esdl:Point" lat="51.51643944660334" lon="3.992118464656127"/>
          <point xsi:type="esdl:Point" lat="51.51643430642834" lon="3.992084012881527"/>
          <point xsi:type="esdl:Point" lat="51.516429401534204" lon="3.992051196476882"/>
          <point xsi:type="esdl:Point" lat="51.51642449611465" lon="3.9920183368693816"/>
          <point xsi:type="esdl:Point" lat="51.5164216231707" lon="3.9919990886714385"/>
          <point xsi:type="esdl:Point" lat="51.516421222203405" lon="3.991996377748056"/>
          <point xsi:type="esdl:Point" lat="51.51641824214499" lon="3.9919764412265164"/>
          <point xsi:type="esdl:Point" lat="51.51641146004249" lon="3.9919309740584894"/>
          <point xsi:type="esdl:Point" lat="51.516410737396015" lon="3.9919261693511388"/>
          <point xsi:type="esdl:Point" lat="51.51640172790208" lon="3.99186582882985"/>
          <point xsi:type="esdl:Point" lat="51.51637860775205" lon="3.991710968730444"/>
          <point xsi:type="esdl:Point" lat="51.516376985538656" lon="3.9917000968029344"/>
          <point xsi:type="esdl:Point" lat="51.51636843285166" lon="3.9916433877224553"/>
          <point xsi:type="esdl:Point" lat="51.5163633944501" lon="3.9916099415302173"/>
          <point xsi:type="esdl:Point" lat="51.51636180366194" lon="3.991599443268679"/>
          <point xsi:type="esdl:Point" lat="51.51635308490219" lon="3.9915416298613233"/>
          <point xsi:type="esdl:Point" lat="51.51634281332597" lon="3.9914734899599096"/>
          <point xsi:type="esdl:Point" lat="51.51633285977979" lon="3.991410902040927"/>
          <point xsi:type="esdl:Point" lat="51.516328962349405" lon="3.991386426237162"/>
          <point xsi:type="esdl:Point" lat="51.51632817470951" lon="3.991381450639137"/>
          <point xsi:type="esdl:Point" lat="51.516326406099736" lon="3.991370367100857"/>
          <point xsi:type="esdl:Point" lat="51.51631887278887" lon="3.991322992424855"/>
          <point xsi:type="esdl:Point" lat="51.51630553740966" lon="3.991239212524983"/>
          <point xsi:type="esdl:Point" lat="51.516303224051455" lon="3.9912246732562346"/>
          <point xsi:type="esdl:Point" lat="51.51629732368524" lon="3.9911875650277104"/>
          <point xsi:type="esdl:Point" lat="51.516287078525146" lon="3.9911231562962874"/>
          <point xsi:type="esdl:Point" lat="51.516275755074545" lon="3.9910520230860165"/>
          <point xsi:type="esdl:Point" lat="51.51627404396844" lon="3.99104124038674"/>
          <point xsi:type="esdl:Point" lat="51.51626626795418" lon="3.990992374779269"/>
          <point xsi:type="esdl:Point" lat="51.51625960939858" lon="3.990950506250065"/>
          <point xsi:type="esdl:Point" lat="51.516253388627405" lon="3.9909114195491484"/>
          <point xsi:type="esdl:Point" lat="51.51623420203812" lon="3.9908119701889317"/>
          <point xsi:type="esdl:Point" lat="51.51623344509106" lon="3.9908080599016222"/>
          <point xsi:type="esdl:Point" lat="51.51622545248041" lon="3.9907666502548422"/>
          <point xsi:type="esdl:Point" lat="51.51622108218822" lon="3.990743990156374"/>
          <point xsi:type="esdl:Point" lat="51.516217420981334" lon="3.99072499687138"/>
          <point xsi:type="esdl:Point" lat="51.51621551400697" lon="3.990715127953479"/>
          <point xsi:type="esdl:Point" lat="51.51620376425216" lon="3.990654223712475"/>
          <point xsi:type="esdl:Point" lat="51.51620064003224" lon="3.990638038021858"/>
          <point xsi:type="esdl:Point" lat="51.51618797034981" lon="3.990572378442703"/>
          <point xsi:type="esdl:Point" lat="51.51618665738515" lon="3.990565574717919"/>
          <point xsi:type="esdl:Point" lat="51.516184587636836" lon="3.9905548751179705"/>
          <point xsi:type="esdl:Point" lat="51.5161795942538" lon="3.9905289778704467"/>
          <point xsi:type="esdl:Point" lat="51.51617593042822" lon="3.990509768571598"/>
          <point xsi:type="esdl:Point" lat="51.516170415935825" lon="3.990480890366737"/>
          <point xsi:type="esdl:Point" lat="51.51615645239883" lon="3.990407778185706"/>
          <point xsi:type="esdl:Point" lat="51.516134777519845" lon="3.9902942421103225"/>
          <point xsi:type="esdl:Point" lat="51.516131276418285" lon="3.990275863543196"/>
          <point xsi:type="esdl:Point" lat="51.516126538702146" lon="3.9902510535474414"/>
          <point xsi:type="esdl:Point" lat="51.51612141722892" lon="3.990224223746543"/>
          <point xsi:type="esdl:Point" lat="51.51611150065203" lon="3.990172297564784"/>
          <point xsi:type="esdl:Point" lat="51.51610733966364" lon="3.9901506109253924"/>
          <point xsi:type="esdl:Point" lat="51.51610144374138" lon="3.990119914645055"/>
          <point xsi:type="esdl:Point" lat="51.51610142456231" lon="3.9901198143747885"/>
          <point xsi:type="esdl:Point" lat="51.51609946881391" lon="3.9901096300177277"/>
          <point xsi:type="esdl:Point" lat="51.51609721587496" lon="3.9900978986743114"/>
          <point xsi:type="esdl:Point" lat="51.516092556732985" lon="3.990073648232403"/>
          <point xsi:type="esdl:Point" lat="51.516090552602" lon="3.990063177195743"/>
          <point xsi:type="esdl:Point" lat="51.516087360398075" lon="3.990046575826539"/>
          <point xsi:type="esdl:Point" lat="51.516077945847364" lon="3.989997544811703"/>
          <point xsi:type="esdl:Point" lat="51.5160717122929" lon="3.9899641789635028"/>
          <point xsi:type="esdl:Point" lat="51.51606708217603" lon="3.989939351315684"/>
          <point xsi:type="esdl:Point" lat="51.516060377765506" lon="3.9899034496488404"/>
          <point xsi:type="esdl:Point" lat="51.51605861068892" lon="3.989894008753352"/>
          <point xsi:type="esdl:Point" lat="51.51603984252234" lon="3.9897935387726062"/>
          <point xsi:type="esdl:Point" lat="51.51603486679598" lon="3.989766877494034"/>
          <point xsi:type="esdl:Point" lat="51.516031821780516" lon="3.989750559810614"/>
          <point xsi:type="esdl:Point" lat="51.516026049150994" lon="3.9897196581218144"/>
          <point xsi:type="esdl:Point" lat="51.5160193541767" lon="3.989683799453711"/>
          <point xsi:type="esdl:Point" lat="51.51600136636804" lon="3.9896079874005346"/>
          <point xsi:type="esdl:Point" lat="51.51597964602222" lon="3.9895207633706415"/>
          <point xsi:type="esdl:Point" lat="51.51595894493015" lon="3.9894435940203867"/>
          <point xsi:type="esdl:Point" lat="51.515957061443" lon="3.9894364476904225"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="966682b0-eeef-4bc1-8280-999c639e8b19" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="6d337818-ef91-4742-ae63-a831f09b0db9"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="9466e924-680e-44ac-b797-bd1b8b3df02a" connectedTo="270b782a-ea42-4093-a591-cbc54f1e1443"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="34.2" id="984024e5-969a-4dff-82f9-6f98df990e28" capacity="100000.0" name="Cable_1684">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516738840432446" lon="3.9952796411209133"/>
          <point xsi:type="esdl:Point" lat="51.51674739773444" lon="3.9952433573241177"/>
          <point xsi:type="esdl:Point" lat="51.51675756085839" lon="3.9952067938038076"/>
          <point xsi:type="esdl:Point" lat="51.51676032809032" lon="3.995196853507637"/>
          <point xsi:type="esdl:Point" lat="51.51676798671835" lon="3.995160597195762"/>
          <point xsi:type="esdl:Point" lat="51.51677820392781" lon="3.9951127355433216"/>
          <point xsi:type="esdl:Point" lat="51.51678314941589" lon="3.9950751214137243"/>
          <point xsi:type="esdl:Point" lat="51.51678952029305" lon="3.9948094454894796"/>
          <point xsi:type="esdl:Point" lat="51.516789754849256" lon="3.9947997124130348"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="f5beb49e-60cd-4cfb-abc9-51969f29afb4" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="c7b710c0-d020-49c3-8172-3f8dda975565"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="07c002c1-65e8-4223-9eef-fcdc117f318c" connectedTo="11fa5a80-3e2f-43a4-9408-0a6f442662fa"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="288.90999999999997" id="d9a5dc13-87f7-4069-adcc-2a5631044264" capacity="100000.0" name="Cable_1710">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51432951590905" lon="3.9933896023183686"/>
          <point xsi:type="esdl:Point" lat="51.51433273231605" lon="3.9933578062111406"/>
          <point xsi:type="esdl:Point" lat="51.514335909260886" lon="3.993337768200715"/>
          <point xsi:type="esdl:Point" lat="51.51438706979353" lon="3.9930146713697385"/>
          <point xsi:type="esdl:Point" lat="51.51439454397983" lon="3.9929622708889103"/>
          <point xsi:type="esdl:Point" lat="51.514396120037965" lon="3.9929512148623565"/>
          <point xsi:type="esdl:Point" lat="51.51440196022404" lon="3.992910289998678"/>
          <point xsi:type="esdl:Point" lat="51.51440680438923" lon="3.9928762970933724"/>
          <point xsi:type="esdl:Point" lat="51.51442089837671" lon="3.9927775015387814"/>
          <point xsi:type="esdl:Point" lat="51.51442236687986" lon="3.992767226829062"/>
          <point xsi:type="esdl:Point" lat="51.5144270201366" lon="3.9927345652826465"/>
          <point xsi:type="esdl:Point" lat="51.51443034664992" lon="3.9927112519840797"/>
          <point xsi:type="esdl:Point" lat="51.51443103525672" lon="3.992706433002879"/>
          <point xsi:type="esdl:Point" lat="51.514432537894116" lon="3.9926945003228504"/>
          <point xsi:type="esdl:Point" lat="51.51443815285487" lon="3.9926497785907844"/>
          <point xsi:type="esdl:Point" lat="51.514453537883355" lon="3.99252737180992"/>
          <point xsi:type="esdl:Point" lat="51.51445490080493" lon="3.9925165384113854"/>
          <point xsi:type="esdl:Point" lat="51.51445683046936" lon="3.9925012211473114"/>
          <point xsi:type="esdl:Point" lat="51.51445916193844" lon="3.992482664164179"/>
          <point xsi:type="esdl:Point" lat="51.51445929282114" lon="3.992481579549229"/>
          <point xsi:type="esdl:Point" lat="51.51446567983721" lon="3.992430753901514"/>
          <point xsi:type="esdl:Point" lat="51.51447859349854" lon="3.992328003269573"/>
          <point xsi:type="esdl:Point" lat="51.51447896313959" lon="3.9923250815118494"/>
          <point xsi:type="esdl:Point" lat="51.51448162290146" lon="3.992303906588691"/>
          <point xsi:type="esdl:Point" lat="51.514484332277405" lon="3.9922823699405723"/>
          <point xsi:type="esdl:Point" lat="51.51448765748555" lon="3.992255944488265"/>
          <point xsi:type="esdl:Point" lat="51.51449168012921" lon="3.992223936141308"/>
          <point xsi:type="esdl:Point" lat="51.514503526363406" lon="3.9921296756456504"/>
          <point xsi:type="esdl:Point" lat="51.51450738455618" lon="3.9920989546351495"/>
          <point xsi:type="esdl:Point" lat="51.51451270874888" lon="3.9920615177213246"/>
          <point xsi:type="esdl:Point" lat="51.51451887814123" lon="3.992018075534044"/>
          <point xsi:type="esdl:Point" lat="51.51452149103921" lon="3.991999754798822"/>
          <point xsi:type="esdl:Point" lat="51.51452287545949" lon="3.9919899724927794"/>
          <point xsi:type="esdl:Point" lat="51.514528888020486" lon="3.9919477021482366"/>
          <point xsi:type="esdl:Point" lat="51.51455099601596" lon="3.991792137366906"/>
          <point xsi:type="esdl:Point" lat="51.514560524816" lon="3.9917251501244446"/>
          <point xsi:type="esdl:Point" lat="51.51457641350116" lon="3.9916133747580886"/>
          <point xsi:type="esdl:Point" lat="51.514580020544486" lon="3.9915879779270735"/>
          <point xsi:type="esdl:Point" lat="51.51458699466226" lon="3.991538920584093"/>
          <point xsi:type="esdl:Point" lat="51.514598547121764" lon="3.99145096503452"/>
          <point xsi:type="esdl:Point" lat="51.51459899228273" lon="3.991447594293614"/>
          <point xsi:type="esdl:Point" lat="51.51464572836917" lon="3.99109172120998"/>
          <point xsi:type="esdl:Point" lat="51.51465461097834" lon="3.991024105154187"/>
          <point xsi:type="esdl:Point" lat="51.51467021707955" lon="3.990905292430758"/>
          <point xsi:type="esdl:Point" lat="51.514677334161426" lon="3.9908524267580465"/>
          <point xsi:type="esdl:Point" lat="51.514683996746186" lon="3.9908029032928725"/>
          <point xsi:type="esdl:Point" lat="51.51470648663635" lon="3.9906357991959687"/>
          <point xsi:type="esdl:Point" lat="51.514725235981274" lon="3.9904964589644183"/>
          <point xsi:type="esdl:Point" lat="51.514735440259784" lon="3.990420618265744"/>
          <point xsi:type="esdl:Point" lat="51.51474531098408" lon="3.9903439521110573"/>
          <point xsi:type="esdl:Point" lat="51.51474531098408" lon="3.9903439521110573"/>
          <point xsi:type="esdl:Point" lat="51.51475755025279" lon="3.990239837759726"/>
          <point xsi:type="esdl:Point" lat="51.514764776607386" lon="3.990167575214977"/>
          <point xsi:type="esdl:Point" lat="51.514770222854466" lon="3.9900968081602533"/>
          <point xsi:type="esdl:Point" lat="51.51477319712673" lon="3.9900448475901213"/>
          <point xsi:type="esdl:Point" lat="51.51477364775418" lon="3.990007372674389"/>
          <point xsi:type="esdl:Point" lat="51.51477364775418" lon="3.990007372674389"/>
          <point xsi:type="esdl:Point" lat="51.51477437408255" lon="3.9899929422494043"/>
          <point xsi:type="esdl:Point" lat="51.514779739321796" lon="3.9899935553978074"/>
          <point xsi:type="esdl:Point" lat="51.51478427642757" lon="3.989994078732407"/>
          <point xsi:type="esdl:Point" lat="51.51478427642757" lon="3.989994078732407"/>
          <point xsi:type="esdl:Point" lat="51.51483188746776" lon="3.989991174695077"/>
          <point xsi:type="esdl:Point" lat="51.5148758522251" lon="3.98998406027207"/>
          <point xsi:type="esdl:Point" lat="51.51491172916214" lon="3.989977194400704"/>
          <point xsi:type="esdl:Point" lat="51.51497171446678" lon="3.9899566202334604"/>
          <point xsi:type="esdl:Point" lat="51.515021831887246" lon="3.98993779011224"/>
          <point xsi:type="esdl:Point" lat="51.515031665302004" lon="3.9899331654335226"/>
          <point xsi:type="esdl:Point" lat="51.51504316621028" lon="3.989928907340613"/>
          <point xsi:type="esdl:Point" lat="51.51505141830045" lon="3.9899258585274344"/>
          <point xsi:type="esdl:Point" lat="51.51508938149142" lon="3.989898007750701"/>
          <point xsi:type="esdl:Point" lat="51.51512189466593" lon="3.9898722263222814"/>
          <point xsi:type="esdl:Point" lat="51.51518308786205" lon="3.989827884432405"/>
          <point xsi:type="esdl:Point" lat="51.51518630078258" lon="3.989825177786908"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="1af86577-c281-47d5-b860-ae99c8fd0c18" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="f96377d3-4ca0-4de4-8b81-12cf457d78f9"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="78ccea73-495c-4d2e-9ac9-17e2cc01de38" connectedTo="16422463-c978-4b3c-adac-bac94cb68b79"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="68.77" id="554c1b8d-c0cd-47c6-8ec5-3da401fbad2b" capacity="100000.0" name="Cable_1714">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51671901301933" lon="3.993692408609754"/>
          <point xsi:type="esdl:Point" lat="51.516721598460805" lon="3.9936566966162217"/>
          <point xsi:type="esdl:Point" lat="51.516725188164614" lon="3.9936072079217477"/>
          <point xsi:type="esdl:Point" lat="51.51673454239025" lon="3.9934923574734453"/>
          <point xsi:type="esdl:Point" lat="51.51673930118421" lon="3.9934338706857226"/>
          <point xsi:type="esdl:Point" lat="51.51674096284231" lon="3.9934171776724456"/>
          <point xsi:type="esdl:Point" lat="51.516748933204106" lon="3.993337036953908"/>
          <point xsi:type="esdl:Point" lat="51.51674690583446" lon="3.9932884408689833"/>
          <point xsi:type="esdl:Point" lat="51.51674641387521" lon="3.993276597577301"/>
          <point xsi:type="esdl:Point" lat="51.5167643352507" lon="3.9932717254475953"/>
          <point xsi:type="esdl:Point" lat="51.51678927388742" lon="3.99325222941314"/>
          <point xsi:type="esdl:Point" lat="51.516801768992615" lon="3.99324464190769"/>
          <point xsi:type="esdl:Point" lat="51.51681341702614" lon="3.993241402994309"/>
          <point xsi:type="esdl:Point" lat="51.51681341702614" lon="3.993241402994309"/>
          <point xsi:type="esdl:Point" lat="51.51680951297553" lon="3.993215586973554"/>
          <point xsi:type="esdl:Point" lat="51.51677333946662" lon="3.993107247487756"/>
          <point xsi:type="esdl:Point" lat="51.51676835168317" lon="3.9930923145065615"/>
          <point xsi:type="esdl:Point" lat="51.51675149563292" lon="3.9930418389553153"/>
          <point xsi:type="esdl:Point" lat="51.51674331908982" lon="3.993017335530104"/>
          <point xsi:type="esdl:Point" lat="51.51674080414289" lon="3.993010741422024"/>
          <point xsi:type="esdl:Point" lat="51.516728285213034" lon="3.992977927676818"/>
          <point xsi:type="esdl:Point" lat="51.51671010568809" lon="3.9929303025005383"/>
          <point xsi:type="esdl:Point" lat="51.51668299827091" lon="3.9928592488767554"/>
          <point xsi:type="esdl:Point" lat="51.516675602728924" lon="3.992842185271193"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0986c29c-6997-4ed4-a891-9c8e1c0c2259" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="94a1c2ee-c568-4d72-b6bf-eede772f1f05"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="324d6705-af4a-4182-9eaf-c397fbfe1453" connectedTo="0d71b427-0b80-43a4-9203-49cfc92b5293"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="dd8330af-e417-4654-b4c9-a1e4cb4bd519" name="Bus_36">
        <geometry xsi:type="esdl:Point" lat="51.50990493906405" lon="3.984995109329026"/>
        <port xsi:type="esdl:InPort" connectedTo="98880cae-4756-4a18-92a4-a32915586c99 576e3200-d6d1-4afc-8222-801b5efb3b6e" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="7b330f78-1e38-4730-aaa9-cef7c700f439"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="765733b6-3ebc-4dc1-87a2-dcf8f975372d" connectedTo="94cd88ec-e583-415a-8700-4a1a4816b6ee"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="9482918e-bdd5-4386-ad37-dba184a035ee" name="Bus_76">
        <geometry xsi:type="esdl:Point" lat="51.51509577058398" lon="3.989833925398175"/>
        <port xsi:type="esdl:InPort" connectedTo="99ccb045-b25a-42fb-9f3e-f29deb024857" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="00eb89b6-4d74-4fba-a387-12bc4326688e"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="54504f64-cf26-4fec-ba08-12c445830484" connectedTo="1c03b5e7-03b5-4228-aee6-f51fcf32e336 fb62b76c-36fb-47c3-a6b9-9c329d6a7ecb"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="cc71edad-e13a-41c0-a8f4-fbae7eb0972b" name="Bus_88">
        <geometry xsi:type="esdl:Point" lat="51.51498531603313" lon="3.9899400938706955"/>
        <port xsi:type="esdl:InPort" connectedTo="b4cdc549-b194-47f9-b4ce-52063deac2b7 5e2775c4-5f5c-4ecc-83d2-e81dec66cc50" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="36c65c6e-fcdc-4e46-9f10-0649c2f3287c"/>
        <port xsi:type="esdl:OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="cfe02029-a521-410c-9601-b3bd0d847719" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="7c543e2a-b050-4d31-8fff-20e6d324f400" name="Bus_89">
        <geometry xsi:type="esdl:Point" lat="51.514942056741425" lon="3.9900760532214234"/>
        <port xsi:type="esdl:InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="f2bfebe3-b1ce-4639-b25a-a6f4d11a0d3a" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="7bccd98b-fa90-4725-bb75-2af09a91359b" connectedTo="3a1453e7-8235-4413-b9db-df387123c879 83387a46-8947-42bb-ba93-3eb3d52fe599"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="9f832658-7976-454e-91ac-d20b74d98741" name="Bus_102">
        <geometry xsi:type="esdl:Point" lat="51.508882880222245" lon="3.9837879490320667"/>
        <port xsi:type="esdl:InPort" connectedTo="efdb5ac1-f3c6-4588-9c6a-054c0e6a8e42 4de0cf63-1052-4881-98d4-99f6d181c818" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="9e9e6bd8-9979-4b34-b45b-b1082c626b98"/>
        <port xsi:type="esdl:OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="8ce20511-21bb-4fb9-8aeb-c7278e016674" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="5cdde728-6a34-467f-9bbb-58329c31c13d" name="Bus_109">
        <geometry xsi:type="esdl:Point" lat="51.515014481486844" lon="3.989927541275302"/>
        <port xsi:type="esdl:InPort" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="d78fcd3d-29de-4361-a1f9-43bdb5fffc6c"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="86282b1b-079a-495c-b470-746b54332746" connectedTo="33b61a32-abc1-41ea-852e-fc59c5320d05 2133753c-2e1a-4054-a328-21de82d358fc"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="ebd151b2-e8f5-41e7-b051-e67ed4840ecd" name="Bus_410">
        <geometry xsi:type="esdl:Point" lat="51.516738840432446" lon="3.9952796411209133"/>
        <port xsi:type="esdl:InPort" connectedTo="c60350fb-7936-45e0-8a07-dd636d0a55f0" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="855f806e-c758-41e6-9a21-dabe2be1f836"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="f5beb49e-60cd-4cfb-abc9-51969f29afb4" connectedTo="c7b710c0-d020-49c3-8172-3f8dda975565"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="35bb18c6-4b78-4399-8337-bde0c69411f8" name="Bus_453">
        <geometry xsi:type="esdl:Point" lat="51.51406603297594" lon="3.9937593175744994"/>
        <port xsi:type="esdl:InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="f048943a-1d07-4fc7-927a-89fdcc62dfd7" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="28ac1054-5c84-4552-98de-bed6a58751f7" connectedTo="056d43c4-4bde-4d5e-bb4c-3a27f9494337 ac203b4a-3b7f-423e-91e8-24c6a3f5339b"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="75ba47e9-0e67-48e8-a7b7-43877561b064" name="Bus_462">
        <geometry xsi:type="esdl:Point" lat="51.516774598890514" lon="3.993830469376887"/>
        <port xsi:type="esdl:InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="73926936-9417-4158-bae3-ccde64c7fc13" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="b32c896d-203c-417d-a51a-06f0d2c0bdaa" connectedTo="238183db-c16c-49e8-9c7c-71ab02bf0e1e 98e41b0e-b973-494e-bd29-8499f0c2dc61 79f29a27-810a-4b47-8f7a-0b15e048a7c7"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="63588309-05aa-40e9-ae1a-d27e6bf9ec00" name="Bus_553">
        <geometry xsi:type="esdl:Point" lat="51.51432951590905" lon="3.9933896023183686"/>
        <port xsi:type="esdl:InPort" connectedTo="dbec74d2-e7e5-43d6-b146-0c901a623138 10b82fd7-b9da-43a7-95ce-d10c62e2622d" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="a0b7133d-9f4d-4829-aa22-309806d819c9"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="1af86577-c281-47d5-b860-ae99c8fd0c18" connectedTo="f96377d3-4ca0-4de4-8b81-12cf457d78f9"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="99b2b958-ac16-42eb-add6-c8e1f0fb44a9" name="Bus_637">
        <geometry xsi:type="esdl:Point" lat="51.51562805271911" lon="3.9946247868553093"/>
        <port xsi:type="esdl:InPort" connectedTo="2a40aeae-0629-41f2-b3ee-22c15ad4744b" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="c8aaa365-2bcd-4b84-8843-39625c013046"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="ac655af3-4287-4c61-81d0-7ecaf9515b99" connectedTo="43dcdd29-8e3b-4fc3-bd9d-2a882f7442c3 3e7fbb83-81ea-4aa2-9d98-e2f60c38d14d 393433bd-9e13-4b64-a291-4f9e04b0a137"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="524a047e-92ff-4f2b-ac45-924501502c0b" name="Bus_692">
        <geometry xsi:type="esdl:Point" lat="51.51515139612085" lon="3.989790086008347"/>
        <port xsi:type="esdl:InPort" connectedTo="b5cbdc0f-1e33-4f24-9c49-60877e712322 fd06b635-c166-462e-a063-4ae740b3c3aa" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="e2411af5-2e07-420a-96f8-cb392e7f4891"/>
        <port xsi:type="esdl:OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="7c8d00f8-efc5-4989-ba2b-1eaff0e0ae7c" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="7163724b-80f1-49ce-bdb8-f52453fb8518" name="Bus_726">
        <geometry xsi:type="esdl:Point" lat="51.51509740149241" lon="3.9898327370212305"/>
        <port xsi:type="esdl:InPort" connectedTo="9c0fc11e-cd95-4125-b732-e2c89992c690 05fb8826-f9e0-4e4b-98c9-ef8e49023471" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="4ee9bf2b-76d1-4fb8-a600-154f8f699489"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="68c15c71-bb17-4ba8-ab35-67d2976082a6" connectedTo="22e6564d-c02f-4627-971a-1962e770632d"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="da5a9428-43c9-4f7a-8e3f-65c7bd4cf6c8" name="Bus_790">
        <geometry xsi:type="esdl:Point" lat="51.51509683010041" lon="3.9898345700178446"/>
        <port xsi:type="esdl:InPort" connectedTo="645d9c4b-f893-4d4f-844e-fde6f1e5c522" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="f5c0dc0a-951a-4979-ae1b-b5c774b963ca"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="1551eaa3-df31-4241-9c03-db2e1fd1c67d" connectedTo="a2f1c222-3a36-4e41-aaaf-42b846295263"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="c545953e-ba55-4ead-8220-bf54893bc014" name="Bus_793">
        <geometry xsi:type="esdl:Point" lat="51.51518630078258" lon="3.989825177786908"/>
        <port xsi:type="esdl:InPort" connectedTo="78ccea73-495c-4d2e-9ac9-17e2cc01de38" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="16422463-c978-4b3c-adac-bac94cb68b79"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="a77a4141-a57d-488f-b08e-1579cb5805e0" connectedTo="3c18a4d4-7e91-499b-9e72-22a0d2bc68a6 c3147289-f30c-4701-bf0e-9e355a27fb8a"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="f87a12a6-484b-4277-b01e-04502ba8fe2e" name="Bus_794">
        <geometry xsi:type="esdl:Point" lat="51.515275947050156" lon="3.989762844163574"/>
        <port xsi:type="esdl:InPort" connectedTo="1bb469d4-b948-455a-8986-8929b5d805ae 7d1750de-4ff9-4b40-81b8-3e1bc2f8dd17 9118b565-d43c-4f5a-9c69-df2bfafb002c" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="355e083b-9090-45a7-a613-6afd92df4886"/>
        <port xsi:type="esdl:OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="88b3c223-fd82-43b1-9901-639195a8d99a" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="505a3c17-ba01-4e4b-8cc0-4448892b6108" name="Bus_837">
        <geometry xsi:type="esdl:Point" lat="51.51671901301933" lon="3.993692408609754"/>
        <port xsi:type="esdl:InPort" connectedTo="ef846fc5-5b37-4a94-9bfc-ddb852dd4a6c" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="ecfdad02-4cd0-4e04-8085-5c8477f50915"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="0986c29c-6997-4ed4-a891-9c8e1c0c2259" connectedTo="94a1c2ee-c568-4d72-b6bf-eede772f1f05 79eb17a2-55d1-41cd-a9dd-2a4088de2fa5"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="517fedcf-f709-48f9-9587-1135d242ffa0" name="Bus_868">
        <geometry xsi:type="esdl:Point" lat="51.51560752084822" lon="3.9935117939061904"/>
        <port xsi:type="esdl:InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="a4c2bd47-af25-4b40-bf53-de496a8975e0" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="89699f97-ac8e-400d-9fa7-d6734cbc3dfb" connectedTo="b02b55f7-fb3d-4160-b009-b1a469335a8e 3d6a973d-b021-486e-b191-622f119d0c1d 90890278-30b9-4898-810b-96bd821d1cfc"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="85dec88c-c43c-4826-a50d-5f48b830e28d" name="Bus_869">
        <geometry xsi:type="esdl:Point" lat="51.51562866613081" lon="3.993626412588246"/>
        <port xsi:type="esdl:InPort" connectedTo="4da03038-37e1-4ec5-9b8e-1abb4a2a6cff 97a2d0a9-8202-4264-ad59-0de29f8c33dc" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="6d32e370-7ea4-4ad1-a0ae-a73911dd6c69"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="95299be4-418f-4dac-b509-76463499d972" connectedTo="4896bbaa-04a4-40b1-b3d2-9775fee46d37"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="f5903529-3ef7-47ef-9e0c-25cac88c1c9a" name="Bus_909">
        <geometry xsi:type="esdl:Point" lat="51.51566474911341" lon="3.992507216435024"/>
        <port xsi:type="esdl:InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="2286dcca-7693-45cf-a640-fc293d1ebe02" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="58c4a1cc-c2f9-4b99-b82b-460fe8d3ca5f" connectedTo="c631deae-5906-4bd5-b341-44a3a1976dd9 8fcff925-85b2-4ea9-a651-921923921cd2 63507b55-b0d1-4364-b656-cc9e0fd32a3a"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="392e70c8-66c2-481b-b7ac-fd8ec12e7c4c" name="Bus_910">
        <geometry xsi:type="esdl:Point" lat="51.515653908897896" lon="3.992277014985413"/>
        <port xsi:type="esdl:InPort" connectedTo="421de0c2-c079-4cd4-9a67-fe25a4ec0b08" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="1263796a-3a58-44e6-a6ec-62610d63a796"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="441be35f-9d8b-44b5-bcf9-fa37822fbba9" connectedTo="9a2f5ee4-6455-4592-a83e-e4efc85c3db1 274b2eff-f8ae-47a8-8b5a-9d6125dc6644"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="f8d9c851-158e-40cb-9404-8301835b796a" name="Bus_937">
        <geometry xsi:type="esdl:Point" lat="51.516789754849256" lon="3.9947997124130348"/>
        <port xsi:type="esdl:InPort" connectedTo="b7aa6f57-698e-47e8-b215-a23fc15c7305 07c002c1-65e8-4223-9eef-fcdc117f318c" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="11fa5a80-3e2f-43a4-9408-0a6f442662fa"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="7d32cbb1-1cce-4fa2-b73d-8b974097184a" connectedTo="e0ceb8c5-617e-4f82-b07f-e5ed823bd1b8"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="e2b45e56-171d-4172-a644-972df5f2732b" name="Bus_950">
        <geometry xsi:type="esdl:Point" lat="51.51509625782333" lon="3.9898318212322654"/>
        <port xsi:type="esdl:InPort" connectedTo="9b814fd8-5939-4b15-bced-cbbc3bf84482" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="28c5c0f2-3d62-4d95-bbcc-26f0598ee4be"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="3468b779-4eb2-446a-92c1-f8973d54c5ab" connectedTo="843e3a3b-b3d8-4a05-b8ae-f144ab4ee43b"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="932f2ace-fcd6-4a69-8829-b293f15d3067" name="Bus_982">
        <geometry xsi:type="esdl:Point" lat="51.51614895093966" lon="3.9964734377668205"/>
        <port xsi:type="esdl:InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="ab798629-36f0-426c-9e78-7ebb1427947a" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="73b5868d-dc12-4107-9cd2-6a296814efd8" connectedTo="55fa234d-802c-4d6e-ba34-36e25be1dd48 0fb6defe-40f6-4b82-a120-787a32045aa3"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="cafe9639-a518-4570-946a-e52acbb4f507" name="Bus_983">
        <geometry xsi:type="esdl:Point" lat="51.51604822747045" lon="3.9964438117686347"/>
        <port xsi:type="esdl:InPort" connectedTo="4e458d5e-ba70-4e90-b146-a5316dc1885a 43fd79e0-2595-42a2-804e-b02602f0545f" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="31e2543c-a401-45fb-8365-7db43a70d7cc"/>
        <port xsi:type="esdl:OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="2b5f8251-5b2b-4cb4-b231-c6f24a0e30cd" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="b002c5c3-022e-4789-bc3c-a24814f6df6e" name="Bus_989">
        <geometry xsi:type="esdl:Point" lat="51.51571770100284" lon="3.9936294466921978"/>
        <port xsi:type="esdl:InPort" connectedTo="d21b5281-ac7d-4885-990c-5f516a13c1ea e2162fe2-810f-49ad-9bb5-d85e9f3f2e3f" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="df54f6c3-d764-49e8-868e-09f22d4660b8"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="08ebd14a-544c-48a8-9863-558f7130812a" connectedTo="55afae0c-3346-4e63-91f2-f38fc4b13390 f8371cbf-c102-4b62-871a-d3712577fdf4"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="0f06632c-1e11-4f79-8063-300e67db3bbc" name="Bus_1052">
        <geometry xsi:type="esdl:Point" lat="51.515683603507" lon="3.9925051971747205"/>
        <port xsi:type="esdl:InPort" connectedTo="354d4a35-7528-4b11-9ece-48feb107206e 5d69f994-fcea-4cd9-9f7f-05aa2e041f38" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="439d9cc2-f027-4491-b511-4b0e00d25d63"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="b5f6a7fe-a66f-4ad4-9d79-7b445a9c42db" connectedTo="45e47477-e26f-4970-9e8f-7fdb4e089539"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="3160e34c-b73d-42a5-83cc-9bab853cd026" name="Bus_1227">
        <geometry xsi:type="esdl:Point" lat="51.515957061443" lon="3.9894364476904225"/>
        <port xsi:type="esdl:InPort" connectedTo="9466e924-680e-44ac-b797-bd1b8b3df02a" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="270b782a-ea42-4093-a591-cbc54f1e1443"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="fb1e1a13-cd11-4b6a-995b-d102de4b2417" connectedTo="cdf321c0-680f-4613-b64d-a024de69d34e aa5d92ca-725d-4140-a9f7-caf604352a8f"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="c021e805-0335-4364-9c14-d6e40876fdac" name="Bus_1228">
        <geometry xsi:type="esdl:Point" lat="51.51582306614181" lon="3.9892071508360716"/>
        <port xsi:type="esdl:InPort" connectedTo="8f8eb2e7-8240-4e27-8065-2daa65cf8c6e" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="a01734ab-dd66-40ae-b5f3-1409b98edd02"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="6b0238d5-22ee-4185-a42c-8eeb2045ab30" connectedTo="afdaf7d4-f1f4-4e8d-b3bb-bfd501f2a489"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="3d7a0c22-0e40-46e7-a11e-c685d3ce9911" name="Bus_1283">
        <geometry xsi:type="esdl:Point" lat="51.516461999236384" lon="3.9922695098760186"/>
        <port xsi:type="esdl:InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="95441405-2569-43a2-9af6-659204fae5cc" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="966682b0-eeef-4bc1-8280-999c639e8b19" connectedTo="5bed49c6-7f25-4963-8a36-dae38f1dcd47 67289ce7-1845-4bb4-ac8c-e57ede338452 6d337818-ef91-4742-ae63-a831f09b0db9"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="cdc8d8a3-a016-4116-b2c3-3c812de79c2a" name="Bus_1382">
        <geometry xsi:type="esdl:Point" lat="51.516675602728924" lon="3.992842185271193"/>
        <port xsi:type="esdl:InPort" connectedTo="f2007946-182e-4099-b9cf-fd5a6c82a260 324d6705-af4a-4182-9eaf-c397fbfe1453" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="0d71b427-0b80-43a4-9203-49cfc92b5293"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="a6274fbd-a647-4651-aa5d-456f99eff8e9" connectedTo="59f34447-7261-4311-a0ef-60a90c18d0d1"/>
      </asset>
      <asset xsi:type="esdl:Bus" id="9b075e81-0c7c-40e8-b53f-f49381643617" name="Bus_1469">
        <geometry xsi:type="esdl:Point" lat="51.515594620591564" lon="3.99114094843952"/>
        <port xsi:type="esdl:InPort" connectedTo="16495779-3b31-42ff-878f-d92959a57427" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="f4c10621-6a53-484d-9f73-200d1551e053"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="97600cc2-49b9-4bc3-b57d-4298a8ba0bad" connectedTo="46cb5ef7-3e18-4961-8cca-74c18c6b9af1 d80ee544-566b-459c-89e2-b1f22539f36a"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="ace18a66-0c0b-4e36-b893-a44fb1d836ac" power="100000.0" name="Heatpump_4357" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.51688975484926" lon="3.9947997124130348"/>
        <port xsi:type="esdl:InPort" connectedTo="676d398b-c5c3-4601-af7d-e448d99f1a21" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="336354fd-3b48-4340-9cb3-6a69a2722e14"/>
        <port xsi:type="esdl:InPort" connectedTo="47f62d7c-1251-46d6-8acf-833552222e85" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="e1d1a242-56de-4b9d-a233-61b0b7d87b32"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="152040e3-5760-4847-80d3-9a91b1a29900" connectedTo="4b4f427a-e06e-4b9d-99f8-57f6da4087aa"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="889ce4fd-3528-442f-ab19-9e4fe4904e86" power="100000.0" name="Heatpump_4374" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.51572805271911" lon="3.9946247868553093"/>
        <port xsi:type="esdl:InPort" connectedTo="8aa746bc-d520-4233-8e21-dc79d7569bba" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="d630739e-4aac-44c8-99e9-deedf02cdcbb"/>
        <port xsi:type="esdl:InPort" connectedTo="0195bdb9-258f-41a6-a2d4-cc2e14e11e34" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="008c6f09-5454-4705-bb97-e96d5829e684"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="d9e651a6-c049-4b70-9a6a-8422f4aaca30" connectedTo="614d3b27-d54c-494d-9f5b-43ec4931f6d6"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="c444e9e7-53f8-4dca-886a-e473ccd6ce34" power="100000.0" name="Heatpump_4391" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.515707520848224" lon="3.9935117939061904"/>
        <port xsi:type="esdl:InPort" connectedTo="a6b809af-dc83-472d-88a1-6dcd8bee870c" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="bf6cdaf0-e64a-4267-9125-a859284d8bb5"/>
        <port xsi:type="esdl:InPort" connectedTo="590ff75e-cef7-46a4-85c9-4a5deec2ad0b" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="4917f69d-f264-4d1f-b737-50f74ee79e8c"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="8fdd00af-7fa8-4498-b0cf-4d316e578b06" connectedTo="802a5e83-5c17-4a47-bf6b-548593243482"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="8dd61182-a3db-45aa-8fd3-65f1331bc8c8" power="100000.0" name="Heatpump_4403" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.51416603297594" lon="3.9937593175744994"/>
        <port xsi:type="esdl:InPort" connectedTo="c2ea627d-68e7-4e19-8a6c-4caf7717cb7b" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="d0f59f1d-64bb-4cda-bfa2-30f943c7c426"/>
        <port xsi:type="esdl:InPort" connectedTo="c4bb8a3e-ad35-453c-b20c-e81fca9be5eb" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="2e31eb6a-1e0e-4e41-a423-5b15b13aaa70"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="76834b96-17a1-4e55-a364-6d5d456fc905" connectedTo="fa656a33-9364-42a5-a8db-1a892739cf7e"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="604d23bc-cbbc-44c3-a218-e1fd46a3500c" power="100000.0" name="Heatpump_4436" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.515817701002845" lon="3.9936294466921978"/>
        <port xsi:type="esdl:InPort" connectedTo="e0373d26-29bc-4fb6-a43e-50666fc56d5e" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="5ce1cc15-327a-4b39-87f2-9980b96f4f96"/>
        <port xsi:type="esdl:InPort" connectedTo="7dc22e4c-729e-4313-9693-e02306170dc1" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="cd8227c4-ddbb-4292-a58f-64f9dfaf676f"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="932bfc10-cf93-4e34-b298-912538437e97" connectedTo="0b9e94fb-817c-4734-9930-f745097c8552"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="cf605a88-6a32-40c6-840f-e46617c94bbc" power="100000.0" name="Heatpump_4448" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.515935733796404" lon="3.994631536862769"/>
        <port xsi:type="esdl:InPort" connectedTo="a5429906-aea4-4785-ab8e-ad80bf1d609e" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="e849ea15-988c-4695-b697-2cf4dabf67be"/>
        <port xsi:type="esdl:InPort" connectedTo="da2aa69a-a30c-4ed9-b6a9-78f78965099c" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="bef80894-a057-4762-8e7f-0b4cf9ba4017"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="7019fcfd-dff8-42f5-bb4a-579eba386dc2" connectedTo="39b3071a-b21e-410f-8b06-5127f00f8fd9"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="9b837248-61aa-42c2-abd0-b6b251659625" power="100000.0" name="Heatpump_4468" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.515502626540524" lon="3.990583105087293"/>
        <port xsi:type="esdl:InPort" connectedTo="afcfed42-0de0-42b4-b3bb-5e027d0b7a92" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="36601147-0e78-40df-ace9-441685f06b57"/>
        <port xsi:type="esdl:InPort" connectedTo="47dc61e5-d4bf-460c-973f-dd4348e4c521" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="ae5f948a-733e-41a4-8248-c0569ab2fa78"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="51bd84bf-5910-44fe-aab2-541ef9e3a475" connectedTo="b26e008f-6d36-4d1f-9243-215565301ca4"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="f52efc4e-8054-4c87-8752-e46560e5d03f" power="100000.0" name="Heatpump_4482" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.515961949993745" lon="3.9917367267054495"/>
        <port xsi:type="esdl:InPort" connectedTo="ddcb4921-37c0-4927-aa1e-429e4f74a52a" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="ebc4e6a6-f5d9-4967-9343-243d4c6bbed8"/>
        <port xsi:type="esdl:InPort" connectedTo="cd0eb61a-0811-4684-bd1d-fa2fa808205d" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="6ae46155-4bbd-40d2-bb33-79a6acc1d92d"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="caae2251-110f-4931-98f3-513bf68e984b" connectedTo="3563f143-e99d-431f-889f-1a4c54d9a82d"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="13b2a035-f939-4acd-995a-6549d9ec6479" power="100000.0" name="Heatpump_4492" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.515783603507" lon="3.9925051971747205"/>
        <port xsi:type="esdl:InPort" connectedTo="68263bce-e434-4cc3-b1a2-5bad73ce163f" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="ca622185-cfd0-4ab1-8d33-882293f8b380"/>
        <port xsi:type="esdl:InPort" connectedTo="ed2e6268-629c-4c36-924a-7f148767443a" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="81dcef67-b43c-4b8d-9445-66a37ccd6e15"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="035c8878-73d9-491a-a8dc-a262d1616eff" connectedTo="e45beed8-3b63-43ea-904d-285fac5a3771"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="f78c6658-fa16-4a95-8641-6f1fc8205eb1" power="100000.0" name="Heatpump_4521" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.51677560272893" lon="3.992842185271193"/>
        <port xsi:type="esdl:InPort" connectedTo="45731931-aa65-4b1d-ba0d-fb3327c15e50" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="304a8b8c-abdd-43ae-97f8-831c81cfeb25"/>
        <port xsi:type="esdl:InPort" connectedTo="1cbe1a7d-7b76-4070-b1d0-09efde8d9596" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="e26cf419-9435-4c7f-87c0-1c552fd8dac7"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="3be4f382-4f32-4b23-b69a-51313d9b3234" connectedTo="8d62be67-c1c5-426d-b425-028054827785"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="00ac4398-ea44-4f86-8f94-95c14118f3db" power="100000.0" name="Heatpump_4543" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.516057061443" lon="3.9894364476904225"/>
        <port xsi:type="esdl:InPort" connectedTo="eb4621ba-a03c-420e-8fc6-bf8cca51b319" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="19bba5d1-e750-4f4f-a261-6bfecc0bc9f1"/>
        <port xsi:type="esdl:InPort" connectedTo="c93108d1-e932-43bd-83b3-9887c04e5b35" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="855a278e-5080-4b23-a604-30d57610a2ee"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="9e5aedea-4535-43f2-b0ef-1929d7b06203" connectedTo="21332edc-e47a-46f9-87cd-99fa16b159dd"/>
      </asset>
      <asset xsi:type="esdl:HeatPump" id="95d85199-731d-4d30-a533-d744beeba712" power="100000.0" name="Heatpump_4556" COP="3.0">
        <geometry xsi:type="esdl:Point" lat="51.51681901301934" lon="3.993692408609754"/>
        <port xsi:type="esdl:InPort" connectedTo="f17ae812-5b36-4bfb-b483-b480862eaa99" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="96a836db-f214-4a9d-9973-76063117a948"/>
        <port xsi:type="esdl:InPort" connectedTo="aaf75cd5-f608-490a-b59d-4b1b0e484868" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="93b878c1-b92c-4095-a7a8-6189e2a551dd"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="9c7c214e-7d6b-4a16-bee5-32ac45f06fd6" connectedTo="8e32db3d-bed0-4681-9192-55d0c7177770"/>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="3751807a-361c-4845-9a93-a90a95a7dc01" name="Elec_prod_5" power="100000000.0">
        <geometry xsi:type="esdl:Point" lat="51.5052687161934" lon="3.9796742080994103"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="6d394e9f-2265-412d-9489-855b86ef9d62" connectedTo="0328f50d-2861-4076-9591-d43db3d88205"/>
        <costInformation xsi:type="esdl:CostInformation" id="6e1a4903-e9b3-45dc-9cb1-80da71a43e38">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="03c990dd-78a8-44e2-96fd-33ce43761b0d" value="0.00027">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d1c7fb16-7cb0-40d6-9334-dea7e87fb22c" unit="EURO" perUnit="WATTHOUR" physicalQuantity="COST" description="Cost in EUR/Wh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityProducer" id="35b0fae0-dd1c-4b19-811b-b2daec880391" name="Elec_prod_10" power="100000000.0">
        <geometry xsi:type="esdl:Point" lat="51.50982712005984" lon="3.9850277628976367"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="1d5a6d97-3f63-4013-807c-35b612b34af6" connectedTo="71ce1d05-9994-421c-9fa6-2932be785f5f"/>
        <costInformation xsi:type="esdl:CostInformation" id="6e1a4903-e9b3-45dc-9cb1-80da71a43e38">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="03c990dd-78a8-44e2-96fd-33ce43761b0d" value="0.00054">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d1c7fb16-7cb0-40d6-9334-dea7e87fb22c" unit="EURO" perUnit="WATTHOUR" physicalQuantity="COST" description="Cost in EUR/Wh"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="5.0" id="d567c93f-0310-44f0-905f-a0260404e8b8" capacity="100000.0" name="Cable_DEMAND_4357_Joint_937">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516789754849256" lon="3.9947997124130348"/>
          <point xsi:type="esdl:Point" lat="51.51688975484926" lon="3.9947997124130348"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="7d32cbb1-1cce-4fa2-b73d-8b974097184a" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="e0ceb8c5-617e-4f82-b07f-e5ed823bd1b8"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="676d398b-c5c3-4601-af7d-e448d99f1a21" connectedTo="336354fd-3b48-4340-9cb3-6a69a2722e14"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="5.0" id="ca55f806-7e05-40c0-b170-18f03670317b" capacity="100000.0" name="Cable_DEMAND_4374_Joint_637">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51562805271911" lon="3.9946247868553093"/>
          <point xsi:type="esdl:Point" lat="51.51572805271911" lon="3.9946247868553093"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ac655af3-4287-4c61-81d0-7ecaf9515b99" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="393433bd-9e13-4b64-a291-4f9e04b0a137"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="8aa746bc-d520-4233-8e21-dc79d7569bba" connectedTo="d630739e-4aac-44c8-99e9-deedf02cdcbb"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="5.0" id="38c32e7f-0c0e-49d8-b4dc-de5f3c462d85" capacity="100000.0" name="Cable_DEMAND_4391_Joint_868">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51560752084822" lon="3.9935117939061904"/>
          <point xsi:type="esdl:Point" lat="51.515707520848224" lon="3.9935117939061904"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="89699f97-ac8e-400d-9fa7-d6734cbc3dfb" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="90890278-30b9-4898-810b-96bd821d1cfc"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="a6b809af-dc83-472d-88a1-6dcd8bee870c" connectedTo="bf6cdaf0-e64a-4267-9125-a859284d8bb5"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="5.0" id="a700db29-46f7-42e4-a148-04701c55357e" capacity="100000.0" name="Cable_DEMAND_4403_Joint_453">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51406603297594" lon="3.9937593175744994"/>
          <point xsi:type="esdl:Point" lat="51.51416603297594" lon="3.9937593175744994"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="28ac1054-5c84-4552-98de-bed6a58751f7" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="ac203b4a-3b7f-423e-91e8-24c6a3f5339b"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="c2ea627d-68e7-4e19-8a6c-4caf7717cb7b" connectedTo="d0f59f1d-64bb-4cda-bfa2-30f943c7c426"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="5.0" id="e04a886e-34f3-4a49-943e-550dd874b28c" capacity="100000.0" name="Cable_DEMAND_4436_Joint_989">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51571770100284" lon="3.9936294466921978"/>
          <point xsi:type="esdl:Point" lat="51.515817701002845" lon="3.9936294466921978"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="08ebd14a-544c-48a8-9863-558f7130812a" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="f8371cbf-c102-4b62-871a-d3712577fdf4"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="e0373d26-29bc-4fb6-a43e-50666fc56d5e" connectedTo="5ce1cc15-327a-4b39-87f2-9980b96f4f96"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="5.0" id="64452956-7f56-4419-99e4-a803c97a257f" capacity="100000.0" name="Cable_DEMAND_4492_Joint_1052">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515683603507" lon="3.9925051971747205"/>
          <point xsi:type="esdl:Point" lat="51.515783603507" lon="3.9925051971747205"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="b5f6a7fe-a66f-4ad4-9d79-7b445a9c42db" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="45e47477-e26f-4970-9e8f-7fdb4e089539"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="68263bce-e434-4cc3-b1a2-5bad73ce163f" connectedTo="ca622185-cfd0-4ab1-8d33-882293f8b380"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="5.0" id="72213c5c-0043-4b1c-b35c-e9d972319300" capacity="100000.0" name="Cable_DEMAND_4521_Joint_1382">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516675602728924" lon="3.992842185271193"/>
          <point xsi:type="esdl:Point" lat="51.51677560272893" lon="3.992842185271193"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="a6274fbd-a647-4651-aa5d-456f99eff8e9" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="59f34447-7261-4311-a0ef-60a90c18d0d1"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="45731931-aa65-4b1d-ba0d-fb3327c15e50" connectedTo="304a8b8c-abdd-43ae-97f8-831c81cfeb25"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="5.0" id="98f70307-b9e7-401f-a46a-88ab05752c5c" capacity="100000.0" name="Cable_DEMAND_4543_Joint_1227">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515957061443" lon="3.9894364476904225"/>
          <point xsi:type="esdl:Point" lat="51.516057061443" lon="3.9894364476904225"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="fb1e1a13-cd11-4b6a-995b-d102de4b2417" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="aa5d92ca-725d-4140-a9f7-caf604352a8f"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="eb4621ba-a03c-420e-8fc6-bf8cca51b319" connectedTo="19bba5d1-e750-4f4f-a261-6bfecc0bc9f1"/>
      </asset>
      <asset xsi:type="esdl:ElectricityCable" length="5.0" id="52da01f3-fd25-4f6c-a6bc-31ae50fbce49" capacity="100000.0" name="Cable_DEMAND_4556_Joint_837">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51671901301933" lon="3.993692408609754"/>
          <point xsi:type="esdl:Point" lat="51.51681901301934" lon="3.993692408609754"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0986c29c-6997-4ed4-a891-9c8e1c0c2259" name="InPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="79eb17a2-55d1-41cd-a9dd-2a4088de2fa5"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="06babafd-b84a-429f-a4fb-b1bb0bc2a5cc" id="f17ae812-5b36-4bfb-b483-b480862eaa99" connectedTo="96a836db-f214-4a9d-9973-76063117a948"/>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="8e-06" id="85bc46ad-be89-4b57-b683-d7ef0dbbeb0a" innerDiameter="0.0558" diameter="DN50" length="10.23" name="PIPE_19">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.509727120059836" lon="3.9849277628976365"/>
          <point xsi:type="esdl:Point" lat="51.509767161370284" lon="3.984893393023394"/>
          <point xsi:type="esdl:Point" lat="51.5097716373044" lon="3.9848918143359864"/>
          <point xsi:type="esdl:Point" lat="51.5097752491791" lon="3.9848931436073562"/>
          <point xsi:type="esdl:Point" lat="51.50979254824975" lon="3.984911338669078"/>
          <point xsi:type="esdl:Point" lat="51.5097952614788" lon="3.984912695655126"/>
          <point xsi:type="esdl:Point" lat="51.50979704147689" lon="3.984911200106297"/>
          <point xsi:type="esdl:Point" lat="51.50979704147689" lon="3.984911200106297"/>
          <point xsi:type="esdl:Point" lat="51.509799783855314" lon="3.9849052520618926"/>
          <point xsi:type="esdl:Point" lat="51.509799783855314" lon="3.9849052520618926"/>
          <point xsi:type="esdl:Point" lat="51.50980324548976" lon="3.9848985615074266"/>
          <point xsi:type="esdl:Point" lat="51.50980324548976" lon="3.9848985615074266"/>
          <point xsi:type="esdl:Point" lat="51.50980493906405" lon="3.9848951093290257"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="4fed794e-d913-4e17-940b-a0237bd68b17" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="06174b65-5b40-478f-9ee5-0971e72d3286"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="a0ab76b3-60c7-4642-9a65-b84e04e5f66a" connectedTo="aa6d88a9-b9d0-4528-b719-882a3f4355f0"/>
        <costInformation xsi:type="esdl:CostInformation" id="281319fe-6b86-4947-8afc-dec4e4ce978a">
          <investmentCosts xsi:type="esdl:SingleValue" id="af30edf9-7ba5-4e77-8978-cf72f5156bcf" value="778.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="723bf488-333d-4ad4-9e64-1a872ad5a543" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="8e-06" id="522bb531-364b-432e-978f-8f2bea88b964" innerDiameter="0.0974" diameter="DN100" length="496.49" name="PIPE_56">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.505168716193396" lon="3.97957420809941"/>
          <point xsi:type="esdl:Point" lat="51.50517736202378" lon="3.9795546232315466"/>
          <point xsi:type="esdl:Point" lat="51.505180967404215" lon="3.97954645917509"/>
          <point xsi:type="esdl:Point" lat="51.50518351180964" lon="3.979540517535537"/>
          <point xsi:type="esdl:Point" lat="51.50518351180964" lon="3.979540517535537"/>
          <point xsi:type="esdl:Point" lat="51.50518533911535" lon="3.9795362402752774"/>
          <point xsi:type="esdl:Point" lat="51.50518533911535" lon="3.9795362402752774"/>
          <point xsi:type="esdl:Point" lat="51.50598673492788" lon="3.9804650706461184"/>
          <point xsi:type="esdl:Point" lat="51.50802805774019" lon="3.982833659966753"/>
          <point xsi:type="esdl:Point" lat="51.50862594212777" lon="3.9835223673951967"/>
          <point xsi:type="esdl:Point" lat="51.508634701669116" lon="3.9835308847941464"/>
          <point xsi:type="esdl:Point" lat="51.50877253883554" lon="3.983675720367213"/>
          <point xsi:type="esdl:Point" lat="51.50877253883554" lon="3.983675720367213"/>
          <point xsi:type="esdl:Point" lat="51.50878288022224" lon="3.9836879490320665"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="7af297aa-3f17-4b1b-961f-a21af662a37d" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="295031c2-c814-4560-a7bf-3eb8b29597dc"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="55e0fa74-4bb7-41a0-9813-6c14269868c5" connectedTo="125e66c8-8e8b-43f0-b8ba-19d31f7cfc9d"/>
        <costInformation xsi:type="esdl:CostInformation" id="efce3eae-5779-48da-906e-8c45e0413a9d">
          <investmentCosts xsi:type="esdl:SingleValue" id="e0c89168-37aa-4317-bedf-6d26674dd481" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="957f104c-ab97-4abf-8b1b-7e2f656a55be" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="8e-06" id="4a14964d-afbf-46de-b205-5e8dddf0bdfa" innerDiameter="0.0974" diameter="DN100" length="670.77" name="PIPE_163">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51484205674142" lon="3.9899760532214232"/>
          <point xsi:type="esdl:Point" lat="51.5148049509325" lon="3.98998690461545"/>
          <point xsi:type="esdl:Point" lat="51.5147331798137" lon="3.9899991958892707"/>
          <point xsi:type="esdl:Point" lat="51.51466135700166" lon="3.990007166282118"/>
          <point xsi:type="esdl:Point" lat="51.514611879742496" lon="3.990004364308866"/>
          <point xsi:type="esdl:Point" lat="51.51456231633007" lon="3.9899943609550754"/>
          <point xsi:type="esdl:Point" lat="51.51448026378937" lon="3.9899738296030183"/>
          <point xsi:type="esdl:Point" lat="51.514346574831904" lon="3.9899203059781048"/>
          <point xsi:type="esdl:Point" lat="51.51427954079235" lon="3.989877701332018"/>
          <point xsi:type="esdl:Point" lat="51.51406612681477" lon="3.989712676311851"/>
          <point xsi:type="esdl:Point" lat="51.51406449356782" lon="3.989711415391988"/>
          <point xsi:type="esdl:Point" lat="51.5140164172047" lon="3.9896754325539296"/>
          <point xsi:type="esdl:Point" lat="51.513624584499574" lon="3.989309992615893"/>
          <point xsi:type="esdl:Point" lat="51.51332475746688" lon="3.9889705448685353"/>
          <point xsi:type="esdl:Point" lat="51.512889860000506" lon="3.9884623657073295"/>
          <point xsi:type="esdl:Point" lat="51.51218616664519" lon="3.987654151285385"/>
          <point xsi:type="esdl:Point" lat="51.51144410292605" lon="3.9867952778389375"/>
          <point xsi:type="esdl:Point" lat="51.51107481418845" lon="3.9863614757433066"/>
          <point xsi:type="esdl:Point" lat="51.51050091052459" lon="3.985704687646371"/>
          <point xsi:type="esdl:Point" lat="51.51050091052459" lon="3.985704687646371"/>
          <point xsi:type="esdl:Point" lat="51.51049458301472" lon="3.985697304697289"/>
          <point xsi:type="esdl:Point" lat="51.51049458301472" lon="3.985697304697289"/>
          <point xsi:type="esdl:Point" lat="51.51040096280675" lon="3.985587140358196"/>
          <point xsi:type="esdl:Point" lat="51.51040096280675" lon="3.985587140358196"/>
          <point xsi:type="esdl:Point" lat="51.510395072170475" lon="3.9855802049914955"/>
          <point xsi:type="esdl:Point" lat="51.50980768687918" lon="3.9848993465626608"/>
          <point xsi:type="esdl:Point" lat="51.50980493906405" lon="3.9848951093290257"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="8aff504b-502f-47ee-9c09-12a647bc98f5" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="7705a910-06fd-4cec-b61c-6e27eff37f81"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="e695fe9b-4a3a-4133-a85e-a2f1ab346e9d" connectedTo="aa6d88a9-b9d0-4528-b719-882a3f4355f0"/>
        <costInformation xsi:type="esdl:CostInformation" id="ff2731e3-ea8e-4f83-9105-857a4364e4a3">
          <investmentCosts xsi:type="esdl:SingleValue" id="8d20e7b9-eb76-45ed-9aa8-5afdd115eca4" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5fe33dbd-dbc0-4730-b574-8987f17046da" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="8e-06" id="5226fecf-ff4b-4582-a570-e0ac3d55c679" innerDiameter="0.0974" diameter="DN100" length="141.31" name="PIPE_214">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.50980493906405" lon="3.9848951093290257"/>
          <point xsi:type="esdl:Point" lat="51.50885251818357" lon="3.983786197036733"/>
          <point xsi:type="esdl:Point" lat="51.508844111875305" lon="3.98377640089514"/>
          <point xsi:type="esdl:Point" lat="51.50878288022224" lon="3.9836879490320665"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="e8f6d8b2-daed-4dd9-a6ff-b7cc57853b88" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="432f0ef8-349d-4a74-9809-059ccfc41978"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="3f09cf74-ad32-4af4-8584-e2c3a88879e9" connectedTo="125e66c8-8e8b-43f0-b8ba-19d31f7cfc9d"/>
        <costInformation xsi:type="esdl:CostInformation" id="f0585624-3ca6-4440-8181-ae0386900180">
          <investmentCosts xsi:type="esdl:SingleValue" id="b8d08fdf-9de3-46b9-ae6e-55c50d9aeb4b" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a53d8b24-e068-4024-a73e-dca2953d295f" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="0.0002" id="bfe7172d-97e3-4ae9-a491-ae4c86c9d475" innerDiameter="0.1053" diameter="DN100" length="14.57" name="PIPE_254">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51491448148684" lon="3.989827541275302"/>
          <point xsi:type="esdl:Point" lat="51.51491392290211" lon="3.989823682642942"/>
          <point xsi:type="esdl:Point" lat="51.514927587262626" lon="3.98981541021395"/>
          <point xsi:type="esdl:Point" lat="51.514931697620426" lon="3.989817834131599"/>
          <point xsi:type="esdl:Point" lat="51.51495861909058" lon="3.9898040681485316"/>
          <point xsi:type="esdl:Point" lat="51.51496109393709" lon="3.989805793108184"/>
          <point xsi:type="esdl:Point" lat="51.514961630367765" lon="3.989805546089852"/>
          <point xsi:type="esdl:Point" lat="51.514961630367765" lon="3.989805546089852"/>
          <point xsi:type="esdl:Point" lat="51.514962023359644" lon="3.989805332296502"/>
          <point xsi:type="esdl:Point" lat="51.514962023359644" lon="3.989805332296502"/>
          <point xsi:type="esdl:Point" lat="51.51496595327842" lon="3.9898031943628034"/>
          <point xsi:type="esdl:Point" lat="51.51496595327842" lon="3.9898031943628034"/>
          <point xsi:type="esdl:Point" lat="51.51500067781059" lon="3.989782661612229"/>
          <point xsi:type="esdl:Point" lat="51.51498931724107" lon="3.989740045523907"/>
          <point xsi:type="esdl:Point" lat="51.51499577058398" lon="3.9897339253981747"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0fdfc77a-fb7b-487c-affb-8c43c3d4bc17" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="0cd8e35b-c04a-452a-8518-cdc4d73b4fac"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="dfd3b1e5-b0b1-4502-a96e-faf17e9e4dd1" connectedTo="94d3ff98-248a-4e5b-9d7d-362ec9c7043a"/>
        <costInformation xsi:type="esdl:CostInformation" id="e7fe0835-866f-4928-a7d6-667a20decfb5">
          <investmentCosts xsi:type="esdl:SingleValue" id="3cf43962-f213-42dc-aaec-3ac2bcc60b09" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="bdc1960a-4018-4dac-a180-a81b4c72e311" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="0.0002" id="082bcb74-987a-44e3-b712-72b1b9d2e835" innerDiameter="0.1053" diameter="DN100" length="0.2" name="PIPE_261">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51499577058398" lon="3.9897339253981747"/>
          <point xsi:type="esdl:Point" lat="51.51499683010041" lon="3.9897345700178444"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="d6a615ad-fa52-438e-95d9-bb0cc2917686" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="aaa5ab6c-dbde-48c8-a8ea-4709b4ffc596"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="b5117cb8-fdfa-4395-96c9-ed24879a96cf" connectedTo="54ea1bf6-e1d6-488d-bff1-e0dce65de19a"/>
        <costInformation xsi:type="esdl:CostInformation" id="0503ae08-b281-40e6-b79e-c2c167ce498b">
          <investmentCosts xsi:type="esdl:SingleValue" id="2226f706-ffd4-4fd9-b410-92c3f289b7b9" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="46551f58-fa49-4953-8899-913479e0ad13" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="f0d094f0-3f7b-4700-9ad5-4bb7149914e0" innerDiameter="0.1034" diameter="DN100" length="39.66" name="PIPE_377">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51396603297594" lon="3.993659317574499"/>
          <point xsi:type="esdl:Point" lat="51.51401489147968" lon="3.9936102740717057"/>
          <point xsi:type="esdl:Point" lat="51.51408240167623" lon="3.9935354449222737"/>
          <point xsi:type="esdl:Point" lat="51.51411514968138" lon="3.9934991417276913"/>
          <point xsi:type="esdl:Point" lat="51.51416649780222" lon="3.993432732052377"/>
          <point xsi:type="esdl:Point" lat="51.51419033158107" lon="3.9933959815871916"/>
          <point xsi:type="esdl:Point" lat="51.514214909293116" lon="3.9933462411233522"/>
          <point xsi:type="esdl:Point" lat="51.514214909293116" lon="3.9933462411233522"/>
          <point xsi:type="esdl:Point" lat="51.5142261275966" lon="3.9933069957389353"/>
          <point xsi:type="esdl:Point" lat="51.514229515909044" lon="3.9932896023183684"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0100b35f-3858-48e3-90c4-cb24477964ab" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="a05b0f0b-3805-4e9e-a602-f4ab59200b55"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="0c18289c-3917-4d37-b359-9210505b4825" connectedTo="93915028-191e-4a3c-b511-1546a2a69608"/>
        <costInformation xsi:type="esdl:CostInformation" id="7df08f08-9594-4abb-b6e6-122ac67cc707">
          <investmentCosts xsi:type="esdl:SingleValue" id="69515155-ea52-43bb-8b48-d12c5db3cb08" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b040f975-6837-4129-855f-6398d7a76656" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="ec8ca57e-7e0c-4b85-8ff6-590ca43849ca" innerDiameter="0.1506" diameter="DN150" length="118.58" name="PIPE_381">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51667459889051" lon="3.993730469376887"/>
          <point xsi:type="esdl:Point" lat="51.516636804132645" lon="3.9937273051784805"/>
          <point xsi:type="esdl:Point" lat="51.51659356593364" lon="3.9937199852175937"/>
          <point xsi:type="esdl:Point" lat="51.51659356593364" lon="3.9937199852175937"/>
          <point xsi:type="esdl:Point" lat="51.51655934858114" lon="3.9937152705149046"/>
          <point xsi:type="esdl:Point" lat="51.51648044460056" lon="3.9937091734305463"/>
          <point xsi:type="esdl:Point" lat="51.516364000574775" lon="3.9937001637554377"/>
          <point xsi:type="esdl:Point" lat="51.51633865301696" lon="3.993698203034894"/>
          <point xsi:type="esdl:Point" lat="51.51632610072732" lon="3.9936972333602854"/>
          <point xsi:type="esdl:Point" lat="51.51632021583794" lon="3.9936967653481696"/>
          <point xsi:type="esdl:Point" lat="51.51630877941811" lon="3.99369589114967"/>
          <point xsi:type="esdl:Point" lat="51.516301302031906" lon="3.9936953134542508"/>
          <point xsi:type="esdl:Point" lat="51.516267073306864" lon="3.993692659576405"/>
          <point xsi:type="esdl:Point" lat="51.51626461690526" lon="3.993692475512031"/>
          <point xsi:type="esdl:Point" lat="51.51625251445493" lon="3.9936915352782796"/>
          <point xsi:type="esdl:Point" lat="51.51623543666838" lon="3.993687246255651"/>
          <point xsi:type="esdl:Point" lat="51.5162250134146" lon="3.993684640793648"/>
          <point xsi:type="esdl:Point" lat="51.5161871159074" lon="3.9936751256298333"/>
          <point xsi:type="esdl:Point" lat="51.51617217513321" lon="3.993671376277417"/>
          <point xsi:type="esdl:Point" lat="51.51611037438889" lon="3.9936558794151438"/>
          <point xsi:type="esdl:Point" lat="51.516106704519004" lon="3.9936549544862014"/>
          <point xsi:type="esdl:Point" lat="51.5161008075994" lon="3.9936534782521083"/>
          <point xsi:type="esdl:Point" lat="51.51606099859761" lon="3.993643488613821"/>
          <point xsi:type="esdl:Point" lat="51.51604555286103" lon="3.993639610674438"/>
          <point xsi:type="esdl:Point" lat="51.51604195522654" lon="3.993638712350992"/>
          <point xsi:type="esdl:Point" lat="51.5160352016698" lon="3.9936370174334863"/>
          <point xsi:type="esdl:Point" lat="51.515949136848505" lon="3.993615434776651"/>
          <point xsi:type="esdl:Point" lat="51.515937460176154" lon="3.9936125075544853"/>
          <point xsi:type="esdl:Point" lat="51.515904467805136" lon="3.9936042253691073"/>
          <point xsi:type="esdl:Point" lat="51.51589514811785" lon="3.993602191273607"/>
          <point xsi:type="esdl:Point" lat="51.51588814482968" lon="3.9936006625148983"/>
          <point xsi:type="esdl:Point" lat="51.51588254755664" lon="3.9935994364623486"/>
          <point xsi:type="esdl:Point" lat="51.51586371895025" lon="3.993595330851008"/>
          <point xsi:type="esdl:Point" lat="51.51579450624213" lon="3.9935802198830124"/>
          <point xsi:type="esdl:Point" lat="51.51573314039743" lon="3.9935604882675273"/>
          <point xsi:type="esdl:Point" lat="51.515729531025926" lon="3.993559359781197"/>
          <point xsi:type="esdl:Point" lat="51.51569828246975" lon="3.9935495545584403"/>
          <point xsi:type="esdl:Point" lat="51.51568712030841" lon="3.9935460496690287"/>
          <point xsi:type="esdl:Point" lat="51.51561770100284" lon="3.9935294466921976"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="e14af9ed-1c34-4cc6-ab51-58398ef3336d" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="16d9ead5-4938-4488-8b1a-9dd243dd6c0f"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="3882ab03-ceca-448e-87b5-dd25f1017da7" connectedTo="db51efb5-84a2-41c3-bb1b-827b518ce5a6"/>
        <costInformation xsi:type="esdl:CostInformation" id="aad28ad9-a987-4572-8f1e-3f894991714b">
          <investmentCosts xsi:type="esdl:SingleValue" id="e99cb716-9168-46bf-8398-fb6aa4d209b8" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="c3c6afbe-b7d3-4950-9d72-a4f9c3ec6394" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="0.0002" id="106ef0c3-f367-4fd3-85a1-89702cf8b4b7" innerDiameter="0.2065" diameter="DN200" length="6.71" name="PIPE_551">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51499740149241" lon="3.9897327370212303"/>
          <point xsi:type="esdl:Point" lat="51.5150043426148" lon="3.9897290657041418"/>
          <point xsi:type="esdl:Point" lat="51.515048679377074" lon="3.9896921866658386"/>
          <point xsi:type="esdl:Point" lat="51.515048679377074" lon="3.9896921866658386"/>
          <point xsi:type="esdl:Point" lat="51.515051396120846" lon="3.9896900860083466"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="39d87d31-31bc-4786-a5c1-1d7cb691db66" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="063d9662-00d0-43d6-a0e7-310bcf294b9b"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="98632bc5-04ed-4160-a3cb-45dcac2053bb" connectedTo="70923eb2-81b7-4c67-8a13-c3f08456e13a"/>
        <costInformation xsi:type="esdl:CostInformation" id="0c057873-4bff-4dfb-bc08-529bfde3c70a">
          <investmentCosts xsi:type="esdl:SingleValue" id="1846a35f-80ef-431d-ad1c-603d2c471694" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e78788d5-7896-460a-8174-d8da800782ba" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="0.0002" id="378a42fc-34aa-4ee3-b4a4-5d5e749275ae" innerDiameter="0.2065" diameter="DN200" length="0.2" name="PIPE_598">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51499683010041" lon="3.9897345700178444"/>
          <point xsi:type="esdl:Point" lat="51.51499740149241" lon="3.9897327370212303"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="8d3931fa-4f17-45e7-b98a-b1bad10bbdf2" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="21d71a39-5599-4d4d-a193-f6c0a2ce9bc0"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="8287b421-4ac4-45d3-96a4-ca1c775eebcb" connectedTo="5a18f965-b46d-470b-83b2-9f72f0bd552d"/>
        <costInformation xsi:type="esdl:CostInformation" id="91bf52ae-000b-4d6e-b07f-ca949a3a67c1">
          <investmentCosts xsi:type="esdl:SingleValue" id="d7e302f9-0c62-4b83-8fe2-11a19f93194a" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="6c6b6764-a05c-4018-8bc2-1c39652e721c" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="36132405-8f51-4551-8b95-885153bd767d" innerDiameter="0.1506" diameter="DN150" length="10.2" name="PIPE_662">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51550752084822" lon="3.99341179390619"/>
          <point xsi:type="esdl:Point" lat="51.515507606791104" lon="3.9934189954505013"/>
          <point xsi:type="esdl:Point" lat="51.515508225566776" lon="3.99347084657047"/>
          <point xsi:type="esdl:Point" lat="51.51552799581608" lon="3.99347024051536"/>
          <point xsi:type="esdl:Point" lat="51.515528666130805" lon="3.993526412588246"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0be12169-92fe-4c26-bebe-fb7bcca8bac9" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="b584af6f-d7b3-4029-a1d6-5be1df2d785a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="c0e5bd3b-b9c0-460c-93cc-d24bc3d194a5" connectedTo="d547255a-23b6-4eb1-98e8-9352dfb8d49a"/>
        <costInformation xsi:type="esdl:CostInformation" id="372ec2c6-c6a2-4e2a-b615-562489d8c7ca">
          <investmentCosts xsi:type="esdl:SingleValue" id="eeb0051f-2608-4598-b8a3-72f969f64f6c" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="303f2fda-10ec-4a09-90ba-25832d782730" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="fa133051-ef84-4553-a07c-c0b0131b890a" innerDiameter="0.1034" diameter="DN100" length="16.03" name="PIPE_693">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51556474911341" lon="3.9924072164350237"/>
          <point xsi:type="esdl:Point" lat="51.51555390889789" lon="3.9921770149854128"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="a4ec3461-192b-4c3f-afb1-08741c0505b0" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="281bdd22-25ac-4534-aea8-360ab082f991"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="3726a55c-2e95-43b3-a06d-3cf0b89ba1cb" connectedTo="b2cf8b98-9bde-4e1b-9eed-8f95cf8f1573"/>
        <costInformation xsi:type="esdl:CostInformation" id="a5c9fe76-12f0-43c8-b541-d038a149498c">
          <investmentCosts xsi:type="esdl:SingleValue" id="0d10f289-16ac-4397-90de-89cbd522ff02" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="69f2d88f-7302-4e2b-9417-220c3aa66d2a" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="0.0002" id="a9a710d9-2635-460c-b54e-fc1ef804a71c" innerDiameter="0.2065" diameter="DN200" length="0.2" name="PIPE_737">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51499625782333" lon="3.989731821232265"/>
          <point xsi:type="esdl:Point" lat="51.51499740149241" lon="3.9897327370212303"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="bd6c372d-bdbb-4b2c-b83b-3352b193978b" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="cf6ec191-d51b-4315-a3ce-8de94488b4de"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="d5241f3c-e1e9-4f36-abb7-f8b5bfee198e" connectedTo="5a18f965-b46d-470b-83b2-9f72f0bd552d"/>
        <costInformation xsi:type="esdl:CostInformation" id="0ff3ae79-b989-4fae-8b98-ba631ac31213">
          <investmentCosts xsi:type="esdl:SingleValue" id="c32b5ffe-eea9-4699-acfd-58229a5ffa27" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="f739ec36-1c73-4539-b09b-000e649b3538" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="6a3722c7-36e4-4f40-b3fc-b0c11a01e59e" innerDiameter="0.1034" diameter="DN100" length="11.41" name="PIPE_763">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516048950939656" lon="3.9963734377668203"/>
          <point xsi:type="esdl:Point" lat="51.516022838674985" lon="3.9963699140255446"/>
          <point xsi:type="esdl:Point" lat="51.515959641686386" lon="3.9963473528774074"/>
          <point xsi:type="esdl:Point" lat="51.515948227470446" lon="3.9963438117686345"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0c7d0634-5f30-4038-bc0d-a7533a598a38" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="1696ac89-fc3b-452e-8b5a-f72c138afa95"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="51fbb0a9-ff08-4ff1-abf9-847f48188ca9" connectedTo="9387dc75-352d-45aa-abb7-f74e89f8ac14"/>
        <costInformation xsi:type="esdl:CostInformation" id="03dc3b62-6026-4720-9483-40a82ade6052">
          <investmentCosts xsi:type="esdl:SingleValue" id="6dd450c1-b529-4ca2-95f3-b34a4c79d303" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="38ed6c50-d718-41be-bae1-048bf5b117af" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="5c9e52de-4bc4-4d90-b7d4-0e12a0a34da8" innerDiameter="0.1506" diameter="DN150" length="9.92" name="PIPE_768">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51561770100284" lon="3.9935294466921976"/>
          <point xsi:type="esdl:Point" lat="51.51560418691284" lon="3.9935269792712127"/>
          <point xsi:type="esdl:Point" lat="51.51560328826513" lon="3.9935270068181246"/>
          <point xsi:type="esdl:Point" lat="51.51557541299896" lon="3.9935264204606993"/>
          <point xsi:type="esdl:Point" lat="51.515528666130805" lon="3.993526412588246"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="d8aaa29f-69a1-4b47-aacc-08e34b730e6d" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="e42069f7-4773-41db-b7e9-2060f7aedc59"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="66d3441b-de98-4020-9cce-8b93b55c764d" connectedTo="d547255a-23b6-4eb1-98e8-9352dfb8d49a"/>
        <costInformation xsi:type="esdl:CostInformation" id="47e99eb8-be10-4619-b5f6-33282f1d7a65">
          <investmentCosts xsi:type="esdl:SingleValue" id="db442483-7693-427d-b076-78a6482a1a7d" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="20fc9c64-8f1b-42b8-82c0-0961e1dfb28d" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="fabe849a-b9ff-4119-9f04-bf081907c3dd" innerDiameter="0.1882" diameter="DN200" length="6.279999999999999" name="PIPE_813">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51508630078258" lon="3.989725177786908"/>
          <point xsi:type="esdl:Point" lat="51.51506931355488" lon="3.9896743778111476"/>
          <point xsi:type="esdl:Point" lat="51.5150550146624" lon="3.989686718524104"/>
          <point xsi:type="esdl:Point" lat="51.5150550146624" lon="3.989686718524104"/>
          <point xsi:type="esdl:Point" lat="51.515051396120846" lon="3.9896900860083466"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="9c1faeff-5359-4ef0-8fc3-1e725b34c2e9" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="cecba3a6-41e6-4684-b03d-069ea4fe3f09"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="c4f69a4e-09a4-49de-8bf6-ab67f61af146" connectedTo="70923eb2-81b7-4c67-8a13-c3f08456e13a"/>
        <costInformation xsi:type="esdl:CostInformation" id="1ac86dfa-087a-4539-8d7a-3bd439fedda2">
          <investmentCosts xsi:type="esdl:SingleValue" id="d13b100b-2ebd-46d4-bbdf-0a610c72db77" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="1500f825-eab9-4092-b454-2f741bde5d2e" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="8e896844-7152-42ac-92b0-4cb18ee39284" innerDiameter="0.1034" diameter="DN100" length="2.1" name="PIPE_832">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51556474911341" lon="3.9924072164350237"/>
          <point xsi:type="esdl:Point" lat="51.515567445055495" lon="3.9924071337279816"/>
          <point xsi:type="esdl:Point" lat="51.515583603507" lon="3.9924051971747203"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="a4ec3461-192b-4c3f-afb1-08741c0505b0" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="151480c5-5ac7-4e9f-ade9-f609742416b5"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="79093967-6a3d-4e08-9eab-d0e95e905668" connectedTo="a90090a0-0d62-4aa8-a554-41b092b278b3"/>
        <costInformation xsi:type="esdl:CostInformation" id="134ccad1-8ef8-47b7-82b7-20df2de2d9f4">
          <investmentCosts xsi:type="esdl:SingleValue" id="4ff05e54-5f03-42b3-b6fe-29c9e08a9e5d" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ea904721-5bce-438d-99a2-7f12eace41cc" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="a62d26d9-8798-47b3-8e6b-a1e168e74112" innerDiameter="0.1034" diameter="DN100" length="23.73" name="PIPE_1007">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51585706144299" lon="3.9893364476904223"/>
          <point xsi:type="esdl:Point" lat="51.51584480908665" lon="3.989295947558206"/>
          <point xsi:type="esdl:Point" lat="51.51583459748242" lon="3.9892622143145333"/>
          <point xsi:type="esdl:Point" lat="51.51582721867228" lon="3.989246591879402"/>
          <point xsi:type="esdl:Point" lat="51.51582079022699" lon="3.989235262767478"/>
          <point xsi:type="esdl:Point" lat="51.51581441350143" lon="3.989228254608263"/>
          <point xsi:type="esdl:Point" lat="51.51580535807669" lon="3.989222769663736"/>
          <point xsi:type="esdl:Point" lat="51.51579004660788" lon="3.9892203587784967"/>
          <point xsi:type="esdl:Point" lat="51.515781976030944" lon="3.989222047783506"/>
          <point xsi:type="esdl:Point" lat="51.51577304128817" lon="3.98922664505038"/>
          <point xsi:type="esdl:Point" lat="51.51572306614181" lon="3.9891071508360714"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ad892b4b-835e-448e-b7ab-e84fd62c6b7e" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="1a9da5e7-24f2-462e-8942-3c5ae216009f"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="f1e29786-345b-4ec4-af09-4abce10e03d1" connectedTo="1d777769-1c1a-4571-bc52-01fce0979938"/>
        <costInformation xsi:type="esdl:CostInformation" id="214b812e-301e-4968-a882-c6b29cc64fd3">
          <investmentCosts xsi:type="esdl:SingleValue" id="001fb59a-1b67-4723-bf81-60d9cab16c34" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="311b34b0-2b12-4472-8f13-3e54411604be" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="8b6af526-3136-498d-a2bc-867268527ae0" innerDiameter="0.1506" diameter="DN150" length="149.62" name="PIPE_1030">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515528052719105" lon="3.994524786855309"/>
          <point xsi:type="esdl:Point" lat="51.515528772234006" lon="3.994563263957944"/>
          <point xsi:type="esdl:Point" lat="51.51552944691217" lon="3.994597981852444"/>
          <point xsi:type="esdl:Point" lat="51.5155294677487" lon="3.9945989753911855"/>
          <point xsi:type="esdl:Point" lat="51.515530264114275" lon="3.994640130097128"/>
          <point xsi:type="esdl:Point" lat="51.515528923565746" lon="3.9947863151663414"/>
          <point xsi:type="esdl:Point" lat="51.51552861355722" lon="3.9948198817334934"/>
          <point xsi:type="esdl:Point" lat="51.515528518881126" lon="3.994830791762205"/>
          <point xsi:type="esdl:Point" lat="51.51552752810658" lon="3.9949384669657713"/>
          <point xsi:type="esdl:Point" lat="51.515527385224786" lon="3.9949868113897486"/>
          <point xsi:type="esdl:Point" lat="51.515527319816954" lon="3.9950099820357012"/>
          <point xsi:type="esdl:Point" lat="51.515527052077715" lon="3.9951006476345245"/>
          <point xsi:type="esdl:Point" lat="51.51552675320123" lon="3.9952037918233825"/>
          <point xsi:type="esdl:Point" lat="51.51552662746237" lon="3.995246040982584"/>
          <point xsi:type="esdl:Point" lat="51.51552646244228" lon="3.9953015902592437"/>
          <point xsi:type="esdl:Point" lat="51.515529941855" lon="3.995442685666064"/>
          <point xsi:type="esdl:Point" lat="51.51553252865758" lon="3.995508884938505"/>
          <point xsi:type="esdl:Point" lat="51.51553375339523" lon="3.995536223334704"/>
          <point xsi:type="esdl:Point" lat="51.515537656909416" lon="3.9955620389017312"/>
          <point xsi:type="esdl:Point" lat="51.515545172173084" lon="3.9955891847598375"/>
          <point xsi:type="esdl:Point" lat="51.51555292393514" lon="3.995609018346215"/>
          <point xsi:type="esdl:Point" lat="51.51555351743291" lon="3.995610541875756"/>
          <point xsi:type="esdl:Point" lat="51.515554964349974" lon="3.995613523345865"/>
          <point xsi:type="esdl:Point" lat="51.515561811205025" lon="3.995627578064502"/>
          <point xsi:type="esdl:Point" lat="51.51557100362304" lon="3.9956445867544397"/>
          <point xsi:type="esdl:Point" lat="51.51557829708633" lon="3.9956538730497524"/>
          <point xsi:type="esdl:Point" lat="51.51559199859318" lon="3.995671320078546"/>
          <point xsi:type="esdl:Point" lat="51.515616767817384" lon="3.995698687148491"/>
          <point xsi:type="esdl:Point" lat="51.515627526374594" lon="3.9957105761871303"/>
          <point xsi:type="esdl:Point" lat="51.51566290327883" lon="3.9957477333475446"/>
          <point xsi:type="esdl:Point" lat="51.5157468758144" lon="3.9958359508713706"/>
          <point xsi:type="esdl:Point" lat="51.515756798914346" lon="3.995846381474916"/>
          <point xsi:type="esdl:Point" lat="51.515825237843586" lon="3.9959256083501753"/>
          <point xsi:type="esdl:Point" lat="51.51588897312551" lon="3.9959993889037992"/>
          <point xsi:type="esdl:Point" lat="51.515943664069745" lon="3.9960625535833447"/>
          <point xsi:type="esdl:Point" lat="51.5159587608732" lon="3.996136770871848"/>
          <point xsi:type="esdl:Point" lat="51.51595951506553" lon="3.996140465187593"/>
          <point xsi:type="esdl:Point" lat="51.51596481238156" lon="3.9961663248513695"/>
          <point xsi:type="esdl:Point" lat="51.515955702409435" lon="3.996280776476076"/>
          <point xsi:type="esdl:Point" lat="51.515949165242226" lon="3.9963372560341406"/>
          <point xsi:type="esdl:Point" lat="51.515949165242226" lon="3.9963372560341406"/>
          <point xsi:type="esdl:Point" lat="51.515948227470446" lon="3.9963438117686345"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="dfeb88fe-0749-40e6-a3c9-349665fc7a34" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="4c97d337-11ae-4660-889a-af60b26e0452"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="a3c7e601-a105-4330-bd00-9974def95c22" connectedTo="9387dc75-352d-45aa-abb7-f74e89f8ac14"/>
        <costInformation xsi:type="esdl:CostInformation" id="7ce6c78b-75e0-453b-87ae-6d4f95a9b565">
          <investmentCosts xsi:type="esdl:SingleValue" id="09a9db7e-c3a3-4c3d-9ede-a685456ae82d" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="19d63722-4be4-429a-ac30-9a85e44b4660" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="49e43132-6d46-4b89-abeb-50093f51ea08" innerDiameter="0.1034" diameter="DN100" length="88.17" name="PIPE_1072">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51636199923638" lon="3.9921695098760184"/>
          <point xsi:type="esdl:Point" lat="51.5163413991659" lon="3.9921759054242174"/>
          <point xsi:type="esdl:Point" lat="51.51617754884469" lon="3.9922313630135227"/>
          <point xsi:type="esdl:Point" lat="51.51615898805235" lon="3.992236889056736"/>
          <point xsi:type="esdl:Point" lat="51.51615162474012" lon="3.9922390889558153"/>
          <point xsi:type="esdl:Point" lat="51.51614139487422" lon="3.9922421404610002"/>
          <point xsi:type="esdl:Point" lat="51.516137686344656" lon="3.9922432484385895"/>
          <point xsi:type="esdl:Point" lat="51.51610342232561" lon="3.9922534491711907"/>
          <point xsi:type="esdl:Point" lat="51.51610327007165" lon="3.992253497068327"/>
          <point xsi:type="esdl:Point" lat="51.51609931976735" lon="3.992254684504945"/>
          <point xsi:type="esdl:Point" lat="51.51609651577486" lon="3.992255505373453"/>
          <point xsi:type="esdl:Point" lat="51.51608355380774" lon="3.9922593755333704"/>
          <point xsi:type="esdl:Point" lat="51.51604412127888" lon="3.9922711324479248"/>
          <point xsi:type="esdl:Point" lat="51.51604131745829" lon="3.9922719677176417"/>
          <point xsi:type="esdl:Point" lat="51.516033506197864" lon="3.9922742966171754"/>
          <point xsi:type="esdl:Point" lat="51.51603261928948" lon="3.9922745543654545"/>
          <point xsi:type="esdl:Point" lat="51.515995506858246" lon="3.9922856205032344"/>
          <point xsi:type="esdl:Point" lat="51.515992873264445" lon="3.992286407322797"/>
          <point xsi:type="esdl:Point" lat="51.51598310015902" lon="3.9922893151156966"/>
          <point xsi:type="esdl:Point" lat="51.51598029633828" lon="3.9922901503831367"/>
          <point xsi:type="esdl:Point" lat="51.515935265150596" lon="3.9923035774993845"/>
          <point xsi:type="esdl:Point" lat="51.51593079500645" lon="3.9923048961442373"/>
          <point xsi:type="esdl:Point" lat="51.515925366578095" lon="3.9923065179512065"/>
          <point xsi:type="esdl:Point" lat="51.515921756554974" lon="3.9923075940788495"/>
          <point xsi:type="esdl:Point" lat="51.515893046596545" lon="3.99231615464563"/>
          <point xsi:type="esdl:Point" lat="51.515885530856586" lon="3.9923183880120883"/>
          <point xsi:type="esdl:Point" lat="51.51588006665415" lon="3.9923200253218223"/>
          <point xsi:type="esdl:Point" lat="51.515874145517714" lon="3.9923217919179357"/>
          <point xsi:type="esdl:Point" lat="51.51584879464827" lon="3.992329341675118"/>
          <point xsi:type="esdl:Point" lat="51.51569023291997" lon="3.992375990792233"/>
          <point xsi:type="esdl:Point" lat="51.51562578832966" lon="3.9923995804908636"/>
          <point xsi:type="esdl:Point" lat="51.515583603507" lon="3.9924051971747203"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="8f0c931d-2f39-44ec-ae2d-f5806ec9a523" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="fbab4646-1dd6-4dde-932a-39de5513417a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="ca18bb2c-3945-4c40-b307-1229a39785da" connectedTo="a90090a0-0d62-4aa8-a554-41b092b278b3"/>
        <costInformation xsi:type="esdl:CostInformation" id="78775f24-23e3-4908-bfe0-f6d77eab5dc1">
          <investmentCosts xsi:type="esdl:SingleValue" id="6a328912-1e05-47ea-badb-8ae209e9a249" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="88805357-92d1-484d-937f-fdc65e21df40" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="5c31b1ba-5e50-4cf5-ad4c-7515d89e8eb7" innerDiameter="0.1034" diameter="DN100" length="144.17" name="PIPE_1088">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51550752084822" lon="3.99341179390619"/>
          <point xsi:type="esdl:Point" lat="51.51548073009317" lon="3.993407168851953"/>
          <point xsi:type="esdl:Point" lat="51.51546542476965" lon="3.9934045114450543"/>
          <point xsi:type="esdl:Point" lat="51.515457974905196" lon="3.993403226954433"/>
          <point xsi:type="esdl:Point" lat="51.51532687711391" lon="3.9933663119360334"/>
          <point xsi:type="esdl:Point" lat="51.515292997738335" lon="3.9933567748912"/>
          <point xsi:type="esdl:Point" lat="51.51523044343408" lon="3.9933391550139734"/>
          <point xsi:type="esdl:Point" lat="51.51516797034914" lon="3.993321561510847"/>
          <point xsi:type="esdl:Point" lat="51.51515836399682" lon="3.993318859105615"/>
          <point xsi:type="esdl:Point" lat="51.515139566216995" lon="3.993313571251914"/>
          <point xsi:type="esdl:Point" lat="51.51513519346047" lon="3.993313258656525"/>
          <point xsi:type="esdl:Point" lat="51.51509611688864" lon="3.9933104079538913"/>
          <point xsi:type="esdl:Point" lat="51.51498660702371" lon="3.993302411647778"/>
          <point xsi:type="esdl:Point" lat="51.51495994996287" lon="3.9933014566962406"/>
          <point xsi:type="esdl:Point" lat="51.51493416527782" lon="3.9933005326329694"/>
          <point xsi:type="esdl:Point" lat="51.51489983617224" lon="3.993300014608128"/>
          <point xsi:type="esdl:Point" lat="51.51488170963665" lon="3.993299749068072"/>
          <point xsi:type="esdl:Point" lat="51.51483172969809" lon="3.99330001343937"/>
          <point xsi:type="esdl:Point" lat="51.514829257729346" lon="3.993300031592532"/>
          <point xsi:type="esdl:Point" lat="51.51481731551332" lon="3.993301218981389"/>
          <point xsi:type="esdl:Point" lat="51.51477137799938" lon="3.9933057538956156"/>
          <point xsi:type="esdl:Point" lat="51.514714563342835" lon="3.9933140946223906"/>
          <point xsi:type="esdl:Point" lat="51.51471362113792" lon="3.993314238773017"/>
          <point xsi:type="esdl:Point" lat="51.514683943330375" lon="3.993320047376667"/>
          <point xsi:type="esdl:Point" lat="51.51465605937995" lon="3.993325512815913"/>
          <point xsi:type="esdl:Point" lat="51.51449499035729" lon="3.9933880828910366"/>
          <point xsi:type="esdl:Point" lat="51.51441410313291" lon="3.993357424123119"/>
          <point xsi:type="esdl:Point" lat="51.514361337306525" lon="3.993337429739811"/>
          <point xsi:type="esdl:Point" lat="51.51435466501504" lon="3.9933350120362623"/>
          <point xsi:type="esdl:Point" lat="51.514289630132104" lon="3.993311417239455"/>
          <point xsi:type="esdl:Point" lat="51.51428753547123" lon="3.9933106602017583"/>
          <point xsi:type="esdl:Point" lat="51.514229515909044" lon="3.9932896023183684"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0be12169-92fe-4c26-bebe-fb7bcca8bac9" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="d9c9302c-38e6-4cfc-ba4e-8a3fcff50e8c"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="4af0bb59-6f03-4e17-bbda-466668992159" connectedTo="93915028-191e-4a3c-b511-1546a2a69608"/>
        <costInformation xsi:type="esdl:CostInformation" id="0c2b46d7-768b-43fc-b0f7-db1545b6fa71">
          <investmentCosts xsi:type="esdl:SingleValue" id="3446da47-14a3-4b43-8a7f-62f47d584e05" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="25bb3494-b5d8-460c-bf65-6a982ae40bb1" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="c1ffa706-5de3-4142-a5d3-d95d97afc71b" innerDiameter="0.1034" diameter="DN100" length="109.34" name="PIPE_1155">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.516048950939656" lon="3.9963734377668203"/>
          <point xsi:type="esdl:Point" lat="51.51605799384839" lon="3.9963356269235355"/>
          <point xsi:type="esdl:Point" lat="51.51606179602553" lon="3.996319733269987"/>
          <point xsi:type="esdl:Point" lat="51.51607908286863" lon="3.9962615702921065"/>
          <point xsi:type="esdl:Point" lat="51.51608948926842" lon="3.9962295531416263"/>
          <point xsi:type="esdl:Point" lat="51.516108641981795" lon="3.9961770964213335"/>
          <point xsi:type="esdl:Point" lat="51.51613535602478" lon="3.9961194373521645"/>
          <point xsi:type="esdl:Point" lat="51.516153340811535" lon="3.9960806323531077"/>
          <point xsi:type="esdl:Point" lat="51.51617529234106" lon="3.996036734990848"/>
          <point xsi:type="esdl:Point" lat="51.51619465084952" lon="3.9960015620736176"/>
          <point xsi:type="esdl:Point" lat="51.51621497662433" lon="3.995972122957414"/>
          <point xsi:type="esdl:Point" lat="51.51625125664337" lon="3.9959266199136407"/>
          <point xsi:type="esdl:Point" lat="51.5162649856336" lon="3.9959093993679295"/>
          <point xsi:type="esdl:Point" lat="51.5163141354454" lon="3.9958477537618324"/>
          <point xsi:type="esdl:Point" lat="51.51631506547083" lon="3.995846587019983"/>
          <point xsi:type="esdl:Point" lat="51.5163474878219" lon="3.9958092994787897"/>
          <point xsi:type="esdl:Point" lat="51.51638998461723" lon="3.995760436005355"/>
          <point xsi:type="esdl:Point" lat="51.51641396455034" lon="3.995732873205916"/>
          <point xsi:type="esdl:Point" lat="51.51643558530424" lon="3.995708004957059"/>
          <point xsi:type="esdl:Point" lat="51.51646109047847" lon="3.9956786807887306"/>
          <point xsi:type="esdl:Point" lat="51.5164746943531" lon="3.995663034460545"/>
          <point xsi:type="esdl:Point" lat="51.516517108694366" lon="3.99560121983865"/>
          <point xsi:type="esdl:Point" lat="51.51652276783761" lon="3.995591796249687"/>
          <point xsi:type="esdl:Point" lat="51.51652944950417" lon="3.9955806699531555"/>
          <point xsi:type="esdl:Point" lat="51.51652944950417" lon="3.9955806699531555"/>
          <point xsi:type="esdl:Point" lat="51.51653738287997" lon="3.9955674593065904"/>
          <point xsi:type="esdl:Point" lat="51.516557622730474" lon="3.995530818058076"/>
          <point xsi:type="esdl:Point" lat="51.516570639057186" lon="3.9954915161602162"/>
          <point xsi:type="esdl:Point" lat="51.51658018092228" lon="3.995462406685437"/>
          <point xsi:type="esdl:Point" lat="51.516583229083416" lon="3.9954473715597976"/>
          <point xsi:type="esdl:Point" lat="51.516587822500384" lon="3.9954247101540283"/>
          <point xsi:type="esdl:Point" lat="51.51658783480925" lon="3.995424234290279"/>
          <point xsi:type="esdl:Point" lat="51.516588739198674" lon="3.995387723787359"/>
          <point xsi:type="esdl:Point" lat="51.5165890362131" lon="3.995375683433796"/>
          <point xsi:type="esdl:Point" lat="51.516587622621024" lon="3.9953325006236042"/>
          <point xsi:type="esdl:Point" lat="51.51660324899725" lon="3.9952859143826913"/>
          <point xsi:type="esdl:Point" lat="51.51660324899725" lon="3.9952859143826913"/>
          <point xsi:type="esdl:Point" lat="51.516607372182506" lon="3.9952735839772124"/>
          <point xsi:type="esdl:Point" lat="51.51663884043244" lon="3.995179641120913"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0c7d0634-5f30-4038-bc0d-a7533a598a38" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="efabd283-be83-4af8-bf14-e749312ab9bd"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="92209b7f-dd00-423b-9b5e-15be47a5a86d" connectedTo="83154e68-7c41-4952-a2f9-ca80299c4db4"/>
        <costInformation xsi:type="esdl:CostInformation" id="5fbd05ef-5ff7-40df-adfd-ef37e6b685e3">
          <investmentCosts xsi:type="esdl:SingleValue" id="07652045-7f96-459e-9788-cdf717d19a4f" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="edc60491-5321-4045-b066-02d0df66d89b" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="796d490b-80fa-4ecb-9156-e6859b95c3f6" innerDiameter="0.1034" diameter="DN100" length="49.99" name="PIPE_1192">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51636199923638" lon="3.9921695098760184"/>
          <point xsi:type="esdl:Point" lat="51.51640138487746" lon="3.9921553335746776"/>
          <point xsi:type="esdl:Point" lat="51.51640307635051" lon="3.9921659872957544"/>
          <point xsi:type="esdl:Point" lat="51.51641050251523" lon="3.9922127028014565"/>
          <point xsi:type="esdl:Point" lat="51.516411785413055" lon="3.9922207610978293"/>
          <point xsi:type="esdl:Point" lat="51.51641596561997" lon="3.99224710152388"/>
          <point xsi:type="esdl:Point" lat="51.5164294412185" lon="3.9923216130532806"/>
          <point xsi:type="esdl:Point" lat="51.516439047541084" lon="3.992362699981763"/>
          <point xsi:type="esdl:Point" lat="51.5164408098496" lon="3.9923702536846006"/>
          <point xsi:type="esdl:Point" lat="51.51645402735798" lon="3.992423160216488"/>
          <point xsi:type="esdl:Point" lat="51.51646169848344" lon="3.992448240896472"/>
          <point xsi:type="esdl:Point" lat="51.516473672975394" lon="3.992487396512732"/>
          <point xsi:type="esdl:Point" lat="51.516495393441254" lon="3.9925416992744034"/>
          <point xsi:type="esdl:Point" lat="51.51653417307616" lon="3.992638632809457"/>
          <point xsi:type="esdl:Point" lat="51.51657560272892" lon="3.992742185271193"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="8f0c931d-2f39-44ec-ae2d-f5806ec9a523" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="16e04299-41c7-4414-9db7-ce45ba41b2dd"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="704c8c62-9356-4140-9475-0a60b2bb7b64" connectedTo="c54b28a2-638c-45b6-84b6-7886ec385d8c"/>
        <costInformation xsi:type="esdl:CostInformation" id="27f8c8b6-e136-4c55-915a-db0b240467ab">
          <investmentCosts xsi:type="esdl:SingleValue" id="e6729dd6-4584-4dcf-b7ed-c7495b598186" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="8681abfe-73b6-4e4b-b44d-7ce2b9d70aee" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="8e-06" id="9847439a-819e-49e5-8f33-c69bb04f6cb8" innerDiameter="0.0558" diameter="DN50" length="74.76" name="PIPE_1341">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51549462059156" lon="3.9910409484395197"/>
          <point xsi:type="esdl:Point" lat="51.51572818914665" lon="3.9910098146674375"/>
          <point xsi:type="esdl:Point" lat="51.51572890582789" lon="3.991029157594497"/>
          <point xsi:type="esdl:Point" lat="51.515731647916425" lon="3.991079560544973"/>
          <point xsi:type="esdl:Point" lat="51.51573957412344" lon="3.991225231394906"/>
          <point xsi:type="esdl:Point" lat="51.51574238519544" lon="3.9912769001917594"/>
          <point xsi:type="esdl:Point" lat="51.515750866097314" lon="3.99143289933617"/>
          <point xsi:type="esdl:Point" lat="51.51575383714079" lon="3.991487430525586"/>
          <point xsi:type="esdl:Point" lat="51.51576178993413" lon="3.9916338643383598"/>
          <point xsi:type="esdl:Point" lat="51.51576194999374" lon="3.9916367267054493"/>
          <point xsi:type="esdl:Point" lat="51.51576194999374" lon="3.9916367267054493"/>
          <point xsi:type="esdl:Point" lat="51.51586194999374" lon="3.9916367267054493"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="43e036d2-b44f-4344-a101-7b6e04d4fab0" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="315b0bf0-54b8-49b7-b5ee-504e7f05a09b"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="931b9773-ca76-4f02-90fe-af77dc6a8276" connectedTo="97eaa9c0-7f6f-4c52-b65b-90db53c06cda"/>
        <costInformation xsi:type="esdl:CostInformation" id="b1d8cc2a-9f97-4399-ac22-402b94f77296">
          <investmentCosts xsi:type="esdl:SingleValue" id="ce5bece2-7069-40d1-9247-5b1ea31371b5" value="778.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="81fe43de-7377-4a8f-ad5e-c9fed1186c76" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="ea98b7da-77b8-4378-a205-10c65833e950" innerDiameter="0.1034" diameter="DN100" length="78.13" name="PIPE_1400">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51556474911341" lon="3.9924072164350237"/>
          <point xsi:type="esdl:Point" lat="51.51556752731922" lon="3.992450154625593"/>
          <point xsi:type="esdl:Point" lat="51.515570119371255" lon="3.992490303305855"/>
          <point xsi:type="esdl:Point" lat="51.51557246726837" lon="3.9925265692171807"/>
          <point xsi:type="esdl:Point" lat="51.515573556272656" lon="3.992552269179953"/>
          <point xsi:type="esdl:Point" lat="51.51557594619741" lon="3.9926086190918326"/>
          <point xsi:type="esdl:Point" lat="51.515577583479974" lon="3.9926471112923796"/>
          <point xsi:type="esdl:Point" lat="51.51557782163925" lon="3.9926527520731376"/>
          <point xsi:type="esdl:Point" lat="51.5155787240536" lon="3.9926741208414134"/>
          <point xsi:type="esdl:Point" lat="51.51558158988588" lon="3.992741723523849"/>
          <point xsi:type="esdl:Point" lat="51.5155821133188" lon="3.992753940187094"/>
          <point xsi:type="esdl:Point" lat="51.515582928562274" lon="3.99277328005048"/>
          <point xsi:type="esdl:Point" lat="51.515585190684895" lon="3.9928264640584095"/>
          <point xsi:type="esdl:Point" lat="51.51558576673468" lon="3.992840076722983"/>
          <point xsi:type="esdl:Point" lat="51.515587481589236" lon="3.9928805549166784"/>
          <point xsi:type="esdl:Point" lat="51.515597027930184" lon="3.9930883336730822"/>
          <point xsi:type="esdl:Point" lat="51.51560122064768" lon="3.993179756009982"/>
          <point xsi:type="esdl:Point" lat="51.51560327314947" lon="3.9932244311248657"/>
          <point xsi:type="esdl:Point" lat="51.51561770100284" lon="3.9935294466921976"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="a4ec3461-192b-4c3f-afb1-08741c0505b0" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="68a2cfcd-6ef2-41a2-9e41-e7bdc8d2bcd0"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="a68211c1-6e78-4a27-84a9-b22115c84b33" connectedTo="db51efb5-84a2-41c3-bb1b-827b518ce5a6"/>
        <costInformation xsi:type="esdl:CostInformation" id="60c2ff93-c3eb-4f82-b701-59e10c82ab86">
          <investmentCosts xsi:type="esdl:SingleValue" id="c08bef16-117c-4a8c-831a-0eefece15b54" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="96b05719-0136-4ecf-8b22-5b97887b9edf" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="04978cb0-be2a-422a-a4db-2e51935aef31" innerDiameter="0.1506" diameter="DN150" length="72.11" name="PIPE_1613">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51572306614181" lon="3.9891071508360714"/>
          <point xsi:type="esdl:Point" lat="51.515691059704515" lon="3.989136951922986"/>
          <point xsi:type="esdl:Point" lat="51.51568146173729" lon="3.9891462235126673"/>
          <point xsi:type="esdl:Point" lat="51.51566615825176" lon="3.9891610016581485"/>
          <point xsi:type="esdl:Point" lat="51.51562794403085" lon="3.989197909588798"/>
          <point xsi:type="esdl:Point" lat="51.51559906992339" lon="3.9892257843678607"/>
          <point xsi:type="esdl:Point" lat="51.51557639024223" lon="3.989247690881921"/>
          <point xsi:type="esdl:Point" lat="51.5155486005758" lon="3.9892745380752777"/>
          <point xsi:type="esdl:Point" lat="51.51554620095196" lon="3.9892768451561866"/>
          <point xsi:type="esdl:Point" lat="51.515517133238276" lon="3.989305820823066"/>
          <point xsi:type="esdl:Point" lat="51.51550607283285" lon="3.989316837493035"/>
          <point xsi:type="esdl:Point" lat="51.51548932694206" lon="3.9893335329583275"/>
          <point xsi:type="esdl:Point" lat="51.515482486318646" lon="3.9893403423086524"/>
          <point xsi:type="esdl:Point" lat="51.51547203009396" lon="3.9893507640515447"/>
          <point xsi:type="esdl:Point" lat="51.51541705708595" lon="3.9894055489547577"/>
          <point xsi:type="esdl:Point" lat="51.51539386147602" lon="3.9894286670430046"/>
          <point xsi:type="esdl:Point" lat="51.51538806918337" lon="3.98943443555189"/>
          <point xsi:type="esdl:Point" lat="51.51525062330179" lon="3.989592829785772"/>
          <point xsi:type="esdl:Point" lat="51.51517594705015" lon="3.9896628441635738"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="97f9e5f6-c8aa-419e-9b2c-eb42d7ad6657" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="65755d98-eb5c-4d76-bc30-5a6995d0b0e5"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="124038dc-1cbd-4fcd-b9a9-e3ec13301189" connectedTo="f9c09e53-ce16-4a76-ae06-ca8ee55899c5"/>
        <costInformation xsi:type="esdl:CostInformation" id="efcff910-b63c-4fad-a013-b54aae857108">
          <investmentCosts xsi:type="esdl:SingleValue" id="23981812-571b-43e9-bfe0-640d81580eb4" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="c463ebd0-82de-45ca-9959-d316408067eb" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="18c4b773-7cd8-4145-bbb3-67f817f8e0de" innerDiameter="0.1506" diameter="DN150" length="69.31" name="PIPE_1628">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515528666130805" lon="3.993526412588246"/>
          <point xsi:type="esdl:Point" lat="51.51552897549772" lon="3.9935523381609928"/>
          <point xsi:type="esdl:Point" lat="51.51552807485805" lon="3.993608702471808"/>
          <point xsi:type="esdl:Point" lat="51.51552743103631" lon="3.9936489215409074"/>
          <point xsi:type="esdl:Point" lat="51.51552742882427" lon="3.9936509964130757"/>
          <point xsi:type="esdl:Point" lat="51.515527245090844" lon="3.993795330620935"/>
          <point xsi:type="esdl:Point" lat="51.51552715926978" lon="3.993855199999902"/>
          <point xsi:type="esdl:Point" lat="51.51552713489497" lon="3.9938780235938953"/>
          <point xsi:type="esdl:Point" lat="51.515527042791696" lon="3.9939456592717173"/>
          <point xsi:type="esdl:Point" lat="51.51552693805439" lon="3.9940303260200984"/>
          <point xsi:type="esdl:Point" lat="51.51552690369482" lon="3.9940545763469997"/>
          <point xsi:type="esdl:Point" lat="51.51552690199099" lon="3.9940566944284868"/>
          <point xsi:type="esdl:Point" lat="51.5155269877961" lon="3.994094787509453"/>
          <point xsi:type="esdl:Point" lat="51.5155270521156" lon="3.9941212825169807"/>
          <point xsi:type="esdl:Point" lat="51.515527557910396" lon="3.9943438329897445"/>
          <point xsi:type="esdl:Point" lat="51.515527570864826" lon="3.9943486882108328"/>
          <point xsi:type="esdl:Point" lat="51.515527580320736" lon="3.9943517424938646"/>
          <point xsi:type="esdl:Point" lat="51.51552761397487" lon="3.994366625300664"/>
          <point xsi:type="esdl:Point" lat="51.5155277565973" lon="3.994429844823035"/>
          <point xsi:type="esdl:Point" lat="51.515528052719105" lon="3.994524786855309"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="d0037ecb-9299-47f4-b40a-1ac986edda1e" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="c0444d40-88e4-4cd0-a443-c8ea94e7a746"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="35ad129e-bd06-4709-bc22-bd212a9b9266" connectedTo="a364d207-e610-4c4c-aa4a-dd3a268ca243"/>
        <costInformation xsi:type="esdl:CostInformation" id="1643d49a-8750-40cd-bf4b-cd2fda01b097">
          <investmentCosts xsi:type="esdl:SingleValue" id="48ef3cde-b82f-4fb5-82aa-1aebc47a2b3b" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="4fc4210a-4f99-4c6d-8986-b80c87f4271c" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="5dffab48-655a-4de8-a4b2-44dee8586ca7" innerDiameter="0.1034" diameter="DN100" length="204.72" name="PIPE_1639">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51636199923638" lon="3.9921695098760184"/>
          <point xsi:type="esdl:Point" lat="51.51633944660334" lon="3.9920184646561268"/>
          <point xsi:type="esdl:Point" lat="51.516334306428334" lon="3.991984012881527"/>
          <point xsi:type="esdl:Point" lat="51.5163294015342" lon="3.9919511964768817"/>
          <point xsi:type="esdl:Point" lat="51.51632449611465" lon="3.9919183368693814"/>
          <point xsi:type="esdl:Point" lat="51.5163216231707" lon="3.9918990886714383"/>
          <point xsi:type="esdl:Point" lat="51.5163212222034" lon="3.9918963777480556"/>
          <point xsi:type="esdl:Point" lat="51.51631824214498" lon="3.991876441226516"/>
          <point xsi:type="esdl:Point" lat="51.51631146004249" lon="3.991830974058489"/>
          <point xsi:type="esdl:Point" lat="51.51631073739601" lon="3.9918261693511385"/>
          <point xsi:type="esdl:Point" lat="51.516301727902075" lon="3.9917658288298496"/>
          <point xsi:type="esdl:Point" lat="51.51627860775205" lon="3.991610968730444"/>
          <point xsi:type="esdl:Point" lat="51.51627698553865" lon="3.991600096802934"/>
          <point xsi:type="esdl:Point" lat="51.51626843285165" lon="3.991543387722455"/>
          <point xsi:type="esdl:Point" lat="51.5162633944501" lon="3.991509941530217"/>
          <point xsi:type="esdl:Point" lat="51.51626180366193" lon="3.991499443268679"/>
          <point xsi:type="esdl:Point" lat="51.51625308490219" lon="3.991441629861323"/>
          <point xsi:type="esdl:Point" lat="51.51624281332597" lon="3.9913734899599094"/>
          <point xsi:type="esdl:Point" lat="51.516232859779784" lon="3.9913109020409268"/>
          <point xsi:type="esdl:Point" lat="51.5162289623494" lon="3.9912864262371617"/>
          <point xsi:type="esdl:Point" lat="51.516228174709504" lon="3.991281450639137"/>
          <point xsi:type="esdl:Point" lat="51.51622640609973" lon="3.991270367100857"/>
          <point xsi:type="esdl:Point" lat="51.51621887278887" lon="3.991222992424855"/>
          <point xsi:type="esdl:Point" lat="51.516205537409654" lon="3.991139212524983"/>
          <point xsi:type="esdl:Point" lat="51.51620322405145" lon="3.9911246732562344"/>
          <point xsi:type="esdl:Point" lat="51.51619732368523" lon="3.9910875650277102"/>
          <point xsi:type="esdl:Point" lat="51.51618707852514" lon="3.9910231562962872"/>
          <point xsi:type="esdl:Point" lat="51.51617575507454" lon="3.9909520230860163"/>
          <point xsi:type="esdl:Point" lat="51.516174043968434" lon="3.9909412403867397"/>
          <point xsi:type="esdl:Point" lat="51.516166267954176" lon="3.9908923747792686"/>
          <point xsi:type="esdl:Point" lat="51.51615960939858" lon="3.990850506250065"/>
          <point xsi:type="esdl:Point" lat="51.5161533886274" lon="3.990811419549148"/>
          <point xsi:type="esdl:Point" lat="51.51613420203812" lon="3.9907119701889315"/>
          <point xsi:type="esdl:Point" lat="51.51613344509106" lon="3.990708059901622"/>
          <point xsi:type="esdl:Point" lat="51.51612545248041" lon="3.990666650254842"/>
          <point xsi:type="esdl:Point" lat="51.516121082188214" lon="3.9906439901563737"/>
          <point xsi:type="esdl:Point" lat="51.51611742098133" lon="3.9906249968713796"/>
          <point xsi:type="esdl:Point" lat="51.51611551400697" lon="3.990615127953479"/>
          <point xsi:type="esdl:Point" lat="51.51610376425216" lon="3.9905542237124747"/>
          <point xsi:type="esdl:Point" lat="51.516100640032235" lon="3.9905380380218576"/>
          <point xsi:type="esdl:Point" lat="51.51608797034981" lon="3.990472378442703"/>
          <point xsi:type="esdl:Point" lat="51.516086657385145" lon="3.990465574717919"/>
          <point xsi:type="esdl:Point" lat="51.51608458763683" lon="3.9904548751179703"/>
          <point xsi:type="esdl:Point" lat="51.516079594253796" lon="3.9904289778704465"/>
          <point xsi:type="esdl:Point" lat="51.516075930428215" lon="3.9904097685715976"/>
          <point xsi:type="esdl:Point" lat="51.51607041593582" lon="3.990380890366737"/>
          <point xsi:type="esdl:Point" lat="51.51605645239883" lon="3.9903077781857057"/>
          <point xsi:type="esdl:Point" lat="51.51603477751984" lon="3.9901942421103223"/>
          <point xsi:type="esdl:Point" lat="51.51603127641828" lon="3.990175863543196"/>
          <point xsi:type="esdl:Point" lat="51.51602653870214" lon="3.990151053547441"/>
          <point xsi:type="esdl:Point" lat="51.51602141722892" lon="3.990124223746543"/>
          <point xsi:type="esdl:Point" lat="51.51601150065203" lon="3.990072297564784"/>
          <point xsi:type="esdl:Point" lat="51.51600733966364" lon="3.990050610925392"/>
          <point xsi:type="esdl:Point" lat="51.516001443741374" lon="3.990019914645055"/>
          <point xsi:type="esdl:Point" lat="51.516001424562305" lon="3.9900198143747883"/>
          <point xsi:type="esdl:Point" lat="51.51599946881391" lon="3.9900096300177275"/>
          <point xsi:type="esdl:Point" lat="51.515997215874954" lon="3.989997898674311"/>
          <point xsi:type="esdl:Point" lat="51.51599255673298" lon="3.989973648232403"/>
          <point xsi:type="esdl:Point" lat="51.515990552602" lon="3.989963177195743"/>
          <point xsi:type="esdl:Point" lat="51.51598736039807" lon="3.9899465758265387"/>
          <point xsi:type="esdl:Point" lat="51.51597794584736" lon="3.989897544811703"/>
          <point xsi:type="esdl:Point" lat="51.515971712292895" lon="3.9898641789635025"/>
          <point xsi:type="esdl:Point" lat="51.515967082176026" lon="3.9898393513156836"/>
          <point xsi:type="esdl:Point" lat="51.5159603777655" lon="3.98980344964884"/>
          <point xsi:type="esdl:Point" lat="51.51595861068892" lon="3.9897940087533517"/>
          <point xsi:type="esdl:Point" lat="51.515939842522336" lon="3.989693538772606"/>
          <point xsi:type="esdl:Point" lat="51.51593486679597" lon="3.9896668774940336"/>
          <point xsi:type="esdl:Point" lat="51.51593182178051" lon="3.989650559810614"/>
          <point xsi:type="esdl:Point" lat="51.51592604915099" lon="3.989619658121814"/>
          <point xsi:type="esdl:Point" lat="51.515919354176695" lon="3.989583799453711"/>
          <point xsi:type="esdl:Point" lat="51.515901366368034" lon="3.9895079874005344"/>
          <point xsi:type="esdl:Point" lat="51.51587964602221" lon="3.9894207633706413"/>
          <point xsi:type="esdl:Point" lat="51.515858944930145" lon="3.9893435940203865"/>
          <point xsi:type="esdl:Point" lat="51.51585706144299" lon="3.9893364476904223"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="8f0c931d-2f39-44ec-ae2d-f5806ec9a523" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="58168cb1-357a-468b-a96a-93c10af6fab4"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="90356a50-8963-4169-8e1b-eb5b815ef2ef" connectedTo="04304614-1864-4c96-908b-bb4ca544fff3"/>
        <costInformation xsi:type="esdl:CostInformation" id="9a2b0c77-16bd-4aae-ba4a-1111e0eeff74">
          <investmentCosts xsi:type="esdl:SingleValue" id="abd95416-10c7-4097-b8b5-acab6f2a6999" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="48cc64a6-66af-4452-93a2-ebb9dae9337a" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="7f6fd00f-5614-44b9-9815-067f213254b0" innerDiameter="0.1034" diameter="DN100" length="288.90999999999997" name="PIPE_1710">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.514229515909044" lon="3.9932896023183684"/>
          <point xsi:type="esdl:Point" lat="51.514232732316046" lon="3.9932578062111403"/>
          <point xsi:type="esdl:Point" lat="51.51423590926088" lon="3.9932377682007147"/>
          <point xsi:type="esdl:Point" lat="51.514287069793525" lon="3.9929146713697383"/>
          <point xsi:type="esdl:Point" lat="51.51429454397983" lon="3.99286227088891"/>
          <point xsi:type="esdl:Point" lat="51.51429612003796" lon="3.9928512148623563"/>
          <point xsi:type="esdl:Point" lat="51.51430196022404" lon="3.992810289998678"/>
          <point xsi:type="esdl:Point" lat="51.51430680438923" lon="3.9927762970933722"/>
          <point xsi:type="esdl:Point" lat="51.51432089837671" lon="3.992677501538781"/>
          <point xsi:type="esdl:Point" lat="51.51432236687986" lon="3.9926672268290617"/>
          <point xsi:type="esdl:Point" lat="51.5143270201366" lon="3.9926345652826463"/>
          <point xsi:type="esdl:Point" lat="51.51433034664991" lon="3.9926112519840795"/>
          <point xsi:type="esdl:Point" lat="51.51433103525672" lon="3.9926064330028788"/>
          <point xsi:type="esdl:Point" lat="51.51433253789411" lon="3.9925945003228502"/>
          <point xsi:type="esdl:Point" lat="51.51433815285487" lon="3.992549778590784"/>
          <point xsi:type="esdl:Point" lat="51.51435353788335" lon="3.99242737180992"/>
          <point xsi:type="esdl:Point" lat="51.514354900804925" lon="3.992416538411385"/>
          <point xsi:type="esdl:Point" lat="51.51435683046936" lon="3.992401221147311"/>
          <point xsi:type="esdl:Point" lat="51.51435916193844" lon="3.992382664164179"/>
          <point xsi:type="esdl:Point" lat="51.51435929282113" lon="3.992381579549229"/>
          <point xsi:type="esdl:Point" lat="51.514365679837205" lon="3.9923307539015136"/>
          <point xsi:type="esdl:Point" lat="51.514378593498535" lon="3.992228003269573"/>
          <point xsi:type="esdl:Point" lat="51.514378963139585" lon="3.992225081511849"/>
          <point xsi:type="esdl:Point" lat="51.51438162290145" lon="3.9922039065886907"/>
          <point xsi:type="esdl:Point" lat="51.5143843322774" lon="3.992182369940572"/>
          <point xsi:type="esdl:Point" lat="51.51438765748555" lon="3.992155944488265"/>
          <point xsi:type="esdl:Point" lat="51.51439168012921" lon="3.992123936141308"/>
          <point xsi:type="esdl:Point" lat="51.5144035263634" lon="3.99202967564565"/>
          <point xsi:type="esdl:Point" lat="51.51440738455618" lon="3.9919989546351493"/>
          <point xsi:type="esdl:Point" lat="51.51441270874888" lon="3.9919615177213243"/>
          <point xsi:type="esdl:Point" lat="51.51441887814123" lon="3.991918075534044"/>
          <point xsi:type="esdl:Point" lat="51.51442149103921" lon="3.9918997547988218"/>
          <point xsi:type="esdl:Point" lat="51.51442287545949" lon="3.991889972492779"/>
          <point xsi:type="esdl:Point" lat="51.51442888802048" lon="3.9918477021482364"/>
          <point xsi:type="esdl:Point" lat="51.51445099601596" lon="3.991692137366906"/>
          <point xsi:type="esdl:Point" lat="51.514460524815995" lon="3.9916251501244444"/>
          <point xsi:type="esdl:Point" lat="51.51447641350116" lon="3.9915133747580884"/>
          <point xsi:type="esdl:Point" lat="51.51448002054448" lon="3.9914879779270733"/>
          <point xsi:type="esdl:Point" lat="51.514486994662256" lon="3.991438920584093"/>
          <point xsi:type="esdl:Point" lat="51.51449854712176" lon="3.9913509650345196"/>
          <point xsi:type="esdl:Point" lat="51.514498992282725" lon="3.9913475942936136"/>
          <point xsi:type="esdl:Point" lat="51.514545728369164" lon="3.99099172120998"/>
          <point xsi:type="esdl:Point" lat="51.51455461097834" lon="3.990924105154187"/>
          <point xsi:type="esdl:Point" lat="51.514570217079545" lon="3.9908052924307578"/>
          <point xsi:type="esdl:Point" lat="51.51457733416142" lon="3.9907524267580463"/>
          <point xsi:type="esdl:Point" lat="51.51458399674618" lon="3.9907029032928723"/>
          <point xsi:type="esdl:Point" lat="51.514606486636346" lon="3.9905357991959685"/>
          <point xsi:type="esdl:Point" lat="51.51462523598127" lon="3.990396458964418"/>
          <point xsi:type="esdl:Point" lat="51.51463544025978" lon="3.9903206182657436"/>
          <point xsi:type="esdl:Point" lat="51.51464531098408" lon="3.990243952111057"/>
          <point xsi:type="esdl:Point" lat="51.51464531098408" lon="3.990243952111057"/>
          <point xsi:type="esdl:Point" lat="51.514657550252785" lon="3.9901398377597257"/>
          <point xsi:type="esdl:Point" lat="51.51466477660738" lon="3.990067575214977"/>
          <point xsi:type="esdl:Point" lat="51.51467022285446" lon="3.989996808160253"/>
          <point xsi:type="esdl:Point" lat="51.514673197126726" lon="3.989944847590121"/>
          <point xsi:type="esdl:Point" lat="51.51467364775418" lon="3.9899073726743888"/>
          <point xsi:type="esdl:Point" lat="51.51467364775418" lon="3.9899073726743888"/>
          <point xsi:type="esdl:Point" lat="51.514674374082546" lon="3.989892942249404"/>
          <point xsi:type="esdl:Point" lat="51.51467973932179" lon="3.989893555397807"/>
          <point xsi:type="esdl:Point" lat="51.514684276427566" lon="3.989894078732407"/>
          <point xsi:type="esdl:Point" lat="51.514684276427566" lon="3.989894078732407"/>
          <point xsi:type="esdl:Point" lat="51.514731887467754" lon="3.9898911746950767"/>
          <point xsi:type="esdl:Point" lat="51.5147758522251" lon="3.98988406027207"/>
          <point xsi:type="esdl:Point" lat="51.51481172916213" lon="3.989877194400704"/>
          <point xsi:type="esdl:Point" lat="51.51487171446678" lon="3.98985662023346"/>
          <point xsi:type="esdl:Point" lat="51.51492183188724" lon="3.9898377901122397"/>
          <point xsi:type="esdl:Point" lat="51.514931665302" lon="3.9898331654335224"/>
          <point xsi:type="esdl:Point" lat="51.51494316621028" lon="3.9898289073406126"/>
          <point xsi:type="esdl:Point" lat="51.51495141830045" lon="3.989825858527434"/>
          <point xsi:type="esdl:Point" lat="51.51498938149142" lon="3.989798007750701"/>
          <point xsi:type="esdl:Point" lat="51.51502189466593" lon="3.9897722263222812"/>
          <point xsi:type="esdl:Point" lat="51.515083087862045" lon="3.989727884432405"/>
          <point xsi:type="esdl:Point" lat="51.51508630078258" lon="3.989725177786908"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="527e4662-9368-42cc-a0c3-d32caca7c07e" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="8510d6a2-14a1-4015-938c-7bb84532e027"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="cda2383f-c705-4a87-84ff-ee0500d91a97" connectedTo="28227010-40c7-4f74-a241-90092a777739"/>
        <costInformation xsi:type="esdl:CostInformation" id="cb621fc1-1993-40ca-b696-f2b253a7573c">
          <investmentCosts xsi:type="esdl:SingleValue" id="092d16ee-8289-4bc8-8003-a2c53328f32f" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="07ecc71f-2b1a-41ef-af01-02783904b3a9" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="f39967da-a4b6-49b0-b09f-d55d048a9307" innerDiameter="0.1034" diameter="DN100" length="68.77" name="PIPE_1714">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51661901301933" lon="3.9935924086097536"/>
          <point xsi:type="esdl:Point" lat="51.5166215984608" lon="3.9935566966162215"/>
          <point xsi:type="esdl:Point" lat="51.51662518816461" lon="3.9935072079217475"/>
          <point xsi:type="esdl:Point" lat="51.51663454239025" lon="3.993392357473445"/>
          <point xsi:type="esdl:Point" lat="51.516639301184206" lon="3.9933338706857224"/>
          <point xsi:type="esdl:Point" lat="51.51664096284231" lon="3.9933171776724454"/>
          <point xsi:type="esdl:Point" lat="51.5166489332041" lon="3.9932370369539076"/>
          <point xsi:type="esdl:Point" lat="51.516646905834456" lon="3.993188440868983"/>
          <point xsi:type="esdl:Point" lat="51.51664641387521" lon="3.9931765975773006"/>
          <point xsi:type="esdl:Point" lat="51.516664335250695" lon="3.993171725447595"/>
          <point xsi:type="esdl:Point" lat="51.516689273887415" lon="3.99315222941314"/>
          <point xsi:type="esdl:Point" lat="51.51670176899261" lon="3.9931446419076897"/>
          <point xsi:type="esdl:Point" lat="51.51671341702614" lon="3.9931414029943086"/>
          <point xsi:type="esdl:Point" lat="51.51671341702614" lon="3.9931414029943086"/>
          <point xsi:type="esdl:Point" lat="51.516709512975524" lon="3.9931155869735537"/>
          <point xsi:type="esdl:Point" lat="51.516673339466614" lon="3.9930072474877556"/>
          <point xsi:type="esdl:Point" lat="51.516668351683165" lon="3.9929923145065613"/>
          <point xsi:type="esdl:Point" lat="51.516651495632914" lon="3.992941838955315"/>
          <point xsi:type="esdl:Point" lat="51.516643319089816" lon="3.992917335530104"/>
          <point xsi:type="esdl:Point" lat="51.51664080414289" lon="3.992910741422024"/>
          <point xsi:type="esdl:Point" lat="51.51662828521303" lon="3.9928779276768176"/>
          <point xsi:type="esdl:Point" lat="51.51661010568809" lon="3.992830302500538"/>
          <point xsi:type="esdl:Point" lat="51.516582998270906" lon="3.992759248876755"/>
          <point xsi:type="esdl:Point" lat="51.51657560272892" lon="3.992742185271193"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="4f9c8bac-6d95-48f3-8c36-bfe94ae06df3" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="018958d1-d8e3-4696-b35c-0e616b80a33b"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="d3ed4064-6ac1-49a8-afd6-ec2b9fc86d9b" connectedTo="c54b28a2-638c-45b6-84b6-7886ec385d8c"/>
        <costInformation xsi:type="esdl:CostInformation" id="87eca54c-bc74-42e3-81f4-88bf284a0585">
          <investmentCosts xsi:type="esdl:SingleValue" id="b8ebc619-ebe3-4ccc-b082-13e02aa7f17a" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="96d1bead-0493-423c-8025-f740f5c977e2" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="3eb31751-c9c7-41d1-a143-29f795b4240b" name="Joint_76">
        <geometry xsi:type="esdl:Point" lat="51.51499577058398" lon="3.9897339253981747"/>
        <port xsi:type="esdl:InPort" connectedTo="dfd3b1e5-b0b1-4502-a96e-faf17e9e4dd1" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="94d3ff98-248a-4e5b-9d7d-362ec9c7043a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="d6a615ad-fa52-438e-95d9-bb0cc2917686" connectedTo="aaa5ab6c-dbde-48c8-a8ea-4709b4ffc596 8da6aa12-e65c-4c00-b834-61a35a8b6fd3"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="3a6b2e6f-127a-46b4-9381-7d3778b4d14e" name="Joint_89">
        <geometry xsi:type="esdl:Point" lat="51.51484205674142" lon="3.9899760532214232"/>
        <port xsi:type="esdl:InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="2d415ce3-ef47-49df-95fe-0194138055ef" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="8aff504b-502f-47ee-9c09-12a647bc98f5" connectedTo="7705a910-06fd-4cec-b61c-6e27eff37f81 de4e0f42-5f4d-4a5c-857f-c4c30604ebce"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="b14421a4-400e-4039-8127-643b5831c391" name="Joint_109">
        <geometry xsi:type="esdl:Point" lat="51.51491448148684" lon="3.989827541275302"/>
        <port xsi:type="esdl:InPort" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="cd859e49-bba3-4d76-be88-b005999c01de"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="0fdfc77a-fb7b-487c-affb-8c43c3d4bc17" connectedTo="0cd8e35b-c04a-452a-8518-cdc4d73b4fac 2fae31b5-e1fb-407a-b1e6-2fd2c153f916"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="55fdbb3a-dbe1-42ef-b3bf-fa3c457624cf" name="Joint_410">
        <geometry xsi:type="esdl:Point" lat="51.51663884043244" lon="3.995179641120913"/>
        <port xsi:type="esdl:InPort" connectedTo="92209b7f-dd00-423b-9b5e-15be47a5a86d" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="83154e68-7c41-4952-a2f9-ca80299c4db4"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="df63f590-a41b-4622-b03d-dd709ab59d98" connectedTo="06b9a19c-fd24-4f1b-9158-a1b27de95bae"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="a816f11a-1a88-4f95-9f8d-25e056b9dbb2" name="Joint_453">
        <geometry xsi:type="esdl:Point" lat="51.51396603297594" lon="3.993659317574499"/>
        <port xsi:type="esdl:InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="f430bd5b-60ce-441f-b1bb-c8a625f5041d" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="0100b35f-3858-48e3-90c4-cb24477964ab" connectedTo="a05b0f0b-3805-4e9e-a602-f4ab59200b55 368da2b1-daa3-4e90-83d5-2b9763aef01f"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="ccb296a0-d708-4f1b-bd96-d53dcdee93f5" name="Joint_637">
        <geometry xsi:type="esdl:Point" lat="51.515528052719105" lon="3.994524786855309"/>
        <port xsi:type="esdl:InPort" connectedTo="35ad129e-bd06-4709-bc22-bd212a9b9266" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="a364d207-e610-4c4c-aa4a-dd3a268ca243"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="dfeb88fe-0749-40e6-a3c9-349665fc7a34" connectedTo="4c97d337-11ae-4660-889a-af60b26e0452 17d60712-21f1-46b2-96c2-17d4cfb5e8a4 9710c85c-76d2-4c37-8bd4-09a48d5ede29"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="2852e31d-c938-45a0-8de5-28381671f05d" name="Joint_692">
        <geometry xsi:type="esdl:Point" lat="51.515051396120846" lon="3.9896900860083466"/>
        <port xsi:type="esdl:InPort" connectedTo="98632bc5-04ed-4160-a3cb-45dcac2053bb c4f69a4e-09a4-49de-8bf6-ab67f61af146" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="70923eb2-81b7-4c67-8a13-c3f08456e13a"/>
        <port xsi:type="esdl:OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="dc78661d-e5c9-4cce-af74-dc86974bd0cf" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="80c69bd4-e14f-40a7-bd77-e2af73548694" name="Joint_726">
        <geometry xsi:type="esdl:Point" lat="51.51499740149241" lon="3.9897327370212303"/>
        <port xsi:type="esdl:InPort" connectedTo="8287b421-4ac4-45d3-96a4-ca1c775eebcb d5241f3c-e1e9-4f36-abb7-f8b5bfee198e" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="5a18f965-b46d-470b-83b2-9f72f0bd552d"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="39d87d31-31bc-4786-a5c1-1d7cb691db66" connectedTo="063d9662-00d0-43d6-a0e7-310bcf294b9b"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="e8707e6d-c351-49cf-8d21-03b2ec79447a" name="Joint_793">
        <geometry xsi:type="esdl:Point" lat="51.51508630078258" lon="3.989725177786908"/>
        <port xsi:type="esdl:InPort" connectedTo="cda2383f-c705-4a87-84ff-ee0500d91a97" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="28227010-40c7-4f74-a241-90092a777739"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="9c1faeff-5359-4ef0-8fc3-1e725b34c2e9" connectedTo="cecba3a6-41e6-4684-b03d-069ea4fe3f09 049e8d5b-fe12-45a3-8e88-2febf0f822cd"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="4b92d79f-f4b2-4737-91bc-2b0f67c5d174" name="Joint_869">
        <geometry xsi:type="esdl:Point" lat="51.515528666130805" lon="3.993526412588246"/>
        <port xsi:type="esdl:InPort" connectedTo="c0e5bd3b-b9c0-460c-93cc-d24bc3d194a5 66d3441b-de98-4020-9cce-8b93b55c764d" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="d547255a-23b6-4eb1-98e8-9352dfb8d49a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="d0037ecb-9299-47f4-b40a-1ac986edda1e" connectedTo="c0444d40-88e4-4cd0-a443-c8ea94e7a746"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c461cc67-2bb1-4552-a7c3-16f576835c80" name="Joint_909">
        <geometry xsi:type="esdl:Point" lat="51.51556474911341" lon="3.9924072164350237"/>
        <port xsi:type="esdl:InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="e0212b06-09a8-49a0-8577-5bbc8a5d0f61" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="a4ec3461-192b-4c3f-afb1-08741c0505b0" connectedTo="281bdd22-25ac-4534-aea8-360ab082f991 151480c5-5ac7-4e9f-ade9-f609742416b5 68a2cfcd-6ef2-41a2-9e41-e7bdc8d2bcd0"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c1662e3d-cca7-45b5-9633-621b33f818cd" name="Joint_950">
        <geometry xsi:type="esdl:Point" lat="51.51499625782333" lon="3.989731821232265"/>
        <port xsi:type="esdl:InPort" connectedTo="3945a29b-c8a9-4c29-8c5b-109541a408d8" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="65f1e1b1-3edb-4f77-98fc-db84fbe8acee"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="bd6c372d-bdbb-4b2c-b83b-3352b193978b" connectedTo="cf6ec191-d51b-4315-a3ce-8de94488b4de"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="7e6526cc-185d-45e3-b3fe-ab81aa13d21e" name="Joint_983">
        <geometry xsi:type="esdl:Point" lat="51.515948227470446" lon="3.9963438117686345"/>
        <port xsi:type="esdl:InPort" connectedTo="51fbb0a9-ff08-4ff1-abf9-847f48188ca9 a3c7e601-a105-4330-bd00-9974def95c22" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="9387dc75-352d-45aa-abb7-f74e89f8ac14"/>
        <port xsi:type="esdl:OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="48306df5-7fdf-4bc8-8069-3ffd567c06a7" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="0eb48f73-e3ff-425c-bb50-588f1356a8e2" name="Joint_1052">
        <geometry xsi:type="esdl:Point" lat="51.515583603507" lon="3.9924051971747203"/>
        <port xsi:type="esdl:InPort" connectedTo="79093967-6a3d-4e08-9eab-d0e95e905668 ca18bb2c-3945-4c40-b307-1229a39785da" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="a90090a0-0d62-4aa8-a554-41b092b278b3"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="0e14f9dd-9f56-43ca-a414-521c686c4221" connectedTo="71a58e36-62de-4889-9f81-42ce547a1e37"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="4d041178-d3be-46ef-8ce8-4b8a3e69444c" name="Joint_1227">
        <geometry xsi:type="esdl:Point" lat="51.51585706144299" lon="3.9893364476904223"/>
        <port xsi:type="esdl:InPort" connectedTo="90356a50-8963-4169-8e1b-eb5b815ef2ef" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="04304614-1864-4c96-908b-bb4ca544fff3"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="ad892b4b-835e-448e-b7ab-e84fd62c6b7e" connectedTo="1a9da5e7-24f2-462e-8942-3c5ae216009f 85c92a87-b40c-49ad-82ab-6c128ce8104a"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c4bd51ba-b578-456c-82cf-861e82b69abb" name="Joint_1283">
        <geometry xsi:type="esdl:Point" lat="51.51636199923638" lon="3.9921695098760184"/>
        <port xsi:type="esdl:InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="71c72b99-d285-499d-b7b8-6472511242c2" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="8f0c931d-2f39-44ec-ae2d-f5806ec9a523" connectedTo="fbab4646-1dd6-4dde-932a-39de5513417a 16e04299-41c7-4414-9db7-ce45ba41b2dd 58168cb1-357a-468b-a96a-93c10af6fab4"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="080aab63-666b-4933-9178-bca8db85724f" power="1000000.0" name="Gasboiler_4357">
        <geometry xsi:type="esdl:Point" lat="51.516789754849256" lon="3.9946997124130346"/>
        <port xsi:type="esdl:InPort" connectedTo="8c3008ba-b3e0-4334-8d9b-7c746fe156e7" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="9987f55b-a0bf-49e7-abd2-a0aeb539331f"/>
        <port xsi:type="esdl:InPort" connectedTo="47f62d7c-1251-46d6-8acf-833552222e85" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="e6a3fa4f-96f8-4d83-99e2-02bcca74d7e0"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="4e4bf7c5-91a9-4cb7-9924-86093e34e2fc" connectedTo="4b4f427a-e06e-4b9d-99f8-57f6da4087aa"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="c6cfd0b5-5979-43fc-a24a-a9a4fe066216" power="1000000.0" name="Gasboiler_4391">
        <geometry xsi:type="esdl:Point" lat="51.51560752084822" lon="3.99341179390619"/>
        <port xsi:type="esdl:InPort" connectedTo="229c5578-f9f5-4d73-9288-494a1577ace8" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="febea095-4f4f-4c65-bbe0-c74626232931"/>
        <port xsi:type="esdl:InPort" connectedTo="590ff75e-cef7-46a4-85c9-4a5deec2ad0b" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="a69bf5e0-483d-4971-8acf-c68da1b7df90"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="3be1fa4c-dfd4-45fe-b4f3-ed1e5517d403" connectedTo="802a5e83-5c17-4a47-bf6b-548593243482"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="3ab27a61-b1e4-4ca2-a48b-de221d0cdf7c" power="1000000.0" name="Gasboiler_4448">
        <geometry xsi:type="esdl:Point" lat="51.5158357337964" lon="3.9945315368627687"/>
        <port xsi:type="esdl:InPort" connectedTo="2cddff3e-31fb-4836-8d44-d2d2f16b1755" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="f3e0086e-ab0b-4de7-af66-0d7e2dc90778"/>
        <port xsi:type="esdl:InPort" connectedTo="da2aa69a-a30c-4ed9-b6a9-78f78965099c" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="a72bd229-c3df-4bb9-babe-c9aebad5ee5b"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="531845af-5dba-4c35-9d3a-3b640af48983" connectedTo="39b3071a-b21e-410f-8b06-5127f00f8fd9"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="cea9f6d8-61ac-424d-b248-fe49372d93f2" power="1000000.0" name="Gasboiler_4482">
        <geometry xsi:type="esdl:Point" lat="51.51586194999374" lon="3.9916367267054493"/>
        <port xsi:type="esdl:InPort" connectedTo="931b9773-ca76-4f02-90fe-af77dc6a8276" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="97eaa9c0-7f6f-4c52-b65b-90db53c06cda"/>
        <port xsi:type="esdl:InPort" connectedTo="cd0eb61a-0811-4684-bd1d-fa2fa808205d" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="b6139172-ceb1-4394-87ac-867f72a700d0"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="abdfec40-8801-4c3d-9729-e7bc3b194460" connectedTo="3563f143-e99d-431f-889f-1a4c54d9a82d"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="5022e200-38f1-41d9-981c-9db0b191591d" power="1000000.0" name="Gasboiler_4543">
        <geometry xsi:type="esdl:Point" lat="51.515957061443" lon="3.9893364476904223"/>
        <port xsi:type="esdl:InPort" connectedTo="c95a2487-b9ca-4d6f-988d-68c8c27f34a6" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="10863ec0-6113-4452-9748-29ce46910043"/>
        <port xsi:type="esdl:InPort" connectedTo="c93108d1-e932-43bd-83b3-9887c04e5b35" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="7b484392-e7d3-4b22-858a-23e8fc28cc2d"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="0206c4b9-6441-4c72-b82e-0eef90d68397" connectedTo="21332edc-e47a-46f9-87cd-99fa16b159dd"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" id="9bce8b45-b04b-44db-badf-52285b13742f" name="STATION_5" power="100000000.0">
        <geometry xsi:type="esdl:Point" lat="51.505168716193396" lon="3.97957420809941"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="7af297aa-3f17-4b1b-961f-a21af662a37d" connectedTo="295031c2-c814-4560-a7bf-3eb8b29597dc"/>
        <costInformation xsi:type="esdl:CostInformation" id="6e1a4903-e9b3-45dc-9cb1-80da71a43e38">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="03c990dd-78a8-44e2-96fd-33ce43761b0d" value="0.0037926">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d1c7fb16-7cb0-40d6-9334-dea7e87fb22c" unit="EURO" perUnit="GRAM" physicalQuantity="COST" description="Cost in EUR/g"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="PIPE_DEMAND_4374_Joint_637" diameter="DN20" length="5.0" name="PIPE_DEMAND_4374_Joint_637">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515528052719105" lon="3.994524786855309"/>
          <point xsi:type="esdl:Point" lat="51.51562805271911" lon="3.994524786855309"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="dfeb88fe-0749-40e6-a3c9-349665fc7a34" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="9710c85c-76d2-4c37-8bd4-09a48d5ede29"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="5089cd62-d938-418b-90ae-3339ab298362" connectedTo="6b3170c6-ae45-43c0-a8f3-ebe534aa97c6"/>
        <costInformation xsi:type="esdl:CostInformation" id="7d40aa6f-e0d5-4983-afc9-a1e8d6a5e334">
          <investmentCosts xsi:type="esdl:SingleValue" id="232dd8a7-7402-4f26-ab23-d5e7b942b81e" value="696.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a133ecbd-cd98-4dc0-a934-8ae5744e8e51" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="PIPE_DEMAND_4403_Joint_453" diameter="DN20" length="5.0" name="PIPE_DEMAND_4403_Joint_453">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51396603297594" lon="3.993659317574499"/>
          <point xsi:type="esdl:Point" lat="51.51406603297594" lon="3.993659317574499"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0100b35f-3858-48e3-90c4-cb24477964ab" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="368da2b1-daa3-4e90-83d5-2b9763aef01f"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="6f638610-206c-4e54-91ae-dd63c66f924f" connectedTo="fc49c937-4ac4-4636-be2e-37977b5f5754"/>
        <costInformation xsi:type="esdl:CostInformation" id="4fbe0313-760d-4b47-9039-1f5eb507c662">
          <investmentCosts xsi:type="esdl:SingleValue" id="5a7c203a-ffd4-4072-a53f-4c2716ccec8e" value="696.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d587a957-63ac-4deb-ba74-5c804ec32aac" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="PIPE_DEMAND_4492_Joint_1052" diameter="DN20" length="5.0" name="PIPE_DEMAND_4492_Joint_1052">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515583603507" lon="3.9924051971747203"/>
          <point xsi:type="esdl:Point" lat="51.515683603507" lon="3.9924051971747203"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0e14f9dd-9f56-43ca-a414-521c686c4221" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="71a58e36-62de-4889-9f81-42ce547a1e37"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="2387242c-29a1-4f25-afd4-ac137e4d5a5d" connectedTo="0994e624-ef2e-46a7-8ea2-dbe943185406"/>
        <costInformation xsi:type="esdl:CostInformation" id="74dd8040-2297-413d-8174-c66fd481fba7">
          <investmentCosts xsi:type="esdl:SingleValue" id="d65ca570-4afe-47e5-8c44-dde7cfa012fb" value="696.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="58e7936e-66ca-43eb-aec3-e8b3077fd6cc" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="PIPE_DEMAND_4521_Joint_1382" diameter="DN20" length="5.0" name="PIPE_DEMAND_4521_Joint_1382">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51657560272892" lon="3.992742185271193"/>
          <point xsi:type="esdl:Point" lat="51.516675602728924" lon="3.992742185271193"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="93551ddf-0b72-454c-a2a8-0d962902d2cd" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="00b16560-72a3-41be-b1bf-b96d0c730577"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="621d646b-d572-48d4-a635-40d82ca5a78f" connectedTo="3d48b9f1-1700-428b-983e-058a17a70425"/>
        <costInformation xsi:type="esdl:CostInformation" id="ac5b502c-451e-4be5-bfab-a1f4324a8055">
          <investmentCosts xsi:type="esdl:SingleValue" id="aa85358a-699c-4e87-accd-14c03e81d1d1" value="696.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="edcd0884-c4d7-4815-9f50-fbc8ee933c4e" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="PIPE_DEMAND_4556_Joint_837" diameter="DN20" length="5.0" name="PIPE_DEMAND_4556_Joint_837">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51661901301933" lon="3.9935924086097536"/>
          <point xsi:type="esdl:Point" lat="51.51671901301933" lon="3.9935924086097536"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="4f9c8bac-6d95-48f3-8c36-bfe94ae06df3" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="809a1dad-b355-410f-bb10-8df1f30aafa7"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="748be1f7-ce2e-4c14-81df-e35680e10378" connectedTo="cc97ffba-5c09-4fb9-80cd-c19e89378cb6"/>
        <costInformation xsi:type="esdl:CostInformation" id="a9569c0c-681a-47a2-acfb-cecdc0f85e1a">
          <investmentCosts xsi:type="esdl:SingleValue" id="fe45897f-0d9c-4e2a-a82f-e1cda62e761f" value="696.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e8a44016-1385-4883-8694-8688f25f3be8" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="8e-06" id="56c54023-f22f-4835-968a-7e114416d900" innerDiameter="0.0974" diameter="DN100" length="15.78" name="PIPE_48">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51484205674142" lon="3.9899760532214232"/>
          <point xsi:type="esdl:Point" lat="51.51484859635724" lon="3.9899741376803615"/>
          <point xsi:type="esdl:Point" lat="51.51488199331245" lon="3.9899643655911157"/>
          <point xsi:type="esdl:Point" lat="51.514895404087845" lon="3.989958190188701"/>
          <point xsi:type="esdl:Point" lat="51.51487278374866" lon="3.9898445565516414"/>
          <point xsi:type="esdl:Point" lat="51.51488391067237" lon="3.9898405981247977"/>
          <point xsi:type="esdl:Point" lat="51.51488531603313" lon="3.9898400938706953"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="8aff504b-502f-47ee-9c09-12a647bc98f5" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="de4e0f42-5f4d-4a5c-857f-c4c30604ebce"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="4a45351a-8eab-4823-ba9c-9db046e5be25" connectedTo="4cd8f85b-f65c-411c-9909-5b2fcc948388"/>
        <costInformation xsi:type="esdl:CostInformation" id="2a896ce6-d0d4-465c-a87d-712b54718109">
          <investmentCosts xsi:type="esdl:SingleValue" id="5c4eeec9-a71c-426e-ae37-1275f82dc86d" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d815e449-bc5b-451a-9a03-e36d3a3a15e9" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="7ac47206-a0ae-4a8e-a518-7dde9f8046f1" innerDiameter="0.1506" diameter="DN150" length="10.87" name="PIPE_602">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51508630078258" lon="3.989725177786908"/>
          <point xsi:type="esdl:Point" lat="51.515091329855565" lon="3.9897217381308767"/>
          <point xsi:type="esdl:Point" lat="51.51513604971001" lon="3.9896913309510276"/>
          <point xsi:type="esdl:Point" lat="51.51517594705015" lon="3.9896628441635738"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="9c1faeff-5359-4ef0-8fc3-1e725b34c2e9" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="049e8d5b-fe12-45a3-8e88-2febf0f822cd"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="84a1637f-b84b-4303-ac65-a0fa8824b859" connectedTo="f9c09e53-ce16-4a76-ae06-ca8ee55899c5"/>
        <costInformation xsi:type="esdl:CostInformation" id="6e7e2c04-1dd3-428f-a620-73ac97042718">
          <investmentCosts xsi:type="esdl:SingleValue" id="6b6ffb77-f914-43d7-83af-aa8f5e94d99f" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fb9ee183-f15d-4ba7-8ece-a75aeaf8eddd" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="a5f49535-e69a-4faa-9621-f12d309c7e60" innerDiameter="0.1034" diameter="DN100" length="12.13" name="PIPE_634">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51667459889051" lon="3.993730469376887"/>
          <point xsi:type="esdl:Point" lat="51.51667530850403" lon="3.993714598027047"/>
          <point xsi:type="esdl:Point" lat="51.51667097666532" lon="3.9937071662191794"/>
          <point xsi:type="esdl:Point" lat="51.516617490706096" lon="3.9936155092083814"/>
          <point xsi:type="esdl:Point" lat="51.51661901301933" lon="3.9935924086097536"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="e14af9ed-1c34-4cc6-ab51-58398ef3336d" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="7107e142-90d6-49a2-ad52-561fe57dafd1"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="13b28fba-5c15-4a98-b960-e7dc28f8e44a" connectedTo="226437b4-60af-46df-9c0c-aacc804c7d6e"/>
        <costInformation xsi:type="esdl:CostInformation" id="2ef92460-ff1f-4c45-a9fe-5ee55e8439f4">
          <investmentCosts xsi:type="esdl:SingleValue" id="f401f802-06d4-42b8-a910-f3f05c1062c9" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="93fbb8ad-a4b3-4011-aa9e-0821e2d3ddcb" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="c2106faf-f550-40c8-a9b6-98cc422160ba" innerDiameter="0.1034" diameter="DN100" length="79.15" name="PIPE_1382">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51555390889789" lon="3.9921770149854128"/>
          <point xsi:type="esdl:Point" lat="51.51555122071477" lon="3.9921228067106087"/>
          <point xsi:type="esdl:Point" lat="51.51555106776109" lon="3.9921197856451522"/>
          <point xsi:type="esdl:Point" lat="51.51554801219157" lon="3.992058153928972"/>
          <point xsi:type="esdl:Point" lat="51.51554691062534" lon="3.992035926793802"/>
          <point xsi:type="esdl:Point" lat="51.51554193634581" lon="3.9919355954465585"/>
          <point xsi:type="esdl:Point" lat="51.51554186608048" lon="3.9919342288075033"/>
          <point xsi:type="esdl:Point" lat="51.515539212315495" lon="3.9918806534711075"/>
          <point xsi:type="esdl:Point" lat="51.515537755942624" lon="3.991851305089037"/>
          <point xsi:type="esdl:Point" lat="51.5155361448801" lon="3.9918187916146404"/>
          <point xsi:type="esdl:Point" lat="51.51552982844432" lon="3.991681385546571"/>
          <point xsi:type="esdl:Point" lat="51.51552773996021" lon="3.9916360056554456"/>
          <point xsi:type="esdl:Point" lat="51.51552444665998" lon="3.9915642810294747"/>
          <point xsi:type="esdl:Point" lat="51.51552246706413" lon="3.9915212463694267"/>
          <point xsi:type="esdl:Point" lat="51.515520487452434" lon="3.9914782117132765"/>
          <point xsi:type="esdl:Point" lat="51.51551850782489" lon="3.9914351770610264"/>
          <point xsi:type="esdl:Point" lat="51.51551650074112" lon="3.991391350794977"/>
          <point xsi:type="esdl:Point" lat="51.515515250656335" lon="3.9913642294040206"/>
          <point xsi:type="esdl:Point" lat="51.515513063819235" lon="3.9913166480791933"/>
          <point xsi:type="esdl:Point" lat="51.51551016207489" lon="3.99126416104795"/>
          <point xsi:type="esdl:Point" lat="51.51550783564931" lon="3.991222203280266"/>
          <point xsi:type="esdl:Point" lat="51.51550641368103" lon="3.991196499195586"/>
          <point xsi:type="esdl:Point" lat="51.51550442927696" lon="3.9911688672532826"/>
          <point xsi:type="esdl:Point" lat="51.51550032313691" lon="3.9911118929974725"/>
          <point xsi:type="esdl:Point" lat="51.51549462059156" lon="3.9910409484395197"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="d3083c8c-7733-4f43-9bf2-4a1e4371bb02" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="9e43ab1d-3b48-4922-adb1-3edca541cd79"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="4ccfbbdc-3d47-4957-8185-0b66d7023f23" connectedTo="94fdc486-1464-48e9-9a6c-8228337f436f"/>
        <costInformation xsi:type="esdl:CostInformation" id="cb93548e-e5c8-4f1a-98e6-1457c929df74">
          <investmentCosts xsi:type="esdl:SingleValue" id="50525f80-5d93-41b4-b4a7-9fd50e6bfeb1" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="36e5b39f-f61f-4664-83f6-30136bfe3eac" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="5d701f9d-6e0d-443c-ab54-958da772c9c5" innerDiameter="0.1034" diameter="DN100" length="102.46000000000001" name="PIPE_1413">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51549462059156" lon="3.9910409484395197"/>
          <point xsi:type="esdl:Point" lat="51.51548589766242" lon="3.990958742868422"/>
          <point xsi:type="esdl:Point" lat="51.51548413924703" lon="3.990947010833615"/>
          <point xsi:type="esdl:Point" lat="51.51548393451749" lon="3.990945677143748"/>
          <point xsi:type="esdl:Point" lat="51.51547203744766" lon="3.9908664219477203"/>
          <point xsi:type="esdl:Point" lat="51.51546865777316" lon="3.990843904631701"/>
          <point xsi:type="esdl:Point" lat="51.515461800280484" lon="3.990798181422959"/>
          <point xsi:type="esdl:Point" lat="51.51545794219717" lon="3.99077249456556"/>
          <point xsi:type="esdl:Point" lat="51.515437966497096" lon="3.990639384272137"/>
          <point xsi:type="esdl:Point" lat="51.51543782067747" lon="3.990638466617339"/>
          <point xsi:type="esdl:Point" lat="51.51543602750924" lon="3.990630597109954"/>
          <point xsi:type="esdl:Point" lat="51.515421878029244" lon="3.9905569584774074"/>
          <point xsi:type="esdl:Point" lat="51.51540252664302" lon="3.9904723132374498"/>
          <point xsi:type="esdl:Point" lat="51.515356442231365" lon="3.9902879193159038"/>
          <point xsi:type="esdl:Point" lat="51.51533493769939" lon="3.9902126770527735"/>
          <point xsi:type="esdl:Point" lat="51.51528998541612" lon="3.990055322060031"/>
          <point xsi:type="esdl:Point" lat="51.515258970325675" lon="3.9899448270400453"/>
          <point xsi:type="esdl:Point" lat="51.515252650693434" lon="3.989922299389135"/>
          <point xsi:type="esdl:Point" lat="51.51523283764184" lon="3.9898517025780404"/>
          <point xsi:type="esdl:Point" lat="51.515219906832044" lon="3.9898055756733513"/>
          <point xsi:type="esdl:Point" lat="51.515219906832044" lon="3.9898055756733513"/>
          <point xsi:type="esdl:Point" lat="51.515211508814964" lon="3.9897798988962823"/>
          <point xsi:type="esdl:Point" lat="51.51518057816081" lon="3.9896742284219786"/>
          <point xsi:type="esdl:Point" lat="51.51517594705015" lon="3.9896628441635738"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="43e036d2-b44f-4344-a101-7b6e04d4fab0" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="1d54e814-e2d5-4d52-bfc4-d6d7d41af413"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="dadf1777-ae8d-4d99-8cfb-9903e22e0b71" connectedTo="f9c09e53-ce16-4a76-ae06-ca8ee55899c5"/>
        <costInformation xsi:type="esdl:CostInformation" id="85474f90-6382-4a2e-bcda-d53c9e10fccb">
          <investmentCosts xsi:type="esdl:SingleValue" id="437cd87c-b3db-438e-a497-54f845ac1b9d" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="8ca92d6c-ac89-4d99-9462-eb4b7793ac27" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="8e-06" id="644e3c48-2e7b-4d7c-acda-63eebe076257" innerDiameter="0.0558" diameter="DN50" length="135.81" name="PIPE_1567">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51555390889789" lon="3.9921770149854128"/>
          <point xsi:type="esdl:Point" lat="51.51545694100861" lon="3.992187194455056"/>
          <point xsi:type="esdl:Point" lat="51.51545546336067" lon="3.9921628320579554"/>
          <point xsi:type="esdl:Point" lat="51.51545492637697" lon="3.992154001811"/>
          <point xsi:type="esdl:Point" lat="51.51545209313975" lon="3.992107218403355"/>
          <point xsi:type="esdl:Point" lat="51.51544939576606" lon="3.992062779391973"/>
          <point xsi:type="esdl:Point" lat="51.51544445871407" lon="3.991981365267651"/>
          <point xsi:type="esdl:Point" lat="51.515443327913765" lon="3.991962712350447"/>
          <point xsi:type="esdl:Point" lat="51.51544329441588" lon="3.991962165861458"/>
          <point xsi:type="esdl:Point" lat="51.51544045245957" lon="3.991915411560372"/>
          <point xsi:type="esdl:Point" lat="51.51543891880992" lon="3.991890128764638"/>
          <point xsi:type="esdl:Point" lat="51.51543679082662" lon="3.99185498008973"/>
          <point xsi:type="esdl:Point" lat="51.51543050309921" lon="3.9917214780961436"/>
          <point xsi:type="esdl:Point" lat="51.515429975353214" lon="3.991710414282643"/>
          <point xsi:type="esdl:Point" lat="51.51542733716097" lon="3.991654389193638"/>
          <point xsi:type="esdl:Point" lat="51.515426408731706" lon="3.9916346206367264"/>
          <point xsi:type="esdl:Point" lat="51.51542251801592" lon="3.9915520218074834"/>
          <point xsi:type="esdl:Point" lat="51.515422350897566" lon="3.991548568936924"/>
          <point xsi:type="esdl:Point" lat="51.51541879608371" lon="3.991473019893406"/>
          <point xsi:type="esdl:Point" lat="51.51541758154813" lon="3.99144736711766"/>
          <point xsi:type="esdl:Point" lat="51.51541631625771" lon="3.991420476784587"/>
          <point xsi:type="esdl:Point" lat="51.515413658283094" lon="3.991348516716707"/>
          <point xsi:type="esdl:Point" lat="51.51541054191299" lon="3.9912923622631764"/>
          <point xsi:type="esdl:Point" lat="51.5154102207441" lon="3.9912865511575477"/>
          <point xsi:type="esdl:Point" lat="51.51540700091367" lon="3.99122851239707"/>
          <point xsi:type="esdl:Point" lat="51.515406735829735" lon="3.991224385345041"/>
          <point xsi:type="esdl:Point" lat="51.51540505896996" lon="3.9911984153855355"/>
          <point xsi:type="esdl:Point" lat="51.515399695920266" lon="3.9911152566864176"/>
          <point xsi:type="esdl:Point" lat="51.51539957365406" lon="3.991113300907956"/>
          <point xsi:type="esdl:Point" lat="51.51539953998004" lon="3.9911127400171136"/>
          <point xsi:type="esdl:Point" lat="51.5153992755807" lon="3.9911086705786474"/>
          <point xsi:type="esdl:Point" lat="51.51539425087972" lon="3.9910402844539257"/>
          <point xsi:type="esdl:Point" lat="51.51539313463757" lon="3.991025117945843"/>
          <point xsi:type="esdl:Point" lat="51.51539048262907" lon="3.9909890200758706"/>
          <point xsi:type="esdl:Point" lat="51.515373472927166" lon="3.990858844544767"/>
          <point xsi:type="esdl:Point" lat="51.515352444861136" lon="3.990730190138999"/>
          <point xsi:type="esdl:Point" lat="51.51534721947315" lon="3.99070368084751"/>
          <point xsi:type="esdl:Point" lat="51.51534458785675" lon="3.9906903475394966"/>
          <point xsi:type="esdl:Point" lat="51.51534396550306" lon="3.9906871680101306"/>
          <point xsi:type="esdl:Point" lat="51.51532743817109" lon="3.990603372652676"/>
          <point xsi:type="esdl:Point" lat="51.51530346609555" lon="3.9904871568449454"/>
          <point xsi:type="esdl:Point" lat="51.51530262654052" lon="3.990483105087293"/>
          <point xsi:type="esdl:Point" lat="51.51530262654052" lon="3.990483105087293"/>
          <point xsi:type="esdl:Point" lat="51.51540262654052" lon="3.990483105087293"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="d3083c8c-7733-4f43-9bf2-4a1e4371bb02" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="c624288a-5112-4da7-ab0a-907f34d435f6"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="dc9bc32f-7e1a-466e-aa80-baad8153b846" connectedTo="245539c0-60ae-4597-8e4f-27eac7079571"/>
        <costInformation xsi:type="esdl:CostInformation" id="58e2e8fe-0225-462e-ba82-daba7d0d75ef">
          <investmentCosts xsi:type="esdl:SingleValue" id="8aff0f87-4c8e-407b-a891-897d13118856" value="778.0">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="90718ee3-9f59-40cb-9afe-d9405a0d38c3" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="e9f4a26b-311e-4f99-8b21-2d137779b2ca" name="Joint_36">
        <geometry xsi:type="esdl:Point" lat="51.50980493906405" lon="3.9848951093290257"/>
        <port xsi:type="esdl:InPort" connectedTo="a0ab76b3-60c7-4642-9a65-b84e04e5f66a e695fe9b-4a3a-4133-a85e-a2f1ab346e9d" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="aa6d88a9-b9d0-4528-b719-882a3f4355f0"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="e8f6d8b2-daed-4dd9-a6ff-b7cc57853b88" connectedTo="432f0ef8-349d-4a74-9809-059ccfc41978"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="a71f6a4b-01f2-4741-8bec-7521c9483c52" name="Joint_102">
        <geometry xsi:type="esdl:Point" lat="51.50878288022224" lon="3.9836879490320665"/>
        <port xsi:type="esdl:InPort" connectedTo="55e0fa74-4bb7-41a0-9813-6c14269868c5 3f09cf74-ad32-4af4-8584-e2c3a88879e9" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="125e66c8-8e8b-43f0-b8ba-19d31f7cfc9d"/>
        <port xsi:type="esdl:OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="5a1a3553-348b-4ae7-8b68-d8eef5adec52" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="608515d9-65c4-4727-ac7b-684570322e2d" name="Joint_790">
        <geometry xsi:type="esdl:Point" lat="51.51499683010041" lon="3.9897345700178444"/>
        <port xsi:type="esdl:InPort" connectedTo="b5117cb8-fdfa-4395-96c9-ed24879a96cf" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="54ea1bf6-e1d6-488d-bff1-e0dce65de19a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="8d3931fa-4f17-45e7-b98a-b1bad10bbdf2" connectedTo="21d71a39-5599-4d4d-a193-f6c0a2ce9bc0"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="76b8a446-2023-4277-b702-61b06e16d44c" name="Joint_868">
        <geometry xsi:type="esdl:Point" lat="51.51550752084822" lon="3.99341179390619"/>
        <port xsi:type="esdl:InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="12b2d312-234e-4e13-a159-34ae8dad70aa" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="0be12169-92fe-4c26-bebe-fb7bcca8bac9" connectedTo="b584af6f-d7b3-4029-a1d6-5be1df2d785a d9c9302c-38e6-4cfc-ba4e-8a3fcff50e8c 181eea81-a374-4a4d-a556-15244cccc2f3"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="820b1180-cf5d-4998-9eb5-3aa3586e3a4c" name="Joint_937">
        <geometry xsi:type="esdl:Point" lat="51.51668975484925" lon="3.9946997124130346"/>
        <port xsi:type="esdl:InPort" connectedTo="938c8879-9617-45e6-827b-c3f699db5616 c6b89629-3416-4463-a510-319fc5b3cca5" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="ac0df1f0-1cb4-4b6b-a58a-efccde064ebe"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="ce01c296-0ba3-4b59-b80b-498c22105776" connectedTo="c46c8a5a-a31c-4373-a8b4-6049a443527d"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="a52c71e9-e21a-4f24-ab1b-4ac2c4c42ac3" name="Joint_982">
        <geometry xsi:type="esdl:Point" lat="51.516048950939656" lon="3.9963734377668203"/>
        <port xsi:type="esdl:InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="33e14ffb-0a8a-4a74-860b-9426e196905c" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="0c7d0634-5f30-4038-bc0d-a7533a598a38" connectedTo="1696ac89-fc3b-452e-8b5a-f72c138afa95 efabd283-be83-4af8-bf14-e749312ab9bd"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="9effec26-5864-4d6c-9e16-240402719d03" name="Joint_989">
        <geometry xsi:type="esdl:Point" lat="51.51561770100284" lon="3.9935294466921976"/>
        <port xsi:type="esdl:InPort" connectedTo="3882ab03-ceca-448e-87b5-dd25f1017da7 a68211c1-6e78-4a27-84a9-b22115c84b33" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="db51efb5-84a2-41c3-bb1b-827b518ce5a6"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="d8aaa29f-69a1-4b47-aacc-08e34b730e6d" connectedTo="e42069f7-4773-41db-b7e9-2060f7aedc59 15705209-6fd9-49cf-ad76-7cac729a3910"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="0944dcdb-9d48-44d8-bc67-cf5add80b74b" name="Joint_1228">
        <geometry xsi:type="esdl:Point" lat="51.51572306614181" lon="3.9891071508360714"/>
        <port xsi:type="esdl:InPort" connectedTo="f1e29786-345b-4ec4-af09-4abce10e03d1" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="1d777769-1c1a-4571-bc52-01fce0979938"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="97f9e5f6-c8aa-419e-9b2c-eb42d7ad6657" connectedTo="65755d98-eb5c-4d76-bc30-5a6995d0b0e5"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c2aaaf9f-6e5e-4ba4-94cb-a22be3c06b36" name="Joint_1382">
        <geometry xsi:type="esdl:Point" lat="51.51657560272892" lon="3.992742185271193"/>
        <port xsi:type="esdl:InPort" connectedTo="704c8c62-9356-4140-9475-0a60b2bb7b64 d3ed4064-6ac1-49a8-afd6-ec2b9fc86d9b" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="c54b28a2-638c-45b6-84b6-7886ec385d8c"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="93551ddf-0b72-454c-a2a8-0d962902d2cd" connectedTo="00b16560-72a3-41be-b1bf-b96d0c730577"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="bb7cd047-21dd-4354-a811-3f76332485c9" power="1000000.0" name="Gasboiler_4374">
        <geometry xsi:type="esdl:Point" lat="51.51562805271911" lon="3.994524786855309"/>
        <port xsi:type="esdl:InPort" connectedTo="5089cd62-d938-418b-90ae-3339ab298362" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="6b3170c6-ae45-43c0-a8f3-ebe534aa97c6"/>
        <port xsi:type="esdl:InPort" connectedTo="0195bdb9-258f-41a6-a2d4-cc2e14e11e34" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="78452f7b-a2ee-4f12-8b5e-dc435c562aaa"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="67e066f8-687d-4301-a530-c0fecb6b69a3" connectedTo="614d3b27-d54c-494d-9f5b-43ec4931f6d6"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="2965a846-f9b0-494e-a6e1-627726e60981" power="1000000.0" name="Gasboiler_4436">
        <geometry xsi:type="esdl:Point" lat="51.51571770100284" lon="3.9935294466921976"/>
        <port xsi:type="esdl:InPort" connectedTo="187a1f5a-2cb8-4608-9e33-830d70c2cf6e" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="865db85f-31f4-4203-80f2-f7c13d99a240"/>
        <port xsi:type="esdl:InPort" connectedTo="7dc22e4c-729e-4313-9693-e02306170dc1" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="0d1df441-5b05-4756-b38c-58095c537004"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="d150b0f4-42b9-4577-9fdc-30d232a32929" connectedTo="0b9e94fb-817c-4734-9930-f745097c8552"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="52d94d8b-f1d3-49c7-a756-675c57992fff" power="1000000.0" name="Gasboiler_4492">
        <geometry xsi:type="esdl:Point" lat="51.515683603507" lon="3.9924051971747203"/>
        <port xsi:type="esdl:InPort" connectedTo="2387242c-29a1-4f25-afd4-ac137e4d5a5d" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="0994e624-ef2e-46a7-8ea2-dbe943185406"/>
        <port xsi:type="esdl:InPort" connectedTo="ed2e6268-629c-4c36-924a-7f148767443a" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="7340cfd3-153f-42ce-ab24-c8afec50b440"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="cec0bf11-ce23-4a3c-ace7-d91d17c83b2e" connectedTo="e45beed8-3b63-43ea-904d-285fac5a3771"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="f40f4cda-fc90-49e8-a401-fdbc336afba4" power="1000000.0" name="Gasboiler_4556">
        <geometry xsi:type="esdl:Point" lat="51.51671901301933" lon="3.9935924086097536"/>
        <port xsi:type="esdl:InPort" connectedTo="748be1f7-ce2e-4c14-81df-e35680e10378" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="cc97ffba-5c09-4fb9-80cd-c19e89378cb6"/>
        <port xsi:type="esdl:InPort" connectedTo="aaf75cd5-f608-490a-b59d-4b1b0e484868" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="eb7fc703-5b35-4761-8695-58dfa347cb36"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="831a4691-695b-44fa-aa26-cc908ae0cdbf" connectedTo="8e32db3d-bed0-4681-9192-55d0c7177770"/>
      </asset>
      <asset xsi:type="esdl:GasProducer" id="2d406fa2-507e-47da-a738-0716bf95ab2c" name="STATION_10" power="100000000.0">
        <geometry xsi:type="esdl:Point" lat="51.509727120059836" lon="3.9849277628976365"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="4fed794e-d913-4e17-940b-a0237bd68b17" connectedTo="06174b65-5b40-478f-9ee5-0971e72d3286"/>
        <costInformation xsi:type="esdl:CostInformation" id="6e1a4903-e9b3-45dc-9cb1-80da71a43e38">
          <variableOperationalCosts xsi:type="esdl:SingleValue" id="03c990dd-78a8-44e2-96fd-33ce43761b0d" value="0.0037926">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d1c7fb16-7cb0-40d6-9334-dea7e87fb22c" unit="EURO" perUnit="GRAM" physicalQuantity="COST" description="Cost in EUR/g"/>
          </variableOperationalCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" id="PIPE_DEMAND_4391_Joint_868" diameter="DN20" length="5.0" name="PIPE_DEMAND_4391_Joint_868">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51550752084822" lon="3.99341179390619"/>
          <point xsi:type="esdl:Point" lat="51.51560752084822" lon="3.99341179390619"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0be12169-92fe-4c26-bebe-fb7bcca8bac9" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="181eea81-a374-4a4d-a556-15244cccc2f3"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="229c5578-f9f5-4d73-9288-494a1577ace8" connectedTo="febea095-4f4f-4c65-bbe0-c74626232931"/>
        <costInformation xsi:type="esdl:CostInformation" id="04f2fca5-a6ef-4da2-b0f2-3266828ba39a">
          <investmentCosts xsi:type="esdl:SingleValue" id="fcf4b12d-db18-4f77-98bd-d617507911ff" value="696.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="bff3374b-cb7c-41d2-8d61-8c066cf56fc2" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="0.0002" id="83c4644a-707c-4f0a-ad59-f7ba0951e2a2" innerDiameter="0.1053" diameter="DN100" length="3.37" name="PIPE_61">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51491448148684" lon="3.989827541275302"/>
          <point xsi:type="esdl:Point" lat="51.514911021129535" lon="3.9898291028537454"/>
          <point xsi:type="esdl:Point" lat="51.514911021129535" lon="3.9898291028537454"/>
          <point xsi:type="esdl:Point" lat="51.51490800507256" lon="3.9898309821646962"/>
          <point xsi:type="esdl:Point" lat="51.51490800507256" lon="3.9898309821646962"/>
          <point xsi:type="esdl:Point" lat="51.514906497388715" lon="3.989831950625839"/>
          <point xsi:type="esdl:Point" lat="51.514906497388715" lon="3.989831950625839"/>
          <point xsi:type="esdl:Point" lat="51.5149059623366" lon="3.9898323128665973"/>
          <point xsi:type="esdl:Point" lat="51.51489507819461" lon="3.9898370274688935"/>
          <point xsi:type="esdl:Point" lat="51.51488531603313" lon="3.9898400938706953"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="0fdfc77a-fb7b-487c-affb-8c43c3d4bc17" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="2fae31b5-e1fb-407a-b1e6-2fd2c153f916"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="fee78b09-fa3b-428a-b003-b8e0ee1dddd4" connectedTo="4cd8f85b-f65c-411c-9909-5b2fcc948388"/>
        <costInformation xsi:type="esdl:CostInformation" id="8bae2bc0-2547-4789-a80d-f69e70174a02">
          <investmentCosts xsi:type="esdl:SingleValue" id="3e4fa993-6afd-4a07-9772-acca5e8d14bc" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5a7929bb-97cd-48e6-9f06-cfc9cba8b287" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="0.0002" id="6708fd3f-93d4-4899-88c1-808a56040a9f" innerDiameter="0.1053" diameter="DN100" length="0.2" name="PIPE_243">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51499577058398" lon="3.9897339253981747"/>
          <point xsi:type="esdl:Point" lat="51.51499625782333" lon="3.989731821232265"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="d6a615ad-fa52-438e-95d9-bb0cc2917686" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="8da6aa12-e65c-4c00-b834-61a35a8b6fd3"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="3945a29b-c8a9-4c29-8c5b-109541a408d8" connectedTo="65f1e1b1-3edb-4f77-98fc-db84fbe8acee"/>
        <costInformation xsi:type="esdl:CostInformation" id="2698d572-e606-4177-b339-1fbc09b189e8">
          <investmentCosts xsi:type="esdl:SingleValue" id="1efa545a-f3ac-4a45-9a88-add6457d7ca8" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="78f711d0-7aad-4084-9344-e2ffdd83d774" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="6af472a3-2663-49ac-9952-558de90e6bcc" innerDiameter="0.1034" diameter="DN100" length="28.12" name="PIPE_486">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.515528052719105" lon="3.994524786855309"/>
          <point xsi:type="esdl:Point" lat="51.51553872173209" lon="3.9945246329454194"/>
          <point xsi:type="esdl:Point" lat="51.51556603965688" lon="3.9945229604638923"/>
          <point xsi:type="esdl:Point" lat="51.5157357337964" lon="3.9945315368627687"/>
          <point xsi:type="esdl:Point" lat="51.5157357337964" lon="3.9945315368627687"/>
          <point xsi:type="esdl:Point" lat="51.5158357337964" lon="3.9945315368627687"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="dfeb88fe-0749-40e6-a3c9-349665fc7a34" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="17d60712-21f1-46b2-96c2-17d4cfb5e8a4"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="2cddff3e-31fb-4836-8d44-d2d2f16b1755" connectedTo="f3e0086e-ab0b-4de7-af66-0d7e2dc90778"/>
        <costInformation xsi:type="esdl:CostInformation" id="fc281d28-9594-4b1a-9d9f-f2e5f595bdc0">
          <investmentCosts xsi:type="esdl:SingleValue" id="ac765716-4361-4957-89fe-6726516f3673" value="936.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="28e6bef9-f7bc-4b83-b1e9-26850ac1c4ea" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="00a53924-d2f2-4909-ab4b-e30ba3b02c60" innerDiameter="0.1506" diameter="DN150" length="34.2" name="PIPE_1684">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51663884043244" lon="3.995179641120913"/>
          <point xsi:type="esdl:Point" lat="51.51664739773444" lon="3.9951433573241175"/>
          <point xsi:type="esdl:Point" lat="51.516657560858384" lon="3.9951067938038074"/>
          <point xsi:type="esdl:Point" lat="51.51666032809032" lon="3.9950968535076368"/>
          <point xsi:type="esdl:Point" lat="51.516667986718346" lon="3.995060597195762"/>
          <point xsi:type="esdl:Point" lat="51.5166782039278" lon="3.9950127355433214"/>
          <point xsi:type="esdl:Point" lat="51.51668314941589" lon="3.994975121413724"/>
          <point xsi:type="esdl:Point" lat="51.51668952029305" lon="3.9947094454894794"/>
          <point xsi:type="esdl:Point" lat="51.51668975484925" lon="3.9946997124130346"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="df63f590-a41b-4622-b03d-dd709ab59d98" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="06b9a19c-fd24-4f1b-9158-a1b27de95bae"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="c6b89629-3416-4463-a510-319fc5b3cca5" connectedTo="ac0df1f0-1cb4-4b6b-a58a-efccde064ebe"/>
        <costInformation xsi:type="esdl:CostInformation" id="0cf0e25f-d15e-40b6-afc1-ee063189620b">
          <investmentCosts xsi:type="esdl:SingleValue" id="82cd3449-6868-4e7e-be0f-922bdba18617" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="dd77284e-decd-4456-ad88-5d2cef0d240b" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="826c0ccc-3809-4f1a-93b2-e8e618031e23" name="Joint_88">
        <geometry xsi:type="esdl:Point" lat="51.51488531603313" lon="3.9898400938706953"/>
        <port xsi:type="esdl:InPort" connectedTo="4a45351a-8eab-4823-ba9c-9db046e5be25 fee78b09-fa3b-428a-b003-b8e0ee1dddd4" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="4cd8f85b-f65c-411c-9909-5b2fcc948388"/>
        <port xsi:type="esdl:OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="dc91a44d-cd34-4146-aa3e-d1568a0fae2e" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="e6e34623-52e9-448d-a5d2-2c924eb83a0b" name="Joint_837">
        <geometry xsi:type="esdl:Point" lat="51.51661901301933" lon="3.9935924086097536"/>
        <port xsi:type="esdl:InPort" connectedTo="13b28fba-5c15-4a98-b960-e7dc28f8e44a" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="226437b4-60af-46df-9c0c-aacc804c7d6e"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="4f9c8bac-6d95-48f3-8c36-bfe94ae06df3" connectedTo="018958d1-d8e3-4696-b35c-0e616b80a33b 809a1dad-b355-410f-bb10-8df1f30aafa7"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="64013482-9b16-4833-ae44-44e20b30fdcf" name="Joint_1469">
        <geometry xsi:type="esdl:Point" lat="51.51549462059156" lon="3.9910409484395197"/>
        <port xsi:type="esdl:InPort" connectedTo="4ccfbbdc-3d47-4957-8185-0b66d7023f23" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="94fdc486-1464-48e9-9a6c-8228337f436f"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="43e036d2-b44f-4344-a101-7b6e04d4fab0" connectedTo="315b0bf0-54b8-49b7-b5ee-504e7f05a09b 1d54e814-e2d5-4d52-bfc4-d6d7d41af413"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="90469cff-6bf7-44aa-b49a-d4c4cc1cbdb6" power="1000000.0" name="Gasboiler_4403">
        <geometry xsi:type="esdl:Point" lat="51.51406603297594" lon="3.993659317574499"/>
        <port xsi:type="esdl:InPort" connectedTo="6f638610-206c-4e54-91ae-dd63c66f924f" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="fc49c937-4ac4-4636-be2e-37977b5f5754"/>
        <port xsi:type="esdl:InPort" connectedTo="c4bb8a3e-ad35-453c-b20c-e81fca9be5eb" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="e968a99a-82f9-417b-9772-8c8611148317"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="2b7abe11-9288-40ec-a3ab-f652da4d34b8" connectedTo="fa656a33-9364-42a5-a8db-1a892739cf7e"/>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="911dd67c-51c9-44ec-a18b-717f08b84b27" power="1000000.0" name="Gasboiler_4521">
        <geometry xsi:type="esdl:Point" lat="51.516675602728924" lon="3.992742185271193"/>
        <port xsi:type="esdl:InPort" connectedTo="621d646b-d572-48d4-a635-40d82ca5a78f" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="3d48b9f1-1700-428b-983e-058a17a70425"/>
        <port xsi:type="esdl:InPort" connectedTo="1cbe1a7d-7b76-4070-b1d0-09efde8d9596" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="d6c9a930-5e33-4825-8e1d-566c01df6051"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="eb0bf9c1-94a1-43a0-a3bf-856c01fb327b" connectedTo="8d62be67-c1c5-426d-b425-028054827785"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="PIPE_DEMAND_4436_Joint_989" diameter="DN20" length="5.0" name="PIPE_DEMAND_4436_Joint_989">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51561770100284" lon="3.9935294466921976"/>
          <point xsi:type="esdl:Point" lat="51.51571770100284" lon="3.9935294466921976"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="d8aaa29f-69a1-4b47-aacc-08e34b730e6d" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="15705209-6fd9-49cf-ad76-7cac729a3910"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="187a1f5a-2cb8-4608-9e33-830d70c2cf6e" connectedTo="865db85f-31f4-4203-80f2-f7c13d99a240"/>
        <costInformation xsi:type="esdl:CostInformation" id="ec836bc9-4efa-44fe-ab3f-fa6ebfea566e">
          <investmentCosts xsi:type="esdl:SingleValue" id="356e352c-8c75-43e3-b968-8742e78488c6" value="696.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="27547220-2657-4012-a78e-8723bbdf6c0c" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="9e583739-a1d3-43a3-9906-fc45c6d7b98e" name="Joint_462">
        <geometry xsi:type="esdl:Point" lat="51.51667459889051" lon="3.993730469376887"/>
        <port xsi:type="esdl:InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="970f89c4-6ec0-4caa-a204-01d19cb3fbc5" name="InPort"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="e14af9ed-1c34-4cc6-ab51-58398ef3336d" connectedTo="16d9ead5-4938-4488-8b1a-9dd243dd6c0f 7107e142-90d6-49a2-ad52-561fe57dafd1 5cd28bf3-aa49-40c1-983e-6dbf79a87873"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c05f2b66-b5bc-476a-b746-e9b8f79b0cfa" name="Joint_553">
        <geometry xsi:type="esdl:Point" lat="51.514229515909044" lon="3.9932896023183684"/>
        <port xsi:type="esdl:InPort" connectedTo="0c18289c-3917-4d37-b359-9210505b4825 4af0bb59-6f03-4e17-bbda-466668992159" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="93915028-191e-4a3c-b511-1546a2a69608"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="527e4662-9368-42cc-a0c3-d32caca7c07e" connectedTo="8510d6a2-14a1-4015-938c-7bb84532e027"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c57f16c7-a41a-4ddf-a851-80a02dc2d3d2" name="Joint_794">
        <geometry xsi:type="esdl:Point" lat="51.51517594705015" lon="3.9896628441635738"/>
        <port xsi:type="esdl:InPort" connectedTo="124038dc-1cbd-4fcd-b9a9-e3ec13301189 84a1637f-b84b-4303-ac65-a0fa8824b859 dadf1777-ae8d-4d99-8cfb-9903e22e0b71" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="f9c09e53-ce16-4a76-ae06-ca8ee55899c5"/>
        <port xsi:type="esdl:OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="2f4a7bf8-9a46-4a7a-b9c1-06c7042714b8" name="OutPort"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="d954986f-f0c6-49e1-b28b-bb2cd3fcb32d" name="Joint_910">
        <geometry xsi:type="esdl:Point" lat="51.51555390889789" lon="3.9921770149854128"/>
        <port xsi:type="esdl:InPort" connectedTo="3726a55c-2e95-43b3-a06d-3cf0b89ba1cb" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="b2cf8b98-9bde-4e1b-9eed-8f95cf8f1573"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="d3083c8c-7733-4f43-9bf2-4a1e4371bb02" connectedTo="9e43ab1d-3b48-4922-adb1-3edca541cd79 c624288a-5112-4da7-ab0a-907f34d435f6"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="PIPE_DEMAND_4357_Joint_937" diameter="DN20" length="5.0" name="PIPE_DEMAND_4357_Joint_937">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51668975484925" lon="3.9946997124130346"/>
          <point xsi:type="esdl:Point" lat="51.516789754849256" lon="3.9946997124130346"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ce01c296-0ba3-4b59-b80b-498c22105776" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="c46c8a5a-a31c-4373-a8b4-6049a443527d"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="8c3008ba-b3e0-4334-8d9b-7c746fe156e7" connectedTo="9987f55b-a0bf-49e7-abd2-a0aeb539331f"/>
        <costInformation xsi:type="esdl:CostInformation" id="f09e370f-ea80-469d-a094-c66920afa898">
          <investmentCosts xsi:type="esdl:SingleValue" id="b4f00b27-c6b8-498b-b92e-cbe47ab520b9" value="696.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="1a8fc1b7-b4e2-4dff-b709-f34471201412" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" roughness="3e-05" id="bf0ab239-cf2e-413d-9224-40ef7ef3730c" innerDiameter="0.1506" diameter="DN150" length="67.3" name="PIPE_919">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51667459889051" lon="3.993730469376887"/>
          <point xsi:type="esdl:Point" lat="51.51667467168297" lon="3.9937350635297206"/>
          <point xsi:type="esdl:Point" lat="51.51667526999757" lon="3.9937731562747874"/>
          <point xsi:type="esdl:Point" lat="51.51667614239303" lon="3.9938289489463177"/>
          <point xsi:type="esdl:Point" lat="51.51667659939811" lon="3.993858213474083"/>
          <point xsi:type="esdl:Point" lat="51.51667698721781" lon="3.9938831863218196"/>
          <point xsi:type="esdl:Point" lat="51.51667729571708" lon="3.993903017685045"/>
          <point xsi:type="esdl:Point" lat="51.5166773388971" lon="3.9939058836984995"/>
          <point xsi:type="esdl:Point" lat="51.516677413744574" lon="3.993910650693496"/>
          <point xsi:type="esdl:Point" lat="51.51667752180571" lon="3.9939174483012128"/>
          <point xsi:type="esdl:Point" lat="51.516677931657696" lon="3.9939435155377976"/>
          <point xsi:type="esdl:Point" lat="51.51667831980279" lon="3.9939685171940926"/>
          <point xsi:type="esdl:Point" lat="51.51667896413959" lon="3.99400972081856"/>
          <point xsi:type="esdl:Point" lat="51.51667922377061" lon="3.994026210855715"/>
          <point xsi:type="esdl:Point" lat="51.51667989614407" lon="3.9940690129910603"/>
          <point xsi:type="esdl:Point" lat="51.516680122040384" lon="3.9940834292056118"/>
          <point xsi:type="esdl:Point" lat="51.51668058362034" lon="3.9941130826326243"/>
          <point xsi:type="esdl:Point" lat="51.51668076788284" lon="3.994124762464903"/>
          <point xsi:type="esdl:Point" lat="51.51668101163924" lon="3.9941406766403222"/>
          <point xsi:type="esdl:Point" lat="51.51668172061579" lon="3.9941857974618613"/>
          <point xsi:type="esdl:Point" lat="51.5166821381384" lon="3.994212512859753"/>
          <point xsi:type="esdl:Point" lat="51.51668250526806" lon="3.994235757298491"/>
          <point xsi:type="esdl:Point" lat="51.516683692228284" lon="3.994311914287558"/>
          <point xsi:type="esdl:Point" lat="51.51668417802451" lon="3.9943428493529245"/>
          <point xsi:type="esdl:Point" lat="51.51668440629183" lon="3.994357467219042"/>
          <point xsi:type="esdl:Point" lat="51.5166844931448" lon="3.9943632424583293"/>
          <point xsi:type="esdl:Point" lat="51.51668514730475" lon="3.994405281496375"/>
          <point xsi:type="esdl:Point" lat="51.51668527531649" lon="3.994413000653259"/>
          <point xsi:type="esdl:Point" lat="51.516685665422244" lon="3.9944381751601625"/>
          <point xsi:type="esdl:Point" lat="51.51668623786073" lon="3.994474871064847"/>
          <point xsi:type="esdl:Point" lat="51.516687063321385" lon="3.9945275096823325"/>
          <point xsi:type="esdl:Point" lat="51.51668729792028" lon="3.9945426604788383"/>
          <point xsi:type="esdl:Point" lat="51.51668755077799" lon="3.9945585887875215"/>
          <point xsi:type="esdl:Point" lat="51.516687753372615" lon="3.9945718097949183"/>
          <point xsi:type="esdl:Point" lat="51.51668975484925" lon="3.9946997124130346"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="e14af9ed-1c34-4cc6-ab51-58398ef3336d" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="5cd28bf3-aa49-40c1-983e-6dbf79a87873"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="938c8879-9617-45e6-827b-c3f699db5616" connectedTo="ac0df1f0-1cb4-4b6b-a58a-efccde064ebe"/>
        <costInformation xsi:type="esdl:CostInformation" id="50eb88fa-6af2-4287-9f1a-55702c382270">
          <investmentCosts xsi:type="esdl:SingleValue" id="1bbc1ce1-7bfb-4ec5-af76-21baa8c0b998" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ba7516c9-da7f-4245-aedf-3331120fab2f" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GasHeater" efficiency="0.8" id="5db45311-a83c-4205-a547-50d1e5612b0d" power="1000000.0" name="Gasboiler_4468">
        <geometry xsi:type="esdl:Point" lat="51.51540262654052" lon="3.990483105087293"/>
        <port xsi:type="esdl:InPort" connectedTo="dc9bc32f-7e1a-466e-aa80-baad8153b846" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="245539c0-60ae-4597-8e4f-27eac7079571"/>
        <port xsi:type="esdl:InPort" connectedTo="47dc61e5-d4bf-460c-973f-dd4348e4c521" name="InPort_sec" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="31e8e4f3-e91a-462e-8673-7be2345ebb31"/>
        <port xsi:type="esdl:OutPort" name="OutPort_sec" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="8fde6366-a9a5-4e6f-bf3a-6ad4cc50efc8" connectedTo="b26e008f-6d36-4d1f-9243-215565301ca4"/>
      </asset>
      <asset xsi:type="esdl:Pipe" id="PIPE_DEMAND_4543_Joint_1227" diameter="DN20" length="5.0" name="PIPE_DEMAND_4543_Joint_1227">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lat="51.51585706144299" lon="3.9893364476904223"/>
          <point xsi:type="esdl:Point" lat="51.515957061443" lon="3.9893364476904223"/>
        </geometry>
        <port xsi:type="esdl:InPort" connectedTo="ad892b4b-835e-448e-b7ab-e84fd62c6b7e" name="InPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="85c92a87-b40c-49ad-82ab-6c128ce8104a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="96ba9649-f9dd-4ee9-917c-753bd002e780" id="c95a2487-b9ca-4d6f-988d-68c8c27f34a6" connectedTo="10863ec0-6113-4452-9748-29ce46910043"/>
        <costInformation xsi:type="esdl:CostInformation" id="5a75898c-c00e-42cc-beee-ad831d72c1b3">
          <investmentCosts xsi:type="esdl:SingleValue" id="4761287d-d91e-4cfd-bed8-d6529fac8665" value="696.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="64013f79-5936-4437-b195-4c6812cee1e6" unit="EURO" perUnit="METRE" physicalQuantity="COST" description="COST in EUR/m"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" id="24e47350-1cce-4737-aeca-01cc0398de54" name="Joint_4357">
        <geometry xsi:type="esdl:Point" lat="51.51698975484926" lon="3.9946997124130346"/>
        <port xsi:type="esdl:InPort" connectedTo="152040e3-5760-4847-80d3-9a91b1a29900 4e4bf7c5-91a9-4cb7-9924-86093e34e2fc" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="4b4f427a-e06e-4b9d-99f8-57f6da4087aa"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="aa965a31-6d78-44c1-ac9a-ac59933c9648" connectedTo="a69fc76e-6272-4f78-92e4-fecb6fa9cb17"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="5ec6c72c-9012-4271-aa37-c77780c0aef7" name="Joint_4357_ret">
        <geometry xsi:type="esdl:Point" lat="51.51698975484926" lon="3.9947997124130348"/>
        <port xsi:type="esdl:InPort" connectedTo="e9f5cd86-8323-4029-84c2-6224d8e4ec5b" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="cd4349b7-c609-4835-90e8-5ba37f611197"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="47f62d7c-1251-46d6-8acf-833552222e85" connectedTo="e1d1a242-56de-4b9d-a233-61b0b7d87b32 e6a3fa4f-96f8-4d83-99e2-02bcca74d7e0"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4357" name="Demand_4357">
        <geometry xsi:type="esdl:Point" lat="51.51708975484926" lon="3.9947997124130348"/>
        <port xsi:type="esdl:InPort" connectedTo="aa965a31-6d78-44c1-ac9a-ac59933c9648" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="a69fc76e-6272-4f78-92e4-fecb6fa9cb17"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="e9f5cd86-8323-4029-84c2-6224d8e4ec5b" connectedTo="cd4349b7-c609-4835-90e8-5ba37f611197"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="151b954b-e2b3-4ce4-9d45-4da84f4054df" name="Joint_4374">
        <geometry xsi:type="esdl:Point" lat="51.515828052719115" lon="3.994524786855309"/>
        <port xsi:type="esdl:InPort" connectedTo="d9e651a6-c049-4b70-9a6a-8422f4aaca30 67e066f8-687d-4301-a530-c0fecb6b69a3" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="614d3b27-d54c-494d-9f5b-43ec4931f6d6"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="4d2742c2-29e9-4fc0-9bfb-2ff5014d0afe" connectedTo="3eb0d3b3-b274-4781-8b63-df340e53dd6a"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c170ac2c-512e-4b0c-bfae-e5f6424f1c9f" name="Joint_4374_ret">
        <geometry xsi:type="esdl:Point" lat="51.515828052719115" lon="3.9946247868553093"/>
        <port xsi:type="esdl:InPort" connectedTo="96a9b2a4-fc87-4eef-947c-89ef667f40dd" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="8ff0ff96-bf47-4e52-8f36-32961b0b90ca"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="0195bdb9-258f-41a6-a2d4-cc2e14e11e34" connectedTo="008c6f09-5454-4705-bb97-e96d5829e684 78452f7b-a2ee-4f12-8b5e-dc435c562aaa"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4374" name="Demand_4374">
        <geometry xsi:type="esdl:Point" lat="51.51592805271911" lon="3.9946247868553093"/>
        <port xsi:type="esdl:InPort" connectedTo="4d2742c2-29e9-4fc0-9bfb-2ff5014d0afe" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="3eb0d3b3-b274-4781-8b63-df340e53dd6a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="96a9b2a4-fc87-4eef-947c-89ef667f40dd" connectedTo="8ff0ff96-bf47-4e52-8f36-32961b0b90ca"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="acbf1ffa-5e1c-45ee-bae2-c01fccf085bd" name="Joint_4391">
        <geometry xsi:type="esdl:Point" lat="51.51580752084823" lon="3.99341179390619"/>
        <port xsi:type="esdl:InPort" connectedTo="8fdd00af-7fa8-4498-b0cf-4d316e578b06 3be1fa4c-dfd4-45fe-b4f3-ed1e5517d403" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="802a5e83-5c17-4a47-bf6b-548593243482"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="570e1526-5d7f-4bd2-a73e-b1d6b8eb31bc" connectedTo="ba992267-cb90-4ede-bcdd-4be3ef833351"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="ca6da311-28bf-4685-ad69-474422c880b3" name="Joint_4391_ret">
        <geometry xsi:type="esdl:Point" lat="51.51580752084823" lon="3.9935117939061904"/>
        <port xsi:type="esdl:InPort" connectedTo="bb5e5dfe-fad9-43a2-82e4-8d5654ca39f7" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="6ab021ae-7806-40a6-9c28-e418efa69cf8"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="590ff75e-cef7-46a4-85c9-4a5deec2ad0b" connectedTo="4917f69d-f264-4d1f-b737-50f74ee79e8c a69bf5e0-483d-4971-8acf-c68da1b7df90"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4391" name="Demand_4391">
        <geometry xsi:type="esdl:Point" lat="51.515907520848224" lon="3.9935117939061904"/>
        <port xsi:type="esdl:InPort" connectedTo="570e1526-5d7f-4bd2-a73e-b1d6b8eb31bc" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="ba992267-cb90-4ede-bcdd-4be3ef833351"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="bb5e5dfe-fad9-43a2-82e4-8d5654ca39f7" connectedTo="6ab021ae-7806-40a6-9c28-e418efa69cf8"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="d4125026-380e-4efd-a6fa-7079ca9e8d96" name="Joint_4403">
        <geometry xsi:type="esdl:Point" lat="51.51426603297595" lon="3.993659317574499"/>
        <port xsi:type="esdl:InPort" connectedTo="76834b96-17a1-4e55-a364-6d5d456fc905 2b7abe11-9288-40ec-a3ab-f652da4d34b8" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="fa656a33-9364-42a5-a8db-1a892739cf7e"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="99369fa3-e37b-495f-9d8c-972a203972c0" connectedTo="0c263b60-5472-4be5-82a1-7fd5a3e12b21"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="6013287e-d1b2-41cd-9ade-c9b6a0c76f74" name="Joint_4403_ret">
        <geometry xsi:type="esdl:Point" lat="51.51426603297595" lon="3.9937593175744994"/>
        <port xsi:type="esdl:InPort" connectedTo="198fce03-ddc7-410f-9a97-607ab53c559d" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="a07d036b-29ef-4768-89d2-90b5bdc70b9d"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="c4bb8a3e-ad35-453c-b20c-e81fca9be5eb" connectedTo="2e31eb6a-1e0e-4e41-a423-5b15b13aaa70 e968a99a-82f9-417b-9772-8c8611148317"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4403" name="Demand_4403">
        <geometry xsi:type="esdl:Point" lat="51.51436603297594" lon="3.9937593175744994"/>
        <port xsi:type="esdl:InPort" connectedTo="99369fa3-e37b-495f-9d8c-972a203972c0" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="0c263b60-5472-4be5-82a1-7fd5a3e12b21"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="198fce03-ddc7-410f-9a97-607ab53c559d" connectedTo="a07d036b-29ef-4768-89d2-90b5bdc70b9d"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="c3c4c11d-1987-4da3-adad-680effee9a64" name="Joint_4436">
        <geometry xsi:type="esdl:Point" lat="51.51591770100285" lon="3.9935294466921976"/>
        <port xsi:type="esdl:InPort" connectedTo="932bfc10-cf93-4e34-b298-912538437e97 d150b0f4-42b9-4577-9fdc-30d232a32929" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="0b9e94fb-817c-4734-9930-f745097c8552"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="3d4ba914-f227-4a63-8695-1528528e3586" connectedTo="a9c9d0e6-0086-4010-b028-29a7e7634546"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="35f1355e-07e8-4afb-9a2a-354899ac94f7" name="Joint_4436_ret">
        <geometry xsi:type="esdl:Point" lat="51.51591770100285" lon="3.9936294466921978"/>
        <port xsi:type="esdl:InPort" connectedTo="3b30c71d-4295-4834-8429-9025facbe33d" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="42f78f61-8ba2-4470-ba57-f15c256ef6cf"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="7dc22e4c-729e-4313-9693-e02306170dc1" connectedTo="cd8227c4-ddbb-4292-a58f-64f9dfaf676f 0d1df441-5b05-4756-b38c-58095c537004"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4436" name="Demand_4436">
        <geometry xsi:type="esdl:Point" lat="51.516017701002845" lon="3.9936294466921978"/>
        <port xsi:type="esdl:InPort" connectedTo="3d4ba914-f227-4a63-8695-1528528e3586" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="a9c9d0e6-0086-4010-b028-29a7e7634546"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="3b30c71d-4295-4834-8429-9025facbe33d" connectedTo="42f78f61-8ba2-4470-ba57-f15c256ef6cf"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="eaddce06-c84b-472b-b36a-fed156c42d93" name="Joint_4448">
        <geometry xsi:type="esdl:Point" lat="51.51603573379641" lon="3.9945315368627687"/>
        <port xsi:type="esdl:InPort" connectedTo="7019fcfd-dff8-42f5-bb4a-579eba386dc2 531845af-5dba-4c35-9d3a-3b640af48983" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="39b3071a-b21e-410f-8b06-5127f00f8fd9"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="752c0355-29a0-4ec0-ba8b-b5d0c8017477" connectedTo="cb951cb5-9ca6-43d8-bba6-4d1aacfa634b"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="e73a103f-f5e1-4f5b-ad06-0277d2401e62" name="Joint_4448_ret">
        <geometry xsi:type="esdl:Point" lat="51.51603573379641" lon="3.994631536862769"/>
        <port xsi:type="esdl:InPort" connectedTo="f0266dd7-293b-4b5a-b7bb-8b639d0480ef" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="c32e06d7-f72e-4f1c-aa09-03e7037bcc1a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="da2aa69a-a30c-4ed9-b6a9-78f78965099c" connectedTo="bef80894-a057-4762-8e7f-0b4cf9ba4017 a72bd229-c3df-4bb9-babe-c9aebad5ee5b"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4448" name="Demand_4448">
        <geometry xsi:type="esdl:Point" lat="51.5161357337964" lon="3.994631536862769"/>
        <port xsi:type="esdl:InPort" connectedTo="752c0355-29a0-4ec0-ba8b-b5d0c8017477" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="cb951cb5-9ca6-43d8-bba6-4d1aacfa634b"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="f0266dd7-293b-4b5a-b7bb-8b639d0480ef" connectedTo="c32e06d7-f72e-4f1c-aa09-03e7037bcc1a"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="cf14e2a6-2a69-4dec-9963-03c001aec3bf" name="Joint_4468">
        <geometry xsi:type="esdl:Point" lat="51.51560262654053" lon="3.990483105087293"/>
        <port xsi:type="esdl:InPort" connectedTo="51bd84bf-5910-44fe-aab2-541ef9e3a475 8fde6366-a9a5-4e6f-bf3a-6ad4cc50efc8" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="b26e008f-6d36-4d1f-9243-215565301ca4"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="cb5dc7dc-d360-416c-9feb-582725ebe598" connectedTo="22939953-7ba2-40fe-bb76-c3fff846320a"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="547867f4-99f4-42f7-b1f5-fc5f4ac4330e" name="Joint_4468_ret">
        <geometry xsi:type="esdl:Point" lat="51.51560262654053" lon="3.990583105087293"/>
        <port xsi:type="esdl:InPort" connectedTo="9c3bfa92-a5f0-4db9-9f2c-16b73ae0ff0e" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="84f07ca4-6fad-4252-8bb1-28602cad4da9"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="47dc61e5-d4bf-460c-973f-dd4348e4c521" connectedTo="ae5f948a-733e-41a4-8248-c0569ab2fa78 31e8e4f3-e91a-462e-8673-7be2345ebb31"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4468" name="Demand_4468">
        <geometry xsi:type="esdl:Point" lat="51.515702626540524" lon="3.990583105087293"/>
        <port xsi:type="esdl:InPort" connectedTo="cb5dc7dc-d360-416c-9feb-582725ebe598" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="22939953-7ba2-40fe-bb76-c3fff846320a"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="9c3bfa92-a5f0-4db9-9f2c-16b73ae0ff0e" connectedTo="84f07ca4-6fad-4252-8bb1-28602cad4da9"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="cc264708-fb29-4813-9714-e5f3e1594969" name="Joint_4482">
        <geometry xsi:type="esdl:Point" lat="51.51606194999375" lon="3.9916367267054493"/>
        <port xsi:type="esdl:InPort" connectedTo="caae2251-110f-4931-98f3-513bf68e984b abdfec40-8801-4c3d-9729-e7bc3b194460" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="3563f143-e99d-431f-889f-1a4c54d9a82d"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="62cab7fd-6c7f-40f0-b18a-fde1654a0c50" connectedTo="42983ed7-f112-4bbe-b4ca-3f0a4ee330c0"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="aa03ee4a-fc97-41f6-b4f0-6bf4c551b7b0" name="Joint_4482_ret">
        <geometry xsi:type="esdl:Point" lat="51.51606194999375" lon="3.9917367267054495"/>
        <port xsi:type="esdl:InPort" connectedTo="a23c3038-366f-40d1-ba49-6b60732b1e90" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="f3bf4aa1-6e53-4227-baeb-c65df6759d8e"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="cd0eb61a-0811-4684-bd1d-fa2fa808205d" connectedTo="6ae46155-4bbd-40d2-bb33-79a6acc1d92d b6139172-ceb1-4394-87ac-867f72a700d0"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4482" name="Demand_4482">
        <geometry xsi:type="esdl:Point" lat="51.516161949993744" lon="3.9917367267054495"/>
        <port xsi:type="esdl:InPort" connectedTo="62cab7fd-6c7f-40f0-b18a-fde1654a0c50" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="42983ed7-f112-4bbe-b4ca-3f0a4ee330c0"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="a23c3038-366f-40d1-ba49-6b60732b1e90" connectedTo="f3bf4aa1-6e53-4227-baeb-c65df6759d8e"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="12a5b3ec-400b-4504-8dc4-8a295a2b57e3" name="Joint_4492">
        <geometry xsi:type="esdl:Point" lat="51.51588360350701" lon="3.9924051971747203"/>
        <port xsi:type="esdl:InPort" connectedTo="035c8878-73d9-491a-a8dc-a262d1616eff cec0bf11-ce23-4a3c-ace7-d91d17c83b2e" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="e45beed8-3b63-43ea-904d-285fac5a3771"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="8a236f9c-e09d-4ffe-bf39-fab4a765df19" connectedTo="c82fbd5d-78e6-413b-a32d-4cd76343a027"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="6cc900da-32a2-4a57-8f75-724d3aa61c40" name="Joint_4492_ret">
        <geometry xsi:type="esdl:Point" lat="51.51588360350701" lon="3.9925051971747205"/>
        <port xsi:type="esdl:InPort" connectedTo="86a82f9e-c043-4594-a79e-35af06c208a7" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="fb340919-bb94-4975-b832-f12c9c4c3f81"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="ed2e6268-629c-4c36-924a-7f148767443a" connectedTo="81dcef67-b43c-4b8d-9445-66a37ccd6e15 7340cfd3-153f-42ce-ab24-c8afec50b440"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4492" name="Demand_4492">
        <geometry xsi:type="esdl:Point" lat="51.515983603507" lon="3.9925051971747205"/>
        <port xsi:type="esdl:InPort" connectedTo="8a236f9c-e09d-4ffe-bf39-fab4a765df19" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="c82fbd5d-78e6-413b-a32d-4cd76343a027"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="86a82f9e-c043-4594-a79e-35af06c208a7" connectedTo="fb340919-bb94-4975-b832-f12c9c4c3f81"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="304f6ae0-d421-4175-a9ba-5c2181929f0d" name="Joint_4521">
        <geometry xsi:type="esdl:Point" lat="51.51687560272893" lon="3.992742185271193"/>
        <port xsi:type="esdl:InPort" connectedTo="3be4f382-4f32-4b23-b69a-51313d9b3234 eb0bf9c1-94a1-43a0-a3bf-856c01fb327b" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="8d62be67-c1c5-426d-b425-028054827785"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="a5b92b96-1a32-4f8d-84f8-7b8131f86746" connectedTo="ee6e1ea2-eebb-4c73-a1e9-d1f964f554ee"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="f4cc027e-77d5-4a1e-87a7-7b18e4ec9fa9" name="Joint_4521_ret">
        <geometry xsi:type="esdl:Point" lat="51.51687560272893" lon="3.992842185271193"/>
        <port xsi:type="esdl:InPort" connectedTo="8e094b3c-a53e-47f3-8469-bd58400adae7" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="a700ce7d-e2b0-4c7e-96b5-402350b86f58"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="1cbe1a7d-7b76-4070-b1d0-09efde8d9596" connectedTo="e26cf419-9435-4c7f-87c0-1c552fd8dac7 d6c9a930-5e33-4825-8e1d-566c01df6051"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4521" name="Demand_4521">
        <geometry xsi:type="esdl:Point" lat="51.51697560272893" lon="3.992842185271193"/>
        <port xsi:type="esdl:InPort" connectedTo="a5b92b96-1a32-4f8d-84f8-7b8131f86746" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="ee6e1ea2-eebb-4c73-a1e9-d1f964f554ee"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="8e094b3c-a53e-47f3-8469-bd58400adae7" connectedTo="a700ce7d-e2b0-4c7e-96b5-402350b86f58"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="2242ae6e-6efb-4d4d-9582-97df612efa78" name="Joint_4543">
        <geometry xsi:type="esdl:Point" lat="51.516157061443" lon="3.9893364476904223"/>
        <port xsi:type="esdl:InPort" connectedTo="9e5aedea-4535-43f2-b0ef-1929d7b06203 0206c4b9-6441-4c72-b82e-0eef90d68397" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="21332edc-e47a-46f9-87cd-99fa16b159dd"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="f1eed745-90a2-44b1-9696-20b4aecff268" connectedTo="9ee1557f-98dc-4235-ac4b-ac27f64b6b22"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="d2e85de9-fc4e-4605-b4fa-de3d299c4fe2" name="Joint_4543_ret">
        <geometry xsi:type="esdl:Point" lat="51.516157061443" lon="3.9894364476904225"/>
        <port xsi:type="esdl:InPort" connectedTo="1b3a0c6b-ac9c-4643-9819-f422275aaa38" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="6be0358c-82a5-4ade-83ce-b1523942917d"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="c93108d1-e932-43bd-83b3-9887c04e5b35" connectedTo="855a278e-5080-4b23-a604-30d57610a2ee 7b484392-e7d3-4b22-858a-23e8fc28cc2d"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4543" name="Demand_4543">
        <geometry xsi:type="esdl:Point" lat="51.516257061443" lon="3.9894364476904225"/>
        <port xsi:type="esdl:InPort" connectedTo="f1eed745-90a2-44b1-9696-20b4aecff268" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="9ee1557f-98dc-4235-ac4b-ac27f64b6b22"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="1b3a0c6b-ac9c-4643-9819-f422275aaa38" connectedTo="6be0358c-82a5-4ade-83ce-b1523942917d"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="81abc478-6411-4a31-b893-54821e235f49" name="Joint_4556">
        <geometry xsi:type="esdl:Point" lat="51.51691901301934" lon="3.9935924086097536"/>
        <port xsi:type="esdl:InPort" connectedTo="9c7c214e-7d6b-4a16-bee5-32ac45f06fd6 831a4691-695b-44fa-aa26-cc908ae0cdbf" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="8e32db3d-bed0-4681-9192-55d0c7177770"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="f59e6a7e-19fa-44d9-8f58-c6b84dd533bf" connectedTo="86645c62-5310-440b-aa20-a7eb5a5f78c6"/>
      </asset>
      <asset xsi:type="esdl:Joint" id="aaf6867f-4a3f-4d4c-9dbe-26af4333dc60" name="Joint_4556_ret">
        <geometry xsi:type="esdl:Point" lat="51.51691901301934" lon="3.993692408609754"/>
        <port xsi:type="esdl:InPort" connectedTo="d546f927-a0ca-4eaa-90d4-d6f4aff5d986" name="InPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="6c553b58-bf8f-47f9-800e-84719caf8077"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="aaf75cd5-f608-490a-b59d-4b1b0e484868" connectedTo="93b878c1-b92c-4095-a7a8-6189e2a551dd eb7fc703-5b35-4761-8695-58dfa347cb36"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" power="1000000.0" id="Demand_4556" name="Demand_4556">
        <geometry xsi:type="esdl:Point" lat="51.517019013019336" lon="3.993692408609754"/>
        <port xsi:type="esdl:InPort" connectedTo="f59e6a7e-19fa-44d9-8f58-c6b84dd533bf" name="InPort" carrier="d8829f14-19dd-428d-8b9e-e968852087b1" id="86645c62-5310-440b-aa20-a7eb5a5f78c6"/>
        <port xsi:type="esdl:OutPort" name="OutPort" carrier="ee6cc489-0e74-4085-a31c-aa9606f131cc" id="d546f927-a0ca-4eaa-90d4-d6f4aff5d986" connectedTo="6c553b58-bf8f-47f9-800e-84719caf8077"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
