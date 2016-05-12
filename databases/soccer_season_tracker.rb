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
# "[1] Add a team to the league."
# "[2] Add a game to the schedule."
# "[3] Enter the results of a game."
# "[4] Display the team standings."
# "[5] Display the game schedule."
# "[6] Quit."
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
# "The team you entered is not in our system.  Please try again (or type 'add' to add the team to the league):"
#
# [3]
# "For which game would you like to enter the results?"
# "[#] #{game_day} #{team1} vs. #{team2}"
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
  if $db.execute("SELECT id FROM teams WHERE name = ?", name) == []
    $db.execute("INSERT INTO teams (name, wins, losses, ties) VALUES (?, ?, ?, ?)", [name, 0, 0, 0])
    return true
  else
    return false
  end
end
# [TEST CODE]
# p "[Test 01] true:#{add_team("Rainbow Jaguars")}"
# p "[Test 02] false:#{add_team("Rainbow Jaguars")}"
# p "[Test 03] true:#{add_team("Green Pandas")}"
# p "[Test 04] :#{$db.execute("SELECT * FROM teams")}"
#

# Define a method to add a game, taking a date and two team ids as parameters.  RETURN TRUE if the game is added.
#   IF neither of the teams has a game on that date in the database
#     Add a row to the games table with the date and team names as values
#     RETURN TRUE
#   ELSE
#     RETURN FALSE
#
# Define a method to add game results, taking a game id, the first team's score, and the second team's score as parameters
#   Add the scores to the appropriate game in the games table
#   IF the first team's score is greater than the second team's score
#     Increment the wins for the first team in the teams table
#     Increment the losses for the second team in the teams table
#   ELSIF the second team's score is greater than the first team's score
#     Increment the wins for the second team in the teams table
#     Increment the losses for the first team in the teams table
#   ELSE
#     Increment the ties for the first team in the teams table
#     Increment the ties for the second team in the teams table


# [USER INTERFACE]
#
# Define a method to solicit and add a team
#   Display "Please enter the name of a participating team:"
#   Get input
#   IF Call method to add a team with input as argument
#     Display "#{input} added to league."
#   ELSE
#     Display "#{input} is already in the league."
#
# Define a method to solicit and add a game
#   Display "Please enter a game date:"
#   Set game day variable to input
#   WHILE game day variable is not a date
#     Display "Date must be in the form YYYY-MM-DD.  Please try again:"
#     Set game day variable to input
#   Display "Please enter the name of a playing team:"
#   Set team1 variable to input
#   WHILE team1 variable is not a team in the database
#     Display "The team you entered is not in our system.  Please try again (or type 'add' to add the team to the league):"
#     Set temp variable to input
#     IF temp variable.DOWNCASE is not 'add'
#       Set team1 variable to temp variable
#   Set team1 variable to the team id of the team name matching its current value
#   Display "Please enter the name of the other playing team:"
#   Set team2 variable to input
#   WHILE team2 variable is not a team in the database
#     Display "The team you entered is not in our system.  Please try again (or type 'add' to add the team to the league):"
#     Set temp variable to input
#     IF temp variable.DOWNCASE is not 'add'
#       Set team2 variable to temp variable
#   Set team2 variable to the team id of the team name matching its current value
#   IF Call method to add a game with a date and two team names as parameters
#     Display "Game added to schedule."
#   ELSE
#     Display "Game not added to the schedule.  At least one of the teams is already scheduled to play that day."
#
# Define a method to solicit and add game results
#   Display "For which game would you like to enter the results?"
#   For each game without results, display "[#{id}] #{game_day} #{team1} vs. #{team2}"
#   Display "Please enter a number:"
#   Set game id to input and convert it to an integer
#   WHILE game id is not in the database
#     Display "Please enter the number of a game listed above:"
#     Set game id to input and convert it to an integer
#   Display "How many goals did the #{team1} score?"
#   Set a variable for the first team's goals to input and convert it to an integer
#   WHILE the variable for the first team's goals is not a whole number
#     Display "Score must be a whole number.  Please try again:"
#     Set the variable for the first team's goals to input and convert it to an integer
#   Display "How many goals did the #{team2} score?"
#   Set a variable for the second team's goals to input and convert it to an integer
#   WHILE the variable for the second team's goals is not a whole number
#     Display "Score must be a whole number.  Please try again:"
#     Set the variable for the second team's goals to input and convert it to an integer
#   Call method to add game results with the game id, first team's goals and second team's goals as arguments
#   Display "Results added to game."
#
# Define a method to display standings
# For each team, display "#{team}:  #{wins} wins, #{losses} losses, #{ties} ties" sorted by wins (most to least)
#
# Define a method to display schedule
# For each game without results, display "#{game_day} #{team1} #{goals1}, #{team2} #{goals2}" chronologically sorted
# For each game with results, display "#{game_day} #{team1} vs. #{team2}" chronologically sorted
#
# Define a method to display the program's functions and enable the user to initiate one.  RETURN TRUE unless the user initiates "Quit."
#   Display
#     "What would you like to do?"
#     "[1] Add a team to the league."
#     "[2] Add a game to the schedule."
#     "[3] Enter the results of a game."
#     "[4] Display the team standings."
#     "[5] Display the game schedule."
#     "[6] Quit."
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


# [DRIVER CODE]
#
# Display "Welcome to the 2015-2016 soccer season!"
#
# WHILE Call method to display the program's functions and enable the user to initiate one
