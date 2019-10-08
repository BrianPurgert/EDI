require 'stupidedi'

# ╔════════════════════════════════════════════════════════════════════════════════╗
# ║     832 Transaction (Ver/Rel 3050) Vendor Catalog data for GSA Advantage!      ║
# ╚════════════════════════════════════════════════════════════════════════════════╝
#                 📌 Generate the 832 file using version 4010
#                 📌 Convert the 832 file to version 3050

config = Stupidedi::Config.contrib


# ╔════════════════════════════╗
# ║          Heading           ║
# ╚════════════════════════════╝

# Link the "03050" value in ISA12 element to the 3050 interchange definition
config.interchange.register("03050") do
	Stupidedi::Versions::Interchanges::ThirtyFifty::InterchangeDef
	# Stupidedi::Versions::Interchanges::FortyTen::InterchangeDef
end


# Link the "005010" value in GS08 to the 5010 functional group definition
config.functional_group.register("003050") do
	Stupidedi::Versions::FunctionalGroups::ThirtyFifty::FunctionalGroupDef
	# Stupidedi::Versions::FunctionalGroups::FortyTen::FunctionalGroupDef

end

# Link "005010X222" in GS08 or ST03, "HC" in GS01, and "837"
# in ST01 to the implementation guide definition
#       def register(gs08, gs01, st01, definition = nil, &constructor)
config.transaction_set.register("003050", "SC", "832") do
	Stupidedi::Guides::ThirtyFifty::X222::HC837P
	Stupidedi::Guides::FortyTen::X222::HC837P
end
b = Stupidedi::Parser::BuilderDsl.build(config)












# ╔════════════════════════════╗
# ║          Detail            ║
# ╚════════════════════════════╝




# ╔════════════════════════════╗
# ║          Summary           ║
# ╚════════════════════════════╝



# ISA‡00‡          ‡00‡          ‡01‡089476055      ‡01‡012966339SIP   ‡170725‡1936‡U‡03050‡720670601‡0‡T‡¤
# GS‡SC‡GS07F078BA‡012966339SIP‡170725‡1936‡720670601‡X‡003050
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