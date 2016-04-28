# Define a Car class
  # Initialize with required parameters for make, model, year and color
  # Allow all attributes to be read
  # Allow color to be written
  # Define a method to rev the engine that prints "VROOM!  VROOM!"
  # Define a method to honk the horn with a parameter for the number of times it should print "HONK!"
  # Define a method to drive with a parameter for the location that prints "Driving to <location>"
class Car
  attr_accessor :color
  attr_reader :make, :model, :year

  def initialize(year, make, model, color)
    puts "Initializing Car instance ..."
    @color = color
    print @color, " "
    @year = year
    print @year, " "
    @make = make
    print @make, " "
    @model = model
    puts @model
  end

  def rev_engine
    puts "VROOM!  VROOM!"
  end

  def honk(i)
    i.times {print "HONK!  "}  # TBD:  This prints two extra spaces at the end of the line
    puts
  end

  def drive(destination)
    puts "Driving to #{destination}."
  end

end

# Diagnostic driver code
# car = Car.new(1987, "Honda", "Prelude", "Red")
# car.rev_engine
# car.honk(2)
# car.drive("Disneyland")
# puts "Car color:  #{car.color}"
# puts "Car year:  #{car.year}"
# puts "Car make:  #{car.make}"
# puts "Car model:  #{car.model}"

cars = []
stop = "yes"
while ["yes","y"].include?(stop.downcase)
  puts "Please enter your car information:"
  print "What is your car's color?  "
  color = gets.chomp
  print "What is your car's make?  "
  make = gets.chomp
  print "What is your car's model?  "
  model = gets.chomp
  print "What is your car's year?  "
  year = gets.chomp.to_i
  cars << Car.new(year, make, model, color)
  print "Would you like to enter the information of another car?  "
  stop = gets.chomp
end
puts "The following cars have been recorded:"
cars.each do |car|
      print car.color, " "
      print car.year, " "
      print car.make, " "
      puts car.model
end
