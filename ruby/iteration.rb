puts "Release 0"
def test_method
  puts "Before"
  one = "first"
  yield(one)
  puts "After"
end

test_method {|two| puts "This is our #{two} test method!"}

puts "Release 1.1"
movies = [
  "The Hangover",
  "The Jungle Book",
  "Batman vs. Superman"
  ]

actors = {
  "Justin Bartha" => "Doug",
  "Mike Tyson" => "Mike Tyson",
  "The Bear" => "Bill Murray",
  "Ben Affleck" => "Batman"
  }

puts "Release 1.2"
movies.each do
  |movie|
  puts "Movie: #{movie}"
end

actors.each do
  |actor, role|
  puts "Starring #{actor} as #{role}"
end

puts movies
movies.map! do
  |movie|
  movie = movie.upcase
  puts "Movie: #{movie}"
  movie
end
puts movies

puts "Release 2.1"
puts movies
movies.delete_if{|movie| movie.include? "S"}
puts movies

puts actors
actors.delete_if{|actor, role| actor.include?("s") || role.include?("s")}
puts actors

puts "Release 2.2"
puts movies.select{|movie| movie.include? "V"}
puts actors.select{|actor, role| actor.include?("u") || role.include?("u")}

puts "Release 2.3"
puts movies.reject{|movie| movie.include? "V"}
puts actors.reject{|actor, role| actor.include?("u") || role.include?("u")}
