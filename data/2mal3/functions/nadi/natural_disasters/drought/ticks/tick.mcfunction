# Description: The drought loop every tick
# AS: server, AT: server
# Called from function: 2mal3:nadi/natural_disasters/drought/create, 2mal3:nadi/natural_disasters/drought/ticks/tick
# Datapack by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/drought/ticks/tick 1t replace

# Displays light smoke particles to all players in the overworld
execute as @a[gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s run particle minecraft:smoke ~ ~ ~ 5 5 5 0 2 normal
