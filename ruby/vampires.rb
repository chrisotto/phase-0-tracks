puts "What is your name?"
name = gets.chomp
until name != ""
  puts "A name is required.  Please enter your name."
  name = gets.chomp
end

puts "How old are you?"
age = gets.chomp
until age.to_i.to_s = age
  puts "Please enter a number."
  age = gets.chomp
end

puts "What year were you born?"
year_of_birth = gets.chomp
until year_of_birth.to_i.to_s = year_of_birth
  puts "Please enter a number.  Use negative numbers for B.C."
  year_of_birth = gets.chomp
end

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
garlic_bread? = gets.chomp
until garlic_bread? == "yes" or garlic_bread? == "no"
  puts "Please answer yes or no."
  garlic_bread? = gets.chomp
end
if garlic_bread? == "yes"
  garlic_bread? = true
else
  garlic_bread? = false
end

puts "Would you like to enroll in the company’s health insurance?"
health_insurance? = gets.chomp
until health_insurance? == "yes" or health_insurance? == "no"
  puts "Please answer yes or no."
  health_insurance? = gets.chomp
end
if health_insurance? == "yes"
  health_insurance? = true
else
  health_insurance? = false
end
