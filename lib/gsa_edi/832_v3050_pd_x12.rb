require 'nokogiri'
require 'x12'


vendor_duns = "099103111"
gsa_duns    = "012966339"


# ╔════════════════════════════════════════════════════════════════════════════════╗
# ║     832 Transaction (Ver/Rel 3050) Vendor Catalog data for GSA Advantage!      ║
# ╚════════════════════════════════════════════════════════════════════════════════╝
parser = X12::Parser.new('832.xml')
r = parser.factory('832')


r.ISA.AuthorizationInformationQualifier = "00"
r.ISA.AuthorizationInformation = nil
r.ISA.SecurityInformationQualifier = "00"
r.ISA.SecurityInformation = nil
r.ISA.InterchangeIdQualifier1 = "01"
r.ISA.InterchangeSenderId = vendor_duns
r.ISA.InterchangeIdQualifier2 = "01"
r.ISA.InterchangeReceiverId = gsa_duns
# r.ISA.InterchangeDate =
# r.ISA.InterchangeTime
# r.ISA.InterchangeControlStandardsIdentifier
# r.ISA.InterchangeControlVersionNumber = 03050
# r.ISA.InterchangeControlNumber
# r.ISA.AcknowledgmentRequested
# r.ISA.UsageIndicator
# r.ISA.ComponentElementSeparator

# ISA‡00‡          ‡00‡          ‡01‡089476055      ‡01‡012966339SIP   ‡170725‡1936‡U‡03050‡720670601‡0‡T‡¤
# GS‡SC‡GS07F078BA‡012966339SIP‡170725‡1936‡720670601‡X‡003050
# 📌 ISA12 is 03050
# 📌 GS08 is 003050

r.ST.TransactionSetIdentifierCode = 832
r.ST.TransactionSetControlNumber  = '1337'


# ╔════════════════════════════╗
# ║          Heading           ║
# ╚════════════════════════════╝


# ╔════════════════════════════╗
# ║          Detail            ║
# ╚════════════════════════════╝


# ╔════════════════════════════╗
# ║          Summary           ║
# ╚════════════════════════════╝


puts r.render


# ST‡832‡2AF48F89
# BCT‡CP‡‡‡‡‡‡‡‡‡42
# REF‡GC‡GS-07F-078BA
# REF‡W6‡66
# REF‡92‡100
# N1‡40‡‡1‡012966339SIP7.9c
# N1‡SE‡INTERCOMP‡1‡089476055
# N3‡3839 COUNTY ROAD 116
# N4‡MEDINA‡MN‡55340‡US
# REF‡4A‡********
# PER‡OD‡INTERCOMP‡TE‡763-476-2531‡FX‡763-476-2613‡EM‡ericl@intercompcompany.com
# PER‡AC‡ERIC LARSON‡TE‡763-476-2531‡FX‡763-476-2613‡EM‡ericl@intercompcompany.com
# LIN‡1‡MG‡MH300-D-S‡ZZ‡INTERCOMP‡PD‡MH300 SOLAR MATERIAL HANDLING 4 SENSOR S‡CH‡US‡PI‡66 320
# G53‡001
# CTP‡‡GTP‡9063.967‡1‡EA‡‡‡‡‡00
# DTM‡015‡170726‡‡‡20
# DTM‡016‡170729‡‡‡20
# CTT‡1
# SE‡19‡2AF48F89
# GE‡1‡720670601
# IEA‡1‡720670601