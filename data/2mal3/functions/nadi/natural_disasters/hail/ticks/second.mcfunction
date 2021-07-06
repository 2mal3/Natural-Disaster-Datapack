# Description: The hail loop every second
# Called from functions: 2mal3:nadi/natural_disasters/hail/create, 2mal3:nadi/natural_disasters/hail/ticks/second
# Datapck by 2mal3

execute as @a[gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/hail/summon

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/hail/ticks/second 1s replace