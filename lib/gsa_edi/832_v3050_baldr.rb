require 'date'
require 'baldr'
require_relative '832_v3050_baldr_grammer'

module Baldr
	module Grammer
		module Version3050
			module Set832

				extend self

				def structure
					STRUCTURE
				end

				def record_defs
					Baldr::Grammar::Version3050::RECORD_DEFS
				end

				# VERSION           = '00403'    #version of ISA to send
				FUNCTIONAL_GROUP  = 'SC'

				STRUCTURE = {
		id: 'ST', min: 1, max: 1, level: [
		{id: 'BCT', min: 1, max: 1},
		{id: 'NTE', min: 0, max: 100},
		{id: 'CTP', min: 0, max: 100},
		{id: 'REF', min: 0, max: 12},
		{id: 'PER', min: 0, max: 3},
		{id: 'DTM', min: 0, max: 10},
		{id: 'CTB', min: 0, max: 25},
		{id: 'CUR', min: 0, max: 5},
		{id: 'ITD', min: 0, max: 2},
		{id: 'LDT', min: 0, max: 99999},
		{id: 'SAC', min: 0, max: 25},
		{id: 'FOB', min: 0, max: 1},
		{id: 'G93', min: 0, max: 50},
		{id: 'N1', min: 0, max: 200, level: [
		{id: 'N2', min: 0, max: 2},
		{id: 'N3', min: 0, max: 2},
		{id: 'N4', min: 0, max: 1},
		{id: 'REF', min: 0, max: 12},
		{id: 'PER', min: 0, max: 3},
		{id: 'DTM', min: 0, max: 10},
		]},
		{id: 'LIN', min: 0, max: 700000, level: [
		{id: 'G53', min: 0, max: 1},
		{id: 'SLN', min: 0, max: 100},
		{id: 'DTM', min: 0, max: 10},
		{id: 'REF', min: 0, max: 12},
		{id: 'PER', min: 0, max: 3},
		{id: 'CTB', min: 0, max: 25},
		{id: 'PID', min: 0, max: 200},
		{id: 'MEA', min: 0, max: 40},
		{id: 'PKG', min: 0, max: 25},
		{id: 'PO4', min: 0, max: 1},
		{id: 'TD4', min: 0, max: 10},
		{id: 'ITD', min: 0, max: 2},
		{id: 'LDT', min: 0, max: 1},
		{id: 'SAC', min: 0, max: 25},
		{id: 'FOB', min: 0, max: 1},
		{id: 'TC2', min: 0, max: 2},
		{id: 'TXI', min: 0, max: 1},
		{id: 'G39', min: 0, max: 1},
		{id: 'G55', min: 0, max: 1},
		{id: 'G54', min: 0, max: 1},
		{id: 'CTP', min: 0, max: 100, level: [
		{id: 'G40', min: 0, max: 99},
		{id: 'DTM', min: 0, max: 10},
		{id: 'G36', min: 0, max: 1},
		{id: 'LDT', min: 0, max: 1},
		{id: 'CUR', min: 0, max: 5},
		{id: 'PO4', min: 0, max: 1},
		{id: 'CTB', min: 0, max: 5},
		{id: 'REF', min: 0, max: 99999},
		{id: 'G43', min: 0, max: 9999},
		{id: 'SAC', min: 0, max: 5},
		{id: 'G26', min: 0, max: 99},
		]},
		{id: 'N1', min: 0, max: 200, level: [
		{id: 'N2', min: 0, max: 2},
		{id: 'N3', min: 0, max: 2},
		{id: 'N4', min: 0, max: 1},
		{id: 'REF', min: 0, max: 12},
		{id: 'PER', min: 0, max: 3},
		{id: 'DTM', min: 0, max: 10},
		]},
		{id: 'PKL', min: 0, max: 10, level: [
		{id: 'CTP', min: 0, max: 1},
		{id: 'PKG', min: 0, max: 2},
		]},
		]},
		{id: 'CTT', min: 1, max: 1},
		{id: 'SE', min: 1, max: 1},
		]}.freeze

			end
		end
	end
end



# ╔════════════════════════════════════════════════════════════════════════════════╗
# ║     832 Transaction (Ver/Rel 3050) Vendor Catalog data for GSA Advantage!      ║
# ╚════════════════════════════════════════════════════════════════════════════════╝

class GoodBuilderFromRealLife

	def build(builder)
		builder.ST do |st|
			st.ST01 '204'
			st.ST02 '000000006'
			st.B2 do |n|
				n.B202 'ODFL'
				n.B204 '04000000000000060'
				n.B206 'PP'
			end
			st.B2A do |n|
				n.B2A01 '00'
				n.B2A02 'ZZ'
			end
			st.G62 do |n|
				n.G6201 '64'
				n.G6202 '20121109'
			end
			segment_n1(st)
			st.S5 do
				S501 2
				S502 'CU'
				AT8 do
					AT801 'E'
					AT802 'L'
					AT803 145.0
					AT804 8
					AT806 'E'
					AT807 0
				end

				N1 do
					N101 'CN'
					N102 'Koch Air- INDY'

					N3 do
						N301 '5620 DIVIDEND DRIVE'
					end

					N4 do
						N401 'INDIANAPOLIS'
						N402 'IN'
						N403 '46241'
						N404 'US'
					end
				end

				OID do
					OID02 'K0822'
					OID04 'PC'
					OID05 1
					OID06 'L'
					OID07 145.0
					OID08 'E'
					OID09 0
				end
			end

			st.L3 do
				L301 145
				L302 'G'
				L309 0
				L310 'E'
				L311 8
				L312 'L'
			end
		end
	end

	def segment_n1(parent)
		parent.N1 do
			N101 'BT'
			N102 'AEROFLEX USA'

			N3 do
				N301 '282 Industrial Park Road'
			end

			n4 = create(:N4)
			n4.N401 'Sweetwater'
			n4.N402 'TN'
			n4.N403 '37874'
			n4.N404 'US'

			G61 do
				G6101 'IC'
				G6102 'Local Telephone'
				G6103 'TE'
				G6104 '4233372493'
			end
		end
	end

end

b = Baldr::Builder.new(
# standard_version_number: '00401',
# sender_id:                         '4233372493',
# sender_id_qualifier:               'ZZ',
# receiver_id_qualifier:             '02',
# receiver_id:                       'ODFL',
# date_time:                         DateTime.parse('121109 1642'),
# interchange_control_number:        '000000002',
# usage_indicator:                   'P',
# acknowledgment_requested:          '1',
# functional_groups_control_numbers: {'SM' => '2'}
)

GoodBuilderFromRealLife.new.build(b)

b.build_functional_groups
b.prepare!
Baldr::Types.convert_before_render!(b.envelope, Baldr::Grammar::Envelope)
Baldr::Validator.validate!(b.envelope, Baldr::Grammar::Envelope)

separators = {
component: "\x1F",
segment:   "\x1C",
element:   "\x1D"
}

output     = Baldr::Renderer::X12.draw(b.envelope, {separators: separators})









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

