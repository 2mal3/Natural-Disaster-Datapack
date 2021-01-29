# Description: The thunderstorm tick
# Called from: 2mal3:nadi/natural_disasters/thunderstorm/create
# Datapack by 2mal3

# summon lightning bolt
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["nadi.thunderstorm"]}
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s run spreadplayers ~ ~ 10 40 false @e[sort=nearest,limit=1,tag=nadi.thunderstorm]
execute as @e[type=minecraft:area_effect_cloud,tag=nadi.thunderstorm] at @s run summon minecraft:lightning_bolt ~ ~ ~


# no sleep
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s if block ~ ~ ~ #minecraft:beds run tp @s ~ ~ ~


# timer
schedule function 2mal3:nadi/natural_disasters/thunderstorm/tick 5s

scoreboard players remove $nadi.time nadi.data 1
execute if score $nadi.time nadi.data matches 0 run function 2mal3:nadi/natural_disasters/thunderstorm/remove
