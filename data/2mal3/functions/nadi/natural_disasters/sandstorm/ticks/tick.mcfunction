# Description: The main loop of the sandstorm every tick
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/sandstorm/create, 2mal3:nadi/natural_disasters/sandstorm/ticks/second
# Datapack by 2mal3

# Calls this function again in one tick
schedule function 2mal3:nadi/natural_disasters/sandstorm/ticks/tick 1t replace

# Show all players who are under the sky the sandstorm particles
execute as @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld,gamemode=!spectator] at @s if predicate 2mal3:nadi/check_sky run function 2mal3:nadi/natural_disasters/sandstorm/effects/tick
