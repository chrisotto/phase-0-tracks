# Create a method to collect the value for a client detail (key)
  # prompt the user to input a value for the key
  # lookup the appropriate data type for that key
  # convert the value to the appropriate data type
  # add the value for the key to the client_details hash
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
# Collect the value for each client detail (key)
# Print the client_details hash
# Prompt the user to update a client detail by typing its key (or "none" to skip)
# If the user types a key, collect the new value for that client detail (key)
# Elsif the user types anything other than "none"
  # Leave error handling for another day
# Print the hash
