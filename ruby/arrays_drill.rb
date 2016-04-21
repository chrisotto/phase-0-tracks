def build_array(object1, object2, object3)
  [object1, object2, object3]
end

def add_to_array(arr, item)
  arr << item
end



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

p build_array("cat","dog","goldfish").class
p add_to_array([],"a")
p add_to_array(["a","b","c",1,2],3)
