class Santa
  attr_reader :age, :ethnicity
  attr_accessor :gender

  def initialize(gender, ethnicity)
    puts "Initializing Santa instance ..."
    @gender = gender
    puts "Gender:  #{@gender}"
    @ethnicity = ethnicity
    puts "Ethnicity:  #{@ethnicity}"
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    puts "Reindeer Ranking:  #{@reindeer_ranking.join(', ')}"
    @age = 0
    puts "Age:  #{@age}"
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
    puts "Reindeer Ranking:  #{@reindeer_ranking.join(', ')}"
  end

end

# santa = Santa.new("agender", "black")
# puts "Santa is #{santa.ethnicity}."
# santa.speak
# santa.eat_milk_and_cookies("snickerdoodle")
# santa.celebrate_birthday
# puts "Santa is #{santa.age} years old."
# santa.get_mad_at("Vixen")
# santa.gender = 'bigender'
# puts "I now identify as #{santa.gender}."

genders = ["agender", "bigender", "female", "gender fluid", "male", "N/A"]
ethnicities = ["black", "Japanese-African", "Latino", "Mystical Creature (unicorn)", "prefer not to say", "white", "N/A"]

santas = []
100.times do
  santas << Santa.new(genders.sample,ethnicities.sample)
  rand(140).times {santas.last.celebrate_birthday}
end
