# Description: Creat a disease
# Called from: nadi:choose_disaster
# Datapck by 2mal3

# infects a random entity for each player
execute as @a[gamemode=!spectator,tag=!global.ignore] at @s as @e[type=!minecraft:player,type=!#nadi:disease/not_infectable,tag=!nadi.not_infectable,tag=!global.ignore,tag=!global.ignore.kill,sort=random,limit=1,distance=..42] run function nadi:natural_disasters/disease/infect

# send create message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a {"translate":"A disease begins.","color":"gray"}

# other (i don't now what to say :))
scoreboard players set $nadi.time nadi.data 0
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# start disease
schedule function nadi:natural_disasters/disease/tick 2s
