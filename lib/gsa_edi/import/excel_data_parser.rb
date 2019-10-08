require 'oxcelix'

class ExcelDataParser
	def initialize(file_path, table)
		@file_path  = file_path
		@table      = table
		@columns    = DP[table].columns
		@size       = @columns.size

		@records = []
		@counter = 1
	end

	BATCH_IMPORT_SIZE = 1000

	def call
		sheet_data = rows.map do |row|
			build_new_record(row)
		end
		sheet_data.drop(1)
		unless sheet_data.empty?
			DP[@table].import(@columns,sheet_data, commit_every: 1500)

		end

			# rows.each do |row|
		# 	increment_counter
		# 	records << build_new_record(row)
		# 	import_records if reached_batch_import_size? || reached_end_of_file?
		# end
	end

	attr_reader :file_path, :records
	attr_accessor :counter

	def book
		@book ||= Creek::Book.new(file_path)
	end

	def rows
		@rows ||= book.sheets.first.rows.drop(1)
	end

	def increment_counter
		self.counter += 1
	end

	def row_count
		@row_count ||= rows.count
	end

	def padright!(a, n, x)
		a.fill(x, a.length...n)
	end

	def fixed_array(other, size)
		Array.new(size) {|i| other[i]}
	end

	def build_new_record(row)
		fixed_array(row.values, @size)
	end

	def import_records
		DP[@table].import(@columns,records)
		records.clear
	end

	def reached_batch_import_size?
		(counter % BATCH_IMPORT_SIZE).zero?
	end

	def reached_end_of_file?
		counter == row_count
	end
end