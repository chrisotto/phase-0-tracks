def test_method
  puts "Before"
  one = "first"
  yield(one)
  puts "After"
end

test_method {|two| puts "This is our #{two} test method!"}

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
