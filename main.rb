require 'sinatra'

# To initialize and enable our program to run SQLITE3 : 
require 'sqlite3'

# Here, we create the actual database if it's not created yet.
# Otherwise, it will simply load the existing database: 
# ex: DATABASENAME = DATABASEINTERPRETERNAME::Databaseobjectname.new('yourdesired_database_name')

DATABASE = SQLite3::Database.new('warehousemanager.db')

require_relative 'database_setup.rb'
# Here, we load category, location and product files so we don't need to in 
# every file

require_relative "category"
require_relative "location"
require_relative "product"

# before "/first_page" do
#   @update_welcome = "and I'm using before filters!"
#   #use before filters to do things like validate if a user is logged in before loading the route file
# end


get "/page1" do
  erb :page1, :layout => :template #find the erb file in views/welcome.erb and return it
end


get "/page2" do
  @location = "#{params["option_1"]}"
  @category = "#{params["option_1"]}"
  @product = "#{params["option_1"]}"
    erb :page2, :layout => :template
end

get "/page3" do
  @location = "#{params["option_2_locations"]}"
  @category = "#{params["option_2_categories"]}"
  @product = "#{params["option_2_products"]}"
    erb :page3, :layout => :template
end

get "/page4/add_location" do
  @new_name = "#{params["name_entered"]}"
  @add_it = Location.new({"location_name" => "#{@new_name}"})
  @add_it.insert
  erb :add_location, :layout => :template
end

get "/page4/update_location" do
  @location = "#{params["update_locations"]}"
  @category = "#{params["option_3_categories"]}"
  @product = "#{params["option_3_products"]}"
    erb :page3, :layout => :template
end
# x = "y"
# until x == "n"
#
# answer = main_menu
# case answer
# when 1
#   dashes
#   puts "ADD A NEW PRODUCT"
#   dashes
#   puts
#   puts "What is the product name: "
#   name = gets.chomp
#   puts "What's the product description? "
#   description = gets.chomp
#   puts "Product cost? "
#   cost = gets.chomp.to_i
#   puts "Serial number? "
#   serial = gets.chomp
#   puts "And, the quantity? "
#   quantity = gets.chomp.to_i
#
#
#   new_product = Product.new("name" => name, "description" => description,
#   "cost" => cost, "serial" => serial, "quantity" => quantity, "location_id" =>
#   "null", "category_id" => "null")
#   new_product.insert
#   puts
#   dashes
#   puts "#{name} record added to the database!"
#   dashes
#
# # when 2
# #   dashes
# #   puts "Ok, you want to update a current product, correct?"
# #   go_back
# #   dashes
# #   puts "UPDATE A CURRENT PRODUCT"
# #
# # when 3
# #   dashes
# #   puts "Ok, you want to delete a current product, correct?"
# #   go_back
# #   dashes
# #   puts "DELETE A CURRENT PRODUCT"
# #   dashes
# #
# # when 4
# #   dashes
# #   puts "Ok, you want to fetch the current product list, correct?"
# #   go_back
# #   puts "FETCH CURRENT PRODUCT LIST"
# #   dashes
# #
# # when 5
# #   dashes
# #   go_back
# #   puts "UPDATE PRODUCT QUANTITY"
# #   dashes
#
#
# when 2
#   puts "do nothing!"
# end
#
# puts "Keep working? "
# puts "Enter 'y' for yes, 'n' for no:"
# x = gets.chomp
#
# if x == "no"
#   x = "n"
# else
#   x = "y"
# end
#
# # case answer == 2
# #   puts "case 2"
# # end
# #
# # case answer == 3
# #   puts "case 3"
# # end
# #
# # case answer == 4
# # end
# #
# # case answer == 5
# # end
# #
# # case answer == 6
# # end
# #
# # case answer == 7
# # end
# #
# # case answer == 8
# # end
# #
# # case answer == 9
# # end
# #
# # case answer == 10
# # end
# #
# # case answer == 11
# # end
# #
# # case answer == 12
# # end
# #
# # case answer == 13
# # end
# #
# # case answer == 14
# # end
# #
# # case answer == 15
# # end
# end

