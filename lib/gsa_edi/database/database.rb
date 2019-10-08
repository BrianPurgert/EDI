require 'mysql2'
require 'sequel'
require 'logger'

ENV['MYSQL_EAST_HOST']    = '162.155.36.70'
ENV['MYSQL_DATABASE']     = 'edi'
ENV['MYSQL_EAST_USER']    = 'brian'
ENV['MYSQL_EAST_PASS']    = 'JBM123!@#'

DP = Sequel.connect(
	adapter:          "mysql2",
	host:             ENV['MYSQL_EAST_HOST'],
	database:         ENV['MYSQL_DATABASE'],
	user:             ENV['MYSQL_EAST_USER'],
	password:         ENV['MYSQL_EAST_PASS'],
	max_connections:  6,
	preconnect:       "concurrently"
)

DP.extension      :schema_dumper
Sequel.extension  :core_extensions
DP.loggers << Logger.new($stdout)


def schema(db, prefix = nil)
	schemas = []
	db.tables.each do |table_name|
		table_str = table_name.to_s.downcase
		if prefix.nil? or table_str.start_with? prefix.downcase
			schemas << db.schema(table_name)
		end
	end
	schemas
end