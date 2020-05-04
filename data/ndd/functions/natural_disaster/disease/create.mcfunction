# Description: Creat a disease
# Called from: ndd:choose_disaster
# Datapck by 2mal3

# random infektion
execute as @a[gamemode=!spectator] at @s as @e[type=!minecraft:player,type=!#ndd:not_infectable,tag=!ndd.not_infectable,sort=random,limit=1,distance=..42] run function ndd:natural_disaster/disease/infect

scoreboard players set ndd.time ndd.data 0
scoreboard players set ndd.natural_disaster_on ndd.data 1
say disease
schedule function ndd:natural_disaster/disease/tick 2s
