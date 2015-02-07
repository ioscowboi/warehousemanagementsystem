class Product
  attr_reader :id
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
  
  def insert
    
    
    DATABASE.execute("INSERT INTO products (name, location_id, category_id,
                      description, cost, serial, quantity) 
                      VALUES ('#{name}', #{location_id}, #{category_id}, 
                      '#{description}', #{cost}, '#{serial}', #{quantity})")
    @id = DATABASE.last_insert_row_id
  end
  
  # save method finds the existing value for a row and "updates" it.
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
  
  
  def self.fetch_product_record(number)
    results = DATABASE.execute("SELECT * FROM products WHERE id = 
                                #{number}")
    #results should only return one position in the array since we're 
    #only requesting one variable:

    return results[0]
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
end