# Description: tick commands
# Called from: #tick
# Datapack by 2mal3

# firestorm
execute if score ndd.low_graphics_mode ndd.config matches 0 if score ndd.firestorm_on ndd.data matches 0 as @e[type=minecraft:slime,tag=ndd.firestorm.s] at @s run particle minecraft:flame ~ ~ ~ 0 0 0 0 3
execute if score ndd.low_graphics_mode ndd.config matches 0 if score ndd.firestorm_on ndd.data matches 1 as @e[type=minecraft:slime,tag=ndd.firestorm.s] at @s run particle minecraft:flame ~ ~ ~ 0 0 0 0 1

# disease effects
execute as @e[tag=ndd.infected,scores={ndd.infected_t=60..},type=!#ndd.disease:not_infectable] at @s run particle dust 0.000 1.000 0.00 1 ~ ~1 ~ 0.2 0.2 0.2 0 1 normal
