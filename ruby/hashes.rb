# Create a method to get the value for a key
def get_value(key,data_type=String)
  # prompt the user to input a value for the key
  print "#{key.to_s}:  "
  value = gets.chomp
  # convert the value to the appropriate data type
  if data_type == String
  elsif data_type == Integer
    # TBD:  Until value is an Integer
      # TBD:  prompt user to input an Integer
    value = value.to_i
  elsif data_type == "Boolean"
    # TBD:  Until value is a Boolean
      # TBD:  prompt user to input a Boolean
    value = ["true","yes"].include?(value.downcase)
  end
  value
end
# Create a client_details hash with default keys and nil values
client_details = {
  client_name: nil,
  age: nil,
  number_of_children: nil,
  decor_theme: nil,
  likes_flowers: nil
}
# Create a client_details_data_types hash with the same default keys and appropriate data type values
client_details_data_types = {
  client_name: String,
  age: Integer,
  number_of_children: Integer,
  decor_theme: String,
  likes_flowers: "Boolean"
}
# For each client detail (key)
  # lookup the appropriate data type for that key
  # get the value for the key
  # put the value for the key into the client_details hash
puts "Please enter client details:"
client_details.each_key{|key| client_details[key] = get_value(key,client_details_data_types[key])}
# Print the client_details hash
puts client_details
# Prompt the user to update a client detail by typing its key (or "none" to skip)
# If the user types a key, collect the new value for that client detail (key)
# Elsif the user types anything other than "none"
  # Leave error handling for another day
# Print the hash
