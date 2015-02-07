
user_input = gets.chomp.to_s
add_location = Location.new("location_name" => "#{user_input}")
add_location.insert