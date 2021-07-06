# Description: The main loop of the blizzard every tick
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/blizzard/create, 2mal3:nadi/natural_disasters/blizzard/ticks/second
# Datapack by 2mal3

# Calls this function again in one tick
schedule function 2mal3:nadi/natural_disasters/blizzard/ticks/tick 1t replace

# Show all players who are under the sky the blizzard particles
execute as @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld,gamemode=!spectator] at @s if predicate 2mal3:nadi/check_sky run particle minecraft:dust 1.0 1.0 1.0 1.5 ~ ~ ~ 4 4 4 0 50 normal
