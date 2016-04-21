movies = []
p movies

movies << "star wars" << "frozen" << "indiana jones" << "pinocchio" << "batman"
p movies

movies.delete_at(2)
p movies

movies.insert(2,"bourne identity")
p movies

movies.shift
p movies

puts "\"pinocchio\" is in the movies array:  #{movies.include?("pinocchio")}"

more_movies = ["die hard","the sandlot"]

all_the_movies = movies + more_movies
p all_the_movies
