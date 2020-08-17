# Description: Creat a meteroid
# Called from: nadi:choose_disaster
# Datapck by 2mal3

# send create message
execute if score $nadi.notifications_on nadi.config matches 1 run tellraw @a[tag=!global.ignore,tag=!global.ignore.gui] {"translate":"A meteoroid begins.","color":"gray"}

# create meteoroid
execute as @r[gamemode=!spectator,tag=!global.ignore] at @s run function nadi:natural_disasters/meteoroid/create.2

# other
scoreboard players set $nadi.natural_disaster_on nadi.data 1

# start meteoroid
schedule function nadi:natural_disasters/meteoroid/tick 2s
