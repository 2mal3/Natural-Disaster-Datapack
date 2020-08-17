# Description: Break blocks and convert them to falling blocks
# Called from: nadi:natural_disasters/hurricane/tick
# Datapack by 2mal3

kill @e[type=minecraft:area_effect_cloud,tag=nadi.hurricane.break]
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["nadi.hurricane.break","global.ignore"]}
spreadplayers ~ ~ 0 15 false @e[type=minecraft:area_effect_cloud,tag=nadi.hurricane.break]

execute as @e[type=minecraft:area_effect_cloud,tag=nadi.hurricane.break] at @s positioned ~ ~-1 ~ run function bsc:nadi.convert_block
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.hurricane.break] at @s positioned ~ ~-1 ~ run setblock ~ ~ ~ minecraft:air
