# Class: Dog
#
# Creates an instance of access to the warehousemanager.db > products database
# table
#
# Public Methods:
# #insert     -adds a new row to the products table (SELECT parameters: see
#              options hash)
# #save       -adds new info to an existing row in the products table
#              (SELECT parameters: see options hash)
# #move_it    -changes existing column values to an existing row in the
#              products table (SELECT parameters: @location, @category, @id)
# #overwrite  -revises the name of an existing column (SELECT parameters:@name,
#              @id)
# #delete     -removes the row of an existing column (SELECT parameters:@name)
#
# Initialized Attributes:
# options - Hash
#           -@name         - populates the name column in the products database
#           -@id           - populates the id column in the products database
#           -@location_id  - populates the location_id column in the products                            database
#           -@category_id  - populates the category_id column in the products                            database
#           -@description  - populates the description column in the products                            database
#           -@cost         - populates the cost column in the products database
#           -@serial       - populates the serial column in the products                                 database
#           -@quantity     - populates the quantity column in the products                               database
#
# State Changes:
# Sets options hash values based on user input. Updates values in the products
# database table
# **see method documentation for more details

class Product
  attr_reader   :id
  attr_accessor :name, :location_id, :category_id, :description, 
                :cost, :serial, :quantity

  def initialize(options)
    @name        = options["name"]
    @id          = options["id"]
    @location_id = options["location_id"]
    @category_id = options["category_id"]
    @description = options["description"]
    @cost        = options["cost"]
    @serial      = options["serial"]
    @quantity    = options["quantity"]
  end
  
  #Method 'insert' adds a new table row to the products table
  #the argument will come in as [name, location_id, category_id,
  #description, cost, serial, quantity]
  
  # Public: #insert
  # adds a new table row to the products table
  # Attributes:
  # @name         - see options hash
  # @id           - see options hash
  # @location_id  - see options hash
  # @category_id  - see options hash
  # @description  - see options hash
  # @cost         - see options hash
  # @serial       - see options hash
  # @quantity     - see options hash
  #
  # Returns:
  # an empty array
  #
  # State Changes:
  # Sets database values to new info based on user input
  # database fields affected: location_id, category_id, description, cost,
  #                           serial, and quantity
  
  def insert
    
    
    DATABASE.execute("INSERT INTO products (name, location_id, category_id,
                      description, cost, serial, quantity) 
                      VALUES ('#{name}', #{location_id}, #{category_id}, 
                      '#{description}', #{cost}, '#{serial}', #{quantity})")
    @id = DATABASE.last_insert_row_id
  end
  
  # save method finds the existing value for a row and "updates" it.
  # Public: #save
  # updates an existing table row in the products table
  # Attributes:
  # @name         - see options hash (note: obtained via "instance_variables")
  # @id           - see options hash (note: obtained via "instance_variables")
  # @location_id  - see options hash (note: obtained via "instance_variables")
  # @category_id  - see options hash (note: obtained via "instance_variables")
  # @description  - see options hash (note: obtained via "instance_variables")
  # @cost         - see options hash (note: obtained via "instance_variables")
  # @serial       - see options hash (note: obtained via "instance_variables")
  # @quantity     - see options hash (note: obtained via "instance_variables")
  #
  # Returns:
  # an empty array
  #
  # State Changes:
  # Sets database values to new info based on user input
  # database fields affected: location_id, category_id, description, cost,
  #                           serial, and quantity
  def save
    get_product = []

    instance_variables.each do |x|
      get_product << x.to_s.delete("@")
  
    end
    
    product_grabber = []
    
    get_product.each do |y|
      local_var = self.send(y)
    
      if local_var.is_a?(Integer)
        product_grabber << "#{y} = #{local_var}"  
      else
        product_grabber << "#{y} = '#{local_var}'"
      end
    end
    
    var = product_grabber.join(", ")
    
    DATABASE.execute("UPDATE products SET #{var} WHERE id = #{id}")
  end

  # Public: #move_it
  # changes the row values of an existing column (SELECT parameters:@name)
  #
  # Attributes:
  # category_id - see options hash 
  # location_id - see options hash
  # id          - see options hash
  #
  # Returns:
  # an empty array
  #
  # State Changes:
  # Sets database values to new info based on user input
  # database fields affected: location_id, category_id
  
  def move_it

    DATABASE.execute("UPDATE products SET category_id = #{category_id}, 
                      location_id = #{location_id} WHERE id = #{id}")
  end
  
  # Public: #overwrite
  # changes the row values of an existing column (SELECT parameters:@name)
  #
  # Attributes:
  # name        - see options hash 
  # id          - see options hash
  #
  # Returns:
  # an empty array
  #
  # State Changes:
  # Sets database values to new info based on user input
  # database fields affected: name
  
  def overwrite
    DATABASE.execute("UPDATE products SET name = '#{name}' WHERE id = #{id}")
  end
  
  # Public: #delete
  # removes the row of an existing column (SELECT parameters:@name)
  #
  # Parameters:
  # x         - local variable to loop through instance_variables
  # y         - local variable to loop through get_product[]
  #local_var  - local variable to separate variables from strings in the
  #             "get_product.each" loop

  #           how you would type a very long description of a parameter.
  #
  # Returns:
  # an empty array
  #
  # State Changes:
  # Sets database values to new info based on user input
  # the loop turns the @ttributes into a string to pass into SQLite3 
  # *****NOTE: the above functionality is not currently in use. See the "remove"
  # method for current deletion method on the website
  def delete
    get_product = []

    instance_variables.each do |x|
      get_product << x.to_s.delete("@")
  
    end
    
    product_grabber = []
    
    get_product.each do |y|
      local_var = self.send(y)
    
      if local_var.is_a?(Integer)
        product_grabber << "#{y} = #{local_var}"  
      else
        product_grabber << "#{y} = '#{local_var}'"
      end
    end
    
    var = product_grabber.join(", ")
    
    DATABASE.execute("DELETE FROM products WHERE name = '#{name}'")
  end
  
  # Public: #fetch_product_record
  # finds all rows with an existing id number
  #
  # Parameters:
  # number    - local variable to loop through instance_variables
  #
  # Argument: 
  # id number provided by user
  #
  # Returns:
  # an array containing the matching id number
  #
  # State Changes:
  # none
  
  def self.fetch_product_record(number)
    results = DATABASE.execute("SELECT * FROM products WHERE id = 
                                #{number}")
    #results should only return one position in the array since we're 
    #only requesting one variable:

    return results[0]
  end
  
  #assign_product_location is used to move products to different locations
  def self.assign_product_location(existing_product_key, desired_location_id)
    x = existing_product_key
    y = desired_location_id
    # consider using part or all of the code below for the cli menu conditionals
    # location_catcher = []
    # new_fetch = Product.fetch_product_record(x)
    # location_catcher = new_fetch[0]
    # puts location_catcher
    
    DATABASE.execute("UPDATE products SET location_id = #{y} 
                      WHERE id = #{x}")
  end
  
  def self.assign_product_category(existing_product_key, desired_category_id)
    x = existing_product_key
    y = desired_category_id
    
    DATABASE.execute("UPDATE products SET category_id = #{y} 
                      WHERE id = #{x}")
  end
  
  def self.update_product_quantity(existing_product_key, desired_quantity)
    x = existing_product_key
    y = desired_quantity
    
    DATABASE.execute("UPDATE products SET quantity = #{y} 
                      WHERE id = #{x}")
  end
  
  def self.where_products_in_category(category_id)
    results = DATABASE.execute("SELECT * FROM products WHERE category_id = 
                                 #{category_id}")
                                 
    #create an empty array to pass in each separate hash:
    # results_changed_to_objects = []
    # results_changed_to_objects = results

    # results.each do |database_hashes|
    # results_changed_to_objects << self.new(database_hashes)
    #
    # end
    # results_changed_to_objects
    results
  end
  
  def self.where_products_in_location(location_id)
    results = DATABASE.execute("SELECT * FROM products WHERE location_id = 
                                 #{location_id}")
                                 
    #create an empty array to pass in each separate hash:
    # results_changed_to_objects = []
    # results_changed_to_objects = results

    # results.each do |database_hashes|
    # results_changed_to_objects << self.new(database_hashes)
    #
    # end
    # results_changed_to_objects
    results
  end
  # def self.find(number)
  #   results = DATABASE.execute("SELECT * FROM products WHERE id =
  #                               #{number}")
  #   #results should only return one position in the array since we're
  #   #only requesting one variable:
  #
  #
  #
  #   return results[0]
  #   #self.new is a new class instance that will return an array containing
  #   #one record as a hash
  #   # record_details = results[0]
  #   # self.new("id" => "{record_details}")
  # end
  
  def self.all
    
    results = DATABASE.execute("SELECT * FROM products")
    
    results_as_objects = []
    
    results.each do |r|
      results_as_objects << self.new(r)
    end
    
    results_as_objects
  end

  # Public: #remove
  # Removes a column from the products table based on the selected id value
  #
  # Attributes: 
  # id          - see options hash
  #
  # Returns:
  # an empty array
  #
  # State Changes:
  # Sets database values to new info based on user input
  # database fields affected: 1 row
  def remove

    DATABASE.execute("DELETE FROM products WHERE id = '#{id}'")
  end
  
end
