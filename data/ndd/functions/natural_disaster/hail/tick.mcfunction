# Description: The hail tick
# Called from: ndd:natural_disaster/hail/create
# Datapck by 2mal3

# summon blocks
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.hail"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.hail"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.hail"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.hail"]}
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.hail"]}

execute as @a[gamemode=!spectator] at @s run spreadplayers ~ ~ 10 40 false @e[sort=nearest,limit=5,tag=ndd.hail]
execute as @e[tag=ndd.hail] at @s run summon minecraft:falling_block ~ ~100 ~ {BlockState:{Name:"minecraft:ice"},Time:1}


# no sleep
execute as @a[gamemode=!spectator] at @s if block ~ ~ ~ #minecraft:beds run tp @s ~ ~ ~


# timer
schedule function ndd:natural_disaster/hail/tick 2s

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd:natural_disaster/hail/remove
