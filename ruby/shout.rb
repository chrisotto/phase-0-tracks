# module Shout
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end
#   def self.yelling_happily(words)
#     words + "!!!" + "  Yippee!"
#   end
# end
# # Driver Code
# puts Shout.yell_angrily("This isn't working")
# puts Shout.yelling_happily("Eureka")

module Shout
  def yell_angrily(words)
    words + "!!!" + " :("
  end
  def yelling_happily(words)
    words + "!!!" + "  Yippee!"
  end
end

class Student
  include Shout
end

class Coach
  include Shout
end

# Driver Code
student = Student.new
puts "The student says:"
puts student.yell_angrily("This isn't working")
puts student.yelling_happily("Eureka")
coach = Coach.new
puts "The coach says:"
puts coach.yell_angrily("Get your act together")
puts coach.yelling_happily("We win")
