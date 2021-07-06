# Description: The hurricane loop every second
# Called from functions: 2mal3:nadi/natural_disasters/hurricane/create, 2mal3:nadi/natural_disasters/hurricane/ticks/second
# Datapck by 2mal3

# sound effects
execute as @e[type=minecraft:cow,tag=nadi.hurricane] at @s if entity @p[distance=..60] as @a[distance=..60,tag=!global.ignore,tag=!global.ignore.gui] at @s run tag @s add nadi.sound


# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/hurricane/ticks/second 1s replace