var horseColors = ["blue", "pink", "red", "yellow"];
var horseNames = ["Twilight Sparkle", "Rarity", "Jerrod", "Pinkie Pie"];

horseColors.push("raspberry");
horseNames.push("Rainbow Dash");

// Use your two arrays to create an object where the keys of your object are horse names, and the values are colors.
//   Create a new object that is empty
//   If horseNames and horseColors are the same length
//     For each horse name
//       Add the horse name as a key
//       Add the corresponding horse color as a corresponding value
var horses = {};
if (horseColors.length == horseNames.length) {
  for (var i = 0; i < horseNames.length; i++) {
    horses[horseNames[i]] = horseColors[i];
  }
    console.log(horses);
}
//Release 2
//creating a new function called "Car"

function Car(model, year, color, cool) {
  this.model = model;
  this.year = year;
  this.color = color;
  this.cool = cool;

  this.goFast = function() {
    console.log(this.model + " is going fast, woah slow down there buddy");
  };
}

var porsche = new Car("911", 2015, "red", true);
var minivan = new Car("an old model", 2002, "beige", false);

console.log(porsche);
porsche.goFast();

console.log(minivan);
minivan.goFast();

for (var key in porsche) {
//  if (porsche.hasOwnProperty(key)) {
    console.log(key + " -> " + porsche[key]);
//  }
}

console.log(Object.keys(porsche).length);
