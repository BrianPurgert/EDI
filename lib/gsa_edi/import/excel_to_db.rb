require 'roo'
require 'roo-xls'
require 'find'
require 'creek'
require_relative 'excel_data_parser'


SIP_FILE   = /I(ACCXPRO|BPA|COLORS|CONTR|CORPET|FABRICS|MOLS|MSG|OPTIONS|PHOTO|PRICE|PROD|QTYVOL|REMITOR|SPECTER|ZONE)\.xlsx?$/i
SIP_TABLES = [:iaccxpro,:ibpa,:icolors,:icontr,:icorpet,:imols,:ioptions,:iprice,:iprod,:iqtyvol,:iremitor,:ispecter,:izone,:ifabrics,:imsg,:iphoto]



def truncate_tables
	puts "Truncate SIP Tables? (Y/N)".colorize(:green)
	if gets.to_s.upcase.include? 'Y'
		SIP_TABLES.each { |table| DP[table].truncate  }
	end

end

def excel_catalog(import_dir)
	puts "Import SIP Tables from Excel? (Y/N)".colorize(:green)
	if gets.to_s.upcase.include? 'Y'
		truncate_tables
		Find.find(import_dir) do |path|
			if (FileTest.directory?(path) && path != import_dir) || (path.include? '~')
				puts "Pruning: #{path}"
                        Find.prune
			elsif path =~ SIP_FILE
				puts "Adding: #{path}"
				table = File.basename(path, ".*").downcase.to_sym
				excel_catalog_import(path, table)
			end
		end

	end
end


def excel_upload(xls,table)
	commit_every = 500
	row_index = 0
	rows = []

	xls.each(clean: true) do |row|

	# xls.each(clean: true, header_search: [/CONTNUM|VENDNAME/]) do |row|
		unless row_index == 0
			puts row
			rows << row
		end
		row_index =+ 1
		if rows.size > commit_every
			DP[table].multi_insert(rows)
			rows = []
		end
	end
	ap rows
	DP[table].multi_insert(rows) unless rows.empty?
end


def excel_catalog_import(path, table)
	puts "importing #{table}"

	xlsx = ExcelDataParser.new(path,table)
	xlsx.call
	# open_file = open_excel(path)
			# sheet_data = open_file[:file].parse(clean: true, header_search: [/CONTNUM|VENDNAME/])
			# DP[table].multi_insert(sheet_data,commit_every: 1500)
			# excel_upload(open_file ,table)

end

def open_excel(path)
	 file_name = Pathname.new(path).basename
	unless path.include? '~'
		begin
			# open_file = Roo::Spreadsheet.open(path, extension: :xlsx)
		rescue
			open_file = Roo::Spreadsheet.open(path, extension: :xls)
		rescue Exception => exception
			puts exception
		end
	end
	open_file
end

