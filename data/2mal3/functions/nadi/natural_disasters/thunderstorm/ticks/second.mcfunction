# Description: The thunderstorm tick every 5 seconds
# AS: server, AT: server
# Called from function: 2mal3:nadi/natural_disasters/thunderstorm/create, 2mal3:nadi/natural_disasters/thunderstorm/ticks/5_seconds
# Datapack by 2mal3

# Calls this function again in 5 seconds
schedule function 2mal3:nadi/natural_disasters/thunderstorm/ticks/second 1s replace

# Creates lightning bolts in a radius of 40 blocks for every player in the overworld
execute as @e[tag=!global.ignore,gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s if predicate 2mal3:nadi/thunderstorm/random run function 2mal3:nadi/natural_disasters/thunderstorm/lightning_bolt
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon minecraft:lightning_bolt ~ ~ ~

