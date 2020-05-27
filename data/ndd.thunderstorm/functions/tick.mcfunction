# Description: The thunderstorm tick
# Called from: ndd.thunderstorm:create
# Datapack by 2mal3

# summon lightning bolt
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.thunderstorm"]}
execute as @a[gamemode=!spectator] at @s run spreadplayers ~ ~ 10 40 false @e[sort=nearest,limit=1,tag=ndd.thunderstorm]
execute as @e[type=minecraft:area_effect_cloud,tag=ndd.thunderstorm] at @s run summon minecraft:lightning_bolt ~ ~ ~


# no sleep
execute as @a[gamemode=!spectator] at @s if block ~ ~ ~ #minecraft:beds run tp @s ~ ~ ~


# timer
schedule function ndd.thunderstorm:tick 5s

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.thunderstorm:remove
