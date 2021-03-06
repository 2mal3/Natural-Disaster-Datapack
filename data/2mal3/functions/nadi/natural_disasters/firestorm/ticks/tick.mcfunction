# Description: The firestorm loop every tick
# Called from functions: 2mal3:nadi/natural_disasters/firestorm/create, 2mal3:nadi/natural_disasters/firestorm/ticks/tick
# Datapck by 2mal3

# Displays the fire particles at all marker entities
execute as @e[type=minecraft:small_fireball,tag=nadi.fire] at @s run particle minecraft:flame ~ ~ ~ 0.1 0.5 0.1 0 5 force @a[distance=..64]

# Calls this function again in one tick
schedule function 2mal3:nadi/natural_disasters/firestorm/ticks/tick 1t