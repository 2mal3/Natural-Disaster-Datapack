# Description: The arcid rain loop every second
# Called from functions: 2mal3:nadi/natural_disasters/acid_rain/create, 2mal3:nadi/natural_disasters/acid_rain/ticks/second
# Datapck by 2mal3

# Gives all players who are in the overworld under the open sky the acid rain effects
execute as @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld] at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run effect give @s minecraft:poison 2 1 false

# Removes 10 random blocks on the surface in a radius of 40 blocks around each player
execute as @a[gamemode=!spectator,tag=!global.ignore,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/acid_rain/remove_blocks

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/acid_rain/ticks/second 1s