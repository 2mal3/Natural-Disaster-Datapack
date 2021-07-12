# Description: The arcid firestorm every second
# AS: server, AT: server
# Called from functions: 2mal3:nadi/natural_disasters/firestorm/create, 2mal3:nadi/natural_disasters/firestorm/ticks/second
# Datapack by 2mal3

# Calls this function again in one second
schedule function 2mal3:nadi/natural_disasters/firestorm/ticks/second 1s replace

# Creates the fire at a random position 40 blocks around every player in the air
execute as @a[tag=!global.ignore,gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/firestorm/summon_fire
# Creates over all anchor entitys "fire" that falls to the ground
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon small_fireball ~ 255 ~ {power: [0.0d, -0.07d, 0.0d], Tags: ["global.ignore", "nadi.fire"], Item: {id: "minecraft:stone_button", Count: 1b}}
# Gives each new fireball a slight random sideways movement speed
execute as @e[type=minecraft:small_fireball,tag=nadi.fire,tag=!nadi.init] run function 2mal3:nadi/natural_disasters/firestorm/random_motion
