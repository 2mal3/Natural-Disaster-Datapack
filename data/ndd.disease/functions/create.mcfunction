# Description: Creat a disease
# Called from: ndd:choose_disaster
# Datapck by 2mal3

# random infektion
execute as @a[gamemode=!spectator] at @s as @e[type=!minecraft:player,type=!#ndd.disease:not_infectable,tag=!ndd.not_infectable,sort=random,limit=1,distance=..42] run function ndd.disease:infect


# other
execute if score ndd.notifications_on ndd.config matches 1 run tellraw @a {"translate":"A disease begins.","color":"gray"}

scoreboard players set ndd.time ndd.data 0
scoreboard players set ndd.natural_disaster_on ndd.data 1
schedule function ndd.disease:tick 2s
