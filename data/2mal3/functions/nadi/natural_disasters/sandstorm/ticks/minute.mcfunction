# Description: The main loop of the sandstorm every minute
# Called from functions: 2mal3:nadi/natural_disasters/sandstorm/create, 2mal3:nadi/natural_disasters/sandstorm/ticks/minute
# Datapack by 2mal3

# Calls this function again in one minute
schedule function 2mal3:nadi/natural_disasters/sandstorm/ticks/minute 60s

# Count down the time and then stop the sandstorm
scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/sandstorm/remove
