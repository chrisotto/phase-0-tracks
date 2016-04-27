class Puppy

  def initialize
    puts "Initializing new puppy instance..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(number)
    number.times {|num| print "Woof!" }
    puts
    number
  end

  def roll_over
    puts "*rolls over*"
  end

  def dog_years(integer)
    integer * 7
  end

  def play_dead(time)
    time.times do
      puts "I'm dead"
    end
    puts "I'm alive!!!"
  end

end

puppy = Puppy.new
puppy.fetch("ball")
puppy.speak(3)
puppy.roll_over
puts puppy.dog_years(10)
puppy.play_dead(5)

class Student

  def initialize(name)
    puts "Welcome to Dev Bootcamp #{name}"
  end

  def confused(student)
    puts "#{student} is confused"
  end

  def eureka(student)
    puts "#{student} is having a eureka moment!"
  end

end

all_students = {}
50.times do |count|
  all_students["Student #{count+1}"] = Student.new("Student #{count+1}")
  # all_students["Student #{count+1}"].confused("Student #{count+1}")
  # all_students["Student #{count+1}"].eureka("Student #{count+1}")
end
all_students.each do |name, student|
  student.confused(name)
  student.eureka(name)
end
