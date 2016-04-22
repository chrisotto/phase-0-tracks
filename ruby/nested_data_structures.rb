san_francisco = {
  mission: {
    restaurants: [
      "Lolo",
      "Hoffman's Grill & Rotisserie",
      "20 Spot"
    ],
    bars: [
      "Shotwell's",
      "Trick Dog",
      "24th Street Bar"
    ]
  },
  noe_valley: {
    restaurants: [
      "Le Zinc",
      "Patxi's"
    ]
  },
  potrero_hill: {
    pretty_name: "Potrero Hill",
    restaurants: [
      "Chez Maman",
      "Plow",
      "Papito Potrero Hill"
    ]
  },
  soma: {
    restaurants: [
      "Garaje",
      "HRD"
    ],
    bars: [
      "Alchemist Bar & Lounge",
      "Lord George"
    ]
  },
  fidi: {},
  pacific_heights: {},
  sunset: {}
}

print "SoMa restaurants include "
san_francisco[:soma][:restaurants].each {|restaurant| print restaurant, ", "}
puts "and others..."

print "In the Mission, you can find "
san_francisco[:mission].each_key {|establishment| print establishment, ", "}
puts "and more..."

puts "#{san_francisco[:potrero_hill][:restaurants][1]} can be found in #{san_francisco[:potrero_hill][:pretty_name]}"
