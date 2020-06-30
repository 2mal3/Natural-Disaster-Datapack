# Description: Break blocks and convert them to falling blocks
# Called from: ndd.hurricane:tick
# Datapack by 2mal3

kill @e[type=minecraft:area_effect_cloud,tag=ndd.hurricane.break]
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.hurricane.break"]}
spreadplayers ~ ~ 0 15 false @e[type=minecraft:area_effect_cloud,tag=ndd.hurricane.break]

execute as @e[type=minecraft:area_effect_cloud,tag=ndd.hurricane.break] at @s positioned ~ ~-1 ~ run function bsc:ndd.convert_block
execute as @e[type=minecraft:area_effect_cloud,tag=ndd.hurricane.break] at @s positioned ~ ~-1 ~ run setblock ~ ~ ~ minecraft:air
