puts "What is your name?"
name = gets.chomp
until name != ""
  puts "A name is required.  Please enter your name."
  name = gets.chomp
end

puts "How old are you?"
age = gets.chomp
until age.to_i.to_s == age
  puts "Please enter a number."
  age = gets.chomp
end
age = age.to_i

puts "What year were you born?"
year_of_birth = gets.chomp
until year_of_birth.to_i.to_s == year_of_birth
  puts "Please enter a number.  Use negative numbers for B.C."
  year_of_birth = gets.chomp
end
year_of_birth = year_of_birth.to_i

puts "Our company cafeteria serves garlic bread. Should we order some for you?"
order_garlic_bread = gets.chomp
until order_garlic_bread == "yes" || order_garlic_bread == "no"
  puts "Please answer yes or no."
  order_garlic_bread = gets.chomp
end
if order_garlic_bread == "yes"
  order_garlic_bread = true
else
  order_garlic_bread = false
end

puts "Would you like to enroll in the company’s health insurance?"
enroll_in_health_insurance = gets.chomp
until enroll_in_health_insurance == "yes" or enroll_in_health_insurance == "no"
  puts "Please answer yes or no."
  enroll_in_health_insurance = gets.chomp
end
if enroll_in_health_insurance == "yes"
  enroll_in_health_insurance = true
else
  enroll_in_health_insurance = false
end

if ["Drake Cula","Tu Fang"].include? name
  puts "Definitely a vampire."
elsif age.between?(Time.now.year - year_of_birth - 1, Time.now.year - year_of_birth) && (order_garlic_bread || enroll_in_health_insurance)
  puts "Probably not a vampire."
elsif !age.between?(Time.now.year - year_of_birth - 1, Time.now.year - year_of_birth) && !(order_garlic_bread == enroll_in_health_insurance)
  puts "Probably a vampire."
elsif !age.between?(Time.now.year - year_of_birth - 1, Time.now.year - year_of_birth) && !order_garlic_bread && !enroll_in_health_insurance
  puts "Almost certainly a vampire."
else
  puts "Results inconclusive."
end
