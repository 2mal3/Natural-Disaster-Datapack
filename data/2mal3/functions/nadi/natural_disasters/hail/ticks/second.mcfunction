# Description: The hail loop every second
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/hail/create, 2mal3:nadi/natural_disasters/hail/ticks/second
# Datapack by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/hail/ticks/second 1s replace

# Summon hail balls at every player
execute as @a[gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/hail/summon
