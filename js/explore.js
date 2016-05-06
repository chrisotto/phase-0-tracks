// Add a function that takes a string as a parameter and reverses the string
//   Create an empty return string
//   For each character in the given string
//     Prepend the character to the return string
//   Return the return string
function reverse(str) {
  var newStr = "";
  for (var i = 0; i < str.length; i++) {
    newStr = str[i] + newStr
  }
  return newStr
}

console.log(reverse("hello"))
