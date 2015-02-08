def main_menu
  # CLI menu
  puts "-" * 60
  puts "WELCOME TO THE WAREHOUSE MANAGER INVENTORY MANAGEMENT SYSTEM"
  puts "-" * 60
  puts
  puts "Please choose an option below to begin."
  puts
  puts "PRODUCT MANAGER"
  puts "-" * 60
  puts "1 - Add a new product."
  puts "2 - Update a current product."
  puts "3 - Delete a current product."
  puts "4 - Fetch current product list."
  puts "5 - Update product quantity."
  puts
  puts "WAREHOUSE LOCATION MANAGER"
  puts "-" * 60
  puts "6 - Fetch current warehouse location list."
  puts "7 - Add a new location."
  puts "8 - Update a current location."
  puts "9 - Delete a current location."
  puts "10 - Assign a product to a location."
  puts
  puts "PRODUCT CATEGORY MANAGER"
  puts "-" * 60
  puts "11 - Fetch current product category list."
  puts "12 - Add a new category."
  puts "13 - Update a current category."
  puts "14 - Delete a current category."
  puts "15 - Assign a product to a category."
  puts "Enter number here: "
  answer = gets.chomp.to_i

  while answer > 15 || answer < 1
    puts "Please enter a choice between 1 and 15:"
    answer = gets.chomp.to_i
  end
  return answer
end

  
  def dashes
    puts "-" * 60
  end
  
  def go_back
    puts "Enter 'y' for yes, 'n' for no:"
    answer = gets.chomp.downcase
    if answer == "n" || answer == "no"
      main_menu
    end
  end
