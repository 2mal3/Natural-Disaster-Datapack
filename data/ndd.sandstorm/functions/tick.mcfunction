# Description: The sandstorm tick
# Called from: ndd.sandstorm:create, ndd.sandstorm:tick
# Datapack by 2mal3


# sandstorm effects
execute as @a[gamemode=!spectator] at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run function ndd.sandstorm:effect


# place sand
execute as @a[gamemode=!spectator] at @s run function ndd.sandstorm:summon

execute as @a[gamemode=!spectator] at @s run spreadplayers ~ ~ 2 7 false @e[sort=nearest,limit=2,tag=ndd.sandstorm,type=minecraft:area_effect_cloud]
execute as @e[type=minecraft:area_effect_cloud,tag=ndd.sandstorm] at @s run summon minecraft:falling_block ~ 260 ~ {BlockState:{Name:"minecraft:sand"},Time:1}


# timer
schedule function ndd.sandstorm:tick 1s

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.sandstorm:remove
