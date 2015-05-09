require 'virtus'
require 'aasm'
require 'pry'

Dir["#{__dir__}/sql_server_2016/**/*.rb"].each { |f| require f }

DB = SqlServer2016::Database.new

Dir["#{__dir__}/xelnaga/**/*.rb"].each { |f| require f }
Dir["#{__dir__}/**/*.rb"].each { |f| require f }
