// Add a function that takes an array of words or phrases and returns the longest word or phrase in the array
//   Create an empty string variable for the return value
//   For each item in the argument array
//     If the length of the item is greater than the length of the return value
//       Replace the return value with the item
//     TBD:  Requirements are unclear with regard to how to handle multiple words or phrases that tie for the longest word or phrase.  This function currently returns only the first of the longest words and phrases in the array.
//   Return the return value
function longestItem(arrayOfStrings) {
  returnString = "";
  for (i = 0 ; i < arrayOfStrings.length; i++) {
    if (arrayOfStrings[i].length > returnString.length) {
      returnString = arrayOfStrings[i];
    }
  }
  return returnString;
}

// Add a function that takes two objects and checks to see if the objects share at least one key-value pair
//   Create a variable, set to false, for the return value
//   For each key in the first object
//     For each key in the second object
//       If the keys match
//         If the values match
//           Set the return value to true
//           Break
//   Return the return value


// TEST CODE for longestItem function
// testArray = ["long phrase","longest phrase","longer phrase"]
// console.log(longestItem(testArray))
// testArray = ["Now is the ","time for all ","good men to "]
// console.log(longestItem(testArray))
// testArray = ["come to the ","aid of their ","country.","longer phrase"]
// console.log(longestItem(testArray))
// testArray.splice(1,1)
// console.log(longestItem(testArray))
