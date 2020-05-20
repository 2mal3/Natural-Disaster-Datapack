# Description: tick commands
# Called from: #tick
# Datapck by 2mal3

# firestorm
execute if score ndd.firestorm_on ndd.data matches 1 as @e[tag=ndd.firestorm.s] at @s if entity @p[distance=..32] run particle minecraft:flame ~ ~1 ~ 0.1 0.1 0.1 0.01 3
execute if score ndd.firestorm_on ndd.data matches 1 as @e[tag=ndd.firestorm.s] at @s unless block ~ ~-1 ~ minecraft:air run setblock ~ ~ ~ minecraft:fire
execute if score ndd.firestorm_on ndd.data matches 1 as @e[tag=ndd.firestorm.s] at @s unless block ~ ~-1 ~ minecraft:air run tp @s ~ -1000 ~

# disease
execute as @e[tag=ndd.infected,scores={ndd.infected_t=60..},type=!#ndd.disease:not_infectable] at @s run particle dust 0.000 1.000 0.00 1 ~ ~1 ~ 0.2 0.2 0.2 0.01 1 normal

# blizzard paricle effects
execute if score ndd.blizzard_on ndd.data matches 1 as @a[gamemode=!spectator] at @s run particle minecraft:dust 1 1 1 1 ~ ~ ~ 2 2 2 0 10
