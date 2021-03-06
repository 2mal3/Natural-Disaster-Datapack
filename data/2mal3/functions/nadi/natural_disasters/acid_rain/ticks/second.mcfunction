# Description: The arcid rain loop every second
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/acid_rain/create, 2mal3:nadi/natural_disasters/acid_rain/ticks/second
# Datapack by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/acid_rain/ticks/second 1s replace

# Gives all players who are in the overworld under the open sky poison
execute as @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld] at @s if predicate 2mal3:nadi/check_sky run effect give @s minecraft:poison 2 1 false
# Removes 10 random blocks on the surface in a radius of 40 blocks around each player
execute as @a[gamemode=!spectator,tag=!global.ignore,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/acid_rain/remove_blocks
