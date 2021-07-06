# Description: The arcid firestorm every second
# Called from functions: 2mal3:nadi/natural_disasters/firestorm/create, 2mal3:nadi/natural_disasters/firestorm/ticks/second
# Datapck by 2mal3

# Creates the fire at a random position 40 blocks around every player in the air
execute as @a[gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/firestorm/summon_fire
# Gives each new fireball a slight random sideways movement speed
execute as @e[type=minecraft:small_fireball,tag=nadi.fire,tag=!nadi.init] at @s run function 2mal3:nadi/natural_disasters/firestorm/random_motion

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/firestorm/ticks/second 1s