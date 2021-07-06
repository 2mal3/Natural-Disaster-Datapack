# Description: The thunderstorm tick every 5 seconds
# AS: server, AT: server
# Called from function: 2mal3:nadi/natural_disasters/thunderstorm/create, 2mal3:nadi/natural_disasters/thunderstorm/ticks/5_seconds
# Datapack by 2mal3

# Creates blize in a radius of 40 blocks for every player in the overworld
execute as @e[gamemode=!spectator,predicate=2mal3:nadi/in_overworld] at @s run function 2mal3:nadi/natural_disasters/thunderstorm/lightning_bolt
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.anchor] at @s run summon minecraft:lightning_bolt ~ ~ ~

# Calls this function again in 5 seconds
schedule function 2mal3:nadi/natural_disasters/thunderstorm/ticks/5_seconds 5s
