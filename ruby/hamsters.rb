puts "What is the hamster's name?"
name = gets.chomp
puts "What is the hamster's volume level?"
volume_level = gets.chomp.to_i
until volume_level.between?(1,10)
   puts "Please give a value between 1 and 10."
   volume_level = gets.chomp.to_i
end
puts "What is the hamster's fur color?"
fur_color = gets.chomp
puts "Is this hamster a good candidate for adoption?"
adoptable = gets.chomp
until adoptable == "yes" or adoptable == "no"
  puts "Please answer yes or no."
  adoptable = gets.chomp
end
if adoptable == "yes"
  adoptable = true
else
  adoptable = false
end
puts "About how old is the hamster?"
age = gets.chomp
if age == ""
  age = nil
end
if age != nil
  until age.to_i.to_s == age
    puts "Please type an integer."
    age = gets.chomp
  end
  age = age.to_i
end
puts "Hamster name:  #{name}"
puts "Volume level:  #{volume_level}"
puts "Fur color:  #{fur_color}"
puts "Good candidate for adoption:  #{adoptable}"
print "Age:  "
if age == nil
  puts "unknown"
  else
    puts age
end
