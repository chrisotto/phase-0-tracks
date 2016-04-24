# create a method that takes a lowercase vowel and returns the next vowel
def next_vowel(vowel)
  'aeiou'[('aeiou'.index(vowel) + 1) % 'aeiou'.length]
end

# create a method that takes a lowercase consonant and returns the next consonant
def next_consonant(consonant)
  # handle 'z' edge case
  if consonant == 'z'
    consonant = 'b'
  # if the next letter is a vowel
  elsif 'aeiou'.include?(consonant.next)
    # return the letter after that
    consonant.next.next
  # otherwise, return the next letter
  else
    consonant.next
  end
end

# create a method that takes a name and returns a fake name
def make_fake_name(name)
  # downcase to avoid issues due to capitalization
  # convert name to an array of characters
  # for each letter,
  name = name.downcase.chars.map! do |letter|
    # if it is a vowel, change it to the next vowel
    if 'aeiou'.include?(letter)
      next_vowel(letter)
    # elsif it is a letter, change it to the next consonant
    elsif ('a'..'z').include?(letter)
      next_consonant(letter)
    # otherwise, nil it
    end
  end
  # convert name back to a string and re-capitalize it
  name = name.join.capitalize
end

# create a method that takes a full name and returns a fake full name
def make_fake_full_name (full_name)
  # put names into an array and swap first and last (if you wanted a string instead:  name.partition(' ').reverse.join)
  full_name = full_name.split(' ').reverse
  # for each name, replace it with a fake name
  full_name.map! {|name| make_fake_name(name)}
  # convert the full name back to a string with a space between the partial names
  full_name = full_name.join(' ')
end

puts make_fake_full_name("Felicia Torres")
