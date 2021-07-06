# Description: The main loop of the blizzard every tick
# Called from functions: 2mal3:nadi/natural_disasters/blizzard/create, 2mal3:nadi/natural_disasters/blizzard/ticks/second
# Datapack by 2mal3

# Show all players who are under the sky the blizzard particles
execute as @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld,gamemode=!spectator] at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run particle minecraft:dust 1.0 1.0 1.0 1.5 ~ ~ ~ 4 4 4 0 50 normal

# Calls this function again in one tick
schedule function 2mal3:nadi/natural_disasters/blizzard/ticks/tick 1t
