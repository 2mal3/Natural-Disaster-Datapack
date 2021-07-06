# Description: The arcid firestorm every second
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/firestorm/create, 2mal3:nadi/natural_disasters/firestorm/ticks/second
# Datapack by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/firestorm/ticks/second 1s replace

# Creates the fire at a random position 40 blocks around every player in the air
execute as @a[tag=!global.ignore,gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/firestorm/summon_fire
# Gives each new fireball a slight random sideways movement speed
execute as @e[type=minecraft:small_fireball,tag=nadi.fire,tag=!nadi.init] run function 2mal3:nadi/natural_disasters/firestorm/random_motion
