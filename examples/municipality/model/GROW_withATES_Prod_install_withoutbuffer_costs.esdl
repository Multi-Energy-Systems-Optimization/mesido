<?xml version='1.0' encoding='UTF-8'?>
<esdl:EnergySystem xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:esdl="http://www.tno.nl/esdl" name="Untitled EnergySystem with return network with return network" id="7cf3bc36-1398-4cde-bc73-3c82edf47ff3_with_return_network_with_return_network" description="" esdlVersion="v2111" version="19">
  <energySystemInformation xsi:type="esdl:EnergySystemInformation" id="92cbf842-4d76-4b77-b099-f5ca80990993">
    <carriers xsi:type="esdl:Carriers" id="e5e0bad2-dd5e-4e1d-a1fe-d19fcc89d802">
      <carrier xsi:type="esdl:HeatCommodity" id="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75" name="Heat" supplyTemperature="70.0"/>
      <carrier xsi:type="esdl:HeatCommodity" returnTemperature="40.0" id="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret" name="Heat_ret"/>
    </carriers>
    <quantityAndUnits xsi:type="esdl:QuantityAndUnits" id="aea45f45-caf3-476a-98b3-4ebb49595202">
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="e9405fc8-5e57-4df5-8584-4babee7cdf1b" description="Power in MW" physicalQuantity="POWER" multiplier="MEGA" unit="WATT"/>
      <quantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="eb07bccb-203f-407e-af98-e687656a221d" description="Energy in GJ" physicalQuantity="ENERGY" multiplier="GIGA" unit="JOULE"/>
    </quantityAndUnits>
  </energySystemInformation>
  <instance xsi:type="esdl:Instance" id="71555e19-f22c-4963-9f22-86d3c1e732c5" name="Untitled Instance">
    <area xsi:type="esdl:Area" id="409fd1ef-d637-4268-bca1-c33bf8cb8ecd" name="Untitled Area">
      <asset xsi:type="esdl:Joint" name="Joint_bdf0" id="bdf0ba14-9269-43d5-bd14-6ec0ef190b3a">
        <geometry xsi:type="esdl:Point" lon="4.3101945519447336" lat="52.0443961581157" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="d44b1d62-d2be-482a-9c1b-29c7a5073711" name="In" connectedTo="c3e7a4d0-a8ce-4688-af7f-3ef98bcc7f06 9df74fea-c3d1-4733-8cbe-02f9ee031511" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="c709f60d-55ac-4791-8b4e-e8cd6733fc33" name="Out" connectedTo="f55f315e-169c-46c9-84f7-a7f305dd7165 ec75d694-eb55-4409-880c-6c342f3abbfe cea9d279-8464-4774-b382-34e7b3e69c5a 74d1b153-1824-441b-9173-5ebe9613e58c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:ResidualHeatSource" power="40000000.0" name="WarmteLink" id="fcce9b72-d99a-43b0-91d3-06818bcc354d" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.310012161731721" lat="52.044602369454225" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="6882fee0-bcea-4c96-9030-d8b70894d27a" name="Out" connectedTo="0410dd85-26b3-4ceb-bbb9-a8a738a1a020" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="85c8013d-9a9b-4efc-87ba-cfd3d999adb6" name="In" connectedTo="d05ca38e-424c-4325-8e75-69379f90bf24" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="a0b76b52-a5ed-46a3-af24-625b16480fdb">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="ee23c233-ea88-4f4f-9685-4187cf8814a6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="5d37cf6d-ae69-47a1-8aa8-b59dd7676922" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="32.0" id="36133d10-eb52-4468-90ba-1a10bb15916b">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="4ff8b3a2-1a38-41ee-b08b-9d90cc327fef" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="300000.0" id="2291626f-7d2b-4fe9-9816-55b04effd6b5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="1ec0b548-0d2e-41dd-8c8d-97f5abac577f" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:GeothermalSource" power="20000000.0" name="GeoSource" description="CONSTANT" id="8cf9a76a-37b3-46e2-8b49-9df756620be5" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.3102964758872995" lat="52.04469805119214" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="bd8a6c48-a664-4f32-bf2e-68046a3bfeb4" name="Out" connectedTo="cc9f9cec-d565-422a-b645-29c24f85678d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="3aacb2a9-615b-4047-8b01-04f5f1f32379" name="In" connectedTo="f7d48b4e-2348-4b24-9af9-98598f270be2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="b0498a6e-b4d6-4ab5-96a7-c4e3918a3edb">
          <installationCosts xsi:type="esdl:SingleValue" value="36300000.0" id="9c6bb73b-8430-49e8-85a1-b3d85d6669cb">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="f0ac8533-0914-4776-811e-9db8c0880e8d" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" id="25fafbb2-9fcc-4ac6-904a-f8447e22765c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="539ee2d5-60b5-4e19-9e9e-384789b91e51" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </fixedOperationalCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="2.0" id="c1019862-6be2-4a24-aba0-409d28b841b3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="c05b676c-30bd-4302-bf9e-f6a6e8b4ce6e" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" id="cfe25a6d-8fe9-4de6-9a24-aef75b77da8d">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b326553c-4634-440a-9cdd-1c8ec3a7e52c" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </fixedMaintenanceCosts>
          <investmentCosts xsi:type="esdl:SingleValue" id="955da802-8a94-445f-ad72-0230317536d1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="57e6e52d-fe81-42a2-97a8-564776edf08f" unit="EURO" perMultiplier="MEGA" perUnit="WATT" description="Cost in EUR/MW"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Kleurenbuurt" id="404684bc-3874-42bf-a0d9-5f184591b57a" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.313077926635743" lat="52.04172687268464" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="59a43508-4328-4e0a-94e1-fd6036172036" name="In" connectedTo="e415e84f-84b0-4133-925f-50c1903f9eb8" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="10.88" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="f3f7d77b-b199-4527-87de-0ec14c1647eb" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Kleurenbuurt" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="0ab74980-9ef0-433d-bf30-ec3cf137ad7c" name="Out" connectedTo="3a78bae6-bc9c-45c1-bd5d-6c722675944f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Artiestbuurt_2" id="7cfa7e7b-534a-4740-8fd8-f81c294bc24c" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.316178560256959" lat="52.038644953041" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="9da9e597-f6fb-4831-b124-6de0044f5a3e" name="In" connectedTo="48b9c98f-4bc7-44fc-baee-1e9681c16c1f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="93f35859-1168-465d-b4f3-a2b1d8cc4ceb" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Artiestbuurt" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="6db24e9f-83c6-40be-a58a-faaa0e155b00" name="Out" connectedTo="8d924dd2-37dc-4d06-9bb4-a028abc8d29c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Artiestenbuurt_1" id="a905fe2c-9611-4832-980d-51a0a8c00ae9" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.318581819534303" lat="52.037722645629316" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="bb93e16a-1131-425f-b438-0a1afd02b5b7" name="In" connectedTo="eb08503b-b0a8-4713-b941-b626531b19e5" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="8.76" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="601276f8-c4f0-4ad4-b211-c7b85530bf89" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Artiestbuurt" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="3b1b483c-7d9e-4ffd-aa58-e16edef4cb44" name="Out" connectedTo="4f760ceb-53f0-4867-bf62-bbecaf12c768" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer1" id="70837549-df4b-4009-840e-8bb40b6aa7fc" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.317970275878907" lat="52.03756425102864" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="57581db4-cc0f-4260-8538-bf2599cdece2" name="Out" connectedTo="47b7daf3-d849-4176-8825-84e4f1b46b58" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="d0832916-11c6-4f8f-a601-0fb90b1f5764" name="In" connectedTo="2f3babb2-f6e5-469e-a3b5-374d087ef970" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Muziekbuurt_2" id="6c5208f4-a292-41b9-974d-f8432d363d0e" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.319719076156617" lat="52.03491765821515" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="8c696b24-1afb-4af2-ab02-4c911a43f9a2" name="In" connectedTo="89bfd689-d399-42f9-a0c7-145a09816032" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="b53b972f-cf48-4f3e-99ae-9bae9ee8bb51" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Muziekbuurt" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="9076d363-fa38-4470-a566-1c692a87bae7" name="Out" connectedTo="7a9cd346-22a0-467f-8eae-b72541b0bef4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Muziekbuurt_3" id="ba67bf8f-47f6-4884-8165-b85f6a49b7fa" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.3213941156864175" lat="52.033208179577564" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="504787dd-d2c9-44ed-afb3-88071b846d9b" name="In" connectedTo="27ad4ddb-4499-4264-b6d2-2c21b71e68c3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="1ef0ad6e-7d2a-44d4-973c-ef0b990de334" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Muziekbuurt" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="60efe325-8f39-4540-b7b2-cfa8d605a9db" name="Out" connectedTo="cb5c01ac-0415-418b-a92f-e4d7b001cd10" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Muziekbuurt_1" id="59b7a07e-01ed-4937-8989-23395852dd95" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.324289560317994" lat="52.03182866846768" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="0148e3f8-6850-4ab4-a3d3-3e49ebd7e137" name="In" connectedTo="6bfc5f80-e091-40d1-bc29-9d71281d5251" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="4ad0445d-64de-4f50-9ff7-9b62de54fe00" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Muziekbuurt" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="17944386-a137-4cac-965e-e8b5a399bb3c" name="Out" connectedTo="129982a4-6b66-43c8-ba16-1b2ee1caf049" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_8cee" id="8ceef208-2d8a-402b-84e9-0ce3cb280e71">
        <geometry xsi:type="esdl:Point" lon="4.312788248062135" lat="52.04164900734322" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="57dd5638-d1ba-4ed9-8efe-f1da25ea2f52" name="In" connectedTo="e6e03317-762d-45a5-9481-5e52464e2e95 5e043cfa-f07b-4f73-a9d2-e76a21840101" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="d9e086ab-5ad3-4235-98ad-0f109001a4d4" name="Out" connectedTo="6058d754-7518-47ba-8ed7-fe056fdcae0e d9094d66-9b87-4773-bbb0-0d4473d07636" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_5163" id="516346a3-f37f-4382-92bc-213da6b5b607">
        <geometry xsi:type="esdl:Point" lon="4.316698908805848" lat="52.03879819320885" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="b36fcc81-7a66-4b77-9108-48ee1ed0fda6" name="In" connectedTo="8e2c060b-efa1-4e27-afe6-48cdc7ae2a1d 03764218-27f8-4596-a02c-ec0365d0890f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="ba4ce072-68d5-4603-aa4d-7ecf059f5020" name="Out" connectedTo="07e7713b-2ef3-4117-bb46-00cf80079901 c57ca1fe-b04f-41c6-abd1-1dd286045e4f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_828a" id="828af701-3d67-4318-ad08-42697c7c0733">
        <geometry xsi:type="esdl:Point" lon="4.3182599544525155" lat="52.03766978308298" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="0306fc7e-d183-4db6-86a6-f523ab77e17e" name="In" connectedTo="74b1d111-dfb0-4780-a4d8-7740855d92cb 630b935b-252e-489c-a6a6-d4d56bf1668e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="39f0b02a-1dbf-42e7-99a6-143e5868754a" name="Out" connectedTo="c0ce56e8-260b-4dea-a690-86d623612ee9 767d00ad-0379-4618-ad42-322481c41a4a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1514" id="15141c6e-dad7-44a7-847d-d0e2b0fcc2f8">
        <geometry xsi:type="esdl:Point" lon="4.319311380386353" lat="52.03473314368742" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="2d464b69-7340-4d13-b04e-8d642145a6fe" name="In" connectedTo="b58b1d37-d79b-4e73-a9ba-3977125cbc31 16cfc909-805a-4d30-bcbf-a0e703a6fef6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="72c1d1a9-8f49-4a26-b861-ec067835ef38" name="Out" connectedTo="d4a42b33-e4ca-4743-a240-9b3b0847ff60 c8146f79-e5f6-430a-97ce-253f14b77e21" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_217a" id="217ae474-eee0-4911-9bd0-9643fcd698be">
        <geometry xsi:type="esdl:Point" lon="4.320539832115174" lat="52.03287207234976" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="b2547ccb-93f2-4c84-839d-0e34211aeece" name="In" connectedTo="e4b21d04-196b-460f-a4ff-b3b7de3c9ccb 27795ecb-87b0-47e2-b93e-1dc3964d0352" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="4a82116b-fede-476f-9135-24d51f45f1b3" name="Out" connectedTo="c1318085-1ced-470d-b53e-6ac138f43364 ac87490f-88d5-43a5-89d8-300f719ebfec" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe1" outerDiameter="0.56" length="355.4" innerDiameter="0.3938" id="Pipe1" state="OPTIONAL" related="Pipe1_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3101945519447336" lat="52.0443961581157"/>
          <point xsi:type="esdl:Point" lon="4.3111950159072885" lat="52.04365837648511"/>
          <point xsi:type="esdl:Point" lon="4.312788248062135" lat="52.04164900734322"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f55f315e-169c-46c9-84f7-a7f305dd7165" name="In" connectedTo="c709f60d-55ac-4791-8b4e-e8cd6733fc33" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="e6e03317-762d-45a5-9481-5e52464e2e95" name="Out" connectedTo="57dd5638-d1ba-4ed9-8efe-f1da25ea2f52" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="def08568-97c0-42b7-bde4-542b8617d24f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe2" outerDiameter="0.56" length="495.8" innerDiameter="0.3938" id="Pipe2" state="OPTIONAL" related="Pipe2_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.312788248062135" lat="52.04164900734322"/>
          <point xsi:type="esdl:Point" lon="4.314950108528138" lat="52.03909226576622"/>
          <point xsi:type="esdl:Point" lon="4.316108822822572" lat="52.03947499237764"/>
          <point xsi:type="esdl:Point" lon="4.316698908805848" lat="52.03879819320885"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="6058d754-7518-47ba-8ed7-fe056fdcae0e" name="In" connectedTo="d9e086ab-5ad3-4235-98ad-0f109001a4d4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="8e2c060b-efa1-4e27-afe6-48cdc7ae2a1d" name="Out" connectedTo="b36fcc81-7a66-4b77-9108-48ee1ed0fda6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="2bbc120b-1217-4f7a-ad06-919f825edfce">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe3" outerDiameter="0.56" length="170.5" innerDiameter="0.3938" id="Pipe3" state="OPTIONAL" related="Pipe3_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.316698908805848" lat="52.03879819320885"/>
          <point xsi:type="esdl:Point" lon="4.317444562911988" lat="52.038547864509624"/>
          <point xsi:type="esdl:Point" lon="4.3182599544525155" lat="52.03766978308298"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="07e7713b-2ef3-4117-bb46-00cf80079901" name="In" connectedTo="ba4ce072-68d5-4603-aa4d-7ecf059f5020" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="74b1d111-dfb0-4780-a4d8-7740855d92cb" name="Out" connectedTo="0306fc7e-d183-4db6-86a6-f523ab77e17e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="c0479248-dfe2-4c09-a9e7-5ce7d3a92db0">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe4" outerDiameter="0.56" length="26.1" innerDiameter="0.3938" id="Pipe4" state="OPTIONAL" related="Pipe4_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.310012161731721" lat="52.044602369454225"/>
          <point xsi:type="esdl:Point" lon="4.3101945519447336" lat="52.0443961581157"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="0410dd85-26b3-4ceb-bbb9-a8a738a1a020" name="In" connectedTo="6882fee0-bcea-4c96-9030-d8b70894d27a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="c3e7a4d0-a8ce-4688-af7f-3ef98bcc7f06" name="Out" connectedTo="d44b1d62-d2be-482a-9c1b-29c7a5073711" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="f93441fc-464f-43a5-9998-e147aabd10cd">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe5" outerDiameter="0.56" length="34.3" innerDiameter="0.3938" id="Pipe5" state="OPTIONAL" related="Pipe5_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3102964758872995" lat="52.04469805119214"/>
          <point xsi:type="esdl:Point" lon="4.3101945519447336" lat="52.0443961581157"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="cc9f9cec-d565-422a-b645-29c24f85678d" name="In" connectedTo="bd8a6c48-a664-4f32-bf2e-68046a3bfeb4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="9df74fea-c3d1-4733-8cbe-02f9ee031511" name="Out" connectedTo="d44b1d62-d2be-482a-9c1b-29c7a5073711" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="07d9b1a5-f1e4-4b5d-86ce-fa5507105e11">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Presidentenbuurt" id="6f01df0b-7c29-467b-93e8-691f3ef43835" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.30440902709961" lat="52.03904506381387" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="49eb6e79-0f68-44c0-a9ca-3398028e5b5e" name="In" connectedTo="d2065857-7f90-4645-8e5b-af7b096dc84c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.5" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="601949fb-26ab-411e-9db1-28e02541c1cc" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Presidentenbuurt" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="6194bccd-c26a-469b-88fd-6d9d5453065a" name="Out" connectedTo="0efab627-79b2-432a-b65e-2ea0b7de34f0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_DeStrijp_2" id="7fc734dc-8ab1-416d-8076-2b7c89508063" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.298100471496583" lat="52.036880614888744" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="856149d8-c74a-496e-a6fd-b9ed82e843af" name="In" connectedTo="b7c5f7da-761d-4d69-90c8-cc18e551c6b5" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="4.07" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="8050c84c-63fb-4953-af82-735fb1770edd" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="De Strijp" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="824b1653-94c7-408a-a1a6-9aab266bfa89" name="Out" connectedTo="01ae5f1b-6a10-430c-aefb-6b981fc85911" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_DeStrijp_3" id="15759457-af7f-4c6e-852b-17f6cc935e77" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.296705722808839" lat="52.036880614888744" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="414973d8-31e5-4237-9ebf-b319c6ec404b" name="In" connectedTo="589c1244-bdbf-42a0-a6cc-b99c18916900" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="4.07" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="cc4fa425-6a51-415c-bb86-deabd5ee1d64" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="De Strijp" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="327389ca-879f-499b-9a03-97a00ea571f4" name="Out" connectedTo="997ff413-e4c0-4cad-a81e-b1474abdb91f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Ministerbuurt_1" id="f60821f7-86e2-4ad3-aad2-3faef4a7488c" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.303786754608155" lat="52.035745557102025" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="70dc27c6-6a93-4801-b83e-140394796527" name="In" connectedTo="00f6e2a9-bd19-43ec-965b-fae9fcc33bdb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="4.83" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="ae8e24dd-cf5f-4fc7-a304-264ebde69618" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="MinisterBuurt" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="6cf7348f-8aac-4f1e-9e31-6ac8295f5706" name="Out" connectedTo="2f4e69b7-96f9-4eb7-ac5d-97a6255dbb7c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Ministerbuurt_2" id="4c0f0eff-1d3c-4e82-8093-bcf49ac3ea9a" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.309816360473634" lat="52.03474245879195" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="66455895-fbde-4174-a263-86f9586c2fc8" name="In" connectedTo="f9aae992-24b9-4fb8-adbb-c8a0846c999d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="7.36" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="567b5341-8f86-4c8b-bd93-40308e8fd1db" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="MinisterBuurt" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="bbe6e10e-2805-44ce-9cba-279dac4e168b" name="Out" connectedTo="c8cd7c63-3a3d-4760-9b18-333d9a5f0e64" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_DeStrijp_1" id="39099775-f29c-4757-9409-4ade3408e07f" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.299387931823731" lat="52.03030743866227" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="fd0f353b-455a-4f90-b8c2-b5643121a8e3" name="In" connectedTo="d1611125-9f5a-4f97-9786-1e9fd114730a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="4.07" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="651428d2-f28e-4873-bb37-02070c5e1d2a" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="De Strijp" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="35e0390a-790b-4f1f-8a9e-e3cfea3fe38b" name="Out" connectedTo="c9db5954-0973-4a45-a040-008ca98e05d0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Stervoorde_2" id="92679c73-bdd4-4e61-ab3f-423a8a095563" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.310073852539063" lat="52.03098063967937" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="ec81162a-89f8-474f-82e4-760db081a5a1" name="In" connectedTo="2dff1dbb-1a51-4e39-9555-7e16d38d7da1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="6.02" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="a6520538-51ba-4bd4-b8b2-b67c1750505f" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Stervoorde" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="1417f744-930d-478b-bafd-d9d358b83e8e" name="Out" connectedTo="4e5ce568-bbc1-484f-be68-e5a46a61b93b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Stervoorde_1" id="4c5e140c-ef2a-4c8e-a058-c5e6edfeabce" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.3117690086364755" lat="52.03211581843917" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="e6383ee7-aa2a-4c42-97c7-d7c7cdd7937b" name="In" connectedTo="43b110a3-9963-4073-a743-de6aeb5a0d82" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="4.05" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="a288b889-0c3e-4592-993a-6006fd634c36" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Stervoorde" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="4b7d7685-af5d-4ccd-9f6c-d66a7a447a0e" name="Out" connectedTo="8fa483ed-2b40-4410-bcd6-301b097ec23e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Stervoorde_3" id="4e4c1ec6-ea8c-42ac-bd65-8f41df0b51bc" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.314708709716798" lat="52.029753030214444" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="d937e02c-ce60-4352-90a2-ad6420f3147e" name="In" connectedTo="2218f77f-a63c-425a-8900-179dfdb53706" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="10.5" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="864fc107-1b7b-44e8-b07b-b113f9b11056" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Stervoorde" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="016ba65e-e955-4fd2-bdfd-8ebecb31702f" name="Out" connectedTo="265e54cf-0576-4d80-b6ac-9bdb881575d5" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Stervoorde_4" id="6125ea38-b2c2-47be-a8d4-2b9cc9f2c300" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.3096661567688" lat="52.027627734152475" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="fc31e841-4b59-467b-a070-ba95631e977b" name="In" connectedTo="e1a13ea4-f7eb-4fb4-afe8-283e388d19b1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="2.98" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="4a6c3895-cc73-4178-9512-3dbbaea90023" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Stervoorde" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="922d3ae9-e869-4ee0-bfc9-a00f7fdbf283" name="Out" connectedTo="e578607d-8bb3-40ec-b689-d991e1bf4300" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Stervoorde_5" id="7c52a9d7-622c-4741-9ce1-a823698b86b9" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.312541484832765" lat="52.02601719409004" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="412c281b-228b-41f3-bdef-8bc997fd8e6b" name="In" connectedTo="b299f0e5-4a02-431b-adcc-27e0967c5f5a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.79" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="cbd88eb4-831b-4256-99d1-7bc82653dbb6" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Stervoorde" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="940d3006-7e6e-4a7c-814f-d130d992564c" name="Out" connectedTo="c6164983-07e3-400b-b0db-936daaface70" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Hoekpolder" id="f26f4a87-a8e8-454d-b041-77b0de3c546f" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.315352439880372" lat="52.025145894142554" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="056aef7b-b808-46c6-baa1-010a0f4bf11a" name="In" connectedTo="ba89be56-23e3-4048-ae31-ded09be9d50b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.5" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="f32555ca-ee0b-437c-828c-29a4a66c31c8" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Hoekpolder" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="b3941ae3-a8c5-4a33-8369-68dfa6fa3fd1" name="Out" connectedTo="d7d4264b-01c0-43ba-8864-9b01f445a9aa" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_20e0" id="20e06866-ab41-4ed5-beed-e8980c3f8ebd">
        <geometry xsi:type="esdl:Point" lon="4.314301013946534" lat="52.02605679822976" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="8312aa67-8f5f-4eb0-a8ad-07dc0c7f3649" name="In" connectedTo="7b52d17c-6205-4141-aa5e-8334b834c2d7 6a434cd0-16d6-4138-ba03-c8d397f4e0dd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="e70641e4-96be-4c1b-9c04-b9257adda5d7" name="Out" connectedTo="d21ba8f2-b54b-4c84-b013-67b1a7feb953 9c69135d-a0e5-4550-aa97-eb77b4d32306" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_72e3" id="72e34ad8-feef-4604-a1aa-6c8e6fc0c7bc">
        <geometry xsi:type="esdl:Point" lon="4.312477111816407" lat="52.028010558913955" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="ff808ae2-2e13-49e1-9054-da89bef0db88" name="In" connectedTo="d46d9aa4-b8a3-41f7-a7a3-79175568753c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="460ad9bd-ae51-47e2-b9a7-e08bc4c86fb9" name="Out" connectedTo="a40eada5-6329-4846-bce0-65cdfb1203c1 ba5d2033-f0b4-414e-b39c-0e72e122b747" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_aae6" id="aae6769c-d4f6-40ab-b830-a574fdebeba0">
        <geometry xsi:type="esdl:Point" lon="4.313313961029054" lat="52.02896100622209" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="621b064d-fbc6-451f-8a99-8d109330d3ab" name="In" connectedTo="eb254b90-29b7-4b12-a4f3-daf2c9f65026" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="bda0d0ea-4371-4e95-b38b-c7b0002e2d73" name="Out" connectedTo="9ee69b64-1da1-4651-9f39-362cb02bd308 7178dbd9-04d5-46cc-83f7-42a255a66eed" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_839c" id="839c3742-38eb-43ac-b784-a5808b31159c">
        <geometry xsi:type="esdl:Point" lon="4.311296939849854" lat="52.0312182376185" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="96fb6c73-14d6-4e0f-b18f-87b1f146a419" name="In" connectedTo="2cfcc85a-c0dd-484d-984f-9a9a40436d78 008df1e4-53f0-4122-ad6b-901857d7a052" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="ba5f246f-3f6a-4b80-ba1e-92b9c818e6d9" name="Out" connectedTo="5c23cf16-c177-46e8-bd07-f6525567b205 bb7a2d77-d43b-46fc-b78c-9ed1a6d4de6d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_b466" id="b466938b-00ff-4d1c-ae5c-17667a640e8d">
        <geometry xsi:type="esdl:Point" lon="4.310760498046876" lat="52.031799027265784" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="d0436b36-2700-440b-a0f9-869730642d19" name="In" connectedTo="957a1d73-aa94-4ad7-93c9-e11689c8a828 39b5089e-627f-48b2-a419-6c0a3f24d00a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="4af9fa7e-41ee-4e79-97c4-e0dd2b1419d5" name="Out" connectedTo="4e05723e-da3c-46eb-a06f-b5fba5f48e77 a17aca11-124a-4092-b206-b0b2c6d19666" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_45b2" id="45b2b17b-2e1d-478b-b8e4-73a523c07180">
        <geometry xsi:type="esdl:Point" lon="4.310138225555421" lat="52.03260420043414" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="fc4fc28b-3d67-4ea5-b18a-78f06b4a485e" name="In" connectedTo="98cb1464-4bf2-48f5-9100-00faea463328" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="9b977589-8e44-475a-a0ed-f4420d88e233" name="Out" connectedTo="dc272572-24e8-4732-9760-c72cd468ce81 25717110-9674-418f-a506-055fe48c695f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7975" id="7975feaf-7c8d-44b2-adc6-c756698428a7">
        <geometry xsi:type="esdl:Point" lon="4.308958053588868" lat="52.03438608950049" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="d90ca402-cd8d-429e-a04c-d5e817f99181" name="In" connectedTo="621e16d5-311b-4c95-87ca-4f220bbbcf1e 0e1a3e0d-166b-4639-8723-3a1b9f416fec" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="59de07d5-eb72-42f5-af24-0974da4122c9" name="Out" connectedTo="170363ab-2815-4f4a-9d3b-0e9b223ba6cc 74b08f4f-d766-437b-a861-1af16ca2527d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_26ed" id="26ed9660-eca1-4483-bb1b-14f2d83626b0">
        <geometry xsi:type="esdl:Point" lon="4.305782318115235" lat="52.03623389944942" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="46b318b8-4c66-4f46-9995-34803863a16b" name="In" connectedTo="3462ee9c-1d29-4970-a03b-019dc46e0f3b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="7fb2c2ec-9dff-4709-b221-9a6bcc1b205b" name="Out" connectedTo="5f744428-c765-473a-a226-9f64d27ac881 c4747870-0077-46b4-803f-8d8111839843" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_75c2" id="75c21861-e461-423e-ad15-09b9200da342">
        <geometry xsi:type="esdl:Point" lon="4.305396080017091" lat="52.03721056814132" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="47fad4e7-aff2-4858-8e0b-b827e3cd4986" name="In" connectedTo="3648f104-f01b-4bf3-a8c2-433043926a3a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="32f70da1-9ba0-4948-88dd-d3a76a439e75" name="Out" connectedTo="cef325c2-be23-452e-a81c-4e1496e4e7d4 89801693-28b8-4a00-8635-a38a020bfc24" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_50da" id="50daf054-b881-4e62-adfc-4d2750a2a1c3">
        <geometry xsi:type="esdl:Point" lon="4.297864437103272" lat="52.0372369642963" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="a7a34f2e-4ac0-40b4-9d15-ef4d784b5e1f" name="In" connectedTo="f0e6c142-ec72-41ad-8d2b-68b3b3303dd4 08fee2ea-5e6e-4032-9062-a5208ced4a3c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="91e38e17-04b1-4174-a200-899ca54224be" name="Out" connectedTo="129b7254-de08-4555-ba45-ffaeaac817db 4d2b3f47-812e-488b-b176-a3abf9a2f46a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_a9fd" id="a9fdfa02-e51d-41ef-bc2b-2e59f2933df4">
        <geometry xsi:type="esdl:Point" lon="4.304720163345338" lat="52.03907950206215" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="125e86b9-1b17-45cb-b4ae-eddbe3a4809d" name="In" connectedTo="caad53c5-4aa5-47ff-98c6-bdd1da60c36b b21a2b68-30a7-478b-a633-5a398f2a1834" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="a572f6a9-36cb-498c-b44d-b092d7288aa3" name="Out" connectedTo="47d38527-b3a2-4cb9-8336-023ad666841f 3f1c3554-4d86-42b3-ac2d-af6267f84a26" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe6" outerDiameter="0.56" length="826.7" innerDiameter="0.3938" id="Pipe6" state="OPTIONAL" related="Pipe6_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3101945519447336" lat="52.0443961581157"/>
          <point xsi:type="esdl:Point" lon="4.305803775787354" lat="52.0429386442008"/>
          <point xsi:type="esdl:Point" lon="4.303615093231202" lat="52.04064241331808"/>
          <point xsi:type="esdl:Point" lon="4.304720163345338" lat="52.03907950206215"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ec75d694-eb55-4409-880c-6c342f3abbfe" name="In" connectedTo="c709f60d-55ac-4791-8b4e-e8cd6733fc33" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="caad53c5-4aa5-47ff-98c6-bdd1da60c36b" name="Out" connectedTo="125e86b9-1b17-45cb-b4ae-eddbe3a4809d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="3e3ef2d7-1c21-44fa-b191-5fe640d6892e">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe7" outerDiameter="0.56" length="212.9" innerDiameter="0.3938" id="Pipe7" state="OPTIONAL" related="Pipe7_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.304720163345338" lat="52.03907950206215"/>
          <point xsi:type="esdl:Point" lon="4.305396080017091" lat="52.03721056814132"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="47d38527-b3a2-4cb9-8336-023ad666841f" name="In" connectedTo="a572f6a9-36cb-498c-b44d-b092d7288aa3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="3648f104-f01b-4bf3-a8c2-433043926a3a" name="Out" connectedTo="47fad4e7-aff2-4858-8e0b-b827e3cd4986" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="d3a85ffd-efde-488b-b855-3fa05404a597">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe8" outerDiameter="0.56" length="111.8" innerDiameter="0.3938" id="Pipe8" state="OPTIONAL" related="Pipe8_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.305396080017091" lat="52.03721056814132"/>
          <point xsi:type="esdl:Point" lon="4.305782318115235" lat="52.03623389944942"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="cef325c2-be23-452e-a81c-4e1496e4e7d4" name="In" connectedTo="32f70da1-9ba0-4948-88dd-d3a76a439e75" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="3462ee9c-1d29-4970-a03b-019dc46e0f3b" name="Out" connectedTo="46b318b8-4c66-4f46-9995-34803863a16b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="8939ef13-c7ba-492d-a1e7-ff558437dd9a">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe9" outerDiameter="0.56" length="387.2" innerDiameter="0.3938" id="Pipe9" state="OPTIONAL" related="Pipe9_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.305782318115235" lat="52.03623389944942"/>
          <point xsi:type="esdl:Point" lon="4.307069778442384" lat="52.034336566309356"/>
          <point xsi:type="esdl:Point" lon="4.308700561523438" lat="52.03470613481827"/>
          <point xsi:type="esdl:Point" lon="4.308958053588868" lat="52.03438608950049"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="5f744428-c765-473a-a226-9f64d27ac881" name="In" connectedTo="7fb2c2ec-9dff-4709-b221-9a6bcc1b205b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="621e16d5-311b-4c95-87ca-4f220bbbcf1e" name="Out" connectedTo="d90ca402-cd8d-429e-a04c-d5e817f99181" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="816b4563-f0b8-4d05-aa12-74ea573c366a">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe10" outerDiameter="0.56" length="214.0" innerDiameter="0.3938" id="Pipe10" state="OPTIONAL" related="Pipe10_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.308958053588868" lat="52.03438608950049"/>
          <point xsi:type="esdl:Point" lon="4.310138225555421" lat="52.03260420043414"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="170363ab-2815-4f4a-9d3b-0e9b223ba6cc" name="In" connectedTo="59de07d5-eb72-42f5-af24-0974da4122c9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="98cb1464-4bf2-48f5-9100-00faea463328" name="Out" connectedTo="fc4fc28b-3d67-4ea5-b18a-78f06b4a485e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="29fbf25c-b0c3-441b-bb36-45b77584edf3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe11" outerDiameter="0.56" length="99.1" innerDiameter="0.3938" id="Pipe11" state="OPTIONAL" related="Pipe11_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.310138225555421" lat="52.03260420043414"/>
          <point xsi:type="esdl:Point" lon="4.310760498046876" lat="52.031799027265784"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="dc272572-24e8-4732-9760-c72cd468ce81" name="In" connectedTo="9b977589-8e44-475a-a0ed-f4420d88e233" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="957a1d73-aa94-4ad7-93c9-e11689c8a828" name="Out" connectedTo="d0436b36-2700-440b-a0f9-869730642d19" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="d7bd5cc1-ea96-4e94-97ee-b3b1104c54ad">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe12" outerDiameter="0.56" length="74.3" innerDiameter="0.3938" id="Pipe12" state="OPTIONAL" related="Pipe12_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.310760498046876" lat="52.031799027265784"/>
          <point xsi:type="esdl:Point" lon="4.311296939849854" lat="52.0312182376185"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4e05723e-da3c-46eb-a06f-b5fba5f48e77" name="In" connectedTo="4af9fa7e-41ee-4e79-97c4-e0dd2b1419d5" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="2cfcc85a-c0dd-484d-984f-9a9a40436d78" name="Out" connectedTo="96fb6c73-14d6-4e0f-b18f-87b1f146a419" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="2204b61b-dd02-4977-bdde-228190566d18">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe13" outerDiameter="0.56" length="286.4" innerDiameter="0.3938" id="Pipe13" state="OPTIONAL" related="Pipe13_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.311296939849854" lat="52.0312182376185"/>
          <point xsi:type="esdl:Point" lon="4.313313961029054" lat="52.02896100622209"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="5c23cf16-c177-46e8-bd07-f6525567b205" name="In" connectedTo="ba5f246f-3f6a-4b80-ba1e-92b9c818e6d9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="eb254b90-29b7-4b12-a4f3-daf2c9f65026" name="Out" connectedTo="621b064d-fbc6-451f-8a99-8d109330d3ab" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="5e252139-9554-4f1a-8a9d-30a29586a3fd">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe15" outerDiameter="0.315" length="142.5" innerDiameter="0.2101" id="Pipe15" state="OPTIONAL" related="Pipe15_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.313313961029054" lat="52.02896100622209"/>
          <point xsi:type="esdl:Point" lon="4.3134427070617685" lat="52.02861392516555"/>
          <point xsi:type="esdl:Point" lon="4.313335418701173" lat="52.02832351059946"/>
          <point xsi:type="esdl:Point" lon="4.313099384307862" lat="52.028165101859365"/>
          <point xsi:type="esdl:Point" lon="4.312477111816407" lat="52.028010558913955"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9ee69b64-1da1-4651-9f39-362cb02bd308" name="In" connectedTo="bda0d0ea-4371-4e95-b38b-c7b0002e2d73" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="d46d9aa4-b8a3-41f7-a7a3-79175568753c" name="Out" connectedTo="ff808ae2-2e13-49e1-9054-da89bef0db88" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="11fdcd62-d6c9-486e-939e-a51193021f93">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe16" outerDiameter="0.315" length="250.5" innerDiameter="0.2101" id="Pipe16" state="OPTIONAL" related="Pipe16_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.312477111816407" lat="52.028010558913955"/>
          <point xsi:type="esdl:Point" lon="4.314301013946534" lat="52.02605679822976"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a40eada5-6329-4846-bce0-65cdfb1203c1" name="In" connectedTo="460ad9bd-ae51-47e2-b9a7-e08bc4c86fb9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="7b52d17c-6205-4141-aa5e-8334b834c2d7" name="Out" connectedTo="8312aa67-8f5f-4eb0-a8ad-07dc0c7f3649" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="6cd35c91-bece-4eab-b04f-001f5f0000c9">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe17" outerDiameter="0.315" length="164.5" innerDiameter="0.2101" id="Pipe17" state="OPTIONAL" related="Pipe17_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.314301013946534" lat="52.02605679822976"/>
          <point xsi:type="esdl:Point" lon="4.312777519226075" lat="52.02560377928665"/>
          <point xsi:type="esdl:Point" lon="4.312541484832765" lat="52.02601719409004"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d21ba8f2-b54b-4c84-b013-67b1a7feb953" name="In" connectedTo="e70641e4-96be-4c1b-9c04-b9257adda5d7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="b299f0e5-4a02-431b-adcc-27e0967c5f5a" name="Out" connectedTo="412c281b-228b-41f3-bdef-8bc997fd8e6b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="fbd97b94-bbe8-405b-9cf0-5e79123c7f30">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe19" outerDiameter="0.315" length="70.8" innerDiameter="0.2101" id="Pipe19" state="OPTIONAL" related="Pipe19_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.308958053588868" lat="52.03438608950049"/>
          <point xsi:type="esdl:Point" lon="4.309816360473634" lat="52.03474245879195"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="74b08f4f-d766-437b-a861-1af16ca2527d" name="In" connectedTo="59de07d5-eb72-42f5-af24-0974da4122c9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="f9aae992-24b9-4fb8-adbb-c8a0846c999d" name="Out" connectedTo="66455895-fbde-4174-a263-86f9586c2fc8" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="4b0da46a-893c-4746-8017-796453417db9">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe21" outerDiameter="0.315" length="571.4" innerDiameter="0.2101" id="Pipe21" state="OPTIONAL" related="Pipe21_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.305396080017091" lat="52.03721056814132"/>
          <point xsi:type="esdl:Point" lon="4.303593635559083" lat="52.036938447097874"/>
          <point xsi:type="esdl:Point" lon="4.3023061752319345" lat="52.036938447097874"/>
          <point xsi:type="esdl:Point" lon="4.300847053527833" lat="52.0373607862784"/>
          <point xsi:type="esdl:Point" lon="4.300374984741212" lat="52.03783591308721"/>
          <point xsi:type="esdl:Point" lon="4.297864437103272" lat="52.0372369642963"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="89801693-28b8-4a00-8635-a38a020bfc24" name="In" connectedTo="32f70da1-9ba0-4948-88dd-d3a76a439e75" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="f0e6c142-ec72-41ad-8d2b-68b3b3303dd4" name="Out" connectedTo="a7a34f2e-4ac0-40b4-9d15-ef4d784b5e1f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="f4033bcc-ceb8-4909-b054-9f4c023a08f5">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe22" outerDiameter="0.315" length="88.6" innerDiameter="0.2101" id="Pipe22" state="OPTIONAL" related="Pipe22_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.297864437103272" lat="52.0372369642963"/>
          <point xsi:type="esdl:Point" lon="4.296705722808839" lat="52.036880614888744"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="129b7254-de08-4555-ba45-ffaeaac817db" name="In" connectedTo="91e38e17-04b1-4174-a200-899ca54224be" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="589c1244-bdbf-42a0-a6cc-b99c18916900" name="Out" connectedTo="414973d8-31e5-4237-9ebf-b319c6ec404b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="43b30ec4-c3af-44e7-b7d6-8a187c2debe5">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe24" outerDiameter="0.315" length="69.4" innerDiameter="0.2101" id="Pipe24" state="OPTIONAL" related="Pipe24_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.320539832115174" lat="52.03287207234976"/>
          <point xsi:type="esdl:Point" lon="4.3213941156864175" lat="52.033208179577564"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ac87490f-88d5-43a5-89d8-300f719ebfec" name="In" connectedTo="4a82116b-fede-476f-9135-24d51f45f1b3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="27ad4ddb-4499-4264-b6d2-2c21b71e68c3" name="Out" connectedTo="504787dd-d2c9-44ed-afb3-88071b846d9b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="2e6036e6-23c1-42d8-bd99-6e18c4cdfa7d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe25" outerDiameter="0.5" length="410.3" innerDiameter="0.3127" id="Pipe25" state="OPTIONAL" related="Pipe25_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3182599544525155" lat="52.03766978308298"/>
          <point xsi:type="esdl:Point" lon="4.319493770599366" lat="52.0364477896304"/>
          <point xsi:type="esdl:Point" lon="4.3182599544525155" lat="52.035827464917006"/>
          <point xsi:type="esdl:Point" lon="4.319311380386353" lat="52.03473314368742"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c0ce56e8-260b-4dea-a690-86d623612ee9" name="In" connectedTo="39f0b02a-1dbf-42e7-99a6-143e5868754a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="b58b1d37-d79b-4e73-a9ba-3977125cbc31" name="Out" connectedTo="2d464b69-7340-4d13-b04e-8d642145a6fe" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="2668ac25-44a2-4305-bbbf-b10e6c7dd3c3"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.08245">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="4da97fd3-43ae-4cdd-bf85-5c00c0950dee"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="47a862f8-97be-4f97-aa8c-38c940278d33"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="56dc2574-68f0-470f-8fe2-262dd840453b">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7ffb929c-9640-436c-907a-556e790a6c7d" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b76702e2-0572-4647-bb32-4a94640d714c" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe26" outerDiameter="0.5" length="255.8" innerDiameter="0.3127" id="Pipe26" state="OPTIONAL" related="Pipe26_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.319311380386353" lat="52.03473314368742"/>
          <point xsi:type="esdl:Point" lon="4.320352077484132" lat="52.03360346408251"/>
          <point xsi:type="esdl:Point" lon="4.319922924041749" lat="52.03346487283161"/>
          <point xsi:type="esdl:Point" lon="4.320539832115174" lat="52.03287207234976"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d4a42b33-e4ca-4743-a240-9b3b0847ff60" name="In" connectedTo="72c1d1a9-8f49-4a26-b861-ec067835ef38" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="e4b21d04-196b-460f-a4ff-b3b7de3c9ccb" name="Out" connectedTo="b2547ccb-93f2-4c84-839d-0e34211aeece" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="2668ac25-44a2-4305-bbbf-b10e6c7dd3c3"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.08245">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="4da97fd3-43ae-4cdd-bf85-5c00c0950dee"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="47a862f8-97be-4f97-aa8c-38c940278d33"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="4963d088-f700-450b-be62-deb8d0a46d86">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7ffb929c-9640-436c-907a-556e790a6c7d" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b76702e2-0572-4647-bb32-4a94640d714c" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe27" outerDiameter="0.25" length="34.6" innerDiameter="0.1603" id="Pipe27" state="OPTIONAL" related="Pipe27_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.319311380386353" lat="52.03473314368742"/>
          <point xsi:type="esdl:Point" lon="4.319719076156617" lat="52.03491765821515"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c8146f79-e5f6-430a-97ce-253f14b77e21" name="In" connectedTo="72c1d1a9-8f49-4a26-b861-ec067835ef38" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="89bfd689-d399-42f9-a0c7-145a09816032" name="Out" connectedTo="8c696b24-1afb-4af2-ab02-4c911a43f9a2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="cfe1dc4e-9f41-401a-ad50-c745013e06ff">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe28" outerDiameter="0.25" length="22.8" innerDiameter="0.1603" id="Pipe28" state="OPTIONAL" related="Pipe28_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3182599544525155" lat="52.03766978308298"/>
          <point xsi:type="esdl:Point" lon="4.318581819534303" lat="52.037722645629316"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="767d00ad-0379-4618-ad42-322481c41a4a" name="In" connectedTo="39f0b02a-1dbf-42e7-99a6-143e5868754a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="eb08503b-b0a8-4713-b941-b626531b19e5" name="Out" connectedTo="bb93e16a-1131-425f-b438-0a1afd02b5b7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="c2f75df9-8e03-4655-81b9-fd4baa405c49">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe29" outerDiameter="0.56" length="23.0" innerDiameter="0.3938" id="Pipe29" state="OPTIONAL" related="Pipe29_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.317970275878907" lat="52.03756425102864"/>
          <point xsi:type="esdl:Point" lon="4.3182599544525155" lat="52.03766978308298"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="47b7daf3-d849-4176-8825-84e4f1b46b58" name="In" connectedTo="57581db4-cc0f-4260-8538-bf2599cdece2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="630b935b-252e-489c-a6a6-d4d56bf1668e" name="Out" connectedTo="0306fc7e-d183-4db6-86a6-f523ab77e17e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="4dc63595-f9f7-4924-8093-ad9cf754d32b">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe30" outerDiameter="0.5" length="39.5" innerDiameter="0.3127" id="Pipe30" state="OPTIONAL" related="Pipe30_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.316698908805848" lat="52.03879819320885"/>
          <point xsi:type="esdl:Point" lon="4.316178560256959" lat="52.038644953041"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c57ca1fe-b04f-41c6-abd1-1dd286045e4f" name="In" connectedTo="ba4ce072-68d5-4603-aa4d-7ecf059f5020" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="48b9c98f-4bc7-44fc-baee-1e9681c16c1f" name="Out" connectedTo="9da9e597-f6fb-4831-b124-6de0044f5a3e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="2668ac25-44a2-4305-bbbf-b10e6c7dd3c3"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.08245">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="4da97fd3-43ae-4cdd-bf85-5c00c0950dee"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="47a862f8-97be-4f97-aa8c-38c940278d33"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="0aaaffe8-f85e-46fb-8f3f-d556cfc46e56">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7ffb929c-9640-436c-907a-556e790a6c7d" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b76702e2-0572-4647-bb32-4a94640d714c" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe31" outerDiameter="0.25" length="21.6" innerDiameter="0.1603" id="Pipe31" state="OPTIONAL" related="Pipe31_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.312788248062135" lat="52.04164900734322"/>
          <point xsi:type="esdl:Point" lon="4.313077926635743" lat="52.04172687268464"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d9094d66-9b87-4773-bbb0-0d4473d07636" name="In" connectedTo="d9e086ab-5ad3-4235-98ad-0f109001a4d4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="e415e84f-84b0-4133-925f-50c1903f9eb8" name="Out" connectedTo="59a43508-4328-4e0a-94e1-fd6036172036" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="a3b3b0cc-c9c0-4448-909a-ed4a251108e1">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe32" outerDiameter="0.5" length="77.5" innerDiameter="0.3127" id="Pipe32" state="OPTIONAL" related="Pipe32_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.310760498046876" lat="52.031799027265784"/>
          <point xsi:type="esdl:Point" lon="4.3117690086364755" lat="52.03211581843917"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a17aca11-124a-4092-b206-b0b2c6d19666" name="In" connectedTo="4af9fa7e-41ee-4e79-97c4-e0dd2b1419d5" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="43b110a3-9963-4073-a743-de6aeb5a0d82" name="Out" connectedTo="e6383ee7-aa2a-4c42-97c7-d7c7cdd7937b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="2668ac25-44a2-4305-bbbf-b10e6c7dd3c3"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.08245">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="4da97fd3-43ae-4cdd-bf85-5c00c0950dee"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="47a862f8-97be-4f97-aa8c-38c940278d33"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="5f43418e-9e19-4fef-ac64-80e94fc29b8a">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7ffb929c-9640-436c-907a-556e790a6c7d" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b76702e2-0572-4647-bb32-4a94640d714c" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe33" outerDiameter="0.5" length="87.7" innerDiameter="0.3127" id="Pipe33" state="OPTIONAL" related="Pipe33_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.311296939849854" lat="52.0312182376185"/>
          <point xsi:type="esdl:Point" lon="4.310073852539063" lat="52.03098063967937"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="bb7a2d77-d43b-46fc-b78c-9ed1a6d4de6d" name="In" connectedTo="ba5f246f-3f6a-4b80-ba1e-92b9c818e6d9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="2dff1dbb-1a51-4e39-9555-7e16d38d7da1" name="Out" connectedTo="ec81162a-89f8-474f-82e4-760db081a5a1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="2668ac25-44a2-4305-bbbf-b10e6c7dd3c3"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.08245">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="4da97fd3-43ae-4cdd-bf85-5c00c0950dee"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="47a862f8-97be-4f97-aa8c-38c940278d33"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="59e145b3-f803-4ebd-825b-33bd0d2ecf34">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7ffb929c-9640-436c-907a-556e790a6c7d" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b76702e2-0572-4647-bb32-4a94640d714c" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe35" outerDiameter="0.25" length="124.2" innerDiameter="0.1603" id="Pipe35" state="OPTIONAL" related="Pipe35_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.314301013946534" lat="52.02605679822976"/>
          <point xsi:type="esdl:Point" lon="4.315352439880372" lat="52.025145894142554"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9c69135d-a0e5-4550-aa97-eb77b4d32306" name="In" connectedTo="e70641e4-96be-4c1b-9c04-b9257adda5d7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="ba89be56-23e3-4048-ae31-ded09be9d50b" name="Out" connectedTo="056aef7b-b808-46c6-baa1-010a0f4bf11a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="27fa6084-42c0-41ab-a35e-92238451267a">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe36" outerDiameter="0.25" length="42.8" innerDiameter="0.1603" id="Pipe36" state="OPTIONAL" related="Pipe36_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.297864437103272" lat="52.0372369642963"/>
          <point xsi:type="esdl:Point" lon="4.298100471496583" lat="52.036880614888744"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4d2b3f47-812e-488b-b176-a3abf9a2f46a" name="In" connectedTo="91e38e17-04b1-4174-a200-899ca54224be" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="b7c5f7da-761d-4d69-90c8-cc18e551c6b5" name="Out" connectedTo="856149d8-c74a-496e-a6fd-b9ed82e843af" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="ffff3613-fd49-4aef-847b-f6bfee4d37c2">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe37" outerDiameter="0.25" length="21.6" innerDiameter="0.1603" id="Pipe37" state="OPTIONAL" related="Pipe37_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.304720163345338" lat="52.03907950206215"/>
          <point xsi:type="esdl:Point" lon="4.30440902709961" lat="52.03904506381387"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="3f1c3554-4d86-42b3-ac2d-af6267f84a26" name="In" connectedTo="a572f6a9-36cb-498c-b44d-b092d7288aa3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="d2065857-7f90-4645-8e5b-af7b096dc84c" name="Out" connectedTo="49eb6e79-0f68-44c0-a9ca-3398028e5b5e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="db7a5d61-49b2-40ec-975e-8dff9f1088d2">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_HuisTeLande" id="0a70ec45-35ef-4d7d-a180-58eabd74ae5f" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.319053888320924" lat="52.04313255137357" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="dcb6b734-6182-4704-bf62-97c6bc0a6cea" name="In" connectedTo="878fc721-fcd7-45e7-a85e-de03b6c34cf0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="5.84" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="38ad48bb-6bb1-43a1-b78b-984cb7e1a123" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Huis Te Lande" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="3fc2139b-301d-4c12-8ec7-6a263075334c" name="Out" connectedTo="dc7d95d4-a8b1-4500-a48e-1f83b876b49a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Stationskwartier" id="5c1560f1-7f7b-4d98-826d-54543e15c87e" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.321918487548829" lat="52.03957592470637" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="799464bf-4173-450b-b2e4-0c143c0e4394" name="In" connectedTo="285dee2d-f174-4a51-8272-7f97c4606e6d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="4.81" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="540d94fb-bd7e-4b89-b6b4-d3b26da029c2" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Stationskwartier" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="0ecf3ec6-0c44-4231-a553-ca5173d09dfa" name="Out" connectedTo="d229c40e-ebfe-499f-94b2-f6d215b9d794" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_TeWerve_1" id="ca11a5d4-8c1f-4524-b41f-7c3e768ed1b6" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.324407577514649" lat="52.04157528352519" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="39af40d7-19ef-4aed-ba38-fd5d034b4cd7" name="In" connectedTo="e2ef19c1-e80c-4a2a-b13d-62bd6c2ad5ed" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="28d9df50-da78-47a0-b2f8-272bd64644c4" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Te Werve" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="b2a780bf-6ceb-4c2f-8242-42b3e8d6e1be" name="Out" connectedTo="89fa68ff-861e-4c57-a53b-c44cf7536af7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_TeWerve_2" id="d94b2641-6b91-4c7d-a3e3-9ec0e7cd1469" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.326370954513551" lat="52.0429015415213" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="c480062c-4cba-4b85-a992-db4f6136ffb4" name="In" connectedTo="eef6b3f9-b113-4b26-801b-0845350e6dbe" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="834bdeee-16be-4893-af7d-9460fbb39853" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Te Werve" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="8696c727-7e34-4217-b1c6-2b3638bbbb8f" name="Out" connectedTo="dd39438a-9e0a-4d27-a533-fa940877ff36" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_TeWerve_3" id="704fb7af-842f-4823-9ab8-b5a3402e2c58" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.328430891036988" lat="52.04429374016349" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="eb42ca4e-4b23-4096-bdb4-75f5f6e4d767" name="In" connectedTo="240f2f27-935f-4a2b-99b0-6fb92c41b68e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="d248ebbe-61fb-4444-8d4c-b37b115da7af" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Te Werve" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="e4f770db-2bcb-444c-9b76-7e894a06ab9b" name="Out" connectedTo="359cd445-80bc-484c-b4db-e2c988cc6176" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_TeWerve_4" id="5eb81d9e-6c44-408d-9b1a-6ea8135e94c9" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.330179691314698" lat="52.04642484175937" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="612572ec-f6f1-43e9-a5d3-d783cef32723" name="In" connectedTo="e481b04a-fffe-4181-913d-17c120558ed9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="d0fad1cf-b411-4289-8895-635de4ff449f" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Te Werve" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="483a6cd3-01b3-405f-924b-995cad603382" name="Out" connectedTo="3741698a-602c-4d08-9a22-f5b42d8eb53a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Rembrandtkwartier_1" id="68e28dbe-8780-4cad-8a21-039732ea6b04" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.334771633148194" lat="52.04959161616739" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="6bc62478-cdab-4c7c-bcb4-c236c475230a" name="In" connectedTo="9b7e34bb-1cc6-4f25-891d-cca582c3783c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="24b145e5-c510-4eff-9e7f-34b0f940b4f0" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Rembrandtkwartier" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="c735b1aa-e309-4945-8886-195af354f0ac" name="Out" connectedTo="c617234b-aa4d-420e-a4eb-615713be15d3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_fea2" id="fea26cb1-d772-493b-836c-20b9e3362c4a" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.337850809097291" lat="52.04850966015021" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="f470c680-16ff-449c-9c6d-58e59dd3b478" name="In" connectedTo="8cf61346-445d-44e1-bd5f-02b51b9af83c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="9.02" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="baa1cc77-6753-4837-86f6-d183830f192c" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Rembrandtkwartier" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="827b6304-b33d-4a73-83ec-2111e6a3c837" name="Out" connectedTo="08705ddf-393d-4827-aba5-e45902bd65bd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_2bbd" id="2bbdbeb9-abd4-4389-bb5d-4f10c5b7a0d7" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.337314367294312" lat="52.0511881131729" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="34ea2553-c243-4d3d-b607-9aecd7fdf690" name="In" connectedTo="be3c8912-b660-4c3b-8a34-c929386c2107" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="3f74d3ec-f91c-4960-9927-087a710541ed" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Rembrandtkwartier" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="a0c2f54d-b8af-44b3-9107-1ec0571d61ab" name="Out" connectedTo="3240dcc5-5056-409d-8d83-c8e3989139b4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_Rembrandtkwartier_2" id="39540a79-e5fc-4e6c-aee4-75357b5fba2f" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.332336187362672" lat="52.05197974342533" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="02fddd61-e3fb-4ed9-aa92-08694de98345" name="In" connectedTo="5802017c-c2da-48c5-88df-b23fc4090720" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="3.0" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="1330bedf-7b9b-40d3-95f1-e6ce8724d5ba" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Rembrandtkwartier" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="df8b4206-fbd9-4b20-b477-13129693dd70" name="Out" connectedTo="9f295aaf-a774-4a72-afcc-64d131904643" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:HeatingDemand" name="HeatingDemand_WelGelegen" id="54fbc660-8fa1-4215-a7ba-dd01b04a988f" power="11000000.0">
        <geometry xsi:type="esdl:Point" lon="4.3325185775756845" lat="52.054987810473264" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="3e8bbc50-eb90-4c5d-9035-f77f38b544c4" name="In" connectedTo="78aa70aa-e167-4cc8-93e9-d4c1ca8d52df" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75">
          <profile xsi:type="esdl:InfluxDBProfile" multiplier="9.02" startDate="2018-12-31T23:00:00.000000+0000" filters="" id="33aee60b-3e0c-4dc9-a968-48cd10537af5" measurement="Warmteprofielen_Rijswijk_normalized" database="energy_profiles" field="Rembrandtkwartier" host="wu-profiles.esdl-beta.hesi.energy" port="443" endDate="2019-12-31T22:00:00.000000+0000">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitReference" reference="e9405fc8-5e57-4df5-8584-4babee7cdf1b"/>
          </profile>
        </port>
        <port xsi:type="esdl:OutPort" id="8b9f02d3-cbb2-4584-b8f7-16e181318b58" name="Out" connectedTo="3b2d411f-d681-4539-a42f-4e6bc5df4f41" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_a7f5" id="a7f51bba-1d31-4707-a1ec-839046c04441">
        <geometry xsi:type="esdl:Point" lon="4.318453073501588" lat="52.042894338333426" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="034e5cc7-68f3-4c88-8be9-31902d03d441" name="In" connectedTo="ddf5f2e9-be69-42e8-b140-e2bed714c18a f039081a-6763-4917-bd96-9ec83518efaa" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="679d18da-f447-41dd-916f-e5d3b29d1184" name="Out" connectedTo="610382e7-e72b-4f11-b1af-6c51ec4611d7 14d9687b-c97e-4d19-ad3e-b0776928f0bd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1b08" id="1b080109-62f7-491c-adfd-386c1616cac2">
        <geometry xsi:type="esdl:Point" lon="4.321660995483399" lat="52.03995144351459" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="eede8573-c3f5-4156-baea-f8ef53a002a6" name="In" connectedTo="ced5dcbb-5dcb-47cd-816b-ad8a1bf3e5c8 b3330cdc-ce06-4264-9d30-b5fc3d2e657c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="4cac6a54-6b27-456e-8d17-f5910fb4744c" name="Out" connectedTo="dd138595-545f-4546-ad23-be3b0b811ebd f219ef2b-e6b8-404d-ad1f-610c680fae0a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_ae77" id="ae779c26-d5c1-4ff3-b405-bed65e4651b6">
        <geometry xsi:type="esdl:Point" lon="4.323420524597169" lat="52.04102040978031" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="0f1d6205-a978-46a7-8c51-3aa7e22d6ac3" name="In" connectedTo="7cf79d2a-59dc-4bd6-9d01-69932c059e64 c56dbff6-43d0-424e-82af-647304a719ef" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="3f8246ac-5bf4-4dff-b00d-f5e2e956c2b9" name="Out" connectedTo="7461f449-90e0-4338-b378-a435b9702ace 00fcc715-3f27-4296-ac99-519c7eaa8a2e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_a659" id="a659c876-1c54-4376-a15e-aff2fca735e3">
        <geometry xsi:type="esdl:Point" lon="4.327293634414674" lat="52.04235988080374" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="5de6a1ad-fd67-4b43-8fdf-70d74d6fd0bd" name="In" connectedTo="9bd8f8d0-fc4f-4c9c-bb21-304fb4b7b0c2 7f7fd672-8ea1-45cb-baf0-ac9821ea412f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="7fc22ee8-6e17-4a43-857c-d5d35bf111cb" name="Out" connectedTo="b5504e49-bf61-4362-817f-87b7ac726de9 5c60b4cd-ab2c-4ec2-a694-672ea9d24418" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_d25d" id="d25d304d-3642-4c67-9929-752bd0ef3497">
        <geometry xsi:type="esdl:Point" lon="4.32937502861023" lat="52.04362013462266" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="599d0c0b-c7e2-4314-bc5c-da112c9da4c1" name="In" connectedTo="a96941c6-8936-44f9-b823-e7bc445b3dec 7611d55e-8f95-482e-9014-c57e8f3e53dd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="b85c3b55-c290-4987-93b3-6c03bde6e8b4" name="Out" connectedTo="9a8757d1-ad73-4684-9296-60a54013b89f c73d289c-dda5-4d21-b03f-dc19eae8aaf1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_a80f" id="a80ffc0c-5c63-4122-9284-6582c2c81a09">
        <geometry xsi:type="esdl:Point" lon="4.3322181701660165" lat="52.04556653011963" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="45013b48-72c7-41fc-9bfe-edd02d2e380a" name="In" connectedTo="05fdb753-212b-4c7c-bc6b-bd1536f19337" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="c527ea3d-4e8b-40e6-883e-4c60cbcfbe67" name="Out" connectedTo="61d57ac4-ea0f-456c-9272-ae2e9b8118a6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4e62" id="4e621b56-23a9-400a-a334-3b84b5734e79">
        <geometry xsi:type="esdl:Point" lon="4.330555200576783" lat="52.04658258087284" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="90cc9947-a05b-41c5-8b9e-e678bf033c61" name="In" connectedTo="37c19345-8501-4de1-a138-999a8e0880f6 4880facf-4871-4773-a1ac-0e48df8eca65" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="aae35ef1-f784-489b-9e36-f0b903ca948d" name="Out" connectedTo="1502fc4c-0c2e-4889-b09b-777549e2739d 44631aef-3734-44e2-b2e3-738189062c62" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_31ec" id="31ec673d-7e80-4994-8de9-0c9269e1248c">
        <geometry xsi:type="esdl:Point" lon="4.334267377853394" lat="52.050039619503906" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="29b4f6b2-45e0-452d-82ed-0a1507fa40f0" name="In" connectedTo="93835c29-ca52-4ed0-beaa-75161e840249 a82e0ed6-fc80-4319-820c-7de68a337cd3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="a20b67c3-c88a-49a1-8428-01424efffc51" name="Out" connectedTo="cc22d0e4-4d26-48ee-ab92-1ca8b5571536 50a51359-11eb-42a0-b56c-3abedae163e1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1085" id="1085e540-3ee2-4724-a8bb-d747f38cef3d">
        <geometry xsi:type="esdl:Point" lon="4.336756467819215" lat="52.0507784938338" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="49caaf6b-e676-4e65-9ce5-027c2406c9b7" name="In" connectedTo="ea278421-bea3-4098-9add-271bdc3bae8d a84b4b4b-316c-44e9-8aaa-8af5b97c4506" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="d906ef7e-682b-484e-82ac-584a0115c91e" name="Out" connectedTo="5f245a7a-bb9c-4c6d-af8c-05a27a76f17c 566725ca-a91e-4c6c-b84e-b3809e241f82" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_cf81" id="cf81608a-f000-45e8-aa70-6068585ed016">
        <geometry xsi:type="esdl:Point" lon="4.334599971771241" lat="52.05278394828437" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="88ddaaa8-e23c-4135-92b3-a379f53f1a86" name="In" connectedTo="ead81158-fba7-4d8e-a6b0-d19ea45dd8fb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="9a8102ad-8172-41f1-9939-ff995a85d39e" name="Out" connectedTo="cf93b38e-49d4-41e0-8f2e-cae0e61e47bb 2e30acdb-3a7d-4c27-8917-127592c0c3a3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_6d6e" id="6d6e3237-3971-480d-b128-847a9dc8a58f">
        <geometry xsi:type="esdl:Point" lon="4.3359625339508066" lat="52.051490968223646" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="a26aefdd-b3f6-4f32-a185-ed07a8a47fe6" name="In" connectedTo="00d04a71-fa13-4bcc-919e-93a0ded8c13b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="022586f7-6c01-4622-ad59-cdd682be2e9b" name="Out" connectedTo="74f1cfd7-08c7-416e-a9d9-c77fb32e881d b58cd7f3-5157-4dae-b01c-030fa56958bd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe38" outerDiameter="0.56" length="785.2" innerDiameter="0.3938" id="Pipe38" state="OPTIONAL" related="Pipe38_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3101945519447336" lat="52.0443961581157"/>
          <point xsi:type="esdl:Point" lon="4.313077926635743" lat="52.04530641967745"/>
          <point xsi:type="esdl:Point" lon="4.31440830230713" lat="52.0446994137633"/>
          <point xsi:type="esdl:Point" lon="4.314751625061036" lat="52.04427714391706"/>
          <point xsi:type="esdl:Point" lon="4.31640386581421" lat="52.04488415556644"/>
          <point xsi:type="esdl:Point" lon="4.316725730895997" lat="52.0447917847603"/>
          <point xsi:type="esdl:Point" lon="4.318453073501588" lat="52.042894338333426"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="cea9d279-8464-4774-b382-34e7b3e69c5a" name="In" connectedTo="c709f60d-55ac-4791-8b4e-e8cd6733fc33" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="ddf5f2e9-be69-42e8-b140-e2bed714c18a" name="Out" connectedTo="034e5cc7-68f3-4c88-8be9-31902d03d441" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="c45789a4-72b8-45f7-bb23-e0391fcb2619">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe39" outerDiameter="0.56" length="397.3" innerDiameter="0.3938" id="Pipe39" state="OPTIONAL" related="Pipe39_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.318453073501588" lat="52.042894338333426"/>
          <point xsi:type="esdl:Point" lon="4.3196439743042" lat="52.041387127570374"/>
          <point xsi:type="esdl:Point" lon="4.321660995483399" lat="52.03995144351459"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="610382e7-e72b-4f11-b1af-6c51ec4611d7" name="In" connectedTo="679d18da-f447-41dd-916f-e5d3b29d1184" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="ced5dcbb-5dcb-47cd-816b-ad8a1bf3e5c8" name="Out" connectedTo="eede8573-c3f5-4156-baea-f8ef53a002a6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="ad9c8c29-7359-40d6-bf4a-cc0a9eb3d704">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe40" outerDiameter="0.56" length="169.1" innerDiameter="0.3938" id="Pipe40" state="OPTIONAL" related="Pipe40_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.321660995483399" lat="52.03995144351459"/>
          <point xsi:type="esdl:Point" lon="4.323420524597169" lat="52.04102040978031"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="dd138595-545f-4546-ad23-be3b0b811ebd" name="In" connectedTo="4cac6a54-6b27-456e-8d17-f5910fb4744c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="7cf79d2a-59dc-4bd6-9d01-69932c059e64" name="Out" connectedTo="0f1d6205-a978-46a7-8c51-3aa7e22d6ac3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="be97e60c-f70f-4bf8-a0eb-5e43589f278d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe41" outerDiameter="0.56" length="381.2" innerDiameter="0.3938" id="Pipe41" state="OPTIONAL" related="Pipe41_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.323420524597169" lat="52.04102040978031"/>
          <point xsi:type="esdl:Point" lon="4.324536323547364" lat="52.0404633386421"/>
          <point xsi:type="esdl:Point" lon="4.327293634414674" lat="52.04235988080374"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="7461f449-90e0-4338-b378-a435b9702ace" name="In" connectedTo="3f8246ac-5bf4-4dff-b00d-f5e2e956c2b9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="9bd8f8d0-fc4f-4c9c-bb21-304fb4b7b0c2" name="Out" connectedTo="5de6a1ad-fd67-4b43-8fdf-70d74d6fd0bd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="b487cdc6-72b9-4aae-986f-4232eaca1607">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe42" outerDiameter="0.56" length="200.5" innerDiameter="0.3938" id="Pipe42" state="OPTIONAL" related="Pipe42_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.327293634414674" lat="52.04235988080374"/>
          <point xsi:type="esdl:Point" lon="4.328269958496095" lat="52.04306309588502"/>
          <point xsi:type="esdl:Point" lon="4.32937502861023" lat="52.04362013462266"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="b5504e49-bf61-4362-817f-87b7ac726de9" name="In" connectedTo="7fc22ee8-6e17-4a43-857c-d5d35bf111cb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="a96941c6-8936-44f9-b823-e7bc445b3dec" name="Out" connectedTo="599d0c0b-c7e2-4314-bc5c-da112c9da4c1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="e216f2ac-9e4e-49a3-8150-302634fec259">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe43" outerDiameter="0.56" length="290.9" innerDiameter="0.3938" id="Pipe43" state="OPTIONAL" related="Pipe43_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.32937502861023" lat="52.04362013462266"/>
          <point xsi:type="esdl:Point" lon="4.3322181701660165" lat="52.04556653011963"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9a8757d1-ad73-4684-9296-60a54013b89f" name="In" connectedTo="b85c3b55-c290-4987-93b3-6c03bde6e8b4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="05fdb753-212b-4c7c-bc6b-bd1536f19337" name="Out" connectedTo="45013b48-72c7-41fc-9bfe-edd02d2e380a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="726183ce-1b2a-4a20-af24-d5162dcfa6c3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe45" outerDiameter="0.5" length="160.3" innerDiameter="0.3127" id="Pipe45" state="OPTIONAL" related="Pipe45_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3322181701660165" lat="52.04556653011963"/>
          <point xsi:type="esdl:Point" lon="4.330555200576783" lat="52.04658258087284"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="61d57ac4-ea0f-456c-9272-ae2e9b8118a6" name="In" connectedTo="c527ea3d-4e8b-40e6-883e-4c60cbcfbe67" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="37c19345-8501-4de1-a138-999a8e0880f6" name="Out" connectedTo="90cc9947-a05b-41c5-8b9e-e678bf033c61" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="2668ac25-44a2-4305-bbbf-b10e6c7dd3c3"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.08245">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="4da97fd3-43ae-4cdd-bf85-5c00c0950dee"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="47a862f8-97be-4f97-aa8c-38c940278d33"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="62916fdb-adc2-458d-85f0-6bd270df322c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7ffb929c-9640-436c-907a-556e790a6c7d" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b76702e2-0572-4647-bb32-4a94640d714c" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe46" outerDiameter="0.5" length="537.9" innerDiameter="0.3127" id="Pipe46" state="OPTIONAL" related="Pipe46_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.330555200576783" lat="52.04658258087284"/>
          <point xsi:type="esdl:Point" lon="4.329664707183839" lat="52.0472499812397"/>
          <point xsi:type="esdl:Point" lon="4.334267377853394" lat="52.050039619503906"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="1502fc4c-0c2e-4889-b09b-777549e2739d" name="In" connectedTo="aae35ef1-f784-489b-9e36-f0b903ca948d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="93835c29-ca52-4ed0-beaa-75161e840249" name="Out" connectedTo="29b4f6b2-45e0-452d-82ed-0a1507fa40f0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="2668ac25-44a2-4305-bbbf-b10e6c7dd3c3"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.08245">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="4da97fd3-43ae-4cdd-bf85-5c00c0950dee"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="47a862f8-97be-4f97-aa8c-38c940278d33"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="77327827-0d29-488b-ba05-ea97e8b31ea9">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7ffb929c-9640-436c-907a-556e790a6c7d" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b76702e2-0572-4647-bb32-4a94640d714c" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe47" outerDiameter="0.5" length="198.7" innerDiameter="0.3127" id="Pipe47" state="OPTIONAL" related="Pipe47_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.334267377853394" lat="52.050039619503906"/>
          <point xsi:type="esdl:Point" lon="4.3359625339508066" lat="52.051490968223646"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="cc22d0e4-4d26-48ee-ab92-1ca8b5571536" name="In" connectedTo="a20b67c3-c88a-49a1-8428-01424efffc51" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="00d04a71-fa13-4bcc-919e-93a0ded8c13b" name="Out" connectedTo="a26aefdd-b3f6-4f32-a185-ed07a8a47fe6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="2668ac25-44a2-4305-bbbf-b10e6c7dd3c3"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.08245">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="4da97fd3-43ae-4cdd-bf85-5c00c0950dee"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0056">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="47a862f8-97be-4f97-aa8c-38c940278d33"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="bec06fed-e5a4-414c-b965-94e025501d4d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="7ffb929c-9640-436c-907a-556e790a6c7d" value="1962.1">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="b76702e2-0572-4647-bb32-4a94640d714c" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe48" outerDiameter="0.315" length="96.0" innerDiameter="0.2101" id="Pipe48" state="OPTIONAL" related="Pipe48_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3359625339508066" lat="52.051490968223646"/>
          <point xsi:type="esdl:Point" lon="4.336756467819215" lat="52.0507784938338"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="74f1cfd7-08c7-416e-a9d9-c77fb32e881d" name="In" connectedTo="022586f7-6c01-4622-ad59-cdd682be2e9b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="ea278421-bea3-4098-9add-271bdc3bae8d" name="Out" connectedTo="49caaf6b-e676-4e65-9ce5-027c2406c9b7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="6f1ed545-6ab3-4e01-9f2f-c30981620af7">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe50" outerDiameter="0.315" length="171.3" innerDiameter="0.2101" id="Pipe50" state="OPTIONAL" related="Pipe50_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3359625339508066" lat="52.051490968223646"/>
          <point xsi:type="esdl:Point" lon="4.334599971771241" lat="52.05278394828437"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="b58cd7f3-5157-4dae-b01c-030fa56958bd" name="In" connectedTo="022586f7-6c01-4622-ad59-cdd682be2e9b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="ead81158-fba7-4d8e-a6b0-d19ea45dd8fb" name="Out" connectedTo="88ddaaa8-e23c-4135-92b3-a379f53f1a86" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="91b117c7-3243-43d0-88f4-e6466f9347d8">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe53" outerDiameter="0.315" length="60.6" innerDiameter="0.2101" id="Pipe53" state="OPTIONAL" related="Pipe53_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.334267377853394" lat="52.050039619503906"/>
          <point xsi:type="esdl:Point" lon="4.334771633148194" lat="52.04959161616739"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="50a51359-11eb-42a0-b56c-3abedae163e1" name="In" connectedTo="a20b67c3-c88a-49a1-8428-01424efffc51" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="9b7e34bb-1cc6-4f25-891d-cca582c3783c" name="Out" connectedTo="6bc62478-cdab-4c7c-bcb4-c236c475230a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="bcb3bfb8-6807-414b-98a4-a21ec6e4e59b">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe54" outerDiameter="0.25" length="31.1" innerDiameter="0.1603" id="Pipe54" state="OPTIONAL" related="Pipe54_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.330555200576783" lat="52.04658258087284"/>
          <point xsi:type="esdl:Point" lon="4.330179691314698" lat="52.04642484175937"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="44631aef-3734-44e2-b2e3-738189062c62" name="In" connectedTo="aae35ef1-f784-489b-9e36-f0b903ca948d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="e481b04a-fffe-4181-913d-17c120558ed9" name="Out" connectedTo="612572ec-f6f1-43e9-a5d3-d783cef32723" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="01afe7ef-b586-4d69-98d7-75f5f58d661b">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe55" outerDiameter="0.25" length="116.3" innerDiameter="0.1603" id="Pipe55" state="OPTIONAL" related="Pipe55_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.32937502861023" lat="52.04362013462266"/>
          <point xsi:type="esdl:Point" lon="4.328253865242005" lat="52.04417673408878"/>
          <point xsi:type="esdl:Point" lon="4.328430891036988" lat="52.04429374016349"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c73d289c-dda5-4d21-b03f-dc19eae8aaf1" name="In" connectedTo="b85c3b55-c290-4987-93b3-6c03bde6e8b4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="240f2f27-935f-4a2b-99b0-6fb92c41b68e" name="Out" connectedTo="eb42ca4e-4b23-4096-bdb4-75f5f6e4d767" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="6b65ac5a-5f72-4ab4-b774-3e46dfdbe94a">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe56" outerDiameter="0.25" length="87.2" innerDiameter="0.1603" id="Pipe56" state="OPTIONAL" related="Pipe56_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.327293634414674" lat="52.04235988080374"/>
          <point xsi:type="esdl:Point" lon="4.326370954513551" lat="52.0429015415213"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="5c60b4cd-ab2c-4ec2-a694-672ea9d24418" name="In" connectedTo="7fc22ee8-6e17-4a43-857c-d5d35bf111cb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="eef6b3f9-b113-4b26-801b-0845350e6dbe" name="Out" connectedTo="c480062c-4cba-4b85-a992-db4f6136ffb4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="e9d86ef5-e230-459d-a961-d8e215d5e346">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe57" outerDiameter="0.25" length="91.5" innerDiameter="0.1603" id="Pipe57" state="OPTIONAL" related="Pipe57_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.323420524597169" lat="52.04102040978031"/>
          <point xsi:type="esdl:Point" lon="4.324407577514649" lat="52.04157528352519"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="00fcc715-3f27-4296-ac99-519c7eaa8a2e" name="In" connectedTo="3f8246ac-5bf4-4dff-b00d-f5e2e956c2b9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="e2ef19c1-e80c-4a2a-b13d-62bd6c2ad5ed" name="Out" connectedTo="39af40d7-19ef-4aed-ba38-fd5d034b4cd7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="b8b054f1-dcac-4f32-b16d-70a572c82774">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe58" outerDiameter="0.25" length="45.3" innerDiameter="0.1603" id="Pipe58" state="OPTIONAL" related="Pipe58_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.321660995483399" lat="52.03995144351459"/>
          <point xsi:type="esdl:Point" lon="4.321918487548829" lat="52.03957592470637"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f219ef2b-e6b8-404d-ad1f-610c680fae0a" name="In" connectedTo="4cac6a54-6b27-456e-8d17-f5910fb4744c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="285dee2d-f174-4a51-8272-7f97c4606e6d" name="Out" connectedTo="799464bf-4173-450b-b2e4-0c143c0e4394" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="08743cc2-3cc9-4b7d-a25d-f8dfadacf57b">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe59" outerDiameter="0.25" length="48.9" innerDiameter="0.1603" id="Pipe59" state="OPTIONAL" related="Pipe59_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.318453073501588" lat="52.042894338333426"/>
          <point xsi:type="esdl:Point" lon="4.319053888320924" lat="52.04313255137357"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="14d9687b-c97e-4d19-ad3e-b0776928f0bd" name="In" connectedTo="679d18da-f447-41dd-916f-e5d3b29d1184" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="878fc721-fcd7-45e7-a85e-de03b6c34cf0" name="Out" connectedTo="dcb6b734-6182-4704-bf62-97c6bc0a6cea" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="72d9e8da-a018-4cc4-8b7e-2f1aaac5468b">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe61" outerDiameter="0.4" length="59.4" innerDiameter="0.263" id="Pipe61" state="OPTIONAL" related="Pipe61_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.336756467819215" lat="52.0507784938338"/>
          <point xsi:type="esdl:Point" lon="4.337314367294312" lat="52.0511881131729"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="566725ca-a91e-4c6c-b84e-b3809e241f82" name="In" connectedTo="d906ef7e-682b-484e-82ac-584a0115c91e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="be3c8912-b660-4c3b-8a34-c929386c2107" name="Out" connectedTo="34ea2553-c243-4d3d-b607-9aecd7fdf690" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.005">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="faac539b-4b7c-43f8-abcd-f08fa2652b7b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0587">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="d23b4eeb-a419-4c16-bc7e-280a76116f04"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0048">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="a2b91e8d-471d-4276-a8f6-4efb01054b4e"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="0804dd0e-b96d-42d0-86b9-ad2b389cd657">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="8dad1cd1-95ff-4c6e-b644-a1d38cfe4b1f" value="1630.7">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="eca952d5-fbd9-4efd-a72c-2eb773445f25" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer2" id="2dd4cc9f-9160-40b9-a399-7f41a85199dd" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.3102455139160165" lat="52.0280595479191" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="b9cc1676-2ae4-4c8f-8f2a-b5c30ddc2da1" name="Out" connectedTo="16982a7c-6dd9-4d28-9625-c237d10ba7ba" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="983b16dc-f1ed-47a3-8eef-7116cec4cb5d" name="In" connectedTo="0f8ad5ee-4492-4e07-bb07-e51f8289b390" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer3" id="cfb887f5-b4d4-4293-a8aa-a2f63ca34b2a" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.314386844635011" lat="52.03010586994853" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="875796b4-2494-412c-973d-4b701d1f8ce4" name="Out" connectedTo="2a2133bd-d390-4437-93be-a5395093432f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="af926335-28b7-49d3-bb8a-102f5349ec67" name="In" connectedTo="cec7a770-b845-44f2-a048-1dd075cf9bc2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer4" id="1c848227-ad3e-4363-be7d-32f83aef9121" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.3096661567688" lat="52.030759353062656" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="7e829ee4-d06c-4989-949a-80b2c4b526ff" name="Out" connectedTo="52fef504-660b-4412-a6c2-7e55e0ff40d4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="c57e0353-939f-42ff-b6c0-6be7af99e5fc" name="In" connectedTo="87141bc9-eff2-49db-be90-11d0e53ec3a6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer5" id="ba10e815-ff26-4ad0-adc9-f56db58ed3c8" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.299956560134889" lat="52.03015207613905" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="a1059252-2185-489a-b446-609114b8bf11" name="Out" connectedTo="c304fb04-593d-4bef-8e35-4f72f9d3251a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="49295fb9-e5b6-4217-82a3-1ccd76940098" name="In" connectedTo="d6caa807-0d17-4fd0-a983-5c1036159a78" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer6" id="302257e5-0f5a-40ae-a0c4-607954e73ba6" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.309451580047608" lat="52.034128930054116"/>
        <port xsi:type="esdl:OutPort" id="baa97c90-387b-4e15-8ef4-a8323e864b89" name="Out" connectedTo="1c232335-88f9-48e6-9391-7a9c62d24b97" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="9124da2f-9c41-4217-9ba2-db523680605a" name="In" connectedTo="42ed67c8-1ad9-4f54-a04e-50ae8c419bb2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer7" id="cc6869cf-df28-48f5-b6cf-567328d16d6b" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.304199814796449" lat="52.03538296830313"/>
        <port xsi:type="esdl:OutPort" id="5909bc15-6be7-4fbe-962d-bde77cd80556" name="Out" connectedTo="07af7b95-0734-4c10-85ed-2137da51b226" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="ed240007-6411-4983-b2ae-10eeb9d4c735" name="In" connectedTo="1adbcc35-d2b4-4115-b635-ed074a43dc7f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer8" id="19e16a55-bbfc-4704-8dd2-f7a6e555959f" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.2971616983413705" lat="52.03785794057299"/>
        <port xsi:type="esdl:OutPort" id="b780bbf5-40ad-4116-b54c-627af1bf664d" name="Out" connectedTo="716a7cf3-1326-4eb0-8f45-3d40bdecfdbb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="1a6bbd6f-acb3-4ec3-93f0-690c1ed4cc71" name="In" connectedTo="d080f436-4bd8-4cc7-bc75-c38ce217ac88" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer9" id="f4634bd3-56a7-4b70-9a97-5dd9d2534cc3" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.304840862751008" lat="52.03965468459409"/>
        <port xsi:type="esdl:OutPort" id="04b35e4e-fb03-42d5-b923-8a5e0269caa4" name="Out" connectedTo="11750784-fe1d-417c-946b-26e499eae225" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="88741a34-59fa-455e-828d-a0144a9178bd" name="In" connectedTo="2af09cda-994d-426f-8b34-9377f3427944" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe66" outerDiameter="0.56" length="57.9" innerDiameter="0.3938" id="Pipe66" state="OPTIONAL" related="Pipe66_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.304966926574708" lat="52.03957714065919"/>
          <point xsi:type="esdl:Point" lon="4.304720163345338" lat="52.03907950206215"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="11750784-fe1d-417c-946b-26e499eae225" name="In" connectedTo="04b35e4e-fb03-42d5-b923-8a5e0269caa4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="b21a2b68-30a7-478b-a633-5a398f2a1834" name="Out" connectedTo="125e86b9-1b17-45cb-b4ae-eddbe3a4809d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="01fbf590-84aa-49d7-b27c-d53f8326bf29">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe67" outerDiameter="0.56" length="55.3" innerDiameter="0.3938" id="Pipe67" state="OPTIONAL" related="Pipe67_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.29741382598877" lat="52.03765004817369"/>
          <point xsi:type="esdl:Point" lon="4.297864437103272" lat="52.0372369642963"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="716a7cf3-1326-4eb0-8f45-3d40bdecfdbb" name="In" connectedTo="b780bbf5-40ad-4116-b54c-627af1bf664d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="08fee2ea-5e6e-4032-9062-a5208ced4a3c" name="Out" connectedTo="a7a34f2e-4ac0-40b4-9d15-ef4d784b5e1f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="2b01912e-7c94-46ed-a65a-e74531fec962">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe20_a" outerDiameter="0.315" length="115.61" innerDiameter="0.2101" id="Pipe20_a" state="OPTIONAL" related="Pipe20_a_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.305782318115235" lat="52.03623389944942"/>
          <point xsi:type="esdl:Point" lon="4.304210543632508" lat="52.03585157356818"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c4747870-0077-46b4-803f-8d8111839843" name="In" connectedTo="7fb2c2ec-9dff-4709-b221-9a6bcc1b205b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="4dfb863d-e5c8-4acb-8085-ce515352a87b" name="Out" connectedTo="29e66021-7a5c-4d0a-8aea-0bc3f98033fd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="ea2dfb8b-c135-49ba-8153-ed52def11b0a">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe20_b" outerDiameter="0.315" length="31.29" innerDiameter="0.2101" id="Pipe20_b" state="OPTIONAL" related="Pipe20_b_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.304210543632508" lat="52.03585157356818"/>
          <point xsi:type="esdl:Point" lon="4.303786754608155" lat="52.035745557102025"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ca1a3430-182c-40a6-a952-5765d848daf4" name="In" connectedTo="afb35818-0d1a-49e2-ac7b-18794b38fecd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="00f6e2a9-bd19-43ec-965b-fae9fcc33bdb" name="Out" connectedTo="70dc27c6-6a93-4801-b83e-140394796527" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="ea2dfb8b-c135-49ba-8153-ed52def11b0a">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_824f" id="824fc703-5685-49d1-8f23-1e1568b11f2c">
        <geometry xsi:type="esdl:Point" lon="4.304210543632508" lat="52.03585157356818"/>
        <port xsi:type="esdl:InPort" id="29e66021-7a5c-4d0a-8aea-0bc3f98033fd" name="In" connectedTo="4dfb863d-e5c8-4acb-8085-ce515352a87b 8763a794-0f1b-46ce-b379-8071ab326346" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="afb35818-0d1a-49e2-ac7b-18794b38fecd" name="Out" connectedTo="ca1a3430-182c-40a6-a952-5765d848daf4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe69" outerDiameter="0.56" length="38.9" innerDiameter="0.3938" id="Pipe69" state="OPTIONAL" related="Pipe69_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.304301738739015" lat="52.03550672017082"/>
          <point xsi:type="esdl:Point" lon="4.304210543632508" lat="52.03585157356818"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="07af7b95-0734-4c10-85ed-2137da51b226" name="In" connectedTo="5909bc15-6be7-4fbe-962d-bde77cd80556" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="8763a794-0f1b-46ce-b379-8071ab326346" name="Out" connectedTo="29e66021-7a5c-4d0a-8aea-0bc3f98033fd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="01bcbae8-dc80-4130-9c1a-f496dd711b36">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe71" outerDiameter="0.56" length="43.1" innerDiameter="0.3938" id="Pipe71" state="OPTIONAL" related="Pipe71_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.309542775154115" lat="52.0342411349092"/>
          <point xsi:type="esdl:Point" lon="4.308958053588868" lat="52.03438608950049"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="1c232335-88f9-48e6-9391-7a9c62d24b97" name="In" connectedTo="baa97c90-387b-4e15-8ef4-a8323e864b89" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="0e1a3e0d-166b-4639-8723-3a1b9f416fec" name="Out" connectedTo="d90ca402-cd8d-429e-a04c-d5e817f99181" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="a9efd229-3f7b-477c-aa93-e35383f3a9e4">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe14_a" outerDiameter="0.315" length="721.48" innerDiameter="0.2101" id="Pipe14_a" state="OPTIONAL" related="Pipe14_a_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.310138225555421" lat="52.03260420043414"/>
          <point xsi:type="esdl:Point" lon="4.303561449050904" lat="52.03077239626749"/>
          <point xsi:type="esdl:Point" lon="4.300289154052735" lat="52.03040290891157"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="25717110-9674-418f-a506-055fe48c695f" name="In" connectedTo="9b977589-8e44-475a-a0ed-f4420d88e233" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="d1efeaaa-918a-461b-bbfe-9175bb377b7b" name="Out" connectedTo="017e5ea5-8c44-49c5-84b6-c2c692894357" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="02a46818-1ec5-4ab4-9570-e664c50e6cc5">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe14_b" outerDiameter="0.315" length="62.56" innerDiameter="0.2101" id="Pipe14_b" state="OPTIONAL" related="Pipe14_b_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.300289154052735" lat="52.03040290891157"/>
          <point xsi:type="esdl:Point" lon="4.299387931823731" lat="52.03030743866227"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="1ece7e67-6fa4-4043-b78d-2f8a66a1ffe7" name="In" connectedTo="3f54f5e4-895e-4f71-b94a-bc861965ca6b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="d1611125-9f5a-4f97-9786-1e9fd114730a" name="Out" connectedTo="fd0f353b-455a-4f90-b8c2-b5643121a8e3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="02a46818-1ec5-4ab4-9570-e664c50e6cc5">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_c553" id="c5538e17-2a9b-4914-996f-7f64a4f79958">
        <geometry xsi:type="esdl:Point" lon="4.300289154052735" lat="52.03040290891157"/>
        <port xsi:type="esdl:InPort" id="017e5ea5-8c44-49c5-84b6-c2c692894357" name="In" connectedTo="d1efeaaa-918a-461b-bbfe-9175bb377b7b 4a2aea50-5ff6-42d8-8e2f-1fd6c28757d7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="3f54f5e4-895e-4f71-b94a-bc861965ca6b" name="Out" connectedTo="1ece7e67-6fa4-4043-b78d-2f8a66a1ffe7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe73" outerDiameter="0.56" length="36.0" innerDiameter="0.3938" id="Pipe73" state="OPTIONAL" related="Pipe73_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.299956560134889" lat="52.03015207613905"/>
          <point xsi:type="esdl:Point" lon="4.300289154052735" lat="52.03040290891157"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c304fb04-593d-4bef-8e35-4f72f9d3251a" name="In" connectedTo="a1059252-2185-489a-b446-609114b8bf11" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="4a2aea50-5ff6-42d8-8e2f-1fd6c28757d7" name="Out" connectedTo="017e5ea5-8c44-49c5-84b6-c2c692894357" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="044fd2be-aa16-4f7b-92cc-d96cc6ea3aa2">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer10" id="b8ec1d77-e9e2-4cce-9599-9a07d2d36373" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.31166708469391" lat="52.03154484032849" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="048442b5-b987-405f-91de-042ad374e432" name="Out" connectedTo="57df0793-8665-4d90-af15-f4b9447204f5" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="1de51e8b-def4-4443-8ce4-b9eb14dc8e8a" name="In" connectedTo="7cc1c74d-db40-45ab-ad50-5ed0b697f795" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe76" outerDiameter="0.56" length="68.2" innerDiameter="0.3938" id="Pipe76" state="OPTIONAL" related="Pipe76_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.31166708469391" lat="52.03154484032849"/>
          <point xsi:type="esdl:Point" lon="4.310760498046876" lat="52.031799027265784"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="57df0793-8665-4d90-af15-f4b9447204f5" name="In" connectedTo="048442b5-b987-405f-91de-042ad374e432" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="39b5089e-627f-48b2-a419-6c0a3f24d00a" name="Out" connectedTo="d0436b36-2700-440b-a0f9-869730642d19" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="feb16ff9-1c02-435c-b11a-dbf474c83c8f">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe78" outerDiameter="0.56" length="122.7" innerDiameter="0.3938" id="Pipe78" state="OPTIONAL" related="Pipe78_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3096661567688" lat="52.030759353062656"/>
          <point xsi:type="esdl:Point" lon="4.311296939849854" lat="52.0312182376185"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="52fef504-660b-4412-a6c2-7e55e0ff40d4" name="In" connectedTo="7e829ee4-d06c-4989-949a-80b2c4b526ff" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="008df1e4-53f0-4122-ad6b-901857d7a052" name="Out" connectedTo="96fb6c73-14d6-4e0f-b18f-87b1f146a419" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="e33ca196-f70b-44a9-973d-3fbbdcd7d8f0">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer11" id="bae40abf-8612-4b71-a847-829073d89ac4" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.3146550655365" lat="52.02650824140003" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="5851a97b-a795-469f-8ef9-100e8fadd8d9" name="Out" connectedTo="f1449c57-1d0e-407b-804a-1552351713a9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="f4cb60f0-0db8-44ca-9e7e-f3952e867f4b" name="In" connectedTo="da69fa88-7382-4cd7-9252-e7569aa71709" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe60_a" outerDiameter="0.4" length="120.04" innerDiameter="0.263" id="Pipe60_a" state="OPTIONAL" related="Pipe60_a_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.313313961029054" lat="52.02896100622209"/>
          <point xsi:type="esdl:Point" lon="4.3142902851104745" lat="52.02924683664851"/>
          <point xsi:type="esdl:Point" lon="4.314107894897462" lat="52.02945144288258"/>
          <point xsi:type="esdl:Point" lon="4.314236640930177" lat="52.02958344640772"/>
          <point xsi:type="esdl:Point" lon="4.314279556274415" lat="52.02957779580883"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="7178dbd9-04d5-46cc-83f7-42a255a66eed" name="In" connectedTo="bda0d0ea-4371-4e95-b38b-c7b0002e2d73" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="a468aff1-0ff1-49a5-83eb-52542719efce" name="Out" connectedTo="5a4152c3-c720-478b-8f1b-41d9a9f37397" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.005">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="faac539b-4b7c-43f8-abcd-f08fa2652b7b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0587">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="d23b4eeb-a419-4c16-bc7e-280a76116f04"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0048">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="a2b91e8d-471d-4276-a8f6-4efb01054b4e"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="d0cf8bf4-c920-40a5-ab34-ab8672a744d8">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="8dad1cd1-95ff-4c6e-b644-a1d38cfe4b1f" value="1630.7">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="eca952d5-fbd9-4efd-a72c-2eb773445f25" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe60_b" outerDiameter="0.4" length="35.24" innerDiameter="0.263" id="Pipe60_b" state="OPTIONAL" related="Pipe60_b_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.314279556274415" lat="52.02957779580883"/>
          <point xsi:type="esdl:Point" lon="4.314708709716798" lat="52.029753030214444"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="82343f0c-b845-446a-80fe-3bb9ce2c0989" name="In" connectedTo="5918b541-ae92-4799-968c-cfea926b766d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="2218f77f-a63c-425a-8900-179dfdb53706" name="Out" connectedTo="d937e02c-ce60-4352-90a2-ad6420f3147e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.005">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="faac539b-4b7c-43f8-abcd-f08fa2652b7b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0587">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="d23b4eeb-a419-4c16-bc7e-280a76116f04"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0048">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="a2b91e8d-471d-4276-a8f6-4efb01054b4e"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="d0cf8bf4-c920-40a5-ab34-ab8672a744d8">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="8dad1cd1-95ff-4c6e-b644-a1d38cfe4b1f" value="1630.7">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="eca952d5-fbd9-4efd-a72c-2eb773445f25" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4bae" id="4bae0ca9-ead6-4b3e-b29e-ddcd81293db6">
        <geometry xsi:type="esdl:Point" lon="4.314279556274415" lat="52.02957779580883"/>
        <port xsi:type="esdl:InPort" id="5a4152c3-c720-478b-8f1b-41d9a9f37397" name="In" connectedTo="a468aff1-0ff1-49a5-83eb-52542719efce c788bfe6-2428-44e4-b09a-960613f8da9c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="5918b541-ae92-4799-968c-cfea926b766d" name="Out" connectedTo="82343f0c-b845-446a-80fe-3bb9ce2c0989" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe34_a" outerDiameter="0.25" length="165.61" innerDiameter="0.1603" id="Pipe34_a" state="OPTIONAL" related="Pipe34_a_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.312477111816407" lat="52.028010558913955"/>
          <point xsi:type="esdl:Point" lon="4.310722947120667" lat="52.02740281078387"/>
          <point xsi:type="esdl:Point" lon="4.310342073440553" lat="52.02749184198936"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ba5d2033-f0b4-414e-b39c-0e72e122b747" name="In" connectedTo="460ad9bd-ae51-47e2-b9a7-e08bc4c86fb9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="8272bbb1-5648-4bdf-9355-4aa5918b70e9" name="Out" connectedTo="82c301a9-3a78-46c6-9ccc-eddd1d8f7eea" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="b33c5685-8c2c-4c89-9041-28615d7b6cd3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe34_b" outerDiameter="0.25" length="48.65" innerDiameter="0.1603" id="Pipe34_b" state="OPTIONAL" related="Pipe34_b_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.310342073440553" lat="52.02749184198936"/>
          <point xsi:type="esdl:Point" lon="4.3096661567688" lat="52.027627734152475"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4a55e313-5c67-4414-b33e-9341364a3c1c" name="In" connectedTo="5e82e025-ebf3-4252-816b-ebe9b272bddb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="e1a13ea4-f7eb-4fb4-afe8-283e388d19b1" name="Out" connectedTo="fc31e841-4b59-467b-a070-ba95631e977b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.004">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="fa85538e-ebfa-4bce-8386-04980e793e18"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.03725">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="3bafa031-f40f-42fc-b409-e35fffe5f457"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0036">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="893337e3-58f1-4fb4-8c25-68d71b11fb71"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="b33c5685-8c2c-4c89-9041-28615d7b6cd3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="234f7d03-69a7-429a-b44f-f57c522345f1" value="1126.4">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a5eefd42-c8e8-4dd6-b0dc-53ed92ead8a5" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1817" id="18175367-cea8-4443-9219-b767d7b8cfee">
        <geometry xsi:type="esdl:Point" lon="4.310342073440553" lat="52.02749184198936"/>
        <port xsi:type="esdl:InPort" id="82c301a9-3a78-46c6-9ccc-eddd1d8f7eea" name="In" connectedTo="8272bbb1-5648-4bdf-9355-4aa5918b70e9 79485ed3-8bb1-4fc2-a45a-c22c5c69db97" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="5e82e025-ebf3-4252-816b-ebe9b272bddb" name="Out" connectedTo="4a55e313-5c67-4414-b33e-9341364a3c1c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe81" outerDiameter="0.56" length="63.5" innerDiameter="0.3938" id="Pipe81" state="OPTIONAL" related="Pipe81_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3102455139160165" lat="52.0280595479191"/>
          <point xsi:type="esdl:Point" lon="4.310342073440553" lat="52.02749184198936"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="16982a7c-6dd9-4d28-9625-c237d10ba7ba" name="In" connectedTo="b9cc1676-2ae4-4c8f-8f2a-b5c30ddc2da1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="79485ed3-8bb1-4fc2-a45a-c22c5c69db97" name="Out" connectedTo="82c301a9-3a78-46c6-9ccc-eddd1d8f7eea" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="f08d1569-902e-4b6f-a148-3ea56a7785bb">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe80" outerDiameter="0.56" length="59.2" innerDiameter="0.3938" id="Pipe80" state="OPTIONAL" related="Pipe80_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.314386844635011" lat="52.03010586994853"/>
          <point xsi:type="esdl:Point" lon="4.314279556274415" lat="52.02957779580883"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="2a2133bd-d390-4437-93be-a5395093432f" name="In" connectedTo="875796b4-2494-412c-973d-4b701d1f8ce4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="c788bfe6-2428-44e4-b09a-960613f8da9c" name="Out" connectedTo="5a4152c3-c720-478b-8f1b-41d9a9f37397" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="20ebe898-ee82-45b1-928e-885dd9c320a8">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe84" outerDiameter="0.56" length="55.7" innerDiameter="0.3938" id="Pipe84" state="OPTIONAL" related="Pipe84_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3146550655365" lat="52.02650824140003"/>
          <point xsi:type="esdl:Point" lon="4.314301013946534" lat="52.02605679822976"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f1449c57-1d0e-407b-804a-1552351713a9" name="In" connectedTo="5851a97b-a795-469f-8ef9-100e8fadd8d9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="6a434cd0-16d6-4138-ba03-c8d397f4e0dd" name="Out" connectedTo="8312aa67-8f5f-4eb0-a8ad-07dc0c7f3649" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="cab30504-99a1-47c7-82e0-c852cde7fb80">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer12" id="94cae62b-ba21-49e3-bce5-e39d59549f5f" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.323420524597169" lat="52.03217850067201" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="9fc6944d-648c-4294-9784-156f8156dd5f" name="Out" connectedTo="625c9e58-0600-4305-9486-f4b31b6a001e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="74f2d395-2b58-4f92-8253-5996a7e1eada" name="In" connectedTo="b47dfdc3-f363-4220-82d6-a9e73bb84f13" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer13" id="6ffee8fb-e57c-4db4-8a3c-5f5a823df922" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.32039499282837" lat="52.03238971879093" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="0e5966f7-a348-49b8-9c57-5c79356bd22f" name="Out" connectedTo="9972a975-06e2-4452-89c0-2b428b97380c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="d9838289-335e-4070-a7fa-12423f2c62de" name="In" connectedTo="79fffb1a-d928-48ab-99f2-25e0f5fe9af0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer14" id="11f14150-e21c-4ef9-8bb9-8ac66ca15e62" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.319128990173341" lat="52.03433023856414" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="7ad6ccee-4f96-44bb-aba0-7a6d719bd538" name="Out" connectedTo="d7f08ab0-2d0e-4ee4-bf34-7e30a6625122" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="b25eaf74-e967-4ca2-b8dc-0f5e2df6f719" name="In" connectedTo="c44e43f9-9508-4a85-8d9c-c23f9ffd7083" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer15" id="44c23c96-2733-4ab3-8dbf-8a3e757f2d05" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.316875934600831" lat="52.039451750181925" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="7f48a3f7-45d9-4fef-bef3-ed371083a026" name="Out" connectedTo="01bccc70-3665-4c0b-9494-a89ee374d1b1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="88e26467-fe6f-48f2-ae81-a0fe0a44f184" name="In" connectedTo="a2e00dd2-85d1-4ad5-a8f7-c2258fb36c47" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer16" id="1836c3d1-4b8b-48cb-96d4-20e0e7b3d7a0" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.312541484832765" lat="52.04131277271331" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="a62b4690-0b57-4cbe-bce8-2642b14b2ab7" name="Out" connectedTo="d332e890-d425-4cbb-b7d8-d6b51922d397" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="ca759595-c15b-44fe-9e33-2e2ccfd2d459" name="In" connectedTo="e1bf78da-811b-4b3f-a3e1-6681a3dd7a77" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe86" outerDiameter="0.56" length="41.0" innerDiameter="0.3938" id="Pipe86" state="OPTIONAL" related="Pipe86_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.312541484832765" lat="52.04131277271331"/>
          <point xsi:type="esdl:Point" lon="4.312788248062135" lat="52.04164900734322"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d332e890-d425-4cbb-b7d8-d6b51922d397" name="In" connectedTo="a62b4690-0b57-4cbe-bce8-2642b14b2ab7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="5e043cfa-f07b-4f73-a9d2-e76a21840101" name="Out" connectedTo="57dd5638-d1ba-4ed9-8efe-f1da25ea2f52" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="cebfec93-245c-46b8-b9d7-68f7ef772f7c">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe88" outerDiameter="0.56" length="73.7" innerDiameter="0.3938" id="Pipe88" state="OPTIONAL" related="Pipe88_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.316875934600831" lat="52.039451750181925"/>
          <point xsi:type="esdl:Point" lon="4.316698908805848" lat="52.03879819320885"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="01bccc70-3665-4c0b-9494-a89ee374d1b1" name="In" connectedTo="7f48a3f7-45d9-4fef-bef3-ed371083a026" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="03764218-27f8-4596-a02c-ec0365d0890f" name="Out" connectedTo="b36fcc81-7a66-4b77-9108-48ee1ed0fda6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="f265e487-11a8-4c5d-8639-00c91205008b">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe90" outerDiameter="0.56" length="46.5" innerDiameter="0.3938" id="Pipe90" state="OPTIONAL" related="Pipe90_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.319128990173341" lat="52.03433023856414"/>
          <point xsi:type="esdl:Point" lon="4.319311380386353" lat="52.03473314368742"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d7f08ab0-2d0e-4ee4-bf34-7e30a6625122" name="In" connectedTo="7ad6ccee-4f96-44bb-aba0-7a6d719bd538" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="16cfc909-805a-4d30-bcbf-a0e703a6fef6" name="Out" connectedTo="2d464b69-7340-4d13-b04e-8d642145a6fe" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="2ff731ab-5a28-4dbd-8ce3-be6264f06bc5">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe92" outerDiameter="0.56" length="54.5" innerDiameter="0.3938" id="Pipe92" state="OPTIONAL" related="Pipe92_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.32039499282837" lat="52.03238971879093"/>
          <point xsi:type="esdl:Point" lon="4.320539832115174" lat="52.03287207234976"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9972a975-06e2-4452-89c0-2b428b97380c" name="In" connectedTo="0e5966f7-a348-49b8-9c57-5c79356bd22f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="27795ecb-87b0-47e2-b93e-1dc3964d0352" name="Out" connectedTo="b2547ccb-93f2-4c84-839d-0e34211aeece" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="f23c6b40-dccb-46df-b836-5225a1215cd1">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe23_a" outerDiameter="0.315" length="376.75" innerDiameter="0.2101" id="Pipe23_a" state="OPTIONAL" related="Pipe23_a_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.320539832115174" lat="52.03287207234976"/>
          <point xsi:type="esdl:Point" lon="4.322347640991212" lat="52.03092116196779"/>
          <point xsi:type="esdl:Point" lon="4.3238282203674325" lat="52.031610847033264"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c1318085-1ced-470d-b53e-6ac138f43364" name="In" connectedTo="4a82116b-fede-476f-9135-24d51f45f1b3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="49ac8cea-691e-47b6-a7d3-e1b5de85f30c" name="Out" connectedTo="1073ff1b-9db1-4005-9c55-62655c11858c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="9b4da3dd-45dc-45f4-b8e7-949f80c105bc">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe23_b" outerDiameter="0.315" length="39.78" innerDiameter="0.2101" id="Pipe23_b" state="OPTIONAL" related="Pipe23_b_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3238282203674325" lat="52.031610847033264"/>
          <point xsi:type="esdl:Point" lon="4.324289560317994" lat="52.03182866846768"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="2a283272-bf19-4813-a9ca-9febca262907" name="In" connectedTo="e99fd6b4-da2d-47bd-8a96-78aa58d72ea8" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="6bfc5f80-e091-40d1-bc29-9d71281d5251" name="Out" connectedTo="0148e3f8-6850-4ab4-a3d3-3e49ebd7e137" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="9b4da3dd-45dc-45f4-b8e7-949f80c105bc">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_e143" id="e14383da-75cf-4815-9d48-18b724f3c9ec">
        <geometry xsi:type="esdl:Point" lon="4.3238282203674325" lat="52.031610847033264"/>
        <port xsi:type="esdl:InPort" id="1073ff1b-9db1-4005-9c55-62655c11858c" name="In" connectedTo="49ac8cea-691e-47b6-a7d3-e1b5de85f30c be5b79db-2172-49c1-a4ba-ecb58ed60542" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="e99fd6b4-da2d-47bd-8a96-78aa58d72ea8" name="Out" connectedTo="2a283272-bf19-4813-a9ca-9febca262907" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe94" outerDiameter="0.56" length="69.0" innerDiameter="0.3938" id="Pipe94" state="OPTIONAL" related="Pipe94_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.323420524597169" lat="52.03217850067201"/>
          <point xsi:type="esdl:Point" lon="4.3238282203674325" lat="52.031610847033264"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="625c9e58-0600-4305-9486-f4b31b6a001e" name="In" connectedTo="9fc6944d-648c-4294-9784-156f8156dd5f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="be5b79db-2172-49c1-a4ba-ecb58ed60542" name="Out" connectedTo="1073ff1b-9db1-4005-9c55-62655c11858c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="da0a90e9-12c9-4d32-b320-6432a6b5d507">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer17" id="2f22b7c6-b7ce-43e6-a1dd-e40c5107256a" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.333677291870118" lat="52.054872139943235" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="7d25b81b-272d-4eb7-86d6-c8d68fbf7981" name="Out" connectedTo="13b89cff-7987-4998-9766-ee3e9bc10b40" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="49c5ab59-21bf-4d65-9071-1c73a003cfa5" name="In" connectedTo="8410eb59-05a7-4f17-aca6-9cca0adcaf05" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer18" id="6893005c-2c61-45d6-93ca-bf73c729bb0d" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.332432746887208" lat="52.0524113049362" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="c83f1338-1b0b-4fcb-ac64-cf19d41be72b" name="Out" connectedTo="d8b610a7-c87e-4aa9-b7a6-edb55f3a8ac6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="b059f601-3773-4380-bc23-34cc480bc769" name="In" connectedTo="32a75cd3-df73-4797-988c-af0b84e781c3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer19" id="37208c67-8730-4f71-8d9f-c9a0f9f56725" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.336906671524049" lat="52.051395263818755" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="2cb2ce2c-d1bd-4c17-8a73-9b8012f2262e" name="Out" connectedTo="4477c893-8e56-40cd-a669-fd50ff57698d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="d4012c03-8dfd-4a9f-8674-9774f1dd612b" name="In" connectedTo="fc239a2f-c737-47ee-89c3-c69baed28e51" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer20" id="b002a257-64f7-4eb9-b317-839b88035b72" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.336574077606202" lat="52.048564741731425" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="24d2b55c-4822-4524-9b2a-ebe99070fce1" name="Out" connectedTo="6532545a-8a96-4a08-bef4-a1b9bd024812" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="9548a1f0-f3eb-4a95-a592-2356ab97130c" name="In" connectedTo="e238321b-26ad-4b91-8314-7e1624b36a94" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer21" id="7e9c28ea-1d36-4db7-8e26-247e59a8d5b7" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.335168600082398" lat="52.04979198311488" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="e376e0fc-ed34-4e24-bbb4-37f69445f7a2" name="Out" connectedTo="8a56e2ae-2090-4578-928a-c5beaf608a32" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="44e1a886-5a4e-41c8-8921-4cb53eef3dc6" name="In" connectedTo="f2d22a19-aaeb-418e-8bcb-cdc789d3b956" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer22" id="b9f7e29d-062e-4b89-bc64-ecfccb9031eb" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.331016540527345" lat="52.04679639917788" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="289cccc1-0ce6-4d43-92f8-4cbe8246476e" name="Out" connectedTo="87f1d839-d3a5-4660-a4d4-5280d7c4d5b0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="95556d67-1ffd-4d8e-afb1-83c6e63e8f5f" name="In" connectedTo="3800b6d2-cfdb-4dd6-8cff-72156de139fe" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer23" id="27824581-94aa-416c-8242-59c85dc0cad9" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.3280982971191415" lat="52.04389959730849" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="7e0e66f1-effe-44c1-b08c-e4628e1511f7" name="Out" connectedTo="4c9b284f-9a0b-4fe6-8d6c-34343d76e784" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="4ffa71aa-a584-41e1-97a1-61199da28891" name="In" connectedTo="dc290931-0cdf-444e-9f3a-dc8b52ff4920" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer24" id="3573c751-4116-4600-b261-060fc75f230f" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.326682090759278" lat="52.04312092606362" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="87aab61f-344d-4e1e-a560-b3a1725d2ba8" name="Out" connectedTo="52349e83-008e-42eb-b009-8d8dee21bd7d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="f572e6a0-69de-40e5-ba67-cca9d0eb7452" name="In" connectedTo="60b1043e-22bd-4119-98b7-b282144c0967" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer25" id="9ad2ed86-e8bd-4328-a3c5-15293b4905a6" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.322293996810914" lat="52.039682732367204" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="5b0da039-78a0-41a8-98ec-3ca85ff090d5" name="Out" connectedTo="56900fea-7b65-4f37-9d17-aa99dbb72813" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="b95748d5-64e4-46fd-9dbc-0b3528f6e3ff" name="In" connectedTo="47411f3a-7951-4684-bc58-dbbc2f86147d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer26" id="2ce79393-01d9-4fe1-8ea2-ed8fb8750403" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.318131208419801" lat="52.04256001040516" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="1241c02e-13e9-4f66-ac45-12344bb3bd47" name="Out" connectedTo="9cf14369-e908-46c7-95e7-467c79c14198" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="9d08b748-1db7-42fd-ae46-4645ed9b83fd" name="In" connectedTo="e14b3d48-c8d0-47ce-af2e-bcd5173687cd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:HeatProducer" power="10000000.0" name="HeatProducer27" id="a28e3d9b-6643-4fc8-a427-26090071f814" state="OPTIONAL">
        <geometry xsi:type="esdl:Point" lon="4.324654340744019" lat="52.041378764997596" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="6fea1bf7-5c9a-4d80-b0b3-1a83b1853b10" name="Out" connectedTo="6cb7b677-a823-477b-ae45-6dc4b931e9be" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:InPort" id="04f3033e-e363-4f74-bb59-c1de3f1af911" name="In" connectedTo="b65eee76-8d5c-46f5-aa26-6aa060435ec2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="f6ab2a6d-41d5-4e10-b917-e9c443151624">
          <investmentCosts xsi:type="esdl:SingleValue" value="300000.0" id="47fd41e1-9017-466e-b6a1-5ea7f776dfa5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="ff0a7278-91de-4ca4-82a7-25ae9d63e8e1" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
          <variableOperationalAndMaintenanceCosts xsi:type="esdl:SingleValue" value="200.0" id="f9c3998f-dfcf-4fa1-860f-dfaaf91e7e9c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="d3ef5c4c-12b1-4851-af0f-04c95e210be9" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalAndMaintenanceCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="100000.0" id="cc47852c-c7cc-44b3-abd5-5e14378489e8">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" physicalQuantity="COST" id="164720ce-b344-482b-8fb2-9fe2938cfde1" description="Cost in EUR" unit="EURO"/>
          </installationCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe96" outerDiameter="0.56" length="43.2" innerDiameter="0.3938" id="Pipe96" state="OPTIONAL" related="Pipe96_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.318131208419801" lat="52.04256001040516"/>
          <point xsi:type="esdl:Point" lon="4.318453073501588" lat="52.042894338333426"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9cf14369-e908-46c7-95e7-467c79c14198" name="In" connectedTo="1241c02e-13e9-4f66-ac45-12344bb3bd47" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="f039081a-6763-4917-bd96-9ec83518efaa" name="Out" connectedTo="034e5cc7-68f3-4c88-8be9-31902d03d441" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="572a93a7-6911-4896-aff2-a50c20ee10cd">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe97" outerDiameter="0.56" length="52.6" innerDiameter="0.3938" id="Pipe97" state="OPTIONAL" related="Pipe97_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.322293996810914" lat="52.039682732367204"/>
          <point xsi:type="esdl:Point" lon="4.321660995483399" lat="52.03995144351459"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="56900fea-7b65-4f37-9d17-aa99dbb72813" name="In" connectedTo="5b0da039-78a0-41a8-98ec-3ca85ff090d5" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="b3330cdc-ce06-4264-9d30-b5fc3d2e657c" name="Out" connectedTo="eede8573-c3f5-4156-baea-f8ef53a002a6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="af80498a-df27-42b0-90e0-401018a3dc08">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe99" outerDiameter="0.56" length="93.3" innerDiameter="0.3938" id="Pipe99" state="OPTIONAL" related="Pipe99_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.324654340744019" lat="52.041378764997596"/>
          <point xsi:type="esdl:Point" lon="4.323420524597169" lat="52.04102040978031"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="6cb7b677-a823-477b-ae45-6dc4b931e9be" name="In" connectedTo="6fea1bf7-5c9a-4d80-b0b3-1a83b1853b10" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="c56dbff6-43d0-424e-82af-647304a719ef" name="Out" connectedTo="0f1d6205-a978-46a7-8c51-3aa7e22d6ac3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="77009f21-f5a4-4962-ac95-fbf5a29641dd">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe101" outerDiameter="0.56" length="94.4" innerDiameter="0.3938" id="Pipe101" state="OPTIONAL" related="Pipe101_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.326682090759278" lat="52.04312092606362"/>
          <point xsi:type="esdl:Point" lon="4.327293634414674" lat="52.04235988080374"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="52349e83-008e-42eb-b009-8d8dee21bd7d" name="In" connectedTo="87aab61f-344d-4e1e-a560-b3a1725d2ba8" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="7f7fd672-8ea1-45cb-baf0-ac9821ea412f" name="Out" connectedTo="5de6a1ad-fd67-4b43-8fdf-70d74d6fd0bd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="2b34cb99-0ac1-4fb1-ad21-fc66e3f1a2fa">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe103" outerDiameter="0.56" length="92.7" innerDiameter="0.3938" id="Pipe103" state="OPTIONAL" related="Pipe103_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3280982971191415" lat="52.04389959730849"/>
          <point xsi:type="esdl:Point" lon="4.32937502861023" lat="52.04362013462266"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4c9b284f-9a0b-4fe6-8d6c-34343d76e784" name="In" connectedTo="7e0e66f1-effe-44c1-b08c-e4628e1511f7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="7611d55e-8f95-482e-9014-c57e8f3e53dd" name="Out" connectedTo="599d0c0b-c7e2-4314-bc5c-da112c9da4c1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="9eca3dd8-35d9-431a-b9ea-81e27ebaba65">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe105" outerDiameter="0.56" length="39.5" innerDiameter="0.3938" id="Pipe105" state="OPTIONAL" related="Pipe105_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.331016540527345" lat="52.04679639917788"/>
          <point xsi:type="esdl:Point" lon="4.330555200576783" lat="52.04658258087284"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="87f1d839-d3a5-4660-a4d4-5280d7c4d5b0" name="In" connectedTo="289cccc1-0ce6-4d43-92f8-4cbe8246476e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="4880facf-4871-4773-a1ac-0e48df8eca65" name="Out" connectedTo="90cc9947-a05b-41c5-8b9e-e678bf033c61" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="a8601187-2eaa-49fe-85ab-baef7ad13c93">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe107" outerDiameter="0.56" length="67.5" innerDiameter="0.3938" id="Pipe107" state="OPTIONAL" related="Pipe107_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.335168600082398" lat="52.04979198311488"/>
          <point xsi:type="esdl:Point" lon="4.334267377853394" lat="52.050039619503906"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8a56e2ae-2090-4578-928a-c5beaf608a32" name="In" connectedTo="e376e0fc-ed34-4e24-bbb4-37f69445f7a2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="a82e0ed6-fc80-4319-820c-7de68a337cd3" name="Out" connectedTo="29b4f6b2-45e0-452d-82ed-0a1507fa40f0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="51f19a21-b32d-4cc7-a4af-8d6f8d8543d5">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe109" outerDiameter="0.56" length="69.3" innerDiameter="0.3938" id="Pipe109" state="OPTIONAL" related="Pipe109_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.336906671524049" lat="52.051395263818755"/>
          <point xsi:type="esdl:Point" lon="4.336756467819215" lat="52.0507784938338"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4477c893-8e56-40cd-a669-fd50ff57698d" name="In" connectedTo="2cb2ce2c-d1bd-4c17-8a73-9b8012f2262e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="a84b4b4b-316c-44e9-8aaa-8af5b97c4506" name="Out" connectedTo="49caaf6b-e676-4e65-9ce5-027c2406c9b7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="8c77194c-c815-43a9-8cd5-4b4ab70513ea">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe49_a" outerDiameter="0.315" length="277.05" innerDiameter="0.2101" id="Pipe49_a" state="OPTIONAL" related="Pipe49_a_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.336756467819215" lat="52.0507784938338"/>
          <point xsi:type="esdl:Point" lon="4.338204860687257" lat="52.04933476113613"/>
          <point xsi:type="esdl:Point" lon="4.33737874031067" lat="52.04872309735226"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="5f245a7a-bb9c-4c6d-af8c-05a27a76f17c" name="In" connectedTo="d906ef7e-682b-484e-82ac-584a0115c91e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="f24c0824-3758-4db7-983d-6417cfd87c8b" name="Out" connectedTo="b0b8f904-3e41-417b-8dff-7b98d9c823e8" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="606cd7cf-cb7c-4852-9d18-225198069dd3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe49_b" outerDiameter="0.315" length="47.47" innerDiameter="0.2101" id="Pipe49_b" state="OPTIONAL" related="Pipe49_b_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.33737874031067" lat="52.04872309735226"/>
          <point xsi:type="esdl:Point" lon="4.337325096130372" lat="52.04866183648353"/>
          <point xsi:type="esdl:Point" lon="4.337850809097291" lat="52.04850966015021"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="2de5f269-8e5e-41c8-9c2b-808bd66dcbac" name="In" connectedTo="b6818887-3419-4627-80f7-dfefeed63fbb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="8cf61346-445d-44e1-bd5f-02b51b9af83c" name="Out" connectedTo="f470c680-16ff-449c-9c6d-58e59dd3b478" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="606cd7cf-cb7c-4852-9d18-225198069dd3">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_458a" id="458a8a43-c143-45fc-95db-54b2d2c6b15a">
        <geometry xsi:type="esdl:Point" lon="4.33737874031067" lat="52.04872309735226"/>
        <port xsi:type="esdl:InPort" id="b0b8f904-3e41-417b-8dff-7b98d9c823e8" name="In" connectedTo="f24c0824-3758-4db7-983d-6417cfd87c8b b73b25b0-e282-4901-b880-3bf568c03247" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="b6818887-3419-4627-80f7-dfefeed63fbb" name="Out" connectedTo="2de5f269-8e5e-41c8-9c2b-808bd66dcbac" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe52_a" outerDiameter="0.315" length="151.23" innerDiameter="0.2101" id="Pipe52_a" state="OPTIONAL" related="Pipe52_a_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.334599971771241" lat="52.05278394828437"/>
          <point xsi:type="esdl:Point" lon="4.3326687812805185" lat="52.052121009831716"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="2e30acdb-3a7d-4c27-8917-127592c0c3a3" name="In" connectedTo="9a8102ad-8172-41f1-9939-ff995a85d39e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="0577fd68-0ca6-4e1f-a386-b1b277e11aa2" name="Out" connectedTo="c7cd8fb2-241f-45db-b462-59ebbf9d4e52" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="c312ce41-0938-4eca-8af8-20f0413300f9">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe52_b" outerDiameter="0.315" length="27.64" innerDiameter="0.2101" id="Pipe52_b" state="OPTIONAL" related="Pipe52_b_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3326687812805185" lat="52.052121009831716"/>
          <point xsi:type="esdl:Point" lon="4.332336187362672" lat="52.05197974342533"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8313b9e4-56f4-4381-89bb-85bdcaecce29" name="In" connectedTo="174cd399-bf91-45c2-b3f3-134704467f3f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="5802017c-c2da-48c5-88df-b23fc4090720" name="Out" connectedTo="02fddd61-e3fb-4ed9-aa92-08694de98345" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="c312ce41-0938-4eca-8af8-20f0413300f9">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_0969" id="0969517d-7b44-4de8-ba13-8ac30a59638c">
        <geometry xsi:type="esdl:Point" lon="4.3326687812805185" lat="52.052121009831716"/>
        <port xsi:type="esdl:InPort" id="c7cd8fb2-241f-45db-b462-59ebbf9d4e52" name="In" connectedTo="0577fd68-0ca6-4e1f-a386-b1b277e11aa2 f7a61718-b55d-4ec1-816e-f397f8a253c8" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="174cd399-bf91-45c2-b3f3-134704467f3f" name="Out" connectedTo="8313b9e4-56f4-4381-89bb-85bdcaecce29" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe51_a" outerDiameter="0.315" length="249.1" innerDiameter="0.2101" id="Pipe51_a" state="OPTIONAL" related="Pipe51_a_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.334599971771241" lat="52.05278394828437"/>
          <point xsi:type="esdl:Point" lon="4.332786798477174" lat="52.05472700062111"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="cf93b38e-49d4-41e0-8f2e-cae0e61e47bb" name="In" connectedTo="9a8102ad-8172-41f1-9939-ff995a85d39e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="914edb28-1bd6-443b-a11e-ec2936417159" name="Out" connectedTo="33170f9d-b99a-41ee-9670-d405967bf293" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="582a88fb-6f00-4922-8b11-33729c4e17a8">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe51_b" outerDiameter="0.315" length="34.31" innerDiameter="0.2101" id="Pipe51_b" state="OPTIONAL" related="Pipe51_b_ret">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.332786798477174" lat="52.05472700062111"/>
          <point xsi:type="esdl:Point" lon="4.3325185775756845" lat="52.054987810473264"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="34179142-5154-4df5-b501-ed9af4cf3481" name="In" connectedTo="94808684-1fc7-46ef-91e9-15e142c01bc0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="78aa70aa-e167-4cc8-93e9-d4c1ca8d52df" name="Out" connectedTo="3e8bbc50-eb90-4c5d-9035-f77f38b544c4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0045">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="930aa5cf-b76e-4049-afa7-ea79445faf55"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.04385">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="f6bd7242-b1a3-4b24-9edd-ad58a830444b"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0041">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="81df81a9-ac8b-4c9d-8d71-dd2bbee92fa3"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="582a88fb-6f00-4922-8b11-33729c4e17a8">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="b887af7c-612e-4899-b64a-01ad7ed76cf4" value="1355.3">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="fa8f44a4-599f-45be-ad50-353b4c8c116f" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4f81" id="4f817fa9-bd0d-46e3-a988-3cb32a862f4d">
        <geometry xsi:type="esdl:Point" lon="4.332786798477174" lat="52.05472700062111"/>
        <port xsi:type="esdl:InPort" id="33170f9d-b99a-41ee-9670-d405967bf293" name="In" connectedTo="914edb28-1bd6-443b-a11e-ec2936417159 4efde9b3-d804-4bf4-8032-99d8014754f9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="94808684-1fc7-46ef-91e9-15e142c01bc0" name="Out" connectedTo="34179142-5154-4df5-b501-ed9af4cf3481" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe110" outerDiameter="0.56" length="63.0" innerDiameter="0.3938" id="Pipe110" state="OPTIONAL" related="Pipe110_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.333677291870118" lat="52.054872139943235"/>
          <point xsi:type="esdl:Point" lon="4.332786798477174" lat="52.05472700062111"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="13b89cff-7987-4998-9766-ee3e9bc10b40" name="In" connectedTo="7d25b81b-272d-4eb7-86d6-c8d68fbf7981" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="4efde9b3-d804-4bf4-8032-99d8014754f9" name="Out" connectedTo="33170f9d-b99a-41ee-9670-d405967bf293" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="f24be569-b0ca-479c-9113-e5aa80f5a830">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe113" outerDiameter="0.56" length="36.1" innerDiameter="0.3938" id="Pipe113" state="OPTIONAL" related="Pipe113_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.332432746887208" lat="52.0524113049362"/>
          <point xsi:type="esdl:Point" lon="4.3326687812805185" lat="52.052121009831716"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d8b610a7-c87e-4aa9-b7a6-edb55f3a8ac6" name="In" connectedTo="c83f1338-1b0b-4fcb-ac64-cf19d41be72b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="f7a61718-b55d-4ec1-816e-f397f8a253c8" name="Out" connectedTo="c7cd8fb2-241f-45db-b462-59ebbf9d4e52" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="ee408af4-6eb5-4e5d-923a-d5e3be14c6bb">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe115" outerDiameter="0.56" length="57.8" innerDiameter="0.3938" id="Pipe115" state="OPTIONAL" related="Pipe115_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.336574077606202" lat="52.048564741731425"/>
          <point xsi:type="esdl:Point" lon="4.33737874031067" lat="52.04872309735226"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="6532545a-8a96-4a08-bef4-a1b9bd024812" name="In" connectedTo="24d2b55c-4822-4524-9b2a-ebe99070fce1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="b73b25b0-e282-4901-b880-3bf568c03247" name="Out" connectedTo="b0b8f904-3e41-417b-8dff-7b98d9c823e8" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="b25bd430-d990-4bd2-b615-3138e85c2b9d">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:ATES" dischargeEfficiency="0.7" name="ATES" id="d868a6b0-c2c6-4266-8130-9c2e6a3facee" maxDischargeRate="10000000.0" maxChargeRate="10000000.0" state="OPTIONAL" aggregationCount="2">
        <geometry xsi:type="esdl:Point" lon="4.3098217248916635" lat="52.044472868844785" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="413a8ce6-4b2e-442c-acca-21b5d928130c" name="In" connectedTo="c668dd7b-24f6-4e05-97b1-5ba65a743f93" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="885f141c-5637-42e1-bf5b-2a42c628f75d" name="Out" connectedTo="d4c7ba6d-d591-4fe9-8436-b9aaa334e1db" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <costInformation xsi:type="esdl:CostInformation" id="2b5e75d5-a91f-45fa-9ce5-347fe365a04b">
          <variableOperationalCosts xsi:type="esdl:SingleValue" value="0.685" id="463aa0ae-0748-4523-be52-91142442d3f5">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="a754b88e-46f6-4921-bc09-5fcefc560a43" description="Cost in EUR/MWh" perUnit="WATTHOUR" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </variableOperationalCosts>
          <installationCosts xsi:type="esdl:SingleValue" value="2000000.0" id="050405e6-ce89-42fd-9dc2-6a62a8cbad98">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="c6b63ce7-a13d-4d05-a9c8-05d0df8a7cc5" description="Cost in EUR" physicalQuantity="COST" unit="EURO"/>
          </installationCosts>
          <fixedOperationalCosts xsi:type="esdl:SingleValue" value="2584.0" id="af8e95a1-1f2d-44a1-aff1-d495e6ed082c">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="eb9e4398-d6ce-4650-8686-551531d7e112" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </fixedOperationalCosts>
          <fixedMaintenanceCosts xsi:type="esdl:SingleValue" value="9945.0" id="e670bb8a-d45c-4603-98a9-225d5db58458">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="1e4f7346-cbd2-4e8e-8b69-718b1f94b4c5" description="Cost in EUR/MW" perUnit="WATT" perMultiplier="MEGA" physicalQuantity="COST" unit="EURO"/>
          </fixedMaintenanceCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe117" outerDiameter="0.56" length="24.1" innerDiameter="0.3938" id="Pipe117" state="OPTIONAL" related="Pipe117_ret">
        <geometry xsi:type="esdl:Line" CRS="WGS84">
          <point xsi:type="esdl:Point" lon="4.3101777881383905" lat="52.044399045081015"/>
          <point xsi:type="esdl:Point" lon="4.309845194220544" lat="52.04446956946128"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="74d1b153-1824-441b-9173-5ebe9613e58c" name="In" connectedTo="c709f60d-55ac-4791-8b4e-e8cd6733fc33" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <port xsi:type="esdl:OutPort" id="c668dd7b-24f6-4e05-97b1-5ba65a743f93" name="Out" connectedTo="413a8ce6-4b2e-442c-acca-21b5d928130c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75"/>
        <material xsi:type="esdl:CompoundMatter" compoundType="LAYERED">
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0063">
            <matter xsi:type="esdl:Material" thermalConductivity="52.15" name="steel" id="74d84321-1767-4cec-b6e7-b90c06020400"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0711">
            <matter xsi:type="esdl:Material" thermalConductivity="0.027" name="PUR" id="95012cd9-7648-4df5-8c83-74dc73bc16ba"/>
          </component>
          <component xsi:type="esdl:CompoundMatterComponent" layerWidth="0.0057">
            <matter xsi:type="esdl:Material" thermalConductivity="0.4" name="HDPE" id="1392ee3f-34f6-4c8e-ab0e-635b9d7ec9be"/>
          </component>
        </material>
        <dataSource xsi:type="esdl:DataSource" attribution="https://www.logstor.com/media/6506/product-catalogue-uk-202003.pdf" name="Logstor Product Catalogue Version 2020.03"/>
        <costInformation xsi:type="esdl:CostInformation" id="3929d3b9-cbd1-4ad7-a363-e36053c8ab8a">
          <investmentCosts xsi:type="esdl:SingleValue" name="Combined investment and installation costs" id="2ab2214c-8d42-4b74-877f-7fb97f6eab86" value="2840.6">
            <profileQuantityAndUnit xsi:type="esdl:QuantityAndUnitType" id="9169bd50-197f-4d6b-aaac-b383a59c815d" description="Costs in EUR/m" perUnit="METRE" physicalQuantity="COST" unit="EURO"/>
          </investmentCosts>
        </costInformation>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_8cee_ret" id="e2320284-e0d5-4b07-be58-7a2abdf6154c">
        <geometry xsi:type="esdl:Point" lon="4.312164208605956" lat="52.041739007433215" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="675d388d-ece7-48c3-bbc5-e4b73b9510f3" name="ret_port" connectedTo="684abfb7-4218-4a1e-b6da-a822ff112397 1ef2a05a-afb5-445a-8563-9a14af9b9f13" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="aa141fc0-ce28-4d14-99be-bed98630e2e5" name="ret_port" connectedTo="c07eaec4-b994-4ff1-ba68-fa2452a8e424 6d43e535-b95f-41ea-8489-7c85d74ff650" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_bdf0_ret" id="5ae6c05d-c6e6-4beb-b403-4c903d9fea46">
        <geometry xsi:type="esdl:Point" lon="4.309578632886089" lat="52.0444861582057" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="6df6baf1-2c39-49c3-ad57-1911dd437fdf" name="ret_port" connectedTo="8fb322ac-0b28-4cf2-b01e-8728a9646a65 d01a9f0c-09dc-44db-8937-2f651ce3fb85 04e44cf5-08e8-45e2-a7ce-0c10dcfbe9ee f2dc36cf-a2ab-41e1-933a-dfe5a1d8c118" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="d49a9b33-62b9-43ee-aa3c-19e087899111" name="ret_port" connectedTo="e49b7e3c-9fec-4b5a-ac37-9b7266342b35 a6b22da3-d60a-4617-8df7-5ed7fb04ea05" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_5163_ret" id="49388423-ec24-4ea8-8c6b-4d69f800a6cc">
        <geometry xsi:type="esdl:Point" lon="4.316066207877817" lat="52.038888193298845" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="401eae5a-7174-4c37-b64d-33c87782ed60" name="ret_port" connectedTo="5967e711-a8e1-4fe6-8ef3-fbe16296ddaf da149f20-9c37-46ca-b006-c2b63a1c6e1f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:InPort" id="2ec8715c-c5b9-4782-918c-f1b35d426904" name="ret_port" connectedTo="d6a89042-7b6f-4d2a-9408-d36ea437ec1e 8cca0c12-c7b2-45ed-9d3d-8353a5c9bf52" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_828a_ret" id="d64b5013-193b-4470-9d4f-604b46722cd6">
        <geometry xsi:type="esdl:Point" lon="4.317623756910878" lat="52.03775978317298" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="51a9b7c1-021f-41bc-8690-1870c52fc0d0" name="ret_port" connectedTo="a351aea6-ee34-4b0f-b0ba-388def8927a4 cbe50ae5-e435-4273-863b-4cdb724d77a7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:InPort" id="63920326-77bb-4ce1-aa31-bba537b8ec57" name="ret_port" connectedTo="e1c36f63-4988-4e3c-8519-708b6ae10e86 15ed4e8a-5d45-4272-a2a1-5a0eb66587c3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1514_ret" id="b648c052-7277-45f6-97a2-80ef64dd1811">
        <geometry xsi:type="esdl:Point" lon="4.318665895348221" lat="52.034823143777416" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="28b38730-7167-476f-8962-7d09d9f9d417" name="ret_port" connectedTo="2dcc99cf-eeea-47fd-92d9-e35cbd77a878 7a9f9f48-98cd-4bb1-a658-66538e9825ec" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="6f78a5f5-edd6-4641-afce-1f57fdb304b3" name="ret_port" connectedTo="7510d944-54c6-4d1b-98f4-2485da00c854 aa2d568a-0e68-41a6-9ba1-9adcf0d9dede" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_217a_ret" id="6aaff62b-3e8f-40b7-995a-46933b91321a">
        <geometry xsi:type="esdl:Point" lon="4.319888316571063" lat="52.03296207243976" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="425cb5ab-fe83-4313-82bc-6ea70546c77e" name="ret_port" connectedTo="2a669cbf-4402-415f-9580-6f7bd49dafb3 47825b4e-4273-4b51-8c55-f6200eb7253d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="122ee1ba-078e-4d41-8525-426ff44fbef8" name="ret_port" connectedTo="c5ce9a46-6831-4a59-b2fc-feb0284949ed 407c747e-5e0f-4a08-84aa-6ffb2a6eb7ca" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_20e0_ret" id="2ef869dc-8913-4306-8fd4-15d1fb0e5b52">
        <geometry xsi:type="esdl:Point" lon="4.313626398166783" lat="52.02614679831976" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="7ac9b957-d251-4415-afb0-42c89590fb47" name="ret_port" connectedTo="3dda78e8-4980-4ac2-b97b-2a9b02909037 14826ed9-07be-48aa-81a3-01fdc1bdf5da" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="cd825ba8-0050-4b8b-96e8-511f6b1e025c" name="ret_port" connectedTo="8914c40c-a08d-4a85-a893-4a796d062bfa de53da75-834f-4750-8776-49bbb4f510f1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_72e3_ret" id="5f82d889-44cc-4d40-b9c1-7f174b8aaa71">
        <geometry xsi:type="esdl:Point" lon="4.311809287259864" lat="52.02810055900395" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="9ba3845f-c482-40bf-ac11-a20b37ca25df" name="ret_port" connectedTo="cb91c93d-5a0b-4ac4-b4f4-4afd183b2a38 047ee5bd-2099-442f-b98b-552a081d039a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="e526b492-b974-44a8-835b-53e8ffdb0e1b" name="ret_port" connectedTo="9ff5ba8a-a36a-4a52-9f06-9ffc9bec6631" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_aae6_ret" id="17ad72e7-48ad-4e18-9233-22b95f764a75">
        <geometry xsi:type="esdl:Point" lon="4.31264939009626" lat="52.02905100631209" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="cb5b59bf-b5a2-4948-ba3b-cbba2aea383b" name="ret_port" connectedTo="f48d27c5-cb99-45ed-bdf6-ac8594944ba9 a62cd13e-03bb-4323-b96e-5ac83870b099" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="4a07801a-c279-4e37-8c21-ecbeb8248b20" name="ret_port" connectedTo="e1ae80f8-f763-4f93-bf88-9977684161be" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_839c_ret" id="b394a8e0-475b-4a49-92e5-65f3bd98dbde">
        <geometry xsi:type="esdl:Point" lon="4.310639968040655" lat="52.0313082377085" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="7995eac2-82c7-4456-8f8e-a4fa46c783a2" name="ret_port" connectedTo="f240ed4d-a9c6-4b70-9573-be6bb9330487 ec61db12-3e07-4b5b-834a-4ccdb5b97837" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="dc94e82b-2d27-4593-bf45-313f72814379" name="ret_port" connectedTo="8b26c9ef-4a71-438c-8de9-d5a6b012d71a 1308055c-ce56-406f-bad6-5df7eac7e0e3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_b466_ret" id="23ddf095-9825-4914-b676-6ab046e9900a">
        <geometry xsi:type="esdl:Point" lon="4.3101054529409275" lat="52.03188902735578" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="4c456b3e-d1c9-4cd0-ae4b-045a21340288" name="ret_port" connectedTo="dc4fee0c-c199-4453-b418-0e8f41e07660 67c5700f-a5ee-47c2-98d6-7f32bc7a5131" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="8961937d-3b73-487a-9bf2-1d982082c021" name="ret_port" connectedTo="86837f57-529b-4d93-9e60-bf79ed82e113 f947aeb7-1503-4665-be37-da2be8a53ade" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_45b2_ret" id="ae1ac7d6-9e80-451b-9985-68e03dd71e73">
        <geometry xsi:type="esdl:Point" lon="4.309485832539113" lat="52.03269420052414" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="69ae33a3-c00d-40d5-926e-101d62e1bf07" name="ret_port" connectedTo="854aced4-c758-41ff-901e-7aa792e21ef8 e746e3c3-052f-4ab8-a29f-9b55c5543037" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="4ed408bd-1977-4877-ab15-76d87ccd82c3" name="ret_port" connectedTo="9f9a0f19-a92f-4454-a0fa-b77d8fd23c0b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_7975_ret" id="a9bb124f-48f4-4c4d-a179-544f9a0a7cc0">
        <geometry xsi:type="esdl:Point" lon="4.30831145262905" lat="52.034476089590484" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="3aa1e57b-bc38-4266-859d-12b7601b09f4" name="ret_port" connectedTo="71f6c981-0890-48b6-b705-a2d362a406c7 49c8cc59-e36c-4124-bc81-8f04e8fae0bb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="1ba07bbd-526f-4889-88b3-a0318998e4c6" name="ret_port" connectedTo="965cf137-cd1c-4853-a305-ac10699b6319 9f0962d5-9dd9-4c43-aed0-75858a8123db" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_26ed_ret" id="1b4a81af-93fa-416d-aa1e-fb7f1c6342a5">
        <geometry xsi:type="esdl:Point" lon="4.30514161372713" lat="52.03632389953942" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="8886e16b-996d-4d5b-9ca5-e29a952b461b" name="ret_port" connectedTo="46571e5a-5b14-4b89-b835-0f4cbb41a5ae 5cdfadba-1a7d-40f9-8bf5-53d24c3758f7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="b8f1e41a-cf6e-4f28-b472-4ac55e0368d4" name="ret_port" connectedTo="7b7cab95-a956-4b1d-a976-1d698c0aea2d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_75c2_ret" id="9dd8a853-19a5-4a55-b170-82d33ae38d95">
        <geometry xsi:type="esdl:Point" lon="4.304758448179862" lat="52.037300568231316" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="ddc43005-31bf-418f-aa1e-71cdff9333f0" name="ret_port" connectedTo="70f5d3ce-4561-408b-bc1b-166e5cbc9b27 6aac1028-d0bd-44f2-b6da-f1f25b3f3660" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="a77ac0ae-8354-4ff1-a959-9341fb7968dd" name="ret_port" connectedTo="d8070dfb-9865-4995-b6a8-754dea752851" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_50da_ret" id="39c75c57-dfa4-40ee-995a-d198842a76fb">
        <geometry xsi:type="esdl:Point" lon="4.297226887889662" lat="52.037326964386295" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="d98ff88b-bd53-49fd-bc14-f1b63143025e" name="ret_port" connectedTo="71ef5381-44a4-4202-a886-469a25243fed 081ba6d6-328f-4bb5-a902-59bba57f67c3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="35f23a87-6c03-40f4-b304-72f5fb15ede4" name="ret_port" connectedTo="042b91ff-9261-48a7-a282-5f0729ff05b7 c28bc980-554f-4015-8a62-17758724473e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_a9fd_ret" id="4ff674a5-248d-4290-9769-7eab0c1cda55">
        <geometry xsi:type="esdl:Point" lon="4.304088328009291" lat="52.03916950215215" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="727b3d6e-3bcb-49ca-896e-f97fd2ebf0bc" name="ret_port" connectedTo="21f190ff-1dc5-461f-a318-51751e0e9aad db9d952f-564d-4eb1-bdee-69fb4016c8de" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="8bdc69f3-4303-4559-99b1-7156c78f0cd9" name="ret_port" connectedTo="73f1847a-7603-4002-b4b9-d599289856dc d4a43e90-7106-4613-9a90-45a02df974d9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_a7f5_ret" id="02f9d442-9700-4c67-96b1-6027e11d1725">
        <geometry xsi:type="esdl:Point" lon="4.317832742116763" lat="52.04298433842342" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="e6aa2067-fbd6-4a16-8ca2-0151b8d389ee" name="ret_port" connectedTo="beadae75-573c-494e-bc90-c8c4a373f918 34b93f89-52de-43ec-8ac0-ec752af4fe02" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="77fbb03a-8497-4aa5-b458-be03c126ca8a" name="ret_port" connectedTo="883f43eb-dc02-4d6c-839f-2bf302cf6efe 64654e0a-ad86-491f-b5a4-69e069d340e0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1b08_ret" id="7b917718-89f7-413d-8253-ed0a6e7290b2">
        <geometry xsi:type="esdl:Point" lon="4.321031827826063" lat="52.040041443604586" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="10ca3dd3-92cf-468a-bdef-fcd982ce8859" name="ret_port" connectedTo="ee57f2f9-2091-474a-9b81-35fa33a7ec44 af547ebe-0668-4fd7-9130-108069f59e83" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="7ab22d2a-a5ce-43d4-a8b1-e7d93d543c89" name="ret_port" connectedTo="f6cf6d52-bdb8-43d2-a4f8-a44c1432a473 9bfc3f39-1745-45f5-a649-44cf83c54098" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_ae77_ret" id="c21b5759-1198-4763-abf0-1cdec468c9be">
        <geometry xsi:type="esdl:Point" lon="4.322794596185427" lat="52.041110409870306" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="c693a131-31b6-4b39-8999-bd57adb76b7b" name="ret_port" connectedTo="37354449-62e8-4fee-bdcc-a01212b3c35c 540899e1-91f7-4c41-bc8e-de46647fafbc" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="5c25fefc-e271-4d05-8cff-502ef0abc52e" name="ret_port" connectedTo="011f96ad-982d-4dca-8df6-b2300d488582 729da237-9bbb-40ed-b85c-cb89d7e5aece" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_a659_ret" id="8ba72fe6-c13e-48cf-96c3-4dedbd3333ec">
        <geometry xsi:type="esdl:Point" lon="4.326671717170104" lat="52.042449880893734" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="38adcf2e-fd5e-44d7-9889-e41635df0822" name="ret_port" connectedTo="0d555c98-67b1-45df-b7d1-3f16d94acf4c e4a2dda5-35f7-432d-9c7f-1e63203c1e11" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="7ba5ab0e-cd6f-461b-a949-9ff998a32223" name="ret_port" connectedTo="a941fc70-51d0-4827-b471-e5155303ef3f c5d770bd-55e6-47d8-b851-ad799add08d6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_d25d_ret" id="3246cbb6-020b-48af-a123-d92f540ae138">
        <geometry xsi:type="esdl:Point" lon="4.328756837645373" lat="52.043710134712654" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="0328e4a0-699e-4011-8090-cec6925ac527" name="ret_port" connectedTo="e8b4ea44-530f-42df-b2b6-219ab1d8966c fd3b2cfd-cc86-42b1-8ae2-986bcb59fb05" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="5ee06323-235b-487e-b10c-24e037f15bcb" name="ret_port" connectedTo="802d10d1-16dc-4027-9fb4-31051c51bca8 ec7a8701-76d6-4834-adc4-dde7340fd71e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_a80f_ret" id="a0a9d4fe-09b8-4121-9c7a-1227885b9c6f">
        <geometry xsi:type="esdl:Point" lon="4.331605645414471" lat="52.04565653020963" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="2bef5f34-48ca-4f50-b017-37d960eaa133" name="ret_port" connectedTo="50bc5dc9-9a62-42fd-9b93-4a1709592763" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="e4caae09-f582-4c21-9d8e-b553849c7b8c" name="ret_port" connectedTo="c1dab76b-9766-43ac-ba0f-989a65fb84df" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4e62_ret" id="690293bd-a170-4526-b327-154af9cbad5d">
        <geometry xsi:type="esdl:Point" lon="4.329945591703785" lat="52.046672580962834" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="f108633c-9c56-48dd-9ac8-de2b8ce206cf" name="ret_port" connectedTo="9dbe3822-4e81-45ed-ab86-f91121a37326 c24e71f0-7cd2-48e8-bbc7-19d9dfc2ea0a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="c5ef7be7-3d9c-4e71-b574-921fe2b63dbf" name="ret_port" connectedTo="c35f5bdb-d000-480a-828a-4dbb1cd909aa f7297b6d-23d6-43a7-8afa-f5e2f1bbfdfb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_31ec_ret" id="607f0e8b-ead0-49c6-969e-773cd02bd7af">
        <geometry xsi:type="esdl:Point" lon="4.333667480856885" lat="52.0501296195939" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="5081d9f4-d1f6-444f-9222-104e4b0fe984" name="ret_port" connectedTo="ab993898-58b6-4c27-bafc-2027e335082a c14daf6d-97aa-406f-8b79-c0792fd02850" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="9878324e-69e9-46c6-8d3a-b5b6fe013323" name="ret_port" connectedTo="18cefdb6-963b-483d-a43b-8e8245954714 4db670e9-6af7-46aa-9b51-32ec5ec041d1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1085_ret" id="724b425c-8306-48b8-9534-2e6a5700bc90">
        <geometry xsi:type="esdl:Point" lon="4.33615860562574" lat="52.0508684939238" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="767cda8d-cfe3-4915-9f45-c4e2b0841eeb" name="ret_port" connectedTo="970c7c00-1b2f-498b-bd64-76de2c35909b 8aa495f9-bfcd-4d2f-9d76-5294443b96f8" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:InPort" id="7bd8ead4-d8f9-40d4-a32a-5b33300cd3b3" name="ret_port" connectedTo="a6446b1d-173a-4611-85ff-ee77b2695f2a de415c15-2b8d-45fd-a173-bfca996554f9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_cf81_ret" id="3174d55e-5ba0-4d79-b450-123364c26d2a">
        <geometry xsi:type="esdl:Point" lon="4.334007561882603" lat="52.05287394837437" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="0ab77890-2484-4e2a-99ed-7d9d5e14d619" name="ret_port" connectedTo="8c3b0d43-9139-4507-a5a9-7b5333a8b551" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:InPort" id="ca8dd588-f4c7-45c8-bae8-eba8c790c466" name="ret_port" connectedTo="a0825eaa-aa90-4df6-b0e1-115903aaae38 f08f0ea0-e8f2-44b0-aee5-553ea8af18df" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_6d6e_ret" id="d9dd69be-1915-4d48-a3f3-5a25f9333b36">
        <geometry xsi:type="esdl:Point" lon="4.335366620519717" lat="52.051580968313644" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="065518f2-9952-4951-8361-9899fdcad833" name="ret_port" connectedTo="16b84d9d-e197-4753-b52d-7789c15ef891 321220e8-746a-48d1-9a1c-883b61cc794f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="fae4d4ab-51bf-4b3e-94a1-1552327ab6f2" name="ret_port" connectedTo="f267bc10-aaa8-4a5a-94ab-346019df8341" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_824f_ret" id="6cf9a7bf-8ea1-4b55-9748-3adaa14e9283">
        <geometry xsi:type="esdl:Point" lon="4.303568628219171" lat="52.03594157365818" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="22a8375d-0126-4995-8410-6b0ab83936c2" name="ret_port" connectedTo="b18f8317-80ac-4b2a-b38c-835316e2c407" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="0815f851-4817-4a36-93e3-285bdc11aea1" name="ret_port" connectedTo="c0d1e5a8-071f-4e8a-aa71-7f7d9e6046b3 41d926b6-c155-4212-8b2d-ea38cfae2458" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_c553_ret" id="f5f20d62-7ff1-447c-b9f1-4824cb715f5b">
        <geometry xsi:type="esdl:Point" lon="4.299629457903739" lat="52.030492909001566" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="4012b484-d65f-477f-ad84-e6df35ab3531" name="ret_port" connectedTo="2b301f59-5ca4-48c5-90c8-66c3396b7423" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="4c6bab42-d9aa-4ff5-9c22-5f604b34fb22" name="ret_port" connectedTo="111e7606-f406-40b3-8a27-1c79abcc36e2 df17614f-df2b-4402-83a7-bc5433c316cc" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4bae_ret" id="d4990471-fb71-4fe4-a772-1e739466af58">
        <geometry xsi:type="esdl:Point" lon="4.3136170795418565" lat="52.029667795898824" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="ccbdf824-b95a-4116-8e48-55eb708f44c9" name="ret_port" connectedTo="645997b9-ff0f-4e08-949d-e499d42286de" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="a0d9f763-3754-4439-9509-003807bbdd65" name="ret_port" connectedTo="32a5133e-bb0a-4bc2-9d41-907b310ebf6e b8f6e3cf-e0cb-412e-86fe-4018183ffb1a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_1817_ret" id="d65baff8-7eb9-405b-bc5c-3ac0d9ad7acb">
        <geometry xsi:type="esdl:Point" lon="4.309672459453438" lat="52.02758184207936" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="cfff919b-0f98-40fb-a5c9-d733fff20bb4" name="ret_port" connectedTo="8bad9ab5-164f-4cf1-96fd-7f7316aaafd6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="fd235b70-a17f-48da-b6b4-90470317eabf" name="ret_port" connectedTo="6ef65168-b48d-4edd-9d5c-d24ba52a9da1 3aa80042-a30a-409d-94e6-32a6d3cb2232" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_e143_ret" id="929268ab-162e-405e-b5b4-6adf86c3da00">
        <geometry xsi:type="esdl:Point" lon="4.323172552258066" lat="52.03170084712326" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="adb7329e-ec83-40e4-967a-c5c33ffe7550" name="ret_port" connectedTo="aee25d4b-808b-41c5-b6a6-46cfd0534f61" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="4a3c0adb-12d0-4731-9dc5-021bf4f1faa4" name="ret_port" connectedTo="757cd47f-b98d-4340-b5a0-af50c62ccb66 ebfa9843-4015-4256-a33c-13036255719d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_458a_ret" id="13ed58f3-ddd1-4907-849b-f59506974c23">
        <geometry xsi:type="esdl:Point" lon="4.336775182356948" lat="52.048813097442256" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="f5813dd3-9d4c-4aa8-9e00-a9ec870007b3" name="ret_port" connectedTo="35d57051-f40b-4aa4-a9e2-ac4eb7c347f7 c1a2f0f9-6cc0-4483-9175-62f12eda11b4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:InPort" id="0e642c28-26ce-496a-9b16-a83a037accf1" name="ret_port" connectedTo="bbb87a16-7099-448a-843d-e7376bcee47e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_0969_ret" id="2864e5e2-3f57-4a5c-b02d-2250e15dc5df">
        <geometry xsi:type="esdl:Point" lon="4.332074580336848" lat="52.05221100992171" CRS="WGS84"/>
        <port xsi:type="esdl:InPort" id="3f5063b1-c676-4b81-bdaa-bfdd919a10ca" name="ret_port" connectedTo="3472767c-618c-4c0f-b8a2-2891f8bb2440" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="ba9aa151-e244-4a01-bbb3-1c4ead3f8e8a" name="ret_port" connectedTo="f98c1cb7-877d-4640-bbc4-b67d43106659 4bb8d3f2-2399-44fc-91e4-d3d10dc7efd6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Joint" name="Joint_4f81_ret" id="c5a65a12-75cf-4caa-ab4e-ce1477a68be3">
        <geometry xsi:type="esdl:Point" lon="4.33219957498349" lat="52.054817000711104" CRS="WGS84"/>
        <port xsi:type="esdl:OutPort" id="ca7ee8ee-caa3-4ae4-ae4b-c1ab3604022e" name="ret_port" connectedTo="442c90bc-79fa-41e4-85bb-abf96e05feee 6fa9faf7-af3b-4987-90a8-847da7591e45" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:InPort" id="621ab362-a3a1-464c-ae55-ecda1ee72c32" name="ret_port" connectedTo="e703e2e0-2a3c-48fb-89ef-19d0fd0109ed" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe1_ret" outerDiameter="0.56" length="355.4" innerDiameter="0.3938" id="Pipe1_ret" state="OPTIONAL" related="Pipe1">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.312164208605956" lat="52.041739007433215" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.310576937301564" lat="52.04374837657511" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.309578632886089" lat="52.0444861582057" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c07eaec4-b994-4ff1-ba68-fa2452a8e424" name="In_ret" connectedTo="aa141fc0-ce28-4d14-99be-bed98630e2e5" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="8fb322ac-0b28-4cf2-b01e-8728a9646a65" name="Out_ret" connectedTo="6df6baf1-2c39-49c3-ad57-1911dd437fdf" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe2_ret" outerDiameter="0.56" length="495.8" innerDiameter="0.3938" id="Pipe2_ret" state="OPTIONAL" related="Pipe2">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.316066207877817" lat="52.038888193298845" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.315478200334688" lat="52.03956499246764" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3143183124088695" lat="52.03918226585622" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.312164208605956" lat="52.041739007433215" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="5967e711-a8e1-4fe6-8ef3-fbe16296ddaf" name="In_ret" connectedTo="401eae5a-7174-4c37-b64d-33c87782ed60" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="684abfb7-4218-4a1e-b6da-a822ff112397" name="Out_ret" connectedTo="675d388d-ece7-48c3-bbc5-e4b73b9510f3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe3_ret" outerDiameter="0.56" length="170.5" innerDiameter="0.3938" id="Pipe3_ret" state="OPTIONAL" related="Pipe3">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.317623756910878" lat="52.03775978317298" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3168110896795175" lat="52.03863786459962" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.316066207877817" lat="52.038888193298845" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a351aea6-ee34-4b0f-b0ba-388def8927a4" name="In_ret" connectedTo="51a9b7c1-021f-41bc-8690-1870c52fc0d0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="d6a89042-7b6f-4d2a-9408-d36ea437ec1e" name="Out_ret" connectedTo="2ec8715c-c5b9-4782-918c-f1b35d426904" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe4_ret" outerDiameter="0.56" length="26.1" innerDiameter="0.3938" id="Pipe4_ret" state="OPTIONAL" related="Pipe4">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.309578632886089" lat="52.0444861582057" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.309396843514948" lat="52.04469236954422" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="e49b7e3c-9fec-4b5a-ac37-9b7266342b35" name="In_ret" connectedTo="d49a9b33-62b9-43ee-aa3c-19e087899111" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="d05ca38e-424c-4325-8e75-69379f90bf24" name="Out_ret" connectedTo="85c8013d-9a9b-4efc-87ba-cfd3d999adb6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe5_ret" outerDiameter="0.56" length="34.3" innerDiameter="0.3938" id="Pipe5_ret" state="OPTIONAL" related="Pipe5">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.309578632886089" lat="52.0444861582057" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.309681436053361" lat="52.04478805128214" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a6b22da3-d60a-4617-8df7-5ed7fb04ea05" name="In_ret" connectedTo="d49a9b33-62b9-43ee-aa3c-19e087899111" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="f7d48b4e-2348-4b24-9af9-98598f270be2" name="Out_ret" connectedTo="3aacb2a9-615b-4047-8b01-04f5f1f32379" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe6_ret" outerDiameter="0.56" length="826.7" innerDiameter="0.3938" id="Pipe6_ret" state="OPTIONAL" related="Pipe6">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.304088328009291" lat="52.03916950215215" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.302988023292634" lat="52.04073241340808" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.305183575497449" lat="52.0430286442908" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.309578632886089" lat="52.0444861582057" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="73f1847a-7603-4002-b4b9-d599289856dc" name="In_ret" connectedTo="8bdc69f3-4303-4559-99b1-7156c78f0cd9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="d01a9f0c-09dc-44db-8937-2f651ce3fb85" name="Out_ret" connectedTo="6df6baf1-2c39-49c3-ad57-1911dd437fdf" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe7_ret" outerDiameter="0.56" length="212.9" innerDiameter="0.3938" id="Pipe7_ret" state="OPTIONAL" related="Pipe7">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.304758448179862" lat="52.037300568231316" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.304088328009291" lat="52.03916950215215" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d8070dfb-9865-4995-b6a8-754dea752851" name="In_ret" connectedTo="a77ac0ae-8354-4ff1-a959-9341fb7968dd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="21f190ff-1dc5-461f-a318-51751e0e9aad" name="Out_ret" connectedTo="727b3d6e-3bcb-49ca-896e-f97fd2ebf0bc" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe8_ret" outerDiameter="0.56" length="111.8" innerDiameter="0.3938" id="Pipe8_ret" state="OPTIONAL" related="Pipe8">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.30514161372713" lat="52.03632389953942" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.304758448179862" lat="52.037300568231316" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="7b7cab95-a956-4b1d-a976-1d698c0aea2d" name="In_ret" connectedTo="b8f1e41a-cf6e-4f28-b472-4ac55e0368d4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="70f5d3ce-4561-408b-bc1b-166e5cbc9b27" name="Out_ret" connectedTo="ddc43005-31bf-418f-aa1e-71cdff9333f0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe9_ret" outerDiameter="0.56" length="387.2" innerDiameter="0.3938" id="Pipe9_ret" state="OPTIONAL" related="Pipe9">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.30831145262905" lat="52.034476089590484" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.308054989781725" lat="52.03479613490827" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.306423017924168" lat="52.034426566399354" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.30514161372713" lat="52.03632389953942" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="965cf137-cd1c-4853-a305-ac10699b6319" name="In_ret" connectedTo="1ba07bbd-526f-4889-88b3-a0318998e4c6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="46571e5a-5b14-4b89-b835-0f4cbb41a5ae" name="Out_ret" connectedTo="8886e16b-996d-4d5b-9ca5-e29a952b461b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe10_ret" outerDiameter="0.56" length="214.0" innerDiameter="0.3938" id="Pipe10_ret" state="OPTIONAL" related="Pipe10">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.309485832539113" lat="52.03269420052414" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.30831145262905" lat="52.034476089590484" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9f9a0f19-a92f-4454-a0fa-b77d8fd23c0b" name="In_ret" connectedTo="4ed408bd-1977-4877-ab15-76d87ccd82c3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="71f6c981-0890-48b6-b705-a2d362a406c7" name="Out_ret" connectedTo="3aa1e57b-bc38-4266-859d-12b7601b09f4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe11_ret" outerDiameter="0.56" length="99.1" innerDiameter="0.3938" id="Pipe11_ret" state="OPTIONAL" related="Pipe11">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3101054529409275" lat="52.03188902735578" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.309485832539113" lat="52.03269420052414" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="86837f57-529b-4d93-9e60-bf79ed82e113" name="In_ret" connectedTo="8961937d-3b73-487a-9bf2-1d982082c021" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="854aced4-c758-41ff-901e-7aa792e21ef8" name="Out_ret" connectedTo="69ae33a3-c00d-40d5-926e-101d62e1bf07" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe12_ret" outerDiameter="0.56" length="74.3" innerDiameter="0.3938" id="Pipe12_ret" state="OPTIONAL" related="Pipe12">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.310639968040655" lat="52.0313082377085" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3101054529409275" lat="52.03188902735578" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8b26c9ef-4a71-438c-8de9-d5a6b012d71a" name="In_ret" connectedTo="dc94e82b-2d27-4593-bf45-313f72814379" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="dc4fee0c-c199-4453-b418-0e8f41e07660" name="Out_ret" connectedTo="4c456b3e-d1c9-4cd0-ae4b-045a21340288" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe13_ret" outerDiameter="0.56" length="286.4" innerDiameter="0.3938" id="Pipe13_ret" state="OPTIONAL" related="Pipe13">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.31264939009626" lat="52.02905100631209" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.310639968040655" lat="52.0313082377085" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="e1ae80f8-f763-4f93-bf88-9977684161be" name="In_ret" connectedTo="4a07801a-c279-4e37-8c21-ecbeb8248b20" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="f240ed4d-a9c6-4b70-9573-be6bb9330487" name="Out_ret" connectedTo="7995eac2-82c7-4456-8f8e-a4fa46c783a2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe15_ret" outerDiameter="0.315" length="142.5" innerDiameter="0.2101" id="Pipe15_ret" state="OPTIONAL" related="Pipe15">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.311809287259864" lat="52.02810055900395" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.312432090999568" lat="52.02825510194936" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.312668669036986" lat="52.02841351068946" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3127769517329035" lat="52.02870392525555" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.31264939009626" lat="52.02905100631209" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9ff5ba8a-a36a-4a52-9f06-9ffc9bec6631" name="In_ret" connectedTo="e526b492-b974-44a8-835b-53e8ffdb0e1b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="f48d27c5-cb99-45ed-bdf6-ac8594944ba9" name="Out_ret" connectedTo="cb5b59bf-b5a2-4948-ba3b-cbba2aea383b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe16_ret" outerDiameter="0.315" length="250.5" innerDiameter="0.2101" id="Pipe16_ret" state="OPTIONAL" related="Pipe16">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.313626398166783" lat="52.02614679831976" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.311809287259864" lat="52.02810055900395" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8914c40c-a08d-4a85-a893-4a796d062bfa" name="In_ret" connectedTo="cd825ba8-0050-4b8b-96e8-511f6b1e025c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="cb91c93d-5a0b-4ac4-b4f4-4afd183b2a38" name="Out_ret" connectedTo="9ba3845f-c482-40bf-ac11-a20b37ca25df" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe17_ret" outerDiameter="0.315" length="164.5" innerDiameter="0.2101" id="Pipe17_ret" state="OPTIONAL" related="Pipe17">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.311866729934698" lat="52.026107194180035" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.312101308620519" lat="52.025693779376645" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.313626398166783" lat="52.02614679831976" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c6164983-07e3-400b-b0db-936daaface70" name="In_ret" connectedTo="940d3006-7e6e-4a7c-814f-d130d992564c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="3dda78e8-4980-4ac2-b97b-2a9b02909037" name="Out_ret" connectedTo="7ac9b957-d251-4415-afb0-42c89590fb47" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe19_ret" outerDiameter="0.315" length="70.8" innerDiameter="0.2101" id="Pipe19_ret" state="OPTIONAL" related="Pipe19">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3091709053332385" lat="52.03483245888195" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.30831145262905" lat="52.034476089590484" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c8cd7c63-3a3d-4760-9b18-333d9a5f0e64" name="In_ret" connectedTo="bbe6e10e-2805-44ce-9cba-279dac4e168b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="49c8cc59-e36c-4124-bc81-8f04e8fae0bb" name="Out_ret" connectedTo="3aa1e57b-bc38-4266-859d-12b7601b09f4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe21_ret" outerDiameter="0.315" length="571.4" innerDiameter="0.2101" id="Pipe21_ret" state="OPTIONAL" related="Pipe21">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.297226887889662" lat="52.037326964386295" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.2997393044629915" lat="52.037925913177205" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.300209891602603" lat="52.037450786368396" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.301667690342178" lat="52.03702844718787" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.302955150669327" lat="52.03702844718787" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.304758448179862" lat="52.037300568231316" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="042b91ff-9261-48a7-a282-5f0729ff05b7" name="In_ret" connectedTo="35f23a87-6c03-40f4-b304-72f5fb15ede4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="6aac1028-d0bd-44f2-b6da-f1f25b3f3660" name="Out_ret" connectedTo="ddc43005-31bf-418f-aa1e-71cdff9333f0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe22_ret" outerDiameter="0.315" length="88.6" innerDiameter="0.2101" id="Pipe22_ret" state="OPTIONAL" related="Pipe22">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.296067056324813" lat="52.03697061497874" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.297226887889662" lat="52.037326964386295" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="997ff413-e4c0-4cad-a81e-b1474abdb91f" name="In_ret" connectedTo="327389ca-879f-499b-9a03-97a00ea571f4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="71ef5381-44a4-4202-a886-469a25243fed" name="Out_ret" connectedTo="d98ff88b-bd53-49fd-bc14-f1b63143025e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe24_ret" outerDiameter="0.315" length="69.4" innerDiameter="0.2101" id="Pipe24_ret" state="OPTIONAL" related="Pipe24">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.320743697734791" lat="52.03329817966756" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.319888316571063" lat="52.03296207243976" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="cb5c01ac-0415-418b-a92f-e4d7b001cd10" name="In_ret" connectedTo="60efe325-8f39-4540-b7b2-cfa8d605a9db" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="2a669cbf-4402-415f-9580-6f7bd49dafb3" name="Out_ret" connectedTo="425cb5ab-fe83-4313-82bc-6ea70546c77e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe25_ret" outerDiameter="0.5" length="410.3" innerDiameter="0.3127" id="Pipe25_ret" state="OPTIONAL" related="Pipe25">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.318665895348221" lat="52.034823143777416" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.317617962517913" lat="52.035917465007" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.318853741681011" lat="52.0365377897204" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.317623756910878" lat="52.03775978317298" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="7510d944-54c6-4d1b-98f4-2485da00c854" name="In_ret" connectedTo="6f78a5f5-edd6-4641-afce-1f57fdb304b3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="e1c36f63-4988-4e3c-8519-708b6ae10e86" name="Out_ret" connectedTo="63920326-77bb-4ce1-aa31-bba537b8ec57" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe26_ret" outerDiameter="0.5" length="255.8" innerDiameter="0.3127" id="Pipe26_ret" state="OPTIONAL" related="Pipe26">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.319888316571063" lat="52.03296207243976" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.319273341811292" lat="52.033554872921606" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.319702945557949" lat="52.03369346417251" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.318665895348221" lat="52.034823143777416" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c5ce9a46-6831-4a59-b2fc-feb0284949ed" name="In_ret" connectedTo="122ee1ba-078e-4d41-8525-426ff44fbef8" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="2dcc99cf-eeea-47fd-92d9-e35cbd77a878" name="Out_ret" connectedTo="28b38730-7167-476f-8962-7d09d9f9d417" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe27_ret" outerDiameter="0.25" length="34.6" innerDiameter="0.1603" id="Pipe27_ret" state="OPTIONAL" related="Pipe27">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.319074182809998" lat="52.03500765830515" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.318665895348221" lat="52.034823143777416" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="7a9cd346-22a0-467f-8eae-b72541b0bef4" name="In_ret" connectedTo="9076d363-fa38-4470-a566-1c692a87bae7" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="7a9f9f48-98cd-4bb1-a658-66538e9825ec" name="Out_ret" connectedTo="28b38730-7167-476f-8962-7d09d9f9d417" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe28_ret" outerDiameter="0.25" length="22.8" innerDiameter="0.1603" id="Pipe28_ret" state="OPTIONAL" related="Pipe28">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.317945786679015" lat="52.03781264571931" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.317623756910878" lat="52.03775978317298" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4f760ceb-53f0-4867-bf62-bbecaf12c768" name="In_ret" connectedTo="3b1b483c-7d9e-4ffd-aa58-e16edef4cb44" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="15ed4e8a-5d45-4272-a2a1-5a0eb66587c3" name="Out_ret" connectedTo="63920326-77bb-4ce1-aa31-bba537b8ec57" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe29_ret" outerDiameter="0.56" length="23.0" innerDiameter="0.3938" id="Pipe29_ret" state="OPTIONAL" related="Pipe29">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.317623756910878" lat="52.03775978317298" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.31733374930543" lat="52.03765425111864" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="cbe50ae5-e435-4273-863b-4cdb724d77a7" name="In_ret" connectedTo="51a9b7c1-021f-41bc-8690-1870c52fc0d0" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="2f3babb2-f6e5-469e-a3b5-374d087ef970" name="Out_ret" connectedTo="d0832916-11c6-4f8f-a601-0fb90b1f5764" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe30_ret" outerDiameter="0.5" length="39.5" innerDiameter="0.3127" id="Pipe30_ret" state="OPTIONAL" related="Pipe30">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3155453867867015" lat="52.038734953131" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.316066207877817" lat="52.038888193298845" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8d924dd2-37dc-4d06-9bb4-a028abc8d29c" name="In_ret" connectedTo="6db24e9f-83c6-40be-a58a-faaa0e155b00" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="8cca0c12-c7b2-45ed-9d3d-8353a5c9bf52" name="Out_ret" connectedTo="2ec8715c-c5b9-4782-918c-f1b35d426904" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe31_ret" outerDiameter="0.25" length="21.6" innerDiameter="0.1603" id="Pipe31_ret" state="OPTIONAL" related="Pipe31">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.312454120356929" lat="52.04181687277464" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.312164208605956" lat="52.041739007433215" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="3a78bae6-bc9c-45c1-bd5d-6c722675944f" name="In_ret" connectedTo="0ab74980-9ef0-433d-bf30-ec3cf137ad7c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="1ef2a05a-afb5-445a-8563-9a14af9b9f13" name="Out_ret" connectedTo="675d388d-ece7-48c3-bbc5-e4b73b9510f3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe32_ret" outerDiameter="0.5" length="77.5" innerDiameter="0.3127" id="Pipe32_ret" state="OPTIONAL" related="Pipe32">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3111150096007185" lat="52.03220581852917" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3101054529409275" lat="52.03188902735578" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8fa483ed-2b40-4410-bcd6-301b097ec23e" name="In_ret" connectedTo="4b7d7685-af5d-4ccd-9f6c-d66a7a447a0e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="67c5700f-a5ee-47c2-98d6-7f32bc7a5131" name="Out_ret" connectedTo="4c456b3e-d1c9-4cd0-ae4b-045a21340288" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe33_ret" outerDiameter="0.5" length="87.7" innerDiameter="0.3127" id="Pipe33_ret" state="OPTIONAL" related="Pipe33">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.309416089191067" lat="52.03107063976937" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.310639968040655" lat="52.0313082377085" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4e5ce568-bbc1-484f-be68-e5a46a61b93b" name="In_ret" connectedTo="1417f744-930d-478b-bafd-d9d358b83e8e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="ec61db12-3e07-4b5b-834a-4ccdb5b97837" name="Out_ret" connectedTo="7995eac2-82c7-4456-8f8e-a4fa46c783a2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe35_ret" outerDiameter="0.25" length="124.2" innerDiameter="0.1603" id="Pipe35_ret" state="OPTIONAL" related="Pipe35">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.314674609495366" lat="52.02523589423255" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.313626398166783" lat="52.02614679831976" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d7d4264b-01c0-43ba-8864-9b01f445a9aa" name="In_ret" connectedTo="b3941ae3-a8c5-4a33-8369-68dfa6fa3fd1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="14826ed9-07be-48aa-81a3-01fdc1bdf5da" name="Out_ret" connectedTo="7ac9b957-d251-4415-afb0-42c89590fb47" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe36_ret" outerDiameter="0.25" length="42.8" innerDiameter="0.1603" id="Pipe36_ret" state="OPTIONAL" related="Pipe36">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.297461805012557" lat="52.03697061497874" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.297226887889662" lat="52.037326964386295" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="01ae5f1b-6a10-430c-aefb-6b981fc85911" name="In_ret" connectedTo="824b1653-94c7-408a-a1a6-9aab266bfa89" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="081ba6d6-328f-4bb5-a902-59bba57f67c3" name="Out_ret" connectedTo="d98ff88b-bd53-49fd-bc14-f1b63143025e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe37_ret" outerDiameter="0.25" length="21.6" innerDiameter="0.1603" id="Pipe37_ret" state="OPTIONAL" related="Pipe37">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.303777085926437" lat="52.03913506390387" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.304088328009291" lat="52.03916950215215" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="0efab627-79b2-432a-b65e-2ea0b7de34f0" name="In_ret" connectedTo="6194bccd-c26a-469b-88fd-6d9d5453065a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="db9d952f-564d-4eb1-bdee-69fb4016c8de" name="Out_ret" connectedTo="727b3d6e-3bcb-49ca-896e-f97fd2ebf0bc" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe38_ret" outerDiameter="0.56" length="785.2" innerDiameter="0.3938" id="Pipe38_ret" state="OPTIONAL" related="Pipe38">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.317832742116763" lat="52.04298433842342" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.316110963527158" lat="52.0448817848503" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.315789366707846" lat="52.04497415565644" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.314135358682189" lat="52.044367144007055" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.313793266435686" lat="52.044789413853294" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3124646508230375" lat="52.04539641976745" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.309578632886089" lat="52.0444861582057" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="883f43eb-dc02-4d6c-839f-2bf302cf6efe" name="In_ret" connectedTo="77fbb03a-8497-4aa5-b458-be03c126ca8a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="04e44cf5-08e8-45e2-a7ce-0c10dcfbe9ee" name="Out_ret" connectedTo="6df6baf1-2c39-49c3-ad57-1911dd437fdf" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe39_ret" outerDiameter="0.56" length="397.3" innerDiameter="0.3938" id="Pipe39_ret" state="OPTIONAL" related="Pipe39">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.321031827826063" lat="52.040041443604586" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3190191493082635" lat="52.04147712766037" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.317832742116763" lat="52.04298433842342" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f6cf6d52-bdb8-43d2-a4f8-a44c1432a473" name="In_ret" connectedTo="7ab22d2a-a5ce-43d4-a8b1-e7d93d543c89" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="beadae75-573c-494e-bc90-c8c4a373f918" name="Out_ret" connectedTo="e6aa2067-fbd6-4a16-8ca2-0151b8d389ee" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe40_ret" outerDiameter="0.56" length="169.1" innerDiameter="0.3938" id="Pipe40_ret" state="OPTIONAL" related="Pipe40">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.322794596185427" lat="52.041110409870306" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.321031827826063" lat="52.040041443604586" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="011f96ad-982d-4dca-8df6-b2300d488582" name="In_ret" connectedTo="5c25fefc-e271-4d05-8cff-502ef0abc52e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="ee57f2f9-2091-474a-9b81-35fa33a7ec44" name="Out_ret" connectedTo="10ca3dd3-92cf-468a-bdef-fcd982ce8859" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe41_ret" outerDiameter="0.56" length="381.2" innerDiameter="0.3938" id="Pipe41_ret" state="OPTIONAL" related="Pipe41">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.326671717170104" lat="52.042449880893734" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.323908711327824" lat="52.040553338732096" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.322794596185427" lat="52.041110409870306" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="a941fc70-51d0-4827-b471-e5155303ef3f" name="In_ret" connectedTo="7ba5ab0e-cd6f-461b-a949-9ff998a32223" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="37354449-62e8-4fee-bdcc-a01212b3c35c" name="Out_ret" connectedTo="c693a131-31b6-4b39-8999-bd57adb76b7b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe42_ret" outerDiameter="0.56" length="200.5" innerDiameter="0.3938" id="Pipe42_ret" state="OPTIONAL" related="Pipe42">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.328756837645373" lat="52.043710134712654" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.327650126138734" lat="52.043153095975015" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.326671717170104" lat="52.042449880893734" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="802d10d1-16dc-4027-9fb4-31051c51bca8" name="In_ret" connectedTo="5ee06323-235b-487e-b10c-24e037f15bcb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="0d555c98-67b1-45df-b7d1-3f16d94acf4c" name="Out_ret" connectedTo="38adcf2e-fd5e-44d7-9889-e41635df0822" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe43_ret" outerDiameter="0.56" length="290.9" innerDiameter="0.3938" id="Pipe43_ret" state="OPTIONAL" related="Pipe43">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.331605645414471" lat="52.04565653020963" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.328756837645373" lat="52.043710134712654" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c1dab76b-9766-43ac-ba0f-989a65fb84df" name="In_ret" connectedTo="e4caae09-f582-4c21-9d8e-b553849c7b8c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="e8b4ea44-530f-42df-b2b6-219ab1d8966c" name="Out_ret" connectedTo="0328e4a0-699e-4011-8090-cec6925ac527" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe45_ret" outerDiameter="0.5" length="160.3" innerDiameter="0.3127" id="Pipe45_ret" state="OPTIONAL" related="Pipe45">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.329945591703785" lat="52.046672580962834" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.331605645414471" lat="52.04565653020963" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c35f5bdb-d000-480a-828a-4dbb1cd909aa" name="In_ret" connectedTo="c5ef7be7-3d9c-4e71-b574-921fe2b63dbf" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="50bc5dc9-9a62-42fd-9b93-4a1709592763" name="Out_ret" connectedTo="2bef5f34-48ca-4f50-b017-37d960eaa133" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe46_ret" outerDiameter="0.5" length="537.9" innerDiameter="0.3127" id="Pipe46_ret" state="OPTIONAL" related="Pipe46">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.333667480856885" lat="52.0501296195939" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3290569982271725" lat="52.0473399813297" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.329945591703785" lat="52.046672580962834" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="18cefdb6-963b-483d-a43b-8e8245954714" name="In_ret" connectedTo="9878324e-69e9-46c6-8d3a-b5b6fe013323" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="9dbe3822-4e81-45ed-ab86-f91121a37326" name="Out_ret" connectedTo="f108633c-9c56-48dd-9ac8-de2b8ce206cf" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe47_ret" outerDiameter="0.5" length="198.7" innerDiameter="0.3127" id="Pipe47_ret" state="OPTIONAL" related="Pipe47">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.335366620519717" lat="52.051580968313644" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.333667480856885" lat="52.0501296195939" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f267bc10-aaa8-4a5a-94ab-346019df8341" name="In_ret" connectedTo="fae4d4ab-51bf-4b3e-94a1-1552327ab6f2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="ab993898-58b6-4c27-bafc-2027e335082a" name="Out_ret" connectedTo="5081d9f4-d1f6-444f-9222-104e4b0fe984" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe48_ret" outerDiameter="0.315" length="96.0" innerDiameter="0.2101" id="Pipe48_ret" state="OPTIONAL" related="Pipe48">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.33615860562574" lat="52.0508684939238" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.335366620519717" lat="52.051580968313644" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="970c7c00-1b2f-498b-bd64-76de2c35909b" name="In_ret" connectedTo="767cda8d-cfe3-4915-9f45-c4e2b0841eeb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="16b84d9d-e197-4753-b52d-7789c15ef891" name="Out_ret" connectedTo="065518f2-9952-4951-8361-9899fdcad833" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe50_ret" outerDiameter="0.315" length="171.3" innerDiameter="0.2101" id="Pipe50_ret" state="OPTIONAL" related="Pipe50">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.334007561882603" lat="52.05287394837437" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.335366620519717" lat="52.051580968313644" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8c3b0d43-9139-4507-a5a9-7b5333a8b551" name="In_ret" connectedTo="0ab77890-2484-4e2a-99ed-7d9d5e14d619" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="321220e8-746a-48d1-9a1c-883b61cc794f" name="Out_ret" connectedTo="065518f2-9952-4951-8361-9899fdcad833" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe53_ret" outerDiameter="0.315" length="60.6" innerDiameter="0.2101" id="Pipe53_ret" state="OPTIONAL" related="Pipe53">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3341704954656874" lat="52.04968161625739" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.333667480856885" lat="52.0501296195939" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c617234b-aa4d-420e-a4eb-615713be15d3" name="In_ret" connectedTo="c735b1aa-e309-4945-8886-195af354f0ac" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="c14daf6d-97aa-406f-8b79-c0792fd02850" name="Out_ret" connectedTo="5081d9f4-d1f6-444f-9222-104e4b0fe984" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe54_ret" outerDiameter="0.25" length="31.1" innerDiameter="0.1603" id="Pipe54_ret" state="OPTIONAL" related="Pipe54">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3295696316225" lat="52.046514841849365" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.329945591703785" lat="52.046672580962834" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="3741698a-602c-4d08-9a22-f5b42d8eb53a" name="In_ret" connectedTo="483a6cd3-01b3-405f-924b-995cad603382" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="c24e71f0-7cd2-48e8-bbc7-19d9dfc2ea0a" name="Out_ret" connectedTo="f108633c-9c56-48dd-9ac8-de2b8ce206cf" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe55_ret" outerDiameter="0.25" length="116.3" innerDiameter="0.1603" id="Pipe55_ret" state="OPTIONAL" related="Pipe55">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.327814673115141" lat="52.04438374025349" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.327637305524668" lat="52.04426673417878" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.328756837645373" lat="52.043710134712654" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="359cd445-80bc-484c-b4db-e2c988cc6176" name="In_ret" connectedTo="e4f770db-2bcb-444c-9b76-7e894a06ab9b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="fd3b2cfd-cc86-42b1-8ae2-986bcb59fb05" name="Out_ret" connectedTo="0328e4a0-699e-4011-8090-cec6925ac527" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe56_ret" outerDiameter="0.25" length="87.2" innerDiameter="0.1603" id="Pipe56_ret" state="OPTIONAL" related="Pipe56">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.325750644445816" lat="52.0429915416113" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.326671717170104" lat="52.042449880893734" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="dd39438a-9e0a-4d27-a533-fa940877ff36" name="In_ret" connectedTo="8696c727-7e34-4217-b1c6-2b3638bbbb8f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="e4a2dda5-35f7-432d-9c7f-1e63203c1e11" name="Out_ret" connectedTo="38adcf2e-fd5e-44d7-9889-e41635df0822" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe57_ret" outerDiameter="0.25" length="91.5" innerDiameter="0.1603" id="Pipe57_ret" state="OPTIONAL" related="Pipe57">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3237833171192" lat="52.04166528361519" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.322794596185427" lat="52.041110409870306" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="89fa68ff-861e-4c57-a53b-c44cf7536af7" name="In_ret" connectedTo="b2a780bf-6ceb-4c2f-8242-42b3e8d6e1be" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="540899e1-91f7-4c41-bc8e-de46647fafbc" name="Out_ret" connectedTo="c693a131-31b6-4b39-8999-bd57adb76b7b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe58_ret" outerDiameter="0.25" length="45.3" innerDiameter="0.1603" id="Pipe58_ret" state="OPTIONAL" related="Pipe58">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.321288173828406" lat="52.03966592479637" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.321031827826063" lat="52.040041443604586" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d229c40e-ebfe-499f-94b2-f6d215b9d794" name="In_ret" connectedTo="0ecf3ec6-0c44-4231-a553-ca5173d09dfa" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="af547ebe-0668-4fd7-9130-108069f59e83" name="Out_ret" connectedTo="10ca3dd3-92cf-468a-bdef-fcd982ce8859" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe59_ret" outerDiameter="0.25" length="48.9" innerDiameter="0.1603" id="Pipe59_ret" state="OPTIONAL" related="Pipe59">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.318434261109859" lat="52.043222551463565" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.317832742116763" lat="52.04298433842342" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="dc7d95d4-a8b1-4500-a48e-1f83b876b49a" name="In_ret" connectedTo="3fc2139b-301d-4c12-8ec7-6a263075334c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="34b93f89-52de-43ec-8ac0-ec752af4fe02" name="Out_ret" connectedTo="e6aa2067-fbd6-4a16-8ca2-0151b8d389ee" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe61_ret" outerDiameter="0.4" length="59.4" innerDiameter="0.263" id="Pipe61_ret" state="OPTIONAL" related="Pipe61">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.336717627084579" lat="52.051278113262896" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.33615860562574" lat="52.0508684939238" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="3240dcc5-5056-409d-8d83-c8e3989139b4" name="In_ret" connectedTo="a0c2f54d-b8af-44b3-9107-1ec0571d61ab" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="a6446b1d-173a-4611-85ff-ee77b2695f2a" name="Out_ret" connectedTo="7bd8ead4-d8f9-40d4-a32a-5b33300cd3b3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe66_ret" outerDiameter="0.56" length="57.9" innerDiameter="0.3938" id="Pipe66_ret" state="OPTIONAL" related="Pipe66">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.304088328009291" lat="52.03916950215215" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.304336616572189" lat="52.03966714074919" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d4a43e90-7106-4613-9a90-45a02df974d9" name="In_ret" connectedTo="8bdc69f3-4303-4559-99b1-7156c78f0cd9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="2af09cda-994d-426f-8b34-9377f3427944" name="Out_ret" connectedTo="88741a34-59fa-455e-828d-a0144a9178bd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe67_ret" outerDiameter="0.56" length="55.3" innerDiameter="0.3938" id="Pipe67_ret" state="OPTIONAL" related="Pipe67">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.297226887889662" lat="52.037326964386295" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.296777566943284" lat="52.037740048263686" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c28bc980-554f-4015-8a62-17758724473e" name="In_ret" connectedTo="35f23a87-6c03-40f4-b304-72f5fb15ede4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="d080f436-4bd8-4cc7-bc75-c38ce217ac88" name="Out_ret" connectedTo="1a6bbd6f-acb3-4ec3-93f0-690c1ed4cc71" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe20_a_ret" outerDiameter="0.315" length="115.61" innerDiameter="0.2101" id="Pipe20_a_ret" state="OPTIONAL" related="Pipe20_a">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.303568628219171" lat="52.03594157365818" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.30514161372713" lat="52.03632389953942" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c0d1e5a8-071f-4e8a-aa71-7f7d9e6046b3" name="In_ret" connectedTo="0815f851-4817-4a36-93e3-285bdc11aea1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="5cdfadba-1a7d-40f9-8bf5-53d24c3758f7" name="Out_ret" connectedTo="8886e16b-996d-4d5b-9ca5-e29a952b461b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe20_b_ret" outerDiameter="0.315" length="31.29" innerDiameter="0.2101" id="Pipe20_b_ret" state="OPTIONAL" related="Pipe20_b">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.30314450255764" lat="52.03583555719202" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.303568628219171" lat="52.03594157365818" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="2f4e69b7-96f9-4eb7-ac5d-97a6255dbb7c" name="In_ret" connectedTo="6cf7348f-8aac-4f1e-9e31-6ac8295f5706" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="b18f8317-80ac-4b2a-b38c-835316e2c407" name="Out_ret" connectedTo="22a8375d-0126-4995-8410-6b0ab83936c2" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe69_ret" outerDiameter="0.56" length="38.9" innerDiameter="0.3938" id="Pipe69_ret" state="OPTIONAL" related="Pipe69">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.303568628219171" lat="52.03594157365818" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.303658726980881" lat="52.03559672026082" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="41d926b6-c155-4212-8b2d-ea38cfae2458" name="In_ret" connectedTo="0815f851-4817-4a36-93e3-285bdc11aea1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="1adbcc35-d2b4-4115-b635-ed074a43dc7f" name="Out_ret" connectedTo="ed240007-6411-4983-b2ae-10eeb9d4c735" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe71_ret" outerDiameter="0.56" length="43.1" innerDiameter="0.3938" id="Pipe71_ret" state="OPTIONAL" related="Pipe71">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.30831145262905" lat="52.034476089590484" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3088957069395235" lat="52.0343311349992" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9f0962d5-9dd9-4c43-aed0-75858a8123db" name="In_ret" connectedTo="1ba07bbd-526f-4889-88b3-a0318998e4c6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="42ed67c8-1ad9-4f54-a04e-50ae8c419bb2" name="Out_ret" connectedTo="9124da2f-9c41-4217-9ba2-db523680605a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe14_a_ret" outerDiameter="0.315" length="721.48" innerDiameter="0.2101" id="Pipe14_a_ret" state="OPTIONAL" related="Pipe14_a">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.299629457903739" lat="52.030492909001566" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.302902990355719" lat="52.030862396357485" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.309485832539113" lat="52.03269420052414" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="111e7606-f406-40b3-8a27-1c79abcc36e2" name="In_ret" connectedTo="4c6bab42-d9aa-4ff5-9c22-5f604b34fb22" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="e746e3c3-052f-4ab8-a29f-9b55c5543037" name="Out_ret" connectedTo="69ae33a3-c00d-40d5-926e-101d62e1bf07" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe14_b_ret" outerDiameter="0.315" length="62.56" innerDiameter="0.2101" id="Pipe14_b_ret" state="OPTIONAL" related="Pipe14_b">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.2987279151631785" lat="52.03039743875227" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.299629457903739" lat="52.030492909001566" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c9db5954-0973-4a45-a040-008ca98e05d0" name="In_ret" connectedTo="35e0390a-790b-4f1f-8a9e-e3cfea3fe38b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="2b301f59-5ca4-48c5-90c8-66c3396b7423" name="Out_ret" connectedTo="4012b484-d65f-477f-ad84-e6df35ab3531" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe73_ret" outerDiameter="0.56" length="36.0" innerDiameter="0.3938" id="Pipe73_ret" state="OPTIONAL" related="Pipe73">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.299629457903739" lat="52.030492909001566" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.29929602121397" lat="52.03024207622905" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="df17614f-df2b-4402-83a7-bc5433c316cc" name="In_ret" connectedTo="4c6bab42-d9aa-4ff5-9c22-5f604b34fb22" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="d6caa807-0d17-4fd0-a983-5c1036159a78" name="Out_ret" connectedTo="49295fb9-e5b6-4217-82a3-1ccd76940098" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe76_ret" outerDiameter="0.56" length="68.2" innerDiameter="0.3938" id="Pipe76_ret" state="OPTIONAL" related="Pipe76">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3101054529409275" lat="52.03188902735578" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.31101119777152" lat="52.03163484041849" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f947aeb7-1503-4665-be37-da2be8a53ade" name="In_ret" connectedTo="8961937d-3b73-487a-9bf2-1d982082c021" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="7cc1c74d-db40-45ab-ad50-5ed0b697f795" name="Out_ret" connectedTo="1de51e8b-def4-4443-8ce4-b9eb14dc8e8a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe78_ret" outerDiameter="0.56" length="122.7" innerDiameter="0.3938" id="Pipe78_ret" state="OPTIONAL" related="Pipe78">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.310639968040655" lat="52.0313082377085" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.30900765447107" lat="52.030849353152654" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="1308055c-ce56-406f-bad6-5df7eac7e0e3" name="In_ret" connectedTo="dc94e82b-2d27-4593-bf45-313f72814379" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="87141bc9-eff2-49db-be90-11d0e53ec3a6" name="Out_ret" connectedTo="c57e0353-939f-42ff-b6c0-6be7af99e5fc" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe60_a_ret" outerDiameter="0.4" length="120.04" innerDiameter="0.263" id="Pipe60_a_ret" state="OPTIONAL" related="Pipe60_a">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3136170795418565" lat="52.029667795898824" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.313574183321056" lat="52.02967344649772" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.313444990252005" lat="52.02954144297258" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.313626686339623" lat="52.02933683673851" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.31264939009626" lat="52.02905100631209" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="32a5133e-bb0a-4bc2-9d41-907b310ebf6e" name="In_ret" connectedTo="a0d9f763-3754-4439-9509-003807bbdd65" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="a62cd13e-03bb-4323-b96e-5ac83870b099" name="Out_ret" connectedTo="cb5b59bf-b5a2-4948-ba3b-cbba2aea383b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe60_b_ret" outerDiameter="0.4" length="35.24" innerDiameter="0.263" id="Pipe60_b_ret" state="OPTIONAL" related="Pipe60_b">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.314046825510479" lat="52.02984303030444" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3136170795418565" lat="52.029667795898824" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="265e54cf-0576-4d80-b6ac-9bdb881575d5" name="In_ret" connectedTo="016ba65e-e955-4fd2-bdfd-8ebecb31702f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="645997b9-ff0f-4e08-949d-e499d42286de" name="Out_ret" connectedTo="ccbdf824-b95a-4116-8e48-55eb708f44c9" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe34_a_ret" outerDiameter="0.25" length="165.61" innerDiameter="0.1603" id="Pipe34_a_ret" state="OPTIONAL" related="Pipe34_a">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.309672459453438" lat="52.02758184207936" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.310053025017606" lat="52.027492810873866" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.311809287259864" lat="52.02810055900395" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="6ef65168-b48d-4edd-9d5c-d24ba52a9da1" name="In_ret" connectedTo="fd235b70-a17f-48da-b6b4-90470317eabf" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="047ee5bd-2099-442f-b98b-552a081d039a" name="Out_ret" connectedTo="9ba3845f-c482-40bf-ac11-a20b37ca25df" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe34_b_ret" outerDiameter="0.25" length="48.65" innerDiameter="0.1603" id="Pipe34_b_ret" state="OPTIONAL" related="Pipe34_b">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.30899701251604" lat="52.02771773424247" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.309672459453438" lat="52.02758184207936" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="e578607d-8bb3-40ec-b689-d991e1bf4300" name="In_ret" connectedTo="922d3ae9-e869-4ee0-bfc9-a00f7fdbf283" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="8bad9ab5-164f-4cf1-96fd-7f7316aaafd6" name="Out_ret" connectedTo="cfff919b-0f98-40fb-a5c9-d733fff20bb4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe81_ret" outerDiameter="0.56" length="63.5" innerDiameter="0.3938" id="Pipe81_ret" state="OPTIONAL" related="Pipe81">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.309672459453438" lat="52.02758184207936" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.309577857854631" lat="52.0281495480091" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="3aa80042-a30a-409d-94e6-32a6d3cb2232" name="In_ret" connectedTo="fd235b70-a17f-48da-b6b4-90470317eabf" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="0f8ad5ee-4492-4e07-bb07-e51f8289b390" name="Out_ret" connectedTo="983b16dc-f1ed-47a3-8eef-7116cec4cb5d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe80_ret" outerDiameter="0.56" length="59.2" innerDiameter="0.3938" id="Pipe80_ret" state="OPTIONAL" related="Pipe80">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.3136170795418565" lat="52.029667795898824" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.313726150226659" lat="52.030195870038526" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="b8f6e3cf-e0cb-412e-86fe-4018183ffb1a" name="In_ret" connectedTo="a0d9f763-3754-4439-9509-003807bbdd65" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="cec7a770-b845-44f2-a048-1dd075cf9bc2" name="Out_ret" connectedTo="af926335-28b7-49d3-bb8a-102f5349ec67" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe84_ret" outerDiameter="0.56" length="55.7" innerDiameter="0.3938" id="Pipe84_ret" state="OPTIONAL" related="Pipe84">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.313626398166783" lat="52.02614679831976" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.313982031432099" lat="52.02659824149003" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="de53da75-834f-4750-8776-49bbb4f510f1" name="In_ret" connectedTo="cd825ba8-0050-4b8b-96e8-511f6b1e025c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="da69fa88-7382-4cd7-9252-e7569aa71709" name="Out_ret" connectedTo="f4cb60f0-0db8-44ca-9e7e-f3952e867f4b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe86_ret" outerDiameter="0.56" length="41.0" innerDiameter="0.3938" id="Pipe86_ret" state="OPTIONAL" related="Pipe86">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.312164208605956" lat="52.041739007433215" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.311916436432105" lat="52.04140277280331" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="6d43e535-b95f-41ea-8489-7c85d74ff650" name="In_ret" connectedTo="aa141fc0-ce28-4d14-99be-bed98630e2e5" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="e1bf78da-811b-4b3f-a3e1-6681a3dd7a77" name="Out_ret" connectedTo="ca759595-c15b-44fe-9e33-2e2ccfd2d459" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe88_ret" outerDiameter="0.56" length="73.7" innerDiameter="0.3938" id="Pipe88_ret" state="OPTIONAL" related="Pipe88">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.316066207877817" lat="52.038888193298845" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.316245240967744" lat="52.03954175027192" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="da149f20-9c37-46ca-b006-c2b63a1c6e1f" name="In_ret" connectedTo="401eae5a-7174-4c37-b64d-33c87782ed60" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="a2e00dd2-85d1-4ad5-a8f7-c2258fb36c47" name="Out_ret" connectedTo="88e26467-fe6f-48f2-ae81-a0fe0a44f184" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe90_ret" outerDiameter="0.56" length="46.5" innerDiameter="0.3938" id="Pipe90_ret" state="OPTIONAL" related="Pipe90">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.318665895348221" lat="52.034823143777416" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.318482209262021" lat="52.034420238654135" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="aa2d568a-0e68-41a6-9ba1-9adcf0d9dede" name="In_ret" connectedTo="6f78a5f5-edd6-4641-afce-1f57fdb304b3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="c44e43f9-9508-4a85-8d9c-c23f9ffd7083" name="Out_ret" connectedTo="b25eaf74-e967-4ca2-b8dc-0f5e2df6f719" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe92_ret" outerDiameter="0.56" length="54.5" innerDiameter="0.3938" id="Pipe92_ret" state="OPTIONAL" related="Pipe92">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.319888316571063" lat="52.03296207243976" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.319741895491652" lat="52.03247971888093" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="407c747e-5e0f-4a08-84aa-6ffb2a6eb7ca" name="In_ret" connectedTo="122ee1ba-078e-4d41-8525-426ff44fbef8" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="79fffb1a-d928-48ab-99f2-25e0f5fe9af0" name="Out_ret" connectedTo="d9838289-335e-4070-a7fa-12423f2c62de" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe23_a_ret" outerDiameter="0.315" length="376.75" innerDiameter="0.2101" id="Pipe23_a_ret" state="OPTIONAL" related="Pipe23_a">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.323172552258066" lat="52.03170084712326" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.32168967919351" lat="52.03101116205779" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.319888316571063" lat="52.03296207243976" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="757cd47f-b98d-4340-b5a0-af50c62ccb66" name="In_ret" connectedTo="4a3c0adb-12d0-4731-9dc5-021bf4f1faa4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="47825b4e-4273-4b51-8c55-f6200eb7253d" name="Out_ret" connectedTo="425cb5ab-fe83-4313-82bc-6ea70546c77e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe23_b_ret" outerDiameter="0.315" length="39.78" innerDiameter="0.2101" id="Pipe23_b_ret" state="OPTIONAL" related="Pipe23_b">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.323634613234376" lat="52.03191866855768" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.323172552258066" lat="52.03170084712326" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="129982a4-6b66-43c8-ba16-1b2ee1caf049" name="In_ret" connectedTo="17944386-a137-4cac-965e-e8b5a399bb3c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="aee25d4b-808b-41c5-b6a6-46cfd0534f61" name="Out_ret" connectedTo="adb7329e-ec83-40e4-967a-c5c33ffe7550" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe94_ret" outerDiameter="0.56" length="69.0" innerDiameter="0.3938" id="Pipe94_ret" state="OPTIONAL" related="Pipe94">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.323172552258066" lat="52.03170084712326" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.322766732139652" lat="52.03226850076201" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ebfa9843-4015-4256-a33c-13036255719d" name="In_ret" connectedTo="4a3c0adb-12d0-4731-9dc5-021bf4f1faa4" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="b47dfdc3-f363-4220-82d6-a9e73bb84f13" name="Out_ret" connectedTo="74f2d395-2b58-4f92-8253-5996a7e1eada" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe96_ret" outerDiameter="0.56" length="43.2" innerDiameter="0.3938" id="Pipe96_ret" state="OPTIONAL" related="Pipe96">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.317832742116763" lat="52.04298433842342" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.317509885975817" lat="52.04265001049516" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="64654e0a-ad86-491f-b5a4-69e069d340e0" name="In_ret" connectedTo="77fbb03a-8497-4aa5-b458-be03c126ca8a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="e14b3d48-c8d0-47ce-af2e-bcd5173687cd" name="Out_ret" connectedTo="9d08b748-1db7-42fd-ae46-4645ed9b83fd" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe97_ret" outerDiameter="0.56" length="52.6" innerDiameter="0.3938" id="Pipe97_ret" state="OPTIONAL" related="Pipe97">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.321031827826063" lat="52.040041443604586" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3216640094954055" lat="52.0397727324572" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9bfc3f39-1745-45f5-a649-44cf83c54098" name="In_ret" connectedTo="7ab22d2a-a5ce-43d4-a8b1-e7d93d543c89" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="47411f3a-7951-4684-bc58-dbbc2f86147d" name="Out_ret" connectedTo="b95748d5-64e4-46fd-9dbc-0b3528f6e3ff" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe99_ret" outerDiameter="0.56" length="93.3" innerDiameter="0.3938" id="Pipe99_ret" state="OPTIONAL" related="Pipe99">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.322794596185427" lat="52.041110409870306" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.324029490630251" lat="52.04146876508759" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="729da237-9bbb-40ed-b85c-cb89d7e5aece" name="In_ret" connectedTo="5c25fefc-e271-4d05-8cff-502ef0abc52e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="b65eee76-8d5c-46f5-aa26-6aa060435ec2" name="Out_ret" connectedTo="04f3033e-e363-4f74-bb59-c1de3f1af911" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe101_ret" outerDiameter="0.56" length="94.4" innerDiameter="0.3938" id="Pipe101_ret" state="OPTIONAL" related="Pipe101">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.326671717170104" lat="52.042449880893734" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.32606242922094" lat="52.04321092615362" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c5d770bd-55e6-47d8-b851-ad799add08d6" name="In_ret" connectedTo="7ba5ab0e-cd6f-461b-a949-9ff998a32223" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="60b1043e-22bd-4119-98b7-b282144c0967" name="Out_ret" connectedTo="f572e6a0-69de-40e5-ba67-cca9d0eb7452" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe103_ret" outerDiameter="0.56" length="92.7" innerDiameter="0.3938" id="Pipe103_ret" state="OPTIONAL" related="Pipe103">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.328756837645373" lat="52.043710134712654" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3274809262877705" lat="52.043989597398486" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="ec7a8701-76d6-4834-adc4-dde7340fd71e" name="In_ret" connectedTo="5ee06323-235b-487e-b10c-24e037f15bcb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="dc290931-0cdf-444e-9f3a-dc8b52ff4920" name="Out_ret" connectedTo="4ffa71aa-a584-41e1-97a1-61199da28891" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe105_ret" outerDiameter="0.56" length="39.5" innerDiameter="0.3938" id="Pipe105_ret" state="OPTIONAL" related="Pipe105">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.329945591703785" lat="52.046672580962834" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.330407541661346" lat="52.046886399267876" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f7297b6d-23d6-43a7-8afa-f5e2f1bbfdfb" name="In_ret" connectedTo="c5ef7be7-3d9c-4e71-b574-921fe2b63dbf" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="3800b6d2-cfdb-4dd6-8cff-72156de139fe" name="Out_ret" connectedTo="95556d67-1ffd-4d8e-afb1-83c6e63e8f5f" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe107_ret" outerDiameter="0.56" length="67.5" innerDiameter="0.3938" id="Pipe107_ret" state="OPTIONAL" related="Pipe107">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.333667480856885" lat="52.0501296195939" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.334568017938316" lat="52.04988198320488" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4db670e9-6af7-46aa-9b51-32ec5ec041d1" name="In_ret" connectedTo="9878324e-69e9-46c6-8d3a-b5b6fe013323" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="f2d22a19-aaeb-418e-8bcb-cdc789d3b956" name="Out_ret" connectedTo="44e1a886-5a4e-41c8-8921-4cb53eef3dc6" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe109_ret" outerDiameter="0.56" length="69.3" innerDiameter="0.3938" id="Pipe109_ret" state="OPTIONAL" related="Pipe109">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.33615860562574" lat="52.0508684939238" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3363104970784905" lat="52.05148526390875" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="8aa495f9-bfcd-4d2f-9d76-5294443b96f8" name="In_ret" connectedTo="767cda8d-cfe3-4915-9f45-c4e2b0841eeb" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="fc239a2f-c737-47ee-89c3-c69baed28e51" name="Out_ret" connectedTo="d4012c03-8dfd-4a9f-8674-9774f1dd612b" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe49_a_ret" outerDiameter="0.315" length="277.05" innerDiameter="0.2101" id="Pipe49_a_ret" state="OPTIONAL" related="Pipe49_a">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.336775182356948" lat="52.048813097442256" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.337603009306805" lat="52.04942476122613" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.33615860562574" lat="52.0508684939238" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="35d57051-f40b-4aa4-a9e2-ac4eb7c347f7" name="In_ret" connectedTo="f5813dd3-9d4c-4aa8-9e00-a9ec870007b3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="de415c15-2b8d-45fd-a173-bfca996554f9" name="Out_ret" connectedTo="7bd8ead4-d8f9-40d4-a32a-5b33300cd3b3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe49_b_ret" outerDiameter="0.315" length="47.47" innerDiameter="0.2101" id="Pipe49_b_ret" state="OPTIONAL" related="Pipe49_b">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.337246653309526" lat="52.04859966024021" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.336721366709887" lat="52.04875183657353" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.336775182356948" lat="52.048813097442256" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="08705ddf-393d-4827-aba5-e45902bd65bd" name="In_ret" connectedTo="827b6304-b33d-4a73-83ec-2111e6a3c837" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="bbb87a16-7099-448a-843d-e7376bcee47e" name="Out_ret" connectedTo="0e642c28-26ce-496a-9b16-a83a037accf1" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe52_a_ret" outerDiameter="0.315" length="151.23" innerDiameter="0.2101" id="Pipe52_a_ret" state="OPTIONAL" related="Pipe52_a">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.332074580336848" lat="52.05221100992171" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.334007561882603" lat="52.05287394837437" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="f98c1cb7-877d-4640-bbc4-b67d43106659" name="In_ret" connectedTo="ba9aa151-e244-4a01-bbb3-1c4ead3f8e8a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="f08f0ea0-e8f2-44b0-aee5-553ea8af18df" name="Out_ret" connectedTo="ca8dd588-f4c7-45c8-bae8-eba8c790c466" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe52_b_ret" outerDiameter="0.315" length="27.64" innerDiameter="0.2101" id="Pipe52_b_ret" state="OPTIONAL" related="Pipe52_b">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.331741603326295" lat="52.052069743515325" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.332074580336848" lat="52.05221100992171" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="9f295aaf-a774-4a72-afcc-64d131904643" name="In_ret" connectedTo="df8b4206-fbd9-4b20-b477-13129693dd70" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="3472767c-618c-4c0f-b8a2-2891f8bb2440" name="Out_ret" connectedTo="3f5063b1-c676-4b81-bdaa-bfdd919a10ca" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe51_a_ret" outerDiameter="0.315" length="249.1" innerDiameter="0.2101" id="Pipe51_a_ret" state="OPTIONAL" related="Pipe51_a">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.33219957498349" lat="52.054817000711104" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.334007561882603" lat="52.05287394837437" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="442c90bc-79fa-41e4-85bb-abf96e05feee" name="In_ret" connectedTo="ca7ee8ee-caa3-4ae4-ae4b-c1ab3604022e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="a0825eaa-aa90-4df6-b0e1-115903aaae38" name="Out_ret" connectedTo="ca8dd588-f4c7-45c8-bae8-eba8c790c466" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe51_b_ret" outerDiameter="0.315" length="34.31" innerDiameter="0.2101" id="Pipe51_b_ret" state="OPTIONAL" related="Pipe51_b">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.331932043163073" lat="52.05507781056326" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.33219957498349" lat="52.054817000711104" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="3b2d411f-d681-4539-a42f-4e6bc5df4f41" name="In_ret" connectedTo="8b9f02d3-cbb2-4584-b8f7-16e181318b58" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="e703e2e0-2a3c-48fb-89ef-19d0fd0109ed" name="Out_ret" connectedTo="621ab362-a3a1-464c-ae55-ecda1ee72c32" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe110_ret" outerDiameter="0.56" length="63.0" innerDiameter="0.3938" id="Pipe110_ret" state="OPTIONAL" related="Pipe110">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.33219957498349" lat="52.054817000711104" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3330904520510565" lat="52.05496214003323" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="6fa9faf7-af3b-4987-90a8-847da7591e45" name="In_ret" connectedTo="ca7ee8ee-caa3-4ae4-ae4b-c1ab3604022e" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="8410eb59-05a7-4f17-aca6-9cca0adcaf05" name="Out_ret" connectedTo="49c5ab59-21bf-4d65-9071-1c73a003cfa5" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe113_ret" outerDiameter="0.56" length="36.1" innerDiameter="0.3938" id="Pipe113_ret" state="OPTIONAL" related="Pipe113">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.332074580336848" lat="52.05221100992171" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.331839331594479" lat="52.0525013050262" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="4bb8d3f2-2399-44fc-91e4-d3d10dc7efd6" name="In_ret" connectedTo="ba9aa151-e244-4a01-bbb3-1c4ead3f8e8a" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="32a75cd3-df73-4797-988c-af0b84e781c3" name="Out_ret" connectedTo="b059f601-3773-4380-bc23-34cc480bc769" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe115_ret" outerDiameter="0.56" length="57.8" innerDiameter="0.3938" id="Pipe115_ret" state="OPTIONAL" related="Pipe115">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.336775182356948" lat="52.048813097442256" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.335970076217015" lat="52.04865474182142" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="c1a2f0f9-6cc0-4483-9175-62f12eda11b4" name="In_ret" connectedTo="f5813dd3-9d4c-4aa8-9e00-a9ec870007b3" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="e238321b-26ad-4b91-8314-7e1624b36a94" name="Out_ret" connectedTo="9548a1f0-f3eb-4a95-a592-2356ab97130c" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
      <asset xsi:type="esdl:Pipe" diameter="DN500" name="Pipe117_ret" outerDiameter="0.56" length="24.1" innerDiameter="0.3938" id="Pipe117_ret" state="OPTIONAL" related="Pipe117">
        <geometry xsi:type="esdl:Line">
          <point xsi:type="esdl:Point" lon="4.309229489199389" lat="52.044559569551275" CRS="WGS84"/>
          <point xsi:type="esdl:Point" lon="4.3095618774998306" lat="52.04448904517101" CRS="WGS84"/>
        </geometry>
        <port xsi:type="esdl:InPort" id="d4c7ba6d-d591-4fe9-8436-b9aaa334e1db" name="In_ret" connectedTo="885f141c-5637-42e1-bf5b-2a42c628f75d" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
        <port xsi:type="esdl:OutPort" id="f2dc36cf-a2ab-41e1-933a-dfe5a1d8c118" name="Out_ret" connectedTo="6df6baf1-2c39-49c3-ad57-1911dd437fdf" carrier="39ec9ed1-30d6-40db-83a4-1bac7b0b3c75_ret"/>
      </asset>
    </area>
  </instance>
</esdl:EnergySystem>
