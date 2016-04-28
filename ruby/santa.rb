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

end

genders = ["agender", "bigender", "female", "gender fluid", "male", "N/A"]
ethnicities = ["black", "Japanese-African", "Latino", "Mystical Creature (unicorn)", "prefer not to say", "white", "N/A"]

santas = []
genders.length.times do |i|
  ethnicities.length.times do |j|
    santas << Santa.new(i,j)
  end
end
