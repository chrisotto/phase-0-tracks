# loop through each character in the sting "abc"
# if its a lower case letter advance by one
# if not a letter leave it alone
# advance counter by 1

def encrypt(message)
  i = 0
  while i < message.length
    if ("a".."z").include? message[i]
      message[i] = message[i].next!
    end
    i += 1
  end
end

message = "abcdef"
encrypt(message)
puts message
