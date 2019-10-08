declare function local:thisDate($size as xs:integer) as xs:string {
	translate(substring(xs:string(current-date()), if ($size = 6) then 3 else 1, if ($size = 6) then 8 else 10), '-', '')
};
declare function local:thisTime() as xs:string {
	translate(substring(xs:string(current-time()), 1, 5), ':', '')
};

declare option ddtek:serialize "method=EDI:group=always:long=all:value=attribute";
<X12>
	<INTERCHANGE>
		<ISA-IsaSegmentType>
			<ISA01-AuthorizationInformationQualifier decode="" value="00"><!--I01--></ISA01-AuthorizationInformationQualifier>
			<ISA02-AuthorizationInformation value="          "><!--I02--></ISA02-AuthorizationInformation>
			<ISA03-SecurityInformationQualifier decode="" value="00"><!--I03--></ISA03-SecurityInformationQualifier>
			<ISA04-SecurityInformation value="          "><!--I04--></ISA04-SecurityInformation>
			<ISA05-InterchangeIdQualifier decode="" value="ZZ"><!--I05--></ISA05-InterchangeIdQualifier>
			<ISA06-InterchangeSenderId value="ISENDER        "><!--I06--></ISA06-InterchangeSenderId>
			<ISA07-InterchangeIdQualifier decode="" value="ZZ"><!--I05--></ISA07-InterchangeIdQualifier>
			<ISA08-InterchangeReceiverId value="IRECEIVER      "><!--I07--></ISA08-InterchangeReceiverId>
			<ISA09-InterchangeDate decode="" value="{ local:thisDate(6) }"><!--I08--></ISA09-InterchangeDate>
			<ISA10-InterchangeTime decode="" value="{ local:thisTime() }"><!--I09--></ISA10-InterchangeTime>
			<ISA11-InterchangeControlStandards decode="" value="U"><!--I10--></ISA11-InterchangeControlStandards>
			<ISA12-InterchangeControlVersion decode="" value="00305"><!--I11--></ISA12-InterchangeControlVersion>
			<ISA13-InterchangeControlNumber value="999999999"><!--I12--></ISA13-InterchangeControlNumber>
			<ISA14-AcknowledgmentRequested decode="" value="0"><!--I13--></ISA14-AcknowledgmentRequested>
			<ISA15-TestIndicator decode="" value="T"><!--I14--></ISA15-TestIndicator>
			<ISA16-ComponentElementSeparator value=":"><!--I15--></ISA16-ComponentElementSeparator>
		</ISA-IsaSegmentType>
		<GROUP>
			<GS-GsSegmentType>
				<GS01-FunctionalIdentifierCode decode="" value="SC"><!--479--></GS01-FunctionalIdentifierCode>
				<GS02-ApplicationSendersCode value="ASENDER"><!--142--></GS02-ApplicationSendersCode>
				<GS03-ApplicationReceiversCode value="ARECEIVER"><!--124--></GS03-ApplicationReceiversCode>
				<GS04-Date decode="" value="{ local:thisDate(6) }"><!--373--></GS04-Date>
				<GS05-Time decode="" value="{ local:thisTime() }"><!--337--></GS05-Time>
				<GS06-GroupControlNumber value="888888888"><!--28--></GS06-GroupControlNumber>
				<GS07-ResponsibleAgencyCode decode="" value="X"><!--455--></GS07-ResponsibleAgencyCode>
				<GS08-VersionReleaseIndustry decode="" value="003050"><!--480--></GS08-VersionReleaseIndustry>
			</GS-GsSegmentType>
			<TS_832>
				<ST-StSegmentType>
					<ST01-TransactionSetIdentifierCode decode="" value="832"><!--143--></ST01-TransactionSetIdentifierCode>
					<ST02-TransactionSetControlNumber value="777777777"><!--329--></ST02-TransactionSetControlNumber>
				</ST-StSegmentType>
				<BCT-Bct-7SegmentType>
					<BCT01-CatalogPurposeCode decode="" value=""><!--683--></BCT01-CatalogPurposeCode>
					<BCT02-CatalogNumber value=""><!--684--></BCT02-CatalogNumber>
					<BCT10-TransactionSetPurposeCode decode="" value=""><!--353--></BCT10-TransactionSetPurposeCode>
				</BCT-Bct-7SegmentType>
				<TS_832_GROUP_1 tag="GROUP_1">
					<N1-N1-RSegmentType>
						<N101-EntityIdentifierCode decode="" value=""><!--98--></N101-EntityIdentifierCode>
					</N1-N1-RSegmentType>
					<N2-N2SegmentType>
						<N201-Name value=""><!--93--></N201-Name>
					</N2-N2SegmentType>
					<N3-N3SegmentType>
						<N301-AddressInformation value=""><!--166--></N301-AddressInformation>
					</N3-N3SegmentType>
					<N4-N4SegmentType/>
					<REF-Ref-ASegmentType>
						<REF01-ReferenceNumberQualifier decode="" value=""><!--128--></REF01-ReferenceNumberQualifier>
					</REF-Ref-ASegmentType>
					<PER-PerSegmentType>
						<PER01-ContactFunctionCode decode="" value=""><!--366--></PER01-ContactFunctionCode>
					</PER-PerSegmentType>
				</TS_832_GROUP_1>
				<CTT-Ctt-ASegmentType>
					<CTT01-NumberOfLineItems value=""><!--354--></CTT01-NumberOfLineItems>
				</CTT-Ctt-ASegmentType>
				<SE-SeSegmentType>
					<SE01-NumberOfIncludedSegments value="10"><!--96--></SE01-NumberOfIncludedSegments>
					<SE02-TransactionSetControlNumber value="777777777"><!--329--></SE02-TransactionSetControlNumber>
				</SE-SeSegmentType>
			</TS_832>
			<GE-GeSegmentType>
				<GE01-NumberOfTransactionSets value="1"><!--97--></GE01-NumberOfTransactionSets>
				<GE02-GroupControlNumber value="888888888"><!--28--></GE02-GroupControlNumber>
			</GE-GeSegmentType>
		</GROUP>
		<IEA-IeaSegmentType>
			<IEA01-NumberOfIncludedFunctional value="1"><!--I16--></IEA01-NumberOfIncludedFunctional>
			<IEA02-InterchangeControlNumber value="999999999"><!--I12--></IEA02-InterchangeControlNumber>
		</IEA-IeaSegmentType>
	</INTERCHANGE>
</X12>(: Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="X12 003050 832" userelativepaths="yes" externalpreview="no" useresolver="yes" url="" outputurl="" processortype="datadirect" tcpport="4849688" profilemode="0" profiledepth="" profilelength="" urlprofilexml=""
		          commandline="" additionalpath="" additionalclasspath="" postprocessortype="none" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext="" host="" port="0" user="" password="" validateoutput="no"
		          validator="internal" customvalidator="">
			<advancedProperties name="CollectionURIResolver" value=""/>
			<advancedProperties name="ModuleURIResolver" value=""/>
			<advancedProperties name="DocumentURIResolver" value=""/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="832 003050 Schema Mandatory Segments Elements.xsd" destSchemaRoot="X12" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no"/>
		<MapperBlockPosition></MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
:)