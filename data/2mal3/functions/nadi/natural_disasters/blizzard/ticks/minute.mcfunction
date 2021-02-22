# Description: The main loop of the blizzard every minute
# Called from functions: 2mal3:nadi/natural_disasters/blizzard/create, 2mal3:nadi/natural_disasters/blizzard/ticks/minute
# Datapack by 2mal3

# Calls this function again in one minute
schedule function 2mal3:nadi/natural_disasters/blizzard/ticks/minute 60s

# Count down the time and then stop the blizzard
scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/blizzard/remove
