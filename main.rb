require 'pry'

# To initialize and enable our program to run SQLITE3 : 
require 'sqlite3'

# Here, we create the actual database if it's not created yet.
# Otherwise, it will simply load the existing database: 
# ex: DATABASENAME = DATABASEINTERPRETERNAME::Databaseobjectname.new('yourdesired_database_name')

DATABASE = SQLite3::Database.new('warehousemanager.db')

# Here, we load category, location and product files so we don't need to in 
# every file

require_relative "category"
require_relative "location"
require_relative "product"

binding.pry
