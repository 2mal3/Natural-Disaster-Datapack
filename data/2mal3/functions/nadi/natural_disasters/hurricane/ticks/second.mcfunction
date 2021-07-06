# Description: The hurricane loop every second
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/hurricane/create, 2mal3:nadi/natural_disasters/hurricane/ticks/second
# Datapck by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/hurricane/ticks/second 1s replace

# Plays wind sounds to all near players
execute as @e[type=minecraft:cow,tag=nadi.hurricane] at @s as @a[distance=..60,tag=!global.ignore] run tag @s add nadi.sound
