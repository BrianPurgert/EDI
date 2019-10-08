require_relative '832_v3050_helper'
require_relative 'database/database'
require_relative 'database/vendor_catalog_schema'
require_relative 'import/excel_to_db'

# ╔════════════════════════════════════════════════════════════════════════════════╗
# ║     832 Transaction (Ver/Rel 3050) Vendor Catalog data for GSA Advantage!      ║
# ╚════════════════════════════════════════════════════════════════════════════════╝

🧪 = true
💵⬇ = false

ELEMENT_SEPARATOR      = 🧪 ? "*"    : "\x1d" # element separator  (*) sip uses ‡
SEGMENT_TERMINATOR     = 🧪 ? "\r\n" : "\x1c" # segment terminator (>) (following the ISA16 segment) sip uses "\r\n"
COMPONENT_SEPARATOR    = 🧪 ? "¤"    : "\x1f" # Subelement (component) separator (ISA16) sip uses ¤

interchange_control_number          = group_control_number = rand(100000000..999999999)
transaction_set_control_number      = "371CDFCE"
transaction_set_purpose_code        = 💵⬇ ? "42" : "05"
@vendor_catalog                     = ''
@number_of_included_segments        = 1

def vendor_catalog(line)
	@vendor_catalog << line << SEGMENT_TERMINATOR
	@number_of_included_segments += 1
end

delete_sip_tables
create_vendor_catalog_tables
# excel_catalog("F:/🗃 FILES/Government Contract Services, Inc/Company Wide - Documents/Gold Clients/WorldWide Medical Products/SIP")
excel_catalog("F:/AppDev/Projects/EDI/Import")

icorpet = DP[:icorpet].first
icontr  = DP[:icontr].first
ap icorpet
ap icontr



#╔═══╦1══╦2════════╦3══╦4════════╦5═╦6══════════════╦7═╦8══════════════╦10════╦11══╦12╦13══╦14═══════╦15╦16╦═══╦═╗
#║ISA‡00‡          ‡00‡          ‡01‡089476055      ‡01‡012966339SIP   ‡170725‡1936‡U‡03050‡720670601‡0‡T‡¤
#║ISA‡00‡          ‡00‡          ‡01‡099103111      ‡01‡012966339SIP   ‡190226‡1034‡U‡3050‡905738082‡0‡T‡¤
#║ISA*00*         *00*          *01*999999999     *01*012966339      *081210*1530*U*03050*834555835*0*P*¤
#╔ISA╦═══════════════════════════════════════════════════════╗
#║ 01║ 00 – No Authorization Information Present
#║ 02║ Blanks
#║ 03║ 00 – No Security Information Present
#║ 04║ Blanks
#║ 05║ ID Qualifier
#║ 06║ Sender’s ID
#║ 07║ ID Qualifier
#║ 08║ Receiver’s ID
#║ 09║ Interchange Date                   DT 6/6
#║ 10║ Interchange Time                   TM 4/4
#║ 11║ U – US community of ASC X12
#║ 12║ Interchange Control Version        ID 5/5  00305
#║ 13║ Interchange Control Number         N0 9/9
#║ 14║ 0 – No Acknowledgment  || 1 – Acknowledgment Requested
#║ 15║ T – Test Data          || P – Production Data
#║ 16║ Component Element Separator
#╚═══╩═══════════════════════════════════════════════════════╝

# ISA GSA Trading Partner ID: ZZ:GSAADV

vendor_catalog "ISA⏺00⏺#{🔟}⏺00⏺#{🔟}⏺01⏺#{icorpet[:DUNS_NO].ljust(15)}⏺01⏺#{GSA_DUNS.ljust(15)}⏺📅⏺🕛⏺U⏺03050⏺#{interchange_control_number}⏺1⏺#{🧪 ? 'T' : 'P'}⏺#{COMPONENT_SEPARATOR}"

#╔═GS╦═══════════════════════════════════════════════════════╗
#║ 01║ Functional ID Code           ID 2/2
#║ 02║ Application Sender’s Code    AN 2/15
#║ 03║ Application Receiver’s Code  AN 2/15
#║ 04║ Group Date                   DT 6/6
#║ 05║ Group Time                   TM 4/4
#║ 06║ Group Control Number         N0 1/9
#║ 07║ X – ASC X12                  ID 1/2
#║ 08║ Version                      AN 1/12 003050
#╔═══╦1═════╦2══════════╦3══════════════╦4═══════╦5══════╦6═════════════╦7════╦8═════╗
#║GS  *SC   *999999999  *012966339      *081210 *1530    *834555835     *X    *003050
#║GS  ‡SC   ‡GS07F078BA ‡012966339SIP   ‡170725 ‡1936    ‡720670601     ‡X    ‡003050
#║GS  ‡SC   ‡GS07F174CA ‡012966339SIP   ‡190226 ‡1034    ‡905738082     ‡X    ‡003050
# GS GSA Trading Partner ID: GSAADV
# GS03 is 012966339
vendor_catalog "GS⏺SC⏺#{icontr[:CONTNUM].gsub('-','').ljust(13)}⏺#{GSA_DUNS.ljust(15)}⏺📅⏺🕛⏺#{group_control_number}⏺X⏺003050"

vendor_catalog "ST⏺832⏺#{transaction_set_control_number}"

vendor_catalog "BCT⏺CP⏺#{icontr[:CAT_MODS]}⏺⏺#{icontr[:REV_NUM]}⏺⏺⏺⏺⏺⏺#{transaction_set_purpose_code}"
vendor_catalog "REF⏺GC⏺#{icontr[:CONTNUM]}"
vendor_catalog "REF⏺W6⏺#{icontr[:SCHEDCAT]}"

vendor_catalog "REF⏺TN⏺⏺#{icontr[:CONTNUM]}_#{icontr[:REF_FILE]}"
vendor_catalog "REF⏺92⏺#{icontr[:CAT_MODS]}"

unless 💵⬇
vendor_catalog "REF⏺ME⏺⏺#{icorpet[:V_WWW]}"
vendor_catalog "DTM⏺007⏺170821⏺⏺⏺20" # date century
vendor_catalog "CTB⏺OR⏺⏺⏺⏺MO⏺10000"
vendor_catalog "CTB⏺OR⏺540 11,540 12,540 16,540 2,540 21,540 3,603 5,615 19,66 137,566 2,566 3,603 1⏺⏺⏺MA⏺40000000"
vendor_catalog "CTB⏺OR⏺66 1002,66 616⏺⏺⏺MA⏺15000000"
vendor_catalog "CTB⏺OR⏺602 30,602 32⏺⏺⏺MA⏺30000000"
vendor_catalog "CTB⏺OR⏺603 10,603 13,603 2,603 3,603 4,603 7,615 18,66 102,66 141,66 147,66 148,66 231⏺⏺⏺MA⏺40000000"
vendor_catalog "ITD⏺⏺⏺⏺⏺⏺⏺⏺⏺⏺⏺⏺⏺⏺N"
vendor_catalog "LDT⏺#{icontr[:LEADTIME]}⏺#{icontr[:C_DELIV]}⏺DA"
vendor_catalog "FOB⏺PP⏺OR"
end
#                 Receiver
vendor_catalog "N1⏺40⏺⏺1⏺#{GSA_DUNS}"
vendor_catalog "N1⏺SE⏺#{icorpet[:VENDNAME]}⏺1⏺#{icorpet[:DUNS_NO]}"
vendor_catalog "N2⏺#{icorpet[:DIVISION]}"
vendor_catalog "N3⏺#{icorpet[:V_STR1]}"
vendor_catalog "N4⏺#{icorpet[:V_CITY]}⏺#{icorpet[:V_STATE]}⏺#{icorpet[:V_ZIP]}⏺#{icorpet[:V_CTRY]}"
vendor_catalog "REF⏺4A⏺********"
vendor_catalog "PER⏺OD⏺#{icorpet[:VENDNAME]}⏺TE⏺#{icorpet[:V_PHONE]}⏺FX⏺#{icorpet[:V_FAX]}⏺EM⏺#{icorpet[:V_EMAIL]}"
vendor_catalog "PER⏺AC⏺#{icontr[:A_NAME]}⏺TE⏺#{icontr[:A_PHONE]}⏺FX⏺#{icontr[:A_FAX]}⏺EM⏺#{icontr[:A_EMAIL]}"
vendor_catalog "N1⏺DZ⏺⏺ZN⏺00"
vendor_catalog "N4⏺⏺HI⏺⏺⏺OA"
vendor_catalog "N1⏺DZ⏺⏺ZN⏺00"
vendor_catalog "N4⏺⏺AK⏺⏺⏺OA"
vendor_catalog "N1⏺DZ⏺⏺ZN⏺00"
vendor_catalog "N4⏺⏺PR⏺⏺⏺OA"


vendor_catalog "LIN⏺1⏺MG⏺1366S0⏺ZZ⏺BOEKEL⏺PD⏺PIPET BOX  - EACH⏺CH⏺DE⏺PI⏺540 11⏺VP⏺41171063"
vendor_catalog "REF⏺51⏺⏺WWLSLogo.jpg"
vendor_catalog "PID⏺F⏺WD⏺⏺⏺STANDARD WARRANTY"
vendor_catalog "PID⏺F⏺⏺⏺⏺Pipet Box  - Each"
vendor_catalog "PO4⏺⏺⏺⏺UNT⏺⏺1.000⏺LB⏺1.000⏺CF⏺1⏺1⏺1⏺IN"
vendor_catalog "LDT⏺AE⏺3⏺DA"
vendor_catalog "FOB⏺PS⏺DE"
vendor_catalog "CTP⏺⏺D01⏺27.51⏺1⏺EA"
vendor_catalog "CTP⏺⏺MSR⏺37.4⏺⏺⏺⏺⏺⏺⏺00"
vendor_catalog "N1⏺DZ⏺⏺ZN⏺00"
vendor_catalog "N4⏺⏺HI⏺⏺⏺DE"
vendor_catalog "N1⏺DZ⏺⏺ZN⏺00"
vendor_catalog "N4⏺⏺AK⏺⏺⏺DE"
vendor_catalog "N1⏺DZ⏺⏺ZN⏺00"
vendor_catalog "N4⏺⏺PR⏺⏺⏺DE"

#║ Close ║
vendor_catalog "CTT⏺#{@number_of_line_items}"
vendor_catalog "SE⏺#{@number_of_included_segments}⏺#{transaction_set_control_number}"
vendor_catalog "GE⏺1⏺#{group_control_number}"
vendor_catalog "IEA⏺1⏺#{interchange_control_number}"

@vendor_catalog.gsub!('⏺', ELEMENT_SEPARATOR)
@vendor_catalog.gsub!('📅', 📅)
@vendor_catalog.gsub!('🕛', 🕛)
print @vendor_catalog