class Santa

  def initialize(gender, ethnicity)
    puts "Initializing Santa instance ..."
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  def celebrate_birthday
    @age += 1
    puts "I turned #{@age} years old today!"
  end

  def get_mad_at(reindeer)
    @reindeer_ranking << @reindeer_ranking.delete(reindeer)
    puts "#{@reindeer_ranking.last}, you just got on my naughty list."
  end

  def gender=(new_gender)
    @gender = new_gender
  end

  def age
    @age
  end

  def ethnicity
    @ethnicity
  end

end

genders = ["agender", "bigender", "female", "gender fluid", "male", "N/A"]
ethnicities = ["black", "Japanese-African", "Latino", "Mystical Creature (unicorn)", "prefer not to say", "white", "N/A"]

santas = []
genders.length.times do |i|
  ethnicities.length.times do |j|
    santas << Santa.new(genders[i],ethnicities[j])
  end
end
santas[0].speak
santas[0].eat_milk_and_cookies("snickerdoodle")
santas[0].celebrate_birthday
santas[0].get_mad_at("Vixen")
puts "I now identify as #{santas[0].gender = 'bigender'}"
puts "Santa is #{santas[0].age} years old."
puts "Santa is #{santas[0].ethnicity}."
