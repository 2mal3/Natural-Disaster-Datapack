# Description: The arcid rain loop every tick
# Called from functions: 2mal3:nadi/natural_disasters/acid_rain/create, 2mal3:nadi/natural_disasters/acid_rain/ticks/tick
# Datapck by 2mal3

# Gives all players who are in the overworld under the open sky the acid rain effects
execute as @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld,gamemode=!spectator] at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run execute run particle minecraft:sneeze ~ ~ ~ 5 5 5 0 10 normal

# Calls this function again in one tick
schedule function 2mal3:nadi/natural_disasters/acid_rain/ticks/tick 1t