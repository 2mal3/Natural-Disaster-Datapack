# Description: The hail tick
# Called from: nadi:natural_disasters/hail/create, nadi:natural_disasters/hail/tick
# Datapck by 2mal3

# summon blocks
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run function nadi:natural_disasters/hail/summon

execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run spreadplayers ~ ~ 10 40 false @e[sort=nearest,limit=5,tag=nadi.hail,type=minecraft:area_effect_cloud]
execute as @e[tag=nadi.hail,type=minecraft:area_effect_cloud] at @s run summon minecraft:falling_block ~ ~100 ~ {BlockState:{Name:"minecraft:ice"},Time:1}


# no sleep
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s if block ~ ~ ~ #minecraft:beds run tp @s ~ ~ ~


# timer
schedule function nadi:natural_disasters/hail/tick 2s

scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function nadi:natural_disasters/hail/remove
