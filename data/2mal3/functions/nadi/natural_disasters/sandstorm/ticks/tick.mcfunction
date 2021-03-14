# Description: The main loop of the sandstorm every tick
# Called from functions: 2mal3:nadi/natural_disasters/sandstorm/create, 2mal3:nadi/natural_disasters/sandstorm/ticks/second
# Datapack by 2mal3

# Show all players who are under the sky the sandstorm particles
execute as @a[tag=!global.ignore,predicate=2mal3:nadi/in_overworld,gamemode=!spectator] at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run function 2mal3:nadi/natural_disasters/sandstorm/effects/tick

# Calls this function again in one tick
schedule function 2mal3:nadi/natural_disasters/sandstorm/ticks/tick 1t