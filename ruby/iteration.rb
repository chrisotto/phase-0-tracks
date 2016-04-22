def test_method
  puts "Before"
  one = "first"
  yield(one)
  puts "After"
end

test_method {|two| puts "This is our #{two} test method!"}
