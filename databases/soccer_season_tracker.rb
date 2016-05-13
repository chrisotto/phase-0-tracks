# [REQUIREMENTS]
#
# Allow a user to add a soccer team to the league
# Allow a user to add a game with a date and teams
# Allow a user to enter the results of a game
# Allow a user to print the roster of teams with results for the season
# Allow a user to primt the game schedule with results for games that have been played
#
# "Welcome to the 2015-2016 soccer season!"
#
# "What would you like to do?"
# "[ 1 ] Add a team to the league."
# "[ 2 ] Add a game to the schedule."
# "[ 3 ] Enter the results of a game."
# "[ 4 ] Display the team standings."
# "[ 5 ] Display the game schedule."
# "[ 6 ] Quit."
# "Please enter a number:  "
#
# [1]
# "Please enter the name of a participating team:"
# "#{team} added to league."
#
# [2]
# "Please enter a game date:"
# "Please enter the name of a playing team:"
# "Please enter the name of the other playing team:"
# "Game added to schedule."
#
# "Date must be in the form YYYY-MM-DD.  Please try again:"
# "#{team} is not in our system.  Please try again (or type 'add' to add the team to the league):"
#
# [3]
# "For which game would you like to enter results?"
# "[ # ]  #{game_day}  #{team1} vs. #{team2}"
# "Please enter a number:"
# "How many goals did the #{team1} score?"
# "How many goals did the #{team2} score?"
#
# "Score must be an integer.  Please try again:"
#
# [4]
# "#{team}:  #{wins} wins, #{losses} losses, #{ties} ties" (sort by wins)
#
# [5]
# "#{game_day} #{team1} #{goals1}, #{team2} #{goals2}"
# "#{game_day} #{team1} vs. #{team2}"


# [SCHEMA DESIGN]
#
# teams
# id (integer primary key)
# name (varchar 255)
# wins (int)
# losses (int)
# ties (int)
#
# games
# id (integer primary key)
# game_day (date)
# team1_id (int)
# team2_id (int)
# team1_goals (int)
# team2_goals (int)
#
require 'sqlite3'

# SETTING GLOBAL VARIABLE — USE WITH CAUTION
$db = SQLite3::Database.new("soccer_season_tracker.db")
$db.results_as_hash = true

$db.execute (<<-SQL
  CREATE TABLE IF NOT EXISTS teams (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  wins INT,
  losses INT,
  ties INT
  )
SQL
)

$db.execute (<<-SQL
  CREATE TABLE IF NOT EXISTS games (
  id INTEGER PRIMARY KEY,
  game_day DATE,
  team1_id INT,
  team2_id INT,
  team1_goals INT,
  team2_goals INT,
  FOREIGN KEY (team1_id) REFERENCES teams(id),
  FOREIGN KEY (team2_id) REFERENCES teams(id)
  )
SQL
)


# [BUSINESS LOGIC]
#
# Define a method to add a team, taking a team name as a parameter.  RETURN TRUE if the team is added.
#   IF the team name is not already in the database
#     Add a row to the teams table with the team name as the value for the name column and zero as the value for the wins, losses and ties columns
#     RETURN TRUE
#   ELSE
#     RETURN FALSE
def add_team(name)
  if $db.execute("SELECT id FROM teams WHERE LOWER(name) = ?", name.downcase) == []
    $db.execute("INSERT INTO teams (name, wins, losses, ties) VALUES (?, ?, ?, ?)", [name, 0, 0, 0])
    return true
  else
    return false
  end
end
# [TEST CODE]
# p "[Test 01] true:#{add_team("Rainbow Jaguars")}"
# p "[Test 02] false:#{add_team("rainbow jaguars")}"
# p "[Test 03] true:#{add_team("Green Pandas")}"
# p "[Test 04] :#{$db.execute("SELECT * FROM teams")}"
#

# Define a method to add a game, taking a date and two team ids as parameters.  RETURN TRUE if the game is added.
#   IF neither of the teams has a game on that date in the database
#     Add a row to the games table with the date and team names as values
#     RETURN TRUE
#   ELSE
#     RETURN FALSE
def add_game(game_day, team1, team2)
  if $db.execute("SELECT id FROM games WHERE game_day = ? AND (team1_id = ? OR team1_id = ? OR team2_id = ? OR team2_id = ?)", [game_day, team1, team2, team1, team2]) == []
    $db.execute("INSERT INTO games (game_day, team1_id, team2_id) VALUES (?, ?, ?)", [game_day, team1, team2])
    return true
  else
    return false
  end
end
# [TEST CODE]
# add_team("Rainbow Jaguars")
# add_team("Green Pandas")
# p "[Test 05] true:#{add_game("2016-05-21", 1, 2)}"
# add_team("Purple People Eaters")
# p "[Test 06] false:#{add_game("2016-05-21", 3, 2)}"
# p "[Test 07] true:#{add_game("2016-05-28", 1, 3)}"
# p "[Test 08] :#{$db.execute("SELECT * FROM games")}"
#

# Define a method to add game results, taking a game id, the first team's score, and the second team's score as parameters
#   Add the scores to the appropriate game in the games table
#   Set a first team variable to a hash of the first team's data
#   Set a second team variable to a hash of the second team's data
#   IF the first team's score is greater than the second team's score
#     Increment the wins for the first team in the teams table
#     Increment the losses for the second team in the teams table
#   ELSIF the second team's score is greater than the first team's score
#     Increment the wins for the second team in the teams table
#     Increment the losses for the first team in the teams table
#   ELSE
#     Increment the ties for the first team in the teams table
#     Increment the ties for the second team in the teams table
def add_game_results(game_id, goals1, goals2)
  $db.execute("UPDATE games SET team1_goals = ?, team2_goals = ? WHERE id = ?", [goals1, goals2, game_id])
  team1 = $db.execute("SELECT teams.* FROM teams JOIN games ON teams.id = games.team1_id WHERE games.id = ?", game_id).at(0)
  team2 = $db.execute("SELECT teams.* FROM teams JOIN games ON teams.id = games.team2_id WHERE games.id = ?", game_id).at(0)
  if goals1 > goals2
    $db.execute("UPDATE teams SET wins = ? WHERE id = ?", [team1["wins"] + 1, team1["id"]])
    $db.execute("UPDATE teams SET losses = ? WHERE id = ?", [team2["losses"] + 1, team2["id"]])
  elsif goals2 > goals1
    $db.execute("UPDATE teams SET wins = ? WHERE id = ?", [team2["wins"] + 1, team2["id"]])
    $db.execute("UPDATE teams SET losses = ? WHERE id = ?", [team1["losses"] + 1, team1["id"]])
  else
    $db.execute("UPDATE teams SET ties = ? WHERE id = ?", [team1["ties"] + 1, team1["id"]])
    $db.execute("UPDATE teams SET ties = ? WHERE id = ?", [team2["ties"] + 1, team2["id"]])
  end
end
# [TEST CODE]
# add_team("Rainbow Jaguars")
# add_team("Green Pandas")
# add_team("Purple People Eaters")
# add_game("2016-05-21", 1, 2)
# add_game("2016-05-28", 3, 1)
# add_game("2016-05-07", 1, 3)
# add_game("2016-05-14", 2, 3)
# add_game_results(1,1,2)
# add_game_results(2,2,1)
# add_game_results(4,1,1)
# p "[Test 09] :#{$db.execute("SELECT * FROM games")}"
# p "[Test 10] :#{$db.execute("SELECT * FROM teams")}"
#


# [USER INTERFACE]
#
# Define a method to solicit and add a team
#   Display "Please enter the name of a participating team:"
#   Get input
#   IF Call method to add a team with input as argument
#     Display "#{input} added to league."
#   ELSE
#     Display "#{input} is already in the league."
def add_team_ui
  puts "Please enter the name of a participating team:"
  team_name = gets.chomp
  if add_team(team_name)
    puts "#{team_name} added to league."
  else
    puts "#{team_name} is already in the league."
  end
end
# [TEST CODE]
# add_team_ui
# add_team_ui
# add_team_ui
# p "[Test 11] :#{$db.execute("SELECT * FROM teams")}"
#

# Define a method to solicit and return a team name for a game, taking a team name that should not be accepted as an optional parameter
#   Set team variable to input
#   LOOP
#   IF the team variable is an empty string
#     Display "#{unaccetable team name} can't play itself.  Please try again:"
#     Set team variable to input
#   ELSIF the team variable.DOWNCASE is the same as the unaccetable team name.DOWNCASE
#     Display "#{unaccetable team name} can't play itself.  Please try again:"
#     Set team variable to input
#   ELSIF team variable is not a team in the database
#     Display "#{team} is not in our system.  Please try again (or type 'add' to add the team to the league):"
#     Set temp variable to input
#     IF temp variable.DOWNCASE is 'add'
#       Call method to add a team with team variable as argument
#     ELSE Set team variable to temp variable
#   ELSE
#     Return the team variable
def get_team_name_for_game(excluded_team="")
  team = gets.chomp
  loop do
    if team == ""
      puts "You must enter a team name.  Please try again:"
      team = gets.chomp
    elsif team.downcase == excluded_team.downcase
      puts "#{excluded_team} can't play itself.  Please try again:"
      team = gets.chomp
    elsif $db.execute("SELECT id FROM teams WHERE LOWER(name) = ?", team.downcase) == []
      puts "#{team} is not in our system.  Please try again (or type 'add' to add the team to the league):"
      temp = gets.chomp
      if temp.downcase == "add"
        add_team(team)
      else
        team = temp
      end
    else
      return team
    end
  end
end
#

# Define a method to solicit and add a game
#   Display "Please enter a game date:"
#   Set game day variable to input
#   WHILE game day variable is not a date
#     Display "Date must be in the form YYYY-MM-DD.  Please try again:"
#     Set game day variable to input
#   Display "Please enter the name of a playing team:"
#   Set a team1 name variable by calling the method to solicit and return a team name from the user
#   Display "Please enter the name of the other playing team:"
#   Set a team2 name variable by calling the method to solicit and return a team name from the user with the team1 name as an argument
#   Set a team1 id variable to the team id of the team name matching the team1 name variable
#   Set a team2 id variable to the team id of the team name matching the team2 name variable
#   IF Call method to add a game with a date and two team ids as arguments
#     Display "Game added to schedule."
#   ELSE
#     Display "Game not added to the schedule.  At least one of the teams is already scheduled to play that day."
def add_game_ui
  puts "Please enter a game date:"
  game_day = gets.chomp
# TBD:  WHILE game day variable is not a date
# TBD:    puts "Date must be in the form YYYY-MM-DD.  Please try again:"
# TBD:    game_day = gets.chomp
# TBD:  end
  puts "Please enter the name of a playing team:"
  team1_name = get_team_name_for_game
  puts "Please enter the name of the other playing team:"
  team2_name = get_team_name_for_game(team1_name)
  team1_id = $db.execute("SELECT id FROM teams WHERE LOWER(name) = ?", team1_name.downcase).at(0)["id"]
  team2_id = $db.execute("SELECT id FROM teams WHERE LOWER(name) = ?", team2_name.downcase).at(0)["id"]
  if add_game(game_day, team1_id, team2_id)
    puts "Game added to schedule."
  else
    puts "Game not added to the schedule.  At least one of the teams is already scheduled to play that day."
  end
end
# [TEST CODE]
# add_game_ui
# p "[Test 12] :#{$db.execute("SELECT * FROM games")}"
# add_team("Purple People Eaters")
# add_game_ui
# p "[Test 13] :#{$db.execute("SELECT * FROM games")}"
#

# Define a method to solicit and return goals
#   Set a variable for the team's goals to input
#   WHILE the variable for the team's goals is not a whole number
#     Display "Score must be a whole number.  Please try again:"
#     Set the variable for the team's goals to input
#   Convert variable for the second team's goals to an integer
def get_goals_for_game
  goals = gets.chomp
  while  goals !~ /^\d+$/
    puts "Score must be a whole number.  Please try again:"
    goals = gets.chomp
  end
  goals = goals.to_i
end
#

# Define a method to solicit and add game results
#   Display "For which game would you like to enter results?"
#   Set a games variable to an array of hashes of the data for games without results
#   Set a game ids variable to an empty array
#   For each game without results
#     Display "[ #{id} ]  #{game_day}  #{team1} vs. #{team2}"
#     Append #{id} to game ids array
#   Display "Please enter a number:"
#   Set game id to input and convert it to an integer
#   WHILE game id is not in the game ids array
#     Display "Please enter the number of a game listed above:"
#     Set game id to input and convert it to an integer
#   Display "How many goals did the #{team1} score?"
#   Set team1 goals by calling the method to solicit and return the score from the user
#   Display "How many goals did the #{team2} score?"
#   Set team2 goals by calling the method to solicit and return the score from the user
#   Call method to add game results with the game id, first team's goals and second team's goals as arguments
#   Display "Results added to game."
def add_game_results_ui
  puts "For which game would you like to enter results?"
  games = $db.execute("SELECT games.*, team1.name AS name1, team2.name AS name2 FROM games JOIN teams AS team1 ON games.team1_id = team1.id  JOIN teams AS team2 ON games.team2_id = team2.id WHERE games.team1_goals IS ? AND games.team2_goals IS ?", [nil, nil])
  game_ids = []
  games.each do |game|
    puts "[ #{game["id"]} ]  #{game["game_day"]}  #{game["name1"]} vs. #{game["name2"]}"
    game_ids << game["id"]
  end
  puts "Please enter a number:"
  game_id = gets.chomp.to_i
  while !game_ids.include?(game_id)
    puts "Please enter the number of a game listed above:"
    game_id = gets.chomp.to_i
  end
  puts "How many goals did the #{games[game_ids.index(game_id)]["name1"]} score?"
  goals1 = get_goals_for_game
  puts "How many goals did the #{games[game_ids.index(game_id)]["name2"]} score?"
  goals2 = get_goals_for_game
  add_game_results(game_id, goals1, goals2)
  puts "Results added to game."
end
# [TEST CODE]
# add_team("Rainbow Jaguars")
# add_team("Green Pandas")
# add_team("Purple People Eaters")
# add_game("2016-05-21", 1, 2)
# add_game("2016-05-28", 3, 1)
# add_game("2016-05-07", 1, 3)
# add_game("2016-05-14", 2, 3)
# add_game_results(1,1,2)
# add_game_results(2,2,1)
# add_game_results(4,1,1)
# add_game_results_ui
# p "[Test 14] :#{$db.execute("SELECT * FROM games")}"
# p "[Test 15] :#{$db.execute("SELECT * FROM teams")}"
#

# Define a method to display standings
#   For each team, display "#{team}:  #{wins} wins, #{losses} losses, #{ties} ties" sorted by wins (most to least)
def show_standings
  teams = $db.execute("SELECT * FROM teams ORDER BY wins DESC, losses")
  teams.each do |team|
    puts "#{team["name"]}:  #{team["wins"]} wins, #{team["losses"]} losses, #{team["ties"]} ties"
  end
end
# [TEST CODE]
# add_team("Rainbow Jaguars")
# add_team("Green Pandas")
# add_team("Purple People Eaters")
# add_game("2016-05-21", 1, 2)
# add_game("2016-05-28", 3, 1)
# add_game("2016-05-07", 1, 3)
# add_game("2016-05-14", 2, 3)
# p "[Test 16] :"
# show_standings
# add_game_results(1,1,2)
# p "[Test 17] :"
# show_standings
# add_game_results(2,2,1)
# p "[Test 18] :"
# show_standings
# add_game_results(4,1,1)
# p "[Test 19] :"
# show_standings
#

# Define a method to display schedule
#   For each game without results, display "#{game_day} #{team1} #{goals1}, #{team2} #{goals2}" chronologically sorted
#   For each game with results, display "#{game_day} #{team1} vs. #{team2}" chronologically sorted
def show_schedule
  games_wo_results = $db.execute("SELECT games.*, team1.name AS name1, team2.name AS name2 FROM games JOIN teams AS team1 ON games.team1_id = team1.id  JOIN teams AS team2 ON games.team2_id = team2.id WHERE games.team1_goals IS ? AND games.team2_goals IS ? ORDER BY game_day", [nil, nil])
  games_wo_results.each do |game|
    puts "#{game["game_day"]}  #{game["name1"]} vs. #{game["name2"]}"
  end
  games_w_results = $db.execute("SELECT games.*, team1.name AS name1, team2.name AS name2 FROM games JOIN teams AS team1 ON games.team1_id = team1.id  JOIN teams AS team2 ON games.team2_id = team2.id WHERE games.team1_goals IS NOT ? OR games.team2_goals IS NOT ? ORDER BY game_day", [nil, nil])
  games_w_results.each do |game|
    puts "#{game["game_day"]}  #{game["name1"]} #{game["team1_goals"]}, #{game["name2"]} #{game["team2_goals"]}"
  end
end
# [TEST CODE]
# add_team("Rainbow Jaguars")
# add_team("Green Pandas")
# add_team("Purple People Eaters")
# add_game("2016-05-21", 1, 2)
# add_game("2016-05-28", 3, 1)
# add_game("2016-05-07", 1, 3)
# add_game("2016-05-14", 2, 3)
# p "[Test 20] :"
# show_schedule
# add_game_results(1,1,2)
# p "[Test 21] :"
# show_schedule
# add_game_results(2,2,1)
# add_game_results(4,1,1)
# p "[Test 22] :"
# show_schedule
#

# Define a method to display the program's functions and enable the user to initiate one.  RETURN TRUE unless the user initiates "Quit."
#   Display
#     "What would you like to do?"
# TBD:  REFACTOR into functions array and EACH statement >>>>>>>>>>
#     "[1] Add a team to the league."
#     "[2] Add a game to the schedule."
#     "[3] Enter the results of a game."
#     "[4] Display the team standings."
#     "[5] Display the game schedule."
#     "[6] Quit."
# TBD:  <<<<<<<<<< REFACTOR into functions array and EACH statement
#     "Please enter a number:  "
#   Get input and convert it to an integer
#   WHILE input variable is not between 1 and 6
#     Display "Please enter a number between 1 and 6:"
#     Get input
#   WHEN input is 1
#     Call method to solicit and add a team
#   WHEN input is 2
#     Call method to solicit and add a game
#   WHEN input is 3
#     Call method to solicit and add game results
#   WHEN input is 4
#     Call method to display standings
#   WHEN input is 5
#     Call method to display schedule
#   IF input is 6
#     RETURN FALSE
#   ELSE
#     RETURN TRUE
def main_menu
  puts "What would you like to do?"
# TBD:  REFACTOR into functions array and EACH statement >>>>>>>>>>
  puts "[ 1 ] Add a team to the league."
  puts "[ 2 ] Add a game to the schedule."
  puts "[ 3 ] Enter the results of a game."
  puts "[ 4 ] Display the team standings."
  puts "[ 5 ] Display the game schedule."
  puts "[ 6 ] Quit."
# TBD:  <<<<<<<<<< REFACTOR into functions array and EACH statement
  print "Please enter a number:  "
  function = gets.chomp.to_i
  while !(1..6).include?(function)
    puts "Please enter a number between 1 and 6:"
    function = gets.chomp.to_i
  end
  case function
  when 1
    add_team_ui
  when 2
    add_game_ui
  when 3
    add_game_results_ui
  when 4
    show_standings
  when 5
    show_schedule
  end
  if function == 6
    false
  else
    true
  end
end
# [TEST CODE]
# p "[Test 23 — Enter a number between 1 and 5] true:#{main_menu}"
# p "[Test 24 — Enter 6] false:#{main_menu}"
#

# [DRIVER CODE]
#
# Display "Welcome to the 2015-2016 soccer season!"
#
# WHILE Call method to display the program's functions and enable the user to initiate one
puts "Welcome to the 2015-2016 soccer season!"
while main_menu
end
