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
# "[#] #{date} #{team1} vs. #{team2}"
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
# "#{date} #{team1} #{goals1}, #{team2} #{goals2}"
# "#{date} #{team1} vs. #{team2}"
#
#
# Schema Design
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

require 'sqlite3'

db = SQLite3::Database.new("soccer_season_tracker.db")
db.results_as_hash = true

db.execute (<<-SQL
  CREATE TABLE IF NOT EXISTS teams (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  wins INT,
  losses INT,
  ties INT
  )
SQL
)

db.execute (<<-SQL
  CREATE TABLE IF NOT EXISTS games (
  id INTEGER PRIMARY KEY,
  game_day DATE,
  team1_id INT,
  team2_id INT,
  team1_goals INT,
  team2_goals INT
  )
SQL
)
