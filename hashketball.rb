# Write your code here!
def points_of_player(player_name, game)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:stats][:points]
      end
    end
  end
end

p points_of_player("Michael Giordan", game)

# Return the shoe size for any player:
#
def shoe_size_of_player(player_name, game)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:shoe_size]
      end
    end
  end
end

p shoe_size_of_player("King George", game)

# Return both colors for any team:
#
def team_colors(team_name, game)
  game.each do |team, team_hash|
    if team_hash[:name] == team_name
      return (team_hash[:colors].collect do |color|
        color
      end)
    end
  end
end

p team_colors("The Ragin' Cajuns", game)

# Return both teams names:
#
def team_names(game)
  game.collect do |team, team_hash|
    team_hash[:name]
  end
end

p team_names(game)

# Return all the player numbers for a team:
#
def all_team_players(team_name, game)
  game.each do |team, team_hash|
    if team_hash[:name] == team_name
      return (team_hash[:players].collect do |player, player_hash|
        player_hash[:name]
      end)
    end
  end
end

p all_team_players("The Ragin' Cajuns", game)

# Return all the stats for a player:
#
def all_stats_for_player(player_name, game)
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      if player_hash[:name] == player_name
        return player_hash[:stats]
      end
    end
  end
end

p all_stats_for_player("Bill Nye", game)

# Return the rebounds for the player with the largest shoe size
#
def rebounds_for_largest_shoe_size(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:shoe_size] > max_player[:shoe_size]
    end
  end

  max_player[:stats][:rebounds]
end

p rebounds_for_largest_shoe_size(game)

# Bonus Questions: define methods to return the answer to the following questions:
# Which player has the most points?
#
def player_with_most_points(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:stats][:points] > max_player[:stats][:points]
    end
  end

  max_player[:name]
end

p player_with_most_points(game)

# Which team has the most points?
#
def team_with_most_points(game)
  max_team = nil
  game.each do |team, team_hash|
    sum = 0
    team_hash[:players].each do |player, player_hash|
      sum += player_hash[:stats][:points]
    end

    team_hash[:sum] = sum
    max_team ||= team_hash
    max_team = team_hash if team_hash[:sum] > max_team[:sum]
  end

  max_team[:name]
end

p team_with_most_points(game)

# Which player has the longest name?
#
def player_with_longest_name(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:name].length > max_player[:name].length
    end
  end

  max_player[:name]
end

p player_with_longest_name(game)

# Super Bonus:
# Write a method that returns true if the player with the longest name had the most steals:
#
def player_with_most_steals_and_name(game)
  max_player = nil
  game.each do |team, team_hash|
    team_hash[:players].each do |player, player_hash|
      max_player ||= player_hash
      max_player = player_hash if player_hash[:stats][:steals] > max_player[:stats][:steals]
    end
  end

  max_player[:name] == player_with_longest_name(game)
end

p player_with_most_steals_and_name(game)









