module Shout
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end
  def self.yelling_happily(words)
    words + "!!!" + "  Yippee!"
  end
end
# Driver Code
puts Shout.yell_angrily("This isn't working")
puts Shout.yelling_happily("Eureka")
