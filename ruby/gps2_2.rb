# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
def create_grocery_list(shopping_items)
  # steps:
  # create an empty hash
  grocery_list = {}
  # add items
    # convert input into separate items
  shopping_items = shopping_items.split
    # add items to hash and set default quantity
  shopping_items.each do |item_name|
    grocery_list[item_name.to_sym] = 1
  end
  # print the list to the console [can you use one of your other methods here?]
  print_grocery_list(grocery_list)
# output: explicit return the hash
  grocery_list
end

# Method to add an item to a list
# input: hash, item name and optional quantity
def add_to_grocery_list(grocery_list, item_name, quantity=1)
  # steps: add item to hash and set quantity
  grocery_list[item_name.to_sym] = quantity
  # output: explicit return updated hash
  grocery_list
end

# Method to remove an item from the list
# input: hash and item name
def remove_from_grocery_list(grocery_list, item_name)
  # steps: remove item from hash
  grocery_list.delete(item_name.to_sym)
  # output: explicit return updated hash
  grocery_list
end

# Method to update the quantity of an item
# input: hash, item name and new quantity
def update_quantity_in_grocery_list(grocery_list, item_name, quantity)
  # steps: update quantity for item
  grocery_list[item_name.to_sym] = quantity
  # output: explicit return updated hash
  grocery_list
end

# Method to print a list and make it look pretty
# input: hash
def print_grocery_list(grocery_list)
  # steps: print "Grocery List"
  puts "Grocery List:"
  # for each item, print "item name: quantity"
  grocery_list.each do |item_name, quantity|
    puts "#{item_name.to_s}:  #{quantity}"
  # output:
  end
end

grocery_list = create_grocery_list("")
grocery_list = add_to_grocery_list(grocery_list, "Lemonade", 2)
grocery_list = add_to_grocery_list(grocery_list, "Tomatoes", 3)
grocery_list = add_to_grocery_list(grocery_list, "Onions", 1)
grocery_list = add_to_grocery_list(grocery_list, "Ice Cream", 4)
grocery_list = remove_from_grocery_list(grocery_list, "Lemonade")
grocery_list = update_quantity_in_grocery_list(grocery_list, "Ice Cream", 1)
print_grocery_list(grocery_list)

# What did you learn about pseudocode from working on this challenge?
  # Spending time working through the pseudocode helped get my pair and me on the same page and working from the same playbook.
# What are the tradeoffs of using arrays and hashes for this challenge?
  # By using hashes, we were able to directly associate quanitities with items.
# What does a method return?
  # A method returns the return of the last call it runs.
# What kind of things can you pass into methods as arguments?
  # You can pass pretty much any object into a method as an argument.
# How can you pass information between methods?
  # You can pass information between methods with arguments and parameters.
# What concepts were solidified in this challenge, and what concepts are still confusing?
  # I'm feeling pretty good about the concepts we applied in this challenge.  I'm curious to learn what other concepts may exist that would be better.
