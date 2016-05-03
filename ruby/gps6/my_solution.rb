# Virus Predictor

# I worked on this challenge with Mikey Moore.
# We spent [2] hours on this challenge.

# EXPLANATION OF require_relative
# Includes the data from a separate file.  "Relative" specifies that you
# are pulling from a local file, ie. "relative to where this file is".
# Require without relative is going to be an absolute address.
require_relative 'state_data'

class VirusPredictor

# Create a new instance of VirusPredictor and set initial attributes
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

# prints the effects of the virus, calling two other methods in class VirusPredictor
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

# Limits access to the following methods, making them only usable inside the class definition
  private

# Applies a formula to predict the number of deaths based on population density
# rounds down the returned float.  Prints output.
  def predicted_deaths
    # predicted deaths is solely based on population density
    death_factor = case @population_density.floor
    when 0..49
      0.05
    when 50..99
      0.1
    when 100..149
      0.2
    when 150..199
      0.3
    else
      0.4
    end
    number_of_deaths = (@population * death_factor).floor

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

# Applies a formula to predict speed of death based on population density
# prints result
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    speed += case @population_density.floor
    when 0..49
      2.5
    when 50..99
      2
    when 100..149
      1.5
    when 150..199
      1
    else
      0.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

STATE_DATA.each do |key, value|
  state = VirusPredictor.new(key, value[:population_density], value[:population])
  state.virus_effects
end

#=======================================================================
# Reflection Section
# What are the differences between the two different hash syntaxes shown in the state_data file?
#   The result of each syntax is the same, although the rocket must be used for non-symbol keys.
# What does require_relative do? How is it different from require?
#   require incorporates the contents of a separate file into the current file using an absolute location of the separate file.  require_relative does the same using a relative reference to the location of the current file.
# What are some ways to iterate through a hash?
#   .each, .map
# When refactoring virus_effects, what stood out to you about the variables, if anything?
#   It took us a minute to recognize, but we realized that they were unnecessary.
# What concept did you most solidify in this challenge?
#   writing DRY code
