# Description: The sandstorm tick
# Called from: nadi:natural_disasters/sandstorm/create, nadi:natural_disasters/sandstorm/tick
# Datapack by 2mal3


# sandstorm effects
tag @a[tag=!nadi.sandstorm_effect] remove nadi.sandstorm_effect
execute as @a[gamemode=!spectator,tag=!global.ignore,tag=!global.ignore.gui] at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run function nadi:natural_disasters/sandstorm/effect


# place sand
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run function nadi:natural_disasters/sandstorm/summon

execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run spreadplayers ~ ~ 2 7 false @e[sort=nearest,limit=2,tag=nadi.sandstorm,type=minecraft:area_effect_cloud]
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.sandstorm] at @s run summon minecraft:falling_block ~ 260 ~ {BlockState:{Name:"minecraft:sand"},Time:1}


# timer
schedule function nadi:natural_disasters/sandstorm/tick 1s

scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function nadi:natural_disasters/sandstorm/remove
