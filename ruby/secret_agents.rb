# encyrpt pseudocode
#
# loop through each character in the sting "abc"
# if its a lowercase letter advance by one
# if not a letter leave it alone
# advance counter by 1

def encrypt(message)
  i = 0
  while i < message.length
    if ("a".."y").include? message[i]
      message[i] = message[i].next!
    elsif message[i] == "z"
      message[i] = "a"
    end
    i += 1
  end
  message
end

# decrypt pseudocode
#
# create decoder key (string) of the lowercase alphabet
# create decrypt method which loop through each character of the string to be decoded
#   get the index for the character from the decoder key
#   subtract one
#   put the character from the decoder string for the resulting index into the character
#   advance counter by 1
# what happens to z?

def decrypt(message)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  i = 0
  while i < message.length
    if ("b".."z").include? message[i]
      # message[i] = alphabet[alphabet.index(message[i]) - 1]
      index_in_alphabet = alphabet.index(message[i])
      index_in_alphabet -= 1
      message[i] = alphabet[index_in_alphabet]
    elsif message[i] == "a"
      message[i] = "z"
    end
    i += 1
  end
  message
end

# Asks a secret agent (the user) whether they would like to decrypt or encrypt a password
# until user respond with either encrypt or decrypt, ask for decrypt or encrypt
# Asks them for the password
# Conducts the requested operation, prints the result to the screen, and exits

puts "Would you like to decrypt or encrypt a password?"
action = gets.chomp
until ["decrypt","encrypt"].include? action
  puts "Please enter decrypt or encrypt."
  action = gets.chomp
end
puts "Please enter the password to be #{action}ed:"
password = gets.chomp
if action == "decrypt"
  puts decrypt(password)
else
  puts encrypt(password)
end

# if action == "decrypt"
#
# elsif gets.chomp == "encrypt"
# else
# end
#
# password = gets.chomp

# puts "submit message to be decoded:"
# message = gets.chomp
# puts message
# encrypted_message = encrypt(message)
# puts encrypted_message
# decrypted_message = decrypt(encrypted_message)
# puts decrypted_message
#
# puts "encrypt(\"abc\") should return \"bcd\":  #{encrypt("abc")}"
# puts "encrypt(\"zed\") should return \"afe\":  #{encrypt("zed")}"
# puts "decrypt(\"bcd\") should return \"abc\":  #{decrypt("bcd")}"
# puts "decrypt(\"afe\") should return \"zed\":  #{decrypt("afe")}"
#
# # nested call works because the decypt method is taking as its input the output of the encypt method, so the encrypt method encrypts the input, and then the decrypt method decrypts it back to its original value.
# puts decrypt(encrypt("swordfish"))
