# encyrpt pseudocode
#
# loop through each character in the sting "abc"
# if its a lower case letter advance by one
# if not a letter leave it alone
# advance counter by 1

def encrypt(message)
  i = 0
  while i < message.length
    if ("a"..."z").include? message[i]
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
  x = 0
  while x < message.length
    if ("a"..."z").include? message[x]
      #      message[x] = alphabet[alphabet.index(message[x]) - 1]
      index_in_alphabet = alphabet.index(message[x])
      index_in_alphabet -= 1
      message[x] = alphabet[index_in_alphabet]
    elsif message[i] == "a"
      message[i] = "z"
    end
    x += 1
  end
  message
end

puts "submit message to be decoded:"
message = gets.chomp
puts message
encrypted_message = encrypt(message)
puts encrypted_message
decrypted_message = decrypt(encrypted_message)
puts decrypted_message

puts "encrypt(\"abc\") should return \"bcd\":  #{encrypt("abc")}"
puts "encrypt(\"zed\") should return \"afe\":  #{encrypt("zed")}"
puts "decrypt(\"bcd\") should return \"abc\":  #{decrypt("bcd")}"
puts "decrypt(\"afe\") should return \"zed\":  #{decrypt("afe")}"
