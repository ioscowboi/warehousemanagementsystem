require "minitest/autorun"

require "sqlite3"

DATABASE = SQLite3::Database.new("warehouse_test.db")

require_relative "database_setup.rb"
require_relative "product.rb"
require_relative "category.rb"
require_relative "location.rb"

class WarehouseTest < Minitest::Test
  
  def setup
    DATABASE.execute("DELETE FROM products") # products is the table name
    DATABASE.execute("DELETE FROM locations") # locations is the table name
    DATABASE.execute("DELETE FROM categories") # categories is the table name
  end
  
end