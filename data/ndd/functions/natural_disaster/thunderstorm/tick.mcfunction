# Description: The thunderstorm tick
# Called from: ndd:natural_disaster/thunderstorm/create
# Datapck by 2mal3

# summon lightning bolt
execute as @a[gamemode=!spectator] at @s run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["ndd.thunderstorm"]}
execute as @a[gamemode=!spectator] at @s run spreadplayers ~ ~ 10 40 false @e[sort=nearest,limit=1,tag=ndd.thunderstorm]
execute as @e[tag=ndd.thunderstorm] at @s run summon minecraft:lightning_bolt ~ ~ ~


# no sleep
execute as @a at @s if block ~ ~ ~ #minecraft:beds run tp @s ~ ~ ~


# timer
schedule function ndd:natural_disaster/thunderstorm/tick 5s

scoreboard players add ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 60 run function ndd:natural_disaster/thunderstorm/remove
