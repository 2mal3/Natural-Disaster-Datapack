# Description: catches the entitys
# Called from: ndd.hurricane:tick
# Datapck by 2mal3

effect give @e[distance=5..25,type=minecraft:player] minecraft:levitation 3 255 true
effect give @e[distance=5..25,type=!minecraft:player] minecraft:slow_falling 3 255 true

kill @e[tag=ndd.hurricane_catch,type=minecraft:area_effect_cloud]
summon minecraft:area_effect_cloud ~ ~40 ~ {Tags:["ndd.hurricane_catch"]}

execute as @e[distance=5..25,tag=!ndd.hurricane_catch,tag=!ndd.hurricane] at @s facing entity @e[tag=ndd.hurricane_catch,type=minecraft:area_effect_cloud,sort=nearest,limit=1] feet run tp @s ^0.1 ^ ^0.1
