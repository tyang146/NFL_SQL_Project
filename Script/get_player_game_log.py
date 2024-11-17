from pro_football_reference_web_scraper import player_game_log as p

# Define player, position, and season variables
player = 'Jordan Love'
position = 'QB'
season = 2024

# Fetch the game log for the player
game_log = p.get_player_game_log(player=player, position=position, season=season)

# Format the filename dynamically using player name, position, and season
filename = f"../CSV/{player.replace(' ', '_')}_{season}_game_log.csv"

# Save the game log DataFrame to a CSV file
game_log.to_csv(filename, index=False)

print(f"Game log for {player} saved to {filename}")
