# Description: The acid_rain tick
# Called from: ndd.acid_rain:create, ndd.acid_rain:tick
# Datapck by 2mal3

# remove blocks
execute as @a[gamemode=!spectator] at @s run function ndd.acid_rain:summon

execute as @a[gamemode=!spectator] at @s run spreadplayers ~ ~ 10 40 false @e[sort=nearest,limit=10,tag=ndd.acid_rain]
execute as @e[tag=ndd.acid_rain] at @s unless block ~ ~-1 ~ #ndd.acid_rain:acid_rain_immune run setblock ~ ~-1 ~ minecraft:air


# give poison
execute as @a at @s if block ~ ~2 ~ minecraft:air if block ~ ~3 ~ minecraft:air if block ~ ~4 ~ minecraft:air if block ~ ~5 ~ minecraft:air if block ~ ~6 ~ minecraft:air run effect give @s minecraft:poison 2 1 false


# no sleep
execute as @a[gamemode=!spectator] at @s if block ~ ~ ~ #minecraft:beds run tp @s ~ ~ ~


# timer
schedule function ndd.acid_rain:tick 2s

scoreboard players remove ndd.time ndd.data 1
execute if score ndd.time ndd.data matches 0 run function ndd.acid_rain:remove
