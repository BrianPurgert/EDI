declare function local:thisDate($size as xs:integer) as xs:string {
	translate(substring(xs:string(current-date()), if ($size = 6) then 3 else 1, if ($size = 6) then 8 else 10), '-', '')
};
declare function local:thisTime() as xs:string {
	translate(substring(xs:string(current-time()), 1, 5), ':', '')
};

declare option ddtek:serialize "method=EDI:long=all";
<X12>
	<ISA-IsaSegmentType>
		<ISA01-AuthorizationInformationQualifier><!--I01-->00</ISA01-AuthorizationInformationQualifier>
		<ISA02-AuthorizationInformation><!--I02-->          </ISA02-AuthorizationInformation>
		<ISA03-SecurityInformationQualifier><!--I03-->00</ISA03-SecurityInformationQualifier>
		<ISA04-SecurityInformation><!--I04-->          </ISA04-SecurityInformation>
		<ISA05-InterchangeIdQualifier><!--I05-->ZZ</ISA05-InterchangeIdQualifier>
		<ISA06-InterchangeSenderId><!--I06-->ISENDER        </ISA06-InterchangeSenderId>
		<ISA07-InterchangeIdQualifier><!--I05-->ZZ</ISA07-InterchangeIdQualifier>
		<ISA08-InterchangeReceiverId><!--I07-->IRECEIVER      </ISA08-InterchangeReceiverId>
		<ISA09-InterchangeDate><!--I08-->{ local:thisDate(6) }</ISA09-InterchangeDate>
		<ISA10-InterchangeTime><!--I09-->{ local:thisTime() }</ISA10-InterchangeTime>
		<ISA11-InterchangeControlStandards><!--I10-->U</ISA11-InterchangeControlStandards>
		<ISA12-InterchangeControlVersion><!--I11-->00305</ISA12-InterchangeControlVersion>
		<ISA13-InterchangeControlNumber><!--I12-->999999999</ISA13-InterchangeControlNumber>
		<ISA14-AcknowledgmentRequested><!--I13-->0</ISA14-AcknowledgmentRequested>
		<ISA15-TestIndicator><!--I14-->T</ISA15-TestIndicator>
		<ISA16-ComponentElementSeparator><!--I15-->:</ISA16-ComponentElementSeparator>
	</ISA-IsaSegmentType>
	<GS-GsSegmentType>
		<GS01-FunctionalIdentifierCode><!--479-->SA</GS01-FunctionalIdentifierCode>
		<GS02-ApplicationSendersCode><!--142-->ASENDER</GS02-ApplicationSendersCode>
		<GS03-ApplicationReceiversCode><!--124-->ARECEIVER</GS03-ApplicationReceiversCode>
		<GS04-Date><!--373-->{ local:thisDate(6) }</GS04-Date>
		<GS05-Time><!--337-->{ local:thisTime() }</GS05-Time>
		<GS06-GroupControlNumber><!--28-->888888888</GS06-GroupControlNumber>
		<GS07-ResponsibleAgencyCode><!--455-->X</GS07-ResponsibleAgencyCode>
		<GS08-VersionReleaseIndustry><!--480-->003050</GS08-VersionReleaseIndustry>
	</GS-GsSegmentType>
	<TS_104>
		<ST-StSegmentType>
			<ST01-TransactionSetIdentifierCode><!--143-->104</ST01-TransactionSetIdentifierCode>
			<ST02-TransactionSetControlNumber><!--329-->777777777</ST02-TransactionSetControlNumber>
		</ST-StSegmentType>
		<N1-N1SegmentType>
			<N101-EntityIdentifierCode><!--98--></N101-EntityIdentifierCode>
		</N1-N1SegmentType>
		<GROUP_1>
			<FOB-FobSegmentType>
				<FOB01-ShipmentMethodOfPayment><!--146--></FOB01-ShipmentMethodOfPayment>
			</FOB-FobSegmentType>
			<SL1-Sl1SegmentType>
				<SL101-ServiceLevelCode><!--284--></SL101-ServiceLevelCode>
			</SL1-Sl1SegmentType>
			<N9-N9SegmentType>
				<N901-ReferenceNumberQualifier><!--128--></N901-ReferenceNumberQualifier>
			</N9-N9SegmentType>
			<TD4-Td4SegmentType/>
			<H1-H1SegmentType>
				<H101-HazardousMaterialCode><!--62--></H101-HazardousMaterialCode>
			</H1-H1SegmentType>
			<H2-H2SegmentType>
				<H201-HazardousMaterialDescription><!--64--></H201-HazardousMaterialDescription>
			</H2-H2SegmentType>
			<H3-H3SegmentType/>
			<DTM-DtmSegmentType>
				<DTM01-DateTimeQualifier><!--374--></DTM01-DateTimeQualifier>
			</DTM-DtmSegmentType>
			<M1-M1SegmentType>
				<M101-CountryCode><!--26--></M101-CountryCode>
			</M1-M1SegmentType>
			<C3-C3SegmentType>
				<C301-CurrencyCode><!--100--></C301-CurrencyCode>
			</C3-C3SegmentType>
			<X1-X1SegmentType/>
			<X2-X2SegmentType>
				<X201-ImportLicenseNumber><!--70--></X201-ImportLicenseNumber>
			</X2-X2SegmentType>
			<NTE-NteSegmentType>
				<NTE02-Description><!--352--></NTE02-Description>
			</NTE-NteSegmentType>
			<GROUP_2>
				<N1-N1SegmentType>
					<N101-EntityIdentifierCode><!--98--></N101-EntityIdentifierCode>
				</N1-N1SegmentType>
				<N2-N2SegmentType>
					<N201-Name><!--93--></N201-Name>
				</N2-N2SegmentType>
				<N3-N3SegmentType>
					<N301-AddressInformation><!--166--></N301-AddressInformation>
				</N3-N3SegmentType>
				<N4-N4SegmentType/>
				<N9-N9SegmentType>
					<N901-ReferenceNumberQualifier><!--128--></N901-ReferenceNumberQualifier>
				</N9-N9SegmentType>
				<PER-PerSegmentType>
					<PER01-ContactFunctionCode><!--366--></PER01-ContactFunctionCode>
				</PER-PerSegmentType>
			</GROUP_2>
			<GROUP_3>
				<L5-L5SegmentType/>
				<L0-L0SegmentType/>
				<L1-L1SegmentType/>
				<L4-L4SegmentType>
					<L401-Length><!--82--></L401-Length>
					<L402-Width><!--189--></L402-Width>
					<L403-Height><!--65--></L403-Height>
					<L404-MeasurementUnitQualifier><!--90--></L404-MeasurementUnitQualifier>
				</L4-L4SegmentType>
			</GROUP_3>
		</GROUP_1>
		<SE-SeSegmentType>
			<SE01-NumberOfIncludedSegments><!--96-->26</SE01-NumberOfIncludedSegments>
			<SE02-TransactionSetControlNumber><!--329-->777777777</SE02-TransactionSetControlNumber>
		</SE-SeSegmentType>
	</TS_104>
	<GE-GeSegmentType>
		<GE01-NumberOfTransactionSets><!--97-->1</GE01-NumberOfTransactionSets>
		<GE02-GroupControlNumber><!--28-->888888888</GE02-GroupControlNumber>
	</GE-GeSegmentType>
	<IEA-IeaSegmentType>
		<IEA01-NumberOfIncludedFunctional><!--I16-->1</IEA01-NumberOfIncludedFunctional>
		<IEA02-InterchangeControlNumber><!--I12-->999999999</IEA02-InterchangeControlNumber>
	</IEA-IeaSegmentType>
</X12>(: Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="X12 003050 104" userelativepaths="yes" externalpreview="no" useresolver="yes" url="" outputurl="" processortype="datadirect" tcpport="0" profilemode="0" profiledepth="" profilelength="" urlprofilexml="" commandline=""
		          additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" host="" port="0" user="" password="" validateoutput="no" validator="internal"
		          customvalidator="">
			<advancedProperties name="CollectionURIResolver" value=""/>
			<advancedProperties name="ModuleURIResolver" value=""/>
			<advancedProperties name="DocumentURIResolver" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition>
			<template name="xquery_body"></template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
:)