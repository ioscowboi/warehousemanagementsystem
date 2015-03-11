# Public: Location
# A class to get and insert, save and delete new records in the 'locations'
# table of the database.
#
# Attributes:
# @id, @location_name
#
# Methods:
# #insert, #save, #delete
class Location < ActiveRecord::Base
  # attr_reader :id
  # attr_accessor :location_name
  #
  # def initialize(options)
  #   @location_name = options["location_name"]
  #   @id = options["id"]
  # end
  
  # Public: #insert
  # Adds the location name to the 'locations' table as a new record and 
  # assigns an id.
  #
  # Parameters:
  # None.
  #
  # Returns:
  # None.
  #
  # State Changes:
  # Inserts values into 'locations' table in the database as a new location
  # record.
  # def insert
  #   DATABASE.execute("INSERT INTO locations (location_name)
  #                     VALUES ('#{@location_name}')")
  #   @id = DATABASE.last_insert_row_id
  # end

  # Public: #save
  # Updates the location name in the 'locations' table.
  #
  # Parameters:
  # instance_variables - value of each instance variable that is set by
  #                      the user.
  #
  # Returns:
  # None.
  #
  # State Changes:
  # Saves new value in 'locations' table in the database.
  # def save
  #   get_location = []
  #
  #   instance_variables.each do |x|
  #     get_location << x.to_s.delete("@")
  #
  #   end
  #
  #   location_grabber = []
  #
  #   get_location.each do |y|
  #     local_var = self.send(y)
  #
  #     if local_var.is_a?(Integer)
  #       location_grabber << "#{y} = #{local_var}"
  #     else
  #       location_grabber << "#{y} = '#{local_var}'"
  #     end
  #   end
  #
  #   var = location_grabber.join(", ")
  #
  #   DATABASE.execute("UPDATE locations SET #{var} WHERE id = #{id}")
  # end
  
  # Public: #overwrite
  # changes the row values of an existing column (SELECT parameters:@name)
  #
  # Attributes:
  # location_name        - see options hash 
  # id          - see options hash
  #
  # Returns:
  # an empty array
  #
  # State Changes:
  # Sets database values to new info based on user input
  # database fields affected: location_name
  #
  # def overwrite
  #   DATABASE.execute("UPDATE locations SET location_name = '#{location_name}' WHERE id = #{id}")
  # end
  #
  
  # Public: #delete
  # Returns the current values in the database as an array and deletes the 
  # location record.
  #
  # Parameters:
  # instance_variables - value of each instance variable that is set by
  #                      the user.
  #
  # Returns:
  # None.
  #
  # State Changes:
  # Removes the location record from the database. 
  # def delete
  #   get_location = []
  #
  #   instance_variables.each do |x|
  #     get_location << x.to_s.delete("@")
  #
  #   end
  #
  #   location_grabber = []
  #
  #   get_location.each do |y|
  #     local_var = self.send(y)
  #
  #     if local_var.is_a?(Integer)
  #       location_grabber << "#{y} = #{local_var}"
  #     else
  #       location_grabber << "#{y} = '#{local_var}'"
  #     end
  #   end
  #
  #   var = location_grabber.join(", ")
  #
  #   DATABASE.execute("DELETE FROM locations WHERE location_name = '#{location_name}'")
  # end
  #
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
  #
  # def remove
  #
  #   DATABASE.execute("DELETE FROM locations WHERE id = '#{id}'")
  # end
  # Class method self.all retrieves its hash from the database and is stored in
   # results
 # results is then looped through and the self object is passed into
  # 'results_as_objects' as individual array values
 #self.all returns the results_as_objects array
  #
  # def self.all
  #
  #   results = DATABASE.execute("SELECT * FROM locations")
  #
  #   results_as_objects = []
  #
  #   results.each do |r|
  #     results_as_objects << self.new(r)
  #   end
  #
  #   results_as_objects
  # end
end