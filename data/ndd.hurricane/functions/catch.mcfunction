# Description: catches the entitys
# Called from: ndd.hurricane:tick
# Datapack by 2mal3

execute positioned ~-30 ~ ~-30 run tag @e[dx=60,dy=50,dz=60] add ndd.catch

effect give @e[type=minecraft:player,tag=ndd.catch] minecraft:slow_falling 3 255 true
execute positioned ~-30 ~25 ~-30 run effect give @e[dx=60,dy=10,dz=60] minecraft:wither 2 0 true


kill @e[tag=ndd.hurricane_catch,type=minecraft:area_effect_cloud]
summon minecraft:area_effect_cloud ~ ~40 ~ {Tags:["ndd.hurricane_catch"]}

execute as @e[tag=ndd.catch,tag=!ndd.hurricane_catch,tag=!ndd.hurricane] at @s facing entity @e[tag=ndd.hurricane_catch,type=minecraft:area_effect_cloud,sort=nearest,limit=1] feet run tp @s ^0.1 ^ ^0.1
execute as @e[tag=ndd.catch,tag=!ndd.hurricane_catch,tag=!ndd.hurricane] at @s facing entity @e[tag=ndd.hurricane_catch,type=minecraft:area_effect_cloud,sort=nearest,limit=1] feet run tp @s ^0.1 ^ ^0.1

tag @e[tag=ndd.catch] remove ndd.catch
