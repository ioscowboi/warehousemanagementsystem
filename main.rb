require 'sinatra'
require 'pry'
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

get "/page4/move_product" do
  @move_id = params["move_id"]
  @location_id = params["location_id"]
  @category_id = params["category_id"]
  @move_it = Product.new({"id" => @move_id.to_i, "location_id" => @location_id.to_i,
  "category_id" => @category_id.to_i})
  @move_it.move_it
  erb :move_product, :layout => :template
end

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
  @update_id = "#{params["target_id"]}"
  @update_name = "#{params["updated_name"]}"
  @update_it = Location.new({"id" => "#{@update_id}", "location_name" => "#{@update_name}"})
  @update_it.overwrite
  erb :update_location, :layout => :template
end

get "/page4/delete_location" do
  @delete_id = "#{params["delete_id"]}"
  @delete_it = Location.new({"id" => "#{@delete_id}"})
  @delete_it.remove
  erb :delete_location, :layout => :template
end

get "/page4/add_category" do
  @new_name = "#{params["name_entered"]}"
  @add_it = Category.new({"manufacturer" => "#{@new_name}"})
  @add_it.insert
  erb :add_category, :layout => :template
end

get "/page4/update_category" do
  @update_id = "#{params["target_id"]}"
  @update_name = "#{params["updated_name"]}"
  @update_it = Category.new({"id" => "#{@update_id}", "manufacturer" => "#{@update_name}"})
  @update_it.overwrite
  erb :update_category, :layout => :template
end

get "/page4/delete_category" do
  @delete_id = "#{params["delete_id"]}"
  @delete_it = Category.new({"id" => "#{@delete_id}"})
  @delete_it.remove
  erb :delete_category, :layout => :template
end

get "/page4/add_product" do
  @new_name = "#{params["name_entered"]}"
  @description = "#{params["description"]}"
  @cost = "#{params["cost"]}"
  @quantity = "#{params["quantity"]}"
  @serial = "#{params["serial"]}"
  @location_id = "#{params["location_id"]}"
  @category_id = "#{params["category_id"]}"
  @add_it = Product.new({"name" => "#{@new_name}", "location_id" => "#{@location_id}",
  "category_id" => "#{@category_id}", "quantity" => "#{@quantity}", "description" => "#{@description}",
  "cost" => "#{@cost}", "serial" => "#{@serial}"})
  @add_it.insert
  erb :add_product, :layout => :template
end

get "/page4/update_product" do
  @update_id = "#{params["target_id"]}"
  @update_name = "#{params["updated_name"]}"
  @location_id = "#{params["location_id"]}"
  @category_id = "#{params["category_id"]}"
  @serial = "#{params["serial"]}"
  @update_it = Product.new({"id" => "#{@update_id}", "name" => "#{@update_name}"})
  @update_it.overwrite
  erb :update_product, :layout => :template
end

get "/page4/delete_product" do
  @delete_id = "#{params["delete_id"]}"
  @delete_it = Product.new({"id" => "#{@delete_id}"})
  @delete_it.remove
  erb :delete_product, :layout => :template
end

